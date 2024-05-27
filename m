Return-Path: <linux-media+bounces-11978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806798D034C
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF008B2DEEF
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 14:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6197316EC11;
	Mon, 27 May 2024 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKuryF+2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4D15FA73;
	Mon, 27 May 2024 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818360; cv=none; b=X6kVhIDwQ3EQ+tozfdWa1uoYe0xHfpA5g/RNGjav0bP7YkcMBoSS+VR6GyHybKSv97OyFw8Q/9GcHLImK6E0cLYrhNI/JD2BFSIBhVpOgm2iHTd9KP+ldvHXvzmlsNiPUmO6EyQvfOAbGGecv9g80VdmywWEt2KmyUmL7iIfkUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818360; c=relaxed/simple;
	bh=mxuD7pT2tlDQ0zzNZkqWfj36MC0sF3/2cyZNsO+d0UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7XKQ93z3+JNIZXCApgrI/17V0yVxGgZRC/t9vtW1K+yAUqlMUJMC0YD5OjVgL16aHTMf8I1dYhDcVl2enqqRRzBDvIAvsZsbVE78zBB2sHKxQg7XLpDolH/3M1BDY9OwFGYweEnP00nMjJkPcMvqLgbnmyaUtVwbnkj+jY+yHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKuryF+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50293C32789;
	Mon, 27 May 2024 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716818360;
	bh=mxuD7pT2tlDQ0zzNZkqWfj36MC0sF3/2cyZNsO+d0UQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FKuryF+22rQwG/qEy5/4v9bTlcjIZHihnPXlqThJ8uifXGXWQJmU0JO5leNjcERAE
	 DcMGln1awzi2ANxya+/nSnp1i6KUc0BNpNdlZQZXex1kSe3x2gJQzVtdesgnO+vqW9
	 eNo/B4NXIbSntIKKIRUzi47MlWLwfTVt6/DKG+HMCZu77IZGwpKDLHsb2ELt9YrIwp
	 Av/UDH3TzC9Wj6lXRNBQF8hOYefqlkShxIUHX+apR1U0p+scINUYmc/87GVUI/Y4KT
	 hRgaotCU+D+Oe2Sq1SzvaEBDgPETnVnJd+Jy/JlerRGOdfP3Wq+qFfEcCbeXpOAdZh
	 yunFfOpw+wapg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:58:15 +0200
Subject: [PATCH v15 26/29] drm/vc4: tests: Remove vc4_dummy_plane structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-26-c5af16c3aae2@kernel.org>
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
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mxuD7pT2tlDQ0zzNZkqWfj36MC0sF3/2cyZNsO+d0UQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGkhE7PDI86breGa0lSze/XRXVbVmefeHjj0YlntiY6vs
 w2uSK3b2zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmcqSJsc74+oGgP1Fhkosd
 VEuc3NRcSm6dWMHUYTunN1CpYd9TkYB7/12vmF7N3r3tEHvgexsva8aGw9U31t9bMVPq76ULbyV
 fcXkrcX9ryK7ds0Y7ruDuqeOx89znKKSXHbBVvbJy98Ls7glyAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The vc4_dummy_plane structure was introduced as a mean to add
mock-specific fields.

However, we never really used it and it's still strictly equivalent to
vc4_plane (which is in the same situation vs drm_plane), so we can
simply remove the vc4_dummy_plane structure and make the mock code
cleaner.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c       |  6 ++----
 drivers/gpu/drm/vc4/tests/vc4_mock.h       |  9 ++-------
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c | 14 +++++---------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index becb3dbaa548..0731a7d85d7a 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -107,20 +107,18 @@ static const struct vc4_mock_desc vc5_mock =
 );
 
 static int __build_one_pipe(struct kunit *test, struct drm_device *drm,
 			    const struct vc4_mock_pipe_desc *pipe)
 {
-	struct vc4_dummy_plane *dummy_plane;
 	struct drm_plane *plane;
 	struct vc4_dummy_crtc *dummy_crtc;
 	struct drm_crtc *crtc;
 	unsigned int i;
 
-	dummy_plane = vc4_dummy_plane(test, drm, DRM_PLANE_TYPE_PRIMARY);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
+	plane = vc4_dummy_plane(test, drm, DRM_PLANE_TYPE_PRIMARY);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
 
-	plane = &dummy_plane->plane.base;
 	dummy_crtc = vc4_mock_pv(test, drm, plane, pipe->data);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_crtc);
 
 	crtc = &dummy_crtc->crtc.base;
 	for (i = 0; i < pipe->noutputs; i++) {
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.h b/drivers/gpu/drm/vc4/tests/vc4_mock.h
index 2d0b339bd9f3..002b6218960c 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.h
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.h
@@ -19,17 +19,12 @@ struct drm_crtc *vc4_find_crtc_for_encoder(struct kunit *test,
 			return crtc;
 
 	return NULL;
 }
 
-struct vc4_dummy_plane {
-	struct vc4_plane plane;
-};
-
-struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
-					struct drm_device *drm,
-					enum drm_plane_type type);
+struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
+				  enum drm_plane_type type);
 
 struct vc4_dummy_crtc {
 	struct vc4_crtc crtc;
 };
 
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
index 62b18f5f41db..973f5f929097 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
@@ -20,28 +20,24 @@ static const struct drm_plane_funcs vc4_dummy_plane_funcs = {
 
 static const uint32_t vc4_dummy_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
 
-struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
-					struct drm_device *drm,
-					enum drm_plane_type type)
+struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
+				  enum drm_plane_type type)
 {
-	struct vc4_dummy_plane *dummy_plane;
 	struct drm_plane *plane;
 
-	dummy_plane = drmm_universal_plane_alloc(drm,
-						 struct vc4_dummy_plane, plane.base,
+	plane = __drmm_universal_plane_alloc(drm, sizeof(struct drm_plane), 0,
 						 0,
 						 &vc4_dummy_plane_funcs,
 						 vc4_dummy_plane_formats,
 						 ARRAY_SIZE(vc4_dummy_plane_formats),
 						 NULL,
 						 DRM_PLANE_TYPE_PRIMARY,
 						 NULL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
 
-	plane = &dummy_plane->plane.base;
 	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
 
-	return dummy_plane;
+	return plane;
 }

-- 
2.45.0


