Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B93A35D54C
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343620AbhDMCbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343596AbhDMCbl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:41 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18E0F6F2;
        Tue, 13 Apr 2021 04:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281081;
        bh=V7u028qmtpBfwi1nkUniffWeudDQq+9yqb/ztPm/Ddo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AawqQaVxlVJd2eSld9r1IyBbGTVW0RnAmXdi4CrXJPeAeANjoXj3QI5PxwTzmNcVf
         tj4Y5l+5UYeNa6JOffQM6QDT8rAffiMuyhFF7R2D4lZs2nJGPaNnOVHMWZbkXFR13h
         3DEY3g72oAiJ1OmT/zZdtkR3Xuvq9lFDsPd64hew=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 19/23] media: imx: imx7_mipi_csis: Reorganize csi_state structure
Date:   Tue, 13 Apr 2021 05:30:10 +0300
Message-Id: <20210413023014.28797-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Group the fiels of the csi_state structure logically to improve
readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 35 +++++++++-------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 0ec6870f98a8..61da4db292ef 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -292,40 +292,33 @@ static const char * const mipi_csis_clk_id[] = {
 };
 
 struct csi_state {
-	/* lock elements below */
-	struct mutex lock;
-	/* lock for event handler */
-	spinlock_t slock;
 	struct device *dev;
-	struct media_pad pads[CSIS_PADS_NUM];
-	struct v4l2_subdev sd;
-	struct v4l2_async_notifier notifier;
-	struct v4l2_subdev *src_sd;
-
-	u8 index;
 	void __iomem *regs;
-	u32 state;
-
-	struct dentry *debugfs_root;
-	bool debug;
-
 	unsigned int num_clks;
 	struct clk_bulk_data *clks;
+	struct reset_control *mrst;
+	struct regulator *mipi_phy_regulator;
+	u8 index;
 
+	struct v4l2_subdev sd;
+	struct media_pad pads[CSIS_PADS_NUM];
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev *src_sd;
+
+	struct v4l2_fwnode_bus_mipi_csi2 bus;
 	u32 clk_frequency;
 	u32 hs_settle;
 	u32 clk_settle;
 
-	struct reset_control *mrst;
-
+	struct mutex lock;	/* Protect csis_fmt, format_mbus and state */
 	const struct csis_pix_format *csis_fmt;
 	struct v4l2_mbus_framefmt format_mbus;
+	u32 state;
 
-	struct v4l2_fwnode_bus_mipi_csi2 bus;
-
+	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
-
-	struct regulator *mipi_phy_regulator;
+	struct dentry *debugfs_root;
+	bool debug;
 };
 
 /* -----------------------------------------------------------------------------
-- 
Regards,

Laurent Pinchart

