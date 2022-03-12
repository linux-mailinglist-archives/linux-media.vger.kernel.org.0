Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5C24D6FB8
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 16:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbiCLP01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 10:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiCLP0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 10:26:25 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0FF5C368
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 07:25:19 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 16C2E100008;
        Sat, 12 Mar 2022 15:25:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 2/2] media: imx: imx-mipi-csis: Drop powered flag
Date:   Sat, 12 Mar 2022 16:25:05 +0100
Message-Id: <20220312152505.145453-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mipi_csis_device.powered flag only serves for the purpose of
not accessing registers in mipi_csis_log_status() when the interface
is not powered up.

Instead of manually tracking the power state, rely on
pm_runtime_get_if_in_use() and remove the flag.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index fa00b36fc394..505dd373b40c 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -327,10 +327,9 @@ struct mipi_csis_device {
 	u32 hs_settle;
 	u32 clk_settle;

-	struct mutex lock;	/* Protect csis_fmt, format_mbus and powered */
+	struct mutex lock;	/* Protect csis_fmt and format_mbus */
 	const struct csis_pix_format *csis_fmt;
 	struct v4l2_mbus_framefmt format_mbus[CSIS_PADS_NUM];
-	bool powered;

 	spinlock_t slock;	/* Protect events */
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
@@ -1176,8 +1175,15 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)

 	mutex_lock(&csis->lock);
 	mipi_csis_log_counters(csis, true);
-	if (csis->debug.enable && csis->powered)
-		mipi_csis_dump_regs(csis);
+	if (!csis->debug.enable ||
+	    !pm_runtime_get_if_in_use(csis->dev))
+		goto unlock;
+
+	mipi_csis_dump_regs(csis);
+
+	pm_runtime_put(csis->dev);
+
+unlock:
 	mutex_unlock(&csis->lock);

 	return 0;
@@ -1344,8 +1350,6 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)

 	mipi_csis_clk_disable(csis);

-	csis->powered = false;
-
 unlock:
 	mutex_unlock(&csis->lock);

@@ -1366,8 +1370,6 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)

 	mipi_csis_clk_enable(csis);

-	csis->powered = true;
-
 unlock:
 	mutex_unlock(&csis->lock);

--
2.35.1

