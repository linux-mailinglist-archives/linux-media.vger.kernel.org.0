Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72162EE87D
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387393AbfKDTc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:32:26 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48832 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729815AbfKDTcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:32:23 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JWMQ2104287;
        Mon, 4 Nov 2019 13:32:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895942;
        bh=iqIb4cxfqpIim46CB/FUVXcj1IVFW3TQfJfTNVwSosE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=j78mmy1jqgmKshCsiwTJNdB/yUY+A0F7lTzzRvtnlWMvKq2ywHcDLuQdHxJnlo3Vs
         Pj2vxvCIRwYRmqAqnOybYyhoJkZlg/ZiIQBQ1DIOwi13tSl/W+Dfidhjo02k86JfdA
         Qkh8j4EeVAkShAvmqj+WEtGr7kgu+2jBwIkUQ8oc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JWM2D127147
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:32:22 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:32:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:32:07 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmdF096934;
        Mon, 4 Nov 2019 13:32:21 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 16/20] media: ti-vpe: cal: Properly calculate max resolution boundary
Date:   Mon, 4 Nov 2019 13:31:36 -0600
Message-ID: <20191104193140.31145-17-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
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
index f0210a743bdc..20160845014e 100644
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

