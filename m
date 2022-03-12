Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176804D6FB7
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 16:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbiCLP0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 10:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiCLP0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 10:26:22 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E1B5C35A
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 07:25:16 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4FFE5100002;
        Sat, 12 Mar 2022 15:25:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 1/2] media: imx: imx-mipi-csis: Simplify mipi_csis_s_stream()
Date:   Sat, 12 Mar 2022 16:25:04 +0100
Message-Id: <20220312152505.145453-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
index c4d1a6fe5007..fa00b36fc394 100644
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
+		pm_runtime_put(csis->dev);
+
+		mutex_unlock(&csis->lock);
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
+	pm_runtime_put(csis->dev);
+	mutex_unlock(&csis->lock);

 	return ret;
 }
--
2.35.1

