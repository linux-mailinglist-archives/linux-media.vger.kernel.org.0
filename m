Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF0AF5BCF79
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiISOrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiISOrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:47:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F209215727
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:47:44 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so4720020wmq.1
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=CqA/dBWgnZQs4vtp4JzGxE23MTAfm2Kn3zyouRrwVAU=;
        b=j3ppvcKTM5+ZLv0uOuirTjHOiEkA0SWe9duV3l212kNIXczYmBBiYh49IdK/KJQz6T
         L3IfqqXhTm3BpXH5HthVVoZT85FLVZiQd28yfacDaLBWdpIQiGYQ99V+ccQCPy7eElJZ
         0oTDN2cejYgk+b3jSY7KBa9Aq/q3DGNs2v4tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=CqA/dBWgnZQs4vtp4JzGxE23MTAfm2Kn3zyouRrwVAU=;
        b=HCHFLMmUp6UatWvNqXqFh0V+8kOMtZvoZLzUNNYjKUJoIc9FDFXaYS5k2YLzztSyvT
         zOLF/Vj02QHbwcNk3zxdisGRggzloDiwWWEHL9iErFQEbz5t/RyIkaiNj04e3GWCIOf4
         LTgX1WKZ4m2C4PUECb9/i5x3CCEkSaFUlwq+ircMj1WyF+rjQCQ+z6HpIDJpe4j7wMKj
         y/hzwX/qHIUP+Wq3RzXRH83NHeUsVK9rwpCjP4B/dJ3kEgdvQOyLrl9xqva5IJ5BL9JS
         56oam6qMPW8ivBRXTNPNAB2sM7CxwvS/gqJRc4ufAs216JbKY5feV9t14AHmc0trZggJ
         y+9w==
X-Gm-Message-State: ACrzQf3WkojNFb4gnFYgmuSvNLD+Zrzvfwx+BPrAqGrb1fVzYphS7o7r
        icSZSWHH216Q89NDJ6g+Bnh6mQ==
X-Google-Smtp-Source: AMsMyM76d5CrJrNXlgj/08ynu8WNtwGSQ4pYfTL4RojK3/QD3IddL8AcUWp1EwUXhH6ILcUlCU03jQ==
X-Received: by 2002:a1c:4b0d:0:b0:3b4:76ae:f7a5 with SMTP id y13-20020a1c4b0d000000b003b476aef7a5mr13233336wma.23.1663598863464;
        Mon, 19 Sep 2022 07:47:43 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-56-12.cust.vodafonedsl.it. [188.217.56.12])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003b33de17577sm13613692wmj.13.2022.09.19.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:47:42 -0700 (PDT)
Date:   Mon, 19 Sep 2022 16:47:40 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Rafael Mendonca <rafaelmendsr@gmail.com>
Cc:     Martin Kepplinger <martink@posteo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: hi846: Fix memory leak in hi846_parse_dt()
Message-ID: <20220919144740.GD3958@tom-ThinkPad-T14s-Gen-2i>
References: <20220919021252.730729-1-rafaelmendsr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919021252.730729-1-rafaelmendsr@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rafael,

On Sun, Sep 18, 2022 at 11:12:51PM -0300, Rafael Mendonca wrote:
> If any of the checks related to the supported link frequencies fail, then
> the V4L2 fwnode resources don't get released before returning, which leads
> to a memleak. Fix this by properly freeing the V4L2 fwnode data in a
> designated label.
> 
> Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
> ---
>  drivers/media/i2c/hi846.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index ad35c3ff3611..254031503c72 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -2008,22 +2008,24 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
>  	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
>  		dev_err(dev, "number of CSI2 data lanes %d is not supported",
>  			bus_cfg.bus.mipi_csi2.num_data_lanes);
> -		v4l2_fwnode_endpoint_free(&bus_cfg);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto check_hwcfg_error;
>  	}
>  
>  	hi846->nr_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
>  
>  	if (!bus_cfg.nr_of_link_frequencies) {
>  		dev_err(dev, "link-frequency property not found in DT\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto check_hwcfg_error;
>  	}
>  
>  	/* Check that link frequences for all the modes are in device tree */
>  	fq = hi846_check_link_freqs(hi846, &bus_cfg);
>  	if (fq) {
>  		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto check_hwcfg_error;
>  	}
>  
>  	v4l2_fwnode_endpoint_free(&bus_cfg);
> @@ -2044,6 +2046,10 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
>  	}
>  
>  	return 0;
> +
> +check_hwcfg_error:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	return ret;
>  }
>  
>  static int hi846_probe(struct i2c_client *client)
> -- 
> 2.34.1
> 

Looks good to me.

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>


Regards,
Tommaso

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
