Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1951F8BBE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgFOAB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728243AbgFOAB4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:56 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59335FA2;
        Mon, 15 Jun 2020 02:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179252;
        bh=0KbiU4w64xjUbHCSj5fEDUvOjIp2l4+eggrYsX3Wj4Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q0FjZuYiIplhMuJIE13SD80BV+LNMhOmZ+USDYkLdfVAo9FkZoDwlx75aB9H5AqJO
         TK5tYCQoTDOOsxwVNy7/FhM/asvEHjDVfBY4CNHuOCP7MsLadBUOoUWV4wE1tHA/y2
         cSLwsFbuSqy5qXNlsoiNS0e7xCUle5o05XJ1echU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 087/107] media: ti-vpe: cal: Rename MAX_(WIDTH|HEIGHT)_* macros with CAL_ prefix
Date:   Mon, 15 Jun 2020 02:59:24 +0300
Message-Id: <20200614235944.17716-88-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX_WIDTH_BYTES and MAX_HEIGHT_LINES macros have a generic name that
is prone to namespace clashes. Rename them with a CAL_ prefix. While at
it, expand their documentation and add CAL_MIN_(WIDTH|HEIGHT)_* macros
that will be used to implement CAMERARX subdev operations.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c |  5 +++--
 drivers/media/platform/ti-vpe/cal.h       | 12 ++++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 355bb365daf0..42e750925e8b 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -163,9 +163,10 @@ static int cal_calc_format_size(struct cal_ctx *ctx,
 	 * We need to recalculate the actual maxi width depending on the
 	 * number of bytes per pixels required.
 	 */
-	max_width = MAX_WIDTH_BYTES / (ALIGN(fmt->bpp, 8) >> 3);
+	max_width = CAL_MAX_WIDTH_BYTES / (ALIGN(fmt->bpp, 8) >> 3);
 	v4l_bound_align_image(&f->fmt.pix.width, 48, max_width, 2,
-			      &f->fmt.pix.height, 32, MAX_HEIGHT_LINES, 0, 0);
+			      &f->fmt.pix.height, 32, CAL_MAX_HEIGHT_LINES,
+			      0, 0);
 
 	bpl = (f->fmt.pix.width * ALIGN(fmt->bpp, 8)) >> 3;
 	f->fmt.pix.bytesperline = ALIGN(bpl, 16);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 8d1753ebb7c4..7356d01e8d73 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -31,8 +31,16 @@
 #define CAL_NUM_CONTEXT			2
 #define CAL_NUM_CSI2_PORTS		2
 
-#define MAX_WIDTH_BYTES			(8192 * 8)
-#define MAX_HEIGHT_LINES		16383
+/*
+ * The width is limited by the size of the CAL_WR_DMA_XSIZE_j.XSIZE field,
+ * expressed in multiples of 64 bits. The height is limited by the size of the
+ * CAL_CSI2_CTXi_j.CTXi_LINES and CAL_WR_DMA_CTRL_j.YSIZE fields, expressed in
+ * lines.
+ */
+#define CAL_MIN_WIDTH_BYTES		16
+#define CAL_MAX_WIDTH_BYTES		(8192 * 8)
+#define CAL_MIN_HEIGHT_LINES		1
+#define CAL_MAX_HEIGHT_LINES		16383
 
 #define CAL_CAMERARX_PAD_SINK		0
 #define CAL_CAMERARX_PAD_SOURCE		1
-- 
Regards,

Laurent Pinchart

