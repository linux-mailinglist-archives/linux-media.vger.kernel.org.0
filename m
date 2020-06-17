Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BCD1FD6B6
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 23:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgFQVJB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 17:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgFQVJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 17:09:00 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75057C06174E
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 14:08:59 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d128so3508233wmc.1
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ikmoUr6wNmodBgxmQ4g8ECiTcai8GP8d0AhUemgSHO8=;
        b=ZbCyWzUcNY7xey+81jniW95DUP+ILcTS9Msa5jg4HLxPv25RR5rrzIIIFvRtGTpLjz
         vAvAtRjL5EXjYfIoE4GEMWp8OI3PL1gYGuZi62FeKD5XBz+kJCNdG8/wfwUIQZy0srB8
         6HYlAwRYMIaTemMv5FqfPOU6lpf2KfTjmH5SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ikmoUr6wNmodBgxmQ4g8ECiTcai8GP8d0AhUemgSHO8=;
        b=dey9NBiDeWSiYKo69qOUgogl8c3+KYMBcKUzOOYDehixsNoaDXaOCloEAI4zbpdL5m
         5HAlTZJuCm5lwW49WYzUq2Eq/+YmKL2W5CcsNlW15pplcC+Aav0YDpeX19C1IlRd9STQ
         imHyAhSQ6BpFtnqkJ8TSLcofHEBd+wul9PksCL5n3VVZIlsG0nf+f8MWXzjNXV4Nt1aA
         ex2Fihs5ppeT8JCgfpWNToJbdlP5LWrdKrLVuXGQG7oItYB6MtbsgfeGOrlaUCqrJ0Z1
         YuSo2fpBG8JZSOPFVOysv8HksQjFaDjGyp7UKjkVri7LakRbdyajrCypakrLFbaWp66j
         9xZQ==
X-Gm-Message-State: AOAM533tm2C8mqZdDPgOVKpGZ/qbxIWjqvbDn/PnwvftWEvi6wvLZScN
        uFwE2/LacvAJxtmMe3hm6y95pg==
X-Google-Smtp-Source: ABdhPJy6hlLynDSJQAGPzvTJ0LukysVmmQM/TeklBwIrSogkOIxOEnVL4GhueV2LP4pjVnW+fum2NA==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr567186wma.101.1592428137695;
        Wed, 17 Jun 2020 14:08:57 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id t188sm1014794wmt.27.2020.06.17.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 14:08:57 -0700 (PDT)
Date:   Wed, 17 Jun 2020 21:08:55 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        dafna.hirschfeld@collabora.com, linux-kernel@vger.kernel.org,
        tfiga@google.com, hans.verkuil@cisco.com, kernel@collabora.com,
        Wojciech Zabolotny <wzab01@gmail.com>
Subject: Re: [PATCH] media: staging: rkisp1: isp: check return value from
 phy_*
Message-ID: <20200617210855.GA81308@chromium.org>
References: <20200617182229.164675-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617182229.164675-1-helen.koike@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Wed, Jun 17, 2020 at 03:22:29PM -0300, Helen Koike wrote:
> When starting streaming, do not ignore return value from phy_set_mode(),
> phy_configure() and phy_power_on().
> If it fails, return error to the user.
> 
> Fixes: d65dd85281fb ("media: staging: rkisp1: add Rockchip ISP1 base driver")
> 
> Reported-by: Wojciech Zabolotny <wzab01@gmail.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
>  drivers/staging/media/rkisp1/rkisp1-isp.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index dc2b59a0160a8..531047fc34a01 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -892,6 +892,7 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
>  	union phy_configure_opts opts;
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>  	s64 pixel_clock;
> +	int ret;
>  
>  	if (!sensor->pixel_rate_ctrl) {
>  		dev_warn(sensor->sd->dev, "No pixel rate control in subdev\n");
> @@ -906,9 +907,24 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
>  
>  	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt->bus_width,
>  					 sensor->lanes, cfg);
> -	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
> -	phy_configure(sensor->dphy, &opts);
> -	phy_power_on(sensor->dphy);
> +
> +	ret = phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
> +	if (ret) {

nit: I don't seem to be able to find any documentation for this API and
it's not clear if it's guaranteed that the API doesn't return positive
values. It would probably be safer to check for ret < 0.

> +		dev_err(sensor->sd->dev, "Fail setting MIPI DPHY mode\n");
> +		return -EINVAL;

Should we just return ret?

> +	}
> +
> +	ret = phy_configure(sensor->dphy, &opts);
> +	if (ret && ret != -EOPNOTSUPP) {

Why are we okay with -EOPNOTSUPP?

> +		dev_err(sensor->sd->dev, "Fail configuring MIPI DPHY\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = phy_power_on(sensor->dphy);
> +	if (ret) {
> +		dev_err(sensor->sd->dev, "Fail powering on MIPI DPHY\n");
> +		return -EINVAL;

Ditto.

Best regards,
Tomasz
