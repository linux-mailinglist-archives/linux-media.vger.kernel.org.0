Return-Path: <linux-media+bounces-28326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E82A638FE
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E7C188D5CA
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 00:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B9113C8EA;
	Mon, 17 Mar 2025 00:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TILKBI8J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EE46F06A
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 00:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742171987; cv=none; b=U00x2lSzT8j+5TLEtQLRm3g0g7drl5JGQm52d5Wv/r8HuYnf4Hl7IeGLN+H1qnH31ooDUY/N3xGgPPIbBuG7oP4Y/glb+KBPGQTs6QjHEA1rBtJnWg+PzZvk58RmAEBsfl/wic25iLcX256GvSSmgsd8Ex7V5OcNV6rmTq2Ls2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742171987; c=relaxed/simple;
	bh=KIg73JLaVi8hOvqu+RYn7ANzfZBohIjnh0HTlx/y0GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQIvjTrzwK7gtVTg5oSm+Aw8fYZsY5TTaUgPvj8G6o4nHcotL0SloOnj+/kf09duHiY6Bydjv3nq+qhUqdz5Ezhl0CdqxkwC2Y9R8U+bfZqmSNQzrTneXbpeLGaljpqDjszJ04eO4b3WtsEOkzxtsTL+jJ3NugVLHXF7zGVfGY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TILKBI8J; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2aeada833so759653566b.0
        for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 17:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742171984; x=1742776784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoT6hEWGo8s9UTjENCcvZ5oqOOzIvji9QYyI5V3xbzI=;
        b=TILKBI8JYvFHYyPEcM0klEATbTiKZJN2oWNOJhIb9jPT22HtmrhqL5uUrPb67zBh+Q
         sdAsCj48CiFAuZA2CYKmAvAUjc9HEk2ngotbAyPOvUcY6o0ra3wOtTjHVeLJdFL76RNL
         jhJFE5J2lH2bkkH2TZapF3ucSA+WLnffOClFCVIYvuwc/yQAyMJb2ZfBGEZ1TQzA8fBS
         FPFPnWmR7GdYHG2E1N2H/111M59ewzK9Lnd75V1tKPb1sIS2Qz85JmMxRKWAaWRRqe3M
         UW6FXLl27sxT6Ui1XMSpefxz/4g3vIEu+cqcRh1/nR+XzA4og8kGuCtNuK9Xa3ItSq9d
         WOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742171984; x=1742776784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoT6hEWGo8s9UTjENCcvZ5oqOOzIvji9QYyI5V3xbzI=;
        b=i1EmnZajP9P7WecUn1IOb4F0IFoI/FoiyG16rrsbRBPVZP5I85R89MBbNKwjoNTpAf
         p0YxvoZRpe+LazSgNPEwqX1BpbpXzNr6adoyS9VNbU9jFZViASTHkf2s+n8eYR2/c7dE
         fPb10O99JWqONaYToBYXNh8xaILCKgvWoMIrKMtQS+bGXxT2M1w3BLDHbZkSQGA5BQyl
         19QmjuHb7PUKS6gtdAFQE7diPC4/wj8FX9/J1piFvvogW7PQQER+nEAt/fx3yx4IRPAg
         JJ0XE6PBkDv6icX0zwRG0LdCR3G7UJpemdizoyu4YaQj5S2Yd5V93/0dgBAqsf1mg+kH
         oyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNMTDEHVRjQTpygHIe83A5Ho44IgIO7zozSROm2H5dKDH0aqIJrtQiFU7KjqL4Hbg4Eal8DR7uAwscMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3K2Nxvy9J6TnDigsJ4ApZJZuDs2bwuKXiaBTZxS7gWdsvyeZ
	seaQEUEzoKFzCn9ROaBWuVoclDHmrzxFhLaZKnxK+TEOFc7I3t9RnFvaVHLTHtNVBKWRyKjD9iy
	OfXVqPA==
X-Gm-Gg: ASbGnctFngugn2RZvL3WUiHvnJYD1paLcSMrbOKBaYQiRjMblbjZXy/SUvirGDdUZ0h
	ieqH6y4IOee4sveYPQ7+uo7l//QKjDNLQi5+HeMd3yWEQNpYSsq34XB540666Ie3BeOj5j810tL
	o04PtT6gM4vDqr1PIwve1PbKDIN8mH+HqGhfMJAGRixTp0C5UOgBPDdz4qTJWoYtRkbzoJsSHS2
	z2XK5O9xQEErQmWwX2cAM9GrnPwjUEqI2fYXpbY6ifiXD5p1RcskLEUq03iyQk5FHfctPVnPQco
	5vfSNOhwRFyTpgGHW3Be6wGlXTHAdkXmNXGoz/IBvHuisbXM5pPQlJB1yquNHVtkMKE0Eu1oRBg
	Eqsb+WR6HWQ0XPkVuIdLoCRY94YHUCOp4FovSflmN9sJ52kWo38uSzpaYSLwb+5xv24Ec
X-Google-Smtp-Source: AGHT+IGxj3hD3Zl/SHYK+Ro/Yq/QeM0EbgWKhYdvYO1QgDwVz72yJECHm1FociRYklXqmpJxEGwR4A==
X-Received: by 2002:a17:906:730b:b0:ac2:f24e:1fa3 with SMTP id a640c23a62f3a-ac3314f59eamr858256366b.20.1742171984107;
        Sun, 16 Mar 2025 17:39:44 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aefadsm562407166b.8.2025.03.16.17.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 17:39:43 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 17 Mar 2025 00:39:35 +0000
Subject: [PATCH 3/8] media: i2c: ov02e10: Drop IPU6 FPGA specific handshake
 GPIO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-3-bd924634b889@linaro.org>
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

The IPU6 handshake GPIO signals to the FPGA on IPU6/IPU7 laptops and as
such is not a sensor signal.

Hans has a proposal for handling those GPIOs below. Dropf from the incoming
sensor driver.

link: https://lore.kernel.org/linux-media/4b87a956-a767-48dc-b98b-f80d9a44adc8@redhat.com
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02e10.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index db27d8c9f3f0b8dd6df6f9757cc674075e419075..29f9eec927b4660f941fa8e32249b321d25b7735 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -240,7 +240,6 @@ struct ov02e10 {
 	struct clk *img_clk;
 	struct regulator *avdd;
 	struct gpio_desc *reset;
-	struct gpio_desc *handshake;
 
 	/* Current mode */
 	const struct ov02e10_mode *cur_mode;
@@ -533,12 +532,6 @@ static int ov02e10_get_pm_resources(struct device *dev)
 		return dev_err_probe(dev, PTR_ERR(ov02e10->reset),
 				     "failed to get reset gpio\n");
 
-	ov02e10->handshake = devm_gpiod_get_optional(dev, "handshake",
-						   GPIOD_OUT_LOW);
-	if (IS_ERR(ov02e10->handshake))
-		return dev_err_probe(dev, PTR_ERR(ov02e10->handshake),
-				     "failed to get handshake gpio\n");
-
 	ov02e10->img_clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(ov02e10->img_clk))
 		return dev_err_probe(dev, PTR_ERR(ov02e10->img_clk),
@@ -563,7 +556,6 @@ static int ov02e10_power_off(struct device *dev)
 	int ret = 0;
 
 	gpiod_set_value_cansleep(ov02e10->reset, 1);
-	gpiod_set_value_cansleep(ov02e10->handshake, 0);
 
 	if (ov02e10->avdd)
 		ret = regulator_disable(ov02e10->avdd);
@@ -593,14 +585,8 @@ static int ov02e10_power_on(struct device *dev)
 			return ret;
 		}
 	}
-	gpiod_set_value_cansleep(ov02e10->handshake, 1);
 	gpiod_set_value_cansleep(ov02e10->reset, 0);
 
-	/* Lattice MIPI aggregator with some version FW needs longer delay
-	   after handshake triggered. We set 25ms as a safe value and wait
-	   for a stable version FW. */
-	msleep_interruptible(25);
-
 	return ret;
 }
 

-- 
2.48.1


