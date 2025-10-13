Return-Path: <linux-media+bounces-44299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 921AFBD372C
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A9E6F4F323E
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D1F271473;
	Mon, 13 Oct 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pe/XMwe+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A01307ADA
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364919; cv=none; b=gRk79Z8ZjTJ9xcbRrGbFouKRV9ZU/W7AcyKvUtQkAvprgEzIDYekr8aw1x2B1zW4VQ3MJExHM/gUxHyNDQKj3CjyNsc5bAP/J7Pss7qbmaVJKFBAexpHOYLD+QGctwE0BYS8ZVjMn01mOOnPwjCWFcYCblqdCLOvRi+tkKGIInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364919; c=relaxed/simple;
	bh=skVdsDy23N9awwt8a/RTEZ0Qc6vg10QpvApVK58YUJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLbf7tNIiYu3ymehYy9qleT6fLokginpjY68hlMj9ptbm+wOB30ufBOCjct7hySDOsG8RnNuzqnE0qrQV8E0srptTbpS34eJk4jjKFbDR9Wox9Ep5QeTZLhfME6LPNl3kbAqVXHLNQGgykNg8gLKEHtayoVdL/2d46pjKnBC2A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pe/XMwe+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so4896210e87.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364905; x=1760969705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZ1y71tufxgFEEk7Jm6x6zTef8El2vgKtA+3jSIjqY0=;
        b=Pe/XMwe+0Bh+ffbcNId0go0Mr1o5TxXm4tOgqWxQItHWDgtLXdBogZkl7S/qHqliqT
         gRAiGIqC68nZaPlzobe0RHjVjTOxxSHFMR/azRj/WOdePWzN8pGCXxK46adRVzzop+8e
         Wgc2Nov+Xwmp0YPjZeNGHYKedPFbmRihJdFZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364905; x=1760969705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ1y71tufxgFEEk7Jm6x6zTef8El2vgKtA+3jSIjqY0=;
        b=tlq3rVbLfPzg591dm9HvK9TATjGVViEc5+uzsHCtZ5ge1TGwR6/ycBpnk1TVDEOZxr
         gCaiX9azGDtHOq195KU3YswCfcWqM6j/LWeVShTA2NGsDB/M99AUgNNPMhILXok2Cu+k
         TVREBeKIodVuvgovgWZl6hs9U2A/O7FTgPqJ5OTB/juZrR1uUoKSAzFW0a1OpAaq+E89
         5+z2Esh8CMf14gTtWLeRYOj9Ihn0vfblriKcmv53TMMRuF+lPDBIZrvDeqGZASgC3rVb
         ixKVXiJkQTnajyxOE9kZdDjyvFucXnoVmGDVBRROyOXdVZdFFrnJ4V5sZKVStr1iw7SD
         yAVA==
X-Forwarded-Encrypted: i=1; AJvYcCXe5qdZx2BgIkyYCx7/98iYJPrsQ+ryzReSrYX8ZZcFifLSLTmte1b3KGW2ng7xxdR9VDV/r4JrZ9kPGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxLPDINak7xfDaeRKC31vyt7/tsLjkCii8wMDRPwvbAUZ6j8m
	IhgQM46wHivOEMaCUTgVkZZCkkZSBrX0zH8DGwCpHasScxExaMkQff3vDepoDYWMag==
X-Gm-Gg: ASbGncupzizYNzLsFDAJPskDxNv3BWig3F5KFtsbbRVbGG/aLbDNVScKIzi0wPTT2ar
	unMn2YIkneJic53nC5pkuaKl7mk4zsr6Rtfbl1tIKXqDuucEE2n1QgvEACXfNifY3+nGsPD1/sv
	JezTA6UFfbGOHAw2PY7G5EiE7bY86T1HznGumYjR0gX8Rne1qNC0VwZoRXEaGBjxh3hf4lOp9VS
	yodIVYYlzjF8eBkQ+5Fh1eFzUgoJHpoVcdXqJZl5S7xExGR+aqRm8TDqugL/atIdeNtI9/6SOGS
	jwMptMUSGhTW5rDmfwrK4W+2uZRUnRfgXJgo7+sL6xcqsmAzD5PCKbQuRdwQe2o/WUl2rtpB4Ou
	mPqoDfbyIkGoEosd0aALwZ/OYOCuyyrz89mHSZSdWRnIdhS4gB2QkpgNO2rpWXH9wVaISiDwc7T
	ojTIn1k978rFJwOYo9Xg==
X-Google-Smtp-Source: AGHT+IFBH7uOHCgk463dX9utRYXWTvTjqks9NRSCe1XoUpKorvtzVnjNPhpyhsxKq9EgJCfyUEV3JQ==
X-Received: by 2002:a05:6512:ad0:b0:57b:1ca2:ab60 with SMTP id 2adb3069b0e04-5906de89076mr6151331e87.52.1760364905455;
        Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:07 +0000
Subject: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
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
./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 6c64657fc4f3366f27bb63dea56f535519af20fd..2de515c497eb8557602ec946de527823f07ab11f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -954,8 +954,7 @@ static int vsp1_probe(struct platform_device *pdev)
 		vsp1->fcp = rcar_fcp_get(fcp_node);
 		of_node_put(fcp_node);
 		if (IS_ERR(vsp1->fcp)) {
-			dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
-				PTR_ERR(vsp1->fcp));
+			dev_dbg(&pdev->dev, "FCP not found (%pe)\n", vsp1->fcp);
 			return PTR_ERR(vsp1->fcp);
 		}
 

-- 
2.51.0.760.g7b8bcc2412-goog


