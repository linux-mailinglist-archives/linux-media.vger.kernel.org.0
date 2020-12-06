Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519562D0855
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgLFX5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:57:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbgLFX5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:57:24 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85F171873;
        Mon,  7 Dec 2020 00:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298847;
        bh=WNYbMTkzmjiPxJc6MD1riLKekiP8d/TpYywK21+hhE8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a6RjDiRWMopQw1j4QOMww2x5Nhno9skGP38YGOSoWEuJq3zU0PhfjGnNmZk1+6CVn
         cuce+Jy8DGN6WGDE5QLFF4OUXZ9APqisKUVgXAvAnXi/io5ONiHR+twPU4l+7OEQw2
         m+9zzRyM486uaCEANuqhJ8Q7uMnI82bc/WLA1lFo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 17/24] media: ti-vpe: cal: Drop unneeded check in cal_calc_format_size()
Date:   Mon,  7 Dec 2020 01:53:46 +0200
Message-Id: <20201206235353.26968-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_calc_format_size() function checks that the passed fmtinfo
argument is not NULL. All callers ensure that the pointer is valid. Drop
the check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 32dd4d9ca212..ad1e85189831 100644
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

