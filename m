Return-Path: <linux-media+bounces-16582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D26959F8A
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 16:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E89BB2315C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 14:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4753B1B1D71;
	Wed, 21 Aug 2024 14:16:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60FB1B1D6D
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249814; cv=none; b=O6vEpwHqmnAh2FQkJmDeeuZoo0uEdQGkCAA8MTEiT2fjP/1xWXurPBZV8F0KO9G5F5bPr9i8J8tFhvPnJI1yMBriR+CYJN/BbwDkq14CJ28hzebPUGdJh4RosBKG+TbBR3HLpwjCLWLYO5EcwICKPUhX07fcu1c8uz72oR3CTDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249814; c=relaxed/simple;
	bh=6/syA/mbnhS9dCHB2veUJ4bEeUfnLsvpE2a+GOx+Rj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4axk4E7XsoCYGGWEopU/Cr1k/sEQ7wN/U+CVJ72pWQPlMiAtRb/VmJKJs8HsOP71W8F4OQ89YQfVWRl1xzzW1nyPW893QK9A+WTNHq6BT+wZGHOPPs/GO/PfgN8TMgFDCnkA0J6Su+A086WIJoic49rS5aAOF92tGCy1Mwx80o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2CBC4AF09;
	Wed, 21 Aug 2024 14:16:53 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 7/7] media: i2c: tc358743: export InfoFrames to debugfs
Date: Wed, 21 Aug 2024 16:10:21 +0200
Message-ID: <501bb64b027022ebcfb9636e9267dfba520c4a67.1724249421.git.hverkuil-cisco@xs4all.nl>
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
---
 drivers/media/i2c/tc358743.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 65d58ddf0287..c7652c0dbaeb 100644
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
+	len = buf[2] + 3;
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


