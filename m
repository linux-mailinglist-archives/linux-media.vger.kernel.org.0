Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481544D8008
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 11:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238614AbiCNKlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 06:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238619AbiCNKlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 06:41:04 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71AEA3EA8E
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 03:39:54 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 73634200010;
        Mon, 14 Mar 2022 10:39:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 2/5] media: imx: imx-mipi-csis: Drop powered flag
Date:   Mon, 14 Mar 2022 11:39:38 +0100
Message-Id: <20220314103941.46021-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314103941.46021-1-jacopo@jmondi.org>
References: <20220314103941.46021-1-jacopo@jmondi.org>
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
pm_runtime_get_if_in_use() to remove the 'powered' flag. Also remove
the locking in the function as runtime_pm() is refcounted and there's no
risk of the interface being powered down behind our backs.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 60e7f0452582..b76bb129a416 100644
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
@@ -1174,11 +1173,11 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 
-	mutex_lock(&csis->lock);
 	mipi_csis_log_counters(csis, true);
-	if (csis->debug.enable && csis->powered)
+	if (csis->debug.enable && pm_runtime_get_if_in_use(csis->dev)) {
 		mipi_csis_dump_regs(csis);
-	mutex_unlock(&csis->lock);
+		pm_runtime_put(csis->dev);
+	}
 
 	return 0;
 }
@@ -1344,8 +1343,6 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
 
 	mipi_csis_clk_disable(csis);
 
-	csis->powered = false;
-
 unlock:
 	mutex_unlock(&csis->lock);
 
@@ -1366,8 +1363,6 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
 
 	mipi_csis_clk_enable(csis);
 
-	csis->powered = true;
-
 unlock:
 	mutex_unlock(&csis->lock);
 
-- 
2.35.1

