Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE6467B171
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 12:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235513AbjAYLex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 06:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbjAYLer (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 06:34:47 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE17A1164E
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 03:34:45 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t18so3911657wro.1
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0whpO4cbXzR1tiN4DzvNKJ/HfGU7YFSCpWie8Zua84=;
        b=RWwzCj7DK1Fz/TN8EFMu7rDdV1mSR/g0Wz3R8BwTGXUXr8yUXYGZQxTLgQHRdsA2Ap
         36LcVagHyyadflB0xtMaLbmSD0ADo0vejz1kKy/2MyaDI85e5mhgrXXpXtASMorWgIMa
         SDRnX4yOV+eopZn/JOmDZEJuldoOZ2OtLMPa8dq32fqwq/bve/8wxOeqEeexaoUCRDvh
         qGL1cMJEQKOTKnn5+wAkVFynC5kHwxFplTQOxOYflsdArjuXjzlSMODjgP/2WA2pD29T
         +rxwLf0M3ozMPPBHtg2UM1fa+SdTJp54C+kXiZ+PyBK+M3HcBwY892q6c6yebxQ0e6jU
         qq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0whpO4cbXzR1tiN4DzvNKJ/HfGU7YFSCpWie8Zua84=;
        b=1OZrbhTO/vK7OUeyWJ1zQ/0m4Od0b+szdIf/NYy7DivPFoj9F+Ia5JnIa+mYjTIvYP
         QAH4KNMwwZgu7xwxTWzgkB+wWAjSHB4MlYyd3LMiIWJr2msswraENvZ5OTJ4NLfzeOki
         dox2XR7yakuRXCdrAxDvC7Z6HGOW9cx5vKea5tb/7P8xAZwsxGu3Kw43zFHzfua8vrcs
         XVzSQTXQCbyV5yMUui+C2Gihaa6x2o90OSSC2Ajt3zGwsl4FJbeNToGaWsK+cjz7SZon
         y1pOajGXL5kmzrL5dggeT6+H/GEVRCkKfZGjBxMRg0+R3nPSHUPOvzZNXo/XgPQvnLrf
         q0Ag==
X-Gm-Message-State: AFqh2koIf16tQC/bhPXLuyXHcOaMsCTuWSugsQ7NXbujqXhR4ffJy3sg
        01KsR2ltXoxte6vnK+uOozVPGg==
X-Google-Smtp-Source: AMrXdXtME4KCY+RVtSIc4GGY1hVD6gUYg4Y0Dc+IxuYWScp4BM/4Z6IuD8cxwhvwY2aeimwydwh6Ew==
X-Received: by 2002:adf:fbd1:0:b0:2bd:bae0:8de5 with SMTP id d17-20020adffbd1000000b002bdbae08de5mr25285912wrs.58.1674646484139;
        Wed, 25 Jan 2023 03:34:44 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g9-20020adfa489000000b002b065272da2sm4338563wrb.13.2023.01.25.03.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:34:43 -0800 (PST)
Message-ID: <78479f8d-4565-cff0-5ba0-bdfb0e40642e@linaro.org>
Date:   Wed, 25 Jan 2023 11:34:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: camss: Missing cleanup on probe error
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, Todor Tomov <todor.too@gmail.com>,
        Robert Foss <robert.foss@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <5898403.lOV4Wx5bFT@g550jk>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5898403.lOV4Wx5bFT@g550jk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/01/2023 20:02, Luca Weiss wrote:
> Hi all,
> 
> I hit an issue that was already fixed with upstream commit 3d658980e6da
> ("media: camss: Do not attach an already attached power domain on MSM8916
> platform") but this showed that some error handling is missing in camss_probe.
> 
> After these errors the resources aren't cleaned up and e.g. sensor drivers
> still try to probe but fail quite badly because some things are NULL or
> whatever.
> 
> [    1.979098] qcom-camss fda0ac00.camss: Failed to configure power domains:
> -17
> [    1.989327] qcom-camss: probe of fda0ac00.camss failed with error -17
> 
> The commit causing this (or at least part of this) is 2f6f8af67203 ("media:
> camss: Refactor VFE power domain toggling")
> 
> I tried a bit to add some error handling but in this case it now fails at
> v4l2_device_unregister_subdev -> media_device_unregister_entity ->
> __media_device_unregister_entity -> ida_free.
> And I'm not really sure how to fix (and honestly not super motivated).
> 
> See following patch (formatting probably messed up, sorry). Maybe someone who
> knows a bit more about the driver or the media subsystem can fix this, thanks!
> 
> Regards
> Luca
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/
> platform/qcom/camss/camss.c
> index 16545cecc4f4..0ba3c378d241 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1836,21 +1836,26 @@ static int camss_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	ret = camss_configure_pd(camss);
> +	//ret = camss_configure_pd(camss);
> +	ret = -17;
>   	if (ret < 0) {
>   		dev_err(dev, "Failed to configure power domains: %d\n",
> ret);
> -		return ret;
> +		goto err_configure_pd;
>   	}
>   
>   	pm_runtime_enable(dev);
>   
>   	return 0;
>   
> +err_configure_pd:
> +	media_device_unregister(&camss->media_dev);
> +	media_device_cleanup(&camss->media_dev);
>   err_register_subdevs:
>   	camss_unregister_entities(camss);
>   err_register_entities:
>   	v4l2_device_unregister(&camss->v4l2_dev);
>   err_cleanup:
> +	v4l2_async_nf_unregister(&camss->notifier);
>   	v4l2_async_nf_cleanup(&camss->notifier);
>   
>   	return ret;
> 
> 
> 

I'll take a look
