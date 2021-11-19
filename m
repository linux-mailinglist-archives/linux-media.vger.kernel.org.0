Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C164567DB
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 03:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhKSCMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 21:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbhKSCMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 21:12:52 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9BEC061574;
        Thu, 18 Nov 2021 18:09:51 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id v23so10841773iom.12;
        Thu, 18 Nov 2021 18:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zkj+89k4bp/s4LnUnVtL6QeRLgRYmRxuKfg3h3lP7po=;
        b=VWz1Bb6+EvjP44SxI0BISi7o37khpapsDVScvVh0l0hkpN8axeOEUxsuAN1fjH91Lq
         WVan0da+70+e47Ud35nXhvfgvl8K2bozex8sUiMsEk20j49SMPAjkYLvs3O59kJ5EYOU
         6iz+4bSF/QT50vkaS055SMsIlO+tf8EuKSHJdfEj+XDK8+/jE/TqCxl5nkY4Mm1hzOVk
         3B7TkC73LHMQeHQ9HJYA5iTMCwLhp4pTTETkqCSHtLBAK32z+re9oCZq2VAaz2PkfyX4
         fByzGMSmJvJ2hY53c8WhTRJvENDsKIdqO65Yu2mdmGx74//ct7Aic3lHyKomVTUBnaN4
         0E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zkj+89k4bp/s4LnUnVtL6QeRLgRYmRxuKfg3h3lP7po=;
        b=26o+x7EqKl+0BBdWYYI9anKiODCgaRqSjJ5jMyr+uotbPG2piZbm/wN9KCodpEL287
         lQgGpqeb4bovwxCv2OF/ltdFJ9GNO3z+VV7InA4/2Vz+iNOwDEUD+SSaxkRYpj/tldCQ
         oyB+y5woHyjk6USP3G5OxVtPNDLWSwQEjt1G8LOKe09OfrdGERN0Q9X2DqLC0mjfgvJ5
         AAWCpaULWcpEwW/bMLuI9yols8f2rPOJ/wmTa6Bx0zuK4osGFNaLELz8Iz7CpF/S0F5Z
         2k94sj2X5k5Ti9+x6e0cQmO4pS02SlPLP3rL5n1BOxiTS5e/MnnIxgkqkqM2LILw1G0W
         Q+tw==
X-Gm-Message-State: AOAM531PvmzmKkTRwE01/Ad6UL0QN2T4IcYGU02Yzs7k8bhGGvTfycuw
        sFMKeaPJ5DfuC0lwyK7CKwQ=
X-Google-Smtp-Source: ABdhPJysoaDcF+fM8klQulU0vAxQW97JiZTi9zHn13yGKDlI+IWP8/LVRfBwQbq0687+xFi2+hTYeQ==
X-Received: by 2002:a02:9586:: with SMTP id b6mr24062795jai.24.1637287791069;
        Thu, 18 Nov 2021 18:09:51 -0800 (PST)
Received: from localhost.localdomain (047-006-019-138.res.spectrum.com. [47.6.19.138])
        by smtp.gmail.com with ESMTPSA id q20sm897527iob.42.2021.11.18.18.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 18:09:50 -0800 (PST)
From:   Chuck Ritola <cjritola@gmail.com>
To:     crope@iki.fi
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chuck Ritola <cjritola@gmail.com>
Subject: [PATCH] media: dvb-frontends: a8293: fix LNB powerup failure in PCTV 461e
Date:   Thu, 18 Nov 2021 21:09:05 -0500
Message-Id: <20211119020905.22725-1-cjritola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes a8293 failure to raise LNB voltage in PCTV 461e DVB-S2 Stick
affecting multiple users over several years as found here:

http://www.linuxquestions.org/questions/linux-hardware-18/pctv-dvb-s2-stick-461e-not-feeding-lnb-4175529374/
https://www.linuxtv.org/wiki/index.php/Pinnacle_PCTV_DVB-S2_Stick_(461e)
https://github.com/OpenELEC/OpenELEC.tv/issues/3731

Caused by vIN undervoltage lockout (status register bit 7) when raising LNB to 18V.
Addressed by using the higher-precision voltages available on the a8293 to gradually
increase (slew) the voltage when voltage increases are requested.

Adds volt_slew_nanos_per_mv to a8293_platform_data struct for specifying slew rate.
If value is <1 or non-sane (>1600), the original no-slew version for a8293_set_voltage is used.

Signed-off-by: Chuck Ritola <cjritola@gmail.com>
---
 drivers/media/dvb-frontends/a8293.c   | 147 +++++++++++++++++++++++++-
 drivers/media/dvb-frontends/a8293.h   |   2 +
 drivers/media/usb/em28xx/em28xx-dvb.c |   3 +
 3 files changed, 150 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/a8293.c b/drivers/media/dvb-frontends/a8293.c
index 57f52c004..f86af43ee 100644
--- a/drivers/media/dvb-frontends/a8293.c
+++ b/drivers/media/dvb-frontends/a8293.c
@@ -3,16 +3,139 @@
  * Allegro A8293 SEC driver
  *
  * Copyright (C) 2011 Antti Palosaari <crope@iki.fi>
+ * Copyright (C) 2021 Chuck Ritola <cjritola@gmail.com>
  */
 
 #include "a8293.h"
 
+#define A8293_FLAG_ODT			0x10
+
+
 struct a8293_dev {
 	struct i2c_client *client;
 	u8 reg[2];
+	int volt_slew_nanos_per_mv;
 };
 
-static int a8293_set_voltage(struct dvb_frontend *fe,
+/*
+ * When increasing voltage, do so in minimal steps over time, minimizing risk of vIN undervoltage.
+ */
+
+static int a8293_set_voltage_slew(struct a8293_dev *dev,
+				struct i2c_client *client,
+			     enum fe_sec_voltage fe_sec_voltage,
+				int min_nanos_per_mv)
+{
+	int ret;
+	u8 reg0, reg1;
+	int new_volt_idx;
+	const int idx_to_mv[] = {0,    12709, 13042, 13375, 14042, 15042, 18042, 18709, 19042};
+	const u8 idx_to_reg[] = {0x00, 0x20,  0x21,  0x22,  0x24,  0x27,  0x28,  0x2A,  0x2B };
+	int this_volt_idx;
+	u8 status;
+	int prev_volt_idx;
+
+	dev_dbg(&client->dev, "set_voltage_slew fe_sec_voltage=%d\n", fe_sec_voltage);
+
+	/* Read status register to clear any stale faults. */
+	ret = i2c_master_recv(client, &status, 1);
+	if (ret < 0)
+		goto err;
+
+	/* Determine previous voltage */
+	switch (dev->reg[0] & 0x2F) {
+	case 0x00:
+		prev_volt_idx = 0;
+		break;
+	case 0x20:
+		prev_volt_idx = 1;
+		break;
+	case 0x21:
+		prev_volt_idx = 2;
+		break;
+	case 0x22:
+		prev_volt_idx = 3;
+		break;
+	case 0x24:
+		prev_volt_idx = 4;
+		break;
+	case 0x27:
+		prev_volt_idx = 5;
+		break;
+	case 0x28:
+		prev_volt_idx = 6;
+		break;
+	case 0x2A:
+		prev_volt_idx = 7;
+		break;
+	case 0x2B:
+		prev_volt_idx = 8;
+		break;
+	default:
+		prev_volt_idx = 0;
+	}
+
+	/* Determine new voltage */
+	switch (fe_sec_voltage) {
+	case SEC_VOLTAGE_OFF:
+		new_volt_idx = 0;
+		break;
+	case SEC_VOLTAGE_13:
+		new_volt_idx = 2;
+		break;
+	case SEC_VOLTAGE_18:
+		new_volt_idx = 6;
+		break;
+	default:
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/* Slew to new voltage if new voltage is greater than current voltage */
+	this_volt_idx = prev_volt_idx;
+	if (this_volt_idx < new_volt_idx) {
+		while (this_volt_idx < new_volt_idx) {
+			int delta_mv = idx_to_mv[this_volt_idx+1] - idx_to_mv[this_volt_idx];
+			int min_wait_time = delta_mv * min_nanos_per_mv;
+
+			reg0 = idx_to_reg[this_volt_idx+1];
+			reg0 |= A8293_FLAG_ODT;
+
+			ret = i2c_master_send(client, &reg0, 1);
+			if (ret < 0)
+				goto err;
+			dev->reg[0] = reg0;
+			this_volt_idx++;
+			usleep_range(min_wait_time, min_wait_time * 2);
+		}
+	} else { /* Else just set the voltage */
+		reg0 = idx_to_reg[new_volt_idx];
+		reg0 |= A8293_FLAG_ODT;
+		ret = i2c_master_send(client, &reg0, 1);
+		if (ret < 0)
+			goto err;
+		dev->reg[0] = reg0;
+	}
+
+	/* TMODE=0, TGATE=1 */
+	reg1 = 0x82;
+	if (reg1 != dev->reg[1]) {
+		ret = i2c_master_send(client, &reg1, 1);
+		if (ret < 0)
+			goto err;
+		dev->reg[1] = reg1;
+	}
+
+	usleep_range(1500, 5000);
+
+	return 0;
+err:
+	dev_dbg(&client->dev, "failed=%d\n", ret);
+	return ret;
+}
+
+
+static int a8293_set_voltage_noslew(struct dvb_frontend *fe,
 			     enum fe_sec_voltage fe_sec_voltage)
 {
 	struct a8293_dev *dev = fe->sec_priv;
@@ -20,7 +143,7 @@ static int a8293_set_voltage(struct dvb_frontend *fe,
 	int ret;
 	u8 reg0, reg1;
 
-	dev_dbg(&client->dev, "fe_sec_voltage=%d\n", fe_sec_voltage);
+	dev_dbg(&client->dev, "set_voltage_noslew fe_sec_voltage=%d\n", fe_sec_voltage);
 
 	switch (fe_sec_voltage) {
 	case SEC_VOLTAGE_OFF:
@@ -62,6 +185,24 @@ static int a8293_set_voltage(struct dvb_frontend *fe,
 	return ret;
 }
 
+static int a8293_set_voltage(struct dvb_frontend *fe,
+			     enum fe_sec_voltage fe_sec_voltage)
+{
+	struct a8293_dev *dev = fe->sec_priv;
+	struct i2c_client *client = dev->client;
+	int volt_slew_nanos_per_mv = dev->volt_slew_nanos_per_mv;
+
+	dev_dbg(&client->dev, "set_voltage volt_slew_nanos_per_mv=%d\n", volt_slew_nanos_per_mv);
+
+	/* Use slew version if slew rate is set to a sane value */
+	if (volt_slew_nanos_per_mv > 0 && volt_slew_nanos_per_mv < 1600)
+		a8293_set_voltage_slew(dev, client, fe_sec_voltage, volt_slew_nanos_per_mv);
+	else
+		a8293_set_voltage_noslew(fe, fe_sec_voltage);
+
+	return 0;
+}
+
 static int a8293_probe(struct i2c_client *client,
 		       const struct i2c_device_id *id)
 {
@@ -78,6 +219,7 @@ static int a8293_probe(struct i2c_client *client,
 	}
 
 	dev->client = client;
+	dev->volt_slew_nanos_per_mv = pdata->volt_slew_nanos_per_mv;
 
 	/* check if the SEC is there */
 	ret = i2c_master_recv(client, buf, 2);
@@ -127,5 +269,6 @@ static struct i2c_driver a8293_driver = {
 module_i2c_driver(a8293_driver);
 
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_AUTHOR("Chuck Ritola <cjritola@gmail.com>");
 MODULE_DESCRIPTION("Allegro A8293 SEC driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/dvb-frontends/a8293.h b/drivers/media/dvb-frontends/a8293.h
index 8c09635ef..0a807c022 100644
--- a/drivers/media/dvb-frontends/a8293.h
+++ b/drivers/media/dvb-frontends/a8293.h
@@ -18,9 +18,11 @@
 /**
  * struct a8293_platform_data - Platform data for the a8293 driver
  * @dvb_frontend: DVB frontend.
+ * @volt_slew_nanos_per_mv: Slew rate when increasing LNB voltage, in nanoseconds per millivolt.
  */
 struct a8293_platform_data {
 	struct dvb_frontend *dvb_frontend;
+	int volt_slew_nanos_per_mv;
 };
 
 #endif /* A8293_H */
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 471bd7466..859f4a33e 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -1208,6 +1208,9 @@ static int em28178_dvb_init_pctv_461e(struct em28xx *dev)
 
 	/* attach SEC */
 	a8293_pdata.dvb_frontend = dvb->fe[0];
+	/* 461e has a tendency to have vIN undervoltage troubles. Slew mitigates this. */
+	a8293_pdata.volt_slew_nanos_per_mv = 20;
+
 	dvb->i2c_client_sec = dvb_module_probe("a8293", NULL,
 					       &dev->i2c_adap[dev->def_i2c_bus],
 					       0x08, &a8293_pdata);
-- 
2.20.1

