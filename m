Return-Path: <linux-media+bounces-17041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F6B962A31
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE946286A76
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A616C1A0B04;
	Wed, 28 Aug 2024 14:26:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0B1A08A6
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855187; cv=none; b=Ge+QgXT1I/Zq8FReOjdyEt8M+HDVg1WJ0ym+hyw42eiPiUJaQqn8VuTvfNqk1KbtWUxiYMcfz9biBYCteKZpLm1C4WAs/5D9P1y4NSSZ5kRoB6ByDvdIxZG5ZyJdVWjqC56YXzSd6dozBJKeKtefaUOpJ9DqL57Jwy/hyv2Us2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855187; c=relaxed/simple;
	bh=WyLUK9qxEWRCmERO4HnPBNDG3Zizvulk6s6BojFRn3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q84YuCb2qkDIP1VHoZe0bFbbZIeGo4kfPuOhUGmN9uY4dD+kPxsaWNwHKrJp374PM6RgQcAW0fyFkFL4goGNLy5vzDl/V6AySnzbwopOBzF+FOTbA6XvQGhai5z9sKDrlynLAoXN2dIKiUmEIGdprB0G0VsfT2BziIqcFI3052s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E2AC4CEE5;
	Wed, 28 Aug 2024 14:26:25 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/7] media: i2c: tc358743: export InfoFrames to debugfs
Date: Wed, 28 Aug 2024 16:24:12 +0200
Message-ID: <4570f3d5f8e543b4d3d845528afbf3a6dd647f7a.1724855053.git.hverkuil-cisco@xs4all.nl>
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
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/tc358743.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 65d58ddf0287..fd49bf824051 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -87,6 +87,10 @@ struct tc358743_state {
 	struct timer_list timer;
 	struct work_struct work_i2c_poll;
 
+	/* debugfs */
+	struct dentry *debugfs_dir;
+	struct v4l2_debugfs_if *infoframes;
+
 	/* edid  */
 	u8 edid_blocks_written;
 
@@ -430,12 +434,35 @@ static void tc358743_erase_bksv(struct v4l2_subdev *sd)
 
 /* --------------- AVI infoframe --------------- */
 
+static ssize_t
+tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
+			 char __user *ubuf, size_t count, loff_t *ppos)
+{
+	u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
+	struct v4l2_subdev *sd = priv;
+	int len;
+
+	if (!is_hdmi(sd))
+		return 0;
+
+	if (type != V4L2_DEBUGFS_IF_AVI)
+		return 0;
+
+	i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_16BYTE - PK_AVI_0HEAD + 1);
+	len = buf[2] + 4;
+	if (len > V4L2_DEBUGFS_IF_MAX_LEN)
+		len = -ENOENT;
+	if (len > 0)
+		len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+	return len < 0 ? 0 : len;
+}
+
 static void print_avi_infoframe(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct device *dev = &client->dev;
 	union hdmi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
+	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)] = {};
 
 	if (!is_hdmi(sd)) {
 		v4l2_info(sd, "DVI-D signal - AVI infoframe not supported\n");
@@ -2161,6 +2188,11 @@ static int tc358743_probe(struct i2c_client *client)
 	if (err < 0)
 		goto err_work_queues;
 
+	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
+	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
+						  V4L2_DEBUGFS_IF_AVI, sd,
+						  tc358743_debugfs_if_read);
+
 	v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
 		  client->addr << 1, client->adapter->name);
 
@@ -2188,6 +2220,8 @@ static void tc358743_remove(struct i2c_client *client)
 		flush_work(&state->work_i2c_poll);
 	}
 	cancel_delayed_work_sync(&state->delayed_work_enable_hotplug);
+	v4l2_debugfs_if_free(state->infoframes);
+	debugfs_remove_recursive(state->debugfs_dir);
 	cec_unregister_adapter(state->cec_adap);
 	v4l2_async_unregister_subdev(sd);
 	v4l2_device_unregister_subdev(sd);
-- 
2.43.0


