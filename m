Return-Path: <linux-media+bounces-66061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id afeoHoSVQ2rNcgoAu9opvQ
	(envelope-from <linux-media+bounces-66061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:08:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3C6E2A1F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:08:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PnHa8UwN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66061-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66061-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCFED30A1EEF
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0B63E2ACC;
	Tue, 30 Jun 2026 09:46:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC83E5A24;
	Tue, 30 Jun 2026 09:46:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812817; cv=none; b=u1yg1lh2yXjABlzkLD18BsazQq58yulccwSQA0fqFeUGhU0NsY6dWaJ4h5IJR1IJ+3nqFurrN1VinKm7tvMJUmmWuWaXFrX3SLgovyh5qKguV0waSXVIV99zMEZgGDIrvPVnYQpmry6NKBq8vVgnXVT3F2+glG/jwNXI6N5RZqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812817; c=relaxed/simple;
	bh=GuQw9MIS/pH3fVPA6CarIQglbTE1BhNLAOJ9yeXqKA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnLjwn+xiBCbtSgIWJrRsXwDqFLt2VAKsmPhU2hGDPk+aTinSRRT4aG58Jl8388TQe+6vgoDlqY4q8QeeaDXbZENAwMl/+Avl1qYzk6cC3qE5LXhv5Sc+IiQ2KJL1qZdMQljp4WUFnuxy0k0+Ee2/iSdCpTjkKtmoU6bOVT1iJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnHa8UwN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7661C1F000E9;
	Tue, 30 Jun 2026 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812815;
	bh=uY/mD87Fvq6E/NoNR+PQqQ38lk4WiPdm6num7PEMI9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PnHa8UwNnOjknGIYsrdstzWHrpp6DN1rr0a/TcNQ0Q/1FqtaEW4YZEJNejMWVVjV9
	 413+jtFHvk5ajgSc6oJLSgWHyemDgAEP4CTwZ73kYszLF4tW7DEcem212ooGCo2yU7
	 B0uc5wixnMsIPUYZLuOUrQWPAPIyJiZXF+rZ03c0HyTpZqKjL6iJ8mk494Pgekirnp
	 zLEJ1gM3ILLKvxfVAJhSqyYSQn0I8K6RXjznSJclb7HyTT7eQCJrxxvmFqc4QflKEd
	 k7M6D7tuTUwkN97kRi4fnBgIKH9WSLtNGJqJPq2TbfWHcyTR1g+mt95FqXLB5pGRVA
	 wfgI+YaQ6U6Tw==
Message-ID: <a0e4d412-f0bf-4415-9e4b-2c6347bf8c69@kernel.org>
Date: Tue, 30 Jun 2026 11:46:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Fix race condition for meta
 buffer list
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
 <20260629-uvc-racemeta-v2-1-10e91d2afba0@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260629-uvc-racemeta-v2-1-10e91d2afba0@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66061-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:guennadi.liakhovetski@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78D3C6E2A1F

Hi Ricardo,

On 29-Jun-26 19:31, Ricardo Ribalda wrote:
> queue->irqueue contains a list of the buffers owned by the driver. The
> list is protected by queue->irqlock. uvc_queue_get_current_buffer()
> returns a pointer to the current buffer in that list, but does not
> remove the buffer from it. This can lead to race conditions.
> 
> Inspecting the code, it seems that the candidate for such race is
> uvc_queue_return_buffers(). For the capture queue, that function is
> called with the device streamoff, so no race can occur. On the other
> hand, the metadata queue, could trigger a race condition, because
> stop_streaming can be called with the device in any streaming state.
> 
> We can solve this issue introducing a flag, stream->meta.in_flight,
> protected with a spinlock. When there is a buffer in flight that can
> write into metadata the flag is raised, notifying the stop streaming
> that it needs to wait.
> 
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
> Cc: stable@vger.kernel.org
> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

First of all thank you for looking into fixing this.

I'm sorry, but this feels more like a band-aid then a proper fix.

How about adding a started bool to struct uvc_streaming which gets
set to 1 by uvc_video_start_streaming() and 0 by uvc_video_stop_streaming().

And then call uvc_video_stop_streaming() from either 
uvc_stop_streaming_video() or uvc_stop_streaming_meta()
depending on which one gets called first ?

With a mutex protecting the started bool and being held
over calling uvc_video_stop_streaming() ?

So stop the actual hw streaming when either of the
2 possible /dev/video0 nodes gets its vb2_ops.stop_streaming
callback called?

And to this before draining the buffer queue.

That seems cleaner then this approach?

Regards,

Hans

p.s.

1. It is tempting to also apply the same approach to
vb2_ops.start_streaming, but allowing the meta queue to be
the one to start streaming will likely cause issues. E.g.
the streaming code assumes having a meta-queue active is
optional, but not the other way around.

TL;DR: vb2_ops.start_streaming should stay as is.

2. While looking into this I noticed that struct uvc_streaming
already has an active member, but unless I'm missing something
that ever only gets initialized to 0. So I think that can be
dropped. (If you re-use this please change it to a bool, no
need to have it atomic while protected by a mutex).



> ---
>  drivers/media/usb/uvc/uvc_queue.c | 14 ++++++++++++++
>  drivers/media/usb/uvc/uvc_video.c | 30 +++++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvcvideo.h  |  2 ++
>  3 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 3c002c8f442f..af9dbfcf6f53 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -209,10 +209,24 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
>  static void uvc_stop_streaming_meta(struct vb2_queue *vq)
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> +	struct uvc_streaming *stream = queue->stream;
>  
>  	lockdep_assert_irqs_enabled();
>  
> +	spin_lock_irq(&stream->meta.irqlock);
> +	while (stream->meta.in_flight) {
> +		spin_unlock_irq(&stream->meta.irqlock);
> +		schedule();
> +		spin_lock_irq(&stream->meta.irqlock);
> +	}
> +	stream->meta.in_flight = true;
> +	spin_unlock_irq(&stream->meta.irqlock);
> +
>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> +
> +	scoped_guard(spinlock_irq, &stream->meta.irqlock) {
> +		stream->meta.in_flight = false;
> +	}
>  }
>  
>  static const struct vb2_ops uvc_queue_qops = {
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a4399f..f6b55b3a3308 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1732,6 +1732,26 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
>  	urb->transfer_buffer_length = stream->urb_size - len;
>  }
>  
> +static struct uvc_buffer *
> +uvc_video_get_current_meta_buffer(struct uvc_streaming *stream)
> +{
> +	struct uvc_video_queue *queue = &stream->meta.queue;
> +	struct uvc_buffer *buf;
> +
> +	buf = uvc_queue_get_current_buffer(queue);
> +	if (!buf)
> +		return NULL;
> +
> +	guard(spinlock_irqsave)(&stream->meta.irqlock);
> +
> +	if (stream->meta.in_flight)
> +		return NULL;
> +
> +	stream->meta.in_flight = true;
> +
> +	return buf;
> +}
> +
>  static void uvc_video_complete(struct urb *urb)
>  {
>  	struct uvc_urb *uvc_urb = urb->context;
> @@ -1767,7 +1787,7 @@ static void uvc_video_complete(struct urb *urb)
>  	buf = uvc_queue_get_current_buffer(queue);
>  
>  	if (vb2_qmeta)
> -		buf_meta = uvc_queue_get_current_buffer(qmeta);
> +		buf_meta = uvc_video_get_current_meta_buffer(stream);
>  
>  	/* Re-initialise the URB async work. */
>  	uvc_urb->async_operations = 0;
> @@ -1778,6 +1798,12 @@ static void uvc_video_complete(struct urb *urb)
>  	 */
>  	stream->decode(uvc_urb, buf, buf_meta);
>  
> +	if (buf_meta) {
> +		scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
> +			stream->meta.in_flight = false;
> +		}
> +	}
> +
>  	/* If no async work is needed, resubmit the URB immediately. */
>  	if (!uvc_urb->async_operations) {
>  		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> @@ -2330,6 +2356,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>  	for_each_uvc_urb(uvc_urb, stream)
>  		INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
>  
> +	spin_lock_init(&stream->meta.irqlock);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b6bcee4a222f..6f1a3381d392 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -484,6 +484,8 @@ struct uvc_streaming {
>  		struct uvc_video_queue queue;
>  		u32 format;
>  		u32 buffersize;
> +		bool in_flight;
> +		spinlock_t irqlock; /* Protects in_flight. */
>  	} meta;
>  
>  	/* Context data used by the bulk completion handler. */
> 


