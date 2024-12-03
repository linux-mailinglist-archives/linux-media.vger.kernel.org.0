Return-Path: <linux-media+bounces-22525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F739E18F4
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 11:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 057992812F4
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 10:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACA41E0E18;
	Tue,  3 Dec 2024 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DVziZN7m"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511AF1E0DDC
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733220826; cv=none; b=K3Ch3bfzL6UTTCTAm52YNHB2rrPbuYyVXyVc5ETkPy7xZ+Huc0m+dfLTM04AFlIMrrid4EO7KeuXGXXXEshnYzHIiZrT6rXP9hLbbqQ32EEWdMfVeciafYGWVf9QKqSWUDt/dnv+gAc0krIZQWUq4JeyBmkycMMiaF1mRw/0kqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733220826; c=relaxed/simple;
	bh=MbiUR/ecPE3TxOcuSPOUivoOgwv1lpxDKtA5OUkYnFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uDxfNAvXMozh2HJ7P4LwwNDojndSSWs1VjbwQr2RNMotKaqjiqJ62/9WPc9ydQuwIjSiYuzgKPXKbpTwim9dgUtsFkGQLtwW8rvyC0jEXeoTRAK5aFguJ8S7n7AH/txqVtoXDK1NOXgSYdNwvFndJ3le2DF33z8OSfHV06+lqr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DVziZN7m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733220823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gD5FYt1/eddOzn+zXb0esVob8V7beW2eiojXtAtmws=;
	b=DVziZN7mkT8E4k3qxAowTWH2gpU1OmkUD6H69ppjBV3dIREEeievMu0NU60wTE3dKAE6sU
	dlNEJZu3LulnnhvExMG1ED4zmOyKmisUvCql/S8oVWsi13v9Su+48qL6tAEUNTLB9a0uEt
	lJOHNuVjM0s4nT5AlXvhTmVD0INSgZE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-SkyrH_AIP7GrmhqAXv0fqw-1; Tue, 03 Dec 2024 05:13:42 -0500
X-MC-Unique: SkyrH_AIP7GrmhqAXv0fqw-1
X-Mimecast-MFC-AGG-ID: SkyrH_AIP7GrmhqAXv0fqw
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa530a61803so323526866b.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 02:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733220821; x=1733825621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gD5FYt1/eddOzn+zXb0esVob8V7beW2eiojXtAtmws=;
        b=upPljSTfLlprMne8OVK41qysup4C3YC/rXS4de+rtMnopiAqgGLl/pHpU0YcgOVZ5t
         6dWw6KD8Exzo5d42Ll5WEBg7zRL0RhdFocQdSfbYxqtt2CuqrjcJfU9asGtMWGM6J83m
         eHFU/jLJ9jD7ywBIaWZnuBMBJnxIKvB6wJyKckamr12kTthZk3XVgzYVfdu773kXxxen
         1e7uvyEDXOoXLrX6kjmIKakP+2qbhB4hekzB1CXmkigEhhKSNcDFbDhfimIcbPcuRCYB
         mTs7057ueg1Tn4vuPaO9psTqnqDW1L8MiO58svycClaeavOWfEFQWuJYsihQTrcfKRP5
         QQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCVrgBWQUQxMHLKu0DvbGP88hqdwn5UcgF3JsSUX6NFl9/DnxMpcSVS68MruzOzh6ftYpRDj/MIEcggCbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLJxD/9yR+oFK+xLOM75Ib/a3mR9vwVLXLMSuq5QdfsE4wLzX4
	skv2QeB8IBUcLDaARw2PmPYGH4N+hVMG6CwQsso/t8odYsQaad9mxfU95G2l4dDnoAESYyEzGoS
	aQfnBIdptlug0U4fMSpG1K/LYK8r4LEa1aZxZV3gUbzCEE9TuOHwRac4CFjZ/
X-Gm-Gg: ASbGncvuYbQyPlmWrxdPadBtXextMbmZ6g3YANBZDjS5R316nb+St2Zi1oXpYyZKd9f
	Lb48VZ7yfuURhqzxHiCYqGpkDEFelBDjvAaAkAiVPOjj9q7j9EpX6cCfvfKC1wHqcCR5V3ZcRzg
	LtBVbOqKkL2/UpfsjON7awgtZdX7wB1mCmF9zXPN0T7Mhq2Ur2Qz/i9Wf35aLehzngVcWL/PoGz
	Z/GQLTQ3IHZsaw546rOfYfC/ylgWOxjHmm2jUR8XPVH2l4R2p80Moaas+taLg6I0NS375FeOkgO
	68An0pyjISNTG1PsNMQxFhDE0jhlCQ16OI8/DAbln2zong30pXQQ7rGYgK4lwZUTRTlK8SMLAGk
	7kM/il/Mq+56EKZ6hBrTuvti6
X-Received: by 2002:a17:907:7841:b0:a9f:4f7:f064 with SMTP id a640c23a62f3a-aa5f7cc2a04mr137747366b.3.1733220820837;
        Tue, 03 Dec 2024 02:13:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJjBemiZA1JA6td7ZtEW4FdLaoA9XqQ/Yo0vCezDXhxc2MCbJKB4nnkSo7NdapACzQPwkwww==
X-Received: by 2002:a17:907:7841:b0:a9f:4f7:f064 with SMTP id a640c23a62f3a-aa5f7cc2a04mr137745266b.3.1733220820482;
        Tue, 03 Dec 2024 02:13:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996df78csm602815466b.67.2024.12.03.02.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 02:13:40 -0800 (PST)
Message-ID: <81a63f9d-afe4-4a29-ae98-5c5837bcd7cb@redhat.com>
Date: Tue, 3 Dec 2024 11:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/staging/media/atomisp: replace legacy GPIO APIs
 in atomisp_gmin_platform
To: Song Chen <chensong_2000@189.cn>, andy@kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 bergh.jonathan@gmail.com
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241203091436.203745-1-chensong_2000@189.cn>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241203091436.203745-1-chensong_2000@189.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Dec-24 10:14 AM, Song Chen wrote:
> In atomisp_gmin_platform, gpio0 and gpio1 have moved to descriptor-based
> GPIO APIs, but v1p8_gpio and v2p8_gpio still remain calling legacy ones,
> such as gpio_request.
> 
> This patch replaces old with new, also removes including gpio.h.
> 
> Signed-off-by: Song Chen <chensong_2000@189.cn>

Thank you for your patch, this is already addresses by this patch
which I plan to merge soon:

https://lore.kernel.org/linux-media/20241107221134.596149-1-hdegoede@redhat.com/

Regards,

Hans


> ---
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 63 ++++++++-----------
>  1 file changed, 25 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index e176483df301..7ff548ac3171 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -11,7 +11,6 @@
>  #include <linux/mfd/intel_soc_pmic.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/gpio/consumer.h>
> -#include <linux/gpio.h>
>  #include <linux/platform_device.h>
>  #include "../../include/linux/atomisp_platform.h"
>  #include "../../include/linux/atomisp_gmin_platform.h"
> @@ -85,8 +84,8 @@ struct gmin_subdev {
>  	bool v2p8_on;
>  	bool v1p2_on;
>  
> -	int v1p8_gpio;
> -	int v2p8_gpio;
> +	struct gpio_desc *v1p8_gpiod;
> +	struct gpio_desc *v2p8_gpiod;
>  
>  	u8 pwm_i2c_addr;
>  
> @@ -548,23 +547,6 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
>  	else
>  		dev_info(dev, "will handle gpio1 via ACPI\n");
>  
> -	/*
> -	 * Those are used only when there is an external regulator apart
> -	 * from the PMIC that would be providing power supply, like on the
> -	 * two cases below:
> -	 *
> -	 * The ECS E7 board drives camera 2.8v from an external regulator
> -	 * instead of the PMIC.  There's a gmin_CamV2P8 config variable
> -	 * that specifies the GPIO to handle this particular case,
> -	 * but this needs a broader architecture for handling camera power.
> -	 *
> -	 * The CHT RVP board drives camera 1.8v from an* external regulator
> -	 * instead of the PMIC just like ECS E7 board.
> -	 */
> -
> -	gs->v1p8_gpio = gmin_get_var_int(dev, true, "V1P8GPIO", -1);
> -	gs->v2p8_gpio = gmin_get_var_int(dev, true, "V2P8GPIO", -1);
> -
>  	/*
>  	 * FIXME:
>  	 *
> @@ -830,21 +812,23 @@ static int gmin_v1p2_ctrl(struct v4l2_subdev *subdev, int on)
>  static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
>  {
>  	struct gmin_subdev *gs = find_gmin_subdev(subdev);
> +	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
> +	struct device *dev = &client->dev;
>  	int ret;
>  	int value;
>  	int reg;
> +	int v1p8_gpio;
>  
>  	if (!gs || gs->v1p8_on == on)
>  		return 0;
>  
> -	if (gs->v1p8_gpio >= 0) {
> -		pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
> -			gs->v1p8_gpio);
> -		ret = gpio_request(gs->v1p8_gpio, "camera_v1p8_en");
> -		if (!ret)
> -			ret = gpio_direction_output(gs->v1p8_gpio, 0);
> -		if (ret)
> +	v1p8_gpio = gmin_get_var_int(dev, true, "V1P8GPIO", -1);
> +	if (v1p8_gpio >= 0) {
> +		gs->v1p8_gpiod = gpiod_get_index(dev, "camera_v1p8", v1p8_gpio, GPIOD_ASIS);
> +		if (IS_ERR(gs->v1p8_gpiod))
>  			pr_err("V1P8 GPIO initialization failed\n");
> +		else
> +			gpiod_direction_output(gs->v1p8_gpiod, 0);
>  	}
>  
>  	gs->v1p8_on = on;
> @@ -861,8 +845,8 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
>  			goto out; /* Still needed */
>  	}
>  
> -	if (gs->v1p8_gpio >= 0)
> -		gpio_set_value(gs->v1p8_gpio, on);
> +	if (v1p8_gpio >= 0)
> +		gpiod_set_value(gs->v1p8_gpiod, on);
>  
>  	if (gs->v1p8_reg) {
>  		regulator_set_voltage(gs->v1p8_reg, 1800000, 1800000);
> @@ -911,21 +895,24 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
>  static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
>  {
>  	struct gmin_subdev *gs = find_gmin_subdev(subdev);
> +	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
> +	struct device *dev = &client->dev;
>  	int ret;
>  	int value;
>  	int reg;
> +	int v2p8_gpio;
>  
>  	if (WARN_ON(!gs))
>  		return -ENODEV;
>  
> -	if (gs->v2p8_gpio >= 0) {
> -		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
> -			gs->v2p8_gpio);
> -		ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
> -		if (!ret)
> -			ret = gpio_direction_output(gs->v2p8_gpio, 0);
> -		if (ret)
> +	v2p8_gpio = gmin_get_var_int(dev, true, "V2P8GPIO", -1);
> +	if (v2p8_gpio >= 0) {
> +		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n", v2p8_gpio);
> +		gs->v2p8_gpiod = gpiod_get_index(dev, "camera_v2p8", v2p8_gpio, GPIOD_ASIS);
> +		if (IS_ERR(gs->v2p8_gpiod))
>  			pr_err("V2P8 GPIO initialization failed\n");
> +		else
> +			gpiod_direction_output(gs->v2p8_gpiod, 0);
>  	}
>  
>  	if (gs->v2p8_on == on)
> @@ -944,8 +931,8 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
>  			goto out; /* Still needed */
>  	}
>  
> -	if (gs->v2p8_gpio >= 0)
> -		gpio_set_value(gs->v2p8_gpio, on);
> +	if (v2p8_gpio >= 0)
> +		gpiod_set_value(gs->v2p8_gpiod, on);
>  
>  	if (gs->v2p8_reg) {
>  		regulator_set_voltage(gs->v2p8_reg, 2900000, 2900000);


