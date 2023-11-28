Return-Path: <linux-media+bounces-1226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74097FB73D
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 192C1B21FD0
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D324EB44;
	Tue, 28 Nov 2023 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbuhTfTd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B74E1CA;
	Tue, 28 Nov 2023 10:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AF3C433C7;
	Tue, 28 Nov 2023 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167091;
	bh=wWM8yl7LUE1sCKPyQ2G5mn6WCptgUWvk5ehDUlWs3MQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LbuhTfTd2ofRm5rqKtxJEArA+Qzz6p9f4xuOWEiOMauiQRa8Y8eFdRIf8fYFDm9xd
	 86U+KpQxH+PMuJAdSzQvX6qPWFFo9in55cAKC3eCeLoaAAmQDxsr3ESgAySmb1v9EN
	 nlWKcjT/DK0isJu8CWqn+isHjgvONHMBEXS4HZA46TiRW+AG76j8WWt9FJN2vRo2uX
	 K1827gLYKC/UilH3oatETx+6brP3NSgbF0l6t79zr44/YFgws3YPCILsFwGKMBTcxn
	 aqofbVKPfAgvWEsaUJy56u34quK+eig1SX3UJLcEJc1LgymMmMq2OPmoUGU9u+qu86
	 a6uprQX7nIGBg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:21 +0100
Subject: [PATCH v4 10/45] drm/connector: hdmi: Add RGB Quantization Range
 to the connector state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-10-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16593; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wWM8yl7LUE1sCKPyQ2G5mn6WCptgUWvk5ehDUlWs3MQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y8ecXm3d73Ci8iYzf2OL85uvfFQ8MxEQaamYJHun
 edkb9hnd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiXhUM/3OvqD65Kjt3792E
 qhYdb9FV5zqq6zrfbWbPY91iNz3L6C3D/4jeiNJkqeaV0uJTtIO831VcOpFkUeW4c8pEcYHaEpH
 HfAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

HDMI controller drivers will need to figure out the RGB range they need
to configure based on a mode and property values. Let's expose that in
the HDMI connector state so drivers can just use that value.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c                       |   4 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  44 +++
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 335 +++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h              |   1 +
 include/drm/drm_connector.h                        |   6 +
 5 files changed, 389 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index de7cdc36a245..5708a53bee93 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1143,9 +1143,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
 		drm_printf(p, "\tbroadcast_rgb=%s\n",
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
+		drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
+	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 37193c6f9fca..d0c24971537b 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -31,6 +31,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
@@ -622,6 +623,47 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
 
+static const struct drm_display_mode *
+connector_state_get_mode(const struct drm_connector_state *conn_state)
+{
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+
+	state = conn_state->state;
+	if (!state)
+		return NULL;
+
+	crtc = conn_state->crtc;
+	if (!crtc)
+		return NULL;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!crtc_state)
+		return NULL;
+
+	return &crtc_state->mode;
+}
+
+static bool hdmi_is_full_range(const struct drm_connector *connector,
+			       const struct drm_connector_state *state)
+{
+	const struct drm_display_info *display = &connector->display_info;
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(state);
+
+	if (state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_FULL)
+		return true;
+
+	if (state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
+		return false;
+
+	if (!display->is_hdmi)
+		return true;
+
+	return drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL ? true : false;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
@@ -642,6 +684,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
+	new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
+
 	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 21e6f796ee13..7750c3d214a4 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -328,7 +328,342 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
 }
 
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to auto with a mode that isn't the
+ * VIC-1 mode, we will get a limited RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_AUTO);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to auto with a VIC-1 mode, we will get
+ * a full RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_AUTO);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to full with a mode that isn't the
+ * VIC-1 mode, we will get a full RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_FULL);
+
+	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to full with a VIC-1 mode, we will get
+ * a full RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_FULL);
+
+	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to limited with a mode that isn't the
+ * VIC-1 mode, we will get a limited RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_LIMITED);
+
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to limited with a VIC-1 mode, we will
+ * get a limited RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_LIMITED);
+
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
+	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_full_cea_mode),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_full_cea_mode_vic_1),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode_vic_1),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
 	{ }
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index d59d2b3aef9a..8072ac18e536 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -88,6 +88,7 @@ void
 __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
 void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 					  struct drm_connector_state *state);
+
 void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
 						     struct drm_private_state *state);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3867a4c01b78..76eecd449fb8 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1066,6 +1066,12 @@ struct drm_connector_state {
 		 * Broadcast RGB selection value.
 		 */
 		enum drm_hdmi_broadcast_rgb broadcast_rgb;
+
+		/**
+		 * @is_full_range: Is the output supposed to use a full
+		 * RGB Quantization Range or not?
+		 */
+		bool is_full_range;
 	} hdmi;
 };
 

-- 
2.41.0


