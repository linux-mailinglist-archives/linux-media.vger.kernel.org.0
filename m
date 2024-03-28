Return-Path: <linux-media+bounces-7829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED388C7A6
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 16:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 811101F81BAF
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 15:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C576A13CFAC;
	Tue, 26 Mar 2024 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEKqVZGS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CCF13CF94;
	Tue, 26 Mar 2024 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711467634; cv=none; b=WY79mq4hmk5j4aTUWC0MNEpEpEYtKqwfSYwHdxsVUsC8QekLl6YAsvvC2b+D5dOWBSjZmEfF7aYO1uUsUiSFTQDVJlLi4o0jyj/cuA8N9BKadz15NpXHZpyvEtyHJeDf1Wh/nAN3Ekkjz7vMK5sHaH4Csxn9wpeXaXnwXE3PTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711467634; c=relaxed/simple;
	bh=fUzqY0ouRur7PJeAXKsb/9zPUDH+Gpv/H3MTr507Vho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLRO3Ewf1829zGUYObRKNvbT7S6wO9ZA6EgOHtSL0axtKOxciM1YCyQ87taAbs2FQLk7R9gwQHX4n/9CC5QxngwBDAZdXKd3P1xJxgFgq5DaYRKG1PcxdvIyjb5MNj55cKRSdO7y2FGty1Aag+QRjVm0fsQ30nCSMHtz4rLqDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEKqVZGS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8D6C433C7;
	Tue, 26 Mar 2024 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711467633;
	bh=fUzqY0ouRur7PJeAXKsb/9zPUDH+Gpv/H3MTr507Vho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oEKqVZGSrF+WMoYW2NrOGE4Q/8syFDMCpmLdAQ8EnEXT4PWGs3npl0jr+515W2XQw
	 nFzgXExfUc1rn2bs/f4sjJGMCe902WRRRncqoBNKRF+5d/UEQGGnykVAm8kbXgpwNe
	 o3lB1c+teZenRvPU7fXOoWKUmyFp9sXVvoPpJ0Jrxjap0yvNYOEph9RFFMfI6Ly3rD
	 J3hdM1jMNxw+vM3/H0I23q5gMBGZpn9+HGmFR3oGUIAa0RPxVOL/o+XnfTDB5lysXu
	 pm0cAcK+duVxU+yCFOhm/BXN3o6MGpt33tnv4zecd6LEccRx7h+D2unKn5o5UodKWR
	 F6q5LOP2m/1EQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 Mar 2024 16:40:05 +0100
Subject: [PATCH v11 01/28] drm/connector: Introduce an HDMI connector
 initialization function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-kms-hdmi-connector-state-v11-1-c5680ffcf261@kernel.org>
References: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
In-Reply-To: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
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
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3844; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fUzqY0ouRur7PJeAXKsb/9zPUDH+Gpv/H3MTr507Vho=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMb+ISp3a4qzp5PDt2XXGxqDKrXVBXIUtg25s+sSpmj
 7fm2zM7prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwETuqzE2fGlTWpBn5pUQsFLt
 Btufaz+d3r/UOPRE1fsRt42V8xTjy29+NXca7vmXb2vhGGtQKS3J2PCkxlsk+7jo5NeLd08JE7T
 a2nqicnlXa9MhXqMtf8NqYqxKZc2lV/UmXH6y7GDDaR4eYwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A lot of the various HDMI drivers duplicate some logic that depends on
the HDMI spec itself and not really a particular hardware
implementation.

Output BPC or format selection, infoframe generation are good examples
of such areas.

This creates a lot of boilerplate, with a lot of variations, which makes
it hard for userspace to rely on, and makes it difficult to get it right
for drivers.

In the next patches, we'll add a lot of infrastructure around the
drm_connector and drm_connector_state structures, which will allow to
abstract away the duplicated logic. This infrastructure comes with a few
requirements though, and thus we need a new initialization function.

Hopefully, this will make drivers simpler to handle, and their behaviour
more consistent.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_connector.c | 39 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  5 +++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b0516505f7ae..d9961cce8245 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -450,10 +450,49 @@ int drmm_connector_init(struct drm_device *dev,
 
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @funcs: callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const struct drm_connector_funcs *funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc)
+{
+	int ret;
+
+	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
+		return -EINVAL;
+
+	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_connector_hdmi_init);
+
 /**
  * drm_connector_attach_edid_property - attach edid property.
  * @connector: the connector
  *
  * Some connector types like DRM_MODE_CONNECTOR_VIRTUAL do not get a
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fe88d7fc6b8f..4491c4c2fb6e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1902,10 +1902,15 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 int drmm_connector_init(struct drm_device *dev,
 			struct drm_connector *connector,
 			const struct drm_connector_funcs *funcs,
 			int connector_type,
 			struct i2c_adapter *ddc);
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const struct drm_connector_funcs *funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);

-- 
2.44.0


