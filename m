Return-Path: <linux-media+bounces-27368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA97A4C61A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E5D17A3222
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6F022B5A4;
	Mon,  3 Mar 2025 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A71GGNw4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A10214A93;
	Mon,  3 Mar 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017787; cv=none; b=L3nnAGb4gnyDfDq7uVeqb1f4doqD81ZBcoPKa4iRQZinQTBYtgSAwZrtfwzOY0D5ey8lxHSy5d5AQ/U4CAeji1N4Eq87O+rXgagtdEOC5LMUJT1bbJTzYw6X5L+FyyCwQgfGh7vq9uTClr7X5W1f+JAutk5oYPi87hLckq1037U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017787; c=relaxed/simple;
	bh=r6QgWYf401NOa9KkoAhiZK5TU+mf3VFZJPP5qiDTYuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gY04q0jmr4v7NnHyfCd093+WDXJ409AjxH4aXvH5n1tN3UHutgpWQbfaFzHfFHbouDXxGIhMwuY+RVB9xUbdyW4ToiNNYEyceGiKNM3HweMeQrxMn4oExisjyDm5Mw6eAZpwc0G0Hvtdjsb1O9ktKPpbd2LTM/dqaI4RTcqXytE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A71GGNw4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7C8111E9;
	Mon,  3 Mar 2025 17:01:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017693;
	bh=r6QgWYf401NOa9KkoAhiZK5TU+mf3VFZJPP5qiDTYuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A71GGNw4GNkB5adV8MNlxlScpTyws4MKbXf+o0+ywk4dr8KBC99QQXrs8ZHBzHjdJ
	 ucEvdqPwXMVeHSiOBpTnVWqwmVX2xBEuPN9xmWG0ZvuOGYeRAZwMVoD5uFSNz1JAOK
	 caVBM2h4px5JnmC5eNg5EfFCwovQ0vlT//YJB5r0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:12 +0530
Subject: [PATCH v3 09/19] media: i2c: ds90ub960: Move UB9702 registers to a
 separate section
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-9-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4413;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=IXL5dSwbgPveyVgafIS7q5lVNIBo7+BRNM1+9mJTPLU=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ/XElP6asDwOFeaI5YNSw8epK7dONxHdyBV
 DtPM3Zs402JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfwAKCRBD3pH5JJpx
 RWVhEADBqsb2gIgQ8LYgVdD3P0GVMXueYLt9pVec1yui7fxy2O6jN4qPO+zAwikbaFZZMJOTxZI
 ILXitNdzzMyBDXcSVlTRYNBXhBItaoXBb0g8bpGyKOPW8HluFokj+NjgPOSPZiuWhrg1lZ+G9A7
 R90ILOdON3/nbQyp3jOgxOeP3hh+Y9xqueUxaVxFL/rYVGSTyCt8wZurxJrMaw1W4ts4/5PIHCr
 xdHleOU3zqC+OEvqEukR0plxEl11Sm1rYBIdsag3nUOr4NZYAdiJhLK6BTfXMDxCImXYET2pf6M
 rikoe/dIZS5ufiQxLTGOY8sbxzvMd3bfOsO7wpOlcDgMjZp1Y53P0SNZu7QVDcK5yu3Hbj+a+nS
 PxXBaKlsPE9PfUoxxrYXQBqctk/skRHiJg6Ydvq+H3hyZRlrQUFLaRnegNAZa+Ig3LjBO4BdgEA
 JCmMw5U39r/1RjjKTC9171fl4EM5ED3xDTz18Tb23zwWllG1pQO+h2uYT7Dm1ewkGy4XNzG0gxI
 1TWvIW9gCFaMLAklg1X1kolV3ju3oB4r2T6xDaVAgveD8/BfTv+ZM65jJK4qKbmpY0igs/dDzfC
 gJoMBqt6wNrpJ5pbKv0769Pes0eM625C6uHwmJ2ReO0M+biRWCSRdsyZCrkLy0oIe6I16RPYRcz
 fvEhpm6Mi0P03EA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

The driver supports both UB960 and UB9702. While devices work in similar
ways and have a lot of identical registers, there are also plenty of
differences.

To clarify the situation a bit, move the UB9702 registers to a separate
section and prefix them with UB9702.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 086aa8cc78fa4e4e9ccc08589cbaf1cc06104786..f9af6d643ac86de22286b2107d747341c7d6f9b0 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -307,8 +307,6 @@
 
 #define UB960_XR_REFCLK_FREQ			0xa5	/* UB960 */
 
-#define UB960_RR_VC_ID_MAP(x)			(0xa0 + (x)) /* UB9702 */
-
 #define UB960_SR_IND_ACC_CTL			0xb0
 #define UB960_SR_IND_ACC_CTL_IA_AUTO_INC	BIT(1)
 
@@ -321,9 +319,6 @@
 #define UB960_SR_FV_MIN_TIME			0xbc
 #define UB960_SR_GPIO_PD_CTL			0xbe
 
-#define UB960_SR_FPD_RATE_CFG			0xc2	/* UB9702 */
-#define UB960_SR_CSI_PLL_DIV			0xc9	/* UB9702 */
-
 #define UB960_RR_PORT_DEBUG			0xd0
 #define UB960_RR_AEQ_CTL2			0xd2
 #define UB960_RR_AEQ_CTL2_SET_AEQ_FLOOR		BIT(2)
@@ -354,15 +349,12 @@
 #define UB960_RR_SEN_INT_RISE_STS		0xde
 #define UB960_RR_SEN_INT_FALL_STS		0xdf
 
-#define UB960_RR_CHANNEL_MODE			0xe4	/* UB9702 */
 
 #define UB960_SR_FPD3_RX_ID(n)			(0xf0 + (n))
 #define UB960_SR_FPD3_RX_ID_LEN			6
 
 #define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n))
 
-#define UB9702_SR_REFCLK_FREQ			0x3d
-
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
@@ -397,6 +389,14 @@
 #define UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(3)
 #define UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(2, 0)
 
+/* UB9702 Registers */
+
+#define UB9702_SR_REFCLK_FREQ			0x3d
+#define UB9702_RR_VC_ID_MAP(x)			(0xa0 + (x))
+#define UB9702_SR_FPD_RATE_CFG			0xc2
+#define UB9702_SR_CSI_PLL_DIV			0xc9
+#define UB9702_RR_CHANNEL_MODE			0xe4
+
 /* EQ related */
 
 #define UB960_MIN_AEQ_STROBE_POS -7
@@ -1989,7 +1989,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, &ret);
 
 	if (priv->hw_data->is_ub9702) {
-		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div, &ret);
+		ub960_write(priv, UB9702_SR_CSI_PLL_DIV, pll_div, &ret);
 
 		switch (priv->tx_data_rate) {
 		case MHZ(1600):
@@ -2170,7 +2170,7 @@ static int ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
 
 	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
 				 bc_freq_val, &ret);
-	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, fpd_func_mode,
+	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, fpd_func_mode,
 			   &ret);
 
 	/* set serdes_eq_mode = 1 */
@@ -2197,7 +2197,7 @@ static int ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
 			      BIT(3), BIT(3), &ret);
 
 	/* RX port to half-rate */
-	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
+	ub960_update_bits(priv, UB9702_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
 			  BIT(nport * 2), &ret);
 
 	return ret;
@@ -2285,7 +2285,7 @@ static int ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
 				 bc_freq_val, &ret);
 
 	/* FPD4 Sync Mode */
-	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, 0, &ret);
+	ub960_rxport_write(priv, nport, UB9702_RR_CHANNEL_MODE, 0, &ret);
 
 	/* add serdes_eq_offset of 4 */
 	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2b, 0x04,
@@ -2312,7 +2312,7 @@ static int ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
 			&ret);
 
 	/* RX port to 7.55G mode */
-	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
+	ub960_update_bits(priv, UB9702_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
 			  0 << (nport * 2), &ret);
 
 	if (ret)
@@ -2786,7 +2786,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				/* Map all VCs from this port to VC(nport) */
 				for (i = 0; i < 8; i++)
 					ub960_rxport_write(priv, nport,
-							   UB960_RR_VC_ID_MAP(i),
+							   UB9702_RR_VC_ID_MAP(i),
 							   (nport << 4) | nport,
 							   &ret);
 			}

-- 
2.48.1


