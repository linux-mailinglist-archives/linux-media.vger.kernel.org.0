Return-Path: <linux-media+bounces-38200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A88B0D3C9
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 09:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E22C1887251
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 07:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52E32DEA7C;
	Tue, 22 Jul 2025 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kx3CvPSq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F72DE703
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170023; cv=none; b=ig/L9i2Qo7N1u7gIABcSWTzCqeoWlWY2F7Gkp/Ngt9A0vt29JKPT8lCq9pMcujL5wRYGb9sbXToLnN0lghPVU4id3cuSRPNo7ZO21wxDVR+6oKuSaFbWqsc2nMYEYtqWPwSUsyzdwFGyLaIKUUm3uGu95GlbpHdOyHKiHrliJU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170023; c=relaxed/simple;
	bh=B5/If/EsfZbA4AdYXqLdbKTlI+ky9xspGzLY+3f8ras=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pG/MJt3Vx9aWCLn4xGL2y/JTV0GnBbzwN++rIs9jSeMtJVQvk2oUsv7TU5F4pNe7zx2CGyNM96ItjEkTTPYkmsMbpvRyAkNnxe7LJpNsndDfrWFf5dmek2Uv0iRISshVhSxUBf9z7CXQPYNZKP8RBoNriQfcNEUy+IjqJGEKikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kx3CvPSq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EC9C4CEEB;
	Tue, 22 Jul 2025 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753170023;
	bh=B5/If/EsfZbA4AdYXqLdbKTlI+ky9xspGzLY+3f8ras=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kx3CvPSqhbCUhBCfI5ycyvsLd6/4uvBLODLW0H+iqJGDsUePI1JD72WLcGIPI20f/
	 hBK2GA/piU+sOApo8IXVX6RFx50Zli98ZOJDskrIAHwnPoZi7hIMvP8VljLfN5Rg9Z
	 h285DKqM5b+EKMw4PWqn3L9y6kDgsmSAFtCDjTG7VuayUylP4j7m5HPuR0ffPWVPvq
	 3edEI3or35TfFCaeUhafGXqeuSwItif4bCHAe6gRFmnF9nrDl5vyCMk4V0aGWEVftn
	 QIMC8KRURw2vVcPP0q9czIL7+F3hqXhiKTl2rkEJ/B1LsXhHTsL6DxNJsMcbUqJj8X
	 FiNhUnAeIm6+A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 2/2] media: i2c: tc358743: add support for more infoframe types
Date: Tue, 22 Jul 2025 09:34:36 +0200
Message-ID: <6bd4d4d8198b0eddcc07fe84e4c597aa2f968208.1753169676.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753169676.git.hverkuil+cisco@kernel.org>
References: <cover.1753169676.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for SPD, AUDIO, DRM and HDMI InfoFrames.

Also add support for ISRC1 and ISRC2 Packet Types and a programmable
type for both Packet and InfoFrames.

The tc358743 HDMI-to-CSI2 bridge is widely available, and it has quite
flexible InfoFrame/Packet Type support, so this makes it a very nice
device to capture such data.

The ACP (Audio Content Protection) Packet capture data is chosen as the
programmable type. ACP is typically only used for protected audio, which
is quite rare, so instead it is reprogrammed to capture DRM InfoFrames
by default. This can be changed by using the acp_type module option to
anything you want, and you can change it on the fly as well. It will be
updated whenever VIDIOC_LOG_STATUS is called (it's really a debug feature).

Tested on my Raspberry Pi 5.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/tc358743.c      | 109 ++++++++++++++++++++++++++----
 drivers/media/i2c/tc358743_regs.h |  57 +++++++++++-----
 2 files changed, 135 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 1cc7636e446d..6550ec94cb0c 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -38,7 +38,21 @@
 
 static int debug;
 module_param(debug, int, 0644);
-MODULE_PARM_DESC(debug, "debug level (0-3)");
+MODULE_PARM_DESC(debug, " debug level (0-3)");
+
+static int acp_type = 0x87;
+module_param(acp_type, int, 0644);
+MODULE_PARM_DESC(acp_type,
+		 " ACP Packet Type. Possible values:\n"
+		 "\t\t    0x87: DRM InfoFrame (Default).\n"
+		 "\t\t    0x01: Audio Clock Regeneration Packet\n"
+		 "\t\t    0x02: Audio Sample Packet\n"
+		 "\t\t    0x03: General Control Packet\n"
+		 "\t\t    0x04: ACP Packet\n"
+		 "\t\t    0x07: One Bit Audio Sample Packet\n"
+		 "\t\t    0x08: DST Audio Packet\n"
+		 "\t\t    0x09: High Bitrate Audio Stream Packet\n"
+		 "\t\t    0x0a: Gamut Metadata Packet\n");
 
 MODULE_DESCRIPTION("Toshiba TC358743 HDMI to CSI-2 bridge driver");
 MODULE_AUTHOR("Ramakrishnan Muthukrishnan <ram@rkrishnan.org>");
@@ -466,10 +480,29 @@ tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
 	if (!is_hdmi(sd))
 		return 0;
 
-	if (type != V4L2_DEBUGFS_IF_AVI)
+	switch (type) {
+	case V4L2_DEBUGFS_IF_AVI:
+		i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_LEN);
+		break;
+	case V4L2_DEBUGFS_IF_AUDIO:
+		i2c_rd(sd, PK_AUD_0HEAD, buf, PK_AUD_LEN);
+		break;
+	case V4L2_DEBUGFS_IF_SPD:
+		i2c_rd(sd, PK_SPD_0HEAD, buf, PK_SPD_LEN);
+		break;
+	case V4L2_DEBUGFS_IF_HDMI:
+		i2c_rd(sd, PK_VS_0HEAD, buf, PK_VS_LEN);
+		break;
+	case V4L2_DEBUGFS_IF_DRM:
+		i2c_rd(sd, PK_ACP_0HEAD, buf, PK_ACP_LEN);
+		break;
+	default:
 		return 0;
+	}
+
+	if (!buf[2])
+		return -ENOENT;
 
-	i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_16BYTE - PK_AVI_0HEAD + 1);
 	len = buf[2] + 4;
 	if (len > V4L2_DEBUGFS_IF_MAX_LEN)
 		len = -ENOENT;
@@ -478,26 +511,69 @@ tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
 	return len < 0 ? 0 : len;
 }
 
-static void print_avi_infoframe(struct v4l2_subdev *sd)
+static void print_infoframes(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct device *dev = &client->dev;
 	union hdmi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)] = {};
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+
+	/*
+	 * Updating the ACP TYPE here allows for dynamically
+	 * changing the type you want to monitor, without having
+	 * to reload the driver with a new acp_type module option value.
+	 *
+	 * Instead you can set it with the new value, then call
+	 * VIDIOC_LOG_STATUS.
+	 */
+	i2c_wr8(sd, TYP_ACP_SET, acp_type);
 
 	if (!is_hdmi(sd)) {
-		v4l2_info(sd, "DVI-D signal - AVI infoframe not supported\n");
+		v4l2_info(sd, "DVI-D signal - InfoFrames not supported\n");
 		return;
 	}
 
-	i2c_rd(sd, PK_AVI_0HEAD, buffer, HDMI_INFOFRAME_SIZE(AVI));
+	i2c_rd(sd, PK_AVI_0HEAD, buffer, PK_AVI_LEN);
+	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) >= 0)
+		hdmi_infoframe_log(KERN_INFO, dev, &frame);
 
-	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) < 0) {
-		v4l2_err(sd, "%s: unpack of AVI infoframe failed\n", __func__);
-		return;
+	i2c_rd(sd, PK_VS_0HEAD, buffer, PK_VS_LEN);
+	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) >= 0)
+		hdmi_infoframe_log(KERN_INFO, dev, &frame);
+
+	i2c_rd(sd, PK_AUD_0HEAD, buffer, PK_AUD_LEN);
+	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) >= 0)
+		hdmi_infoframe_log(KERN_INFO, dev, &frame);
+
+	i2c_rd(sd, PK_SPD_0HEAD, buffer, PK_SPD_LEN);
+	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) >= 0)
+		hdmi_infoframe_log(KERN_INFO, dev, &frame);
+
+	i2c_rd(sd, PK_ACP_0HEAD, buffer, PK_ACP_LEN);
+	if (buffer[0] == acp_type) {
+		if (acp_type < 0x80)
+			v4l2_info(sd, "Packet: %*ph\n", PK_ACP_LEN, buffer);
+		else if (acp_type != 0x87)
+			v4l2_info(sd, "InfoFrame: %*ph\n", PK_ACP_LEN, buffer);
+		else if (hdmi_infoframe_unpack(&frame, buffer,
+					       sizeof(buffer)) >= 0)
+			hdmi_infoframe_log(KERN_INFO, dev, &frame);
 	}
 
-	hdmi_infoframe_log(KERN_INFO, dev, &frame);
+	i2c_rd(sd, PK_MS_0HEAD, buffer, PK_MS_LEN);
+	if (buffer[2] && buffer[2] + 3 <= PK_MS_LEN)
+		v4l2_info(sd, "MPEG Source InfoFrame: %*ph\n",
+			  buffer[2] + 3, buffer);
+
+	i2c_rd(sd, PK_ISRC1_0HEAD, buffer, PK_ISRC1_LEN);
+	if (buffer[0] == 0x05)
+		v4l2_info(sd, "ISRC1 Packet: %*ph\n",
+			  PK_ISRC1_LEN, buffer);
+
+	i2c_rd(sd, PK_ISRC2_0HEAD, buffer, PK_ISRC2_LEN);
+	if (buffer[0] == 0x06)
+		v4l2_info(sd, "ISRC2 Packet: %*ph\n",
+			  PK_ISRC2_LEN, buffer);
 }
 
 /* --------------- CTRLS --------------- */
@@ -1375,7 +1451,7 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Deep color mode: %d-bits per channel\n",
 			deep_color_mode[(i2c_rd8(sd, VI_STATUS1) &
 				MASK_S_DEEPCOLOR) >> 2]);
-	print_avi_infoframe(sd);
+	print_infoframes(sd);
 
 	return 0;
 }
@@ -2232,10 +2308,15 @@ static int tc358743_probe(struct i2c_client *client)
 	if (err < 0)
 		goto err_work_queues;
 
+	i2c_wr8(sd, TYP_ACP_SET, acp_type);
+	i2c_wr8(sd, PK_AUTO_CLR, 0xff);
+	i2c_wr8(sd, NO_PKT_CLR, MASK_NO_ACP_CLR);
+
 	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
 	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
-						  V4L2_DEBUGFS_IF_AVI, sd,
-						  tc358743_debugfs_if_read);
+			  V4L2_DEBUGFS_IF_AVI | V4L2_DEBUGFS_IF_AUDIO |
+			  V4L2_DEBUGFS_IF_SPD | V4L2_DEBUGFS_IF_HDMI |
+			  V4L2_DEBUGFS_IF_DRM, sd, tc358743_debugfs_if_read);
 
 	v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
 		  client->addr << 1, client->adapter->name);
diff --git a/drivers/media/i2c/tc358743_regs.h b/drivers/media/i2c/tc358743_regs.h
index 2495878dc358..aae288f8add3 100644
--- a/drivers/media/i2c/tc358743_regs.h
+++ b/drivers/media/i2c/tc358743_regs.h
@@ -692,6 +692,8 @@
 #define MASK_NCO_F0_MOD_42MHZ                 0x00
 #define MASK_NCO_F0_MOD_27MHZ                 0x01
 
+#define TYP_ACP_SET                           0x8706
+
 #define PK_INT_MODE                           0x8709
 #define MASK_ISRC2_INT_MODE                   0x80
 #define MASK_ISRC_INT_MODE                    0x40
@@ -702,6 +704,8 @@
 #define MASK_AUD_INT_MODE                     0x02
 #define MASK_AVI_INT_MODE                     0x01
 
+#define PK_AUTO_CLR                           0x870a
+
 #define NO_PKT_LIMIT                          0x870B
 #define MASK_NO_ACP_LIMIT                     0xf0
 #define SET_NO_ACP_LIMIT_MS(milliseconds)    ((((milliseconds) / 80) << 4) & \
@@ -720,25 +724,44 @@
 #define ERR_PK_LIMIT                          0x870D
 #define NO_PKT_LIMIT2                         0x870E
 #define PK_AVI_0HEAD                          0x8710
-#define PK_AVI_1HEAD                          0x8711
-#define PK_AVI_2HEAD                          0x8712
 #define PK_AVI_0BYTE                          0x8713
-#define PK_AVI_1BYTE                          0x8714
-#define PK_AVI_2BYTE                          0x8715
-#define PK_AVI_3BYTE                          0x8716
-#define PK_AVI_4BYTE                          0x8717
-#define PK_AVI_5BYTE                          0x8718
-#define PK_AVI_6BYTE                          0x8719
-#define PK_AVI_7BYTE                          0x871A
-#define PK_AVI_8BYTE                          0x871B
-#define PK_AVI_9BYTE                          0x871C
-#define PK_AVI_10BYTE                         0x871D
-#define PK_AVI_11BYTE                         0x871E
-#define PK_AVI_12BYTE                         0x871F
-#define PK_AVI_13BYTE                         0x8720
-#define PK_AVI_14BYTE                         0x8721
-#define PK_AVI_15BYTE                         0x8722
 #define PK_AVI_16BYTE                         0x8723
+#define PK_AVI_LEN			      (PK_AVI_16BYTE - PK_AVI_0HEAD + 1)
+
+#define PK_AUD_0HEAD			      0x8730
+#define PK_AUD_0BYTE			      0x8733
+#define PK_AUD_10BYTE			      0x873d
+#define PK_AUD_LEN			      (PK_AUD_10BYTE - PK_AUD_0HEAD + 1)
+
+#define PK_MS_0HEAD			      0x8740
+#define PK_MS_0BYTE			      0x8743
+#define PK_MS_10BYTE			      0x874d
+#define PK_MS_LEN			      (PK_MS_10BYTE - PK_MS_0HEAD + 1)
+
+#define PK_SPD_0HEAD			      0x8750
+#define PK_SPD_0BYTE			      0x8753
+#define PK_SPD_27BYTE			      0x876e
+#define PK_SPD_LEN			      (PK_SPD_27BYTE - PK_SPD_0HEAD + 1)
+
+#define PK_VS_0HEAD			      0x8770
+#define PK_VS_0BYTE			      0x8773
+#define PK_VS_27BYTE			      0x878e
+#define PK_VS_LEN			      (PK_VS_27BYTE - PK_VS_0HEAD + 1)
+
+#define PK_ACP_0HEAD			      0x8790
+#define PK_ACP_0BYTE			      0x8793
+#define PK_ACP_27BYTE			      0x87ae
+#define PK_ACP_LEN			      (PK_ACP_27BYTE - PK_ACP_0HEAD + 1)
+
+#define PK_ISRC1_0HEAD			      0x87b0
+#define PK_ISRC1_0BYTE			      0x87b3
+#define PK_ISRC1_27BYTE			      0x87c2
+#define PK_ISRC1_LEN			      (PK_ISRC1_27BYTE - PK_ISRC1_0HEAD + 1)
+
+#define PK_ISRC2_0HEAD			      0x87d0
+#define PK_ISRC2_0BYTE			      0x87d3
+#define PK_ISRC2_27BYTE			      0x87ee
+#define PK_ISRC2_LEN			      (PK_ISRC2_27BYTE - PK_ISRC2_0HEAD + 1)
 
 #define BKSV                                  0x8800
 
-- 
2.47.2


