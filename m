Return-Path: <linux-media+bounces-15635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 494CF942BF0
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 12:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 003C32853B3
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8DD1AD3FC;
	Wed, 31 Jul 2024 10:29:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDC1AD3EF
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722421786; cv=none; b=Cj7/4u34rrM7pT6abdSmQv3SwAWrl1NYQSfaSTahGRktXCXDBjFMiTDBU9xzJww7s6XVNm03iwUqIQ6GExsGqaVJtqiDuTZ/w7OTLkL9Mf+ErrQzJ3IaYOOmJrhZ91o7rWJCnNOfg6XtJq2FjYzN0RhStaIGl5Ydg8mhhurqtZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722421786; c=relaxed/simple;
	bh=cu8ronfR2qKEGXgoKyZofJuYIdc6TcnQlXBtQu+JkNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ec+M1XU0F+C95AAkcfTLmJIO8th8CpZJAH11FwArlvANeT64hm3vkGLpQN/dJZgrrDaEBhYaQmVcUsgroCz35XikFQaqrciAsFZlrmkVGAvdPGJ66O+xMeGgxUHe9+IABhVu6GANVIK7MLr+ZDqiCF62cXPcxGY1JEZtCjZLBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE1BC4AF10;
	Wed, 31 Jul 2024 10:29:45 +0000 (UTC)
Message-ID: <a808baf5-2135-43f0-86e2-1cde3469b780@xs4all.nl>
Date: Wed, 31 Jul 2024 12:29:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] v4l2-compliance: Add test for
 V4L2_FMTDESC_FLAG_ENUM_ALL flag
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org
References: <20240731093526.29137-1-benjamin.gaignard@collabora.com>
 <b3c9410d-8b69-4ff7-b978-aaf6a558d1a5@xs4all.nl>
 <206521b7-92cc-464d-a65a-55ef665c4943@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <206521b7-92cc-464d-a65a-55ef665c4943@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2024 12:21, Benjamin Gaignard wrote:
> 
> Le 31/07/2024 à 12:02, Hans Verkuil a écrit :
>> On 31/07/2024 11:35, Benjamin Gaignard wrote:
>>> If V4L2_FMTDESC_FLAG_ENUM_ALL flag is supported, test if all
>>> pixel formats list with VIDIOC_ENUM_FMT without the flag been set
>>> is a subset of the list created with the flag.
>>> Also Test that the flag is cleared after calling VIDIOC_ENUM_FMT.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>> changes in version 2:
>>> - Completely rework how the test it done.
>>>
>>>   include/linux/videodev2.h                   |  3 ++
>>>   utils/common/v4l2-info.cpp                  |  1 +
>>>   utils/v4l2-compliance/v4l2-test-formats.cpp | 36 +++++++++++++++++++++
>>>   3 files changed, 40 insertions(+)
>>>
>>> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
>>> index f18a40d4..c166bb35 100644
>>> --- a/include/linux/videodev2.h
>>> +++ b/include/linux/videodev2.h
>>> @@ -864,6 +864,9 @@ struct v4l2_fmtdesc {
>>>   #define V4L2_FMT_FLAG_CSC_QUANTIZATION        0x0100
>>>   #define V4L2_FMT_FLAG_META_LINE_BASED        0x0200
>>>   +/*  Format description flag, to be ORed with the index */
>>> +#define V4L2_FMTDESC_FLAG_ENUM_ALL        0x80000000
>>> +
>>>       /* Frame Size and frame rate enumeration */
>>>   /*
>>>    *    F R A M E   S I Z E   E N U M E R A T I O N
>>> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
>>> index aaf7b0b5..248ab9c3 100644
>>> --- a/utils/common/v4l2-info.cpp
>>> +++ b/utils/common/v4l2-info.cpp
>>> @@ -383,6 +383,7 @@ static constexpr flag_def fmtdesc_ ## enc_type ## _def[] = {             \
>>>       { V4L2_FMT_FLAG_CSC_QUANTIZATION, "csc-quantization" },         \
>>>       { V4L2_FMT_FLAG_CSC_XFER_FUNC, "csc-xfer-func" },             \
>>>       { V4L2_FMT_FLAG_META_LINE_BASED, "meta-line-based" },            \
>>> +    { V4L2_FMTDESC_FLAG_ENUM_ALL, "enum-all-format" },            \
>> Ah, no. This lists the possible flag of the flags field, V4L2_FMTDESC_FLAG_ENUM_ALL
>> doesn't belong there.
>>
>> In fact, there is no need to add it at all since it is never reported.
>>
>> But you do need to add support for it in v4l2-ctl: I think that the various
>> --list-formats(-ext) options needs to check for an optional suboption 'all',
>> which will set the new V4L2_FMTDESC_FLAG_ENUM_ALL flag. That's a separate patch
>> for v4l2-ctl.
>>
>>>       { 0, NULL }                                 \
>>>   };
>>>   diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
>>> index fc16ad39..2b743da5 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
>>> @@ -224,6 +224,7 @@ static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
>>>   static int testEnumFormatsType(struct node *node, unsigned type)
>>>   {
>>>       pixfmt_map &map = node->buftype_pixfmts[type];
>>> +    pixfmt_map enum_all;
>>>       struct v4l2_fmtdesc fmtdesc;
>>>       unsigned f = 0;
>>>       int ret;
>>> @@ -317,6 +318,41 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>>>                       fmtdesc.pixelformat, fcc2s(fmtdesc.pixelformat).c_str());
>>>           map[fmtdesc.pixelformat] = fmtdesc.flags;
>>>       }
>>> +
>>> +    /* Test V4L2_FMTDESC_FLAG_ENUM_ALL if supported */
>>> +    f = 0;
>>> +    for (;;) {
>>> +        memset(&fmtdesc, 0xff, sizeof(fmtdesc));
>>> +        fmtdesc.type = type;
>>> +        fmtdesc.index = f | V4L2_FMTDESC_FLAG_ENUM_ALL;
>>> +        fmtdesc.mbus_code = 0;
>>> +
>>> +        ret = doioctl(node, VIDIOC_ENUM_FMT, &fmtdesc);
>>> +        if (ret == ENOTTY)
>>> +            return ret;
>> This would be a failure: it can't return ENOTTY since that was already tested
>> in the first test without the ALL flag. You can drop this test, since it will
>> fail later.
>>
>>> +        if (f == 0 && ret == EINVAL)
>>> +            return 0;
>>> +        if (ret == EINVAL)
>>> +            break;
>>> +        if (ret)
>>> +            return fail("expected EINVAL, but got %d when enumerating buftype %d\n", ret, type);
>> This will catch the ENOTTY.
>>
>>> +        if (fmtdesc.index != f)
>>> +            return fail("V4L2_FMTDESC_FLAG_ENUM_ALL hasn't been cleared from fmtdesc.index 0x%x f 0x%x\n", fmtdesc.index, f);
>>> +        f++;
>>> +        if (type == V4L2_BUF_TYPE_PRIVATE)
>>> +            continue;
>>> +        assert(type <= V4L2_BUF_TYPE_LAST);
>>> +        if (enum_all.find(fmtdesc.pixelformat) != enum_all.end())
>>> +            return fail("duplicate format %08x (%s)\n",
>>> +                    fmtdesc.pixelformat, fcc2s(fmtdesc.pixelformat).c_str());
>>> +        enum_all[fmtdesc.pixelformat] = fmtdesc.flags;
>>> +    }
>>> +    /* if V4L2_FMTDESC_FLAG_ENUM_ALL is supported, verify that the list is a subset of VIDIOC_ENUM_FMT list */
>>> +    if (!enum_all.empty()) {
>> You can drop this if. If enum_all is empty, and map isn't, then it will just
>> fail in the next for loop.
> 
> enum_all could be empty if V4L2_FMTDESC_FLAG_ENUM_ALL isn't supported and
> it shouldn't fail in this case.

But that is caught by the "if (f == 0 && ret == EINVAL)" check above. In that case
it just returns 0.

Regards,

	Hans

> 
>>> +        for (auto it = map.begin(); it != map.end(); it++)
>>> +            if (enum_all.find(it->first) == enum_all.end())
>>> +                return fail("V4L2_FMTDESC_FLAG_ENUM_ALL failed to enumerate format %08x (%s)\n", it->first, fcc2s(it->first).c_str());
>>> +    }
>>>       info("found %d formats for buftype %d\n", f, type);
>> Note that f was reset above, so this info message should be moved up to just before the
>> V4L2_FMTDESC_FLAG_ENUM_ALL test starts.
>>
>> But perhaps keep this info message here as well, just change it to:
>>
>>        info("found %d formats for buftype %d (with V4L2_FMTDESC_FLAG_ENUM_ALL)\n", f, type);
>>
>> Regards,
>>
>>     Hans
>>
>>>       return 0;
>>>   }
>>


