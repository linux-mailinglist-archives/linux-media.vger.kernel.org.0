Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBCB570319
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbiGKMon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbiGKMoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:44:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D6A12AE7
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:14 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92E80236F;
        Mon, 11 Jul 2022 14:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543413;
        bh=+2SN4BVTZW95tG1xW7g1CUPRg2RteON30gtiuh4kJqo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kz73uW22zksvDy/JIsCmqsg85vm4kpsK37IEfRwM6G3+W36WidCKUVuj/l5PZpSFX
         V4qcFEiUvrSTt0jKymmloeC8EWwPYkE9yGUu1Ol9W4Ycsr4AC8QGPXeK2lCQIvuQAg
         azZyf5LReJq3oM+YRjEpR3IDK9ZheExHRM3jEMdE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 22/46] media: rkisp1: csi: Rename CSI functions with a common rkisp1_csi prefix
Date:   Mon, 11 Jul 2022 15:42:24 +0300
Message-Id: <20220711124248.2683-23-laurent.pinchart@ideasonboard.com>
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

The CSI-related functions are not named consistently. Fix it by using a
common rkisp1_csi prefix.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 20 +++++++++----------
 .../platform/rockchip/rkisp1/rkisp1-csi.h     |  6 +++---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  4 ++--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  6 +++---
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 4ba30f172c8b..d07c5c8e5b0d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -541,7 +541,7 @@ void rkisp1_params_disable(struct rkisp1_params *params);
 
 /* irq handlers */
 irqreturn_t rkisp1_isp_isr(int irq, void *ctx);
-irqreturn_t rkisp1_mipi_isr(int irq, void *ctx);
+irqreturn_t rkisp1_csi_isr(int irq, void *ctx);
 irqreturn_t rkisp1_capture_isr(int irq, void *ctx);
 void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris);
 void rkisp1_params_isr(struct rkisp1_device *rkisp1);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 25e1183cdbac..102deb877aa4 100644
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
@@ -69,7 +69,7 @@ static int rkisp1_config_mipi(struct rkisp1_csi *csi)
 	return 0;
 }
 
-void rkisp1_mipi_start(struct rkisp1_csi *csi)
+static void rkisp1_csi_enable(struct rkisp1_csi *csi)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	u32 val;
@@ -79,7 +79,7 @@ void rkisp1_mipi_start(struct rkisp1_csi *csi)
 		     val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA);
 }
 
-void rkisp1_mipi_stop(struct rkisp1_csi *csi)
+static void rkisp1_csi_disable(struct rkisp1_csi *csi)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	u32 val;
@@ -93,8 +93,8 @@ void rkisp1_mipi_stop(struct rkisp1_csi *csi)
 		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
 }
 
-int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
-			   struct rkisp1_sensor_async *sensor)
+int rkisp1_csi_start(struct rkisp1_csi *csi,
+		     struct rkisp1_sensor_async *sensor)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	union phy_configure_opts opts;
@@ -102,7 +102,7 @@ int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
 	s64 pixel_clock;
 	int ret;
 
-	ret = rkisp1_config_mipi(csi);
+	ret = rkisp1_csi_config(csi);
 	if (ret)
 		return ret;
 
@@ -119,19 +119,19 @@ int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
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
index 26d8be2ee178..180e2f39606e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
@@ -18,8 +18,8 @@ struct rkisp1_sensor_async;
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
index 2afaa9f26f29..2c441665c017 100644
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
index f477368dcec9..d2343f166f42 100644
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
Regards,

Laurent Pinchart

