Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC46A54BA31
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344022AbiFNTMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357370AbiFNTMl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:12:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7691813CF7
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:12:34 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3985D96;
        Tue, 14 Jun 2022 21:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233953;
        bh=k8FRBbwpvIHe8zOUzbxn54nhYIrUq6aIGOgT/YnXUxg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TXd/O2C3MN/Un/SQgTfm55tjOsb36YLeoWVMOXhyyNk/Ym/QLhQRd3ovUmObvxM8e
         0uXe2CC0QjTS+eCnBMyb3qj5Xzlv8XC8h4mr3Z0tlBbcA681nZdAzGxZ6PFF24zdx8
         CZbSaxnyb09UgFemrzlz0xOiL0h+ksG0C9dTb8Nc=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 11/55] media: rkisp1: Move sensor .s_stream() call to ISP
Date:   Wed, 15 Jun 2022 04:10:43 +0900
Message-Id: <20220614191127.3420492-12-paul.elder@ideasonboard.com>
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

Move the calls to the active sensor's .s_stream() operation to the ISP
subdev's .s_stream(). This groups all handling of the active sensor in
one place, preparing for a rework of that code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 +-----------
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c  | 11 +++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 94a0d787a312..9edaa95fa44c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -926,11 +926,8 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 	 * If the other capture is streaming, isp and sensor nodes shouldn't
 	 * be disabled, skip them.
 	 */
-	if (rkisp1->pipe.streaming_count < 2) {
-		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
-				 false);
+	if (rkisp1->pipe.streaming_count < 2)
 		v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, false);
-	}
 
 	v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video, s_stream,
 			 false);
@@ -966,15 +963,8 @@ static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
 	if (ret)
 		goto err_disable_rsz;
 
-	ret = v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
-			       true);
-	if (ret)
-		goto err_disable_isp;
-
 	return 0;
 
-err_disable_isp:
-	v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, false);
 err_disable_rsz:
 	v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video, s_stream,
 			 false);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 89577119b571..58cf6d21f1eb 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -857,6 +857,9 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	if (!enable) {
+		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
+				 false);
+
 		rkisp1_isp_stop(rkisp1);
 		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
 		return 0;
@@ -886,6 +889,14 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 
 	rkisp1_isp_start(rkisp1);
 
+	ret = v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
+			       true);
+	if (ret) {
+		rkisp1_isp_stop(rkisp1);
+		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
+		goto mutex_unlock;
+	}
+
 mutex_unlock:
 	mutex_unlock(&isp->ops_lock);
 	return ret;
-- 
2.30.2

