Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4517A042A
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 14:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238461AbjINMlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 08:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238471AbjINMlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 08:41:35 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2CA1FD4
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 05:41:31 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qglet-0008Mc-Ds; Thu, 14 Sep 2023 14:41:23 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 14 Sep 2023 14:40:42 +0200
Subject: [PATCH 10/13] media: rockchip: rga: use macros for testing buffer
 type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v1-10-abfd77260ae3@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the provided V4L2_TYPE_IS_{OUTPUT,CAPTURE} macros to check if the
buffer or queue is OUTPUT or CAPTURE. The macros work also work for the
_MPLANE buffer and queue types and make it easier to switch to the
multi-planar API.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 303ee762bec4..516069d720fa 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -342,14 +342,11 @@ static struct rga_frame def_frame = {
 
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type)
 {
-	switch (type) {
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	if (V4L2_TYPE_IS_OUTPUT(type))
 		return &ctx->in;
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	if (V4L2_TYPE_IS_CAPTURE(type))
 		return &ctx->out;
-	default:
-		return ERR_PTR(-EINVAL);
-	}
+	return ERR_PTR(-EINVAL);
 }
 
 static int rga_open(struct file *file)
@@ -557,21 +554,21 @@ static int vidioc_g_selection(struct file *file, void *prv,
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
-		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		if (!V4L2_TYPE_IS_CAPTURE(s->type))
 			return -EINVAL;
 		break;
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		if (!V4L2_TYPE_IS_OUTPUT(s->type))
 			return -EINVAL;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		if (!V4L2_TYPE_IS_CAPTURE(s->type))
 			return -EINVAL;
 		use_frame = true;
 		break;
 	case V4L2_SEL_TGT_CROP:
-		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		if (!V4L2_TYPE_IS_OUTPUT(s->type))
 			return -EINVAL;
 		use_frame = true;
 		break;
@@ -609,7 +606,7 @@ static int vidioc_s_selection(struct file *file, void *prv,
 		 * COMPOSE target is only valid for capture buffer type, return
 		 * error for output buffer type
 		 */
-		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		if (!V4L2_TYPE_IS_CAPTURE(s->type))
 			return -EINVAL;
 		break;
 	case V4L2_SEL_TGT_CROP:
@@ -617,7 +614,7 @@ static int vidioc_s_selection(struct file *file, void *prv,
 		 * CROP target is only valid for output buffer type, return
 		 * error for capture buffer type
 		 */
-		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		if (!V4L2_TYPE_IS_OUTPUT(s->type))
 			return -EINVAL;
 		break;
 	/*

-- 
2.39.2

