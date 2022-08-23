Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53EBB59EBF2
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 21:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbiHWTOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 15:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbiHWTOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 15:14:07 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE373CBE7
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:51:29 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id t5so18989960edc.11
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=G8pk0TfYrEmE764xSTeThT6Yy6xUqAqvtkBl9x4MKBo=;
        b=gJ0iUJmmijw1HXoSFcooRNmiWw0B3gLGrREiRZtFBWGZhh9Fwn1h4mLidFz8/QDXQk
         lerEj9+ilGXQsPCdd59yWlXAaN9/J2dmRtHFIsxWiIzzv6Da5Tk/qEO4ghVAO+T+c1uY
         1HsVZV91dqULZXW8va4nSBmxwgJYB9Jbq1Hy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=G8pk0TfYrEmE764xSTeThT6Yy6xUqAqvtkBl9x4MKBo=;
        b=aSabTbQDkuUMmOqV5CBJ2/OMd9XA6qZQhXgt04xncxF67sbetKCzHGrikrH3/rowOv
         yni+8B5PDgxkqXjcXuqSnwtp5xdEjvSeAb+5r7f9si5u+2W6gSI0h6GYEeJv2axgoPSu
         eTqr48YF1blL6c9dx4mDDqY7etIQFyH5NFsYZqXJLcO/26VJtn46zWKvpHRsG77Sa1Mz
         3zTwZv7yt7n3qxr/HzFhPC4hMIZmPWtz8krg66/MRaZigowMUzzMlafCL/V/6v22PC9b
         HtMtkhPGc7ya4lN7tCzladDQwzl+k82lnWiiWg6kUTDFM3Y3blIdLMTZ4G95yycwDg7t
         I4EA==
X-Gm-Message-State: ACgBeo1sP4O1ab2CXFvgtmg4+Ezb6Oq396JpfwlYMdOhTdxfs0VlpETD
        3aCZrOwsl8JNUyv5wzZeQmQAhYKo92I3cg==
X-Google-Smtp-Source: AA6agR7Nz69W25+ky8gdE+VXUXxTmV5rgYkNbc7FPirulJJQ5duw+KQVwuZUO5i2tZ+QxBJRTpx8tg==
X-Received: by 2002:a05:6402:40c1:b0:447:154e:856d with SMTP id z1-20020a05640240c100b00447154e856dmr4004666edb.319.1661277048108;
        Tue, 23 Aug 2022 10:50:48 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-57-252.cust.vodafonedsl.it. [188.217.57.252])
        by smtp.gmail.com with ESMTPSA id cu9-20020a170906e00900b00726c0e63b94sm177410ejb.27.2022.08.23.10.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 10:50:47 -0700 (PDT)
Date:   Tue, 23 Aug 2022 19:50:45 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     wangjianli <wangjianli@cdjrlc.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pci/saa7164: fix repeated words in comments
Message-ID: <20220823175045.GB1277033@tom-ThinkPad-T14s-Gen-2i>
References: <20220823145709.46069-1-wangjianli@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823145709.46069-1-wangjianli@cdjrlc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 10:57:09PM +0800, wangjianli wrote:
> Delete the redundant word 'the'.
> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/media/pci/saa7164/saa7164-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
> index 7973ae42873a..d5f32e3ff544 100644
> --- a/drivers/media/pci/saa7164/saa7164-core.c
> +++ b/drivers/media/pci/saa7164/saa7164-core.c
> @@ -626,7 +626,7 @@ static irqreturn_t saa7164_irq(int irq, void *dev_id)
>  	portf = &dev->ports[SAA7164_PORT_VBI2];
>  
>  	/* Check that the hardware is accessible. If the status bytes are
> -	 * 0xFF then the device is not accessible, the the IRQ belongs
> +	 * 0xFF then the device is not accessible, the IRQ belongs
>  	 * to another driver.
>  	 * 4 x u32 interrupt registers.
>  	 */
> -- 
> 2.36.1
> 

Hi,
Looks good.

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
