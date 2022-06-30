Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80145626E0
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbiF3XKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbiF3XKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:10:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D7936334
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:10:18 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91E9F29DB;
        Fri,  1 Jul 2022 01:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630477;
        bh=99UIE8oqmPmd0m1zZDgA48K/oWQ1/6lftaY/SpI4KEo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BtWRnjMdjVfn3JrwbLRLfEAOX7a1O3f8Iy0r3q9R5NsPEAGESCdeFfANSn/gNE4bh
         eNndeRuIrOye1tILSlg7o8HWP+x6BNsnxKTEEAOIffrbgLWzdcSQASnA7WeZTYSoQL
         zD5zASYRRWeozmzoz4TnlCNc2uIn44B91PPWLLcE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 30/55] media: rkisp1: isp: Add rkisp1_device backpointer to rkisp1_isp
Date:   Fri,  1 Jul 2022 02:06:48 +0300
Message-Id: <20220630230713.10580-31-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
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

The rkisp1_isp structure documentation mentions a backpointer field to
rkisp1_device, but the field is missing. Add it, and use it to replace
more complicated constructs using container_of() on the v4l2_device.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c   | 11 +++++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ee9e724f4bf2..5301461d3ea3 100644
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
index 9f4fb984194d..3f9541fc4a2f 100644
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
Regards,

Laurent Pinchart

