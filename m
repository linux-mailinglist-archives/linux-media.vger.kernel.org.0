Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5785770F4
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 21:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiGPTCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 15:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiGPTCW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 15:02:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF0D1CFEE
        for <linux-media@vger.kernel.org>; Sat, 16 Jul 2022 12:02:21 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 347086E0;
        Sat, 16 Jul 2022 21:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657998138;
        bh=5gOc+AzB1I/n69+tZy5xpfGCkcf/K8n/d1v6PnuU+oA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lf9joDumO7VyuCY0eIud9sllHiAfRAHUdMRqKhgGorPnFyV45ueWln1avjE+yHyaQ
         KdXhmf/NsJGVkU/cyxTvNERqKN0Ond1v1Qd8EpOA0tVgXa9PrQq1uejaenSSfOHfiG
         /h3dZRw37Msp98ZNwabiUh2Bq7dQVWoJZ3Cp/zAI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 21/46] media: rkisp1: csi: Handle CSI-2 RX configuration fully in rkisp1-csi.c
Date:   Sat, 16 Jul 2022 22:01:43 +0300
Message-Id: <20220716190143.31109-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-22-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-22-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ISP layer now calls multiple functions of the CSI-2 RX layer to
configure, start and stop it, with the steps for the last two
operations. Move those calls to rkisp1_mipi_csi2_start() and
rkisp1_mipi_csi2_stop() to simplify the ISP code and the API exposed by
the CSI-2 receiver component.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
Changes since v3:

- Make rkisp1_mipi_start() and  rkisp1_mipi_stop() static
---
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 59 +++++++++++--------
 .../platform/rockchip/rkisp1/rkisp1-csi.h     |  4 --
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 10 +---
 3 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index b5732511459f..10126da485ed 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -18,7 +18,7 @@
 #include "rkisp1-common.h"
 #include "rkisp1-csi.h"
 
-int rkisp1_config_mipi(struct rkisp1_csi *csi)
+static int rkisp1_config_mipi(struct rkisp1_csi *csi)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
@@ -69,6 +69,30 @@ int rkisp1_config_mipi(struct rkisp1_csi *csi)
 	return 0;
 }
 
+static void rkisp1_mipi_start(struct rkisp1_csi *csi)
+{
+	struct rkisp1_device *rkisp1 = csi->rkisp1;
+	u32 val;
+
+	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
+		     val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA);
+}
+
+static void rkisp1_mipi_stop(struct rkisp1_csi *csi)
+{
+	struct rkisp1_device *rkisp1 = csi->rkisp1;
+	u32 val;
+
+	/* Mask and clear interrupts. */
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
+
+	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
+		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
+}
+
 int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
 			   struct rkisp1_sensor_async *sensor)
 {
@@ -76,6 +100,11 @@ int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
 	union phy_configure_opts opts;
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
 	s64 pixel_clock;
+	int ret;
+
+	ret = rkisp1_config_mipi(csi);
+	if (ret)
+		return ret;
 
 	pixel_clock = v4l2_ctrl_g_ctrl_int64(sensor->pixel_rate_ctrl);
 	if (!pixel_clock) {
@@ -90,38 +119,18 @@ int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
 	phy_configure(csi->dphy, &opts);
 	phy_power_on(csi->dphy);
 
+	rkisp1_mipi_start(csi);
+
 	return 0;
 }
 
 void rkisp1_mipi_csi2_stop(struct rkisp1_csi *csi)
 {
+	rkisp1_mipi_stop(csi);
+
 	phy_power_off(csi->dphy);
 }
 
-void rkisp1_mipi_start(struct rkisp1_csi *csi)
-{
-	struct rkisp1_device *rkisp1 = csi->rkisp1;
-	u32 val;
-
-	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
-		     val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA);
-}
-
-void rkisp1_mipi_stop(struct rkisp1_csi *csi)
-{
-	struct rkisp1_device *rkisp1 = csi->rkisp1;
-	u32 val;
-
-	/* Mask and clear interrupts. */
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, 0);
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
-
-	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
-		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
-}
-
 irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
 {
 	struct device *dev = ctx;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
index 4ff41b88ab95..26d8be2ee178 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
@@ -18,12 +18,8 @@ struct rkisp1_sensor_async;
 int rkisp1_csi_init(struct rkisp1_device *rkisp1);
 void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
 
-int rkisp1_config_mipi(struct rkisp1_csi *csi);
-
 int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
 			   struct rkisp1_sensor_async *sensor);
 void rkisp1_mipi_csi2_stop(struct rkisp1_csi *csi);
-void rkisp1_mipi_start(struct rkisp1_csi *csi);
-void rkisp1_mipi_stop(struct rkisp1_csi *csi);
 
 #endif /* _RKISP1_CSI_H */
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 81c4eb48baab..f477368dcec9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -276,7 +276,6 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
 		ret = rkisp1_config_dvp(rkisp1);
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
 	} else if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
-		ret = rkisp1_config_mipi(&rkisp1->csi);
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
 	}
 
@@ -309,15 +308,13 @@ static void rkisp1_isp_stop(struct rkisp1_device *rkisp1)
 	 * ISP(mi) stop in mi frame end -> Stop ISP(mipi) ->
 	 * Stop ISP(isp) ->wait for ISP isp off
 	 */
-	/* stop and clear MI, MIPI, and ISP interrupts */
+	/* stop and clear MI and ISP interrupts */
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IMSC, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, ~0);
 
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_IMSC, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, ~0);
 
-	rkisp1_mipi_stop(&rkisp1->csi);
-
 	/* stop ISP */
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
 	val &= ~(RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE |
@@ -358,15 +355,10 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
 
 static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
 {
-	struct rkisp1_sensor_async *sensor = rkisp1->active_sensor;
 	u32 val;
 
 	rkisp1_config_clk(rkisp1);
 
-	/* Activate MIPI */
-	if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY)
-		rkisp1_mipi_start(&rkisp1->csi);
-
 	/* Activate ISP */
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
 	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD |
-- 
Regards,

Laurent Pinchart

