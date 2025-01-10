Return-Path: <linux-media+bounces-24588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F0A08B25
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D57F165D41
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61B120B80B;
	Fri, 10 Jan 2025 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JodxH9VM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803F520B206;
	Fri, 10 Jan 2025 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500528; cv=none; b=pNc4LWHL6WzbVomjsQmIJEqSFjgKMZCGXEm68Y/wQLIcsFpupBikKJrhvD1CPKN2Yh2bBS9DoiFGIG4dqALrZVYm1oe2ZF1PqG//nDm1ugZZtbwpyH8a87lvNP0APfzcNSQVMZuRJoYV0NYLXaPlPGMB1MRNYdfkiBQDm9ZzfoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500528; c=relaxed/simple;
	bh=9w53JRzipGP+au25XsPTfPMAU6safvRB3WSOdZV+WiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rxld73BDUd2WrHldNT8efOd39s8z6E65x9EmV/KT7fs48FOaCXtDA8w+UnVgyYtjbrMXbyeflbShqn6RQ9ZVTb3QmRJtGWVXIjEbadkQrLmu33oamEntMezGrNdBWRtM8yhd+EQDtQdq3qFUxJbLyb8gMxWjBbp5/aVSrk3d0AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JodxH9VM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8D471971;
	Fri, 10 Jan 2025 10:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500455;
	bh=9w53JRzipGP+au25XsPTfPMAU6safvRB3WSOdZV+WiY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JodxH9VMZMTa58nYzTMkj8ZpGar/zip2Yt38YejSgONHWyskXEAefLIzbjgtoknZu
	 3Qg61DCtXcjVwdxVmBlyLVkFAtQPiD5U8mti3tupEDXi+9Q+ijibHywsxhaW3y/8tD
	 fdBeCFbv42pxM2dx45wxTSr9C/XmyBbD335GXKEA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:08 +0200
Subject: [PATCH 08/19] media: i2c: ds90ub960: Move UB9702 registers to a
 separate section
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-8-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4300;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9w53JRzipGP+au25XsPTfPMAU6safvRB3WSOdZV+WiY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUTBujd3qdE65AkKVZaLHzhmdVEMBsUowxXM
 6UmkwN6jRGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlEwAKCRD6PaqMvJYe
 9ZkpD/0bUqwgCGUsUvKmGM+34PwqIJ6CV4qKv2Qt9oPgCDGzGKZ2wvgtrV3go/685Z3TYsfCV18
 EmLfeg7tI8f6o9VeO76pjARtDVPMhzq3aIjkGLqosfHw0ajhFbLS7uXH81xdjVv19b5PS4PDNZG
 b3W2cim5V0aOyd5f0WwawOjvbSfk0FoTnJaoYU43fLjN8vtK+nEUo84ZwduhXKy58yrWjoulUwV
 LymHE+efw0dgc+FlvtWnIb2ByX2uy8jIm1viRpBRAxX6SksAJCTKJmw7kdN5FaMuquuRAIZLzak
 tBtQefwpWYuAp6fzE8GgMu482GaxqEDVEAO7xbYXih8SqQNO8eEwBmLB/e9xs+Ai4Q39a+HhqnI
 vgP7plPgj9BCoFNf/Py/QHgiel1TaJLoZXuw/xZWfCsvgnVbn7QgcsYZ0LXsrzooDUIRKbHUucS
 Dx9naTBbbN0+7gHrCKGXKRTrlEPup/ZckLBiTBtYiKAz/kXdkSrfYEYXcG2wGavHiSeSDxzG44p
 n2M07jfbDCj5njDMay8fuNJg/9R+c3/8w/b2LhyfSvEzKI5tjWPNEXUx2N/zuCdSsHxLiGZMPDj
 RaQwKMgSE5rvHfvZp5WUyp/qLbVRtPj4ZEVkrC/21vx8rRkEX+Kzlzpc8nQm09NF2YwCWB0V8YT
 K47k+OkQD4iyMMQ==
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


