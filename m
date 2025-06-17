Return-Path: <linux-media+bounces-35043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480E8ADC675
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B170D3BBFDA
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261022949F3;
	Tue, 17 Jun 2025 09:29:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F0928D8EE;
	Tue, 17 Jun 2025 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152554; cv=none; b=OytmgpkjVY+vokURJUdB1aJZanLxUed6RrNdg13kzV6lNgg71Byt9RTEkBQrF1DFmNF9UebSv2oostIs9eOq4SwBiB+6Bn062KWNgGJJp2CSyQSKtS5qiU/wQlYtLJVesKEjr5rN7ndqJfKnOUscP2zk3f7bkSTdE2LSnNz9sbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152554; c=relaxed/simple;
	bh=BLhgt8NKy11ftNW7oRUuMgEb819Xx+li28g2q+IrRSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pk64RbDWvL5BphlfXVjokO/ZdlIgdiL26K23w4MAVi+u4urmrA+NY1BPbxIS5c+vvJ7LqayogeuDJogC8mKzJSYCzok5Q4nNJg+sxAwkeu4m0VBoEekgoKLk2onxu5sIYl7b4iM1XrQlInrtUnqcHSvycE5D1POKXRzXF/XvpdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224D8C4CEED;
	Tue, 17 Jun 2025 09:29:12 +0000 (UTC)
Message-ID: <ff13e1a9-f1c8-4d2e-a535-122c512ffc03@xs4all.nl>
Date: Tue, 17 Jun 2025 11:29:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] media: uvcvideo: Remove stream->is_streaming field
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-4-250286570ee7@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250616-uvc-fop-v4-4-250286570ee7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2025 17:24, Ricardo Ribalda wrote:
> The is_streaming field is used by modular PM to know if the device is
> currently streaming or not.
> 
> With the transition to vb2 and fop helpers, we can use vb2 functions for
> the same functionality. The great benefit is that vb2 already tracks the
> streaming state for us.
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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
> index d06ecf3418a988152c6c413568ce32e60040fd87..7ab1bdcfb493fe9f47dbdc86da23cba98d7d10ff 100644
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
>  
> @@ -676,50 +673,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
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
> @@ -1320,8 +1273,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
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
> index b300487e6ec9163ac8236803b9e819814233f419..3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -629,7 +629,6 @@ struct uvc_fh {
>  	struct uvc_video_chain *chain;
>  	struct uvc_streaming *stream;
>  	unsigned int pending_async_ctrls;
> -	bool is_streaming;
>  };
>  
>  /* ------------------------------------------------------------------------
> 


