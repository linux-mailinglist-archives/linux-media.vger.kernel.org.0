Return-Path: <linux-media+bounces-45381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E28C00D53
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3092A4FD3AE
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C70C30AD15;
	Thu, 23 Oct 2025 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aYwsPchA"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE53C25A331
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219861; cv=none; b=r8yxEvTDZb0jdUEm51MmHD+QUCDwhqRwvwzjawVtuF0akxeNC9t/qmyjX2yaWMrX94vNyO6YvKzI2KUqgZtGiYd/ATFn4a4VTIQpdQ6LJPMrfDX45j6nyeNZe0v6Fd26RkiJ85jScI7GdL3nyqtVE5xJTW61bZPIRM2RvdkYlmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219861; c=relaxed/simple;
	bh=h+dc5AqFfnkmtTAZbQO+NkR9PLebd1H4BvcJw2dHSbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=IWl1a3rJjLzHPdFNUw1qn4JWHnL27qq509TJzjzoV1Yfejc7Rrqfyn5ibSovAdgF9kc2eu5eJYeigPuetHMLAODxWy467XKeel4Ab2Fhf8Tb51ZF5Jn9LKemknGQbkmnXUlYAgY02ifkUsENFop5T8hD7hQ3LOTcmBgEjy7ldxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aYwsPchA; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251023114418euoutp016733dba2852ecb9ffdb184340406e93c~xHCE4nWC30976309763euoutp01m
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 11:44:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251023114418euoutp016733dba2852ecb9ffdb184340406e93c~xHCE4nWC30976309763euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761219858;
	bh=2fURsD/TdpeT0oW0aRr7tuIshJQdrzIjM052zXlpILc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=aYwsPchAgkzg8vx6Zx9On0Ol5zmYcRNq7pJA/3iWMI2MxHEsQmboZS2oUAd1Em8vw
	 GCbsqoaDTOe7rKt+zr5549IGGelEiQxTONIcESV75u26Q1xRHzR1AtWZeJ/G4QSbE4
	 GAry5awAaMHBz3CpHKVZW6jdfhq3Fk8S25csgJWg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251023114417eucas1p2eefb194161abc6c9acbf84146a6b7201~xHCEkmvBc3032330323eucas1p2w;
	Thu, 23 Oct 2025 11:44:17 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251023114417eusmtip1d57db1143928bedab74047ae6f135434~xHCD5EApQ2479824798eusmtip19;
	Thu, 23 Oct 2025 11:44:17 +0000 (GMT)
Message-ID: <4efe960a-83e3-4c0b-a7e1-1d467ea94962@samsung.com>
Date: Thu, 23 Oct 2025 13:44:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3] media: videobuf2: forbid remove_bufs when legacy
 fileio is active
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil
	<hverkuil@kernel.org>, stable@vger.kernel.org, Shuangpeng Bai
	<SJB7183@psu.edu>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251023113052.1303082-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251023114417eucas1p2eefb194161abc6c9acbf84146a6b7201
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251023113101eucas1p2c227985b0198d888564cab00aeb94f01
X-EPHeader: CA
X-CMS-RootMailID: 20251023113101eucas1p2c227985b0198d888564cab00aeb94f01
References: <CGME20251023113101eucas1p2c227985b0198d888564cab00aeb94f01@eucas1p2.samsung.com>
	<20251023113052.1303082-1-m.szyprowski@samsung.com>

On 23.10.2025 13:30, Marek Szyprowski wrote:
> vb2_ioctl_remove_bufs() call manipulates queue internal buffer list,
> potentially overwriting some pointers used by the legacy fileio access
> mode. Add a vb2_verify_memory_type() check symmetrical to
> vb2_ioctl_create_bufs() to forbid that ioctl when fileio is active to
> protect internal queue state between subsequent read/write calls.
>
> CC: stable@vger.kernel.org
> Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
> Reported-by: Shuangpeng Bai<SJB7183@psu.edu>
> Suggested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

History:

v3:
- moved vb2_verify_memory_type() check after (d->count == 0) check to 
pass v4l2
  compliance

v2: 
https://lore.kernel.org/all/20251020160121.1985354-1-m.szyprowski@samsung.com/
- dropped a change to vb2_ioctl_create_bufs(), as it is already handled
   by the vb2_verify_memory_type() call
- replaced queue->type check in vb2_ioctl_remove_bufs() by a call to
   vb2_verify_memory_type() which covers all cases

v1: 
https://lore.kernel.org/all/20251016111154.993949-1-m.szyprowski@samsung.com/

>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index d911021c1bb0..a8a5b42a42d0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -1000,13 +1000,15 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>   			  struct v4l2_remove_buffers *d)
>   {
>   	struct video_device *vdev = video_devdata(file);
> -
> -	if (vdev->queue->type != d->type)
> -		return -EINVAL;
> +	int res;
>   
>   	if (d->count == 0)
>   		return 0;
>   
> +	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
> +	if (res)
> +		return res;
> +
>   	if (vb2_queue_is_busy(vdev->queue, file))
>   		return -EBUSY;
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


