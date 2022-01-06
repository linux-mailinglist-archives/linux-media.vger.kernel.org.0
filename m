Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8E3486D67
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 23:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245283AbiAFWwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 17:52:54 -0500
Received: from mout.gmx.net ([212.227.17.22]:43707 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245250AbiAFWwx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 17:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641509569;
        bh=OFJIwTYCdIIXZtQINVCM1irJhNraFWh3Qx/pLhuoMlo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NsXsA0/BuAfX5G5E11pqWJkr7GLwNOWn2y7CSiVZyg/2YFxIZ5GQFijAZjvoRjWs8
         9EYt7fJrd9dLNabRbztRvHLseoHE363URzIfK4A19qaAYHV2hJ/5qFEVNnUH9xVTm1
         98lHG4X5c8B5aGRFKRXZGi8LtgI+mp+weP8kN4q0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap68.server.lan [172.19.172.68]) (via HTTP); Thu, 6 Jan 2022
 23:52:49 +0100
MIME-Version: 1.0
Message-ID: <trinity-fd7dd9e4-c319-4761-89b6-555fa7b23776-1641509569422@3c-app-gmx-bap68>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 3/3] media: si2157: add support for DVB-C Annex C
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 6 Jan 2022 23:52:49 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:zZML3Fv1pUO8KwmKzCCpStxV1uwCQgnZehFoq24QiEPXxk3HpEPEpX5E+uvV3h6sMk8EF
 PoNJyIvm9qcjvZCBXZU20HL8ZIV+Xv6j33JPY0G1yVh81R7iUA1UYhpwl9InTb6QUGq8hetdRoA0
 UM/RRjrau7YabM1TtJH/0ciLkxoIVGbj0PZ2CYEEhvgwEdF5jJ1Yg1sA6B0mBei4hcvrzZ3PcCLi
 pCF1Dst59xJJLKhM9SIvFkpycRzrgZbHG4p23dK0wQkvIF6Y0QWbzSSXrB243sPHvMuh4/ytOCyB
 7U=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VJWNVLw/3qs=:8szHsvz8c1EDKAr7d1v5Sm
 Uu9tHvpZsOPsQg8H1onnB6Mwxs6FfQrwukR00+exozaJQNm+2MSzy5R8LHPSkAPXBhnM0Nngr
 57y9SCPmGRvWyNdiyyfS1U5oKaLzjxRFyY/TDpku2gifXK4n4PtmKDBDwDH25JJOnaWCSvih/
 xomBwCSy8f5IFEWfDNTSqjT7lFIQOOVYj/OHI0NPouFHJqW13MzaH45LK21gIoLbPtOzr25D9
 THdbbnjD17iP7nEPRQRpUHlXmMIXohFb2yOkmqIhFFsX7RreiIzbb5poB9xtzC5sAIoDhC3o1
 b/cv35UM0H48pQdhazo6QMLGJr00QyR5k8N8ty3lvs7ubianxHhh7IYj4kyfUs2yxBtKLKWQD
 PtCog96R+RTDn0T3fSXkMv+e4ud2o20Hlg49LscneGtVW5J45LSq1CfOflVRSMkNE7NTxKNM+
 Odt4o9n5WZTFJJ3FiO+uuUmdlz1Av3n4gV5nPgSGfp0uQLSOWzPG39G0tTm1rHqfYrN6uqxL2
 54TBJHrl/oHwOdxy+McdD5kDsD1fLrOb1RT/3uExwzvWWxJtj7d0LZ4fRcj4l+ROqO2SW9jHq
 wPEDAmdIp+XmOFX0lt/XTwoyo+YLMxp1hV2Q7D7wqgQySCDH3FWkLq7QoHYeC3l4HHsP6T3k7
 +ScicnF53p++wPS3hjf0M5WeS8tgdhdJflejC3RDehzUKBDfsdqsFVKe3SCwteJAbdzvZHRqb
 +bKDb0VrCF2CLZl654VvF0h2EMkumQc2BmatQ8uAP0Z8tjIZDwxFFGZ2CyO0XTqQiE9gPCjTm
 5XLgNoL
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DVB-C Annex C is mostly DVB-C Annex A with only minor differences, so
simply add it to the DVB-C Annex A switch case, so that tuning attempts
no longer result in -EINVAL.

Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
=2D--
 drivers/media/tuners/si2157.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index b1e00b635dbf..47029746b89e 100644
=2D-- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -490,6 +490,7 @@ static int si2157_set_params(struct dvb_frontend *fe)
 			delivery_system =3D 0x20;
 			break;
 	case SYS_DVBC_ANNEX_A:
+	case SYS_DVBC_ANNEX_C:
 			delivery_system =3D 0x30;
 			break;
 	case SYS_ISDBT:
=2D-
2.17.1
