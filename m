Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 810D91466D6
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 12:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgAWLfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 06:35:37 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45247 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbgAWLfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 06:35:37 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ualpiy1VaT6sRualqixbcI; Thu, 23 Jan 2020 12:35:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579779334; bh=KEHyB2YSBLhTH76juePtrte4Uqe1v74RtTuxnjS6ESw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kH+19aZeG/th3Kb+uBZwEgMzAdZIMhawWPepzm7JZVQEfMzba5ZeGMpJvkd23h5Ac
         regY7JLcijhNRr4b9X4Kj/dKP4pQOfMvLOUE9oadsXR9/GptPPnqkyYY+FSRtuOVhl
         ycl55j9Ir6GmEGiYWxPFzDPkFCQgnihjicpE3X6kOiX4M8lhf2bwRch3h7qOYk8bNH
         4C+6aDaUDbYppbNSexA5unpK5+LTwRuyRML0KBLvHPk14I/NE1MeBy65wqkYJNYv5e
         T24A4dZc1f5xPPLcMj0Zo2xRMx3dZ/X9KM1gkKTQWwKHz1kyqayJ4wW7UhB6ujfuxD
         7d5UVTiUVwFYw==
Subject: Re: [RFC][PATCH 13/15] videobuf2: do not sync buffers for DMABUF
 queues
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
 <20191217032034.54897-14-senozhatsky@chromium.org>
 <2d0e1a9b-6c5e-ff70-9862-32c8b8aaf65f@xs4all.nl>
 <20200122050515.GB49953@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <57f711a0-6183-74f6-ab24-ebe414cb6881@xs4all.nl>
Date:   Thu, 23 Jan 2020 12:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200122050515.GB49953@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFopszA+QvXTY3B1Zj27KGKBvsbxEPtzbuP86jYxKN8NfHKcNcahR0+HMQVTFh5+Qk9B2QWy90ayhnUMRgfR/HDQDDcv6rPAJGCMarqO+bQ1VuzH0CDI
 faQth5pTfW8vmyHDw+EETiF26T/zSkrEzq92K8xpWQw+F2Zw5qI9SDiDsaU3GMJvHPhkadAzljht67/ZReaSAlmZyGEcLtv1LFVoZKI2PABPvQHhFiPOd0fb
 U34BS+45enK/WhR6uxOhDSduOM5m/bSo69DAhFjOP2fZMUNzFCiHf8+XShd7FuqDSFfOKpNhq2eI2DHPhpCvofFnQqGedoWG+HkAJNZLz/kTty/3N8kf/dg0
 nFnr6EGDAVJoGM+7UVfhNtg7e4tJOfFY9/g+ZRjSY0EcmqX0EtJ4Ga9gt/hZHO34yIEBapk0nGE2KHWCscl4LL6Yp+rsTSjHsu22C+pjj4rTp+lyZz/lK9Va
 5xJoWNK+owTcpGn5RFex/Pp7/NS9GXAJc/AcidSIpg+LPfcUIn5lR5DqYgwwujCJMdb9Sgaema8hYmG8XmCApmij7cJKfRFekM9DpA6OmCsM0eEXtQH654b5
 xaFzdFTjs6SZpVhQ27/4j4XPquXrXPQt9EDK67QglgaiTw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/22/20 6:05 AM, Sergey Senozhatsky wrote:
> On (20/01/10 11:30), Hans Verkuil wrote:
> [..]
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> index 1762849288ae..2b9d3318e6fb 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> @@ -341,8 +341,22 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
>>>  				   struct vb2_buffer *vb,
>>>  				   struct v4l2_buffer *b)
>>>  {
>>> -	vb->need_cache_sync_on_prepare = 1;
>>> +	/*
>>> +	 * DMA exporter should take care of cache syncs, so we can avoid
>>> +	 * explicit ->prepare()/->finish() syncs.
>>> +	 */
>>> +	if (q->memory == VB2_MEMORY_DMABUF) {
>>> +		vb->need_cache_sync_on_finish = 0;
>>> +		vb->need_cache_sync_on_prepare = 0;
>>> +		return;
>>> +	}
>>>  
>>> +	/*
>>> +	 * For other ->memory types we always need ->prepare() cache
>>> +	 * sync. ->finish() cache sync, however, can be avoided when queue
>>> +	 * direction is TO_DEVICE.
>>> +	 */
>>> +	vb->need_cache_sync_on_prepare = 1;
>>
>> I'm trying to remember: what needs to be done in prepare()
>> for a capture buffer? I thought that for capture you only
>> needed to invalidate the cache in finish(), but nothing needs
>> to be done in the prepare().
> 
> Hmm. Not sure. A precaution in case if user-space wrote to that buffer?

But whatever was written in the buffer is going to be overwritten anyway.

Unless I am mistaken the current situation is that the cache syncs are done
in both prepare and finish, regardless of the DMA direction.

I would keep that behavior to avoid introducing any unexpected regressions.

Then, if q->allow_cache_hint is set, then default to a cache sync (cache clean)
in the prepare for OUTPUT buffers and a cache sync (cache invalidate) in the
finish for CAPTURE buffers.

This also means that any drivers that want to access a buffer in between the
prepare...finish calls will need to do a begin/end_cpu_access. But that's a
separate matter.

Regards,

	Hans

> 
> +	if (q->dma_dir == DMA_FROM_DEVICE)
> +		q->need_cache_sync_on_prepare = 0;
> 
> ?
> 
> 	-ss
> 

