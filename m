Return-Path: <linux-media+bounces-15614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246894278D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 116072840E9
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34781A4F11;
	Wed, 31 Jul 2024 07:10:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C18116A39E
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409858; cv=none; b=mHdnNRHA4Sht7XYj+JJONIl8SwvvigDBj6xP3kwi4HfHn024oOKvNtjvSYn31peTQo3gvxTGqnPwCcujdYq6CmrF/w85vZpby0HtQt00qMmmO1heEZUr7K86sm8yZPAjIL7tK4IuPn05hJekCxdPqMbqYuX9CzbVhi0yXtRjyes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409858; c=relaxed/simple;
	bh=Srbc1j0WzOob5+PIAbu3u7QQ7mEGCJVBFl3nUhpWQDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kznp94n+JnmaKbfDp3K4o9eOXqs2NR2apnvdNFFDZaanLO5NoXbPxebg6pJfAcNWdfXiRn7edAMmtVzl5mqCBx7+BisCJxXMYyEIyxwCwT+9HGdzJeV/r1NU/clsw6n9O4CVQY+w6nsLcxIgo5elEpKjVoKZgfL0XAZwipLxd8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADCDC116B1;
	Wed, 31 Jul 2024 07:10:57 +0000 (UTC)
Message-ID: <cccf0066-bbbd-4722-bb55-fe4c42ac1c27@xs4all.nl>
Date: Wed, 31 Jul 2024 09:10:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v4l2-compliance: Add enum all formats test
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org
References: <20240722150604.149707-1-benjamin.gaignard@collabora.com>
 <d9e1cd96-1a58-4806-ad0d-b20734c952c0@xs4all.nl>
 <216c0a26-2894-44ff-ac21-b164919173df@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <216c0a26-2894-44ff-ac21-b164919173df@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2024 09:03, Benjamin Gaignard wrote:
> 
> Le 30/07/2024 à 09:30, Hans Verkuil a écrit :
>> Hi Benjamin,
>>
>> On 22/07/2024 17:06, Benjamin Gaignard wrote:
>>> Add a test to check if V4L2_FMT_FLAG_ENUM_ALL is supported
>>> or not by drivers.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>>   include/linux/videodev2.h                   |  3 ++
>>>   utils/common/v4l2-info.cpp                  |  1 +
>>>   utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
>>>   utils/v4l2-compliance/v4l2-compliance.h     |  1 +
>>>   utils/v4l2-compliance/v4l2-test-formats.cpp | 60 +++++++++++++++++++--
>>>   5 files changed, 63 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
>>> index f18a40d4..8e2a8b36 100644
>>> --- a/include/linux/videodev2.h
>>> +++ b/include/linux/videodev2.h
>>> @@ -864,6 +864,9 @@ struct v4l2_fmtdesc {
>>>   #define V4L2_FMT_FLAG_CSC_QUANTIZATION        0x0100
>>>   #define V4L2_FMT_FLAG_META_LINE_BASED        0x0200
>>>   +/*  Format description flag, to be ORed with the index */
>>> +#define V4L2_FMT_FLAG_ENUM_ALL            0x80000000
>>> +
>>>       /* Frame Size and frame rate enumeration */
>>>   /*
>>>    *    F R A M E   S I Z E   E N U M E R A T I O N
>>> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
>>> index aaf7b0b5..c2c49ad0 100644
>>> --- a/utils/common/v4l2-info.cpp
>>> +++ b/utils/common/v4l2-info.cpp
>>> @@ -383,6 +383,7 @@ static constexpr flag_def fmtdesc_ ## enc_type ## _def[] = {             \
>>>       { V4L2_FMT_FLAG_CSC_QUANTIZATION, "csc-quantization" },         \
>>>       { V4L2_FMT_FLAG_CSC_XFER_FUNC, "csc-xfer-func" },             \
>>>       { V4L2_FMT_FLAG_META_LINE_BASED, "meta-line-based" },            \
>>> +    { V4L2_FMT_FLAG_ENUM_ALL, "enum-all-formats" },                \
>>>       { 0, NULL }                                 \
>>>   };
>>>   diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
>>> index 144f9618..3446f66f 100644
>>> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
>>> @@ -1444,6 +1444,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>>>             printf("Format ioctls%s:\n", suffix);
>>>           printf("\ttest VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: %s\n", ok(testEnumFormats(&node)));
>>> +        printf("\ttest VIDIOC_ENUM_FMT ALL FORMATS: %s\n", ok(testEnumAllFormats(&node)));
>> This shouldn't be a new high-level test, instead it should be part of
>> testEnumFormats().
>>
>>>           printf("\ttest VIDIOC_G/S_PARM: %s\n", ok(testParm(&node)));
>>>           printf("\ttest VIDIOC_G_FBUF: %s\n", ok(testFBuf(&node)));
>>>           printf("\ttest VIDIOC_G_FMT: %s\n", ok(testGetFormats(&node)));
>>> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
>>> index 948b62fd..be72590f 100644
>>> --- a/utils/v4l2-compliance/v4l2-compliance.h
>>> +++ b/utils/v4l2-compliance/v4l2-compliance.h
>>> @@ -366,6 +366,7 @@ int testEdid(struct node *node);
>>>     // Format ioctl tests
>>>   int testEnumFormats(struct node *node);
>>> +int testEnumAllFormats(struct node *node);
>>>   int testParm(struct node *node);
>>>   int testFBuf(struct node *node);
>>>   int testGetFormats(struct node *node);
>>> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
>>> index fc16ad39..2b9b00ae 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
>>> @@ -221,7 +221,7 @@ static int testEnumFrameSizes(struct node *node, __u32 pixfmt)
>>>       return 0;
>>>   }
>>>   -static int testEnumFormatsType(struct node *node, unsigned type)
>>> +static int _testEnumFormatsType(struct node *node, unsigned type, bool enum_all_formats)
>>>   {
>>>       pixfmt_map &map = node->buftype_pixfmts[type];
>>>       struct v4l2_fmtdesc fmtdesc;
>>> @@ -234,6 +234,9 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>>>           fmtdesc.index = f;
>>>           fmtdesc.mbus_code = 0;
>>>   +        if (enum_all_formats)
>>> +            fmtdesc.index |= V4L2_FMT_FLAG_ENUM_ALL;
>>> +
>>>           ret = doioctl(node, VIDIOC_ENUM_FMT, &fmtdesc);
>>>           if (ret == ENOTTY)
>>>               return ret;
>>> @@ -246,7 +249,7 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>>>           ret = check_0(fmtdesc.reserved, sizeof(fmtdesc.reserved));
>>>           if (ret)
>>>               return fail("fmtdesc.reserved not zeroed\n");
>>> -        if (fmtdesc.index != f)
>>> +        if ((fmtdesc.index & ~V4L2_FMT_FLAG_ENUM_ALL) != f)
>>>               return fail("fmtdesc.index was modified\n");
>>>           if (fmtdesc.type != type)
>>>               return fail("fmtdesc.type was modified\n");
>>> @@ -312,7 +315,7 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>>>               continue;
>>>           // Update define in v4l2-compliance.h if new buffer types are added
>>>           assert(type <= V4L2_BUF_TYPE_LAST);
>>> -        if (map.find(fmtdesc.pixelformat) != map.end())
>>> +        if (map.find(fmtdesc.pixelformat) != map.end() && !enum_all_formats)
>>>               return fail("duplicate format %08x (%s)\n",
>>>                       fmtdesc.pixelformat, fcc2s(fmtdesc.pixelformat).c_str());
>>>           map[fmtdesc.pixelformat] = fmtdesc.flags;
>>> @@ -321,6 +324,16 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>>>       return 0;
>>>   }
>>>   +static int testEnumFormatsType(struct node *node, unsigned type)
>>> +{
>>> +    return _testEnumFormatsType(node, type, false);
>>> +}
>>> +
>>> +static int testEnumAllFormatsType(struct node *node, unsigned type)
>>> +{
>>> +    return _testEnumFormatsType(node, type, true);
>>> +}
>>> +
>>>   int testEnumFormats(struct node *node)
>>>   {
>>>       bool supported = false;
>>> @@ -372,6 +385,47 @@ int testEnumFormats(struct node *node)
>>>       return supported ? 0 : ENOTTY;
>>>   }
>>>   +int testEnumAllFormats(struct node *node)
>>> +{
>>> +    bool supported = false;
>>> +    unsigned type;
>>> +    int ret;
>>> +
>>> +    for (type = 0; type <= V4L2_BUF_TYPE_LAST; type++) {
>>> +        ret = testEnumAllFormatsType(node, type);
>>> +        if (ret && ret != ENOTTY)
>>> +            return ret;
>>> +        if (!ret)
>>> +            supported = true;
>>> +        switch (type) {
>>> +        case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>>> +        case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>> +        case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>>> +        case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>> +        case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>>> +        case V4L2_BUF_TYPE_SDR_CAPTURE:
>>> +        case V4L2_BUF_TYPE_SDR_OUTPUT:
>>> +            if (supported && ret && (node->g_caps() & buftype2cap[type]))
>>> +                return fail("%s cap set, but no %s formats defined\n",
>>> +                        buftype2s(type).c_str(), buftype2s(type).c_str());
>>> +            if (supported && !ret && !(node->g_caps() & buftype2cap[type]))
>>> +                return fail("%s cap not set, but %s formats defined\n",
>>> +                        buftype2s(type).c_str(), buftype2s(type).c_str());
>>> +            break;
>>> +        case V4L2_BUF_TYPE_META_CAPTURE:
>>> +        case V4L2_BUF_TYPE_META_OUTPUT:
>>> +            /* Metadata formats need not be present for the current input/output */
>>> +            break;
>>> +        default:
>>> +            if (!ret)
>>> +                return fail("Buffer type %s not allowed!\n", buftype2s(type).c_str());
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    return supported ? 0 : ENOTTY;
>> This does not test that the set of formats returned with this flag must contain all formats
>> returned when ENUM_FMT is called without this flag. I.e., it must be a superset of that.
>>
>> Also note that testEnumFormatsType() calls testEnumFrameSizes which in turn will call
>> testEnumFrameIntervals. So the question is: if ENUM_FMT called with the new flag returns a
>> format that would normally be suppressed, and you pass that to VIDIOC_ENUM_FRAMESIZES/INTERVALS,
>> what should those ioctls do? Return -EINVAL? Or should it just work? Or leave it up to the
>> driver? Shouldn't this be documented?
> 
> I will rework the test.
> I think formats enumerated with the flag shouldn't be use for VIDIOC_ENUM_FRAMESIZES/INTERVALS
> but the drivers can't know that they have been discovered by using the flag...
> I will add in the documentation a word saying that these formats shouldn't be used for
> VIDIOC_ENUM_FRAMESIZES/INTERVALS

And perhaps add that it will be driver-dependent whether it will return -EINVAL or return
valid information.

v4l2-compliance should also allow an EINVAL return for pixelformats found when called with
the flags, that were not in the set found without the flag.

I see that visl supports VIDIOC_ENUM_FRAMESIZES, so I would recommend that visl returns
-EINVAL for such pixelformats. That helps develop the v4l2-compliance test code.

Regards,

	Hans

> 
> Regards,
> Benjamin
> 
>>
>> Regards,
>>
>>     Hans
>>
>>> +}
>>> +
>>>   static int testColorspace(bool non_zero_colorspace,
>>>                 __u32 pixelformat, __u32 colorspace, __u32 ycbcr_enc, __u32 quantization)
>>>   {
>>


