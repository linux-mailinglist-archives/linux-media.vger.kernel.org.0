Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF2941A3F8E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 05:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgDJDtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 23:49:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:33940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728673AbgDJDtu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 23:49:50 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14BBC214D8;
        Fri, 10 Apr 2020 03:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586490590;
        bh=05uL3AfmLOd4vCKh5qhRusPGF7xL91Dt3P3g9f6M/k8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cTCSl7Au4s8HLjDC8uw4YXqShYhDzM6jmy66KUqy30lmnpOWXkqYN4Kq6Y8ksGZ9h
         zhbs8eR8bpw1ZX7JPnPN0CnYcHfzmZnEk6czVgoEzuGUoIhXaw9CA72cjLLhOqGW9x
         C0zxpXmKWxX3Luf8uS9QcaXzW14Vg+xbYtJl7+rU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 34/46] media: i2c: ov5695: Fix power on and off sequences
Date:   Thu,  9 Apr 2020 23:48:57 -0400
Message-Id: <20200410034909.8922-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200410034909.8922-1-sashal@kernel.org>
References: <20200410034909.8922-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

[ Upstream commit f1a64f56663e9d03e509439016dcbddd0166b2da ]

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
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ov5695.c | 49 ++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 34b7046d97021..1adcd1ed16641 100644
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
2.20.1

