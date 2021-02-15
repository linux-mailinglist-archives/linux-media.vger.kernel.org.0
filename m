Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAA831B4D9
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhBOEke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46098 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhBOEkc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:32 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7A4A2CE2;
        Mon, 15 Feb 2021 05:29:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363348;
        bh=fVOny2s3l3GFFNWVqc9vVAtE9YgCU/c5hCC2ktpP6Xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fqhSZo+12XDfcF5tGA2+TIUHIDuiBTtBnn1RMnSd9HpV3fWxf9WSIVa06pqV/DqqF
         7Po7nlxp733A8XbK1XYdS5wQjvbb0i0O+5JqGux9HWiNqZGWnt1TkMxJpsVgFT6YBL
         kTsiqmjp9wnaTOelZS+b0R87pDbhgwirYn4ZRHlQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 73/77] media: imx: imx7_mipi_csis: Define macros for DPHY_BCTRL_L fields
Date:   Mon, 15 Feb 2021 06:27:37 +0200
Message-Id: <20210215042741.28850-74-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define macros for the fields of the MIPI_CSIS_DPHY_BCTRL_L register,
based on the i.MX8MM datasheet. The numerical value written to the
register, taken from the i.MX7D code, is unchanged, and corresponds to a
20.0MHz Tx escape clock frequency according to the documentation of the
register from the i.MX8MM. Whether the other fields are applicable to
the i.MX7D is unknown.

While at it, rename the DPHY[BS]CTRL register names to DPHY_[BS]CTRL to
match the datasheet.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 53 +++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 26f323bff498..f7dcadb4fab4 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -120,13 +120,47 @@
 #define MIPI_CSIS_DPHYCTRL_ENABLE		(0x1f << 0)
 
 /* D-PHY Master and Slave Control register Low */
-#define MIPI_CSIS_DPHYBCTRL_L			0x30
+#define MIPI_CSIS_DPHY_BCTRL_L			0x30
+#define MIPI_CSIS_DPHY_BCTRL_L_USER_DATA_PATTERN_LOW(n)		(((n) & 3U) << 30)
+#define MIPI_CSIS_DPHY_BCTRL_L_BIAS_REF_VOLT_715MV		(0 << 28)
+#define MIPI_CSIS_DPHY_BCTRL_L_BIAS_REF_VOLT_724MV		(1 << 28)
+#define MIPI_CSIS_DPHY_BCTRL_L_BIAS_REF_VOLT_733MV		(2 << 28)
+#define MIPI_CSIS_DPHY_BCTRL_L_BIAS_REF_VOLT_706MV		(3 << 28)
+#define MIPI_CSIS_DPHY_BCTRL_L_BGR_CHOPPER_FREQ_3MHZ		(0 << 27)
+#define MIPI_CSIS_DPHY_BCTRL_L_BGR_CHOPPER_FREQ_1_5MHZ		(1 << 27)
+#define MIPI_CSIS_DPHY_BCTRL_L_VREG12_EXTPWR_EN_CTL		BIT(26)
+#define MIPI_CSIS_DPHY_BCTRL_L_REG_12P_LVL_CTL_1_2V		(0 << 24)
+#define MIPI_CSIS_DPHY_BCTRL_L_REG_12P_LVL_CTL_1_23V		(1 << 24)
+#define MIPI_CSIS_DPHY_BCTRL_L_REG_12P_LVL_CTL_1_17V		(2 << 24)
+#define MIPI_CSIS_DPHY_BCTRL_L_REG_12P_LVL_CTL_1_26V		(3 << 24)
+#define MIPI_CSIS_DPHY_BCTRL_L_REG_1P2_LVL_SEL			BIT(23)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_HYS_LVL_80MV		(0 << 21)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_HYS_LVL_100MV		(1 << 21)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_HYS_LVL_120MV		(2 << 21)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_HYS_LVL_140MV		(3 << 21)
+#define MIPI_CSIS_DPHY_BCTRL_L_VREF_SRC_SEL			BIT(20)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_VREF_LVL_715MV		(0 << 18)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_VREF_LVL_743MV		(1 << 18)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_VREF_LVL_650MV		(2 << 18)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_VREF_LVL_682MV		(3 << 18)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_RX_PULSE_REJECT		BIT(17)
+#define MIPI_CSIS_DPHY_BCTRL_L_MSTRCLK_LP_SLEW_RATE_DOWN_0	(0 << 15)
+#define MIPI_CSIS_DPHY_BCTRL_L_MSTRCLK_LP_SLEW_RATE_DOWN_15P	(1 << 15)
+#define MIPI_CSIS_DPHY_BCTRL_L_MSTRCLK_LP_SLEW_RATE_DOWN_30P	(3 << 15)
+#define MIPI_CSIS_DPHY_BCTRL_L_MSTRCLK_LP_SLEW_RATE_UP		BIT(14)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_CD_HYS_60MV			(0 << 13)
+#define MIPI_CSIS_DPHY_BCTRL_L_LP_CD_HYS_70MV			(1 << 13)
+#define MIPI_CSIS_DPHY_BCTRL_L_BGR_CHOPPER_EN			BIT(12)
+#define MIPI_CSIS_DPHY_BCTRL_L_ERRCONTENTION_LP_EN		BIT(11)
+#define MIPI_CSIS_DPHY_BCTRL_L_TXTRIGGER_CLK_EN			BIT(10)
+#define MIPI_CSIS_DPHY_BCTRL_L_B_DPHYCTRL(n)			(((n) * 25 / 1000000) << 0)
+
 /* D-PHY Master and Slave Control register High */
-#define MIPI_CSIS_DPHYBCTRL_H			0x34
+#define MIPI_CSIS_DPHY_BCTRL_H			0x34
 /* D-PHY Slave Control register Low */
-#define MIPI_CSIS_DPHYSCTRL_L			0x38
+#define MIPI_CSIS_DPHY_SCTRL_L			0x38
 /* D-PHY Slave Control register High */
-#define MIPI_CSIS_DPHYSCTRL_H			0x3c
+#define MIPI_CSIS_DPHY_SCTRL_H			0x3c
 
 /* ISP Configuration register */
 #define MIPI_CSIS_ISPCONFIG_CH0			0x40
@@ -550,8 +584,15 @@ static void mipi_csis_set_params(struct csi_state *state)
 	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
 	mipi_csis_write(state, MIPI_CSIS_CLK_CTRL, val);
 
-	mipi_csis_write(state, MIPI_CSIS_DPHYBCTRL_L, 0x1f4);
-	mipi_csis_write(state, MIPI_CSIS_DPHYBCTRL_H, 0);
+	mipi_csis_write(state, MIPI_CSIS_DPHY_BCTRL_L,
+			MIPI_CSIS_DPHY_BCTRL_L_BIAS_REF_VOLT_715MV |
+			MIPI_CSIS_DPHY_BCTRL_L_BGR_CHOPPER_FREQ_3MHZ |
+			MIPI_CSIS_DPHY_BCTRL_L_REG_12P_LVL_CTL_1_2V |
+			MIPI_CSIS_DPHY_BCTRL_L_LP_RX_HYS_LVL_80MV |
+			MIPI_CSIS_DPHY_BCTRL_L_LP_RX_VREF_LVL_715MV |
+			MIPI_CSIS_DPHY_BCTRL_L_LP_CD_HYS_60MV |
+			MIPI_CSIS_DPHY_BCTRL_L_B_DPHYCTRL(20000000));
+	mipi_csis_write(state, MIPI_CSIS_DPHY_BCTRL_H, 0);
 
 	/* Update the shadow register. */
 	val = mipi_csis_read(state, MIPI_CSIS_CMN_CTRL);
-- 
Regards,

Laurent Pinchart

