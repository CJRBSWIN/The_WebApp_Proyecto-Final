const express = require("express")
const PORT = 4000
const app = express()

module.exports = {

    400: {
        statusCode: 400,
        error: new Error('all fields are mandatory'),
    },
    wrong_data: {
        statusCode: 400,
        error: new Error('username or password incorrects'),
    401: {
        statusCode: 401,
        error: new Error('unauthorized'),
    },
    404: {
        statusCode: 404,
        error: new Error('path not found'),
    },
    500: {
        statusCode: 500,
        error: new Error('something went wrong!'),
    },

}

/*app.use('/devices',(req, res, next) => {
    console.log('Soy el segundo middleware!')

    res.status(200).json({
        success: true,
    })
})
*/
app.listen(PORT,() => console.log('> Listening at ${PORT}!'))
