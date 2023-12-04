Return-Path: <linux-media+bounces-1544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616980332C
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28D36B20A6E
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD3124202;
	Mon,  4 Dec 2023 12:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNcZZPKW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1911C19F
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8kEzt7jW44JAav6yKsJ6stD+wvS0E4gLArDhwnD7ZY=;
	b=FNcZZPKWg2XGJ2tek0u8IscB5+ibrVB+V2b6Yj0dLwjQBD1wRgqIAccvwyXGkkw8juXxAj
	OC7yjZb3HncmgxdeuaeuNXkucGVSoNwWl/uk0P7M11vIQbpeuCB2c849ibD66Q9zinhe18
	LBb6Wn5ZNZkT6/nadV0RcDI5uOMtK2g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-6jG0AwGkPo-6AUi9TgThRg-1; Mon, 04 Dec 2023 07:39:51 -0500
X-MC-Unique: 6jG0AwGkPo-6AUi9TgThRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB32585A58B;
	Mon,  4 Dec 2023 12:39:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1D6F40C6EB9;
	Mon,  4 Dec 2023 12:39:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 1/9] media: ov2740: Add support for reset GPIO
Date: Mon,  4 Dec 2023 13:39:38 +0100
Message-ID: <20231204123947.5754-2-hdegoede@redhat.com>
In-Reply-To: <20231204123947.5754-1-hdegoede@redhat.com>
References: <20231204123947.5754-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

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
index f0be51b343a7..fef1b6f3f316 100644
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
 
@@ -1061,6 +1065,26 @@ static int ov2740_register_nvmem(struct i2c_client *client,
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
@@ -1076,13 +1100,25 @@ static int ov2740_probe(struct i2c_client *client)
 	if (!ov2740)
 		return -ENOMEM;
 
+	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2740->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
+				     "failed to get reset GPIO\n");
+
 	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	ov2740->sd.internal_ops = &ov2740_internal_ops;
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
@@ -1136,9 +1172,16 @@ static int ov2740_probe(struct i2c_client *client)
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
@@ -1150,6 +1193,7 @@ static struct i2c_driver ov2740_i2c_driver = {
 	.driver = {
 		.name = "ov2740",
 		.acpi_match_table = ov2740_acpi_ids,
+		.pm = pm_sleep_ptr(&ov2740_pm_ops),
 	},
 	.probe = ov2740_probe,
 	.remove = ov2740_remove,
-- 
2.43.0


