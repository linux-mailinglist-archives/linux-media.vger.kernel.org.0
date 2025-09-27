Return-Path: <linux-media+bounces-43282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B40BA5DBA
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 12:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C6B81B26A53
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 10:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D562DAFC1;
	Sat, 27 Sep 2025 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACzsHtiw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BEC28B51E;
	Sat, 27 Sep 2025 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968946; cv=none; b=V6kPIvZJN+fD8yibdLRW1YQytUg63d6P4JfTuPH9OpenXR2AOlJSFB5D4CAvw9fIWQoHxOjcMmRwD0D/10mRedcKnCxGLrLUUZACXDr7lBd4+Pew/Y2mD9TPxeYlQGJY3A2e2le1bShNFhMtLOWCVa6rN4CTbboWk7bo4iHDbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968946; c=relaxed/simple;
	bh=VBBYEi7zqeGBaPxZzuReDWT2atyZfOkrCabeiV/nt3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wi1e5gyvYL14IwwuvorcSlcSnGPVlip4InfKcJTaxuBWwWQKoMQYDQY3iB75FlLn8WJBo/Fzo2JuQV3MsrVlNiAMYbbq74dLhRBxQAJ0bAG4vj0jzHgAHIn3CPXq2TocfyLXHX69joZAO/vXEBmuW2mw5EOiV7+bRM4nICf/+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACzsHtiw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB95C4CEE7;
	Sat, 27 Sep 2025 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758968945;
	bh=VBBYEi7zqeGBaPxZzuReDWT2atyZfOkrCabeiV/nt3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ACzsHtiwXKmoMID5tH9S+Y+qkQFalUgRLnTAGUN8GlfII/SNaXtzB7Xyq1T0ImAbz
	 pihENXlMrNPnS57qbowiFSkvCwvKBRocIGaCjKryMRrGf3oceySeGVzKiy3wGK5Yrk
	 VqSFg1KxlYasZk6/WwJnH5TN3D+Y9tOMvYqvId6KGDn0GSJsAPy5RQtk7HQdwqEq+T
	 GzKS7OX+ftZEDO2/HsVEkOzSUBqe2kbAg3FXSci79SG35cvzYcBgc89HbTMYSi3Gkj
	 FejHodbNnmxYqSC+A5AgAotGSC9AxwhETaKYRTgVd7NLY9jjhHIUYdXAZedTqg+AXX
	 vV6ANrnyuqrLA==
Message-ID: <880dcbb3-16fd-4eff-b452-80a172d7e84b@kernel.org>
Date: Sat, 27 Sep 2025 11:29:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
 sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <UOlyemyHumj7KSxoHz97_4KS7Mgjbfj22__Bd2qi-hw-FvU3R_W_kXTlm2HpefoGBxVsyPlyZ0EQ1xUqRvT1oA==@protonmail.internalid>
 <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2025 08:34, Loic Poulain wrote:
> Ensure reset state is low in the power-on state and high in the
> power-off state (assert reset). Note that the polarity is abstracted
> by the GPIO subsystem, so the logic level reflects the intended reset
> behavior.
> 
> This breaks backward compatibility for any downstream dts using the
> wrong polarity.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/i2c/ov9282.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c882a021cf18..fb6fcba503c8 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1127,7 +1127,7 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
> 
>   	/* Request optional reset pin */
>   	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
> -						     GPIOD_OUT_LOW);
> +						     GPIOD_OUT_HIGH);
>   	if (IS_ERR(ov9282->reset_gpio)) {
>   		dev_err(ov9282->dev, "failed to get reset gpio %ld",
>   			PTR_ERR(ov9282->reset_gpio));
> @@ -1238,7 +1238,7 @@ static int ov9282_power_on(struct device *dev)
> 
>   	usleep_range(400, 600);
> 
> -	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> +	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> 
>   	ret = clk_prepare_enable(ov9282->inclk);
>   	if (ret) {
> @@ -1261,7 +1261,7 @@ static int ov9282_power_on(struct device *dev)
>   error_clk:
>   	clk_disable_unprepare(ov9282->inclk);
>   error_reset:
> -	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> +	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> 
>   	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> 
> @@ -1279,7 +1279,7 @@ static int ov9282_power_off(struct device *dev)
>   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>   	struct ov9282 *ov9282 = to_ov9282(sd);
> 
> -	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> +	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> 
>   	clk_disable_unprepare(ov9282->inclk);
> 
> --
> 2.34.1
> 
> 

Needs a Fixes: tag

---
bod

