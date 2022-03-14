Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7728E4D8006
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 11:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238616AbiCNKlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 06:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbiCNKlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 06:41:03 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C468B43AEF
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 03:39:52 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2DDD320000D;
        Mon, 14 Mar 2022 10:39:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 1/5] media: imx: imx-mipi-csis: Simplify mipi_csis_s_stream()
Date:   Mon, 14 Mar 2022 11:39:37 +0100
Message-Id: <20220314103941.46021-2-jacopo@jmondi.org>
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

Simplify the mipi_csis_s_stream() function.

This actually fixes a bug, as if calling the subdev's s_stream(1) fails,
mipi_csis_stop_stream() was not called.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 58 ++++++++++++----------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index c4d1a6fe5007..60e7f0452582 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -910,43 +910,51 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
 static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
-	int ret = 0;
+	int ret;
 
-	if (enable) {
-		ret = mipi_csis_calculate_params(csis);
-		if (ret < 0)
-			return ret;
+	if (!enable) {
+		mutex_lock(&csis->lock);
 
-		mipi_csis_clear_counters(csis);
+		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
 
-		ret = pm_runtime_resume_and_get(csis->dev);
-		if (ret < 0)
-			return ret;
+		mipi_csis_stop_stream(csis);
+		if (csis->debug.enable)
+			mipi_csis_log_counters(csis, true);
+
+		mutex_unlock(&csis->lock);
+
+		pm_runtime_put(csis->dev);
+
+		return 0;
 	}
 
-	mutex_lock(&csis->lock);
+	ret = mipi_csis_calculate_params(csis);
+	if (ret < 0)
+		return ret;
 
-	if (enable) {
-		mipi_csis_start_stream(csis);
-		ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
-		if (ret < 0)
-			goto unlock;
+	mipi_csis_clear_counters(csis);
 
-		mipi_csis_log_counters(csis, true);
-	} else {
-		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
+	ret = pm_runtime_resume_and_get(csis->dev);
+	if (ret < 0)
+		return ret;
 
-		mipi_csis_stop_stream(csis);
+	mutex_lock(&csis->lock);
 
-		if (csis->debug.enable)
-			mipi_csis_log_counters(csis, true);
-	}
+	mipi_csis_start_stream(csis);
+	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
+	if (ret < 0)
+		goto out;
+
+	mipi_csis_log_counters(csis, true);
 
-unlock:
 	mutex_unlock(&csis->lock);
 
-	if (!enable || ret < 0)
-		pm_runtime_put(csis->dev);
+	return 0;
+
+out:
+	mipi_csis_stop_stream(csis);
+	mutex_unlock(&csis->lock);
+	pm_runtime_put(csis->dev);
 
 	return ret;
 }
-- 
2.35.1

