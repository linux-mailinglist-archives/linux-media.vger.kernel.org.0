Return-Path: <linux-media+bounces-44300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56FBD3771
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 74B704F379B
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8912F30B535;
	Mon, 13 Oct 2025 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bl/3tNe+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D74729A301
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364923; cv=none; b=bVVkV1nOxI0/eHgM8RXEFp0hTu8ygCz/YotbNZdMsx83cRFi9eyRfF2uxaaBm4flcE/FysEcWsGFnGuygczA/ne4/A3Di0jEUNVucQC2MAS3F7pc0t9bn+UvaVFOQKWnqqmQoQQsvvZLcX7sDd3B7ImOASc/2efkwriZnzlrtBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364923; c=relaxed/simple;
	bh=8Y3wF3Ogu1PTCQAe9QDSmk3/csBKQwAsoOPfpiyO1ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGIhwolub7tYzIz4HDFYSy4utzTRUoVByv7IZu4v7xNk6TnHHaZ0e1UgribtNwtfrX2dOgQY1LqXKTZbbHWuYHAkHoO1ZTpTxZZScDrXy6AgpgjoAkarf37NCQFjkxKdeyc8sJrFBxFTwDExX90fkP5idPBLS6LX25zBFNMbXBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bl/3tNe+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so4294672e87.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=Bl/3tNe+OMMoqxBGlH6akwvTnEU8G6RsNcggPSiD9hGBCwDdEQs71Bgxo8Za378RgX
         /MB97qA3nXh1x/5buObh6r6jao7WvrEEF30YmUNo322omVolR98+vhmahoGG6ahTCHuL
         9lxi1eoWGySnesHvejd0Vnj5kVDtbAMnSNHdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=sf8OHrHDDShclu6AVorUlg7ZsN4bWr6xemtHWa7aOg0/hdRNMmkgVn5LZm7pD9xRXQ
         yEiSlQCNPVhPA10gHKphiBlI0xt2QhW5PPnZqEVrLYUn0nunlHLVYdhLztvphHrSD3kV
         yV2Dunyjq0vY7YpssbAp0WkWHoXKF3TFweeyI1iGiN8XK2D/N1oBNDEF02DFkJ9zks8z
         3JyAlGEP+dKRLgu7HNq3MdVhhRVrhyfLiOVfByfUVj7M6CaJ1tok3wbL2ZKWzqAYmLg0
         MV3CC1b+FypcJ+Hwot7sXzf7f+luoAUH9GBUOHgOcj20o4QuhefmBhgpKFnOmass8+Cc
         5oqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVZRtSyFK+1h6OgtmWylFjU0FKGkV/K/ozoi6nZ25vvlnM26+/QiWWoZ5tMAHg/wy3DEKZQ98M1a8JNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwm2hb7BvIFuGuSIcJP1Grv10+qc0lAysZhZahXKv5OQg4S6K
	4HPfCjo7F2F8kARA8duE9hjC85X7qg86VbKkh2MTLJMXJPuok6kX+/mSxU/Bt+jgbQ==
X-Gm-Gg: ASbGncuSq/hKHSKrEHynMW3LWPT5j2IFvp9lOq9sZLF3rgffYYZtlqxAwprVz1/rm6S
	DIVHlKYTGZvlstbVbnJKIyEGbfo5fA26CCkUqnXqJqWrbL0Gsvks4Hs1xW9rC0rhjex387FVSMb
	eC5C0LJpaj36vSGSWkwGHhkZpgM1QARLVCAtcBwErxNLS2ce/PmgnOxVMzeCF45IaQR56NXlZrH
	20piKefI+GFCnzLpP9VfY4K337ItyXUJeACHAL8KE3Iys2KP4DNtgP29vk8Rx202QNUxA8GCxx9
	dk009xWI1WtGjAt/LMadcGBqv9u1o5agjeonG+xSi9lRVq0kwwwCHyB/aPZmb/mzdctx2DrU+gT
	9jhikHG9x6eYc28MJmjs5m4cde5Wzs9itHKKLQpvHely0tH2J0UD6384Q7JAis+G1qn3xrp0AA6
	GZovlpBt3q+MfODfPGjQ==
X-Google-Smtp-Source: AGHT+IFTTHLDJWS3Dn9Gd32yhET2ji8RYegzhadBkm4NFBADg/24WPxUjewhK5Qa14H7toVcPkN+hQ==
X-Received: by 2002:a05:6512:3f28:b0:590:656c:d11f with SMTP id 2adb3069b0e04-5906de88e60mr5677489e87.44.1760364904333;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:05 +0000
Subject: [PATCH 25/32] media: imx8mq-mipi-csi2: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
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
./platform/nxp/imx8mq-mipi-csi2.c:422:23-30: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..d333ff43539f061b8b9cf88af2cda8c44b3ec2a9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -418,8 +418,8 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 
 	src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(state->dev, "can't get source pad of %s (%ld)\n",
-			sd_state->sd->name, PTR_ERR(src_pad));
+		dev_err(state->dev, "can't get source pad of %s (%pe)\n",
+			sd_state->sd->name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog


