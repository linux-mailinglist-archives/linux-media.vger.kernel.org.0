Return-Path: <linux-media+bounces-11685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B32B58CABE4
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 460601F21710
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23197F7EA;
	Tue, 21 May 2024 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFB0t3XO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED47F7C7;
	Tue, 21 May 2024 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286474; cv=none; b=LmhFIHx5IerkxWHnLOuTisTooKc1H0sRPCv5+ybcTudio533X4sGSmM73EQPaeeU1SEHR6/BWwFYvwV/KM2xhwKTVYtKrL2/p1+EsVEB2saMFCgnDHjBLg79AX+OihErZWfjnTHr/K87z1T7JKU84fFoUYwixy49ZNrahZBt/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286474; c=relaxed/simple;
	bh=hY3frsuO17qvdoIupMHk30YJOn/PuAFfk8Kd41b00x4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KDSuvid/1Lasaz/XBZcCxDMA9swVblkoTp340p3dQ6+WRnBm4ithzRVqfs0Dtyj9qjqgEtiaiFh+8x5MLkajlbd3jrStxUHlgs4JB657O7OnQmmxiqdEetNIIww1cfugDTH5NrpnobqW23bDzaYYFiAl388jKpi10mCWOfLu370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFB0t3XO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2118C4AF07;
	Tue, 21 May 2024 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286474;
	bh=hY3frsuO17qvdoIupMHk30YJOn/PuAFfk8Kd41b00x4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sFB0t3XO3UfAXY/8Uwo6Bsj2aEK2rQJEzicVHzZ7wvROyVPIsHfoH/GkEGEMFGFM4
	 H8WJgpwdmQAsYwCNCQgZYSZ7QEn7KBnqO7Ava6A082wpC5D0fhjTrh4Ao70fYVJrPO
	 cqRb0HR3HTytgmgzl8JeDy53Xnj9z9QHl/vSTTOuSuWOa3PHnmNuk23elbI6iozlQZ
	 KeOBwQlp8+qA6dThf8SqZDfnnQMZ2X2BhLfYWi/zlNl7RyfOwxoVrEOjZVlCN4dUlC
	 ALBKPlpWqwM4ez0upVAHFRJ50FpvdE9mf+cIvhr4+eR6PKC98tBFPBbc7lbaJwS2Xl
	 EvDBKAlDbNubA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:48 +0200
Subject: [PATCH v14 15/28] drm/connector: hdmi: Compute bpc and format
 automatically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-15-51950db4fedb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12161; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hY3frsuO17qvdoIupMHk30YJOn/PuAFfk8Kd41b00x4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xdefuLybpCu3cOfaY4evf4449Ofc/xNFAf6VLgmSN
 ZkeDjoTOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEzKsYGxrYdSNftVwTW2FU
 4v1G+8yGOsHPld76fl+Of3u54J8Ct5/RyX2hv4NCzRmEnqn3TJLjZqwvujb5UMoutXvemcnX315
 4UNznHd3X1OAo+HjhJ8nGp/8dnWNEg5/+mFPENkX2MkdKSwYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have all the infrastructure needed, we can add some code
that will, for a given connector state and mode, compute the best output
format and bpc.

The algorithm is equivalent to the one already found in i915 and vc4.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 205 ++++++++++++++++++++-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  25 ++-
 2 files changed, 218 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 063421835dba..93cb30dba86e 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: MIT
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -46,10 +48,118 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
 		return NULL;
 
 	return &crtc_state->mode;
 }
 
+static bool
+sink_supports_format_bpc(const struct drm_connector *connector,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode,
+			 unsigned int format, unsigned int bpc)
+{
+	struct drm_device *dev = connector->dev;
+	u8 vic = drm_match_cea_mode(mode);
+
+	/*
+	 * CTA-861-F, section 5.4 - Color Coding & Quantization states
+	 * that the bpc must be 8, 10, 12 or 16 except for the default
+	 * 640x480 VIC1 where the value must be 8.
+	 *
+	 * The definition of default here is ambiguous but the spec
+	 * refers to VIC1 being the default timing in several occasions
+	 * so our understanding is that for the default timing (ie,
+	 * VIC1), the bpc must be 8.
+	 */
+	if (vic == 1 && bpc != 8) {
+		drm_dbg_kms(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
+		return false;
+	}
+
+	if (!info->is_hdmi &&
+	    (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
+		drm_dbg_kms(dev, "DVI Monitors require an RGB output at 8 bpc\n");
+		return false;
+	}
+
+	if (!(connector->hdmi.supported_formats & BIT(format))) {
+		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
+			    drm_hdmi_connector_get_output_format_name(format));
+		return false;
+	}
+
+	switch (format) {
+	case HDMI_COLORSPACE_RGB:
+		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
+
+		/*
+		 * In some cases, like when the EDID readout fails, or
+		 * is not an HDMI compliant EDID for some reason, the
+		 * color_formats field will be blank and not report any
+		 * format supported. In such a case, assume that RGB is
+		 * supported so we can keep things going and light up
+		 * the display.
+		 */
+		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
+			drm_warn(dev, "HDMI Sink doesn't support RGB, something's wrong.\n");
+
+		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg_kms(dev, "RGB format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV422:
+		drm_dbg_kms(dev, "YUV422 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+			drm_dbg_kms(dev, "Sink doesn't support YUV422.\n");
+			return false;
+		}
+
+		if (bpc != 12) {
+			drm_dbg_kms(dev, "YUV422 only supports 12 bpc.\n");
+			return false;
+		}
+
+		drm_dbg_kms(dev, "YUV422 format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV444:
+		drm_dbg_kms(dev, "YUV444 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
+			drm_dbg_kms(dev, "Sink doesn't support YUV444.\n");
+			return false;
+		}
+
+		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg_kms(dev, "YUV444 format supported in that configuration.\n");
+
+		return true;
+	}
+
+	return false;
+}
+
 static enum drm_mode_status
 hdmi_clock_valid(const struct drm_connector *connector,
 		 const struct drm_display_mode *mode,
 		 unsigned long long clock)
 {
@@ -90,10 +200,101 @@ hdmi_compute_clock(const struct drm_connector *connector,
 	conn_state->hdmi.tmds_char_rate = clock;
 
 	return 0;
 }
 
+static bool
+hdmi_try_format_bpc(const struct drm_connector *connector,
+		    struct drm_connector_state *conn_state,
+		    const struct drm_display_mode *mode,
+		    unsigned int bpc, enum hdmi_colorspace fmt)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	drm_dbg_kms(dev, "Trying %s output format\n",
+		    drm_hdmi_connector_get_output_format_name(fmt));
+
+	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc)) {
+		drm_dbg_kms(dev, "%s output format not supported with %u bpc\n",
+			    drm_hdmi_connector_get_output_format_name(fmt),
+			    bpc);
+		return false;
+	}
+
+	ret = hdmi_compute_clock(connector, conn_state, mode, bpc, fmt);
+	if (ret) {
+		drm_dbg_kms(dev, "Couldn't compute clock for %s output format and %u bpc\n",
+			    drm_hdmi_connector_get_output_format_name(fmt),
+			    bpc);
+		return false;
+	}
+
+	drm_dbg_kms(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
+		    drm_hdmi_connector_get_output_format_name(fmt),
+		    bpc, conn_state->hdmi.tmds_char_rate);
+
+	return true;
+}
+
+static int
+hdmi_compute_format(const struct drm_connector *connector,
+		    struct drm_connector_state *conn_state,
+		    const struct drm_display_mode *mode,
+		    unsigned int bpc)
+{
+	struct drm_device *dev = connector->dev;
+
+	/*
+	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
+	 * devices, for modes that only support YCbCr420.
+	 */
+	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_RGB)) {
+		conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
+		return 0;
+	}
+
+	drm_dbg_kms(dev, "Failed. No Format Supported for that bpc count.\n");
+
+	return -EINVAL;
+}
+
+static int
+hdmi_compute_config(const struct drm_connector *connector,
+		    struct drm_connector_state *conn_state,
+		    const struct drm_display_mode *mode)
+{
+	struct drm_device *dev = connector->dev;
+	unsigned int max_bpc = clamp_t(unsigned int,
+				       conn_state->max_bpc,
+				       8, connector->max_bpc);
+	unsigned int bpc;
+	int ret;
+
+	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
+		drm_dbg_kms(dev, "Trying with a %d bpc output\n", bpc);
+
+		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
+		if (ret)
+			continue;
+
+		conn_state->hdmi.output_bpc = bpc;
+
+		drm_dbg_kms(dev,
+			    "Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
+			    mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
+			    conn_state->hdmi.output_bpc,
+			    drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
+			    conn_state->hdmi.tmds_char_rate);
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
  * @state: the DRM State object
  *
@@ -113,13 +314,11 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		drm_atomic_get_new_connector_state(state, connector);
 	const struct drm_display_mode *mode =
 		connector_state_get_mode(new_conn_state);
 	int ret;
 
-	ret = hdmi_compute_clock(connector, new_conn_state, mode,
-				 new_conn_state->hdmi.output_bpc,
-				 new_conn_state->hdmi.output_format);
+	ret = hdmi_compute_config(connector, new_conn_state, mode);
 	if (ret)
 		return ret;
 
 	if (old_conn_state->hdmi.output_bpc != new_conn_state->hdmi.output_bpc ||
 	    old_conn_state->hdmi.output_format != new_conn_state->hdmi.output_format) {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index ead998a691e7..a49a544d7b49 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -70,13 +70,10 @@ static int light_up_connector(struct kunit *test,
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	conn_state = drm_atomic_get_connector_state(state, connector);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
-	conn_state->hdmi.output_bpc = connector->max_bpc;
-	conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
-
 	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
@@ -251,14 +248,19 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	priv = drm_atomic_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
@@ -272,15 +274,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
 
-	new_conn_state->hdmi.output_bpc = 8;
+	new_conn_state->max_requested_bpc = 8;
 
 	KUNIT_ASSERT_NE(test,
-			old_conn_state->hdmi.output_bpc,
-			new_conn_state->hdmi.output_bpc);
+			old_conn_state->max_requested_bpc,
+			new_conn_state->max_requested_bpc);
 
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -320,14 +322,19 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	priv = drm_atomic_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
@@ -670,11 +677,11 @@ static void drm_test_check_format_value(struct kunit *test)
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
 	conn_state = conn->state;
-	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, 0);
 }
 
 /*
  * Test that the value of the output format property out of reset is set
  * to 0, and will be computed at atomic_check time.

-- 
2.45.0


