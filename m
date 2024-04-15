Return-Path: <linux-media+bounces-9391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC178A5121
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1001CB234C3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC03E78C90;
	Mon, 15 Apr 2024 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZQaxLfpa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305571B40
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186660; cv=none; b=juPhNb5z2TTbmFiaMvvJQ3tAFqq8d55kXyodYwdjTX8Ehb7Id8gLlP2xCr3xjxMt1Oyzehs2te6WFDK9/FBEYVynIK7uBuWPP3s/8s+fpBaiRdNClyqNgw+xipZo1r0a4pk8qGXJwyLhVlLlR57zPAzgqFJjazSCgnAnOM6BvmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186660; c=relaxed/simple;
	bh=fW5TvR6ZGUfwE09yf9LbpDmUs0R8rLgsFBWiqtBswUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+O56wxajzxqttW9OUfTQRqOpuBGKq6bQTBD3H/WiZQdBK2u6M0ct+k/iwr5WeGFHOI8NLu7FHdaWM5UrCmtXSPHO91qnD9Q32ekVXHeHLKqnQdGVciRQmZ8B8OZ1RivFNatu/uFd8GrK+E0FRJxyhcHEKn7GzePPgRzsT79U8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZQaxLfpa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713186657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NO69vgdtGETkuhBAyGanubfvTjIEjGugqn8H7wz06A=;
	b=ZQaxLfpaVBUX0MtOvX+OsW4FSU96pZ/huYwMXvdNz6gCenX2iLjJq/l9vl9Koa+VGWa/su
	2UbEZa35/0BIlSSmYRPJk4WZzMuo5u9dfBaDNU1sogK1i6GbGWw7mErlmLSDHPj/UNX0eT
	WfoMt634S4p5OUG7LspG5srkHwY1Zq8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-iTubTrvyMf-4lab8acgvTA-1; Mon,
 15 Apr 2024 09:10:54 -0400
X-MC-Unique: iTubTrvyMf-4lab8acgvTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B4B828B727A;
	Mon, 15 Apr 2024 13:10:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4468851EF;
	Mon, 15 Apr 2024 13:10:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/4] media: hi556: Add support for reset GPIO
Date: Mon, 15 Apr 2024 15:10:36 +0200
Message-ID: <20240415131038.236660-3-hdegoede@redhat.com>
In-Reply-To: <20240415131038.236660-1-hdegoede@redhat.com>
References: <20240415131038.236660-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

On some ACPI platforms, such as Chromebooks the ACPI methods to
change the power-state (_PS0 and _PS3) fully take care of powering
on/off the sensor.

On other ACPI platforms, such as e.g. various HP models with IPU6 +
hi556 sensor, the sensor driver must control the reset GPIO itself.

Add support for having the driver control an optional reset GPIO.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 45 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index c54cd49e56a1..e084f7888e29 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -4,6 +4,7 @@
 #include <asm/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -633,6 +634,9 @@ struct hi556 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
+	/* GPIOs, clocks, etc. */
+	struct gpio_desc *reset_gpio;
+
 	/* Current mode */
 	const struct hi556_mode *cur_mode;
 
@@ -1276,6 +1280,25 @@ static void hi556_remove(struct i2c_client *client)
 	mutex_destroy(&hi556->mutex);
 }
 
+static int hi556_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct hi556 *hi556 = to_hi556(sd);
+
+	gpiod_set_value_cansleep(hi556->reset_gpio, 1);
+	return 0;
+}
+
+static int hi556_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct hi556 *hi556 = to_hi556(sd);
+
+	gpiod_set_value_cansleep(hi556->reset_gpio, 0);
+	usleep_range(5000, 5500);
+	return 0;
+}
+
 static int hi556_probe(struct i2c_client *client)
 {
 	struct hi556 *hi556;
@@ -1295,12 +1318,24 @@ static int hi556_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&hi556->sd, client, &hi556_subdev_ops);
 
+	hi556->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(hi556->reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(hi556->reset_gpio),
+				     "failed to get reset GPIO\n");
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
+		/* Ensure non ACPI managed resources are enabled */
+		ret = hi556_resume(&client->dev);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					     "failed to power on sensor\n");
+
 		ret = hi556_identify_module(hi556);
 		if (ret) {
 			dev_err(&client->dev, "failed to find sensor: %d", ret);
-			return ret;
+			goto probe_error_power_off;
 		}
 	}
 
@@ -1345,9 +1380,16 @@ static int hi556_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(hi556->sd.ctrl_handler);
 	mutex_destroy(&hi556->mutex);
 
+probe_error_power_off:
+	if (full_power)
+		hi556_suspend(&client->dev);
+
 	return ret;
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(hi556_pm_ops, hi556_suspend, hi556_resume,
+				 NULL);
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id hi556_acpi_ids[] = {
 	{"INT3537"},
@@ -1361,6 +1403,7 @@ static struct i2c_driver hi556_i2c_driver = {
 	.driver = {
 		.name = "hi556",
 		.acpi_match_table = ACPI_PTR(hi556_acpi_ids),
+		.pm = pm_sleep_ptr(&hi556_pm_ops),
 	},
 	.probe = hi556_probe,
 	.remove = hi556_remove,
-- 
2.44.0


