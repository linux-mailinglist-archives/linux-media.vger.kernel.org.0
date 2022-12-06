Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA336444C3
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 14:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbiLFNk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 08:40:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbiLFNkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 08:40:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4371927B2E;
        Tue,  6 Dec 2022 05:40:22 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1175F558;
        Tue,  6 Dec 2022 14:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670334017;
        bh=tPwYiDh/6WY9ouRwCbzRrdEso7JqxttJ5+Wwe+65iKg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FX0sx7wrMK+zsn5pekovTL5G9oA0aaKDfzj3LH1/ukGano1YPX0FOaEu4dwaZBVnY
         WGjplzPjiNBDhO3vJG1owxeLtVlIGBGxuR+FrGHEqLZVRvqyH8JY/ysfZ3a+2jOhwO
         YsiVQtDBCMEYpj1OjTDRVWADW/xvz3wYi0BScya8=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)
Date:   Tue,  6 Dec 2022 15:39:54 +0200
Message-Id: <20221206133954.397098-8-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
 2 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 8c2719efda2a..8ccabf5a30c4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.bpp = 32,
 		.planes = 1,
 		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBX1010102,
+		.v4l2 = V4L2_PIX_FMT_XBGR2101010,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBA1010102,
+		.v4l2 = V4L2_PIX_FMT_ABGR2101010,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB2101010,
+		.v4l2 = V4L2_PIX_FMT_BGRA1010102,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
 	}, {
 		.fourcc = DRM_FORMAT_YVYU,
 		.v4l2 = V4L2_PIX_FMT_YVYU,
@@ -307,6 +325,12 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
 		.bpp = 24,
 		.planes = 3,
 		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_Y210,
+		.v4l2 = V4L2_PIX_FMT_Y210,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 2,
 	},
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index e465aef41585..6f3e109a4f80 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -139,6 +139,42 @@ static const u32 rcar_du_vsp_formats[] = {
 	DRM_FORMAT_YVU444,
 };
 
+/*
+ * Gen4 supports the same formats as above, and additionally 2-10-10-10 RGB
+ * formats and Y210 format.
+ */
+static const u32 rcar_du_vsp_formats_gen4[] = {
+	DRM_FORMAT_RGB332,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_RGBX1010102,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU444,
+	DRM_FORMAT_Y210,
+};
+
 static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 {
 	struct rcar_du_vsp_plane_state *state =
@@ -436,14 +472,23 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 					 ? DRM_PLANE_TYPE_PRIMARY
 					 : DRM_PLANE_TYPE_OVERLAY;
 		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
+		unsigned int num_formats;
+		const u32 *formats;
+
+		if (rcdu->info->gen < 4) {
+			num_formats = ARRAY_SIZE(rcar_du_vsp_formats);
+			formats = rcar_du_vsp_formats;
+		} else {
+			num_formats = ARRAY_SIZE(rcar_du_vsp_formats_gen4);
+			formats = rcar_du_vsp_formats_gen4;
+		}
 
 		plane->vsp = vsp;
 		plane->index = i;
 
 		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
 					       crtcs, &rcar_du_vsp_plane_funcs,
-					       rcar_du_vsp_formats,
-					       ARRAY_SIZE(rcar_du_vsp_formats),
+					       formats, num_formats,
 					       NULL, type, NULL);
 		if (ret < 0)
 			return ret;
-- 
2.34.1

