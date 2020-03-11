Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25B9D181615
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 11:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbgCKKro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 06:47:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45213 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgCKKro (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 06:47:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id 2so1081615pfg.12
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7nixSWZgQM/dFUC8bWhHj5VYHF/zROxg8FtVN7hFmLo=;
        b=QOi6dwvPN8OHaV1bE2retGQzAs7SOWAk2T47xslQl9YraTvgXmCCIqVnM1rCc23jll
         kwzAixFcXlbPjOHXWMZGrKRm9hjgCygzy38WX73XQ+LEdD/80K854Fg2poCLTXWIhX3i
         ECedpadbpwpK8OffP6IuuDF1PyCt8xL4uFXCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7nixSWZgQM/dFUC8bWhHj5VYHF/zROxg8FtVN7hFmLo=;
        b=ZbmTsYwKocjDpLfsVXdS1hda2GxwMdS/RNkRFAKhwN80RsMhz1lUoJeMZdbWXg+zMt
         CcHuKGWDzA14Plfiz3NRpD1BQ1OhhLibw031bTwD5KVq43xnSUqcrca2CP3944etr4uj
         V9rvWVqAa4y595hgOXmDbgoVYqJq0YNuBLCucvj0wpCnzp79PlyvIsAnkL8Bu+wBrLbZ
         3RzwpBzEuEXEfdXuWUYMGRZ+FhhMz6XeWGoBjifMRUQAohv0JWaM3hnwqS7ZqKifoV2X
         ckbDX73xVYF90vBBYr3fpvlpQcJH7OWd2ZiXVJ12Ea1vZTyvpi9+KDCi3/s4dxLpdayU
         RoiQ==
X-Gm-Message-State: ANhLgQ0XnAtfbkYAvEzgoTIne16br3JFlLPFIFr/2pXdgHrV2ymL/ulY
        m05/pASw3d2TI4QSUPGJGJqAHPzsUfUPRw==
X-Google-Smtp-Source: ADFU+vtONaLRs0MZ77NKdNRX2SZFe5YG+WPFREn7udU5gZ2+UjRAxfCMIWKN+J2IPHDqDv5/vV6VdQ==
X-Received: by 2002:aa7:8d82:: with SMTP id i2mr2252091pfr.179.1583923662803;
        Wed, 11 Mar 2020 03:47:42 -0700 (PDT)
Received: from tfiga.tok.corp.google.com ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
        by smtp.gmail.com with ESMTPSA id o19sm6181965pjr.2.2020.03.11.03.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 03:47:42 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2] media: i2c: ov5695: Fix power on and off sequences
Date:   Wed, 11 Mar 2020 19:47:28 +0900
Message-Id: <20200311104728.62909-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
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
 drivers/media/i2c/ov5695.c | 49 ++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 18 deletions(-)

Changes since v1:
(https://patchwork.kernel.org/patch/11305411/)
 - Add comments explaining why the regulators are controlled one by one.
   (Sakari)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index d6cd15bb699ac..cc678d9d2e0da 100644
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
@@ -991,21 +984,28 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
 
 	gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
 
-	ret = regulator_bulk_enable(OV5695_NUM_SUPPLIES, ov5695->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators\n");
-		goto disable_clk;
+	/*
+	 * The hardware requires the regulators to be powered on in order,
+	 * so enable them one by one.
+	 */
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
@@ -1013,9 +1013,22 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
 
 static void __ov5695_power_off(struct ov5695 *ov5695)
 {
+	struct device *dev = &ov5695->client->dev;
+	int i, ret;
+
 	clk_disable_unprepare(ov5695->xvclk);
 	gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
-	regulator_bulk_disable(OV5695_NUM_SUPPLIES, ov5695->supplies);
+
+	/*
+	 * The hardware requires the regulators to be powered off in order,
+	 * so disable them one by one.
+	 */
+	for (i = OV5695_NUM_SUPPLIES - 1; i >= 0; i--) {
+		ret = regulator_disable(ov5695->supplies[i].consumer);
+		if (ret)
+			dev_err(dev, "Failed to disable %s: %d\n",
+				ov5695->supplies[i].supply, ret);
+	}
 }
 
 static int __maybe_unused ov5695_runtime_resume(struct device *dev)
@@ -1285,7 +1298,7 @@ static int ov5695_probe(struct i2c_client *client,
 	if (clk_get_rate(ov5695->xvclk) != OV5695_XVCLK_FREQ)
 		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
 
-	ov5695->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	ov5695->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov5695->reset_gpio)) {
 		dev_err(dev, "Failed to get reset-gpios\n");
 		return -EINVAL;
-- 
2.25.1.481.gfbce0eb801-goog

