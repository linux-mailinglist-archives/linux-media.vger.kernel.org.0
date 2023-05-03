Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449016F4FCD
	for <lists+linux-media@lfdr.de>; Wed,  3 May 2023 07:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjECFxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 May 2023 01:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjECFxX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 May 2023 01:53:23 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B892D4E;
        Tue,  2 May 2023 22:53:21 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso1231805a12.2;
        Tue, 02 May 2023 22:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683093200; x=1685685200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2gYMLkCf0GdPnxYplUvepPjaxodpVFlAP2MWVoU1EM=;
        b=GJIX03acJJJkPStp4sekRXecEcHrHoEvJxVEjn/NjNReTpL9zPueSYqRwy6fWUkBse
         49NGKkQ46hlOLFGQYsMlCymB7nTRzBFK7qQax/04bwHKosP9NNfHqHD148nE2kgwKN9M
         MCFCIcwYdymxWFDFz/pQe9HWeE1J/Iq10yd6+4sMft2b/V1njiA3I8+HA5mXdWwlFKfa
         h5f0F63TNgebAgXFiFU3ynJ/JksAImfiR9IV4E+tkuru6AU3hBLXYipjDbpbP1bbIktJ
         Ktv3GQieJ4P+KhHVORp3WJg8+/ccw0N9y/RL8bN0P4+Aojc9oEGue+jZt2U9u5Ngq+3T
         3CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683093200; x=1685685200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2gYMLkCf0GdPnxYplUvepPjaxodpVFlAP2MWVoU1EM=;
        b=afHn4PdrCqotcxBU+WoVlqEVxQxNM2UYx3S/wlClMCQX+bPsGJa/gi2pxCmzL++KG3
         mu1Uj7XiXNSJM5Us4nYworaqWA77jtWmK9rsf1WnKD8EuGgD695Uo3p6skDgHmIo47P1
         DGlGxmw+W2jhPBunOBJaUcbr+vsmhZmb1uhQ/IapUeN/rfXuWwqV3F4f4j70bi6hl3ZR
         biDjNg58gD68/230sCrXXyucT5LCF8sufEqySun2WVXOgm2Dx4cHUTtIW8jsl9jPzaB8
         yuA9h943XaGVKDXKl0QLkLSbfM15ikKJQYEEHKy03NJfqBNp6abD/HqP+3gX71qOgSyw
         0GKQ==
X-Gm-Message-State: AC+VfDx245ruLda2ntUMLLZshdtnSAVagzEIVV7EDfU5/Gkl4OpUgoYW
        d2YbUpnQLkMaztIBRiw4jALdMrYrFfQ=
X-Google-Smtp-Source: ACHHUZ4eDJ3PJUgsEAeenB+wTQa1fZtKVj19XcoznlgIylfQdHIcEHAIMRecOnH5Zqajj1vSjbPLlw==
X-Received: by 2002:a05:6402:47:b0:504:a2e5:d951 with SMTP id f7-20020a056402004700b00504a2e5d951mr10500573edu.13.1683093199534;
        Tue, 02 May 2023 22:53:19 -0700 (PDT)
Received: from [192.168.1.43] (hst-221-88.medicom.bg. [84.238.221.88])
        by smtp.gmail.com with ESMTPSA id d12-20020aa7d68c000000b0050bc863d32asm327326edr.27.2023.05.02.22.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 22:53:19 -0700 (PDT)
Message-ID: <33ff3062-4f50-19c4-dce3-3be17e4f7d10@gmail.com>
Date:   Wed, 3 May 2023 08:53:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
 <5a851116-561f-2d00-1310-2debc43ce249@gmail.com>
 <03da235f-0d94-60d9-8907-9caf0991c0a6@quicinc.com>
Content-Language: en-US, bg-BG
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <03da235f-0d94-60d9-8907-9caf0991c0a6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 3.05.23 г. 7:25 ч., Vikash Garodia wrote:
> On 5/3/2023 2:22 AM, Stanimir Varbanov wrote:
>>
>>
>> On 14.04.23 г. 13:12 ч., Martin Dørum wrote:
>>> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>>>> =4xx. The code used to unconditionally set the property in
>>> venc_set_properties, which meant that initializing the encoder would
>>> always fail unless the hfi_version was >=4xx.
>>>
>>> This patch changes venc_set_properties to only set the
>>> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
>>>
>>> Signed-off-by: Martin Dørum <dorum@noisolation.com>
>>>
>>> ---
>>>
>>> I have an APQ8016-based board. Before this patch, the Venus driver
>>> would simply fail with EINVAL when trying to request buffers
>>> (VIDIOC_REQBUFS). With this patch, encoding works
>>> (tested using gstreamer's v4l2h264enc).
>>>
>>>   drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
>>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>>> b/drivers/media/platform/qcom/venus/venc.c
>>> index cdb12546c4fa..b3df805a8c9c 100644
>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>> @@ -672,16 +672,17 @@ static int venc_set_properties(struct 
>>> venus_inst *inst)
>>>           if (ret)
>>>               return ret;
>>>
>>> -        ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>>> -        h264_transform.enable_type = 0;
>>> -        if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>>> -            ctr->profile.h264 == 
>>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>>> -            h264_transform.enable_type = ctr->h264_8x8_transform;
>>> -
>>> -        ret = hfi_session_set_property(inst, ptype, &h264_transform);
>>> -        if (ret)
>>> -            return ret;
>>> -
>>> +        if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
>>
>> Instead of doing these checks here you could do:
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c 
>> b/drivers/media/platform/qcom/venus/hfi_cmds.c
>> index bc3f8ff05840..2453e5c3d244 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
>> @@ -1064,6 +1064,7 @@ static int pkt_session_set_property_1x(struct 
>> hfi_session_set_property_pkt *pkt,
>>                 break;
>>         }
>>         case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI:
>> +       case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8:
>>                 return -ENOTSUPP;
>>
> This may still deinit the session from [1] based on failure return value.
> 
> [1] 
> https://elixir.bootlin.com/linux/v6.3/source/drivers/media/platform/qcom/venus/venc.c#L963

No, it will not fail because of:

https://elixir.bootlin.com/linux/v6.3/source/drivers/media/platform/qcom/venus/hfi_venus.c#L1426


-- 
regards,
Stan
