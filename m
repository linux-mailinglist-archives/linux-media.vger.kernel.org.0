Return-Path: <linux-media+bounces-45344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81179C000F1
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0367B188AA9D
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94582E973A;
	Thu, 23 Oct 2025 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ligD0437"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223FB37160;
	Thu, 23 Oct 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210083; cv=none; b=TZiLQ5RvsJeGH9LopYgXObXmGoos93/NLXSHV1m2nEfZxtNG8XG6GrrhQg6XWBE9nI6beB9sghlebsltx+9GaR0xohlcBxD0QCQAgJUdc0ABJ23dj9p/j3fjILwlmPTC4WYAQts0s3Qocz4O7cIfrLLuhR1HU9+SpDoZhZwrB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210083; c=relaxed/simple;
	bh=0rHxZlVb4r0UgpfLdaBesxLORRE7B414DrFKN5P0h1I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iXTE7UCt5DFAKlDmYPYBH2bSqpWnQf2pXjMDcFYbvwbd86e71HtIQQKmPp+hkjWhaLcFEUQdYlahrtbvhAKwoZOWiinYADZPPyT8HgcawbnhXpose6W68ppD4KAAeax4mCV+NxqJBWL7dSu1ARFQexoe0UZfQIEtJB808W29WUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ligD0437; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D9AC4CEE7;
	Thu, 23 Oct 2025 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761210082;
	bh=0rHxZlVb4r0UgpfLdaBesxLORRE7B414DrFKN5P0h1I=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ligD0437VBatDxah713Z2DHSB2oB5RKX8YLygmYaRa2XewqjILOencdpTu6rmOpiG
	 zubN8LhlrJqszfJBjZmRDxaKLLsLHJj6DGFG5Ee0z2M2+lmzgNeF9z1HgXItjwQxqG
	 qdOF0QhTbW2Y0RX0sx5kA1vwMppPSihxZyTKuqhbZdlXWZB8EJqcn0pkK0n5oIt1Iz
	 thrWcO6jEXPB2NdGwGkfHydSsd00m/obsoe2ATwA+B2RdmupvFYF8gJJTzrrr+BDq8
	 U8Yfv045SEcjwDl4zZtsWfParGe8aibRTAL0JtNNWZwNWOzO2yv87KeJyCAKnPfhJO
	 FPFKv7BbWbQ5g==
Message-ID: <9df0295d-418b-46ea-958a-a025de8b62e7@kernel.org>
Date: Thu, 23 Oct 2025 11:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: videobuf2: forbid remove_bufs when legacy
 fileio is active
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, stable@vger.kernel.org,
 Shuangpeng Bai <SJB7183@psu.edu>
References: <CGME20251020160135eucas1p29eb8517e240f188f102e77713f85e29d@eucas1p2.samsung.com>
 <20251020160121.1985354-1-m.szyprowski@samsung.com>
 <9996520a-fbad-4f02-9630-7de85f04c286@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <9996520a-fbad-4f02-9630-7de85f04c286@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2025 11:56, Hans Verkuil wrote:
> Hi Marek,
> 
> On 20/10/2025 18:01, Marek Szyprowski wrote:
>> vb2_ioctl_remove_bufs() call manipulates queue internal buffer list,
>> potentially overwriting some pointers used by the legacy fileio access
>> mode. Add a vb2_verify_memory_type() check symmetrical to
>> vb2_ioctl_create_bufs() to forbid that ioctl when fileio is active to
>> protect internal queue state between subsequent read/write calls.
>>
>> CC: stable@vger.kernel.org
>> Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
>> Reported-by: Shuangpeng Bai<SJB7183@psu.edu>
>> Suggested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> I'll pick this up as a fix for v6.18. I think this is important enough to
> not wait for v6.19.

Hmm, it's failing on v4l2-compliance. I'm debugging to see whether it is a
kernel or v4l2-compliance problem.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> ---
>> v2:
>> - dropped a change to vb2_ioctl_create_bufs(), as it is already handled
>>   by the vb2_verify_memory_type() call
>> - replaced queue->type check in vb2_ioctl_remove_bufs() by a call to
>>   vb2_verify_memory_type() which covers all cases
>>
>> v1: https://lore.kernel.org/all/20251016111154.993949-1-m.szyprowski@samsung.com/
>> ---
>>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> index d911021c1bb0..0de7490292fe 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> @@ -1000,9 +1000,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>>  			  struct v4l2_remove_buffers *d)
>>  {
>>  	struct video_device *vdev = video_devdata(file);
>> +	int res;
>>  
>> -	if (vdev->queue->type != d->type)
>> -		return -EINVAL;
>> +	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
>> +	if (res)
>> +		return res;
>>  
>>  	if (d->count == 0)
>>  		return 0;
> 
> 


