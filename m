Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515F71CCE8E
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 00:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729241AbgEJWbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 18:31:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbgEJWbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 18:31:13 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB0C8E1E;
        Mon, 11 May 2020 00:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589149870;
        bh=x9sqqFATuF0EGiB9McPBfVlV3ECwwpepMytVPgloLOk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tl0GcR/jEdkBgPxNMcGn1ngXiGCl3T9gdwAYrwCZdQMauxnjlCS89vwXskCrf+DsZ
         KViQA7/SE1/GAiUg/u3TQXpVWs7fg20Ga3iHyAt+5PPQaNhJmTyUKs5lFe543pBVnE
         y11vs7HzknGIw3J4kfOUbqFsg38edu5OsSBPNM0w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-imx@nxp.com, kernel@pengutronix.de,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] media: imx-pxp: Disable LUT and Rotation 0 blocks
Date:   Mon, 11 May 2020 01:31:00 +0300
Message-Id: <20200510223100.11641-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510223100.11641-1-laurent.pinchart@ideasonboard.com>
References: <20200510223100.11641-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The LUT block is configured in bypass mode, and the Rotation 0 block has
a harcoded 0 degrees rotation. Disable those two blocks, and update
routing accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx-pxp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index 53e3f8c8435f..f34317e4a6ed 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -919,12 +919,12 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	 */
 	pxp_write(dev, HW_PXP_DATA_PATH_CTRL0,
 		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(0)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(1)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(3)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(1)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(3)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(1)|
@@ -944,7 +944,6 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	pxp_write(dev, HW_PXP_CTRL_SET, BM_PXP_CTRL_IRQ_ENABLE);
 	pxp_write(dev, HW_PXP_CTRL_SET,
 		  BM_PXP_CTRL_ENABLE | BM_PXP_CTRL_ENABLE_CSC2 |
-		  BM_PXP_CTRL_ENABLE_LUT | BM_PXP_CTRL_ENABLE_ROTATE0 |
 		  BM_PXP_CTRL_ENABLE_PS_AS_OUT);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

