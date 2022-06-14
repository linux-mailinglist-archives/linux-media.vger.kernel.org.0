Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B2454BA41
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344359AbiFNTNo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233205AbiFNTNn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C811F28984
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:13:42 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39C13FA0;
        Tue, 14 Jun 2022 21:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234021;
        bh=nen/2bN6BiLU0SoY7+g9X9Z3wLthtBU3eonu0OwOdH4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JhwdEfNjVrPpzOt2chrJDy9lwg1jLnGNIW76W4PTQ9ks2DxRXEtl9mwnbun98S2cE
         u4V0+UBNHpXyGtu5ev7gimBMlIUZLNLrf3HT5KNO80QVjek1IwR92R8o0mX7Kc6Qzo
         OCSMS7Br5Brgpe/YYr4tIpXtKHET7WbxMvUVWwqs=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 28/55] media: rkisp1: isp: Add container_of wrapper to cast subdev to rkisp1_isp
Date:   Wed, 15 Jun 2022 04:11:00 +0900
Message-Id: <20220614191127.3420492-29-paul.elder@ideasonboard.com>
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

Replace manual container_of() calls with a static inline wrapper to
increase readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 4f12fc0b7694..812fb2ea5323 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -370,6 +370,11 @@ static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
  * Subdev pad operations
  */
 
+static inline struct rkisp1_isp *to_rkisp1_isp(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rkisp1_isp, sd);
+}
+
 static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_mbus_code_enum *code)
@@ -625,7 +630,7 @@ static int rkisp1_isp_get_fmt(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
-	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
+	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 
 	mutex_lock(&isp->ops_lock);
 	fmt->format = *rkisp1_isp_get_pad_fmt(isp, sd_state, fmt->pad,
@@ -638,7 +643,7 @@ static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
-	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
+	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 
 	mutex_lock(&isp->ops_lock);
 	if (fmt->pad == RKISP1_ISP_PAD_SINK_VIDEO)
@@ -659,7 +664,7 @@ static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
-	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
+	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	int ret = 0;
 
 	if (sel->pad != RKISP1_ISP_PAD_SOURCE_VIDEO &&
@@ -701,7 +706,7 @@ static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
 {
 	struct rkisp1_device *rkisp1 =
 		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
-	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
+	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
@@ -748,7 +753,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rkisp1_device *rkisp1 =
 		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
-	struct rkisp1_isp *isp = &rkisp1->isp;
+	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_sensor_async *asd;
 	int ret;
 
-- 
2.30.2

