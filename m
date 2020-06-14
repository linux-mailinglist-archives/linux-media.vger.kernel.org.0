Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7AD1F8BCD
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgFOACN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:02:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbgFOACM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:02:12 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FC692149;
        Mon, 15 Jun 2020 02:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179259;
        bh=ooN1LQCPlG0xQhgEqwSVTBRTKoLBDhqiiBCanD4l4Pc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uDKPBvbTCgzJWSsq7TtmJIKL7vexGbJVBohSfKYNkTBsewIOteLmDIlfK1l0R9byl
         qSHRutQWY0BZD5vHgiYuWIFAK33nek+PiayGjr+heFrY5GzdcUPhpQ9ZLegEZQZgTW
         bQ/iZrqUtgO30umfHdp+//54qzDq3eutvRd/ePUI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 100/107] media: ti-vpe: cal: Drop unneeded check in cal_calc_format_size()
Date:   Mon, 15 Jun 2020 02:59:37 +0300
Message-Id: <20200614235944.17716-101-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_calc_format_size() function checks that the passed fmtinfo
argument is not NULL. All callers ensure that the pointer is valid. Drop
the check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 775ed2fd9f1e..6d6ea02bf0b2 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -146,17 +146,12 @@ static int __subdev_set_format(struct cal_ctx *ctx,
 	return 0;
 }
 
-static int cal_calc_format_size(struct cal_ctx *ctx,
-				const struct cal_format_info *fmtinfo,
-				struct v4l2_format *f)
+static void cal_calc_format_size(struct cal_ctx *ctx,
+				 const struct cal_format_info *fmtinfo,
+				 struct v4l2_format *f)
 {
 	u32 bpl, max_width;
 
-	if (!fmtinfo) {
-		ctx_dbg(3, ctx, "No cal_fmt provided!\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * Maximum width is bound by the DMA max width in bytes.
 	 * We need to recalculate the actual maxi width depending on the
@@ -177,8 +172,6 @@ static int cal_calc_format_size(struct cal_ctx *ctx,
 		__func__, fourcc_to_str(f->fmt.pix.pixelformat),
 		f->fmt.pix.width, f->fmt.pix.height,
 		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
-
-	return 0;
 }
 
 static int cal_g_fmt_vid_cap(struct file *file, void *priv,
@@ -247,7 +240,8 @@ static int cal_try_fmt_vid_cap(struct file *file, void *priv,
 	 * updated properly during s_fmt
 	 */
 	f->fmt.pix.colorspace = ctx->v_fmt.fmt.pix.colorspace;
-	return cal_calc_format_size(ctx, fmtinfo, f);
+	cal_calc_format_size(ctx, fmtinfo, f);
+	return 0;
 }
 
 static int cal_s_fmt_vid_cap(struct file *file, void *priv,
-- 
Regards,

Laurent Pinchart

