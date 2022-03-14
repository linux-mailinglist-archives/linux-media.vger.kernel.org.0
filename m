Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C22E44D8009
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 11:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238619AbiCNKlJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 06:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238617AbiCNKlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 06:41:08 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B321F43AD1
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 03:39:58 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 3CF20200010;
        Mon, 14 Mar 2022 10:39:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 5/5] media: imx: imx-mipi-csis: Protect mipi_csis_dump_regs()
Date:   Mon, 14 Mar 2022 11:39:41 +0100
Message-Id: <20220314103941.46021-6-jacopo@jmondi.org>
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

The mipi_csis_dump_regs() function accesses the interface registers
in order to printout their values for debug purposes.

As the function access the registers, it requires the interface to be
powered up. Currently this is only enforced in one of the function's
callers (mipi_csis_log_status)() but not when the function is called by
the debugfs attribute handler.

Make sure to access registers only if the interface is powered up and
remove the same check from the caller.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 4bb469fcb6b3..3437455b9c82 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -857,6 +857,9 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 	unsigned int i;
 	u32 cfg;
 
+	if (!pm_runtime_get_if_in_use(csis->dev))
+		return 0;
+
 	dev_info(csis->dev, "--- REGISTERS ---\n");
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
@@ -864,6 +867,8 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
 	}
 
+	pm_runtime_put(csis->dev);
+
 	return 0;
 }
 
@@ -1160,10 +1165,8 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 
 	mipi_csis_log_counters(csis, true);
-	if (csis->debug.enable && pm_runtime_get_if_in_use(csis->dev)) {
+	if (csis->debug.enable)
 		mipi_csis_dump_regs(csis);
-		pm_runtime_put(csis->dev);
-	}
 
 	return 0;
 }
-- 
2.35.1

