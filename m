Return-Path: <linux-media+bounces-45383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F29EC00EB2
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F36618C8068
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B139430DEC4;
	Thu, 23 Oct 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PO19t8ZW"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453C30AD0D
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220548; cv=none; b=J/KAMPedrxdqMaTRx8jx9tmoV6HMJAqaYRLHFfjGY5dkCCMcsa+7jgHg6xs3MKyTnf+SS6EqBgDmVlLtwxf+i8x3iBdUywMM2ixe1O2jarw/ll47GE6T8er3t7LZ+iLpKhXmUxL4YM2MkUL1qw/wm4JCFn9zE5Cl+alXic6bu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220548; c=relaxed/simple;
	bh=jpqlOQFQ0lCsBU/ukJf92pGlz0eJx9vhQf0m3jE70sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=RwZOmoaCqGsqoFdfvXupljpKal5rVaz0SkJGEXAih3hVrdjFxNBuLZG0AzWkUUKRIPwtcz7u0wMcKIc6tN6Wv4r2vgBAt7EgTuFlqrstz8kMqkIgfA/UMHxNW9sRUByM6raNkQVxYH3k+2/nj/iOPigTb1Q5fw3o0cLzZimqHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PO19t8ZW; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251023115544euoutp0109712308216a153c7e26dd4eb46aa683~xHMDwvSj52069120691euoutp01v
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 11:55:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251023115544euoutp0109712308216a153c7e26dd4eb46aa683~xHMDwvSj52069120691euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761220544;
	bh=hkfNeWXTF4q43g0m16pkbTb1R8n6c2a48SB9tENaQRE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=PO19t8ZWx9P6e1iyt+TiwyFwiTHTv3qKCJVUJxsEkC1q6RHjk9xMZTBZ5HnGBZ7vt
	 2yxkdN757SIm7iSxK58aszxb10N1G4XN6ktmTKpALXIebRPA0rA8i6q8K8sc7pwEx2
	 vBDuDwZEEukJH4xGjv6cNis/2nVuVlnfgFiGjoiE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251023115543eucas1p2fa905f7a756b96653fd64f0692d1e23e~xHMDZpWj53189131891eucas1p2Z;
	Thu, 23 Oct 2025 11:55:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251023115542eusmtip1ec5d85b05192ce23dd62b70994d5b0a9~xHMCaM8Ie0113301133eusmtip1b;
	Thu, 23 Oct 2025 11:55:42 +0000 (GMT)
Message-ID: <85aa56ff-098b-4db1-9de5-05b0f306623f@samsung.com>
Date: Thu, 23 Oct 2025 13:55:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3] media: videobuf2: forbid remove_bufs when legacy
 fileio is active
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil
	<hverkuil@kernel.org>, stable@vger.kernel.org, Shuangpeng Bai
	<SJB7183@psu.edu>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <81a46647-c666-4475-893b-d4af043c90ea@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251023115543eucas1p2fa905f7a756b96653fd64f0692d1e23e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251023113101eucas1p2c227985b0198d888564cab00aeb94f01
X-EPHeader: CA
X-CMS-RootMailID: 20251023113101eucas1p2c227985b0198d888564cab00aeb94f01
References: <CGME20251023113101eucas1p2c227985b0198d888564cab00aeb94f01@eucas1p2.samsung.com>
	<20251023113052.1303082-1-m.szyprowski@samsung.com>
	<81a46647-c666-4475-893b-d4af043c90ea@kernel.org>

On 23.10.2025 13:36, Hans Verkuil wrote:
> On 23/10/2025 13:30, Marek Szyprowski wrote:
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
>> ---
>>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> index d911021c1bb0..a8a5b42a42d0 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> @@ -1000,13 +1000,15 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>>   			  struct v4l2_remove_buffers *d)
>>   {
>>   	struct video_device *vdev = video_devdata(file);
>> -
>> -	if (vdev->queue->type != d->type)
>> -		return -EINVAL;
>> +	int res;
>>   
>>   	if (d->count == 0)
>>   		return 0;
> Ah, no. This should still check d->type. So:
>
> 	if (d->count == 0)
> 		return d->type == vdev->queue->type ? 0 : -EINVAL;

Then frankly speaking lets get back to v1 limited to 
vb2_ioctl_remove_bufs(), as using vb2_verify_memory_type() in this 
context only makes things harder to understand:

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c 
b/drivers/media/common/videobuf2/videobuf2-v4l2.c index 
d911021c1bb0..f4104d5971dd 100644 --- 
a/drivers/media/common/videobuf2/videobuf2-v4l2.c +++ 
b/drivers/media/common/videobuf2/videobuf2-v4l2.c

@@ -1010,6 +1015,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void 
*priv, if (vb2_queue_is_busy(vdev->queue, file)) return -EBUSY; + if 
(vb2_fileio_is_active(vdev->queue)) { + dprintk(vdev->queue, 1, "file io 
in progress\n"); + return -EBUSY; + } + return 
vb2_core_remove_bufs(vdev->queue, d->index, d->count); } 
EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);


> Regards,
>
> 	Hans
>
>>   
>> +	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
>> +	if (res)
>> +		return res;
>> +
>>   	if (vb2_queue_is_busy(vdev->queue, file))
>>   		return -EBUSY;
>>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


