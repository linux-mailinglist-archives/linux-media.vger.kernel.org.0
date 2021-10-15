Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319C642F4F9
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 16:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236941AbhJOOQq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 10:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbhJOOQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 10:16:45 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9098C061570;
        Fri, 15 Oct 2021 07:14:38 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o20so26853844wro.3;
        Fri, 15 Oct 2021 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=u0LS74NGxs4Ls/GakwMB1m+mPagiusP+lWbngHZ06ko=;
        b=fuZ/x4GU2rmFgoIzrLqjckyOIpI613dnJ2kqkRuaHIaR4+dHGImUHHhrcJr1HMBoUT
         g9QQZ7oqDqqxBtGke4yYq9WOpJumj9DLVvfB3ege/Q5qiGlX5efDDemkfhZtspfjGrE1
         xcHP0/dWDI2XaEDprmBeV/Dzfkxdlh5tSmFvOUV6qaY5Wfwq4ET+9UR+LUEMUacORyzq
         xzBIZ2gjRKm1ghUIefRupZc9zCpTJ+r+x/xA6wW8Uz0SPAOQnH9AtLy7HkmUokWJY14/
         TSCczUZ0t+pkyjRKA0FV2Hnjh/t6dSBmNONPedldjKaSMe9PrznvxNaJQSBplmZfZ9lQ
         8KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=u0LS74NGxs4Ls/GakwMB1m+mPagiusP+lWbngHZ06ko=;
        b=f9k9mzq4EplxrmPF9JMSD/BNxjEQNet9K41KKMvxecd94CPqYuvB1vHGTabiZWcnmN
         VgoSinKqnuKiHbz5H+ygRrVMV216PxKIZCVhkL7wTWPb0+qM22yz4pBXrl144Ewx/Qx4
         ZMgZ5gYQswtyCdRYxsBBfges9xfF+7q6QCHB23VDU0mKXR5LxINA2mrmOtC7OGqZAp6M
         5plsO74sIX0zNWog8wtVD9th9pVmbDrq+XvB0ZwScmQ9dsBP2ERJG4WB8YeX3pmg4lH6
         cE2hYwAOC+kO2mNudgT0sW7ySXxuAgZxdNxUCSMl6MBJN5mKW6IklxaXHQA+JTiiOc6t
         BxeQ==
X-Gm-Message-State: AOAM532lTFbdEzoNCr2XHaMH6thXZL9RyzvT6aAOW4VuBBOhVvpmvY3a
        MHctUasH9AJQYXupYAmzXA==
X-Google-Smtp-Source: ABdhPJx1KlAErP0MVOhgnRMDJYrRtFEAIhfxUA8d7qKZdigdDGl26QfV464by6KddRDp8E6k11KyRQ==
X-Received: by 2002:adf:bc48:: with SMTP id a8mr14440226wrh.19.1634307277266;
        Fri, 15 Oct 2021 07:14:37 -0700 (PDT)
Received: from ?IPv6:2a02:810b:f40:4200:8be2:5749:97e2:d75b? ([2a02:810b:f40:4200:8be2:5749:97e2:d75b])
        by smtp.gmail.com with ESMTPSA id b19sm11080921wmb.1.2021.10.15.07.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 07:14:36 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] media: HEVC: RPS clean up
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        hverkuil-cisco@xs4all.nl, jc@kynesim.co.uk,
        ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
 <21222555.EfDdHjke4D@kista>
 <3c5851ac-3b8a-decc-93c1-01a65b1f8611@collabora.com>
 <1705005.VLH7GnMWUR@kista> <4f8f6da3-70b1-5dd8-27b7-c9f9fd37920b@gmail.com>
 <9d9645a1-9d44-4fec-55e7-5b0a1c69e7ab@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <7d6df94a-e0bb-b364-5ab1-3ef4d02803dc@gmail.com>
Date:   Fri, 15 Oct 2021 16:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9d9645a1-9d44-4fec-55e7-5b0a1c69e7ab@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Am 15.10.21 um 16:06 schrieb Benjamin Gaignard:
>
> Le 15/10/2021 à 12:33, Alex Bee a écrit :
>> Hi Benjamin, Jernej
>> Am 12.10.21 um 18:08 schrieb Jernej Škrabec:
>>> CC: Alex Bee
>>>
>>> Alex, please take a look to these patches too.
>> These patches don't remove anything that would be need for rkvdec 
>> hevc - but indeed - we need some more:
>> https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/patches/linux/default/linux-2001-v4l-wip-rkvdec-hevc.patch#L242-L305 
>>
>>
>> v4l2_ctrl_hevc_sps:
>> __u8    video_parameter_set_id
>> __u8    seq_parameter_set_id
>>
>> v4l2_ctrl_hevc_pps:
>> __u8    pic_parameter_set_id
>> __u16    short_term_ref_pic_set_size
>> __u16    long_term_ref_pic_set_size
>>
>> As far as I can see, they are all part of the spec and should be 
>> therefore good to go in the uapi.
>
> Do you have any plan to upstream these fields in HEVC uAPI ?

I might be upstreaming them at some point, yes.

With this I just wanted to underline Jernej said: HEVC uapi is NOT ready 
to get unstaged yet.

>
> Regards,
> Benjamin
>
>>
>> As you might now, even rkvdec is a frame-based decoder, it doesn't 
>> fully parse slice headers in HW for HEVC and we need to set 
>> references in SW which requires looping over the slices. Downstream 
>> we have a hack to give num_slices in v4l2_ctrl_hevc_sps for doing that.
>> That could fully go away, if V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS 
>> could get dynamic array control support and would make upstreaming 
>> this a lot easier - as far as I'm concered this would be required for 
>> RPi HEVC decoder as well.
>> As a last resort we could also implement a HW specifc control à la
>> V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP - but I'd like to avoid that, 
>> knowing it would certainly be better from performance pov.
>>
>> Alex.
>>>
>>> Dne torek, 12. oktober 2021 ob 17:57:50 CEST je Benjamin Gaignard 
>>> napisal(a):
>>>>
>>>> Le 12/10/2021 à 17:34, Jernej Škrabec a écrit :
>>>>> Hi Benjamin!
>>>>>
>>>>> Dne torek, 12. oktober 2021 ob 16:35:48 CEST je Benjamin Gaignard
>>> napisal(a):
>>>>>> This series aims to clean up Reference Picture Set usage and flags.
>>>>>>
>>>>>> Long term flag was named with RPS prefix while it is not used for 
>>>>>> RPS
>>>>>> but for mark long term references in DBP. Remane it and remove 
>>>>>> the two
>>>>>> other useless RPS flags.
>>>>>>
>>>>>> Clarify documentation about RPS lists content and make sure that 
>>>>>> Hantro
>>>>>> driver use them correctly (i.e without look up in DBP).
>>>>>>
>>>>>> These patches are the last in my backlog impacting HEVC uAPI.
>>>>>>   From my point of view, once they get merged, you could start 
>>>>>> talking
>>>>>> about how move HEVC uAPI to stable.
>>>>> With your changes, HEVC uAPI controls still won't be complete. Cedrus
>>> needs
>>>>> entry point control, which in turn needs dynamic array support. 
>>>>> I'm a bit
>>> lazy
>>>>> implementing that control, but I guess I can take a look in a 
>>>>> month or so.
>>>>> rkvdec also needs more fields for HEVC. With patches collected here:
>>>>> https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/ 
>>>>>
>>>>> patches/linux/default/linux-2001-v4l-wip-rkvdec-hevc.patch
>>>>> fluster HEVC test score is reportedly 121/135 (8-bit tests only).
>>>>
>>>> Hi Jernej,
>>>>
>>>> Thanks for your feedback, getting a list of missing items in HEVC uAPI
>>>> will definitively help to fill the hope.
>>>> The patch you mention for rkvdec are already merged in mainline 
>>>> kernel (at
>>>> least for uAPI part).
>>>
>>> Are they? What about:
>>> video_parameter_set_id
>>> seq_parameter_set_id
>>> pic_parameter_set_id
>>> short_term_ref_pic_set_size
>>> long_term_ref_pic_set_size
>>>
>>> At least I don't see them in linux-next. Maybe that information can be
>>> obtained in some other way?
>>>
>>>> Cedrus needs are about num_entry_point_offsets, offset_len_minus1 and
>>> entry_point_offset_minus1[ i ]
>>>> in HEVC specifications ?
>>>
>>> Yes, Cedrus needs to know whole list of entry points. I don't think 
>>> we need to
>>> worry about offset_len_minus1, list could be pre-processed - just 
>>> number of
>>> entry points and their values.
>>>
>>> Best regards,
>>> Jernej
>>>
>>>>
>>>> Regards,
>>>> Benjamin
>>>>
>>>>>
>>>>> I would certainly wait with moving HEVC uAPI to stable.
>>>>>
>>>>> Best regards,
>>>>> Jernej
>>>>>
>>>>>> version 2:
>>>>>> - change DPB field name from rps to flags
>>>>>>
>>>>>> Please note that the only purpose of commits 3 and 4 is to allow 
>>>>>> to test
>>>>>> G2 hardware block for IMX8MQ until a proper solution isuing power 
>>>>>> domain
>>>>>> can be found. Do not merge them.
>>>>>>
>>>>>> GStreamer HEVC plugin merge request can be found here:
>>>>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1079 
>>>>>>
>>>>>>
>>>>>> With those piece of code fluster score is 77/147.
>>>>>>
>>>>>> Benjamin
>>>>>>
>>>>>> Benjamin Gaignard (4):
>>>>>>     media: hevc: Remove RPS named flags
>>>>>>     media: hevc: Embedded indexes in RPS
>>>>>>     media: hantro: Use syscon instead of 'ctrl' register
>>>>>>     arm64: dts: imx8mq: Add node to G2 hardware
>>>>>>
>>>>>>    .../media/v4l/ext-ctrls-codec.rst             | 14 +++---
>>>>>>    arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 43 
>>>>>> +++++++++++++----
>>>>>>    drivers/staging/media/hantro/hantro.h         |  5 +-
>>>>>>    .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++--------
>>>>>>    drivers/staging/media/hantro/imx8m_vpu_hw.c   | 48 
>>>>>> ++++++++++++-------
>>>>>>    .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
>>>>>>    include/media/hevc-ctrls.h                    |  6 +--
>>>>>>    7 files changed, 84 insertions(+), 61 deletions(-)
>>>>>>
>>>>>> -- 
>>>>>> 2.30.2
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>>
>>
