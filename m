Return-Path: <linux-media+bounces-1201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4363A7FB685
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3AC22822AA
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE764D586;
	Tue, 28 Nov 2023 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KaF9cSBA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90570E6
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701165662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGqxNiDEupYJ1a6mzum6wjQHf2d5OyeJKPVw87AAQJY=;
	b=KaF9cSBABtLFAtq5UdpVK4fS7mH+AR+lkTTNUi8MDF5LB2YNXFi3AkAwojGavkWdmK9LZH
	vRkRWUDxWsQnJoarKiAiMxZcBybEOKz6aHk6VhOzsx+tuKFg7X2hMX5FMjoTqEVD1Zd6Ar
	eN8SL4r00OeulbguumHcLXh4B96mUcE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-typ93kgUNtOYQnyIpAmzlg-1; Tue,
 28 Nov 2023 05:00:57 -0500
X-MC-Unique: typ93kgUNtOYQnyIpAmzlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27C092818749;
	Tue, 28 Nov 2023 10:00:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC6020268D7;
	Tue, 28 Nov 2023 10:00:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/9] media: ov2740: Add support for external clock
Date: Tue, 28 Nov 2023 11:00:40 +0100
Message-ID: <20231128100047.17529-3-hdegoede@redhat.com>
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
index e5f9569a229d..0396e40419ca 100644
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
@@ -1102,6 +1110,11 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
 				     "failed to get reset GPIO\n");
 
+	ov2740->clk = devm_clk_get_optional(dev, "clk");
+	if (IS_ERR(ov2740->clk))
+		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
+				     "failed to get clock\n");
+
 	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
-- 
2.41.0


