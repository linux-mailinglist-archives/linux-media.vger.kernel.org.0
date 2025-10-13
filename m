Return-Path: <linux-media+bounces-44281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0CABD36C9
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3561D3C6E00
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9398E2EB5D2;
	Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uup3Ks8b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D32EB867
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364902; cv=none; b=r9hitC5N52+LIROC3uW7tVNoPsoDXcvNKquU9WZSIArDZ9hMKobfX2dccDHtYsJLNRRkgjEGg1T5HK5p0+Hg8bPHMSIs5XEw3fHXRyLs6q9z++/qCOgw3TsuUlbxaCiQSbzWEwMxD/eyPB6TzyDDa0ItPHDd7uKrk19Wu5f7ufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364902; c=relaxed/simple;
	bh=v1chswa10XA6p6iwQSk8q4C1sH6EpIjnX5wmdhMAOFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjzryZGaeHduX8b9SmXSIo8/biP5If7JRm6A18hhv5LFCvc6Zcw8LZ4y+X1Y7KbyBhH7evPep6La0eez6BuL+nCPCTuIHQ+xRWduPq2vimBSnM0goY/I9cbjY8M6+Csw8v+djBGv1SiEiHbviMe8mu7CCb3k+S6gi8MmEHoxHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uup3Ks8b; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-58b025fce96so3763937e87.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364894; x=1760969694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=Uup3Ks8bF3JiomVVwUis6g5aliJ8KZSeM381ZCHWw9KOvEoa8LuZfR5uu+jQM6C0kp
         Ucd+55EEHb6ewgpjk3nPBwBdeQhZ78Br4VIHYv/HZpWRgfRXK07ziONu/ithU+HGL7c2
         ugVKe0F97WgDvUIi1qnCejUuXadWhtaO9KlOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364894; x=1760969694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=nfuw8Jj298fjVcNcPfpEVFNWSYHzIrIqOXTyDqYKoS38/+gJ9CHQ+OtPOrQ1aeRm7f
         GcJf7cKts5vybU7goopGU03pw87dDhC0mKYtn4JWIMSDqeB1mv8pWOl06+IdPDacicw/
         advp73ogxVp6V773aAJgbXN7w6ByiV1F7iQJy0wm9n618cpbtU0BTNI6NjssAcUM2lFW
         ine04GLF02HLpIKIAloz+qtg9qDRpCqjgRheCPD0rUwtFSgpl3MSckppP7f+EQhYlXdC
         +DsYApg4KUaUGvKLMWgE0wS7P/Q9UODXYWgGLynf9j9QrPfaMUBRetIScjMoCMwb73Yl
         dKHw==
X-Forwarded-Encrypted: i=1; AJvYcCV3J2hIK1DnXNK1p9lclCYIGjkY/Y7nxl2WRromvw7Rv0qav9dTPDgqHToqrRzZpuPZruoJyYw+zFRsGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzKHEP188oqHJzuOVV3/23tL0qSdkfmdWnOFhGodDlu0Z1Lyu
	QgiBduMvq9XQY5LJvFVr/snEM5MCFfgMvKtkgjNe4+nCs8WG3qwzK1S6tGp2nBpKDQ==
X-Gm-Gg: ASbGncvHtj9Yo2CF7q1HC33pbRc4dArUHN3kzV+pZkQFsb2c+p494tTKlF/eDuAHEUY
	qO9hQPNNPzf+1OeEOwDcsino2zXgyA1u4jul1PvolpmXGCd5qfB4rtXLdDSP9859IoEVgRgwHpl
	gHcTtvElb7w0Jb0e143083AHumVoPvFhkm5E86GJCVRaF8mvo6oSw9GDpI5bPMc192XgMKqizRx
	r/UM7sT5jqxhLrU+i02WjFx3eiOWLOTKHqi5rI9/GBoDmesBoLASnSlDsh5pMFvOVZswPXCuXbK
	r+smqJpaLkC56JeWxOoY+i4ShyqtTwReCNd/JqqGreDpVeggi2AiOhZwM4AehTe3gSye9cRqCPu
	xIez4MhOteFALcb6na+go7JSFQp7adzJAZqoJbC371fwLUsJAx3Ltyv2kniBsWsKfIWDk7zGECO
	y6v9YI1RIMG1li7yLT6g==
X-Google-Smtp-Source: AGHT+IGDBA6vFVbdaAIVk4TqwO+W9UovYsrjETSu90SPXIb8+mEsMg943qVguajtHcsDf6ytgGLF1Q==
X-Received: by 2002:a05:6512:6c3:b0:57e:f60:2327 with SMTP id 2adb3069b0e04-5906dae8090mr6097318e87.49.1760364893949;
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:47 +0000
Subject: [PATCH 07/32] media: i2c: ds90ub913: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-7-2c5efbd82952@chromium.org>
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
./i2c/ds90ub913.c:625:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ds90ub913.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 73150061ea458937ae4ba7a937ea030b0d98bce3..e97e499b04e6c2700d7d433ccb4fdc57ff12b586 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -622,7 +622,7 @@ static int ub913_v4l2_notifier_register(struct ub913_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog


