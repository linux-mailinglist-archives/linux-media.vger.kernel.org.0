Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D43B870059E
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 12:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240603AbjELKdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 May 2023 06:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240747AbjELKcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 May 2023 06:32:12 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356A3103
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 03:32:05 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30644c18072so6555740f8f.2
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 03:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683887523; x=1686479523;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAnpRKsNNsPJR0jiVH1DLgKUN7xjI4mWjdanQOwVOxY=;
        b=lZAHNBfWwi8nV8+zRKxtT3+FpPIHoW2LILoVRNDytv6RvR7Iz4ZIvKyt4TiSOKPPCG
         3ZnJRrsTfxN2Dggt48yDOwsYIwDsL28vn2Il6OUbWaooVBOXJds90NFOwYrqiqRw2d9Q
         zJi/lEgH/wqf8FMPU+bQuL1ini23L/klQ3zdLzcbqyPk9+7O4PE0R3UnWcZMskahvs+4
         VQpwET4WuCbcTlOzeu+I+Nnx78WJcx5/12OyggCNL9JJW/L/uwLQvdPxdgAKztXfHs1/
         7Ot4lVUnu6R5HCTmQbgPgNjn+ZeA6CCRVggrX20VZEStRibsxRYjw2Crvqu46LLg52yl
         wLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683887523; x=1686479523;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAnpRKsNNsPJR0jiVH1DLgKUN7xjI4mWjdanQOwVOxY=;
        b=RDbtPOCZHJsTc+o/hZMnO1cNt6B1rtG5zTx5UUcD2VAOLHY7BcA2mtfKHf4/eTD6I4
         eRuBNm3BhvG8b6OaLAqQG+C122sd7uF0z1iGYNrpxt/4udt31OkrDbb1I5OcchkD0PSn
         TdPQf/R3nPWHdV2EEcajeIGzaC9lAKAvKGHmvZm5RjrUSeWALok1lr2NO/hkrIAChlNF
         oAy1TTOcISfYB6FCDoHD1/1NyWfJShqK3fjMxHd64nQvClBybJc2HS3Dpugt7ZfRxNh7
         9l74JrEa9eC7J2MjcxlpBUyEUbLXXWuqcoEGk6JGDCK1uQmnrVTCltE0iY9udtKobeNh
         obKg==
X-Gm-Message-State: AC+VfDwt3qhxiF03Z4wVK/vAWVA9zEPPyp4xVzQe0yLf1ngt0UuKdbjH
        DsHwNnN6/dlby7/606/RLty09Q==
X-Google-Smtp-Source: ACHHUZ6KyB5gE8dQVR15cHSYE2uY/6ZibWJZByncI+oHcNvoIp1V1QXwTq6TEyhIGwxFHlLKi1xowg==
X-Received: by 2002:adf:dc10:0:b0:307:8c47:a266 with SMTP id t16-20020adfdc10000000b003078c47a266mr13440421wri.61.1683887523678;
        Fri, 12 May 2023 03:32:03 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t25-20020a1c7719000000b003f43f82001asm8234354wmi.31.2023.05.12.03.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 03:32:03 -0700 (PDT)
Message-ID: <c4d6ba40-fbcd-3fce-62af-f2b7883a30f6@linaro.org>
Date:   Fri, 12 May 2023 11:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>,
        stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
 <2e61e054-105c-ae22-77b8-a3f41fe3eff0@linaro.org>
In-Reply-To: <2e61e054-105c-ae22-77b8-a3f41fe3eff0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/05/2023 17:37, Bryan O'Donoghue wrote:
> On 14/04/2023 11:12, Martin Dørum wrote:
>> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>>> =4xx. The code used to unconditionally set the property in
>> venc_set_properties, which meant that initializing the encoder would
>> always fail unless the hfi_version was >=4xx.
>>
>> This patch changes venc_set_properties to only set the
>> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
>>
>> Signed-off-by: Martin Dørum <dorum@noisolation.com>
>>
>> ---
>>
>> I have an APQ8016-based board. Before this patch, the Venus driver
>> would simply fail with EINVAL when trying to request buffers
>> (VIDIOC_REQBUFS). With this patch, encoding works
>> (tested using gstreamer's v4l2h264enc).
>>
>>   drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>> b/drivers/media/platform/qcom/venus/venc.c
>> index cdb12546c4fa..b3df805a8c9c 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -672,16 +672,17 @@ static int venc_set_properties(struct venus_inst 
>> *inst)
>>           if (ret)
>>               return ret;
>>
>> -        ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>> -        h264_transform.enable_type = 0;
>> -        if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>> -            ctr->profile.h264 == 
>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>> -            h264_transform.enable_type = ctr->h264_8x8_transform;
>> -
>> -        ret = hfi_session_set_property(inst, ptype, &h264_transform);
>> -        if (ret)
>> -            return ret;
>> -
>> +        if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
>> +            ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>> +            h264_transform.enable_type = 0;
>> +            if (ctr->profile.h264 == 
>> V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>> +                ctr->profile.h264 == 
>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>> +                h264_transform.enable_type = ctr->h264_8x8_transform;
>> +
>> +            ret = hfi_session_set_property(inst, ptype, 
>> &h264_transform);
>> +            if (ret)
>> +                return ret;
>> +        }
>>       }
>>
>>       if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
>> -- 
>> 2.34.1
> 
> I agree that a Fixes should be added.
> 
> Fixes: bfee75f73c37 ("media: venus: venc: add support for 
> V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")
> 
> When sending out your V2, please remember to cc -> Hans Verkuil 
> <hverkuil-cisco@xs4all.nl>
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Hey Martin.

I tried verifying the before/after of your patch last night on db410c as 
@ 
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-05-11-venus-check 


I don't see any difference with h264 playback with or without your patch.

Could you share a command to verify the bug against ?

---
bod
