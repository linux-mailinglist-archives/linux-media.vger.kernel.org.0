Return-Path: <linux-media+bounces-11696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B40F18CAC06
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 12:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 663FD1F22C02
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182B383CA1;
	Tue, 21 May 2024 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pF7n/aD1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E183A19;
	Tue, 21 May 2024 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286505; cv=none; b=icJ+BulE6yvfFVQHsLNeLUrClJCsSs6h7tABA9IQVRzqTtbGd7H8wqtMBijo+c1vkl+6JHA0ESn4H3NnnhcON2yXq8DK6d+a521yE56fjCHprNcPAzt1di2DuY3br1sFrU5QdMzafQrsOL/PZLGOz81NWIk+g89ZzARNnc0HpXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286505; c=relaxed/simple;
	bh=7kp1dFVIU1GWBJN/S2jYDRC3Mp7yeADRvgV4od+K6E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cithJ8X8kcCa0Uz8MFfhb5RrPhNNdnBhmNpFRqHDrD8zlioJaKH9CeoM6ukWSVvUQs5PcJ8/0u4M6J5/HsLneZ6+DKQbJeXlV/ix5cYXMWF8iCEOHAkMCSBz1py4CaqbnxE9Y5jpNw5fq9t5v17U10eRsmJIKreJaxVX3Q19lsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pF7n/aD1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66847C4AF0B;
	Tue, 21 May 2024 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716286504;
	bh=7kp1dFVIU1GWBJN/S2jYDRC3Mp7yeADRvgV4od+K6E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pF7n/aD1m0nX8qtx2mMskIiVvyXu0B+gCRR90mOnTFK9Ium5E0FC6xbSkqQTwIia4
	 sWfHSQTi65xkRLHf/TRBneFHEExRiwNqLOw75KbBau4TadOuos+O1d8leVP2dv14Dz
	 rMg0jdFJjtUmkEtmLvwKLg3F99EHCD3GTXkPfhaNMEnyrCaFQoaxPJQGx5y82Ydb9v
	 BtLBb+cnc6Aw0c5WmT7JHU15uLagcEgwT9X0Ouon18s3lwD1sFFX0u/dTgSRDhZpGS
	 6ViqMn82kYCFngVm1zw3odZkNT27dumsDJ87tBU+2K9LGhWwV834RMBpgAbtbKA4yz
	 7BvboGtrEve8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:59 +0200
Subject: [PATCH v14 26/28] drm/vc4: tests: Convert to plane creation helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-26-51950db4fedb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7kp1dFVIU1GWBJN/S2jYDRC3Mp7yeADRvgV4od+K6E0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xXeKCmw6+Ct1dobu0PqWxXB/n5RJWFWBwIOXZw05M
 q1mSC/smMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABO5Mpmxvsj1pY/+46/td3pn
 VXG0TOm1dP+78Fl2eYH73rrT963mneaV4pm4aP204puCf05lr3d7ydhwTFjn3NPAqtJOz+f9ZrW
 3LzEqFm2bbJX3xKj61sODUxMv/938d/6pCPYDUzzzr0m29KcAAA==
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


