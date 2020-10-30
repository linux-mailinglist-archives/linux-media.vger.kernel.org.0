Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACAF2A04DD
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgJ3L6x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:58:53 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58785 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725355AbgJ3L6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:58:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YT3OkoGvpWvjMYT3RkHK0U; Fri, 30 Oct 2020 12:58:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604059130; bh=QTOpKIcgbDQHtlwnaUtmIQCJmnmG8z+TXJliV76g014=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RoBsC/hCZnZzSo5n482vujzxhPaoq+dE/8+srMj3HLfbK7ZcAUBp0QlTyrEYAMqum
         fpvpm4nsCd0z1Du0yL/f9sSRBYnvmRGb/Xa9St4guTz4xXik6LBTZ9U8eOHTsC5LQW
         MFDiBJUMkehW8Xwd/LLdSZcSaWoTRjuRL10VD6vilba+hioOeDjiFcTCR3PiYK/Oqx
         3ZHzNf07OOuC8DSHAWU90Fj+h4WZJ5B8Hfezq6Z+bs224o+dR1bgOuZpJPw8rfmtKL
         eYUTx4mDMRYcyWwktC7R1lElmQbptTmLz+iiGBlx8W7OwMDNxLDlHt62+KrZkPq66d
         max9dGavN+AVg==
Subject: Re: [PATCH v2 1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED
 media bus format.
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201020154522.654-1-dafna.hirschfeld@collabora.com>
 <04d5a149-8745-ae20-a622-bcfcafb69cbb@xs4all.nl>
 <36159037-bf65-f7be-8deb-735afd726eee@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0532e316-ff0f-6a6c-8a12-6b013f866e58@xs4all.nl>
Date:   Fri, 30 Oct 2020 12:58:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <36159037-bf65-f7be-8deb-735afd726eee@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPQOXBn2MuSK4FIW2+sKbmS9QBrJiTHCFjcUIRDGS2z5fvZCXzCUkX4tdLwHYs0o/dj/JzSA37IVUya4BvCcFgLcSQqWxk5lKZawRLAMfYiwQvCAPoVP
 P/q0ieSIkI8hdt5P3VBsx4Q7vNjIjyc7Ze3ua6Tv2CZvo7SKOAYq3pdHdLYVX/neV4kH0SY8+3fyiL4ZkL4gKCbegQpH0lsHe9cdwazePkYnBTicj4+A1ugZ
 j0oOW15peiQrK5CHGbre9e/b2VuW8j5EOLjZTZVggvDhZJIyX8hmFg2rKjwDUgni5t+bpirlqvMEWMbKu4BpZ8cGuvcTFEK0ebtIhP1aJ5h1hfdJCLc83bul
 1CMSPYpG+7OfypjYHn9QVCNWWZEogCsQW1JdZUqAS5i6jX5G3rDRFbvE6Ys+/gWX4QsJea6EP+jpuD0qMmNgLspsy+CXL3SQuTUc5eqEGi++sJZ7kdkoHvlz
 s9/lbrUwkvBEUU6L/ynjG1p/JHJeZxahL1d0BV0Gm81KA148NVq1wavZ2rFJFAPYO0361d8iqb1bPViFnmf2+Y4qOfgmaUrBPT0I9Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/10/2020 12:34, Dafna Hirschfeld wrote:
> 
> 
> Am 30.10.20 um 09:58 schrieb Hans Verkuil:
>> On 20/10/2020 17:45, Dafna Hirschfeld wrote:
>>> MEDIA_BUS_FMT_METADATA_FIXED should be used when
>>> the same driver handles both sides of the link and
>>> the bus format is a fixed metadata format that is
>>> not configurable from userspace.
>>> The width and height will be set to 0 for this format.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>> ---
>>> changes since v1:
>>> 1. replace "This format may have 0 height and width."
>>> with "Width and height will be set to 0 for this format."
>>> and add it also to the commit log
>>> 2. s/meida:/media:/ in the patch subject line
>>>
>>>   include/uapi/linux/media-bus-format.h | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
>>> index 84fa53ffb13f..2ce3d891d344 100644
>>> --- a/include/uapi/linux/media-bus-format.h
>>> +++ b/include/uapi/linux/media-bus-format.h
>>> @@ -156,4 +156,12 @@
>>>   /* HSV - next is	0x6002 */
>>>   #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
>>>   
>>> +/*
>>> + * This format should be used when the same driver handles
>>> + * both sides of the link and the bus format is a fixed
>>> + * metadata format that is not configurable from userspace.
>>> + * Width and height will be set to 0 for this format.
>>> + */
>>> +#define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
>>> +
>>>   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
>>>
>>
>> Documentation/userspace-api/media/v4l/subdev-formats.rst also needs to
>> be updated.
> 
> hi,
> I wonder what should be the documentation, since this mbus code

Basically the same as you wrote in the comment above.

> is for very specific use case. You think that the 0x7* mbus codes
> should be 'metadata mbus codes'?

Yes.

Regards,

	Hans
