Return-Path: <linux-media+bounces-4575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3384630F
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 22:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4BD3B23973
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 21:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F763EA89;
	Thu,  1 Feb 2024 21:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MRWg97Hr"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B111405FB
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706824760; cv=none; b=jnr00eRddlTN4kFASJ0woR/21yDfrojYBJKoK6Pl396ZgIMOjlfYF+ekT8EvCU6akwMnEk3Ng1H4Dc7rWKkMfTbM66O6POgvs4kw/DjXKMOHSkvgYJ+8EqwbHALP+FW9eaesUxXBNwhX4rj7UK0Ee1xdNmmhh0M5YQnLTaCINdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706824760; c=relaxed/simple;
	bh=9LE9uSrVAOzQzNs+DI6h3J7xWzwYHqCzkQhfOskwvoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KthYkD9TlpqbdGpbB2mZnCHHD/ePeE/TztTjB3YJdjKEcUTKpkUiAd1W7m8SONdV5QmKVU61ExTLYdFAXwqZaceXAGe2nqPGLqAMgKGk7kH3+Ifp1BYlw0KP7XPY6PSc8+QTTHIxY0mgYSLWWBJmDhhNLNBjEqy7I7YQROWknbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MRWg97Hr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706824757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5s9hTRm31gxF5+OEiFRWw14a77KmxGdyoOr0tbXDpo=;
	b=MRWg97HrM0tMzYNn6gQH5eZKAggavusePja24P2V8Rr7+26wz8zGeRu4bYspRb2bk2gaPH
	uk7nR5nwYULn2Mf3G+sxLgeeN7zd+vf1bODKedAECB5F3N0+OfLomJjN78Da0hJw9FTAYa
	dMRcsxgUcG+8MraMCjTote2ET2rXoyg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-444OkJ7gP1mdOaqzpjQxfg-1; Thu, 01 Feb 2024 16:59:15 -0500
X-MC-Unique: 444OkJ7gP1mdOaqzpjQxfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C8F38828C0;
	Thu,  1 Feb 2024 21:59:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABEBD3C2E;
	Thu,  1 Feb 2024 21:59:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: hi556: Add support for avdd regulator
Date: Thu,  1 Feb 2024 22:58:41 +0100
Message-ID: <20240201215841.153499-5-hdegoede@redhat.com>
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
index fb6ba6984e38..90eff282a6e2 100644
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
@@ -1287,8 +1289,17 @@ static int hi556_suspend(struct device *dev)
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
@@ -1303,6 +1314,13 @@ static int hi556_resume(struct device *dev)
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
@@ -1338,6 +1356,12 @@ static int hi556_probe(struct i2c_client *client)
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
2.43.0


