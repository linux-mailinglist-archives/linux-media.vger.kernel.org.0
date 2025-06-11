Return-Path: <linux-media+bounces-34492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D02FAD4C5D
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 09:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130FB1890C9B
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 07:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573BB22FF55;
	Wed, 11 Jun 2025 07:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="LAjTGT3t"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1016226D19;
	Wed, 11 Jun 2025 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626034; cv=none; b=Jw09intIfcmeQOgqeTx9K75u/GbAugG2TdNSvdiq37H/PghA49tpnMAhJAb9IRVMLWVzfvsifhlUgx49Gm67WSuyaTdlWmhJ3TzQcrS6cn8N9NK8nf7KUpL2o9mCwpEfcLjvLKVu7Yt6MI5/64Mt0uIojptUjuzbGYNvoQdcCj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626034; c=relaxed/simple;
	bh=ocYLGrn4DKyRdjJkUqfv9yBG++qwjH8EOCZ0CFdAVIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I4FHIq4Q6z1iyekkSvpWtFXgDqPBNMBpsSSLr6YO7lbJMMTTVRwi5i/L06l7v1Wbk/xGjnaOufg5fGiJC7lrzkCJG0VWVFh8bMLXusOio+8JROfXP+p5ZSheKSz7bUBFHxAQFe8orUQ/eml+ZZEOgzZKmJKhOlLzAzaaSGRgFGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=LAjTGT3t; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Jbe15mnO9u7J7i3pEkARcJf909rCxy+rkEFHQHi+nn0=; b=LAjTGT3tp5Ne0I6Mw4XbIR6A7g
	f4tuIxEeU7uC4SDXTie3Ez7K5CxWBoeCoHSPWXefZBXjQTfuYaL/hYu+3cHCgcqRr4WWybe30nTQ0
	KJaonu35AWUjw6IR8tk3lOtblnmz629dmOw6Okx/N0DImDc0o+Bzfgh1/yPxaTIec5Go=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:62424 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uPFeX-00GO9r-Ha; Wed, 11 Jun 2025 09:13:42 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Wed, 11 Jun 2025 09:13:33 +0200
Subject: [PATCH] media: dw9714: add support for powerdown pin
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-dw9714-sd-v1-1-fb47ef5e736c@emfend.at>
X-B4-Tracking: v=1; b=H4sIAJwsSWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3ZRyS3NDE93iFN20pETTRGNTkzRLYzMloPqCotS0zAqwWdGxtbU
 AK9Q4mFsAAAA=
X-Change-ID: 20250611-dw9714-sd-fba5a354f936
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bsp-development.geo@leica-geosystems.com, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Add support for the powerdown pin (xSD), which can be used to put the VCM
driver into power down mode. This is useful, for example, if the VCM
driver's power supply cannot be controlled.
The use of the powerdown pin is optional.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/dw9714.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e45ba127069fc0848f1a06ceb789efd3c222c008..e923daeec9c574c5b8c7014b9e83fcbad47866c0 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -748,7 +748,7 @@ config VIDEO_AK7375
 
 config VIDEO_DW9714
 	tristate "DW9714 lens voice coil support"
-	depends on I2C && VIDEO_DEV
+	depends on GPIOLIB && I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_ASYNC
diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 2ddd7daa79e28a2cde915b4173fa27e60d5a2b57..5b78c1848f80bc3e32df13d149f3865ff8defe6e 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2015--2017 Intel Corporation.
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -38,6 +39,7 @@ struct dw9714_device {
 	struct v4l2_subdev sd;
 	u16 current_val;
 	struct regulator *vcc;
+	struct gpio_desc *powerdown_gpio;
 };
 
 static inline struct dw9714_device *to_dw9714_vcm(struct v4l2_ctrl *ctrl)
@@ -151,11 +153,20 @@ static int dw9714_probe(struct i2c_client *client)
 	if (IS_ERR(dw9714_dev->vcc))
 		return PTR_ERR(dw9714_dev->vcc);
 
+	dw9714_dev->powerdown_gpio = devm_gpiod_get_optional(&client->dev,
+							     "powerdown",
+							     GPIOD_OUT_LOW);
+	if (IS_ERR(dw9714_dev->powerdown_gpio))
+		return dev_err_probe(&client->dev,
+				     PTR_ERR(dw9714_dev->powerdown_gpio),
+				     "could not get powerdown gpio\n");
+
 	rval = regulator_enable(dw9714_dev->vcc);
 	if (rval < 0) {
 		dev_err(&client->dev, "failed to enable vcc: %d\n", rval);
 		return rval;
 	}
+	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
 
 	usleep_range(1000, 2000);
 
@@ -185,6 +196,7 @@ static int dw9714_probe(struct i2c_client *client)
 	return 0;
 
 err_cleanup:
+	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
 	regulator_disable(dw9714_dev->vcc);
 	v4l2_ctrl_handler_free(&dw9714_dev->ctrls_vcm);
 	media_entity_cleanup(&dw9714_dev->sd.entity);
@@ -200,6 +212,7 @@ static void dw9714_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev)) {
+		gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
 		ret = regulator_disable(dw9714_dev->vcc);
 		if (ret) {
 			dev_err(&client->dev,
@@ -234,6 +247,7 @@ static int __maybe_unused dw9714_vcm_suspend(struct device *dev)
 		usleep_range(DW9714_CTRL_DELAY_US, DW9714_CTRL_DELAY_US + 10);
 	}
 
+	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
 	ret = regulator_disable(dw9714_dev->vcc);
 	if (ret)
 		dev_err(dev, "Failed to disable vcc: %d\n", ret);
@@ -262,6 +276,8 @@ static int  __maybe_unused dw9714_vcm_resume(struct device *dev)
 		dev_err(dev, "Failed to enable vcc: %d\n", ret);
 		return ret;
 	}
+	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
+
 	usleep_range(1000, 2000);
 
 	for (val = dw9714_dev->current_val % DW9714_CTRL_STEPS;

---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250611-dw9714-sd-fba5a354f936

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


