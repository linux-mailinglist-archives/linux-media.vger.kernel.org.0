Return-Path: <linux-media+bounces-44286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34CBD381B
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FD274F60DB
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CD7309F17;
	Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NnY5/nQK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E6307AF0
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364906; cv=none; b=Li8C45u82qmbhVgc9IPyqKU5E8fIusQV9gIdc8EqRET3g4ejWEJwVNSel5phT8dwxynT4lfuwnDoifbK0g6z1d2drhw3WlxnDmYdKltP1kopa3MfKu3yDp5ft06VcSEIO71c+yvdMuMpEUAe3FJXYYJPAmncNdOz0i5tVAfWuKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364906; c=relaxed/simple;
	bh=WDrjkEkP4ilF+TE+CToBnzSz7Z1VpjDMiO15zLgsPrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rncUnIaR2ZPwv84GcGVKAWo0xJV6rehnHvPVhWwP2aHstLiHn5yPEKNjtJvGong5I89XMM1eqnOi7NaulkFmQeIZgzKFM9Lz26/qilIWHk7Ncf9AvGV+6IcGwj68Fvs3NMWE+gFq5ghp3o7kqvX3LwUxpZu8jnU8EBfLuv7Ng2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NnY5/nQK; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711512e87.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364896; x=1760969696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=NnY5/nQK0GQNwo7L3DyKxl5JWRuCtJLmvEwsUp7+d3aHV4XCEECynsTZr/b/GROeEO
         hnbIsFSp/iULr0uwBHswBG8Nm5vDRCmBPbQlDn1mrzCDBjOJvwKGyKaGaGsyZ6Oeqvn9
         j511y1phO7mAR9hy7YJdoMv0+DpC9c8qD4FCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364896; x=1760969696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=Btuoos4Z2I93J5zHgBxjpgpWEq95PzVdhtL3nNNiGIO6SaFuUtRtZfrYFsK30RdLxN
         MBQdYRwCml7sOg/5vUZddT9HcFt4Y60hWsvloXD1cJf1LSBr4Cmi88qxdtGFBHdt2fBv
         x3l9egiBdtFaRCQ3NSIHdrPTizrsRsI1DqInl/rfikl39da7grhSVVGR4ap8ka0/V/ut
         Ds6k3giYGwyT/uNrFCULV0U17tV6/kfq8ze76sRgZX1Uel1LIES8zfI86Kc/KXd3SeHW
         MPM+5sVO6tyHCP92OCJFeb7J4Zqz3zofilUNr5O5wBsDSttLDhd1SX0c+SQRMXVZ26B7
         ev+g==
X-Forwarded-Encrypted: i=1; AJvYcCXxC0y5kstxUBBQB1pchCgLmPL8XiCYp0Y5/emKxs2mVeXWxyyNL34a6iZcZ7Ls7Fc8dfI6tO60s4Tv6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZiwcmE1+GFg/6W/cshc9fNvBBlOt4YU/9anQVD+6kUhZE3XPf
	Uzx1YZDJKmac9bVS51Ch8yJqVfEKsnTawmG7GQ7EjNCy6Ycsyq59KH/LrAw9KrS1eA==
X-Gm-Gg: ASbGncvNEk5aWFAiWZl7GvbWwUZs8cIZWYAF2DnwxAiq2mJvqURYHUb3eySAEnFsrzL
	e5JCiduqyvBTx/oiIvac6D9vy+Jzz+mSKXsjiFqq2L/yG6kwJVpdImDPPdoGzZHP4MNybASNciL
	Ygfq7ANSuK+jclppkK9yQ8ssSIh911QWGzood17dAQOWcZ5bqnGS8gI+ccDOTMyTsToTa2qCPs8
	eOhlv3dEQ/eX2D9cB9uB8pYhU7W36BHcv6ivuhMvCgoWefVNIRkTBsPwl+aTjy65QoC630rHKuJ
	HfpE3jZexNjHvDBwQ9d72pneH5M+M8gdDmpGqca8VhQLbmMOKeqTu7woparzJUGzajatq7PkicA
	Lt3rxvCyOmP2qWKnIZBbazq6Wv1Khos7lWVlY9tSAuUwY1aafHGBxb6bzaRr8yx0aKuF3h1EO5L
	zoBbufCi6MKBsSQN+O0w==
X-Google-Smtp-Source: AGHT+IHRStcb5/UNrBSpVyOQrSmM6wvY4Sq5I8E4EibgafKAtbziLGF8qFxpeqrq8sYvK0QOKhdKZw==
X-Received: by 2002:a05:6512:308d:b0:579:ec3a:ada2 with SMTP id 2adb3069b0e04-5906d7738b2mr6908772e87.4.1760364895693;
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:50 +0000
Subject: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org>
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
./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx335->reset_gpio)) {
-		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
-			PTR_ERR(imx335->reset_gpio));
+		dev_err(imx335->dev, "failed to get reset gpio %pe\n",
+			imx335->reset_gpio);
 		return PTR_ERR(imx335->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


