Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE2F238490
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 08:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfFGGqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 02:46:03 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35495 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726761AbfFGGqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 02:46:02 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Z8dQh9ngX3qlsZ8dThqjPB; Fri, 07 Jun 2019 08:46:00 +0200
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <abf88a12-053d-e0a9-1772-e76c9d70446c@xs4all.nl>
Date:   Fri, 7 Jun 2019 08:45:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5BYzvovq6tQQXu6u7tdW=rAe_-ottdDe8qL-BzHNUqF9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHwX7pk8rALTso97KLu+t+SqgmHFiWu1kgq24ramLHu7RG6B0yDYlitoFvzcTGAbjy10iEAzAOgXr7UkArt2f0c9BmpczlHmeg9U0nMQH4dJAh1EdZ0/
 NKYdD5+smaZt61+6dfHdijv1bJS3YoVJicmPWUSe2iAqwW7CFiwGsJZlFxsBnKPI0ApP7hKIjUrlzqjleSD3IGhkUD8yAd+QhLo8DmAvmkfk0H7DPqxjIr6s
 OkbD99JvZDvFl56/pbyjQ9rnCL9ZYE2C6QkSM6kaW3MZOhvJF8ldbLz8sSsEGL/5tR+AmZfTom1XLy2BTDhRkYD1Rcwa0Y7BjfVl4ogRxPMR1chmrVJJseny
 GbD2P+krKXykMZmtKycCKkNnl2PJBs7hla2qcyiEIfzg4bVPNWKUo3fLOFIdHWGAiOTEIvzH2fTjjhCNQP/S90M7TBl+GUAMGJnN37E3rdvuHdhYRen5fqA7
 cCJ46ojZVXZbJzfoSrFWyXbpmw4FnaopyK6TcOnrVBpGuv7MivJOzlYLvGuG17YNZWBLIeMYT4mNXFOo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/7/19 8:11 AM, Tomasz Figa wrote:
> On Wed, May 22, 2019 at 7:56 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>> I share the same experience. Bitstream buffers are usually so small that
>>> you can always find a physically contiguous memory region for them and a
>>> memcpy() will be faster than the overhead of getting an IOMMU involved.
>>> This obviously depends on the specific hardware, but there's always some
>>> threshold before which mapping through an IOMMU just doesn't make sense
>>> from a fragmentation and/or performance point of view.
>>>
>>> I wonder, though, if it's not possible to keep userptr buffers around
>>> and avoid the constant mapping/unmapping. If we only performed cache
>>> maintenance on them as necessary, perhaps that could provide a viable,
>>> maybe even good, zero-copy mechanism.
>>
>> The vb2 framework will keep the mapping for a userptr as long as userspace
>> uses the same userptr for every buffer.
>>
>> I.e. the first time a buffer with index I is queued the userptr is mapped.
>> If that buffer is later dequeued and then requeued again with the same
>> userptr the vb2 core will reuse the old mapping. Otherwise it will unmap
>> and map again with the new userptr.
> 
> That's a good point. I forgot that we've been seeing random memory
> corruptions (fortunately of the userptr memory only, not random system
> memory) because of this behavior and carrying a patch in all
> downstream branches to remove this caching.
> 
> I can see that we keep references on the pages that corresponded to
> the user VMA at the time the buffer was queued, but are we guaranteed
> that the list of pages backing that VMA hasn't changed over time?

Since you are seeing memory corruptions, the answer to this is perhaps 'no'?

I think the (quite possibly faulty) reasoning was that while memory is mapped,
userspace can't do a free()/malloc() pair and end up with the same address.

I suspect this might be a wrong assumption, and in that case we're better off
removing this check.

But I'd like to have some confirmation that it is really wrong.

USERPTR isn't used very often, so it wouldn't surprise me if it is buggy.

Regards,

	Hans

> 
>>
>> The same is done for dmabuf, BTW. So if userspace keeps changing dmabuf
>> fds for each buffer, then that is not optimal.
> 
> We could possibly try to search through the other buffers and reuse
> the mapping if there is a match?
> 
> Best regards,
> Tomasz
> 

