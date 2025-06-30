Return-Path: <linux-media+bounces-36303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED1AEE06D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC453ADD6E
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1246F283C9F;
	Mon, 30 Jun 2025 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vPy8Kr89"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F2282F1;
	Mon, 30 Jun 2025 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293056; cv=none; b=nrb8flbCUR6F4dbfC8PUTcx26ki/YaPRbHI70Z6MLwGn0qIaq85sRHF0JM/ssMnAxF2rViU5SgJGzQ4S2KhG4z9a2KDELvLP7GPipBvkQ72EeyPEQzNIuO2FCo5hC/s/sZUcO37ba/5DyJSnZ9GmTXpvzhgTrCngPuEDLtwpnM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293056; c=relaxed/simple;
	bh=4sjLg7qB/f+sz/QA5gbsiDeZiYdjAUPTfN9YYZew2JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHmGcsUuBBQ2a1kmKJBM22cLHr8j4NZ9R2yvtod+9C7wH5oTdlpYt34F0fhoSc5t/7ycHQTywrRCQ5O/opgV0YO9WZ81QhtJKfjG6cZ3v3YZgacjYZakmHc1m4ZH1FG/6zqlVyANyPPP63uwrtusjRXrtoS00T7V5YpkFFvw7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vPy8Kr89; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 23F87C75;
	Mon, 30 Jun 2025 16:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751293031;
	bh=4sjLg7qB/f+sz/QA5gbsiDeZiYdjAUPTfN9YYZew2JE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vPy8Kr89EjTaDd7inH/ufRD2esuqpadoCZNOq6GtmSgkDsdiOVct/2GEIscTYYpgQ
	 GcQeiGoneRPWuu2kinbJQoJkMsVc6SwcfnCCwH5RSLRSqOvxNlneS8hkQsv0I1tkZD
	 Z6krmvWCwaLhvMsRCRF+GB0OcJ6SmMfeJgQkMa2E=
Date: Mon, 30 Jun 2025 17:17:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v4 3/5] media: uvcvideo: Split uvc_stop_streaming()
Message-ID: <20250630141707.GG20333@pendragon.ideasonboard.com>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-3-250286570ee7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-uvc-fop-v4-3-250286570ee7@chromium.org>

On Mon, Jun 16, 2025 at 03:24:40PM +0000, Ricardo Ribalda wrote:
> uvc_stop_streaming() is used for meta and video nodes. Split the function
> in two to avoid confusion.
> 
> Use this opportunity to rename uvc_start_streaming() to
> uvc_start_streaming_video(), as it is only called by the video nodes.
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
>  		uvc_video_clock_update(stream, vbuf, buf);
>  }
>  
> -static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> +static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>  	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> @@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	return ret;
>  }
>  
> -static void uvc_stop_streaming(struct vb2_queue *vq)
> +static void uvc_stop_streaming_video(struct vb2_queue *vq)
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>  
>  	lockdep_assert_irqs_enabled();
>  
> -	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
> -		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> +	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> +
> +	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> +}
> +
> +static void uvc_stop_streaming_meta(struct vb2_queue *vq)
> +{
> +	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> +
> +	lockdep_assert_irqs_enabled();
>  
>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);

I haven't checked where it was introduced, but I think you have a race
here. uvc_queue_return_buffers() will return all buffers currently
sitting in the queue->irqqueue. This can race with a bunch of places in
uvc_video.c that call uvc_queue_get_current_buffer() or
uvc_queue_get_next_buffer(), as those functions return a buffer without
removing it from the list.

>  }
> @@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
>  	.buf_prepare = uvc_buffer_prepare,
>  	.buf_queue = uvc_buffer_queue,
>  	.buf_finish = uvc_buffer_finish,
> -	.start_streaming = uvc_start_streaming,
> -	.stop_streaming = uvc_stop_streaming,
> +	.start_streaming = uvc_start_streaming_video,
> +	.stop_streaming = uvc_stop_streaming_video,
>  };
>  
>  static const struct vb2_ops uvc_meta_queue_qops = {
>  	.queue_setup = uvc_queue_setup,
>  	.buf_prepare = uvc_buffer_prepare,
>  	.buf_queue = uvc_buffer_queue,
> -	.stop_streaming = uvc_stop_streaming,
> +	.stop_streaming = uvc_stop_streaming_meta,
>  };
>  
>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)

-- 
Regards,

Laurent Pinchart

