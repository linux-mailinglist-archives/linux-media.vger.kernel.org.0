Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1C5183D8D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgCLXrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgCLXrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90B5E1467;
        Fri, 13 Mar 2020 00:47:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056856;
        bh=wTVTOAlVoj/b6Ccz4EzfoiHfmEfkT11FwY3bNzXAsqs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OnPZ0i7YXovgniY9ZviM/10wNJnlGvU5fWV3rpjkE7dyjnZ0sUgI3kmHHcAKeamTM
         0YOAuxoYMp1a/q7Zdr2iPazGkv17O+rCIj+oekS8cn2Aem4Y/gy78SBegs4IbiEOtd
         QlwxeLlxxzSCpzPQIDL4mYS95Vo9ksYxuiZMGrI4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 10/14] media: imx: imx7-mipi-csis: Align macro definitions
Date:   Fri, 13 Mar 2020 01:47:18 +0200
Message-Id: <20200312234722.23483-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The register macros at the top of the file have their value not aligned
on the same column, hindering readability. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 130 ++++++++++-----------
 1 file changed, 65 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 922657b856b6..40004a98f801 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -31,15 +31,15 @@
 
 #include "imx-media.h"
 
-#define CSIS_DRIVER_NAME	"imx7-mipi-csis"
-#define CSIS_SUBDEV_NAME	CSIS_DRIVER_NAME
+#define CSIS_DRIVER_NAME			"imx7-mipi-csis"
+#define CSIS_SUBDEV_NAME			CSIS_DRIVER_NAME
 
-#define CSIS_PAD_SINK		0
-#define CSIS_PAD_SOURCE		1
-#define CSIS_PADS_NUM		2
+#define CSIS_PAD_SINK				0
+#define CSIS_PAD_SOURCE				1
+#define CSIS_PADS_NUM				2
 
-#define MIPI_CSIS_DEF_PIX_WIDTH		640
-#define MIPI_CSIS_DEF_PIX_HEIGHT	480
+#define MIPI_CSIS_DEF_PIX_WIDTH			640
+#define MIPI_CSIS_DEF_PIX_HEIGHT		480
 
 /* Register map definition */
 
@@ -64,42 +64,42 @@
 #define MIPI_CSIS_CLK_CTRL_WCLK_SRC		BIT(0)
 
 /* CSIS Interrupt mask */
-#define MIPI_CSIS_INTMSK		0x10
-#define MIPI_CSIS_INTMSK_EVEN_BEFORE	BIT(31)
-#define MIPI_CSIS_INTMSK_EVEN_AFTER	BIT(30)
-#define MIPI_CSIS_INTMSK_ODD_BEFORE	BIT(29)
-#define MIPI_CSIS_INTMSK_ODD_AFTER	BIT(28)
-#define MIPI_CSIS_INTMSK_FRAME_START	BIT(24)
-#define MIPI_CSIS_INTMSK_FRAME_END	BIT(20)
-#define MIPI_CSIS_INTMSK_ERR_SOT_HS	BIT(16)
-#define MIPI_CSIS_INTMSK_ERR_LOST_FS	BIT(12)
-#define MIPI_CSIS_INTMSK_ERR_LOST_FE	BIT(8)
-#define MIPI_CSIS_INTMSK_ERR_OVER	BIT(4)
-#define MIPI_CSIS_INTMSK_ERR_WRONG_CFG	BIT(3)
-#define MIPI_CSIS_INTMSK_ERR_ECC	BIT(2)
-#define MIPI_CSIS_INTMSK_ERR_CRC	BIT(1)
-#define MIPI_CSIS_INTMSK_ERR_UNKNOWN	BIT(0)
+#define MIPI_CSIS_INTMSK			0x10
+#define MIPI_CSIS_INTMSK_EVEN_BEFORE		BIT(31)
+#define MIPI_CSIS_INTMSK_EVEN_AFTER		BIT(30)
+#define MIPI_CSIS_INTMSK_ODD_BEFORE		BIT(29)
+#define MIPI_CSIS_INTMSK_ODD_AFTER		BIT(28)
+#define MIPI_CSIS_INTMSK_FRAME_START		BIT(24)
+#define MIPI_CSIS_INTMSK_FRAME_END		BIT(20)
+#define MIPI_CSIS_INTMSK_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INTMSK_ERR_LOST_FS		BIT(12)
+#define MIPI_CSIS_INTMSK_ERR_LOST_FE		BIT(8)
+#define MIPI_CSIS_INTMSK_ERR_OVER		BIT(4)
+#define MIPI_CSIS_INTMSK_ERR_WRONG_CFG		BIT(3)
+#define MIPI_CSIS_INTMSK_ERR_ECC		BIT(2)
+#define MIPI_CSIS_INTMSK_ERR_CRC		BIT(1)
+#define MIPI_CSIS_INTMSK_ERR_UNKNOWN		BIT(0)
 
 /* CSIS Interrupt source */
-#define MIPI_CSIS_INTSRC		0x14
-#define MIPI_CSIS_INTSRC_EVEN_BEFORE	BIT(31)
-#define MIPI_CSIS_INTSRC_EVEN_AFTER	BIT(30)
-#define MIPI_CSIS_INTSRC_EVEN		BIT(30)
-#define MIPI_CSIS_INTSRC_ODD_BEFORE	BIT(29)
-#define MIPI_CSIS_INTSRC_ODD_AFTER	BIT(28)
-#define MIPI_CSIS_INTSRC_ODD		(0x3 << 28)
-#define MIPI_CSIS_INTSRC_NON_IMAGE_DATA	(0xf << 28)
-#define MIPI_CSIS_INTSRC_FRAME_START	BIT(24)
-#define MIPI_CSIS_INTSRC_FRAME_END	BIT(20)
-#define MIPI_CSIS_INTSRC_ERR_SOT_HS	BIT(16)
-#define MIPI_CSIS_INTSRC_ERR_LOST_FS	BIT(12)
-#define MIPI_CSIS_INTSRC_ERR_LOST_FE	BIT(8)
-#define MIPI_CSIS_INTSRC_ERR_OVER	BIT(4)
-#define MIPI_CSIS_INTSRC_ERR_WRONG_CFG	BIT(3)
-#define MIPI_CSIS_INTSRC_ERR_ECC	BIT(2)
-#define MIPI_CSIS_INTSRC_ERR_CRC	BIT(1)
-#define MIPI_CSIS_INTSRC_ERR_UNKNOWN	BIT(0)
-#define MIPI_CSIS_INTSRC_ERRORS		0xfffff
+#define MIPI_CSIS_INTSRC			0x14
+#define MIPI_CSIS_INTSRC_EVEN_BEFORE		BIT(31)
+#define MIPI_CSIS_INTSRC_EVEN_AFTER		BIT(30)
+#define MIPI_CSIS_INTSRC_EVEN			BIT(30)
+#define MIPI_CSIS_INTSRC_ODD_BEFORE		BIT(29)
+#define MIPI_CSIS_INTSRC_ODD_AFTER		BIT(28)
+#define MIPI_CSIS_INTSRC_ODD			(0x3 << 28)
+#define MIPI_CSIS_INTSRC_NON_IMAGE_DATA		(0xf << 28)
+#define MIPI_CSIS_INTSRC_FRAME_START		BIT(24)
+#define MIPI_CSIS_INTSRC_FRAME_END		BIT(20)
+#define MIPI_CSIS_INTSRC_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INTSRC_ERR_LOST_FS		BIT(12)
+#define MIPI_CSIS_INTSRC_ERR_LOST_FE		BIT(8)
+#define MIPI_CSIS_INTSRC_ERR_OVER		BIT(4)
+#define MIPI_CSIS_INTSRC_ERR_WRONG_CFG		BIT(3)
+#define MIPI_CSIS_INTSRC_ERR_ECC		BIT(2)
+#define MIPI_CSIS_INTSRC_ERR_CRC		BIT(1)
+#define MIPI_CSIS_INTSRC_ERR_UNKNOWN		BIT(0)
+#define MIPI_CSIS_INTSRC_ERRORS			0xfffff
 
 /* D-PHY status control */
 #define MIPI_CSIS_DPHYSTATUS			0x20
@@ -121,19 +121,19 @@
 #define MIPI_CSIS_DPHYCTRL_ENABLE		(0x1f << 0)
 
 /* D-PHY Master and Slave Control register Low */
-#define MIPI_CSIS_DPHYBCTRL_L		0x30
+#define MIPI_CSIS_DPHYBCTRL_L			0x30
 /* D-PHY Master and Slave Control register High */
-#define MIPI_CSIS_DPHYBCTRL_H		0x34
+#define MIPI_CSIS_DPHYBCTRL_H			0x34
 /* D-PHY Slave Control register Low */
-#define MIPI_CSIS_DPHYSCTRL_L		0x38
+#define MIPI_CSIS_DPHYSCTRL_L			0x38
 /* D-PHY Slave Control register High */
-#define MIPI_CSIS_DPHYSCTRL_H		0x3c
+#define MIPI_CSIS_DPHYSCTRL_H			0x3c
 
 /* ISP Configuration register */
-#define MIPI_CSIS_ISPCONFIG_CH0		0x40
-#define MIPI_CSIS_ISPCONFIG_CH1		0x50
-#define MIPI_CSIS_ISPCONFIG_CH2		0x60
-#define MIPI_CSIS_ISPCONFIG_CH3		0x70
+#define MIPI_CSIS_ISPCONFIG_CH0			0x40
+#define MIPI_CSIS_ISPCONFIG_CH1			0x50
+#define MIPI_CSIS_ISPCONFIG_CH2			0x60
+#define MIPI_CSIS_ISPCONFIG_CH3			0x70
 
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MSK	(0xff << 24)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP(x)	((x) << 24)
@@ -146,33 +146,33 @@
 #define MIPI_CSIS_ISPCFG_FMT_RAW14		(0x2d << 2)
 
 /* User defined formats, x = 1...4 */
-#define MIPI_CSIS_ISPCFG_FMT_USER(x)	((0x30 + (x) - 1) << 2)
-#define MIPI_CSIS_ISPCFG_FMT_MASK	(0x3f << 2)
+#define MIPI_CSIS_ISPCFG_FMT_USER(x)		((0x30 + (x) - 1) << 2)
+#define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
 
 /* ISP Image Resolution register */
-#define MIPI_CSIS_ISPRESOL_CH0		0x44
-#define MIPI_CSIS_ISPRESOL_CH1		0x54
-#define MIPI_CSIS_ISPRESOL_CH2		0x64
-#define MIPI_CSIS_ISPRESOL_CH3		0x74
-#define CSIS_MAX_PIX_WIDTH		0xffff
-#define CSIS_MAX_PIX_HEIGHT		0xffff
+#define MIPI_CSIS_ISPRESOL_CH0			0x44
+#define MIPI_CSIS_ISPRESOL_CH1			0x54
+#define MIPI_CSIS_ISPRESOL_CH2			0x64
+#define MIPI_CSIS_ISPRESOL_CH3			0x74
+#define CSIS_MAX_PIX_WIDTH			0xffff
+#define CSIS_MAX_PIX_HEIGHT			0xffff
 
 /* ISP SYNC register */
-#define MIPI_CSIS_ISPSYNC_CH0		0x48
-#define MIPI_CSIS_ISPSYNC_CH1		0x58
-#define MIPI_CSIS_ISPSYNC_CH2		0x68
-#define MIPI_CSIS_ISPSYNC_CH3		0x78
+#define MIPI_CSIS_ISPSYNC_CH0			0x48
+#define MIPI_CSIS_ISPSYNC_CH1			0x58
+#define MIPI_CSIS_ISPSYNC_CH2			0x68
+#define MIPI_CSIS_ISPSYNC_CH3			0x78
 
 #define MIPI_CSIS_ISPSYNC_HSYNC_LINTV_OFFSET	18
 #define MIPI_CSIS_ISPSYNC_VSYNC_SINTV_OFFSET	12
 #define MIPI_CSIS_ISPSYNC_VSYNC_EINTV_OFFSET	0
 
 /* Non-image packet data buffers */
-#define MIPI_CSIS_PKTDATA_ODD		0x2000
-#define MIPI_CSIS_PKTDATA_EVEN		0x3000
-#define MIPI_CSIS_PKTDATA_SIZE		SZ_4K
+#define MIPI_CSIS_PKTDATA_ODD			0x2000
+#define MIPI_CSIS_PKTDATA_EVEN			0x3000
+#define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
 
-#define DEFAULT_SCLK_CSIS_FREQ		166000000UL
+#define DEFAULT_SCLK_CSIS_FREQ			166000000UL
 
 enum {
 	ST_POWERED	= 1,
-- 
Regards,

Laurent Pinchart

