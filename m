Return-Path: <linux-media+bounces-1545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5A80332D
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3EC280FD2
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0079241EA;
	Mon,  4 Dec 2023 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyEnR5+m"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FE8D51
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xxUdIqDlnsdLLZIf76PNVODtOOzrmUSvwsKXuTkrBTU=;
	b=iyEnR5+mdSF7IYYOcMW6+LtGThIsHQnv24XPi80fRudTlkt/C1qwqhrETwfv3X1w8fezE8
	/mLtrfZJPQb2QOvvrO6dyc5U7hhpkTYF23qAwiqVkCajvEmjdisB3o3srH7vRRXSPmduYI
	qD0sApJmeACuObWKWkMIxpKsOZEFIV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-o_cKCWSAOSueMgwsm6TpXQ-1; Mon, 04 Dec 2023 07:39:52 -0500
X-MC-Unique: o_cKCWSAOSueMgwsm6TpXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68A53811E7B;
	Mon,  4 Dec 2023 12:39:52 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40A0940C6EBA;
	Mon,  4 Dec 2023 12:39:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 2/9] media: ov2740: Add support for external clock
Date: Mon,  4 Dec 2023 13:39:39 +0100
Message-ID: <20231204123947.5754-3-hdegoede@redhat.com>
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

Add support for having the driver control an optional clock.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Wrap long dev_err_probe() line
---
 drivers/media/i2c/ov2740.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fef1b6f3f316..653cd96bb156 100644
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
@@ -1071,6 +1073,7 @@ static int ov2740_suspend(struct device *dev)
 	struct ov2740 *ov2740 = to_ov2740(sd);
 
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
+	clk_disable_unprepare(ov2740->clk);
 	return 0;
 }
 
@@ -1078,6 +1081,11 @@ static int ov2740_resume(struct device *dev)
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
@@ -1105,6 +1113,11 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
 				     "failed to get reset GPIO\n");
 
+	ov2740->clk = devm_clk_get_optional(dev, "clk");
+	if (IS_ERR(ov2740->clk))
+		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
+				     "failed to get clock\n");
+
 	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	ov2740->sd.internal_ops = &ov2740_internal_ops;
 	full_power = acpi_dev_state_d0(&client->dev);
-- 
2.43.0


