Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1034A3A95
	for <lists+linux-media@lfdr.de>; Sun, 30 Jan 2022 22:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240071AbiA3Vif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 16:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbiA3Vid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 16:38:33 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3E7C061714
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 13:38:33 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id s9so21681832wrb.6
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 13:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmccyyqFa03D1ymfj1vW2iFIL1wCtCVuREhjkZboLeo=;
        b=Mec/vK45oSDrcQqahfmA5Xev3CSUf6udl3+rt0oa7CKeEH0g+asHi3+A/B6pR/azuE
         8koFy/nC80PFhuCgtFW7mVi8bTNWnABjLZt7hMX7Qy1pketBfbqjWkDucx0QFYgu+Q8L
         hu1vyJb3Y1EHLBXWeQazRg0NV7aOVJeEFimGmt76UeA4IgvdC+fStdUnNSMCs9wCqkav
         iIfOgw5m5YfzsgpsXMQWaaUs9qPRyoGJbb2dGp0mMNP8lE5Kvb1ekK3gJRONas2PceiQ
         iVQlcn3rb+YAIML5dm1xP/Mfv6yqdmlhuBsvpBNvV1zcikWc9oGDlMhq43SYMfZ8GxWJ
         2IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmccyyqFa03D1ymfj1vW2iFIL1wCtCVuREhjkZboLeo=;
        b=dMXXI7o89dr149dM0fkYISXf8fqClLpIMflSEvOCtddFZxn+pmZEsiQoYX1wN8MUxA
         UL/5E6gXjx6SB8hr1T2Jq2JfqmygWWuw1F5749WAyoVHDQuNd+qwrCGRJ3ZSAfBtSqVm
         ZZSVHz1QY2OnHdn3TB1N9yHzP4U3B/otxzr16Gu0C5+s0p6gDR25FG7XxP9TTH0lJFhH
         4+vSGTXKo/YVKle0szuqv4U7k75Gh1VLPP1JWIELH0QUBNROMFRPA3rhtlxjAwkNhaPC
         8LmvDLSATX98Y/2ZUt/+BuFPE/DjlV9LOpqLGbwC9XsRiQ4fn5TBq+d4RPfc2VKdTFfc
         DG5Q==
X-Gm-Message-State: AOAM530xZmaANL082sm2F1xdlmGIfF4gYiXw3LzUYBuu3JKPYSA8QyTX
        2X9TXvmCaolmDonuW4yLncNvBH1tyls=
X-Google-Smtp-Source: ABdhPJybuqf5dBnIs6UJkITQcbmRRwHrzTe4mpiz+5jvXOC3TLcRhT962xyP5BLUEVS07fw2x93bRQ==
X-Received: by 2002:a05:6000:1687:: with SMTP id y7mr15226531wrd.159.1643578711742;
        Sun, 30 Jan 2022 13:38:31 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r17sm2347497wmq.33.2022.01.30.13.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 13:38:31 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, paul.kocialkowski@bootlin.com,
        kevin.lhopital@bootlin.com
Subject: [PATCH] media: i2c: Fix regulator disable balance in ov8865
Date:   Sun, 30 Jan 2022 21:36:21 +0000
Message-Id: <20220130213621.70780-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ov8865_sensor_power() disables all three of the sensor's regulators
on the error path, however not all of the regulators may have been
enabled at the time of the error, which will result in unbalanced
disable calls.

Fix the issue by adding specific error paths for each regulator.

Fixes: 11c0d8fdccc5 ("media: i2c: Add support for the OV8865 image sensor")

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index ebdb20d3fe9d..cb740d7e4f5a 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2404,30 +2404,28 @@ static int ov8865_sensor_power(struct ov8865_sensor *sensor, bool on)
 		gpiod_set_value_cansleep(sensor->powerdown, 1);
 
 		ret = regulator_enable(sensor->dovdd);
-		if (ret) {
-			dev_err(sensor->dev,
-				"failed to enable DOVDD regulator\n");
-			goto disable;
-		}
+		if (ret)
+			return dev_err_probe(sensor->dev, ret,
+					     "failed to enable DOVDD\n");
 
 		ret = regulator_enable(sensor->avdd);
 		if (ret) {
 			dev_err(sensor->dev,
 				"failed to enable AVDD regulator\n");
-			goto disable;
+			goto err_disable_dovdd;
 		}
 
 		ret = regulator_enable(sensor->dvdd);
 		if (ret) {
 			dev_err(sensor->dev,
 				"failed to enable DVDD regulator\n");
-			goto disable;
+			goto err_disable_avdd;
 		}
 
 		ret = clk_prepare_enable(sensor->extclk);
 		if (ret) {
 			dev_err(sensor->dev, "failed to enable EXTCLK clock\n");
-			goto disable;
+			goto err_disable_dvdd;
 		}
 
 		gpiod_set_value_cansleep(sensor->reset, 0);
@@ -2436,7 +2434,6 @@ static int ov8865_sensor_power(struct ov8865_sensor *sensor, bool on)
 		/* Time to enter streaming mode according to power timings. */
 		usleep_range(10000, 12000);
 	} else {
-disable:
 		gpiod_set_value_cansleep(sensor->powerdown, 1);
 		gpiod_set_value_cansleep(sensor->reset, 1);
 
@@ -2447,6 +2444,15 @@ static int ov8865_sensor_power(struct ov8865_sensor *sensor, bool on)
 		regulator_disable(sensor->dovdd);
 	}
 
+	return ret;
+
+err_disable_dvdd:
+	regulator_disable(sensor->dvdd);
+err_disable_avdd:
+	regulator_disable(sensor->avdd);
+err_disable_dovdd:
+	regulator_disable(sensor->dovdd);
+
 	return ret;
 }
 
-- 
2.25.1

