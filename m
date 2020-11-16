Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE6E2B4224
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 12:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgKPLEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 06:04:43 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42399 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgKPLEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 06:04:42 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4085E40036;
        Mon, 16 Nov 2020 11:04:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] media: rcar-vin: Mask VNCSI_IFMD register
Date:   Mon, 16 Nov 2020 12:04:28 +0100
Message-Id: <20201116110428.27338-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116110428.27338-1-jacopo+renesas@jmondi.org>
References: <20201116110428.27338-1-jacopo+renesas@jmondi.org>
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

Suggested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 26 +++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 378514a75bc2..ab6818b34e5a 100644
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
@@ -1583,9 +1585,27 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
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
+		/* CSI21 is only available in r8a7795es1 and not documented. */
+		if (route->csi == RVIN_CSI20 || route->csi == RVIN_CSI21)
+			ifmd |= VNCSI_IFMD_DES1;
+		else
+			ifmd |= VNCSI_IFMD_DES0;
 
-	rvin_write(vin, ifmd, VNCSI_IFMD_REG);
+		/* If both have been set stop looping. */
+		if (ifmd == (VNCSI_IFMD_DES0 | VNCSI_IFMD_DES1))
+			break;
+	}
+	if (ifmd) {
+		ifmd |= VNCSI_IFMD_CSI_CHSEL(chsel);
+		rvin_write(vin, ifmd, VNCSI_IFMD_REG);
+	}
 
 	vin_dbg(vin, "Set IFMD 0x%x\n", ifmd);
 
-- 
2.29.1

