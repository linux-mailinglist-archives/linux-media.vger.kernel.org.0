Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A92331B4A9
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhBOEem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:34:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbhBOEei (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:34:38 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B69A519B7;
        Mon, 15 Feb 2021 05:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363316;
        bh=sp0rZdZqF8mdjxa5MI2BoGiHu+pU2M/tof1Xndcfj1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oo//k/+mMLz2Hqopk0ZRyg0tGwrYm78TYigT/gEbgHcsk9zEuZYhqu5wSIRKRlytT
         SODoEWNCaMOM/5apEdE3Sf/53xCoTb0w3JbrQcNUgw+8bHfTSJce7JUQiS2Rs7V83u
         lVw3ia7I1CD3gofOrGeTeiMYpbDVyGA0mXJZwXaY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 34/77] media: imx: imx7-media-csi: Replace CSICR*_RESET_VAL with values
Date:   Mon, 15 Feb 2021 06:26:58 +0200
Message-Id: <20210215042741.28850-35-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSICR*_RESET_VAL macros only obfuscate code. Use their value
directly, replacing the numerical value with the macros that describe
register bits.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 174e608ededa..072047e059ef 100644
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

