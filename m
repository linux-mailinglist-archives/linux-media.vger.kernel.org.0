Return-Path: <linux-media+bounces-56231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMxwH6L6umlwdwIAu9opvQ
	(envelope-from <linux-media+bounces-56231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:18:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F12C1EDB
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64829301DB97
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9F337B01C;
	Wed, 18 Mar 2026 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="asw99RKV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4223D2A3;
	Wed, 18 Mar 2026 19:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773861530; cv=none; b=i+W5kxPNkl8uOs2jwudy/vqF/VB0sStKA50QvnlRWI8AlAhwQiW9G49j5q1D/v8CDtydZgrPppE8+jl7Vo9s0AucabFXXKYh0FbmiJACTJZsKHCprVhFmI6GDFjoo+HV0V721g9KSlMDjGJFKAClF/18tT/JQjDmhLtKKH4o/EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773861530; c=relaxed/simple;
	bh=SOOFrjD3xoUYnSVH6qUa1yX32O7vt34If8k14rrOEEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftvudMHO0KzfXG2b5i4m07JKr/d36/pUZHv0B8Ey0+LXvKxrhT5mG5snC6VEOOnFYrV5EVRH528mglJUU28XVDD8xEib5CNJpNHSZHIrbgFFhOwfzFrZTN1Z4YZNY/Md/ZqXgBLjWu6QsDrWhGubdkirvZ8iBGjr07ZnKXNBfOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=asw99RKV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9D602308;
	Wed, 18 Mar 2026 20:17:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773861453;
	bh=SOOFrjD3xoUYnSVH6qUa1yX32O7vt34If8k14rrOEEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asw99RKVgEy95IOzJZUNklkrVNbdKnSHUaexBwjAiS11OHTBYbDhxBarLBHQyaTbJ
	 67jffoZtrlw7MdWFl/5oADaDaBoRtpO1owFf1A9/aVSgZHGLrgl9lfpbhHdXQdqTIL
	 8jqIFXfZSNzUJmJy331/uCypAe1mMjkT7NCRK7wQ=
Date: Wed, 18 Mar 2026 21:18:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: uvc_queue_to_stream(): Support meta
 queues
Message-ID: <20260318191845.GB718539@killaraus.ideasonboard.com>
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
 <20260309-uvc-metadata-dmabuf-v1-2-fc8b87bd29c5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-uvc-metadata-dmabuf-v1-2-fc8b87bd29c5@chromium.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-56231-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1F9F12C1EDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 09, 2026 at 03:01:55PM +0000, Ricardo Ribalda wrote:
> The stream data structure has two queues: the metadata and the data
> queues, but uvc_queue_to_stream() only supports the data queue. If we
> pass the metadata queue the function will return an invalid pointer.
> 
> This patch add a parameter to the function to explicitly tell the
> function which queue are we using.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_isight.c |  3 ++-
>  drivers/media/usb/uvc/uvc_queue.c  | 13 ++++++-------
>  drivers/media/usb/uvc/uvcvideo.h   |  4 +++-
>  3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
> index 43cda5e760a3..ea9dc31dfbad 100644
> --- a/drivers/media/usb/uvc/uvc_isight.c
> +++ b/drivers/media/usb/uvc/uvc_isight.c
> @@ -41,7 +41,8 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
>  		0xde, 0xad, 0xfa, 0xce
>  	};
>  
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> +	struct uvc_streaming *stream = uvc_queue_to_stream(queue,
> +						V4L2_BUF_TYPE_VIDEO_CAPTURE);
>  	unsigned int maxlen, nbytes;
>  	u8 *mem;
>  	int is_header = 0;
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 0eddd4f872ca..68ed2883edb2 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -78,7 +78,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  			   unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> -	struct uvc_streaming *stream;
> +	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
>  	unsigned int size;
>  
>  	switch (vq->type) {
> @@ -87,7 +87,6 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  		break;
>  
>  	default:
> -		stream = uvc_queue_to_stream(queue);
>  		size = stream->ctrl.dwMaxVideoFrameSize;
>  		break;
>  	}
> @@ -113,7 +112,7 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>  
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>  	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
> -		uvc_dbg(uvc_queue_to_stream(queue)->dev, CAPTURE,
> +		uvc_dbg(uvc_queue_to_stream(queue, vb->type)->dev, CAPTURE,
>  			"[E] Bytes used out of bounds\n");
>  		return -EINVAL;
>  	}
> @@ -160,7 +159,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> +	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vb->type);
>  	struct uvc_buffer *buf = uvc_vbuf_to_buffer(vbuf);
>  
>  	if (vb->state == VB2_BUF_STATE_DONE)
> @@ -170,7 +169,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
>  static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> +	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
>  	int ret;
>  
>  	lockdep_assert_irqs_enabled();
> @@ -197,11 +196,11 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>  static void uvc_stop_streaming_video(struct vb2_queue *vq)
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> +	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
>  
>  	lockdep_assert_irqs_enabled();
>  
> -	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> +	uvc_video_stop_streaming(stream);
>  
>  	uvc_pm_put(stream->dev);
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 8480d65ecb85..9b4849fda12f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -703,8 +703,10 @@ static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
>  }
>  
>  static inline struct uvc_streaming *
> -uvc_queue_to_stream(struct uvc_video_queue *queue)
> +uvc_queue_to_stream(struct uvc_video_queue *queue, unsigned int type)
>  {
> +	if (type == V4L2_BUF_TYPE_META_CAPTURE)
> +		return container_of(queue, struct uvc_streaming, meta.queue);
>  	return container_of(queue, struct uvc_streaming, queue);

This was implemented with container_of() as there has never been a need
to get the uvc_streaming for the metadata queue. As that's changing in
patch 3/3, I'd rather use a backpointer from uvc_video_queue to
uvc_streaming. That will be simpler for the callers, and less
error-prone.

>  }
>  
> 

-- 
Regards,

Laurent Pinchart

