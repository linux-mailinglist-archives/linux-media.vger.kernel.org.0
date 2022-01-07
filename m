Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCC04876E4
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 12:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238118AbiAGLyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 06:54:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35174 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238150AbiAGLyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 06:54:16 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25E1311C0;
        Fri,  7 Jan 2022 12:54:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641556455;
        bh=7rBw2HOdpszYgRN6LrFZbhrd2rx6/hAruNsikishtUI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AseO3VDTuN8vlP+Nfc3pYHPXxAIFHhIYueznMh63kSxl268mDgk5MJ/drcUA3MC+n
         flSswGteATbHurmM+TwtmU82p10Q79JLIRX57ZtyjKVPHsHx0eaJRures1Dq7X7TWO
         POMJXI0WT2CEh20Gl6ywDs1e0+P9ytntSOPJG8iA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
Subject: [PATCH v2 3/3] staging: media: imx: imx7-mipi-csis: Make subdev name unique
Date:   Fri,  7 Jan 2022 13:54:01 +0200
Message-Id: <20220107115401.31698-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107115401.31698-1-laurent.pinchart@ideasonboard.com>
References: <20220107115401.31698-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When multiple CSIS instances are present in a single graph, they are
currently all named "imx7-mipi-csis.0", which breaks the entity name
uniqueness requirement. Fix it by using the device name to create the
subdev name.

Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index d2f60403eb41..a8710dc24560 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -32,7 +32,6 @@
 #include <media/v4l2-subdev.h>
 
 #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
-#define CSIS_SUBDEV_NAME			CSIS_DRIVER_NAME
 
 #define CSIS_PAD_SINK				0
 #define CSIS_PAD_SOURCE				1
@@ -313,7 +312,6 @@ struct csi_state {
 	struct reset_control *mrst;
 	struct regulator *mipi_phy_regulator;
 	const struct mipi_csis_info *info;
-	u8 index;
 
 	struct v4l2_subdev sd;
 	struct media_pad pads[CSIS_PADS_NUM];
@@ -1329,8 +1327,8 @@ static int mipi_csis_subdev_init(struct csi_state *state)
 
 	v4l2_subdev_init(sd, &mipi_csis_subdev_ops);
 	sd->owner = THIS_MODULE;
-	snprintf(sd->name, sizeof(sd->name), "%s.%d",
-		 CSIS_SUBDEV_NAME, state->index);
+	snprintf(sd->name, sizeof(sd->name), "csis-%s",
+		 dev_name(state->dev));
 
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sd->ctrl_handler = NULL;
-- 
Regards,

Laurent Pinchart

