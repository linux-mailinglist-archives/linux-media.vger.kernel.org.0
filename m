Return-Path: <linux-media+bounces-25277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177FAA1B901
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A08313B116E
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D20221E0BD;
	Fri, 24 Jan 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n/t5pshD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69A221D5A8;
	Fri, 24 Jan 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731911; cv=none; b=l+6oQipFAQ1X/8V490h/L7zEbgdU4cwB37EiOGvX34X/W/bUYIkRBon3RQ7IPZV9fikAww4XBSIwVX/7lAwQq4Uto3k1NouIu8rLjT1JimJOc5YFUg/Z8tcFOUBB8uto3QwgfM6za2ZfDi+SlTy2zYK++Vpe6fX/8VzLc/kbKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731911; c=relaxed/simple;
	bh=9w53JRzipGP+au25XsPTfPMAU6safvRB3WSOdZV+WiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7Wuluu1VjhF9zpaD9S/S6Cdc//uOHIk0HQFu0UZo+Cnppkqiz6Ld0g9QHS50S4AQnQGcRpGoyVlRBGadD1XCTIL+Sz1ErasQPcLfze2dPQERXt3ij/FelhzcKnt7janpto4MWmaFc7EFb7Uo31hHCUPLoTfGkcUoM+IPQ4O/gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n/t5pshD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CD94166C;
	Fri, 24 Jan 2025 16:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731833;
	bh=9w53JRzipGP+au25XsPTfPMAU6safvRB3WSOdZV+WiY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n/t5pshD6xG1rDf8h7/PSnXz7+B4oCbJca19oEVhhKf3taJsetZwMY07/hSuQZwQ2
	 aWV1Pttvz3em/NyNHDSG/yHpp92APeWTWKKfjTd/2oR5lWm6bWVleQI3lF360agTPO
	 AWtSOjBbPC0Psw6oIQatHRoDOGqlYN77SRP22Wik=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:46 +0200
Subject: [PATCH v2 09/22] media: i2c: ds90ub960: Move UB9702 registers to a
 separate section
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-9-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4300;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9w53JRzipGP+au25XsPTfPMAU6safvRB3WSOdZV+WiY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68u2OP2YPvEKM+ZYzvUHoPEymupmSeXiU1Ay
 iAwXZtaw2CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLgAKCRD6PaqMvJYe
 9XC8EACRYbF874SgcwTTDIvbHHVL+nXl3+EexCbfQfGz58AQuw+q+g91rAmFq3bCNAefjT7Z1bQ
 CO7n1SbsO51R9Dc8bGUXUlLaHsYNUZJhT9rP3pDCpD4yX1224l0RNcLPfhO6mTZoBiA61qY0G8v
 Jk6tOpeRUvnjoCFaiDfseJYP0t8zgbBmiDWJ/irJdE9cqGAsico3jFgMIhoqGhxzV9rsO/Yg/2Z
 IZdPZ9czNoqsrfzHTB9y/7eBv3W/HpmjF3Khx80GYPhowlnrJgYnOVodJRAFY/tj1Vmfbmoqei+
 mCCeOIUUDUigOaX3eRw5Z6QQi8Ywwphgan/yodGsU8CjsXwGVGcYVmTX+qQ0+0i/4uWVtMzm4uR
 f0lUVcTX1AGCGU4fjECWLaK563ESYtZpF+wkcUgZINLSkG3Qg7SSEHTbz5omZNv9Od54ZHY3MCV
 bnvE81L/hT75Zq0AOejSnT0a44Xcqz+u4/zE0DDemRXCmA014uV0NRV3exskZ/Ti4+AmsYbohHA
 T1Vg8mT4DkUcAgtvlExhzicMBEFkej8p0CzToabtrq2IHCFKhr+nyjtLDDOBBlwonmOk1scsDix
 SsuUt080vyvAAtBc+dVzwUXQHD0Ui5XelQ/RMBPDE9APmdHYTY1XCKFqxCJjorBCypEAA3tq1i+
 SBMEBcu3BlnP5Hg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver supports both UB960 and UB9702. While devices work in similar
ways and have a lot of identical registers, there are also plenty of
differences.

To clarify the situation a bit, move the UB9702 registers to a separate
section and prefix them with UB9702.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 80bbba0792c1..fc910d13d7db 100644
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
2.43.0


