Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B1954BA43
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357407AbiFNTNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233205AbiFNTNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDAB764E
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:13:46 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DC40EF1;
        Tue, 14 Jun 2022 21:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234025;
        bh=B4d0dJOR6yxu00HHYzsuZC8jCLhA/Y8JmyFLeN3g3+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y4sY0C6GObKQ8RxuI4Yo2PlJmW9wr9D26P8oV2yMtMAk/UXXhgop8ZXBvFu56Z0yo
         iNVvg3WX5GJJ1xfy3oX6wFxovGBOkzIRc3+gDKL6+6+iTkAs6QbfdLpkjRftAfi9cP
         p0QkwLLhlhOZC8iwRqSYRgx89OoiJxX4UujIi6Mw=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 29/55] media: rkisp1: isp: Add rkisp1_device backpointer to rkisp1_isp
Date:   Wed, 15 Jun 2022 04:11:01 +0900
Message-Id: <20220614191127.3420492-30-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The rkisp1_isp structure documentation mentions a backpointer field to
rkisp1_device, but the field is missing. Add it, and use it to replace
more complicated constructs using container_of() on the v4l2_device.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c   | 11 +++++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 7a6f55a31bb0..3c55e922346e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -162,6 +162,7 @@ struct rkisp1_csi {
  */
 struct rkisp1_isp {
 	struct v4l2_subdev sd;
+	struct rkisp1_device *rkisp1;
 	struct media_pad pads[RKISP1_ISP_PAD_MAX];
 	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
 	const struct rkisp1_mbus_info *sink_fmt;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 812fb2ea5323..f8ab1d9cc8cd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -704,15 +704,13 @@ static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
-	struct rkisp1_device *rkisp1 =
-		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	dev_dbg(rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
+	dev_dbg(isp->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 	mutex_lock(&isp->ops_lock);
 	if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO)
@@ -751,9 +749,8 @@ static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
 
 static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct rkisp1_device *rkisp1 =
-		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
+	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	struct rkisp1_sensor_async *asd;
 	int ret;
 
@@ -840,12 +837,14 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 {
 	struct v4l2_subdev_state state = {
 		.pads = rkisp1->isp.pad_cfg
-		};
+	};
 	struct rkisp1_isp *isp = &rkisp1->isp;
 	struct media_pad *pads = isp->pads;
 	struct v4l2_subdev *sd = &isp->sd;
 	int ret;
 
+	isp->rkisp1 = rkisp1;
+
 	v4l2_subdev_init(sd, &rkisp1_isp_ops);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	sd->entity.ops = &rkisp1_isp_media_ops;
-- 
2.30.2

