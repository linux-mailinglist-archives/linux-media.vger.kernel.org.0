Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4B3589D5
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfF0SWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:22:44 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42209 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfF0SWn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:22:43 -0400
Received: by mail-qk1-f193.google.com with SMTP id b18so2572150qkc.9
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ynZRQipO11aEpMlGCD/4ADT0oFlH70svLV2USrw+Fss=;
        b=GLfXCS9selXtL1cyV5HOpZnfE1evVnnGNTBN2EygrsET+bhQF6U2M1NTRGqafPUh5p
         /i9+/vGOTgW51o3ew23shhA3XRi3dEymCbSHiIYvk2osxoc35aBuUXLVKk/oYrWXBybb
         1t5JG5HRdDM2BUUnDCrV85ogQB9IPGUaqy+slFGxZ3e9vkePFq22xNIZzOld5T5yYWTR
         y7wrkEI2eGJa3yKMhyjCMDkqbwvc05YSJQnE5jXXrUhU/O+XCcE13z8QfgQPou3KiWvR
         Cc5j5nzlo9xXRodP+/LI2dwhOuBR0GMmVokkfhBPST9Y10lp8hgQfddG3GfLc9LA1vz5
         u6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ynZRQipO11aEpMlGCD/4ADT0oFlH70svLV2USrw+Fss=;
        b=qbZaBjHPACN3QT7dR4UGtFY2+bF2rcv6bbHYCk/obnK0Q+SoAmnF7xxR85zbjPvJdU
         2oOMJ+/gduMy7zMW/YAHtZF4XXwvhuAneJ2Jz4k1RFjBqCDSGn59aYU6gVi0xJorPegv
         3vuvowM4W0R5G4lFN5rQ8YKTbOEJwPTSP2i1937WSQ+uSQynEyujUxqSShjtQKyc/3s+
         BQ8X4l2FCzP6Snaj9ER1pZ3R68/jH8EzeKNf3rmEKZgaDgRqFPiE93dt5D5hwTi4lJKd
         v5MaI2DKIucoNqWU5lMSk9vRZ/VdMzS6kRcDeMfns70I2sPDI0eEFlMz0ekjgjE9XKdM
         94mA==
X-Gm-Message-State: APjAAAWcJeZ2IdnXlYwrfFMCkIE8cLumCoIMWn9ANZW4W5gr8eP5KQo0
        JOb8i9Lwt/bF0tTNdrf+uCc=
X-Google-Smtp-Source: APXvYqyCrEcIDZq/B7++Zl87b3sk6OwGa4n8IKme8LB+Qklvwje8D2875Q+/2rv3qrEd2roJDWDidQ==
X-Received: by 2002:a05:620a:1519:: with SMTP id i25mr4850239qkk.331.1561659762097;
        Thu, 27 Jun 2019 11:22:42 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 5sm1362170qkr.68.2019.06.27.11.22.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 11:22:41 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sakari.ailus@iki.fi
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        todor.tomov@linaro.org, ezequiel@collabora.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] media: ov5645: Remove unneeded regulator_set_voltage()
Date:   Thu, 27 Jun 2019 15:22:30 -0300
Message-Id: <20190627182231.11125-1-festevam@gmail.com>
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
Changes since v1:
- None

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

