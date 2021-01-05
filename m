Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CF32EAEA4
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbhAEPfd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:35:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728292AbhAEPfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:35:32 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BC05187C;
        Tue,  5 Jan 2021 16:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860598;
        bh=6VytyTAshh3DcjVI42HwvMph6jRwJjDGHtsWVxtkDtM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gDw2jt3yqkPtE2DcvvJOn1saRyil6y3kkYubFt1Zuh1IAdQaaYBK0x9+AfmINVEaP
         t68Gj8EMwKaCf0NmfwKdDShAD561kRhD5Jt7Ehm16Kj9z7WgyvtrolnciVT746PHTs
         7T3dysDgm7jBAoQ+1edjuSk9e/eSr0Dug43rFwpk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 35/75] media: imx: imx7-media-csi: Replace CSICR*_RESET_VAL with values
Date:   Tue,  5 Jan 2021 17:28:12 +0200
Message-Id: <20210105152852.5733-36-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSICR*_RESET_VAL macros only obfuscate code. Use their value
directly, replacing the numerical value with the macros that describe
register bits.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 6f39f81274b5..e3dfca630d4c 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -32,11 +32,6 @@
 #define IMX7_CSI_PAD_SRC	1
 #define IMX7_CSI_PADS_NUM	2
 
-/* reset values */
-#define CSICR1_RESET_VAL	0x40000800
-#define CSICR2_RESET_VAL	0x0
-#define CSICR3_RESET_VAL	0x0
-
 /* csi control reg 1 */
 #define BIT_SWAP16_EN		BIT(31)
 #define BIT_EXT_VSYNC		BIT(30)
@@ -211,9 +206,9 @@ static void imx7_csi_hw_reset(struct imx7_csi *csi)
 			   imx7_csi_reg_read(csi, CSI_CSICR3) | BIT_FRMCNT_RST,
 			   CSI_CSICR3);
 
-	imx7_csi_reg_write(csi, CSICR1_RESET_VAL, CSI_CSICR1);
-	imx7_csi_reg_write(csi, CSICR2_RESET_VAL, CSI_CSICR2);
-	imx7_csi_reg_write(csi, CSICR3_RESET_VAL, CSI_CSICR3);
+	imx7_csi_reg_write(csi, BIT_EXT_VSYNC | BIT_HSYNC_POL, CSI_CSICR1);
+	imx7_csi_reg_write(csi, 0, CSI_CSICR2);
+	imx7_csi_reg_write(csi, 0, CSI_CSICR3);
 }
 
 static u32 imx7_csi_irq_clear(struct imx7_csi *csi)
-- 
Regards,

Laurent Pinchart

