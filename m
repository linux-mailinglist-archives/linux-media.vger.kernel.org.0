Return-Path: <linux-media+bounces-368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B77EC288
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 13:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6970F281445
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 12:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF93F18C20;
	Wed, 15 Nov 2023 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OV/YF9AZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885651EB29
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 12:38:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011C810F
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 04:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700051911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LmNrCUxBMf8tFOPVK2RL6DvGWnDG4Fhl3NBJY7kl474=;
	b=OV/YF9AZDlrzdmPpv8S10ln1shA6JMlR9De1PilwHtBjIWOYIqyzD3buOGsYDNxDX7UiYc
	GWuergqoz6lwVw3sN++Ex9nFu95uKxfYKoKBTYzonJajYupXgwIpnHUyHjWFoGkirGQFUZ
	VPBGu3nKu5n3PtojJRGg99LNfAvSNMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-lyLOUL-bNPWQdzcpmS1CpA-1; Wed, 15 Nov 2023 07:38:29 -0500
X-MC-Unique: lyLOUL-bNPWQdzcpmS1CpA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C738185A781;
	Wed, 15 Nov 2023 12:38:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 618885031;
	Wed, 15 Nov 2023 12:38:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: ov2740: Add support for external clock
Date: Wed, 15 Nov 2023 13:38:17 +0100
Message-ID: <20231115123817.196252-3-hdegoede@redhat.com>
In-Reply-To: <20231115123817.196252-1-hdegoede@redhat.com>
References: <20231115123817.196252-1-hdegoede@redhat.com>
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

On other ACPI platforms, such as e.g. various ThinkPad models with
IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
and the sensor's clock itself.

Add support for having the driver control an optional clock.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index e5f9569a229d..0a87d0920eb8 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -3,6 +3,7 @@
 
 #include <asm/unaligned.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -336,6 +337,7 @@ struct ov2740 {
 
 	/* GPIOs, clocks */
 	struct gpio_desc *reset_gpio;
+	struct clk *clk;
 
 	/* Current mode */
 	const struct ov2740_mode *cur_mode;
@@ -1068,6 +1070,7 @@ static int ov2740_suspend(struct device *dev)
 	struct ov2740 *ov2740 = to_ov2740(sd);
 
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
+	clk_disable_unprepare(ov2740->clk);
 	return 0;
 }
 
@@ -1075,6 +1078,11 @@ static int ov2740_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov2740 *ov2740 = to_ov2740(sd);
+	int ret;
+
+	ret = clk_prepare_enable(ov2740->clk);
+	if (ret)
+		return ret;
 
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
 	msleep(20);
@@ -1102,6 +1110,10 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
 				     "failed to get reset GPIO\n");
 
+	ov2740->clk = devm_clk_get_optional(dev, "clk");
+	if (IS_ERR(ov2740->clk))
+		return dev_err_probe(dev, PTR_ERR(ov2740->clk), "failed to get clock\n");
+
 	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
-- 
2.41.0


