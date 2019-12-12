Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 792EC11CF1B
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 15:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbfLLOD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 09:03:26 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57607 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729570AbfLLOD0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 09:03:26 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ifP3s-0007e8-LP; Thu, 12 Dec 2019 15:03:24 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH v2 3/4] media: coda: jpeg: add JPEG register definitions for CODA960
Date:   Thu, 12 Dec 2019 15:02:54 +0100
Message-Id: <20191212140255.8766-3-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212140255.8766-1-p.zabel@pengutronix.de>
References: <20191212140255.8766-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CODA960 JPEG codec is controlled directly from the host, there is no
support in the BIT processor firmware. This patch adds the necessary
register definitions.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda_regs.h | 83 +++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/media/platform/coda/coda_regs.h b/drivers/media/platform/coda/coda_regs.h
index b17464b56d3d..da5bb3212528 100644
--- a/drivers/media/platform/coda/coda_regs.h
+++ b/drivers/media/platform/coda/coda_regs.h
@@ -451,12 +451,21 @@
 #define CODA9_CMD_FIRMWARE_CODE_REV		0x1c4
 
 #define CODA9_GDMA_BASE				0x1000
+#define CODA9_GDI_CONTROL			(CODA9_GDMA_BASE + 0x034)
+#define CODA9_GDI_PIC_INIT_HOST			(CODA9_GDMA_BASE + 0x038)
+#define CODA9_GDI_STATUS			(CODA9_GDMA_BASE + 0x080)
 #define CODA9_GDI_WPROT_ERR_CLR			(CODA9_GDMA_BASE + 0x0a0)
 #define CODA9_GDI_WPROT_RGN_EN			(CODA9_GDMA_BASE + 0x0ac)
 
 #define CODA9_GDI_BUS_CTRL			(CODA9_GDMA_BASE + 0x0f0)
 #define CODA9_GDI_BUS_STATUS			(CODA9_GDMA_BASE + 0x0f4)
 
+#define CODA9_GDI_INFO_CONTROL			(CODA9_GDMA_BASE + 0x400)
+#define CODA9_GDI_INFO_PIC_SIZE			(CODA9_GDMA_BASE + 0x404)
+#define CODA9_GDI_INFO_BASE_Y			(CODA9_GDMA_BASE + 0x408)
+#define CODA9_GDI_INFO_BASE_CB			(CODA9_GDMA_BASE + 0x40c)
+#define CODA9_GDI_INFO_BASE_CR			(CODA9_GDMA_BASE + 0x410)
+
 #define CODA9_GDI_XY2_CAS_0			(CODA9_GDMA_BASE + 0x800)
 #define CODA9_GDI_XY2_CAS_F			(CODA9_GDMA_BASE + 0x83c)
 
@@ -477,4 +486,78 @@
 #define CODA9_GDI_RBC2_AXI_1F			(CODA9_GDMA_BASE + 0x91c)
 #define	CODA9_GDI_TILEDBUF_BASE			(CODA9_GDMA_BASE + 0x920)
 
+#define CODA9_JPEG_BASE				0x3000
+#define CODA9_REG_JPEG_PIC_START		(CODA9_JPEG_BASE + 0x000)
+#define CODA9_REG_JPEG_PIC_STATUS		(CODA9_JPEG_BASE + 0x004)
+#define		CODA9_JPEG_STATUS_OVERFLOW		BIT(3)
+#define		CODA9_JPEG_STATUS_BBC_INT		BIT(2)
+#define		CODA9_JPEG_STATUS_ERROR			BIT(1)
+#define		CODA9_JPEG_STATUS_DONE			BIT(0)
+#define CODA9_REG_JPEG_PIC_ERRMB		(CODA9_JPEG_BASE + 0x008)
+#define		CODA9_JPEG_ERRMB_RESTART_IDX_MASK	(0xf << 24)
+#define		CODA9_JPEG_ERRMB_MCU_POS_X_MASK		(0xfff << 12)
+#define		CODA9_JPEG_ERRMB_MCU_POS_Y_MASK		0xfff
+#define CODA9_REG_JPEG_PIC_CTRL			(CODA9_JPEG_BASE + 0x010)
+#define		CODA9_JPEG_PIC_CTRL_USER_HUFFMAN_EN	BIT(6)
+#define		CODA9_JPEG_PIC_CTRL_TC_DIRECTION	BIT(4)
+#define		CODA9_JPEG_PIC_CTRL_ENCODER_EN		BIT(3)
+#define CODA9_REG_JPEG_PIC_SIZE			(CODA9_JPEG_BASE + 0x014)
+#define CODA9_REG_JPEG_MCU_INFO			(CODA9_JPEG_BASE + 0x018)
+#define		CODA9_JPEG_MCU_BLOCK_NUM_OFFSET		16
+#define		CODA9_JPEG_COMP_NUM_OFFSET		12
+#define		CODA9_JPEG_COMP0_INFO_OFFSET		8
+#define		CODA9_JPEG_COMP1_INFO_OFFSET		4
+#define		CODA9_JPEG_COMP2_INFO_OFFSET		0
+#define CODA9_REG_JPEG_ROT_INFO			(CODA9_JPEG_BASE + 0x01c)
+#define		CODA9_JPEG_ROT_MIR_ENABLE		BIT(4)
+#define		CODA9_JPEG_ROT_MIR_MODE_MASK		0xf
+#define CODA9_REG_JPEG_SCL_INFO			(CODA9_JPEG_BASE + 0x020)
+#define		CODA9_JPEG_SCL_ENABLE			BIT(4)
+#define		CODA9_JPEG_SCL_HOR_MODE_MASK		(0x3 << 2)
+#define		CODA9_JPEG_SCL_VER_MODE_MASK		(0x3 << 0)
+#define CODA9_REG_JPEG_IF_INFO			(CODA9_JPEG_BASE + 0x024)
+#define		CODA9_JPEG_SENS_IF_CLR			BIT(1)
+#define		CODA9_JPEG_DISP_IF_CLR			BIT(0)
+#define CODA9_REG_JPEG_OP_INFO			(CODA9_JPEG_BASE + 0x02c)
+#define		CODA9_JPEG_BUS_REQ_NUM_OFFSET		0
+#define		CODA9_JPEG_BUS_REQ_NUM_MASK		0x7
+#define CODA9_REG_JPEG_DPB_CONFIG		(CODA9_JPEG_BASE + 0x030)
+#define CODA9_REG_JPEG_DPB_BASE00		(CODA9_JPEG_BASE + 0x040)
+#define CODA9_REG_JPEG_HUFF_CTRL		(CODA9_JPEG_BASE + 0x080)
+#define CODA9_REG_JPEG_HUFF_ADDR		(CODA9_JPEG_BASE + 0x084)
+#define CODA9_REG_JPEG_HUFF_DATA		(CODA9_JPEG_BASE + 0x088)
+#define CODA9_REG_JPEG_QMAT_CTRL		(CODA9_JPEG_BASE + 0x090)
+#define CODA9_REG_JPEG_QMAT_ADDR		(CODA9_JPEG_BASE + 0x094)
+#define CODA9_REG_JPEG_QMAT_DATA		(CODA9_JPEG_BASE + 0x098)
+#define CODA9_REG_JPEG_RST_INTVAL		(CODA9_JPEG_BASE + 0x0b0)
+#define CODA9_REG_JPEG_RST_INDEX		(CODA9_JPEG_BASE + 0x0b4)
+#define CODA9_REG_JPEG_RST_COUNT		(CODA9_JPEG_BASE + 0x0b8)
+#define CODA9_REG_JPEG_DPCM_DIFF_Y		(CODA9_JPEG_BASE + 0x0f0)
+#define CODA9_REG_JPEG_DPCM_DIFF_CB		(CODA9_JPEG_BASE + 0x0f4)
+#define CODA9_REG_JPEG_DPCM_DIFF_CR		(CODA9_JPEG_BASE + 0x0f8)
+#define CODA9_REG_JPEG_GBU_CTRL			(CODA9_JPEG_BASE + 0x100)
+#define CODA9_REG_JPEG_GBU_BT_PTR		(CODA9_JPEG_BASE + 0x110)
+#define CODA9_REG_JPEG_GBU_WD_PTR		(CODA9_JPEG_BASE + 0x114)
+#define CODA9_REG_JPEG_GBU_TT_CNT		(CODA9_JPEG_BASE + 0x118)
+#define CODA9_REG_JPEG_GBU_BBSR			(CODA9_JPEG_BASE + 0x140)
+#define CODA9_REG_JPEG_GBU_BBER			(CODA9_JPEG_BASE + 0x144)
+#define CODA9_REG_JPEG_GBU_BBIR			(CODA9_JPEG_BASE + 0x148)
+#define CODA9_REG_JPEG_GBU_BBHR			(CODA9_JPEG_BASE + 0x14c)
+#define CODA9_REG_JPEG_GBU_BCNT			(CODA9_JPEG_BASE + 0x158)
+#define CODA9_REG_JPEG_GBU_FF_RPTR		(CODA9_JPEG_BASE + 0x160)
+#define CODA9_REG_JPEG_GBU_FF_WPTR		(CODA9_JPEG_BASE + 0x164)
+#define CODA9_REG_JPEG_BBC_END_ADDR		(CODA9_JPEG_BASE + 0x208)
+#define CODA9_REG_JPEG_BBC_WR_PTR		(CODA9_JPEG_BASE + 0x20c)
+#define CODA9_REG_JPEG_BBC_RD_PTR		(CODA9_JPEG_BASE + 0x210)
+#define CODA9_REG_JPEG_BBC_EXT_ADDR		(CODA9_JPEG_BASE + 0x214)
+#define CODA9_REG_JPEG_BBC_INT_ADDR		(CODA9_JPEG_BASE + 0x218)
+#define CODA9_REG_JPEG_BBC_DATA_CNT		(CODA9_JPEG_BASE + 0x21c)
+#define CODA9_REG_JPEG_BBC_COMMAND		(CODA9_JPEG_BASE + 0x220)
+#define CODA9_REG_JPEG_BBC_BUSY			(CODA9_JPEG_BASE + 0x224)
+#define CODA9_REG_JPEG_BBC_CTRL			(CODA9_JPEG_BASE + 0x228)
+#define CODA9_REG_JPEG_BBC_CUR_POS		(CODA9_JPEG_BASE + 0x22c)
+#define CODA9_REG_JPEG_BBC_BAS_ADDR		(CODA9_JPEG_BASE + 0x230)
+#define CODA9_REG_JPEG_BBC_STRM_CTRL		(CODA9_JPEG_BASE + 0x234)
+#define CODA9_REG_JPEG_BBC_FLUSH_CMD		(CODA9_JPEG_BASE + 0x238)
+
 #endif
-- 
2.20.1

