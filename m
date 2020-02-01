Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9DB14FAC1
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 22:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgBAVsj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 16:48:39 -0500
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:9475 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726514AbgBAVsj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Feb 2020 16:48:39 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 81A108C183F;
        Sat,  1 Feb 2020 21:48:37 +0000 (UTC)
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (100-96-9-5.trex.outbound.svc.cluster.local [100.96.9.5])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id DC56F8C1453;
        Sat,  1 Feb 2020 21:48:36 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a33.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Sat, 01 Feb 2020 21:48:37 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Hook-Trail: 1fc52fbc725d2804_1580593717327_2600534749
X-MC-Loop-Signature: 1580593717327:153827424
X-MC-Ingress-Time: 1580593717326
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTP id E5C977FE18;
        Sat,  1 Feb 2020 13:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        UM8mGLUrLh5Z+UGwCw0gzGsuDsQ=; b=MR7uTBATuh8/psOv6JBk6AsoYQTDn056
        w64k+S5HIicOIOQJL/pA0F9HAgQIx9V0QAXOCqOn+CdL2VSGbGZLbEEVZlQylCD3
        iRegN+FoOCO06F2MO+T4qc5lHRu5COos4MRI+c4Kzf96zjEoYJW9zRI9HqPIsmBt
        b7/2Jr4Jqt8=
Received: from localhost.localdomain (66-90-181-52.dyn.grandenetworks.net [66.90.181.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTPSA id 719727FE24;
        Sat,  1 Feb 2020 13:48:31 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a33
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 2/3] em28xx: Enable Hauppauge 461e rev2
Date:   Sat,  1 Feb 2020 15:48:25 -0600
Message-Id: <20200201214826.22873-3-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200201214826.22873-1-brad@nextdimension.cc>
References: <20200201214826.22873-1-brad@nextdimension.cc>
MIME-Version: 1.0
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 30
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrgedvgdduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqeenucfkphepieeirdeltddrudekuddrhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeeiiedrledtrddukedurdehvddprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggt
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hauppauge 461e rev2 is a DVB-S/S2 usb device containing:
- m88ds3103b demod
- ts2022 tuner
- A8293 SEC

Device is the same as Hauppauge 461e,
except it contains updated m88ds3103b demod.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 18 ++++++++
 drivers/media/usb/em28xx/em28xx-dvb.c   | 60 +++++++++++++++++++++++++
 drivers/media/usb/em28xx/em28xx.h       |  1 +
 3 files changed, 79 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/=
em28xx/em28xx-cards.c
index def9cdd931a9..a8c321d11827 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2397,6 +2397,20 @@ const struct em28xx_board em28xx_boards[] =3D {
 		.has_dvb       =3D 1,
 		.ir_codes      =3D RC_MAP_PINNACLE_PCTV_HD,
 	},
+	/*
+	 * 2013:0259 PCTV DVB-S2 Stick (461e_v2)
+	 * Empia EM28178, Montage M88DS3103b, Montage M88TS2022, Allegro A8293
+	 */
+	[EM28178_BOARD_PCTV_461E_V2] =3D {
+		.def_i2c_bus   =3D 1,
+		.i2c_speed     =3D EM28XX_I2C_CLK_WAIT_ENABLE |
+				 EM28XX_I2C_FREQ_400_KHZ,
+		.name          =3D "PCTV DVB-S2 Stick (461e v2)",
+		.tuner_type    =3D TUNER_ABSENT,
+		.tuner_gpio    =3D pctv_461e,
+		.has_dvb       =3D 1,
+		.ir_codes      =3D RC_MAP_PINNACLE_PCTV_HD,
+	},
 	/*
 	 * 2013:025f PCTV tripleStick (292e).
 	 * Empia EM28178, Silicon Labs Si2168, Silicon Labs Si2157
@@ -2696,6 +2710,10 @@ struct usb_device_id em28xx_id_table[] =3D {
 			.driver_info =3D EM2765_BOARD_SPEEDLINK_VAD_LAPLACE },
 	{ USB_DEVICE(0x2013, 0x0258),
 			.driver_info =3D EM28178_BOARD_PCTV_461E },
+	{ USB_DEVICE(0x2013, 0x0461),
+			.driver_info =3D EM28178_BOARD_PCTV_461E_V2 },
+	{ USB_DEVICE(0x2013, 0x0259),
+			.driver_info =3D EM28178_BOARD_PCTV_461E_V2 },
 	{ USB_DEVICE(0x2013, 0x025f),
 			.driver_info =3D EM28178_BOARD_PCTV_292E },
 	{ USB_DEVICE(0x2013, 0x0264), /* Hauppauge WinTV-soloHD 292e SE */
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em=
28xx/em28xx-dvb.c
index 0ab6c493bc74..fb9cbfa81a84 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -1219,6 +1219,61 @@ static int em28178_dvb_init_pctv_461e(struct em28x=
x *dev)
 	return 0;
 }
=20
+static int em28178_dvb_init_pctv_461e_v2(struct em28xx *dev)
+{
+	struct em28xx_dvb *dvb =3D dev->dvb;
+	struct i2c_adapter *i2c_adapter;
+	struct m88ds3103_platform_data m88ds3103_pdata =3D {};
+	struct ts2020_config ts2020_config =3D {};
+	struct a8293_platform_data a8293_pdata =3D {};
+
+	/* attach demod */
+	m88ds3103_pdata.clk =3D 27000000;
+	m88ds3103_pdata.i2c_wr_max =3D 33;
+	m88ds3103_pdata.ts_mode =3D M88DS3103_TS_PARALLEL;
+	m88ds3103_pdata.ts_clk =3D 16000;
+	m88ds3103_pdata.ts_clk_pol =3D 0;
+	m88ds3103_pdata.agc =3D 0x99;
+	m88ds3103_pdata.agc_inv =3D 0;
+	m88ds3103_pdata.spec_inv =3D 0;
+	dvb->i2c_client_demod =3D dvb_module_probe("m88ds3103", "m88ds3103b",
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 0x6a, &m88ds3103_pdata);
+
+	if (!dvb->i2c_client_demod)
+		return -ENODEV;
+
+	dvb->fe[0] =3D m88ds3103_pdata.get_dvb_frontend(dvb->i2c_client_demod);
+	i2c_adapter =3D m88ds3103_pdata.get_i2c_adapter(dvb->i2c_client_demod);
+
+	/* attach tuner */
+	ts2020_config.fe =3D dvb->fe[0];
+	dvb->i2c_client_tuner =3D dvb_module_probe("ts2020", "ts2022",
+						 i2c_adapter,
+						 0x60, &ts2020_config);
+	if (!dvb->i2c_client_tuner) {
+		dvb_module_release(dvb->i2c_client_demod);
+		return -ENODEV;
+	}
+
+	/* delegate signal strength measurement to tuner */
+	dvb->fe[0]->ops.read_signal_strength =3D
+			dvb->fe[0]->ops.tuner_ops.get_rf_strength;
+
+	/* attach SEC */
+	a8293_pdata.dvb_frontend =3D dvb->fe[0];
+	dvb->i2c_client_sec =3D dvb_module_probe("a8293", NULL,
+					       &dev->i2c_adap[dev->def_i2c_bus],
+					       0x08, &a8293_pdata);
+	if (!dvb->i2c_client_sec) {
+		dvb_module_release(dvb->i2c_client_tuner);
+		dvb_module_release(dvb->i2c_client_demod);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int em28178_dvb_init_pctv_292e(struct em28xx *dev)
 {
 	struct em28xx_dvb *dvb =3D dev->dvb;
@@ -1860,6 +1915,11 @@ static int em28xx_dvb_init(struct em28xx *dev)
 		if (result)
 			goto out_free;
 		break;
+	case EM28178_BOARD_PCTV_461E_V2:
+		result =3D em28178_dvb_init_pctv_461e_v2(dev);
+		if (result)
+			goto out_free;
+		break;
 	case EM28178_BOARD_PCTV_292E:
 		result =3D em28178_dvb_init_pctv_292e(dev);
 		if (result)
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx=
/em28xx.h
index 4ecadd57dac7..acbb62397314 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -150,6 +150,7 @@
 #define EM2884_BOARD_TERRATEC_H6		  101
 #define EM2882_BOARD_ZOLID_HYBRID_TV_STICK		102
 #define EM2861_BOARD_MAGIX_VIDEOWANDLER2          103
+#define EM28178_BOARD_PCTV_461E_V2                104
=20
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
--=20
2.23.0

