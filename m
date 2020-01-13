Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C38F13936E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgAMOPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:15:40 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:56819 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgAMOPj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:15:39 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MwjO6-1jbnM03ksc-00y9Ph; Mon, 13 Jan 2020 15:15:22 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 1743C64F293;
        Mon, 13 Jan 2020 14:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id z6daAkZQeN_e; Mon, 13 Jan 2020 15:15:21 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 5ED4564E74F;
        Mon, 13 Jan 2020 15:15:21 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:15:21 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 1142F804E9; Mon, 13 Jan 2020 15:15:21 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:15:21 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 2/8] media: adv748x: add audio mute control and output
 selection ioctls
Message-ID: <20200113141521.GC3606@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1578924232.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F657D64
X-Provags-ID: V03:K1:DIrn3CSu0MRyfE7IK5wV5IobbDZ6Oy+ZCIRw905xg95hBcY/XrX
 aCFM/NcIj4V1xepWMVsWQAyqv7D1r5YFPWVLALtzjd2eSg6n3AfGpKDt0XSmC3iNp5wWGNz
 3c/yC8+ttkULDSdfcg7VohCmTpWBTd2ZW941/0uDlSCsHAfCPMN41VQO7dC5uf+yXpXk/mp
 ESSkOkxcF1FSSGEQtJw/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YakssdLKZoY=:C4l5RNkGp3kzcHbG1mxqsE
 Sb4EyC0+pkIL4NP4A0ayFeMYaVuJkZ29m1F+3SQr2uPd6aGNSzR8y4cQItC5jBXr/GqEE272z
 hEAAaiS30KZXKQmKJhtzEJLjqlSh+XTYx7A6eMuYDhdQvtxpTgA1AifiV+VyIT4SILdDz5XqH
 /mhLb8MdGkaUFpbseRThEIg761gUrdDGBjW0f7vlyj2mhxPBDmGU1puMJNPo8TabvdOgITVSO
 dATUTCGpjHJ4onH1jNYIoOrg+eoePTGm+CQap5dPxv3czuElQDGLMSXK/1d3zt1U2z4uXoqxF
 A/CRSA0gqkBuVdZogCL11mFKcdtb/E2I4yZXmy7vihqL2+tV7MbM0jm+0wyu/k8qMmO71ZjNJ
 m6ux47J0NdCjjOiBKRCtv3AzmCF4auM3KnZKVPXwTrtVoJsyoFwyUEeCuSNLbHsvIJInHOTJx
 +kTooMdRrZGcXUDtMMBiygYvMD8hE2v6JJBLzcy91+j4idb/OcKNYr8OBJ5UH88+9q3w9Nd8U
 mY87Pk89XvijRDIUJ3/ghav5EZ+YNUr1kTXJrho9y4mOyto4Ea5a560yT92UX1b3NNbV1PpAP
 qoConwKPhUTA7v8sMBX5cAoPoyqopGDGj5/WSw1WZRUenLGKTKBtsDKf+4CygglXP0aw3HOcy
 U2NnJPHIzLX4KFTPiT96PVnCStN1Zt3Reeagoz135FCPmB1MUKr1aB+gEaXyvfemK0OVlb0QL
 QhMZwVq8zOIY2c0NFHbkyems4bENTO+gccKlEW0bJbiE3nP1AQQQgiwqIpI9TCaV/ownUbRxn
 IeRMkg+nI9gV0u51zBbNRrEplR+Kf3nbC07RJcXmObLD+ub13aUWBrF+tdDmJpLbXTroTklRC
 6ZzqQQaDurBvj5grtiza/hEuAmIg+42xAHAy6Vgi8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This change implements audio-related V4L2 ioctls for the HDMI subdevice.

The master audio clock is configured for 256fs, as supported by the only
device available at the moment. For the same reason, the TDM slot is
formatted using left justification of its bits.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c |   6 +
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 182 +++++++++++++++++++++++
 drivers/media/i2c/adv748x/adv748x.h      |  42 ++++++
 3 files changed, 230 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index bc49aa93793c..b6067ffb1e0d 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -150,6 +150,12 @@ static int adv748x_write_check(struct adv748x_state *state, u8 page, u8 reg,
 	return *error;
 }
 
+int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg, u8 mask,
+			u8 value)
+{
+	return regmap_update_bits(state->regmap[page], reg, mask, value);
+}
+
 /* adv748x_write_block(): Write raw data with a maximum of I2C_SMBUS_BLOCK_MAX
  * size to one or more registers.
  *
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index c557f8fdf11a..9bc9237c9116 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Renesas Electronics Corp.
  */
 
+#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
@@ -603,11 +604,186 @@ static const struct v4l2_subdev_pad_ops adv748x_pad_ops_hdmi = {
 	.enum_dv_timings = adv748x_hdmi_enum_dv_timings,
 };
 
+static int adv748x_hdmi_audio_mute(struct adv748x_hdmi *hdmi, int enable)
+{
+	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
+
+	return hdmi_update(state, ADV748X_HDMI_MUTE_CTRL,
+			   ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO,
+			   enable ? 0xff : 0);
+}
+
+
+#define HDMI_AOUT_NONE 0
+#define HDMI_AOUT_I2S 1
+#define HDMI_AOUT_I2S_TDM 2
+
+static int adv748x_hdmi_enumaudout(struct adv748x_hdmi *hdmi,
+				   struct v4l2_audioout *a)
+{
+	switch (a->index) {
+	case HDMI_AOUT_NONE:
+		strlcpy(a->name, "None", sizeof(a->name));
+		break;
+	case HDMI_AOUT_I2S:
+		strlcpy(a->name, "I2S/stereo", sizeof(a->name));
+		break;
+	case HDMI_AOUT_I2S_TDM:
+		strlcpy(a->name, "I2S-TDM/multichannel", sizeof(a->name));
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int adv748x_hdmi_g_audout(struct adv748x_hdmi *hdmi,
+				 struct v4l2_audioout *a)
+{
+	a->index = hdmi->audio_out;
+	return adv748x_hdmi_enumaudout(hdmi, a);
+}
+
+static int set_audio_pads_state(struct adv748x_state *state, int on)
+{
+	return io_update(state, ADV748X_IO_PAD_CONTROLS,
+			 ADV748X_IO_PAD_CONTROLS_TRI_AUD |
+			 ADV748X_IO_PAD_CONTROLS_PDN_AUD,
+			 on ? 0 : 0xff);
+}
+
+static int set_dpll_mclk_fs(struct adv748x_state *state, int fs)
+{
+	if (fs % 128 || fs > 768)
+		return -EINVAL;
+	return dpll_update(state, ADV748X_DPLL_MCLK_FS,
+			   ADV748X_DPLL_MCLK_FS_N_MASK, (fs / 128) - 1);
+}
+
+static int set_i2s_format(struct adv748x_state *state, uint outmode,
+			  uint bitwidth)
+{
+	return hdmi_update(state, ADV748X_HDMI_I2S,
+			   ADV748X_HDMI_I2SBITWIDTH_MASK |
+			   ADV748X_HDMI_I2SOUTMODE_MASK,
+			   (outmode << ADV748X_HDMI_I2SOUTMODE_SHIFT) |
+			   bitwidth);
+}
+
+static int set_i2s_tdm_mode(struct adv748x_state *state, int is_tdm)
+{
+	int ret;
+
+	ret = hdmi_update(state, ADV748X_HDMI_AUDIO_MUTE_SPEED,
+			  ADV748X_MAN_AUDIO_DL_BYPASS |
+			  ADV748X_AUDIO_DELAY_LINE_BYPASS,
+			  is_tdm ? 0xff : 0);
+	if (ret < 0)
+		goto fail;
+	ret = hdmi_update(state, ADV748X_HDMI_REG_6D,
+			  ADV748X_I2S_TDM_MODE_ENABLE,
+			  is_tdm ? 0xff : 0);
+	if (ret < 0)
+		goto fail;
+	ret = set_i2s_format(state, ADV748X_I2SOUTMODE_LEFT_J, 24);
+fail:
+	return ret;
+}
+
+static int set_audio_out(struct adv748x_state *state, int aout)
+{
+	int ret;
+
+	switch (aout) {
+	case HDMI_AOUT_NONE:
+		ret = set_audio_pads_state(state, 0);
+		break;
+	case HDMI_AOUT_I2S:
+		ret = set_dpll_mclk_fs(state, 256);
+		if (ret < 0)
+			goto fail;
+		ret = set_i2s_tdm_mode(state, 1);
+		if (ret < 0)
+			goto fail;
+		ret = set_audio_pads_state(state, 1);
+		if (ret < 0)
+			goto fail;
+		break;
+	case HDMI_AOUT_I2S_TDM:
+		ret = set_dpll_mclk_fs(state, 256);
+		if (ret < 0)
+			goto fail;
+		ret = set_i2s_tdm_mode(state, 1);
+		if (ret < 0)
+			goto fail;
+		ret = set_audio_pads_state(state, 1);
+		if (ret < 0)
+			goto fail;
+		break;
+	default:
+		ret = -EINVAL;
+		goto fail;
+	}
+	return 0;
+fail:
+	return ret;
+}
+
+static int adv748x_hdmi_s_audout(struct adv748x_hdmi *hdmi,
+				 const struct v4l2_audioout *a)
+{
+	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
+	int ret = set_audio_out(state, a->index);
+
+	if (ret == 0)
+		hdmi->audio_out = a->index;
+	return ret;
+}
+
+static long adv748x_hdmi_querycap(struct adv748x_hdmi *hdmi,
+				  struct v4l2_capability *cap)
+{
+	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
+
+	cap->version = LINUX_VERSION_CODE;
+	strlcpy(cap->driver, state->dev->driver->name, sizeof(cap->driver));
+	strlcpy(cap->card, "hdmi", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "i2c:%d-%04x",
+		 i2c_adapter_id(state->client->adapter),
+		 state->client->addr);
+	cap->device_caps = V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
+	cap->capabilities = V4L2_CAP_DEVICE_CAPS;
+	return 0;
+}
+
+static long adv748x_hdmi_ioctl(struct v4l2_subdev *sd,
+			       unsigned int cmd, void *arg)
+{
+	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
+
+	switch (cmd) {
+	case VIDIOC_ENUMAUDOUT:
+		return adv748x_hdmi_enumaudout(hdmi, arg);
+	case VIDIOC_S_AUDOUT:
+		return adv748x_hdmi_s_audout(hdmi, arg);
+	case VIDIOC_G_AUDOUT:
+		return adv748x_hdmi_g_audout(hdmi, arg);
+	case VIDIOC_QUERYCAP:
+		return adv748x_hdmi_querycap(hdmi, arg);
+	}
+	return -ENOTTY;
+}
+
+static const struct v4l2_subdev_core_ops adv748x_core_ops_hdmi = {
+	.ioctl = adv748x_hdmi_ioctl,
+};
+
 /* -----------------------------------------------------------------------------
  * v4l2_subdev_ops
  */
 
 static const struct v4l2_subdev_ops adv748x_ops_hdmi = {
+	.core = &adv748x_core_ops_hdmi,
 	.video = &adv748x_video_ops_hdmi,
 	.pad = &adv748x_pad_ops_hdmi,
 };
@@ -633,6 +809,8 @@ static int adv748x_hdmi_s_ctrl(struct v4l2_ctrl *ctrl)
 	int ret;
 	u8 pattern;
 
+	if (ctrl->id == V4L2_CID_AUDIO_MUTE)
+		return adv748x_hdmi_audio_mute(hdmi, ctrl->val);
 	/* Enable video adjustment first */
 	ret = cp_clrset(state, ADV748X_CP_VID_ADJ,
 			ADV748X_CP_VID_ADJ_ENABLE,
@@ -697,6 +875,8 @@ static int adv748x_hdmi_init_controls(struct adv748x_hdmi *hdmi)
 	v4l2_ctrl_new_std(&hdmi->ctrl_hdl, &adv748x_hdmi_ctrl_ops,
 			  V4L2_CID_HUE, ADV748X_CP_HUE_MIN,
 			  ADV748X_CP_HUE_MAX, 1, ADV748X_CP_HUE_DEF);
+	v4l2_ctrl_new_std(&hdmi->ctrl_hdl, &adv748x_hdmi_ctrl_ops,
+			  V4L2_CID_AUDIO_MUTE, 0, 1, 1, 1);
 
 	/*
 	 * Todo: V4L2_CID_DV_RX_POWER_PRESENT should also be supported when
@@ -755,6 +935,8 @@ int adv748x_hdmi_init(struct adv748x_hdmi *hdmi)
 
 void adv748x_hdmi_cleanup(struct adv748x_hdmi *hdmi)
 {
+	adv748x_hdmi_audio_mute(hdmi, 1);
+	set_audio_out(adv748x_hdmi_to_state(hdmi), HDMI_AOUT_NONE);
 	v4l2_device_unregister_subdev(&hdmi->sd);
 	media_entity_cleanup(&hdmi->sd.entity);
 	v4l2_ctrl_handler_free(&hdmi->ctrl_hdl);
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index db6346a06351..fdda6982e437 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -128,6 +128,7 @@ struct adv748x_hdmi {
 		u32 present;
 		unsigned int blocks;
 	} edid;
+	int audio_out;
 };
 
 #define adv748x_ctrl_to_hdmi(ctrl) \
@@ -224,6 +225,11 @@ struct adv748x_state {
 
 #define ADV748X_IO_VID_STD		0x05
 
+#define ADV748X_IO_PAD_CONTROLS		0x0e
+#define ADV748X_IO_PAD_CONTROLS_TRI_AUD	BIT(5)
+#define ADV748X_IO_PAD_CONTROLS_PDN_AUD	BIT(1)
+#define ADV748X_IO_PAD_CONTROLS1	0x1d
+
 #define ADV748X_IO_10			0x10	/* io_reg_10 */
 #define ADV748X_IO_10_CSI4_EN		BIT(7)
 #define ADV748X_IO_10_CSI1_EN		BIT(6)
@@ -246,7 +252,21 @@ struct adv748x_state {
 #define ADV748X_IO_REG_FF		0xff
 #define ADV748X_IO_REG_FF_MAIN_RESET	0xff
 
+/* DPLL Map */
+#define ADV748X_DPLL_MCLK_FS		0xb5
+#define ADV748X_DPLL_MCLK_FS_N_MASK	GENMASK(2, 0)
+
 /* HDMI RX Map */
+#define ADV748X_HDMI_I2S		0x03	/* I2S mode and width */
+#define ADV748X_HDMI_I2SBITWIDTH_MASK	GENMASK(4, 0)
+#define ADV748X_HDMI_I2SOUTMODE_SHIFT	5
+#define ADV748X_HDMI_I2SOUTMODE_MASK	\
+	GENMASK(6, ADV748X_HDMI_I2SOUTMODE_SHIFT)
+#define ADV748X_I2SOUTMODE_I2S 0
+#define ADV748X_I2SOUTMODE_RIGHT_J 1
+#define ADV748X_I2SOUTMODE_LEFT_J 2
+#define ADV748X_I2SOUTMODE_SPDIF 3
+
 #define ADV748X_HDMI_LW1		0x07	/* line width_1 */
 #define ADV748X_HDMI_LW1_VERT_FILTER	BIT(7)
 #define ADV748X_HDMI_LW1_DE_REGEN	BIT(5)
@@ -258,6 +278,16 @@ struct adv748x_state {
 #define ADV748X_HDMI_F1H1		0x0b	/* field1 height_1 */
 #define ADV748X_HDMI_F1H1_INTERLACED	BIT(5)
 
+#define ADV748X_HDMI_MUTE_CTRL		0x1a
+#define ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO BIT(4)
+#define ADV748X_HDMI_MUTE_CTRL_WAIT_UNMUTE_MASK	GENMASK(3, 1)
+#define ADV748X_HDMI_MUTE_CTRL_NOT_AUTO_UNMUTE	BIT(0)
+
+#define ADV748X_HDMI_AUDIO_MUTE_SPEED	0x0f
+#define ADV748X_HDMI_AUDIO_MUTE_SPEED_MASK	GENMASK(4, 0)
+#define ADV748X_MAN_AUDIO_DL_BYPASS BIT(7)
+#define ADV748X_AUDIO_DELAY_LINE_BYPASS BIT(6)
+
 #define ADV748X_HDMI_HFRONT_PORCH	0x20	/* hsync_front_porch_1 */
 #define ADV748X_HDMI_HFRONT_PORCH_MASK	0x1fff
 
@@ -279,6 +309,9 @@ struct adv748x_state {
 #define ADV748X_HDMI_TMDS_1		0x51	/* hdmi_reg_51 */
 #define ADV748X_HDMI_TMDS_2		0x52	/* hdmi_reg_52 */
 
+#define ADV748X_HDMI_REG_6D		0x6d	/* hdmi_reg_6d */
+#define ADV748X_I2S_TDM_MODE_ENABLE BIT(7)
+
 /* HDMI RX Repeater Map */
 #define ADV748X_REPEATER_EDID_SZ	0x70	/* primary_edid_size */
 #define ADV748X_REPEATER_EDID_SZ_SHIFT	4
@@ -393,14 +426,23 @@ int adv748x_write(struct adv748x_state *state, u8 page, u8 reg, u8 value);
 int adv748x_write_block(struct adv748x_state *state, int client_page,
 			unsigned int init_reg, const void *val,
 			size_t val_len);
+int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg,
+			u8 mask, u8 value);
 
 #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
 #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
 #define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~m) | v)
+#define io_update(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
 
 #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
 #define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, r+1)) & m)
 #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
+#define hdmi_update(s, r, m, v) \
+	adv748x_update_bits(s, ADV748X_PAGE_HDMI, r, m, v)
+
+#define dpll_read(s, r) adv748x_read(s, ADV748X_PAGE_DPLL, r)
+#define dpll_update(s, r, m, v) \
+	adv748x_update_bits(s, ADV748X_PAGE_DPLL, r, m, v)
 
 #define repeater_read(s, r) adv748x_read(s, ADV748X_PAGE_REPEATER, r)
 #define repeater_write(s, r, v) adv748x_write(s, ADV748X_PAGE_REPEATER, r, v)
-- 
2.24.1.508.g91d2dafee0

