Vim�UnDo� ���Q,ôW�V�8�G�w�*/�c!k6���   �     currentTarget: {                             [��    _�                             ����                                                                                                                                                                                                                                                                                                                                       �           v        [��    �   �   �          @// *************************************************************�   �   �          })�   �   �            })�   �   �          -    expect(secondRowDataID).toEqual(expected)�   �   �           �   �   �              const expected = 1�   �   �          5    const secondRowDataID = secondRow.prop('data-id')�   �   �           �   �   �                .at(1)�   �   �                .find('tr')�   �   �                .find('tbody')�   �   �              const secondRow = tree�   �   �          #    const tree = tableScreen(props)�   �   �              }�   �   �                }�   �   �          	        }�   �   �                    'data-id' : 'id'�   �   �                  dataset : {�   �   �                  ...dummyRowData,�   �   �                rowData : {�   �   �                ...defaultProps,�   �   �              const props = {�   �   �          0  it('Adds the data set to the element', () => {�   �   �           �   �   �            })�   �   �          1    expect(dummyRowClickEvent).toHaveBeenCalled()�   �   �              secondRow.simulate('click')�   �   �           �   �   �                .at(1)�   �   �                .find('tr')�   �   �                .find('tbody')�   �   �              const secondRow = tree�   �   �              const tree = tableScreen()�   �   �          +  it('Trigger the row click event', () => {�   �   �           �   �   �            })�   �   �              })�   �   �                row : dummyRows[0]�   �   �          !      event : expect.any(Object),�   �   �          6    expect(dummyCellClickEvent).toHaveBeenCalledWith({�   �   �          +    firstCell.simulate('click', dummyEvent)�   �   �           �   �   �          /    const firstCell = firstRow.find('td').at(0)�   �   �                .at(0)�   �   �                .find('tr')�   �   �                .find('tbody')�   �   �              const firstRow = tree�   �   �              const tree = tableScreen()�   �   �          -  it('Triggers the cell click event', () => {�   �   �           �   �   �            })�      �          $    expect(result).toEqual(expected)�   ~   �           �   }                   .length�   |   ~                .find('tr')�   {   }                .find('tbody')�   z   |              const result = tree�   y   {              const expected = 2�   x   z              const tree = tableScreen()�   w   y          8  it('Renders the component with default props', () => {�   v   x           �   u   w            })�   t   v              mountedScreen = undefined�   s   u            beforeEach(() => {�   r   t           �   q   s            }�   p   r              return mountedScreen�   o   q           �   n   p              }�   m   o          8      mountedScreen = mount(<Table {...updatedState} />)�   l   n           �   k   m                }�   j   l                  ...customState�   i   k                  ...defaultProps,�   h   j                const updatedState = {�   g   i              if (!mountedScreen) {�   f   h          -  const tableScreen = (customState = {}) => {�   e   g            let mountedScreen�   d   f          <describe('>>> Table Component -- Shallow Rendering', () => {�   c   e          // Check DOM Behaviour�   b   d           �   a   c           �   `   b          /* eslint-enable */�   _   a           �   ^   `          @// *************************************************************�   ]   _          })�   \   ^            })�   [   ]          "    expect(tree).toMatchSnapshot()�   Z   \           �   Y   [          ?    const tree = renderer.create(<Table {...props} />).toJSON()�   X   Z              }�   W   Y          -      error      : errorTypeDetailMap.generic�   V   X                renderFlag : 'errors',�   U   W                ...defaultProps,�   T   V              const props = {�   S   U          0  it('Matches the snapshot with errors', () => {�   R   T           �   Q   S            })�   P   R          "    expect(tree).toMatchSnapshot()�   O   Q           �   N   P          ?    const tree = renderer.create(<Table {...props} />).toJSON()�   M   O              }�   L   N                showIndex : true�   K   M                ...defaultProps,�   J   L              const props = {�   I   K          8  it('Matches the snapshot with showIndex true', () => {�   H   J           �   G   I            })�   F   H          "    expect(tree).toMatchSnapshot()�   E   G           �   D   F          ?    const tree = renderer.create(<Table {...props} />).toJSON()�   C   E              }�   B   D                ...defaultProps�   A   C              const props = {�   @   B          <  it('Matches the snapshot with valid data in rows', () => {�   ?   A           �   >   @            })�   =   ?          "    expect(tree).toMatchSnapshot()�   <   >           �   ;   =          ?    const tree = renderer.create(<Table {...props} />).toJSON()�   :   <              }�   9   ;                renderFlag : 'noData'�   8   :                ...defaultProps,�   7   9              const props = {�   6   8          1  it('Matches the snapshot with no rows', () => {�   5   7          8describe('>>> Table Component -- Snapshot Test', () => {�   4   6          (// Snapshot matching for Table Component�   3   5           �   2   4          }�   1   3            renderFlag : 'hasData'�   0   2          %  headers    : dummyTableHeadersData,�   /   1            rowData    : dummyRowData,�   .   0            rows       : dummyRows,�   -   /          const defaultProps = {�   ,   .          1/* eslint-disable react/jsx-filename-extension */�   +   -           �   *   ,          }�   )   +          !  onRowClick : dummyRowClickEvent�   (   *          const dummyRowData = {�   '   )          ]�   &   (            }�   %   '              id   : 1�   $   &              def : 4,�   #   %              abc : 3,�   "   $            {�   !   #            },�       "              id   : 11�      !              def : 2,�                     abc : 1,�                  {�                const dummyRows = [�                ]�                  }�                    classes     : 't-right'�                    id          : 'def',�                    displayName : 'def',�                  {�                  },�                %    onCellClick : dummyCellClickEvent�                    classes     : 't-test',�                    id          : 'abc',�                    displayName : 'abc',�                  {�                const dummyTableHeadersData = [�                }�                  stopPropagation : jest.fn()�                  },�                    dataset : {}�   
               currentTarget: {�   	             const dummyEvent = {�      
          $const dummyRowClickEvent = jest.fn()�      	          %const dummyCellClickEvent = jest.fn()�                 �                (import Table              from './Table'�                ;import errorTypeDetailMap from '$CONFIG/errorTypeDetailMap'�                 �                'import { mount }          from 'enzyme'�                4import renderer           from 'react-test-renderer'�                 &import React              from 'react'5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           v        [﯆     �   �   �          C// // *************************************************************�   �   �          // })�   �   �          //   })�   �   �          0//     expect(secondRowDataID).toEqual(expected)�   �   �          //�   �   �          //     const expected = 1�   �   �          8//     const secondRowDataID = secondRow.prop('data-id')�   �   �          //�   �   �          //       .at(1)�   �   �          //       .find('tr')�   �   �          //       .find('tbody')�   �   �          //     const secondRow = tree�   �   �          &//     const tree = tableScreen(props)�   �   �          //     }�   �   �          
//       }�   �   �          //         }�   �   �          //           'data-id' : 'id'�   �   �          //         dataset : {�   �   �          //         ...dummyRowData,�   �   �          //       rowData : {�   �   �          //       ...defaultProps,�   �   �          //     const props = {�   �   �          3//   it('Adds the data set to the element', () => {�   �   �          //�   �   �          //   })�   �   �          4//     expect(dummyRowClickEvent).toHaveBeenCalled()�   �   �          "//     secondRow.simulate('click')�   �   �          //�   �   �          //       .at(1)�   �   �          //       .find('tr')�   �   �          //       .find('tbody')�   �   �          //     const secondRow = tree�   �   �          !//     const tree = tableScreen()�   �   �          .//   it('Trigger the row click event', () => {�   �   �          //�   �   �          //   })�   �   �          	//     })�   �   �          //       row : dummyRows[0]�   �   �          $//       event : expect.any(Object),�   �   �          9//     expect(dummyCellClickEvent).toHaveBeenCalledWith({�   �   �          .//     firstCell.simulate('click', dummyEvent)�   �   �          //�   �   �          2//     const firstCell = firstRow.find('td').at(0)�   �   �          //       .at(0)�   �   �          //       .find('tr')�   �   �          //       .find('tbody')�   �   �          //     const firstRow = tree�   �   �          !//     const tree = tableScreen()�   �   �          0//   it('Triggers the cell click event', () => {�   �   �          //�   �   �          //   })�      �          '//     expect(result).toEqual(expected)�   ~   �          //�   }             //       .length�   |   ~          //       .find('tr')�   {   }          //       .find('tbody')�   z   |          //     const result = tree�   y   {          //     const expected = 2�   x   z          !//     const tree = tableScreen()�   w   y          ;//   it('Renders the component with default props', () => {�   v   x          //�   u   w          //   })�   t   v           //     mountedScreen = undefined�   s   u          //   beforeEach(() => {�   r   t          //�   q   s          //   }�   p   r          //     return mountedScreen�   o   q          //�   n   p          //     }�   m   o          ;//       mountedScreen = mount(<Table {...updatedState} />)�   l   n          //�   k   m          
//       }�   j   l          //         ...customState�   i   k          //         ...defaultProps,�   h   j          //       const updatedState = {�   g   i          //     if (!mountedScreen) {�   f   h          0//   const tableScreen = (customState = {}) => {�   e   g          //   let mountedScreen�   d   f          ?// describe('>>> Table Component -- Shallow Rendering', () => {�   c   e          // // Check DOM Behaviour�   b   d          //�   a   c          //�   `   b          // #<{(| eslint-enable |)}>#�   _   a          //�   ^   `          C// // *************************************************************�   ]   _          // })�   \   ^          //   })�   [   ]          %//     expect(tree).toMatchSnapshot()�   Z   \          //�   Y   [          B//     const tree = renderer.create(<Table {...props} />).toJSON()�   X   Z          //     }�   W   Y          0//       error      : errorTypeDetailMap.generic�   V   X          //       renderFlag : 'errors',�   U   W          //       ...defaultProps,�   T   V          //     const props = {�   S   U          3//   it('Matches the snapshot with errors', () => {�   R   T          //�   Q   S          //   })�   P   R          %//     expect(tree).toMatchSnapshot()�   O   Q          //�   N   P          B//     const tree = renderer.create(<Table {...props} />).toJSON()�   M   O          //     }�   L   N          //       showIndex : true�   K   M          //       ...defaultProps,�   J   L          //     const props = {�   I   K          ;//   it('Matches the snapshot with showIndex true', () => {�   H   J          //�   G   I          //   })�   F   H          %//     expect(tree).toMatchSnapshot()�   E   G          //�   D   F          B//     const tree = renderer.create(<Table {...props} />).toJSON()�   C   E          //     }�   B   D          //       ...defaultProps�   A   C          //     const props = {�   @   B          ?//   it('Matches the snapshot with valid data in rows', () => {�   ?   A          //�   >   @          //   })�   =   ?          %//     expect(tree).toMatchSnapshot()�   <   >          //�   ;   =          B//     const tree = renderer.create(<Table {...props} />).toJSON()�   :   <          //     }�   9   ;          //       renderFlag : 'noData'�   8   :          //       ...defaultProps,�   7   9          //     const props = {�   6   8          4//   it('Matches the snapshot with no rows', () => {�   5   7          ;// describe('>>> Table Component -- Snapshot Test', () => {�   4   6          +// // Snapshot matching for Table Component�   3   5          //�   2   4          // }�   1   3          //   renderFlag : 'hasData'�   0   2          (//   headers    : dummyTableHeadersData,�   /   1          //   rowData    : dummyRowData,�   .   0          //   rows       : dummyRows,�   -   /          // const defaultProps = {�   ,   .          :// #<{(| eslint-disable react/jsx-filename-extension |)}>#�   +   -          //�   *   ,          // }�   )   +          $//   onRowClick : dummyRowClickEvent�   (   *          // const dummyRowData = {�   '   )          // ]�   &   (          //   }�   %   '          //     id   : 1�   $   &          //     def : 4,�   #   %          //     abc : 3,�   "   $          //   {�   !   #          //   },�       "          //     id   : 11�      !          //     def : 2,�                 //     abc : 1,�                //   {�                // const dummyRows = [�                // ]�                //   }�                //     classes     : 't-right'�                //     id          : 'def',�                //     displayName : 'def',�                //   {�                //   },�                (//     onCellClick : dummyCellClickEvent�                //     classes     : 't-test',�                //     id          : 'abc',�                //     displayName : 'abc',�                //   {�                "// const dummyTableHeadersData = [�                // }�                 //   stopPropagation : jest.fn()�                //   },�                //     dataset : {}�   
             //   currentTarget: {�   	             // const dummyEvent = {�      
          '// const dummyRowClickEvent = jest.fn()�      	          (// const dummyCellClickEvent = jest.fn()�                //�                +// import Table              from './Table'�                >// import errorTypeDetailMap from '$CONFIG/errorTypeDetailMap'�                //�                *// import { mount }          from 'enzyme'�                7// import renderer           from 'react-test-renderer'�                 )// import React              from 'react'5�_�                    >   
    ����                                                                                                                                                                                                                                                                                                                                       �           v        [﯒     �   =   ?          "    expect(tree).toMatchSnapshot()5�_�                    =        ����                                                                                                                                                                                                                                                                                                                                       �           v        [ﯔ     �   =   ?   �          �   =   ?   �    5�_�                    >       ����                                                                                                                                                                                                                                                                                                                                       �           v        [ﯙ     �   =   ?   �          expect(true)5�_�                    B       ����                                                                                                                                                                                                                                                                                                                            B          ^          v       [ﯧ     �   ]   _            })�   \   ^          "    expect(tree).toMatchSnapshot()�   [   ]           �   Z   \          ?    const tree = renderer.create(<Table {...props} />).toJSON()�   Y   [              }�   X   Z          -      error      : errorTypeDetailMap.generic�   W   Y                renderFlag : 'errors',�   V   X                ...defaultProps,�   U   W              const props = {�   T   V          0  it('Matches the snapshot with errors', () => {�   S   U           �   R   T            })�   Q   S          "    expect(tree).toMatchSnapshot()�   P   R           �   O   Q          ?    const tree = renderer.create(<Table {...props} />).toJSON()�   N   P              }�   M   O                showIndex : true�   L   N                ...defaultProps,�   K   M              const props = {�   J   L          8  it('Matches the snapshot with showIndex true', () => {�   I   K           �   H   J            })�   G   I          "    expect(tree).toMatchSnapshot()�   F   H           �   E   G          ?    const tree = renderer.create(<Table {...props} />).toJSON()�   D   F              }�   C   E                ...defaultProps�   B   D              const props = {�   A   C          <  it('Matches the snapshot with valid data in rows', () => {5�_�                    f       ����                                                                                                                                                                                                                                                                                                                            f          �          v       [ﯶ     �   �   �          @// *************************************************************�   �   �          })�   �   �            })�   �   �          -    expect(secondRowDataID).toEqual(expected)�   �   �           �   �   �              const expected = 1�   �   �          5    const secondRowDataID = secondRow.prop('data-id')�   �   �           �   �   �                .at(1)�   �   �                .find('tr')�   �   �                .find('tbody')�   �   �              const secondRow = tree�   �   �          #    const tree = tableScreen(props)�   �   �              }�   �   �                }�   �   �          	        }�   �   �                    'data-id' : 'id'�   �   �                  dataset : {�   �   �                  ...dummyRowData,�   �   �                rowData : {�   �   �                ...defaultProps,�   �   �              const props = {�   �   �          0  it('Adds the data set to the element', () => {�   �   �           �   �   �            })�   �   �          1    expect(dummyRowClickEvent).toHaveBeenCalled()�   �   �              secondRow.simulate('click')�   �   �           �   �   �                .at(1)�   �   �                .find('tr')�   �   �                .find('tbody')�   �   �              const secondRow = tree�   �   �              const tree = tableScreen()�   �   �          +  it('Trigger the row click event', () => {�   �   �           �   �   �            })�   �   �              })�   �   �                row : dummyRows[0]�   �   �          !      event : expect.any(Object),�   �   �          6    expect(dummyCellClickEvent).toHaveBeenCalledWith({�   �   �          +    firstCell.simulate('click', dummyEvent)�   �   �           �   �   �          /    const firstCell = firstRow.find('td').at(0)�   �   �                .at(0)�   �   �                .find('tr')�   �   �                .find('tbody')�   �   �              const firstRow = tree�   �   �              const tree = tableScreen()�   �   �          -  it('Triggers the cell click event', () => {�   �   �           �   �   �            })�   �   �          $    expect(result).toEqual(expected)�      �           �   ~   �                .length�   }                   .find('tr')�   |   ~                .find('tbody')�   {   }              const result = tree�   z   |              const expected = 2�   y   {              const tree = tableScreen()�   x   z          8  it('Renders the component with default props', () => {�   w   y           �   v   x            })�   u   w              mountedScreen = undefined�   t   v            beforeEach(() => {�   s   u           �   r   t            }�   q   s              return mountedScreen�   p   r           �   o   q              }�   n   p          8      mountedScreen = mount(<Table {...updatedState} />)�   m   o           �   l   n                }�   k   m                  ...customState�   j   l                  ...defaultProps,�   i   k                const updatedState = {�   h   j              if (!mountedScreen) {�   g   i          -  const tableScreen = (customState = {}) => {�   f   h            let mountedScreen�   e   g          <describe('>>> Table Component -- Shallow Rendering', () => {5�_�                            ����                                                                                                                                                                                                                                                                                                                            f          �          v       [��    �   
      �        currentTarget: {5��