Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EE7297688
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 20:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754432AbgJWSLt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 14:11:49 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:51956 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754320AbgJWSLY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 14:11:24 -0400
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id C3B643B09B3;
        Fri, 23 Oct 2020 17:47:00 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 02EB11BF203;
        Fri, 23 Oct 2020 17:46:37 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: [PATCH 14/14] media: sunxi: sun8i-a83t-mipi-csi2: Avoid using the (unsolicited) interrupt
Date:   Fri, 23 Oct 2020 19:45:46 +0200
Message-Id: <20201023174546.504028-15-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The A83T MIPI CSI-2 apparently produces interrupts regardless of the mask
registers, for example when a transmission error occurs.

This generates quite a flood when unsolicited interrupts are received on
each received frame. As a result, disable the interrupt for now since
we are not currently using it for error reporting.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../sun8i_a83t_mipi_csi2.c                    | 40 -------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index 1ff6f5dfd81a..26af3e3f5f89 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -25,34 +25,6 @@
 
 /* Core */
 
-static irqreturn_t sun8i_a83t_mipi_csi2_isr(int irq, void *dev_id)
-{
-	struct sun8i_a83t_mipi_csi2_dev *cdev =
-		(struct sun8i_a83t_mipi_csi2_dev *)dev_id;
-	struct regmap *regmap = cdev->regmap;
-	u32 status;
-
-	WARN_ONCE(1, MODULE_NAME
-		  ": Unsolicited interrupt, an error likely occurred!\n");
-
-	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_INT_STA0_REG, &status);
-	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_INT_STA0_REG, status);
-
-	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_INT_STA1_REG, &status);
-	regmap_write(regmap, SUN8I_A83T_MIPI_CSI2_INT_STA1_REG, status);
-
-	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_INT_MSK0_REG, &status);
-	regmap_read(regmap, SUN8I_A83T_MIPI_CSI2_INT_MSK1_REG, &status);
-
-	/*
-	 * The interrupt can be used to catch transmission errors.
-	 * However, we currently lack plumbing for reporting that to the
-	 * A31 CSI controller driver.
-	 */
-
-	return IRQ_HANDLED;
-}
-
 static void sun8i_a83t_mipi_csi2_init(struct sun8i_a83t_mipi_csi2_dev *cdev)
 {
 	struct regmap *regmap = cdev->regmap;
@@ -587,7 +559,6 @@ static int sun8i_a83t_mipi_csi2_resource_request(struct sun8i_a83t_mipi_csi2_dev
 {
 	struct resource *res;
 	void __iomem *io_base;
-	int irq;
 	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -626,17 +597,6 @@ static int sun8i_a83t_mipi_csi2_resource_request(struct sun8i_a83t_mipi_csi2_dev
 		return PTR_ERR(cdev->reset);
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return -ENXIO;
-
-	ret = devm_request_irq(&pdev->dev, irq, sun8i_a83t_mipi_csi2_isr, 0,
-			       MODULE_NAME, cdev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request MIPI CSI-2 IRQ\n");
-		return ret;
-	}
-
 	ret = sun8i_a83t_dphy_register(cdev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init MIPI D-PHY\n");
-- 
2.28.0

