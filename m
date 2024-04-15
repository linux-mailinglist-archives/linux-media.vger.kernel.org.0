Return-Path: <linux-media+bounces-9330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401F8A4BC3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 614B11C2101B
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4037481D8;
	Mon, 15 Apr 2024 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q74zMBw/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF3E3FBAE
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713174117; cv=none; b=p+HQOenTcjnRuGLLyjfRrd5S6LJ/lYTjNG9KF+SpIjjk92YedV1XUjNp4xoYQB/TeL/RhxYpUgwWC16F+hiELbz+x7bMoOeiPgV5KqJc8SB5b8cOgg2xGH8D2jbF+fOyvSfOXRWrMjUDSJ9re4yC52k177Hwqx4BIEPoypqjdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713174117; c=relaxed/simple;
	bh=Zzn31TLG51HSpJ6iNnZdQkescJ4j01fDjqLbBfiq36k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMxD4sjeTDAKlTVGgSj0vbyf6xJyTzJ/PS8kfogpYmW3yDnXc/DftyfEw0eFgyoOMjfBsEh5gKYEDLEGu39grRGTvEkRVTODvr1UijuEnuyNSMnolucLqzh00HIodnhxpQHnXFoJEa/xEF8vACFF/Uywh+khodTTL08+5/COhDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q74zMBw/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713174114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUZUMZHmc3gNotXUBYhT3YTGOgxWtDjeo2rRtpwteFg=;
	b=Q74zMBw/coNS+3d7A6ZEA9UrhDZ5qWtJ2mf3R8akh+qEEzf5P6enWBRC5cxlMfffVf4nTv
	zbFRHpZ0/Wl0XzM5q6t8rr8A1jrh9n+PThjMW1ZfzytUMWsiJ+dtHkqEJGVlRrw1BgVA0C
	f5Au8aYtl0oVb8b3ttkXKmMnP9+kRbA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-23lONq6pOYCwdTZQtoWdCA-1; Mon, 15 Apr 2024 05:41:49 -0400
X-MC-Unique: 23lONq6pOYCwdTZQtoWdCA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF995881E62;
	Mon, 15 Apr 2024 09:41:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9090492BC8;
	Mon, 15 Apr 2024 09:41:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 2/4] media: hi556: Add support for reset GPIO
Date: Mon, 15 Apr 2024 11:41:31 +0200
Message-ID: <20240415094133.210580-3-hdegoede@redhat.com>
In-Reply-To: <20240415094133.210580-1-hdegoede@redhat.com>
References: <20240415094133.210580-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

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
index 96bae9914d52..f5a39b83598b 100644
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


