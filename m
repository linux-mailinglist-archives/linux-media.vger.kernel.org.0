Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABAB838A20
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 14:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbfFGMYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 08:24:46 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55077 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727693AbfFGMYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 08:24:46 -0400
Received: from [IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a] ([IPv6:2001:420:44c1:2579:fc93:b89a:45f9:2c8a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZDvFhDU5n3qlsZDvIhsk0Q; Fri, 07 Jun 2019 14:24:44 +0200
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
 <20190607111634.GA7593@pendragon.ideasonboard.com>
 <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
 <CAAFQd5CTgm0bimJOzdFUdM35Bro4xsLwa698E7pR_hQ=ebaM3g@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c4bfba37-dc6c-43cd-c91c-1472d2f500c1@xs4all.nl>
Date:   Fri, 7 Jun 2019 14:24:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CTgm0bimJOzdFUdM35Bro4xsLwa698E7pR_hQ=ebaM3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPe4Ee3Bn/iKchcdZz3wQlS3aqOBVkn9PM6CXZwUxIKwZq0Mn7smBg5XGG+IN3NMWWCC49fi1vPqsuxv0nefWf9CiPfPMtLIuDbs+Q4k8iHkZ3BPs4Cp
 X8eSVRW0ylNR27SHxnEwKz1lREAOMS+VAA0AiWBKTSFduHOvndk9CWUoSCxLoBC+C/GnhPYQR0L1NhPf5RvZ0v2d1sEDmCFId2JsfFNmyziNuaSoa7LQCORQ
 0vsLvX6qppNgZjGd01sLCn9ulAFyXF/hh+LcMrWCGmyHrkk+C+iASCCfxE3tJ/Em5064S5x4NoWwfTQtRE6ET8I0sAHzCSfv7/ZTIJo5cFEH/auqd7JQOa+0
 eZCp2fCKYEsTOLAiNveXctL+roaoQU+kH+GnCO6CEvqXGDswYB/yYIoIqaEQr0OYAChUo9q9Pqu7ZATFyd7mcKQ89JJiJQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/7/19 2:20 PM, Tomasz Figa wrote:
> On Fri, Jun 7, 2019 at 9:01 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
>>>> The __prepare_userptr() function made the incorrect assumption that if the
>>>> same user pointer was used as the last one for which memory was acquired, then
>>>> there was no need to re-acquire the memory. This assumption was never properly
>>>> tested, and after doing that it became clear that this was in fact wrong.
>>>
>>> Could you explain in the commit message why the assumption is not
>>> correct ?
>>
>> You can free the memory, then allocate it again and you can get the same pointer,
>> even though it is not necessarily using the same physical pages for the memory
>> that the kernel is still using for it.
>>
>> Worse, you can free the memory, then allocate only half the memory you need and
>> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
>> the original mapping still remains), but this can corrupt userspace memory
>> causing the application to crash. It's not quite clear to me how the memory can
>> get corrupted. I don't know enough of those low-level mm internals to understand
>> the sequence of events.
> 
> Chrome specifically didn't keep the mapping between user pointers and
> indexes, so it the cache just missed every time. What we noticed was
> the put_userptr on the previous userptr at the index being unmapped
> apparently caused that memory (often already returned back to the
> application) to be corrupted... But we didn't get to the bottom of it
> either, as we didn't have any MM expert look at the issue.

I think this patch needs a bit more work. The put_userptr should happen
before the buffer is dequeued to userspace, not when queuing a new buffer.

I'll make a v2.

Regards,

	Hans

> 
> The free and realloc scenario just came to my mind when trying to
> recall our original problem earlier today.
> 
> Best regards,
> Tomasz
> 

