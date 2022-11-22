Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F6B6340EC
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 17:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbiKVQJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 11:09:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233004AbiKVQJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 11:09:43 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41FF7213D
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 08:09:41 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso1477688wmb.0
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 08:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MB7sh8EfMeiMpT6eyk0gEECQb5t5VgXPL9obUDUw5Sc=;
        b=mVDeJYEkvQC6eWfFWLtGuUF637u9WsgKRxpLDgfw8QzLz9JsB+URj8WuFMXEpz0Mww
         MgAp+g9ay+YEVSueITnwwqqtN1rWa9OS5/0GRbDdcdgvJMy03n/QJcQeAN3jezT1z6pt
         oX06q0G9b/lvpcLBRVF1Ia3e5YoQVkUIcPjO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MB7sh8EfMeiMpT6eyk0gEECQb5t5VgXPL9obUDUw5Sc=;
        b=biS74tTl06Fk+1a5rNr5XFNXCpqF/4ZrqxAD3zBlpRbUE8BErsdHUB89+qM7qfyz6l
         +kFuRzG9iJ8tEf0xpnXCGa1xcZwtynegi3Xgc6QJYgflYERY4ZiOXpxadPZh6PHd7foG
         hP6v4epOmNakhjnjU9zAr8yzupTb4yYRh0KGMz1Sa4tiVAmnR1TrX411kVscXxgb42kW
         8dWwmDrDkVR+AMttRtf4ADHsAlRbZR/dyTpFH9KJF4U2E1XngeBpr/AKoe7JgoJvkBcp
         FEDDBjGPZ3gKO+zj7G2neVWl+l1hy45FgAITAA1zBEwjafmsU85rQLYXbY9woMJCcmQX
         01yQ==
X-Gm-Message-State: ANoB5pkW8Ti0e3it+3v4exspf5v5AbOt+MuWyYrSy7nhUK3Yg/E5ZrYM
        Ee8U1yLzr/vgF9vpkRmH4KuYlQ==
X-Google-Smtp-Source: AA0mqf5NtqJ76RIotfZLCAGTg2jm4dfBI9IjABHCpRidd+mpCKzKmdG8CWw7n5MGPzF5JoVww0RHxg==
X-Received: by 2002:a1c:7404:0:b0:3cf:b091:e5a1 with SMTP id p4-20020a1c7404000000b003cfb091e5a1mr16700981wmc.44.1669133380511;
        Tue, 22 Nov 2022 08:09:40 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bcbd8000000b003b4fdbb6319sm22345740wmi.21.2022.11.22.08.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 08:09:39 -0800 (PST)
Date:   Tue, 22 Nov 2022 17:09:37 +0100
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: remove code for non-existing config
 IMX_GPT_ICAP
Message-ID: <20221122160937.GB39395@tom-ThinkPad-T14s-Gen-2i>
References: <20221122132330.30408-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122132330.30408-1-lukas.bulwahn@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lukas,

On Tue, Nov 22, 2022 at 02:23:30PM +0100, Lukas Bulwahn wrote:
> There never was a config IMX_GPT_ICAP in the repository. So remove the code
> conditional on this config and simplify the callers that just called empty
> functions.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-fim.c | 54 -----------------------
>  1 file changed, 54 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> index 3a9182933508..19a48eb445fd 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
> @@ -187,54 +187,6 @@ static void frame_interval_monitor(struct imx_media_fim *fim,
>  		send_fim_event(fim, error_avg);
>  }
>  
> -#ifdef CONFIG_IMX_GPT_ICAP
> -/*
> - * Input Capture method of measuring frame intervals. Not subject
> - * to interrupt latency.
> - */
> -static void fim_input_capture_handler(int channel, void *dev_id,
> -				      ktime_t timestamp)
> -{
> -	struct imx_media_fim *fim = dev_id;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&fim->lock, flags);
> -
> -	frame_interval_monitor(fim, timestamp);
> -
> -	if (!completion_done(&fim->icap_first_event))
> -		complete(&fim->icap_first_event);
> -
> -	spin_unlock_irqrestore(&fim->lock, flags);
> -}
> -
> -static int fim_request_input_capture(struct imx_media_fim *fim)
> -{
> -	init_completion(&fim->icap_first_event);
> -
> -	return mxc_request_input_capture(fim->icap_channel,
> -					 fim_input_capture_handler,
> -					 fim->icap_flags, fim);
> -}
> -
> -static void fim_free_input_capture(struct imx_media_fim *fim)
> -{
> -	mxc_free_input_capture(fim->icap_channel, fim);
> -}
> -
> -#else /* CONFIG_IMX_GPT_ICAP */
> -
> -static int fim_request_input_capture(struct imx_media_fim *fim)
> -{
> -	return 0;
> -}
> -
> -static void fim_free_input_capture(struct imx_media_fim *fim)
> -{
> -}
> -
> -#endif /* CONFIG_IMX_GPT_ICAP */
> -
>  /*
>   * In case we are monitoring the first frame interval after streamon
>   * (when fim->num_skip = 0), we need a valid fim->last_ts before we
> @@ -435,14 +387,8 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
>  		spin_unlock_irqrestore(&fim->lock, flags);
>  
>  		if (icap_enabled(fim)) {
> -			ret = fim_request_input_capture(fim);
> -			if (ret)
> -				goto out;
>  			fim_acquire_first_ts(fim);
>  		}

As suggested by the checkpatch.pl:
WARNING: braces {} are not necessary for single statement blocks

> -	} else {
> -		if (icap_enabled(fim))
> -			fim_free_input_capture(fim);
>  	}
>  
>  	fim->stream_on = on;
> -- 
> 2.17.1
> 

Apart of this, patch looks good to me.
Thanks.

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
