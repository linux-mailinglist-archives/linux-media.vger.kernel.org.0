Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E01831B4BC
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhBOEhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:37:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhBOEhE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:37:04 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EB391AD0;
        Mon, 15 Feb 2021 05:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363329;
        bh=W7yjZM7LLBLUDhK8Io9XhqHl7eEaMElWpxLC+E4775U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CBbqI/el+Lc4ezMwmLo8tS3noZSUrutlSr+wP99P73IWA4BxdkQMeO1Yi5tHoAcB+
         A1hF2JflfXfpus6Hk1A6Mk1Tu5cHwAiMUSrjrBTc923XNKhvMREnpq85tfb0U7KlGg
         O1Bo+XbmA9yg8P0Ae9IFxVffv8Qw0EdBbYLa9FzA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 49/77] media: imx: imx7-media-csi: Set RFF burst type in imx7_csi_configure()
Date:   Mon, 15 Feb 2021 06:27:13 +0200
Message-Id: <20210215042741.28850-50-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RFF burst type is set in imx7_csi_dmareq_rff_enable(), which doesn't
match the function name. Move it to imx7_csi_configure().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index ea14195e6c7f..3d1dd8ef9d87 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -308,10 +308,6 @@ static void imx7_csi_rx_fifo_clear(struct imx7_csi *csi)
 static void imx7_csi_dmareq_rff_enable(struct imx7_csi *csi)
 {
 	u32 cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
-	u32 cr2 = imx7_csi_reg_read(csi, CSI_CSICR2);
-
-	/* Burst Type of DMA Transfer from RxFIFO. INCR16 */
-	cr2 |= BIT_DMA_BURST_TYPE_RFF_INCR16;
 
 	cr3 |= BIT_DMA_REQ_EN_RFF;
 	cr3 |= BIT_HRESP_ERR_EN;
@@ -319,7 +315,6 @@ static void imx7_csi_dmareq_rff_enable(struct imx7_csi *csi)
 	cr3 |= BIT_RXFF_LEVEL(2);
 
 	imx7_csi_reg_write(csi, cr3, CSI_CSICR3);
-	imx7_csi_reg_write(csi, cr2, CSI_CSICR2);
 }
 
 static void imx7_csi_dmareq_rff_disable(struct imx7_csi *csi)
@@ -532,7 +527,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 	}
 
 	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
-	imx7_csi_reg_write(csi, 0, CSI_CSICR2);
+	imx7_csi_reg_write(csi, BIT_DMA_BURST_TYPE_RFF_INCR16, CSI_CSICR2);
 	imx7_csi_reg_write(csi, BIT_FRMCNT_RST, CSI_CSICR3);
 	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
 
-- 
Regards,

Laurent Pinchart

