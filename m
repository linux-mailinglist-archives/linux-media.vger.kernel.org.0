Return-Path: <linux-media+bounces-20353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E3D9B1A1E
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2024 19:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC921C21499
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2024 17:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E5C1D2F67;
	Sat, 26 Oct 2024 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gAfeGJ3I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C00172BB9;
	Sat, 26 Oct 2024 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729964190; cv=none; b=mAaqXmklP4BA1L8g1qthXe8ad0KogUB7o4FjRmNJaM7vGhGsMzKm+NFj3GOStem5u7z6qh6c7VooAE5E1jQTru3QAkYJClk3Ffc0AiJxmusdH7tj2QxQlw6eDC2gcXR5WCWl9tc6b4cskvh4o8Ss+KRw2q4tkBQfALb+t6U8epI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729964190; c=relaxed/simple;
	bh=EHV/HGIA+QGjb++JlT7svf9CLMcLw9Cpyx+M53ppHb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nd58+pvk5lDYVD5jx+4rbQAdT2k0shU0beU0qQdcftgHIH+kR+H2zfprbppUBgZIc9UsBHR1T7yCO7l6plPbc7E6WElk6wIlVX2z8uqC/Et83y7NIc6i3F1jfv9xPQyfY5+m7AYURAXEnv4sG4mwWEBq1UExW3gYAnIn49wjSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gAfeGJ3I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEA4B4C9;
	Sat, 26 Oct 2024 19:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729964177;
	bh=EHV/HGIA+QGjb++JlT7svf9CLMcLw9Cpyx+M53ppHb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAfeGJ3Ik9qNecjU+DDFuJE1V2uJx24QJ8eRVmLOBI/bGY6H35y+XFiVL3edaNY+D
	 wCosrGhu+G038lKAd8IEFihfJPqDsiArWvpkRa4Wy6sP9mnBbtkNUg1gcv570wB2h5
	 wiLRqUoySDKgXf8dBeCTEnEsb4Ssr9ODaAXn0Fo8=
Date: Sat, 26 Oct 2024 20:36:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mt9p031: Refactor format handling for
 different sensor models
Message-ID: <20241026173610.GF6519@pendragon.ideasonboard.com>
References: <20241025221638.127457-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025221638.127457-1-tarang.raval@siliconsignals.io>

Hi Tarang,

Thank you for the patch.

On Sat, Oct 26, 2024 at 03:45:40AM +0530, Tarang Raval wrote:
> Add new structure 'mt9p031_model_info' to encapsulate format codes for
> the mt9p031 camera sensor family. This approach enhances code clarity
> and maintainability.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Sakari, this applies on top of "[PATCH 0/2] media: mt9p031: Drop legacy
platform data" (https://lore.kernel.org/r/20241025181708.20648-1-laurent.pinchart@ideasonboard.com).
Tarang, feel free to review that series to accelerate integration of the
patches upstream :-)

> ---
>  drivers/media/i2c/mt9p031.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index f2f52f484044..3576d3066738 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -112,6 +112,24 @@
>  #define MT9P031_TEST_PATTERN_RED			0xa2
>  #define MT9P031_TEST_PATTERN_BLUE			0xa3
>  
> +struct mt9p031_model_info {
> +	u32 code;
> +};
> +
> +enum mt9p031_model {
> +	MT9P031_MODEL_BAYER,
> +	MT9P031_MODEL_MONO,
> +};
> +
> +static const struct mt9p031_model_info mt9p031_models[] = {
> +	[MT9P031_MODEL_BAYER] = {
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +	},
> +	[MT9P031_MODEL_MONO] = {
> +		.code = MEDIA_BUS_FMT_Y12_1X12,
> +	},
> +};
> +
>  struct mt9p031 {
>  	struct v4l2_subdev subdev;
>  	struct media_pad pad;
> @@ -1209,9 +1227,16 @@ static void mt9p031_remove(struct i2c_client *client)
>  }
>  
>  static const struct of_device_id mt9p031_of_match[] = {
> -	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> -	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> -	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
> +	{
> +		.compatible = "aptina,mt9p006",
> +		.data = &mt9p031_models[MT9P031_MODEL_BAYER]
> +	}, {
> +		.compatible = "aptina,mt9p031",
> +		.data = &mt9p031_models[MT9P031_MODEL_BAYER]
> +	}, {
> +		.compatible = "aptina,mt9p031m",
> +		.data = &mt9p031_models[MT9P031_MODEL_MONO]
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mt9p031_of_match);

-- 
Regards,

Laurent Pinchart

