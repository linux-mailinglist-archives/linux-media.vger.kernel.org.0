Return-Path: <linux-media+bounces-9394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD28A5124
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EB961C21E94
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597C879DD5;
	Mon, 15 Apr 2024 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QGl9wZs4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614079B9D
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186664; cv=none; b=Fd7mjJ7Mnw85jpzv0Msra4yBj1mfOnBYk/BSqfsxSILllCYUcDk+PCcMRLKUJa9haHW3PVmknhIpke23n/d7yRGdDg/hRG3DsqvzYid23T0DT8KFZkrh0rODTPuV2TPTCRiivJ4mw9VRIhmZgpPk3TnToDMPyOCPhDBLpgZwHkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186664; c=relaxed/simple;
	bh=RTECgF9XpSiuQwltN04/1b8lNhCk38e62ACxs1qXoUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2dZzQESoDw14XqZH4TBEewI8bnOmfNrdyAHhwJo88wFWQrQRbEe7/skYObbvD15iLZgOWFkj6DGwtXJe8Kk3AFmDxo/o9C927LjB7vR0WsnOHwmzYPI06Q5/eru4UxWZQKhS9xPr49efrvqt4baPG4gydgt8pr3HkBqboKP+oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QGl9wZs4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713186662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vY0C877oewiCuOz9PRdj8frz1ZNMnNF3Qek4hVl3Z5w=;
	b=QGl9wZs4tsS2Z9GAxLoNQLOr+TdpUIVTZG/YbLpaBPl5AMfOG2MRfVUircslWlT7S4QXjS
	A/oo6IrJOwpD9Ulpwh4DACYelzW0aTi2YLqxTHFtjHzkI7UiNMrx8p9qAitOrzrhh8EIA3
	yA14jccIsThZOD3H+Km+KqyZu8x1Q6g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-YzyLoQrWOlODfIYZ2VVzow-1; Mon, 15 Apr 2024 09:10:57 -0400
X-MC-Unique: YzyLoQrWOlODfIYZ2VVzow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AD9A104B503;
	Mon, 15 Apr 2024 13:10:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9426523D5D;
	Mon, 15 Apr 2024 13:10:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 4/4] media: hi556: Add support for avdd regulator
Date: Mon, 15 Apr 2024 15:10:38 +0200
Message-ID: <20240415131038.236660-5-hdegoede@redhat.com>
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
hi556 sensor, the sensor driver must control the avdd regulator itself.

Add support for having the driver control the sensor's avdd regulator.
Note this relies on the regulator-core providing a dummy regulator
(which it does by default) on platforms where Linux is not aware of
the avdd regulator.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 235caadf02dc..b440f386f062 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -9,6 +9,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -638,6 +639,7 @@ struct hi556 {
 	/* GPIOs, clocks, etc. */
 	struct gpio_desc *reset_gpio;
 	struct clk *clk;
+	struct regulator *avdd;
 
 	/* Current mode */
 	const struct hi556_mode *cur_mode;
@@ -1286,8 +1288,17 @@ static int hi556_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct hi556 *hi556 = to_hi556(sd);
+	int ret;
 
 	gpiod_set_value_cansleep(hi556->reset_gpio, 1);
+
+	ret = regulator_disable(hi556->avdd);
+	if (ret) {
+		dev_err(dev, "failed to disable avdd: %d\n", ret);
+		gpiod_set_value_cansleep(hi556->reset_gpio, 0);
+		return ret;
+	}
+
 	clk_disable_unprepare(hi556->clk);
 	return 0;
 }
@@ -1302,6 +1313,13 @@ static int hi556_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = regulator_enable(hi556->avdd);
+	if (ret) {
+		dev_err(dev, "failed to enable avdd: %d\n", ret);
+		clk_disable_unprepare(hi556->clk);
+		return ret;
+	}
+
 	gpiod_set_value_cansleep(hi556->reset_gpio, 0);
 	usleep_range(5000, 5500);
 	return 0;
@@ -1337,6 +1355,12 @@ static int hi556_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(hi556->clk),
 				     "failed to get clock\n");
 
+	/* The regulator core will provide a "dummy" regulator if necessary */
+	hi556->avdd = devm_regulator_get(&client->dev, "avdd");
+	if (IS_ERR(hi556->avdd))
+		return dev_err_probe(&client->dev, PTR_ERR(hi556->avdd),
+				     "failed to get avdd regulator\n");
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* Ensure non ACPI managed resources are enabled */
-- 
2.44.0


