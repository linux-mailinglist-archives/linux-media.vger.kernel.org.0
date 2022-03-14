Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23064D8007
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 11:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238621AbiCNKlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 06:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238617AbiCNKlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 06:41:05 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DD34348F
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 03:39:55 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 16D01200012;
        Mon, 14 Mar 2022 10:39:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 3/5] media: imx: imx-mipi-csis: Remove lock from s_stream
Date:   Mon, 14 Mar 2022 11:39:39 +0100
Message-Id: <20220314103941.46021-4-jacopo@jmondi.org>
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

The s_stream() operation implementation was locked to avoid races with
the mipi_csis_log_status() which access the platform registers and needs
the interface to be powered up.

As powering is now handled by runtime_pm which is refcounted, it is
not necessary to manually lock s_stream() anymore.

As the error path is now simplified, we can inline it.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 23 ++++++----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index b76bb129a416..4a6152c13d52 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -912,16 +912,12 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (!enable) {
-		mutex_lock(&csis->lock);
-
 		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
 
 		mipi_csis_stop_stream(csis);
 		if (csis->debug.enable)
 			mipi_csis_log_counters(csis, true);
 
-		mutex_unlock(&csis->lock);
-
 		pm_runtime_put(csis->dev);
 
 		return 0;
@@ -937,25 +933,18 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret < 0)
 		return ret;
 
-	mutex_lock(&csis->lock);
-
 	mipi_csis_start_stream(csis);
 	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
-	if (ret < 0)
-		goto out;
+	if (ret < 0) {
+		mipi_csis_stop_stream(csis);
+		pm_runtime_put(csis->dev);
 
-	mipi_csis_log_counters(csis, true);
+		return ret;
+	}
 
-	mutex_unlock(&csis->lock);
+	mipi_csis_log_counters(csis, true);
 
 	return 0;
-
-out:
-	mipi_csis_stop_stream(csis);
-	mutex_unlock(&csis->lock);
-	pm_runtime_put(csis->dev);
-
-	return ret;
 }
 
 static struct v4l2_mbus_framefmt *
-- 
2.35.1

