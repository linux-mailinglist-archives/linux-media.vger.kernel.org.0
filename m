Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075142B098C
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 17:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgKLQJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 11:09:02 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33465 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbgKLQJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 11:09:01 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C0DA0E0021;
        Thu, 12 Nov 2020 16:08:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] media: rcar-vin: Mask VNCSI_IFMD register
Date:   Thu, 12 Nov 2020 17:08:51 +0100
Message-Id: <20201112160851.99750-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201112160851.99750-1-jacopo+renesas@jmondi.org>
References: <20201112160851.99750-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VNCSI_IFMD register controls the data expansion mode and the
channel routing between the CSI-2 recivers and VIN instances.

According to the chip manual revision 2.20 not all fields are available
for all the SoCs:
- V3M, V3H and E3 do not support the DES1 field has they do not feature
  a CSI20 receiver.
- D3 only supports parallel input, and the whole register shall always
  be written as 0.

Add a bit mask to the per-SoC rcar_info structure and clear the register
value before writing it to the hardware.

This patch upports the BSP change commit f54697394457
("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990")

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 5 +++++
 drivers/media/platform/rcar-vin/rcar-dma.c  | 7 +++----
 drivers/media/platform/rcar-vin/rcar-vin.h  | 6 ++++++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 0b67d58dd727..57ac43a93f5e 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1241,6 +1241,7 @@ static const struct rvin_info rcar_info_r8a77970 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77970_routes,
+	.ifmd_mask = VNCSI_IFMD_DES1,
 };
 
 static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
@@ -1270,6 +1271,7 @@ static const struct rvin_info rcar_info_r8a77980 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77980_routes,
+	.ifmd_mask = VNCSI_IFMD_DES1,
 };
 
 static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
@@ -1287,6 +1289,7 @@ static const struct rvin_info rcar_info_r8a77990 = {
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77990_routes,
+	.ifmd_mask = VNCSI_IFMD_DES1,
 };
 
 static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
@@ -1306,6 +1309,8 @@ static const struct rvin_info rcar_info_r8a77995 = {
 	.max_height = 4096,
 	.routes = rcar_info_r8a77995_routes,
 	.scalers = rcar_info_r8a77995_scalers,
+	/* VNCSI_IFMD_REG not available on R-Car D3. */
+	.ifmd_mask = 0xff,
 };
 
 static const struct of_device_id rvin_of_id_table[] = {
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 378514a75bc2..c0e09c5d9c79 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -134,8 +134,6 @@
 #define VNDMR2_VLV(n)		((n & 0xf) << 12)
 
 /* Video n CSI2 Interface Mode Register (Gen3) */
-#define VNCSI_IFMD_DES1		(1 << 26)
-#define VNCSI_IFMD_DES0		(1 << 25)
 #define VNCSI_IFMD_CSI_CHSEL(n) (((n) & 0xf) << 0)
 
 /* Video n scaling control register (Gen3) */
@@ -1583,8 +1581,9 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 	vnmc = rvin_read(vin, VNMC_REG);
 	rvin_write(vin, vnmc & ~VNMC_VUP, VNMC_REG);
 
-	ifmd = VNCSI_IFMD_DES1 | VNCSI_IFMD_DES0 | VNCSI_IFMD_CSI_CHSEL(chsel);
-
+	/* Write only available fields to IFMD_REG. */
+	ifmd = (VNCSI_IFMD_DES0 | VNCSI_IFMD_DES1 | VNCSI_IFMD_CSI_CHSEL(chsel))
+	     & !vin->info->ifmd_mask;
 	rvin_write(vin, ifmd, VNCSI_IFMD_REG);
 
 	vin_dbg(vin, "Set IFMD 0x%x\n", ifmd);
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index be10e06b0880..2cf8952faab1 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -31,6 +31,10 @@
 /* Max number on VIN instances that can be in a system */
 #define RCAR_VIN_NUM 8
 
+/* CSI_IFMD register bit fields to mask per-SoC. */
+#define VNCSI_IFMD_DES1		BIT(26)
+#define VNCSI_IFMD_DES0		BIT(25)
+
 struct rvin_group;
 
 enum model_id {
@@ -174,6 +178,7 @@ struct rvin_group_scaler {
  * @routes:		list of possible routes from the CSI-2 recivers to
  *			all VINs. The list mush be NULL terminated.
  * @scalers:		List of available scalers, must be NULL terminated.
+ * @ifmd_mask:		Mask of unavailable bit fields of the CSI_IFMD register
  */
 struct rvin_info {
 	enum model_id model;
@@ -184,6 +189,7 @@ struct rvin_info {
 	unsigned int max_height;
 	const struct rvin_group_route *routes;
 	const struct rvin_group_scaler *scalers;
+	u32 ifmd_mask;
 };
 
 /**
-- 
2.29.1

