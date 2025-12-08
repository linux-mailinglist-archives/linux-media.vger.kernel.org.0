Return-Path: <linux-media+bounces-48388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D215CACECC
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 11:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D79623063F57
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 10:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9692530FF10;
	Mon,  8 Dec 2025 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jej2lVNQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9D3115B8;
	Mon,  8 Dec 2025 10:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191263; cv=none; b=JymoYGbwXV0OaGYaAk7+CwD/1JXPScxP76n73vgWEJI16EAPpMUB7UGBYyY8WGe9UPn2p6mY3U0HnQu+zu1U+RqGJOYfXGVRHpf6ZAipCnGrX72H1TMPRKOeDvsCtlEX9zC+saFEjtv7r6IEGuqPs1jcbbjbNPK5rAyM5Sea9EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191263; c=relaxed/simple;
	bh=2iH0do5JL7A3R6VxgqMFiEwjZrUGr3mNbfpVHC/YVlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cv/zVO3ONyvlAh72GDfl8FuhP5hTTmgehiETY56n9ML4aK99p4hhynZvmPgHQBLfJBIvfp7UZZjYk14PaKpyVfPyKlCaEnEIavXr6uagMeaKPWMaLWB3vn1rRwYtrBkh9v1zY7k7EQ56uGENW6atEkB8lf0Jgvd/pFAQ0hzgl20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jej2lVNQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FF3C4CEF1;
	Mon,  8 Dec 2025 10:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765191263;
	bh=2iH0do5JL7A3R6VxgqMFiEwjZrUGr3mNbfpVHC/YVlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jej2lVNQoJHtAtln7kKZ/nLjdwJ/CoAQ0RJ8wALoLOF69stJo9tzkzGeA+e7EFZh2
	 GVE91qQ/oKm0AAwaujTYezZBfqaVjqdsP+gQWRCQAYBPvcnn166wk+EK77IxvGZHZO
	 zl0U0BJOdm90aFp2U7aqGmKsaoHKXJeveURTDbfemVtBcFzR0evW0IMrMDW+JC/FeB
	 EgsbL66SCwP2p55wBIDTTGXufWe2Ax6WJhN/Lfs7KgJghaIl+BdIIobMVbaNpvLPEe
	 IZdlwfe/IxFcY8aPPyXinFxsDP7VfLfr2+NH7zFw3XjkoZRo62up4B1ft1gm9gHJeI
	 0sPBqwwJkXZ8g==
Message-ID: <8e4e9167-0276-49ab-b1ba-cac9b90d5f1c@kernel.org>
Date: Mon, 8 Dec 2025 11:54:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] media: uvcvideo: Remove nodrop parameter
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-1-0359ffb98c9e@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251119-uvcdynctrl-v2-1-0359ffb98c9e@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> We announced the deprecation intentions one year ago in the commit
> commit 40ed9e9b2808 ("media: uvcvideo: Announce the user our deprecation
> intentions").
> 
> We have not hear any complains, lets remove the nodrop parameter.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Since this is independent of the rest of the series I've merged this into my local
uvc/for-next branch which I will push out later today.

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_driver.c | 19 -------------------
>  drivers/media/usb/uvc/uvc_queue.c  | 25 -------------------------
>  drivers/media/usb/uvc/uvcvideo.h   |  1 -
>  3 files changed, 45 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ee4f54d6834962414979a046afc59c5036455124..71563d8f4bcf581694ccd4b665ff52b629caa0b6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -32,7 +32,6 @@
>  
>  unsigned int uvc_clock_param = CLOCK_MONOTONIC;
>  unsigned int uvc_hw_timestamps_param;
> -unsigned int uvc_no_drop_param = 1;
>  static unsigned int uvc_quirks_param = -1;
>  unsigned int uvc_dbg_param;
>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> @@ -2468,24 +2467,6 @@ MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
>  module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
>  MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
>  
> -static int param_set_nodrop(const char *val, const struct kernel_param *kp)
> -{
> -	pr_warn_once("uvcvideo: "
> -		     DEPRECATED
> -		     "nodrop parameter will be eventually removed.\n");
> -	return param_set_bool(val, kp);
> -}
> -
> -static const struct kernel_param_ops param_ops_nodrop = {
> -	.set = param_set_nodrop,
> -	.get = param_get_uint,
> -};
> -
> -param_check_uint(nodrop, &uvc_no_drop_param);
> -module_param_cb(nodrop, &param_ops_nodrop, &uvc_no_drop_param, 0644);
> -__MODULE_PARM_TYPE(nodrop, "uint");
> -MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
> -
>  module_param_named(quirks, uvc_quirks_param, uint, 0644);
>  MODULE_PARM_DESC(quirks, "Forced device quirks");
>  module_param_named(trace, uvc_dbg_param, uint, 0644);
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 790184c9843d211d34fa7d66801631d5a07450bd..3bc54456b4d98ed50b1ea250ce8501e67141e1ef 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -331,34 +331,9 @@ struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue)
>  	return nextbuf;
>  }
>  
> -/*
> - * uvc_queue_buffer_requeue: Requeue a buffer on our internal irqqueue
> - *
> - * Reuse a buffer through our internal queue without the need to 'prepare'.
> - * The buffer will be returned to userspace through the uvc_buffer_queue call if
> - * the device has been disconnected.
> - */
> -static void uvc_queue_buffer_requeue(struct uvc_video_queue *queue,
> -		struct uvc_buffer *buf)
> -{
> -	buf->error = 0;
> -	buf->state = UVC_BUF_STATE_QUEUED;
> -	buf->bytesused = 0;
> -	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, 0);
> -
> -	uvc_buffer_queue(&buf->buf.vb2_buf);
> -}
> -
>  static void uvc_queue_buffer_complete(struct kref *ref)
>  {
>  	struct uvc_buffer *buf = container_of(ref, struct uvc_buffer, ref);
> -	struct vb2_buffer *vb = &buf->buf.vb2_buf;
> -	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
> -
> -	if (buf->error && !uvc_no_drop_param) {
> -		uvc_queue_buffer_requeue(queue, buf);
> -		return;
> -	}
>  
>  	buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
>  	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ed7bad31f75ca474c1037d666d5310c78dd764df..9a86d7f1f6ea022dace87614030bf0fde0d260f0 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -659,7 +659,6 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
>  #define UVC_WARN_XU_GET_RES	2
>  
>  extern unsigned int uvc_clock_param;
> -extern unsigned int uvc_no_drop_param;
>  extern unsigned int uvc_dbg_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
> 


