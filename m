Return-Path: <linux-media+bounces-34929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7B0ADB247
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4869B188B65B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37B12877C0;
	Mon, 16 Jun 2025 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPhak58S"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CDB2BF00A;
	Mon, 16 Jun 2025 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081178; cv=none; b=aAUDlgG/AeHiInWUlVzrTiEfVy5w8Tvwcswgp+lBLzEqF3YdFoVMbh9r1dqa0tsC+xCw/kACli+CrvRzZOnNLca55H43SPM90pnzkizqU1dQYsIObmXJRcj2oMF4iChk9WN5ki+yGjEcj4yvbNGmSzXytEJKmBa1L3EpOehCKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081178; c=relaxed/simple;
	bh=QChRHTU/30PQQdwPpB0Y5bMUBvR5fCOVd6P2tx7W2Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSbqUZuQwBGtI/aOKbrAWOZQzpicZiObVSvTQhr2kY2AyxRGevL23lmxddBL081Ipy3umKFi7OMWgVvL6vj+YjyWqzJWLjEiYo5SAQxMm9kWVB2EJB+pP4jGHyHmkrFtjVbN9vgQFOC8Jfncy3btzzOZezVs3C9QpoM4SqPogG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPhak58S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E541C4CEEA;
	Mon, 16 Jun 2025 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750081177;
	bh=QChRHTU/30PQQdwPpB0Y5bMUBvR5fCOVd6P2tx7W2Bk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DPhak58SfBy+BJ/+F7Bo/tmnEg3tGs/6HlSKTVoMq1AaVYyiF6y1H2/CltKTVo4e5
	 F/xpI7PpnQ4eOtiDNpKT/v4VGt/FHb82bvmL2USQvvaOgOF4tSoM6z/MSQjn305brv
	 j94nP2FwSSC0Sxi1O6LPpdl+PwwjOklaXg1IaSQN+eMc5jVIJouXc5bUyiXiEvPDFB
	 nMWRWvn3Czp/uutQ+xKJ0ZPNE90Xm3kfqC20CR7P1faHNhitS36YDw/UB18UyMgtzd
	 AqBYNeDEwegzcf2Jadgf0xMRHh68XLNqWQT0mQZ8tVB9VxK7NEc8OSfxl45VVCQBiy
	 psPdGl12QhC/Q==
Message-ID: <ec83739d-26aa-4b83-a548-e3905097fe10@kernel.org>
Date: Mon, 16 Jun 2025 15:39:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: uvcvideo: Split uvc_stop_streaming()
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602-uvc-fop-v3-0-a99e18f65640@chromium.org>
 <20250602-uvc-fop-v3-4-a99e18f65640@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250602-uvc-fop-v3-4-a99e18f65640@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 2-Jun-25 18:06, Ricardo Ribalda wrote:
> uvc_stop_streaming() is used for meta and video nodes. Split the function
> in two to avoid confusion.
> 
> Use this opportunity to rename uvc_start_streaming() to
> uvc_start_streaming_video(), as it is only called by the video nodes.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


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
> 


