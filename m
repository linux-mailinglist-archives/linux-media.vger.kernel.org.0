Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9487ACD42
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbjIYAmy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjIYAmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:42:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD85CD6
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:42:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAB05DD9;
        Mon, 25 Sep 2023 02:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602380;
        bh=j/LzFNmymhs9E+9rhXNgo91vyteuhcCclHMywY9XmL4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W1bdQILaInTVE1yqlROUsPlCCE1Ps2KxKSjOiZAl0mC4qeLVEa56CpEZHu/m7DiGd
         FkrS3gB027XqOKKTnrQkMkluL7dRud1MADfsl8FMw+aTza3WqQx6Lr1NkFJQXaLPlf
         Nb+s9Wrnt1R2t6JMSsQVcV97+EQIq2Zs/r2G1T/w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 12/14] media: rkisp1: resizer: Drop unneeded local variable
Date:   Mon, 25 Sep 2023 03:41:10 +0300
Message-ID: <20230925004112.22797-13-laurent.pinchart@ideasonboard.com>
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

The sink_y local variable in rkisp1_rsz_config() stores a copy of the
sink_crop crop rectangle. Drop it, and rename sink_crop to sink_y.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 8700be7d19aa..1741ada7032b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -271,14 +271,12 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 {
 	const struct rkisp1_rsz_yuv_mbus_info *sink_yuv_info, *src_yuv_info;
 	const struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
-	const struct v4l2_rect *sink_crop;
-	struct v4l2_rect sink_y, sink_c;
+	const struct v4l2_rect *sink_y;
 	struct v4l2_area src_y, src_c;
+	struct v4l2_rect sink_c;
 
 	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
 					      RKISP1_RSZ_PAD_SINK);
-	sink_crop = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
-					     RKISP1_RSZ_PAD_SINK);
 	src_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
 					     RKISP1_RSZ_PAD_SRC);
 
@@ -294,14 +292,14 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 		return;
 	}
 
-	sink_y.width = sink_crop->width;
-	sink_y.height = sink_crop->height;
+	sink_y = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
+					  RKISP1_RSZ_PAD_SINK);
+	sink_c.width = sink_y->width / sink_yuv_info->hdiv;
+	sink_c.height = sink_y->height / sink_yuv_info->vdiv;
+
 	src_y.width = src_fmt->width;
 	src_y.height = src_fmt->height;
 
-	sink_c.width = sink_y.width / sink_yuv_info->hdiv;
-	sink_c.height = sink_y.height / sink_yuv_info->vdiv;
-
 	/*
 	 * The resizer is used not only to change the dimensions of the frame
 	 * but also to change the scale for YUV formats,
@@ -317,13 +315,13 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	}
 
 	dev_dbg(rsz->rkisp1->dev, "stream %d rsz/scale: %dx%d -> %dx%d\n",
-		rsz->id, sink_crop->width, sink_crop->height,
+		rsz->id, sink_y->width, sink_y->height,
 		src_fmt->width, src_fmt->height);
 	dev_dbg(rsz->rkisp1->dev, "chroma scaling %dx%d -> %dx%d\n",
 		sink_c.width, sink_c.height, src_c.width, src_c.height);
 
 	/* set values in the hw */
-	rkisp1_rsz_config_regs(rsz, &sink_y, &sink_c, &src_y, &src_c, when);
+	rkisp1_rsz_config_regs(rsz, sink_y, &sink_c, &src_y, &src_c, when);
 }
 
 /* ----------------------------------------------------------------------------
-- 
Regards,

Laurent Pinchart

