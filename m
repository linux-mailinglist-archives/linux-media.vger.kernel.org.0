Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EBE381BF9
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhEPCPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbhEPCMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:12:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A51C061348
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 19:10:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15CE92570;
        Sun, 16 May 2021 03:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129515;
        bh=/tcOV4ib2Wyda2gQQ5gd15qymmCeTTfT4JITCH3Rqqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bX2typJCRQ+Xfvc1XQ/hDZ9/esw4YtlkIAGqtIZny7IiQPCbG8nTlgtBm/ds8IJ0j
         OT8sqOzQ4+UHR0nmVQeXpFDKI63KQfrkKUCXxejOHftrxe4WrXdPWsCyff9D2b0Iol
         h3RG/lUKyAHuDBDhxBnWSlTxkrZFaGuLPwS5sNaQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 19/25] media: imx: imx7_mipi_csis: Reorganize csi_state structure
Date:   Sun, 16 May 2021 04:44:35 +0300
Message-Id: <20210516014441.5508-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Group the fiels of the csi_state structure logically to improve
readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
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

