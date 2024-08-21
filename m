Return-Path: <linux-media+bounces-16578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8349959F86
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 16:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64C7A1F2601C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 14:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A95E1B2511;
	Wed, 21 Aug 2024 14:16:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2081B1D5B
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249808; cv=none; b=AONC4g+uNdcRlMRsyl93Nf7J0DbghojlTLBpL9IniRsCc2Yyw/ggagny8Dp69OmcbGP4DvX2CSZAjoGpD//I3wWOokLFzV1xI+5eoMJYRl6c7napEFVqZtMu64KtVcCi/+UkvKW5b6Ba8m/zUN0TulO8ys7AS7LSB/yh2gJjgQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249808; c=relaxed/simple;
	bh=tAoRMFi39lZg+m6FnDYux35K3dO9IG8nrfVPiZJ5lxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEYdXSvyQ3HL6OD/S4Y5yghJaodDYwkNs1tuW8d22ovYzf1axkZySSbnbIRAR3g78R69xyIKSLHdo+fj5RF6HRGgpL4PLNjV279VnYgUQPPOV5kMovi8ehRQXTuGoff4jWNRjrwv33M42j/NEzQ7T6Pf/wCCe1B+mAjnzQAe6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF895C32781;
	Wed, 21 Aug 2024 14:16:47 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 3/7] media: i2c: adv7511-v4l2: export InfoFrames to debugfs
Date: Wed, 21 Aug 2024 16:10:17 +0200
Message-ID: <9b2ebe2cb00bf3614bcf09a270ef92d06a9782a0.1724249420.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
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
 drivers/media/i2c/adv7511-v4l2.c | 91 ++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index e9406d552699..4036972af3a6 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -116,6 +116,9 @@ struct adv7511_state {
 	unsigned edid_detect_counter;
 	struct workqueue_struct *work_queue;
 	struct delayed_work edid_handler; /* work entry */
+
+	struct dentry *debugfs_dir;
+	struct v4l2_debugfs_if *infoframes;
 };
 
 static void adv7511_check_monitor_present_status(struct v4l2_subdev *sd);
@@ -483,27 +486,25 @@ static u8 hdmi_infoframe_checksum(u8 *ptr, size_t size)
 	return 256 - csum;
 }
 
-static void log_infoframe(struct v4l2_subdev *sd, const struct adv7511_cfg_read_infoframe *cri)
+static int read_infoframe(struct v4l2_subdev *sd,
+			  const struct adv7511_cfg_read_infoframe *cri,
+			  u8 *buffer)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct device *dev = &client->dev;
-	union hdmi_infoframe frame;
-	u8 buffer[32];
 	u8 len;
 	int i;
 
 	if (!(adv7511_rd(sd, cri->present_reg) & cri->present_mask)) {
 		v4l2_info(sd, "%s infoframe not transmitted\n", cri->desc);
-		return;
+		return 0;
 	}
 
 	memcpy(buffer, cri->header, sizeof(cri->header));
 
 	len = buffer[2];
 
-	if (len + 4 > sizeof(buffer)) {
+	if (len + 4 > V4L2_DEBUGFS_IF_MAX_LEN) {
 		v4l2_err(sd, "%s: invalid %s infoframe length %d\n", __func__, cri->desc, len);
-		return;
+		return 0;
 	}
 
 	if (cri->payload_addr >= 0x100) {
@@ -516,21 +517,38 @@ static void log_infoframe(struct v4l2_subdev *sd, const struct adv7511_cfg_read_
 	buffer[3] = 0;
 	buffer[3] = hdmi_infoframe_checksum(buffer, len + 4);
 
-	if (hdmi_infoframe_unpack(&frame, buffer, len + 4) < 0) {
-		v4l2_err(sd, "%s: unpack of %s infoframe failed\n", __func__, cri->desc);
+	return len + 4;
+}
+
+static void log_infoframe(struct v4l2_subdev *sd,
+			  const struct adv7511_cfg_read_infoframe *cri)
+{
+	union hdmi_infoframe frame;
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct device *dev = &client->dev;
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	int len = read_infoframe(sd, cri, buffer);
+
+	if (len <= 0)
+		return;
+
+	if (hdmi_infoframe_unpack(&frame, buffer, len) < 0) {
+		v4l2_err(sd, "%s: unpack of %s infoframe failed\n",
+			 __func__, cri->desc);
 		return;
 	}
 
 	hdmi_infoframe_log(KERN_INFO, dev, &frame);
 }
 
+static const struct adv7511_cfg_read_infoframe cri[] = {
+	{ "AVI", 0x44, 0x10, { 0x82, 2, 13 }, 0x55 },
+	{ "Audio", 0x44, 0x08, { 0x84, 1, 10 }, 0x73 },
+	{ "SDP", 0x40, 0x40, { 0x83, 1, 25 }, 0x103 },
+};
+
 static void adv7511_log_infoframes(struct v4l2_subdev *sd)
 {
-	static const struct adv7511_cfg_read_infoframe cri[] = {
-		{ "AVI", 0x44, 0x10, { 0x82, 2, 13 }, 0x55 },
-		{ "Audio", 0x44, 0x08, { 0x84, 1, 10 }, 0x73 },
-		{ "SDP", 0x40, 0x40, { 0x83, 1, 25 }, 0x103 },
-	};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(cri); i++)
@@ -1693,6 +1711,34 @@ static bool adv7511_check_edid_status(struct v4l2_subdev *sd)
 	return false;
 }
 
+static ssize_t
+adv7511_debugfs_if_read(u32 type, void *priv,
+			struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	struct v4l2_subdev *sd = priv;
+	int index;
+	int len;
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
+	default:
+		return 0;
+	}
+	len = read_infoframe(sd, &cri[index], buf);
+	if (len > 0)
+		len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+	return len < 0 ? 0 : len;
+}
+
 static int adv7511_registered(struct v4l2_subdev *sd)
 {
 	struct adv7511_state *state = get_adv7511_state(sd);
@@ -1700,9 +1746,16 @@ static int adv7511_registered(struct v4l2_subdev *sd)
 	int err;
 
 	err = cec_register_adapter(state->cec_adap, &client->dev);
-	if (err)
+	if (err) {
 		cec_delete_adapter(state->cec_adap);
-	return err;
+		return err;
+	}
+
+	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
+	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
+		V4L2_DEBUGFS_IF_AVI | V4L2_DEBUGFS_IF_AUDIO |
+		V4L2_DEBUGFS_IF_SPD, sd, adv7511_debugfs_if_read);
+	return 0;
 }
 
 static void adv7511_unregistered(struct v4l2_subdev *sd)
@@ -1710,6 +1763,10 @@ static void adv7511_unregistered(struct v4l2_subdev *sd)
 	struct adv7511_state *state = get_adv7511_state(sd);
 
 	cec_unregister_adapter(state->cec_adap);
+	v4l2_debugfs_if_free(state->infoframes);
+	state->infoframes = NULL;
+	debugfs_remove_recursive(state->debugfs_dir);
+	state->debugfs_dir = NULL;
 }
 
 static const struct v4l2_subdev_internal_ops adv7511_int_ops = {
-- 
2.43.0


