Vim�UnDo� ����A�VS{�i����-T�nt�B��$A�庣   s   p      return (parentType === 'JSXFragment') || (parentType === 'JSXElement' || grandParentType === 'JSXElement')   S   p      +       *   +   +    \O��    _�                    X        ����                                                                                                                                                                                                                                                                                                                            X           [   	       v   	    \O�E     �   X   `   ]    �   W   Z   \            }�   X   Y   \    �   W   Y   `      @        const parent = getParentIgnoringBinaryExpressions(node);   F        if (isNoStrings && parent.type === 'JSXExpressionContainer') {   "          reportLiteralNode(node);   	        }         }5�_�                    X        ����                                                                                                                                                                                                                                                                                                                            Y           _          v   	    \O�F    �   W   X           5�_�                    L        ����                                                                                                                                                                                                                                                                                                                                                             \O�     �   K   M   c    �   L   M   c    5�_�                    L       ����                                                                                                                                                                                                                                                                                                                                                             \O�     �   L   N   d    5�_�                    N       ����                                                                                                                                                                                                                                                                                                                                                             \O�$     �   M   O   e      "        if (getValidation(node)) {5�_�      	              N   ,    ����                                                                                                                                                                                                                                                                                                                                                             \O�-    �   M   O   e      B        if (grandParentType === 'JSXElement'getValidation(node)) {5�_�      
           	   L        ����                                                                                                                                                                                                                                                                                                                            L           P   	       v   	    \O�B     �   L   R   a    �   K   N   `            },�   L   M   `    �   K   M   e      U        const grandParentType = getParentIgnoringBinaryExpressions(node).parent.type;       F        if (grandParentType === 'JSXElement' && getValidation(node)) {   "          reportLiteralNode(node);   	        }         },5�_�   	              
   L        ����                                                                                                                                                                                                                                                                                                                            M           Q          v   	    \O�D     �   K   L           5�_�   
                 C       ����                                                                                                                                                                                                                                                                                                                            L           P          v   	    \O�P     �   C   O   e    �   C   D   e    5�_�                    M       ����                                                                                                                                                                                                                                                                                                                            W           [          v   	    \O�Z     �   L   N   p            }5�_�                    e        ����                                                                                                                                                                                                                                                                                                                            e           k   	       v   	    \O�l     �   e   k   j    �   d   g   i            }�   e   f   i    �   d   f   p      @        const parent = getParentIgnoringBinaryExpressions(node);   '        const parentType = parent.type;   3        const grandParentType = parent.parent.type;       i        if (isNoStrings && parentType === 'JSXExpressionContainer' && grandParentType === 'JSXElement') {   "          reportLiteralNode(node);   	        }         }5�_�                    e        ����                                                                                                                                                                                                                                                                                                                            f           j          v   	    \O�m     �   d   e           5�_�                    e   Q    ����                                                                                                                                                                                                                                                                                                                            e           i          v   	    \O�     �   d   f   n      Q        const { parentType, grandParentType } = getParentAndGrandParentType(node)5�_�                    e   +    ����                                                                                                                                                                                                                                                                                                                            e           i          v   	    \O�     �   d   f   n      R        const { parentType, grandParentType } = getParentAndGrandParentType(node);5�_�                    e       ����                                                                                                                                                                                                                                                                                                                            e           i          v   	    \O�     �   d   f   n      Q        const { parentType, grandParentType} = getParentAndGrandParentType(node);5�_�                    W       ����                                                                                                                                                                                                                                                                                                                            e           i          v   	    \O�     �   V   X   n      Q        const { parentType, grandParentType } = getParentAndGrandParentType(node)5�_�                    W   *    ����                                                                                                                                                                                                                                                                                                                            e           i          v   	    \O�     �   V   X   n      P        const {parentType, grandParentType } = getParentAndGrandParentType(node)5�_�                    W   O    ����                                                                                                                                                                                                                                                                                                                            e           i          v   	    \O�    �   V   X   n      O        const {parentType, grandParentType} = getParentAndGrandParentType(node)5�_�                           ����                                                                                                                                                                                                                                                                                                                                      n          v   O    \O��     �      q       �                  /*�               �               n   /**   L * @fileoverview Prevent using string literals in React component definition    * @author Caleb Morris    * @author David Buchan-Swanson    */   'use strict';       +const docsUrl = require('../util/docsUrl');       Q// ------------------------------------------------------------------------------   // Rule Definition   Q// ------------------------------------------------------------------------------       module.exports = {   	  meta: {       docs: {   Q      description: 'Prevent using string literals in React component definition',   #      category: 'Stylistic Issues',         recommended: false,   %      url: docsUrl('jsx-no-literals')       },           schema: [{         type: 'object',         properties: {           noStrings: {             type: 'boolean'   	        }         },   !      additionalProperties: false       }]     },         create: function(context) {   R    const isNoStrings = context.options[0] ? context.options[0].noStrings : false;   /    const sourceCode = context.getSourceCode();       !    const message = isNoStrings ?   *      'Strings not allowed in JSX files' :   ?      'Missing JSX expression container around literal string';       &    function reportLiteralNode(node) {         context.report({           node: node,   G        message: `${message}: “${sourceCode.getText(node).trim()}”`   	      });       }       7    function getParentIgnoringBinaryExpressions(node) {         let current = node;   :      while (current.parent.type === 'BinaryExpression') {   !        current = current.parent;         }         return current.parent;       }       "    function getValidation(node) {   >      const parent = getParentIgnoringBinaryExpressions(node);   5      const standard = !/^[\s]+$/.test(node.value) &&   +          typeof node.value === 'string' &&   .          parent.type.indexOf('JSX') !== -1 &&   )          parent.type !== 'JSXAttribute';         if (isNoStrings) {           return standard;         }   B      return standard && parent.type !== 'JSXExpressionContainer';       }       0    function getParentAndGrandParentType(node) {   >      const parent = getParentIgnoringBinaryExpressions(node);   %      const parentType = parent.type;   1      const grandParentType = parent.parent.type;             return {           parentType,           grandParentType         };       }       Q    // --------------------------------------------------------------------------       // Public   Q    // --------------------------------------------------------------------------           return {             Literal: function(node) {   P        const {parentType, grandParentType} = getParentAndGrandParentType(node);       g        if ((parentType === 'JSXElement' || grandParentType === 'JSXElement') && getValidation(node)) {   "          reportLiteralNode(node);   	        }         },             JSXText: function(node) {   "        if (getValidation(node)) {   "          reportLiteralNode(node);   	        }         },       '      TemplateLiteral: function(node) {   P        const {parentType, grandParentType} = getParentAndGrandParentType(node);       �        if (isNoStrings && parentType === 'JSXExpressionContainer' && (parentType === 'JSXElement' || grandParentType === 'JSXElement')) {   "          reportLiteralNode(node);   	        }         }           };     }   };5�_�                            ����                                                                                                                                                                                                                                                                                                                                       p          v   O    \O��     �                 /*5�_�                    W       ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��     �   V   X          @        const parent = getParentIgnoringBinaryExpressions(node);5�_�                    X       ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��     �   W   Y   p      Q        const { parentType, grandParentType } = getParentAndGrandParentType(node)5�_�                    X   *    ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��     �   W   Y   p      P        const {parentType, grandParentType } = getParentAndGrandParentType(node)5�_�                    X   O    ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��     �   W   Y   p      O        const {parentType, grandParentType} = getParentAndGrandParentType(node)5�_�                    f   Q    ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��     �   e   g   p      Q        const { parentType, grandParentType } = getParentAndGrandParentType(node)5�_�                    f   +    ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��     �   e   g   p      R        const { parentType, grandParentType } = getParentAndGrandParentType(node);5�_�                    f       ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��   	 �   e   g   p      Q        const { parentType, grandParentType} = getParentAndGrandParentType(node);5�_�                    M       ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��   
 �   L   N   p            }5�_�                     N       ����                                                                                                                                                                                                                                                                                                                                       o          v   O    \O��     �   N   Y   p    �   N   O   p    5�_�      !               Q        ����                                                                                                                                                                                                                                                                                                                                       y          v   O    \O�     �   P   R          R        const { parentType, grandParentType } = getParentAndGrandParentType(node);5�_�       "           !   Q        ����                                                                                                                                                                                                                                                                                                                                       y          v   O    \O�3     �   P   R          Q        const {parentType, grandParentType } = getParentAndGrandParentType(node);5�_�   !   #           "   S   !    ����                                                                                                                                                                                                                                                                                                                                       y          v   O    \O�9     �   R   S          +        if (parentType === 'JSXFragment') {5�_�   "   $           #   S       ����                                                                                                                                                                                                                                                                                                                                       x          v   O    \O�9     �   R   S                    return true5�_�   #   %           $   S       ����                                                                                                                                                                                                                                                                                                                                       w          v   O    \O�9     �   R   S          	        }5�_�   $   &           %   S        ����                                                                                                                                                                                                                                                                                                                                       v          v   O    \O�:     �   R   S           5�_�   %   '           &   ]        ����                                                                                                                                                                                                                                                                                                                            ]           b   	       v���    \O�\     �   ]   b   q    �   \   _   p            },�   ]   ^   p    �   \   ^   v      C        // const parent = getParentIgnoringBinaryExpressions(node);   P        const {parentType, grandParentType} = getParentAndGrandParentType(node);       g        if ((parentType === 'JSXElement' || grandParentType === 'JSXElement') && getValidation(node)) {   "          reportLiteralNode(node);   	        }         },5�_�   &   (           '   ^        ����                                                                                                                                                                                                                                                                                                                            ^           a          v���    \O�]     �   ]   ^           5�_�   '   )           (   ]        ����                                                                                                                                                                                                                                                                                                                            ^           `          v���    \O�^    �   \   ]           5�_�   (   *           )   Q   )    ����                                                                                                                                                                                                                                                                                                                            ]           _          v���    \O��    �   P   R   s      O        const {parentType, grandParentTyp} = getParentAndGrandParentType(node);5�_�   )   +           *   Q   E    ����                                                                                                                                                                                                                                                                                                                            Q   E       S   E       v   E    \O��     �   P   T   s      P        const {parentType, grandParentType} = getParentAndGrandParentType(node);       r        return (parentType === 'JSXFragment') || (parentType === 'JSXElement' || grandParentType === 'JSXElement')5�_�   *               +   S   p    ����                                                                                                                                                                                                                                                                                                                            Q   E       S   E       v   E    \O��    �   R   T   s      p      return (parentType === 'JSXFragment') || (parentType === 'JSXElement' || grandParentType === 'JSXElement')5�_�                     ^       ����                                                                                                                                                                                                                                                                                                                            ;          ;           v        \O�G    �   ]   _   `          }5��