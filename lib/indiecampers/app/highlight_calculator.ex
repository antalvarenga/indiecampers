defmodule Indiecampers.App.HighlightCalculator do
  def get_closest_poi(longitude, latitude) do
    {longitude, _} = Float.parse(longitude)
    {latitude, _} = Float.parse(latitude)

    {poi, _distance} =
      Enum.map(Indiecampers.App.Highlight.data(), fn poi ->
        {poi,
         distance(
           longitude,
           poi.longitude,
           latitude,
           poi.latitude
         )}
      end)
      |> Enum.min_by(fn {poi, distance} -> distance end)

    IO.puts("=========================== POI ===============================")
    IO.puts("#{poi.longitude},#{poi.latitude}")
    IO.inspect(poi)
    poi
  end

  def get_route_pois(api_response) do
    resp_lis_por =
      {:ok,
       %{
         "geocoded_waypoints" => [
           %{
             "geocoder_status" => "OK",
             "place_id" => "ChIJO_PkYRozGQ0R0DaQ5L3rAAQ",
             "types" => ["locality", "political"]
           },
           %{
             "geocoder_status" => "OK",
             "place_id" => "ChIJwVPhxKtlJA0RvBSxQFbZSKY",
             "types" => ["locality", "political"]
           }
         ],
         "routes" => [
           %{
             "bounds" => %{
               "northeast" => %{"lat" => 41.1571198, "lng" => -8.477838199999999},
               "southwest" => %{"lat" => 38.7222527, "lng" => -9.1545764}
             },
             "copyrights" => "Map data ©2018 Google, Inst. Geogr. Nacional",
             "legs" => [
               %{
                 "distance" => %{"text" => "314 km", "value" => 313_816},
                 "duration" => %{"text" => "2 hours 55 mins", "value" => 10517},
                 "end_address" => "Porto, Portugal",
                 "end_location" => %{"lat" => 41.1571198, "lng" => -8.628507599999999},
                 "start_address" => "Lisbon, Portugal",
                 "start_location" => %{"lat" => 38.7222527, "lng" => -9.1392443},
                 "steps" => [
                   %{
                     "distance" => %{"text" => "8 m", "value" => 8},
                     "duration" => %{"text" => "1 min", "value" => 3},
                     "end_location" => %{
                       "lat" => 38.7223229,
                       "lng" => -9.139242399999999
                     },
                     "html_instructions" => "Head <b>north</b> on <b>Largo Mitelo</b>",
                     "polyline" => %{"points" => "a}ikFf_xv@E?G?"},
                     "start_location" => %{"lat" => 38.7222527, "lng" => -9.1392443},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.1 km", "value" => 116},
                     "duration" => %{"text" => "1 min", "value" => 29},
                     "end_location" => %{"lat" => 38.7233098, "lng" => -9.1396239},
                     "html_instructions" =>
                       "Continue straight onto <b>Campo Mártires da Pátria</b>",
                     "maneuver" => "straight",
                     "polyline" => %{
                       "points" => "o}ikFf_xv@SDQ@IFGFI?C?E@cARA?EBEBMHOFIB"
                     },
                     "start_location" => %{
                       "lat" => 38.7223229,
                       "lng" => -9.139242399999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.3 km", "value" => 288},
                     "duration" => %{"text" => "1 min", "value" => 48},
                     "end_location" => %{"lat" => 38.7257545, "lng" => -9.1407235},
                     "html_instructions" => "Continue straight onto <b>R. Gomes Freire</b>",
                     "maneuver" => "straight",
                     "polyline" => %{
                       "points" => "ucjkFraxv@OF[HeBh@kA^oAf@kAb@w@\\[JYH"
                     },
                     "start_location" => %{"lat" => 38.7233098, "lng" => -9.1396239},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.6 km", "value" => 645},
                     "duration" => %{"text" => "2 mins", "value" => 130},
                     "end_location" => %{
                       "lat" => 38.7315058,
                       "lng" => -9.140778899999999
                     },
                     "html_instructions" =>
                       "<b>R. Gomes Freire</b> turns slightly <b>right</b> and becomes <b>R. De Dona Estefânia</b>",
                     "polyline" => %{
                       "points" =>
                         "}rjkFnhxv@ECEAy@@m@BA?O@A?m@A_BMc@Ey@EyCW_AIgAKSAYBc@Dc@D]F]F{@LeALC@E?c@Fs@Hc@FA?IAc@?"
                     },
                     "start_location" => %{"lat" => 38.7257545, "lng" => -9.1407235},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.4 km", "value" => 442},
                     "duration" => %{"text" => "2 mins", "value" => 102},
                     "end_location" => %{"lat" => 38.7335126, "lng" => -9.1444337},
                     "html_instructions" =>
                       "At the roundabout, take the <b>3rd</b> exit onto <b>Av. Casal Ribeiro</b>",
                     "maneuver" => "roundabout-right",
                     "polyline" => %{
                       "points" =>
                         "}vkkFzhxv@AEACCCCCCAEACAC?A?A?A?A?A?A@A?A@C?C@CBABABAB?D?BAB?B?B?@?B?B?B@@@DBDDBBBDBB@D@D@IPEHcA|Bk@nAg@pAO^e@`ACBg@fAKPg@`Ag@|@ADMT"
                     },
                     "start_location" => %{
                       "lat" => 38.7315058,
                       "lng" => -9.140778899999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "92 m", "value" => 92},
                     "duration" => %{"text" => "1 min", "value" => 38},
                     "end_location" => %{"lat" => 38.734123, "lng" => -9.1448416},
                     "html_instructions" =>
                       "Turn <b>right</b> onto <b>Praça Duque de Saldanha</b>",
                     "maneuver" => "turn-right",
                     "polyline" => %{
                       "points" =>
                         "mclkFt_yv@EAGCEAEAGAE?G?E?C?A?A@A?A?C?A@A?EBEDEBCDEDCFCDCFAB?DADAB?B?@AD?B?D"
                     },
                     "start_location" => %{"lat" => 38.7335126, "lng" => -9.1444337},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "1.6 km", "value" => 1554},
                     "duration" => %{"text" => "3 mins", "value" => 182},
                     "end_location" => %{"lat" => 38.7478452, "lng" => -9.1481952},
                     "html_instructions" =>
                       "Turn <b>right</b> onto <b>Av. da República</b>/<b>Av. República</b>",
                     "maneuver" => "turn-right",
                     "polyline" => %{
                       "points" =>
                         "gglkFfbyv@[FWDoCf@A?c@H{Dh@gBVaBVsB\\{ARuCf@k@HUHiAFSBC?aBTu@H]De@Fc@FeAReAPm@LMBI@wARq@JA@c@Fo@JuAVs@PkARa@De@FU?i@N_@L}APi@HaBRsF~@q@J"
                     },
                     "start_location" => %{"lat" => 38.734123, "lng" => -9.1448416},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "1.2 km", "value" => 1226},
                     "duration" => %{"text" => "2 mins", "value" => 97},
                     "end_location" => %{
                       "lat" => 38.7579166,
                       "lng" => -9.153539499999999
                     },
                     "html_instructions" => "Continue onto <b>Campo Grande</b>",
                     "polyline" => %{
                       "points" =>
                         "a}nkFfwyv@m@FM@_@Bm@@C@wA@K@MBK@KDOD{@^a@PoAf@cA^uB~@iAl@mDzAgC`AYNmH`DIDE@MFA@OFEBE@KDGBEB]NyDzAC@o@\\s@^KF}ArA_@b@qAzAST"
                     },
                     "start_location" => %{"lat" => 38.7478452, "lng" => -9.1481952},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 179},
                     "duration" => %{"text" => "1 min", "value" => 28},
                     "end_location" => %{"lat" => 38.7592335, "lng" => -9.1547096},
                     "html_instructions" => "Slight <b>right</b> to stay on <b>Campo Grande</b>",
                     "maneuver" => "turn-slight-right",
                     "polyline" => %{"points" => "_|pkFrxzv@eAl@mClCUT[V"},
                     "start_location" => %{
                       "lat" => 38.7579166,
                       "lng" => -9.153539499999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "67 m", "value" => 67},
                     "duration" => %{"text" => "1 min", "value" => 18},
                     "end_location" => %{
                       "lat" => 38.7596149,
                       "lng" => -9.154240099999999
                     },
                     "html_instructions" =>
                       "Turn <b>right</b> onto <b>Av. Mal. Craveiro Lopes</b>",
                     "maneuver" => "turn-right",
                     "polyline" => %{"points" => "edqkF|_{v@K?I?GAECECKIAEQ{@AG"},
                     "start_location" => %{"lat" => 38.7592335, "lng" => -9.1547096},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 218},
                     "duration" => %{"text" => "1 min", "value" => 24},
                     "end_location" => %{"lat" => 38.7605555, "lng" => -9.1520567},
                     "html_instructions" =>
                       "Continue straight to stay on <b>Av. Mal. Craveiro Lopes</b>",
                     "maneuver" => "straight",
                     "polyline" => %{
                       "points" => "qfqkF~|zv@Ic@G[EOG]Om@K]Ma@EIAAOc@Ws@]_AKWACWW"
                     },
                     "start_location" => %{
                       "lat" => 38.7596149,
                       "lng" => -9.154240099999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "5.0 km", "value" => 5006},
                     "duration" => %{"text" => "4 mins", "value" => 248},
                     "end_location" => %{"lat" => 38.7876602, "lng" => -9.1170875},
                     "html_instructions" => "Merge onto <b>E1</b>",
                     "maneuver" => "merge",
                     "polyline" => %{
                       "points" =>
                         "olqkFjozv@Ie@Mg@c@aBYiAOk@o@oCu@mDY{AIg@CUACAKACAEAKAEWaBQ}AYaC[sCGe@O{Ai@}EWmCUsCM{BK{BGeBEuAE}BAgC?{C@iB@eB@}CFcN@qAAuCAk@Ck@Cm@Ck@Ea@?CAE?EAGC_@CQE_@Ko@Ko@Mo@Oo@YaAOg@Qi@Oa@[s@Ym@[o@c@s@W]Yc@m@u@{@aAkAoAg@g@{A}Aq@m@_Aw@o@c@e@[c@Wk@]o@]a@Q_Aa@_A]c@O_@Me@M]IgAUc@Im@K}@MkJwAuCc@GAaAImG_@mMs@_@CWCYC_AEs@EQASAcAG_@Ac@EQAuAGoAAiA@oA@_A@w@A}@E{@Ii@K[Gk@Oe@M_@OECYOk@_@e@]e@e@m@q@e@i@gAsACCeEkFeDaE_BmBo@s@iAmAoAmA"
                     },
                     "start_location" => %{"lat" => 38.7605555, "lng" => -9.1520567},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "291 km", "value" => 291_295},
                     "duration" => %{"text" => "2 hours 28 mins", "value" => 8864},
                     "end_location" => %{"lat" => 41.0738733, "lng" => -8.5803829},
                     "html_instructions" =>
                       "Continue onto <b>A1</b>/<b>E1</b><div style=\"font-size:0.9em\">Partial toll road</div>",
                     "polyline" => %{
                       "points" =>
                         "{uvkFxtsv@uAyAg@e@eAaAy@q@kAaAcAy@oBwAiAy@qAy@a@WMGMIeAm@w@e@iAm@}Aw@kBaAaCoASMq@]]Qo@[o@[wC}AmDiBwH}DcAk@g@Um@[wBiAg@Wg@W}GoDYM?Au@_@}BkAcB}@aDcB{@c@{@e@eCqAqBeAaBy@}@c@{@c@s@]o@WcDwAm@WcA_@w@[{Ai@aA]m@SgA]u@U[K[IaBe@c@Mw@Su@QkBc@iAWe@Kq@Mg@KeASmAUkASo@KiASy@MUEAASCAA]EmQ}CcHmAyPuC_@G_@IsDo@gU{Dwf@qIqNcCUESCe@KgF}@w@M}@QoAW}A]}Aa@cBi@cA]iAe@ECqAk@eAg@cAi@w@a@iAs@{@g@sA{@cAu@e@[uA_AkIsF]WkAw@KIi@]KI[Ss@g@a@We@[SOA?SMQMGEk@a@_@Wi@_@a@WUO?AA??AOIoIyFgBkAg@_@oEwCgD{BoBqAsAw@CAs@_@YOeAi@e@UcBs@YKWKEAmAc@o@U_LiDWIs@UMEOE_Be@kDgAkBi@}Ag@_Bi@{Aq@QIcAi@UOQMg@[iAy@i@c@i@e@u@u@i@k@a@g@g@m@u@eAe@s@_@m@]q@o@mA]w@_@}@EGCGQg@u@yBo@mB]iAk@gB_@iAQi@a@eAi@qAk@mAm@oAo@iAa@o@c@s@o@}@iA{Aw@}@{@}@cA_AyAoAQMOMk@_@iAw@qc@aYuFmDSMQM}ByA}CqBoAw@mBqAsAaA_As@i@c@}@w@oAiAqAoA}AcBw@_Ai@s@i@s@m@_AqBiDmAoCq@cBc@}@w@}Ay@{Ae@w@aAyAo@u@m@q@]]_EcEsBuBi@i@k@i@{@w@oBgBkCuB{AeAc@[GEi@]mBiAMG]Qk@[wBiAoBcAm@[oCyAyEcCwEeCoFqCcCoA}CcBgAo@mAy@w@k@w@k@gA}@e@c@MMMKs@s@}AcBuAeBm@{@uAsBmAmBqAyBqBmDQYOYwCcFgD_GcEiHmEwHeCgEcCmEaDsFqC_FKSMQ}AoC}AmCaBwCcBuCo@eAs@qAMSKSkEsHsA{BaBoCU[AAQ[aBkCwBaDyAyBIKEIA??AGIEI}B}C{B{CuCsDiDgEkAwAkAwAkCgDqA{As@q@i@c@iA{@aAm@w@c@eAe@iAc@_Bk@u@YgBs@uF}BmAi@A?gBw@aAa@aB}@aAm@q@e@a@WWQm@g@}B}BqDeE{DsEcBiBg@i@e@e@iA_AcAw@g@_@{A_A}@i@eEgCuCcB_LaHSMwCgBMKqB}AoAoAcAgAc@g@q@}@iBgCcA}AkCuDo@w@eAoASSKMAAa@a@gAcAiBuA}@m@eAm@w@a@y@_@qBu@uBm@u@Og@KqBWqAG}ACeBCqBG_BE]A]?iAIwAKk@GQCC?GA{AYw@Q}@UMCME]Kg@SMECAIEiBs@GCQKWMEAg@YmAy@u@g@w@m@eAeAEGc@g@iAwAa@m@c@k@a@o@a@o@a@o@o@cAU]AAU]q@eAgA{AaAoA_@c@e@i@c@c@UUAAWWe@_@_@[o@e@i@_@o@a@q@_@s@]{@_@}Ai@a@Mi@Ms@Q_@Gg@IA?k@KcBQKAQAE?_BOaAK}AUq@OQEaAYa@MmAe@GCiAg@mAq@}@m@}@q@[WUQQQYY_@_@]][_@]a@c@m@gAwAq@}@cAoAcAgAaA}@g@c@GGSQKI{AeAiAo@g@[y@g@iCyAkAq@{Ay@?AcB}@KGUMm@[o@]SMqBeAuAu@gB}@yAs@sBaAqBaA{BcAsAo@}BaAmAi@eCeA}Ao@oB{@cBo@mAe@eBs@oAe@iAc@iBq@w@YkBo@oAe@qAc@c@McBm@yAe@sC}@oA_@qA]aBc@_B_@iBc@cB_@g@I}A[u@OSESEu@MwCe@o@KkBY{AS}AS_BQs@Is@Gm@Gu@Gk@Gm@Ew@Gs@Eu@E{AKaBG}AGoBIgGQ_@AeGSA?{G[wDQyCIC?yAIqAEq@Cq@E{DOe@AaAEoAE_CIoHYw@Ey@CA?k@C_@AaMa@_DMC?eAGaCOcAKmAM}ASgAQyBc@aB_@yDgAGAeA_@s@Uk@Uk@WmBw@sDcBaAa@}@a@QIEAWMOGWKkBy@q@Yg@Q_A[s@U_@MyA_@cCm@q@O}A[eCg@gCc@iCe@}@Qw@QSE_@Ia@KqA]{Ac@wAe@eA_@aAa@cAa@_Ae@qB_AuCcBeAu@[Si@]oA_Ag@a@oAeAGGKKWUOM_C}BeBkBkDwDQUsFeGWYgAiAg@i@e@e@u@u@iAeAo@m@eA_AuAmAcA{@uB_BcBoAgBoAyByAcBiAuCiBgC_B{A_AECWOQMe@[MKa@WQMk@_@qB{A_@Y_@Yg@a@i@a@i@g@aDaDcB_B}@w@QOk@c@e@]YS]Sa@UWOSMo@[m@WYMSKa@MYK_@MWI[IWIg@K_@Ii@K_@GSCUAaLs@k@Cu@Ew@Eu@Gw@Iy@I}@Ks@MEAw@KaB]kAWyA_@{@Ss@Sa@Ka@KQEcBc@{@SwA_@y@S{Ac@sAa@s@Uc@Og@UgAe@_Ai@_@SeBkA{@q@i@e@o@o@o@m@e@i@g@o@}@iAg@o@i@o@]c@m@q@i@m@{@y@e@c@{@q@i@a@]Ua@WkAq@s@]q@[k@Ui@Sw@Ui@Q]K_@KSESEq@KOEQCk@G_AKoAIyBKqAI_AEuAI_AGy@E_BMmAKi@E{BUiAOo@Iu@KiAQcAQcAQkAUs@OeASgAY_@IqA[eBg@mBg@mA]}Ac@g@MgA]_AYaAYw@Sq@Ou@Q_@Gk@Ia@Gg@Eo@Ea@CK?M?YAm@Au@@m@?{@F{@Ho@Fu@Jo@Hc@He@Jg@J_@Ho@PWHo@TUJcAd@WLWNk@\\k@^m@^_Ah@k@\\}@d@o@Xm@Z_Bt@cAd@y@\\iAb@}@\\oA`@uA^{@Ny@Pk@Jk@Hi@J_@F{@J_AHqBPkAFUBU@kCJmBDeABaBDcE@iB?gDCw@Ao@CyAIw@Gw@Ko@GSEUCcAQeAQo@Mk@Oo@ScBu@w@_@w@e@gBoAy@s@o@k@}@cAoA{AuAuBgAqBu@_Bm@_Bi@aBa@sA[qAOs@Q{@m@oDm@iD[sAk@yBi@_BOa@GMAEISg@iA}@oB{A}CgA{Bw@gB_@cAYs@e@qAi@_Bu@gC{@{Cs@iC}@yCw@_CQa@Qc@i@gAa@{@q@kAa@s@o@aAoD}EyBwCoByCOUOWkAuBcBkD{@eBs@wA}@_BkAcB_AoA_AiAeFuFOQaCoCSUQW{@_AgB}BuAkBuAmB}BkD?Aq@eAk@}@sAsB{AaCuAuB_BwBmAyASUc@g@c@e@qAsAkBaBo@k@c@[c@]kBsAy@i@gAs@aAo@m@_@_Am@i@_@_As@m@e@mAcAyAoAaA{@uAoAeAeAuB_C_@c@a@c@SWOSeAoAuC_E_BaCgAcBIMOW]i@k@y@y@kAw@gA{@gAo@s@wBwBMMq@k@sAaAk@a@k@a@yD}BmBkAeAq@kBmAeBmAkB{Ae@a@k@i@q@q@u@u@aAcAs@{@m@s@Y_@y@iAo@{@a@o@a@m@a@o@]m@_@o@_@o@]q@[o@_@s@g@iAe@gA[w@g@mAe@qAc@qAa@oAY{@W{@Sq@Oc@Sq@Oe@Og@Qg@a@mAM_@Uo@Oe@Yu@Uk@Wo@]y@]w@Yo@_@u@Ym@o@kAMW[k@Ua@U_@Ua@Wa@Yc@_@k@U[OUSWQWOQOUW[[_@QWUUQUQSu@{@SWu@w@_@c@[_@Y[WYUYUWUWW[SUSUY]SWSYW[_@e@S[UYW]U[QY_AsAa@q@Yc@U_@Q[]m@S]Yi@S]Q_@OYS_@Q_@S]O]Wk@Ym@a@}@Yo@Q_@wAaDSe@IQISIOISIQGQGKISKQISIQAAISKQISIQCGKQCIIQKQISIMIQKSIQKQGMKSKQIQKOEKKQIMACKQACAAAC?AQYKOKQa@s@Yc@GKKQMOEKKOKOMQKOKOGK]g@wAmBwAmB_CyC}FiHqAcBeAyAw@mA{A_C[g@GMWa@IOIOKQIQKQOYIQKQKSIQIMIQIQCGEKEIMWMWCGKSIQIQIOISGMGMIQISIQIQGOIQAAISISGQKWIQISIQ?AISQe@IQKYIQISGQKU?AIQGOGSIQGSIQISGQGQISGQISIQGSGOSe@EMGQISGQGM[y@GQGOISISe@kAISISIUIQISIQGQISIQACKWIQIQKWIQISKSIQISKSISkAgCk@iAgB"
                     },
                     "start_location" => %{"lat" => 38.7876602, "lng" => -9.1170875},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "11.0 km", "value" => 10954},
                     "duration" => %{"text" => "7 mins", "value" => 429},
                     "end_location" => %{"lat" => 41.1498418, "lng" => -8.6408411},
                     "html_instructions" =>
                       "Keep <b>right</b> at the fork to stay on <b>A1</b>, follow signs for <b>IC2</b>/<b>Porto-Arrábida</b>/<b>Gaia Centro</b>/<b>IC1</b>/<b>V.na Castelo</b>",
                     "maneuver" => "fork-right",
                     "polyline" => %{
                       "points" =>
                         "ufuyFjzjs@KUII]Uk@g@IIMQUYk@{@]i@W]QQQQSQWQUMUK]Mc@IYESA_@AU?O@QBKBOBCB_@JYNC@UNKDOJUTQRGDGHOTMRGJEHIPGNIRM^CJA@GPGTOb@M^IRMXQZOTKPQRQRYVYVULKFa@Po@Xq@VaC|@oCbAODQHSH}@Zi@Rq@V}Aj@q@Vm@TkC`AwAh@s@X{Aj@cBl@}Al@u@Xk@TSFSH{@ZcBn@_Bl@{Aj@aBn@wAh@y@Zm@Tc@Nq@Vo@XSJODMFq@Zg@Vu@^o@\\g@Xq@^i@\\m@^i@\\aAp@o@b@k@d@_@V]X_Ax@k@d@a@^yAtAe@b@QR[\\q@r@WXQPKNKLi@n@a@f@c@h@g@p@e@n@c@l@]h@g@t@c@r@s@hAiAlB{@vA}FzJKPk@~@MTYd@a@r@e@v@a@p@a@r@]j@g@|@e@t@]l@a@p@IN{AdCW`@KPUZKNY^KLc@j@_@`@a@b@g@h@g@b@i@d@QLYT_@Xu@f@i@\\m@\\o@Ze@TaAd@_Ab@}@b@k@Xs@\\u@\\q@^k@Z[RKHYXa@ZGDg@^g@d@c@b@g@h@e@j@c@j@_@h@Y`@MRWf@U`@MV_@p@[p@Wl@ELYt@Wt@Sl@ENENENGVSx@Kh@ETOv@O|@Gf@GXM|@M~@Mz@YvBg@tD_@hCYpBUdBIf@g@rDo@vEc@~CIj@_@nCYvBWbBSzAa@|Cg@hDMdA]bCG^WlBKt@a@pC_@lCSzA?@?@CJ?@Il@Gb@EXM`ACNETG\\S~@YlASx@[lA[bAq@tBw@pBMZUd@q@vAe@~@iApBkBvCwD~FU\\GJIHcAnAe@b@A@KHMLi@`@c@X]Tk@Xo@Tk@Pq@Nm@J[Dc@BUB[@e@?}@?_DEi@Ak@AyHQO?SAI?[?IA}AC_AAEAiBCiFKgDKK?]AgDEI?EAyHMaAAIAI?G?M?}DIwHOo@A]?gADe@Dg@Dq@Jm@Jg@Jq@Pm@T]LcAb@u@`@s@f@{@l@IFWPURgAv@sBzAyAbAe@Xa@VaAf@yAn@_A\\cAZm@Nw@Po@LqB\\oCd@u@Js@L_BVm@Hm@JoBXUDUDuDl@{Er@cBXq@Hu@NG@G@y@L"
                     },
                     "start_location" => %{"lat" => 41.0738733, "lng" => -8.5803829},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.6 km", "value" => 571},
                     "duration" => %{"text" => "1 min", "value" => 37},
                     "end_location" => %{"lat" => 41.1509789, "lng" => -8.635104},
                     "html_instructions" => "Take the exit toward <b>C.po Alegre</b>",
                     "maneuver" => "ramp-right",
                     "polyline" => %{
                       "points" =>
                         "oadzFftvs@A?E?w@ECAE?GAEACACAGAECEAKEOIGEIIMOAAEGEGGGEGCGEIEGCIEICICICICIAKCIAIAKAIAKAGAI?G?IAG@o@DgA@i@@Y?[@[Bi@@I@a@BcAH_F@Y@A@[@a@?a@EcB"
                     },
                     "start_location" => %{"lat" => 41.1498418, "lng" => -8.6408411},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 160},
                     "duration" => %{"text" => "1 min", "value" => 16},
                     "end_location" => %{"lat" => 41.1511795, "lng" => -8.6332206},
                     "html_instructions" => "Continue onto <b>Vila Panorâmica</b>",
                     "polyline" => %{"points" => "shdzFjpus@WyGIs@AI?ICU"},
                     "start_location" => %{"lat" => 41.1509789, "lng" => -8.635104},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 182},
                     "duration" => %{"text" => "1 min", "value" => 43},
                     "end_location" => %{"lat" => 41.1526461, "lng" => -8.6324269},
                     "html_instructions" => "Slight <b>left</b> onto <b>Via Panorâmica</b>",
                     "maneuver" => "turn-slight-left",
                     "polyline" => %{"points" => "{idzFrdus@_@o@a@a@MIMIICwCg@OCKEIA"},
                     "start_location" => %{"lat" => 41.1511795, "lng" => -8.6332206},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.4 km", "value" => 386},
                     "duration" => %{"text" => "1 min", "value" => 64},
                     "end_location" => %{
                       "lat" => 41.15547189999999,
                       "lng" => -8.6300162
                     },
                     "html_instructions" => "Continue onto <b>R. de Gonçalo Sampaio</b>",
                     "polyline" => %{
                       "points" => "asdzFt_us@A?QCa@Ws@IuA[ICMBGIs@q@gBeCy@oAgAyAu@s@"
                     },
                     "start_location" => %{"lat" => 41.1526461, "lng" => -8.6324269},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.1 km", "value" => 106},
                     "duration" => %{"text" => "1 min", "value" => 24},
                     "end_location" => %{
                       "lat" => 41.1551519,
                       "lng" => -8.629014399999999
                     },
                     "html_instructions" =>
                       "<b>R. de Gonçalo Sampaio</b> turns slightly <b>right</b> and becomes <b>Praça Bom Sucesso</b>",
                     "polyline" => %{
                       "points" => "udezFrpts@MUAEAEAEAG?G?E@G?C@C@E@O\\a@\\k@PW"
                     },
                     "start_location" => %{
                       "lat" => 41.15547189999999,
                       "lng" => -8.6300162
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.1 km", "value" => 147},
                     "duration" => %{"text" => "1 min", "value" => 40},
                     "end_location" => %{
                       "lat" => 41.15575159999999,
                       "lng" => -8.6275127
                     },
                     "html_instructions" =>
                       "Slight <b>left</b> onto <b>Largo de Ferreira Lapa</b>",
                     "maneuver" => "turn-slight-left",
                     "polyline" => %{
                       "points" => "ubezFhjts@BI?G@EAGAGAGAGAGEOg@cAQa@IYi@{A"
                     },
                     "start_location" => %{
                       "lat" => 41.1551519,
                       "lng" => -8.629014399999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 174},
                     "duration" => %{"text" => "1 min", "value" => 53},
                     "end_location" => %{
                       "lat" => 41.1571198,
                       "lng" => -8.628507599999999
                     },
                     "html_instructions" => "Turn <b>left</b> onto <b>Rua de Júlio Dinis</b>",
                     "maneuver" => "turn-left",
                     "polyline" => %{"points" => "mfezF|`ts@}@p@qDjCa@H"},
                     "start_location" => %{
                       "lat" => 41.15575159999999,
                       "lng" => -8.6275127
                     },
                     "travel_mode" => "DRIVING"
                   }
                 ],
                 "traffic_speed_entry" => [],
                 "via_waypoint" => []
               }
             ],
             "overview_polyline" => %{
               "points" =>
                 "a}ikFf_xv@{y@zGeMrVgzA~Vcr@hXmP`MyD_NwOsqAoGoaAuW}Tgv@mJgk@mLcuAycAwlAgk@wbD{k@waA}b@cvBsnAqO{`@w_Ais@qhAinAwtAi`AyvAkbCubD_pC}{@mSsd@}d@{j@wQ_q@qh@kuA{k@unAwOmjBeJyeAw[oeCakBqn@wL_x@a_@grBgg@wj@nOwgApH}^mW_Nig@_y@{cBe`CqkCst@q{@_Wyl@mm@_`A_`AibBwlAubBav@ciAad@{gBwd@_iAwoAesAeyA{t@ge@{{AqY}c@ax@e_@mjAu_AyrAo~Die@i^me@}Je{@}s@qaCaoB{fAwp@as@yIy{A_zAy`@uj@_]}KivAvJ}w@hj@a~@LsoD}x@acAkF{dBhRi{AsMgp@nXaz@jgA{o@zm@ehAlrBa_@vi@{bAaLoZs[qPkq@ko@cDmn@d@ub@uTma@cg@g[sFwjAfMg`BleAitB`uAenBvqBe~@zMur@{A{~Am\\mz@}j@o}@{PiqAzr@w~@tw@mo@lq@whAbd@y_@|NuP~\\cl@p{@sWhaAmr@r`@uo@eBqkB_Zus@ee@k|@iQit@mt@m[iRea@HgqAw_@as@lUahAcQg{@ke@kxA_o@u{@i^un@qo@cq@gJms@wAov@o\\oy@gIue@yOcPa@efAaMoi@mj@yu@iRycAihAwq@o`Cas@udA_o@su@a`Akm@sfCskBsvAu~@smAwjAso@cxAoiAukA}p@w[}n@mGej@aJqs@iXwy@_Pgi@wd@oe@sm@}OcdAe^{e@ym@yFkq@uP{p@vMyz@qFi|@`Gq_Bsh@c|A`DwoBwIoqClE_`AuFqj@yWur@_Ayj@m]uo@vH{j@lb@spBdYysBfT}lBtKcmBuKi`AjAgy@qTykCpL{uAfb@mbB~tAs}@`e@{sAxJg}ArMspArXa{@ta@ufA`]e_A`xA}qAbg@c}@~_@if@_Kg~BfA}r@vFmv@uFio@_Bcl@_l@qoB{wAwq@y[eu@cv@ohAmf@mt@uN_r@aC}nAzUseAdMaeB|@k_EpOoiDhkB}aAtHksAx[_r@vGq_AeGojBr]mpB|P{l@jGi{@mDsuChg@{p@pa@}v@{Eo|ClDcyA~c@w`AsGa}@u[ab@n@i|@vl@kd@`M}\\lc@iW~Juw@uLwpAiBoq@kRe[}_@ig@wNsmA}F}l@tLgUtW_cAd[wa@BgVePwv@z`@ov@j\\sk@~t@}aAvgAwS|wAa\\fcAcl@~HwiA`CqdApZsHeDSsg@uZaVrAiEgKk@"
             },
             "summary" => "A1",
             "warnings" => [],
             "waypoint_order" => []
           }
         ],
         "status" => "OK"
       }}

    # LISBON BERLIN

    resp_lis_ber =
      {:ok,
       %{
         "geocoded_waypoints" => [
           %{
             "geocoder_status" => "OK",
             "place_id" => "ChIJO_PkYRozGQ0R0DaQ5L3rAAQ",
             "types" => ["locality", "political"]
           },
           %{
             "geocoder_status" => "OK",
             "place_id" => "ChIJAVkDPzdOqEcRcDteW0YgIQQ",
             "types" => ["locality", "political"]
           }
         ],
         "routes" => [
           %{
             "bounds" => %{
               "northeast" => %{"lat" => 52.520013, "lng" => 13.4049456},
               "southwest" => %{"lat" => 38.7222527, "lng" => -9.1521779}
             },
             "copyrights" =>
               "Map data ©2018 GeoBasis-DE/BKG (©2009), Google, Inst. Geogr. Nacional",
             "legs" => [
               %{
                 "distance" => %{"text" => "2,781 km", "value" => 2_780_698},
                 "duration" => %{"text" => "1 day 2 hours", "value" => 93932},
                 "end_address" => "Berlin, Germany",
                 "end_location" => %{"lat" => 52.520013, "lng" => 13.4049456},
                 "start_address" => "Lisbon, Portugal",
                 "start_location" => %{"lat" => 38.7222527, "lng" => -9.1392443},
                 "steps" => [
                   %{
                     "distance" => %{"text" => "8 m", "value" => 8},
                     "duration" => %{"text" => "1 min", "value" => 3},
                     "end_location" => %{
                       "lat" => 38.7223229,
                       "lng" => -9.139242399999999
                     },
                     "html_instructions" => "Head <b>north</b> on <b>Largo Mitelo</b>",
                     "polyline" => %{"points" => "a}ikFf_xv@E?G?"},
                     "start_location" => %{"lat" => 38.7222527, "lng" => -9.1392443},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.1 km", "value" => 116},
                     "duration" => %{"text" => "1 min", "value" => 29},
                     "end_location" => %{"lat" => 38.7233098, "lng" => -9.1396239},
                     "html_instructions" =>
                       "Continue straight onto <b>Campo Mártires da Pátria</b>",
                     "maneuver" => "straight",
                     "polyline" => %{
                       "points" => "o}ikFf_xv@SDQ@IFGFI?C?E@cARA?EBEBMHOFIB"
                     },
                     "start_location" => %{
                       "lat" => 38.7223229,
                       "lng" => -9.139242399999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.3 km", "value" => 288},
                     "duration" => %{"text" => "1 min", "value" => 48},
                     "end_location" => %{"lat" => 38.7257545, "lng" => -9.1407235},
                     "html_instructions" => "Continue straight onto <b>R. Gomes Freire</b>",
                     "maneuver" => "straight",
                     "polyline" => %{
                       "points" => "ucjkFraxv@OF[HeBh@kA^oAf@kAb@w@\\[JYH"
                     },
                     "start_location" => %{"lat" => 38.7233098, "lng" => -9.1396239},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.6 km", "value" => 645},
                     "duration" => %{"text" => "2 mins", "value" => 130},
                     "end_location" => %{
                       "lat" => 38.7315058,
                       "lng" => -9.140778899999999
                     },
                     "html_instructions" =>
                       "<b>R. Gomes Freire</b> turns slightly <b>right</b> and becomes <b>R. De Dona Estefânia</b>",
                     "polyline" => %{
                       "points" =>
                         "}rjkFnhxv@ECEAy@@m@BA?O@A?m@A_BMc@Ey@EyCW_AIgAKSAYBc@Dc@D]F]F{@LeALC@E?c@Fs@Hc@FA?IAc@?"
                     },
                     "start_location" => %{"lat" => 38.7257545, "lng" => -9.1407235},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.4 km", "value" => 442},
                     "duration" => %{"text" => "2 mins", "value" => 102},
                     "end_location" => %{"lat" => 38.7335126, "lng" => -9.1444337},
                     "html_instructions" =>
                       "At the roundabout, take the <b>3rd</b> exit onto <b>Av. Casal Ribeiro</b>",
                     "maneuver" => "roundabout-right",
                     "polyline" => %{
                       "points" =>
                         "}vkkFzhxv@AEACCCCCCAEACAC?A?A?A?A?A?A@A?A@C?C@CBABABAB?D?BAB?B?B?@?B?B?B@@@DBDDBBBDBB@D@D@IPEHcA|Bk@nAg@pAO^e@`ACBg@fAKPg@`Ag@|@ADMT"
                     },
                     "start_location" => %{
                       "lat" => 38.7315058,
                       "lng" => -9.140778899999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "92 m", "value" => 92},
                     "duration" => %{"text" => "1 min", "value" => 38},
                     "end_location" => %{"lat" => 38.734123, "lng" => -9.1448416},
                     "html_instructions" =>
                       "Turn <b>right</b> onto <b>Praça Duque de Saldanha</b>",
                     "maneuver" => "turn-right",
                     "polyline" => %{
                       "points" =>
                         "mclkFt_yv@EAGCEAEAGAE?G?E?C?A?A@A?A?C?A@A?EBEDEBCDEDCFCDCFAB?DADAB?B?@AD?B?D"
                     },
                     "start_location" => %{"lat" => 38.7335126, "lng" => -9.1444337},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "1.6 km", "value" => 1554},
                     "duration" => %{"text" => "3 mins", "value" => 182},
                     "end_location" => %{"lat" => 38.7478452, "lng" => -9.1481952},
                     "html_instructions" =>
                       "Turn <b>right</b> onto <b>Av. da República</b>/<b>Av. República</b>",
                     "maneuver" => "turn-right",
                     "polyline" => %{
                       "points" =>
                         "gglkFfbyv@[FWDoCf@A?c@H{Dh@gBVaBVsB\\{ARuCf@k@HUHiAFSBC?aBTu@H]De@Fc@FeAReAPm@LMBI@wARq@JA@c@Fo@JuAVs@PkARa@De@FU?i@N_@L}APi@HaBRsF~@q@J"
                     },
                     "start_location" => %{"lat" => 38.734123, "lng" => -9.1448416},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "1.2 km", "value" => 1226},
                     "duration" => %{"text" => "2 mins", "value" => 97},
                     "end_location" => %{
                       "lat" => 38.7579166,
                       "lng" => -9.153539499999999
                     },
                     "html_instructions" => "Continue onto <b>Campo Grande</b>",
                     "polyline" => %{
                       "points" =>
                         "a}nkFfwyv@m@FM@_@Bm@@C@wA@K@MBK@KDOD{@^a@PoAf@cA^uB~@iAl@mDzAgC`AYNmH`DIDE@MFA@OFEBE@KDGBEB]NyDzAC@o@\\s@^KF}ArA_@b@qAzAST"
                     },
                     "start_location" => %{"lat" => 38.7478452, "lng" => -9.1481952},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 179},
                     "duration" => %{"text" => "1 min", "value" => 28},
                     "end_location" => %{"lat" => 38.7592335, "lng" => -9.1547096},
                     "html_instructions" => "Slight <b>right</b> to stay on <b>Campo Grande</b>",
                     "maneuver" => "turn-slight-right",
                     "polyline" => %{"points" => "_|pkFrxzv@eAl@mClCUT[V"},
                     "start_location" => %{
                       "lat" => 38.7579166,
                       "lng" => -9.153539499999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "67 m", "value" => 67},
                     "duration" => %{"text" => "1 min", "value" => 18},
                     "end_location" => %{
                       "lat" => 38.7596149,
                       "lng" => -9.154240099999999
                     },
                     "html_instructions" =>
                       "Turn <b>right</b> onto <b>Av. Mal. Craveiro Lopes</b>",
                     "maneuver" => "turn-right",
                     "polyline" => %{"points" => "edqkF|_{v@K?I?GAECECKIAEQ{@AG"},
                     "start_location" => %{"lat" => 38.7592335, "lng" => -9.1547096},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 218},
                     "duration" => %{"text" => "1 min", "value" => 24},
                     "end_location" => %{"lat" => 38.7605555, "lng" => -9.1520567},
                     "html_instructions" =>
                       "Continue straight to stay on <b>Av. Mal. Craveiro Lopes</b>",
                     "maneuver" => "straight",
                     "polyline" => %{
                       "points" => "qfqkF~|zv@Ic@G[EOG]Om@K]Ma@EIAAOc@Ws@]_AKWACWW"
                     },
                     "start_location" => %{
                       "lat" => 38.7596149,
                       "lng" => -9.154240099999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "5.0 km", "value" => 5006},
                     "duration" => %{"text" => "4 mins", "value" => 248},
                     "end_location" => %{"lat" => 38.7876602, "lng" => -9.1170875},
                     "html_instructions" => "Merge onto <b>E1</b>",
                     "maneuver" => "merge",
                     "polyline" => %{
                       "points" =>
                         "olqkFjozv@Ie@Mg@c@aBYiAOk@o@oCu@mDY{AIg@CUACAKACAEAKAEWaBQ}AYaC[sCGe@O{Ai@}EWmCUsCM{BK{BGeBEuAE}BAgC?{C@iB@eB@}CFcN@qAAuCAk@Ck@Cm@Ck@Ea@?CAE?EAGC_@CQE_@Ko@Ko@Mo@Oo@YaAOg@Qi@Oa@[s@Ym@[o@c@s@W]Yc@m@u@{@aAkAoAg@g@{A}Aq@m@_Aw@o@c@e@[c@Wk@]o@]a@Q_Aa@_A]c@O_@Me@M]IgAUc@Im@K}@MkJwAuCc@GAaAImG_@mMs@_@CWCYC_AEs@EQASAcAG_@Ac@EQAuAGoAAiA@oA@_A@w@A}@E{@Ii@K[Gk@Oe@M_@OECYOk@_@e@]e@e@m@q@e@i@gAsACCeEkFeDaE_BmBo@s@iAmAoAmA"
                     },
                     "start_location" => %{"lat" => 38.7605555, "lng" => -9.1520567},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "93.2 km", "value" => 93204},
                     "duration" => %{"text" => "48 mins", "value" => 2896},
                     "end_location" => %{
                       "lat" => 39.4751859,
                       "lng" => -8.629923999999999
                     },
                     "html_instructions" =>
                       "Continue onto <b>A1</b>/<b>E1</b><div style=\"font-size:0.9em\">Partial toll road</div>",
                     "polyline" => %{
                       "points" =>
                         "{uvkFxtsv@uAyAg@e@eAaAy@q@kAaAcAy@oBwAiAy@qAy@a@WMGMIeAm@w@e@iAm@}Aw@kBaAaCoASMq@]]Qo@[o@[wC}AmDiBwH}DcAk@g@Um@[wBiAg@Wg@W}GoDYM?Au@_@}BkAcB}@aDcB{@c@{@e@eCqAqBeAaBy@}@c@{@c@s@]o@WcDwAm@WcA_@w@[{Ai@aA]m@SgA]u@U[K[IaBe@c@Mw@Su@QkBc@iAWe@Kq@Mg@KeASmAUkASo@KiASy@MUEAASCAA]EmQ}CcHmAyPuC_@G_@IsDo@gU{Dwf@qIqNcCUESCe@KgF}@w@M}@QoAW}A]}Aa@cBi@cA]iAe@ECqAk@eAg@cAi@w@a@iAs@{@g@sA{@cAu@e@[uA_AkIsF]WkAw@KIi@]KI[Ss@g@a@We@[SOA?SMQMGEk@a@_@Wi@_@a@WUO?AA??AOIoIyFgBkAg@_@oEwCgD{BoBqAsAw@CAs@_@YOeAi@e@UcBs@YKWKEAmAc@o@U_LiDWIs@UMEOE_Be@kDgAkBi@}Ag@_Bi@{Aq@QIcAi@UOQMg@[iAy@i@c@i@e@u@u@i@k@a@g@g@m@u@eAe@s@_@m@]q@o@mA]w@_@}@EGCGQg@u@yBo@mB]iAk@gB_@iAQi@a@eAi@qAk@mAm@oAo@iAa@o@c@s@o@}@iA{Aw@}@{@}@cA_AyAoAQMOMk@_@iAw@qc@aYuFmDSMQM}ByA}CqBoAw@mBqAsAaA_As@i@c@}@w@oAiAqAoA}AcBw@_Ai@s@i@s@m@_AqBiDmAoCq@cBc@}@w@}Ay@{Ae@w@aAyAo@u@m@q@]]_EcEsBuBi@i@k@i@{@w@oBgBkCuB{AeAc@[GEi@]mBiAMG]Qk@[wBiAoBcAm@[oCyAyEcCwEeCoFqCcCoA}CcBgAo@mAy@w@k@w@k@gA}@e@c@MMMKs@s@}AcBuAeBm@{@uAsBmAmBqAyBqBmDQYOYwCcFgD_GcEiHmEwHeCgEcCmEaDsFqC_FKSMQ}AoC}AmCaBwCcBuCo@eAs@qAMSKSkEsHsA{BaBoCU[AAQ[aBkCwBaDyAyBIKEIA??AGIEI}B}C{B{CuCsDiDgEkAwAkAwAkCgDqA{As@q@i@c@iA{@aAm@w@c@eAe@iAc@_Bk@u@YgBs@uF}BmAi@A?gBw@aAa@aB}@aAm@q@e@a@WWQm@g@}B}BqDeE{DsEcBiBg@i@e@e@iA_AcAw@g@_@{A_A}@i@eEgCuCcB_LaHSMwCgBMKqB}AoAoAcAgAc@g@q@}@iBgCcA}AkCuDo@w@eAoASSKMAAa@a@gAcAiBuA}@m@eAm@w@a@y@_@qBu@uBm@u@Og@KqBWqAG}ACeBCqBG_BE]A]?iAIwAKk@GQCC?GA{AYw@Q}@UMCME]Kg@SMECAIEiBs@GCQKWMEAg@YmAy@u@g@w@m@eAeAEGc@g@iAwAa@m@c@k@a@o@a@o@a@o@o@cAU]AAU]q@eAgA{AaAoA_@c@e@i@c@c@UUAAWWe@_@_@[o@e@i@_@o@a@q@_@s@]{@_@}Ai@a@Mi@Ms@Q_@Gg@IA?k@KcBQKAQAE?_BOaAK}AUq@OQEaAYa@MmAe@GCiAg@mAq@}@m@}@q@[WUQQQYY_@_@]][_@]a@c@m@gAwAq@}@cAoAcAgAaA}@g@c@GGSQKI{AeAiAo@g@[y@g@iCyAkAq@{Ay@?AcB}@KGUMm@[o@]SMqBeAuAu@gB}@yAs@sBaAqBaA{BcAsAo@}BaAmAi@eCeA}Ao@oB{@cBo@mAe@eBs@oAe@iAc@iBq@w@YkBo@oAe@qAc@c@McBm@yAe@sC}@oA_@qA]aBc@_B_@iBc@cB_@g@I}A[u@OSESEu@MwCe@o@KkBY{AS}AS_BQs@Is@Gm@Gu@Gk@Gm@Ew@Gs@Eu@E{AKaBG}AGoBIgGQ_@AeGSA?{G[wDQyCIC?yAIqAEq@Cq@E{DOe@AaAEoAE_CIoHYw@Ey@CA?k@C_@AaMa@_DMC?eAGaCOcAKmAM}ASgAQyBc@aB_@yDgAGAeA_@s@Uk@Uk@WmBw@sDcBaAa@}@a@QIEAWMOGWKkBy@q@Yg@Q_A[s@U_@MyA_@cCm@q@O}A[eCg@gCc@iCe@}@Qw@QSE_@Ia@KqA]{Ac@wAe@eA_@aAa@cAa@_Ae@qB_AuCcBeAu@[Si@]oA_Ag@a@oAeAGGKKWUOM_C}BeBkBkDwDQUsFeGWYgAiAg@i@e@e@u@u@iAeAo@m@eA_AuAmAcA{@uB_BcBoAgBoAyByAcBiAuCiBgC_B{A_AECWOQMe@[MKa@WQMk@_@qB{A_@Y_@Yg@a@i@a@i@g@aDaDcB_B}@w@QOk@c@e@]YS]Sa@UWOSMo@[m@WYMSKa@MYK_@MWI[IWIg@K_@Ii@K_@GSCUAaLs@k@Cu@Ew@Eu@Gw@Iy@I}@Ks@MEAw@KaB]kAWyA_@{@Ss@Sa@Ka@KQEcBc@{@SwA_@y@S{Ac@sAa@s@Uc@Og@UgAe@_Ai@_@SeBkA{@q@i@e@o@o@o@m@e@i@g@o@}@iAg@o@i@o@]c@m@q@i@m@{@y@e@c@{@q@i@a@]Ua@WkAq@s@]q@[k@Ui@Sw@Ui@Q]K_@KSESEq@KOEQCk@G_AKoAIyBKqAI_AEuAI_AGy@E_BMmAKi@E{BUiAOo@Iu@KiAQcAQcAQkAUs@OeASgAY_@IqA[eBg@mBg@mA]}Ac@g@MgA]_AYaAYw@Sq@Ou@Q_@Gk@Ia@Gg@Eo@Ea@CK?M?YAm@Au@@m@?{@F{@Ho@Fu@Jo@Hc@He@Jg@J_@Ho@PWHo@TUJcAd@WLWNk@\\k@^m@^_Ah@k@\\}@d@o@Xm@Z_Bt@cAd@y@\\iAb@}@\\oA`@uA^{@Ny@Pk@Jk@Hi@J_@F{@J_AHqBPkAFUBU@kCJmBDeABaBDcE@iB?gDCw@Ao@CyAIw@Gw@Ko@GSEUCcAQeAQo@Mk@Oo@ScBu@w@_@w@e@gBoAy@s@o@k@}@cAoA{AuAuBgAqBu@_Bm@_Bi@aBa@sA[qAOs@Q{@m@oDm@iD[sAk@yBi@_BOa@GMAEISg@iA}@oB{A}CgA{Bw@gB_@cAYs@e@qAi@_Bu@gC{@{Cs@iC}@yCw@_CQa@Qc@i@gAa@{@q@kAa@s@o@aAoD}EyBwCoByCOUOWkAuBcBkD{@eBs@wA}@_BkAcB_AoA_AiAeFuFOQaCoCSUQW{@_AgB}BuAkBuAmB}BkD?Aq@eAk@}@sAsB{AaCuAuB_BwBmAyASUc@g@c@e@qAsAkBaBo@k@c@[c@]kBsAy@i@gAs@aAo@m@_@_Am@i@_@_As@m@e@mAcAyAoAaA{@uAoAeAeAuB_C_@c@a@c@SWOSeAoAuC_E_BaCgAcBIMOW]i@k@y@y@kAw@gA{@gAo@s@wBwBMMq@k@sAaAk@a@k@a@yD}BmBkAeAq@kBmAeBmAkB{Ae@a@k@i@q@q@u@u@aAcAs@{@m@s@Y_@y@iAo@{@a@o@a@m@a@o@]m@_@o@_@o@]q@[o@_@s@g@iAe@gA[w@g@mAe@qAc@qAa@oAY{@W{@Sq@Oc@Sq@Oe@Og@Qg@a@mAM_@Uo@Oe@Yu@Uk@Wo@]y@]w@Yo@_@u@Ym@o@kAMW[k@Ua@U_@Ua@Wa@Yc@_@k@U[OUSWQWOQOUW[[_@QWUUQUQSu@{@SWu@w@_@c@[_@Y[WYUYUWUWW[SUSUY]SWSYW[_@e@S[UYW]U[QY_AsAa@q@Yc@U_@Q[]m@S]Yi@S]Q_@OYS_@Q_@S]O]Wk@Ym@a@}@Yo@Q_@wAaDSe@IQISIOISIQGQGKISKQISIQAAISKQISIQCGKQCIIQKQISIMIQKSIQKQGMKSKQIQKOEKKQIMACKQACAAAC?AQYKOKQa@s@Yc@GKKQMOEKKOKOMQKOKOGK]g@wAmBwAmB_CyC}FiHqAcBeAyAw@mA{A_C[g@GMWa@IOIOKQIQKQOYIQKQKSIQIMIQIQCGEKEIMWMWCGKSIQIQIOISGMGMIQISIQIQGOIQAAISISGQKWIQISIQ?AISQe@IQKYIQISGQKU?AIQGOGSIQGSIQISGQGQISGQISIQGSGOSe@EMGQISGQGM[y@GQGOISISe@kAISISIUIQISIQGQISIQACKWIQIQKWIQISKSIQISKSISkAgCk@iAgB"
                     },
                     "start_location" => %{"lat" => 38.7876602, "lng" => -9.1170875},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.3 km", "value" => 340},
                     "duration" => %{"text" => "1 min", "value" => 18},
                     "end_location" => %{"lat" => 39.4778817, "lng" => -8.6290731},
                     "html_instructions" =>
                       "Take the <b>A23</b> exit toward <b>Abrantes</b>/<b>C.lo Branco</b>/<b>T.res Novas</b><div style=\"font-size:0.9em\">Toll road</div>",
                     "maneuver" => "ramp-right",
                     "polyline" => %{
                       "points" =>
                         "}~|oF~ots@]EG@OFQHKBi@R[HM@MDO@c@Ba@AQ?YIWGOGa@QSOQOQOOU]k@S]]i@"
                     },
                     "start_location" => %{
                       "lat" => 39.4751859,
                       "lng" => -8.629923999999999
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "214 km", "value" => 214_466},
                     "duration" => %{"text" => "1 hour 52 mins", "value" => 6706},
                     "end_location" => %{"lat" => 40.5706525, "lng" => -7.2123938},
                     "html_instructions" =>
                       "Continue onto <b>A23</b><div style=\"font-size:0.9em\">Partial toll road</div>",
                     "polyline" => %{
                       "points" =>
                         "wo}oFtjts@EKIQc@eAg@mAEOMYSg@}AcE_@aAAEEMSo@EOKe@GWGYOs@Kg@Iy@EW?GI}@AY?YA_ACiFAgAAkB?QAiB?cC?aA@aABcADgAHoBFcA@Y@A@SJyAJkAP_BPkBv@eIBQBUBQXkCXoB`@{BToAd@{B^wAd@eBfAwDz@_Dv@{CfA}D`AoDnAoEJ_@?AJ]nFiRdAsDl@uBl@wBl@uBn@uBl@uB`AgDp@gCV}@T{@T}@d@wBPy@Lw@^}BPkAV_CNkBBM@OBg@B[@[@[@]@[@[@]?[@[?[?M?Y?uB?[A[?[A[A[?YA[C[A[A[C[WgE[yDYqDCUa@aFCQ]}DYaDMaBA_@C[?CAUCU?IAG?G?IAG?G?IAG?G?IAI?Q?O?O?O?O?O?O?O@O?Q?O?S?YFwAHeANkANkAP_A\\kBf@}Bh@aC`@oBFY@A?CDQ^aB|@cEh@aDZ_BPy@f@_Cb@qBz@_Eb@oBR}@TcAf@{BP}@ZsA`@iBf@_C`@iBd@}BVoAHYDWR}@TeA`@oBb@uBh@_Cj@gCNo@XkAXqAXuAViAd@yB`@oBVqATmAZsAVkAb@qB^}A\\}AR}@Py@PcAJy@L_AJcAJmABSDk@Do@FgA@qAAiAGiCIoBGeCC[GkBG}BCqAEcAGsBIeCKkCIiCC_E@sCD}BHeCJcCJcCLaCBs@@]JsBLkCJ{BFaCDuBAwACoAOoCKuAO}AWqBUyAM{@Iq@Is@Iq@SsAQgA]_CKu@YmBk@}DSoAKu@[yB[wBa@{Bs@sDy@{DSw@cA}DgA}DyAuF_AyDc@kBYkAQu@WeAa@yBMkAIw@G}@CiAAaA?_ABeADk@?M@C?IH_Ab@eEd@aEXiCHcAHcAFaADeA@}@@a@AmBC_ACg@KoAEg@Gi@Kw@QkAOs@g@_CQ}@g@qBi@aCa@cBSaAa@_Ba@_BOs@Om@Mk@Kc@Ki@Os@O{@MkAI{@I}@EeAC{@A{@?_A?{@?_A?gA?qAAs@?s@A]Ac@Ce@A]AWEa@AMAOAQAIKaAIg@Ii@Ms@Ia@Mg@I[W{@Ss@Um@_@_AYo@Wg@a@}@]o@MUO[Yi@CGcAmBYk@_HwMq@qAmA}Bs@uAu@yA[q@c@y@c@y@a@w@?Aa@u@a@w@Ym@_@s@Wg@uCwFuAoCGKEKS_@S]c@y@c@w@Q]wA_Ca@o@c@m@e@q@a@k@g@o@e@m@e@g@_AiA_@_@[]q@q@_AcAiAiASS_@_@i@k@m@q@a@a@SUUYCCIKIKGIIKIKIKGKIKGKIKEIIMGKIMGKGMGKIM?AGKGMACEGEMGKGMGMEMEIGOGQGOGOGQGO?AEMEMEMEOEMCMEMACCOEMEOEUI]CIGYGYEWGYGYEWGYEYKm@Ie@s@eE_DaRQeAQcAQaAQcASeASiAOq@CSAACMG[SaAUgAScAS_A[qAYoAWaAYoA]uAU_AUaAU{@Qy@EUESGUEUEUCOCQCOEQCOCQCOKcAGe@?ACYCYC[CY?EEc@?AASAQASAS?SAS?MAWAW?A?Q?CAA?E?O?G?O?O?I?E?O?Q?O?E@G?G?Q?Q@Q?Q@Q@M?CFyAHqAJiBN{BPwBDk@@M@KHmAP{BDi@T_Dh@wHR{CL_CLcBBs@BeA?e@?g@CwAE{@Eo@Ei@M_AIc@G[GU?AGSAII]Sk@GSYw@Qe@Wk@Wm@sAqCk@sAYu@U}@Qw@Ow@Ko@Ky@Ek@AYAMCk@As@?m@@q@Bs@Bo@?EHkAt@uKl@qHj@mH@OBSb@cGt@uJ@QPsBLqAFq@Hu@Ju@Hs@Js@Ju@Ny@d@eCf@eC|AmHb@uBlAgGz@sEP}@BMBO@EZ}AHg@z@gE@An@yC`@uBXuANw@@IBK@KBQLy@LcAHy@Dk@Ba@Dc@Bg@Bc@@a@@Q?O@a@@_@?w@@iAAc@?k@Ae@Aa@Ae@Ai@Ci@Ck@GeAIaBMsBUkDAQASOcCMwB?AGaAQuCIkBOyBWkEMkBCg@AQAQWsEQaDMkCI{AYkGA[?AGkAGaBG{AKyCCqAC_B?w@AqB?S?C?O@gA@gA?I@o@?Q@u@b@qNBa@?E?MDs@^gLF{AJeCBa@@Y@S@Q?SDy@Bu@L}B@W@]Ba@JkBDo@Bi@^sFHcAJsAFo@NoBJy@RwBFo@PiBJ}@T{BLgALoAJeARcB@I?EBMV_CNwAT}B\\yCXuCFs@JgABk@BY@a@@_@@]?]?g@?}@Ai@Cm@A_@C]Eo@Eg@MeAU}AUyAMeAK}@QoAEe@I{@KkAGcAIm@OcBOqAKu@Gc@SyAC_@IcACYCYCcACqAAeA?eABsADkADo@Do@Fm@Fq@Hu@L}@RkALo@TmAPs@Ns@h@wBNe@^yAX}@DS|@eDxCsKJ]?A@E@E@?Ng@jAcEtAkFPo@Jc@Ha@Ny@PaAFc@Ls@Hm@Dm@Bc@B_@Du@Bk@B_@@q@@k@@a@@cA?w@@[Ae@Ag@Cg@Ew@GoAEgAEs@GgAIcAK}@QaBSiBYgCOwAK{@Ia@Ge@Ie@UoAQ}@_@gCMq@QkAKcAOsAMmAMsAIcAKeBC_AA_@Ak@Aw@@kB?eC?sA?oACcAAi@A_@Cq@Cg@Ei@Gu@Iu@Ky@]kCo@qEKw@}AaLMeAS{AW}ASeAKm@Qo@WaAm@oBIUUq@IQe@oAUk@w@uBi@{Am@eBY}@a@yA_@wAQ_AQ{@Ie@G_@OiAGe@WeCEu@AIE_@C_@Q_CWuCGk@E_@Eg@Ks@QaA]iBUaAWgAMe@i@sBa@qAWu@a@qAOc@_AmCq@wB[iAMg@WiAMm@I_@W_BW_BS_BS}AS_BS}AQyASeBQ{AWwBUiBQ_BKw@Gs@Gq@G}@E_AC_ACeAAcAAeA@}@BaABaAF_AF{@LcALcAL{@N_ATcAXmAXgA`@oA`@uAb@yA^oAl@sBZaA`@wA\\iA^oAXiA`@uAZeA^sA^sATy@T}@V{@ZwATcAXsAPeAN{@TwARsAf@gDh@_Dx@wEh@}CPeARmANiAN}@JaAJ{@H{@F}@HaAFiABcABs@Bo@B_A@wADwE?}A@_B@wB@cD@{CAqE?}E?eB?qA@mA?qA?mCA}ACaBA_AAeAEuAIyDEwAAi@Ag@Ay@Cs@Am@E_CEaBA_BA_AB}A?g@B_@@Y@]Ba@Ba@B_@Hy@H_AR_BZyBd@uCd@_DX{BV{BX_DN}BN}BT_DR}CTaDH_AH{@Fa@NwANcAL{@F_@N}@F]F]H_@N{@Py@x@wD|AiHd@uBPw@d@{Bf@{Bd@wBb@qBZ_BXqAP_AT_BVoBfDiZZ}BVeB\\aBJq@Lq@n@{D`BwJ\\mBPeBHwADeB?eBG{ACe@OqAKo@OaAKc@K_@a@sAWq@Yk@e@y@s@iAa@m@_@g@IIU]k@s@gDgEgB}B_BoBy@cA}AsB]c@c@m@wAwBe@s@a@q@s@kAqA_C_AeB}@gBaEgIIQKSmCsFISKScAuB{@gBcAoBiAuBw@aBgCsF{B_Fy@eBkA_CuBiEu@eB[q@Ws@Ww@Ww@Uw@Ia@Me@Oq@O{@M}@M}@K{@G{@I_AEaAI}AI{BC_AEaAA}@A{@IyCIwCU{GAW?Yc@}LKgCE{ACaAGkCKsESyHMkDUcGEgBCcA?aA?_C?gA?[?]@i@BaAD_ABU@UHy@Fw@Fc@B_@F_@Fa@H_@Nu@RcAXiAT{@ZaAFQFO`@iAZs@Vo@\\w@Zo@b@_Al@qAfCcF|@eBdAsBXm@Te@h@gAnAcCnAcC\\q@^q@HSTa@`@s@n@kA\\s@p@qADIb@aAt@gBVg@v@yAnD{G|EgJx@gBh@mAZy@Xu@Xy@T{@R{@Lm@Lq@Lq@Hk@LeAH}@B}@B]?a@?o@?e@?c@Cm@KyAOyBK_A[qCSoBKiAOyAU}BKiAu@gHIs@s@uH[gDGo@Gm@c@yDIeAGy@E{@Cc@Ac@Ai@?a@?]B_A@m@Bg@Do@HaAHw@`@gDVwBVgBn@gEh@iDXyBNmAHq@Dm@Be@?ADc@Bi@@_@?a@?q@?k@A_@KmDEkAAo@GiCOuDKgCEuBGeCSsEKwDKaDGwAEy@MwCC{@A_@EiBI_CEiA?a@?c@Am@?c@B_BBg@D}@JcDNeFJ}C@c@Bg@?S?C@Y@e@?c@@}@Aa@A_@?a@E_ACc@I}@E_@E[Ga@G_@G]Km@I[I]Qo@M_@Yy@K[M[Q]MWKWQ[OWOYOWq@gAy@gAQSk@o@g@k@g@k@y@}@i@m@u@}@g@k@u@_A"
                     },
                     "start_location" => %{"lat" => 39.4778817, "lng" => -8.6290731},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "34.5 km", "value" => 34474},
                     "duration" => %{"text" => "18 mins", "value" => 1092},
                     "end_location" => %{"lat" => 40.6109981, "lng" => -6.829752},
                     "html_instructions" =>
                       "Merge onto <b>A25</b><div style=\"font-size:0.9em\">Partial toll road</div>",
                     "maneuver" => "merge",
                     "polyline" => %{
                       "points" =>
                         "q}rvFlt_k@Wc@S]}BeEe@_AGMEKQ_@O_@O[Y}@a@uAWeAG[G]G]Ms@Kq@QcBM_BGmAKaCKwBSiE?CIqAKsBMuCEcAQ_DCc@o@oNc@mJIkAEk@Ea@KcAM}@Ic@G]G[O{@Me@EUe@_BUy@{@}Bo@_B_A_Cc@mAQi@Yy@Mc@WgAKg@I_@Q}@M}@OkAEc@Ec@Gi@a@kFc@_GYiDc@aGS}BU{BYsBO{@Ia@]yAS}@I]u@iCmBsGu@eCGSEQk@kB]sA[}AMm@Ie@Mw@Ic@Ea@CWMiAGs@I}@Ce@GaAYaGm@kLoAqVa@eIaBu\\[_GOgBKeAOyAOcAOy@Ia@WgAOm@Mc@_@oAUk@]}@Wk@m@kA_@u@mDkGkBeD_EiHGKEKOYmGcLoC{Eo@iAaA_Bs@iAgCyDiA_Bq@cAwCsEsA}Bm@eAs@mAyAkCIOIMACKUIOYi@[s@Qc@e@oAUq@[cAK[Ka@}@eEMq@q@}CUaAQ{@YiAQk@Qi@Um@Sg@Wi@OYMWq@iAc@m@c@i@SSQSUUe@e@gD_Di@e@}@y@}@{@}@{@g@k@g@i@c@i@e@o@QWOUSY]q@_@u@MWMYM]KY[{@YcAGWGYS{@Q}@M{@MiAEa@C_@IkAGwACi@A{ACeCEoJAkFEwSCiHAeEC_BAcAC}@GeBCe@Cq@Ei@Ew@WkCYiCE[SaBmD_X{@aHIo@KiAEe@A[Ec@Aa@A[Ae@Aa@Am@?q@@e@?c@B_ABm@Ds@Ba@F{@L_BfAiLdAgLj@_GTmCRwBJyADkAFmB@yAA_AAaAC}@Co@Es@GaAM_B[{BGe@O{@ScAe@uBo@sCe@wBuBkJqHq\\[{Ae@uBWyAW}AOaAQcBK{@KcBIgAE_AC_ACaBAiA?sA@sAD_BHyBNuDHmBVqGd@_MBk@Bm@p@qQJsCViG@[@[VwFXcHZmHHeC@[@[LsCNgELaDJaCf@sMJ{BJkCFyAJcCHcCBaC@kAAcACy@CeAGcAM_BOwAYeCGe@EWEUc@kDg@}Dc@eDS}ACS]sCS}AK}@I}@Ec@Ce@C_@C]Ac@Ew@Ao@?q@?cA?eABaABcAF_ADcADaADaAD_AB]LeCBe@@S@QFqAD}@HcBF}AB_@?EB[DmABY?IN_D?IJuBDcAD{A?gA@{@?OCqBCgAEw@IwA_@yFEg@?AEg@?EEk@[wESaCQ}BOaCMcBQ_CM_BE_@E_@M}@Mu@Ki@Om@U}@Og@K]Us@Ys@O[y@qB[s@i@oA_@w@Ys@k@qAi@oA]w@w@gB]y@]s@g@iAi@kAk@qAi@qAy@oBi@qAg@uAK[Y{@U}@K]I[Ia@Qw@Ic@YeBKs@O}AI_AGaAEgAC{@A_A?aA?}@BaA@a@D_ADgAF{@@IL{ANaBFa@Dc@?Gt@iHJ_AHaAJ_AN_BbAcKd@}Ef@iFXeDH_AFaADc@F}@L_BHaAN_CHeAJcBJeBHaAJ}AR}CJeBJ}AJcB@IJgBHmAZqEJcBN}BJgBJ_BHaAL_BNcBHcAJaAJ_APaBR_BReBN_AFg@ZsBRuAHg@T}A^aCZyB\\_Cf@_Db@{CjB{Lr@yDTyATcBVcCNcBH}AHgCB_B?oA?qBGiGEoCUcTCeDCmD?mCAG@uB?cIBwU?_C@_O?m@?W?c@AgAAg@A[A[A[C_@Gy@Gq@Ea@Gm@Kw@Ic@Mu@G_@Mi@Ke@Qk@WaAWs@Mc@M]g@sAo@_B{@{BWs@]cAOe@Me@IYKe@Ka@Mi@Ie@EWIe@EYIm@CYCYE_@E_@GeACq@Cg@?_@EcB?eA?qC?wC?iG?_A?gA?iA?{@?eAA_AEaAAYCm@Iy@E_@C[Ii@Kw@Oy@I_@Om@Ok@Qm@Qm@Og@i@cBe@yAWy@W}@Y_Am@kB]gAi@gBgAkDW}@Ss@Ka@I_@I]Ki@GYEWE[E[Gk@Is@KuAEi@OgBEu@kAgOKyAIcA_@oE]yEKiA[{DMyBG_BCgC@yCDgBDcAR_GZmITeHBcB?cB?}@EgBOaCY_CU{A[{Aa@{A}@_DESk@mBm@}BWoAUcAWiBQsBI_AG_BCiA?wBFcC?c@TqDLuATkCZmDRiDD{A@wBG{CCo@QaCIy@Gi@WcBQaAYuAs@mCq@yBoAuDaAkD_@}Ae@_CUgBUsBKyAKsBy@mPaCag@EcAGcA[eHm@aMe@mJWuFc@_J_@yH_@oHe@kIg@aIWkDO{BSmCUgEe@cJKsBYiGEs@YsFKcBKyBWiFIcBOiDEeA?o@A}@?cA?ODwAH_ARqBNoAPgAd@oDFg@ZqC^oC^qCHg@Lm@Nu@ZiATo@Re@Vk@b@}@pB}CzCsEx@oANSLQlAcBt@_ATYh@q@FG`@e@\\[ROf@a@LKRKRKNGXKv@St@S|A]l@M@?PEXGzCi@"
                     },
                     "start_location" => %{"lat" => 40.5706525, "lng" => -7.2123938},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.4 km", "value" => 362},
                     "duration" => %{"text" => "1 min", "value" => 35},
                     "end_location" => %{"lat" => 40.608145, "lng" => -6.8281543},
                     "html_instructions" =>
                       "At the roundabout, take the <b>2nd</b> exit onto <b>Avenida das Tílias</b>/<b>A25</b>",
                     "maneuver" => "roundabout-right",
                     "polyline" => %{
                       "points" =>
                         "wyzvF||th@@B@BBB@@@BB@@BB@B@B?@?B@D?B?BAB?DABCBCBC@CBC@E@E@CpA}@HIFMVSJIXS^YTOd@[h@YZOTI`@Op@Sx@O"
                     },
                     "start_location" => %{"lat" => 40.6109981, "lng" => -6.829752},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "53 m", "value" => 53},
                     "duration" => %{"text" => "1 min", "value" => 5},
                     "end_location" => %{"lat" => 40.6077894, "lng" => -6.8282643},
                     "html_instructions" => "Continue straight",
                     "maneuver" => "straight",
                     "polyline" => %{
                       "points" =>
                         "{gzvF|rth@r@O?@?@A@?@?@?@?@?@@@?@?@?@@??@?@@??@@@?@@?@@@??@@?@?@?"
                     },
                     "start_location" => %{"lat" => 40.608145, "lng" => -6.8281543},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "21 m", "value" => 21},
                     "duration" => %{"text" => "1 min", "value" => 2},
                     "end_location" => %{
                       "lat" => 40.60767269999999,
                       "lng" => -6.8281059
                     },
                     "html_instructions" => "Turn <b>left</b> at <b>N332</b>",
                     "maneuver" => "turn-left",
                     "polyline" => %{
                       "points" => "uezvFrsth@@?@?@?@?@??A@?@A@A@A?A@??A@A?A?A?A@A?A?A?A?A"
                     },
                     "start_location" => %{"lat" => 40.6077894, "lng" => -6.8282643},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 246},
                     "duration" => %{"text" => "1 min", "value" => 34},
                     "end_location" => %{"lat" => 40.60657, "lng" => -6.825644},
                     "html_instructions" =>
                       "Slight <b>right</b> onto <b>Largo 25 de Abril</b>/<b>A25</b>/<b>E80</b><div style=\"font-size:0.9em\">Continue to follow E80</div><div style=\"font-size:0.9em\">Entering Spain</div>",
                     "maneuver" => "turn-slight-right",
                     "polyline" => %{
                       "points" => "}dzvFtrth@Xo@BKDQd@{@Nq@DUBM@IBYFq@NQZu@Vk@d@cA"
                     },
                     "start_location" => %{
                       "lat" => 40.60767269999999,
                       "lng" => -6.8281059
                     },
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "89.5 km", "value" => 89456},
                     "duration" => %{"text" => "46 mins", "value" => 2780},
                     "end_location" => %{"lat" => 40.8892167, "lng" => -5.9430876},
                     "html_instructions" => "Continue onto <b>E-80</b>",
                     "polyline" => %{
                       "points" =>
                         "a~yvFfcth@`@_AVo@LUPUFIFGRQ\\SVQDEBCDEFIHMLSLUvBsEx@kBTa@@?@A@?@A@??A@??A@A?A?A@A?A?A?A?A?A?A?AAAHM^_Az@kBlAiC@CTq@DUFKJWjCwFd@cAd@{@FIHOFKX[pB{B|EgFv@}@X[bAiALOvB}BbBiBNMvAsAxG}Fb@WPI@AFGRQh@c@j@e@VSVQjA_Ad@a@PONOXWTWHIFGJOLMLQLQVc@PWLYP[JWJUHUFQJ]DQBIPu@Jk@DQBOLeA@OR{Ax@wFJo@Js@BYDYBWBU@O@OBa@@O@[?Y@Y?U?[?_@?SAo@CgAAaAEgBCeBI}EGkDI{DC}BAkA?k@@[@i@?YB]@U@U@Q@Q@OFm@Dc@BYL}@D_@NgAHWD_@Ls@RwAR{AVkBJu@J{@BQ@OFe@r@yFBQXyBL{@d@uDFe@@OTiBXeCLgA?C?C@C?Ov@mG\\kCNgADc@`@wC`@eDb@iDPqAHs@F_@Jk@H]FWFMXiAZiARs@Ro@Jc@Nm@No@P}@RaAF]Ji@Jo@Fc@BKTeBP{ADe@LmABe@NqBHuBDaBBoA@kA@{B?yC?}BAwBCyCA_DAwBA}CAsBA_DAaDEyHAcDCkFEaNCyHCkECmFAkFCgECeIC{DA_DAcBGuKGiEEmBG}BEmBEoAK}CUsFWeFe@{J}@oQ[mGMsCMuBIuBQ_DOyCO_DOqCK{BMaDOkFKcDMmGgAoe@WoLOwGGeCA}@Ak@AkAAwA?_A?k@?eB?SBaCTyJFiCBeABiAByA?{@@w@AqAAi@Ac@CgACo@Cg@Ek@G_AGk@Ei@Ee@Ge@Gc@Gc@M{@Km@Ig@Q_AOm@Oq@Qu@Me@Ka@U{@Sq@wAgFs@eCe@oBK[WgAUcAG]Kk@QcAIi@OkAIq@KeAIcAEw@Eq@Ci@Ce@Ae@Ag@Ai@?g@Ae@?e@@iA@y@By@DsAFmAHkAHcALsARiBHk@LiAVkBXyBNcA`AqHn@cFx@cGt@gGVsBTkBb@_EX{CRyBHmAL_BFcAF}@Du@DcADk@DkAFoAFsBBiABg@BuABwCBuB?{BAyCAyBCmBEoBEsAEqAGeBGwASgEQaDQwCIoA_@oFO{BK}Ai@wHe@yGk@wIo@eJe@qGY_EGcAq@{JQiC[iEk@eIGcAEg@Cg@QyBi@yHQwCSoCg@oHe@yGe@wGe@cHWaEKeBO_CIgBIuAEuAKuCIcCG_CG{BEyCCcDC_E?yC?eEBcKBsF@mGBoF@eFDgEDaDHmBL}BPoBTmBRkATuANw@XoAXiA`@uAPi@Rk@Z}@hBoF`DkJrBgGx@aC`@gAPc@N_@Te@^w@h@cAb@u@f@w@T]h@s@l@u@V]xA_BxB_CnByBdAsA|@oAj@{@R[Ta@j@cA\\s@N]t@cBn@gBl@kBPq@Rs@TcAXsALu@Nu@RmAr@yE|@mGpA_Jv@qFn@sE|@cGnA}IvAyJrAiJrAeJrC}RzAkK`AyGz@gGv@iFj@_Ej@_ExA_KHq@n@mERwANaALmAHk@Ba@Dc@HsAFmABo@@g@@i@@qA?sACoACiAGoAIoAKwAMkAQuAIi@OaAe@qCw@wESiA]uBg@sCs@gEg@uCg@wCg@{Ci@_Di@}Cq@eEeAiGcAkGs@aE_@yB_@sBq@}Dq@_Ee@mCs@gE}@kFoAoH_@mBm@yCe@oBCKKa@[iAg@mBk@kBm@kBm@eBq@mBk@_BcBwEqBuFoAoD_AkC_AkC_AkC{@_Cc@mAiAaDqAoDy@}B_@aAa@eA[q@[u@s@{AQ]Ue@s@qA}@}AkAsBoAwBsA{Bs@oA_A}A?A_A}Aq@kAMSy@wA}@yAqAwBaBsCeBwCw@qA]m@Wa@o@_Am@w@e@i@W[u@u@_@[AAe@a@q@g@w@i@y@e@w@_@iAg@{Ak@sAa@yAa@sA]yA[e@Is@OaAOkAO{@KuAMw@GcBK{AE{ACwAA}A@{ADwAFqBJ}AJiDVyE\\sCTaDVqAH{AJ}BNsAF{@?w@AeACsAK}@KcAQg@Kg@MWI[IiAa@m@Wq@[_@Qy@e@o@a@s@e@w@k@u@m@gAaAs@m@m@m@cAeAq@s@g@k@m@s@GGi@s@gAuAeA}Aa@k@{@sAe@y@y@}Ay@cBcA}Ba@_ASe@k@{Aw@wB]eAo@yBa@yAqAsEq@sBk@gBa@aASg@_@{@Yi@_@q@Wa@QWq@}@i@o@YYWYg@g@{@s@c@[k@_@m@_@c@Uq@]c@QsAg@_A]uC}@w@Ws@UeA_@iAi@g@Wo@]s@e@qA_Ae@_@_@]u@q@k@k@a@g@_@c@o@}@Ya@i@y@e@y@g@_Ae@aAo@yAa@cAm@iBi@oBe@sBUgAIi@[mBOsASkBUyBUyBSsBSqBUyB[yCUwBSmBWwB[wB]eBWkAOg@[iAm@kBo@cBw@cBq@uAU_@}@cBy@yAwPc[qCeFuCmFeDiGGMoBaEaAuBWm@uAgDqAiD}@gC}@kC{@mCk@gBw@eC{@oCq@mBe@oA[w@s@aBmA{B{@}Ay@oAYc@sAkBu@{@cAiAaBeBgAoAwAeBeAwAmAqBmA{Bu@cB]y@Sm@_@aAi@iB[gAUcAWeAUiAIk@Ig@Ms@UiBYoC_@oEOcBScBYkBWsAWiAa@_BUu@g@yAa@gAa@cA_@y@Yg@y@yAa@q@[e@U]eAqAW[]_@m@m@o@m@s@k@mAaAgBuAmA_AeBsAiA}@uAeAiA}@w@m@q@i@IGmCuBqAaAUSgCkBkA_AoA_AmA_As@k@mA}@s@i@WSoA_AiAy@kA{@{@k@y@i@OK}@k@u@e@kAq@oAq@s@a@i@Yu@]w@]y@_@w@]w@]y@[y@[a@OWIy@Yy@Yy@W{@UwAa@mAYyA]e@KiDs@mGoAsDs@_Dq@{A_@yAa@oA]wAe@wAg@uAi@qBy@kCmAsAq@_Ae@o@_@qAw@qAw@oAy@u@g@s@g@s@i@s@i@o@e@qAcAgBwAkA_AkAaAmA_AmAaAkA_AmAaAmAaAkAaA}@s@aAw@mAaAs@i@GGi@c@cAy@{@s@gA{@w@o@YW[Yk@g@s@q@q@o@o@s@UYeAmAk@w@k@w@k@y@g@y@i@y@g@}@e@_Ae@}@Ue@_@{@a@_Aa@cAO_@a@eAk@iB]eA[gAe@mBc@kBa@oBSkASkAIe@Ku@WsBEc@]kDYsCUeCEa@MuA]oDW{CMqAWsCOsA[oCQcAYyAUcAQs@Ka@Su@c@wAEOQg@a@cAs@{AO[g@cAi@_Ai@w@q@_AKOW[iAqAq@q@WUk@i@_@Yo@c@UOi@]_@UcAi@YM_Ac@mB{@yGwCiD{A{@_@oB{@mAi@u@]{@a@{@_@mCkAw@]gD{AwAo@{@_@qAk@wB}@gAe@i@Ws@[{@_@y@_@_CiAk@]q@a@q@c@[WSO]YYWQQYYY[YYU[SUCCU[g@s@m@}@g@u@m@_AcBkCk@y@kCaE_CoDqB_DsCgE{BmDq@eA{@qAuAuBy@qAgBqCoBwCeF{HqB}Cc@s@{@qASYYc@uAuBsAuBqCiEuAsBc@q@o@cAi@{@yCsEcA{AiDiFgC}DwCqEuCoEiBsCuAuBeDeF_EeGqEcHkFcIeDgF{EoHiC}DmDsFcD_F]k@g@u@e@y@}@}A[m@Wg@Wk@e@aAUg@[{@_@eAe@wAa@oAi@oBUaAa@iBUqAY{AQkAOiAUmBOoASaBIw@McAOgAKy@[wBKo@Ie@ScAS_AOo@YgAW_AYcA_@mA_@gAYu@Sk@e@iAO]w@aBmA_Ci@_A_A_BSY?AAAOWmAqBg@y@e@y@e@y@Q[e@y@w@yAq@sA]s@}AaDy@cBq@wAe@cAg@eAc@aAcFoK}@kBgIaQa@{@ACO[iAaCaCcF_BgDaDwGmBaE_BcDwBqE{DiIqBiE}EcK{B{EyDaIiB{DkAgCe@aAm@wAa@cA_@aAa@gASi@Y{@a@oAi@iBOk@IWKc@[mAKi@Ka@Ia@UaAWuAKo@G]Ki@G_@QkAIi@MiAOgAIw@MgAQuBSsCKsASaD_@sFQwBUqCKsAIu@Iu@a@}DEYAIEa@Ku@Gk@SyAYkBSkASqA[gB_@oBa@qBUiAYoAKc@Me@a@eBg@oB[iAYcAi@kBk@mBm@kBY{@u@uB_@eAYu@eAmCcAeCw@iB}@wBmAsCyBkFs@aBM[_@}@c@gAo@cBa@iAm@aBOa@_@iAgAkD_@mA]eAMe@Me@Mc"
                     },
                     "start_location" => %{"lat" => 40.60657, "lng" => -6.825644},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "114 km", "value" => 114_132},
                     "duration" => %{"text" => "58 mins", "value" => 3499},
                     "end_location" => %{"lat" => 41.5108831, "lng" => -4.9925856},
                     "html_instructions" => "Continue onto <b>E-80</b>/<b>A-62</b>",
                     "polyline" => %{
                       "points" =>
                         "sdqxFhwgc@cFaVcBiIqAcGaCwLmBaJcBcImB}IqOqt@gLqi@uB}JQy@oFkWG]a@}BsAgGOw@gAeFkBcJqEqTSw@I]UkAc@uBe@sBeAgF{@_Ea@sBq@}Cm@yCc@sBc@uBc@uBc@sBa@sBSmAQaA_@cCOoAGg@OqAGg@AQOkBKqAIoAIsAEqAEqACsAAoAAsA?qA?sA@qA@qA@qA@uA@sA?oA?sA?k@Ag@AuACqAEsAAi@Cg@Ci@GoAKsAKoAKoAWwBOqAOoASmASmAUkAUmAe@uBYiAw@yCm@mBo@mBa@gAs@kBc@eAi@mAu@{Ai@cAi@}@g@{@i@w@m@{@m@w@k@w@o@w@o@u@q@u@gAmAq@u@gAmAo@u@o@w@UY_@e@c@q@]e@OSU]U_@U]S]Ua@U]Sa@g@_Ag@cAQa@e@aAc@eAQa@a@eAa@gA_@gAUs@e@}Ak@oB[kAg@qB}AcGyA_G_@wAg@qBu@uCu@wCcA}Ds@sC[kAg@qBg@qBu@uCu@wCaAyDcA}D}AiGkBkHcA_EaA{DqAcF}AgGu@uCu@wCg@qBYiAi@qBg@qBg@oBu@uCg@sBg@oBi@uBs@qCmAcFe@sBo@{Cm@yCa@sBa@wB_@uBg@{Cs@eEg@yCq@aEg@}Cs@eEg@_DoAyHyCsQ[mBmCgPg@{C}@kFg@_D{@iFKi@Ic@i@_Dq@eEq@gEuBeMyB{MkAkHcAkGWkBCUKs@C_@OkAI_AS_CAYGo@GaAGiBEqACoAAoAAqA?yBBwBDwBH{BJyBP}CXqFD}@@m@FoD?uBCuAG_DCq@AAA_@MsBQsBOwAMgASoA]uB_@mBYqAc@eB[iAo@kB_@eAaAcCe@cAa@y@AEaBwC_AwAcAsAi@q@_BiBuAuAe@a@eAaA[Y]]c@a@QQGGo@k@ECq@q@s@o@q@o@w@q@w@u@}AwAq@o@k@i@QSII[_@WWaAkAk@w@i@w@_AyA{@{Ae@aAWi@Q]KWQa@Qa@O_@]aA_@iA]eAMe@Mc@YiAWgAKi@Kc@UmAGc@Ie@Ge@Ik@OgAMmAMoAIkAIsACg@Cg@Ai@Ce@Ai@AsAAg@?oA?]@w@@mAFwBDoAHqBHwAFoAFgBFyABuABmA@u@@mB@oA?k@Ae@AmAE_DEsAGoAQaDIsAQsBSsBWwBQkAYmBUsASiAa@mBWmAYgAYeA[mAMc@Y_A]eAq@oB_@cAa@cAWo@qAqC}@iB{AqCcAgBqDsGcCyEy@gBeDkISq@eAgDe@_Be@iBCMI[COIYEUS{@AGWkA[_Bc@kCe@_De@_EMoAKcAQgCImAIqAMyCEuAAm@AuAC_B?gB@oA@wAF}CRuEHkA?CHiADo@Fq@H}@JcARcB^wCt@qFFi@NkAFk@Ba@Fm@@_@B]DuA@aC?[AmACm@Ai@E_AKiAEm@Gg@QmAMw@Mq@I_@Qw@EMOg@GU[aAQc@{@uBaAkBo@}@MSOSSYUYq@{@]_@aCsCmC}C_B{AUUiAcA{AqAc@]uByA_Am@UOe@Yg@Wq@_@{@c@c@UyAo@_A_@_Bo@kE}Au@W{@]kCeA_Bq@OKYOAAs@a@[QmAw@iBqAs@m@s@m@q@k@o@k@q@o@YYkAgAaByAiAcAmA_AQOYS}@m@sDyB[QgCsAu@_@sAq@iB}@_PmH]O[OiGuCiAi@[OECKEUKiB}@gDcBiEcCw@i@w@k@_Au@m@i@[Yi@i@g@i@EGk@o@o@w@{@mA{BiDkAkBm@_A{AaCmAoB{A_C_BwB_AgAi@k@[[WYcAaA{@y@USmAcAkAy@kBmA}A}@kC}AaCwAwA_Aw@m@SQWQa@_@w@u@[_@QSa@c@_@e@]c@m@{@Wa@a@o@c@w@Q]u@{AIQSg@[w@Wo@Uq@Qk@Ma@Mc@IYEQG[GQCKWoA_@mBa@kCqAyIu@_FQgAOaAQoAW_BIc@Io@WeBmBaMc@}CQ_BK}@I{@Eg@E[Eg@AWG}@C]Ew@GmAEoACiAACAm@MoGAs@Cq@C_AAe@?c@KwEO{HA]?]IqECoBA{AA{B@sBDgC@W?UBcAH}BNaDNuCJgBHwAJ}BP}CJuBJyBHuBFuBDoBB}@?[?[@G?S?S?sB?{@AoAAuAYuZGqDC_CEsB?[GiCMwEMyDGyBGsBAe@Cs@IwCEoAMaEIaDKgDGsBCcAI{BGuBGwAKyBKaBCc@Cc@OgBKuA]gDMeAUkBSqA]{B_@qBa@sB_@kBe@mBcAeEm@aC[oAm@aCw@aDs@qCs@qCg@mBe@mBe@kB[mAYgAWeAe@kB[mAc@gBg@oBe@iB[oAg@mBc@gB[mAYiAe@kBYkAWaA[kAe@oBe@eB[mAg@mBe@iBi@mB[kAi@iBg@gBk@kBi@aBIS?CKUy@_CWu@o@_Bo@_Bc@cAYq@Yo@{@gBu@{Ag@_AIMmBkD{@wA_AwAuAoB{@mAQUIKCCKOmAyAaAkAw@}@eAiAgAiAgAeAkAgAs@k@k@g@a@[s@k@s@k@mA}@eBmAw@k@mAy@oAy@wAaAk@_@}@i@iEmC{AaAcAo@w@g@uA_Aw@i@mA{@}@o@kAy@s@k@c@]c@_@w@o@eA_A[YWU[Yo@m@o@o@WYo@o@m@o@q@w@k@o@o@u@U[UYY_@i@q@o@w@k@w@k@w@m@y@g@u@k@{@_AsAaCsDmAkBcA_BqAqB_AyAeAaBu@iAi@y@m@y@_AsAo@y@i@o@EGi@q@cAoAo@u@{AcBo@q@m@m@iBgBYWo@m@q@k@s@m@s@k@s@k@o@e@]YiAu@WQ_Ao@m@a@uCgBqDsBsBgAmBcA_B}@wEiCeAk@gCyACCcBeAyA_Aw@i@cAs@u@k@cBqAoAeAmAcAk@i@gBcBq@o@_AaAs@w@o@s@uA_B[a@m@u@_AmAm@w@e@o@eA{AoAmBm@_A_A{AwC_F{B}DcAiB{AiCk@gAq@gAuA_C}@uAq@eAiAaBgA{Ak@s@EEcAoAwA_Bc@e@}@}@s@q@q@m@gAaAeA{@cAy@mDkCeCiBa@[OKo@e@c@[mEeDiA}@yAkAmC{Bo@k@gBcBgAgAq@q@i@o@m@q@o@s@aAmAo@y@m@w@k@{@e@s@q@cAm@eA_@o@g@{@g@}@a@y@Uc@Ym@]q@_@y@c@cAYq@Yu@]{@Si@Oc@KWAEMa@_@gA]aAW{@]oA]oAW_A[kAWiAWeAYqAa@mBWmA_@iBUmASgAKg@SiAKm@SgASgASiAKo@QcAUmASgAUoAKi@Kk@Q_AKm@ScAMm@UgAScAS_ASaA_@}AMk@K[YiA[mAYaA]kA[eA[aAWs@g@uA[w@Yu@]w@c@_Ac@_A[m@i@cA]m@c@s@m@aAk@{@i@w@m@u@k@s@[_@_@c@e@i@g@i@o@o@[Yw@u@w@m@e@_@y@k@q@e@y@g@[S[QIEEAGEIEOI[Q_@Q}@_@uAk@kAc@{@[u@Ue@Mu@S{@Uc@K[Gu@Qe@IuAWuAU_@GQCOCGAKA]Ec@G{@M{@KaBQsAOuCYcBQs@I_CWw@IoC]y@KeAOcAQw@M{@Qe@IGA_@IUGYGq@OiBc@e@McAYcA]i@QcA_@e@QEA_@QmBy@WKu@_@aAg@qAu@cAk@k@_@oAy@eAu@_@WmA}@i@c@y@o@iA_AoAgAo@k@w@q@q@m@iAeACCIIYU?Ac@_@s@q@k@i@q@o@USq@m@m@i@]]s@m@mAeAs@m@q@k@q@i@q@k@s@i@wAgAaAs@aAq@o@c@g@]_Ai@[Ss@a@[S_@QOKc@S[Qy@a@w@]u@[c@Qy@[[Me@OGCA?[Ke@O}@WuA_@{@UuAW_AS}@MqAQm@Im@Ge@Ew@I_BKcAEqAG{@Ay@CcA?qAAwA?aBByA@cBDyADuCJmDLqAFcDLuBHgBFyAFyAD{ADcBB_ABwA@sA@cC@cAAqA?y@AwCGsAGcAE}@EcAGm@GgAKcAIk@IcAMcAOuAU{@O{@Qy@QsA]{@U}@Wy@Yu@WuAi@_@Oo@Ye@Su@]qAq@sAu@[Qg@[iAs@k@a@[Uq@e@e@_@o@i@cA{@aA{@gAeAUUMMu@{@e@g@W[s@y@g@o@Y]k@u@S[CCc@o@m@{@[e@e@w@g@{@e@w@e@y@Wg@S_@OY]q@Yk@Ug@OYQ_@Q_@Ug@Ym@IS]y@Qc@_@_AOa@Ui@ISoAmDCIeA{CeDsKcAmDGWQm@AGMe@iAeEu@{C?AkIc\\"
                     },
                     "start_location" => %{"lat" => 40.8892167, "lng" => -5.9430876},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "1.4 km", "value" => 1424},
                     "duration" => %{"text" => "1 min", "value" => 47},
                     "end_location" => %{"lat" => 41.5061819, "lng" => -4.9778278},
                     "html_instructions" =>
                       "Take the <b>E-80</b>/<b>A-62</b> exit toward <b>Valladolid</b>/<b>Burgos</b>",
                     "maneuver" => "ramp-right",
                     "polyline" => %{
                       "points" =>
                         "_rj|Ftbn]T[DGDKLYz@wBfA}Bj@}@T_@V_@h@q@DGh@m@l@q@jAoAj@m@Z_@Za@h@u@f@y@Ta@Xk@Zu@Tm@Vo@\\cALe@Jc@R}@RcARmAP{AJ_AF{@Fy@Dw@H}ABaAHkE@iDAqBC}BGuBGaBGcAIsA"
                     },
                     "start_location" => %{"lat" => 41.5108831, "lng" => -4.9925856},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "144 km", "value" => 143_892},
                     "duration" => %{"text" => "1 hour 16 mins", "value" => 4567},
                     "end_location" => %{"lat" => 42.3044267, "lng" => -3.7457078},
                     "html_instructions" => "Continue onto <b>E-80</b>/<b>A-62</b>",
                     "polyline" => %{
                       "points" =>
                         "sti|Flfk]WyCM_BAQ]{CWkCiAcK]_D{@mHe@uDw@wGQ}AiAyIuAcLsAwKu@wFu@gGo@eFg@mDWwAa@oBc@kBi@gBu@aC}@eCgB_FaAeCcDuIyB}F_BkEWq@Sg@eAwCg@}Am@mBk@kBUy@q@wBiAwDw@iCe@{AyCgKa@qAgEwNyDuMuDkMuAyEkC}I{BuHeB}FcAgDy@qCsAsEqD_MoEcOk@oBeAiDeB{FaAaD}@yC}AkFoBsGqB{GuEoO_@oAi@aBq@sBm@_B_@_Ak@oAm@mA[i@aAcBKOe@s@mD_FyB}C{DqFoHgKcE{FmIoLo@}@QU}DsFiEeGU[cAuAk@y@aAsAi@u@g@s@gA}A_AsA_AqAKOkAaB_PaUmImLaCcDqAgBeFkH}HyKeA{AgA}AmAcBqAgBsDgFsDgFkAaByAuBmCuD_F{GEIg@q@e@q@U[yB_DcAwAsAoB_AwAsAuBmAqBS[i@_AMSaDwF}EoIaAcBsDkGmAoBy@wA_@m@yBmDm@_A{@yAy@oAUa@g@w@Ua@eBoCqCqE{@wAuAyBwDkGqCqE{@uAm@}@aAwAcByBuCiDm@q@o@u@W]k@q@eAmAcAmAo@u@w@_AgAoAa@g@o@s@m@s@m@u@UYo@y@g@s@k@y@U]i@}@[e@a@s@mAyBy@aByCqGeBuDw@_BcAqBg@_Am@eAs@iAo@aAq@_AaAsAgAqAwBcCwBcCqCyCmD}DmD{Ds@w@k@i@]Yi@e@a@YeAi@q@[w@[_@OgCm@iD{@qA_@OEMEUGc@QEAKEME]Om@]a@Wo@c@e@a@o@k@q@u@m@u@e@q@]k@a@q@iBoDwA_DgBcE_AoB_ByCgBeD]m@IOIOo@gAYe@KQg@}@oBqDcAoBk@gAKSISiKgSwBgEgAqBaAaByAgC{BwD_EyGwCeFqC{E_E_HmCsEqA_CaAiBo@mAs@wAy@aBu@aBk@sAMY]y@yBoFmA_D}@}BaAcCeAsCmBaF_BeEyA{DWo@Um@IS[}@Wo@a@gAq@gBo@}Au@gBy@_Bo@iAi@}@uAmBe@m@i@i@gAeAo@i@s@i@i@_@}@e@e@Uk@We@Sg@USI[KcAYe@MICaASq@KeAM}@Iu@Ec@C]AUCG?sCSw@KyAYe@K{@Wa@My@[]Mw@_@_@Ss@a@[Qu@g@YWYUcA}@u@u@q@s@U[cAoAkAaBcAuAc@q@e@u@o@aAU_@qAwBaBuCWg@y@}AMUWi@c@{@g@eAO[Se@c@aAw@eBQ_@mA}Bk@}@U]U]k@u@iAqAWYq@o@q@m@u@k@YU]Ug@[GEy@c@y@_@o@[e@OwAe@iFcB}@]sAi@y@]}CsAYOWQiAg@sAu@iBeA[Uk@c@g@a@sAkAy@}@]_@eAuAS[W_@qCmEk@{@iA}Ak@u@wA_BmAwAs@q@m@m@s@o@YWm@i@o@i@]Wu@i@]WYS[So@a@_@UqAu@sAs@yAq@qAk@{@]s@W]K]K_@Ma@KYIa@K[I_@I_@Gu@Ma@G]Ea@E[CYASCYAWAe@Au@?y@?{@B}@B{AD_AB]?]?_@A_@A]AcAGu@I_@G]Ee@KoAYc@M[IYK]M_@OWM_@O[OYQ[Q]SUOYQ_@WWQ_@Wo@e@u@i@]Wo@a@]W{@k@m@a@]SYS_@WoAw@_@Wo@]a@Uu@_@]OWK{@]s@Sy@Uw@SiAU_@G_@Ea@Gm@GmAIoACiAAy@BmADm@D]D_@Da@Du@L_APk@LQF}@TC@s@RqA^{Bp@kDhAk@Ro@N_@Jm@Lc@Hq@Hi@D[BgAB{@?MAS?e@C]CSC}@KUEe@Ka@I]K[K_@Mu@Y]Oi@Yg@[gAq@kAcA{@{@o@w@g@q@U]W_@S]S_@Q]S_@Qa@Qe@_@aAQg@Mc@Mc@K_@Mg@Kc@Ie@WoAOgAIq@MoACg@Ee@Ci@Ae@Cg@Ag@Aq@?g@@e@?m@@e@@g@Bk@Bk@JkADk@TuBH{@RcBDe@Dg@HmADo@DkABq@BoA@{@?_ACsBCkAC}@Em@GgAEg@KiAKaAKq@?AQgAa@{Bc@mB[mAOi@Sk@Yy@_@cAUg@O]O]Sa@Ue@c@u@aAaBi@y@gAeBu@sAeAgBcAmBg@cA{@_BiAcCu@_ByAeDiBsEaBoEa@cA[u@Ym@g@aAa@w@S]U_@]k@g@u@[a@a@i@[_@Y]m@o@o@o@{@w@o@g@wA_Aq@c@]QkAo@_Aa@SKsEwB[O[OeB}@kAw@[UsA}@o@e@y@o@sAgA}AsAqAkAiAgAq@m@gAeAYYmAkAqCsCqCuCiD{DqCaD_BmB}CwDgCkDcCkDaCuDeAgBUa@Ua@c@u@mAyB}@kBu@}Ao@oAg@cAi@}@o@_A{@mAm@u@o@s@w@s@i@e@q@g@y@m@mBkAc@Sy@_@y@[y@]oAq@y@g@s@e@u@i@s@o@[WiAiAWY{AeBOOwBcCeAmAkBuBmBwBoB{Bm@s@c@g@oDaEkD}DoD_Ei@o@s@y@a@e@yAaByA_BiD{DcDuDaBmBcCoCgBsB{BiC{BgCY[}CoD_CiCgDwDwBcC}AgBq@w@qB_CeBmBw@{@{BoCs@cAo@gAo@eAUc@iAeC}@{Ba@iAoCgJe@}ASq@gBgG[gAOc@[}@Qe@g@mAa@{@i@eAw@sAq@eAGKW_@k@s@i@u@{EiFqAqAoAyAyCaDoAuAa@e@_AeAqAaBc@i@o@{@w@oA{@sA{EmIeP}X}@}Au@qA_BoCgAsBiAsBmGeMs@yAyEiKg@iAm@uAyAcDmD_ISg@gB}DwBeFcBaEyAsDiCmGkAuCqB{Ek@uA}AwDuAiD_@aAm@yAcC_GaA}BiCoGsAaDkAuCqB}Ey@qBu@kBaAaCe@eA_@w@m@oAk@eAi@}@e@u@a@k@o@w@g@m@]_@i@k@m@k@s@q@aEiDCC}@u@gCuB_WsSkGiFoHeGyBiBmB_BiByAs@m@oB}AaDiCgByAsFoEcEgD}BkByCcCgBwAiA_AaDiCk@c@_DkCwCaC_CgBw@m@s@k@[UqB_BeBoAcBqAkBuAcCkBcCoBsAgAyAiAsB_BwAgAuAgAiBuA}BeBgBsAuBaB{AoAUSUW]_@[a@cAuA}AwBw@kAe@q@eCmDsB{CaCeDqCcEuAmB}@oAeA{A{@mAqAkBuAoBaAyA]g@iBiCo@_A}@qAwAuB{A}BwBgD}MqRkHyK{EoGs@_AeB_Bs@o@USmAaAwBcBeBwAi@a@wC{BoB{AiCoBqB{Ac@[YQs@a@[Q_Bu@cBu@iAi@_Bu@aBu@s@Wc@OWIkA]_Ba@s@QOCeAUo@OeB]cAQgCg@iB_@sB_@{A[uAYoAWs@Qc@MeAa@w@_@iAm@wCaBmDqBsAu@kAq@cAk@kAo@_Ai@wAy@}A_AuBmAwCeBeCwAeCyAsAy@mAs@u@a@uBmAaFwCeBcAi@]aDmBeEeCoBmAgEmC}@i@aIaFeBgACA{@m@c@Wi@]sCgB{CkBmAw@eEsCmIqFkEsCkGcEoD_C_C{AgK}GqQkLkDyBkD{BGG_CyA]Sq@_@c@Ui@Wc@Q[M_@M]K[IuBa@_ASo@Ow@Uc@Ou@_@[Q[Qe@]e@a@g@e@]_@[a@Ya@Wa@_@m@EKa@_ASc@IWIUMa@Qu@Og@gAuEK]I[KYOa@Qa@Qc@Uc@c@y@MSU[SYSUW[WYc@_@WUkA{@sAs@cAa@cA[u@SsC}@w@Yi@Ui@WkDqB_@Su@e@_@Wc@WeBcA_@Wc@Wg@Wa@W_@Uc@Y{DyBCCcB_A}BmAyAu@{BmAeB}@m@Y{Aw@UOoBcASKIEIEm@]qAu@aAm@gAi@mAc@c@M_@IYG[Eg@GYC[Ai@Au@?{AH}BNqBHoBBq@?k@AgAEs@Ek@Gs@Ic@Iq@Oq@Oo@Qw@WGCQIOEu@]oAm@q@a@{@m@}@s@k@g@YWs@u@aAgAiFkGiIaKeCyCkByBwAgBu@}@SUSUGIoAcB}@aAuAqA}AoAYSwAgAs@k@_@a@]a@Y]g@u@QYOYQ]Ug@_@cA_AuCQk@Oi@m@iBMa@Wk@_@s@Q[Ua@QWU]g@k@Y]g@e@a@]WSe@[_@SWMu@_@uAk@s@[i@Uk@Yo@_@_@S_@Wk@c@YUo@k@[[aAgA}CqDm@u@_CoCeAoAeAkAaAcAa@_@][IG}@q@[Ug@]e@]s@a@u@_@sAm@{Ao@aJqDyPaHcAc@uUkJuCoAiGeC{D_Bg@Q}JcEwAk@c"
                     },
                     "start_location" => %{"lat" => 41.5061819, "lng" => -4.9778278},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "10.9 km", "value" => 10944},
                     "duration" => %{"text" => "6 mins", "value" => 364},
                     "end_location" => %{"lat" => 42.3341226, "lng" => -3.6241091},
                     "html_instructions" => "Merge onto <b>E-80</b>/<b>BU-30</b>",
                     "maneuver" => "merge",
                     "polyline" => %{
                       "points" =>
                         "uqeaGtqzU_@gE]cD?COkAUqBOsA_@_DMaAMaAWeBSoAiAkHSgASkAUoAy@wEYkBSmAQmAQmAQmAIe@Ge@QmAOmAOoAOmAOoAOqAMmASoBMqAGk@MoAKmAWqCKyAEk@OsBEm@?AIuAIqAIqAIoAIqAIoAEi@Eg@IqAMoAKqAKoAKoAMqAMoAMqAMmAOsAE]UgBE_@OgAUeB[_CQoAQmASoAQmASmAIe@QeAKi@Ik@Ic@Kg@SkAg@kCOu@Ie@Kg@Ie@Ke@Ke@Ke@Ke@Ke@Ke@Kc@Ke@Ke@Ke@YkAYiAMc@Ok@Ma@Oc@Oc@Oa@Qa@Qa@Qa@Q_@S_@Q[ACS]Q[g@u@SYU]MOe@o@W[WYWYUYW[WYU[U]U]S]S_@Qa@Oa@Oc@I_@Sy@Ig@E]G_@C[GeAAYA[CoA?cA?Y?[?Y?o@Ao@AsAGiCEiAEi@Ce@Eq@Ek@McAO{@Q_Aq@aDOo@Me@Sk@IWYu@o@sAc@}@e@y@q@gAw@eA]e@Y]iAqAMMa@_@q@o@s@m@e@]uAeAg@]eBmAgBsAoAcAi@i@g@g@cAkA]a@s@_Am@}@a@q@{@yAcA{BsAqDi@aBa@aB_@{AYoA_@mBk@gD_@}BGg@Ge@QuAMwASuBKaAEs@OgBOcCIqBGkBGyBEuBAuBAmCBmC?]?C?[BwAHuBJiC?ABW@YHgBD_AHcALaBJoALmARoBLeAHo@Hm@TuB\\uCLoAFu@Ba@J}ABg@@Y@[DsBBcBAeBAuBCcAE{@MqBKwAGm@Gm@MiAU}AUuAMq@UcAYmA[mAW_AWw@[}@e@mA_@}@q@cBm@wA{@wBUo@Yu@]}@a@iAUo@Y}@[aAMe@[gAQk@U}@Mk@U_AMk@Mg@Ow@Q{@Ie@Ic@Ie@Ga@Ie@My@M{@Gc@Kw@MgAEk@Ea@Gk@Ee@Eg@Ec@Ek@Cc@Ee@Cc@Ci@Cg@E}@Cg@A_@Cs@CcAAe@Ak@Aq@CeAAs@?]?IAe@KoJA_BCeAAsAC{@AqACkACqAE}ASsGEcAGeAE{@GeAEy@G{@KuAGaAGs@Is@Iw@KeAGo@Iu@QqAK}@QiAQmAOeAQiAMo@QeAO}@Kg@Mq@Oy@Ms@Kc@Ii@Ka@Ke@Ke@I]Kc@Mc@Mg@Mc@Oi@Ok@_@uAgB_GcA_D"
                     },
                     "start_location" => %{"lat" => 42.3044267, "lng" => -3.7457078},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "76.6 km", "value" => 76579},
                     "duration" => %{"text" => "39 mins", "value" => 2352},
                     "end_location" => %{
                       "lat" => 42.70359879999999,
                       "lng" => -2.9161062
                     },
                     "html_instructions" =>
                       "Continue onto <b>AP-1</b><div style=\"font-size:0.9em\">Toll road</div>",
                     "polyline" => %{
                       "points" =>
                         "gkkaGtybUeBwFOi@Ok@{BoJm@yBqAyEg@iB]yASy@iByHkAwEw@wCW{@a@oAk@iB_@aAq@iBKUy@kBw@eBy@}Ac@y@Yi@w@qAkAgBm@y@k@y@]a@aAmAo@s@aBeBiAaAiAcAw@q@USWQWS[UoA{@eAq@}@k@y@a@u@_@qAm@uAk@sAe@uAc@]IgAYmAY{@Qi@K{@Og@Gg@Gw@K}@Ku@IYCeBOyD_@kBUy@Qs@OcAYkAa@cAa@]OuAq@s@c@iAw@s@i@g@c@{@u@g@g@q@w@Y[SWq@}@{@oAg@y@qCuEqAyBmAoBi@}@k@w@_AwAaAsAi@s@m@s@o@w@eAkAgAiA[]wAoAWYQMCCwAmAaBmAmA{@qAy@uAy@o@_@uAs@sAo@oAi@a@QoAc@y@Y{@Yy@U{@U{@UoAW{@Q[GyAUuBY{@K{@KwAQ{@I{BWuAOwAW}@SuAa@yAg@iBw@qAu@s@c@OKk@a@WSq@k@USo@m@gAgAiAiAgAgAsAsA{@s@oAcAw@g@q@c@mAq@}@a@u@[]MaCs@q@Om@Mc@GWEg@Gw@ISCy@EyAGuCK}@Eg@Aa@Eq@Ea@Ew@M]Es@M]Iy@Sa@Mw@W[KSIcAc@g@Wg@W]SGC_Am@_@YOKMIeA{@o@m@q@s@k@o@c@g@a@g@U[k@y@U_@e@u@g@}@Wi@[q@Se@Se@]{@a@eA]cAkAoD}@sC]cA]cA]aA_@cASe@Uk@Ys@c@aASa@O]g@_ASa@S_@e@y@U_@QYk@{@]g@c@o@i@s@o@y@cAmAaAkA}DmE_BgBm@q@o@u@_AiAm@s@m@u@yAmBi@u@m@y@i@w@Yc@e@s@i@}@e@w@i@}@c@u@We@c@{@g@aAw@aBc@_Aa@cAa@_As@iBKY_AoCm@kBk@oBe@cB]qAU_AIc@gAgF]qBQgAc@}CYwBUuBMmAQsBKwAKoBOyBGoACo@IoBK_CIuBO_DIqAEw@Gg@WoCQkAGc@QeASkAMk@UcA[kAm@sBMa@EKKWM]Qe@_@_Ai@iAs@wAw@sAm@aA_AwAqDmFKQKO}AaCQYk@_Ai@}@y@uAy@}Ae@}@i@iA_AwBs@cB}@_CSg@}@aCa@gAqAmDaAiCeAmCo@aBm@}AeBgEc@eAmBoEaBmDwBqEs@sAi@_Ak@aA{@qAaAwAk@w@gAqAo@w@o@q@y@w@g@e@{@w@o@k@cBsAqDyCqAiAYWWU[]}@aAm@s@k@u@k@y@i@{@w@uAy@aBa@_Ae@iA_@aA_@kAg@iBYiAS_AOu@UkAWmBOiAIq@YsDs@gJa@oEMw@Kw@Ig@UmAUeAYiAYiAUy@_@oAa@eAsAcDe@aA_@q@y@sAs@eAgAuAu@_A_AaAk@k@}@w@o@g@[UqAy@kAq@a@SUKWKu@WsAe@oAY}@UcASg@IyB]_@GgDk@k@K[Ie@Mm@SwAi@q@Y{@a@s@_@w@g@q@c@m@e@g@c@e@_@m@m@o@s@s@y@[_@SWYa@Yc@s@cAiAgBc@u@mByCk@}@gAaBw@iAOSkAeBw@kAkAeBkCuDmAaBeAwA{AoBgA}AcAwAy@gAo@{@k@y@Yc@[k@e@y@Ue@Ue@c@{@_AeCc@uAs@cCi@sB[sAYkAi@qB_@mAa@qAi@uA_@aAa@{@a@{@a@y@c@w@yAcCa@u@S[QYsAyBw@_BSa@Ug@o@_B_@cAk@iBa@wAS}@c@qBa@cC_@mCSmBIaAIsBGwBAk@Am@?uB?mA@gDDqC@aA?qA?kACgDGqBKyBQmBMyASyA[qBa@wBc@iB[mA_@iAUu@]}@q@iBu@kBy@mBiA_CoAcCaAeBuA{BcA{AaByBqBcCiBqB{ByByBgB_C}AeAm@mBcAwCuAqBu@aAWe@Mg@OoCs@wBi@i@MkD_A_@Mq@Uo@UsAg@WMwAq@gB}@qCiBg@]iB{Aq@i@gAcAaAaA{AcB{@cAW_@u@aAkAiB}@_Bw@wAkAaCiAeCgA{C}@gCaAcD}@aDaAgDo@mB_@kAUo@w@gBYg@_AkBmAqBeCuDmAkBu@qAu@yAi@oA[u@]}@k@cBy@wC]uAa@sBSqAIq@OuAOgAIaAKsAe@kGU_DQsBSmBOqAWsBSyAaAiFOs@YgAo@sCEQSs@G[sByHg@oBm@kCk@wC[qBQeAUeBQ}AWyBQwBIcBM}BGyCGkDCyBEeEGwHGuEOsHMmEGwBIuBQoC[_FUoC]iDYuCo@cF_@yCe@iDs@sEeAoG{AoIkB{IqA{FmCmKaAkDsAsEgAqDgBkFkAiDqAgDaAiCcBeEiCkGyAmDiDuH{A}CyEuJeBeDw@iBu@cBOa@e@kAiAmDi@gBe@cB[oAc@iBUkAYsAW}Aw@{Eg@iEm@mFYmBc@qCYeB_@oB]aBu@aDe@_Bm@{Bs@sBaBaEiByDeB_D}@wAS]U[i@w@k@u@y@aAq@w@gAmAs@y@cAcAo@q@gAeAeAgAc@[_@Yg@]}AiA}AoAy@i@{B_BwA_Ay@e@SMoAu@y@c@[SsBeAu@_@qBcAkCoAw@a@uB_AmCqAiCmAyAs@cBy@iCoAwAu@qAq@mAo@]Su@a@qBeAwBmAmAw@qBoAoAw@iAs@}@m@iBmAw@m@sA}@uAeAoFkEcEgD{A{AgCmCq@o@EGc@c@WWEESSuA{AkBwBoCiDeCqDgBmCyAiCQYiAmBmAoCq@}AiAwCGWCGK_@uAkEaAsDo@iD]iBO_AWeBm@oFWgDc@eJGcA?EG}@MsD[sHKiAU_CG[[wBUeAUiA]_BKg@Ss@k@gBQg@Oe@Ys@i@mA}A_DCIMS]m@mHgL{EmI{@iBa@{@sAqC]w@mAaDaBwEwCmJ{@uCmBaHqAoEuD_K_D}HqDyHkC_FeDoFqB}CyAuBOQAAOUwAmByAiBqB_CmAqAiBiBiBeBaCaC][}BqByBoB{BuB}BsBeBeBsCaDaBuBu@eAeBgCsAwBcAgBw@wAe@_AIQ?AKSgDeH_HqOcD_HsAmCgBgDqAuB_A}AqAsBKMkAaBgA}A_BuB}AoBaBkBoBuBeCgCqBmB_A{@mB_B}BiByBeB_As@{AmAgM}JuBgBqHqGc@_@e@a@oBkBsDqDiCkCcBkByBgCiC}Cg@o@cBwBcAqAm@y@yAsBU[cAwAcCsDaA}AeBqCqC_FWe@y@{A_@u@}BkE]q@g@_AEIKUoBaEqBkEqAsCkAkCcCsFy@iBWi@c@cAWk@a@}@e@gAc@_AgBcEaAsBu@}Aw@cBc@}@i@gAo@qAq@sAg@}@y@aB}AmCi@_Ai@_A{@yAaA{Ai@{@cAwAc@k@g@q@[a@{@cAm@s@]_@_@a@yAyAiAgA_Ay@eA{@gA{@}@s@mA}@yEcDsBwAk@e@s@i@{@q@}@{@aA}@c@c@]_@_@c@o@u@c@e@c@k@a@i@a@g@c@o@i@w@_@m@We@g@{@i@cA{@eBe@cAWk@_@{@[{@c@oAWu@Sq@Uu@YaA[oAe@mBYkAa@oBo@yCw@kDg@wBc@cB[mA[gAYgAY}@e@_Bm@kB}@eC_@aA_@{@k@sAm@sA}@kBcAoBkAuBc@s@[g@g@w@k@w@OWW]m@y@_@g@g@o@{@eAeAiAa@e@a@a@aAeA_BaBu@u@uAwAiAkAk@m@m@q@_@c@c@k@a@g@s@cA_@k@_@m@]m@k@cAS_@e@}@Yk@Wm@e@iAUk@]}@[aASo@Uu@Qq@c@cB[{AOw@QcASgAW_BYsBe@iDe@_DU_BOcA]oBOy@Kq@U}AIe@Ia@[{AYsA[uAa@wAqAkEuBiGy@}B_BsEo@kBk@gBa@qA]gA_@sAYcA[kAWiAQw@Ou@[aBYwAY}AOeAOeAKo@a@_DQmAUwBMuAKoAW_DEu@AO?MCg@Ca@Eq@G{AEsAQwKEeIAuHI}FEkBG}AQsCGoAEq@IiAKyAU_CSqBi@cEe@{CAGQqA{@iFaAaG[uBQqAOsAKmAC_@Cs@I{ACcACk@CsA?_C@}ADqA@c@Do@@[@UDe@NwBXcCHm@V{Aj@_DXgBz@wFVqBPiBFcANiCDeC@g@?_CAsAA}@CmACcAEqAMeEE{AG_D?_A?_ABcBDiADiAFqADk@J}@VsBZkBx@eFV{AFa@NkANmAFg@p@kFn@iF^mDRyBPcBBc@FcABc@Dg@H_CDiB@{@BsA@eA?uAAcAAuCCyBCmAIeCSkFGcAo@q"
                     },
                     "start_location" => %{"lat" => 42.3341226, "lng" => -3.6241091},
                     "travel_mode" => "DRIVING"
                   },
                   %{
                     "distance" => %{"text" => "5.5 km", "value" => 5542},
                     "duration" => %{"text" => "4 mins", "value" => 227},
                     "end_location" => %{
                       "lat" => 42.72354869999999,
                       "lng" => -2.8662827
                     },
                     "html_instructions" =>
                       "Keep <b>left</b> to stay on <b>AP-1</b><div style=\"font-size:0.9em\">Toll road</div>",
                     "maneuver" => "keep-left",
                     "polyline" => %{
                       "points" =>
                         "opscGtpxPCm@Ae@Cq@GyCSsFG}AMeCKgB[gEQcCYyCMoAUwBa@aDa@sC_@kCG]q@gEq@wDg@qC]oBi@mCAIAEAEI_@CQG[Mq@w@iEg@yCIg@u@cFOcAIw@W{B[mDSkCIwAGkAGwAG}AGkCCgAAy@A{AAiB@sB@}ABeBBuAHcCBcAFaAJ_CDc@Bc@NuBL_Bt@qHNwAN_BPeBFk@JkAHkAFqAHuADaA@o@BqA?wA?mAAg@A[?YCmAE}@Co@O{BMwAQwASaBOcAScAScAMg@Kg@U{@Mi@Oc@Qm@Si@Us@Yu@Qa@]y@Sa@MYu@wAe@w@c@u@o@}@_@i@c@i@WYW[s@u@i@i@k@i@YUWSe@_@u@k@oA}@oA{@mAy@w@c@ACoAo@y@a@s@Y_@OMCSEYG[CQCOA]A]?s@Da@DSDYFQFSDA@_@J_@JSFKBq@LUBY@c@Cs@ISCMEUEUEgBUwADSAa@?cAMuAUUE[CwDu@gEs@eAQq@I[CYAm@Ac@?C?K?S@eAJ"
                     },
                     "start_location" => %{}
                   },
                   %{
                     "distance" => %{"text" => "24.6 km", "value" => 24638},
                     "duration" => %{"text" => "14 mins", "value" => 829},
                     "end_location" => %{"lat" => 42.8804105, "lng" => -2.6997749},
                     "html_instructions" =>
                       "Take the exit on the <b>left</b> onto <b>E-5</b>/<b>E-80</b>/<b>A-1</b> toward <b>Vitoria</b>/<b>Gasteiz</b>/<b>Francia</b><div style=\"font-size:0.9em\">Partial toll road</div>",
                     "maneuver" => "ramp-left",
                     "polyline" => %{}
                   },
                   %{
                     "distance" => %{"text" => "0.2 km", "value" => 206},
                     "duration" => %{"text" => "1 min", "value" => 15},
                     "end_location" => %{"lat" => 42.8801261, "lng" => -2.69729},
                     "html_instructions" =>
                       "Take exit <b>352</b> for <b>E-5</b>/<b>E-80</b>/<b>N-622</b> toward <b>Vitoria</b>/<b>Gasteiz</b>/<b>Aireportua</b>/<b>AP-68</b>/<b>Bilbao</b>/<b>AP-1</b>/<b>Donostia</b>/<b>S.Sebastiàn</b>",
                     "maneuver" => "ramp-right"
                   },
                   %{
                     "distance" => %{"text" => "0.3 km", "value" => 266},
                     "duration" => %{"text" => "1 min", "value" => 20},
                     "end_location" => %{"lat" => 42.8803032},
                     "html_instructions" =>
                       "Keep <b>left</b> at the fork to continue toward <b>E-5</b>/<b>N-622</b>/<b>E-80</b>"
                   },
                   %{
                     "distance" => %{"text" => "1.8 km", "value" => 1787},
                     "duration" => %{"text" => "2 mins"},
                     "end_location" => %{}
                   },
                   %{
                     "distance" => %{"text" => "0.3 km"},
                     "duration" => %{}
                   },
                   %{"distance" => %{}},
                   %{}
                 ],
                 "traffic_speed_entry" => [],
                 "via_waypoint" => []
               }
             ],
             "overview_polyline" => %{
               "points" =>
                 "a}ikFf_xv@umFzoAy~OydK_{b@afXyuMagDeeJq|M{_SwoXawPifPuhRcn@_jC}yB|_A{eHchBgoPu\\ux^}Ssjh@ytHsol@}uDqbOqbMc|FqaRsiSctYqg\\_pSq~Dy~P`_Cw__@xHgaTom]qiYkwLs`L_oFspGgyMi_Cqmn@`tC}r_@niA}g_@csLm~RwgYeng@ydXo`kAgpPivi@kdJ_pSyfJakIipFopEyqAi}LkhMqgOac]e}]goPeqSusDuaDw_BaeRurQslWofI}kFibf@w{g@qbKgsHwvIgiQymLkj_@w`Lw}Rmm\\wxo@}xGcwh@}`Sk~^mf^itr@aoKkm`@kiIabUabDcdOggNeyLs_Ma{QqxAkFg|DaqI_aO{oOkzLkkUclYymF{~GiyDceDqiDpnBk}Huy@qwHeUmdKo`@if]hh@anMieDwiMohGac`@}zPoj\\eiD_nPuhI{eFqtVykKs{FobRcyBgcIm~M_kB_}UsfNyoOukOkdRy{Gkz_A_ac@oxe@~`E_|Ww`YejHeaPtj@a|LmhIu`Jy_M}p@}bQu_L_b\\~kI}~h@`xSivVzgEusXyjBatUzwJwaPq|@mySs|LyxX{oGufOav@c}Ma|L{rPcxQ_vYei|@mrKaf]ccGgl]{aMevN_pOuhDinP_bZgdTaeAmzw@ewWuai@imMcoJupGo{E}pQapJgk`@_fJ}zd@qQopUi}F_vGcwQyt_@smXorf@ypAwnPsmJgq@qxc@qMu{`@wo@klb@iqGs}H{eD{~EkmSqfOud^sjG{bQapMalIciPcrSer\\omPqwLqeAqtKqoHsvRe_QgyZgMowg@q`KcfbAiyRayKwaFgjEo~LqiPyz`@mh`@muv@wnBa`Z{mSafVk|@qd_@mqDcgR{`B{|c@xeC_xrA_wIm_`BgqK{~p@orM_`e@{wBuwUd~EeuOnkBowU{aAcu\\glMeh[{tLk}G_rE_zJuu@snS{kFimq@kuIkq^|DupPquGoX}hLelYc{Lay]{qJybQgjHm_BseD|kCqkDauCkzK_fMahU_~h@atK}gUgqKk{BcyC}gH{cC{eXqyIiyRu}MefHuaGkiQ_mKskr@uxFonXc`LwkVu}Mi{GmoN{iOyxIoxOcvD}kOskA}rTbb@sh\\eqIev]i|Vaz]ywEw`p@pcMqexAnqG}cyBlaSsf`AziCoyx@Een`@kyEgaPslAki_AyjGgjkAscIerMkgCscSpiAc_f@dcHeyT}zAk{`@wrZgwVywKcdNg^euPiLujD"
             },
             "summary" => "A10",
             "warnings" => [],
             "waypoint_order" => []
           }
         ],
         "status" => "OK"
       }}

    {:ok,
     %{
       "routes" => [
         %{
           "overview_polyline" => %{"points" => polyline},
           "legs" => [
             %{"distance" => %{"value" => distance_m}}
           ]
         }
       ]
     }} = api_response

    # {:ok,
    #  %{
    #    "routes" => [
    #      %{
    #        "overview_polyline" => %{"points" => polyline_lis_por},
    #        "legs" => [
    #          %{"distance" => %{"value" => distance_lis_por_m}}
    #        ]
    #      }
    #    ]
    #  }} = resp_lis_por
    # 
    # {:ok,
    #  %{
    #    "routes" => [
    #      %{
    #        "overview_polyline" => %{"points" => polyline_lis_ber},
    #        "legs" => [
    #          %{"distance" => %{"value" => distance_lis_ber_m}}
    #        ]
    #      }
    #    ]
    #  }} = resp_lis_ber

    distance_km = distance_m / 1000

    # points_lis_por = Polyline.decode(polyline_lis_por)
    # points_lis_ber = Polyline.decode(polyline_lis_ber)
    points = Polyline.decode(polyline)

    # IO.puts("=========== Lisboa - Porto count =============")
    # n_points_lis_por = Enum.count(points_lis_por)
    # IO.inspect(n_points_lis_por)
    # IO.puts("=========== Lisboa - Berlim count =============")
    # n_points_lis_ber = Enum.count(points_lis_ber)
    # IO.inspect(n_points_lis_ber)

    # distance_lis_por_km = distance_lis_por_m / 1000
    # distance_lis_ber_km = distance_lis_ber_m / 1000

    # {ratio, halvings} = best_points_km_ratio(n_points_lis_ber, distance_lis_ber_km)
    # IO.inspect({ratio, halvings})
    # {ratio, halving} = best_points_km_ratio(n_points_lis_por, distance_lis_por_km)
    # IO.inspect({ratio, halvings})

    {ratio, halvings} = best_points_km_ratio(Enum.count(points), distance_km)
    IO.inspect({ratio, halvings})

    # points_lis_por =
    #   points_lis_por
    #   |> Enum.drop_every(2)
    #   |> Enum.drop_every(2)
    #   |> Enum.drop_every(2)
    #   |> Enum.drop_every(2)
    #   |> Enum.drop_every(2)
    #   |> Enum.drop_every(2)

    points = remove_points(points, halvings)

    close_pois =
      get_close_pois(points)
      |> Enum.uniq()

    # Print coordinates
    IO.puts("=========================== POI's ===============================")
    Enum.each(close_pois, fn poi -> IO.puts("#{poi.longitude},#{poi.latitude}") end)

    # points_lis_ber =
    #   points_lis_ber
    #   |> Enum.drop_every(2)
    #   |> Enum.drop_every(2)
    #   |> Enum.drop_every(2)

    #   |> Enum.drop_every(2)

    IO.puts("=========================== Polyline points ===============================")

    Enum.each(points, fn {x, y} ->
      IO.puts("#{x},#{y}")
    end)

    close_pois
  end

  # Finds the number of halvings of the geo points list which makes the ratio points/distance closer to 0.010
  defp best_points_km_ratio(points, distance_km, acc \\ [])

  defp best_points_km_ratio(points, _distance_km, acc) when points <= 5 do
    # reversing, index corresponds to number of halvings

    Enum.reverse(acc)
    |> Enum.with_index()
    |> IO.inspect()
    |> Enum.min_by(fn {ratio, _index} -> abs(ratio - 0.010) end)
  end

  defp best_points_km_ratio(points, distance_km, acc) do
    ratio = points / distance_km
    acc = [ratio | acc]
    best_points_km_ratio(points / 2, distance_km, acc)
  end

  defp remove_points(points, halvings) when halvings === 0, do: points

  defp remove_points(points, halvings) do
    1..halvings
    |> Enum.reduce(points, fn _x, acc -> Enum.drop_every(acc, 2) end)
  end

  defp get_close_pois(points) do
    data = Indiecampers.App.Highlight.data()
    # Enum.reduce(points, [], fn {x1, y1}, acc1 ->
    #   Enum.reduce(data, [], fn {x2, y2}, acc2 ->
    #     if 
    #   end)
    # end)
    for {x1, y1} <- points,
        poi <- data,
        distance(x1, poi.longitude, y1, poi.latitude) <= 1.000,
        do: poi
  end

  defp distance(x1, x2, y1, y2) do
    :math.pow(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2), 0.5)
  end
end
