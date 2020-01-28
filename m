Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E0114B100
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 09:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgA1Iid (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 03:38:33 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54143 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725867AbgA1Iid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 03:38:33 -0500
Received: from [IPv6:2001:983:e9a7:1:6d16:ffdc:f7c6:fc6f]
 ([IPv6:2001:983:e9a7:1:6d16:ffdc:f7c6:fc6f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id wMOEiIkz7rNgywMOFiSdnm; Tue, 28 Jan 2020 09:38:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580200711; bh=IV9O/g4Kf0NmuJ/UEFAYcx5nb57xh717LTJtJ7iiERY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TFndPTPXRuMwwNo9Xd2LuBMFrNO3fT0IEbD2rbN3hfbTyj+Q5vk6lNyCsMz8m4Zmu
         VZMvVKjo8tEQL9U79xT1Nvd/2/VFyonkddRzVLbEI4957OA5b5bxCKn2HZtaM/tQRf
         Q/VYb73UEWH4OM/OvGB1VTFAKZR3juKGQuiRv0Iw5/ZR/50DUDTn8OnBqPRF0owxlb
         REo2XDKXspBE8VxVcCxL3UmWtIs+HPfkCewn0Wsg8+qg+Edgjn9/M0ATuKc05rPPiq
         r6GPOKW2Mc4c3+hAWzmHn/a++MTF3zofvfbU6YC4qljetjvLdhDe3sgOWiL0E83F64
         Q26qq9d0zwO2w==
Subject: Re: [RFC][PATCH 05/15] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT in REQBUFS
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-6-senozhatsky@chromium.org>
 <8d0c95c3-64a2-ec14-0ac2-204b0430b2b4@xs4all.nl>
 <20200122021805.GE149602@google.com> <20200122034826.GA49953@google.com>
 <7c4accc6-56f2-ecd0-1549-a4114b339ce8@xs4all.nl>
 <CAAFQd5C=Zj7h5Xe1w=0czX5ge1Kh=2cj6yEkN6binPgmmpj6Wg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <be0b79dc-c92f-cbb5-2baa-b058a944435d@xs4all.nl>
Date:   Tue, 28 Jan 2020 09:38:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5C=Zj7h5Xe1w=0czX5ge1Kh=2cj6yEkN6binPgmmpj6Wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKhEKfdXAdA81HiQ4zgKXjWpzuc1aiNifsOOV1m3LmCz/4IKJlloa5zdoRcxZbCSUQrnY0MAlFMtbdmbqFumT0EcI+bVtzG+r5NS1DLOh/LwW8BpM3GU
 oXt0dUpdn+Lod8HiKhoGdxMskahQN3fVNR0AXeK/sstlhbjVagvJ4DNLk/rzLc5juWPdDIjqAOt4ZrjAyFiQkLl+I+aboXk5oivLErmzpUB/6qPhI1sQ3Hgp
 ym+nbdFiULGbqK21+UcVM0U7I6t+XKvwT2mppESmeRWMqvIRPYkNfkqK5TtYiGykDYWjGTPh+K+Co5jh8E77viyZcdWgcXFVr+8QUMp7xHuFEfk2UqlEovtQ
 enASxPymsBn6hH0piaWtU2LzrAOpSegXNZR/I8Mvn9671sb9KZhl0R9mlexhKQJmsNGuxMX8cNgj/7d4PeVL/tSkVJjN2rAto/n+Na/jx9ED6fQga+cADLsd
 1nLBnkm1/7f85cFkYlWZ7HILdH4kUudd25vaav1Hf4XqULX1BaZhLYhW7GGnkZNYjapAN8eNmZCSxVbLSZtkLaOSgMfUw5/+/xqg+8+8fcmeJDDvQXK9BPei
 reOAdRBVcW/eG08q4X+pPN3UmzHX27QJHpIquqDoHCijag==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/28/20 5:45 AM, Tomasz Figa wrote:
> On Thu, Jan 23, 2020 at 8:08 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 1/22/20 4:48 AM, Sergey Senozhatsky wrote:
>>> On (20/01/22 11:18), Sergey Senozhatsky wrote:
>>> [..]
>>>>>> +    * -
>>>>>> +      - __u32
>>>>>>        - ``reserved``\ [1]
>>>>>>        - A place holder for future extensions. Drivers and applications
>>>>>> -  must set the array to zero.
>>>>>> +  must set the array to zero, unless application wants to specify
>>>>>> +        buffer management ``flags``.
>>>>>
>>>>> I think support for this flag should be signaled as a V4L2_BUF_CAP capability.
>>>>> If the capability is not set, then vb2 should set 'flags' to 0 to preserve the
>>>>> old 'Drivers and applications must set the array to zero' behavior.
>>>>
>>>> The patch set adds V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS towards the end of the
>>>> series, I guess I can shuffle the patches and change the wording here.
>>>
>>> Or I can add separate queue flag and V4L2_BUF_CAP:
>>>
>>> struct vb2_queue {
>>> ...
>>>       allow_cache_hints:1
>>> +     allow_consistency_hints:1
>>> ...
>>> }
>>>
>>> and then have CAP_SUPPORTS_CACHE_HINTS/CAP_SUPPORTS_CONSISTENCY_HINTS.
>>
>> Don't these two go hand-in-hand? I.e. either neither are supported, or
>> both are supported? If so, then one queue flag is sufficient.
> 
> Cache sync hints are already part of the standard UAPI, so I think
> there isn't any capability bit needed for them.

These hints may exist, but they never worked. So I think a capability would
be very useful.

 That said, they aren't
> really tied to non-consistent MMAP buffers. Userspace using USERPTR
> can also use them.

OK, two separate capability bits is fine.

Regards,

	Hans

> 
> MMAP buffer consistency hint deserves a capability bit indeed.
> 
> Best regards,
> Tomasz
> 

