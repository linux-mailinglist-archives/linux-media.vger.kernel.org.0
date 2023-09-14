Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082017A0C7F
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241439AbjINSRs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241430AbjINSRr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAD61FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6FB9880B;
        Thu, 14 Sep 2023 20:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715370;
        bh=YeM/F9oburCEfBmlpIPitolNt0JRlmCVR4s+lOD5/No=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CsY24zFjmStWlhCX9RUQgfbih2LBDk/UGpjLKAU0vhS5g+JIbPmKrGj6lc8yBtEMb
         gRM+VTkSOUmFEzj0iHAYWBdQKTbhWWRlsI+nLL+gkzgWNZHE9Ib3TCQk6o2pfql1uZ
         FB2viMYyrciFsw291y4EkQ/8MwStGjF/Sglpqo6Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 36/57] media: i2c: ccs: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:43 +0300
Message-ID: <20230914181704.4811-37-laurent.pinchart@ideasonboard.com>
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

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 37 --------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 49e0d9a09530..c1b08a758830 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3152,42 +3152,6 @@ static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
  * I2C Driver
  */
 
-static int __maybe_unused ccs_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
-	bool streaming = sensor->streaming;
-	int rval;
-
-	rval = pm_runtime_resume_and_get(dev);
-	if (rval < 0)
-		return rval;
-
-	if (sensor->streaming)
-		ccs_stop_streaming(sensor);
-
-	/* save state for resume */
-	sensor->streaming = streaming;
-
-	return 0;
-}
-
-static int __maybe_unused ccs_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
-	int rval = 0;
-
-	pm_runtime_put(dev);
-
-	if (sensor->streaming)
-		rval = ccs_start_streaming(sensor);
-
-	return rval;
-}
-
 static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 {
 	struct ccs_hwconfig *hwcfg = &sensor->hwcfg;
@@ -3720,7 +3684,6 @@ static const struct of_device_id ccs_of_table[] = {
 MODULE_DEVICE_TABLE(of, ccs_of_table);
 
 static const struct dev_pm_ops ccs_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ccs_suspend, ccs_resume)
 	SET_RUNTIME_PM_OPS(ccs_power_off, ccs_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

