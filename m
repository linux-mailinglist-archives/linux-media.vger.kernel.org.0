Return-Path: <linux-media+bounces-45384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FBFC011C4
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CEE475036ED
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 12:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B070D14AD20;
	Thu, 23 Oct 2025 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YllBFYQn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34BC30148C;
	Thu, 23 Oct 2025 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222352; cv=none; b=h37QmVzFlKKcIZt6KB5lWGIK5qV5qj8UXO7Bmgi31v9cXYJS+2Re/v62F9yVAxB8dWiOdeMcUk97PdWU1pDsY+MQDv+GUT9zs7SW4jI0XMVieYbsgvCTxb6Jpfe8j6RiQwnSgdBDAxYEeHL7cveWIJAvl9/ccBsC2eq6xg7e9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222352; c=relaxed/simple;
	bh=lgIiMFnGDqq2sHQoJbRahA2L1aFw8N7zO224VmtFP/k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LTPFk27w9f3QQSpSZKTFszvFlf0iFBrR6CU6Ii8o+bsmQSkblRP21dfanqv4h4EeLsRvi5RIfg+P8fc1g/4TwlpO3sZKCc5F97BK3qte3/8tbk+gBolAxH6r7t1oGA0ATBeYz+oMkRdKo0UI4W9kQDULk/jdlTTxqS7c0QaXX+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YllBFYQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD5CC4CEE7;
	Thu, 23 Oct 2025 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761222351;
	bh=lgIiMFnGDqq2sHQoJbRahA2L1aFw8N7zO224VmtFP/k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=YllBFYQnZ93A6UX7xrHZcoebrMFd9t3REBj+BMAkasmk19RTVASLmTtsnTPPRadKG
	 oo+uXtzlNMbJ/ZXUT7qgJh4UAz13adXcXHBq1lql3qHebsSwjPE2g4ZPG9Cv3LgQHQ
	 tL4o85FXm7cKa6x146w0brX9acsxieBIlGNJ9UGl83LxxnhxZpejDJXmpKWLQVSQWt
	 kFstjDZYGKYb2xUprJZvZ51UDutKBioQtWpno4kVAjD1Ggemlm8TTZthVyJzBsfeeC
	 C8x6ad8U/4bITxdZCBTbkKjWO6OBcCEO1n7D7LsrLFe0gGHrkX57uBRqOseByy14AC
	 6k4lyFDXa4SVA==
Message-ID: <c081ec16-adb0-41b9-8ad6-5db9ccd6242c@kernel.org>
Date: Thu, 23 Oct 2025 14:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3] media: videobuf2: forbid remove_bufs when legacy
 fileio is active
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, stable@vger.kernel.org,
 Shuangpeng Bai <SJB7183@psu.edu>
References: <CGME20251023113101eucas1p2c227985b0198d888564cab00aeb94f01@eucas1p2.samsung.com>
 <20251023113052.1303082-1-m.szyprowski@samsung.com>
 <81a46647-c666-4475-893b-d4af043c90ea@kernel.org>
 <85aa56ff-098b-4db1-9de5-05b0f306623f@samsung.com>
Content-Language: en-US, nl
In-Reply-To: <85aa56ff-098b-4db1-9de5-05b0f306623f@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2025 13:55, Marek Szyprowski wrote:
> On 23.10.2025 13:36, Hans Verkuil wrote:
>> On 23/10/2025 13:30, Marek Szyprowski wrote:
>>> vb2_ioctl_remove_bufs() call manipulates queue internal buffer list,
>>> potentially overwriting some pointers used by the legacy fileio access
>>> mode. Add a vb2_verify_memory_type() check symmetrical to
>>> vb2_ioctl_create_bufs() to forbid that ioctl when fileio is active to
>>> protect internal queue state between subsequent read/write calls.
>>>
>>> CC: stable@vger.kernel.org
>>> Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
>>> Reported-by: Shuangpeng Bai<SJB7183@psu.edu>
>>> Suggested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> index d911021c1bb0..a8a5b42a42d0 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> @@ -1000,13 +1000,15 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>>>   			  struct v4l2_remove_buffers *d)
>>>   {
>>>   	struct video_device *vdev = video_devdata(file);
>>> -
>>> -	if (vdev->queue->type != d->type)
>>> -		return -EINVAL;
>>> +	int res;
>>>   
>>>   	if (d->count == 0)
>>>   		return 0;
>> Ah, no. This should still check d->type. So:
>>
>> 	if (d->count == 0)
>> 		return d->type == vdev->queue->type ? 0 : -EINVAL;
> 
> Then frankly speaking lets get back to v1 limited to 
> vb2_ioctl_remove_bufs(), as using vb2_verify_memory_type() in this 
> context only makes things harder to understand:
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c 
> b/drivers/media/common/videobuf2/videobuf2-v4l2.c index 
> d911021c1bb0..f4104d5971dd 100644 --- 
> a/drivers/media/common/videobuf2/videobuf2-v4l2.c +++ 
> b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> 
> @@ -1010,6 +1015,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void 
> *priv, if (vb2_queue_is_busy(vdev->queue, file)) return -EBUSY; + if 
> (vb2_fileio_is_active(vdev->queue)) { + dprintk(vdev->queue, 1, "file io 
> in progress\n"); + return -EBUSY; + } + return 
> vb2_core_remove_bufs(vdev->queue, d->index, d->count); } 
> EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);

I agree. Can you post a v4?

Regards,

	Hans

> 
> 
>> Regards,
>>
>> 	Hans
>>
>>>   
>>> +	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
>>> +	if (res)
>>> +		return res;
>>> +
>>>   	if (vb2_queue_is_busy(vdev->queue, file))
>>>   		return -EBUSY;
>>>
> Best regards


