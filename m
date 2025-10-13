Return-Path: <linux-media+bounces-44287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6969BD36F6
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E01F3E08F1
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B066309F0D;
	Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XEDSeT2F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699783081BC
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364906; cv=none; b=p8E/I3uAEDCC840q4fWDjlJbSC5qLyiqS8VjgiT78Or9oFtLlK//uqBP0SN4nPMiOevA2y/+a27VzrRKx+/GbjK/wQ+5x18FwaqQzY9KE5jpEFzv8HkHOyT4MImGri/jgQ/yiOCDmJW+7GeAOwksG8fmXrYoOa0GFG07aGTKoro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364906; c=relaxed/simple;
	bh=PoPtHLGESxHSet6DKhSq32L4rnbboY4bB4TsHRSTKBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RspM916XdLUEdsw3Ly92AKuId36SQcPrOvcYsHmDQZOYm1wYmw5BwxmFVFZDhAv5nTgPlbbcEyJEVDIyTaMQp9aaw4VJTG7qIEOY7diN3oMGbVoFaF5RplO0kJxGfbdGzgRks7H4YanewdAkNnTQVUsLD6qmYJRASq3DPLIIlXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XEDSeT2F; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so4896090e87.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364898; x=1760969698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=;
        b=XEDSeT2F4b1hw1txr+gV6rS/DIfjBKvYcomtDjmiUyO3XsaM6alkVnnzztSmS2lcii
         thfDO9/Dy1DHTHohdQ0owiRufRA+ZVIQyS6DByElS1aTBixn4Xs4C/ZfKl7SjW3yr6wM
         cFcxtmKvMJP0UkyDNXKag61cJFndIwpUgI4u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364898; x=1760969698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=;
        b=I6RJro97TYdyn2CsvWMrSV2eroZNage0gJM6ZYwB19MKUVbJiZ6lu47cqbmqWHFW7J
         yb48Q+IsY8fW1Hbu+iJzUFrb63qUiXn3Nm0SbU6ASKGB7sCUKiwdYSnJOLX3vJ73C2lc
         8UtnxRED1J5IezNP2jyYVsAUB4WEZoHBKl2Ymp/2oJv9Yn82hKnp8E/TAiJV9TvVogCI
         5NKkHMjWXe2iFuib731eS4leiS0lrRRsbKuwUGHEZ1Jg0YwV1KLs0TNxGxJV8JKd09ra
         14xLG/T7o5CsSmTdgxq0dABcdOxtcXNNJXLsTM1ePjgtzAwnvAnAPP3JGQq+NaXOqz2z
         qpww==
X-Forwarded-Encrypted: i=1; AJvYcCXVEvFEbpRptUYcCMAzEtEllOO1nm0HcYM6fE9Al99lgEG6NntSBRDkKYsy9Wtd0uMPVUp78053q0cpIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXN02mwrHepD5zGO2cchHnuNvH4rSNvkedrSp/SYR0swMkTqI0
	try3O/5yZJJo3TwKzuX5lNivOgGpkVy4CE980TmqHp0nXrUdGlzfBytmlLFihXYx9g==
X-Gm-Gg: ASbGncsC4zzOWOfSRG/Xpuf16WXfaIp4ZL5M/wDOgzHJph50YAvnQSyRziOvn1Z+shj
	KiktOLLbMQ8CO8KWLvmnDleTeYHkM/uupQLtIo6TP/e1KtZtZjen44sHS5uAUHtniukoaCMaenq
	b2pXGJOMbdWqvoCA1FpFQZr8X7fgzk75xjsn9ZjNg5wL9gVDOsx+oNcFaqZ3+gl0WxZSj1IoiP6
	uVIzaY5cgnVNmri0liW2jJVVI0L6lp8yv1XP8imbM2gHVNhgt9zN2sugnNDg1hu91kJKfmH4vj/
	p0p9Z5W1Yd02XRC7samwhRe19dAts1fICfJaBePITe/K/ayChivE5XvvKLlcPtuFF5jx2+2C3+W
	F37YBk1rJbSYTx8jfidpxDD3/q0A4nIP7bdUI5Bpa1UpPdmIPRqO37p0l6k/+H3QMZNuhjPJ2xX
	z7NpOD/3AdCLyXTQKFdnhCpSnLhQBZ
X-Google-Smtp-Source: AGHT+IHydw0CVPv6HxiK0rxt7/F7rhhFXqFXXsY7vFrPuGUIbADwLidmgxRKInXX5MSWX37dI8vbkg==
X-Received: by 2002:a05:6512:3d17:b0:57d:9f0b:fd4b with SMTP id 2adb3069b0e04-5906db0ccd1mr6079921e87.6.1760364897595;
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:53 +0000
Subject: [PATCH 13/32] media: i2c: max96717: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-13-2c5efbd82952@chromium.org>
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
./i2c/max96717.c:653:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max96717.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index c8ae7890d9fa87a78084df1f3be631004acbf57b..71ec4fdb8e3d96dddc23ab090a63b23b1d093fd4 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -650,7 +650,7 @@ static int max96717_v4l2_notifier_register(struct max96717_priv *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog


