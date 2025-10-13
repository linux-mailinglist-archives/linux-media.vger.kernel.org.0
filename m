Return-Path: <linux-media+bounces-44303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C9BD379E
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8D333E086F
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1594A3093A1;
	Mon, 13 Oct 2025 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CWFXNHcu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF1309EED
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364926; cv=none; b=VkWyX8t6ErknAJrnZ1j9x0TkpUskk+oTiKISd3/xF6zFJru6Zyh50H7JTX1MPoVOXSz3/9vDTUsyA4rJo29+nOPRFSbsY2asJJk/hie+EsMKB788QKNDQlIxojUVuhOnoDds2igo0K2a5Qwy1+QOGBPBu7SBUqEri7lWTTRcmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364926; c=relaxed/simple;
	bh=13OLz3ayUSOskJ/koG5Yo/gq8bsy35PH0jrjBKE+QnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ibb7F4r7vjgRpKbUUqAs0iPIlyRLeR42mYp5PUifV2/ExKri5Ebg9EXM8wM+KYRz9D2Jv2aE74dVVl88quy2oV2TCbrK6X61yHbkvyOZYsPTeufYJMZmj6etvjVBKh42xPzWOHXwE1XVfLQmhR4Wm8ByWLHaknP6c536oK+WnwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CWFXNHcu; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711856e87.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=CWFXNHcueXVWOwcAoVQJ8klxj+nMfw1192cgAlKmEj1N2WvAGAM0ofXrCDOLJv8fKU
         7dEm4tqJk5clyD9k3btKHvw2aKJ8ZDJ3UJAOmMQNTKmtokguSPbxcMO4p04YaaEC11hk
         KQgRH3AZrgSFg8NKTN87vBD8y4VNvhJ/vd0IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=w08e+y40yT7mPKm7tbDePXTxV5eQ/9Q6og944+T9aM/TjoJPDemjUvA89r3pcSW5uR
         Sr80npvky8lNIfusKaAHhc53Bgsv/ybzrw3xHeEksaQnkaPL0K3iNU2GDvM3GQmbYmqR
         en0a7b5iR150rIN0gmtzQ1628mFFCpDho8Xr+BQn0SZaoIFRRI+fOl3q0znc2w3UUG+N
         c3MKbv+/Nnw2mE015jpJTDK8ltXiwXww6/NRk6P98Wb5+/uwjzcfEMuYQfjDP8AEoNSr
         LKR/drgZhnQmETZWS3jujJvhpPIr3+aKVQN4otQM+mKRJq8+KmAd39eXFwThje1OF6Bx
         KZEw==
X-Forwarded-Encrypted: i=1; AJvYcCU5fXYtOBNIefpDc0Iy/pSf2Par0zWHJX7IoqMc+kkXdgla7uhVB2asRpIoSsOri/5IrfMroaydJbeCQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXZRyFrWYfM8lJKuEqU68cwbTJ5uRWWiyV8MDHB5BIE7Wzjjs
	dtkBSbCWsTy8yqSP0Ltra0R3ojvE2IZSTDAuOSEOEGxcEY92+5EWPr4cvdkFCeuqZA==
X-Gm-Gg: ASbGncuBRkhyDuzsNVzDL+Kioh0LlTNiIQesKgLsNrR1FfArmyMmNmVaksm+CdW1EBy
	fUmG/vz5aiYrXeshyl+UvgGASNhxbF6dj5csF/xswUWbyQlT/cMK96PC+6PTWvqCAM35nY8G3Hw
	kFgCyNC8+m4snsxnyKDoHGthuB6lfu91/5UOUzpZTkvCv2YP+MLeqlOh5/WMyx9YNgGLVA0Mx9e
	9xyGNkWeo2nHSVyaN++3Yi/0/SleGPoQmzNWV36vVv6QtA2pMddSFPxKIY/V4hwWCcIn+PAZ/sC
	hUTFx389JBiY2dJ09wo16vINWtbm66c4Ku3upaswwKqYzQkl2cXy2AvCKMW6h3+bZc0VCfpEs6b
	jLLC1rNo8kjQKK05PfGFOYnBSwxfca/hD1OLzi5xg3IS6PAq8dGfkUDpPOHjUFfk8LsDn+LXrNh
	M1BNL92nQZKM8VsUwUCg==
X-Google-Smtp-Source: AGHT+IEQsTtyBvH7wA40gxhWBW3oPtbImGl+YQPk0oKm5qusk9oOE9kCkc6erWew+lMrb0jYwU0vow==
X-Received: by 2002:a05:6512:b19:b0:579:8bbb:d61b with SMTP id 2adb3069b0e04-5906dae8e6amr5727710e87.46.1760364907237;
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:10 +0000
Subject: [PATCH 30/32] media: ti: cal Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-30-2c5efbd82952@chromium.org>
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
./platform/ti/cal/cal.c:1111:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/cal/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b644ed890412104887ce3ec32b5024a02a9676c8..3e25ce0c3c3bdce3434d19c416481bd8d8b838f5 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1107,8 +1107,7 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 		return 0;
 	}
 
-	dev_warn(cal->dev, "failed to get ti,camerrx-control: %ld\n",
-		 PTR_ERR(syscon));
+	dev_warn(cal->dev, "failed to get ti,camerrx-control: %pe\n", syscon);
 
 	/*
 	 * Backward DTS compatibility. If syscon entry is not present then

-- 
2.51.0.760.g7b8bcc2412-goog


