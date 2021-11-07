Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A86F44745E
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235922AbhKGRSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51437 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234970AbhKGRSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GZ3baJ666XDmjUnz4Kzy7jLpsf5tFuWiQGpNFfbpdhI=;
        b=aCbRHTzE3pl3KgH29i9bWTuiGDyptCG9JgGYnquJxub2cFwyt2DKLHD9bidsZB3P6kf6j7
        9t2x+HD9KgUciFOTccng4pziYa549sz7RiksYLkVQTgi4ZWh9zGOO1qOxJ6dtfWxLf9uXh
        +wezhjIGb3HG57slP/vw8Qw1CL4oQ0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-RcHZYAYmMyOIRzHWlBrSqw-1; Sun, 07 Nov 2021 12:15:58 -0500
X-MC-Unique: RcHZYAYmMyOIRzHWlBrSqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06DAC1006AA0;
        Sun,  7 Nov 2021 17:15:57 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 01E8B57CD3;
        Sun,  7 Nov 2021 17:15:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 02/11] media: atomisp-ov2680: Turn on power only once
Date:   Sun,  7 Nov 2021 18:15:40 +0100
Message-Id: <20211107171549.267583-3-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a power_on bool to track if the power is on, and make
power_up() a no-op if the power is already on.

This also removes a power_down() call from ov2680_s_config() since
that is a no-op now, this is ok because s_config() is only called
once on probe and the sensor is off at boot.

Besides avoiding to the work in power_up() multiple times this patch
is also a preparation for switching to the clk and regulator frameworks
which keep an enable count, so there we must call enable() and
disable() only once per power-cycle.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 27 +++++++++----------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  1 +
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 56f95e44316d..7b7cf7a68823 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -736,6 +736,9 @@ static int power_up(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
+	if (dev->power_on)
+		return 0; /* Already on */
+
 	/* power control */
 	ret = power_ctrl(sd, 1);
 	if (ret)
@@ -760,6 +763,7 @@ static int power_up(struct v4l2_subdev *sd)
 	/* according to DS, 20ms is needed between PWDN and i2c access */
 	msleep(20);
 
+	dev->power_on = true;
 	return 0;
 
 fail_clk:
@@ -785,6 +789,9 @@ static int power_down(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
+	if (!dev->power_on)
+		return 0; /* Already off */
+
 	ret = dev->platform_data->flisclk_ctrl(sd, 0);
 	if (ret)
 		dev_err(&client->dev, "flisclk failed\n");
@@ -799,10 +806,13 @@ static int power_down(struct v4l2_subdev *sd)
 
 	/* power control */
 	ret = power_ctrl(sd, 0);
-	if (ret)
+	if (ret) {
 		dev_err(&client->dev, "vprog failed.\n");
+		return ret;
+	}
 
-	return ret;
+	dev->power_on = false;
+	return 0;
 }
 
 static int ov2680_s_power(struct v4l2_subdev *sd, int on)
@@ -866,7 +876,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	dev_dbg(&client->dev, "%s: %dx%d\n",
 		__func__, fmt->width, fmt->height);
 
-	// IS IT NEEDED?
+	/* s_power has not been called yet for std v4l2 clients (camorama) */
 	power_up(sd);
 	ret = ov2680_write_reg_array(client, dev->res->regs);
 	if (ret)
@@ -998,16 +1008,6 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
 	    (struct camera_sensor_platform_data *)platform_data;
 
 	mutex_lock(&dev->input_lock);
-	/*
-	 * power off the module, then power on it in future
-	 * as first power on by board may not fulfill the
-	 * power on sequqence needed by the module
-	 */
-	ret = power_down(sd);
-	if (ret) {
-		dev_err(&client->dev, "ov2680 power-off err.\n");
-		goto fail_power_off;
-	}
 
 	ret = power_up(sd);
 	if (ret) {
@@ -1041,7 +1041,6 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
 fail_power_on:
 	power_down(sd);
 	dev_err(&client->dev, "sensor power-gating failed\n");
-fail_power_off:
 	mutex_unlock(&dev->input_lock);
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 9f9f6695eed9..edd87bb8563f 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -173,6 +173,7 @@ struct ov2680_device {
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct ov2680_resolution *res;
 	struct camera_sensor_platform_data *platform_data;
+	bool power_on;
 };
 
 /**
-- 
2.31.1

