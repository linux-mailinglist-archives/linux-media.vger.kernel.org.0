Return-Path: <linux-media+bounces-5016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 524188514F5
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 14:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E721128AF8D
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 13:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFD94F897;
	Mon, 12 Feb 2024 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RogV7WOE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C64F61D;
	Mon, 12 Feb 2024 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743686; cv=none; b=QTwWvewoP5Tud8750ZWKfdv2LstUkHmPi8MQBWtGfsoiAuLaO8507WnIov+vlwAYDlWjeXzkCi07mGseJO83NBUT6suqYJYPpWtV3s1uh2Yg086wKdMkEWp3iqKl8fd/f0EqnSbWSnzm38lK5uJbboP9Q5IXHaOciTAlENbgpdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743686; c=relaxed/simple;
	bh=Vk3XPPaEA+7bLaeUH3Fr8CFJ1pQDdSi7lf6Rme2EfCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4tbkXHXYxjc+No3PCwxtSGX2/8m7YuV6xuJDnKA2h3ogii5tBhmZTiZj9cZL3wpnfCr9fXoPqcymhePl/BAM/zVZs6s8tHP4opT3E0ZFUU2ReKvpklEx30+a2aIANEwbf0HiP2oU4FTjG7LfCvd4l6zN1qpDXcD0vTX2bvplIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RogV7WOE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A012C433C7;
	Mon, 12 Feb 2024 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707743686;
	bh=Vk3XPPaEA+7bLaeUH3Fr8CFJ1pQDdSi7lf6Rme2EfCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RogV7WOEShx13Aw6nqQSBmmmI0wc06MHPjtbRBOD7lM5XZSIr7QHlRtYt0h6n1xus
	 xwa1jsm3pKnZ2/De7JeebQNOt//DoB56/gQ7U/NciXe++D8dU1d7BEFMeK/fhf9fxo
	 kdYYcCeL/Fl4dA0lXrJ/IdDFIOv7tdibybnPfV12S1GZfpB8mMn0eE8eXaJRC/eYN6
	 kyq5RGwwJPH3FP6Rcab7phXE9LqSQH02iRPGoDn3wsygyrgYP2qlI+tMbXNkRKjt6D
	 bgsmYci7RF8Eqg25sAupcVgz2JdgV15KSs83IFKqzb1mgdHJZENXmyzileElPlspti
	 jJbECfiOETKkQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:13:10 +0100
Subject: [PATCH v6 27/36] drm/connector: hdmi: Create Infoframe DebugFS
 entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-27-f4bcdc979e6f@kernel.org>
References: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
In-Reply-To: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4158; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Vk3XPPaEA+7bLaeUH3Fr8CFJ1pQDdSi7lf6Rme2EfCY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJPP11ppbqQt9Zlpj2iT4KZxn6d85Wu2XueUiEp/kc
 QkunC3XUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIms28fwzzpi9/3Tl/qZxTfd
 MGrcWVVz+EOQ5lXL+HP5ZsHby2Y/k2Jk2H/UKiVL/gyT7v4quXPv35b8b/jhui9q3qeqgzbvuN/
 3MwIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

There has been some discussions recently about the infoframes sent by
drivers and if they were properly generated.

In parallel, there's been some interest in creating an infoframe-decode
tool similar to edid-decode.

Both would be much easier if we were to expose the infoframes programmed
in the hardware. It won't be perfect since we have no guarantee that
it's actually what goes through the wire, but it's the best we can do.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_debugfs.c | 110 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 08fcefd804bc..160389f3d84b 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -520,6 +520,114 @@ static const struct file_operations drm_connector_fops = {
 	.write = connector_write
 };
 
+struct debugfs_wrapper {
+	struct drm_connector *connector;
+	struct drm_connector_hdmi_infoframe *frame;
+};
+
+#define HDMI_MAX_INFOFRAME_SIZE		29
+
+static ssize_t
+infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	const struct debugfs_wrapper *wrapper = filp->private_data;
+	struct drm_connector *connector = wrapper->connector;
+	struct drm_connector_hdmi_infoframe *infoframe = wrapper->frame;
+	union hdmi_infoframe *frame = &infoframe->data;
+	u8 buf[HDMI_MAX_INFOFRAME_SIZE];
+	ssize_t len = 0;
+
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	if (!infoframe->set)
+		goto out;
+
+	len = hdmi_infoframe_pack(frame, buf, sizeof(buf));
+	if (len < 0)
+		goto out;
+
+	len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+
+out:
+	mutex_unlock(&connector->hdmi.infoframes.lock);
+	return len;
+}
+
+static const struct file_operations infoframe_fops = {
+	.owner   = THIS_MODULE,
+	.open    = simple_open,
+	.read    = infoframe_read,
+};
+
+static int create_hdmi_infoframe_file(struct drm_connector *connector,
+				      struct dentry *parent,
+				      const char *filename,
+				      struct drm_connector_hdmi_infoframe *frame)
+{
+	struct drm_device *dev = connector->dev;
+	struct debugfs_wrapper *wrapper;
+	struct dentry *file;
+
+	wrapper = drmm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
+	if (!wrapper)
+		return -ENOMEM;
+
+	wrapper->connector = connector;
+	wrapper->frame = frame;
+
+	file = debugfs_create_file(filename, 0400, parent, wrapper, &infoframe_fops);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	return 0;
+}
+
+#define CREATE_HDMI_INFOFRAME_FILE(c, p, i)		\
+	create_hdmi_infoframe_file(c, p, #i, &(c)->hdmi.infoframes.i)
+
+static int create_hdmi_infoframe_files(struct drm_connector *connector,
+				       struct dentry *parent)
+{
+	int ret;
+
+	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, audio);
+	if (ret)
+		return ret;
+
+	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, avi);
+	if (ret)
+		return ret;
+
+	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, hdr_drm);
+	if (ret)
+		return ret;
+
+	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, spd);
+	if (ret)
+		return ret;
+
+	ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, hdmi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void hdmi_debugfs_add(struct drm_connector *connector)
+{
+	struct dentry *dir;
+
+	if (!(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	      connector->connector_type == DRM_MODE_CONNECTOR_HDMIB))
+		return;
+
+	dir = debugfs_create_dir("infoframes", connector->debugfs_entry);
+	if (IS_ERR(dir))
+		return;
+
+	create_hdmi_infoframe_files(connector, dir);
+}
+
 void drm_debugfs_connector_add(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -547,6 +655,8 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 	debugfs_create_file("output_bpc", 0444, root, connector,
 			    &output_bpc_fops);
 
+	hdmi_debugfs_add(connector);
+
 	if (connector->funcs->debugfs_init)
 		connector->funcs->debugfs_init(connector, root);
 }

-- 
2.43.0


