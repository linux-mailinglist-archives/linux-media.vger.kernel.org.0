Return-Path: <linux-media+bounces-44479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E1BDB5CA
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 23:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46CA64F6098
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 21:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883C530C37D;
	Tue, 14 Oct 2025 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVnBbebO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257AA3002AF
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476199; cv=none; b=Ono8JYps9Jb5uEoXYHoVIHR5v4WkhvpeXw2N6Ypb8GNFd4pRcxEbImEEQ6u9caI6L5KdMXFGGPak2W6exZCIckl+Fgy9kCftlw5ms1kBmgTGRJlPm+opTJeaTnxc7FEo9fBNhPvDzhScxmw4Zv9ebqaWXbxILkAnQGUtk1wYXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476199; c=relaxed/simple;
	bh=FEscob/e+90GaHE2E4U+4fd6PQekvU5FL8BnBdihcrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7lQhiFH2uUvRSTzf789qNBCCQWqVymYzl8WOaEwg/Ov+98E0NZE8hMotZU5ZCdNaagpDodg6ELKJ7MAS/UQekCMXTiTRlNXjosgXBnrEiyO4ZllskYuFRTw+bzV37BsxNiG5+gcqowwPuWRVZg+scCklsfnm6yLsmANTw3Ob6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVnBbebO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso245118f8f.0
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476194; x=1761080994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=;
        b=OVnBbebOPYmvppTEawHH7DqNLzG9FMcBK6Ik4fk3zeO40bwYGlgf1dTyA+0Q8nU0Wd
         3eImoFfukZ5Yb1ds2vJFpo4fsQMuJx7auuObwTuGbpognVDUC869NUvjkmHj8Z6gDEZc
         7+BA3s2jVFYBVsX+uD6zx34LD7tsZy+WrZ/r710UmV8uBJ4nAw0exnUlJ7oY+kKYLFgy
         CignPqzaZDI4XiymQES4VkJ4GxrkycUXEEBQ9IjLchk7KiITwg99oPcPru7KtrdkcqRy
         NyA0hZe50+GnxctAbjBEpatbXb5E7YaV9/nltPamC8NlatXc+4Am1IefgYWFyME7poa+
         iyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476194; x=1761080994;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=;
        b=slYl9pGKShK+9HHRGz3NoKL3P685mkcOP4s3EpCvYYZSRpEmud/DSHVgLHTo3juelY
         mxDcDwJYmvzz+qg3Z/JszxI3s8n4rUf5NM4W8MdFrtAIFVmm0wRLYp7QtBO4562xXYGP
         YkTXEO+ToiqZFSTK2cq45UzDcOODk2Vt5o5vAkC36Ib/icQFGgXCRANHsdJKkP28mZtq
         EnnBXLCTRb0RSimriQ7DowmXBitINeD4Sf7flW5VM5d9QkS7ALyX4NZoHWkgB213wWB2
         WalAFpN0rQR8AakQV1GUaAG9C2ymJ9uXEsVV/3XABDMyF+MR2qaA0wq5pOEFoUoSWuvU
         Ydxw==
X-Forwarded-Encrypted: i=1; AJvYcCVvfdr5YZ7NGbYHTgqtReFD/XjJw7zmjTJwtCVfjxJjuGb1pKWyxmfYxnZpGY6fALTeLuMIPGnHyIBjDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/4jn/Ja0kFYj1fjQJmPqZlG4kUM41pKueygxtXqr8VlRveUh
	CLR2AK/sFifDhbTK/QpKrxQCAghxDAyL2R5/dUqR/eWA09o4w/4tlzxGx7Nvodbmcys=
X-Gm-Gg: ASbGncsa5Xe6Qen0UuRlIRPZ7mMHPsHnJ7GxyH8MSVsWDImQicNkP/1+DGuU0AnMBs9
	X+OnpA0JjuiedV5B8V5+rEUvgcFuLC3kz9OiNnH8RepZmdFT2RO22GaSVh6XAxtGDXBoxueZzi8
	dtcnOTyRZCUsG3tD9rhWFEXEBLSdwQ0yhpR14sc6bquNHu1kBZoLotOOpPDxIoqeP87Hrh8tTCo
	ZhZsGcmT14IIe4adrTAqRu0OdwpM0kldKFH69tuPud6MiZeZ/92yaAAy4iHsbjTtk95dJvZhltX
	WWQjhbf8Fx4NmjQgRUqsuWGUJGrnpp3M6SaIUAi5nvivLVTYZ/mmatKyfgFy99tKEQEG6xBOeRZ
	NjVkbUwW8I5RI7RcBEHv3912iFSO9NGF2AFHAaZSt0vViY1UCArT7uJ3nncxm/nA1lE+0dzIQS7
	gwmiKhYye4KT6/cg1UoBkiOg==
X-Google-Smtp-Source: AGHT+IHMLDEl/2OUqyd6dsVKt1UGXh3BaRNNfQRox5yRqmlsYRCZeNTg0aqnPOJfK+LSUdRcw9kJiQ==
X-Received: by 2002:a05:6000:2389:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-4266e7c7b2fmr20416940f8f.21.1760476194354;
        Tue, 14 Oct 2025 14:09:54 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582b39sm25169444f8f.15.2025.10.14.14.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:09:53 -0700 (PDT)
Message-ID: <ebc5be79-7184-4a91-92fc-8a181ba096b5@linaro.org>
Date: Tue, 14 Oct 2025 22:09:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/32] media: i2c: imx412: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <U1BUWm68sWNPUXHr6NOsnc48bb6eXIL5tcAzrNijItgutDvPaBTmCI0qf2ERLQB_2BFYEBVNvWTQdmx5z_UU-g==@protonmail.internalid>
 <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/imx412.c:931:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/imx412.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 7bbd639a9ddfa7fa76d3a4594be1e1c4d002c98a..b3826f80354703b17b416dc233854da3f5736e38 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -927,8 +927,8 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
>   	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(imx412->reset_gpio)) {
> -		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
> -			PTR_ERR(imx412->reset_gpio));
> +		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
> +			imx412->reset_gpio);
>   		return PTR_ERR(imx412->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

