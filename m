Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6E6366811
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 11:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238084AbhDUJeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 05:34:10 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33159 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238079AbhDUJeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 05:34:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Z9EglhJHovTEDZ9EklUJLZ; Wed, 21 Apr 2021 11:33:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618997614; bh=t18wfVdaQB0GJx7ZGxIymjm2OLiWYUUHaB7NCsHKT2c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GGdxCkjeB6wNRaTma4GEuEbQ62s3Hke3QVuyAu2K2hHpfn1O8v0wQVm78YI2YV5Zt
         ODo1iOKozFuh/CNZdp/M8DygdwEqBShrvM0drZz4tLNKjMiPOZlp3k8ImXtgdPuESe
         UI/CXGIIeSFddb/zBB8uF+zjFB7vZFW1lDC+AkeVp1apWeffylu/RytM4onnZh3Hbh
         3o32HLly9aHHjPktavOXxd9fKa0U3ieUlPcrxi/jBJvZyZV0TJ/3CXyaWT+U93ZXhb
         Y7sddT+29wJTK+cWQB6JAjEQCr/zQYV/Dpe3WTc/Zc0D5NxY41o+6nkXK5HzTmihxv
         vC4uVS6fF1xFg==
Subject: Re: [PATCH 5/8] v4l2-info: remove a strange sizeof usage
To:     Rosen Penev <rosenp@gmail.com>
Cc:     linux-media@vger.kernel.org
References: <20210421072035.4188497-1-rosenp@gmail.com>
 <20210421072035.4188497-5-rosenp@gmail.com>
 <525235dc-e205-0154-ebde-1df11daf48ca@xs4all.nl>
 <497715F9-E425-45ED-AFD1-CDCEAA2690AA@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9e4086d7-7ea6-7120-4f2d-1609dcdba93e@xs4all.nl>
Date:   Wed, 21 Apr 2021 11:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <497715F9-E425-45ED-AFD1-CDCEAA2690AA@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDeFDr/nmY478KWBlAj2YlGVRnH7h8jNLR+iv0JLu6qxZVsWVwe908L6EcpOuwyo5kFbOZXO5n6yFp0cmPChKWPs64abq01/+FJQiHAyfr0QpjulgdFL
 3JQ0vlFU/gBRGvVGAvX7B0IONZ7oDX5v/56SwhbJ/jUfjkrrkAR5kOIdakR+e5nNtNb+Su5rm4u0U/dMITGUlUKi9kXLI1BLd6wR3Srqv31kMTWCYlURf+c8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2021 11:19, Rosen Penev wrote:
> 
>> On Apr 21, 2021, at 01:23, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>>> On 21/04/2021 09:20, Rosen Penev wrote:
>>> The array has a nullptr and 0 member for some reason. Remove and convert
>>> loop to a for range one.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>> utils/common/v4l2-info.cpp | 33 +++++++++++++++------------------
>>> 1 file changed, 15 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
>>> index cb3cb91f7..0359cf137 100644
>>> --- a/utils/common/v4l2-info.cpp
>>> +++ b/utils/common/v4l2-info.cpp
>>> @@ -3,6 +3,8 @@
>>>  * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>>>  */
>>>
>>> +#include <array>
>>> +
>>> #include <v4l2-info.h>
>>>
>>> static std::string num2s(unsigned num, bool is_hex = true)
>>> @@ -411,21 +413,20 @@ std::string mbus2s(unsigned flags, bool is_hsv)
>>>    return flags2s(flags, mbus_ycbcr_def);
>>> }
>>>
>>> -static const flag_def selection_targets_def[] = {
>>> -    { V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
>>> -    { V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
>>> -    { V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
>>> -    { V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
>>> -    { V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
>>> -    { V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
>>> -    { V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
>>> -    { V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
>>> -    { 0, nullptr }
>>
>> The idea of having this sentinel is that this makes it easy to add new
>> entries without having to update the array size.
> Not following this. I assume it’s some C feature.

Standard programming techique:

https://en.wikipedia.org/wiki/Sentinel_value#:~:text=In%20computer%20programming%2C%20a%20sentinel,a%20loop%20or%20recursive%20algorithm.

>>
>>> +static constexpr std::array<flag_def, 8> selection_targets_def{
>>
>> Something you need to do here, adding a new flag means updating the size.
> I assume this is a small issue. It’s an immediate compile error anyway.

Not if the size is larger that the number of initializers. That would leave
zeroed elements at the end.

>>
>> New flags are added regularly, so keeping that robust is a good idea IMHO.
>>
>> If it were possible to write:
>>
>> static constexpr std::array<flag_def> selection_targets_def{
>>
>> i.e. without an explicit size, then this would make sense, but C++
>> doesn't allow this. And std::vector allocates the data on the heap,
>> which is less efficient as well.
> But this is possible. With C++17 :). That would necessitate a minimum of GCC6 though.

How is that done in C++17? I didn't find anything about that.

Regards,

	Hans

>>
>> Let's just keep using normal arrays in this case, they do the job
>> just fine. Just because you have a hammer, it doesn't mean everything
>> is now a nail :-)
>>
>> Regards,
>>
>>    Hans
>>
>>> +    flag_def{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
>>> +    flag_def{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
>>> +    flag_def{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
>>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
>>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
>>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
>>> +    flag_def{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
>>> +    flag_def{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
>>> };
>>>
>>> bool valid_seltarget_at_idx(unsigned i)
>>> {
>>> -    return i < sizeof(selection_targets_def) / sizeof(selection_targets_def[0]) - 1;
>>> +    return i < selection_targets_def.size();
>>> }
>>>
>>> unsigned seltarget_at_idx(unsigned i)
>>> @@ -437,13 +438,9 @@ unsigned seltarget_at_idx(unsigned i)
>>>
>>> std::string seltarget2s(__u32 target)
>>> {
>>> -    int i = 0;
>>> -
>>> -    while (selection_targets_def[i].str != nullptr) {
>>> -        if (selection_targets_def[i].flag == target)
>>> -            return selection_targets_def[i].str;
>>> -        i++;
>>> -    }
>>> +    for (const auto &def : selection_targets_def)
>>> +        if (def.flag == target)
>>> +            return def.str;
>>>    return std::string("Unknown (") + num2s(target) + ")";
>>> }
>>>
>>>
>>

