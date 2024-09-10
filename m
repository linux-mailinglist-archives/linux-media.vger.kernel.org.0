Return-Path: <linux-media+bounces-18073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B338E9735F8
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 13:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66C26B24201
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 11:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B03418C90B;
	Tue, 10 Sep 2024 11:13:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF21F956
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966781; cv=none; b=nCbHTxh92QA7W2ZXXJNrRv+uLkEefckIAIzxGB0HqQ09fkIEdAzjCSdiAJRbLnAj5gB7B5FRHBBEY+7U8A5bSBj4iC3CYOh7uYAADtG3+r4JDrmgIRmBx1hjjcaa2ADR4RnSs5Hieqcfee5vXfCN/QkirB46rxzHWasktLRTUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966781; c=relaxed/simple;
	bh=+hIkXx418sfhd4dN6GzQvcmHwU7OyFkrGc8fXXRUwp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nk4NaZ9aof0j5NUyDe64f4Zp4lIU4qwqPZnSo2gkCn+q8YlA/I6Xd/VhhIt5Xt8XRUhn4ihkbfU61Ux1d9F1sDb5NBe8l1ATrIEQcn/NYiFII/suDBGAoT64Ay5qrPWiAicyGNKv1NMntzDtJ2oSAV3/QdM0PNrzu1sQN/to7NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA573C4CEC3;
	Tue, 10 Sep 2024 11:13:00 +0000 (UTC)
Message-ID: <a5864383-beac-49a8-abf3-3f389979e2a0@xs4all.nl>
Date: Tue, 10 Sep 2024 13:12:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] media: vb2: use lock if wait_prepare/finish are NULL
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <29c41a6823d813e8b00e18f9397470a42347f1b3.1725285495.git.hverkuil-cisco@xs4all.nl>
 <20240909150521.GI27525@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240909150521.GI27525@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2024 17:05, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Mon, Sep 02, 2024 at 04:04:55PM +0200, Hans Verkuil wrote:
>> If the wait_prepare or wait_finish callback is set, then call it.
>> If it is NULL and the queue lock pointer is not NULL, then just
>> unlock/lock that mutex.
>>
>> This allows simplifying drivers by dropping the wait_prepare and
>> wait_finish ops (and eventually the vb2_ops_wait_prepare/finish helpers).
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 6335ac7b771a..d064e0664851 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -2035,7 +2035,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>>  		 * become ready or for streamoff. Driver's lock is released to
>>  		 * allow streamoff or qbuf to be called while waiting.
>>  		 */
>> -		call_void_qop(q, wait_prepare, q);
>> +		if (q->ops->wait_prepare)
>> +			call_void_qop(q, wait_prepare, q);
>> +		else if (q->lock)
>> +			mutex_unlock(q->lock);
> 
> How about calling vb2_ops_wait_prepare() here ? I think that would be
> more explicit. You would likely need to move the function to
> videobuf2-core.c. Same below for wait_finish.

Why would I call a function that does exactly this? It is just harder to
see what it does since you need to look up that function.

Just in case it wasn't clear: once this series is in I can start removing
vb2_ops_wait_prepare/finish from all media drivers, and eventually remove
those two helpers from vb2.

Regards,

	Hans

> 
>>  
>>  		/*
>>  		 * All locks have been released, it is safe to sleep now.
>> @@ -2045,12 +2048,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>>  				!list_empty(&q->done_list) || !q->streaming ||
>>  				q->error);
>>  
>> +		if (q->ops->wait_finish)
>> +			call_void_qop(q, wait_finish, q);
>> +		else if (q->lock)
>> +			mutex_lock(q->lock);
>> +
>> +		q->waiting_in_dqbuf = 0;
>>  		/*
>>  		 * We need to reevaluate both conditions again after reacquiring
>>  		 * the locks or return an error if one occurred.
>>  		 */
>> -		call_void_qop(q, wait_finish, q);
>> -		q->waiting_in_dqbuf = 0;
>>  		if (ret) {
>>  			dprintk(q, 1, "sleep was interrupted\n");
>>  			return ret;
> 


