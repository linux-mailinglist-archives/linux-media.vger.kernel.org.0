Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 784A3365F9
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfFEUuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:50:17 -0400
Received: from beetle.apple.relay.mailchannels.net ([23.83.208.15]:58493 "EHLO
        beetle.apple.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbfFEUuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 16:50:17 -0400
X-Greylist: delayed 313 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Jun 2019 16:50:14 EDT
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 55B4D2C2611;
        Wed,  5 Jun 2019 20:45:00 +0000 (UTC)
Received: from pdx1-sub0-mail-a45.g.dreamhost.com (100-96-88-48.trex.outbound.svc.cluster.local [100.96.88.48])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id ABC652C25F8;
        Wed,  5 Jun 2019 20:44:59 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a45.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.2);
        Wed, 05 Jun 2019 20:45:00 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Language-Hook: 2fea32c766521f98_1559767500240_996814490
X-MC-Loop-Signature: 1559767500240:3684791811
X-MC-Ingress-Time: 1559767500240
Received: from pdx1-sub0-mail-a45.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a45.g.dreamhost.com (Postfix) with ESMTP id 22F7D80833;
        Wed,  5 Jun 2019 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        hM/9S3uA2U40+Ma9CVuNMVR3CgU=; b=VItr+C42WME0YbT8WGC6SvPNMZK/7qq0
        CltSIgRfvHaASrNDU5HmGfi8nDZnhdO8OpW98VF72+3k8m4J4vNCzJUR6hISEBoE
        uDMZqe5jkJZFP/zhQCDd9YlEocba1yhn0YXdVkTw8EFjqFqFgZycJ0ePiZyzyl3k
        Svc9YkLKjcY=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a45.g.dreamhost.com (Postfix) with ESMTPSA id F3D4C8074A;
        Wed,  5 Jun 2019 13:44:57 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a45
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, sean@mess.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v7 4/4] pvrusb2: Add Hauppauge HVR1955/1975 devices
Date:   Wed,  5 Jun 2019 15:44:27 -0500
Message-Id: <20190605204427.28333-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <1559326785-26574-5-git-send-email-brad@nextdimension.cc>
References: <1559326785-26574-5-git-send-email-brad@nextdimension.cc>
MIME-Version: 1.0
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 30
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudegvddgudehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurhgrugcunfhovhgvuceosghrrggusehnvgigthguihhmvghnshhiohhnrdgttgeqnecukfhppeeijedrudelkedrheejrddukeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Includes support to identify and use two Hauppauge device.
HVR-1955:
- LGDT3306a ATSC/QAM demod
- si2177 tuner
- cx25840 decoder for analog tv/composite/s-video/audio

HVR-1975 dual-frontend:
- LGDT3306a ATSC/QAM demod
- si2168 DVB-C/T/T2 demod
- si2177 tuner
- cx25840 decoder for analog tv/composite/s-video/audio

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v6:
- back off one checkpatch strict fix, causes discarded const compiler war=
ning
Since v5:
- le16_to_cpu fix
Since v4:
- checkpatch strict fixes
- change !0 initializations
Since v2:
- Fix build with VIDEO_PVRUSB2_DVB enabled
Changes since v1:
- Fix build with VIDEO_PVRUSB2_DVB disabled
- Insert 160xxx code lower, so 75xxx profile is not split
- Reorganize 160xxx board profile
- Share config where possible

 drivers/media/usb/pvrusb2/Kconfig             |   2 +
 .../media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c   |  25 +++
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c   | 166 ++++++++++++++++++
 drivers/media/usb/pvrusb2/pvrusb2-devattr.h   |   1 +
 drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h   |   4 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |  36 +++-
 6 files changed, 233 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/Kconfig b/drivers/media/usb/pvrusb=
2/Kconfig
index 64f9df067269..e6a4f730591b 100644
--- a/drivers/media/usb/pvrusb2/Kconfig
+++ b/drivers/media/usb/pvrusb2/Kconfig
@@ -41,6 +41,8 @@ config VIDEO_PVRUSB2_DVB
 	select DVB_S5H1409 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_S5H1411 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_TDA10048 if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_LGDT3306A if MEDIA_SUBDRV_AUTOSELECT
+	select DVB_SI2168 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_TDA18271 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_SIMPLE if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_TDA8290 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c b/drivers/me=
dia/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
index d5bec0f69bec..36016ab3aef0 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
@@ -111,10 +111,35 @@ static const struct routing_scheme routing_defav400=
 =3D {
 	.cnt =3D ARRAY_SIZE(routing_schemeav400),
 };
=20
+static const struct routing_scheme_item routing_scheme160xxx[] =3D {
+	[PVR2_CVAL_INPUT_TV] =3D {
+		.vid =3D CX25840_COMPOSITE7,
+		.aud =3D CX25840_AUDIO8,
+	},
+	[PVR2_CVAL_INPUT_RADIO] =3D {
+		.vid =3D CX25840_COMPOSITE4,
+		.aud =3D CX25840_AUDIO6,
+	},
+	[PVR2_CVAL_INPUT_COMPOSITE] =3D {
+		.vid =3D CX25840_COMPOSITE3,
+		.aud =3D CX25840_AUDIO_SERIAL,
+	},
+	[PVR2_CVAL_INPUT_SVIDEO] =3D {
+		.vid =3D CX25840_SVIDEO1,
+		.aud =3D CX25840_AUDIO_SERIAL,
+	},
+};
+
+static const struct routing_scheme routing_def160xxx =3D {
+	.def =3D routing_scheme160xxx,
+	.cnt =3D ARRAY_SIZE(routing_scheme160xxx),
+};
+
 static const struct routing_scheme *routing_schemes[] =3D {
 	[PVR2_ROUTING_SCHEME_HAUPPAUGE] =3D &routing_def0,
 	[PVR2_ROUTING_SCHEME_GOTVIEW] =3D &routing_defgv,
 	[PVR2_ROUTING_SCHEME_AV400] =3D &routing_defav400,
+	[PVR2_ROUTING_SCHEME_HAUP160XXX] =3D &routing_def160xxx,
 };
=20
 void pvr2_cx25840_subdev_update(struct pvr2_hdw *hdw, struct v4l2_subdev=
 *sd)
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c b/drivers/media/=
usb/pvrusb2/pvrusb2-devattr.c
index a4a27e071c6d..ef57a6329863 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
@@ -37,6 +37,9 @@ pvr2_device_desc structures.
 #include "tda18271.h"
 #include "tda8290.h"
 #include "tuner-simple.h"
+#include "si2157.h"
+#include "lgdt3306a.h"
+#include "si2168.h"
 #endif
=20
=20
@@ -525,7 +528,166 @@ static const struct pvr2_device_desc pvr2_device_75=
1xx =3D {
 #endif
 };
=20
+/*----------------------------------------------------------------------=
--*/
+/*    Hauppauge PVR-USB2 Model 160000 / 160111 -- HVR-1955 / HVR-1975   =
  */
+
+#ifdef CONFIG_VIDEO_PVRUSB2_DVB
+static int pvr2_si2157_attach(struct pvr2_dvb_adapter *adap);
+static int pvr2_si2168_attach(struct pvr2_dvb_adapter *adap);
+static int pvr2_dual_fe_attach(struct pvr2_dvb_adapter *adap);
+static int pvr2_lgdt3306a_attach(struct pvr2_dvb_adapter *adap);
+
+static const struct pvr2_dvb_props pvr2_160000_dvb_props =3D {
+	.frontend_attach =3D pvr2_dual_fe_attach,
+	.tuner_attach    =3D pvr2_si2157_attach,
+};
+
+static const struct pvr2_dvb_props pvr2_160111_dvb_props =3D {
+	.frontend_attach =3D pvr2_lgdt3306a_attach,
+	.tuner_attach    =3D pvr2_si2157_attach,
+};
+
+static int pvr2_si2157_attach(struct pvr2_dvb_adapter *adap)
+{
+	struct si2157_config si2157_config =3D {};
+
+	si2157_config.inversion =3D 1;
+	si2157_config.fe =3D adap->fe[0];
+
+	adap->i2c_client_tuner =3D dvb_module_probe("si2157", "si2177",
+						  &adap->channel.hdw->i2c_adap,
+						  0x60, &si2157_config);
+
+	if (!adap->i2c_client_tuner)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int pvr2_si2168_attach(struct pvr2_dvb_adapter *adap)
+{
+	struct si2168_config si2168_config =3D {};
+	struct i2c_adapter *adapter;
+
+	pr_debug("%s()\n", __func__);
+
+	si2168_config.fe =3D &adap->fe[1];
+	si2168_config.i2c_adapter =3D &adapter;
+	si2168_config.ts_mode =3D SI2168_TS_PARALLEL; /*2, 1-serial, 2-parallel=
.*/
+	si2168_config.ts_clock_gapped =3D 1; /*0-disabled, 1-enabled.*/
+	si2168_config.ts_clock_inv =3D 0; /*0-not-invert, 1-invert*/
+	si2168_config.spectral_inversion =3D 1; /*0-not-invert, 1-invert*/
+
+	adap->i2c_client_demod[1] =3D dvb_module_probe("si2168", NULL,
+						     &adap->channel.hdw->i2c_adap,
+						     0x64, &si2168_config);
+
+	if (!adap->i2c_client_demod[1])
+		return -ENODEV;
+
+	return 0;
+}
=20
+static int pvr2_lgdt3306a_attach(struct pvr2_dvb_adapter *adap)
+{
+	struct lgdt3306a_config lgdt3306a_config;
+	struct i2c_adapter *adapter;
+
+	pr_debug("%s()\n", __func__);
+
+	lgdt3306a_config.fe =3D &adap->fe[0];
+	lgdt3306a_config.i2c_adapter =3D &adapter;
+	lgdt3306a_config.deny_i2c_rptr =3D 1;
+	lgdt3306a_config.spectral_inversion =3D 1;
+	lgdt3306a_config.qam_if_khz =3D 4000;
+	lgdt3306a_config.vsb_if_khz =3D 3250;
+	lgdt3306a_config.mpeg_mode =3D LGDT3306A_MPEG_PARALLEL;
+	lgdt3306a_config.tpclk_edge =3D LGDT3306A_TPCLK_FALLING_EDGE;
+	lgdt3306a_config.tpvalid_polarity =3D LGDT3306A_TP_VALID_LOW;
+	lgdt3306a_config.xtalMHz =3D 25, /* demod clock MHz; 24/25 supported */
+
+	adap->i2c_client_demod[0] =3D dvb_module_probe("lgdt3306a", NULL,
+						     &adap->channel.hdw->i2c_adap,
+						     0x59, &lgdt3306a_config);
+
+	if (!adap->i2c_client_demod[0])
+		return -ENODEV;
+
+	return 0;
+}
+
+static int pvr2_dual_fe_attach(struct pvr2_dvb_adapter *adap)
+{
+	pr_debug("%s()\n", __func__);
+
+	if (pvr2_lgdt3306a_attach(adap) !=3D 0)
+		return -ENODEV;
+
+	if (pvr2_si2168_attach(adap) !=3D 0) {
+		dvb_module_release(adap->i2c_client_demod[0]);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+#endif
+
+#define PVR2_FIRMWARE_160xxx "v4l-pvrusb2-160xxx-01.fw"
+static const char *pvr2_fw1_names_160xxx[] =3D {
+		PVR2_FIRMWARE_160xxx,
+};
+
+static const struct pvr2_device_client_desc pvr2_cli_160xxx[] =3D {
+	{ .module_id =3D PVR2_CLIENT_ID_CX25840 },
+};
+
+static const struct pvr2_device_desc pvr2_device_160000 =3D {
+		.description =3D "WinTV HVR-1975 Model 160000",
+		.shortname =3D "160000",
+		.client_table.lst =3D pvr2_cli_160xxx,
+		.client_table.cnt =3D ARRAY_SIZE(pvr2_cli_160xxx),
+		.fx2_firmware.lst =3D pvr2_fw1_names_160xxx,
+		.fx2_firmware.cnt =3D ARRAY_SIZE(pvr2_fw1_names_160xxx),
+		.default_tuner_type =3D TUNER_ABSENT,
+		.flag_has_cx25840 =3D 1,
+		.flag_has_hauppauge_rom =3D 1,
+		.flag_has_analogtuner =3D 1,
+		.flag_has_composite =3D 1,
+		.flag_has_svideo =3D 1,
+		.flag_fx2_16kb =3D 1,
+		.signal_routing_scheme =3D PVR2_ROUTING_SCHEME_HAUPPAUGE,
+		.digital_control_scheme =3D PVR2_DIGITAL_SCHEME_HAUPPAUGE,
+		.default_std_mask =3D V4L2_STD_NTSC_M,
+		.led_scheme =3D PVR2_LED_SCHEME_HAUPPAUGE,
+		.ir_scheme =3D PVR2_IR_SCHEME_ZILOG,
+#ifdef CONFIG_VIDEO_PVRUSB2_DVB
+		.dvb_props =3D &pvr2_160000_dvb_props,
+#endif
+};
+
+static const struct pvr2_device_desc pvr2_device_160111 =3D {
+		.description =3D "WinTV HVR-1955 Model 160111",
+		.shortname =3D "160111",
+		.client_table.lst =3D pvr2_cli_160xxx,
+		.client_table.cnt =3D ARRAY_SIZE(pvr2_cli_160xxx),
+		.fx2_firmware.lst =3D pvr2_fw1_names_160xxx,
+		.fx2_firmware.cnt =3D ARRAY_SIZE(pvr2_fw1_names_160xxx),
+		.default_tuner_type =3D TUNER_ABSENT,
+		.flag_has_cx25840 =3D 1,
+		.flag_has_hauppauge_rom =3D 1,
+		.flag_has_analogtuner =3D 1,
+		.flag_has_composite =3D 1,
+		.flag_has_svideo =3D 1,
+		.flag_fx2_16kb =3D 1,
+		.signal_routing_scheme =3D PVR2_ROUTING_SCHEME_HAUPPAUGE,
+		.digital_control_scheme =3D PVR2_DIGITAL_SCHEME_HAUPPAUGE,
+		.default_std_mask =3D V4L2_STD_NTSC_M,
+		.led_scheme =3D PVR2_LED_SCHEME_HAUPPAUGE,
+		.ir_scheme =3D PVR2_IR_SCHEME_ZILOG,
+#ifdef CONFIG_VIDEO_PVRUSB2_DVB
+		.dvb_props =3D &pvr2_160111_dvb_props,
+#endif
+};
=20
 /*----------------------------------------------------------------------=
--*/
=20
@@ -552,6 +714,10 @@ struct usb_device_id pvr2_device_table[] =3D {
 	  .driver_info =3D (kernel_ulong_t)&pvr2_device_751xx},
 	{ USB_DEVICE(0x0ccd, 0x0039),
 	  .driver_info =3D (kernel_ulong_t)&pvr2_device_av400},
+	{ USB_DEVICE(0x2040, 0x7502),
+	  .driver_info =3D (kernel_ulong_t)&pvr2_device_160111},
+	{ USB_DEVICE(0x2040, 0x7510),
+	  .driver_info =3D (kernel_ulong_t)&pvr2_device_160000},
 	{ }
 };
=20
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.h b/drivers/media/=
usb/pvrusb2/pvrusb2-devattr.h
index c1e7d4822cd1..ea0b2bf429e9 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.h
@@ -66,6 +66,7 @@ struct pvr2_string_table {
 #define PVR2_ROUTING_SCHEME_GOTVIEW 1
 #define PVR2_ROUTING_SCHEME_ONAIR 2
 #define PVR2_ROUTING_SCHEME_AV400 3
+#define PVR2_ROUTING_SCHEME_HAUP160XXX 4
=20
 #define PVR2_DIGITAL_SCHEME_NONE 0
 #define PVR2_DIGITAL_SCHEME_HAUPPAUGE 1
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h b/drivers/media/=
usb/pvrusb2/pvrusb2-fx2-cmd.h
index 0a01de4e54db..640b033815ec 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h
@@ -38,6 +38,10 @@
=20
 #define FX2CMD_FWPOST1          0x52u
=20
+/* These 2 only exist on Model 160xxx */
+#define FX2CMD_HCW_DEMOD_RESET_PIN 0xd4u
+#define FX2CMD_HCW_MAKO_SLEEP_PIN  0xd5u
+
 #define FX2CMD_POWER_OFF        0xdcu
 #define FX2CMD_POWER_ON         0xdeu
=20
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/=
pvrusb2/pvrusb2-hdw.c
index 191439109788..957913146e88 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -316,6 +316,8 @@ static const struct pvr2_fx2cmd_descdef pvr2_fx2cmd_d=
esc[] =3D {
 	{FX2CMD_ONAIR_DTV_STREAMING_OFF, "onair dtv stream off"},
 	{FX2CMD_ONAIR_DTV_POWER_ON, "onair dtv power on"},
 	{FX2CMD_ONAIR_DTV_POWER_OFF, "onair dtv power off"},
+	{FX2CMD_HCW_DEMOD_RESET_PIN, "hcw demod reset pin"},
+	{FX2CMD_HCW_MAKO_SLEEP_PIN, "hcw mako sleep pin"},
 };
=20
=20
@@ -2139,10 +2141,28 @@ static void pvr2_hdw_setup_low(struct pvr2_hdw *h=
dw)
 				      ((0) << 16));
 	}
=20
-	// This step MUST happen after the earlier powerup step.
+	/* This step MUST happen after the earlier powerup step */
 	pvr2_i2c_core_init(hdw);
 	if (!pvr2_hdw_dev_ok(hdw)) return;
=20
+	/* Reset demod only on Hauppauge 160xxx platform */
+	if (le16_to_cpu(hdw->usb_dev->descriptor.idVendor) =3D=3D 0x2040 &&
+	    (le16_to_cpu(hdw->usb_dev->descriptor.idProduct) =3D=3D 0x7502 ||
+	     le16_to_cpu(hdw->usb_dev->descriptor.idProduct) =3D=3D 0x7510)) {
+		pr_info("%s(): resetting 160xxx demod\n", __func__);
+		/* TODO: not sure this is proper place to reset once only */
+		pvr2_issue_simple_cmd(hdw,
+				      FX2CMD_HCW_DEMOD_RESET_PIN |
+				      (1 << 8) |
+				      ((0) << 16));
+		usleep_range(10000, 10500);
+		pvr2_issue_simple_cmd(hdw,
+				      FX2CMD_HCW_DEMOD_RESET_PIN |
+				      (1 << 8) |
+				      ((1) << 16));
+		usleep_range(10000, 10500);
+	}
+
 	pvr2_hdw_load_modules(hdw);
 	if (!pvr2_hdw_dev_ok(hdw)) return;
=20
@@ -4012,6 +4032,20 @@ int pvr2_hdw_cmd_decoder_reset(struct pvr2_hdw *hd=
w)
 static int pvr2_hdw_cmd_hcw_demod_reset(struct pvr2_hdw *hdw, int onoff)
 {
 	hdw->flag_ok =3D !0;
+
+	/* Use this for Hauppauge 160xxx only */
+	if (le16_to_cpu(hdw->usb_dev->descriptor.idVendor) =3D=3D 0x2040 &&
+	    (le16_to_cpu(hdw->usb_dev->descriptor.idProduct) =3D=3D 0x7502 ||
+	     le16_to_cpu(hdw->usb_dev->descriptor.idProduct) =3D=3D 0x7510)) {
+		pr_debug("%s(): resetting demod on Hauppauge 160xxx platform skipped\n=
",
+			 __func__);
+		/* Can't reset 160xxx or it will trash Demod tristate */
+		return pvr2_issue_simple_cmd(hdw,
+					     FX2CMD_HCW_MAKO_SLEEP_PIN |
+					     (1 << 8) |
+					     ((onoff ? 1 : 0) << 16));
+	}
+
 	return pvr2_issue_simple_cmd(hdw,
 				     FX2CMD_HCW_DEMOD_RESETIN |
 				     (1 << 8) |
--=20
2.21.0

