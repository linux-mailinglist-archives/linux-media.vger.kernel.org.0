Return-Path: <linux-media+bounces-18072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E09735ED
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 13:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23404284C07
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33B718C340;
	Tue, 10 Sep 2024 11:08:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E214D431
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966496; cv=none; b=IvOVLsYJYKYAAzmG2QQaxRZvSxrGvsTYifqunJeAOyYNFA9TWSbXMzIXc4DM1CLce6I+92obB7mn9HIVAMZSTI0HXCPrE0z3JrlX8qOXuzLnihphQPTf6LQx+Wilr5Epyizbru9Df1BpiyzIelcpTj55dlM3kTMnK9N6sPJ9UaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966496; c=relaxed/simple;
	bh=VCLe9IKC9CRSRUfg0f8XOkvKL/Tsi9mbSABbvqg/5tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bg5Tml/HJTyywLCr3I5jqAIseK6QL9oaMgJywFfBXXkdluwz2PeuE/vcm7KaQgyrQOT46sXeWXuSWGIKHWrtIQh45/dv3zwxUcNXgJPLKBVssZSDorkrxrU1eN5qoHwa/2hGedlHMs2WhlEX/0qqM4DE61Cf8swp+SSUj9hquYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DE8C4CEC3;
	Tue, 10 Sep 2024 11:08:15 +0000 (UTC)
Message-ID: <dacae9a3-0ecf-4632-946e-7c5d4035bbbb@xs4all.nl>
Date: Tue, 10 Sep 2024 13:08:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] media: vb2: vb2_core_queue_init(): sanity check lock
 and wait_prepare/finish
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <8eb606d30e33ccee7256a329f9d4a31793864e29.1725285495.git.hverkuil-cisco@xs4all.nl>
 <20240909145953.GH27525@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240909145953.GH27525@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2024 16:59, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Mon, Sep 02, 2024 at 04:04:54PM +0200, Hans Verkuil wrote:
>> Add two new checks:
>>
>> 1) wait_prepare and wait_finish callbacks are either both present or
>>    both unset, you can't mix.
>> 2) if lock == NULL, then wait_prepare (and due to check 1 also
>>    wait_finish) must be present.
>>
>> These checks should prevent the case where lock == NULL, but there
>> is no way to release/reacquire whatever lock is used when waiting
>> for a buffer to arrive in VIDIOC_DQBUF.
> 
> Don't we use the video_device lock when the queue lock is NULL ?
> Shouldn't it be valid to not set wait_prepare and wait_finish in that
> case ?

If q->lock is NULL, then vb2 doesn't know which mutex needs to be
unlocked while waiting for a buffer to arrive (and reacquired afterwards).
So in that case you need to provide a function. Remember that vb2 doesn't
know about the video_device lock. It is the driver that normally fills in
q->lock, and often (or even always?) that is indeed the video_device lock.

If q->lock is NULL, and these functions are not provided, then that is
almost certainly a bug since there is almost certainly some serialization
mutex. And if you don't unlock that while waiting, then you can't issue
other ioctls. In the unlikely event that there really is no mutex involved,
then you have to supply empty functions. There is no driver like that, though.

Regards,

	Hans

> 
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/common/videobuf2/videobuf2-core.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 29a8d876e6c2..6335ac7b771a 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -2644,6 +2644,14 @@ int vb2_core_queue_init(struct vb2_queue *q)
>>  	if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
>>  		return -EINVAL;
>>  
>> +	/* Either both or none are set */
>> +	if (WARN_ON(!q->ops->wait_prepare ^ !q->ops->wait_finish))
>> +		return -EINVAL;
>> +
>> +	/* Warn if q->lock is NULL and no custom wait_prepare is provided */
>> +	if (WARN_ON(!q->lock && !q->ops->wait_prepare))
>> +		return -EINVAL;
>> +
>>  	INIT_LIST_HEAD(&q->queued_list);
>>  	INIT_LIST_HEAD(&q->done_list);
>>  	spin_lock_init(&q->done_lock);
> 


