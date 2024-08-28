Return-Path: <linux-media+bounces-17040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBD962A30
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B319DB2444E
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386301A08CB;
	Wed, 28 Aug 2024 14:26:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D458D1A08A6
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855185; cv=none; b=jT+noj/XRgcWyPjZ8iHaV+ZA9dt9R2zv4fseCmjSDKFc0eFFnr/Vbm2/WPIa5ZLeWshbzS9xnKOtxpOvDjC1YqDUE/e/FgwEuMFymQdK0uh4wAyQ7diX1NuShtxyCJZ6uL7zVij/urfN5mg9H1zD2kAhbjyZtyv07NznsjWXaws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855185; c=relaxed/simple;
	bh=E40XJ07rORkwiBn7FaIrCqKPAWEs9RyARJLw+K9CPKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+vlawfBeDfQRNIc14KfDzpLboksg2glQmaxfg8g6e4SM7UNnzjwcfQg9tKkcuf9A6dC2lAkWvmuSGEd7M1NW4zrLtjrjMm3jeLJQ6V+//oVd0wLcuRJBD22Hiiiwm17KnzZeEJVpC8RWlUfTAylzki5UAWURymTrwdP18eACLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C50C4CEE3;
	Wed, 28 Aug 2024 14:26:24 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/7] media: i2c: adv7842: export InfoFrames to debugfs
Date: Wed, 28 Aug 2024 16:24:11 +0200
Message-ID: <4f05b36f16e55330fd02f2db4f9a86941eda4bf8.1724855053.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export InfoFrames to debugfs.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/adv7842.c | 120 ++++++++++++++++++++++++++----------
 1 file changed, 88 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 014fc913225c..e445699da85b 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -114,6 +114,9 @@ struct adv7842_state {
 	bool restart_stdi_once;
 	bool hdmi_port_a;
 
+	struct dentry *debugfs_dir;
+	struct v4l2_debugfs_if *infoframes;
+
 	/* i2c clients */
 	struct i2c_client *i2c_sdp_io;
 	struct i2c_client *i2c_sdp;
@@ -2565,58 +2568,65 @@ struct adv7842_cfg_read_infoframe {
 	u8 payload_addr;
 };
 
-static void log_infoframe(struct v4l2_subdev *sd, const struct adv7842_cfg_read_infoframe *cri)
+static const struct adv7842_cfg_read_infoframe adv7842_cri[] = {
+	{ "AVI", 0x01, 0xe0, 0x00 },
+	{ "Audio", 0x02, 0xe3, 0x1c },
+	{ "SDP", 0x04, 0xe6, 0x2a },
+	{ "Vendor", 0x10, 0xec, 0x54 }
+};
+
+static int adv7842_read_infoframe_buf(struct v4l2_subdev *sd, int index,
+				      u8 buf[V4L2_DEBUGFS_IF_MAX_LEN])
 {
-	int i;
-	u8 buffer[32];
-	union hdmi_infoframe frame;
-	u8 len;
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct device *dev = &client->dev;
+	const struct adv7842_cfg_read_infoframe *cri = &adv7842_cri[index];
+	int len, i;
 
 	if (!(io_read(sd, 0x60) & cri->present_mask)) {
-		v4l2_info(sd, "%s infoframe not received\n", cri->desc);
-		return;
+		v4l2_dbg(1, debug, sd,
+			 "%s infoframe not received\n", cri->desc);
+		return -ENOENT;
 	}
 
 	for (i = 0; i < 3; i++)
-		buffer[i] = infoframe_read(sd, cri->head_addr + i);
+		buf[i] = infoframe_read(sd, cri->head_addr + i);
 
-	len = buffer[2] + 1;
+	len = buf[2] + 1;
 
-	if (len + 3 > sizeof(buffer)) {
-		v4l2_err(sd, "%s: invalid %s infoframe length %d\n", __func__, cri->desc, len);
-		return;
+	if (len + 3 > V4L2_DEBUGFS_IF_MAX_LEN) {
+		v4l2_err(sd, "%s: invalid %s infoframe length %d\n",
+			 __func__, cri->desc, len);
+		return -ENOENT;
 	}
 
 	for (i = 0; i < len; i++)
-		buffer[i + 3] = infoframe_read(sd, cri->payload_addr + i);
-
-	if (hdmi_infoframe_unpack(&frame, buffer, len + 3) < 0) {
-		v4l2_err(sd, "%s: unpack of %s infoframe failed\n", __func__, cri->desc);
-		return;
-	}
-
-	hdmi_infoframe_log(KERN_INFO, dev, &frame);
+		buf[i + 3] = infoframe_read(sd, cri->payload_addr + i);
+	return len + 3;
 }
 
 static void adv7842_log_infoframes(struct v4l2_subdev *sd)
 {
-	int i;
-	static const struct adv7842_cfg_read_infoframe cri[] = {
-		{ "AVI", 0x01, 0xe0, 0x00 },
-		{ "Audio", 0x02, 0xe3, 0x1c },
-		{ "SDP", 0x04, 0xe6, 0x2a },
-		{ "Vendor", 0x10, 0xec, 0x54 }
-	};
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct device *dev = &client->dev;
+	union hdmi_infoframe frame;
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	int len, i;
 
 	if (!(hdmi_read(sd, 0x05) & 0x80)) {
 		v4l2_info(sd, "receive DVI-D signal, no infoframes\n");
 		return;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(cri); i++)
-		log_infoframe(sd, &cri[i]);
+	for (i = 0; i < ARRAY_SIZE(adv7842_cri); i++) {
+		len = adv7842_read_infoframe_buf(sd, i, buffer);
+		if (len < 0)
+			continue;
+
+		if (hdmi_infoframe_unpack(&frame, buffer, len) < 0)
+			v4l2_err(sd, "%s: unpack of %s infoframe failed\n",
+				 __func__, adv7842_cri[i].desc);
+		else
+			hdmi_infoframe_log(KERN_INFO, dev, &frame);
+	}
 }
 
 #if 0
@@ -3263,6 +3273,41 @@ static int adv7842_subscribe_event(struct v4l2_subdev *sd,
 	}
 }
 
+static ssize_t
+adv7842_debugfs_if_read(u32 type, void *priv, struct file *filp,
+			char __user *ubuf, size_t count, loff_t *ppos)
+{
+	u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	struct v4l2_subdev *sd = priv;
+	int index;
+	int len;
+
+	if (!is_hdmi(sd))
+		return 0;
+
+	switch (type) {
+	case V4L2_DEBUGFS_IF_AVI:
+		index = 0;
+		break;
+	case V4L2_DEBUGFS_IF_AUDIO:
+		index = 1;
+		break;
+	case V4L2_DEBUGFS_IF_SPD:
+		index = 2;
+		break;
+	case V4L2_DEBUGFS_IF_HDMI:
+		index = 3;
+		break;
+	default:
+		return 0;
+	}
+
+	len = adv7842_read_infoframe_buf(sd, index, buf);
+	if (len > 0)
+		len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+	return len < 0 ? 0 : len;
+}
+
 static int adv7842_registered(struct v4l2_subdev *sd)
 {
 	struct adv7842_state *state = to_state(sd);
@@ -3270,8 +3315,15 @@ static int adv7842_registered(struct v4l2_subdev *sd)
 	int err;
 
 	err = cec_register_adapter(state->cec_adap, &client->dev);
-	if (err)
+	if (err) {
 		cec_delete_adapter(state->cec_adap);
+	} else {
+		state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
+		state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
+			V4L2_DEBUGFS_IF_AVI | V4L2_DEBUGFS_IF_AUDIO |
+			V4L2_DEBUGFS_IF_SPD | V4L2_DEBUGFS_IF_HDMI, sd,
+			adv7842_debugfs_if_read);
+	}
 	return err;
 }
 
@@ -3280,6 +3332,10 @@ static void adv7842_unregistered(struct v4l2_subdev *sd)
 	struct adv7842_state *state = to_state(sd);
 
 	cec_unregister_adapter(state->cec_adap);
+	v4l2_debugfs_if_free(state->infoframes);
+	state->infoframes = NULL;
+	debugfs_remove_recursive(state->debugfs_dir);
+	state->debugfs_dir = NULL;
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.43.0


