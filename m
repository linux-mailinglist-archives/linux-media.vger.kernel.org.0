Return-Path: <linux-media+bounces-4577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22639846311
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 22:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC54128B97C
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 21:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AEA405CF;
	Thu,  1 Feb 2024 21:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0AT7LcJ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB93FE4C
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 21:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706824762; cv=none; b=nRs4hOBnRAQy9ClGXeepr8EmL2YZ9Fv1wcw7kTjdS0xxPHl6U36DiV6aP2Em1wyFYDCB2673tZLKOHZpDKVpLPIdULqyKjvLSA4VXuU+5R5rSyKhRySsCaNwjOKJSyeDAGDIG/Wsx9wjv7pdWTNhs8GR3njbiTX3yP8sHEYYwQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706824762; c=relaxed/simple;
	bh=Vlgvk6pezzStHbuju8Vd6RAGaNPqVuDaUacM0fyWUj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1tKMS7x/rXE0bJ+k9ffQ79KR/x1Wcxg+tXBCPTHRQvlz9EtH1V/Oh4b5g5j0BY7V4bkA/pf8MWumwShzu86rKb82I2ApfQIr+7W3o5wNwMToO+cK5djls5Ut9CayH9mqiyeQA4qnOdXuMWU9ScyJUqfdD37lmHdMOXzMYxPfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0AT7LcJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706824758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5WEWu7CD7+Ej1byQ+227nuawc3ziNGs8Sn30NvUoyM=;
	b=H0AT7LcJwglsOuM7nLV9bibCR1i4XrBvwZyGQj92Mj43rnF1HFWkTxZjlCaEOn0c6cqusd
	fOuJlQMzwK8kzZGhUH+eaD+YrL/TlN9WaThZ+kjKfR9KNg73H0Uh3UrrEl/IbbXNAsJB7e
	b7q0himVfy8gaFRCxPaaza+MzPUqTyU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-fceX0j_NPEKxqBLkSltvDw-1; Thu,
 01 Feb 2024 16:59:14 -0500
X-MC-Unique: fceX0j_NPEKxqBLkSltvDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ACCB3C025CC;
	Thu,  1 Feb 2024 21:59:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D7B03C2E;
	Thu,  1 Feb 2024 21:59:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 3/4] media: hi556: Add support for external clock
Date: Thu,  1 Feb 2024 22:58:40 +0100
Message-ID: <20240201215841.153499-4-hdegoede@redhat.com>
In-Reply-To: <20240201215841.153499-1-hdegoede@redhat.com>
References: <20240201215841.153499-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

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
index 7398391989ea..fb6ba6984e38 100644
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
@@ -1287,6 +1289,7 @@ static int hi556_suspend(struct device *dev)
 	struct hi556 *hi556 = to_hi556(sd);
 
 	gpiod_set_value_cansleep(hi556->reset_gpio, 1);
+	clk_disable_unprepare(hi556->clk);
 	return 0;
 }
 
@@ -1294,6 +1297,11 @@ static int hi556_resume(struct device *dev)
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
@@ -1325,6 +1333,11 @@ static int hi556_probe(struct i2c_client *client)
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
2.43.0


