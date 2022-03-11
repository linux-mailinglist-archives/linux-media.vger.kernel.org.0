Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1365A4D62B0
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349008AbiCKN5F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349006AbiCKN5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:57:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2AE1C4B20
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:56:01 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83CE6896;
        Fri, 11 Mar 2022 14:55:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647006959;
        bh=STdv0uR1Bsz6mZEve2w8bYHnOhwVGWvuqJbqwtmJWCg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GsjmzqX9NRr1BvtKVXWG27REpQtWM4ld57+nDqrh2uxgNQPLVZtD2gTrujvo2TJCH
         caXNkSeGBOLDCPh4lGQ58XgRRu/LJ2pg/hkqK/qBBplfnm6Y5iaj07fpPGYkaUjdU3
         ZsClFkAxf+8YtHSs30lJ21G6C/l3tf7QXfCsjxrA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 4/4] media: imx: imx-mipi-csis: Simplify runtime PM implementation
Date:   Fri, 11 Mar 2022 15:55:35 +0200
Message-Id: <20220311135535.30108-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The runtime PM resume handler is guaranteed to be called on a suspended
device, and the suspend handler on a resumed device. The implementation
can thus be simplified.

While at it, rename the mipi_csis_device state field to powered, as the
now state contains a single flag only.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 38 ++++++++++------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index d656b8bfcc33..f6ff8d50843c 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -248,10 +248,6 @@
 #define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
 #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
 
-enum {
-	ST_POWERED	= 1,
-};
-
 struct mipi_csis_event {
 	bool debug;
 	u32 mask;
@@ -331,10 +327,10 @@ struct mipi_csis_device {
 	u32 hs_settle;
 	u32 clk_settle;
 
-	struct mutex lock;	/* Protect csis_fmt, format_mbus and state */
+	struct mutex lock;	/* Protect csis_fmt, format_mbus and powered */
 	const struct csis_pix_format *csis_fmt;
 	struct v4l2_mbus_framefmt format_mbus[CSIS_PADS_NUM];
-	u32 state;
+	bool powered;
 
 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
@@ -1193,7 +1189,7 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
 
 	mutex_lock(&csis->lock);
 	mipi_csis_log_counters(csis, true);
-	if (csis->debug.enable && (csis->state & ST_POWERED))
+	if (csis->debug.enable && csis->powered)
 		mipi_csis_dump_regs(csis);
 	mutex_unlock(&csis->lock);
 
@@ -1354,13 +1350,14 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
 	int ret = 0;
 
 	mutex_lock(&csis->lock);
-	if (csis->state & ST_POWERED) {
-		ret = mipi_csis_phy_disable(csis);
-		if (ret)
-			goto unlock;
-		mipi_csis_clk_disable(csis);
-		csis->state &= ~ST_POWERED;
-	}
+
+	ret = mipi_csis_phy_disable(csis);
+	if (ret)
+		goto unlock;
+
+	mipi_csis_clk_disable(csis);
+
+	csis->powered = false;
 
 unlock:
 	mutex_unlock(&csis->lock);
@@ -1376,14 +1373,13 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
 
 	mutex_lock(&csis->lock);
 
-	if (!(csis->state & ST_POWERED)) {
-		ret = mipi_csis_phy_enable(csis);
-		if (ret)
-			goto unlock;
+	ret = mipi_csis_phy_enable(csis);
+	if (ret)
+		goto unlock;
 
-		csis->state |= ST_POWERED;
-		mipi_csis_clk_enable(csis);
-	}
+	mipi_csis_clk_enable(csis);
+
+	csis->powered = true;
 
 unlock:
 	mutex_unlock(&csis->lock);
-- 
Regards,

Laurent Pinchart

