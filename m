Return-Path: <linux-media+bounces-11695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C77878CAC03
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41AC11F22A5D
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ABC839E2;
	Tue, 21 May 2024 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSxHTiRB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DB257308;
	Tue, 21 May 2024 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286502; cv=none; b=Bz3SEqy3ovO3WGD8/FeOGedhkKTIoWIr9UfhUpAxAPtHyh+b6LyxqnavAKDe6mvODsnmQG6NO0BSmh14Df/+IEAVl9eJ7et3Apk6Wv+XQM8LH5cnA425+EY006Uim3lpSuTLNswOOsYOHa0tq9/UeB70NqxHTiwN4KlaX5RwzR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286502; c=relaxed/simple;
	bh=mxuD7pT2tlDQ0zzNZkqWfj36MC0sF3/2cyZNsO+d0UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmOQ205bktjz86zWV0xrXYtR7/eK7KFsm4dkpWdRFeg5IZUjW44O27yjzRIUfLnC7VSTXPGK+kTJGsAprZPbBzejeCDA6B/TrUP0TceDwI6swZASM2rvdwkVSzBhyAsppyLGU+uR6jo+YpW8dgy+BtsnAGmCsaR3KbQGd80noUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSxHTiRB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED4BC32782;
	Tue, 21 May 2024 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286501;
	bh=mxuD7pT2tlDQ0zzNZkqWfj36MC0sF3/2cyZNsO+d0UQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sSxHTiRBj2YO4HQyHB3XYyTth7bNk3Ihk854oFX9r83sg/mlVPXmCtE99JOtTnLcz
	 N0GB7MnStXa+AzPvasoat4gXZ6E8l5/wxHq50l4VOwfyEYgVSDK1MNJgkHixoW850h
	 zN124zuqdZLpcfnishpzCBX+Rwz8n4UNlZ8avdjT/NWuoeEDwb6C1o0WUnVrxkv6IM
	 5zAlepBsi6phkU8TYtCmRlU/vHopLQLJHd4/0Sjzy5vcspUbOJRL9mgHVedAfGyk0O
	 JbpZn8CoblM/7UEgXQe0emvVgFHM86wSJeSjzkHNkpl/CknH268Zr6/Ke1Vt/ZtNHU
	 xE5TV2ESXgRFg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:58 +0200
Subject: [PATCH v14 25/28] drm/vc4: tests: Remove vc4_dummy_plane structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-25-51950db4fedb@kernel.org>
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
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mxuD7pT2tlDQ0zzNZkqWfj36MC0sF3/2cyZNsO+d0UQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xbfTf4Tev/TKoXZe7by8MImYnTOdvfh7e67+Vt4W/
 lYk62JCx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIaRfGhtcn5t4ITDzPyWuo
 /KLgwf4F6w4UsBq/Odn0vMlg67x3ksde6cfd/8rx9XvYN3nPZTFBOoz12YZat/pF/vfqsBb2b/7
 bezGl4FJsn55lt8qR/0fTOy8oTL50bHXmpceTDy7YlTXdLfoNAA==
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


