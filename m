Return-Path: <linux-media+bounces-36321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F631AEE25B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DAD6189CC0B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1541828EA5A;
	Mon, 30 Jun 2025 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mK0mUS1T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DDE28C014;
	Mon, 30 Jun 2025 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297091; cv=none; b=ahh5TSL1HvJH8pZPH8EUSnC1jULgB5z+FPfUqWH5eJ5ZLcQyJucW5cnOrT31SjnLg0pkwNIFXdfN6A85M1UinA8aV5hoYrzE/QD/pVCKkf8N6wQaTPjTCVJ8JD1kWSF6/zVd87XI30yt62T9yzmAysf7aK5jFHBpGbGXC45YvRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297091; c=relaxed/simple;
	bh=MkzWJgPQR17Th0knT93bxXAJb8awnh4Bk4PIKq3v7QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0ueGkqqPs8HcEyWDGCroO17vE/3TwLLIxLbUU/Bca1oH08jnnMEQlUy2gKcRU+plAE2X3LIiS1BXe/w7iKz6755ISOgYXttC755inpkedUhSEpGvjCYRbkOTw4MLv0lPZz8pK8PbqOgnR4Z8vUcwHXxMey3XlDZuDwJz9FpIbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mK0mUS1T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 07D05928;
	Mon, 30 Jun 2025 17:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751297066;
	bh=MkzWJgPQR17Th0knT93bxXAJb8awnh4Bk4PIKq3v7QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mK0mUS1TssIy7ANlUN4+TYrBxcZohSiFDoXe0dwdzMgAW8MhKgKNo7rvNnCKCtGC4
	 12XA+QL0rQC9sa/vzMl1cevg3+uxFUjvbvTmYbIOKsOnbpNZ6hkf9/85Qn+Q7VLhcg
	 /T+vWDPe03zVXIgsUZrW9hur5/n2qiiA3DAPuG9U=
Date: Mon, 30 Jun 2025 18:24:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: uvcvideo: Split uvc_stop_streaming()
Message-ID: <20250630152422.GF24861@pendragon.ideasonboard.com>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-3-250286570ee7@chromium.org>
 <20250630141707.GG20333@pendragon.ideasonboard.com>
 <d541ee58-2fa5-4c1e-b744-2e080065fe39@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d541ee58-2fa5-4c1e-b744-2e080065fe39@kernel.org>

On Mon, Jun 30, 2025 at 05:12:29PM +0200, Hans de Goede wrote:
> On 30-Jun-25 4:17 PM, Laurent Pinchart wrote:
> > On Mon, Jun 16, 2025 at 03:24:40PM +0000, Ricardo Ribalda wrote:
> >> uvc_stop_streaming() is used for meta and video nodes. Split the function
> >> in two to avoid confusion.
> >>
> >> Use this opportunity to rename uvc_start_streaming() to
> >> uvc_start_streaming_video(), as it is only called by the video nodes.
> >>
> >> Reviewed-by: Hans de Goede <hansg@kernel.org>
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
> >>  1 file changed, 15 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> >> index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
> >> --- a/drivers/media/usb/uvc/uvc_queue.c
> >> +++ b/drivers/media/usb/uvc/uvc_queue.c
> >> @@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
> >>  		uvc_video_clock_update(stream, vbuf, buf);
> >>  }
> >>  
> >> -static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >> +static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
> >>  {
> >>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >>  	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> >> @@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >>  	return ret;
> >>  }
> >>  
> >> -static void uvc_stop_streaming(struct vb2_queue *vq)
> >> +static void uvc_stop_streaming_video(struct vb2_queue *vq)
> >>  {
> >>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >>  
> >>  	lockdep_assert_irqs_enabled();
> >>  
> >> -	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
> >> -		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> >> +	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> >> +
> >> +	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> >> +}
> >> +
> >> +static void uvc_stop_streaming_meta(struct vb2_queue *vq)
> >> +{
> >> +	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >> +
> >> +	lockdep_assert_irqs_enabled();
> >>  
> >>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> > 
> > I haven't checked where it was introduced, but I think you have a race
> > here. uvc_queue_return_buffers() will return all buffers currently
> > sitting in the queue->irqqueue. This can race with a bunch of places in
> > uvc_video.c that call uvc_queue_get_current_buffer() or
> > uvc_queue_get_next_buffer(), as those functions return a buffer without
> > removing it from the list.
> 
> This change just splits uvc_stop_streaming() into 2 separate
> functions for uvc_queue_qops + uvc_meta_queue_qops to remove
> the weird looking "if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)"
> check done in the shared uvc_stop_streaming().
> 
> This patch does not make any functional changes. So if such
> a race exists then that is a pre-existing problem and not
> caused by this patch.

Yes, that's why I said I'm not sure where it was introduced. I only
noticed the issue here, it comes from before this patch.

> >>  }
> >> @@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
> >>  	.buf_prepare = uvc_buffer_prepare,
> >>  	.buf_queue = uvc_buffer_queue,
> >>  	.buf_finish = uvc_buffer_finish,
> >> -	.start_streaming = uvc_start_streaming,
> >> -	.stop_streaming = uvc_stop_streaming,
> >> +	.start_streaming = uvc_start_streaming_video,
> >> +	.stop_streaming = uvc_stop_streaming_video,
> >>  };
> >>  
> >>  static const struct vb2_ops uvc_meta_queue_qops = {
> >>  	.queue_setup = uvc_queue_setup,
> >>  	.buf_prepare = uvc_buffer_prepare,
> >>  	.buf_queue = uvc_buffer_queue,
> >> -	.stop_streaming = uvc_stop_streaming,
> >> +	.stop_streaming = uvc_stop_streaming_meta,
> >>  };
> >>  
> >>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)

-- 
Regards,

Laurent Pinchart

