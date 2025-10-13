Return-Path: <linux-media+bounces-44298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1238BD374D
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA0624F2F71
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E2F2EDD7A;
	Mon, 13 Oct 2025 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V2fql6D5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8093093C7
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364919; cv=none; b=aASVC1nq9bKTY75OdAN5b875WVGNF2WcdU1lPD4gCBNAQbogr4+XGntxT9IBuI1FjAl1rqgU4cPn8HMaOJPT6zLi/InRZ6nTt9kppxWSNBKhAf52BryEudimgfoq1bpt08eHWFJrNThcRe6v5f4k395LFtxk4T0HlP2wgiBgUjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364919; c=relaxed/simple;
	bh=8RLalehrPbI0nVV069+gt8p26w3tCNH5+ujATmPll/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlstQ/dpUaEm4o8T7cGS6MuMEEFOX8SFAHRkMl3/VGzcRrqt1AOP3boN5h9s4eulYfBZ8Brkg+DtMQk6YqC2oFxvqYVAIdXrGG8acpGtUGsfcRG+fhAM+mX8u5Bv9AxDaSpokltXmw5LdRYihpWiww0Hp08cJ8MvU3dx6bX6m1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V2fql6D5; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-375eff817a3so41582141fa.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364901; x=1760969701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=V2fql6D5U2BZb/+KU6vl5cEnZ/gS1gTOUzW//ljbqC37R1VI1sE4eqTI9I8mJ2vM24
         vc2PvsrBEAV1In63fqLhTPoy5zQg1MUmUrjyzSKiPS1D4+l3cCk8weIFoGspp67CUkRG
         A2lpZVm+mcIOJasf9/3INfvQf/15M2nrhaHak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364901; x=1760969701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=cteFimaYvTjHxwUMSLGKz/fUwW/l8cuDQrIqOyEo/J5RtA3L3fxVGaRL7KUyE4k2rJ
         FNDN/0EEvO5IQh/csg/0qKnSxBsAVivQ2Mvs/w2WB8zfI0MYnEN/A/uP/faiX2QhwiPP
         NUZd4wwzD6/rBdNstBRm6zb0QHd0X5CvpzJrpdfqF7RtNHH8hOiiE+9Sk8WiPKYA8ZIK
         g9gyDlQCRoZChRNOfOPsppJ3pqoFtlqSFPG5ejQYEnV8BPvvuCuFGgr1xSiKaQCSJ7wa
         rqRExQtdNFckUORes+nOSQgBzB61cRuZ+9MCqRLIXNdLC4xRu7uCvqfeces6XE7aiSKg
         gryQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfAg20QQsusrChCnNzQIZA1dG8YwNbtxpqJ0y4YKsr33H7O++Wt42WrkO8nfvIA+BtDynwgFmHXX+HOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5YVBV7BG+6a3flkn1hlF5V0iBwOeF37sCJEzGxYi/jRHkL5Dy
	Z+b2su44pwYm+nE+taDJtfaO6mVwADdpJ7anNpYzuH3CATDqFgx2DhspJzdW1cJOuQ==
X-Gm-Gg: ASbGncvbLsG344TPJBxot8+BZ/jR+0ovcr0ieQzkdTiDar+Tbiw9CgLQTSxYTraRKNq
	dLd5oHXNT/PUHyGVf2i8Fcj4hHi9T/GiQYmd3TStbF8mhARgoP4EkQtU4miQe+yBErzAs8O8Hqv
	+7W8I7VMZDdwZ423fkBxD/EP0Ck6qUyGN+buuBAw3AzLly1DtKsy1LHyqM+yRd3qfuSqPZDa1BG
	ZGuMYcdYMDnAr2YS09dQ2yq0ZYTP9nYxf5k85mDMEJmFbnGRNsqjtur8qpMwwh9XOl/924IlP3y
	h3SgyugmVkfqFcGc+xSUs5jdoW88XRP1or+3S5UWtl4JAyzKrYYyvTAbJgUhkwrsXoqTwP/JYw4
	89S1662MVCMwrs98+Ah1cDNmrjHsGy9yUKoLOI8uNYh6Orz4ApGefAz7GKXFIWglk5AEn8rgmxV
	h77MPRKdoCv3zkoNnynz/egoSsT6Ja97DprXS2Vxk=
X-Google-Smtp-Source: AGHT+IHaXYtEGcC0lCeqZAPaJ1Eba36sEUnGMYsHL1RWVLLcW4i0NjVadIfSh/QN3FLm+/VJwSwBng==
X-Received: by 2002:a05:651c:3617:b0:36d:501:76d8 with SMTP id 38308e7fff4ca-37609e5e0b9mr54139201fa.31.1760364901230;
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:00 +0000
Subject: [PATCH 20/32] media: i2c: st-mipid02: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-20-2c5efbd82952@chromium.org>
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
./i2c/st-mipid02.c:751:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 41ae25b0911f02517f137d6b5307d13154266e07..4675181af5fb00df837c8b796fc32d50e077a480 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -747,8 +747,8 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	of_node_put(ep_node);
 
 	if (IS_ERR(asd)) {
-		dev_err(&client->dev, "fail to register asd to notifier %ld",
-			PTR_ERR(asd));
+		dev_err(&client->dev, "fail to register asd to notifier %pe",
+			asd);
 		return PTR_ERR(asd);
 	}
 	bridge->notifier.ops = &mipid02_notifier_ops;

-- 
2.51.0.760.g7b8bcc2412-goog


