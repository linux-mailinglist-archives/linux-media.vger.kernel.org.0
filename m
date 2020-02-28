Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B66F0173348
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 09:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgB1Itx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 03:49:53 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:43335 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726005AbgB1Itw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 03:49:52 -0500
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7bL8jJldSjmHT7bLBjmctW; Fri, 28 Feb 2020 09:49:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582879790; bh=9VdJHJ2ICbOm+M0S9iPhNX39KW0EHOq1MnmGYhIypSw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pPc8R2kB2Vgi+7IjFLbQcjWgRUxvB7/ENKGOBDmoLycLZl2MfzkYaXNhFHzWIKV1g
         eYImsfVz+0Ii7C3nrxZjKMMNeDCEjQxJGm11Wp1rwi99HkNM7aWvhO4AtkYEhGs5xB
         H2oOiM9gFl9jkILqrguq2H3zJ2hllzfyiNgPFpk21Vx9pvDTx27j+gj30xa90lkAC8
         hfwt56wViv6IOjcmNdMLsCX8YIuG67Em4MTJb9WeJjvdmX4bzDd3eioQs8rBARULtl
         bvN4mFX8eWZd1560GbiARiVgQdY9y0nVlsxQkGNDAdY0I0tafEiPvbOgLDG9rF0Ikz
         OGIHV6hFJxFgA==
Subject: Re: [PATCHv3 05/11] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT
 flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200226111529.180197-1-senozhatsky@chromium.org>
 <20200226111529.180197-6-senozhatsky@chromium.org>
 <8ea79a02-8346-2b1d-c2d8-3a3b36480320@xs4all.nl>
 <20200228013820.GM122464@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5c397f03-ffcf-6686-aa43-393771533cae@xs4all.nl>
Date:   Fri, 28 Feb 2020 09:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228013820.GM122464@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCZ8fdqRORihu3OlQ+xwgbnYHeKPsvVDiLHQq4CndIffoZpwHJ0TKhFJC/jwAxNXlFw2u6+0jcqJueM/SDquwg5BRE63Q1Wi3hjO7wt5u7kNBrRbz0Gj
 OitMr8D9ICHLPjUM8z9bTXWc1j5Qv/YKyIiX+o+Kg8/C0wXKczOutsUrPaWlA65F+cYzWz2aJX0VXgSPpKhJdKo/Sko+yyQjGPLAHQ7YBCoJYHPEjYRjFtbx
 qacTQm/EkuglMOXlB0pEqNC0Q/53qftgzlWm8nhOR3bzBlZ9Vd8UkhmeN0hUcCydW04xOqgMi/7K/lbXSkgyCCBU6BgWsiB2S3GzeZ3O3j0qmqTMJMU+uz/l
 9YOTeSASxfjWNu1P+sVh+KNO5Cr7sVdcyqjXLOKpGd/H9LnZc7qcw794uuCoNO3aZPpdds7+049cRfPfkRLU8Ok33MysftB+u/ItA3pf+Jgw3RwPbmhu6ToE
 aSNrl0R/H2FznS3JlJFVIRDZsTUaeQS82bVfvUFAbW+F3xskpfQth5ggENxD9f3oViUQhLMEmeQaznf0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/28/20 2:38 AM, Sergey Senozhatsky wrote:
> On (20/02/27 13:36), Hans Verkuil wrote:
>>> diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
>>> index bd08e4f77ae4..6a8a4d5de2f1 100644
>>> --- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
>>> +++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
>>> @@ -121,7 +121,13 @@ than the number requested.
>>>  	other changes, then set ``count`` to 0, ``memory`` to
>>>  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
>>>      * - __u32
>>> -      - ``reserved``\ [7]
>>> +      - ``flags``
>>> +      - Specifies additional buffer management attributes.
>>> +	See :ref:`memory-flags`. Old drivers and applications must set it to
>>> +	zero.
>>
>> Drop the last sentence, it's not relevant.
> 
> OK.
> 
>>> +
>>> +    * - __u32
>>> +      - ``reserved``\ [6]
>>>        - A place holder for future extensions. Drivers and applications
>>>  	must set the array to zero.
>>
>> Old drivers and applications still think reserved is [7] and will zero this.
> 
> OK.
> 
> Hmm... If those apps use hard-coded size then we might have a problem.
> If they use sizeof(reserved) then everything is OK. Shall we also have
> a union here?

No, apps will use sizeof(reserved).

Regards,

	Hans

> 
>>> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
>>> index 917df6fb6486..e52cc4401fba 100644
>>> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
>>> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
>>> @@ -112,10 +112,19 @@ aborting or finishing any DMA in progress, an implicit
>>>  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
>>>  	free any previously allocated buffers, so this is typically something
>>>  	that will be done at the start of the application.
>>> -    * - __u32
>>> +    * - union
>>> +      - (anonymous)
>>
>> Anonymous unions are formatted a bit differently (I made a very recent patch
>> that unified the union formatting in the v4l docs). See e.g.
>> Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst.
> 
> OK, will take a look.
> 
> 	-ss
> 

