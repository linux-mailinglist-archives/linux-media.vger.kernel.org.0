Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7F2127B7F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 14:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfLTNIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 08:08:12 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:47064 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfLTNIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 08:08:12 -0500
Received: by mail-pg1-f194.google.com with SMTP id z124so4910307pgb.13
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=meDitHt8qyvVvhpt+x/CzgZZK4BHEUE/N3YzuDpyS6w=;
        b=GzcrcTUta+EBedAj8mVaPAO2+l2jkXwr/govHhy8/tR7y0KjEyEfKUkYnUljmc2hq5
         YicK+EEf3JdJVmLP1s9H6mmtSkxGeLSpFuvTTwY3lA/Ypf5O9YcVWfseHPmgQSOuowcD
         XfrbDzKTLRKq9NUos+8PPmpmiIC9PbrP9GAYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=meDitHt8qyvVvhpt+x/CzgZZK4BHEUE/N3YzuDpyS6w=;
        b=dBPkIabxiATUTPBL9E1Uc2wIDkeSuPJsypKnu0xF1Dz0OKy7LgMQqfH97r9Eo97uJe
         ccK3CtqNJlYsY1zqoBv8ZfTephoRLrMjRyfVrkw7LSMM8ZXDBe79UNoVcVajK2e7pZnI
         knC18lu9XdZZWXuaLQVtxl98q2MeqpgieudGK+QmRLytLrfFwhZXWhbkQI8Y6urioHE2
         wShq4EYe6BnMBoOwbIa25CzCy/Lx549ObGc4/6T4wsruPtHkA/Xs9kmpIuuchdo/4wbP
         v13cX/w43MQ0EH5+DH+mblQTandS7hnKmQmC5eAG0+emxTIJhiz+jaFwaj5LIoHeNQnD
         tUlQ==
X-Gm-Message-State: APjAAAW/BOLbSmAdoOZCrsiEwC7B6eSCQtZB9o0k7/sbEpGdm7J59URL
        t20pBSra0hGVgHWFRK0yiTXgnvmTdY0=
X-Google-Smtp-Source: APXvYqwFRwyu5QWdevIerg75X3jjqVtRPPDstapmZRlXiLTdYC4bUNnX0Tqvl8NLkavB185wI0tplQ==
X-Received: by 2002:a65:4242:: with SMTP id d2mr1422153pgq.166.1576847291041;
        Fri, 20 Dec 2019 05:08:11 -0800 (PST)
Received: from tfiga.tok.corp.google.com ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
        by smtp.gmail.com with ESMTPSA id 100sm10273862pjo.17.2019.12.20.05.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 05:08:10 -0800 (PST)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] media: i2c: ov5695: Fix power on and off sequences
Date:   Fri, 20 Dec 2019 22:08:00 +0900
Message-Id: <20191220130800.61589-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

From the measured hardware signal, OV5695 reset pin goes high for a
short period of time during boot-up. From the sensor specification, the
reset pin is active low and the DT binding defines the pin as active
low, which means that the values set by the driver are inverted and thus
the value requested in probe ends up high.

Fix it by changing probe to request the reset GPIO initialized to high,
which makes the initial state of the physical signal low.

In addition, DOVDD rising must occur before DVDD rising from spec., but
regulator_bulk_enable() API enables all the regulators asynchronously.
Use an explicit loops of regulator_enable() instead.

For power off sequence, it is required that DVDD falls first. Given the
bulk API does not give any guarantee about the order of regulators,
change the driver to use regulator_disable() instead.

The sensor also requires a delay between reset high and first I2C
transaction, which was assumed to be 8192 XVCLK cycles, but 1ms is
recommended by the vendor. Fix this as well.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/media/i2c/ov5695.c | 41 +++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index d6cd15bb699ac..8d0cc3893fcfc 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -971,16 +971,9 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* Calculate the delay in us by clock rate and clock cycles */
-static inline u32 ov5695_cal_delay(u32 cycles)
-{
-	return DIV_ROUND_UP(cycles, OV5695_XVCLK_FREQ / 1000 / 1000);
-}
-
 static int __ov5695_power_on(struct ov5695 *ov5695)
 {
-	int ret;
-	u32 delay_us;
+	int i, ret;
 	struct device *dev = &ov5695->client->dev;
 
 	ret = clk_prepare_enable(ov5695->xvclk);
@@ -991,21 +984,24 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
 
 	gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
 
-	ret = regulator_bulk_enable(OV5695_NUM_SUPPLIES, ov5695->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators\n");
-		goto disable_clk;
+	for (i = 0; i < OV5695_NUM_SUPPLIES; i++) {
+		ret = regulator_enable(ov5695->supplies[i].consumer);
+		if (ret) {
+			dev_err(dev, "Failed to enable %s: %d\n",
+				ov5695->supplies[i].supply, ret);
+			goto disable_reg_clk;
+		}
 	}
 
 	gpiod_set_value_cansleep(ov5695->reset_gpio, 0);
 
-	/* 8192 cycles prior to first SCCB transaction */
-	delay_us = ov5695_cal_delay(8192);
-	usleep_range(delay_us, delay_us * 2);
+	usleep_range(1000, 1200);
 
 	return 0;
 
-disable_clk:
+disable_reg_clk:
+	for (--i; i >= 0; i--)
+		regulator_disable(ov5695->supplies[i].consumer);
 	clk_disable_unprepare(ov5695->xvclk);
 
 	return ret;
@@ -1013,9 +1009,18 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
 
 static void __ov5695_power_off(struct ov5695 *ov5695)
 {
+	struct device *dev = &ov5695->client->dev;
+	int i, ret;
+
 	clk_disable_unprepare(ov5695->xvclk);
 	gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
-	regulator_bulk_disable(OV5695_NUM_SUPPLIES, ov5695->supplies);
+
+	for (i = OV5695_NUM_SUPPLIES - 1; i >= 0; i--) {
+		ret = regulator_disable(ov5695->supplies[i].consumer);
+		if (ret)
+			dev_err(dev, "Failed to disable %s: %d\n",
+				ov5695->supplies[i].supply, ret);
+	}
 }
 
 static int __maybe_unused ov5695_runtime_resume(struct device *dev)
@@ -1285,7 +1290,7 @@ static int ov5695_probe(struct i2c_client *client,
 	if (clk_get_rate(ov5695->xvclk) != OV5695_XVCLK_FREQ)
 		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
 
-	ov5695->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	ov5695->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov5695->reset_gpio)) {
 		dev_err(dev, "Failed to get reset-gpios\n");
 		return -EINVAL;
-- 
2.24.1.735.g03f4e72817-goog

