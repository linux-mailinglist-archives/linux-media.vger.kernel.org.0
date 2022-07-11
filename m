Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDB8570306
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbiGKMoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbiGKMnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:43:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E010319036
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:43:46 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DC751B61;
        Mon, 11 Jul 2022 14:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543407;
        bh=CcUfvAct5/5GJBHNQ078nWfb82MLDDivX7HvbSE8q4k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N49t2kWeoUTWnT1msjaEPvYaFDNQH97KECa0mrbPE2UczRvlTwVqlihKIxTQrdnO7
         DC1W9RpWHHPj+61B0VxiMxDLFb71GL66dYDQ5McaEemEjhRkyD2/PaKKLQLzmB2Jum
         TXsrdJxIRTAhT+F9pKafZI3iMCH33KmXpYVSnHI4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 13/46] media: rkisp1: Move sensor .s_stream() call to ISP
Date:   Mon, 11 Jul 2022 15:42:15 +0300
Message-Id: <20220711124248.2683-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

Move the calls to the active sensor's .s_stream() operation to the ISP
subdev's .s_stream(). This groups all handling of the active sensor in
one place, preparing for a rework of that code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 +-----------
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c  | 11 +++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index fb14c8aa154c..d5904c96ff3f 100644
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
index 8aa4c0b85510..689885ac2e84 100644
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
Regards,

Laurent Pinchart

