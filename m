Return-Path: <linux-media+bounces-6648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A738750AA
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 14:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A611D1F223FB
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 13:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A62A13A27C;
	Thu,  7 Mar 2024 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdDA3bhb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5790813A257;
	Thu,  7 Mar 2024 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818798; cv=none; b=VvKObYTwKXRXTS3u4NIu8gSuNPqZltMvABpUdNY3yKVReyXKhL14c+AzWvefRn83cAxiO8p2hAMyiXtPzDw5d1uls6DzUYwAD2bptOrCijSPrAMwFoB9KfwD166iZXkWwUdBW92huUwEU8aJZuJ8bX4fX12ATltAKn/Wo2dcyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818798; c=relaxed/simple;
	bh=8/opTRplB5Ku39o1OEl1lg2hR6YKBkFWnOlEJPXB6sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayGArZe3I9M6b7zhHq3rzP9/Lsmwhe8yfMijdBLZDtYfKgOHcHugIOuOdglL5L1z5HFQNZOowviiY59KICBtFfMJEFegLY1TaDfOd5m0oD7uNdF1iF8BveEqcEXlcJdSnPCnPniz1ONgxvt0QdRndAHt1vNYyuaU0KBv7BcPVqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdDA3bhb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEBEC433F1;
	Thu,  7 Mar 2024 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709818797;
	bh=8/opTRplB5Ku39o1OEl1lg2hR6YKBkFWnOlEJPXB6sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MdDA3bhbX/OzxExLma434a37a9DescftEPHuAB00drw/SRBYGrQiQ59SgPAUcf1Zb
	 ukXNzhbm7tYC9NGmJE3N4aHHSOA6XSZtFAbnoEqUUL23KPdqcx7E4vJNAWQt9E07DA
	 n73WdtIHUBSneOkxmdoLUJIsA6oRrrNB6+x1y6BogouCxbSxxU83h0tgbjbgaqBbeb
	 z2idhPOkf8lle1/6dr0NSF56NJ0nKq6wjCVoEo/0DqGloTCNEou8HK//30ueAUIk2K
	 8XnljkcT83CMVpW2F7Ne8HO5LK4JqrFJzncC2F+eLa47uJsI5w4mNsPYXAtvfOUIrO
	 gMempxCxLHh/g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Mar 2024 14:38:49 +0100
Subject: [PATCH v8 22/27] drm/connector: hdmi: Create Infoframe DebugFS
 entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-kms-hdmi-connector-state-v8-22-ef6a6f31964b@kernel.org>
References: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
In-Reply-To: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4334; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8/opTRplB5Ku39o1OEl1lg2hR6YKBkFWnOlEJPXB6sg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKkvD2d+OGJ7xDM02Cxbq1XLLCg6td9h1fpKD/3nR922y
 nnxK3J2lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCKKvxgZ7hsd9irbPmf9DrGl
 t9nyGdZNU8v66OPNtOzSp+gQRSktVob/Dh7ufJ+rjns1VPjZLrjhrKlqc25nfcWhRmG+1X2TuA/
 wAwA=
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
@@ -518,10 +518,118 @@ static const struct file_operations drm_connector_fops = {
 	.llseek = seq_lseek,
 	.release = single_release,
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
 	struct dentry *root;
 
@@ -545,10 +653,12 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 
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
2.43.2


