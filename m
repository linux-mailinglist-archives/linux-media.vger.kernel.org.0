Return-Path: <linux-media+bounces-17042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7C962A32
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8847928650B
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587711A08DB;
	Wed, 28 Aug 2024 14:26:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EEA19E7E0
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855189; cv=none; b=q9HQcaFsm2zKRiOk8A/YvA2n7iWSrlBB+TRs5X8OHeM+ZuQxN8zbAnn7WRBZD0jQuw8bOp1eGnI4v8zhg0WlfuO7ayc97SuBpF7IEHg2X9BxooTERh+fZqzDorEYR+va7OFCApvrtduqIedWKOtw0e5ibN0zj+A2RHHVz1nwIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855189; c=relaxed/simple;
	bh=d+h9MYBVDFUFHuu6gIUTJPiAM8OFPLaOLRBrs9ktDTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYgyroX/Z/1YZIE+6lddGq9ig01b+LFgcwrlz95YQ32g/K3TJec8ZBoz5+CtYiRD0COeysCpf09NQfOS2gF/zPK9surXVx/iLHVVCQTl8xMyNdZlXiE7PRVpeT8LKHCSoinrBe7Arpx8cXh+prvleXE5qhK3u5CAjQuck1FNFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E72C4CEE3;
	Wed, 28 Aug 2024 14:26:27 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 7/7] media: i2c: tda1997x: export InfoFrames to debugfs
Date: Wed, 28 Aug 2024 16:24:13 +0200
Message-ID: <acfecb6497171685e40ebdf6d274df4bb828be49.1724855053.git.hverkuil-cisco@xs4all.nl>
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
---
 drivers/media/i2c/tda1997x.c | 50 ++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 3b7e5ff5b010..2b33fdecb2d2 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -259,6 +259,10 @@ struct tda1997x_state {
 	struct v4l2_ctrl *detect_tx_5v_ctrl;
 	struct v4l2_ctrl *rgb_quantization_range_ctrl;
 
+	/* debugfs */
+	struct dentry *debugfs_dir;
+	struct v4l2_debugfs_if *infoframes;
+
 	/* audio */
 	u8  audio_ch_alloc;
 	int audio_samplerate;
@@ -1263,7 +1267,7 @@ tda1997x_parse_infoframe(struct tda1997x_state *state, u16 addr)
 {
 	struct v4l2_subdev *sd = &state->sd;
 	union hdmi_infoframe frame;
-	u8 buffer[40] = { 0 };
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = { 0 };
 	u8 reg;
 	int len, err;
 
@@ -1938,11 +1942,44 @@ static const struct v4l2_subdev_pad_ops tda1997x_pad_ops = {
  * v4l2_subdev_core_ops
  */
 
+static ssize_t
+tda1997x_debugfs_if_read(u32 type, void *priv, struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct v4l2_subdev *sd = priv;
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	int addr, len;
+
+	switch (type) {
+	case V4L2_DEBUGFS_IF_AVI:
+		addr = AVI_IF;
+		break;
+	case V4L2_DEBUGFS_IF_AUDIO:
+		addr = AUD_IF;
+		break;
+	case V4L2_DEBUGFS_IF_SPD:
+		addr = SPD_IF;
+		break;
+	default:
+		return 0;
+	}
+
+	/* read data */
+	len = io_readn(sd, addr, sizeof(buffer), buffer);
+	if (len > 0) {
+		len = buffer[2] + 4;
+		if (len > V4L2_DEBUGFS_IF_MAX_LEN)
+			len = -EIO;
+	}
+	if (len > 0)
+		len = simple_read_from_buffer(ubuf, count, ppos, buffer, len);
+	return len < 0 ? 0 : len;
+}
+
 static int tda1997x_log_infoframe(struct v4l2_subdev *sd, int addr)
 {
 	struct tda1997x_state *state = to_state(sd);
 	union hdmi_infoframe frame;
-	u8 buffer[40] = { 0 };
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};
 	int len, err;
 
 	/* read data */
@@ -2791,6 +2828,12 @@ static int tda1997x_probe(struct i2c_client *client)
 		goto err_free_media;
 	}
 
+	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
+	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
+		V4L2_DEBUGFS_IF_AVI | V4L2_DEBUGFS_IF_AUDIO |
+		V4L2_DEBUGFS_IF_SPD, sd,
+		tda1997x_debugfs_if_read);
+
 	return 0;
 
 err_free_media:
@@ -2815,6 +2858,9 @@ static void tda1997x_remove(struct i2c_client *client)
 	struct tda1997x_state *state = to_state(sd);
 	struct tda1997x_platform_data *pdata = &state->pdata;
 
+	v4l2_debugfs_if_free(state->infoframes);
+	debugfs_remove_recursive(state->debugfs_dir);
+
 	if (pdata->audout_format) {
 		mutex_destroy(&state->audio_lock);
 	}
-- 
2.43.0


