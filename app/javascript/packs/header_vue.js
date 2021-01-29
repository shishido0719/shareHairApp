import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('turbolinks:load', () => {
  const app1 = new Vue({
    el: '#user_pulldown_menu',
    data: {
      show: false
    },
    methods: {
        mouseOverAction(){
            app1.show = true
        },
        mouseLeaveAction(){
            app1.show = false
        }
    }
  })
  
  const app2 = new Vue({
    el: '#header_mycontent',
    methods: {
        mouseOverAction(){
            app1.show = true
        },
        mouseLeaveAction(){
            app1.show = false
        }
    }
  })
  
})
