Return-Path: <linux-media+bounces-44279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D58BD363E
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94C05189E901
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430523090EB;
	Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cdr1hIq2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD252686A0
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364899; cv=none; b=XCNUI1EizmHPe+YR3e1ymcg1LWVf6wRVTdWa8JAd9gYzypMbchJ9Gm3CFcJCHmUtObtMWMhLKJUNbttQCbgEdOCyxI+lRhEErqS9xvxDJPMFgPw+atwPK4v24cRhEo3CcNxWUDVtLRqRhRySp1eNJudgiFUCXd5g5apZuJM8nZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364899; c=relaxed/simple;
	bh=XGq0AYT0RAu45DkehU73efZ+CKhGLsp22KsMW3sZ7KM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsrRRDFAuCnL0e26+tyUuVipmRGT5nj7pOXASAVtWEIUIQ/X3DcToNtLJkp1UvgYeMpNVt9hK42QNdjyviwJ5FhBEZnw43iUBHb4jiccKGigs81wPBxcni6hQhe/QKW5ST8qh6dLu582vqhUdeH8Q20mgXR4M7mrpFc9iLwDCEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cdr1hIq2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-579363a4602so5034389e87.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364892; x=1760969692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw6YFePVdJ/w0HUJNx+YTiAEhWK3QpB9xmEBqnhTSDQ=;
        b=cdr1hIq2jUiqlyHGLSraYFrMIEgscJ0C3ydDRuFlZqjZJ0QmjNxOHzRpUarGhnONZd
         T2dVSrsiuzxzW2E+F5lvJ/ymxtYRYlPh6mixBVDiXF8lG4jP6uStRtyY/LWNKWk8jApG
         wMspUiD0gImABlPWlgz6zQlaao1am/6ZcmJpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364892; x=1760969692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw6YFePVdJ/w0HUJNx+YTiAEhWK3QpB9xmEBqnhTSDQ=;
        b=BJLZ5ShuEhfGb5rlhFQ7YPv8wxAsTd17n3Mj1mOsSnErqbr5ACvUh2us5LNFnZiTLu
         CmtBsT18UMWZjxVmM8n9zzQ96HTV4TYcbgt2de80BFbEWiys636AQ/W2kEMQfXgQvC+s
         /CG2ZLgETCqHPiPU/4ph2KcwYnosB0dgTAPD73K3CCVE4WbkQAJ+xMQU6iijt3gprjq+
         rp1tzGSAVrTQsxHcdJyeugd1puwiAEBO3WubMs0eSCfAWGho/xicvArVUUKXsJMNZEk7
         ESoiZIMf4pi5O8Gfj1IWW+Qtd5bBwFm/iXSrV45LwrqXhoYHT0/9KwDu2EkpxRyrjC/C
         K8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdqfYtzPAmfVfoAxvvMdtljD+Ii/Pwyvn9TSNkOWhxRu6CLNGEKVM/xdEerfn93EJ/XaTfm+jyFngnTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweaNRVBz6LBEhFtiaELF7fTZdvo+m/fTAABQ6NTGXaJn7oOyxH
	Cl64IOvJQqtlbV9tDTeAHurxeOF7n6Wb20hC3uuDXXqhLe98jpPxHhmKJrI9r3/T/A==
X-Gm-Gg: ASbGncu2YUK6UdIdDxkyIL8i/EkcfNtxuAwSw4skGy89ozJE4HYmnoboiZg9UI5OaCU
	kR1qKHELsY6THRWtGdZz0uVWvwmwrwv567HxiX5GCtz7gV/+ev/HLvWwfcla4P9XABRLMMDRiQX
	l4VD7LrBDk8Phll9TJasHDHg65NBdgbxQ5ljB6P8BlkxGKUlLokjB+GKUrHBFZTHa/lt5fMbmT4
	1PU/ZUhHyfDVmv0Crlk/phckH3oiPbd4TSZ6M3vqi6hEQW8eqxdL/N9jWJRiK8TMsX5Cd2wepDC
	g25Cgw1U51brJWLbf4CZ4js4DuJzUhasimJrwt1wrKGzcGsaFxNVDb15D6oMbbGrHvPA8Bv4VZC
	WCVaThk1rQaXK4MhOflURpHWER7bJZEOnbm/2QyeSlU6b8wTFKGvjmpDkEknPlZEHvqgaWnKi6Z
	r6LblzylQfJ4vgCQEQ8Q==
X-Google-Smtp-Source: AGHT+IEKVe60oXFEuaV/5sAfkl2vR8IvNhsEsPje9O6F0QVcXOQ4CmYWAzNOjArzbT4yXoFh7KUNeA==
X-Received: by 2002:a05:6512:2309:b0:57a:baaa:394 with SMTP id 2adb3069b0e04-5906dd51898mr4676162e87.27.1760364891849;
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:43 +0000
Subject: [PATCH 03/32] media: mn88443x: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-3-2c5efbd82952@chromium.org>
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
omitting PTR_ERR()

This patch fixes this cocci report:
./dvb-frontends/mn88443x.c:698:3-10: WARNING: Consider using %pe to print PTR_ERR()
./dvb-frontends/mn88443x.c:713:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/mn88443x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-frontends/mn88443x.c
index 7a58f53ab9996031e319711a21b1a8f1c13abed4..818c4e67364c7c6ec2bfc17f21e2cac360f6bfb3 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -694,8 +694,7 @@ static int mn88443x_probe(struct i2c_client *client)
 
 	chip->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(chip->mclk) && !conf) {
-		dev_err(dev, "Failed to request mclk: %ld\n",
-			PTR_ERR(chip->mclk));
+		dev_err(dev, "Failed to request mclk: %pe\n", chip->mclk);
 		return PTR_ERR(chip->mclk);
 	}
 
@@ -709,8 +708,8 @@ static int mn88443x_probe(struct i2c_client *client)
 	chip->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						   GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_gpio)) {
-		dev_err(dev, "Failed to request reset_gpio: %ld\n",
-			PTR_ERR(chip->reset_gpio));
+		dev_err(dev, "Failed to request reset_gpio: %pe\n",
+			chip->reset_gpio);
 		return PTR_ERR(chip->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


