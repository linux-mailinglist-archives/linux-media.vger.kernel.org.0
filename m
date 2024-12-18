Return-Path: <linux-media+bounces-23745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB79F70C6
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B509B188DD70
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B7E1FDE11;
	Wed, 18 Dec 2024 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WvpGykAy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D171FD782;
	Wed, 18 Dec 2024 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564428; cv=none; b=PKqb0XxpdoX8i4cAFB59n4u7K91SCKfdqrRtAG0ju7Xmi23lRjwVcul+yneU6l+PtcHyt4K1GR9zsZSrKnXtNhBaeX/ssMINjumkialL3Gkt8Wlx+HOLoklli1C9ex6nGi8MJ2JsU6jVrHOSNS/pqSM4+GdUkKCnAbLYjl6ubSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564428; c=relaxed/simple;
	bh=AtsspskQvufY0O2Q03UtWbHp+z/wmxDgSGs8gaZKEvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hShX9wtgT1jMy4tjeMh++C+FT2uW3+lRNgNqJfEIQ5J0bFwWo8d6sRUZPjSyCfJdyOoHjwsdIk1rncycQAXhnxQeCGyKvMNw9gWGZ0BPoxU2UZ8HEHnfWMGRlUHGDsvMU1SYXeUOMtoMioesFIbBAHCJd+38ebAYbE87Vu872w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WvpGykAy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A37C4163;
	Thu, 19 Dec 2024 00:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734564386;
	bh=AtsspskQvufY0O2Q03UtWbHp+z/wmxDgSGs8gaZKEvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvpGykAy8IyNfEEJchFnlliZKAGuKWumaOYHdt9b4HGExv7MYMJowVUhr8tO3JcPo
	 CERqhocTMi6VZ94M+yZsAksKF2EqyDyx1TFAnTShRUkp82iqOIKDPNRiDykWRLcfZY
	 8a5sF3/0dm+9iy4JtA+P5et4TL3iLiPnNU4jxd/4=
Date: Thu, 19 Dec 2024 01:27:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: uvcvideo: Allow changing noparam on the fly
Message-ID: <20241218232701.GC5518@pendragon.ideasonboard.com>
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
 <20241218-uvc-deprecate-v2-3-ab814139e983@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-uvc-deprecate-v2-3-ab814139e983@chromium.org>

On Wed, Dec 18, 2024 at 09:39:10PM +0000, Ricardo Ribalda wrote:
> Right now the parameter value is read during video_registration and
> cannot be changed afterwards, despite its permissions 0644, that makes
> the user believe that the value can be written.

Well, it can still be written, and will apply to new devices. There's
value in making it fully dynamic though.

> 
> The parameter only affects the beviour of uvc_queue_buffer_complete(),

s/beviour/behaviour/

> with only one check per buffer.
> 
> We can read the value directly from uvc_queue_buffer_complete() and
> therefore allowing changing it with sysfs on the fly.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  drivers/media/usb/uvc/uvc_queue.c  | 6 ++----
>  drivers/media/usb/uvc/uvcvideo.h   | 4 +---
>  3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 091145743872..10812a841587 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1995,7 +1995,7 @@ int uvc_register_video_device(struct uvc_device *dev,
>  	int ret;
>  
>  	/* Initialize the video buffers queue. */
> -	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
> +	ret = uvc_queue_init(queue, type);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index f8464f0aae1b..2ee142621042 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -208,8 +208,7 @@ static const struct vb2_ops uvc_meta_queue_qops = {
>  	.stop_streaming = uvc_stop_streaming,
>  };
>  
> -int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
> -		    int drop_corrupted)
> +int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>  {
>  	int ret;
>  
> @@ -239,7 +238,6 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
>  	mutex_init(&queue->mutex);
>  	spin_lock_init(&queue->irqlock);
>  	INIT_LIST_HEAD(&queue->irqqueue);
> -	queue->flags = drop_corrupted ? UVC_QUEUE_DROP_CORRUPTED : 0;
>  
>  	return 0;
>  }
> @@ -472,7 +470,7 @@ static void uvc_queue_buffer_complete(struct kref *ref)
>  	struct vb2_buffer *vb = &buf->buf.vb2_buf;
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
>  
> -	if ((queue->flags & UVC_QUEUE_DROP_CORRUPTED) && buf->error) {
> +	if (buf->error && !uvc_no_drop_param) {

As this is the only location where the uvc_no_drop_param variable is
read, I don't expect any race condition.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		uvc_queue_buffer_requeue(queue, buf);
>  		return;
>  	}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 07f9921d83f2..ebbd8afcf136 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -316,7 +316,6 @@ struct uvc_buffer {
>  };
>  
>  #define UVC_QUEUE_DISCONNECTED		(1 << 0)
> -#define UVC_QUEUE_DROP_CORRUPTED	(1 << 1)
>  
>  struct uvc_video_queue {
>  	struct vb2_queue queue;
> @@ -674,8 +673,7 @@ extern struct uvc_driver uvc_driver;
>  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
>  
>  /* Video buffers queue management. */
> -int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
> -		   int drop_corrupted);
> +int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
>  void uvc_queue_release(struct uvc_video_queue *queue);
>  int uvc_request_buffers(struct uvc_video_queue *queue,
>  			struct v4l2_requestbuffers *rb);

-- 
Regards,

Laurent Pinchart

