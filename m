Return-Path: <linux-media+bounces-11675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF268CABB9
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22E311F228B8
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE7774E0A;
	Tue, 21 May 2024 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyauIFA5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201556CDCA;
	Tue, 21 May 2024 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286447; cv=none; b=aJcAQWRRV7SgXgDx0BUkcorNVjJnzxVt6+jL1cDB9Bu9GuuQBD1AB0L8bkWjo8Pjf7rJn65H4vSbdJ91suN0N6zQzreD/uvKP3xo3BySrQ1OwBI09uV57/66Y6Zbt/sU2xVBUbE4ETI+DZBpXkmqvZtWK88Y+TiemZ6UBS3s6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286447; c=relaxed/simple;
	bh=owP35/lfcIiPjLv3YT3El2ep8MeKMiw13ZPb1964ipI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=royQnQQurxncJInRa1vhaWniisYCMaxMD0XadMR0yNeSVuLYmnLfgnnybdP93Ie9t7D4n3zHRrNi0MD/WG9K/gHJ7EfzvHOC+VgimG/0k+ChXvKYhR9P5MgMPguIdEgmVsJpuWM0WBRPg6rDfRXMbC9Gg4PV2uUa2TgeGF5dsjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyauIFA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CACEC32782;
	Tue, 21 May 2024 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286446;
	bh=owP35/lfcIiPjLv3YT3El2ep8MeKMiw13ZPb1964ipI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eyauIFA5CNTPF6JAw1CAcXT42apkFEEl9khIPYCcur8pl/eodVcBXKN9mJ2c7XFwL
	 /MEllCQmjcEb3QQkcsbHoNTm8Kjd125icBE4KZL3eIE6xA7Rr6cePn3M3XzU4/vDZu
	 nsLcFxkhfhZq4/CZMUX0/KcqGFOvbRJsZwTjUKYA4gSAi1wJD4pSefkTPA6HvoUlXE
	 rXXrGo5PbciSeo+UUnwW0gUaXv3/WAbsgfvD8jHScRq5FysOGzlRy3KyVZwLpY7Spv
	 YlkXBj0H5w8Z6Lb+lhYnzek6TC1hQWrtXqewti6AI6Pcs3AUQApa8YWMLxsCHJ2F9U
	 WtYGYqb3cZ8yQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:38 +0200
Subject: [PATCH v14 05/28] drm/connector: hdmi: Add output BPC to the
 connector state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-5-51950db4fedb@kernel.org>
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
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8958; i=mripard@kernel.org;
 h=from:subject:message-id; bh=owP35/lfcIiPjLv3YT3El2ep8MeKMiw13ZPb1964ipI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xZe2cMz8z8T/0TL/qefZv/Y+XEIZ/PNquOXslP96P
 bms8uh0x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIsxDGhtduRn5+lzMONR3e
 2Jvw3vPsG7W/S2s17KY1ThCvcQ769Eztpf37443mrrkXhSRTBQzPMTbsruipXdVQzDrJUn2WcMu
 2wpbG9+YFK47YunZvv5ey8wCf+a6SPRJvJ53y2774QqfYvFYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We'll add automatic selection of the output BPC in a following patch,
but let's add it to the HDMI connector state already.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/drm_atomic.c                    |  5 +++++
 drivers/gpu/drm/drm_connector.c                 | 20 +++++++++++++++++++-
 drivers/gpu/drm/tests/drm_connector_test.c      | 12 ++++++++----
 include/drm/drm_connector.h                     | 12 +++++++++++-
 5 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 1e92c1108d23..82293d93b5f8 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -16,10 +16,14 @@
  * drm_atomic_helper_connector_reset().
  */
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state)
 {
+	unsigned int max_bpc = connector->max_bpc;
+
+	new_conn_state->max_bpc = max_bpc;
+	new_conn_state->max_requested_bpc = max_bpc;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
 
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
@@ -34,8 +38,24 @@ EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
  * Zero on success, or an errno code otherwise.
  */
 int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state)
 {
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+
+	if (old_conn_state->hdmi.output_bpc != new_conn_state->hdmi.output_bpc) {
+		struct drm_crtc *crtc = new_conn_state->crtc;
+		struct drm_crtc_state *crtc_state;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		crtc_state->mode_changed = true;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a91737adf8e7..4e11cfb4518b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1141,10 +1141,15 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
 	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
 	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
+	}
+
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
 			drm_printf(p, "\tfb=%d\n", state->writeback_job->fb->base.id);
 
 	if (connector->funcs->atomic_print_state)
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d9961cce8245..da51a2bcb978 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -457,10 +457,11 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @dev: DRM device
  * @connector: A pointer to the HDMI connector to init
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
  * subclassed as part of driver connector objects.
  *
  * Cleanup is automatically handled with a call to
@@ -473,22 +474,39 @@ EXPORT_SYMBOL(drmm_connector_init);
  */
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc)
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc)
 {
 	int ret;
 
 	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
+	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
+	/*
+	 * drm_connector_attach_max_bpc_property() requires the
+	 * connector to have a state.
+	 */
+	if (connector->funcs->reset)
+		connector->funcs->reset(connector);
+
+	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
+	connector->max_bpc = max_bpc;
+
+	if (max_bpc > 8)
+		drm_connector_attach_hdr_output_metadata_property(connector);
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 261d4109946d..2661eb64a5cd 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -182,11 +182,12 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
 /*
  * Test that the registration of a connector without a DDC adapter
@@ -198,11 +199,12 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       NULL);
+				       NULL,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
 /*
  * Test that the registration of an HDMI connector with an HDMI
@@ -215,11 +217,12 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       connector_type,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
 static const unsigned int drm_connector_hdmi_init_type_valid_tests[] = {
 	DRM_MODE_CONNECTOR_HDMIA,
@@ -246,11 +249,12 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       connector_type,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
 static const unsigned int drm_connector_hdmi_init_type_invalid_tests[] = {
 	DRM_MODE_CONNECTOR_Unknown,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 000a2a156619..d4d2ae15bc1e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1035,10 +1035,14 @@ struct drm_connector_state {
 	/**
 	 * @hdmi: HDMI-related variable and properties. Filled by
 	 * @drm_atomic_helper_connector_hdmi_check().
 	 */
 	struct {
+		/**
+		 * @output_bpc: Bits per color channel to output.
+		 */
+		unsigned int output_bpc;
 	} hdmi;
 };
 
 /**
  * struct drm_connector_funcs - control connectors on a given device
@@ -1680,10 +1684,15 @@ struct drm_connector {
 	 * DRM blob property data for the DP MST path property. This should only
 	 * be updated by calling drm_connector_set_path_property().
 	 */
 	struct drm_property_blob *path_blob_ptr;
 
+	/**
+	 * @max_bpc: Maximum bits per color channel the connector supports.
+	 */
+	unsigned int max_bpc;
+
 	/**
 	 * @max_bpc_property: Default connector property for the max bpc to be
 	 * driven out of the connector.
 	 */
 	struct drm_property *max_bpc_property;
@@ -1913,11 +1922,12 @@ int drmm_connector_init(struct drm_device *dev,
 			struct i2c_adapter *ddc);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc);
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);

-- 
2.45.0


