Return-Path: <linux-media+bounces-11693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D170F8CABFD
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5351F2143E
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80958249E;
	Tue, 21 May 2024 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipjbspp6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784982489;
	Tue, 21 May 2024 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286496; cv=none; b=PLKt11bTmUnn7b4hSyYYC4c0aII7C7WkhJVl1dGyL+XxBA4aMA/d8Zb9ZcWDNjKvTXmX9xkJL/oPAca+PEGWu4sxTrk6XfJomtPt7JhGreHGJhlpFO1+WSbQahmOKZ+kOgU4DvqkVOIhReWPnwPssNqDzG4VnBfEvh/7hihJPq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286496; c=relaxed/simple;
	bh=jTBz0ob9iuEpIQKBkFz6nD4R8YQTfSw4yt4sHjlZsdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E16njiLJsOYw1b54EmNZRzkalEj1bHvl1lETO5Zz7V52yERsIig3iUxUHSRB8yeNsG7kV93IUwG14MHZlnRMO/x4k+P0lzqE5wqxELGa95AWg4ZrQLhnGDAz+eM7Nf7iFgYWObYZX8aed6vwe4wOH4NXNHmD15nb74Pi1AXWZJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipjbspp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEEAC4AF07;
	Tue, 21 May 2024 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286496;
	bh=jTBz0ob9iuEpIQKBkFz6nD4R8YQTfSw4yt4sHjlZsdU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ipjbspp6kT4b0ps2q6+af5vfrMPBSyhfLs+2+E0otbePGt2Bo8sbHumqv3up2DME3
	 XsvuwXKqoJRwTm5ngsxofb/dkmdyGA7t9sHVDWDmO28iC0Q/L/1u3MjGJ7CVvIMXjI
	 sWvFfnXJRzOwUjNYZSeGO0vOd02tgrIt/SAhSakU2J+NIIDtaj0Wz0i32J6qi7bsIa
	 HT2fwZCFYGX4+Zx2VlnEHXTZBHMuOWUvymhqx13Sb2YMHEI3qIpA8U3zS+i+/jzAJc
	 0veh74EHU0eg/KgE7MdESmhiy6wX1sD4Po1pxmifq5OuYEnAv736EHMVZqfgKe5hqe
	 R9qIrg7QC3fIg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:56 +0200
Subject: [PATCH v14 23/28] drm/connector: hdmi: Create Infoframe DebugFS
 entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-23-51950db4fedb@kernel.org>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5419; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jTBz0ob9iuEpIQKBkFz6nD4R8YQTfSw4yt4sHjlZsdU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xbcOXtQKX7qKa/L2M9uescUEGXxkOvmK26/yRtwJz
 tcV7ZoPO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBExEwYa+V93Pmm1Uz6/8Hh
 zfaLq0Qqt/zZ+WS3p+K1yRp73N0uFE0Vv3whmj95Id9kNX3tIu3VAoz1/jxLE00qNJ4eW6cTy8A
 f17L3todgxJQXJ3bW8R+R3lHrKSJurnG6p2dz0tJLvnk64s0A
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
 drivers/gpu/drm/drm_debugfs.c | 152 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 08fcefd804bc..dd39a5b7a711 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -518,10 +518,160 @@ static const struct file_operations drm_connector_fops = {
 	.llseek = seq_lseek,
 	.release = single_release,
 	.write = connector_write
 };
 
+#define HDMI_MAX_INFOFRAME_SIZE		29
+
+static ssize_t
+audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct drm_connector_hdmi_infoframe *infoframe;
+	struct drm_connector *connector;
+	union hdmi_infoframe *frame;
+	u8 buf[HDMI_INFOFRAME_SIZE(AUDIO)];
+	ssize_t len = 0;
+
+	connector = filp->private_data;
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	infoframe = &connector->hdmi.infoframes.audio;
+	if (!infoframe->set)
+		goto out;
+
+	frame = &infoframe->data;
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
+static const struct file_operations audio_infoframe_fops = {
+	.owner   = THIS_MODULE,
+	.open    = simple_open,
+	.read    = audio_infoframe_read,
+};
+
+static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
+					    struct dentry *parent)
+{
+	struct dentry *file;
+
+	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	return 0;
+}
+
+#define DEFINE_INFOFRAME_FILE(_f) \
+static ssize_t _f##_read_infoframe(struct file *filp, \
+				   char __user *ubuf, \
+				   size_t count,      \
+				   loff_t *ppos)      \
+{ \
+	struct drm_connector_hdmi_infoframe *infoframe; \
+	struct drm_connector_state *conn_state; \
+	struct drm_connector *connector; \
+	union hdmi_infoframe *frame; \
+	struct drm_device *dev; \
+	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
+	ssize_t len = 0; \
+	\
+	connector = filp->private_data; \
+	dev = connector->dev; \
+	\
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL); \
+	\
+	conn_state = connector->state; \
+	infoframe = &conn_state->hdmi.infoframes._f; \
+	if (!infoframe->set) \
+		goto out; \
+	\
+	frame = &infoframe->data; \
+	len = hdmi_infoframe_pack(frame, buf, sizeof(buf)); \
+	if (len < 0) \
+		goto out; \
+	\
+	len = simple_read_from_buffer(ubuf, count, ppos, buf, len); \
+	\
+out: \
+	drm_modeset_unlock(&dev->mode_config.connection_mutex); \
+	return len; \
+} \
+\
+static const struct file_operations _f##_infoframe_fops = { \
+	.owner = THIS_MODULE, \
+	.open = simple_open, \
+	.read = _f##_read_infoframe, \
+}; \
+\
+static int create_hdmi_## _f ## _infoframe_file (struct drm_connector *connector, \
+						 struct dentry *parent) \
+{ \
+	struct dentry *file; \
+	\
+	file = debugfs_create_file(#_f, 0400, parent, connector, & _f ## _infoframe_fops); \
+	if (IS_ERR(file)) \
+		return PTR_ERR(file); \
+	\
+	return 0; \
+}
+
+DEFINE_INFOFRAME_FILE(avi);
+DEFINE_INFOFRAME_FILE(hdmi);
+DEFINE_INFOFRAME_FILE(hdr_drm);
+DEFINE_INFOFRAME_FILE(spd);
+
+static int create_hdmi_infoframe_files(struct drm_connector *connector,
+				       struct dentry *parent)
+{
+	int ret;
+
+	ret = create_hdmi_audio_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_avi_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_hdmi_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_hdr_drm_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_spd_infoframe_file(connector, parent);
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
 	struct dentry *root;
 
@@ -545,10 +695,12 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 
 	/* max bpc */
 	debugfs_create_file("output_bpc", 0444, root, connector,
 			    &output_bpc_fops);
 
+	hdmi_debugfs_add(connector);
+
 	if (connector->funcs->debugfs_init)
 		connector->funcs->debugfs_init(connector, root);
 }
 
 void drm_debugfs_connector_remove(struct drm_connector *connector)

-- 
2.45.0


