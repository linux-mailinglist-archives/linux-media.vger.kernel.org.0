Return-Path: <linux-media+bounces-996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5412F7F8252
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 20:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8ED8B23C95
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 19:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B76364A7;
	Fri, 24 Nov 2023 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/hN45v4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177F02108;
	Fri, 24 Nov 2023 11:02:12 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b34563987so13082015e9.1;
        Fri, 24 Nov 2023 11:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700852530; x=1701457330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3F184n6UjoTn10axaf6jM7akcWXmYa+p+MWYHZqrJs8=;
        b=j/hN45v4FQsWMXGs+8+2sZEh/jjM912rRTYIdIbr/N6AQQ49XVmkcx9VC0ZIDRAHst
         5kat03W7Ji+l9IszlqRqcRZmsPIG/3224+WXfH8SP38SAbgFNCkirpeq//aPzMTShbHG
         Fk/8WqJdj1TfS3NNxJWljcU0MMfgJ61gjwdyeMLeKf2nVdbSZjgsRzXxI21UL1fSOcu4
         rOWqbmZff/wETsGLHjQhBPoFlmLMX71IRk3nMjBiAqCNeVtf02wuutkIR2YEpu1dO6Rq
         NHDaZ9kTIh007gfRXlH92w3dSDIVJfH4KmtP9/9pi9mcfMWEyZ6oO3E3uM6uSuXDDiEN
         PC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700852530; x=1701457330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3F184n6UjoTn10axaf6jM7akcWXmYa+p+MWYHZqrJs8=;
        b=jri7KSfL2Jb2OZNQl/LIR53W1cbyoR/asndOAJNClwBa3Jg5MMKlzC+isatADQhmTS
         jty68owdUUgcyYixsDhiaf1IcL27Lm5zftqaBtZ+EVvMkDAdI2REcBSGXJuGVM6Pbz/i
         NyWtphU8NZcUB+VWX2DcjEH6StEdBKkerk5mzHpoWk8M5F7BfXHrYr8Y/qW8++9ZKaDX
         Er0xgNDzXNmCDniYn0G4yJk5Qn1mLX3EPmGjrFpn+8bJk4C44dndK/U+UXO/eaG4HQjE
         /oEWugFyi7IZ6wGQ+iK7bWwjpYYb7DxUCi6pxUNyGCvRCKJTbfozYzAZz6c6jmXDQ9EZ
         itew==
X-Gm-Message-State: AOJu0Yy1V54LcL+8KLIE6kpCtWzzFaA1Gkw/HRJotiVhT+adEXLIaQ4r
	bfWwcdo0xbLePyKir4K1iekHYkY5lKU=
X-Google-Smtp-Source: AGHT+IEr8R0bjRHS1Q3ctxq1KlZDmX/mctw6yiB1b/S6iJmCxuRKkpYr6xemVADvY+PFad6B0EFxjg==
X-Received: by 2002:a05:600c:6d3:b0:408:37aa:774a with SMTP id b19-20020a05600c06d300b0040837aa774amr6691625wmn.17.1700852530228;
        Fri, 24 Nov 2023 11:02:10 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-131.cust.vodafonedsl.it. [2.39.142.131])
        by smtp.gmail.com with ESMTPSA id v9-20020adfe4c9000000b00332c6f1beccsm4862181wrm.66.2023.11.24.11.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 11:02:09 -0800 (PST)
Date: Fri, 24 Nov 2023 20:02:07 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: linuxfancy@googlegroups.com, laurent.pinchart@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov5640: add missing v4l2_subdev_init_finalize
Message-ID: <ZWDzL+prP90gV6m2@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231124184913.2574925-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124184913.2574925-1-tomm.merciai@gmail.com>

Hi,

On Fri, Nov 24, 2023 at 07:49:13PM +0100, Tommaso Merciai wrote:
> After the ov5640 configurations steps let's add v4l2_subdev_init_finalize
> that finalizes the initialization of the subdevice.
> 
> References:
>  - https://linuxtv.org/downloads/v4l-dvb-apis/driver-api/v4l2-subdev.html
> 
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
>  drivers/media/i2c/ov5640.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 3f79a3b77044..338eea802ab8 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3924,6 +3924,12 @@ static int ov5640_probe(struct i2c_client *client)
>  	if (ret)
>  		goto entity_cleanup;
>  
> +	ret = v4l2_subdev_init_finalize(&sensor->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "subdev init error: %d\n", ret);
> +		goto entity_cleanup;
> +	}
> +
>  	ret = ov5640_sensor_resume(dev);
>  	if (ret) {
>  		dev_err(dev, "failed to power on\n");
> -- 
> 2.34.1
> 

Ignore this patch please. I forget the cleanup part.

Thanks & regards,
Tommaso

