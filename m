Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7F8AF932C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbfKLOvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:51:52 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41694 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbfKLOvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:51:05 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEp3X0105837;
        Tue, 12 Nov 2019 08:51:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570263;
        bh=VPcCHoz83EUA010ZU1nWEatZxpJu9dEalZ7log4olLA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wJVgoHL4zGbqXutwu08LTCuzTLUhglmZCrjTL5DZ9APR2nqYyUBi/Yk2gK6LuIIst
         8kxVAGAxq3x2BY4dtKmZB//cie5dUebRubW4zaplXxlvItwdr5UlUV8KxGX1xjOGET
         64r0NuPJWL9l6c0sxL9JczFJdskoY9mDiSuDdCY8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEp2Na024088
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:51:03 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:45 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:45 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokf3068428;
        Tue, 12 Nov 2019 08:51:02 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 17/20] media: ti-vpe: cal: Properly calculate max resolution boundary
Date:   Tue, 12 Nov 2019 08:53:44 -0600
Message-ID: <20191112145347.23519-18-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
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
index 5b5ff32b6120..091119bee8fc 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -34,8 +34,8 @@
 
 #define CAL_MODULE_NAME "cal"
 
-#define MAX_WIDTH 1920
-#define MAX_HEIGHT 1200
+#define MAX_WIDTH_BYTES (8192 * 8)
+#define MAX_HEIGHT_LINES 16383
 
 #define CAL_VERSION "0.1.0"
 
@@ -1330,15 +1330,21 @@ static int cal_calc_format_size(struct cal_ctx *ctx,
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

