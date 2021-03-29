Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A3434C3B5
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 08:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC2GRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 02:17:21 -0400
Received: from mout01.posteo.de ([185.67.36.65]:38665 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229873AbhC2GRL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 02:17:11 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 4AD6E160060
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 08:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1616998627; bh=9EnwysYBh+sNnu/q6P2kGnw+M54CVPXGlUSEDUC//eI=;
        h=From:To:Cc:Subject:Date:From;
        b=M15faMkGw1di3cvX/Q67n4OsrZBUI7TBawocjh6WoylIJT2hEyjDlR3d9+8zjh/uh
         mCUnCuDIk/4xv1zoLwood75FXsW83S6o2ksPajymYSfOI3dqNk5Sea9cux4XWT2upo
         nBBz741JbnYyP9W6SWwCRFghfdWqIXDWpLSfdY00Mekb50p/lkiI0Uw9Acoa4XYvI3
         RjGZ7vyuJTHAUaICgKfZke8s3Bs5Itig1Jf4EwVvbgfm2xa6OJ0rpoA1Wy1TlVqKfJ
         vj4CTZ7Q/3TUAAGiQ+BDtBVqUZfpxBthXZ9UCGOTPO22ZPH5kSidMHv9UxjQhO9LQo
         1tV8Qvg1JDDOg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4F82RQ3WJzz6tmM;
        Mon, 29 Mar 2021 08:17:06 +0200 (CEST)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, heiko@sntech.de,
        Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: [PATCH v3] media: rkisp1: Increase ISP input resolution limit
Date:   Mon, 29 Mar 2021 08:16:38 +0200
Message-Id: <20210329061637.14921-1-sebastian.fricke@posteo.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current implementation limits the maximum sink pad resolution to
4032x3024, which is mentioned by the Rockchip TRM as the maximum size
to handle black level correction. But the ISP can actually set its
sink pad format to a size of 4416x3312.
Allow higher sink pad resolutions in order to allow a bigger range of
sensor modes to be used with the RkISP1.
Apply the previous limit to the sink pad crop instead of the format to
satisfy the requirement of the ISP.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>
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

