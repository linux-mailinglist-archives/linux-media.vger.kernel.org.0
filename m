Return-Path: <linux-media+bounces-11030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C48BE40B
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BFF01F22B42
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F69E1BED75;
	Tue,  7 May 2024 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CT8hK2/c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7015ECF8;
	Tue,  7 May 2024 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087937; cv=none; b=RiCOrJo0IF7Uwe3+3zyHStPn7vL24avqEm/IIqpoKR30Ad3QAxO/Ff4lH1X8wJOUTAd5Mvhw+NeNVlBa8jshUOPDb6slCwJCG9q9ZMIKzb9gNLg546GtMIImpbgf6mjmdW8x8ZWM/CDUGEfd6Gz848nG/6UGkZiDYUlOdmAOwGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087937; c=relaxed/simple;
	bh=7kp1dFVIU1GWBJN/S2jYDRC3Mp7yeADRvgV4od+K6E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBivFtK8HE8L34L7YsgKoYblaJWSiKks51pgoFfsmF0AXPTBrltVlZMw2JyDHDyO730DnEVjmwynkkD/MWcBi2zyiEomOIiV+zjFFLJqv1mj8tCz/p+D1tFrDN+R9Gh4pvIM+zsakDNCYNnJnjgqKwgzuAFHy4YuL7q1jzYrsso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CT8hK2/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC047C4AF68;
	Tue,  7 May 2024 13:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087937;
	bh=7kp1dFVIU1GWBJN/S2jYDRC3Mp7yeADRvgV4od+K6E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CT8hK2/czlVSPWVCq+lcEXJJQ2N2KEXMXj7mVZ1MoXuYvUSMuSbT8Tfwiv3g/xcfr
	 DyWFD+5eFmbyocOS2n8yVNmgKPYsD0imSvTqFAUO2jCWvpi9ev2/Y9JeJ+0llfiXs5
	 Ix46eE9ssWl265hgJqcv/adOcrdKE/39VF8FbmmICXBkSylQiTUHos/bvxfNq4OHi7
	 Vu5du9zGlCXlO5bW7etcDsb6sKwJQiztim1WuYFxek5K8qFd8GW4thG67DqYfYdx3u
	 T3eQ6F5683kFD3BB7s40EZcK35oLlgvNkACZ7qTEqkGCswEFN6Wx3GLQ7S+ZIuFqkK
	 bBS7I/ec5kGbQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 May 2024 15:17:44 +0200
Subject: [PATCH v13 26/28] drm/vc4: tests: Convert to plane creation helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240507-kms-hdmi-connector-state-v13-26-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7kp1dFVIU1GWBJN/S2jYDRC3Mp7yeADRvgV4od+K6E0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlWmp/2sjf4fHwisZHbZ8K2E7sqLwg2sfT29u7V9KqVu
 PK/efHajqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR/EDG+rrCp9XqF47+0fy0
 +vX0S9768/7fM3oSXBZZuaKAuWhV4SquNgthdev4BX6/Vs2z3PhIj7HOUkngxt+X1yQ2e3+0/fy
 w+5DLNhfFeM/LVwx6+BfHe6YHmp6/UuJ2RqJU8/T8Sec29MQCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have a plane create helper for kunit mocked drivers, let's
convert to it in vc4.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c | 34 +++++++-----------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
index 973f5f929097..14357db82238 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
@@ -1,43 +1,25 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_fourcc.h>
-#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_plane.h>
 
 #include <kunit/test.h>
 
 #include "vc4_mock.h"
 
-static const struct drm_plane_helper_funcs vc4_dummy_plane_helper_funcs = {
-};
-
-static const struct drm_plane_funcs vc4_dummy_plane_funcs = {
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
-	.reset			= drm_atomic_helper_plane_reset,
-};
-
-static const uint32_t vc4_dummy_plane_formats[] = {
-	DRM_FORMAT_XRGB8888,
-};
-
 struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
 				  enum drm_plane_type type)
 {
 	struct drm_plane *plane;
 
-	plane = __drmm_universal_plane_alloc(drm, sizeof(struct drm_plane), 0,
-						 0,
-						 &vc4_dummy_plane_funcs,
-						 vc4_dummy_plane_formats,
-						 ARRAY_SIZE(vc4_dummy_plane_formats),
-						 NULL,
-						 DRM_PLANE_TYPE_PRIMARY,
-						 NULL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
+	KUNIT_ASSERT_EQ(test, type, DRM_PLANE_TYPE_PRIMARY);
 
-	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
+	plane = drm_kunit_helper_create_primary_plane(test, drm,
+						      NULL,
+						      NULL,
+						      NULL, 0,
+						      NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
 
 	return plane;
 }

-- 
2.45.0


