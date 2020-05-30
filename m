Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A83E1E92BE
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 19:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgE3RD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 13:03:57 -0400
Received: from sonic314-19.consmr.mail.ir2.yahoo.com ([77.238.177.145]:44624
        "EHLO sonic314-19.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728927AbgE3RD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 13:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1590858234; bh=sm1ZRy1d64uvGyKtwDb7/eusDnw9J2MqFhcXe+xnYPA=; h=Date:From:Reply-To:Subject:References:From:Subject; b=JGmqafIm0F2qBIHXfUO+7Ms+2woJM41SvDlCJKQjNKgR1xS9e5W/UNGrerL6Xq0fQUTPLuPMl5aP8yHu63BUES+ndOq94K9acMcTcoaqk0jPb25XdtRqulM/sr8Qo9MfMOzIKTAA/0AHEU/FqT9v3zJJptwlWZmExwzsNtHkRVN/xrHRD+frlBUU1kGmnbOMHtlQjT4gkar3m/tSxGoMyxqHaWx88tKfwCO571da0VmSLazg/BMD9d7lcQcnupGmhe+B6K/0fB8vHzkG0kUYCdusEC95Idyzh2nVzLdYsjb2H9uDPtXhNYuO/96mRXM2gyxpqMR9OfEjEdWR5bdnXg==
X-YMail-OSG: Gr2I2u0VM1naS0AxmvB8xroODvyNjoa6ZBdR8clUBvdLqpmpfnpHl5FAFGSF0rS
 tdPvjk4WcBX_BvLevXD2pkO.tu4hHWElsOSFuNqFe2mRN5uSxLgDsAWFTo0BGTpcYpdqfC4r6r.1
 ll10rTb6a6gMMFYaR31FG2Oi.4lb2cCNefoBhvVHy7KCL8KiSh1MOvtg92BbdkJvwP0wBw3QSm8H
 RAi.M1TYo4KZ6TFgp_vwCXWCNNfwjluBZdlGgWkBMgAl3dqdKJJBFGdPrqtsujaGgaK3jbCSizZF
 iTyAvezOXbExtD_4HkDNumS6o_4dp1gASv75TsrG3OGQPGRgwrxekNBnYRvISGmrUeNR0FyUZRol
 mxYilE6aTQ7RpgpkaNwRFE7RNgqGC.M4dkZ6BjsMNbJVHpm8lgMCH8bkAXemVn.kNrKEyvGQr6Hk
 dIVF0WBSOUr_BrczcVNxIrm3IhG9WPLXz_SzWz4vC6nDtRNIjPpd2qarAFv0crzPNwCv1uNoTTDq
 htAk_0vNwdikkV5Df9dRmzGF84Bl3i9HwUgsni88p5sGClATTW8tWnoDg72vNZ6jAUYJR5o_Qesh
 HFQ5R8RhlMLKMdkCp9kWyQoCiHapLOCwS3d.iYD_MEYj36O1PsF.xv6oSsu6aj5gVkMMtFrF6Scw
 nofjh48p3IuOYBX2T_pAW.AQqE7oZ_87gjyG4ziuDp2JOoO03z4kzfx1.VmdwegEnDrg4NtsYX3W
 4AIQ8eSAdwcipdb4QdOBYpEGubzkqxmolmF5Y8_2OjqVvQy9jE292FjHXMfLUF1bCzUvsUL5wjX1
 jJaJ0Bpe2TwDnx6kJMmkE9siz6tCR1RUqx5XD4m5FLHbIVVacf39t30Rt2JnLOtHZA6IJKfvYTmk
 u68UURmEX03Yp.fe_1EbZYlU3lMpS9LvZfflhlkDcsntwxHXtbbQFUGBlAxsGnkKwD8N8mQI8Kdb
 ckmkXRkyFR_cygrFiKm_2zVh7xwimhjlmgH9_gRYg2Akk7uxnTmVDUV.nb_ZFyAtZAimLqOAq7R0
 9XroAhkQr5i8TMmZxZL6AHSh1WY4_7l4kqhnyKRYgYBAe8RF7O6mwQ0w0UfM.f.ZF4kDOR_5n6V9
 eFKIXTcHakOr7AjyPG_SP4H6tpsWtVVHz8.EO55BrNWrFA3QgjpRMZNO2H6TJkx5iG_UcwdwtkEa
 Hkxkni9I6txCv5eJRSKFtAohY5tAfSNiXqvBG9A6nV_eqncTJmdXWaFxai3xHYJdVkjY8pPdFOJY
 d.CKVg0cr7G9987xmKFNAaTcUtSHUvvlNVpNA5crLEJEWTPwjXVLY9Y97c42AD_I3CREILr.1HPo
 hJArPRuYuDU97XlU-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ir2.yahoo.com with HTTP; Sat, 30 May 2020 17:03:54 +0000
Date:   Sat, 30 May 2020 17:03:53 +0000 (UTC)
From:   "Mrs. Mina A. Brunel" <mrs.minaabrunel209@gmail.com>
Reply-To: mrs.minaabrunel30@gmail.com
Message-ID: <1360024901.374858.1590858233798@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1360024901.374858.1590858233798.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16037 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



My=C2=A0Dear=C2=A0in=C2=A0the=C2=A0lord


My=C2=A0name=C2=A0is=C2=A0Mrs.=C2=A0Mina=C2=A0A.=C2=A0Brunel=C2=A0I=C2=A0am=
=C2=A0a=C2=A0Norway=C2=A0Citizen=C2=A0who=C2=A0is=C2=A0living=C2=A0in=C2=A0=
Burkina=C2=A0Faso,=C2=A0I=C2=A0am=C2=A0married=C2=A0to=C2=A0Mr.=C2=A0Brunel=
=C2=A0Patrice,=C2=A0a=C2=A0politician=C2=A0who=C2=A0owns=C2=A0a=C2=A0small=
=C2=A0gold=C2=A0company=C2=A0in=C2=A0Burkina=C2=A0Faso;=C2=A0He=C2=A0died=
=C2=A0of=C2=A0Leprosy=C2=A0and=C2=A0Radesyge,=C2=A0in=C2=A0the=C2=A0year=C2=
=A0February=C2=A02010,=C2=A0During=C2=A0his=C2=A0lifetime=C2=A0he=C2=A0depo=
sited=C2=A0the=C2=A0sum=C2=A0of=C2=A0=E2=82=AC=C2=A08.5=C2=A0Million=C2=A0E=
uro)=C2=A0Eight=C2=A0million,=C2=A0Five=C2=A0hundred=C2=A0thousand=C2=A0Eur=
os=C2=A0in=C2=A0a=C2=A0bank=C2=A0in=C2=A0Ouagadougou=C2=A0the=C2=A0capital=
=C2=A0city=C2=A0of=C2=A0Burkina=C2=A0Faso=C2=A0in=C2=A0West=C2=A0Africa.=C2=
=A0The=C2=A0money=C2=A0was=C2=A0from=C2=A0the=C2=A0sale=C2=A0of=C2=A0his=C2=
=A0company=C2=A0and=C2=A0death=C2=A0benefits=C2=A0payment=C2=A0and=C2=A0ent=
itlements=C2=A0of=C2=A0my=C2=A0deceased=C2=A0husband=C2=A0by=C2=A0his=C2=A0=
company.

I=C2=A0am=C2=A0sending=C2=A0you=C2=A0this=C2=A0message=C2=A0with=C2=A0heavy=
=C2=A0tears=C2=A0in=C2=A0my=C2=A0eyes=C2=A0and=C2=A0great=C2=A0sorrow=C2=A0=
in=C2=A0my=C2=A0heart,=C2=A0and=C2=A0also=C2=A0praying=C2=A0that=C2=A0it=C2=
=A0will=C2=A0reach=C2=A0you=C2=A0in=C2=A0good=C2=A0health=C2=A0because=C2=
=A0I=C2=A0am=C2=A0not=C2=A0in=C2=A0good=C2=A0health,=C2=A0I=C2=A0sleep=C2=
=A0every=C2=A0night=C2=A0without=C2=A0knowing=C2=A0if=C2=A0I=C2=A0may=C2=A0=
be=C2=A0alive=C2=A0to=C2=A0see=C2=A0the=C2=A0next=C2=A0day.=C2=A0I=C2=A0am=
=C2=A0suffering=C2=A0from=C2=A0long=C2=A0time=C2=A0cancer=C2=A0and=C2=A0pre=
sently=C2=A0I=C2=A0am=C2=A0partially=C2=A0suffering=C2=A0from=C2=A0Leprosy,=
=C2=A0which=C2=A0has=C2=A0become=C2=A0difficult=C2=A0for=C2=A0me=C2=A0to=C2=
=A0move=C2=A0around.=C2=A0I=C2=A0was=C2=A0married=C2=A0to=C2=A0my=C2=A0late=
=C2=A0husband=C2=A0for=C2=A0more=C2=A0than=C2=A06=C2=A0years=C2=A0without=
=C2=A0having=C2=A0a=C2=A0child=C2=A0and=C2=A0my=C2=A0doctor=C2=A0confided=
=C2=A0that=C2=A0I=C2=A0have=C2=A0less=C2=A0chance=C2=A0to=C2=A0live,=C2=A0h=
aving=C2=A0to=C2=A0know=C2=A0when=C2=A0the=C2=A0cup=C2=A0of=C2=A0death=C2=
=A0will=C2=A0come,=C2=A0I=C2=A0decided=C2=A0to=C2=A0contact=C2=A0you=C2=A0t=
o=C2=A0claim=C2=A0the=C2=A0fund=C2=A0since=C2=A0I=C2=A0don't=C2=A0have=C2=
=A0any=C2=A0relation=C2=A0I=C2=A0grew=C2=A0up=C2=A0from=C2=A0an=C2=A0orphan=
age=C2=A0home.

I=C2=A0have=C2=A0decided=C2=A0to=C2=A0donate=C2=A0this=C2=A0money=C2=A0for=
=C2=A0the=C2=A0support=C2=A0of=C2=A0helping=C2=A0Motherless=C2=A0babies/Les=
s=C2=A0privileged/Widows=C2=A0and=C2=A0churches=C2=A0also=C2=A0to=C2=A0buil=
d=C2=A0the=C2=A0house=C2=A0of=C2=A0God=C2=A0because=C2=A0I=C2=A0am=C2=A0dyi=
ng=C2=A0and=C2=A0diagnosed=C2=A0with=C2=A0cancer=C2=A0for=C2=A0about=C2=A03=
=C2=A0years=C2=A0ago.=C2=A0I=C2=A0have=C2=A0decided=C2=A0to=C2=A0donate=C2=
=A0from=C2=A0what=C2=A0I=C2=A0have=C2=A0inherited=C2=A0from=C2=A0my=C2=A0la=
te=C2=A0husband=C2=A0to=C2=A0you=C2=A0for=C2=A0the=C2=A0good=C2=A0work=C2=
=A0of=C2=A0Almighty=C2=A0God;=C2=A0I=C2=A0will=C2=A0be=C2=A0going=C2=A0in=
=C2=A0for=C2=A0an=C2=A0operation=C2=A0surgery=C2=A0soon.

Now=C2=A0I=C2=A0want=C2=A0you=C2=A0to=C2=A0stand=C2=A0as=C2=A0my=C2=A0next=
=C2=A0of=C2=A0kin=C2=A0to=C2=A0claim=C2=A0the=C2=A0funds=C2=A0for=C2=A0char=
ity=C2=A0purposes.=C2=A0Because=C2=A0of=C2=A0this=C2=A0money=C2=A0remains=
=C2=A0unclaimed=C2=A0after=C2=A0my=C2=A0death,=C2=A0the=C2=A0bank=C2=A0exec=
utives=C2=A0or=C2=A0the=C2=A0government=C2=A0will=C2=A0take=C2=A0the=C2=A0m=
oney=C2=A0as=C2=A0unclaimed=C2=A0fund=C2=A0and=C2=A0maybe=C2=A0use=C2=A0it=
=C2=A0for=C2=A0selfishness=C2=A0and=C2=A0worthless=C2=A0ventures,=C2=A0I=C2=
=A0need=C2=A0a=C2=A0very=C2=A0honest=C2=A0person=C2=A0who=C2=A0can=C2=A0cla=
im=C2=A0this=C2=A0money=C2=A0and=C2=A0use=C2=A0it=C2=A0for=C2=A0Charity=C2=
=A0works,=C2=A0for=C2=A0orphanages,=C2=A0widows=C2=A0and=C2=A0also=C2=A0bui=
ld=C2=A0schools=C2=A0and=C2=A0churches=C2=A0for=C2=A0less=C2=A0privilege=C2=
=A0that=C2=A0will=C2=A0be=C2=A0named=C2=A0after=C2=A0my=C2=A0late=C2=A0husb=
and=C2=A0and=C2=A0my=C2=A0name.

I=C2=A0need=C2=A0your=C2=A0urgent=C2=A0answer=C2=A0to=C2=A0know=C2=A0if=C2=
=A0you=C2=A0will=C2=A0be=C2=A0able=C2=A0to=C2=A0execute=C2=A0this=C2=A0proj=
ect,=C2=A0and=C2=A0I=C2=A0will=C2=A0give=C2=A0you=C2=A0more=C2=A0informatio=
n=C2=A0on=C2=A0how=C2=A0the=C2=A0fund=C2=A0will=C2=A0be=C2=A0transferred=C2=
=A0to=C2=A0your=C2=A0bank=C2=A0account=C2=A0or=C2=A0online=C2=A0banking.

Thanks
Mrs.=C2=A0Mina=C2=A0A.=C2=A0Brunel
