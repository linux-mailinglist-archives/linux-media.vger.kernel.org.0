Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A314E7A0C7E
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241438AbjINSRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241400AbjINSRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640FC1FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 821A887E7;
        Thu, 14 Sep 2023 20:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715368;
        bh=nchELTEfC1XbkgObsFmU/st1ELaUMqR9CFCNaJKjoBM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bk6XdqS4mrW4iBMeg+deAd1qW9P9H06rrnjj2qtGIQMpUSg7Zq2nKugcEuyKn0nIi
         gYXtoo90dUp2squjM8dBWk+PqWvIhl9EbQoXGniXqek2kHa+Te6YtjhayIIiU9A2Dy
         Ie3sEasgvRRJJCKt1gyQ8c2G1RIu6CWX26IeGyeU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>
Subject: [PATCH 35/57] media: i2c: ar0521: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:42 +0300
Message-ID: <20230914181704.4811-36-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stopping streaming on a camera pipeline at system suspend time, and
restarting it at system resume time, requires coordinated action between
the bridge driver and the camera sensor driver. This is handled by the
bridge driver calling the sensor's .s_stream() handler at system suspend
and resume time. There is thus no need for the sensor to independently
implement system sleep PM operations. Drop them.

The streaming field of the driver's private structure is now unused,
drop it as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0521.c | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index a4e39871e8f7..701f36345f1e 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -133,8 +133,6 @@ struct ar0521_dev {
 		u16 mult2;
 		u16 vt_pix;
 	} pll;
-
-	bool streaming;
 };
 
 static inline struct ar0521_dev *to_ar0521_dev(struct v4l2_subdev *sd)
@@ -991,12 +989,9 @@ static int ar0521_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	mutex_lock(&sensor->lock);
-
 	ret = ar0521_set_stream(sensor, enable);
-	if (!ret)
-		sensor->streaming = enable;
-
 	mutex_unlock(&sensor->lock);
+
 	return ret;
 }
 
@@ -1023,28 +1018,6 @@ static const struct v4l2_subdev_ops ar0521_subdev_ops = {
 	.pad = &ar0521_pad_ops,
 };
 
-static int __maybe_unused ar0521_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ar0521_dev *sensor = to_ar0521_dev(sd);
-
-	if (sensor->streaming)
-		ar0521_set_stream(sensor, 0);
-
-	return 0;
-}
-
-static int __maybe_unused ar0521_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ar0521_dev *sensor = to_ar0521_dev(sd);
-
-	if (sensor->streaming)
-		return ar0521_set_stream(sensor, 1);
-
-	return 0;
-}
-
 static int ar0521_probe(struct i2c_client *client)
 {
 	struct v4l2_fwnode_endpoint ep = {
@@ -1183,7 +1156,6 @@ static void ar0521_remove(struct i2c_client *client)
 }
 
 static const struct dev_pm_ops ar0521_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ar0521_suspend, ar0521_resume)
 	SET_RUNTIME_PM_OPS(ar0521_power_off, ar0521_power_on, NULL)
 };
 static const struct of_device_id ar0521_dt_ids[] = {
-- 
Regards,

Laurent Pinchart

