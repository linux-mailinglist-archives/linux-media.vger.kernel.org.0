Return-Path: <linux-media+bounces-44282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3742BD3653
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A756E1888E12
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B30309DDC;
	Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JJ7VrwwD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737B2F7AAD
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364903; cv=none; b=UeS89k9wdcWGeHqbbHvQqPL+GKzIspUHmlKU4kF+acouInf1krryDrbM2ObldurJYwmTcBKtYaLqmFap9Hzkv839AzkjD9tPRsyhEdLNvAPR5tvZG+/Oa+OEqAfFtq5D04U7iUaj+x3cdg1bAWP39CxYPdRIoI1kupyUERnbfKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364903; c=relaxed/simple;
	bh=UX1suooorPOW+0wpmL90mAmcoe3Uhg6r2V2q7D2u2Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1gBVgetE/iEi0mbvLxFXnf7doxGDjBynk/iwRybw0/RXR1OXmNsSaOM/nvw/ZsJEh4N0KfvywXGwesE/cBGBywxSzQikFKvXpbQin1bnOramAGHN53VUQpHVNwhQH9fSjKOfbp85SVEA6nC5ujmKf7CI2onP26F/s6Qi/5ksGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JJ7VrwwD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390166e87.3
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364895; x=1760969695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtOz2kIfaFHaB3b4Ap3srNj5aje/vDsBh7jaOB3MjlI=;
        b=JJ7VrwwD0xTj5oFHoPrYY1A6v8ph2F7pkOAIjLne/o0gGf6LpMjHxnpC6GQMLZtrZs
         rSlaHRE/pnFPbGOxJNlu2dHCbhHvdUi8FjenhMmQUnTskhDtVHHeqgHHNdzpEiAvItoG
         cffa5rRzoeHwetqgNvQlPKt9KtD6gFapQkizk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364895; x=1760969695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtOz2kIfaFHaB3b4Ap3srNj5aje/vDsBh7jaOB3MjlI=;
        b=pACt+CDqSYCekEpeKrBtRdpuYlDTo/+edFM74TaKTDA2V4xyIgDBJuD1vUw5egadxX
         iZ0JG6O1jR0tSpyU7uBP2qqN9ZVIJ6kyhmA42yBzDYbZv/n95memlHKKNLDO6g/plM//
         zga6as++oChUdLunETtxr9lvejQjhskV3fp66M6p6Ckq23rGMgutyW42XMjGV6svVIxF
         cz+DkkGYyJHP8e4zaob/XiAou3zslsb7pwOpCiiLwELiR4UjFW6Dy2xXZ/1B5+bxYVVU
         KqngN8J3E/XVIv4WhJnpUuBfoWPSHJTomxkhPwlSWVWU3svZUneNovfzq5WA1qolyHTy
         xsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQkwkzp44eBhFhMI8ncMSCgOLzANyGr25VgJaSWwBNwAayEug84i8yIQWDdXb6HP430kHPxSUHTutKdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKs5ojN/z9brtBZp21pZct7xQZhunWdyZR71klsaYaL+UYSu6
	Zu0/M+mM4op37kjzMw8efHP99gtBLF3IQXdCsRUdnOf9RtT7wgWSGddr8fhLXN1MJg==
X-Gm-Gg: ASbGncsGaHPogc+MkVeTontgADoyRtuAq9dh/O7lermVXmwEF/iLlfuHD0dt9E7zq+V
	FklvSciIH4gV8AYGfXhExZxbp7kbyVharcM7K3qj/svpzR07NemO+E6axlc7lkcDGB0mt0dnM/L
	UMR/91YAIsFgtmoCQcQthsrgUDnF1k+UZ590iieNGvH0TdJgSaSm6EUYZLGjZHroyPLVEeQbLx7
	KC25ymBeWpTHQqMJ/QO6av7A9D83ODIMdW9YbhhvVFliWz8CohnPDiiTj1EbmiO19jiKn37uGZY
	6e/86pI14LmWxrapA965aoUAAcXDqI64K33GrqkFChe/x559fb2ejtGutfObV7pAFAKMhNxmPil
	nSEohp6k+ENkUw7twwOy7JvRYK9+UYmcbwKXuJuwUsOPsKX4WQ+gVRnLz4d6Fr8q19J7b2nZZGf
	Kiip7WHmJ1eEzBf/H+Lg==
X-Google-Smtp-Source: AGHT+IHgj8C7exDJvyPI6OyYwB6RVmsRdyW2/dMuvAdiNw0oCeaD3q0MVrstbMSTaMktl9t7RYe3uQ==
X-Received: by 2002:a05:6512:3caa:b0:586:8a68:9c4d with SMTP id 2adb3069b0e04-5906dafe47cmr6138791e87.52.1760364894546;
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:48 +0000
Subject: [PATCH 08/32] media: i2c: ds90ub953: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-8-2c5efbd82952@chromium.org>
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
./i2c/ds90ub953.c:779:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ds90ub953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index e3fc9d66970a762d284955f14db48d7105b4b8c4..087bb4ea555977692c66387a43dab54c12134e60 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -776,7 +776,7 @@ static int ub953_v4l2_notifier_register(struct ub953_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog


