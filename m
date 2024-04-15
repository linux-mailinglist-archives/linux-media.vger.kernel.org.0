Return-Path: <linux-media+bounces-9329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A038A4BC2
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F562B2496C
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2774654B;
	Mon, 15 Apr 2024 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yu3tsB9n"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BAD3EA96
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713174116; cv=none; b=uiO26hYHmvTdGI7QxWjefiJqmLeedFPkRCsEtJwzki83FXlOXUa1Dsrb4XSq4IWockqnpQMe5AK+t9AOQO76imf0Ulze1KaVSLD8yF2Z5CrHgXApmL2MLW09GEj140u6fNeZnLYUuIx25TAr3WWJXoVNF3qgPZoGYuWvIMDOlrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713174116; c=relaxed/simple;
	bh=15PpbWBgrXUsaMQuKnvvR4wdLsN7XoiqT2cnrYYAv/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsAOvZc4rXUP3FFz7O68EGZciLRA5rKnz5vID7h4sWLbH0ApmAV2tG4HjKF+NSvSqpJeMhK35ZkqZ1tKoRSkX8+IvhBpoGtGb1Abs/hhRdOFYB8ac8Lj7ROyZH2f4uRyI/d8EWCEVSk38yA1RJ5p3uUAFrVGpvSw93gRB2cYzRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yu3tsB9n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713174113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJCp6rrQC844l61YbZjijrtQd4N9DxhtZyWzpwOw8WU=;
	b=Yu3tsB9nT6iBOUXR19Zj7pBCzV7nSeFIJ/Ky+bkVTYt6DSAAfT8LUeH3937GpeuR3NtTOR
	vwSInffZBRRIYFY6C8lEMB6EifjCMKMoOawuGmSLW1HEyzFIiXJ/PVuVFlaEMv64WuEWKw
	rSt1qWqiOnh529h5SL9B0nvAFFBZhXg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-UaFasqNdM7y5YZtwwYv7jA-1; Mon, 15 Apr 2024 05:41:50 -0400
X-MC-Unique: UaFasqNdM7y5YZtwwYv7jA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11DAF830E75;
	Mon, 15 Apr 2024 09:41:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD3C492BC7;
	Mon, 15 Apr 2024 09:41:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 3/4] media: hi556: Add support for external clock
Date: Mon, 15 Apr 2024 11:41:32 +0200
Message-ID: <20240415094133.210580-4-hdegoede@redhat.com>
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
hi556 sensor, the sensor driver must control the sensor's clock itself.

Add support for having the driver control an optional clock.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index f5a39b83598b..b783e0f56687 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -3,6 +3,7 @@
 
 #include <asm/unaligned.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -636,6 +637,7 @@ struct hi556 {
 
 	/* GPIOs, clocks, etc. */
 	struct gpio_desc *reset_gpio;
+	struct clk *clk;
 
 	/* Current mode */
 	const struct hi556_mode *cur_mode;
@@ -1286,6 +1288,7 @@ static int hi556_suspend(struct device *dev)
 	struct hi556 *hi556 = to_hi556(sd);
 
 	gpiod_set_value_cansleep(hi556->reset_gpio, 1);
+	clk_disable_unprepare(hi556->clk);
 	return 0;
 }
 
@@ -1293,6 +1296,11 @@ static int hi556_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct hi556 *hi556 = to_hi556(sd);
+	int ret;
+
+	ret = clk_prepare_enable(hi556->clk);
+	if (ret)
+		return ret;
 
 	gpiod_set_value_cansleep(hi556->reset_gpio, 0);
 	usleep_range(5000, 5500);
@@ -1324,6 +1332,11 @@ static int hi556_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(hi556->reset_gpio),
 				     "failed to get reset GPIO\n");
 
+	hi556->clk = devm_clk_get_optional(&client->dev, "clk");
+	if (IS_ERR(hi556->clk))
+		return dev_err_probe(&client->dev, PTR_ERR(hi556->clk),
+				     "failed to get clock\n");
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* Ensure non ACPI managed resources are enabled */
-- 
2.44.0


