Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 420257119F0
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 00:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjEYWDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 18:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjEYWDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 18:03:49 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606E1CC;
        Thu, 25 May 2023 15:03:47 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6042d610fso1231745e9.1;
        Thu, 25 May 2023 15:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685052226; x=1687644226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwB/VQzR5iw1WvZUqpQ2MJqg0oMu1miDzM2YY00Q8Sc=;
        b=ID0MHivHi/GGtACjqTM6S+UpX6hzmXVu+eqqi8224urERISAVuI0pNQChEA4ee9YuJ
         JD0+HBmnWkP00hZmDLxzjnVk8DowgSE8iGNsjMXurG7PqIDxtV/lu1E1/Hr2/owkVBYV
         DBoIyXGIpsSxCWx2uIG33GqzFg/DyGoqeBYLlE6usD4krMCLxFdqmw3CW5Yov+IC87/2
         ohH2xpGsl5L+YgyDT/jGIJ4qCzpZAcU2AooS1KPpmx3PlVK5JQDcSOIm6svfQ4uS2bNL
         LMz0qZrCpNNqW7v1oHp0vjcbelIVJiMeY2QCkzZIk/Az4iVIF/Mr6CuFKV77LgrWGnCG
         43wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685052226; x=1687644226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwB/VQzR5iw1WvZUqpQ2MJqg0oMu1miDzM2YY00Q8Sc=;
        b=UA0d3FBi/kETQgxPPQi7byKR7H979tYVw1mUu1djgxauHDZd9bQJW4SuvIsQ/pHg3/
         aYtqEFvYxJTuj39a6Y2Uf5Df/aRPyRqsBdFKdNjlQUnDmn1o/EivPMWTOLDN6FCNOP3o
         aiS9E6fpCuHAonG9BB+P88mnrO4KfMohACRgOW9ZfwuFPdnbh3qe6Tv9hQ0OYzPflqwH
         8gKNcdOUwnfvMKXgnSVFyugZlP2O9xrz0IH5h1bKPLpazG376UZ9kEdnYhRpeO5bnglu
         EFxN/V9Wt/vMs1KFOpCvUsPLBOZAhcu9am2Q0AptQ1ZJpOveH8SfUh9I539X2BofORR2
         SJZg==
X-Gm-Message-State: AC+VfDxGO8YpqhpzBkQFQHGgnJQf6BnxDZuZEpht4T0AWgMxXz6uNnO5
        uUIDW9Dde00CXJ4Q+nYbUqw=
X-Google-Smtp-Source: ACHHUZ5bRZ2oEJ+ZA8+y1P01/rXVLL8WnYGD0m9Jp4LQVzMzQolR3F/S4kGrRelRdb6iH1YSosgcBw==
X-Received: by 2002:a5d:5268:0:b0:309:5119:7259 with SMTP id l8-20020a5d5268000000b0030951197259mr3032496wrc.20.1685052225556;
        Thu, 25 May 2023 15:03:45 -0700 (PDT)
Received: from [192.168.57.226] ([37.63.24.136])
        by smtp.gmail.com with ESMTPSA id c11-20020adfe74b000000b0030630120e56sm209689wrn.57.2023.05.25.15.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 15:03:45 -0700 (PDT)
Message-ID: <bd5a5b80-6849-bd98-0815-cc94badbec13@gmail.com>
Date:   Fri, 26 May 2023 01:03:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
Content-Language: en-US, bg-BG
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
 <5a851116-561f-2d00-1310-2debc43ce249@gmail.com>
 <03da235f-0d94-60d9-8907-9caf0991c0a6@quicinc.com>
 <33ff3062-4f50-19c4-dce3-3be17e4f7d10@gmail.com>
 <24c92a72-3d32-d6ce-172b-b127d54c3c75@quicinc.com>
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <24c92a72-3d32-d6ce-172b-b127d54c3c75@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On 3.05.23 г. 9:47 ч., Vikash Garodia wrote:
> 
> On 5/3/2023 11:23 AM, Stanimir Varbanov wrote:
>> Hi,
>>
>> On 3.05.23 г. 7:25 ч., Vikash Garodia wrote:
>>> On 5/3/2023 2:22 AM, Stanimir Varbanov wrote:
>>>>
>>>>
>>>> On 14.04.23 г. 13:12 ч., Martin Dørum wrote:
>>>>> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>>>>>> =4xx. The code used to unconditionally set the property in
>>>>> venc_set_properties, which meant that initializing the encoder would
>>>>> always fail unless the hfi_version was >=4xx.
>>>>>
>>>>> This patch changes venc_set_properties to only set the
>>>>> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
>>>>>
>>>>> Signed-off-by: Martin Dørum <dorum@noisolation.com>
>>>>>
>>>>> ---
>>>>>
>>>>> I have an APQ8016-based board. Before this patch, the Venus driver
>>>>> would simply fail with EINVAL when trying to request buffers
>>>>> (VIDIOC_REQBUFS). With this patch, encoding works
>>>>> (tested using gstreamer's v4l2h264enc).
>>>>>
>>>>>   drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
>>>>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>>>>> b/drivers/media/platform/qcom/venus/venc.c
>>>>> index cdb12546c4fa..b3df805a8c9c 100644
>>>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>>>> @@ -672,16 +672,17 @@ static int venc_set_properties(struct 
>>>>> venus_inst *inst)
>>>>>           if (ret)
>>>>>               return ret;
>>>>>
>>>>> -        ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>>>>> -        h264_transform.enable_type = 0;
>>>>> -        if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>>>>> -            ctr->profile.h264 == 
>>>>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>>>>> -            h264_transform.enable_type = ctr->h264_8x8_transform;
>>>>> -
>>>>> -        ret = hfi_session_set_property(inst, ptype, &h264_transform);
>>>>> -        if (ret)
>>>>> -            return ret;
>>>>> -
>>>>> +        if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
>>>>
>>>> Instead of doing these checks here you could do:
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c 
>>>> b/drivers/media/platform/qcom/venus/hfi_cmds.c
>>>> index bc3f8ff05840..2453e5c3d244 100644
>>>> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
>>>> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
>>>> @@ -1064,6 +1064,7 @@ static int pkt_session_set_property_1x(struct 
>>>> hfi_session_set_property_pkt *pkt,
>>>>                 break;
>>>>         }
>>>>         case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI:
>>>> +       case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8:
>>>>                 return -ENOTSUPP;
>>>>
>>> This may still deinit the session from [1] based on failure return 
>>> value.
>>>
>>> [1] 
>>> https://elixir.bootlin.com/linux/v6.3/source/drivers/media/platform/qcom/venus/venc.c#L963
>>
>> No, it will not fail because of:
>>
>> https://elixir.bootlin.com/linux/v6.3/source/drivers/media/platform/qcom/venus/hfi_venus.c#L1426
> 
> Thats correct, I missed to notice the explicit handling for -ENOTSUPP. 
> Above suggestion is better than keeping verison checks and
> 
> would also avoid deinit.
> 

Could you send v2 with suggested change?

-- 
regards,
Stan
