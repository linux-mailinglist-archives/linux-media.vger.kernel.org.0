Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4065810BF
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 12:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238102AbiGZKF7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 06:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiGZKF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 06:05:57 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728B4CE3
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 03:05:56 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id f24-20020a1cc918000000b003a30178c022so11008717wmb.3
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N4WNsjcyfHcAvLPigBZdGUVfOpccpwIBfs6yQsD7gX8=;
        b=ESZrvxX2WvzdGnsXMu2F+n2o0nF7FohKJLdTCNpgoR7+ROvnDDAn09DaAtBTYqwmT1
         1SFsj8Ikas4/K6prY75Y/I0rYhILQLxshnC8Zb4v84hLsS9fUwfNGxXPoWUOJ/juPbKp
         BeY2cE2CF3VmmopES08E6SGTH6wlF58FwnkoSecddp0qyiPqqF0+IF9bxM1TQzZlQNYm
         5yNUml05RiN0dlX9ggFJpMA+wmKBalq7o+Nd56CQzdm9zffV1aRjMIUClv5b2KunPd9C
         DYSjabnwvqkYJEDAUCSiz/fWZhf9nJc6QPj7ibnYhtR+4643fbZhPVYwO8Q4gNKtzDyD
         jwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N4WNsjcyfHcAvLPigBZdGUVfOpccpwIBfs6yQsD7gX8=;
        b=Pkt0Ae+3z8rQWucIXTMcgNJ3/KY43bnvN5/vNcikYuOThB8NquIOJ5jeYV0zbh0qOm
         VXTaiinyqWKRNPnk8T9rbW4xSgatC2HtSIwc/GlDZndD/IcjfmGLRJwwFVK4VsrErRka
         Dfn66xYZo546ScyaY9LdOPyNk5J/JTI/xvUg9bUyCuL9WvDyOQAMBnviEMapA3DqCl2Y
         Yfi68q/0n+D3LZFYLOyfCZJ+rKjx9x8WB8u4kR2N0I1YjiJZpxSsd0lMaAEFT8CQWTPR
         BX26ZD47Ja26BbgBsBe0vj0gKg2X0EuAvBjU78OtNj7/Ox+XBAJhx+0m73W29i1aZu/n
         Wt6Q==
X-Gm-Message-State: AJIora8Tevrjtdd2Cee5+YooEdZ0e39BNhSE21lL0Xsz1XB5KUmOc5PR
        UWX770SMwwYefgqwpSFHg5OqLg==
X-Google-Smtp-Source: AGRyM1tEVHzIYfFNtMUjUlEvW8Z8DmLV8atur8oUsSnmFFWYJNwuh2Drzt/T5nRAvSURuT2ygdHA/A==
X-Received: by 2002:a05:600c:4f0e:b0:3a3:3077:e5b3 with SMTP id l14-20020a05600c4f0e00b003a33077e5b3mr11328958wmq.94.1658829954941;
        Tue, 26 Jul 2022 03:05:54 -0700 (PDT)
Received: from [192.168.1.5] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm23278974wmq.7.2022.07.26.03.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 03:05:53 -0700 (PDT)
Message-ID: <51eb6fd9-928f-bd97-d603-e9096402c799@linaro.org>
Date:   Tue, 26 Jul 2022 13:05:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] venus : Addition of support for
 VIDIOC_TRY_ENCODER_CMD
Content-Language: en-US
To:     Viswanath Boma <quic_vboma@quicinc.com>,
        video.upstream.external@qti.qualcomm.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>
References: <20220712122347.6781-1-quic_vboma@quicinc.com>
 <20220712122347.6781-5-quic_vboma@quicinc.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220712122347.6781-5-quic_vboma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/12/22 15:23, Viswanath Boma wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
>   v4l2 compliance expecting support for vidioc_try_encoder_cmd
>   error details : test VIDIOC_(TRY_)ENCODER_CMD: FAIL
> 
> Change-Id: I87a655dc506f3e713e2c86ab5203ca9c45cc5e1b

Drop Change-Id and add Dikshita's Signed-off tag.

> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 1 +
>  1 file changed, 1 insertion(+)

With above comments fixed you can add my:

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 30ddb84c24997..4f10f5de7e3e6 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -589,6 +589,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>  	.vidioc_subscribe_event = venc_subscribe_event,
>  	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>  	.vidioc_encoder_cmd = venc_encoder_cmd,
> +	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
>  };
>  
>  static int venc_pm_get(struct venus_inst *inst)

-- 
regards,
Stan
