Return-Path: <linux-media+bounces-34573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF8AD6844
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 08:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DCEA17021A
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 06:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D1920E713;
	Thu, 12 Jun 2025 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="REJ3WHGL"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696771F5858;
	Thu, 12 Jun 2025 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711259; cv=none; b=NaoXBiFQzY2Mp3ps/8ntLDbGysvNvYHRhvc/anVKnHu4K0J6lLqrge58oEe9okjjiT0mp3kpKxu171oeJs/sargx53hk3tm7Xq4jLnzjjwJUGIgTzS6zUzk75wVwhje+5qOINZF1SavTRu8t9x0SrC2a0agDK/kOU8c7I3iMZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711259; c=relaxed/simple;
	bh=Avx/bZPrFIGD64hllwTAtrOlbzCtKU98XJKKjdws/7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMfkXaVW7aP1RvMtpGSpVAaPzm6rDaOn+OeFicd2v0I+Nf2Er/6PmQoOEpHOHdXotuVL3ex4hJi3yfdXlPxXJJYAWZ70Ie9JXpkDsg8OXiEyYS2YPMOZMNhN/3hxS1L2qmLcmQHIWeCTsxl/HsD7F7nAULCCruJx8Jkddo5sWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=REJ3WHGL; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zWKIxha0h/MkAneWTZJnd3xYa0jCgEGPkTWolmK3Lus=; b=REJ3WHGLswoycqkWEzCFxy9Xhd
	NheqYQRxeV5g5mR3gZyuzL6aoQXCHLCX8AfFfQenkqzTDNedQzg/rzgFeCm918HLEKZkjGQfITMTH
	yslNAjMJEpVuwoLLKLO9BdGpVwGwF+9NJdOq3hAmMDcltryfJ4buueI7I62hvkw9tITw=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:59918 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uPbpG-003wuh-PP; Thu, 12 Jun 2025 08:54:15 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 12 Jun 2025 08:54:12 +0200
Subject: [PATCH 3/3] media: dw9714: add support for powerdown pin
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-dw9714-v1-3-1a2d6d682829@emfend.at>
References: <20250612-dw9714-v1-0-1a2d6d682829@emfend.at>
In-Reply-To: <20250612-dw9714-v1-0-1a2d6d682829@emfend.at>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Move the power-up and power-down sequences to their own functions.
    This is a preparation for the upcoming powerdown pin support. Signed-off-by:
    Matthias Fend <matthias.fend@emfend.at> --- drivers/media/i2c/dw9714.c |
   44 +++++++++++++++++++++++++++++ 1 file changed, 29 insertions(+), 15 deletions(-)
    
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 Local_hs1_NotHoststar  Sender is not from hoststar.ch|de|com
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

Add support for the powerdown pin (xSD), which can be used to put the VCM
driver into power down mode. This is useful, for example, if the VCM
driver's power supply cannot be controlled. The use of the powerdown pin is
optional.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/dw9714.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

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
index 2abd4fb5e7c0f02ab96bf8fa5f557941187920a3..1e7ad355a388cfc37253bd764ec8df98f59beeea 100644
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
@@ -145,6 +147,8 @@ static int dw9714_power_up(struct dw9714_device *dw9714_dev)
 	if (ret)
 		return ret;
 
+	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
+
 	usleep_range(1000, 2000);
 
 	return 0;
@@ -152,6 +156,8 @@ static int dw9714_power_up(struct dw9714_device *dw9714_dev)
 
 static int dw9714_power_down(struct dw9714_device *dw9714_dev)
 {
+	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 1);
+
 	return regulator_disable(dw9714_dev->vcc);
 }
 
@@ -169,6 +175,14 @@ static int dw9714_probe(struct i2c_client *client)
 	if (IS_ERR(dw9714_dev->vcc))
 		return PTR_ERR(dw9714_dev->vcc);
 
+	dw9714_dev->powerdown_gpio = devm_gpiod_get_optional(&client->dev,
+							     "powerdown",
+							     GPIOD_OUT_HIGH);
+	if (IS_ERR(dw9714_dev->powerdown_gpio))
+		return dev_err_probe(&client->dev,
+				     PTR_ERR(dw9714_dev->powerdown_gpio),
+				     "could not get powerdown gpio\n");
+
 	rval = dw9714_power_up(dw9714_dev);
 	if (rval)
 		return dev_err_probe(&client->dev, rval,

-- 
2.34.1


