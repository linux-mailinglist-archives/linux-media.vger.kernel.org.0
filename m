Return-Path: <linux-media+bounces-14903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D492E456
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA7D41C220DD
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 10:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3164E158D98;
	Thu, 11 Jul 2024 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spJ3uAlD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0811586D5
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693205; cv=none; b=eR16p8Z+Hg9+ym60T+8ecmjoMpEVRjODDVYOZIlJeliQ2svW++gHojGMPG3BwRu3Wy6iPfmbcukDi2KA/mBRUC8Qp7tIULbSh8mTkT1XMFOM1Vt89RpSpE5Q3hoQ+9XppDX4UpE1DvVjmxc7UfyflAuzzq4rnher763ByoMIOf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693205; c=relaxed/simple;
	bh=ZDIWCtJoTPpqgSB2DOYJ2lRtvYa0iBWUcVLT0ATuLSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbsBerCyNZUM7Kveq+gYUI+IAcjUzHDkYpgs+olacYHbI6XdwuDUuG6XOHEkIj6q7oY2FQXtgAX+tRH1DU6TaqGNoMxzXMECAjx81m2i0vbkDeewiSUe33Tz+iXT5LNe2VjqVrdwXgx6O2KQdyn7RL1H6V0w5k8HXqJAcNjEEtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=spJ3uAlD; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eea7e2b0e6so7798671fa.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 03:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720693202; x=1721298002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koV68SqPyU3UAlRmC6Mum6YXdK1Ua2t3zfx/aiRtqyk=;
        b=spJ3uAlDKfr4M9oYlQNSaHYLMZHB1Xdc2AsvIOPgiWfFng/4huu1LUDwVE+K1cjlKK
         W/WCVh7wHg7X7sIjrh/nWz4HulHYzEIDDNFbmB10jSsqjUUr7r+vxQNqX0MithqC32Ni
         oebS6IHrRh74MEFwt9GpG/h4hzgphXGB9MSYpKqbMMUxsnOty72r0MBspUhr0vCSYjQN
         TifUQlqEK+JDlrsg2eenKk5uAG/ibIFPLqut244ZK4dHKqA+nOJ34gaHTYNMocXGW0xB
         f8d/T/85HR6vyr/6+pnIw9KIufZzuYN5IjORhuxysqc4UmO7SMy/gW6P3JHGkw2I+Qch
         iKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720693202; x=1721298002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koV68SqPyU3UAlRmC6Mum6YXdK1Ua2t3zfx/aiRtqyk=;
        b=RZ3+yWq5ozK0wplT8wAlusIZE5UOq72Hvqh77XOSFqkvkBT7LzKrq4pPZRPG8dG1a0
         /hsLjjRIYUhshjq7nkDlW1M8z1/OCm/JwsPPUk1J89WO+1vWH3P0crQgW9z2H2Qn2t7j
         biQXrGNk6Ssi+CfLW5jFdY05tmDHFDvi4azbt/1+PKR0xlBQnKKWzorwUK5hhPsEjrsc
         wEWtDBQQMTKr1J8FA2gpAn0kAHo1x42j/p64WZU6OAdRte8M8Yhlva3XTNYMbg92Nrxe
         7Iu2RySrn75GFhmg42tDtLOwbYu2o+3mDCdDPBZ40WQQNo1ADOlNt06Bl011AkdY48Aj
         BCsA==
X-Forwarded-Encrypted: i=1; AJvYcCU3mBmmpdSO9aGoDbaQyscYoSz3UUN1KvcTzI+/eqj6o2Nt/TLaArG88XizslKu37VNBIcncCPmoaQjMnZ57yC5UhjSBa5VxTcgCGs=
X-Gm-Message-State: AOJu0YyMc+6QNxq7jAIbX2wRc1B0HxQcmaO0LibFOV3//OrEBTkzYsYo
	LqBrsVdg5Suafbp/Pa4SKj0MmIJT+qrsW6iQa34OHRraEiF3niJvJpO0HLZZ0SI=
X-Google-Smtp-Source: AGHT+IG4lGOEP0ObrRCkbO66rKar4kb9gm5MrDgJ4yrSwAmZ7O8Q6KboQB+IJXQ95N9D6jwYagmyoA==
X-Received: by 2002:a05:6512:3b8c:b0:52c:6461:e913 with SMTP id 2adb3069b0e04-52eb999623amr5603923e87.16.1720693202115;
        Thu, 11 Jul 2024 03:20:02 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266e861339sm125270025e9.12.2024.07.11.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:20:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 11 Jul 2024 11:20:01 +0100
Subject: [PATCH 1/2] media: ov5675: Derive delay cycles from the clock rate
 reported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-linux-next-ov5675-v1-1-69e9b6c62c16@linaro.org>
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
In-Reply-To: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-13183

The ov5675 driver expresses its reset delays in terms of XVCLK cycles as
per the ov5675 specification. XVCLK can be anything in the range of 6 MHz
to 24 MHz inclusive.

Upstream we use 19.2 MHz however, since the delays are calculated in terms
of clock cycles as opposed to fixed intervals it makes sense to facilitate
any potential clock we might support.

Do so by reading the XVCLK rate and using the returned rate instead of
operating from a static definition.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov5675.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 3641911bc73f..92bd35133a5d 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -497,6 +497,7 @@ struct ov5675 {
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct clk *xvclk;
+	u32 xvclk_rate;
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[OV5675_NUM_SUPPLIES];
 
@@ -973,10 +974,11 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 static int ov5675_power_off(struct device *dev)
 {
 	/* 512 xvclk cycles after the last SCCB transation or MIPI frame end */
-	u32 delay_us = DIV_ROUND_UP(512, OV5675_XVCLK_19_2 / 1000 / 1000);
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5675 *ov5675 = to_ov5675(sd);
+	u32 delay_us;
 
+	delay_us = DIV_ROUND_UP(512, ov5675->xvclk_rate / 1000 / 1000);
 	usleep_range(delay_us, delay_us * 2);
 
 	clk_disable_unprepare(ov5675->xvclk);
@@ -988,11 +990,13 @@ static int ov5675_power_off(struct device *dev)
 
 static int ov5675_power_on(struct device *dev)
 {
-	u32 delay_us = DIV_ROUND_UP(8192, OV5675_XVCLK_19_2 / 1000 / 1000);
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5675 *ov5675 = to_ov5675(sd);
+	u32 delay_us;
 	int ret;
 
+	delay_us = DIV_ROUND_UP(8192, ov5675->xvclk_rate / 1000 / 1000);
+
 	ret = clk_prepare_enable(ov5675->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable xvclk: %d\n", ret);
@@ -1178,7 +1182,6 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675, struct device *dev)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	u32 xvclk_rate;
 	int ret;
 	unsigned int i, j;
 
@@ -1192,10 +1195,10 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675, struct device *dev)
 				     PTR_ERR(ov5675->xvclk));
 
 	if (ov5675->xvclk) {
-		xvclk_rate = clk_get_rate(ov5675->xvclk);
+		ov5675->xvclk_rate = clk_get_rate(ov5675->xvclk);
 	} else {
 		ret = fwnode_property_read_u32(fwnode, "clock-frequency",
-					       &xvclk_rate);
+					       &ov5675->xvclk_rate);
 
 		if (ret) {
 			dev_err(dev, "can't get clock frequency");
@@ -1203,9 +1206,9 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675, struct device *dev)
 		}
 	}
 
-	if (xvclk_rate != OV5675_XVCLK_19_2) {
+	if (ov5675->xvclk_rate != OV5675_XVCLK_19_2) {
 		dev_err(dev, "external clock rate %u is unsupported",
-			xvclk_rate);
+			ov5675->xvclk_rate);
 		return -EINVAL;
 	}
 

-- 
2.45.2


