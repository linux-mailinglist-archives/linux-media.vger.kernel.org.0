Return-Path: <linux-media+bounces-33947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A91ACB94E
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 18:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0453E3A8513
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE87A224245;
	Mon,  2 Jun 2025 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="QKURl/Ta"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9FB65C;
	Mon,  2 Jun 2025 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880467; cv=none; b=VyqaR6PpfNgdrwDkXVoA1Shm2fAya/AoQvqtnGyzr57LZyw56MvqfC8fJ0lXvwUMpHQWDs1KJqGfjJsfLyjMdDivAqFwp0h2Rgj3QTU9pALdZjGTCqIlES85GOp5mEkNhisi6X0db638mgiwzwlv3jZ30xd3PWF7LTg2Go/KpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880467; c=relaxed/simple;
	bh=ZmSQAeEcia1P1hE1Hv1cJk2RsTzQ3+LBFZR+hWyxp+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG9u63QlPLeC4wxsWI32xXrkYW4fsC0gpXLcS2NCQVavidXOuR6AWW3aPWS3s5zp0wAr6VuGVKAzvDOfAt9gsA72AIz56IOvZyGXuefys8TBetJGITwMt7yMW5b/rfcMl/Xztw7YW8YLJ6xG8h/lAS2niW6Bweneu0SBQ3npjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=QKURl/Ta; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4b9zJX2sqszbPb;
	Mon,  2 Jun 2025 16:07:40 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4b9zJW4YFFz1f;
	Mon,  2 Jun 2025 16:07:39 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=QKURl/Ta;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1748880460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8H2vaZmdSy7jGJtOFo/UFmRS93MUsJw9UCys+C8JsuY=;
	b=QKURl/TarqCxUPR3EyRPSQaxjC/9rwSPWg9b/Eq+gwgAQpLkmEGEcXAuRYigvbrGJxUuM4
	xaVqrjMWdnE0PBNAJZkBxXmy7EbUbLiONu/4TVjJH7CCkZdWBIoVHxjC0hqcvP4mwW9b+m
	3nOL7RwNFPx9St7NBzhyTnJWei9ISd2OBY7BiORtckbQzjNcRfUQs4sgOuoxZ+ajcSe3bX
	Vvaj9wXLEWJ9+0T3+3yS28AmJtpORy+PmrEGUZezV7UjoS6cahjeoekX2EyICGEvtKWdcT
	It95P3FyITf9YH2gv85PM9hwhWph9FtWyoEoSGF6odhLrJoq9r0oCwsqULi/Kw==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=683dcc4c a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=ySpt8wTi4zIB8Ow2osgA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfJJohtz3fsSXUi8IS+4UC4rxuNu6hIlBBPOH7R551vnL/gbInQePRLPazdZVh5bUdb83+nbJUP+Wo1Pl5XNrOyf0QmPavVrzya0SAjs/MT7QL1e27K77 Jfxo687Wivo/p9wqtu+FpvuBQQ1XL5MqrXbN7fKoNJld8q9vG4mg7aB17lYsrk+wGgwskaHnP2SexGwVVh9fsmPDQo/rQmK/rVFaa+M0/umrpfvImchQRPrW cazrJqf6jmnNN8fK1sKXvSaTYK56z/yV+BtJKm1NUy0T5LZZApepk/4TZ7OY4QT4SyfRzD7yzBqe3+gylAItD9fv0QdE7Rk0c8Yp/84dT8FNp7AykTW0TG2K Rgci+Eye2c4pTtcLqltKpN8X3tFmkw==
Message-ID: <6851f402-d987-4cfb-a18e-193d3a6fe3cb@jjverkuil.nl>
Date: Mon, 2 Jun 2025 18:07:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Remove stream->is_streaming field
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
 <20250602-uvc-fop-v2-3-508a293eae81@chromium.org>
 <dba66347-7b6c-49b5-8d31-166845efd1a0@jjverkuil.nl>
 <CANiDSCttXAu0bJHG7L=Y4Y0LqfRQa=Y-wC8PKr1Pv7Hwpq6Txg@mail.gmail.com>
 <663123d4-9ac4-4c8d-bc88-d4e197786199@jjverkuil.nl>
 <20250602140235.GE23515@pendragon.ideasonboard.com>
 <CANiDSCtyyJ9fHko5r2eFK06V7Mhrti1zTBfQ2h_GmNF5EDcU+w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <CANiDSCtyyJ9fHko5r2eFK06V7Mhrti1zTBfQ2h_GmNF5EDcU+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 02/06/2025 16:38, Ricardo Ribalda wrote:
> Hi Laurent, Hi Hans
>>> If this isn't fixed, then at least add a comment explaining why you test for
>>> != V4L2_BUF_TYPE_META_CAPTURE before calling uvc_pm_put. It's not obvious.
>>
>> Agreed.
> 
> Maybe this is better than a comment?

Yes, that's better.

Regards,

	Hans

> 
> diff --git a/drivers/media/usb/uvc/uvc_queue.c
> b/drivers/media/usb/uvc/uvc_queue.c
> index 72c5494dee9f..7f9d731df32c 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -39,8 +39,6 @@ static inline struct uvc_buffer
> *uvc_vbuf_to_buffer(struct vb2_v4l2_buffer *buf)
> 
>  /*
>   * Return all queued buffers to videobuf2 in the requested state.
> - *
> - * This function must be called with the queue spinlock held.
>   */
>  static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
>                                enum uvc_buffer_state state)
> @@ -49,6 +47,8 @@ static void uvc_queue_return_buffers(struct
> uvc_video_queue *queue,
>                                         ? VB2_BUF_STATE_ERROR
>                                         : VB2_BUF_STATE_QUEUED;
> 
> +       spin_lock_irq(&queue->irqlock);
> +
>         while (!list_empty(&queue->irqqueue)) {
>                 struct uvc_buffer *buf = list_first_entry(&queue->irqqueue,
>                                                           struct uvc_buffer,
> @@ -57,6 +57,8 @@ static void uvc_queue_return_buffers(struct
> uvc_video_queue *queue,
>                 buf->state = state;
>                 vb2_buffer_done(&buf->buf.vb2_buf, vb2_state);
>         }
> +
> +       spin_unlock_irq(&queue->irqlock);
>  }
> 
>  /* -----------------------------------------------------------------------------
> @@ -157,7 +159,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
>                 uvc_video_clock_update(stream, vbuf, buf);
>  }
> 
> -static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> +static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>  {
>         struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>         struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> @@ -171,25 +173,29 @@ static int uvc_start_streaming(struct vb2_queue
> *vq, unsigned int count)
>         if (ret == 0)
>                 return 0;
> 
> -       spin_lock_irq(&queue->irqlock);
>         uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
> -       spin_unlock_irq(&queue->irqlock);
> 
>         return ret;
>  }
> 
> -static void uvc_stop_streaming(struct vb2_queue *vq)
> +static void uvc_stop_streaming_meta(struct vb2_queue *vq)
>  {
>         struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> 
>         lockdep_assert_irqs_enabled();
> 
> -       if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
> -               uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> +       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> +}
> +
> +static void uvc_stop_streaming_video(struct vb2_queue *vq)
> +{
> +       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> +
> +       lockdep_assert_irqs_enabled();
> +
> +       uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> 
> -       spin_lock_irq(&queue->irqlock);
>         uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> -       spin_unlock_irq(&queue->irqlock);
>  }
> 
>  static const struct vb2_ops uvc_queue_qops = {
> @@ -197,15 +203,15 @@ static const struct vb2_ops uvc_queue_qops = {
>         .buf_prepare = uvc_buffer_prepare,
>         .buf_queue = uvc_buffer_queue,
>         .buf_finish = uvc_buffer_finish,
> -       .start_streaming = uvc_start_streaming,
> -       .stop_streaming = uvc_stop_streaming,
> +       .start_streaming = uvc_start_streaming_video,
> +       .stop_streaming = uvc_stop_streaming_video,
>  };
> 
>  static const struct vb2_ops uvc_meta_queue_qops = {
>         .queue_setup = uvc_queue_setup,
>         .buf_prepare = uvc_buffer_prepare,
>         .buf_queue = uvc_buffer_queue,
> -       .stop_streaming = uvc_stop_streaming,
> +       .stop_streaming = uvc_stop_streaming_meta,
>  };
> 
>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> 
> 
> 


