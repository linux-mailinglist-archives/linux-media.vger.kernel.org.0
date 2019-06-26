Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35C0A5751E
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 01:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfFZX5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 19:57:25 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46204 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbfFZX5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 19:57:25 -0400
Received: by mail-qk1-f194.google.com with SMTP id x18so194458qkn.13
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2019 16:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Guu6CiHa2q+zHzhdEkXwqHVkT/ipxnLW4v3dLzYrqlw=;
        b=h0GWc1e9mQY9SOSzsLn9MUoaD2DSoJrJwIyYA0d3BSpu+BUsBSriwV5WWME+OVxqoS
         IXKZncUahAJQLpFqkJF2ihnGEXDP68Mb3IRS81UWuDvbfMRf7q+B2xwBwA/WVZR+EYA1
         mdJvW13bC0dap41R/Ktko2IWDCo8RAaFnK2HehS6zNMUJXA0LSBIFWmIi0nHd73Nn8iP
         Lv/MpGYwvWL1lI6GmaIMfmDiPZ3g61Gpn9v0GppVh9rkLX2hoQX28vwdrPKYBBzEZXKM
         JAf/xLxNHKTJ0MswSbr1fwmiTObCqwHKiT+BJ03RhVFBLi33Aq1sMomE1AOx1rp/9qbw
         wKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Guu6CiHa2q+zHzhdEkXwqHVkT/ipxnLW4v3dLzYrqlw=;
        b=P78AG7FIwZInZxIfMkU5SiOTBLzFfmyIvQpYEdkvMgG/A+OXTluE95cKaj9zW/VX8A
         EiMZqT/D41gARmAktV4HHarZ25UranCdNkxGnei73+kgkBj2byKH10OvB5Dn+4f55xAo
         huS4NcA41AeYOQDIJ1NUi5iKDu39o4CvfMAg+0eGxHRhhpS57U3c8lhdEdOBQFApqiWS
         pzQ2g9abFoY9J3QoFPQu3AKLw6nJC/+hWft6mM6qJAUpImASe2uOgO3RMcOhFh1TfSXN
         TMbguwZJUnvTxv906PVt3SekAWsYnjsNoHqnJRATmbaiOo7E+Jai/vB1Mk2qQuB4gLNE
         o0mw==
X-Gm-Message-State: APjAAAVlTh5DOkVx2smD87FsJhbrxHLYxCP9HKXXNk7zRbj72y1SqG+t
        itF28N23Cy/SViO/4f6Cels=
X-Google-Smtp-Source: APXvYqw69h0kAf51KZX8m4mr/DsVzV+RKt9muMdJPQNy0ca1vccc9P2sRbIVyEEo/J849dgCpfe/Qg==
X-Received: by 2002:a37:517:: with SMTP id 23mr707417qkf.496.1561593443895;
        Wed, 26 Jun 2019 16:57:23 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id w16sm264022qtc.41.2019.06.26.16.57.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 16:57:23 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, todor.tomov@linaro.org,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] media: ov5645: Remove unneeded regulator_set_voltage()
Date:   Wed, 26 Jun 2019 20:56:13 -0300
Message-Id: <20190626235614.26587-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to call regulator_set_voltage() for each regulator
that powers the camera.

The voltage value for each regulator should be retrieved from the
device tree, so remove the unneeded regulator_set_voltage().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/ov5645.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 124c8df04633..4e302dc15177 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -34,10 +34,6 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define OV5645_VOLTAGE_ANALOG               2800000
-#define OV5645_VOLTAGE_DIGITAL_CORE         1500000
-#define OV5645_VOLTAGE_DIGITAL_IO           1800000
-
 #define OV5645_SYSTEM_CTRL0		0x3008
 #define		OV5645_SYSTEM_CTRL0_START	0x02
 #define		OV5645_SYSTEM_CTRL0_STOP	0x42
@@ -1156,42 +1152,18 @@ static int ov5645_probe(struct i2c_client *client,
 		return PTR_ERR(ov5645->io_regulator);
 	}
 
-	ret = regulator_set_voltage(ov5645->io_regulator,
-				    OV5645_VOLTAGE_DIGITAL_IO,
-				    OV5645_VOLTAGE_DIGITAL_IO);
-	if (ret < 0) {
-		dev_err(dev, "cannot set io voltage\n");
-		return ret;
-	}
-
 	ov5645->core_regulator = devm_regulator_get(dev, "vddd");
 	if (IS_ERR(ov5645->core_regulator)) {
 		dev_err(dev, "cannot get core regulator\n");
 		return PTR_ERR(ov5645->core_regulator);
 	}
 
-	ret = regulator_set_voltage(ov5645->core_regulator,
-				    OV5645_VOLTAGE_DIGITAL_CORE,
-				    OV5645_VOLTAGE_DIGITAL_CORE);
-	if (ret < 0) {
-		dev_err(dev, "cannot set core voltage\n");
-		return ret;
-	}
-
 	ov5645->analog_regulator = devm_regulator_get(dev, "vdda");
 	if (IS_ERR(ov5645->analog_regulator)) {
 		dev_err(dev, "cannot get analog regulator\n");
 		return PTR_ERR(ov5645->analog_regulator);
 	}
 
-	ret = regulator_set_voltage(ov5645->analog_regulator,
-				    OV5645_VOLTAGE_ANALOG,
-				    OV5645_VOLTAGE_ANALOG);
-	if (ret < 0) {
-		dev_err(dev, "cannot set analog voltage\n");
-		return ret;
-	}
-
 	ov5645->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov5645->enable_gpio)) {
 		dev_err(dev, "cannot get enable gpio\n");
-- 
2.17.1

