Return-Path: <linux-media+bounces-5696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A565860123
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 19:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 308D6285340
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 18:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1BF140E25;
	Thu, 22 Feb 2024 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6IImUp7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D87159561;
	Thu, 22 Feb 2024 18:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625719; cv=none; b=ah9N4rGaUpE8WwCD/GOYYnLu7OK9Pg0De7ez6oa5LBoJm7YBJ8P+vv6gGcZap4RCGueAIuEnrNeFTm6GGpIc4ouxt9L80g4LgKesGK5RcQDf9kKQlcdXmNUnNfUdjoKWB4zLwqMolUMjgXVjyv8hMsTytW7qVNdfEK0kpllJcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625719; c=relaxed/simple;
	bh=/bnaT0uAZ4rOmQ62HDTgavxdwTBZFeEC9ReuYp1t42E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLXp8Bh5lF1RVvlPtzf2zm0I9YE8GBDzbrBoymTwQkt4G4d/5s9KewyyPXXBY1gKwPOCBnJT5bJWMGW+vTChwTCKWBbvLeFmrwxVV98JItO+xipr8T4y8R0H2S95jUMGnH9lO4plKwGjcE65svIJCq/6iCb8S0vWj9FUvxKtVmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6IImUp7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12FDC433F1;
	Thu, 22 Feb 2024 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708625719;
	bh=/bnaT0uAZ4rOmQ62HDTgavxdwTBZFeEC9ReuYp1t42E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t6IImUp7q0+jBz/SYYudGd3z8bkRy7KOdLICaxviN3T5A6qujoHDkB3svwy8jKvba
	 EO4g7EsK0/wq9E81KsIjJD6tY0FW+xG+7I3IIiCxrWInxhZSaL2odT/1SX1ctza/yk
	 KjDRKvkjwnvK0GCHXsxiI2eTKftyIPvo6bM7v+3ypQey1sgoqt5ecJsH3AOyx3aJnF
	 vkcDwMBAfl65cOi0pIpWEeKdit9oN1kdLZ7J2IYhv+VFTnONocIvtv/pyrFbHl6/LB
	 jlUGIgZMj3RyK87GfLSYSRJIu61fBrX86dNLW7tJXICQoyGv1Pro1QEFx+SZXHqUBa
	 6Qx7t+1lIl2/g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Feb 2024 19:14:04 +0100
Subject: [PATCH v7 18/36] drm/tests: Add HDMI connector rate filter hook
 tests
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-kms-hdmi-connector-state-v7-18-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3581; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/bnaT0uAZ4rOmQ62HDTgavxdwTBZFeEC9ReuYp1t42E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnX+77UGFwumVh/4vL3kHuPQz6/Xrzw0Pc7x5e2/Jme3
 pa0vpU9pqOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQAT6bjPyNCdaeNRutYo3LSJ
 9f43P6c/+0z/thyvDv/8vkBKdX5mZQHD/9DN70U2PzKWNFu0rH3Wl/AbP7fqrBKy370oc8E2dvU
 pz1kA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The previous patch adds a new hook for HDMI connectors to filter out
configurations based on the TMDS character rate. Let's add some tests to
make sure it works as expected.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 989661ad3aee..5a8750153510 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -113,6 +113,18 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
 };
 
+static enum drm_mode_status
+reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+				       const struct drm_display_mode *mode,
+				       unsigned long long tmds_rate)
+{
+	return MODE_BAD;
+}
+
+static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
+	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
@@ -491,7 +503,60 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, preferred->clock * 1500);
 }
 
+/*
+ * Test that if we filter a rate through our hook, it's indeed rejected
+ * by the whole atomic_check logic.
+ *
+ * We do so by first doing a commit on the pipeline to make sure that it
+ * works, change the HDMI helpers pointer, and then try the same commit
+ * again to see if it fails as it should.
+ */
+static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_crtc_state *crtc_state;
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
+	/* You shouldn't be doing that at home. */
+	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->connectors_changed = true;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
+	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_8bpc),

-- 
2.43.2


