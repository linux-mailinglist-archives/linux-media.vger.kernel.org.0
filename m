Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0F07622E6
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 22:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjGYUCq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 16:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjGYUCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 16:02:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F4413D
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 13:02:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9308FA06;
        Tue, 25 Jul 2023 22:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690315304;
        bh=N/G4Rw52ADbI9DKz4l6i2bEU2g7eQa+T2Gx17itGjGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IlHwV6i+p/Butfc7liOuutQDU7rMKI1H0gTn7MKxdJS9JNeIFN1XbEZXujpBAMAAp
         m/j5XDASDx/H9wRV14VpzjcV9AHNJL2R7XA7rqPt9zU0VASKFCzGDcOM1ySZdWVl7i
         Hmh0fJz4fc0+2dxXrjsfRBvZJZfB5orq69rC+aHM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Fabio Estevam <festevam@denx.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Martin Kepplinger <martink@posteo.de>,
        Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v3 1/3] media: imx: imx7-media-csi: Fix applying format constraints
Date:   Tue, 25 Jul 2023 23:02:47 +0300
Message-Id: <20230725200249.15447-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
References: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

v4l_bound_align_image() aligns to a multiple of 2 to the power of
walign, not to walign. Depending on the pixel format, this causes the
image width to be aligned to 16 or 256 pixels instead of 4 or 8 as
required by the hardware. Fix it by rounding and clamping the width and
height manually.

Reported-by: Tim Harvey <tharvey@gateworks.com>
Closes: https://lore.kernel.org/linux-media/CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com
Fixes: 6f482c4729d9 ("media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt")
Co-developed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Don't export clamp_roundup() from v4l2-common.c
- Simply clamp the height as no alignment is needed
- Add required includes
---
 drivers/media/platform/nxp/imx7-media-csi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 2ec1f3cd56a0..5684ecd2e3fe 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -9,7 +9,9 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/math.h>
 #include <linux/mfd/syscon.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -1137,8 +1139,9 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	 * TODO: Implement configurable stride support.
 	 */
 	walign = 8 * 8 / cc->bpp;
-	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
-			      &pixfmt->height, 1, 0xffff, 1, 0);
+	pixfmt->width = clamp(round_up(pixfmt->width, walign), walign,
+			      round_down(65535U, walign));
+	pixfmt->height = clamp(pixfmt->height, 1U, 65535U);
 
 	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
 	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
-- 
Regards,

Laurent Pinchart

