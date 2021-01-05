Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9232EAEE5
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbhAEPk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:40:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbhAEPk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:40:26 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D05F41C16;
        Tue,  5 Jan 2021 16:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860624;
        bh=v28bbGjNJ8vJBcMlui96mJopMyqXI9qv/SqM8z+AVB8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D+BALzYA50RZZFTzo9m3vx3g1ue6y0WDMdJJTOJSqAP2AH+bzJC9uhPu/QiD0q2gT
         o0TDZ7bKF7cvKmYHr7vLONsYDwFHbH7pjQ1OmXbYqnicfbR/UuXeSa0Ft5FqFJTbdn
         B4/p4/JreBR1dWU7GmlUUFUu/e2fUrrJQLIRZAhc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 71/75] media: imx: imx7_mipi_csis: Define macros for DPHY_BCTRL_L fields
Date:   Tue,  5 Jan 2021 17:28:48 +0200
Message-Id: <20210105152852.5733-72-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 53 +++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 14496c6cbc09..75df91527dbd 100644
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
@@ -546,8 +580,15 @@ static void mipi_csis_set_params(struct csi_state *state)
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

