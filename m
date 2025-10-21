Return-Path: <linux-media+bounces-45118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B55BF5A7E
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 11:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29AA3352FBE
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 09:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CE4303A0F;
	Tue, 21 Oct 2025 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPjgrZ+Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846E2D77F7;
	Tue, 21 Oct 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040594; cv=none; b=a0SuktBxNI4ZmaiiekmpeXF4sK93p06dzg6MuTZ7W/npw+nKYTZy3iFb2ancb7DUbc/pounsdyoZLJcboS/0ESgl4zFeF/Z8tO+iSLZtPU8v1Dl/xOvZngITyS1cSw391uStK1kLXIVCqK09U2fvI+Bl+vjY2eosEd9YONEyDQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040594; c=relaxed/simple;
	bh=5Rm81nIKRtPBRA3BFntrFY6s5Mpud2dDBun1ALVD8d4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rhyXodCVlwxPf0j7cYbfUwartUtbjuwqYJpIlD49KP7UoRgxvEF5VifTvHIEeG06LTKaqFylkYIkGZ67IpDN+j1aoumRIF3HEH/30hfNucNcPd1RSfIR2juQY0lQF12HlquGInZvS2IUD6GegKQ5qnSx+boo782koy7/+qnzyXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPjgrZ+Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D772C4CEF1;
	Tue, 21 Oct 2025 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761040594;
	bh=5Rm81nIKRtPBRA3BFntrFY6s5Mpud2dDBun1ALVD8d4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=TPjgrZ+ZaAcHNg/Cf8O76DLSZphZpSGUpJBhliSKiC3X6LPwVGgRCMsES/Z7RFANr
	 VyQNhX++xTTRzpYuwcKZV2SLH5wLa3jdwUN6nZ0CjeaQz3S/wt7tVSplkR8nlXjs8q
	 hisqHedVWgC5NWXYFUStHNnGFD0+rFPpeP8Hb5cVn2ZcpHxNby05xwj69cRLBbfda9
	 GTnPkNIeoopDSyihJ5Dq917ImGvkrE93AVAW49jTJmO+KCsSZrGD0dbCvQQcayzDFE
	 VZyvERmx5R/zQSwkvs5xiz1TSBhHArsTCURc+9i8x9ovMwhNw8T0BSC5p334Hd0kCO
	 A9o+v2Zjwsoyw==
Message-ID: <9996520a-fbad-4f02-9630-7de85f04c286@kernel.org>
Date: Tue, 21 Oct 2025 11:56:29 +0200
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
Content-Language: en-US, nl
In-Reply-To: <20251020160121.1985354-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Marek,

On 20/10/2025 18:01, Marek Szyprowski wrote:
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

I'll pick this up as a fix for v6.18. I think this is important enough to
not wait for v6.19.

Regards,

	Hans

> ---
> v2:
> - dropped a change to vb2_ioctl_create_bufs(), as it is already handled
>   by the vb2_verify_memory_type() call
> - replaced queue->type check in vb2_ioctl_remove_bufs() by a call to
>   vb2_verify_memory_type() which covers all cases
> 
> v1: https://lore.kernel.org/all/20251016111154.993949-1-m.szyprowski@samsung.com/
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index d911021c1bb0..0de7490292fe 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -1000,9 +1000,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>  			  struct v4l2_remove_buffers *d)
>  {
>  	struct video_device *vdev = video_devdata(file);
> +	int res;
>  
> -	if (vdev->queue->type != d->type)
> -		return -EINVAL;
> +	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
> +	if (res)
> +		return res;
>  
>  	if (d->count == 0)
>  		return 0;


