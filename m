Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41FA154BA3B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357370AbiFNTNR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243622AbiFNTNQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD41C2
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:13:15 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9DB1D96;
        Tue, 14 Jun 2022 21:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233994;
        bh=Dj3w8Yy6C+KPFthDULRS9YCi+MtkmY+sGf1KnXve3io=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K9GVPI2dJJo528hN6KtSqfFP9wIk5AMwmu/1m6gi/BQAutcRPrekdMNqBaEtT1N2f
         D7poQohWjtjPUhM2lAlq6E80WRbW1JT8GeR02FEcdgb/OnvDjNOxpLhwlCx0sW4yYA
         14o78uE2pPslGuilCFpbr8drqPARbcvK0zFfhxv8=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 21/55] media: rkisp1: csi: Rename CSI functions with a common rkisp1_csi prefix
Date:   Wed, 15 Jun 2022 04:10:53 +0900
Message-Id: <20220614191127.3420492-22-paul.elder@ideasonboard.com>
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

The CSI-related functions are not named consistently. Fix it by using a
common rkisp1_csi prefix.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 20 +++++++++----------
 .../platform/rockchip/rkisp1/rkisp1-csi.h     |  6 +++---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  4 ++--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  6 +++---
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index a52fa9e0dd66..dbf1baca623a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -555,7 +555,7 @@ void rkisp1_params_disable(struct rkisp1_params *params);
 
 /* irq handlers */
 irqreturn_t rkisp1_isp_isr(int irq, void *ctx);
-irqreturn_t rkisp1_mipi_isr(int irq, void *ctx);
+irqreturn_t rkisp1_csi_isr(int irq, void *ctx);
 irqreturn_t rkisp1_capture_isr(int irq, void *ctx);
 void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris);
 void rkisp1_params_isr(struct rkisp1_device *rkisp1);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index f19513a601e8..c1bb8c05543d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -18,7 +18,7 @@
 #include "rkisp1-common.h"
 #include "rkisp1-csi.h"
 
-static int rkisp1_config_mipi(struct rkisp1_csi *csi)
+static int rkisp1_csi_config(struct rkisp1_csi *csi)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
@@ -68,7 +68,7 @@ static int rkisp1_config_mipi(struct rkisp1_csi *csi)
 	return 0;
 }
 
-void rkisp1_mipi_start(struct rkisp1_csi *csi)
+static void rkisp1_csi_enable(struct rkisp1_csi *csi)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	u32 val;
@@ -78,7 +78,7 @@ void rkisp1_mipi_start(struct rkisp1_csi *csi)
 		     val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA);
 }
 
-void rkisp1_mipi_stop(struct rkisp1_csi *csi)
+static void rkisp1_csi_disable(struct rkisp1_csi *csi)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	u32 val;
@@ -92,8 +92,8 @@ void rkisp1_mipi_stop(struct rkisp1_csi *csi)
 		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
 }
 
-int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
-			   struct rkisp1_sensor_async *sensor)
+int rkisp1_csi_start(struct rkisp1_csi *csi,
+		     struct rkisp1_sensor_async *sensor)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	union phy_configure_opts opts;
@@ -101,7 +101,7 @@ int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
 	s64 pixel_clock;
 	int ret;
 
-	ret = rkisp1_config_mipi(csi);
+	ret = rkisp1_csi_config(csi);
 	if (ret)
 		return ret;
 
@@ -118,19 +118,19 @@ int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
 	phy_configure(csi->dphy, &opts);
 	phy_power_on(csi->dphy);
 
-	rkisp1_mipi_start(csi);
+	rkisp1_csi_enable(csi);
 
 	return 0;
 }
 
-void rkisp1_mipi_csi2_stop(struct rkisp1_csi *csi)
+void rkisp1_csi_stop(struct rkisp1_csi *csi)
 {
-	rkisp1_mipi_stop(csi);
+	rkisp1_csi_disable(csi);
 
 	phy_power_off(csi->dphy);
 }
 
-irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
+irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
 {
 	struct device *dev = ctx;
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
index 1f921d534865..7d3f01cfb49f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
@@ -17,8 +17,8 @@ struct rkisp1_sensor_async;
 int rkisp1_csi_init(struct rkisp1_device *rkisp1);
 void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
 
-int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
-			   struct rkisp1_sensor_async *sensor);
-void rkisp1_mipi_csi2_stop(struct rkisp1_csi *csi);
+int rkisp1_csi_start(struct rkisp1_csi *csi,
+		     struct rkisp1_sensor_async *sensor);
+void rkisp1_csi_stop(struct rkisp1_csi *csi);
 
 #endif /* _RKISP1_CSI_H */
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 373a1f00c10a..253220188abd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -383,7 +383,7 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
 	 */
 	rkisp1_capture_isr(irq, ctx);
 	rkisp1_isp_isr(irq, ctx);
-	rkisp1_mipi_isr(irq, ctx);
+	rkisp1_csi_isr(irq, ctx);
 
 	return IRQ_HANDLED;
 }
@@ -398,7 +398,7 @@ static const char * const px30_isp_clks[] = {
 static const struct rkisp1_isr_data px30_isp_isrs[] = {
 	{ "isp", rkisp1_isp_isr },
 	{ "mi", rkisp1_capture_isr },
-	{ "mipi", rkisp1_mipi_isr },
+	{ "mipi", rkisp1_csi_isr },
 };
 
 static const struct rkisp1_info px30_isp_info = {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 208c68aa52ea..ecb8ca0ad670 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -763,7 +763,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
 				 false);
 
-		rkisp1_mipi_csi2_stop(&rkisp1->csi);
+		rkisp1_csi_stop(&rkisp1->csi);
 		rkisp1_isp_stop(rkisp1);
 
 		return 0;
@@ -789,7 +789,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 
 	rkisp1_isp_start(rkisp1);
 
-	ret = rkisp1_mipi_csi2_start(&rkisp1->csi, rkisp1->active_sensor);
+	ret = rkisp1_csi_start(&rkisp1->csi, rkisp1->active_sensor);
 	if (ret) {
 		rkisp1_isp_stop(rkisp1);
 		goto mutex_unlock;
@@ -799,7 +799,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 			       true);
 	if (ret) {
 		rkisp1_isp_stop(rkisp1);
-		rkisp1_mipi_csi2_stop(&rkisp1->csi);
+		rkisp1_csi_stop(&rkisp1->csi);
 		goto mutex_unlock;
 	}
 
-- 
2.30.2

