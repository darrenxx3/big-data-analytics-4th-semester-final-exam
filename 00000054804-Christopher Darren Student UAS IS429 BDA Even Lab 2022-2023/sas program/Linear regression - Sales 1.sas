/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;
   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 15Jun2023:10:50:06
     Locale           : en_US
     Model Type       : Linear Regression
     Interval variable: Sales
     Interval variable: Inventory
     Class variable   : Product
     Class variable   : Market Size
     Class variable   : Market
     Class variable   : Date
     Class variable   : Product Type
     Response variable: Sales
     ------------------------------------------*/
   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 15Jun2023:10:50:06
     -------------------------------------------------------*/

   /*---------------------------------------------------------
   Defining temporary arrays and variables   
     -------------------------------------------------------*/
   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;

   array _xrow_6382_0_{49} _temporary_;
   array _beta_6382_0_{49} _temporary_ (     251.42910067218
          -171.437192659625
          -101.702470000055
          -131.660460976339
          -107.693905734134
          -30.0245105064875
           -118.47931637629
          -114.094945504238
          -151.400824949476
          -91.1260236594046
          -211.129771692467
          -109.586705567871
          -173.599682045111
                          0
           92.2550012480359
                          0
          -32.1411119433598
          -39.8231412987546
          -42.2255356455464
                          0
          -6.14175169431983
           7.08614741179586
           8.15452030553403
           -1.0341573282091
          -11.6014527682523
           2.44594674710809
          -5.72279732609663
          -1.21810477032278
          -7.61188466091729
           9.96579983493463
           8.48541664204435
           8.98166007754988
          -2.31225925418077
           2.37308626132442
          -11.8121056758292
           8.02837136684817
          -6.15272289702384
          -3.71008024162248
          -24.6250608318453
          -10.9252064547033
          -7.62796002773769
           1.97605847533767
          -14.4132705004807
                          0
                          0
                          0
                          0
                          0
           0.06564063914626);

   length _Product_ $11; drop _Product_;
   _Product_ = left(trim(put(Product,$11.)));
   length _Date_ $16; drop _Date_;
   _Date_ = left(trim(put(Date,$16.)));
   length _Market_ $4; drop _Market_;
   _Market_ = left(trim(put(Market,$4.)));
   length '_Market Size_'n $12; drop '_Market Size_'n;
   '_Market Size_'n = left(trim(put('Market Size'n,$12.)));
   length '_Product Type_'n $8; drop '_Product Type_'n;
   '_Product Type_'n = left(trim(put('Product Type'n,$8.)));
   /*------------------------------------------*/
   /*Missing values in model variables result  */
   /*in missing values for the prediction.     */
   if missing(Inventory) 
      then do;
         _badval_ = 1;
         goto skip_6382_0;
   end;
   /*------------------------------------------*/

   do _i_=1 to 49; _xrow_6382_0_{_i_} = 0; end;

   _xrow_6382_0_[1] = 1;

   _temp_ = 1;
   select (_Product_);
      when ('Amaretto') _xrow_6382_0_[2] = _temp_;
      when ('Caffe Latte') _xrow_6382_0_[3] = _temp_;
      when ('Caffe Mocha') _xrow_6382_0_[4] = _temp_;
      when ('Chamomile') _xrow_6382_0_[5] = _temp_;
      when ('Columbian') _xrow_6382_0_[6] = _temp_;
      when ('Darjeeling') _xrow_6382_0_[7] = _temp_;
      when ('Decaf Espre') _xrow_6382_0_[8] = _temp_;
      when ('Decaf Irish') _xrow_6382_0_[9] = _temp_;
      when ('Earl Grey') _xrow_6382_0_[10] = _temp_;
      when ('Green Tea') _xrow_6382_0_[11] = _temp_;
      when ('Lemon') _xrow_6382_0_[12] = _temp_;
      when ('Mint') _xrow_6382_0_[13] = _temp_;
      when ('Regular Esp') _xrow_6382_0_[14] = _temp_;
      otherwise do; _badval_ = 1; goto skip_6382_0; end;
   end;

   _temp_ = 1;
   select ('_Market Size_'n);
      when ('Major Market') _xrow_6382_0_[15] = _temp_;
      when ('Small Market') _xrow_6382_0_[16] = _temp_;
      otherwise do; _badval_ = 1; goto skip_6382_0; end;
   end;

   _temp_ = 1;
   select (_Market_);
      when ('Cent') _xrow_6382_0_[17] = _temp_;
      when ('East') _xrow_6382_0_[18] = _temp_;
      when ('Sout') _xrow_6382_0_[19] = _temp_;
      when ('West') _xrow_6382_0_[20] = _temp_;
      otherwise do; _badval_ = 1; goto skip_6382_0; end;
   end;

   _temp_ = 1;
   select (_Date_);
      when ('01APR10:00:00:00') _xrow_6382_0_[21] = _temp_;
      when ('01APR11:00:00:00') _xrow_6382_0_[22] = _temp_;
      when ('01AUG10:00:00:00') _xrow_6382_0_[23] = _temp_;
      when ('01AUG11:00:00:00') _xrow_6382_0_[24] = _temp_;
      when ('01DEC10:00:00:00') _xrow_6382_0_[25] = _temp_;
      when ('01DEC11:00:00:00') _xrow_6382_0_[26] = _temp_;
      when ('01FEB10:00:00:00') _xrow_6382_0_[27] = _temp_;
      when ('01FEB11:00:00:00') _xrow_6382_0_[28] = _temp_;
      when ('01JAN10:00:00:00') _xrow_6382_0_[29] = _temp_;
      when ('01JAN11:00:00:00') _xrow_6382_0_[30] = _temp_;
      when ('01JUL10:00:00:00') _xrow_6382_0_[31] = _temp_;
      when ('01JUL11:00:00:00') _xrow_6382_0_[32] = _temp_;
      when ('01JUN10:00:00:00') _xrow_6382_0_[33] = _temp_;
      when ('01JUN11:00:00:00') _xrow_6382_0_[34] = _temp_;
      when ('01MAR10:00:00:00') _xrow_6382_0_[35] = _temp_;
      when ('01MAR11:00:00:00') _xrow_6382_0_[36] = _temp_;
      when ('01MAY10:00:00:00') _xrow_6382_0_[37] = _temp_;
      when ('01MAY11:00:00:00') _xrow_6382_0_[38] = _temp_;
      when ('01NOV10:00:00:00') _xrow_6382_0_[39] = _temp_;
      when ('01NOV11:00:00:00') _xrow_6382_0_[40] = _temp_;
      when ('01OCT10:00:00:00') _xrow_6382_0_[41] = _temp_;
      when ('01OCT11:00:00:00') _xrow_6382_0_[42] = _temp_;
      when ('01SEP10:00:00:00') _xrow_6382_0_[43] = _temp_;
      when ('01SEP11:00:00:00') _xrow_6382_0_[44] = _temp_;
      otherwise do; _badval_ = 1; goto skip_6382_0; end;
   end;

   _temp_ = 1;
   select ('_Product Type_'n);
      when ('Coffee') _xrow_6382_0_[45] = _temp_;
      when ('Espresso') _xrow_6382_0_[46] = _temp_;
      when ('Herbal T') _xrow_6382_0_[47] = _temp_;
      when ('Tea') _xrow_6382_0_[48] = _temp_;
      otherwise do; _badval_ = 1; goto skip_6382_0; end;
   end;

   _xrow_6382_0_[49] = Inventory;

   do _i_=1 to 49;
      _linp_ + _xrow_6382_0_{_i_} * _beta_6382_0_{_i_};
   end;

   skip_6382_0:
   label P_Sales = 'Predicted: Sales';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      P_Sales = _linp_;
   end; else do;
      _linp_ = .;
      P_Sales = .;
   end;
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'P_Sales'n;
      'P_Sales_6382'n='P_Sales'n;
   /*------------------------------------------*/