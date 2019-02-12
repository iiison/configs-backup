Vim�UnDo� ���&��#��J�%\�\��&�i%9k�4e�   ?                 J       J   J   J    Z�խ    _�                     J        ����                                                                                                                                                                                                                                                                                                                                                             Z�G    �   J            5�_�                           ����                                                                                                                                                                                                                                                                                                                                       %          v       Z�G�     �         K   "       5// import renderData      from '../Shared/RenderData'   &// import XXXX            from './XXX'       /**   3 * redner the tempalte according to the render flag   < * @param  {Array}  [items=[]] dashboard products list array   Q * @param  {String} renderFlag renderFlag tells how the template will be rendered   K * @param  {String} errors     Error in the page, mostly API or logic error   * * @return {DOM}               Tab content    */   9// function showData({ items = [], renderFlag, errors }){   6//   const result = renderData({ renderFlag, errors })   //   //   if (result) {   //     return result   //   }   //   a//   return items.map((item) => <ProductListUnit key={item.displayAttributes.title} {...item} />)   // }       /**   7 * Dashboard Items Performance List, will be used twice   > * once to show the top products and least performing products    *   @ * @param   {Object}   object.tabs       tabs list of a category   : * @param   {Function} object.onTabClick tab click handler   > * @param   {String}   object.category   category name of tabs   > * @param   {String}   object.activeTab  tab to be made active   ? * @param   {Array}    object.items      all dashboard products    *   8 * @returns {DOM}                        Items component    */   export default function Input({5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v       Z�G�    �         *    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v       Z�H�     �               +   /* global setTimeout:true */   import React from 'react'       !import styles from './styles.css'       export default function Input({     id,     type,     error,     value,     className,     oneKeyPress,     placeholder,     validateInput,     onValueChange }) {   
  return (   %    <div className='input-container'>   K      <div className={styles.textContainer} data-placeholder={placeholder}>           <input             id={id}             type={type}             value={value}   "          onChange={onValueChange}   ,          onKeyPress={() => oneKeyPress(id)}             onBlur={(event) => {   5            const currentTarget = event.currentTarget                   setTimeout(() => {   F              if ( !currentTarget.contains(document.activeElement) ) {   !                validateInput(id)                 }               })             }}   3          className={`${styles.text} ${className}`}             placeholder=' '   
        />   A        <span className={styles.placeholder}>{placeholder}</span>         </div>   ,      <span className='error'>{error}</span>   
    </div>     )   }    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��}    �         +        �         *    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   }    Z���     �         +                value={value}5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                v   }    Z���     �         ,        �         +    5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                v   }    Z���     �         /          �         .    �         -        const props = 5�_�   	              
   )       ����                                                                                                                                                                                                                                                                                                                                                v   }    Z���     �   (   *   1      3          className={`${styles.text} ${className}`}5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                v   }    Z���     �         1          className : 5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                                                v   }    Z���     �         2          �         1    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   }    Z���    �         2      -    className : `${styles.text} ${className}`5�_�                       /    ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��    �         2      /    className   : `${styles.text} ${className}`5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��     �                          id={id}5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��     �                          type={type}5�_�                    (       ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��     �   '   (                    className={``}5�_�                    (       ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��     �   '   (                    placeholder=' '5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��     �         /          �         .    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��#     �         3          �         2    �         0        �         /    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v   }    Z��T     �         7            �         6    �         5          onKeyPress()5�_�                    (       ����                                                                                                                                                                                                                                                                                                                            (          0   
       v   
    Z���     �   '   )   7   	             onBlur={(event) => {   5            const currentTarget = event.currentTarget                   setTimeout(() => {   F              if ( !currentTarget.contains(document.activeElement) ) {   !                validateInput(id)                 }               })             }}5�_�                           ����                                                                                                                                                                                                                                                                                                                            (          (          v   
    Z���     �      '   /          }5�_�                       
    ����                                                                                                                                                                                                                                                                                                                            &   
          
       v   
    Z���     �      '   8      5            const currentTarget = event.currentTarget                   setTimeout(() => {   F              if ( !currentTarget.contains(document.activeElement) ) {   !                validateInput(id)                 }               })             }5�_�                       
    ����                                                                                                                                                                                                                                                                                                                            &   	          
       v   
    Z���     �      '   8      3          const currentTarget = event.currentTarget                 setTimeout(() => {   D            if ( !currentTarget.contains(document.activeElement) ) {                 validateInput(id)               }             })   	        }5�_�                       
    ����                                                                                                                                                                                                                                                                                                                            &             
       v   
    Z���     �      '   8      1        const currentTarget = event.currentTarget               setTimeout(() => {   B          if ( !currentTarget.contains(document.activeElement) ) {               validateInput(id)             }   
        })         }5�_�                           ����                                                                                                                                                                                                                                                                                                                            &             
       v   
    Z���    �         8          onBlur(event) => {5�_�                    .       ����                                                                                                                                                                                                                                                                                                                            &             
       v   
    Z���     �   -   .          (          value={isFormElement && value}5�_�                    .       ����                                                                                                                                                                                                                                                                                                                            &             
       v   
    Z���     �   -   .          "          onChange={onValueChange}5�_�                    .       ����                                                                                                                                                                                                                                                                                                                            &             
       v   
    Z���     �   -   .          +          onKeyPress={() => onKeyPress(id)}5�_�                     .       ����                                                                                                                                                                                                                                                                                                                            &             
       v   
    Z���     �   -   .                    onBlur={}5�_�      !               -   	    ����                                                                                                                                                                                                                                                                                                                            &             
       v   
    Z���     �   -   /   5          �   -   /   4    5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                            &             
       v   
    Z��1     �         5        const baseProps = {5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                                v       Z��8     �         6          id,   	    type,   0    className   : `${styles.text} ${className}`,       placeholder : ' '     }5�_�   "   $           #          ����                                                                                                                                                                                                                                                                                                                                                v       Z��;     �         6          }5�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                                                v       Z��B    �         7       5�_�   $   &           %   0       ����                                                                                                                                                                                                                                                                                                                                                v       Z��M   	 �   /   1   7      /          {isFormElement && ...additionalProps}5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                v       Z���   
 �         7          onChange,5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                v       Z���     �         7        onValueChange }) {5�_�   '   +           (          ����                                                                                                                                                                                                                                                                                                                                                v       Z���    �         7          onChange : onValueChange,5�_�   (   ,   )       +      !    ����                                                                                                                                                                                                                                                                                                                                                v       Z��5     �         7      !  const baseProps = isFormElement5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                v       Z��8     �         7        const baseProps =    {�         7          ? {5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                v       Z��<     �                    : {}5�_�   -   /           .           ����                                                                                                                                                                                                                                                                                                                                                  v        Z��@    �         5      	      id,         type,   2      className   : `${styles.text} ${className}`,         placeholder : ' '       }5�_�   .   0           /          ����                                                                                                                                                                                                                                                                                                                                                  v        Z��R     �         5        const additionalProps = {5�_�   /   1           0          ����                                                                                                                                                                                                                                                                                                                                      (          v       Z��\     �      )   6      
    value,       onChange,       onKeyPress() {         return onKeyPress(id)       },       onBlur(event) {   /      const currentTarget = event.currentTarget             setTimeout(() => {   @        if ( !currentTarget.contains(document.activeElement) ) {             validateInput(id)   	        }         })       }     }5�_�   0   2           1   (       ����                                                                                                                                                                                                                                                                                                                                      (          v       Z��`    �   (   *   7        �   (   *   6    5�_�   1   4           2           ����                                                                                                                                                                                                                                                                                                                                      (          v       Z��b     �         7   
     id,     type,     error,     value,     className,     onKeyPress,     placeholder,     validateInput,     isFormElement,     onValueChange : onChange }) {5�_�   2   5   3       4          ����                                                                                                                                                                                                                                                                                                                                                v       Z��o     �         1          �      
   0    �      
   /        �      	   .    5�_�   4   6           5   	   	    ����                                                                                                                                                                                                                                                                                                                                      	   	       v       Z��x     �         :   
   	      id,     type,     error,     value,     className,     onKeyPress,     placeholder,     validateInput,     isFormElement,     onValueChange : onChange 5�_�   5   7           6   	   	    ����                                                                                                                                                                                                                                                                                                                                      	   	       v       Z��z     �      
   :              id,5�_�   6   8           7   	       ����                                                                                                                                                                                                                                                                                                                                      	   	       v       Z��{     �      
   :      	      id,5�_�   7   9           8          ����                                                                                                                                                                                                                                                                                                                                      	   	       v       Z��     �         :        }5�_�   8   :           9          ����                                                                                                                                                                                                                                                                                                                                      	   	       v       Z���     �         :      export default function Input(   }) {�         :      export default function Input({5�_�   9   ;           :   2       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z���     �   2   4   :          �   2   4   9    5�_�   :   <           ;   3       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z���     �   2   3                    {...props}5�_�   ;   >           <   1   	    ����                                                                                                                                                                                                                                                                                                                                         	       v       Z���    �   0   2   9    �   1   2   9    5�_�   <   ?   =       >   +       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z���     �   +   -   <            �   +   -   ;    �   *   -   :          : {}5�_�   >   @           ?   3       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z���    �   2   3                    {...props}5�_�   ?   A           @   ,       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z��     �   +   .   ;            ...props5�_�   @   B           A   -        ����                                                                                                                                                                                                                                                                                                                                         	       v       Z��
    �   ,   .   <       5�_�   A   C           B          ����                                                                                                                                                                                                                                                                                                                                         	       v       Z��s     �         =          �         <    5�_�   B   G           C      .    ����                                                                                                                                                                                                                                                                                                                                         	       v       Z��{    �         =      0    className   : `${styles.text} ${className}`,5�_�   C   H   D       G   /       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z�Ս     �   /   1   =    5�_�   G   I           H   1        ����                                                                                                                                                                                                                                                                                                                                         	       v       Z�Փ     �   0   2   >       5�_�   H   J           I   0        ����                                                                                                                                                                                                                                                                                                                                         	       v       Z�Օ     �   .   0   >          }    �   /   1   >       5�_�   I               J   /       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z�լ    �   /   2   >        �   /   1   =    5�_�   C   E       G   D   .       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z��     �   -   /   =            placeholder : ' ',          placeholderPos : undefined5�_�   D   F           E   /        ����                                                                                                                                                                                                                                                                                                                                         	       v       Z��     �   .   0   >             placeholderPos : undefined5�_�   E               F   .       ����                                                                                                                                                                                                                                                                                                                                         	       v       Z��    �   -   /   >            placeholder    : ' ',5�_�   <           >   =   1   
    ����                                                                                                                                                                                                                                                                                                                                         	       v       Z���     �   0   2        5�_�   2           4   3          ����                                                                                                                                                                                                                                                                                                                                      )          v       Z��f     �         .      }) {     const   id,     type,     error,     value,     className,     onKeyPress,     placeholder,     validateInput,     isFormElement,     onValueChange : onChange 5�_�   (   *       +   )           ����                                                                                                                                                                                                                                                                                                                                                v       Z��1     �              5�_�   )               *          ����                                                                                                                                                                                                                                                                                                                                                v       Z��2     �              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v       Z�G�    �         K       5��