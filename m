Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E7D59EBF7
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 21:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbiHWTOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 15:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiHWTOO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 15:14:14 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5033A10544
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:51:40 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id c39so19025675edf.0
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=sDBaSDMG+UDgCifIbR0AL6vcpXr497JaPO6dIyVU0V8=;
        b=cOtt44z0CW7ImM4UGItCd0A/tffXqphjetu1mC4+/9A3wkWlIVtFs3gUJ6pHNA6bQL
         1ulcES3mGiIX6weI5XktG9SCa9bJZiYVc+zqV4xH1Aza8ad1Yr+nFT6VJupWVgmeQddx
         E/LgKQCCo0TOWwGqMmCai5rKflV231vDSRPJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=sDBaSDMG+UDgCifIbR0AL6vcpXr497JaPO6dIyVU0V8=;
        b=GC0lAMmSnneHg7dpCWmLvjF8iRDAQTPSSzb4LdPXv6e1ahXKE0b+m5hGf+sNfwNQQC
         Lx1fhABpDJK8DTBJHR4uSoxDWFRFEulWs4GJVcpNQbfr0ybTn53bvH382hxaaNm/1XKK
         pM7RPSPA8oyyG2d7yBaBjpIbHU9kPtVBtT21cp/0iJk1DJMllgg8OMfynBra61O1csjD
         ZjO4Dj27vch2fyDKJ936GZvIRTT1tbUyoV9ciGKcQ3eypyi7Y7wIJRo4Jhr8+m5quzvi
         yCUuZHITRjOPR0t+Aj9caQ7P/dg/ssqAPSgu9XOXRA/9Y3Mv/3uh2ttdbmJHc+SoXPwO
         yHZQ==
X-Gm-Message-State: ACgBeo1091vjKt4duOm0sjhMfS7D4KOi7quCsaNDKq6nOWTHfy5QKyH1
        6KtxT9Gw2Rw/yOx9FNqd0dbXd8MC9r9zCA==
X-Google-Smtp-Source: AA6agR6AC9qvPpVh8ikeSZzI7M8wWx7sWIn+kkW4Gdr7Uch+tdArCg472GbKPuyDQfEjNxvARvYAbw==
X-Received: by 2002:a05:6402:5203:b0:446:a378:54a5 with SMTP id s3-20020a056402520300b00446a37854a5mr4438303edd.321.1661276616038;
        Tue, 23 Aug 2022 10:43:36 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-57-252.cust.vodafonedsl.it. [188.217.57.252])
        by smtp.gmail.com with ESMTPSA id t26-20020a50c25a000000b0043bbc9503ddsm1789775edf.76.2022.08.23.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 10:43:35 -0700 (PDT)
Date:   Tue, 23 Aug 2022 19:43:33 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     wangjianli <wangjianli@cdjrlc.com>
Cc:     awalls@md.metrocast.net, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pci/ivtv: fix repeated words in comments
Message-ID: <20220823174333.GA1277033@tom-ThinkPad-T14s-Gen-2i>
References: <20220823145530.45102-1-wangjianli@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823145530.45102-1-wangjianli@cdjrlc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 10:55:30PM +0800, wangjianli wrote:
> Delete the redundant word 'the'.
> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/media/pci/ivtv/ivtv-yuv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-yuv.c b/drivers/media/pci/ivtv/ivtv-yuv.c
> index e79e8a5a744a..4ba10c34a16a 100644
> --- a/drivers/media/pci/ivtv/ivtv-yuv.c
> +++ b/drivers/media/pci/ivtv/ivtv-yuv.c
> @@ -538,7 +538,7 @@ static void ivtv_yuv_handle_vertical(struct ivtv *itv, struct yuv_frame_info *f)
>  	reg_2964 = (reg_2964 << 16) + reg_2964 + (reg_2964 * 46 / 94);
>  
>  	/* Okay, we've wasted time working out the correct value,
> -	   but if we use it, it fouls the the window alignment.
> +	   but if we use it, it fouls the window alignment.
>  	   Fudge it to what we want... */
>  	reg_2964 = 0x00010001 + ((reg_2964 & 0x0000FFFF) - (reg_2964 >> 16));
>  	reg_2968 = 0x00010001 + ((reg_2968 & 0x0000FFFF) - (reg_2968 >> 16));
> -- 
> 2.36.1
> 

Hi,
Looks good to me.

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
