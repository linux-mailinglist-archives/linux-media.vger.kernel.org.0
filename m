Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 875FC745AB7
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 13:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjGCLBy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 07:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGCLBx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 07:01:53 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B62C4
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 04:01:51 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6a5fd1f46so65246921fa.1
        for <linux-media@vger.kernel.org>; Mon, 03 Jul 2023 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688382110; x=1690974110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j66Oy02w0xyHGKXKZsNelgE64qwYdYmv1dzgxevWmzY=;
        b=Dk4sf2pbaj2pLMT3qtN2mJn6H1ScNitcj6YSttGv4KU3xeKvZqPUznuMc5bDWLBU84
         soydzpm8w+NRUjPhDHjdNBTNUI+S4apvM1liM4h89+qIiMKhrJjSqjREGlwEzpyp25Pw
         rSYF4yqZeFn3PDGJqzkoxDqb1IkmW+yH8f7bGAGu88PMVQ5umrKL5ckVbJ2sGuKlwZCv
         cBOJqRxLB6oO72vncyrKzAYI4iFTCYQZtloLa0uf4ApiSoa3TT0JQGrthePAPGYA7eBg
         S/+s0S8QwKIy1u0hrAAkVACWPgSWw0Uk7Aat29g2s8cIvDvN7lNzhcUxLxMGehgoHqDD
         1V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688382110; x=1690974110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j66Oy02w0xyHGKXKZsNelgE64qwYdYmv1dzgxevWmzY=;
        b=OBtx0nzupO0nWHAUwyDuo6Sj/D4qpQ1Ij8iNU2f9C647vbREpnu0zLLvzF7ATAImOn
         rpAU5Z4i46t1lvZSTw6Nxy/kGvHYOmByHn876lppZsHt6hw9srZ0PNRoirvm+6n+XCWf
         X3IsaE5zixkW1Hn8X+rxBK8ucZ0OS1WMVz5Vn6yUwOUrnj6k49Xx/RRT2KC4C8gxF/xL
         Yedz7YWp1DdQXx5PfPxcv2N/n8UGu1WqKbOaz9GqO3NUTvOYT/2R9kIpomY/xF5ZNeAE
         egzHd/Mdq/jsh8TehRpEP1WiPgl+YX5rt2CFdVu+D4fJF48I3IF2i/fhM67PGym7ubMF
         +2Lw==
X-Gm-Message-State: ABy/qLbI1VjQGjh0Qdoo7Mj0Keym+N691a/PVIp3RuzzRMpGysgvAqga
        VC+MJMzNUonQLmUaUoWHvgM=
X-Google-Smtp-Source: APBJJlHxCRbWcTJltNw1JjTlvZHuTyP67PwE9A1tzN/LyQTdryTgX4mIImM53adEGXPQhCZfcO7nNA==
X-Received: by 2002:a2e:9010:0:b0:2b6:df00:b371 with SMTP id h16-20020a2e9010000000b002b6df00b371mr3677241ljg.6.1688382109492;
        Mon, 03 Jul 2023 04:01:49 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-106.cust.vodafonedsl.it. [188.217.59.106])
        by smtp.gmail.com with ESMTPSA id mh4-20020a170906eb8400b0098951bb4dc3sm499817ejb.184.2023.07.03.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 04:01:49 -0700 (PDT)
Date:   Mon, 3 Jul 2023 13:01:46 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 14/29] media: ov2680: Add support for more clk setups
Message-ID: <ZKKqmtZkTCj5sgIq@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-15-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627131830.54601-15-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jun 27, 2023 at 03:18:15PM +0200, Hans de Goede wrote:
> On ACPI systems the following 2 scenarios are possible:
> 
> 1. The xvclk is fully controlled by ACPI powermanagement, so there
>    is no "xvclk" for the driver to get (since it is abstracted away).
>    In this case there will be a "clock-frequency" device property
>    to tell the driver the xvclk rate.
> 
> 2. There is a xvclk modelled in the clk framework for the driver,
>    but the clk-generator may not be set to the right frequency
>    yet. In this case there will also be a "clock-frequency" device
>    property and the driver is expected to set the rate of the xvclk
>    through this frequency through the clk framework.
> 
> Handle both these scenarios by switching to devm_clk_get_optional()
> and checking for a "clock-frequency" device property.
> 
> This is modelled after how the same issue was fixed for the ov8865 in
> commit 73dcffeb2ff9 ("media: i2c: Support 19.2MHz input clock in ov8865").
> 
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b7c23286700e..a6a83f0e53f3 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -698,6 +698,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  {
>  	struct device *dev = sensor->dev;
>  	struct gpio_desc *gpio;
> +	unsigned int rate = 0;
>  	int ret;
>  
>  	/*
> @@ -718,13 +719,34 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  
>  	sensor->pwdn_gpio = gpio;
>  
> -	sensor->xvclk = devm_clk_get(dev, "xvclk");
> +	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
>  	if (IS_ERR(sensor->xvclk)) {
>  		dev_err(dev, "xvclk clock missing or invalid\n");
>  		return PTR_ERR(sensor->xvclk);
>  	}
>  
> -	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
> +	/*
> +	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
> +	 * ACPI... but we also need to support the weird IPU3 case which will
> +	 * have an external clock AND a clock-frequency property. Check for the
> +	 * clock-frequency property and if found, set that rate if we managed
> +	 * to acquire a clock. This should cover the ACPI case. If the system
> +	 * uses devicetree then the configured rate should already be set, so
> +	 * we can just read it.
> +	 */

Nice comment :)

> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +				       &rate);
> +	if (ret && !sensor->xvclk)
> +		return dev_err_probe(dev, ret, "invalid clock config\n");
> +
> +	if (!ret && sensor->xvclk) {
> +		ret = clk_set_rate(sensor->xvclk, rate);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to set clock rate\n");
> +	}
> +
> +	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
>  	if (sensor->xvclk_freq != OV2680_XVCLK_VALUE) {
>  		dev_err(dev, "wrong xvclk frequency %d HZ, expected: %d Hz\n",
>  			sensor->xvclk_freq, OV2680_XVCLK_VALUE);

Looks good to me.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Regards,
Tommaso


> -- 
> 2.41.0
> 
