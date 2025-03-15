Return-Path: <linux-media+bounces-28285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B79A62D9B
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 14:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB7E3BC1E5
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 13:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C8B1FCCF9;
	Sat, 15 Mar 2025 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hY9TLbWD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE61DC98B
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742046036; cv=none; b=J36IxFMgGgwerJqPo9P7RnxfHHXKbdyvW/BtNdw3wBEUl1DbsavCsYRXkRO+aTmjBhxr4yyr6mJD3enZtfoJ9fCydxGOWK89cl92ojS4ckqzbZCuf7deFaRqx13RbI67sfCmuQ+A/v64dDJ9aRDveJxgBwP0NGtQ/Bb5cPyxHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742046036; c=relaxed/simple;
	bh=1XzDpE1/D6IJ+IhyW7rBh+iAYRrgUqa+4yROfrx/T4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4Bx4867GNTaoauyzKp5PCXlZVYNzNnequkEuwXGao/Cf00pHk2Wt1tnqmesEduy3ucNakLjDxBFkTvSefSbucYREDJHd+jVbbRK1OnTAmEq2ywQIw8okbwFeAzVks7utBcbgD9iBYt2h/4l2S69b0u6UQ7YcRH/iKTGyJEZVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hY9TLbWD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so5920582a12.1
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742046033; x=1742650833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvZDJMEISGf5fCXl6E/RBM62Xi8DcR35PaTbtSWcpYU=;
        b=hY9TLbWDCeQtEST21KFDuqLowhIC0mZkPCuv+SwAzP+OpjDrMyVltvwvBVUToRSTT1
         KmE+tS1OllC7z09ruJ+Chi+B+mlVa/I0ncfJ1Ca/TuNU00v5lzZJsjGrSIdv6cz223Gj
         iEGMa07qfNw3MGom/xi6AZ3S2hDZzrw2dLpTpMaO6Eq9I3FTrrKd0gLVrKKaic5jLqAC
         Kjf6kUCMrB2tXu5fOrZcraBtoUXcwciSk4NO8iEiR1j03LTmTBABUns6WYs0MCM51mVw
         H0ScOuJWd3a+Dbk2S+/tJwOBAq91OSQWKMaoEB0Bv28pcrcLESYSqK6FAGDxu/S2DB+h
         rl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742046033; x=1742650833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvZDJMEISGf5fCXl6E/RBM62Xi8DcR35PaTbtSWcpYU=;
        b=ZHtl/asj00J0GKJaNHVTklWW+lyvsoc7BB85r5lzxZ/C9tky9X8ZHqYNDWFOf3lx8g
         WvZQpOKPdOEEJBN9BHwkZLReeqcilGFzS2MwpyogsQyF7ZpnHAXVY46JaTpukYZwhLTw
         2CQ1tmchaMm1NquzKQ/Ucy8NF3ICmCS6/fQVSGR3iuetXMYSL6GmvsLQegwiJPiMJP1j
         vn8+J9w0MPtkc+vxRL48jIpLTjXH6fridBJbddP0joy4TMrx6HKqHULe5vo/8CnJG5T6
         jjRS3iowFr7jKWoZY2ZF9qlyWD0DXO2wkBIusxShwiZWvtjrNfUTBITNL+wloAqJVGr4
         pYfg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Jod9p1LJ8rWZ2EPhFxLNoj7R1V4AsBYCmjH7wFl2xfuBrHwCQz/gPCDEuAi9Rlho6T24XKsWw6uz4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrAgB2aVfPxjwTH/RQrVTccxXMU20a8NjyVgQM7hQlOIPLJ9kb
	mQt23T4DlFmVThEhbnCJgHzCcGiCPSxC7nsMrwS/ZMZj+C5sBdnjA4sC8jJJtJrbG/PVNRsg1kW
	5vAsB7g==
X-Gm-Gg: ASbGnctkaOhCtg6BPEJczVHJ5x3CjuNVs40NL1npBxpaOwLDD4ygP2IruQWj/LejxGy
	q2Ch3rZ6JrCVP634jsIZPPi54ziBdFhfvO7pG18oVZq0WbrcbakaN048AS9Lb46iIkCNaTGDZ8P
	s5b1+1xDtGj2X6Z7KxW6lfco04JEnwOHx2Y5ZF+t5d4ODBm9iR9MIlFtsmbD2vtlPDhw0EXTtPh
	0kkpMNAACadjLc1Kp8ZPWHGuv/YZgMuxFpRTabJVWdgdXJFuAKPcz0lwR0ZVTwnGITGBGjlwk5q
	FMnOreiUs86RYEmLZnN86BNqwQxWaA4WLyVQV1z4RDtBmiQw0NyXO0qMyRzCvNNTQYleuSYrhZl
	PFJciTRjVb8TJbl+V4ACZHPfyE1c+1GvHT3TvOc9vk3ViIyyEu92N+1/i4nZyREKp4urnLIdwTQ
	==
X-Google-Smtp-Source: AGHT+IFbvEViF6AXQfG3vWS7Xzhn98DgiMNvXmFjFpcyhvF4ZT4wUR3UkucbCDz6eC3awDjd7SulNA==
X-Received: by 2002:a05:6402:5192:b0:5e0:8a27:cd36 with SMTP id 4fb4d7f45d1cf-5e814dec3f9mr11108451a12.8.1742046032930;
        Sat, 15 Mar 2025 06:40:32 -0700 (PDT)
Received: from localhost.localdomain (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b009fsm3378824a12.34.2025.03.15.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 06:40:32 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com,
	heimir.sverrisson@gmail.com,
	linux-media@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com,
	ingvar@redpill-linpro.com,
	hao.yao@intel.com,
	mchehab@kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/4] media: i2c: ov02c10: Support full range of power rails
Date: Sat, 15 Mar 2025 13:40:06 +0000
Message-ID: <20250315134009.157132-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315134009.157132-1-bryan.odonoghue@linaro.org>
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use regulator_bulk_* to get the array of potential power rails for the
ov02c10.

The original IPU6 sensor from Intel only has code for avdd but on other
systems such as Qualcomm Co-Pilot laptops we need to manage avdd, dvdd and
dovdd with regulator_bulk_enable/disable.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02c10.c | 38 ++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 5626aa2fe62c..f6542cdf7472 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -366,6 +366,12 @@ static const struct ov02c10_mode supported_modes[] = {
 	},
 };
 
+static const char * const ov02c10_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct ov02c10 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -380,8 +386,8 @@ struct ov02c10 {
 	struct v4l2_ctrl *exposure;
 
 	struct clk *img_clk;
-	struct regulator *avdd;
 	struct gpio_desc *reset;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov02c10_supply_names)];
 
 	/* Current mode */
 	const struct ov02c10_mode *cur_mode;
@@ -632,6 +638,7 @@ static int ov02c10_get_pm_resources(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
+	int i;
 
 	ov02c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov02c10->reset))
@@ -645,28 +652,26 @@ static int ov02c10_get_pm_resources(struct device *dev)
 		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
 				     "failed to get imaging clock\n");
 
-	ov02c10->avdd = devm_regulator_get(dev, "avdd");
-	if (IS_ERR(ov02c10->avdd))
-		return dev_err_probe(dev, PTR_ERR(ov02c10->avdd),
-				     "failed to get avdd regulator\n");
+	for (i = 0; i < ARRAY_SIZE(ov02c10_supply_names); i++)
+		ov02c10->supplies[i].supply = ov02c10_supply_names[i];
 
-	return 0;
+	return devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02c10_supply_names),
+				       ov02c10->supplies);
 }
 
 static int ov02c10_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
-	int ret = 0;
 
 	gpiod_set_value_cansleep(ov02c10->reset, 1);
 
-	if (ov02c10->avdd)
-		ret = regulator_disable(ov02c10->avdd);
+	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
+			       ov02c10->supplies);
 
 	clk_disable_unprepare(ov02c10->img_clk);
 
-	return ret;
+	return 0;
 }
 
 static int ov02c10_power_on(struct device *dev)
@@ -681,13 +686,12 @@ static int ov02c10_power_on(struct device *dev)
 		return ret;
 	}
 
-	if (ov02c10->avdd) {
-		ret = regulator_enable(ov02c10->avdd);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable avdd: %d", ret);
-			clk_disable_unprepare(ov02c10->img_clk);
-			return ret;
-		}
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
+				    ov02c10->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators: %d", ret);
+		clk_disable_unprepare(ov02c10->img_clk);
+		return ret;
 	}
 
 	gpiod_set_value_cansleep(ov02c10->reset, 0);
-- 
2.48.1


