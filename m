Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5B766DA94
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 11:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236456AbjAQKGZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 05:06:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236322AbjAQKGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 05:06:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AC355B9
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 02:06:19 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A9607F8;
        Tue, 17 Jan 2023 11:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673949976;
        bh=BbVeU0ZB9FlKBNkjcH4UQ7CiKDsYh81QfmeO39Bwbbw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sEo67zANDFNeJf6oWMyLkzO+RT9s3a2gA7Ey3mwxmYEchY0qrN6MtdP+yfjd9oV7z
         EM/d2XjbqTpPF2VSjdGpUFOY1PzLAF+1yuMvQGPBQVajHOp+5wPSv11R2LhSbsG4M5
         KDPcmigBAAAQ07X2yvxMTwDRk1jfic2a/W5RkPaM=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Robert Mader <robert.mader@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: imx258: Remove mandatory 180 degrees rotation
Date:   Tue, 17 Jan 2023 11:06:03 +0100
Message-Id: <20230117100603.51631-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "rotation" fwnode device property is intended to allow specify the
sensor's physical mounting rotation, so that it can be exposed through
the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
can decide how to compensate for that.

The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
a 180 degrees image rotation being produced by the sensor. But this
doesn't imply that the physical mounting rotation should match the
driver's implementation.

Now that the driver registers V4L2_CID_CAMERA_SENSOR_ROTATION
and V4L2_CID_HFLIP/VFLIP correctly, userspace has all the required
information to handle the rotation correctly, hence it is not necessary
to require the 'rotation' property to be fixed to 180 degrees in DTS.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 2e0a4ea76589..85d73b186111 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1299,14 +1299,6 @@ static int imx258_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	/*
-	 * Check that the device is mounted upside down. The driver only
-	 * supports a single pixel order right now.
-	 */
-	ret = device_property_read_u32(&client->dev, "rotation", &val);
-	if (ret || val != 180)
-		return -EINVAL;
-
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
-- 
2.39.0

