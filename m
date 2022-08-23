Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F6A59EC2E
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 21:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbiHWTXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 15:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbiHWTXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 15:23:03 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4689834E
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 11:04:27 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id ca13so17726241ejb.9
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=67k58vrmy+9FIi/LCbLSxCkdQUH+mazDNft/DJM09r8=;
        b=jjdr3CxnZZ2nnl1lgZKU61f1YPEPiDYdZARx4aack1uaM/twqyItxiDZJsJCdOERZK
         izstXZVd5o8tAKv3nDr0yD444ZR4EtUcZI4DPj/w7oX6XaoL2IOFnA3l9KfKhqiJlVHT
         ejYXDUcWzd/NVn2IleTUxLG/ydfTY0q1/mOrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=67k58vrmy+9FIi/LCbLSxCkdQUH+mazDNft/DJM09r8=;
        b=w6wQ6SYnlMlEHOy17zkJWI2LGopdNEAHoAxqEYFG/nGG/sYwW3wKsFWFqPNKQb48hh
         2w6Qcof4qajoHfVv2j4ES7DBXH7kISkU8L7OsK1JUBYzd6Reo6EZAopwGfWanDqAYIRZ
         AlKlYW6JPRyYhg+LQsn00ZPlQe8gcfLk7SKGgsZAoAE/rlsgaHa7uJPAJ9QoUtWLgr/1
         kELJcyFXjCT7EfaK/O8yGE622OzkCM8/CGTJNimAvKkUuwbJdqHxsqFJQxhi074jDgLa
         7fRyadKUFLvAuXCZk/bn35iBG+IzEWmIUbIJBzOOxbwX1ost+YRPe86vOBXlnWBryJlI
         wsSg==
X-Gm-Message-State: ACgBeo2awCrfG/zmUQ453ZQANS0Cw8JwBvfMshdo4pSLttE2MVLmTtT5
        fi0u6jw1y7likt96h+0+xTGsPNHOQs0eoA==
X-Google-Smtp-Source: AA6agR6YmHWbickuoP9FVYkGjc1CJsOhfxrHnw0q3VOyzKBBCTM6aKgrpmN2gAw5QifkOdzir1T05Q==
X-Received: by 2002:a17:906:f88f:b0:731:463d:4b15 with SMTP id lg15-20020a170906f88f00b00731463d4b15mr493141ejb.299.1661277866159;
        Tue, 23 Aug 2022 11:04:26 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-57-252.cust.vodafonedsl.it. [188.217.57.252])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b0072f1d8e7301sm172237ejo.66.2022.08.23.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:04:25 -0700 (PDT)
Date:   Tue, 23 Aug 2022 20:04:23 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     wangjianli <wangjianli@cdjrlc.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pci/saa7164: fix repeated words in comments
Message-ID: <20220823180423.GC1277033@tom-ThinkPad-T14s-Gen-2i>
References: <20220823145709.46069-1-wangjianli@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823145709.46069-1-wangjianli@cdjrlc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

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

All your patches about "repeated words in comments" looks good but maybe
is better to put all these fixes on a series? I think for maintainers
it's easier to manage

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
