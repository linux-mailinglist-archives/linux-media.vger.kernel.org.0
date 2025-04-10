Return-Path: <linux-media+bounces-29992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63EA85034
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 01:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 554284C11A8
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 23:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817132153E1;
	Thu, 10 Apr 2025 23:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="THD0TYU6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D0213E94;
	Thu, 10 Apr 2025 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744328597; cv=none; b=LqjORS+xG9ywpGq/nX2hx8R8AJyl9eBlxNNKrJknvQSNCA3aoEOOHV1c+x+/VIRQhxZC9U0a+apBPTZCK63dHTg+K6U0FKDr1Thf0NEKPzGIMaJ7fZa/PITW7eXW9LBZRYPposClbRgvdv4B97c7H1FMhK6dczqCawfCNGhBgdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744328597; c=relaxed/simple;
	bh=G4mR0T4QXAobaLYQreC+Pkhgic1JC7pUgVbD8hJMe78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sb+upODIL3riElTf1Z4jvJ65Mwkqy5fnxdnVM124uMN7KmIbjq9V7i/xFh3xiHsClvBWpzgslOLq2blX6tVPqMf8EcXcuQzS/kGMhlxPEaeeEjmMsnY3Vk5XTuF0BVYGWAt4a2Y6LgQXps7cKQTZSKJe5sqpRlkj5HnYnNd7RrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=THD0TYU6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3038D90;
	Fri, 11 Apr 2025 01:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744328473;
	bh=G4mR0T4QXAobaLYQreC+Pkhgic1JC7pUgVbD8hJMe78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=THD0TYU65P1za8R2cMAzxKyzG92aiB8XXoh6z1KhkZT5T7to3LPusFmWlkn+9SVfd
	 7PQulVyL0tI/6SYPKT89iHn8w2nxUDAh87XR5Hn6exjdp6GlhYUHVuNpFuDeteXFhj
	 3go7TGuPRuzjta5zV+fok+dQ32Lp2Gm7eqt6idB0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 3/3] drm: rcar-du: Create plane color properties
Date: Fri, 11 Apr 2025 02:42:41 +0300
Message-ID: <20250410234241.28123-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the VSP1 driver allows setting per-plance color encoding and
color range for its DRM pipeline, create the corresponding DRM
properties in the DU driver and wire them to the VSP. This completes
support for plane color space.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 7aa0373563a4..09f9ab2111a2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -251,6 +252,12 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 
 	cfg.premult = state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI;
 
+	cfg.color_encoding = state->state.color_encoding == DRM_COLOR_YCBCR_BT601
+			   ? V4L2_YCBCR_ENC_601 : V4L2_YCBCR_ENC_709;
+	cfg.color_range = state->state.color_range == DRM_COLOR_YCBCR_LIMITED_RANGE
+			? V4L2_QUANTIZATION_LIM_RANGE
+			: V4L2_QUANTIZATION_FULL_RANGE;
+
 	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
 			      plane->index, &cfg);
 }
@@ -530,6 +537,14 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 					BIT(DRM_MODE_BLEND_PREMULTI) |
 					BIT(DRM_MODE_BLEND_COVERAGE));
 
+		drm_plane_create_color_properties(&plane->plane,
+						  BIT(DRM_COLOR_YCBCR_BT601) |
+						  BIT(DRM_COLOR_YCBCR_BT709),
+						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+						  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+						  DRM_COLOR_YCBCR_BT601,
+						  DRM_COLOR_YCBCR_LIMITED_RANGE);
+
 		vsp->num_planes++;
 	}
 
-- 
Regards,

Laurent Pinchart


