Return-Path: <linux-media+bounces-44275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C7BD3605
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB5774F21E1
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4DC306480;
	Mon, 13 Oct 2025 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rhr3+NVB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37A626056A
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364895; cv=none; b=LBIsFLV8FUY15Gcs7bLmgm5x5RxcJ2lzljfGsIWMCVPecJSpiyessn+G7b40emTAgAI+2FqqtijbPKHm6worykbI/oo5DZsbndMRckrarBL4XA4SGNLQ9yQ9rNINSLS1MnpWp2WHK/p8UEAymq9BbD9FOPjSJqb17H2LmcZWIyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364895; c=relaxed/simple;
	bh=zXe/wxZ6QqQI33wXbnF9l5/N0aHMRBU3Aplzl5QTEmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYz76Z70BWOaN8lWw9I3KJU/fJu2zFbJiN6W2XraOs2sKyRsoEoAXpiUs3jBxxfv0HTgB3BVjCETbU8rtzg37zKsBDsFFNa79usyvjt0ynI1gMCR+O0UVv6ZlvGvAJa1aEQ90ClOsuGQcWGAUJSaZltllYWvDfm6snUe3otjPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rhr3+NVB; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so4306478e87.2
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=Rhr3+NVBtrMqtmOV7k0EuZgzP7FBtL4IHDB8rNFTe1MTtc6ml9ImPosLhWFvFd85PI
         xiwBZZBfiDQQSy18KFqn5ocaVQRKWax1tJDtnPSfZFk644HXmi2CE2VYBLncEibu8Das
         f1P1HYqg5REIDaz2M8j9anQW65FZ16yU4vLfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=Ye0DI04pXjLkIILSdH+H+naoF5LGkpLwOFuXJ1dmu6pEX2FR5S6MXBkGbD7Ww9ov0n
         DrYODEygZtnN1JRhXN1C55I776rGuEW9kHQQ8xtz+fnE6jKsFJQ3MSYksDJpXivD6kVn
         mpRcv93f3Eh85FxNOEbATLAWByEprrKeiDnVnhIbHTqmfAN5GJSM9O0yDlCevfY0KVoD
         36+aV6T8RnSqItCIbmBwlVSkjN2mFYVgcvhYV71lt3A+r8KVnEge6JqsfSg/RNlP4d2D
         Ql96l9MTVZ12fqqOLtlgDE8qpyTvjTvDz5MfDrGv6Sm8zlLrvQevSLSUP1ukqLlpCgpy
         0QeA==
X-Forwarded-Encrypted: i=1; AJvYcCWN6YoTZdBmhm/lSDkriKbNnjTuODCmak0gl4VtLkYNQfBsvu6mxcDuysBkqTJ15VuHxT4vRYkVp6aXTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuObLaMelAV6fnetoaCWJ/+ktbSMAHn4gtcqd5K5I/Yu9tu/m
	F/c7rxOYBNFQk4Gu6UiIuF0cqDLRkXbIl0cn/YL8KOLRqBbr20SsafYz2126e7NjFg==
X-Gm-Gg: ASbGncvM+rU8jRb3ImAbyEuFkNSYNygvG7lCgI+a8btcDQPWYr2nLPHeKhMhnmvAaAZ
	W989b3tJj/Dx+0CsJhTAhe4JSsXjaCDTaBR53Qnmp6xrAWoKWugRuBCYxJmbpTG9O82Z7xIzu/b
	OK0YWuquh2E/x4mv95+qUtaCLsjMVTxmjaVcz9n1nAvXwwV7RPMEyQXb1NfiUcXu+RFt7e++2aD
	cN/y5/hMUelBuW0rPt1igkg36X2hNL2Y1W37859EOdxhT+/wRAQj+cN+f+HD5TzczfOoFpZtBHQ
	IWzyTLI2cTGmRZPb5M1VJ4MqFKu7RJFYAPVdyuexT2HSrCGqyKMflS1lhLmGfE2BX7McDHvaNaW
	Oks3ruwp141+8IYT+eFC+Ayc7pRaI7Xnaa7QHMzI5j/R2yPPdHN93Mc/qjnlOkuLDOC+jyYYNzJ
	4CfSaNADC541BDaLhXN2PtS8Nsy3Wg
X-Google-Smtp-Source: AGHT+IG2QYB2+56krLBk85ko6pGpX0D4THrfkt1zz892JTpjDOUAww9G2kctwSbBGnVpsEQJrH5Ywg==
X-Received: by 2002:a05:6512:3f12:b0:58a:fa11:b7af with SMTP id 2adb3069b0e04-5906d782160mr6219748e87.14.1760364890722;
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:41 +0000
Subject: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
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
./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/input/touchscreen/cyttsp5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
 
 	regmap = devm_regmap_init_i2c(client, &config);
 	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap allocation failed: %ld\n",
-			PTR_ERR(regmap));
+		dev_err(&client->dev, "regmap allocation failed: %pe\n",
+			regmap);
 		return PTR_ERR(regmap);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


