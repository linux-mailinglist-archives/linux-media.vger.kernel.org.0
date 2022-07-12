Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C2E571AD7
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 15:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbiGLNIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 09:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232972AbiGLNI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 09:08:26 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACD3B6DA1
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 06:08:14 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id os14so14225355ejb.4
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=99ArxJ74Up+Rl9qxGK9C9Bp8YVC2rxW4MHDig6MxA8Y=;
        b=n1zx8Cnyq8VKBNPvtKwlWDnRkBtXs5wUKRAEDFTm0J9VCWwd4ep6TLgxySGSVueeV3
         IFtrIO2Qh0b1SpOpviSMc5A2+URhNsHJDP4lGQKwGhyeyxEUd81Av/I4k8RtM9tm8GRC
         4yQ6yRVpGeCLOH7+JnLfPb/TEprdFl9+4e0uh6xfJmnnByU73ktJeCDzGbWp/foZgZa+
         z27QiZk5dn3KydS9IYV+B4ZgvJmu1zh6L38EakEatyH/SdKlJ6bLCq/ujhgw6xllN5tm
         yGEgpyyySQWf9xycRvKxbtjo93a0cp7LyF/iqeV1m6xrtJ7moGcU4F8K5S0csYv9elmT
         R3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=99ArxJ74Up+Rl9qxGK9C9Bp8YVC2rxW4MHDig6MxA8Y=;
        b=Usfsk+PRoCGHu2tD8SbyjME8O9lCEflkYMADQHwk5Gcdbto+7KgSalqHbw/iOTqXT4
         ocqNsrTtDswNlrr43uJJkTHD3UVNPpeLaUOY81TWiCBeggK4Oer32PhXjtHRIVvaw3wr
         b2lFSeKE51uOCM65gMdIgB6UVd8iejYjLZOcVtUsycfNTtVuA59VxegsHdxIaSKOm25v
         k+USEUdo396P+6OXkPp76n6HvtC+qwriub8+OZL/M4xWxVBwAdLYnpUIzeHxiXlOIPYW
         4CqYRc7D7XzhxpoXmf6eNqikCa3HrHzqXim+/uhdUsMv0gLPyAKaPo9Ytz2VUIEkltKO
         2r/Q==
X-Gm-Message-State: AJIora9naAjiXYa7VTdG12GcQexaTVTr0BWV79LirugoCT/geKfd0JZO
        alTDE/Nmeq3Rv4kIaadlkvI2qCdf2t6vYOtI
X-Google-Smtp-Source: AGRyM1u9Fb3EbUPRii9+SCTdJbPohxi4miYFp4XttTH6g9x31IKlVyeeSdd2athTVTsl6+GpDMLtFA==
X-Received: by 2002:a17:906:49:b0:6f3:bb5e:54a8 with SMTP id 9-20020a170906004900b006f3bb5e54a8mr23064954ejg.534.1657631293484;
        Tue, 12 Jul 2022 06:08:13 -0700 (PDT)
Received: from [192.168.1.11] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id y26-20020a056402135a00b00435a742e350sm6038843edw.75.2022.07.12.06.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 06:08:13 -0700 (PDT)
Message-ID: <7ba24360-d038-70ed-95e2-9b8261cfd428@linaro.org>
Date:   Tue, 12 Jul 2022 16:08:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv2] media: venus: venus_helper_get_bufreq(): req is never
 NULL
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <d9184cd6-6cef-0df4-5247-8119d7bdb25b@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <d9184cd6-6cef-0df4-5247-8119d7bdb25b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the patch!

On 7/12/22 13:47, Hans Verkuil wrote:
> Fix a smatch error:
> 
> drivers/media/platform/qcom/venus/helpers.c: drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
> 
> After checking how venus_helper_get_bufreq() is called it is clear that
> req is never NULL, so just drop the checks.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 5c1104379c49..60de4200375d 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -671,8 +671,7 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
>  	unsigned int i;
>  	int ret;
>  
> -	if (req)
> -		memset(req, 0, sizeof(*req));
> +	memset(req, 0, sizeof(*req));

I wonder, can we just return EINVAL if req == NULL? By that way we could
avoid future errors.

>  
>  	if (type == HFI_BUFFER_OUTPUT || type == HFI_BUFFER_OUTPUT2)
>  		req->count_min = inst->fw_min_cnt;
> @@ -694,8 +693,7 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
>  		if (hprop.bufreq[i].type != type)
>  			continue;
>  
> -		if (req)
> -			memcpy(req, &hprop.bufreq[i], sizeof(*req));
> +		memcpy(req, &hprop.bufreq[i], sizeof(*req));
>  		ret = 0;
>  		break;
>  	}

-- 
regards,
Stan
