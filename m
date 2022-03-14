Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 486C04D800A
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 11:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238624AbiCNKlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 06:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238619AbiCNKlH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 06:41:07 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCE93EA92
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 03:39:57 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9480E200009;
        Mon, 14 Mar 2022 10:39:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 4/5] media: imx: imx-mipi-csis: Remove duplicated check
Date:   Mon, 14 Mar 2022 11:39:40 +0100
Message-Id: <20220314103941.46021-5-jacopo@jmondi.org>
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

The mipi_csis_log_counters() function already checks for
csis->debug.enable, it is not necessary to do the same in the caller.

Compatc the code in the caller as well by removing an empty line.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 4a6152c13d52..4bb469fcb6b3 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -913,11 +913,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 	if (!enable) {
 		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
-
 		mipi_csis_stop_stream(csis);
-		if (csis->debug.enable)
-			mipi_csis_log_counters(csis, true);
-
+		mipi_csis_log_counters(csis, true);
 		pm_runtime_put(csis->dev);
 
 		return 0;
-- 
2.35.1

