Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADBA2C4FB0
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 08:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbgKZHsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 02:48:18 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:36985 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730206AbgKZHsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 02:48:17 -0500
X-Originating-IP: 80.104.176.17
Received: from uno.homenet.telecomitalia.it (host-80-104-176-17.retail.telecomitalia.it [80.104.176.17])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D68981C0002;
        Thu, 26 Nov 2020 07:48:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/2] media: rcar-vin: Mask VNCSI_IFMD register
Date:   Thu, 26 Nov 2020 08:47:57 +0100
Message-Id: <20201126074757.2768-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
References: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VNCSI_IFMD register controls the data expansion mode and the
channel routing between the CSI-2 receivers and VIN instances.

According to the chip manual revision 2.20 not all fields are available
for all the SoCs:
- V3M, V3H and E3 do not support the DES1 field has they do not feature
  a CSI20 receiver.
- D3 only supports parallel input, and the whole register shall always
  be written as 0.

Inspect the per-SoC channel routing table where the available CSI-2
instances are reported and configure VNCSI_IFMD accordingly.

This patch upports the BSP change commit f54697394457
("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990")

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Suggested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 25 +++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 378514a75bc2..6397eea665d1 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1570,7 +1570,9 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
  */
 int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 {
-	u32 ifmd, vnmc;
+	const struct rvin_group_route *route;
+	u32 ifmd = 0;
+	u32 vnmc;
 	int ret;
 
 	ret = pm_runtime_get_sync(vin->dev);
@@ -1583,9 +1585,26 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 	vnmc = rvin_read(vin, VNMC_REG);
 	rvin_write(vin, vnmc & ~VNMC_VUP, VNMC_REG);
 
-	ifmd = VNCSI_IFMD_DES1 | VNCSI_IFMD_DES0 | VNCSI_IFMD_CSI_CHSEL(chsel);
+	/*
+	 * Set data expansion mode to "pad with 0s" by inspecting the routes
+	 * table to find out which bit fields are available in the IFMD
+	 * register. IFMD_DES1 controls data expansion mode for CSI20/21,
+	 * IFMD_DES0 controls data expansion mode for CSI40/41.
+	 */
+	for (route = vin->info->routes; route->mask; route++) {
+		if (route->csi == RVIN_CSI20 || route->csi == RVIN_CSI21)
+			ifmd |= VNCSI_IFMD_DES1;
+		else
+			ifmd |= VNCSI_IFMD_DES0;
+
+		if (ifmd == (VNCSI_IFMD_DES0 | VNCSI_IFMD_DES1))
+			break;
+	}
 
-	rvin_write(vin, ifmd, VNCSI_IFMD_REG);
+	if (ifmd) {
+		ifmd |= VNCSI_IFMD_CSI_CHSEL(chsel);
+		rvin_write(vin, ifmd, VNCSI_IFMD_REG);
+	}
 
 	vin_dbg(vin, "Set IFMD 0x%x\n", ifmd);
 
-- 
2.29.1

