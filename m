Return-Path: <linux-media+bounces-34928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB2ADB244
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C92C61882A41
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B621285C98;
	Mon, 16 Jun 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esnnnsUm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A0E2BEFEF;
	Mon, 16 Jun 2025 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081131; cv=none; b=BmBfZraf1M5CVdSQm2S9GOdR16GsReW+BtCi5A0GsOORghs7DLFrku8/BRXrjB4fiua8aI8MMv1FzxKqA8nUpXtCgv7HxSn1GuwBH+LQxgbZtuL1PbsOx84sx4MMm35effovamBBqOO6FB8c+vtAJl6Ok5wW4GhFm3Hzm3ES5Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081131; c=relaxed/simple;
	bh=8M65mS9EEg0oDhf1JwyvnsruPCcSeNck/xnet/vYniU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHUNkK6wfnYJzvTvDL/JEQuBw2GGjiDpIV7mx3EZIz7JgRGPq3M9Ty5MQj393bZGejOZkqIDjs7N6kPvYr9h9UQ+Ubu1L8N/XR6P3G4Qj68u+o/lOqKdw0aoYPfj1b+DjqMvv7oMBaenNVvzZ80Obk710qblMfSlfwSi6HfU5QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esnnnsUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CD7C4CEEA;
	Mon, 16 Jun 2025 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750081130;
	bh=8M65mS9EEg0oDhf1JwyvnsruPCcSeNck/xnet/vYniU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=esnnnsUmi2F9RT3xWIlBEcySTbBczdae/g59HVHSCPZX3/ViWCndeOVKKm3pvvvL8
	 MbNFzfwR47FUbkAe5djY1EcMo2KnyYbbSoheBjAbTHS/5iaf894RC2eGrmhLWOl+3/
	 OQq0Az/zBezUcMzLemi+IKZJhZ9W/mFNos79oKwZtjPYcnCt4CxBWKGNRaPKQl7zmL
	 HFKitjDHmbNtGgrI6n0q8afsxi3GbLMCLribjZR/LBGwgkeKfMXhRxSTN8IL8uaqz/
	 /co0AcJ6DE9jwRvvAFZlilW02g14jDvE2YLWNFfAWY7FmGIChT6R2pOTO99jELXH81
	 wNvFiLL9lPXfA==
Message-ID: <09cc5598-ade2-42c4-8a64-0981e4575d1b@kernel.org>
Date: Mon, 16 Jun 2025 15:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: uvcvideo: Handle locks in
 uvc_queue_return_buffers
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hans@jjverkuil.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
 <20250602-uvc-fop-v3-3-a99e18f65640@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250602-uvc-fop-v3-3-a99e18f65640@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 2-Jun-25 18:06, Ricardo Ribalda wrote:
> Most of the calls to uvc_queue_return_buffers() wrap the call with
> spin_lock_irq()/spin_unlock_irq().
> 
> Rename uvc_queue_return_buffers to __uvc_queue_return_buffers to
> indicate that this is the version that does not handle locks and create
> a new version of the function that handles the lock.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_queue.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 72c5494dee9f46ff61072e7d293bfaddda40e615..8f9737ac729546683ca48f5e71ce3dfacbae2926 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -42,13 +42,15 @@ static inline struct uvc_buffer *uvc_vbuf_to_buffer(struct vb2_v4l2_buffer *buf)
>   *
>   * This function must be called with the queue spinlock held.
>   */
> -static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
> -			       enum uvc_buffer_state state)
> +static void __uvc_queue_return_buffers(struct uvc_video_queue *queue,
> +				       enum uvc_buffer_state state)
>  {
>  	enum vb2_buffer_state vb2_state = state == UVC_BUF_STATE_ERROR
>  					? VB2_BUF_STATE_ERROR
>  					: VB2_BUF_STATE_QUEUED;
>  
> +	lockdep_assert_held(&queue->irqlock);
> +
>  	while (!list_empty(&queue->irqqueue)) {
>  		struct uvc_buffer *buf = list_first_entry(&queue->irqqueue,
>  							  struct uvc_buffer,
> @@ -59,6 +61,14 @@ static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
>  	}
>  }
>  
> +static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
> +				     enum uvc_buffer_state state)
> +{
> +	spin_lock_irq(&queue->irqlock);
> +	__uvc_queue_return_buffers(queue, state);
> +	spin_unlock_irq(&queue->irqlock);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * videobuf2 queue operations
>   */
> @@ -171,9 +181,7 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret == 0)
>  		return 0;
>  
> -	spin_lock_irq(&queue->irqlock);
>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
> -	spin_unlock_irq(&queue->irqlock);
>  
>  	return ret;
>  }
> @@ -187,9 +195,7 @@ static void uvc_stop_streaming(struct vb2_queue *vq)
>  	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
>  		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
>  
> -	spin_lock_irq(&queue->irqlock);
>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> -	spin_unlock_irq(&queue->irqlock);
>  }
>  
>  static const struct vb2_ops uvc_queue_qops = {
> @@ -263,7 +269,7 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&queue->irqlock, flags);
> -	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> +	__uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
>  	/*
>  	 * This must be protected by the irqlock spinlock to avoid race
>  	 * conditions between uvc_buffer_queue and the disconnection event that
> 


