Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0794924D7D1
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 17:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgHUPAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 11:00:43 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:56173 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgHUPAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 11:00:35 -0400
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPA id 7D666100006;
        Fri, 21 Aug 2020 15:00:31 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mripard@kernel.org, wens@csie.org, yong.deng@magewell.com,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH 4/7] media: sunxi: sun6i-csi: Move the sun6i_csi_dev structure to the common header
Date:   Fri, 21 Aug 2020 16:59:32 +0200
Message-Id: <20200821145935.20346-5-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Access to the sun6i_csi_dev structure is needed to add the
MIPI CSI2 support.

Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 12 ------------
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 055eb0b8e396..680fa31f380a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -29,18 +29,6 @@
 
 #define MODULE_NAME	"sun6i-csi"
 
-struct sun6i_csi_dev {
-	struct sun6i_csi		csi;
-	struct device			*dev;
-
-	struct regmap			*regmap;
-	struct clk			*clk_mod;
-	struct clk			*clk_ram;
-	struct reset_control		*rstc_bus;
-
-	int				planar_offset[3];
-};
-
 static inline struct sun6i_csi_dev *sun6i_csi_to_dev(struct sun6i_csi *csi)
 {
 	return container_of(csi, struct sun6i_csi_dev, csi);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index 8b83d15de0d0..c4a87bdab8c3 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -48,6 +48,18 @@ struct sun6i_csi {
 	struct sun6i_video		video;
 };
 
+struct sun6i_csi_dev {
+	struct sun6i_csi	csi;
+	struct device		*dev;
+	struct regmap		*regmap;
+	struct clk		*clk_mod;
+	struct clk		*clk_ram;
+	struct clk		*clk_mipi;
+	struct clk		*clk_misc;
+	struct reset_control	*rstc_bus;
+	int			planar_offset[3];
+};
+
 /**
  * sun6i_csi_is_format_supported() - check if the format supported by csi
  * @csi:	pointer to the csi
-- 
2.17.1

