Return-Path: <linux-media+bounces-1041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE27F92F9
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B17BF1C20B23
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C857BD2FA;
	Sun, 26 Nov 2023 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5HQbc5u"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511BEFC
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701008129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NekLPQ977iwOmwpfruJQUntR85mWrciCzAp+1VecUQU=;
	b=J5HQbc5u/DNK/ROnWU508RoWYg81FKeXPjuf2JWLpfA/tKoLmjY+m7iGgdoJ43HfKZxRbx
	MwkMFRcONknIigE12ORbmCEC44/+S+mjiYDWCQtGdNR+nrF5usx90pcUmw4G/XGDgcEBNO
	Gey0o5ynWpX1lhv+Vkl0Dj3yYwsrZSA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-oe9rxpC7NwOQv93-EJ292Q-1; Sun,
 26 Nov 2023 09:15:26 -0500
X-MC-Unique: oe9rxpC7NwOQv93-EJ292Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F703299E74A;
	Sun, 26 Nov 2023 14:15:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 994CD2027019;
	Sun, 26 Nov 2023 14:15:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/9] media: ov2740: Add support for reset GPIO
Date: Sun, 26 Nov 2023 15:15:09 +0100
Message-ID: <20231126141517.7534-2-hdegoede@redhat.com>
In-Reply-To: <20231126141517.7534-1-hdegoede@redhat.com>
References: <20231126141517.7534-1-hdegoede@redhat.com>
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


