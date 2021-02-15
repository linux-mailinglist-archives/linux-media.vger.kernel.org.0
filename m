Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2216531B4BD
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhBOEhX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:37:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhBOEhT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:37:19 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B51A01AD1;
        Mon, 15 Feb 2021 05:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363330;
        bh=7J5xxLTWdCwyWKVn0014YPr30yniGok2WknAAkTJIAk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M/KSJ7QRAX4ZG0skklSYpSIP5uofL7d267a+yqQ6K4WIVwQNzXcW04yXoDgPy571p
         tYH4l+jnQu17g/5YCeMlLmFFWBZALyv1kO8PGsMh6AnUXhNLzWeGYQkLH6Yf6DUcp6
         czLUXlWAh2KWG0Vco7iuJLdpGTTza5LByrWW0JnI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 50/77] media: imx: imx7-media-csi: Simplify imx7_csi_rx_fifo_clear()
Date:   Mon, 15 Feb 2021 06:27:14 +0200
Message-Id: <20210215042741.28850-51-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to read the CSICR1 register before each write in
imx7_csi_rx_fifo_clear(). Simplify the function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 3d1dd8ef9d87..fb09af335edf 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -294,14 +294,10 @@ static void imx7_csi_dma_reflash(struct imx7_csi *csi)
 
 static void imx7_csi_rx_fifo_clear(struct imx7_csi *csi)
 {
-	u32 cr1;
+	u32 cr1 = imx7_csi_reg_read(csi, CSI_CSICR1) & ~BIT_FCC;
 
-	cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
-	imx7_csi_reg_write(csi, cr1 & ~BIT_FCC, CSI_CSICR1);
-	cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
+	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
 	imx7_csi_reg_write(csi, cr1 | BIT_CLR_RXFIFO, CSI_CSICR1);
-
-	cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
 	imx7_csi_reg_write(csi, cr1 | BIT_FCC, CSI_CSICR1);
 }
 
-- 
Regards,

Laurent Pinchart

