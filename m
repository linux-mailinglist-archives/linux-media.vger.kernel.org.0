Return-Path: <linux-media+bounces-56773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBFUEOy/wWlSWAQAu9opvQ
	(envelope-from <linux-media+bounces-56773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 23:34:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B15D62FE4A3
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 23:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B84BF3037664
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 22:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5502E38239C;
	Mon, 23 Mar 2026 22:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IDqiea21"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371F382296;
	Mon, 23 Mar 2026 22:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305246; cv=none; b=ItgKTs/ALYoKqWMWU0V4kJ6ugHgO8OSQuPeplYati5QadgFDRH7ICn8PuBujxIG8sOWjuftcfTtVzdmwjSXIsZuEE5FjPSf87ljD/fZ7W/aEIqPy9Qt/F14c/DUmSIW5EHXiitcz0JTPJVjhSroaJicTYHf+JmWsoHdw0u6Vrb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305246; c=relaxed/simple;
	bh=C8+DojnyNr+ycGRzoqpbZkgeCtaWzZHa+/sGp1UMkUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oywvsks1fcjc2pNyNSN6ObOSjil9qaTg2e75/JKO02XOFbdfSBzMOhHw68R2v0AF9mXyTNT94MzOuVrateblBLH1kudle28lZ1fosBcOp2KFY8t82gKTc6MRghbiazg+r6rBTtxr/wq29VeRWg7FpRNiomUD/zMeMMlrXoMGOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IDqiea21; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D42D378C;
	Mon, 23 Mar 2026 23:32:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774305167;
	bh=C8+DojnyNr+ycGRzoqpbZkgeCtaWzZHa+/sGp1UMkUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDqiea21UB8xpSMvvJ6j5ws7Ezg0tS1y+HEQRNX8cfSIx3t8RWbmz4x7qBa9avziy
	 D9uPm7waGzrAdlNQxQ3U5u4m6nZMocTRyAHtFh3Atnu86IuHyfWnNp0lhOUIAWWcO3
	 ViYWWXhqYwLmA+70YC3qo8ZBsqrZ6G2FyRvEyTUM=
Date: Tue, 24 Mar 2026 00:34:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add a stream backpointer in
 uvc_video_queue
Message-ID: <20260323223401.GB2329138@killaraus.ideasonboard.com>
References: <20260318192357.GD718539@killaraus.ideasonboard.com>
 <20260318202352.1374443-1-ribalda@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318202352.1374443-1-ribalda@chromium.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-56773-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: B15D62FE4A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Thank you for the patch.

On Wed, Mar 18, 2026 at 08:22:36PM +0000, Ricardo Ribalda wrote:
> It is less prone to errors if we add a backpointer to stream from
> struct uvc_video_queue.
> 
> Refactor the code.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Tested in real hardware with yavta:
> (console A) # yavta -c /dev/video1 
> (console B) # yavta -c /dev/video0
> It would be great if we add it as a follow-up patch to the already
> merged series.
> 
> Thanks!
> 
>  drivers/media/usb/uvc/uvc_driver.c |  2 +-
>  drivers/media/usb/uvc/uvc_isight.c |  3 +--
>  drivers/media/usb/uvc/uvc_queue.c  | 15 ++++++++-------
>  drivers/media/usb/uvc/uvcvideo.h   | 12 +++---------
>  4 files changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b0ca81d924b6..017b1f4ae3ab 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2033,7 +2033,7 @@ int uvc_register_video_device(struct uvc_device *dev,
>  	int ret;
>  
>  	/* Initialize the video buffers queue. */
> -	ret = uvc_queue_init(queue, type);
> +	ret = uvc_queue_init(stream, queue, type);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
> index ea9dc31dfbad..bb3e13c0d5a6 100644
> --- a/drivers/media/usb/uvc/uvc_isight.c
> +++ b/drivers/media/usb/uvc/uvc_isight.c
> @@ -41,8 +41,7 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
>  		0xde, 0xad, 0xfa, 0xce
>  	};
>  
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue,
> -						V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	struct uvc_streaming *stream = queue->stream;
>  	unsigned int maxlen, nbytes;
>  	u8 *mem;
>  	int is_header = 0;
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 89206f761006..3c002c8f442f 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -78,7 +78,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  			   unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
> +	struct uvc_streaming *stream = queue->stream;
>  	unsigned int size;
>  
>  	switch (vq->type) {
> @@ -112,7 +112,7 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>  
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>  	    vb2_get_plane_payload(vb, 0) > vb2_plane_size(vb, 0)) {
> -		uvc_dbg(uvc_queue_to_stream(queue, vb->type)->dev, CAPTURE,
> +		uvc_dbg(queue->stream->dev, CAPTURE,
>  			"[E] Bytes used out of bounds\n");
>  		return -EINVAL;
>  	}
> @@ -159,17 +159,16 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vb->type);
>  	struct uvc_buffer *buf = uvc_vbuf_to_buffer(vbuf);
>  
>  	if (vb->state == VB2_BUF_STATE_DONE)
> -		uvc_video_clock_update(stream, vbuf, buf);
> +		uvc_video_clock_update(queue->stream, vbuf, buf);
>  }
>  
>  static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
> +	struct uvc_streaming *stream = queue->stream;
>  	int ret;
>  
>  	lockdep_assert_irqs_enabled();
> @@ -196,7 +195,7 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>  static void uvc_stop_streaming_video(struct vb2_queue *vq)
>  {
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> -	struct uvc_streaming *stream = uvc_queue_to_stream(queue, vq->type);
> +	struct uvc_streaming *stream = queue->stream;
>  
>  	lockdep_assert_irqs_enabled();
>  
> @@ -237,10 +236,12 @@ static const struct vb2_ops uvc_meta_queue_qops = {
>  	.stop_streaming = uvc_stop_streaming_meta,
>  };
>  
> -int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> +int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
> +		   enum v4l2_buf_type type)
>  {
>  	int ret;
>  
> +	queue->stream = stream;
>  	queue->queue.type = type;
>  	queue->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>  	queue->queue.drv_priv = queue;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5ba698d2a23d..0a0c01b2420f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -331,6 +331,7 @@ struct uvc_buffer {
>  #define UVC_QUEUE_DISCONNECTED		(1 << 0)
>  
>  struct uvc_video_queue {
> +	struct uvc_streaming *stream;
>  	struct video_device vdev;
>  	struct vb2_queue queue;
>  	struct mutex mutex;			/*
> @@ -692,7 +693,8 @@ do {									\
>  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
>  
>  /* Video buffers queue management. */
> -int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> +int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
> +		   enum v4l2_buf_type type);
>  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
>  struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
>  					 struct uvc_buffer *buf);
> @@ -703,14 +705,6 @@ static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
>  	return vb2_is_streaming(&queue->queue);
>  }
>  
> -static inline struct uvc_streaming *
> -uvc_queue_to_stream(struct uvc_video_queue *queue, unsigned int type)
> -{
> -	if (type == V4L2_BUF_TYPE_META_CAPTURE)
> -		return container_of(queue, struct uvc_streaming, meta.queue);
> -	return container_of(queue, struct uvc_streaming, queue);
> -}
> -
>  /* V4L2 interface */
>  extern const struct v4l2_ioctl_ops uvc_ioctl_ops;
>  extern const struct v4l2_file_operations uvc_fops;

-- 
Regards,

Laurent Pinchart

