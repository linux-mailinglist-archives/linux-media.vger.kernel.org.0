Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958DB4633F4
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 13:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbhK3MPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 07:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241457AbhK3MPO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 07:15:14 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A842EC061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 04:11:55 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id p37so40843404uae.8
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ezWEJY1UxPw2PKLFovyt/KEg8Ohs2gMv1LSWNGSFZEM=;
        b=O4wjtzO3oSmjpegvP0d5IYeBeM4kG4ToTjzD/3PruseWwAGb5cdISnLLUb5hEAIVNY
         wmeJA0GLnfKGt09V6oEsF8HesJaRWNZnMFH7h947bSxxBmb+ilkkhMHbie2QMXyUMebg
         JU8XJOwSGKCkwWhv3hLlPJIBciMmE+wTYcpjuJ9IGNpcMseH0FiyPqqWyPRiExfBc8mQ
         vzc2AYzIwVZ68BzIbhw3j1NpG5Jf6V8NE5y7wdqkjmGtDKdqvB3geomqlex8POnJ7FOQ
         vurW53g2dzU7MrJNgQLMQG1S7wHlLRpVhYjriz1narmIPOH+4qRRuzjSmOaz9Yq22170
         zIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ezWEJY1UxPw2PKLFovyt/KEg8Ohs2gMv1LSWNGSFZEM=;
        b=tnZWkpn1wOmGfO0qixw8qolSHgucBp0VImVk75XCaThdsYkV2PTRcqDiNzqpqmwlmv
         cEkljEZTL4EXyUBGstOZwWDee+XnCkdEZrU2QIxaZKrT2CCeuYydFiUpXxZpWNaHgW38
         eOFbPA5PDw3Nbtmmh19GcS39rTnI25IxTMv9fe3vzJWtFiMIt2V25UFzQ0FZaRQbnxIk
         g4iLzUmNAZsCAiUyGlGguE/XSYOFlmspYhdVgNnXETJqSV0OHhCPYe8v8cUixZEnjDDW
         +wgSTL6w2LjIgrYkH8yiyNousyWKck6WFi9h9JjTpqA0s4rToYhyjNoQBaHajwD8vpbh
         GD4w==
X-Gm-Message-State: AOAM533Qd6/Vqb7A2AaqBg98KlYzNFKjmeVyeXNAWUDRz4/EYkcpEjIY
        DMMqMl1XXy4vqhMd5ROzTfYTiA==
X-Google-Smtp-Source: ABdhPJxLXNhuLHrxh6uP38+mjJjJNBxkZpXCbKo3QO6/zmhliW+JnAqbYneMwOFJzA7HoYYmlfSDzg==
X-Received: by 2002:ab0:22c6:: with SMTP id z6mr57430523uam.80.1638274314802;
        Tue, 30 Nov 2021 04:11:54 -0800 (PST)
Received: from eze-laptop (host208.201-253-22.telecom.net.ar. [201.253.22.208])
        by smtp.gmail.com with ESMTPSA id s13sm9960047vkh.32.2021.11.30.04.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 04:11:53 -0800 (PST)
Date:   Tue, 30 Nov 2021 09:11:48 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/9] media: hantro: Fix probe func error path
Message-ID: <YaYVBDdhhG2c7enw@eze-laptop>
References: <20211129182633.480021-1-jernej.skrabec@gmail.com>
 <20211129182633.480021-2-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129182633.480021-2-jernej.skrabec@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 29, 2021 at 07:26:25PM +0100, Jernej Skrabec wrote:
> If clocks for some reason couldn't be enabled, probe function returns
> immediately, without disabling PM. This obviously leaves PM ref counters
> unbalanced.
> 
> Fix that by jumping to appropriate error path, so effects of PM functions
> are reversed.
> 
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks!

> ---
>  drivers/staging/media/hantro/hantro_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index ab2467998d29..3d3107a39dae 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -981,7 +981,7 @@ static int hantro_probe(struct platform_device *pdev)
>  	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to prepare clocks\n");
> -		return ret;
> +		goto err_pm_disable;
>  	}
>  
>  	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
> @@ -1037,6 +1037,7 @@ static int hantro_probe(struct platform_device *pdev)
>  	v4l2_device_unregister(&vpu->v4l2_dev);
>  err_clk_unprepare:
>  	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> +err_pm_disable:
>  	pm_runtime_dont_use_autosuspend(vpu->dev);
>  	pm_runtime_disable(vpu->dev);
>  	return ret;
> -- 
> 2.34.1
> 
