Return-Path: <linux-media+bounces-27374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B890CA4C634
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A271417577C
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBECB230BFA;
	Mon,  3 Mar 2025 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SbFEGTre"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C957822FE07;
	Mon,  3 Mar 2025 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017820; cv=none; b=WUcEf7wBcJo/VvZkPCN3+xkNmdqTYf7OxDosrwdCWkOO5vA9/xpSYyFo824INynk5VfJLHQDYHcQAb3WY54ZKas9nqpm34A+MKMHexaRtDHNfxG7sIUv91Udje3a2Pa+i5NV0dZy59TQOEVv8BmkgwlyiqIEIZBE3lzDARTyeDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017820; c=relaxed/simple;
	bh=L7X41F0uguy6iOJvm0D0JCeQ5W1EeTlos0Q00eBOQ2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MspFuDBCdO7laDktejsHEF0U7BA8tqnTczI+osfd3hJExV1eFta6jAJoEwm5ZEi0We4slV0HOhcwdyZsEOtVhBzNmJlORHMxKiZ5glFyeakiOHz7XLC6TE38die8E+/5M39DjOYfaZHh3hubzg4/Vn7mmwzuySUOm+IRauJzj/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SbFEGTre; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91E1422A;
	Mon,  3 Mar 2025 17:02:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017725;
	bh=L7X41F0uguy6iOJvm0D0JCeQ5W1EeTlos0Q00eBOQ2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SbFEGTreFL7iiQ2Amb/w31anaDYVoVxoeiLzln+QWZdjIogxHIH5FgtIzp08hHSzn
	 HUd994Vs7w1mCrN0Cc8Ht9yPUPAV1zgFdBGfxz6aLfqGqqfYKFHjnx5XM80oCtrSQV
	 xf81DxhJpJBNyb0c0QEhqZLVu3KBWSZxXmEHxLm0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:18 +0530
Subject: [PATCH v3 15/19] media: i2c: ds90ub960: Update UB9702 init
 sequences
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-15-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=29509;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=OtovcZBPo9uFG+pd5+5n4GjLHAnYe/FIURneQQywdbY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdKA3EncLxWcS2pkp8YzXqC8w+lsLslUqT/Cr
 jOqv5mMCraJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSgAAKCRBD3pH5JJpx
 RfJfD/9Sjr/PBOqS7CfF/NTeNlrGhj3QxS4Ho3lDoqviSULCDohZNGwe2B7lneZAEb8gk2Xst+4
 TKYbV3sqvoIeZ3lTZEa0mla4/tTiFINUGe/0NnJoeUMYEeysCg6FJCHdw/jmfMU8LN9KrzDohFl
 A29eZ9iFpi05j6XzcmRsHHkSNDYg/Cx3+eDpbAQP83Rdu+kpomzZYtpKrOsVx9A93N42SODpT+5
 HNpru2pcLn+wDQN7j5nBeW/1ikoE7c1XKw/mQHFZHoJrB+7WJjUUFP8Mrktah60nXp0mCLUpMKX
 WwdHYOSO6JGTl+OCROFQSXipwWV+LJJ6pjh+YhoTF6TD4HVLf9fw16zIlMVJHxOXDag156v/+zx
 z7H6E95ylfHGtzdA0RSt4WbjzLWp5ilabYbgf987zjM53A6hTjy7MPIWPAxl6/t+VPhy+KBanAN
 nTCJ9j2HOVge1jgOOR1nUw6hjKuEJc7XxDrWTiHawlug51w/lmAozUgjplGyIgP5vLcO537ZLFc
 mVRiSqMOhgyi+w4X0si3nLdxG3rpnft5Ca4Y6goUJko7c872lC380teBqijT1wkCjVa3e3/0DsW
 x6jqMfnM+SKLo1DPC+B19LvTiX1AUKHiBxFlr+n4EnUbJYnDfwzYo4paSiWe1sv+DNedIntr1aa
 7cKaiYYWQRZrAIQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Update ub9702 RX port init sequence according to TI's latest
(non-public) documentation. The sequence is based on a Python script
provided by TI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes from v2:
- This patch was previously split for easier review, squash it now.
---
 drivers/media/i2c/ds90ub960.c | 848 ++++++++++++++++++++++++++++++++----------
 1 file changed, 658 insertions(+), 190 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 130bf4cc0a7485e997dd979954a9b6d28b693a5a..56b1a88c1c29fbefecae60f4c9976e8ede554447 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -243,6 +243,7 @@
 #define UB960_RR_BIST_ERR_COUNT			0x57
 
 #define UB960_RR_BCC_CONFIG			0x58
+#define UB960_RR_BCC_CONFIG_BC_ALWAYS_ON	BIT(4)
 #define UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH	BIT(6)
 #define UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK	GENMASK(2, 0)
 
@@ -1788,6 +1789,23 @@ static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
 	return 0;
 }
 
+static int ub960_rxport_lockup_wa_ub9702(struct ub960_data *priv)
+{
+	int ret;
+
+	/* Toggle PI_MODE to avoid possible FPD RX lockup */
+
+	ret = ub960_update_bits(priv, UB9702_RR_CHANNEL_MODE, GENMASK(4, 3),
+				2 << 3, NULL);
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 5000);
+
+	return ub960_update_bits(priv, UB9702_RR_CHANNEL_MODE, GENMASK(4, 3),
+				 0, NULL);
+}
+
 /*
  * Wait for the RX ports to lock, have no errors and have stable strobe position
  * and EQ level.
@@ -1818,6 +1836,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 	link_ok_mask = 0;
 
 	while (time_before(jiffies, timeout)) {
+		bool fpd4_wa = false;
 		missing = 0;
 
 		for_each_set_bit(nport, &port_mask,
@@ -1832,6 +1851,9 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 			if (ret)
 				return ret;
 
+			if (!ok && rxport->cdr_mode == RXPORT_CDR_FPD4)
+				fpd4_wa = true;
+
 			/*
 			 * We want the link to be ok for two consecutive loops,
 			 * as a link could get established just before our test
@@ -1851,6 +1873,12 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (missing == 0)
 			break;
 
+		if (fpd4_wa) {
+			ret = ub960_rxport_lockup_wa_ub9702(priv);
+			if (ret)
+				return ret;
+		}
+
 		/*
 		 * The sleep time of 10 ms was found by testing to give a lock
 		 * with a few iterations. It can be decreased if on some setups
@@ -2257,294 +2285,691 @@ static int ub960_init_rx_port_ub960(struct ub960_data *priv,
 	return ret;
 }
 
-static int ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
-					  struct ub960_rxport *rxport)
+static int ub960_init_rx_ports_ub960(struct ub960_data *priv)
 {
-	unsigned int nport = rxport->nport;
-	u8 bc_freq_val;
-	u8 fpd_func_mode;
-	int ret = 0;
+	struct device *dev = &priv->client->dev;
+	unsigned int port_lock_mask;
+	unsigned int port_mask;
+	int ret;
 
-	switch (rxport->rx_mode) {
-	case RXPORT_MODE_RAW10:
-		bc_freq_val = 0;
-		fpd_func_mode = 5;
-		break;
+	for_each_active_rxport(priv, it) {
+		ret = ub960_init_rx_port_ub960(priv, it.rxport);
+		if (ret)
+			return ret;
+	}
 
-	case RXPORT_MODE_RAW12_HF:
-		bc_freq_val = 0;
-		fpd_func_mode = 4;
-		break;
+	ret = ub960_reset(priv, false);
+	if (ret)
+		return ret;
 
-	case RXPORT_MODE_RAW12_LF:
-		bc_freq_val = 0;
-		fpd_func_mode = 6;
-		break;
+	port_mask = 0;
 
-	case RXPORT_MODE_CSI2_SYNC:
-		bc_freq_val = 6;
-		fpd_func_mode = 2;
-		break;
+	for_each_active_rxport(priv, it)
+		port_mask |= BIT(it.nport);
 
-	case RXPORT_MODE_CSI2_NONSYNC:
-		bc_freq_val = 2;
-		fpd_func_mode = 2;
-		break;
+	ret = ub960_rxport_wait_locks(priv, port_mask, &port_lock_mask);
+	if (ret)
+		return ret;
 
-	default:
-		return -EINVAL;
+	if (port_mask != port_lock_mask) {
+		ret = -EIO;
+		dev_err_probe(dev, ret, "Failed to lock all RX ports\n");
+		return ret;
 	}
 
-	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
-				 bc_freq_val, &ret);
-	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, fpd_func_mode,
-			   &ret);
+	/*
+	 * Clear any errors caused by switching the RX port settings while
+	 * probing.
+	 */
+	ret = ub960_clear_rx_errors(priv);
+	if (ret)
+		return ret;
 
-	/* set serdes_eq_mode = 1 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa8, 0x80,
-			&ret);
+	return 0;
+}
 
-	/* enable serdes driver */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0d, 0x7f,
-			&ret);
+/*
+ * UB9702 specific initial RX port configuration
+ */
 
-	/* set serdes_eq_offset=4 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
-			&ret);
+static int ub960_turn_off_rxport_ub9702(struct ub960_data *priv,
+					unsigned int nport)
+{
+	int ret = 0;
 
-	/* init default serdes_eq_max in 0xa9 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xa9, 0x23,
-			&ret);
+	/* Disable RX port */
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), 0, &ret);
+
+	/* Disable FPD Rx and FPD BC CMR */
+	ub960_rxport_write(priv, nport, UB9702_RR_RX_CTL_2, 0x1b, &ret);
+
+	/* Disable FPD BC Tx */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, BIT(4), 0,
+				 &ret);
+
+	/* Disable internal RX blocks */
+	ub960_rxport_write(priv, nport, UB9702_RR_RX_CTL_1, 0x15, &ret);
+
+	/* Disable AEQ */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_AEQ_CFG_2, 0x03, &ret);
 
-	/* init serdes_eq_min in 0xaa */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xaa, 0, &ret);
+	/* PI disabled and oDAC disabled */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_AEQ_CFG_4, 0x09, &ret);
 
-	/* serdes_driver_ctl2 control: DS90UB953-Q1/DS90UB933-Q1/DS90UB913A-Q1 */
-	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b,
-			      BIT(3), BIT(3), &ret);
+	/* AEQ configured for disabled link */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_AEQ_CFG_1, 0x20, &ret);
 
-	/* RX port to half-rate */
-	ub960_update_bits(priv, UB9702_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  BIT(nport * 2), &ret);
+	/* disable AEQ clock and DFE */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_AEQ_CFG_3, 0x45, &ret);
+
+	/* Powerdown FPD3 CDR */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_FPD3_CDR_CTRL_SEL_5, 0x82, &ret);
 
 	return ret;
 }
 
-static int ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
-					      struct ub960_rxport *rxport)
+static int ub960_set_bc_drv_config_ub9702(struct ub960_data *priv,
+					  unsigned int nport)
 {
-	unsigned int nport = rxport->nport;
-	bool first_time_power_up = true;
+	u8 fpd_bc_ctl0;
+	u8 fpd_bc_ctl1;
+	u8 fpd_bc_ctl2;
 	int ret = 0;
 
-	if (first_time_power_up) {
-		u8 v;
-
-		/* AEQ init */
-		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2c, &v,
-			       &ret);
+	if (priv->rxports[nport]->cdr_mode == RXPORT_CDR_FPD4) {
+		/* Set FPD PBC drv into FPD IV mode */
 
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, v,
-				&ret);
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28,
-				v + 1, &ret);
+		fpd_bc_ctl0 = 0;
+		fpd_bc_ctl1 = 0;
+		fpd_bc_ctl2 = 0;
+	} else {
+		/* Set FPD PBC drv into FPD III mode */
 
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b,
-				0x00, &ret);
+		fpd_bc_ctl0 = 2;
+		fpd_bc_ctl1 = 1;
+		fpd_bc_ctl2 = 5;
 	}
 
-	/* enable serdes_eq_ctl2 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9e, 0x00,
-			&ret);
+	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
+			      UB9702_IR_RX_ANA_FPD_BC_CTL0, GENMASK(7, 5),
+			      fpd_bc_ctl0 << 5, &ret);
 
-	/* enable serdes_eq_ctl1 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x90, 0x40,
-			&ret);
+	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
+			      UB9702_IR_RX_ANA_FPD_BC_CTL1, BIT(6),
+			      fpd_bc_ctl1 << 6, &ret);
 
-	/* enable serdes_eq_en */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2e, 0x40,
-			&ret);
+	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
+			      UB9702_IR_RX_ANA_FPD_BC_CTL2, GENMASK(6, 3),
+			      fpd_bc_ctl2 << 3, &ret);
 
-	/* disable serdes_eq_override */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xf0, 0x00,
-			&ret);
+	return ret;
+}
 
-	/* disable serdes_gain_override */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x71, 0x00,
-			&ret);
+static int ub960_set_fpd4_sync_mode_ub9702(struct ub960_data *priv,
+					   unsigned int nport)
+{
+	int ret = 0;
+
+	/* FPD4 Sync Mode */
+	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, 0x0, &ret);
+
+	/* BC_FREQ_SELECT = (PLL_FREQ/3200) Mbps */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK, 6, &ret);
+
+	if (ret)
+		return ret;
+
+	ret = ub960_set_bc_drv_config_ub9702(priv, nport);
+	if (ret)
+		return ret;
+
+	/* Set AEQ timer to 400us/step */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_SYSTEM_INIT_REG0, 0x2f, &ret);
+
+	/* Disable FPD4 Auto Recovery */
+	ub960_update_bits(priv, UB9702_SR_CSI_EXCLUSIVE_FWD2, GENMASK(5, 4), 0,
+			  &ret);
+
+	/* Enable RX port */
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
+			  &ret);
+
+	/* Enable FPD4 Auto Recovery */
+	ub960_update_bits(priv, UB9702_SR_CSI_EXCLUSIVE_FWD2, GENMASK(5, 4),
+			  BIT(4), &ret);
 
 	return ret;
 }
 
-static int ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
-					  struct ub960_rxport *rxport)
+static int ub960_set_fpd4_async_mode_ub9702(struct ub960_data *priv,
+					    unsigned int nport)
 {
-	unsigned int nport = rxport->nport;
-	u8 bc_freq_val;
 	int ret = 0;
 
-	switch (rxport->rx_mode) {
-	case RXPORT_MODE_RAW10:
-		bc_freq_val = 0;
-		break;
+	/* FPD4 ASync Mode */
+	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, 0x1, &ret);
 
-	case RXPORT_MODE_RAW12_HF:
-		bc_freq_val = 0;
-		break;
+	/* 10Mbps w/ BC enabled */
+	/* BC_FREQ_SELECT=(PLL_FREQ/3200) Mbps */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK, 2, &ret);
 
-	case RXPORT_MODE_RAW12_LF:
-		bc_freq_val = 0;
-		break;
+	if (ret)
+		return ret;
 
-	case RXPORT_MODE_CSI2_SYNC:
-		bc_freq_val = 6;
-		break;
+	ret = ub960_set_bc_drv_config_ub9702(priv, nport);
+	if (ret)
+		return ret;
 
-	case RXPORT_MODE_CSI2_NONSYNC:
-		bc_freq_val = 2;
-		break;
+	/* Set AEQ timer to 400us/step */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_SYSTEM_INIT_REG0, 0x2f, &ret);
 
-	default:
-		return -EINVAL;
-	}
+	/* Disable FPD4 Auto Recover */
+	ub960_update_bits(priv, UB9702_SR_CSI_EXCLUSIVE_FWD2, GENMASK(5, 4), 0,
+			  &ret);
 
-	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
-				 bc_freq_val, &ret);
+	/* Enable RX port */
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
+			  &ret);
 
-	/* FPD4 Sync Mode */
-	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, 0, &ret);
+	/* Enable FPD4 Auto Recovery */
+	ub960_update_bits(priv, UB9702_SR_CSI_EXCLUSIVE_FWD2, GENMASK(5, 4),
+			  BIT(4), &ret);
 
-	/* add serdes_eq_offset of 4 */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
-			&ret);
+	return ret;
+}
 
-	/* FPD4 serdes_start_eq in 0x27: assign default */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0, &ret);
-	/* FPD4 serdes_end_eq in 0x28: assign default */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, 0x23,
-			&ret);
+static int ub960_set_fpd3_sync_mode_ub9702(struct ub960_data *priv,
+					   unsigned int nport)
+{
+	int ret = 0;
 
-	/* set serdes_driver_mode into FPD IV mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x04, 0x00,
-			&ret);
-	/* set FPD PBC drv into FPD IV mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b, 0x00,
-			&ret);
+	/* FPD3 Sync Mode */
+	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, 0x2, &ret);
 
-	/* set serdes_system_init to 0x2f */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x21, 0x2f,
-			&ret);
-	/* set serdes_system_rst in reset mode */
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xc1,
-			&ret);
+	/* BC_FREQ_SELECT=(PLL_FREQ/3200) Mbps */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK, 6, &ret);
 
-	/* RX port to 7.55G mode */
-	ub960_update_bits(priv, UB9702_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
-			  0 << (nport * 2), &ret);
+	/* Set AEQ_LOCK_MODE = 1 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_FPD3_AEQ_CTRL_SEL_1, BIT(7), &ret);
 
 	if (ret)
 		return ret;
 
-	ret = ub960_init_rx_port_ub9702_fpd4_aeq(priv, rxport);
+	ret = ub960_set_bc_drv_config_ub9702(priv, nport);
 	if (ret)
 		return ret;
 
-	return 0;
+	/* Enable RX port */
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
+			  &ret);
+
+	return ret;
 }
 
-static int ub960_init_rx_port_ub9702(struct ub960_data *priv,
-				     struct ub960_rxport *rxport)
+static int ub960_set_raw10_dvp_mode_ub9702(struct ub960_data *priv,
+					   unsigned int nport)
 {
-	unsigned int nport = rxport->nport;
-	int ret;
+	int ret = 0;
 
-	if (rxport->cdr_mode == RXPORT_CDR_FPD3)
-		ret = ub960_init_rx_port_ub9702_fpd3(priv, rxport);
-	else /* RXPORT_CDR_FPD4 */
-		ret = ub960_init_rx_port_ub9702_fpd4(priv, rxport);
+	/* FPD3 RAW10 Mode */
+	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, 0x5, &ret);
+
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_BC_FREQ_SEL_MASK, 0, &ret);
+
+	/* Set AEQ_LOCK_MODE = 1 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_FPD3_AEQ_CTRL_SEL_1, BIT(7), &ret);
+
+	/*
+	 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
+	 * 0b10 : 8-bit processing using upper 8 bits
+	 */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3 << 6,
+				 0x2 << 6, &ret);
+
+	/* LV_POLARITY & FV_POLARITY */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
+				 priv->rxports[nport]->lv_fv_pol, &ret);
 
 	if (ret)
 		return ret;
 
-	switch (rxport->rx_mode) {
-	case RXPORT_MODE_RAW10:
-		/*
-		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
-		 * 0b10 : 8-bit processing using upper 8 bits
-		 */
-		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
-					 0x3 << 6, 0x2 << 6, &ret);
+	ret = ub960_set_bc_drv_config_ub9702(priv, nport);
+	if (ret)
+		return ret;
+
+	/* Enable RX port */
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
+			  &ret);
+
+	return ret;
+}
+
+static int ub960_configure_rx_port_ub9702(struct ub960_data *priv,
+					  unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+	struct ub960_rxport *rxport = priv->rxports[nport];
+	int ret;
+
+	if (!rxport) {
+		ret = ub960_turn_off_rxport_ub9702(priv, nport);
+		if (ret)
+			return ret;
 
+		dev_dbg(dev, "rx%u: disabled\n", nport);
+		return 0;
+	}
+
+	switch (rxport->cdr_mode) {
+	case RXPORT_CDR_FPD4:
+		switch (rxport->rx_mode) {
+		case RXPORT_MODE_CSI2_SYNC:
+			ret = ub960_set_fpd4_sync_mode_ub9702(priv, nport);
+			if (ret)
+				return ret;
+
+			dev_dbg(dev, "rx%u: FPD-Link IV SYNC mode\n", nport);
+			break;
+		case RXPORT_MODE_CSI2_NONSYNC:
+			ret = ub960_set_fpd4_async_mode_ub9702(priv, nport);
+			if (ret)
+				return ret;
+
+			dev_dbg(dev, "rx%u: FPD-Link IV ASYNC mode\n", nport);
+			break;
+		default:
+			dev_err(dev, "rx%u: unsupported FPD4 mode %u\n", nport,
+				rxport->rx_mode);
+			return -EINVAL;
+		}
 		break;
 
-	case RXPORT_MODE_RAW12_HF:
-	case RXPORT_MODE_RAW12_LF:
-		/* Not implemented */
-		return -EINVAL;
+	case RXPORT_CDR_FPD3:
+		switch (rxport->rx_mode) {
+		case RXPORT_MODE_CSI2_SYNC:
+			ret = ub960_set_fpd3_sync_mode_ub9702(priv, nport);
+			if (ret)
+				return ret;
 
-	case RXPORT_MODE_CSI2_SYNC:
-	case RXPORT_MODE_CSI2_NONSYNC:
+			dev_dbg(dev, "rx%u: FPD-Link III SYNC mode\n", nport);
+			break;
+		case RXPORT_MODE_RAW10:
+			ret = ub960_set_raw10_dvp_mode_ub9702(priv, nport);
+			if (ret)
+				return ret;
 
+			dev_dbg(dev, "rx%u: FPD-Link III RAW10 DVP mode\n",
+				nport);
+			break;
+		default:
+			dev_err(&priv->client->dev,
+				"rx%u: unsupported FPD3 mode %u\n", nport,
+				rxport->rx_mode);
+			return -EINVAL;
+		}
 		break;
+
+	default:
+		dev_err(&priv->client->dev, "rx%u: unsupported CDR mode %u\n",
+			nport, rxport->cdr_mode);
+		return -EINVAL;
 	}
 
-	/* LV_POLARITY & FV_POLARITY */
-	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3,
-				 rxport->lv_fv_pol, &ret);
+	return 0;
+}
 
-	/* Enable all interrupt sources from this port */
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07, &ret);
-	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f, &ret);
+static int ub960_lock_recovery_ub9702(struct ub960_data *priv,
+				      unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+	/* Assumption that max AEQ should be under 16 */
+	const u8 rx_aeq_limit = 16;
+	u8 prev_aeq = 0xff;
+	bool rx_lock;
+
+	for (unsigned int retry = 0; retry < 3; ++retry) {
+		u8 port_sts1;
+		u8 rx_aeq;
+		int ret;
 
-	/* Enable I2C_PASS_THROUGH */
-	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
-				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
-				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH, &ret);
+		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
+					&port_sts1, NULL);
+		if (ret)
+			return ret;
 
-	/* Enable I2C communication to the serializer via the alias addr */
-	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
-			   rxport->ser.alias << 1, &ret);
+		rx_lock = port_sts1 & UB960_RR_RX_PORT_STS1_PORT_PASS;
 
-	/* Enable RX port */
-	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport),
-			  &ret);
+		if (!rx_lock) {
+			ret = ub960_rxport_lockup_wa_ub9702(priv);
+			if (ret)
+				return ret;
+
+			/* Restart AEQ by changing max to 0 --> 0x23 */
+			ret = ub960_write_ind(priv,
+					      UB960_IND_TARGET_RX_ANA(nport),
+					      UB9702_IR_RX_ANA_AEQ_ALP_SEL7, 0,
+					      NULL);
+			if (ret)
+				return ret;
+
+			msleep(20);
+
+			/* AEQ Restart */
+			ret = ub960_write_ind(priv,
+					      UB960_IND_TARGET_RX_ANA(nport),
+					      UB9702_IR_RX_ANA_AEQ_ALP_SEL7,
+					      0x23, NULL);
+
+			if (ret)
+				return ret;
 
-	if (rxport->cdr_mode == RXPORT_CDR_FPD4) {
-		/* unreset 960 AEQ */
-		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25,
-				0x41, &ret);
+			msleep(20);
+			dev_dbg(dev, "rx%u: no lock, retry = %u\n", nport,
+				retry);
+
+			continue;
+		}
+
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				     UB9702_IR_RX_ANA_AEQ_ALP_SEL11, &rx_aeq,
+				     NULL);
+		if (ret)
+			return ret;
+
+		if (rx_aeq < rx_aeq_limit) {
+			dev_dbg(dev,
+				"rx%u: locked and AEQ normal before setting AEQ window\n",
+				nport);
+			return 0;
+		}
+
+		if (rx_aeq != prev_aeq) {
+			ret = ub960_rxport_lockup_wa_ub9702(priv);
+			if (ret)
+				return ret;
+
+			/* Restart AEQ by changing max to 0 --> 0x23 */
+			ret = ub960_write_ind(priv,
+					      UB960_IND_TARGET_RX_ANA(nport),
+					      UB9702_IR_RX_ANA_AEQ_ALP_SEL7,
+					      0, NULL);
+			if (ret)
+				return ret;
+
+			msleep(20);
+
+			/* AEQ Restart */
+			ret = ub960_write_ind(priv,
+					      UB960_IND_TARGET_RX_ANA(nport),
+					      UB9702_IR_RX_ANA_AEQ_ALP_SEL7,
+					      0x23, NULL);
+			if (ret)
+				return ret;
+
+			msleep(20);
+
+			dev_dbg(dev,
+				"rx%u: high AEQ at initial check recovery loop, retry=%u\n",
+				nport, retry);
+
+			prev_aeq = rx_aeq;
+		} else {
+			dev_dbg(dev,
+				"rx%u: lossy cable detected, RX_AEQ %#x, RX_AEQ_LIMIT %#x, retry %u\n",
+				nport, rx_aeq, rx_aeq_limit, retry);
+			dev_dbg(dev,
+				"rx%u: will continue with initiation sequence but high AEQ\n",
+				nport);
+			return 0;
+		}
 	}
 
-	return ret;
+	dev_err(dev, "rx%u: max number of retries: %s\n", nport,
+		rx_lock ? "unstable AEQ" : "no lock");
+
+	return -EIO;
 }
 
-static int ub960_init_rx_ports(struct ub960_data *priv)
+static int ub960_enable_aeq_lms_ub9702(struct ub960_data *priv,
+				       unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+	u8 read_aeq_init;
+	int ret;
+
+	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			     UB9702_IR_RX_ANA_AEQ_ALP_SEL11, &read_aeq_init,
+			     NULL);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "rx%u: initial AEQ = %#x\n", nport, read_aeq_init);
+
+	/* Set AEQ Min */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_AEQ_ALP_SEL6, read_aeq_init, &ret);
+	/* Set AEQ Max */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_AEQ_ALP_SEL7, read_aeq_init + 1, &ret);
+	/* Set AEQ offset to 0 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_AEQ_ALP_SEL10, 0x0, &ret);
+
+	/* Enable AEQ tap2 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_EQ_CTRL_SEL_38, 0x00, &ret);
+	/* Set VGA Gain 1 Gain 2 override to 0 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_VGA_CTRL_SEL_8, 0x00, &ret);
+	/* Set VGA Initial Sweep Gain to 0 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_VGA_CTRL_SEL_6, 0x80, &ret);
+	/* Set VGA_Adapt (VGA Gain) override to 0 (thermometer encoded) */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_VGA_CTRL_SEL_3, 0x00, &ret);
+	/* Enable VGA_SWEEP */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_EQ_ADAPT_CTRL, 0x40, &ret);
+	/* Disable VGA_SWEEP_GAIN_OV, disable VGA_TUNE_OV */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_EQ_OVERRIDE_CTRL, 0x00, &ret);
+
+	/* Set VGA HIGH Threshold to 43 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_VGA_CTRL_SEL_1, 0x2b, &ret);
+	/* Set VGA LOW Threshold to 18 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_VGA_CTRL_SEL_2, 0x12, &ret);
+	/* Set vga_sweep_th to 32 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_EQ_CTRL_SEL_15, 0x20, &ret);
+	/* Set AEQ timer to 400us/step and parity threshold to 7 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_SYSTEM_INIT_REG0, 0xef, &ret);
+
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "rx%u: enable FPD-Link IV AEQ LMS\n", nport);
+
+	return 0;
+}
+
+static int ub960_enable_dfe_lms_ub9702(struct ub960_data *priv,
+				       unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+	int ret = 0;
+
+	/* Enable DFE LMS */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_EQ_CTRL_SEL_24, 0x40, &ret);
+	/* Disable VGA Gain1 override */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB9702_IR_RX_ANA_GAIN_CTRL_0, 0x20, &ret);
+
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 5000);
+
+	/* Disable VGA Gain2 override */
+	ret = ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			      UB9702_IR_RX_ANA_GAIN_CTRL_0, 0x00, NULL);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "rx%u: enabled FPD-Link IV DFE LMS", nport);
+
+	return 0;
+}
+
+static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
 	unsigned int port_lock_mask;
-	unsigned int port_mask;
+	unsigned int port_mask = 0;
+	bool have_fpd4 = false;
 	int ret;
 
 	for_each_active_rxport(priv, it) {
-		int ret;
+		ret = ub960_rxport_update_bits(priv, it.nport,
+					       UB960_RR_BCC_CONFIG,
+					       UB960_RR_BCC_CONFIG_BC_ALWAYS_ON,
+					       UB960_RR_BCC_CONFIG_BC_ALWAYS_ON,
+					       NULL);
+		if (ret)
+			return ret;
+	}
 
-		if (priv->hw_data->is_ub9702)
-			ret = ub960_init_rx_port_ub9702(priv, it.rxport);
-		else
-			ret = ub960_init_rx_port_ub960(priv, it.rxport);
+	/* Disable FPD4 Auto Recovery */
+	ret = ub960_write(priv, UB9702_SR_CSI_EXCLUSIVE_FWD2, 0x0f, NULL);
+	if (ret)
+		return ret;
+
+	for_each_active_rxport_fpd4(priv, it) {
+		/* Hold state machine in reset */
+		ub960_rxport_write(priv, it.nport, UB9702_RR_RX_SM_SEL_2, 0x10,
+				   &ret);
+
+		/* Set AEQ max to 0 */
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(it.nport),
+				UB9702_IR_RX_ANA_AEQ_ALP_SEL7, 0, &ret);
 
 		if (ret)
 			return ret;
+
+		dev_dbg(dev,
+			"rx%u: holding state machine and adjusting AEQ max to 0",
+			it.nport);
+	}
+
+	for_each_active_rxport(priv, it) {
+		port_mask |= BIT(it.nport);
+
+		if (it.rxport->cdr_mode == RXPORT_CDR_FPD4)
+			have_fpd4 = true;
+	}
+
+	for_each_rxport(priv, it) {
+		ret = ub960_configure_rx_port_ub9702(priv, it.nport);
+		if (ret)
+			return ret;
 	}
 
 	ret = ub960_reset(priv, false);
 	if (ret)
 		return ret;
 
-	port_mask = 0;
+	if (have_fpd4) {
+		for_each_active_rxport_fpd4(priv, it) {
+			/* Release state machine */
+			ret = ub960_rxport_write(priv, it.nport,
+						 UB9702_RR_RX_SM_SEL_2, 0x0,
+						 NULL);
+			if (ret)
+				return ret;
 
-	for_each_active_rxport(priv, it)
-		port_mask |= BIT(it.nport);
+			dev_dbg(dev, "rx%u: state machine released\n",
+				it.nport);
+		}
+
+		/* Wait for SM to resume */
+		fsleep(5000);
+
+		for_each_active_rxport_fpd4(priv, it) {
+			ret = ub960_write_ind(priv,
+					      UB960_IND_TARGET_RX_ANA(it.nport),
+					      UB9702_IR_RX_ANA_AEQ_ALP_SEL7,
+					      0x23, NULL);
+			if (ret)
+				return ret;
+
+			dev_dbg(dev, "rx%u: AEQ restart\n", it.nport);
+		}
+
+		/* Wait for lock */
+		fsleep(20000);
+
+		for_each_active_rxport_fpd4(priv, it) {
+			ret = ub960_lock_recovery_ub9702(priv, it.nport);
+			if (ret)
+				return ret;
+		}
+
+		for_each_active_rxport_fpd4(priv, it) {
+			ret = ub960_enable_aeq_lms_ub9702(priv, it.nport);
+			if (ret)
+				return ret;
+		}
+
+		for_each_active_rxport_fpd4(priv, it) {
+			/* Hold state machine in reset */
+			ret = ub960_rxport_write(priv, it.nport,
+						 UB9702_RR_RX_SM_SEL_2, 0x10,
+						 NULL);
+			if (ret)
+				return ret;
+		}
+
+		ret = ub960_reset(priv, false);
+		if (ret)
+			return ret;
+
+		for_each_active_rxport_fpd4(priv, it) {
+			/* Release state machine */
+			ret = ub960_rxport_write(priv, it.nport,
+						 UB9702_RR_RX_SM_SEL_2, 0,
+						 NULL);
+			if (ret)
+				return ret;
+		}
+	}
+
+	/* Wait time for stable lock */
+	fsleep(15000);
+
+	for_each_active_rxport_fpd4(priv, it) {
+		ret = ub960_enable_dfe_lms_ub9702(priv, it.nport);
+		if (ret)
+			return ret;
+	}
+
+	/* Wait for DFE and LMS to adapt */
+	fsleep(5000);
 
 	ret = ub960_rxport_wait_locks(priv, port_mask, &port_lock_mask);
 	if (ret)
@@ -2556,10 +2981,49 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
 		return ret;
 	}
 
+	for_each_active_rxport(priv, it) {
+		/* Enable all interrupt sources from this port */
+		ub960_rxport_write(priv, it.nport, UB960_RR_PORT_ICR_HI, 0x07,
+				   &ret);
+		ub960_rxport_write(priv, it.nport, UB960_RR_PORT_ICR_LO, 0x7f,
+				   &ret);
+
+		/* Enable I2C_PASS_THROUGH */
+		ub960_rxport_update_bits(priv, it.nport, UB960_RR_BCC_CONFIG,
+					 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
+					 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
+					 &ret);
+
+		/* Enable I2C communication to the serializer via the alias */
+		ub960_rxport_write(priv, it.nport, UB960_RR_SER_ALIAS_ID,
+				   it.rxport->ser.alias << 1, &ret);
+
+		if (ret)
+			return ret;
+	}
+
+	/* Enable FPD4 Auto Recovery, Recovery loop active */
+	ret = ub960_write(priv, UB9702_SR_CSI_EXCLUSIVE_FWD2, 0x18, NULL);
+	if (ret)
+		return ret;
+
+	for_each_active_rxport_fpd4(priv, it) {
+		u8 final_aeq;
+
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(it.nport),
+				     UB9702_IR_RX_ANA_AEQ_ALP_SEL11, &final_aeq,
+				     NULL);
+		if (ret)
+			return ret;
+
+		dev_dbg(dev, "rx%u: final AEQ = %#x\n", it.nport, final_aeq);
+	}
+
 	/*
 	 * Clear any errors caused by switching the RX port settings while
 	 * probing.
 	 */
+
 	ret = ub960_clear_rx_errors(priv);
 	if (ret)
 		return ret;
@@ -4393,7 +4857,11 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_free_ports;
 
-	ret = ub960_init_rx_ports(priv);
+	if (priv->hw_data->is_ub9702)
+		ret = ub960_init_rx_ports_ub9702(priv);
+	else
+		ret = ub960_init_rx_ports_ub960(priv);
+
 	if (ret)
 		goto err_disable_vpocs;
 

-- 
2.48.1


