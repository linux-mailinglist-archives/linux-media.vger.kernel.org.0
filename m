Return-Path: <linux-media+bounces-9328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7E88A4BC1
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA8A3282E12
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB194594C;
	Mon, 15 Apr 2024 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C7AN0FrZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE4446AD
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713174115; cv=none; b=oMkW9JeP5LlYnZ0qVeAqw12yOWs0Ae1VpB6cKN9NyhVMtLFiL61Iytx7cMZIqiZNt63zI2X6nboYhT250Npx9ndpsg43NiIAXKilTBsVFZqvVnol1jB4TV02lY7y6UhBn6vwa+2iWEDaFD7jAWh6XzmL0SzP2q7xN+bglz5YM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713174115; c=relaxed/simple;
	bh=OY+yzan0TGo1zadtOUGnX5magb/OiZZK3zpdjIOxl+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYUccIALRV5/VVF7KFEomPCDUPwh/N3ABVvbPTzMrD65AY6dEcfwWsNZlNUzlRrDBTeyMX4XLzl1RCrcUXyn8lRZW1U1FA/KEyVAwlCGZ4nuUdT45yU1nPSMSXPqKyLLtAMQIYxMn4KdNMao1mU9ml5oQTMQeaVSgLsHB2iGlc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C7AN0FrZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713174113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWWWu3C2VFCqfhP7lXz85x6U6MQsclb2hazeAcb5IlQ=;
	b=C7AN0FrZI6O1f6BnhE1dfKs9TWhbsk6PIfJi+p7TRv/C9FIQRCXRAG2yz4jn8Bmkzjc3DF
	IB+592d4vPK1ERTNaQnKf9reLh2WzMCEml4WE7NbFqP0GwoaGrcDgt/NM5+bl+EFMQUkSq
	nLALYK7LmZCrg70KAWwgdUGm+PpB8CQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490-uEyCsP0JPYehpv7Lz-VE-Q-1; Mon,
 15 Apr 2024 05:41:51 -0400
X-MC-Unique: uEyCsP0JPYehpv7Lz-VE-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C32D29AC02F;
	Mon, 15 Apr 2024 09:41:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44C50492BC8;
	Mon, 15 Apr 2024 09:41:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 4/4] media: hi556: Add support for avdd regulator
Date: Mon, 15 Apr 2024 11:41:33 +0200
Message-ID: <20240415094133.210580-5-hdegoede@redhat.com>
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
index b783e0f56687..5641c249d4b1 100644
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


