Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BF41E622A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 15:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390318AbgE1N0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 09:26:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47472 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390161AbgE1N0p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 09:26:45 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SDQeeY044468;
        Thu, 28 May 2020 08:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590672400;
        bh=CQDsbg/jFuS5k0DW0oWnhu9lZUDH1T4RRr1IgvWyVMI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rP94FCfu/Quunv8302JF4J+ab3soikaYlQJgzIgJ8E+I1FnaXsnsHxKR+xFHEFi12
         v2f9Jiqu504r4fI03N/xoTYNFjwlpCtNzThA8CSirp0+0hzB0fwQiA9FIZtDfJmsv4
         t/bDJEgSguContJDjurtkqDzRy2+0NzNsSZq/CRw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SDQeBc099522;
        Thu, 28 May 2020 08:26:40 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 08:26:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 08:26:40 -0500
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SDQWxT130696;
        Thu, 28 May 2020 08:26:39 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch 2/2] media: use v4l2_rect_enclosed helper
Date:   Thu, 28 May 2020 08:26:05 -0500
Message-ID: <20200528132605.18339-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528132605.18339-1-bparrot@ti.com>
References: <20200528132605.18339-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several drivers implement the same enclosed_rectangle() function to
check if a rectangle is enclosed into another. Replace this with the
newly added v4l2_rect_enclosed() helper function.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c   | 19 +++----------------
 .../media/platform/exynos4-is/fimc-capture.c  | 18 +++---------------
 drivers/media/platform/exynos4-is/fimc-lite.c | 18 +++---------------
 drivers/media/platform/s5p-jpeg/jpeg-core.c   | 16 ++--------------
 4 files changed, 11 insertions(+), 60 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 66079cc41f38..0fb9f9ba1219 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -26,6 +26,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-rect.h>
 
 #include "am437x-vpfe.h"
 
@@ -1987,20 +1988,6 @@ vpfe_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	return 0;
 }
 
-static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
-{
-	if (a->left < b->left || a->top < b->top)
-		return 0;
-
-	if (a->left + a->width > b->left + b->width)
-		return 0;
-
-	if (a->top + a->height > b->top + b->height)
-		return 0;
-
-	return 1;
-}
-
 static int
 vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
@@ -2025,10 +2012,10 @@ vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	r.left = clamp_t(unsigned int, r.left, 0, cr.width - r.width);
 	r.top  = clamp_t(unsigned int, r.top, 0, cr.height - r.height);
 
-	if (s->flags & V4L2_SEL_FLAG_LE && !enclosed_rectangle(&r, &s->r))
+	if (s->flags & V4L2_SEL_FLAG_LE && !v4l2_rect_enclosed(&r, &s->r))
 		return -ERANGE;
 
-	if (s->flags & V4L2_SEL_FLAG_GE && !enclosed_rectangle(&s->r, &r))
+	if (s->flags & V4L2_SEL_FLAG_GE && !v4l2_rect_enclosed(&s->r, &r))
 		return -ERANGE;
 
 	s->r = vpfe->crop = r;
diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 705f182330ca..8b10741a847a 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -21,6 +21,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-rect.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
 
@@ -1299,19 +1300,6 @@ static int fimc_cap_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
-static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
-{
-	if (a->left < b->left || a->top < b->top)
-		return 0;
-	if (a->left + a->width > b->left + b->width)
-		return 0;
-	if (a->top + a->height > b->top + b->height)
-		return 0;
-
-	return 1;
-}
-
 static int fimc_cap_s_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
@@ -1334,11 +1322,11 @@ static int fimc_cap_s_selection(struct file *file, void *fh,
 	fimc_capture_try_selection(ctx, &rect, s->target);
 
 	if (s->flags & V4L2_SEL_FLAG_LE &&
-	    !enclosed_rectangle(&rect, &s->r))
+	    !v4l2_rect_enclosed(&rect, &s->r))
 		return -ERANGE;
 
 	if (s->flags & V4L2_SEL_FLAG_GE &&
-	    !enclosed_rectangle(&s->r, &rect))
+	    !v4l2_rect_enclosed(&s->r, &rect))
 		return -ERANGE;
 
 	s->r = rect;
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index 394e0818f2d5..9c666f663ab4 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -25,6 +25,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-rect.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/drv-intf/exynos-fimc.h>
@@ -868,19 +869,6 @@ static int fimc_lite_reqbufs(struct file *file, void *priv,
 	return ret;
 }
 
-/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
-static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
-{
-	if (a->left < b->left || a->top < b->top)
-		return 0;
-	if (a->left + a->width > b->left + b->width)
-		return 0;
-	if (a->top + a->height > b->top + b->height)
-		return 0;
-
-	return 1;
-}
-
 static int fimc_lite_g_selection(struct file *file, void *fh,
 				 struct v4l2_selection *sel)
 {
@@ -922,11 +910,11 @@ static int fimc_lite_s_selection(struct file *file, void *fh,
 	fimc_lite_try_compose(fimc, &rect);
 
 	if ((sel->flags & V4L2_SEL_FLAG_LE) &&
-	    !enclosed_rectangle(&rect, &sel->r))
+	    !v4l2_rect_enclosed(&rect, &sel->r))
 		return -ERANGE;
 
 	if ((sel->flags & V4L2_SEL_FLAG_GE) &&
-	    !enclosed_rectangle(&sel->r, &rect))
+	    !v4l2_rect_enclosed(&sel->r, &rect))
 		return -ERANGE;
 
 	sel->r = rect;
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 86bda3947110..9b22dd8e34f4 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -24,6 +24,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-rect.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
 
@@ -1735,19 +1736,6 @@ static int exynos3250_jpeg_try_downscale(struct s5p_jpeg_ctx *ctx,
 	return 0;
 }
 
-/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
-static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
-{
-	if (a->left < b->left || a->top < b->top)
-		return 0;
-	if (a->left + a->width > b->left + b->width)
-		return 0;
-	if (a->top + a->height > b->top + b->height)
-		return 0;
-
-	return 1;
-}
-
 static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
 				   struct v4l2_rect *r)
 {
@@ -1780,7 +1768,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
 	r->left = round_down(r->left, 2);
 	r->top = round_down(r->top, 2);
 
-	if (!enclosed_rectangle(r, &base_rect))
+	if (!v4l2_rect_enclosed(r, &base_rect))
 		return -EINVAL;
 
 	ctx->crop_rect.left = r->left;
-- 
2.17.1

