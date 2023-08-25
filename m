Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC4D787C8A
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 02:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234170AbjHYA0p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 20:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbjHYA02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 20:26:28 -0400
X-Greylist: delayed 101 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Aug 2023 17:26:25 PDT
Received: from smtp.bawue.net (relay01.mx.bawue.net [193.7.176.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D328172D
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 17:26:25 -0700 (PDT)
Received: from twin.GNUmatic.de (ip-005-146-193-090.um05.pools.vodafone-ip.de [5.146.193.90])
        (Authenticated sender: dirk@bawue.de)
        by smtp.bawue.net (Postfix) with ESMTPSA id F39242172D
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 02:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.bawue.net F39242172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bawue.net;
        s=default; t=1692923082;
        bh=YMLs9yBi9zZX086AeQnuLfSShSFhJQ/nzuF8frUrXwo=;
        h=Subject:From:Reply-To:To:Date:From;
        b=KfYns4noES1QPz7986P1mCMwX4MS18C6cnUVV/XledwXcR8TGPVhh1F4klHVJ0D3R
         2bNA0Dah47rdvm0g3QRSFxKigN8yp+74JO1FYGUN0EE4+YEDg+0cPjBJGF4i+T83rs
         UMm6HDX8bCfdShXikWYtDFugMgMKIAVli8ZIBmo0=
Message-ID: <3e7467c5674d372d5cc3b9aca38e3aedf24afdf7.camel@GNUmatic.de>
Subject: DVB-C Scanfiles - =?ISO-8859-1?Q?=C4nderung?= de-Kabel_BW ->
 de-Vodafone_BaWue
From:   Dirk Ritter <dirk@GNUmatic.de>
Reply-To: dirk@GNUmatic.de
To:     linux-media@vger.kernel.org
Date:   Fri, 25 Aug 2023 02:24:33 +0200
Content-Type: multipart/mixed; boundary="=-v4tdo8UCuaJvNcVorDQ9"
User-Agent: Evolution 3.49.2-3 
MIME-Version: 1.0
X-Virus-Scanner: SAV Dynamic Interface 2.6.0, Engine: 3.83.1, SAV: 5.89
        (42D360A6) on relay01.mx.bawue.net using milter-sssp 0.1.0
X-Virus-Scan: Found to be clean.
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=-v4tdo8UCuaJvNcVorDQ9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi! :-)

Irgendwie haben die mal wieder Frequenztetris gespielt,
Telefonie ist auf der urspr=C3=BCnglichen Einstiegsfrequenz
gelandet und Kabel-BW sowie Unitymedia sind Geschichte.

Daraus ergeben sich zwei W=C3=BCnsche:
- veraltete Datei "de-Kabel_BW" l=C3=B6schen
- neue Datei (s. Anlage) hinzuf=C3=BCgen als
  "/usr/share/dvb/dvb-c/de-Vodafone_BaWue"

Werte habe ich hier vorab manuell direkt im Scanfile angepasst
und getestet (C 330000000 6900000 NONE QAM256) und IMHO sollte
das dann mit der neuen Datei im neuen Format wieder tun...

Quelle:
https://helpdesk.vodafonekabelforum.de/sendb/belegung.html

Kleinnetze sind rein analog - IMHO nicht ausgebaute oder
einfach anders als z.B. Stuttgart belegte Netze (Umstellung
noch ausstehend?) haben auf der Einstiegsfrequenz immerhin
dieselben Werte (Horb z.B.) - sollten also ebenfalls einen
Scan liefern.

Prinzipiell m=C3=BCsste das ebensogut f=C3=BCr sehr viele andere Gebiete
von Vodafone laufen. M=C3=BCnchen z.B. verwendet die Frequenz exakt
so wie Stuttgart - Frankfurt z.B. ist zwar ganz anders belegt,
hat aber die ARD auf demselben Kanal mit identischen Werten.
Dresden z.B. sieht wiederum Stuttgart und M=C3=BCnchen sehr =C3=A4hnlich.
K=C3=B6nnte man ggf. mal durchsehen und dramatisch vereinfachen als
de_Vodafone?

Herzlichen Dank vorab!
Dirk Ritter

--=-v4tdo8UCuaJvNcVorDQ9
Content-Disposition: attachment; filename="de-Vodafone_BaWue"
Content-Type: text/plain; name="de-Vodafone_BaWue"; charset="UTF-8"
Content-Transfer-Encoding: base64

IyBWb2RhZm9uZSBCYWRlbi1Xw7xydHRlbWJlcmcsIFN0YW5kIDA4LzIwMjMKIwojIE51ciBlaW5l
IEFuZmFuZ3NmcmVxdWVueiBpc3Qgbm9ldGlnLCB1bSBkZW4gQmFsbCBpbnMKIyBSb2xsZW4genUg
YnJpbmdlbi4gUXVhc2kgYWxzIEVpbnN0aWVnc3B1bmt0IGZ1ZXIgZWluZQojIHVtZmFzc2VuZGUg
U3VjaGUuIEVzIGJlc3RlaHQga2VpbiBHcnVuZCwgc2ljaCB1bSBhbGwgZGllCiMgdmllbGVuIGFu
ZGVyZW4gRnJlcXVlbnplbiB1bmQgZGVyZW4gYWt0dWVsbCB2ZXJ3ZW5kZXRlCiMgUGFyYW1ldGVy
IHp1IGt1ZW1tZXJuIHVuZCBkaWVzZSBkYW5uIHdvbW9lZ2xpY2ggYXVjaAojIG5vY2ggYXVmIGVp
bmVtIGFrdHVlbGxlbiBTdGFuZCBoYWx0ZW4genUgd29sbGVuLiBCZWkgZGVyCiMgc2NoaWVyZW4g
QW56YWhsIGRlciBnZW51dHp0ZW4gRnJlcXVlbnplbiB3YWVyZSBkYXMgbnVyCiMgemVpdHJhdWJl
bmQgdW5kIGZlaGxlcmFuZmFlbGxpZy4uLiA7LSkKIwojIERpcmsgUml0dGVyIDxkaXJrQEdOVW1h
dGljLmRlPgojCiMgRGF0ZW5xdWVsbGU6CiMgaHR0cHM6Ly9oZWxwZGVzay52b2RhZm9uZWthYmVs
Zm9ydW0uZGUvc2VuZGIvYmVsZWd1bmcuaHRtbAojCltDSEFOTkVMXQoJREVMSVZFUllfU1lTVEVN
ID0gRFZCQy9BTk5FWF9BCglGUkVRVUVOQ1kgPSAzMzAwMDAwMDAKCVNZTUJPTF9SQVRFID0gNjkw
MDAwMAoJSU5ORVJfRkVDID0gTk9ORQoJTU9EVUxBVElPTiA9IFFBTS8yNTYKCUlOVkVSU0lPTiA9
IEFVVE8K


--=-v4tdo8UCuaJvNcVorDQ9--
