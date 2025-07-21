Return-Path: <linux-media+bounces-38179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189AB0C792
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53B664E5E1C
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 15:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012082DECCD;
	Mon, 21 Jul 2025 15:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfF8+kyK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658562DEA6E
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111704; cv=none; b=NyctiChZFVs+dsztmQ/l9lVINgbGN1HOQKfcROn5Hga7ezTa74JMQbW6qNw0eNwRTqKdJYOKUwpGXR3ioGe4wliLLbehXiaEgjtJ4HbGFSj2VpVks3MronOOnxW0n6FUxlKAu1j2RZCwtiPkKd13qEvbAC6e8IxADjIMfJorhNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111704; c=relaxed/simple;
	bh=5pdlCYbTRFB5GZowN9Ue6gpiMloaBIIy88I1q6ncfXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LdpecpevGHJ5c5bvVZAuafewAlvHh5qHsNnQZzWFtdaL9mUyZ/z/jlP9b9jHkdgGHHqbko6HuvKrQq9ifCqWg+HoQV9gXwieFoPGHFXVMW6kQmVQhlSDakfjdXmcEsO5r/RL3QhrICEgWa+2YdNdlVoyuyKPlA+2fUsjtmUOwxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfF8+kyK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4246CC4CEED;
	Mon, 21 Jul 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111703;
	bh=5pdlCYbTRFB5GZowN9Ue6gpiMloaBIIy88I1q6ncfXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IfF8+kyKQBTX/Dgc5G0GkXQA5F1f1sB87fYCB97QXF/qjsNN8L010/rBy8RhnSteD
	 O+IaRoIR1ZeqC8c8JQS2exNfwCFq1V9N5yqls+Eh1Aqm2df6ySl2tuf7uZi6ywgc79
	 xWQn6lz3QkiQ9oFKcVOXDf7RHWqwbiiotfnOJGsdR+M6EMvRJ751FuqO5OnRCoZ+HO
	 MkLB/6clZEtzvkLFPwt1zS8NEo7DsYCTcnmF6N/0FsykSEROulbg+7wwcCdyVKKH27
	 Fe1d3OJWdgsqqniu3ZbNoy/z5AL0bJzCn62w86v1c5dBYCXB/15uQrq/enzQNujhkm
	 foNvHaIpy9exw==
Message-ID: <2032a1a5-c162-4e3f-acbf-58e57fbd772f@kernel.org>
Date: Mon, 21 Jul 2025 17:28:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: uvcvideo: Drop unneeded memset() in meta
 device ioctl handlers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
 <20250715185254.6592-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250715185254.6592-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jul-25 8:52 PM, Laurent Pinchart wrote:
> The .vidioc_g_fmt_meta_cap() and .vidioc_enum_fmt_meta_cap() ioctl
> handlers for meta capture devices memset the ioctl argument structure to
> zero. This is unnecessary as the memory is already zeroed by the V4L2
> ioctl core. Drop the memset(), which, in uvc_meta_v4l2_enum_formats(),
> also allows further simplification as structure fields don't need to be
> saved and restored.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 229e08ff323e..b68bfb2d47df 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -49,8 +49,6 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
>  	if (format->type != vfh->vdev->queue->type)
>  		return -EINVAL;
>  
> -	memset(fmt, 0, sizeof(*fmt));
> -
>  	fmt->dataformat = stream->meta.format;
>  	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>  
> @@ -118,19 +116,14 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>  	struct v4l2_fh *vfh = file->private_data;
>  	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>  	struct uvc_device *dev = stream->dev;
> -	u32 i = fdesc->index;
>  
>  	if (fdesc->type != vfh->vdev->queue->type)
>  		return -EINVAL;
>  
> -	if (i >= dev->nmeta_formats)
> +	if (fdesc->index >= dev->nmeta_formats)
>  		return -EINVAL;
>  
> -	memset(fdesc, 0, sizeof(*fdesc));
> -
> -	fdesc->type = vfh->vdev->queue->type;
> -	fdesc->index = i;
> -	fdesc->pixelformat = dev->meta_formats[i];
> +	fdesc->pixelformat = dev->meta_formats[fdesc->index];
>  
>  	return 0;
>  }


