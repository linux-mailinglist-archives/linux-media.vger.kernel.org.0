Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308F87A19DF
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbjIOJDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233308AbjIOJDl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:03:41 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753523AB5
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:01:56 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-401b5516104so20382985e9.2
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694768341; x=1695373141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hO2xKmznklAYsnnVud+mPWUiGdEAE6c9V5Hk56toUGw=;
        b=BUMO/GP7UQ7Ln11dZg/848Hivb6jZiJxqloOAtw/YTJhAYzVqYNuGoHWBTlMFV4Bic
         WYt6+ruhVbL+gp5780B2il9djggN0oXVcUbBlFlyTzD4o/Ze+YU1OZtNQG2bDfoeIXeL
         8rM3yCMFDjdghJnkRbHxgp0Cm7SUKywRCAJ+vThTkWOU1v73HItfRvgDkt8h5p63N72v
         xbgbJzgxPxhj0r8PimpNpbFeFCOBXLgILj7bmmyVQ6/CUwcM9WcP9HxYqHxJSyIhxDF9
         cHZfvbjqNQRBijQyHI9kSTi3iVeRqCvIVm8xs1e8LPICs7zj6ZLiJEDXI2ZjiiBJhGqu
         AP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694768341; x=1695373141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO2xKmznklAYsnnVud+mPWUiGdEAE6c9V5Hk56toUGw=;
        b=szICfjauHyqTwbhBZRy/mAaXB4hRIQtmYV6IJ3hDE/ET6GCz/ZOz2AldDA+rxgIsF4
         8M9ZwrCvcNoPzEnf5U53FV7rsPbM/O5Af0ZfrxAfF8CFzVFCLH0pZDz6MCmsVTCbtz6i
         oeYQqMfAfvVAjOc6zMSAuPMVSMcMKNtkyh56WqO/bBxvAckvmMyYEZZzFhSR9ii5Kbpq
         wACUTM+nalGLCYCw7Q8E+Fdwfk0Z12DI/BM+TZr4rf+2htJ9PHk0maivDOh+B7rpcDNp
         esxf/5ReAQPRqTvdNC00DXn1uSwjfHU6PLwUyUQ1Wiv3bIs2xUALSawHOmYkaQdwE+OZ
         ixhA==
X-Gm-Message-State: AOJu0Yzh4l/ioyGRPRKVCK6cItIhrWI0J1QSTzcTv6qvV/co2f6IuI0x
        LawMF5HorjbA3Pqw7IyYV7s=
X-Google-Smtp-Source: AGHT+IEyZ1s2AgDM9a/kUynvgX2fqavv0eQBKB0zmBlI0RaDufDW6jXguR0FKFwoF26K7XNNu6cHjA==
X-Received: by 2002:a05:6000:239:b0:31f:f65f:74ac with SMTP id l25-20020a056000023900b0031ff65f74acmr552885wrz.70.1694768340409;
        Fri, 15 Sep 2023 01:59:00 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-54-79.cust.vodafonedsl.it. [188.217.54.79])
        by smtp.gmail.com with ESMTPSA id g14-20020a5d698e000000b0031759e6b43fsm3879471wru.39.2023.09.15.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:58:59 -0700 (PDT)
Date:   Fri, 15 Sep 2023 10:58:58 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH] media: i2c: ov5693: Drop the unused streaming flag
Message-ID: <ZQQc0oG9q3YVlDVj@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230914174508.785-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914174508.785-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Sep 14, 2023 at 08:45:08PM +0300, Laurent Pinchart wrote:
> The streaming flag in the driver's private structure is set but never
> used. Drop it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5693.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 488ee6d9d301..d6836725ced7 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -154,7 +154,6 @@ struct ov5693_device {
>  		unsigned int inc_y_odd;
>  		unsigned int vts;
>  	} mode;
> -	bool streaming;
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -996,8 +995,6 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (ret)
>  		goto err_power_down;
>  
> -	ov5693->streaming = !!enable;
> -
>  	if (!enable)
>  		pm_runtime_put(ov5693->dev);
>  
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> prerequisite-patch-id: e46ede71d8cba61ae5bf7721eb35338b9e2d36d0
> prerequisite-patch-id: 4cfba8929058f17ab103d38ea1b447126e645935
> -- 
> Regards,
> 
> Laurent Pinchart
> 

Looks good to me, thanks!
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Regards,
Tommaso
