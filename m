Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21F86793BD2
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 13:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234438AbjIFLy3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 07:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjIFLy3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 07:54:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF201BF
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 04:54:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEDDC433C8;
        Wed,  6 Sep 2023 11:54:23 +0000 (UTC)
Message-ID: <afc857cb-3d0d-e69d-faa7-32b2c810c99d@xs4all.nl>
Date:   Wed, 6 Sep 2023 13:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] videodev2.h: apply packed attribute to union
Content-Language: en-US, nl
To:     Devendra Tewari <devendra.tewari@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <166517991147.1077487.14561113854570206898@Monstersaurus>
 <969BFFB7-0FEB-44F8-9195-4932C52FB123@gmail.com>
 <A6CA791E-98FD-430E-8A6D-8F43241CF97D@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <A6CA791E-98FD-430E-8A6D-8F43241CF97D@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Devendra,

Cleaning up some old patches in

On 08/10/2022 13:48, Devendra Tewari wrote:
> 
> 
>> On 7 Oct 2022, at 20:04, Devendra Tewari <devendra.tewari@gmail.com> wrote:
>>
>>
>>
>>> No dia 7 de out. de 2022, às 18:58, Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:
>>>
>>> ﻿Hi Devendra,
>>>
>>> Quoting Devendra Tewari (2022-04-22 20:20:31)
>>>> Fixes clang warning: field within 'v4l2_ext_control' is less than
>>>
>>> Can you detail which version of clang this occurs with? Have you tried
>>> more than one version?
>>>
>>
>> This started happening with version 14.0.1 and I continue to see it with version 15.
>>
>>>
>>>> 'v4l2_ext_control::(anonymous union
>>>>
>>>> Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
>>>> ---
>>>> include/uapi/linux/videodev2.h | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>> index 3768a0a80830..767c52c722cd 100644
>>>> --- a/include/uapi/linux/videodev2.h
>>>> +++ b/include/uapi/linux/videodev2.h
>>>> @@ -1765,7 +1765,7 @@ struct v4l2_ext_control {
>>>>               struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compressed_hdr_probs;
>>>>               struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
>>>>               void __user *ptr;
>>>> -       };
>>>> +       } __attribute__ ((packed));
>>>
>>> This is a curious fix. It's applying a packed attribute to the union,
>>> which I presume means that it's then applying the packed attribute to
>>> any item in the union.
>>>
>>> The items are all either: __s32, __s64, values - or pointers.
>>>
>>> While applying this attribute here may fix the compiler warning, I'm not
>>> sure it's clear why this is required. This file also has other
>>> locations where a union inside a packed struct is not marked as packed.
>>> Should all unions be marked with the attribute?
>>
>> Interesting - I need to look deeper into packed.
> 
> The only explanation I can think of is that this may be the only instance where a union inside a packed struct has other structs that are not packed.
> 
>>
>>> Is there any more context from the compiler warning beyond what is
>>> reported above?
>>
>> I'll post a more detailed log asap.

I haven't heard anything back, so I am rejecting this.

I am also afraid that changing this could cause unexpected ABI changes.

Regards,

	Hans

>>
>>>
>>> --
>>> Kieran
>>>
>>>
>>>> } __attribute__ ((packed));
>>>>
>>>> struct v4l2_ext_controls {
>>>> -- 
>>>> 2.25.1
>>>>
>> Thanks,
>> Devendra
> 
> Resending because mail daemon rejected rich text message.
> 
> Thanks,
> Devendra
> 

