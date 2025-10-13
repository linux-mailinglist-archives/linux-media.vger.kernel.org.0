Return-Path: <linux-media+bounces-44292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F38EBD36A5
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBAF4188D22E
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4392D30AD13;
	Mon, 13 Oct 2025 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h/H2RjIx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F24C3090CD
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364915; cv=none; b=ECvOjmCaIhxlJSlhjEzuR9luUUBsLxE3RprFUgBjbNF7GL4RmwhR59L1qr0avSre2qQdQYhv4P7Wd8MDD7aTILstdV2Eio1ft0IaXtWHAsoAxTOc1ucG+NpUwePEU3ys8zDYuvHKx328EAaDAs2tsj3nulN4pw7QwAFHI7mZ/NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364915; c=relaxed/simple;
	bh=JPx0giLNBAPr7LhNStN/lfffepZheYGDJQPhVGzb+6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koOUFGDwtA0MGFYZ6Y5OzW75WCZXPQlNmhr3c4oG5wsePLudUdkEX9En4NvETfAPx1nS1GBAhh8FhgHwSzaNlM75A0D3l+OjMRL12KLXt3RIXoyy3xWPZdUKKOB3pkccb11pfKuswzDWJgWBVQAJtzM5zIygiZ22T1K2AxtkVEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h/H2RjIx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57a59124323so4619758e87.2
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364900; x=1760969700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=;
        b=h/H2RjIxmODKT6pS6/j7HGH0PivvkPqHlFtbwRpzPHaCFPJBX8vAcx4TvobJEg6GW1
         mdMuWCWSyuvLusid4Pq0Z9xn6VnjL214RA3NhDRMvUAoJRteM5ag7EMACNz0ObDyixBh
         Ih40Mwa+8GDJTFMrI0dtajJ0gYzo2p7QiCQXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364900; x=1760969700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=;
        b=EgpbteAA3qjkGjq5+fpwCu7a9HM6L0pzchB34lC/BB+snSlVa/Jl2VV4B3GDI7wnwb
         K3RFYB6y5f5afrQJ5C0QoY6XozV9KXiBuskVAGbR5YwLBtkFLtVzF0UkqSMiCIa+y/X4
         T2zJTXrgiEfLtZIqBus8oFAp8ecx94+/+4Tm1P9VWVsBXXHwJIuBanjnEhDuFsu3jmzR
         Gg61MNHHHgWW4jcPdWhBUuYpNgeq3PQoizaQDAcTRyyFct//aBWkdub1xdpq17mP9dLy
         4KVJe7LmCu6juO7E+ZNFUxJgZ78mzDRdek/a0fU8vavs8rWuEUeKPAXGHBS8AbZFWg/h
         vEyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnTWq4wRZCr02/KI6fSwW2XGSlZ1Af2kogsYtewq6zsXaT54kpQ6uArGWCadFUMpHLlueFuZt+Wxpb/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JpzD6PYsRs3fwrlXcLiu6QXugwAyIJNOqAPA7/Nl40TXmy7D
	TVO0qMjKh/8fVr9BvcKguhMnDTSdm9zqAXwP8T7YJ5ToFEYQgrPAxDVKTtzyB1bc6w==
X-Gm-Gg: ASbGncvXS4CTtU/TR1A32EXbMebkr4c8z9c+BjFLjvtYS9Rh6yEirNQioojKao8MQc2
	CVTn+54Nbi8RX8TOivHNd+c7LfIjLAga6cFEsKJ2/QP8MZivNY6KLCK6X5dbKvpx+McWoijwVc4
	l7axB7FV+yKv3rmV8HVe4VRWNGPpuozCok26ybhmz1rrgtDYMBtyZllJvNrdxMxndwyZ8ia+lPQ
	YfZlMpnVVl9v2wCgxyHougro/5TInQ51Ed7HiceMVcgbkPi4NasbQhOyr3P/Yb/Fl9lm8s45Sl/
	tZEfiyuz9+Gysws37czCob4nZHWVaBibiTrlg/Jdva4xejj1zFeHRNPhsd0iXs0BCU9Vs3oG2gA
	2XYCYFLEXO0r1m4QXv2HQD0RZG6der10UPcncmvwno0mA7z3kf2J5+Qwe1LmLWrNWw5c2wSCUC8
	bT7P0JnWlJG09j2xwpcg==
X-Google-Smtp-Source: AGHT+IEH9NSSx39JZw7O8X2sLmRDHl36VtDy7qnNgdDgO7X/hYoH/eK9oEmeokNHWwuJqGEVp7ffAA==
X-Received: by 2002:a05:6512:2388:b0:57a:6d7d:dd7b with SMTP id 2adb3069b0e04-5906d773bedmr6254025e87.8.1760364900095;
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:58 +0000
Subject: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov9282.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(ov9282->reset_gpio)) {
-		dev_err(ov9282->dev, "failed to get reset gpio %ld",
-			PTR_ERR(ov9282->reset_gpio));
+		dev_err(ov9282->dev, "failed to get reset gpio %pe",
+			ov9282->reset_gpio);
 		return PTR_ERR(ov9282->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


