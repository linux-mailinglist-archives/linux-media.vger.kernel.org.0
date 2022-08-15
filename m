Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBDA5929DD
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 08:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241102AbiHOGwx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 02:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiHOGwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 02:52:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD331B7B9
        for <linux-media@vger.kernel.org>; Sun, 14 Aug 2022 23:52:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59CA54A8;
        Mon, 15 Aug 2022 08:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660546369;
        bh=lQLhPROQ+Cc5HVfc6FxXY6JxQulQuKhk/0ssEYvyQaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B9Chp91VbKBovRbW7F9M3lYRvbGx7Tq4crP3FzAKT7YQRFKSlU5L+Rjaqb4PSjFU5
         h072fOrNotbbNP1TBL/9Q0URvebm/NmEtVsVjm3UJs2spQosN8Uybl93YeB/g2ltTI
         X/RyUR7PO7f/WdCMC3JflSRUZ1TF8M9CO4jxbZvM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH 1/7] media: rkisp1: Initialize color space on sink and source pads
Date:   Mon, 15 Aug 2022 09:52:29 +0300
Message-Id: <20220815065235.23797-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
References: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialize the four color space fields on the sink and source
video pads in the .init_cfg() operation. As the main use case for the
ISP is to convert Bayer data to YUV, select a raw color space on the
sink pad and a limited range quantization of SYCC on the source pad by
default.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index a3c7d4d88387..a52b22824739 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -553,12 +553,17 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop, *src_crop;
 
+	/* Video. */
 	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
 					      RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
 	sink_fmt->field = V4L2_FIELD_NONE;
 	sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
 	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
 					     RKISP1_ISP_PAD_SINK_VIDEO);
@@ -571,11 +576,16 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 					     RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_fmt = *sink_fmt;
 	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	src_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 
 	src_crop = v4l2_subdev_get_try_crop(sd, sd_state,
 					    RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_crop = *sink_crop;
 
+	/* Parameters and statistics. */
 	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
 					      RKISP1_ISP_PAD_SINK_PARAMS);
 	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
-- 
Regards,

Laurent Pinchart

