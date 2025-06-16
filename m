Return-Path: <linux-media+bounces-34930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A1ADB251
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3BB57A7E14
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667182877D2;
	Mon, 16 Jun 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y10UAQyH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08582BF013;
	Mon, 16 Jun 2025 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081380; cv=none; b=Up5bUB94FoFRTnxxnOhaJFq48ugvIb/qx5guy9It37r5u55gInj0YPBw4Y2ppYZYTtALDqvhK+kVNW0/Usmu/CG4viBnwJEYd3jTYhLo0m2iVS7QOs3Bf4c4/fOa7EnPpdz9GmA22a1PMhkGvgzbEUextC1bvOt3JBtnMPtpKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081380; c=relaxed/simple;
	bh=QzCwI34Y8oNDKacW8SnUKWGWjQW6wZXO0iwISYs+G7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vC40AYTh7DO2rXrNFDo+6FnvHd8tl2lGX5FSu3PajjJIvtc00czoNAe0vXaDpAxWiz6nEWEDlAnMfifqgcUA4oFMSNCALi2D6jpUunUmGHMg2f+deYfN8OCWb7O6/T0KJzuK3EeOFEhYNVmMt40vDgz+WToijNewMymZfoS7i+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y10UAQyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9D3C4CEEA;
	Mon, 16 Jun 2025 13:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750081380;
	bh=QzCwI34Y8oNDKacW8SnUKWGWjQW6wZXO0iwISYs+G7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y10UAQyH6vsYaBlg32iACD1FtFjPGDiFVa+TtDVaBwfklvpOXWGNNwNcFrwM76pgB
	 zL2zol9nBEwcwEctpQR3OUux8tYP/Q/1k8TYLLdY0l94GO3SGxm4cz1BRqwS43H70D
	 wW1gYvyiF13kWMMZ2NHodu0e2j9agodXxFbNscHunCboYSx0jdqwITFncZNaQN4cQ1
	 bRhVE/cgjcZFcB07/XkIMH97Xe8geUmzvvsovl2kkOlixuARCmADWuUouL5AZlOixi
	 MIYwnORqJPiB8xrg08zYU9i5V6X6mM38mbLCPXtGkKHUUTYFNo5fBkxUh12Arvrff+
	 4VOYG5CKTbBug==
Message-ID: <bdf227fa-c171-4bc7-a4c0-518afaec94d4@kernel.org>
Date: Mon, 16 Jun 2025 15:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: uvcvideo: Remove stream->is_streaming field
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hans@jjverkuil.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
 <20250602-uvc-fop-v3-5-a99e18f65640@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250602-uvc-fop-v3-5-a99e18f65640@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 2-Jun-25 18:06, Ricardo Ribalda wrote:
> The is_streaming field is used by modular PM to know if the device is
> currently streaming or not.
> 
> With the transition to vb2 and fop helpers, we can use vb2 functions for
> the same functionality. The great benefit is that vb2 already takes
> track of the streaming state for us.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_queue.c |  9 +++++++
>  drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
>  drivers/media/usb/uvc/uvcvideo.h  |  1 -
>  3 files changed, 11 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 3f357c2d48cfd258c26f0342007d1d12f1e01007..6e845705b3286348a60650eb262e620dc6039d60 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -175,12 +175,18 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>  
>  	lockdep_assert_irqs_enabled();
>  
> +	ret = uvc_pm_get(stream->dev);
> +	if (ret)
> +		return ret;
> +
>  	queue->buf_used = 0;
>  
>  	ret = uvc_video_start_streaming(stream);
>  	if (ret == 0)
>  		return 0;
>  
> +	uvc_pm_put(stream->dev);
> +
>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
>  
>  	return ret;
> @@ -189,11 +195,14 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>  static void uvc_stop_streaming_video(struct vb2_queue *vq)
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> +	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
>  
>  	lockdep_assert_irqs_enabled();
>  
>  	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
>  
> +	uvc_pm_put(stream->dev);
> +
>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..d4bee0d4334b764c0cf02363b573b55fb44eb228 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
>  
>  	uvc_ctrl_cleanup_fh(handle);
>  
> -	if (handle->is_streaming)
> -		uvc_pm_put(stream->dev);
> -
>  	/* Release the file handle. */
>  	vb2_fop_release(file);
>  	file->private_data = NULL;
> @@ -677,50 +674,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
>  	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
>  }
>  
> -static int uvc_ioctl_streamon(struct file *file, void *fh,
> -			      enum v4l2_buf_type type)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -	int ret;
> -
> -	if (handle->is_streaming)
> -		return 0;
> -
> -	ret = uvc_pm_get(stream->dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = vb2_ioctl_streamon(file, fh, type);
> -	if (ret) {
> -		uvc_pm_put(stream->dev);
> -		return ret;
> -	}
> -
> -	handle->is_streaming = true;
> -
> -	return 0;
> -}
> -
> -static int uvc_ioctl_streamoff(struct file *file, void *fh,
> -			       enum v4l2_buf_type type)
> -{
> -	struct uvc_fh *handle = fh;
> -	struct uvc_streaming *stream = handle->stream;
> -	int ret;
> -
> -	ret = vb2_ioctl_streamoff(file, fh, type);
> -	if (ret)
> -		return ret;
> -
> -	if (handle->is_streaming) {
> -		handle->is_streaming = false;
> -		uvc_pm_put(stream->dev);
> -	}
> -
> -	return 0;
> -}
> -
>  static int uvc_ioctl_enum_input(struct file *file, void *fh,
>  				struct v4l2_input *input)
>  {
> @@ -1323,8 +1276,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>  	.vidioc_expbuf = vb2_ioctl_expbuf,
>  	.vidioc_dqbuf = vb2_ioctl_dqbuf,
>  	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> -	.vidioc_streamon = uvc_ioctl_streamon,
> -	.vidioc_streamoff = uvc_ioctl_streamoff,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
>  	.vidioc_enum_input = uvc_ioctl_enum_input,
>  	.vidioc_g_input = uvc_ioctl_g_input,
>  	.vidioc_s_input = uvc_ioctl_s_input,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -626,7 +626,6 @@ struct uvc_fh {
>  	struct uvc_video_chain *chain;
>  	struct uvc_streaming *stream;
>  	unsigned int pending_async_ctrls;
> -	bool is_streaming;
>  };
>  
>  /* ------------------------------------------------------------------------
> 


