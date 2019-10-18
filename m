Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEAEDC8BA
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404953AbfJRPcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:42 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44842 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410688AbfJRPcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWNju117124;
        Fri, 18 Oct 2019 10:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412743;
        bh=Gnev1/nUK6kia0qBTPA020FCXW4FagJcU0jgSzyPRRI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=H9ZkOQplb/ylnwjF8I86pA6AYkS/NmZQpgmt7+spwTP+RyjAm1LvThH+/pe64oAP2
         JVAYrqMqvtt89zrGiZJ2Cxp9mHidrx0BkRvdi5rSSOsA9gGu1yhlhAcV0sN6QPrtSH
         8so6iQls54noCLmh+jELH+igSZpUg+i1krk/2KHM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFWNJ2113243
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:14 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15U080266;
        Fri, 18 Oct 2019 10:32:22 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 16/19] media: ti-vpe: cal: Properly calculate max resolution boundary
Date:   Fri, 18 Oct 2019 10:34:34 -0500
Message-ID: <20191018153437.20614-17-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently we were using an arbitrarily small maximum resolution mostly
based on available sensor capabilities. However the hardware DMA limits
are much higher than the statically define maximum resolution we were
using.

There we rework the boundary check code to handle the maximum width and
height based on the maximum line width in bytes and re-calculating the
pixel width based on the given pixel format.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e61d2f3fd1da..a0ff67412410 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -34,8 +34,8 @@
 
 #define CAL_MODULE_NAME "cal"
 
-#define MAX_WIDTH 1920
-#define MAX_HEIGHT 1200
+#define MAX_WIDTH_BYTES (8192 * 8)
+#define MAX_HEIGHT_LINES 16383
 
 #define CAL_VERSION "0.1.0"
 
@@ -1337,15 +1337,21 @@ static int cal_calc_format_size(struct cal_ctx *ctx,
 				const struct cal_fmt *fmt,
 				struct v4l2_format *f)
 {
-	u32 bpl;
+	u32 bpl, max_width;
 
 	if (!fmt) {
 		ctx_dbg(3, ctx, "No cal_fmt provided!\n");
 		return -EINVAL;
 	}
 
-	v4l_bound_align_image(&f->fmt.pix.width, 48, MAX_WIDTH, 2,
-			      &f->fmt.pix.height, 32, MAX_HEIGHT, 0, 0);
+	/*
+	 * Maximum width is bound by the DMA max width in bytes.
+	 * We need to recalculate the actual maxi width depending on the
+	 * number of bytes per pixels required.
+	 */
+	max_width = MAX_WIDTH_BYTES / (ALIGN(fmt->bpp, 8) >> 3);
+	v4l_bound_align_image(&f->fmt.pix.width, 48, max_width, 2,
+			      &f->fmt.pix.height, 32, MAX_HEIGHT_LINES, 0, 0);
 
 	bpl = (f->fmt.pix.width * ALIGN(fmt->bpp, 8)) >> 3;
 	f->fmt.pix.bytesperline = ALIGN(bpl, 16);
-- 
2.17.1

