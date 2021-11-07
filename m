Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48500447463
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235940AbhKGRS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:18:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20706 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235923AbhKGRSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YqyauolxCwJzENXehwNcrAs/KmXm1xUKj3TqZRG8H1M=;
        b=CNeGdHz6wwePOv/7tXOEAH+JmWm1ITV4o2f0cqFMdvfoEIEknPO6HaMv+LLoMnPNUm7m+x
        O0/Bn0pBf28f5fXbTEcDPbEjnJ/MqhmQ1cpaEpJFVyf16F4qM7fwMeXBWI+UPWnjoIUv7a
        mAlChm/yfcE4GXRQlMfgqf4mVWoo+iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-pG036CGqOruzRHVuqAfdVw-1; Sun, 07 Nov 2021 12:16:08 -0500
X-MC-Unique: pG036CGqOruzRHVuqAfdVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6742D104ED1A;
        Sun,  7 Nov 2021 17:16:06 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6288E57CD3;
        Sun,  7 Nov 2021 17:16:04 +0000 (UTC)
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
Subject: [PATCH 06/11] media: atomisp-ov2680: Save/restore exposure and gain over sensor power-down
Date:   Sun,  7 Nov 2021 18:15:44 +0100
Message-Id: <20211107171549.267583-7-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Save/restore exposure and gain over sensor power-down and don't write them
to the sensor when ov2680_set_exposure() is called while the sensor is off.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/i2c/atomisp-ov2680.c    | 15 ++++++++++++++-
 drivers/staging/media/atomisp/i2c/ov2680.h        |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 83608ba4e70a..5b192218ba91 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -359,7 +359,14 @@ static int ov2680_set_exposure(struct v4l2_subdev *sd, int exposure,
 	int ret;
 
 	mutex_lock(&dev->input_lock);
-	ret = __ov2680_set_exposure(sd, exposure, gain, digitgain);
+
+	dev->exposure = exposure;
+	dev->gain = gain;
+	dev->digitgain = digitgain;
+
+	if (dev->power_on)
+		ret = __ov2680_set_exposure(sd, exposure, gain, digitgain);
+
 	mutex_unlock(&dev->input_lock);
 
 	return ret;
@@ -748,6 +755,10 @@ static int power_up(struct v4l2_subdev *sd)
 	if (ret)
 		goto fail_init_registers;
 
+	ret = __ov2680_set_exposure(sd, dev->exposure, dev->gain, dev->digitgain);
+	if (ret)
+		goto fail_init_registers;
+
 	dev->power_on = true;
 	return 0;
 
@@ -1140,6 +1151,8 @@ static int ov2680_probe(struct i2c_client *client)
 	mutex_init(&dev->input_lock);
 
 	dev->res = &ov2680_res_preview[0];
+	dev->exposure = dev->res->lines_per_frame - OV2680_INTEGRATION_TIME_MARGIN;
+	dev->gain = 250; /* 0-2047 */
 	v4l2_i2c_subdev_init(&dev->sd, client, &ov2680_ops);
 
 	pdata = gmin_camera_platform_data(&dev->sd,
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index c1998c9132a2..ca20ce5aa285 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -174,6 +174,9 @@ struct ov2680_device {
 	struct ov2680_resolution *res;
 	struct camera_sensor_platform_data *platform_data;
 	bool power_on;
+	u16 exposure;
+	u16 gain;
+	u16 digitgain;
 };
 
 /**
-- 
2.31.1

