Return-Path: <linux-media+bounces-1200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D57FB686
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02B8BB219FF
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD864D13F;
	Tue, 28 Nov 2023 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QDM0xcDF"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408B5131
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701165661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NekLPQ977iwOmwpfruJQUntR85mWrciCzAp+1VecUQU=;
	b=QDM0xcDFkmELdKRXM009BRXAkjJn+Q7FcEfaNRYjgDjiiogQznP7ZhBJYgNsedZiCT+z/i
	0N1Xu7I+o55AGg7N7LiIXYCBM2UcJyx9YkM25aZOZZIWt0Ll8TMv+VKZXYzJL2jGC5dMol
	jxm0xODbB/QhM9Q/MdLugN+e32IGy5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-GZ-mgRQ4NH6CR2heIren2Q-1; Tue, 28 Nov 2023 05:00:56 -0500
X-MC-Unique: GZ-mgRQ4NH6CR2heIren2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1782101AA68;
	Tue, 28 Nov 2023 10:00:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1FA620268D7;
	Tue, 28 Nov 2023 10:00:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/9] media: ov2740: Add support for reset GPIO
Date: Tue, 28 Nov 2023 11:00:39 +0100
Message-ID: <20231128100047.17529-2-hdegoede@redhat.com>
In-Reply-To: <20231128100047.17529-1-hdegoede@redhat.com>
References: <20231128100047.17529-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On some ACPI platforms, such as Chromebooks the ACPI methods to
change the power-state (_PS0 and _PS3) fully take care of powering
on/off the sensor.

On other ACPI platforms, such as e.g. various ThinkPad models with
IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
and the sensor's clock itself.

Add support for having the driver control an optional reset GPIO.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 48 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 24e468485fbf..e5f9569a229d 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -4,6 +4,7 @@
 #include <asm/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -333,6 +334,9 @@ struct ov2740 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
+	/* GPIOs, clocks */
+	struct gpio_desc *reset_gpio;
+
 	/* Current mode */
 	const struct ov2740_mode *cur_mode;
 
@@ -1058,6 +1062,26 @@ static int ov2740_register_nvmem(struct i2c_client *client,
 	return 0;
 }
 
+static int ov2740_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2740 *ov2740 = to_ov2740(sd);
+
+	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
+	return 0;
+}
+
+static int ov2740_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2740 *ov2740 = to_ov2740(sd);
+
+	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
+	msleep(20);
+
+	return 0;
+}
+
 static int ov2740_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -1073,12 +1097,24 @@ static int ov2740_probe(struct i2c_client *client)
 	if (!ov2740)
 		return -ENOMEM;
 
+	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2740->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
+				     "failed to get reset GPIO\n");
+
 	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
-		ret = ov2740_identify_module(ov2740);
+		/* ACPI does not always clear the reset GPIO / enable the clock */
+		ret = ov2740_resume(dev);
 		if (ret)
-			return dev_err_probe(dev, ret, "failed to find sensor\n");
+			return dev_err_probe(dev, ret, "failed to power on sensor\n");
+
+		ret = ov2740_identify_module(ov2740);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to find sensor\n");
+			goto probe_error_power_off;
+		}
 	}
 
 	ov2740->cur_mode = &supported_modes[0];
@@ -1132,9 +1168,16 @@ static int ov2740_probe(struct i2c_client *client)
 probe_error_v4l2_ctrl_handler_free:
 	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);
 
+probe_error_power_off:
+	if (full_power)
+		ov2740_suspend(dev);
+
 	return ret;
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
+				 NULL);
+
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{"INT3474"},
 	{}
@@ -1146,6 +1189,7 @@ static struct i2c_driver ov2740_i2c_driver = {
 	.driver = {
 		.name = "ov2740",
 		.acpi_match_table = ov2740_acpi_ids,
+		.pm = pm_sleep_ptr(&ov2740_pm_ops),
 	},
 	.probe = ov2740_probe,
 	.remove = ov2740_remove,
-- 
2.41.0


