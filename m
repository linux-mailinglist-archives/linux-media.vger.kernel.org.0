Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974B72EB044
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 17:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbhAEQiV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 11:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbhAEQiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 11:38:20 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0007CC061795
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 08:37:39 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id b9so978593ejy.0
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YxrqGOviXXENBMTFnQaNw0YzxNVkM3/Q1q4WXI0EYHQ=;
        b=KDOX1ep38qZ8dUWYYzLkezJm1eTo8soZXvjYzxLoKQvcovcdK3dxz5upLrFMocGNS5
         mnJ9UrK5sduyaScQyBbbRM9MRzZqbfULvcMg12yojaltlo3XQB4LgJ5KeAf1Lk/J32MD
         7S2wzxjBNqJjSrnD1bc8RHTZHqfN+DQAhico+D2AnJNIaqR7wVi+jxaPrSpyGZskabr4
         x3PEP8fCL1WNbotp01PNRpEmyzjql0PFc8la5fPqX6V5rBZEAbn/0ozJttk2gqrLhOiE
         Qh5tWzUQAmup/EfxAxS3OmAeyYDkPiGErZfrSFabgpXuGKu3r+H5t07f3hITtEOEfcTu
         KHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YxrqGOviXXENBMTFnQaNw0YzxNVkM3/Q1q4WXI0EYHQ=;
        b=I73XELM8R2lgJs/NPhRvzaBBSaHuAbitL4SIheeO0hTGQxfM44Vj8tqcWNhOT5/rAT
         WewzZDY8XqWBufq1vcxm4NMFMupxeziMiT9VAz91n8/6KHtK4iOliT1oxOGnZsozC2cD
         Ni5Ajt8MGG2ynYw3jw9sGTdf0nsVR7AW6myVo54GEGltJ1i6byD+x0lmMcDUyqdMsvHn
         BZze4jFqjrqM57zQoydrZaQR2IMPmBTlTk7uMdL1TkRM2a7JcmactgS8znsyJNulNQ+L
         AXllX/40xstXvWjjfZ6Kj6hP1fUvUh3fswp3CXA2nM90Acrd9zin8HhxMKgj4i6ZIvsR
         C6EQ==
X-Gm-Message-State: AOAM532JV1MCDcVuBJQ0qtZUpn8HNIfjrcu88O3rL9XagZGbMBhBU/n+
        wCJMXoUe54eREzc7yITWPJM=
X-Google-Smtp-Source: ABdhPJwf38ITG2e5EFnGArYRqGstTOW8IPED8comLApyjPqc4rgVwU6GzeB2fGxUC+B7TxrKdVGXZw==
X-Received: by 2002:a17:907:2071:: with SMTP id qp17mr42972ejb.110.1609864658619;
        Tue, 05 Jan 2021 08:37:38 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id z1sm7648edm.89.2021.01.05.08.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 08:37:38 -0800 (PST)
Subject: Re: [PATCH 1/6] media: mach-pxa: Register the camera sensor
 fixed-rate clock
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
 <20210104165739.116404-2-ezequiel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <d07ac542-8b1c-779f-0b69-683c0d0ae2d1@gmail.com>
Date:   Tue, 5 Jan 2021 17:41:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104165739.116404-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Dne 04. 01. 21 v 17:57 Ezequiel Garcia napsal(a):
> The pxa-camera capture driver currently registers a v4l2-clk
> clock, named "mclk", to represent the mt9m111 sensor clock.
> 
> Register a proper fixed-rate clock using the generic clock framework,
> which will allow to remove the v4l2-clk clock in the pxa-camera
> driver in a follow-up commit.
> 

BTW the mclk output to a sensor is actually a variable rate, divided from lcdclk (which can be changed too). PXA camera driver  is using variable pcdev->mclk_divisor to generate the mclk from lcdclk. 

The rate change is done in pxa_camera_activate():

https://elixir.bootlin.com/linux/v5.11-rc2/source/drivers/media/platform/pxa_camera.c#L1136

	__raw_writel(pcdev->mclk_divisor | cicr4, pcdev->base + CICR4);

Would it be possible to register a correct clock type with possibility to change the divisor by the standard way?

Petr


> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  arch/arm/mach-pxa/devices.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
> index 524d6093e0c7..09b8495f3fd9 100644
> --- a/arch/arm/mach-pxa/devices.c
> +++ b/arch/arm/mach-pxa/devices.c
> @@ -4,6 +4,7 @@
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/spi/pxa2xx_spi.h>
> @@ -634,6 +635,13 @@ static struct platform_device pxa27x_device_camera = {
>  
>  void __init pxa_set_camera_info(struct pxacamera_platform_data *info)
>  {
> +	struct clk *mclk;
> +
> +	/* Register a fixed-rate clock for camera sensors. */
> +	mclk = clk_register_fixed_rate(NULL, "pxa_camera_clk", NULL, 0,
> +					     info->mclk_10khz * 10000);
> +	if (!IS_ERR(mclk))
> +		clkdev_create(mclk, "mclk", NULL);
>  	pxa_register_device(&pxa27x_device_camera, info);
>  }
>  
> 
