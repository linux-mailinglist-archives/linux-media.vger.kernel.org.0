Return-Path: <linux-media+bounces-11684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2C8CABE1
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F521F21392
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553A573500;
	Tue, 21 May 2024 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dn7kM1vG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A874D73199;
	Tue, 21 May 2024 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286471; cv=none; b=AYUr4p/myAhNaodLuSjrqwfLEWBYfgKe5uJrFuHrWs3xHeH4KmpHpnejV+1pw4W15uKLAH7fUInt4Zu22bthsS67vKG6NTiVfHaLuTVwbD7FKMLwE2cu1vZEDbvLsV2BVrOpjniAOf6XLxMPn//pZT9N8Qn0rfAHUpmHuqBV3qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286471; c=relaxed/simple;
	bh=uVl9xOyVk9U87YPq57W+/cP/Zw0Y1GWDSmUbflWVwuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5v7TRyElBQdrxqRKPQnDKC/Zj0JzrFzEnDxJ+dU3x6tuW/bcRuTWPOUyB6egbVKdB+8oqwwKpkcvo2Q3jtdMqjwU4ABNLq1NYjQoEBaT/r8lE9zxOOI35EwD8euhdzkTNEGBYgpX7q/1YtSlmLMAVEiQHPKXApe6ZVIlazKH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dn7kM1vG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E24C2BD11;
	Tue, 21 May 2024 10:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286471;
	bh=uVl9xOyVk9U87YPq57W+/cP/Zw0Y1GWDSmUbflWVwuw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dn7kM1vGu5j1c8BSJ3Snxezxjeqp5X1FPbA4BksNWehHCxSTD8KGPPEv542vn3IPl
	 +oKJGiCf1uTa65exZhFYilvAPo7y+dWSiJfs9u2VRlmViGbNofIErmhFO/V6bSrCuB
	 uvMPOqAKPyGMwYzPgweYxmusWoaaRo6kO/UvZGraEuzfKc/X4NAsRau8KC0gIKPW2c
	 X8FVhzWM/WUafRhCBNxXw/Jz0nT57gBfAmU7rdAu2u+Q3fOLqJeww5kd1m2+4ibfwN
	 OtOcBaSz7lreNRZ6kNsRY/zdTgnG4YQB5zYmNbUYvDJgXVTpq/SnIboSmT2HAM1NiB
	 6Fu1K6gRFDP1A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:47 +0200
Subject: [PATCH v14 14/28] drm/tests: Add HDMI connector rate filter hook
 tests
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-14-51950db4fedb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3898; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uVl9xOyVk9U87YPq57W+/cP/Zw0Y1GWDSmUbflWVwuw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xdeKN1SfS5q//4dCxgXP5Mjzqvftzyd7lX4qULH5t
 5zVRGRTx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIxm2MDVu4t3zvauVfuKIz
 /t7l/zuWaPIsk+I6oCW95H7CzjsHgqw2su76OENo8eV7nje0tp1ea8fYsOLCXP6fVo4LC+yaA3u
 zMvzzHpgeVYltEGtW8pgrf6ZNKmj54U5ftntuG7OOODg+/vkdAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The previous patch adds a new hook for HDMI connectors to filter out
configurations based on the TMDS character rate. Let's add some tests to
make sure it works as expected.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 7f9a48902db4..ead998a691e7 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -113,10 +113,22 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 }
 
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
 		connector_to_priv(connector);
 	const struct drm_edid *edid;
@@ -491,11 +503,64 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_bpc, 12);
 	KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
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
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_10bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_12bpc),

-- 
2.45.0


