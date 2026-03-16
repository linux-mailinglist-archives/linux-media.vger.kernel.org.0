Return-Path: <linux-media+bounces-55894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN/iJJ3ut2mfXQEAu9opvQ
	(envelope-from <linux-media+bounces-55894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:50:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF2298F1E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2CDD30053F4
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BB6392836;
	Mon, 16 Mar 2026 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/0BChR/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCDF3921C8;
	Mon, 16 Mar 2026 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661791; cv=none; b=CgqiVmjh6OQyBlQIitAf1gjmaPWSc2bqe+NDZ47Hx0eRmJcpN+A9XLvFrE6X0M0LXyH0JMbcuS8d5Z5sJx5g4gwaoI/q/VCaZCEO9otXl2s/V7SeAOODoQRdEx35FwiZjAmx0zjvb0f25mE23cwPJZKZIKfLXfpTz3QgdoP9ong=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661791; c=relaxed/simple;
	bh=R7Ppsif3qZkrfr9wEYALypqQR1H4VBzTqxms7/ogbMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BI9HY2LSwp7CjDimiBw3K0DDkMlpfS5LhaBiDQ3p7ZrsvAhBTg8hsakeMNByyojtuaAnCG1Bg88GprYx3ml22rR8FaKJbFSNuCKPwJT7xZ5tDFFJhxBmPCREErBLed/XfWKnvpvDqfNIwsHoxeUV0yVeeuj2e2KAiiZFdFukQkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/0BChR/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4812AC19421;
	Mon, 16 Mar 2026 11:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773661790;
	bh=R7Ppsif3qZkrfr9wEYALypqQR1H4VBzTqxms7/ogbMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e/0BChR/vkj1JEV29hL4ah4sjnPSTeKkd8+xeph7XYsrELXs4ucVxi3N6nLQW54pW
	 bSvZtikMdlNMhY4bXx4MBoA1LUhc9FyVxxPYIRSnEa+qxcepFlOMlvA+6w0sflVB9L
	 mbaRisfO+YbszTNCNnftxUhQXEYx7KrLXagKW4QrkZEIkBfBxL/xh3w4+RsTwV1TKt
	 fWYXFl7qVVciJLyALPXVIWSAftjx/8phGOzRzjxiy44j9Wae3awsOopcE6plm4hw8/
	 50i0XJ9EX1PdaYWECKzhfnoazuOGQELJmNIG/C/HaQUoPGll+H3lwZ5kwXVSlg3hbp
	 LnxkJjpmbRFRg==
Message-ID: <656a9f49-e316-4ccd-afe7-1966719ab85b@kernel.org>
Date: Mon, 16 Mar 2026 12:49:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: uvcvideo: uvc_queue_to_stream(): Support meta
 queues
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>
References: <20260309-uvc-metadata-dmabuf-v1-0-fc8b87bd29c5@chromium.org>
 <20260309-uvc-metadata-dmabuf-v1-2-fc8b87bd29c5@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260309-uvc-metadata-dmabuf-v1-2-fc8b87bd29c5@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55894-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,chromium.org:email]
X-Rspamd-Queue-Id: 3EFF2298F1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 9-Mar-26 4:01 PM, Ricardo Ribalda wrote:
> The stream data structure has two queues: the metadata and the data
> queues, but uvc_queue_to_stream() only supports the data queue. If we
> pass the metadata queue the function will return an invalid pointer.
> 
> This patch add a parameter to the function to explicitly tell the
> function which queue are we using.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


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
>  }
>  
> 


