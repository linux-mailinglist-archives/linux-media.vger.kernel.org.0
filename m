Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7094D17CD6C
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 11:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgCGKDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 05:03:55 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:35263 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725878AbgCGKDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 05:03:55 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AWJDjxAUR9Im2AWJEjJ7R9; Sat, 07 Mar 2020 11:03:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583575433; bh=DHuhkuSFjLuLwMs6EpvTQdvcGhNqwPW4UU3C1RJZeOk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tJMve0vwLLVa1yDiZ/6KOXZJFbF0w7GTRiDT3apg7fSeiuTjojhNmUYgXfNM7nquS
         0JjM3QPIUokvOyXm7RxxLZEG+bG2NGPh7a4MNv+3R3Y4jUHTFFU1Uvh/QnHIqB45fj
         7AM9iDRVxHeE7JWk9ejN3BVnqpe0OkS7pav+FKQl1KN3HmLcph1nHf8W54QAWDe8Ha
         o1vJ/tWd1Al+Y/syzR1ZSNG3/4tRsVRBqSYZL2OX+o/AXYIQ5LUaP4lxLMa4JybyUO
         ytaWsEUzM2cRxGd+gsygw61CP1jgSyg9vVSwbangPQR5zHJQ1cCUlGKmk4dFsmcrnF
         ArmHWIrOTGC/g==
Subject: Re: [PATCHv4 04/11] videobuf2: add queue memory consistency parameter
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
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-5-senozhatsky@chromium.org>
 <7ab74b32-441d-1a1a-0112-6c4d0c0b900c@xs4all.nl>
 <20200307075046.GC176460@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ee1c73c5-2250-84df-093c-6ff3d91f88da@xs4all.nl>
Date:   Sat, 7 Mar 2020 11:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307075046.GC176460@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKc7eqVCF88w1V82dTbnVEC5EB+y7k0Jb7tKAlUkdj9eqm5sF8y2bPPGXmqhf6JoB/OyaU1Rh4z6mfhb45A7GaoMhK+bpTlU8We3s1HmsNrnDSyidB8S
 cicQrUZ6lobwMK+vkxnD1QPY/PJ6prooo2eTIeREOPm7sb8ApC/K90Ptq1nG2YHScgt6hRX0lPDHPj7T5zOXQzwr5GFjQPTOTlmrzcH/7sCNvbc9tTH4uBLF
 SZT9Y4uMMRtjvLIKU8WZaPl2zF7gYyRCaoy6hLI8tyPPueFsGupgB4b8JUqWrLr30dMIofjrdhBNjAfJb45qxwkAkoZij/J9OOi47C4h4Uhqf+v9+NR6N5Y+
 GWqvDh9XM1b5lT3I3Ul45aKtlC8LJDOWKfU0M1vtpvh38khw89lAJIFF6Mwcc9AuLj4Ch4LTV1eTwZO/IBIWidykg9D7AAWCuUMB2MHBTDKKRXJNGTYu0drV
 NmZVM1C8Etmv2FafHV2AkGhDqoX2XY7k1npsXAm98DIATIv2VtrnTxbeDfX6X/iIEgOek/KF/QZbB5ROODIb5lRhs14JefwFPB1LIct4K5E5COkxmBHiN2oO
 zVTq13t9QykOlwXwSOhQi92kkYwzp0PNw+Xtr/Dfgk1/tQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/03/2020 08:50, Sergey Senozhatsky wrote:
> On (20/03/06 15:04), Hans Verkuil wrote:
> [..]
>>> +static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
>>> +{
>>> +	bool queue_attr = q->dma_attrs & DMA_ATTR_NON_CONSISTENT;
>>> +
>>> +	if (consistent_mem != queue_attr) {
>>
>> This is the wrong way around!
>>
>> It's much better to write it like this:
>>
>>        bool queue_is_consistent = !(q->dma_attrs & DMA_ATTR_NON_CONSISTENT);
>>
>>        if (consistent_mem != queue_is_consistent) {
> 
> Hmm... That's a great catch. Thanks for spotting this.
> Puzzled, how come I've never seen problems.
> 
>> What concerns me more is that this means that this series has not been
>> tested properly. I found this when testing with v4l2-compliance and vivid.
> 
> I fully understand your concerns. Give me a moment to figure
> out what's going on...
> 
> 
> OK.
> 
> Apparently, the user-space I'm using for tests, utilizes different
> call path. vb2_core_create_bufs() is never even invoked. Hence queue
> consistency vs. request consistency checks are not performed.
> 
> What happens, instead, is v4l_reqbufs()->vb2_core_reqbufs() path.
> It orphans existing buffers (if any), sets queue memory model, sets
> queue consistency model (DMA attr), then allocates buffers.
> 
> On my test environment, I see that vb2_core_reqbufs() orphans the
> buffers, but it's always due to "*count == 0 || q->num_buffers != 0"
> conditions. The user-space I'm using does not twist queue ->memory
> or consistency attr, so the tests I'm running are limited in scenarios.

That's why v4l2-compliance is so important: it tests 'twisty code' for
correct handling.

> 
> verify_consistency_attr() is not on the list of reasons to orphan
> allocated buffer. It probably should be, tho.
> 
> ===
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index afb3c21a5902..d6b1d32bef3f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -730,7 +730,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	}
>  
>  	if (*count == 0 || q->num_buffers != 0 ||
> -	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory)) {
> +	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
> +	    !verify_consistency_attr(q, consistent_mem)) {
>  		/*
>  		 * We already have buffers allocated, so first check if they
>  		 * are not in use and can be freed.
> ===
> 
>>> +		dprintk(1, "memory consistency model mismatch\n");
>>> +		return false;
>>> +	}
>>> +	return true;
>>> +}
>>> +
>>>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>>> -		unsigned int *count, unsigned requested_planes,
>>> -		const unsigned requested_sizes[])
>>> +			 bool consistent_mem, unsigned int *count,
>>> +			 unsigned requested_planes,
>>> +			 const unsigned requested_sizes[])
>>
>> Use 'unsigned int' in the two lines above, as per checkpatch suggestion.
> 
> OK, will do.
> 
> This comes from the original code. There are 'unsigned'-s in the
> existing code, I saw it and didn't want to modify, in order to keep
> diffstats shorter.

Yeah, but the prototype was already inconsistent (count is an unsigned int *),
so it makes sense to fix this.

Regards,

	Hans

> 
> 	-ss
> 

