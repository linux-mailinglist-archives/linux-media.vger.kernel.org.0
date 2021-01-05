Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1EC2EAEC1
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbhAEPhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:37:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbhAEPhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:37:12 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F5601BCB;
        Tue,  5 Jan 2021 16:30:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860610;
        bh=vwW2P/CEcUhkOGxlw0uEA4IcxBV3VuJKC3gLyKEP6lU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LtKLaUy5OxLfRuuG2lhtlhOAW4aENdbFMPKTGUWWf72E4ea8OQEEudUepDz2GLjvV
         Fqy8BU6D3qQ+R3azS3lVG4n+gX3rCTbUykzHpzkZJqfkZTz1xRw7H8FVesHk+VTxif
         IZNT7rf1baZwBeECzv/jB1TGm0WUlbd6+zwbbZ84=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 48/75] media: imx: imx7-media-csi: Set RFF burst type in imx7_csi_configure()
Date:   Tue,  5 Jan 2021 17:28:25 +0200
Message-Id: <20210105152852.5733-49-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RFF burst type is set in imx7_csi_dmareq_rff_enable(), which doesn't
match the function name. Move it to imx7_csi_configure().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 17fce3b42d87..7871ad55060a 100644
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

