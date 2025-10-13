Return-Path: <linux-media+bounces-44284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3EBD369F
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BA624E4C53
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224D5309F19;
	Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fxb7gTr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4702FF642
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364904; cv=none; b=nZyEXhPqbqD/lg8jshPHvdkLVUXHEpkBghB3B7JXC+z68LbSJLM9XhkOVWMmbs4YHjZ95cdFSaDdqyeqtXKXFzDVOG6ZUotYtXfsIJcXIFxtGZ0SyLt6ew/fC+RBZsxfNlVHbgghs6WYD678ZINK707rR+GZf9SPNZs/ci6sUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364904; c=relaxed/simple;
	bh=pmGQL7z0+U5zmtLLLSlcQCPIG/Bd/l8NvjVo2rUdVUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1GFOscXdRKQ5Qe2JE9Y+0t2GJPB/thB0q1FmdBeMYF03w0x1IQ84fcjzFn6PfEGHDOLoTSimpDQEfyILHDfTf4uIdCOpzDwpvTh/+eF45QCgMS5oQWonLiwMgVAPG806rfriqLCAw4Ev8t5vASfQmgISTIoe9+/WbLdvrjYV/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fxb7gTr9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-578ecc56235so3649593e87.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364895; x=1760969695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d45bLyS6OUqH7RU6UEzRVYwiTiUKaQxVUhJVNzyYRQY=;
        b=Fxb7gTr991GUn7uo4xSbPt8iwdtilosl8pAeRTMnD9Lm278xC7w4wpPaQzXgJFzmbj
         EfLCigGgxPUX3e8NU537x38CTPgPQciVPwIJR6Koj24ByOoY/scL0Gw2+yAEWsnyKjPf
         GBZGSM+uqmIf2Cnh9Wk3lYrSpI8ylXSx3yDxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364895; x=1760969695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d45bLyS6OUqH7RU6UEzRVYwiTiUKaQxVUhJVNzyYRQY=;
        b=ZYUxJ61567zrX65DQSahGuDjAw+9HWuYbQaOCs1JZSl0C38ENKuOOhMundaEpumHNW
         v/ZvJwnIbcdNnB/yAHgv3c8wNXiEsoI06bumVRUipB2Amc8AkOtRbov4fgvVusbBHgUU
         npEjLzoTuj9aQvJKiC8XDzzOXKqPzs/DIGf+AFwRYMrQVycwCh/jo67ocqbi5mnrlanc
         EK8FvF6z97uGBVehhO79EqekO9QyJk2axv0ezAZ6RTqDkcoxCQ5vEslOSrlNOqFByN4M
         dRKOxNSuBRhAWWHLoGJmChT31kuYAfaolLEHQk3Nvq/KNE0BVE+lkAZ1K//7bleBv6Td
         Y6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR3nlpYKB97WdYxP9sHGj+PgRJxSUL+/P1Ss72zkoLRmPqVg9yDr0a3ZPAeQXjFKi5t7SpuqMMrECQng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyWHmpeagPRXQDJQL/EgPATAUVKsKudPVfMmokBvuX4vrSTF7Q
	bEafotzumnFbH6sqxZfCQMDdxflqRBpOWaHCo2CX8NwxikK+9vCbRu07KJMY8JCWjA==
X-Gm-Gg: ASbGncu35kSt30JJniIguXVpmNa/3KRD0ussFeD1nrg14RGedlBP43cIFu2hknEy5U9
	706z7vJ8BoF2cjAe1CHZ9ylVXWELlYzBEx3luM5FU73/X/z535SP8T0KLRYINAoOXBMIvqikgf+
	VndKsK4bHANv6lZDDOxUUhwU3dcVR1KAd3YMCfGyhIuuSNzlFRy5yWag0IJFiX1cDbHD8O0Mf5c
	56vdUsA2l+WZCMcxeKpWVJ9sHQtrs1OmLT5fwGVou0vJSBfkmu65nGG3c6iHbVZGOw0SEkgUumT
	MqxVB3i0ZcPx2qGX4FXvBu6g1ZdcmA9XRr5TGT61gvcyVl7Q4nL4dxGo8t9IGLkzhUjQ0nFOiZX
	yqQ60EFYaHJdEugaNv+XQPZrh1qMHlNjtcTR7d56+4EBoUJmwUSRYq/TDHnB6KcsE14QKBm1hIe
	nX7Re3Vy3pdEV7IDC71Pls2eTF5rxB
X-Google-Smtp-Source: AGHT+IHgHmnkM5LbjRZWE+rax/DE80YYaaKxmy85wL7to7vxyhdrC5Nac5EP5ziTh632ueTTsgzZbQ==
X-Received: by 2002:a05:6512:2388:b0:57a:6d7d:dd7b with SMTP id 2adb3069b0e04-5906d773bedmr6253929e87.8.1760364895143;
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:49 +0000
Subject: [PATCH 09/32] media: i2c: imx274: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-9-2c5efbd82952@chromium.org>
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
./i2c/imx274.c:2038:32-39: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx274.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index d86d08c29174584b26e109a7858542313219c19a..8ec78b60bea6d47d2088b8251b679224e0d34980 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -2034,8 +2034,7 @@ static int imx274_probe(struct i2c_client *client)
 	/* initialize regmap */
 	imx274->regmap = devm_regmap_init_i2c(client, &imx274_regmap_config);
 	if (IS_ERR(imx274->regmap)) {
-		dev_err(dev,
-			"regmap init failed: %ld\n", PTR_ERR(imx274->regmap));
+		dev_err(dev, "regmap init failed: %pe\n", imx274->regmap);
 		ret = -ENODEV;
 		goto err_regmap;
 	}

-- 
2.51.0.760.g7b8bcc2412-goog


