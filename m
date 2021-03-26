Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7161934A1B7
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 07:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhCZGYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 02:24:02 -0400
Received: from mout02.posteo.de ([185.67.36.66]:33455 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229871AbhCZGYA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 02:24:00 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 7F5FE240100
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1616739838; bh=LrP8uBzoPuY+H7JyRQ1Ppe3Ej4iPf2DtmT03FM6ei/Y=;
        h=From:To:Cc:Subject:Date:From;
        b=AOkgP3uiVBshEbaCmEqbMC5yNBKd2hTw7VozHgyC2R3zvsojhntgICHyRTtdnn3Ve
         AXMvbHYHLNsv+4UB4Pc6SZnGB3VJOF+Et1vhYiVgjp9JjRolpz0GO5wgY78kwHvI4W
         jsFFwja9GNhAYbO+NmRDh9qAGk8xTsV7BodRywiy5qs6UhK5WSB93hrY7OgO9/w+Cq
         8Y64oG6yXPros4UhATXQO2pLkX/Y7U11x6qhJY+WpUKIAdccBNKQUthRFcsZMgrs3R
         7qMIaO4QMzrT287Ps0PQ+5memnz3usfxCA63qGxRNZ27GIORT8mvC3Arh16Iyn1huo
         PLqv9A2D8sN1g==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4F6Bkj6fskz9rxd;
        Fri, 26 Mar 2021 07:23:57 +0100 (CET)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, heiko@sntech.de,
        Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: [PATCH v2] media: rkisp1: Increase ISP input resolution limit
Date:   Fri, 26 Mar 2021 07:23:30 +0100
Message-Id: <20210326062329.53103-1-sebastian.fricke@posteo.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current implementation limits the maximum sink pad resolution to
4032x3024, which is mentioned by the Rockchip TRM as the maximum size
to handle black level calibration. But the ISP can actually set it's
sink pad format to a size of 4416x3312.
Allow higher sink pad resolutions in order to allow a bigger range of
sensor modes to be used with the RkISP1.
Apply the previous limit to the sink pad crop instead of the format to
satisfy the requirement of the ISP.

Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
---
Changes since v1:
- Improve the name of the new macro -> s/*_PROCESSING/*_CROP/
- Add a descriptive comment to explain why we need those 2 new macros
- Combine the separated 2 patches into a single one as patch 2 was
  depending on patch 1, which would have introduced a bisection breakage
  (Thanks to Laurent Pinchart)

This patch was tested with a NanoPC-T4 and a OV13850, which provides a
resolution of 4224x3136.
---
 .../platform/rockchip/rkisp1/rkisp1-common.h   | 18 +++++++++++++-----
 .../platform/rockchip/rkisp1/rkisp1-isp.c      |  8 ++++++--
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 038c303a8aed..553a4b12becf 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -29,11 +29,19 @@
 #define RKISP1_ISP_SD_SRC BIT(0)
 #define RKISP1_ISP_SD_SINK BIT(1)
 
-/* min and max values for the widths and heights of the entities */
-#define RKISP1_ISP_MAX_WIDTH		4032
-#define RKISP1_ISP_MAX_HEIGHT		3024
-#define RKISP1_ISP_MIN_WIDTH		32
-#define RKISP1_ISP_MIN_HEIGHT		32
+/*
+ * min and max values for the widths and heights of the entities
+ * The ISP device accepts input resolutions of up to 4416x3312, but
+ * it can only process resolutions of 4032x3024 internally.
+ * Therefore the crop resolution is limited to 4032x3024, the
+ * sink pad crop is applied automatically when the format is set.
+ */
+#define RKISP1_ISP_MAX_WIDTH			4416
+#define RKISP1_ISP_MAX_HEIGHT			3312
+#define RKISP1_ISP_MAX_WIDTH_CROP		4032
+#define RKISP1_ISP_MAX_HEIGHT_CROP		3024
+#define RKISP1_ISP_MIN_WIDTH			32
+#define RKISP1_ISP_MIN_HEIGHT			32
 
 #define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
 #define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2e5b57e3aedc..a8274e84a64b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -758,9 +758,13 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
 					  which);
 
 	sink_crop->left = ALIGN(r->left, 2);
-	sink_crop->width = ALIGN(r->width, 2);
+	sink_crop->width = clamp_t(u32, ALIGN(r->width, 2),
+				   RKISP1_ISP_MIN_WIDTH,
+				   RKISP1_ISP_MAX_WIDTH_CROP);
 	sink_crop->top = r->top;
-	sink_crop->height = r->height;
+	sink_crop->height = clamp_t(u32, r->height,
+				    RKISP1_ISP_MIN_HEIGHT,
+				    RKISP1_ISP_MAX_HEIGHT_CROP);
 	rkisp1_sd_adjust_crop(sink_crop, sink_fmt);
 
 	*r = *sink_crop;
-- 
2.25.1

