Return-Path: <linux-media+bounces-47339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 796FAC6CB47
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 140822CD05
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 04:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9132F60D8;
	Wed, 19 Nov 2025 04:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lW1zwp/f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A0D4503B;
	Wed, 19 Nov 2025 04:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526077; cv=none; b=rOClfhP1qKtr7hWjysHXYsx/cPLbVawF49iIOFTSwu62IP2MOn4Yz6WWQ3YeAzbv0IPJqIYBCma2PHZYDYSrNbHTZwQuGOEpPHP4FIrvBCleQWIuVxW9RDGMoHeM6nw69HYAJDtThf1SA4cakce4mGu5TQFHJOhBJnk+NlRNHuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526077; c=relaxed/simple;
	bh=wNtflb3ufEoncrijVYlih+QDws+cfFFqZIt1MA1wLAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYBsa2dveWCvEpDjVDIOAm4BezGjQsrgCxDtu/dhq48/umFqmIlog3eGv1K9ho4XhjzIbqGCRv1q5/IhIQpTQqeac/ZEhVQIA7NFPyxmttqD9CEOwd9+3DIHBDa/UJqXeqn1gjKU0WUKpbQmgqitGWxOcYWyGgHChwFFZYq+NwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lW1zwp/f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0707114B0;
	Wed, 19 Nov 2025 05:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763525949;
	bh=wNtflb3ufEoncrijVYlih+QDws+cfFFqZIt1MA1wLAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lW1zwp/fimUlqM1Fj3ai/q6p/uX8XaaFF5/IZVDMBdtvo6WsPeGI/e+21SX7cD+Rb
	 1w0P1T/Md+l3kN85F3t95KV/VC4eosJuwe++cxSPAFTTrxUK6r9qEtAY+jNNCUBdK0
	 wvb9IRYsYRB0cCzUAxQK5bYRYTpdS0VHGmjkHmGM=
Date: Wed, 19 Nov 2025 13:20:39 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] media: uvcvideo: Remove nodrop parameter
Message-ID: <20251119042039.GI10711@pendragon.ideasonboard.com>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-1-aed70eadf3d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-uvcdynctrl-v1-1-aed70eadf3d8@chromium.org>

On Mon, Nov 17, 2025 at 08:14:16PM +0000, Ricardo Ribalda wrote:
> We announced the deprecation intentions one year ago in the commit
> commit 40ed9e9b2808 ("media: uvcvideo: Announce the user our deprecation
> intentions").
> 
> We have not hear any complains, lets remove the nodrop parameter.

A year is short for users who run distributions based on LTS kernels. I
don't object though.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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

-- 
Regards,

Laurent Pinchart

