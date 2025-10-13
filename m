Return-Path: <linux-media+bounces-44293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D218ABD36AE
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5D2A334C9C5
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E40B30B504;
	Mon, 13 Oct 2025 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ChKhhebA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CC03090CE
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364916; cv=none; b=RaGnoVk02HYHp5aIi81i7YD2k02drsUf9vjnXlqVFRZTxGVGPKPqZRmTdk0oeimLZH4yvVtlReEypZ1JxOKUsS1wqD6TRFdGKWNPJCzRMLWlymJRPhQL7uuMHlanyGsXciCpP8bf9vkUypbdZaENNHtTpZxMqducRDEnVK9Vc98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364916; c=relaxed/simple;
	bh=I7TGAr67/gQzv/N2orW4jc5CGXZ/k6/Zdc8d4ItKKFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESR9ROSsLsXkvtdQ7f57dJ4y46CtFHerZzBmVZBmN/V80Rggk0a418Q/Fp8Ev93lQLDmCBJueI+ZXaQ14Kv6iq2aFLm9AyyifXc4HRAoFBoIQWYt2hPxKWe6i0EvSqquxUYzD087P3T1ZTBH4UmxTZ9VOsBlY6tET1gJQNKVi74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ChKhhebA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57a59124323so4619723e87.2
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364899; x=1760969699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kj07cX9dfdog7qE3ITvyCUHudwQ7Qr1GriLN3ezW2JQ=;
        b=ChKhhebAhE2aPYsXHcKJV616z2lSP5D31R/nxFn427jZQ84CP9KcBHPxktdYOqYVyM
         F/f3WKuxsRx6YGuwKjW3Kx1GhU+sEBDv/BzmbRz2I+ek+TuHDcv29w9PFykPEZ1054ZC
         OeAOotwOPMFQmhJo0RO5BXSzBY9bfFjgEIVMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364899; x=1760969699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kj07cX9dfdog7qE3ITvyCUHudwQ7Qr1GriLN3ezW2JQ=;
        b=vdoqUXi+34a/VsVXjw/Co38/edTsKhQeZ3v2ZLRWolw/xUrutB1V4ezptTU+XuiDiv
         WHObrWvsxmQbDEEKpT+PEUEvsW/Jq85WhZOWlzkcbc/GEUYxN3lIdNttXps2slDQOduw
         CsW4HgtHvRSDdp8SLDwBwIUzxWxG2mhaJk45Ad7mUlaUJ2tJ6IV+N9KisKSGP9fbRXQT
         uH8oVuJUC13Gz5zNEWgVfxBh65oa8pxhWt6WXzU8Z0kpUcOLMZXXfgGqYiMih+va8Zr1
         zs2Po+q6P4VHV7rFS+rhgOQzONGFAJAWZozMVC9YX7kOwPOdGdPqKyk+37rL6rMZauL3
         Xhow==
X-Forwarded-Encrypted: i=1; AJvYcCXztRYZhTi/meqnsAqpj4+23Bo6zB9y16FcWBmmgCF62QAATW3EIBGRD3cSFM1PH33NRpwueI49jpTskA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj8vTtVJQiYYw54U2QFtuK0wYdZWx+3Ixr+tFp/GkcgTmq6APM
	yuGVEoKT64lxQnveih2c13IHdxMdrdY6EPVuKQGC473lTPRWtZb+0aORe+B9mjBOuA==
X-Gm-Gg: ASbGncvfRegqpCq4Mg8dewJQhrXJ1ye0sxOR68GY8s/iz6os9zOjWTE4pKpCYM3vo8D
	LfNofKtc6LgihgGs2MbbU0ne59S0SHFuRMPPEDqhU81BYCgVHVAMmuoWMKHSMjnlWBCXAcx2yeq
	4XVl4r1YLnW24wCqNrcSXK4TfmzOXnRdVSJK9Mxq6DH1m1K9/ovoeHL8hTzICO0UT7PsL2nLiv0
	GZ2H9WP0+wM35wFT1YTkr6SXZyZIzt/yiHLEXLwWY3sL+Ao6SFUoo+TRa68VFX/ju6l88nLxfP2
	cjjedIRAvRYPfrAa0zycqdLsqpeG/xh3nVVHowRvcwHaNopxuKYY7rgyTg5qePLsl/8mOQe3t/n
	RMCpSINLABwA9tgKo/r5nhUxXjTY4tfR/QFVhfNX7I0lU8L+gSBQF+YLqySWx9/iVYmcfM49oXt
	vySy0CIAqtfedczPN7tQ==
X-Google-Smtp-Source: AGHT+IE2HB4PNnNNZPoJgrmm/zoBzzLugjubCTHQBbs/Uafloy4/vUsHxeeEoDk1I+UDuJlRtAHv9Q==
X-Received: by 2002:a05:6512:3dac:b0:586:7f:a141 with SMTP id 2adb3069b0e04-5906d88e732mr5437316e87.18.1760364899093;
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:56 +0000
Subject: [PATCH 16/32] media: i2c: ov5675: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
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
./i2c/ov5675.c:1188:9-16: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5675.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 30e27d39ee445c2603b8fecf7a1107969eb97df3..ea26df328189eef449ce121c0f62a4ef02631830 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1184,8 +1184,8 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov5675->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
-				     "failed to get xvclk: %ld\n",
-				     PTR_ERR(ov5675->xvclk));
+				     "failed to get xvclk: %pe\n",
+				     ov5675->xvclk);
 
 	xvclk_rate = clk_get_rate(ov5675->xvclk);
 	if (xvclk_rate != OV5675_XVCLK_19_2) {

-- 
2.51.0.760.g7b8bcc2412-goog


