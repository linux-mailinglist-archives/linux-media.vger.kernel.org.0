Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 188FC7ACD3B
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbjIYAmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjIYAlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:41:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E271CC1
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:41:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D1832CF;
        Mon, 25 Sep 2023 02:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602372;
        bh=p36jN2uaI3nsLt9GCf4RazFnx5SCbQz4V6wr9yJ4OGY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RXmK5akcszYJflXdZxU05qn6HKt6tB7m5eaNHoUfGFr2qBCDWMvHdOaE1s54lMkRd
         7x0j2E4Lq4p4+d/8arqkbML+W1icpcv2WB4lDjr1J7667/21Z+60fStkpKZDjxZig2
         xYNe9zxe16eKtM3swoMRGsAVNNiV9XY3ybvzKENM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 07/14] media: rkisp1: Fix line stride calculation
Date:   Mon, 25 Sep 2023 03:41:05 +0300
Message-ID: <20230925004112.22797-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
References: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The line stride is expressed in the hardware as a number of pixels for
the first plane. The bytesperline must thus be a multiple of the first
plane's bpp value. Enforce this constraint.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 8f3cba319762..3c1e2c1a8bbe 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1101,14 +1101,20 @@ rkisp1_fill_pixfmt(struct v4l2_pix_format_mplane *pixm,
 	memset(pixm->plane_fmt, 0, sizeof(pixm->plane_fmt));
 	info = v4l2_format_info(pixm->pixelformat);
 	pixm->num_planes = info->mem_planes;
-	stride = info->bpp[0] * pixm->width;
-	/* Self path supports custom stride but Main path doesn't */
-	if (id == RKISP1_MAINPATH || plane_y->bytesperline < stride)
-		plane_y->bytesperline = stride;
-	plane_y->sizeimage = plane_y->bytesperline * pixm->height;
 
-	/* normalize stride to pixels per line */
-	stride = DIV_ROUND_UP(plane_y->bytesperline, info->bpp[0]);
+	/*
+	 * The SP supports custom strides, expressed as a number of pixels for
+	 * the Y plane. Clamp the stride to a reasonable value to avoid integer
+	 * overflows when calculating the bytesperline and sizeimage values.
+	 */
+	if (id == RKISP1_SELFPATH)
+		stride = clamp(DIV_ROUND_UP(plane_y->bytesperline, info->bpp[0]),
+			       pixm->width, 65536U);
+	else
+		stride = pixm->width;
+
+	plane_y->bytesperline = stride * info->bpp[0];
+	plane_y->sizeimage = plane_y->bytesperline * pixm->height;
 
 	for (i = 1; i < info->comp_planes; i++) {
 		struct v4l2_plane_pix_format *plane = &pixm->plane_fmt[i];
-- 
Regards,

Laurent Pinchart

