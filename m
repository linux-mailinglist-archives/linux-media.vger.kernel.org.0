Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A4D349E1A
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 01:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCZAjB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 20:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhCZAik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 20:38:40 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A44C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 17:38:39 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u20so5398425lja.13
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 17:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sDCiUkUu4rTSxdlK8hVFTjukVlKKPoqYpNFnP12gh64=;
        b=yylOqMtdkdNuqKtAdDA/jgXzPiwWFHe2MzPJTotLRWSONPIkCgXgvwu6KHEO2diyuL
         4/A6DZhEnsD9d+iiqTR7JCVcl9RxFqQIxMRXHDNFuglZNg1L/ZYKA+DhFmTAZyRskzuz
         jz2nn8SSP0XEtIL2og4bVCAjANvAm4U+STiXIgJAIoxhs7yNH0t7lmUDUqeyPi+mRKwj
         uXpS7u5zQ2kySWk4qqV/f4lBZYTb04P8nHvBgbsgT/juJqF9qA+CbUtQeMzY5kD5C2DE
         ttoDCtK15BY3Vd+gR0xbvEWnou3DEZXfUaZhN7bO1TGrjMaaFUVgMuEpBfQmR7NNskwC
         Qecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sDCiUkUu4rTSxdlK8hVFTjukVlKKPoqYpNFnP12gh64=;
        b=m19Fbk7uFn9/VB/zAM6RCW0haKC9YfG8rAB9Dy0JoW57s8kX4fbUupdjp/YfOTpOhr
         m7wc7Yb/CaNL19dEV2a4Jg1/3zdjxx7XBsI5mXwLmomnWkfpv3URrfsEx398isrS2o/f
         DHivRofd1imq9+ZzSPk6LGand6HaOlf+zZZj2ztqdm3PSuNh9OjFV9gCaa7qniKXEn7H
         No8VAHzjv8Day1k+i8S/obU+nm8ZV/VAIqppWbALRyHtn2mcqNGMXdT2gv39Fo4GH95X
         kV5WlvEurs1LaUGK7NDpJMvE/PeIK0xsLFkbZURxNN8VRjhm9fKMO8vhYNuhRHSDybDz
         Dx3A==
X-Gm-Message-State: AOAM5301yrKzSn08+lC/pr/WYj/GWhiBUQtAio+HsdmJKp9MoDuEHq05
        6JbrQlK9qYCj0g3wRzpTfoZpaX22rjpAFw==
X-Google-Smtp-Source: ABdhPJxWNtr4l/wZaJomyQn3pitrIgdXMn4empUW0WSijBl4ZflXtrvU3roTQmija/IOgwhb5VpwMA==
X-Received: by 2002:a2e:140b:: with SMTP id u11mr7445346ljd.125.1616719118419;
        Thu, 25 Mar 2021 17:38:38 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c2sm592172lfc.221.2021.03.25.17.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 17:38:37 -0700 (PDT)
Date:   Fri, 26 Mar 2021 01:38:37 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] adv7604: fix HPD support for adv7611/12
Message-ID: <YF0tDQPUx19zptuI@oden.dyn.berto.se>
References: <c7093e76-ffb4-b19c-f576-b264f935a3ce@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7093e76-ffb4-b19c-f576-b264f935a3ce@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your patch.

On 2021-03-24 08:56:42 +0100, Hans Verkuil wrote:
> For the adv7604 the hotplug detect pin is controlled through gpio pins from
> the SoC, but the adv7611 and adv7612 control the hotplug detect pin themselves.
> 
> But the driver had no support for this, so the HPD was always high, even when
> changing the EDID. Add proper support for this to the driver.
> 
> Tested with an adv7612.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 7547afc85eb1..15bcb88ca2e3 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -519,10 +519,17 @@ static inline int edid_write_block(struct v4l2_subdev *sd,
> 
>  static void adv76xx_set_hpd(struct adv76xx_state *state, unsigned int hpd)
>  {
> +	const struct adv76xx_chip_info *info = state->info;
>  	unsigned int i;
> 
> -	for (i = 0; i < state->info->num_dv_ports; ++i)
> -		gpiod_set_value_cansleep(state->hpd_gpio[i], hpd & BIT(i));
> +	if (info->type == ADV7604) {
> +		for (i = 0; i < state->info->num_dv_ports; ++i)
> +			gpiod_set_value_cansleep(state->hpd_gpio[i], hpd & BIT(i));
> +	} else {
> +		for (i = 0; i < state->info->num_dv_ports; ++i)
> +			io_write_clr_set(&state->sd, 0x20, 0x80 >> i,
> +					 (!!(hpd & BIT(i))) << (7 - i));
> +	}
> 
>  	v4l2_subdev_notify(&state->sd, ADV76XX_HOTPLUG, &hpd);
>  }
> @@ -2826,6 +2833,18 @@ static int adv76xx_core_init(struct v4l2_subdev *sd)
>  	io_write(sd, 0x0b, 0x44);   /* Power down ESDP block */
>  	cp_write(sd, 0xcf, 0x01);   /* Power down macrovision */
> 
> +	/* HPD */
> +	if (info->type != ADV7604) {
> +		/* Set manual HPD values to 0 */
> +		io_write_clr_set(sd, 0x20, 0xc0, 0);
> +		/*
> +		 * Set HPA_DELAY to 200 ms and set automatic HPD control
> +		 * to: internal EDID is active AND a cable is detected
> +		 * AND the manual HPD control is set to 1.
> +		 */
> +		hdmi_write_clr_set(sd, 0x6c, 0xf6, 0x26);
> +	}
> +
>  	/* video format */
>  	io_write_clr_set(sd, 0x02, 0x0f, pdata->alt_gamma << 3);
>  	io_write_clr_set(sd, 0x05, 0x0e, pdata->blank_data << 3 |

-- 
Regards,
Niklas Söderlund
