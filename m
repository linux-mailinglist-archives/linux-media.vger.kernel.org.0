Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E2B183D8C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgCLXrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgCLXri (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:38 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 858AE197C;
        Fri, 13 Mar 2020 00:47:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056855;
        bh=RXHpy0WEOCSIP0949Y8eduhbehX9Caxpj2GYlcNqpi8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G62OH9nwOvdydNMjEy+bFeIwUds/kDgRVsdu1EOmFMCXgbxdZfjSr/L0aJECluBpC
         gnx1fdRJ8kR6NyKt7fjKVQvOpLpBrjroV6ddXV4NObCKGdLhH+xpQ12mOX1ORwRP0l
         5IJGUuspWUj16NLCvuOA1RUOcV0WatbjOte2xJ0E=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 08/14] media: imx: imx7-mipi-csis: Align image width based on format
Date:   Fri, 13 Mar 2020 01:47:16 +0200
Message-Id: <20200312234722.23483-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The total number of bits per line needs to be a multiple of 8, which
requires aligning the image width based on the format width. The
csis_pix_format structure contains a pix_width_alignment field that
serves this purpose, but the field is never set. Instead of fixing that,
calculate the alignment constraints based on the bus width for the
format, and drop the unneeded pix_width_alignment field.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 29 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index c664895fb780..ef5fabfcdada 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -258,7 +258,6 @@ struct csi_state {
 };
 
 struct csis_pix_format {
-	unsigned int pix_width_alignment;
 	u32 code;
 	u32 fmt_reg;
 	u8 width;
@@ -774,6 +773,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
 	struct csis_pix_format const *csis_fmt;
 	struct v4l2_mbus_framefmt *fmt;
+	unsigned int align;
 
 	/*
 	 * The CSIS can't transcode in any way, the source format can't be
@@ -798,8 +798,31 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 	fmt->width = sdformat->format.width;
 	fmt->height = sdformat->format.height;
 
-	v4l_bound_align_image(&fmt->width, 1, CSIS_MAX_PIX_WIDTH,
-			      csis_fmt->pix_width_alignment,
+	/*
+	 * The total number of bits per line must be a multiple of 8. We thus
+	 * need to align the width for formats that are not multiples of 8
+	 * bits.
+	 */
+	switch (csis_fmt->width % 8) {
+	case 0:
+		align = 1;
+		break;
+	case 4:
+		align = 2;
+		break;
+	case 2:
+	case 6:
+		align = 4;
+		break;
+	case 1:
+	case 3:
+	case 5:
+	case 7:
+		align = 8;
+		break;
+	}
+
+	v4l_bound_align_image(&fmt->width, 1, CSIS_MAX_PIX_WIDTH, align,
 			      &fmt->height, 1, CSIS_MAX_PIX_HEIGHT, 1, 0);
 
 	sdformat->format = *fmt;
-- 
Regards,

Laurent Pinchart

