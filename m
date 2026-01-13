Return-Path: <linux-media+bounces-50563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E2AD191CE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68AD43016AD9
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881EA299949;
	Tue, 13 Jan 2026 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F0iM8WcD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91738F923;
	Tue, 13 Jan 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311277; cv=none; b=euBmcE9k63nPkDnnsEAYDKZ4QUHf1GlnHiD0PADCCZeRVdGEO5KclIhZwl7djRIvlVGFHeXAi4GZDLILriYaXe6NRjxodCOxRQHKiAyDHe0OqT/UnWBZVM0RiUou/WntPey1KwwGGD87WHpb3NugtFb/sl9zbJ8mEWhljhvMBhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311277; c=relaxed/simple;
	bh=CR+orG/qbe/C0GlPkXwqD5UGr9NFcOAlxx/Wol43yiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIj6Zm1KzwXK/LRCXLjdV+UfDFHPS7d+ek05Z/NF3cRFBb+TfEqlfgY0NdBteESo7cupf6WTciF8mCSVDW9Nu75IP2bM+zBweBhkmX4+tJO+Bl/3uB+n6eM09m9GK8wutrnAiKajzlBVaeJpMVy22QgSlb8RFoOaLK0aBqOpeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F0iM8WcD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1352F316;
	Tue, 13 Jan 2026 14:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768311247;
	bh=CR+orG/qbe/C0GlPkXwqD5UGr9NFcOAlxx/Wol43yiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0iM8WcD5EjhNzgbvd+IOpMitYfEBiPU4qhvAPeWUWsFO7Fq2cxmyWQilrMuKODVu
	 Q4r7j8uVGQwrUQN1+AtuqVzyqgy7So5G6u13Y90iDLTx89vbQ9DCMoUBmBQhG9h0Kg
	 /HDl6ChueVG78jxdifogzZAJ7xx0Zl4sEIXZnwm0=
Date: Tue, 13 Jan 2026 15:34:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ralf Jung <post@ralfj.de>
Subject: Re: [PATCH] Revert "media: uvcvideo: Remove nodrop parameter"
Message-ID: <20260113133412.GE6198@pendragon.ideasonboard.com>
References: <20260113-uvc-revert-v1-1-0a873393774c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113-uvc-revert-v1-1-0a873393774c@chromium.org>

On Tue, Jan 13, 2026 at 01:29:46PM +0000, Ricardo Ribalda wrote:
> This reverts commit 27ccc44a511b0cd76dc607e2a4893b876192ee1b.
> 
> A user has reported that the Zoom Video Conferencing tool is not capable
> of handling invalid frames. Due to this, he has to continue using this
> parameter.
> 
> We will keep working with Zoom so they can handle invalid frames
> correctly, but for this cycle the safest option is to revert this
> parameter drop.

Zoom is unlikely to be the only affected application.

> Fixes: 27ccc44a511b ("media: uvcvideo: Remove nodrop parameter")
> Reported-by: Ralf Jung <post@ralfj.de>
> Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121718
> Closes: https://lore.kernel.org/linux-media/uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr/
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hans, Mauro, can you pick this up ? Alternatively I can prepare a pull
request.

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 19 +++++++++++++++++++
>  drivers/media/usb/uvc/uvc_queue.c  | 25 +++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 45 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..ee4f54d6834962414979a046afc59c5036455124 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -32,6 +32,7 @@
>  
>  unsigned int uvc_clock_param = CLOCK_MONOTONIC;
>  unsigned int uvc_hw_timestamps_param;
> +unsigned int uvc_no_drop_param = 1;
>  static unsigned int uvc_quirks_param = -1;
>  unsigned int uvc_dbg_param;
>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> @@ -2467,6 +2468,24 @@ MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
>  module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
>  MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
>  
> +static int param_set_nodrop(const char *val, const struct kernel_param *kp)
> +{
> +	pr_warn_once("uvcvideo: "
> +		     DEPRECATED
> +		     "nodrop parameter will be eventually removed.\n");
> +	return param_set_bool(val, kp);
> +}
> +
> +static const struct kernel_param_ops param_ops_nodrop = {
> +	.set = param_set_nodrop,
> +	.get = param_get_uint,
> +};
> +
> +param_check_uint(nodrop, &uvc_no_drop_param);
> +module_param_cb(nodrop, &param_ops_nodrop, &uvc_no_drop_param, 0644);
> +__MODULE_PARM_TYPE(nodrop, "uint");
> +MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
> +
>  module_param_named(quirks, uvc_quirks_param, uint, 0644);
>  MODULE_PARM_DESC(quirks, "Forced device quirks");
>  module_param_named(trace, uvc_dbg_param, uint, 0644);
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index 3bc54456b4d98ed50b1ea250ce8501e67141e1ef..681a74ed09fb1f109d2b21bf490e8b26eeec0a3e 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -331,9 +331,34 @@ struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue)
>  	return nextbuf;
>  }
>  
> +/*
> + * uvc_queue_buffer_requeue: Requeue a buffer on our internal irqqueue
> + *
> + * Reuse a buffer through our internal queue without the need to 'prepare'.
> + * The buffer will be returned to userspace through the uvc_buffer_queue call if
> + * the device has been disconnected.
> + */
> +static void uvc_queue_buffer_requeue(struct uvc_video_queue *queue,
> +				     struct uvc_buffer *buf)
> +{
> +	buf->error = 0;
> +	buf->state = UVC_BUF_STATE_QUEUED;
> +	buf->bytesused = 0;
> +	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, 0);
> +
> +	uvc_buffer_queue(&buf->buf.vb2_buf);
> +}
> +
>  static void uvc_queue_buffer_complete(struct kref *ref)
>  {
>  	struct uvc_buffer *buf = container_of(ref, struct uvc_buffer, ref);
> +	struct vb2_buffer *vb = &buf->buf.vb2_buf;
> +	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	if (buf->error && !uvc_no_drop_param) {
> +		uvc_queue_buffer_requeue(queue, buf);
> +		return;
> +	}
>  
>  	buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
>  	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 911016047687f7c74fa1bf0dd0ecf2d072361346..d583425893a5f716185153a07aae9bfe20182964 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -659,6 +659,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
>  #define UVC_WARN_XU_GET_RES	2
>  
>  extern unsigned int uvc_clock_param;
> +extern unsigned int uvc_no_drop_param;
>  extern unsigned int uvc_dbg_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
> 
> ---
> base-commit: 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c
> change-id: 20260113-uvc-revert-cd60dc7f16ec

-- 
Regards,

Laurent Pinchart

