Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA3D7ACD48
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjIYAnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjIYAnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:43:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4D9139
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:42:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D70A3360;
        Mon, 25 Sep 2023 02:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602382;
        bh=4lwUG9HuxVn6eGcWzJtMyscIeqIRgO/I28PrtXx5giM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vHuzcDx5JRHCkDxCIXuf+EaUjq5vJVM54poP291Sh4HRBexebLSwxhW1BU3Q76twU
         PfetoOh3vhvq60M/FwDk5Qsi/xlLJq9qOYU8unGxAIKOPq85NSHb3ZHUXW5pLJN6VV
         YAs4fdzJvS14r7Z5h9u+98S9MEyUoH69rXNaa+xQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 14/14] media: rkisp1: resizer: Fix resizer disable check when starting stream
Date:   Mon, 25 Sep 2023 03:41:12 +0300
Message-ID: <20230925004112.22797-15-laurent.pinchart@ideasonboard.com>
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

The resizer is used to scale the image, but also to change the
subsampling of YUV formats. Both the luma and chroma dimensions need to
be taken into account to decide whether or not to enable the resizer.
The current implementation disables the resizer if the chroma vertical
size isn't changed, which would be the case when scaling up by a factor
of 2 vertically while at the same time converting from YUV 4:2:2 to
4:2:0. Fix it by checking the luma sizes too.

While at it, reflow and clarify comments in the function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 92ae2d2e0f12..28ecc7347d54 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -284,8 +284,8 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	src_yuv_info = rkisp1_rsz_get_yuv_mbus_info(src_fmt->code);
 
 	/*
-	 * The resizer only works on yuv formats,
-	 * so return if it is bayer format.
+	 * The resizer only works on yuv formats, so return if it is bayer
+	 * format.
 	 */
 	if (!sink_yuv_info) {
 		rkisp1_rsz_disable(rsz, when);
@@ -299,15 +299,15 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 
 	src_y.width = src_fmt->width;
 	src_y.height = src_fmt->height;
+	src_c.width = src_y.width / src_yuv_info->hdiv;
+	src_c.height = src_y.height / src_yuv_info->vdiv;
 
 	/*
 	 * The resizer is used not only to change the dimensions of the frame
-	 * but also to change the scale for YUV formats,
-	 * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
-	 * streams should be set according to the media bus format in the src pad.
+	 * but also to change the subsampling for YUV formats (for instance
+	 * converting from 4:2:2 to 4:2:0). Check both the luma and chroma
+	 * dimensions to decide whether or not to enable the resizer.
 	 */
-	src_c.width = src_y.width / src_yuv_info->hdiv;
-	src_c.height = src_y.height / src_yuv_info->vdiv;
 
 	dev_dbg(rsz->rkisp1->dev,
 		"stream %u rsz/scale: Y %ux%u -> %ux%u, CbCr %ux%u -> %ux%u\n",
@@ -315,12 +315,13 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 		src_fmt->width, src_fmt->height,
 		sink_c.width, sink_c.height, src_c.width, src_c.height);
 
-	if (sink_c.width == src_c.width && sink_c.height == src_c.height) {
+	if (sink_y->width == src_y.width && sink_y->height == src_y.height &&
+	    sink_c.width == src_c.width && sink_c.height == src_c.height) {
 		rkisp1_rsz_disable(rsz, when);
 		return;
 	}
 
-	/* set values in the hw */
+	/* Set values in the hardware. */
 	rkisp1_rsz_config_regs(rsz, sink_y, &sink_c, &src_y, &src_c, when);
 }
 
-- 
Regards,

Laurent Pinchart

