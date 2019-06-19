Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E62194B7DD
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 14:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731750AbfFSMPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 08:15:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40564 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731731AbfFSMPt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 08:15:49 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 100A3284755;
        Wed, 19 Jun 2019 13:15:47 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 4/9] media: hantro: Simplify the controls creation logic
Date:   Wed, 19 Jun 2019 14:15:35 +0200
Message-Id: <20190619121540.29320-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619121540.29320-1-boris.brezillon@collabora.com>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_ctrl_new_custom() should work for any kind of control, including
standard ones. With that change, we automatically get support for
menu controls.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/hantro/hantro.h     |  2 --
 drivers/staging/media/hantro/hantro_drv.c | 28 +++++++----------------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index f903e82c7760..cff65707285d 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -109,12 +109,10 @@ enum hantro_codec_mode {
 
 /*
  * struct hantro_ctrl - helper type to declare supported controls
- * @id:		V4L2 control ID (V4L2_CID_xxx)
  * @codec:	codec id this control belong to (HANTRO_JPEG_ENCODER, etc.)
  * @cfg:	control configuration
  */
 struct hantro_ctrl {
-	unsigned int id;
 	unsigned int codec;
 	struct v4l2_ctrl_config cfg;
 };
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index db49d643ddb7..44974aaf25ca 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -266,31 +266,29 @@ static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
 
 static const struct hantro_ctrl controls[] = {
 	{
-		.id = V4L2_CID_JPEG_COMPRESSION_QUALITY,
 		.codec = HANTRO_JPEG_ENCODER,
 		.cfg = {
+			.id = V4L2_CID_JPEG_COMPRESSION_QUALITY,
 			.min = 5,
 			.max = 100,
 			.step = 1,
 			.def = 50,
+			.ops = &hantro_ctrl_ops,
 		},
 	}, {
-		.id = V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-			.elem_size = sizeof(struct v4l2_ctrl_mpeg2_slice_params),
+			.id = V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
 		},
 	}, {
-		.id = V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-			.elem_size = sizeof(struct v4l2_ctrl_mpeg2_quantization),
+			.id = V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
 		},
 	}, {
-		.id = V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR,
 		.codec = HANTRO_VP8_DECODER,
 		.cfg = {
-			.elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header),
+			.id = V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR,
 		},
 	},
 };
@@ -306,22 +304,12 @@ static int hantro_ctrls_setup(struct hantro_dev *vpu,
 	for (i = 0; i < num_ctrls; i++) {
 		if (!(allowed_codecs & controls[i].codec))
 			continue;
-		if (!controls[i].cfg.elem_size) {
-			v4l2_ctrl_new_std(&ctx->ctrl_handler,
-					  &hantro_ctrl_ops,
-					  controls[i].id, controls[i].cfg.min,
-					  controls[i].cfg.max,
-					  controls[i].cfg.step,
-					  controls[i].cfg.def);
-		} else {
-			controls[i].cfg.id = controls[i].id;
-			v4l2_ctrl_new_custom(&ctx->ctrl_handler,
-					     &controls[i].cfg, NULL);
-		}
 
+		v4l2_ctrl_new_custom(&ctx->ctrl_handler,
+				     &controls[i].cfg, NULL);
 		if (ctx->ctrl_handler.error) {
 			vpu_err("Adding control (%d) failed %d\n",
-				controls[i].id,
+				controls[i].cfg.id,
 				ctx->ctrl_handler.error);
 			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 			return ctx->ctrl_handler.error;
-- 
2.20.1

