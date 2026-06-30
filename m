Return-Path: <linux-media+bounces-66107-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fmm3EYDDQ2pLhAoAu9opvQ
	(envelope-from <linux-media+bounces-66107-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:24:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5586E4CEC
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:24:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ViR5tEe9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66107-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66107-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45640310FCCB
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B72A41C312;
	Tue, 30 Jun 2026 13:21:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC1410D38;
	Tue, 30 Jun 2026 13:21:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825671; cv=none; b=UVBOAqoC2dIrtZjQW0J0spERAvuX5GXqhp6zHH/QXg6nsz4F2ohtWIwvhDl2RDJTP8q+LOov9bYp7o3ixoYD4VztwHmjJ3T2c3unozNbGChJSsPRr07mMWQCkhz+SHAknD5F1k7x/WobsTJg4dy7aieU06r0654p+nP2N8hcU+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825671; c=relaxed/simple;
	bh=SNzP2DjFn4VgsiVDGK1FmH+yk6bNgbKDu9jbFZf0dIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A26DpBzo8HAYN9QYMuifzM5TrWFDGu1sx5bIIETLYOjqyot/yrj1xVRc4ivA0vwLmcjExeb2GJf7nhI3NPpY9xBjYR9w5P7nQfMJ+YO7uVdXnBlJkCA7/S6rauO+Ke+DywDIdXyFesxhW+mQc1m4lgAFzuhG71Woh5Ie5NJ1GmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViR5tEe9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D736A1F000E9;
	Tue, 30 Jun 2026 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825670;
	bh=ZiIJ8GV2JhBDL2sR36Ko1hUN+wUPw/2B1JzsbAesMnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ViR5tEe9pQowEE6SWjL7DcTOtwKvWBFg+rTSGaT8Hv39E8QcZB4hIcVhzq2UmVwWm
	 NPEQS6RdNFqVa3eLAb5i/TMz0U+KM7p1C4hZXP+68DTJbFNtmhV2Up4JZJRmnuOtsl
	 VYvG0Md4pLX6/d9s9edtblrMV9rCQQX0Gz53WMPXtmCIOPZ30q/43HzlC2EhRt6hge
	 QGbALK80d+Vdl1GXsxrWqf68Be7jMNMstX2fMCRzVmb4SaxX7473qihH2jqG5VplXF
	 /4LrpFtXeRwTWbqfh6rDUu7LISrRM6XYWznnIS0cxASBziAtYI1/C2s8hkzZPqiz5H
	 CLH1X5WisZ+/Q==
Message-ID: <5327bf8c-270e-4650-8f44-6026dce36457@kernel.org>
Date: Tue, 30 Jun 2026 15:21:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Fix race condition for meta
 buffer list
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
 <20260629-uvc-racemeta-v2-1-10e91d2afba0@chromium.org>
 <a0e4d412-f0bf-4415-9e4b-2c6347bf8c69@kernel.org>
 <CANiDSCtv_ZmTWUzbuxuEy0JmLmFs2Wqj31O3neGZ4ee=p065-g@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCtv_ZmTWUzbuxuEy0JmLmFs2Wqj31O3neGZ4ee=p065-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66107-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:guennadi.liakhovetski@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,vger.kernel.org:from_smtp,chromium.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quotefancy.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC5586E4CEC

Hi Ricardo,

On 30-Jun-26 12:17, Ricardo Ribalda wrote:
> Hi Hans,
> 
> Thanks for the prompt reply.
> 
> On Tue, 30 Jun 2026 at 11:47, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi Ricardo,
>>
>> On 29-Jun-26 19:31, Ricardo Ribalda wrote:
>>> queue->irqueue contains a list of the buffers owned by the driver. The
>>> list is protected by queue->irqlock. uvc_queue_get_current_buffer()
>>> returns a pointer to the current buffer in that list, but does not
>>> remove the buffer from it. This can lead to race conditions.
>>>
>>> Inspecting the code, it seems that the candidate for such race is
>>> uvc_queue_return_buffers(). For the capture queue, that function is
>>> called with the device streamoff, so no race can occur. On the other
>>> hand, the metadata queue, could trigger a race condition, because
>>> stop_streaming can be called with the device in any streaming state.
>>>
>>> We can solve this issue introducing a flag, stream->meta.in_flight,
>>> protected with a spinlock. When there is a buffer in flight that can
>>> write into metadata the flag is raised, notifying the stop streaming
>>> that it needs to wait.
>>>
>>> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
>>> Cc: stable@vger.kernel.org
>>> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>
>> First of all thank you for looking into fixing this.
>>
>> I'm sorry, but this feels more like a band-aid then a proper fix.
>>
>> How about adding a started bool to struct uvc_streaming which gets
>> set to 1 by uvc_video_start_streaming() and 0 by uvc_video_stop_streaming().
>>
>> And then call uvc_video_stop_streaming() from either
>> uvc_stop_streaming_video() or uvc_stop_streaming_meta()
>> depending on which one gets called first ?
>>
>> With a mutex protecting the started bool and being held
>> over calling uvc_video_stop_streaming() ?
>>
>> So stop the actual hw streaming when either of the
>> 2 possible /dev/video0 nodes gets its vb2_ops.stop_streaming
>> callback called?
>>
>> And to this before draining the buffer queue.
>>
>> That seems cleaner then this approach?
> 
> Assuming /dev/video0 is the video node and /dev/video1 is the meta device.
> 
> Currently, we support something like:
> 
> 1) yavta -c /dev/video0 &
> 2) yavta --capture=2 /dev/video1
> 3) yavta --capture=2 /dev/video1
> 4) kill %1
> 
> 
> If I understood correctly, your proposal would cause the camera to
> stop streaming when step 2 completes.

Yes. But this very much feels like a case of:

https://quotefancy.com/media/wallpaper/1600x900/5523002-Henny-Youngman-Quote-The-patient-says-Doctor-it-hurts-when-I-do.jpg

> I think this risks breaking use cases.

That would have to be some rather convoluted use-case.

IMHO the simplicity of fixing the race you're trying to fix is
worth the userspace regression risk (which I deem low).

Worst case we revert the fix and go back to the drawing board.

> As I see it, the issue is that the camera's live capture cycle is
> controlled solely by video0. We need some kind of synchronization
> mechanism with video1 if we do not want to change the behaviour and
> risk breaking apps.

IMHO for a device with multiple /dev/video# nodes it makes sense
to wait with actually starting streaming/DMA-engines until all
enabled queues are started and stop when the first queue is stopped.

The problem with uvcvideo is that we do not know if the metadata
queue is going to get used at all. In hindsight we should maybe
have had some way for userspace to explictly enable/disable metadata
support.

So we start as soon as the main video node is opened, still I think
that stopping as soon as one of the queues is stopped makes sense.

Laurent, do you have any input here?

Regards,

Hans




>> p.s.
>>
>> 1. It is tempting to also apply the same approach to
>> vb2_ops.start_streaming, but allowing the meta queue to be
>> the one to start streaming will likely cause issues. E.g.
>> the streaming code assumes having a meta-queue active is
>> optional, but not the other way around.
>>
>> TL;DR: vb2_ops.start_streaming should stay as is.
>>
>> 2. While looking into this I noticed that struct uvc_streaming
>> already has an active member, but unless I'm missing something
>> that ever only gets initialized to 0. So I think that can be
>> dropped. (If you re-use this please change it to a bool, no
>> need to have it atomic while protected by a mutex).
> 
> I will send a patch to fix this. Thanks for noticing :)
> 
>>
>>
>>
>>> ---
>>>  drivers/media/usb/uvc/uvc_queue.c | 14 ++++++++++++++
>>>  drivers/media/usb/uvc/uvc_video.c | 30 +++++++++++++++++++++++++++++-
>>>  drivers/media/usb/uvc/uvcvideo.h  |  2 ++
>>>  3 files changed, 45 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
>>> index 3c002c8f442f..af9dbfcf6f53 100644
>>> --- a/drivers/media/usb/uvc/uvc_queue.c
>>> +++ b/drivers/media/usb/uvc/uvc_queue.c
>>> @@ -209,10 +209,24 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
>>>  static void uvc_stop_streaming_meta(struct vb2_queue *vq)
>>>  {
>>>       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>>> +     struct uvc_streaming *stream = queue->stream;
>>>
>>>       lockdep_assert_irqs_enabled();
>>>
>>> +     spin_lock_irq(&stream->meta.irqlock);
>>> +     while (stream->meta.in_flight) {
>>> +             spin_unlock_irq(&stream->meta.irqlock);
>>> +             schedule();
>>> +             spin_lock_irq(&stream->meta.irqlock);
>>> +     }
>>> +     stream->meta.in_flight = true;
>>> +     spin_unlock_irq(&stream->meta.irqlock);
>>> +
>>>       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
>>> +
>>> +     scoped_guard(spinlock_irq, &stream->meta.irqlock) {
>>> +             stream->meta.in_flight = false;
>>> +     }
>>>  }
>>>
>>>  static const struct vb2_ops uvc_queue_qops = {
>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>>> index fc3536a4399f..f6b55b3a3308 100644
>>> --- a/drivers/media/usb/uvc/uvc_video.c
>>> +++ b/drivers/media/usb/uvc/uvc_video.c
>>> @@ -1732,6 +1732,26 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
>>>       urb->transfer_buffer_length = stream->urb_size - len;
>>>  }
>>>
>>> +static struct uvc_buffer *
>>> +uvc_video_get_current_meta_buffer(struct uvc_streaming *stream)
>>> +{
>>> +     struct uvc_video_queue *queue = &stream->meta.queue;
>>> +     struct uvc_buffer *buf;
>>> +
>>> +     buf = uvc_queue_get_current_buffer(queue);
>>> +     if (!buf)
>>> +             return NULL;
>>> +
>>> +     guard(spinlock_irqsave)(&stream->meta.irqlock);
>>> +
>>> +     if (stream->meta.in_flight)
>>> +             return NULL;
>>> +
>>> +     stream->meta.in_flight = true;
>>> +
>>> +     return buf;
>>> +}
>>> +
>>>  static void uvc_video_complete(struct urb *urb)
>>>  {
>>>       struct uvc_urb *uvc_urb = urb->context;
>>> @@ -1767,7 +1787,7 @@ static void uvc_video_complete(struct urb *urb)
>>>       buf = uvc_queue_get_current_buffer(queue);
>>>
>>>       if (vb2_qmeta)
>>> -             buf_meta = uvc_queue_get_current_buffer(qmeta);
>>> +             buf_meta = uvc_video_get_current_meta_buffer(stream);
>>>
>>>       /* Re-initialise the URB async work. */
>>>       uvc_urb->async_operations = 0;
>>> @@ -1778,6 +1798,12 @@ static void uvc_video_complete(struct urb *urb)
>>>        */
>>>       stream->decode(uvc_urb, buf, buf_meta);
>>>
>>> +     if (buf_meta) {
>>> +             scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
>>> +                     stream->meta.in_flight = false;
>>> +             }
>>> +     }
>>> +
>>>       /* If no async work is needed, resubmit the URB immediately. */
>>>       if (!uvc_urb->async_operations) {
>>>               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>>> @@ -2330,6 +2356,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>>>       for_each_uvc_urb(uvc_urb, stream)
>>>               INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
>>>
>>> +     spin_lock_init(&stream->meta.irqlock);
>>> +
>>>       return 0;
>>>  }
>>>
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index b6bcee4a222f..6f1a3381d392 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -484,6 +484,8 @@ struct uvc_streaming {
>>>               struct uvc_video_queue queue;
>>>               u32 format;
>>>               u32 buffersize;
>>> +             bool in_flight;
>>> +             spinlock_t irqlock; /* Protects in_flight. */
>>>       } meta;
>>>
>>>       /* Context data used by the bulk completion handler. */
>>>
>>
> 
> 


