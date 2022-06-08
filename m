Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC1A543DA8
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 22:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbiFHUnT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 16:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiFHUnS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 16:43:18 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A563EAB8E
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 13:43:16 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id x6-20020a1c7c06000000b003972dfca96cso353967wmc.4
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 13:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FjhE5PPiSPANLbERBUoaLIjjd9QBlbuIaGPi78yCQPY=;
        b=X7eL2PC8+p8RlO9EuZXV7hUADUmUGDLPB21/oiOrCQ1TJgUzf0S6Jh4eS5UJmteeHC
         9wE88WK5AAOjs10hdvEURZX3KTFe9yR4phHAqfYssU05BHAoiRAKC/Xpx6OF71DqlqQw
         vfLepy8+F7dxXW3ENVNR5RHySeM9VautEk6JnEPH+zxcPtEPK1JX0jmvVvMqxuSzRLy2
         UQ6EudG1mp2COlORH5JdlA9tQxlFk5kpVyw6VQRtMA1Xl+H2MR7bmfyDd/bzV+bxrt3r
         Y3II48yLr/kCUsC0iQj0/DbjwJXXcd0jjvLFpGBtgj95YOSMDHWr8dmWMDr50tlHOnXK
         q4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FjhE5PPiSPANLbERBUoaLIjjd9QBlbuIaGPi78yCQPY=;
        b=kSaoo0DlTSDsECI3EKZRTQsc/bp7t4Q03e5j+uQySfsSskyVnzwfmLppXi2mArrjt9
         9xC8RQYvsIWjW+Js0Yyw/FnscdrCTT8DqjmaKfQrybQWCylYWSGaFZ+cvFCGQIQxyJCW
         N+AO41KuS3ysjuBINZ6U6g0QIG45QBmtO/napWE8TZdcZl0iAK1AedH60FnzgrwX8usk
         TSXB7zv0xBrq3xoQ50ljKvJWDicQnzdscYozhXnI5GeX/VIPsxsAAsnhLMTQdAITreDX
         o1lq97zzsVUBxjVsjmB0aDA6TVbpvUbETKtRWBv5ufgF2IATTzMBkTzvodw7DR7RXMdI
         0Nyg==
X-Gm-Message-State: AOAM532tPtQ9V0rCL1nocVtIf1RD3GJxcy/iEM4VkzHWIAUflZvBJ8jk
        +OBiLn23rVbL3SMmwK83HQ4=
X-Google-Smtp-Source: ABdhPJy1raBmoIyJjdtXT7dQKKRodaNcG8RPUZurnfws3uUCnWCKRMZH3/kVeq8lMAqSXvlIC1A/nQ==
X-Received: by 2002:a05:600c:1910:b0:394:8517:496e with SMTP id j16-20020a05600c191000b003948517496emr1070904wmq.24.1654720994460;
        Wed, 08 Jun 2022 13:43:14 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h24-20020a05600c145800b0039c54bb28f2sm8887353wmi.36.2022.06.08.13.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 13:43:13 -0700 (PDT)
Message-ID: <a0293197-845b-0b95-5abe-6003c4692ab4@gmail.com>
Date:   Wed, 8 Jun 2022 21:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: rkisp1: Don't create data links for non-sensor
 subdevs
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        dafna@fastmail.com, heiko@sntech.de, foss+kernel@0leil.net
References: <20220606225149.2941160-1-djrscally@gmail.com>
 <20220607164125.oabtqz6kh5bo6k6v@uno.localdomain>
 <c328e7e6-8d22-2480-38f0-f05528c548dc@gmail.com>
 <20220608153416.ciwiwg4tbfyetprh@uno.localdomain>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <20220608153416.ciwiwg4tbfyetprh@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On 08/06/2022 16:34, Jacopo Mondi wrote:
> Hi Dan,
>
> On Wed, Jun 08, 2022 at 03:25:36PM +0100, Daniel Scally wrote:
>> Hi Jacopo
>>
>> On 07/06/2022 17:41, Jacopo Mondi wrote:
>>> Hi Dan
>>>
>>> On Mon, Jun 06, 2022 at 11:51:49PM +0100, Daniel Scally wrote:
>>>> With the introduction of ancillary links, not all subdevs linked to
>>>> the ISP's v4l2_dev necessarily represent sensors / bridges. Check the
>>>> function for the subdevs and skip any that represent lens or flash
>>>> controllers before creating data links.
>>>>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>>
>>>> This should fix the issues that have been noticed, but perhaps a new flag like
>>>> MEDIA_ENT_FL_HAS_SOURCE or something would be a better way to denote subdevs
>>>> that need data links?
>>>>
>>> I agree this a bit fragile...
>>>
>>> I noticed ancillary links are only created for subdev notifiers,
>>> which have a populated 'sd' and consequentially an entity. Could an
>>> helper that walks the links of the notifier's subdev links and checks
>>> if the subdev at hand is already linked, help ? Maybe with an optional
>>> set of link flags to match on ?
> This is actually a mess, as the list of links to be walked is the list
> of the sensor's notifier, not the one of the rkisp1. Bad advice,
> sorry..


No problem!

>>
>> Or maybe just check if the subdev's notifier is the same as the rkisp1's
>> notifier? Like:
>>
>>
>> if(sd->notifier!= &rkisp1->notifier)
> Not all subdevs will have a notifier, won't they ? In facts only
> sensor that registers a notifier for their connected lenses/flashes
> will have one.


sd->notifier is the one the subdev binds to, so the rkisp1 in this case.
The notifier that's registered by the sensor would be
sd->subdev_notifier...so I think this will work - any subdev that gets
to this point should have a notifier, which will be the rkisp1 for the
sensors and the sensor for the VCM.

>
> Anyway, I think the issue here is that we walk the list of all subdevs
> registered to the root notifier's v4l2_dev.
>
> All async subdevices matched in the notifiers chain will end up being
> registered to the root notifier's v4l2_dev, hence also lenses and
> flashes will appear in this list.
>
>         list_for_each_entry(sd, &rkisp1->v4l2_dev.subdevs, list) {
>
>         }
>
> Can't we do like the CIO2 does, by walking the list of async subdevs
> registered to the root notifier only ? This list should not include
> lenses and flashes if I'm not mistaken.
>
> 	list_for_each_entry(asd, &rkisp1->notifier.asd_list, asd_list) {
>
>         }
>
> You can cast the struct v4l2_async_subdev back to the wrapping struct
> rkisp1_sensor_async and from there get the sd to create the links on.
> Could this work in your opinion ? I'm sorry I can't test it right
> away...


Yeah I think this should work fine too (it's why the ipu3-cio2 driver
doesn't experience the same problem) - I can see how easy it is to
switch it over

>
>
>
>> continue
>> That's a bit less clunky than both other solutions I think
>>>
>>>>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>>>> index 3f5cfa7eb937..e90f0216cb06 100644
>>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>>>> @@ -134,6 +134,10 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>>>>  		    sd == &rkisp1->resizer_devs[RKISP1_SELFPATH].sd)
>>>>  			continue;
>>>>
>>>> +		if (sd->entity.function == MEDIA_ENT_F_LENS ||
>>>> +		    sd->entity.function == MEDIA_ENT_F_FLASH)
>>>> +			continue;
>>>> +
>>>>  		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>>>>  						  MEDIA_PAD_FL_SOURCE);
>>>>  		if (ret < 0) {
>>>> --
>>>> 2.25.1
>>>>
