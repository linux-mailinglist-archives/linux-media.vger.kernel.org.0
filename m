Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C46748FC50
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 12:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbiAPLaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 06:30:10 -0500
Received: from mcv99outg.rz.uni-leipzig.de ([139.18.1.195]:50335 "EHLO
        mcv99outg.rz.uni-leipzig.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230451AbiAPLaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 06:30:10 -0500
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 Jan 2022 06:30:10 EST
Received: from mcv1outg.rz.uni-leipzig.de (mcv1outg.rz.uni-leipzig.de [139.18.1.193])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mcv99outg.rz.uni-leipzig.de (Postfix) with ESMTPS id 4JcCN323LHz11JJ
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 12:23:47 +0100 (CET)
Received: from v1.rz.uni-leipzig.de (v1.rz.uni-leipzig.de [139.18.1.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mcv1outg.rz.uni-leipzig.de (Postfix) with ESMTPS id 4JcCN21Dk5z11J9;
        Sun, 16 Jan 2022 12:23:46 +0100 (CET)
Received: from server1.rz.uni-leipzig.de (server1.rz.uni-leipzig.de [139.18.1.1])
        by v1.rz.uni-leipzig.de (Postfix) with ESMTPS id 28DD1205F2;
        Sun, 16 Jan 2022 12:23:46 +0100 (CET)
Received: from gg1.iat.uni-leipzig.de (gg1.iat.uni-leipzig.de [141.39.226.97])
        by server1.rz.uni-leipzig.de (Postfix) with ESMTPS id 5C03F94002;
        Sun, 16 Jan 2022 12:23:44 +0100 (CET)
Received: from gg1.iat.uni-leipzig.de (localhost [127.0.0.1])
        by gg1.iat.uni-leipzig.de (Postfix) with ESMTP id 54F76840798;
        Sun, 16 Jan 2022 12:23:44 +0100 (CET)
Received: (from localhost) by gg1.iat.uni-leipzig.de (MSCAN) id 6/gg1.iat.uni-leipzig.de/smtp-gw/mscan; Sun Jan 16 12:23:44
     2022
From:   Michael Bunk <micha@freedict.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     vasilyev@ispras.ru, crope@iki.fi, Michael Bunk <micha@freedict.org>
Subject: [PATCH 3/4] media: dw2102: Dont't list TT Cinergy S2 R4 twice
Date:   Sun, 16 Jan 2022 12:22:37 +0100
Message-Id: <20220116112238.74171-3-micha@freedict.org>
In-Reply-To: <20220116112238.74171-1-micha@freedict.org>
References: <20220116112238.74171-1-micha@freedict.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Score: 0.00
X-ExSBR-Direction: Incoming
X-Rspamd-UID: be3120
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

"modinfo dvb-usb-dw2102|grep 0105" returns two lines, because the module
reports this usb alias twice.

Remove one of them.

Signed-off-by: Michael Bunk <micha@freedict.org>
---
 drivers/media/usb/dvb-usb/dw2102.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-u=
sb/dw2102.c
index 60dd82f9dedc..165d72d6d712 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -1813,7 +1813,6 @@ enum dw2102_table_entry {
 	TECHNOTREND_S2_4600,
 	TEVII_S482_1,
 	TEVII_S482_2,
-	TERRATEC_CINERGY_S2_BOX,
 	TEVII_S662
 };
=20
@@ -1852,7 +1851,6 @@ static struct usb_device_id dw2102_table[] =3D {
 		USB_PID_TECHNOTREND_CONNECT_S2_4600)},
 	[TEVII_S482_1] =3D {USB_DEVICE(0x9022, 0xd483)},
 	[TEVII_S482_2] =3D {USB_DEVICE(0x9022, 0xd484)},
-	[TERRATEC_CINERGY_S2_BOX] =3D {USB_DEVICE(USB_VID_TERRATEC, 0x0105)},
 	[TEVII_S662] =3D {USB_DEVICE(0x9022, USB_PID_TEVII_S662)},
 	{ }
 };
@@ -2563,7 +2561,7 @@ static struct dvb_usb_device_properties tt_s2_4600_=
properties =3D {
 			{ NULL },
 		},
 		{ "Terratec Cinergy S2 USB BOX",
-			{ &dw2102_table[TERRATEC_CINERGY_S2_BOX], NULL },
+			{ &dw2102_table[TERRATEC_CINERGY_S2_R4], NULL },
 			{ NULL },
 		},
 		{ "TeVii S662",
--=20
2.34.1

