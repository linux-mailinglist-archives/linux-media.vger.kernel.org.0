Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D36562692
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbiF3XKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiF3XKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:10:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3FD2F655
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:10:18 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA1DC29C5;
        Fri,  1 Jul 2022 01:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630476;
        bh=EGJRYXr/iwJn9j9cWZE4tZvFBGtzzsX/yK0fTVPTQoc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cTyFgZdCEP4Km6qLiJTT0K3rDCkAnSCmVKYUdV+t0P/JGucQKQJjfrBZDAEXphcMr
         2fdxU1G/9NPnh0zp9Uo3+oy32SuTi307Mv2E08RbJxrdaukAg1An55Yn5sZOpB3yCV
         iLVP6g8Dw5xmQ8gOEFwOJVnhnn6rbyVZBJsL8iFo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 29/55] media: rkisp1: isp: Add container_of wrapper to cast subdev to rkisp1_isp
Date:   Fri,  1 Jul 2022 02:06:47 +0300
Message-Id: <20220630230713.10580-30-laurent.pinchart@ideasonboard.com>
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

Replace manual container_of() calls with a static inline wrapper to
increase readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 944b6ea11853..9f4fb984194d 100644
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
Regards,

Laurent Pinchart

