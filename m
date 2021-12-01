Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBFF465825
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 22:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240310AbhLAVMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 16:12:06 -0500
Received: from mout.gmx.net ([212.227.17.20]:41523 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233009AbhLAVMF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Dec 2021 16:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638392923;
        bh=5kQT9sBIyqU6jfWmldbdSc8NEk1+FTFlNwnqT3U4Cdo=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=kp4ldW1zyNb0Os3jyWKFK3DRe3ta2bB4loBn+WUQH/LvQsOu+CLGpMd+tJsDDPUzm
         Avb4I5g+LkEoAtsFoNjYuH0/9cMqBa58XGRb3hQ9abYuNb1nh5CidSWiXIFh02Z/Sx
         4gpprgyFbKlZjHEwF6WbqfTdDFDZz1tjZS6c9DgM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Wed, 1 Dec 2021
 22:08:43 +0100
MIME-Version: 1.0
Message-ID: <trinity-2a86eb9d-6264-4387-95e1-ba7b79a4050f-1638392923493@3c-app-gmx-bap03>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: si2157: Fix "warm" tuner state detection
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 1 Dec 2021 22:08:43 +0100
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: V03:K1:O6fRweqshlttT1E67xOk2tPP/HmWKzYkFOk5BZLuGN8kHsFfOCCdsPmR3ekqv1u+Q7zUE
 qsKdGXvA2g5WPp9ns5PBOqGIzf04/sIPFnPgwxp3zYCip70oZgWZ9gmml4fXc8V0YGBWZ3D9F98n
 9ikaxWhVwiSAziYpq0kMiG2UQfgTYV0dQnbdYT/SJuZVXJxwQofkEOBsMkyX5aPDWeQI8uwlHECp
 TJ3NfdLi2fhQ5FkVsZs5BxOkFkXtEkY2Bal/gw07P4UnBp5svZiwrSTXk8WRdyjqDhYn5BrayGfO
 GM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2xoYazx2TUU=:PKVatfObfwvRiNiUjEHauM
 tYoy7ADzw7iqExR4fyQzB1Cg7+fLRjifSP9dFnsppQO/jZU9CV4+HBxd/XGnE6/5VD8nu7i4+
 Nz3/J8zM39wdYYOnWE2/NCg8aYi28LO/Q3WAHxyFNy3DHEMudDvKCs7R7mM0yfY5kEpu+WfT8
 E9v9hwWKT0B4/towHs9ZwnZ3RK5nxJtHLF43mvwzYnfPD7CW2EbyD7CAfyHVk2BU0D/uB935n
 tzekbE6pzufFtGn9okErQaY8G2Z8RwJoFodbTkduc3YuEaN3snADgiFOYAUsJqqeHNeWA8Dym
 8FbYjkjC8JoPmbRUq4i30V0DL9Ygnd5xcykfFfQJvbmOBR+rrmm1sh3ZjFctfVXCb1NI5qtzR
 lqQGHXmGrYzejnGWka5DHaK9Jd1AklS44c55cZpsVgqhEIjAZPxs+1F4mw4xohoLByB3p4xg1
 np99OOuifiBaLOBGpPscZ8dN4dXx1VuLxK5emye0GIwKqGNa42WdRc1/4FwXHQOL95YdOxi85
 uJosr4sdy0d9trO/dovCWgVNx/FK5Cl6G8rKehtdgvrmya4bM9Hj5hA4CZVGYKW+Lls3WBeKA
 7ASg00A47uc0aBjkjs2/WNAWgdLO+W0YQ82dVoVVLmWlOg2cHyaZCF/ONqBlC31DP4uJKZn6/
 CkEOlLVAlg8c2yYWwNBRlAst+oH9Tko897KAj/u0xnSDyyy9CZ9r2dxoDf1/6LM4iFtGE1L8+
 R7Fy0T1v5ER1UWR4a4Z4ZF78nCFBuuUo9bB0GFtOtwnnRDmAXEsYhhmx49783fEG1055iFhsh
 MtxOmFM
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit e955f959ac52 ("media: si2157: Better check for running tuner in
init") completely broke the "warm" tuner detection of the si2157 driver
due to a simple endian error: The Si2157 CRYSTAL_TRIM property code is
0x0402 and needs to be transmitted LSB first=2E However, it was inserted
MSB first, causing the warm detection to always fail and spam the kernel
log with tuner initialization messages each time the DVB frontend
device was closed and reopened:

[  312=2E215682] si2157 16-0060: found a 'Silicon Labs Si2157-A30'
[  312=2E264334] si2157 16-0060: firmware version: 3=2E0=2E5
[  342=2E248593] si2157 16-0060: found a 'Silicon Labs Si2157-A30'
[  342=2E295743] si2157 16-0060: firmware version: 3=2E0=2E5
[  372=2E328574] si2157 16-0060: found a 'Silicon Labs Si2157-A30'
[  372=2E385035] si2157 16-0060: firmware version: 3=2E0=2E5

Also, the reinitializations were observed disturb _other_ tuners on
multi-tuner cards such as the Hauppauge WinTV-QuadHD, leading to missed
or errored packets when one of the other DVB frontend devices on that
card was opened=2E

Fix the order of the property code bytes to make the warm detection work
again, also reducing the tuner initialization message in the kernel log
to once per power-on, as well as fixing the interference with other
tuners=2E

Fixes: e955f959ac52 ("media: si2157: Better check for running tuner in ini=
t")
Reported-by: Robert Schlabbach <robert_s@gmx=2Enet>
Signed-off-by: Robert Schlabbach <robert_s@gmx=2Enet>
---
 drivers/media/tuners/si2157=2Ec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/si2157=2Ec b/drivers/media/tuners/si2157=
=2Ec
index fefb2625f655=2E=2E75ddf7ed1faf 100644
--- a/drivers/media/tuners/si2157=2Ec
+++ b/drivers/media/tuners/si2157=2Ec
@@ -90,7 +90,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	dev_dbg(&client->dev, "\n");
=20
 	/* Try to get Xtal trim property, to verify tuner still running */
-	memcpy(cmd=2Eargs, "\x15\x00\x04\x02", 4);
+	memcpy(cmd=2Eargs, "\x15\x00\x02\x04", 4);
 	cmd=2Ewlen =3D 4;
 	cmd=2Erlen =3D 4;
 	ret =3D si2157_cmd_execute(client, &cmd);
--=20
2=2E17=2E1

=C2=A0
=C2=A0
