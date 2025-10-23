Return-Path: <linux-media+bounces-45378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97381C00D05
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3F13ACE78
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1025930AAD4;
	Thu, 23 Oct 2025 11:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHccZPGt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66730279DC9;
	Thu, 23 Oct 2025 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219383; cv=none; b=i4vDBhBFGzETyA454kJis0kPeOic4GY/MtCy3FCYeX6cNjVcSHSNer+PknKiIRbomGz/E0ygKrUdDmEVWnc1V/GcHQ8vMyWlsWqiH74c0k8+L49WjbDl17LQ9cP+9mI0qi1VIpH0Uk9f6Yrh1VCYNEP1VqO7cXJWUN3e7bvLEOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219383; c=relaxed/simple;
	bh=rbVZpONuC8MAzupUoRy17aoUqpMr4UX2Bqwco3pg+hA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=d3yfh02g8jkhFE0nWdt+qds6kmja3xMkYAMJbB9AAnRjkaWOZN4QItlP2iwZDQ1Rz09ozjKbTjc2j/zM0SZCEC2iZpi10TVAorV446QhJgSlobNOOK11SR+Rf9kBqv7vQ2bOnm4aqdDwz/3bG2mr6JzEr1dH9dvP4qn6z33Tcls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHccZPGt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE95C4CEE7;
	Thu, 23 Oct 2025 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761219383;
	bh=rbVZpONuC8MAzupUoRy17aoUqpMr4UX2Bqwco3pg+hA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tHccZPGtr8HRLVzd2BxtGWKiMvNQLtneFAtXPK0MIohfsOYOy9L2YWlczBAKDFeXJ
	 puuQGSWMrKiKfnlw6EdXU2roj5Ew5UB663PNBBKyZmxQ8Fk3iGMNJNg5XMAIPMHqia
	 ScI3i1jl9CibU7sJhGXoMxoI4ZJWm1oPYytPZi3XS/0UpnW4Q5fvowkx7+xq9IMxqc
	 hq8EkgitZ9caxAb3tldpXCHIVgvOGho757w191gTWU3D9If30Hdfy4gNSHkTUqhQoe
	 WS2PdPzkRLQf2c0tnUTxeocWpB/iB1NCzklkn8+4d0CCYXrrNtbbw8OXG0R++hgGMh
	 CAjPEfTAXQ5Lw==
Message-ID: <81a46647-c666-4475-893b-d4af043c90ea@kernel.org>
Date: Thu, 23 Oct 2025 13:36:19 +0200
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
Content-Language: en-US, nl
In-Reply-To: <20251023113052.1303082-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2025 13:30, Marek Szyprowski wrote:
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
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index d911021c1bb0..a8a5b42a42d0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -1000,13 +1000,15 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>  			  struct v4l2_remove_buffers *d)
>  {
>  	struct video_device *vdev = video_devdata(file);
> -
> -	if (vdev->queue->type != d->type)
> -		return -EINVAL;
> +	int res;
>  
>  	if (d->count == 0)
>  		return 0;

Ah, no. This should still check d->type. So:

	if (d->count == 0)
		return d->type == vdev->queue->type ? 0 : -EINVAL;

Regards,

	Hans

>  
> +	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
> +	if (res)
> +		return res;
> +
>  	if (vb2_queue_is_busy(vdev->queue, file))
>  		return -EBUSY;
>  


