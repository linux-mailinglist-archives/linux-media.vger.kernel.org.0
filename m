Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFD3146646
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 12:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgAWLCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 06:02:55 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41909 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726170AbgAWLCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 06:02:55 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id uaGAixrAhT6sRuaGBixUx8; Thu, 23 Jan 2020 12:02:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579777373; bh=SQW8wx6zx0evNVVqva2Vw70sQl85qoidDYVt3QbNOu0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rzKfC1Rg2xzdgaZ0sOanXpprEHT0JgwGUZCM1vh3FsfvttDsl/Zepiadx5lcIEGl0
         HLPMa/LR6Q4lXAQJJfOvpl5q4fLVDdgju12BYvSVFhsSSYEQ6L8QZatoX8TDYTZ3x/
         5xfEWeQB1jauCQJNwkyq8it6aj3mC8K6q9xi+e7BmRxzs6tjAj+RGjmJe4R5sUMxvO
         rgVwbfoqUQC0qrGSSo8YoXvvGJlAZon1WlfAQIwrY+0WtiqZl0nlTQMFALdyTCEt40
         jq3eDbm/G15vCiTXs7HAcDPbVBdViSCKEgSH4mlkC7nEnbBy6GZe9ZSEeOi2roRol6
         +bi975cRoAQ1w==
Subject: Re: [RFC][PATCH 04/15] videobuf2: add queue memory consistency
 parameter
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
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-5-senozhatsky@chromium.org>
 <77ddd5cd-affc-ad0f-829d-d624f9798055@xs4all.nl>
 <20200122020555.GD149602@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8d61a2b6-4540-2dd1-309c-93d4cfa8cbcd@xs4all.nl>
Date:   Thu, 23 Jan 2020 12:02:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200122020555.GD149602@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKwOFetmm/aH+AM5MW6uRYkWCtO5Z8mx98DbtVhxfICsgV7khzDH6OJpAFnRB72i5z9E0G17aezyYvOpLnxjuxlYEnz2vHEr5u82pAXwtywSq+1H+43+
 /xgz3iLR5/tJwSHevgygDKkfoxqBpBcv3/Y72aLcz3tH60R4IfnHr0YyxniC3JJCxe2MCMq25UXbjkd6NeL4nUVtsuHgTKkKJULXAmWuGzb4dCClxZHtVU8y
 4SXv19LKvpVL26Zwu1kM84nmtGrMSSBt514hof5lLHWVVMtz+suFxNUP2V6e5cGgKzVFMTP4HAvm/2xBBjqZ8e5P/4hulNveba4VXzwZqrxLspiubHF5pf/v
 q6ON0p84S0b2wYIUO/gF8tqvSjNPmImL+6X+8aGqmmH2DZ7ZwMITEBysmjRJItMzLcazZjk5asL7HEIN6kacesiPRM9k67aCiIp2yj2w1glsoeiiPyvxpyVA
 K2XSj7gcPG3ESdOMIF/i7PtXB3w9e/pl6y5DByuPLT5BQ7KFBneLXJcW6YtoEHnP9TpGgfpswmMQn5K9rgF0i/gcjqOzoyijkRxfsOv+Jx5pbPZaM0vXXaZ9
 QIc9u0pUuw+ul/9ITKIh0TAqWxP4V9dtF2rzX8UNxlEOJw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/22/20 3:05 AM, Sergey Senozhatsky wrote:
> On (20/01/10 10:47), Hans Verkuil wrote:
>> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
>>> Preparations for future V4L2_FLAG_MEMORY_NON_CONSISTENT support.
>>>
>>> Extend vb2_core_reqbufs() with queue memory consistency flag.
>>> API permits queue's consistency attribute adjustment only if
>>> the queue has no allocated buffers, not busy, and does not have
>>> buffers waiting to be de-queued.
>>
>> Actually, you can call vb2_core_reqbufs() when buffers are allocated:
>> it will free the old buffers, then allocate the new ones.
>> So drop the 'has no allocated buffers' bit.
> 
> Well, the wording, basically, follows the existing vb2_core_reqbufs()
> behavior "queue memory type"-wise. What I'm trying to say:

How about this commit log replacement of the first paragraph:

"Extend vb2_core_reqbufs() with queue memory consistency flag that is
applied to the newly allocated buffers."

The bits about 'only if the queue has no allocated buffers, not busy, and does
not have buffers waiting to be de-queued.' is really irrelevant and confusing
(at least to me!).

Regards,

	Hans

> 
> [..]
> int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> 		bool consistent_mem, unsigned int *count)
> {
> 	unsigned int num_buffers, allocated_buffers, num_planes = 0;
> 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> 	unsigned int i;
> 	int ret;
> 
> 	if (q->streaming) {
> 		dprintk(1, "streaming active\n");
> 		return -EBUSY;
> 	}
> 
> 	if (q->waiting_in_dqbuf && *count) {
> 		dprintk(1, "another dup()ped fd is waiting for a buffer\n");
> 		return -EBUSY;
> 	}
> 
> 	if (*count == 0 || q->num_buffers != 0 ||
> 	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
> 		/*
> 		 * We already have buffers allocated, so first check if they
> 		 * are not in use and can be freed.
> 		 */
> 		mutex_lock(&q->mmap_lock);
> 		if (debug && q->memory == VB2_MEMORY_MMAP &&
> 		    __buffers_in_use(q))
> 			dprintk(1, "memory in use, orphaning buffers\n");
> 
> 		/*
> 		 * Call queue_cancel to clean up any buffers in the
> 		 * QUEUED state which is possible if buffers were prepared or
> 		 * queued without ever calling STREAMON.
> 		 */
> 		__vb2_queue_cancel(q);
> 		ret = __vb2_queue_free(q, q->num_buffers);
> 		mutex_unlock(&q->mmap_lock);
> 		if (ret)
> 			return ret;
> 
> 		/*
> 		 * In case of REQBUFS(0) return immediately without calling
> 		 * driver's queue_setup() callback and allocating resources.
> 		 */
> 		if (*count == 0)
> 			return 0;
> 	}
> 
> 	/*
> 	 * Make sure the requested values and current defaults are sane.
> 	 */
> 	WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);
> 	num_buffers = max_t(unsigned int, *count, q->min_buffers_needed);
> 	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
> 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
> 	q->memory = memory;
> +	__set_queue_consistency(q, consistent_mem);
> 
> [..]
> 
> So we set/change queue consistency attribute when we set/change
> queue memory type. Is there a use case for more flexibility when
> it comes to queue consistency?
> 
>>> If user-space attempts to allocate a buffer with consistency
>>> requirements which don't match queue's consistency model such
>>> allocation requests will be failed.
>>
>> Is this last paragraph right? I don't see any code for that.
> 
> Yeah, this was more about the general direction. The actual code
> was added later in the series.
> 
>> BTW, a general comment about patches 4-6: I prefer if you changes
>> this to two patches: one that adds videobuf2-core.c support for
>> this for reqbufs and create_bufs, then another that wires up the
>> new V4L2 flag in videobuf2-v4l2.c.
> 
> I'll take a look.
> 
> 	-ss
> 

