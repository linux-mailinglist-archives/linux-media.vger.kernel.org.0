Return-Path: <linux-media+bounces-6840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A45878262
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 15:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AC1B285926
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 14:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E9644393;
	Mon, 11 Mar 2024 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stuHJK4k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BD055E6E;
	Mon, 11 Mar 2024 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710168650; cv=none; b=A2kSRJEWFaZ1+7usqJv6NP5FdiSj5F18hKIzoYS5NmLCCj7DIQ79ls2oUqVM8SiyXxu0l3c5Ed1/8btxmfYq1msprGdp2xNnih7sgyxBSb7BrFnM9tDVnppZnPLINLoQBh/G3BG/MPnm+/wMho2IaLubodBA687N1kID206j02E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710168650; c=relaxed/simple;
	bh=ETz9nlR0atHV46UY5p7KYA1JJn6mH150Vspr8N/BJpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lT/czN+PgsTWJoWEVIW9iqAbzESWl8RncUt7Bi+7p2pkzdN5b56XXNB0R/jzRmDLYaWmwbobc0lUhuWG6EvEGzHTDDBfQFIKu32R/420YrlD1eDfJq0p6OVt3hmn+28sTYijfbW7/e79vDF7f4KP+ptN66YAn2dOgdtLYOE3TdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stuHJK4k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C14AC433F1;
	Mon, 11 Mar 2024 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710168649;
	bh=ETz9nlR0atHV46UY5p7KYA1JJn6mH150Vspr8N/BJpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=stuHJK4kAMKnpLGvqQ3XSbW18gDPnLc9EyjAm4Hq2C5L0CcDcFVUPJmFV7k7eIGP8
	 AWBpOMihYQ/94G7Sk/oKyE/Hf35syciEHzqOBl95lk512KSBk1Z76/FocH3Vgdl++V
	 jDc33TvI9V2y3OdFH0AOyRU9ov04l8x6ikvEjUmVZ5DZ7+nt52wp5/oNn/e7+dD8/A
	 tK958yF6v+jWYAzdkMf93z9gC7/R2DOzUBlKM4WQLI2GrYIqvvqpr8wizlHDDywwf1
	 HZOfk7mqFViXHfr94lW2+/YMapvXBioapqOziK9NXpmmTcMhDgedpXsWdKweODE9vT
	 +Lp/GRc6kMyqw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Mar 2024 15:49:45 +0100
Subject: [PATCH v9 17/27] drm/tests: Add tests for Broadcast RGB property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-kms-hdmi-connector-state-v9-17-d45890323344@kernel.org>
References: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
In-Reply-To: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13818; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ETz9nlR0atHV46UY5p7KYA1JJn6mH150Vspr8N/BJpw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnvpfi11rpdWv29mCnqcGPLnj9OjJqy/4oL8hqSGRt4n
 3eJZZt1lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCIv9Rj+cJsfU/q/YOEOFz7p
 N/P5p5e//XpyScmJy/WNZyT/bDr23orhr8BJrYhsmzBNTT2RCwxhjhaTszZn9R9gZ5lQYVbhn/m
 eEwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

This had a bunch of kunit tests to make sure our code to handle the
Broadcast RGB property behaves properly.

This requires bringing a bit of infrastructure to create mock HDMI
connectors, with custom EDIDs.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 151 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 116 ++++++++++++++++
 2 files changed, 267 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index c0f26422e925..3de15cec2f5f 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -222,10 +222,138 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	return priv;
 }
 
+/*
+ * Test that if we change the RGB quantization property to a different
+ * value, we trigger a mode change on the connector's CRTC, which will
+ * in turn disable/enable the connector.
+ */
+static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
+
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->hdmi.broadcast_rgb,
+			new_conn_state->hdmi.broadcast_rgb);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+	KUNIT_EXPECT_EQ(test, new_conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_FULL);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
+}
+
+/*
+ * Test that if we set the RGB quantization property to the same value,
+ * we don't trigger a mode change on the connector's CRTC and leave the
+ * connector unaffected.
+ */
+static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state->hdmi.broadcast_rgb = old_conn_state->hdmi.broadcast_rgb;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	KUNIT_EXPECT_EQ(test,
+			old_conn_state->hdmi.broadcast_rgb,
+			new_conn_state->hdmi.broadcast_rgb);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
+}
+
 /*
  * Test that if we change the maximum bpc property to a different value,
  * we trigger a mode change on the connector's CRTC, which will in turn
  * disable/enable the connector.
  */
@@ -1057,10 +1185,12 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 8);
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
 }
 
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
+	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
@@ -1088,10 +1218,30 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 static struct kunit_suite drm_atomic_helper_connector_hdmi_check_test_suite = {
 	.name		= "drm_atomic_helper_connector_hdmi_check",
 	.test_cases	= drm_atomic_helper_connector_hdmi_check_tests,
 };
 
+/*
+ * Test that the value of the Broadcast RGB property out of reset is set
+ * to auto.
+ */
+static void drm_test_check_broadcast_rgb_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_AUTO);
+}
+
 /*
  * Test that if the connector was initialised with a maximum bpc of 8,
  * the value of the max_bpc and max_requested_bpc properties out of
  * reset are also set to 8, and output_bpc is set to 0 and will be
  * filled at atomic_check time.
@@ -1205,10 +1355,11 @@ static void drm_test_check_tmds_char_value(struct kunit *test)
 	conn_state = conn->state;
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, 0);
 }
 
 static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
+	KUNIT_CASE(drm_test_check_broadcast_rgb_value),
 	KUNIT_CASE(drm_test_check_bpc_8_value),
 	KUNIT_CASE(drm_test_check_bpc_10_value),
 	KUNIT_CASE(drm_test_check_bpc_12_value),
 	KUNIT_CASE(drm_test_check_format_value),
 	KUNIT_CASE(drm_test_check_tmds_char_value),
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index ac4b8d00e992..d5320a089887 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -562,10 +562,67 @@ static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
 static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
 	.name = "drm_get_tv_mode_from_name",
 	.test_cases = drm_get_tv_mode_from_name_tests,
 };
 
+struct drm_hdmi_connector_get_broadcast_rgb_name_test {
+	unsigned int kind;
+	const char *expected_name;
+};
+
+#define BROADCAST_RGB_TEST(_kind, _name)	\
+	{					\
+		.kind = _kind,			\
+		.expected_name = _name,		\
+	}
+
+static void drm_test_drm_hdmi_connector_get_broadcast_rgb_name(struct kunit *test)
+{
+	const struct drm_hdmi_connector_get_broadcast_rgb_name_test *params =
+		test->param_value;
+
+	KUNIT_EXPECT_STREQ(test,
+			   drm_hdmi_connector_get_broadcast_rgb_name(params->kind),
+			   params->expected_name);
+}
+
+static const
+struct drm_hdmi_connector_get_broadcast_rgb_name_test
+drm_hdmi_connector_get_broadcast_rgb_name_valid_tests[] = {
+	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic"),
+	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_FULL, "Full"),
+	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235"),
+};
+
+static void
+drm_hdmi_connector_get_broadcast_rgb_name_valid_desc(const struct drm_hdmi_connector_get_broadcast_rgb_name_test *t,
+						     char *desc)
+{
+	sprintf(desc, "%s", t->expected_name);
+}
+
+KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_broadcast_rgb_name_valid,
+		  drm_hdmi_connector_get_broadcast_rgb_name_valid_tests,
+		  drm_hdmi_connector_get_broadcast_rgb_name_valid_desc);
+
+static void drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid(struct kunit *test)
+{
+	KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_broadcast_rgb_name(3));
+};
+
+static struct kunit_case drm_hdmi_connector_get_broadcast_rgb_name_tests[] = {
+	KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_broadcast_rgb_name,
+			 drm_hdmi_connector_get_broadcast_rgb_name_valid_gen_params),
+	KUNIT_CASE(drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid),
+	{ }
+};
+
+static struct kunit_suite drm_hdmi_connector_get_broadcast_rgb_name_test_suite = {
+	.name = "drm_hdmi_connector_get_broadcast_rgb_name",
+	.test_cases = drm_hdmi_connector_get_broadcast_rgb_name_tests,
+};
+
 struct drm_hdmi_connector_get_output_format_name_test {
 	unsigned int kind;
 	const char *expected_name;
 };
 
@@ -620,10 +677,67 @@ static struct kunit_case drm_hdmi_connector_get_output_format_name_tests[] = {
 static struct kunit_suite drm_hdmi_connector_get_output_format_name_test_suite = {
 	.name = "drm_hdmi_connector_get_output_format_name",
 	.test_cases = drm_hdmi_connector_get_output_format_name_tests,
 };
 
+static void drm_test_drm_connector_attach_broadcast_rgb_property(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	int ret;
+
+	ret = drmm_connector_init(&priv->drm, connector,
+				  &dummy_funcs,
+				  DRM_MODE_CONNECTOR_HDMIA,
+				  &priv->ddc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_connector_attach_broadcast_rgb_property(connector);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	prop = connector->broadcast_rgb_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_connector_attach_broadcast_rgb_property(connector);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	prop = connector->broadcast_rgb_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+static struct kunit_case drm_connector_attach_broadcast_rgb_property_tests[] = {
+	KUNIT_CASE(drm_test_drm_connector_attach_broadcast_rgb_property),
+	KUNIT_CASE(drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector),
+	{ }
+};
+
+static struct kunit_suite drm_connector_attach_broadcast_rgb_property_test_suite = {
+	.name = "drm_connector_attach_broadcast_rgb_property",
+	.init = drm_test_connector_init,
+	.test_cases = drm_connector_attach_broadcast_rgb_property_tests,
+};
+
 /*
  * Test that for a given mode, with 8bpc and an RGB output the TMDS
  * character rate is equal to the mode pixel clock.
  */
 static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb(struct kunit *test)
@@ -943,12 +1057,14 @@ static struct kunit_suite drm_connector_hdmi_compute_mode_clock_test_suite = {
 };
 
 kunit_test_suites(
 	&drmm_connector_hdmi_init_test_suite,
 	&drmm_connector_init_test_suite,
+	&drm_connector_attach_broadcast_rgb_property_test_suite,
 	&drm_connector_hdmi_compute_mode_clock_test_suite,
 	&drm_get_tv_mode_from_name_test_suite,
+	&drm_hdmi_connector_get_broadcast_rgb_name_test_suite,
 	&drm_hdmi_connector_get_output_format_name_test_suite
 );
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");

-- 
2.43.2


