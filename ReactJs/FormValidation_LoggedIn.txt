import { useReducer, useState } from "react"
import { scryRenderedDOMComponentsWithTag } from "react-dom/test-utils"

//needed by useReducer - 
const initialState = {
    empid:{value:0,hasError:true,error:"",touched:false},
    ename:{value:"",hasError:true,error:"",touched:false},
    sal:{value:0,hasError:true,error:"",touched:false},
    dept:{value:0,hasError:true,error:"",touched:false},
    isFormValid:false
}

//needed by useReducer - 
const reducer = (state, action) => {
    switch(action.type) {
         case 'update':
            /*return {...state, [action.fld]:action.value } */
            const {name,value,hasError, error, touched, isFormValid} = action.data;
            return { ...state, [name]: {value, hasError, error, touched}, isFormValid }

         case 'reset':
            return initialState
    }

}


let FormValidation = () => {

    const[emp, dispatch] = useReducer(reducer , initialState );
    const [msg,setMsg] = useState("......")


    const handleChange=(name,value) => {
        //a. call validation logic
        const {hasError, error} = validateData(name, value)

        //b. check form validity status
        let isFormValid = true;
        for(const key in emp)
        {
            console.log(key+" : "+emp[key].hasError )
            if(emp[key].hasError === true)
            {
                isFormValid = false;
                break;
            }
        }         

        //c. call dispath method
        dispatch({type: 'update', data: {name,value,hasError, error,touched: true,isFormValid} })
    }


    const validateData = (name,value) => {
        let hasError = false;
        let error = "";
        switch(name){
            case 'empid':
                var exp = /^[0-9]{4,6}$/
                if(! exp.test(value))
                {
                    hasError = true;
                    error = "Empid should be 4-6 digits"
                }
                break;
            case 'ename':
                var exp1 = /^[A-Z][a-z]{2,15}$/;
                if(! exp1.test(value))
                {
                    hasError = true;
                    error = "Ename - first letter capital, rest small"
                }
                break;

        }
        return {hasError,error}

    }





    const submitData = (ev) => {
        ev.preventDefault()
        //console.log(JSON.stringify(emp))
        //send data to server to insert into db
        const reqOptions = {
            method:'POST',
            headers: {'content-type':'application/json'},
            body: JSON.stringify({
                empid: emp.empid.value,
                ename: emp.ename.value,
                sal: emp.sal.value,
                dept: emp.dept.value
            })
        }

        fetch("http://localhost:9000/insertEmp",reqOptions)
        .then(res => res.text())
        .then(data => setMsg(data) )


    }


    return (
        <div>
            <h1> Emp Form </h1>
            <form>
                Enter empid :
                <input type="text" name="empid" value={emp.empid.value} 
                 onChange={(e)=>{handleChange("empid",e.target.value)}} />
                <br/>
                <div style={{ display: emp.empid.touched && emp.empid.hasError?"block":"none" }}>
                    {emp.empid.error}
                </div>
                Enter ename :
                <input type="text" name="ename" value={emp.ename.value} 
                 onChange={(e)=>{handleChange("ename",e.target.value)}} />
                <br/>
                <div style={{ display: emp.ename.touched && emp.ename.hasError?"block":"none" }}>
                    {emp.ename.error}
                </div>
                Enter salary :
                <input type="number" name="salary" value={emp.sal.value} 
                 onChange={(e)=>{dispatch({type:'update',fld:'sal',value:e.target.value})}} />
                <br/> 
                Enter dept no:
                <input type="number" name="deptno" value={emp.dept.value} 
                 onChange={(e)=>{dispatch({type:'update',fld:'dept',value:e.target.value})}} />
                <br/>
                <input type="submit" value="Submit"
                onClick={(e)=>{ submitData(e) }} />
                
                <input type="button" value="Clear" 
                  onClick={()=>{dispatch({type:'reset'})}} />
            </form>
            {JSON.stringify(emp)} 
            
        </div>
    )

}

export default FormValidation