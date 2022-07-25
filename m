Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D61257FDAA
	for <lists+linux-media@lfdr.de>; Mon, 25 Jul 2022 12:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbiGYKhy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 06:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbiGYKhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 06:37:52 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3077010FFB
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 03:37:51 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso9083435wma.2
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=+9DH2yvpmzJTbR5IRlHExx56HEvkEyqIpYZIUzY5w+A=;
        b=FJps3xWD3fTcLB5G6iYtWvZ04LSQQ460w2JesdVKAYJcYQ0VZ2CeLNBqG8wT1SwGTZ
         KxkkceVqsAXI0cmlTQ8/iOH/Ad6WR+ID84f0jCBhf6PN+z5SplCiEg/3GUKUFaMiuMkW
         EviuOr15IgnDYAMFTARD+yJXWwCBjtGCt+5EMeClBR1ooU0CiwdwcioQbTzXwJ/inTZS
         ULH3P3Rdq1vUgXkhicNx6sDLb12vG/rq2ROAirRjQBh6bW+fpV9TKJtGuuexSuF7YdDp
         /vaRsg99tahX6PHl3UaF6xcyxO40ipCFmysAftFWor/QqI2Tnv/oZT4TXYOyTgnrXKyl
         W+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+9DH2yvpmzJTbR5IRlHExx56HEvkEyqIpYZIUzY5w+A=;
        b=09zWFwAHRJzWX6ojsUCqxPzxc/y/JLZiv+cBwsqgoPCWw2WcQIKcWlnrv1jd6Znmy6
         G6TbLQXNihUbOe+lV/pdjR17Ql2hb2KNizz5fMKqVSEJahDjMplGTZ0owFYvj8YXAnWj
         713gBbLYOqNDpDNmUqvLn0s7h29Ryx3MBeBYRupqwMBcYSwHOXmZ/Zir503maQa2Qx2e
         o+yvrAtLyP2lbXZpVjWuELL/pC5YVm8J59y9hmaFeroql4oHRBx1YQeE/Lq9kWhHjHaQ
         n0N2mGiP+9CK5m3/qvofYZY1AKXX0QbpKP92FTzOHd2t5Ym9uLtdjPGiOcMt5Ve8tMF/
         6GWQ==
X-Gm-Message-State: AJIora/LN4GCBz5tczF4JXvz0BEkEb4sjADLOwb4l3ZjkP47YJw7gQ3H
        i9HSH8+/A/AI2YAMd1uV4TZ02w==
X-Google-Smtp-Source: AGRyM1ui0IeqFV27TNP9tXSKwFKHp50Fq3KFu4y2q1dEhoKO6vTUYsV1xBAWfptX9qaAPUV9SUc6OQ==
X-Received: by 2002:a1c:f313:0:b0:3a3:1117:282d with SMTP id q19-20020a1cf313000000b003a31117282dmr21119036wmq.40.1658745469737;
        Mon, 25 Jul 2022 03:37:49 -0700 (PDT)
Received: from [192.168.1.6] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id y2-20020a5d6142000000b0021d70a871cbsm11606346wrt.32.2022.07.25.03.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 03:37:49 -0700 (PDT)
Message-ID: <83fcf3ef-9b85-2307-c5f2-c4609af059f7@linaro.org>
Date:   Mon, 25 Jul 2022 13:37:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/7] venus : Addition of control support -
 V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
Content-Language: en-US
To:     Viswanath Boma <quic_vboma@quicinc.com>,
        video.upstream.external@qti.qualcomm.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220712122347.6781-1-quic_vboma@quicinc.com>
 <20220712122347.6781-2-quic_vboma@quicinc.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220712122347.6781-2-quic_vboma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/12/22 15:23, Viswanath Boma wrote:
>   V4l2 encoder compliance expecting minimum buffers support for the application to allocate
>   buffers as per the control support values.

Please start the sentence from the beginning.

> 
> Change-Id: Idb41ff7dce8b8138f28df01d045eae6facf7e93d

No Change-Ids, please.

> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 37ba7d97f99b2..95fdad160732b 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -355,7 +355,7 @@ int venc_ctrl_init(struct venus_inst *inst)
>  	struct v4l2_ctrl_hdr10_mastering_display p_hdr10_mastering = { {34000, 13250, 7500 },
>  	{ 16000, 34500, 3000 }, 15635,	16450, 10000000, 500 };
>  
> -	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 58);
> +	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 59);
>  	if (ret)
>  		return ret;
>  
> @@ -435,6 +435,9 @@ int venc_ctrl_init(struct venus_inst *inst)
>  		V4L2_MPEG_VIDEO_VP8_PROFILE_3,
>  		0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
>  
> +	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,

You did not provide a g_ctrl handler for this ?

> +		V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 4, 11, 1, 4);
> +
>  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
>  		V4L2_CID_MPEG_VIDEO_BITRATE, BITRATE_MIN, BITRATE_MAX,
>  		BITRATE_STEP, BITRATE_DEFAULT);

-- 
regards,
Stan
