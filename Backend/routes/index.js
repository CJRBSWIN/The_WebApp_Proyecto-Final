const router = require ('express').Router()

router.use('/devices',(req, res, next) => {
    console.log('Soy el segundo middleware!')

    res.status(200).json({
        success: true,
    })
})

module.exports = router