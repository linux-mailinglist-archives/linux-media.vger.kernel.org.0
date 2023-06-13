Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D6572DD78
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 11:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241860AbjFMJRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 05:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239580AbjFMJRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 05:17:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CFCE6B
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:17:22 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f738f579ceso39235665e9.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686647840; x=1689239840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEJyTv05x6OnHnCan2916p7K/uAwJ/b5JDptpsstOlY=;
        b=DAded6QJZGnaYiBOAbyCKBSUcmMkD/J6MARsFtMCeShKLldEDSKIA4po2uT8aySGyt
         5MVS5iHzJhSPqXMX172Njx3svFZwk1sRFkLo2+qkbmZiLvXZJ4Cb/z2z9SdSwbttH/lf
         Y04ChxN31Lf02IOaQUiaB6WpihczcRxUg0cQ6vRQeM88oCkDENaswaFhgdcPhJU80QbX
         eR+ebg8daOPteCXJMQfu9riYPiv57SInZGxlxcJFnnZ8LpCSWc3CxmXpQuF0c0RDPuDP
         JbG9E5M496hfp2pLrDZtaVE6g0QUkTIHKQb4Et+vlxqtOZ47/haiw8+ZN6qOFNl8x+Cy
         9YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686647840; x=1689239840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEJyTv05x6OnHnCan2916p7K/uAwJ/b5JDptpsstOlY=;
        b=SJ4Ia+WOG8qzwZloY9qNiEYUHvwJFIX8mixtKSOgSfk/kLNIvZJtp+QhJEltYmHrLv
         mRNhkRE0WtCzFMdJWtKp/5Xp/lDsBDsMZuobza0NJbZy0mzQgLNccYV8Jl1i7oFVg4YH
         TwJiumTCt82wFIwooTlMRnem/rmafvMtkzMEXm+D1pLwKaw4oEITpHIckEEvwUCDO1Y4
         7XvwkINpnPxUr9KFBX052zop5fb6W6Wua1K57/fQD4fDXA2KChi0A6cUQUeNtUeQW5rZ
         Hu7d1MGTMTDEybG+g6KafEXWDtoOtls1lfRkNf8ReByqiDyuXS7n3MQsrBDUL0pL/IxV
         Gc/Q==
X-Gm-Message-State: AC+VfDx8UqPUNnGM+QOe7DtKzzxWvctUn7DSbnNIo13w3gseLwzS8nk7
        hMACw45wC8SAHlzXn3O/1GahLTDkSyY=
X-Google-Smtp-Source: ACHHUZ7Oic0OsuudLNI2XiEpRpe4O3VwrE8nWFM40lvfW4PXyk5sfN0tCvExMOhkHOVp/KvuBwBjDQ==
X-Received: by 2002:a5d:6b10:0:b0:309:3af4:8c8c with SMTP id v16-20020a5d6b10000000b003093af48c8cmr5686153wrw.54.1686647840108;
        Tue, 13 Jun 2023 02:17:20 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (mob-5-90-5-141.net.vodafone.it. [5.90.5.141])
        by smtp.gmail.com with ESMTPSA id cs6-20020a056000088600b0030ae849c70csm14834392wrb.37.2023.06.13.02.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:17:19 -0700 (PDT)
Date:   Tue, 13 Jun 2023 11:17:16 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        arec.kao@intel.com, hao.yao@intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: ov13b10: Defer probe if no endpoint found
Message-ID: <ZIg0HOEluoDDVwfc@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230613045543.1535492-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613045543.1535492-1-bingbu.cao@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, Jun 13, 2023 at 12:55:43PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> The ov13b10 need be connected to a CIO2 or IPU device by bridge, sometimes
> the bridge driver was not probed before ov13b10 driver, then the absence
> of the fwnode endpoint for this device is expected, so driver return
> -EPROBE_DEFER in this case to let the probe occur after bridge driver.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/ov13b10.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index c1430044fb1e..96d3bd6ab3bd 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -1331,6 +1331,10 @@ static int ov13b10_check_hwcfg(struct device *dev)
>  	if (!fwnode)
>  		return -ENXIO;
>  
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -EPROBE_DEFER;
> +
>  	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>  				       &ext_clk);
>  	if (ret) {
> @@ -1344,10 +1348,6 @@ static int ov13b10_check_hwcfg(struct device *dev)
>  		return -EINVAL;
>  	}
>  
> -	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> -	if (!ep)
> -		return -ENXIO;
> -
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>  	fwnode_handle_put(ep);
>  	if (ret)
> -- 
> 2.40.1
> 

Looks good to me.
I see that also some others ov driver are using
this solution (ov5693, ov7251)

Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks,
Tommaso
