Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8D558AB6E
	for <lists+linux-media@lfdr.de>; Fri,  5 Aug 2022 15:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240655AbiHENMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Aug 2022 09:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237742AbiHENMp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Aug 2022 09:12:45 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C940C1F2E1
        for <linux-media@vger.kernel.org>; Fri,  5 Aug 2022 06:12:42 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t1so3365172lft.8
        for <linux-media@vger.kernel.org>; Fri, 05 Aug 2022 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=t/8LVIjMjMtifqjxq4IosBgupuLi3Ozw09/5VJFa+fM=;
        b=tGlkH0R5QgmO3NyvNYVmpxwgU69IEQmZqDRmCF7+RvZHDSjauqVRjuXnhiMjU/0Hxu
         pp1OWNJePW4LBTLEI/whfNN++jsQfkYQFSjlPuU7a+my41xaN6UcIcvT4795XY7ykyzf
         xqOGnGXVvKDqcPMMvJLD9RqKFLY4fINVTl0fPA3TE29aZZZF6zbHMiyAwaHI+dK7FxoW
         Xw7tiOyJ8lnpFkd3vT83rdvCCiLBQJAAUwJ++VCPHS3ywxHZBprd9sdK9pJ7CGBuJaAj
         Ymbbn/AcX4+cyF7/gJzi7I3XeOW2ULhmKIBAahOVrDXh3QYcgHWaMp++nBYhfFf8UfYd
         rdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=t/8LVIjMjMtifqjxq4IosBgupuLi3Ozw09/5VJFa+fM=;
        b=U8gh9otM4lErsI2PPaMjl/nhQJRzOBrLowF0Y80s9IeJb5EKnUNz4B0YNj69veugX6
         aELYm57ZOheLyAPW/9PwjTwhm/S1Aam76CWurYcXVPPXrC+sQbhXPv7cuTX450JUGjP/
         9SBur/Hx4A576xJXQf4HEVBsz0YcV7K819BGF9uk7VA3DNt0X36ynBDoJQ5Tin4rKYNX
         cN/BF+tbDJc+0JWDHajBQwoc86jTO1yAMPXwegbtypUv7Pr5YUuIKkUQm6P4fziqdnwD
         4yMZJj6Xt2h6NDDeUOyz57fquBfO5oZOdAHTe98L9VlQrLPghgtYeUe5Lk3ytJUMm43x
         HPsg==
X-Gm-Message-State: ACgBeo0UZEB7M8hsYff7y8/mjdmeKPb8a4Fy3MjkHFkp3dvLBHIcwYvG
        tJ9RqyyTUL/2cQ3XPhYonXqPfw==
X-Google-Smtp-Source: AA6agR42Hh5lsk8zdVjHUrOm+xUmo6Pkvw4GiWCd8FWMsEkS64EA74QTy3tQU07tBzxzrXfGqwa9ig==
X-Received: by 2002:a05:6512:2284:b0:48b:492e:eeb5 with SMTP id f4-20020a056512228400b0048b492eeeb5mr801147lfu.616.1659705161201;
        Fri, 05 Aug 2022 06:12:41 -0700 (PDT)
Received: from [192.168.1.101] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id k15-20020a05651c10af00b0025e6de76589sm460372ljn.106.2022.08.05.06.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 06:12:40 -0700 (PDT)
Message-ID: <264c907b-2f0a-2721-6b4b-be7dfd9ff61f@linaro.org>
Date:   Fri, 5 Aug 2022 16:12:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] media: venus: dec: Handle the case where find_format
 fails
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
 <20220726021455.1814096-2-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220726021455.1814096-2-bryan.odonoghue@linaro.org>
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

Hi Bryan,

You forgot to CC: stable.

On 7/26/22 05:14, Bryan O'Donoghue wrote:
> Debugging the decoder on msm8916 I noticed the vdec probe was crashing if
> the fmt pointer was NULL.
> 
> A similar fix from Colin Ian King found by Coverity was implemented for the
> encoder. Implement the same fix on the decoder.
> 
> Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")

Cc: stable@vger.kernel.org  # v4.13+

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index ac0bb45d07f4b..4ceaba37e2e57 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -183,6 +183,8 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
>  		else
>  			return NULL;
>  		fmt = find_format(inst, pixmp->pixelformat, f->type);
> +		if (!fmt)
> +			return NULL;
>  	}
>  
>  	pixmp->width = clamp(pixmp->width, frame_width_min(inst),

-- 
regards,
Stan
