Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0B783860F
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 10:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfFGIXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 04:23:09 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36349 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725978AbfFGIXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 04:23:08 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZA9OhApmd3qlsZA9RhrHzG; Fri, 07 Jun 2019 10:23:06 +0200
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3de878d39d32280b5a83001944dd2b4aea9b3d43.camel@ndufresne.ca>
 <8bcc41efa3f477ca34a3da203a2f3fa91474e502.camel@bootlin.com>
 <2793216.N2HdOGtWhe@jernej-laptop>
 <5d9a5567eed5148fc7ade7c9a9cef5dcb48f47db.camel@bootlin.com>
 <58ef7cda93864ed88922dce76fa6ddb8dac0a38d.camel@ndufresne.ca>
 <CAAFQd5AintQedU7b1PQ3WgaO+EruLLtOWPcwVd3azTx+hiENHg@mail.gmail.com>
 <6ab029d01d532540dfb170072ca5063feaded946.camel@bootlin.com>
 <20190522104246.GD30938@ulmo>
 <310ac52d-8290-cc17-08b2-436efe7da26a@xs4all.nl>
 <CAAFQd5BYzvovq6tQQXu6u7tdW=rAe_-ottdDe8qL-BzHNUqF9Q@mail.gmail.com>
 <abf88a12-053d-e0a9-1772-e76c9d70446c@xs4all.nl>
Message-ID: <e7c15cd3-7131-c084-8668-a75c3be25e5d@xs4all.nl>
Date:   Fri, 7 Jun 2019 10:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <abf88a12-053d-e0a9-1772-e76c9d70446c@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLVu60slwU84z1dPYUrNxH8w6xPw0WQHbzDfule/PTxkF1vyvcjzCz+8DzfSCPhDqDoFiHvLw2d3iXl2TJoZLhsLvvzfRUtyM+hH+36R0KSu4lgX5kup
 Sh4IooKnNXN3Y3OnlUlgR6Of+Qkks3N4T8JNpF/EBU4JXlv7dCKGUlTIg9XA8AJzSCUgQVVVZgPHTMd3zdY8GLkRpqB86/q4RImqNNRLGLVGIXpWpMPk1TLB
 KzM/rgfGDYRv1biEt1z1ZLakiYoaJxqxqKIWknqOlndfnK1T1Usa8IkOoxr6wgWFYFSSWbVSoBWnhv0P6QYPkpdyIbVPQBUH+wBOnq7PWmrwC+/ewCCD/lSX
 7mWxKRkh+n3r8q5IDawvkufwJdV8MF7aWJ3YJ5cy1RV03kj5VNYV/tAy6WobOQfk3emkPrw2dLkzTYj7HsMcKIh6s2k3qMlyPlKI6tUBNsw4Ml31H4q/lkJU
 6ujOuJI6vJwVx6R6gLXK5FuEVLy+ZsgiFIAzGxUziZ81AdfMWfj5EHdzWBpSs2Dudab13oow/DqLkroc
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/7/19 8:45 AM, Hans Verkuil wrote:
> On 6/7/19 8:11 AM, Tomasz Figa wrote:
>> On Wed, May 22, 2019 at 7:56 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>> I share the same experience. Bitstream buffers are usually so small that
>>>> you can always find a physically contiguous memory region for them and a
>>>> memcpy() will be faster than the overhead of getting an IOMMU involved.
>>>> This obviously depends on the specific hardware, but there's always some
>>>> threshold before which mapping through an IOMMU just doesn't make sense
>>>> from a fragmentation and/or performance point of view.
>>>>
>>>> I wonder, though, if it's not possible to keep userptr buffers around
>>>> and avoid the constant mapping/unmapping. If we only performed cache
>>>> maintenance on them as necessary, perhaps that could provide a viable,
>>>> maybe even good, zero-copy mechanism.
>>>
>>> The vb2 framework will keep the mapping for a userptr as long as userspace
>>> uses the same userptr for every buffer.
>>>
>>> I.e. the first time a buffer with index I is queued the userptr is mapped.
>>> If that buffer is later dequeued and then requeued again with the same
>>> userptr the vb2 core will reuse the old mapping. Otherwise it will unmap
>>> and map again with the new userptr.
>>
>> That's a good point. I forgot that we've been seeing random memory
>> corruptions (fortunately of the userptr memory only, not random system
>> memory) because of this behavior and carrying a patch in all
>> downstream branches to remove this caching.
>>
>> I can see that we keep references on the pages that corresponded to
>> the user VMA at the time the buffer was queued, but are we guaranteed
>> that the list of pages backing that VMA hasn't changed over time?
> 
> Since you are seeing memory corruptions, the answer to this is perhaps 'no'?
> 
> I think the (quite possibly faulty) reasoning was that while memory is mapped,
> userspace can't do a free()/malloc() pair and end up with the same address.
> 
> I suspect this might be a wrong assumption, and in that case we're better off
> removing this check.
> 
> But I'd like to have some confirmation that it is really wrong.

I did some testing, and indeed, this doesn't work.

A patch fixing this will be posted soon.

Regards,

	Hans

> 
> USERPTR isn't used very often, so it wouldn't surprise me if it is buggy.
> 
> Regards,
> 
> 	Hans
> 
>>
>>>
>>> The same is done for dmabuf, BTW. So if userspace keeps changing dmabuf
>>> fds for each buffer, then that is not optimal.
>>
>> We could possibly try to search through the other buffers and reuse
>> the mapping if there is a match?
>>
>> Best regards,
>> Tomasz
>>
> 

