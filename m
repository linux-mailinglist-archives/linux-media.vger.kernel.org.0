Return-Path: <linux-media+bounces-11953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 306958D0250
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 545091C234E6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3605615F33A;
	Mon, 27 May 2024 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/X2/b3I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A015F318;
	Mon, 27 May 2024 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818291; cv=none; b=jECbJirn1gCkZmHQs9dhUdfA8gWq/k+UF/xtFg2vIF3T77v9MF6WMgDmzGzyPmAAbE/0DjIQqs6A9Lfmeb2LwgeO0/ybJQ5PCbMRKJqFsdY5vOz+g6j6pJwMQBHHOtD5nBrPeNGeqY3gkW0a/wcnV2CqfKMLHBYRGwZC/v07BgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818291; c=relaxed/simple;
	bh=d1VbX/wJwLIo5m0XWKY1JQJGOOMNNk/jkKVB9eskgVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtiJBdhVTYl0KhLDPTc0k4wUxYDdAgT6zDpwoYxk6o/HveWOuKt3XKXP/B/QVR5Es4JpWkHHaLny1qHpKq3PFk8YmELOSLtHcdsEQlD4moc3b8W8E3LcOV1nJficLPB6XMEMN3J6irRn2KDpbGjCCRtE3TqYZ+oRsvwdxB7TIb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/X2/b3I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20CBC2BBFC;
	Mon, 27 May 2024 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716818291;
	bh=d1VbX/wJwLIo5m0XWKY1JQJGOOMNNk/jkKVB9eskgVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F/X2/b3I0d09ZfyOROE2I68AblaU4/8hY3CPvoRy4++u61Kjbs3zkiguvk0Dt6d+H
	 z+ZG619ekx1IXEeMjTPRZHqpt2WC9/lcwf9ImWGF/+ub7IUI9LlYSfHHiDzHdmoioS
	 FMF65iiMUH05FT7IHfzupvFGNt8vBKqv8yiSlIG+APrcljrgsBujhDVy20qZQiFUI0
	 9keciHbuinECk4ium2/t1Y44NOG4JToZ0liNf6FlDdETVlPNI3benmxg9FVdDF6q8R
	 7Qtqou+eFBWfXk+XJ7xWNmtgwY+0OxQWt0wv3H04lZbVJchY0WIXltXsxpGEExZGhw
	 gtl7RJKyzZ+mQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:57:50 +0200
Subject: [PATCH v15 01/29] drm/connector: Introduce an HDMI connector
 initialization function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-1-c5af16c3aae2@kernel.org>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
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
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3905; i=mripard@kernel.org;
 h=from:subject:message-id; bh=d1VbX/wJwLIo5m0XWKY1JQJGOOMNNk/jkKVB9eskgVE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGkhExOOLp5YsbQpaL9J4jq/HM/EmSazhXd4mEccDbrwv
 caB/5NUx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI3C+M9fGrKrs5vSyifkVL
 TiwWbzPYeXLtkbL9d5eYT1Ps9z2hM//pDstm1fSiqFt1BrO3J21/wlinnxr/PMSa6ciShck7SgM
 nuR0MeS4erPL66ynVYMWUlqWu68/tMPgtfFVapmK+abNhnioA
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
2.45.0


