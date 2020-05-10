Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87B21CCE8C
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 00:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgEJWbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 18:31:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbgEJWbM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 18:31:12 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F57173E;
        Mon, 11 May 2020 00:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589149869;
        bh=8SWOGUg7re6P5qqPLUuxUEQTEcbRo6uxH3p4dAgRbkU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WzVrjaWoq09c4N+7JNQi5OOXx4QJdwOF23ItSYgqJvqM9gp6kkVnPp+hjvzeGjYvh
         oT9jHIK2fhk/vmL2JnqyUd38bci50lOrtH40DZydrz9uu4Vt4BCnjT5nS6Hpz0ViIg
         norNdrYceX/Xe0rtn4njtSPNuabJWFDI4gZfVknU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-imx@nxp.com, kernel@pengutronix.de,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] media: imx-pxp: Fix routing configuration for i.MX7
Date:   Mon, 11 May 2020 01:30:59 +0300
Message-Id: <20200510223100.11641-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510223100.11641-1-laurent.pinchart@ideasonboard.com>
References: <20200510223100.11641-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PXP hangs without producing any frame on the i.MX7. This is caused
by a mismatch between the routing configuration and the modules
configuration. Fix the routing configuration by

- Selecting Composite Alpha Blending/Color Key 0 (main path) as the
  input to CSC2 (MUX6).
- Connecting the Rotation 0 block in the pipeline by feeding it with
  data (MUX12) and selecting its output (MUX14).
- Disabling all other muxes () by selecting the "no output" option. The
  datasheet doesn't explicitly require this, but the PXP has been
  noticed to hang after several hundreds frames when testing routing
  with the LUT disabled and the LUT input mux (MUX9) set to MUX8. It's
  thus safer to explicitly disable all unused paths.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx-pxp.c | 34 +++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
index 74e16011fc09..53e3f8c8435f 100644
--- a/drivers/media/platform/imx-pxp.c
+++ b/drivers/media/platform/imx-pxp.c
@@ -911,26 +911,32 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	/* bypass LUT */
 	pxp_write(dev, HW_PXP_LUT_CTRL, BM_PXP_LUT_CTRL_BYPASS);
 
+	/*
+	 * Configure routing, disabling all paths that are not used by
+	 * selecting the "no output" (3) option. The datasheet doesn't
+	 * explicitly require this, but the PXP has been seen to hand after
+	 * processing a few hundreds of frames otherwise.
+	 */
 	pxp_write(dev, HW_PXP_DATA_PATH_CTRL0,
-		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(0)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(1)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(1)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3)|
 		  BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0)|
-		  BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0));
+		  BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3)|
+		  BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3));
 	pxp_write(dev, HW_PXP_DATA_PATH_CTRL1,
-		  BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1) |
-		  BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1));
+		  BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3) |
+		  BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(3));
 
 	pxp_write(dev, HW_PXP_IRQ_MASK, 0xffff);
 
-- 
Regards,

Laurent Pinchart

