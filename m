Return-Path: <linux-media+bounces-52535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAu1F/pvi2lhUQAAu9opvQ
	(envelope-from <linux-media+bounces-52535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:50:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0710611E1B6
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F26663019CA1
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 17:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D4638A720;
	Tue, 10 Feb 2026 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z1lkUjaR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A038550D;
	Tue, 10 Feb 2026 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745841; cv=none; b=Z2sNTZupT4xjcNoN2XTnFHToxeETXmszunxzzT0cMnrk6i7WEH8476VO2eHQvRQ+k2bCQdTwZzssDbuI07l+KwCQIlQQInPUDxEHQLUpA3y3/+j+vs8REod00PCw0G6XBLsZQVosgHd3aFQkR2/CO8Z8T2FNM9fUXKgoxGpN5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745841; c=relaxed/simple;
	bh=PxYLU0bOkuXF6XS6irDSnU3RpuFicO9Z/EHPm53H19I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9VTaMNfj8kUzt1fuUt6CqRI8QzTQy3aMCH8ZxrYlXbDfylQa4qjX6LyCjPisPyaWugdbhMd/3Y0FMMVmGsqM+I/I1aU5hlhxX59Q3NSIQ/aI/OQwQbaHneJhtB4PqIuOoGAsbZn1iH1wvzO4dX/OzpdOhindH4n6M0EGKWA0UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z1lkUjaR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7BCF6E47;
	Tue, 10 Feb 2026 18:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770745790;
	bh=PxYLU0bOkuXF6XS6irDSnU3RpuFicO9Z/EHPm53H19I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1lkUjaRK3jyd7O76A/rtE27iZs5dwqrAGGjYK8KwANRGKugk8Yl7GegZucnVZFCT
	 Fhgl/mq1foQVxs7xdCbbOhMDqlWc5Ark51iK1aMsO4CwK7feT3C5ce52VSBMT4oywG
	 tkqYS63Yu3zho+mcJHkUrxxOHt+OlRQU2RJD5FZ8=
Date: Tue, 10 Feb 2026 19:50:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v3 1/4] media: dw100: Implement V4L2 requests support
Message-ID: <20260210175035.GB2502896@killaraus.ideasonboard.com>
References: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-0-2eb5685eaf09@ideasonboard.com>
 <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-1-2eb5685eaf09@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-1-2eb5685eaf09@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52535-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 0710611E1B6
X-Rspamd-Action: no action

Hi Stefan,

Thank you for the patch.

On Thu, Jan 29, 2026 at 12:43:10PM +0100, Stefan Klug wrote:
> The dw100 dewarper hardware present on the NXP i.MX8MP allows very
> flexible dewarping using a freely configurable vertex map. Aside from
> lens dewarping the vertex map can be used to implement things like
> arbitrary zoom, pan and rotation. The current driver supports setting
> that vertex map before calling VIDIOC_STREAMON.
> 
> To control above mentioned features during streaming it is necessary to
> update the vertex map dynamically. To do that in a race free manner V4L2
> requests support is required. This patch adds V4L2 requests support to

Once this gets merged it won't be a patch any more :-) As commit
messages are written in an imperative mood style,

s/This patch adds/Add/

> prepare for dynamic vertex map updates.
> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> 
> ---
> 
> Changes in v2:
> - Use v4l2_m2m_buf_done_and_job_finish() to mark the buffers as done in
>   the correct order.
> 
> Changes in v1:
> - Moved v4l2_ctrl_request_complete into dw100_device_run
> ---
>  drivers/media/platform/nxp/dw100/dw100.c | 49 +++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..1cb895da9912371a2b23ca62412c572d9cb75c00 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -459,6 +459,15 @@ static int dw100_queue_setup(struct vb2_queue *vq,
>  	return 0;
>  }
>  
> +static int dw100_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
>  static int dw100_buf_prepare(struct vb2_buffer *vb)
>  {
>  	unsigned int i;
> @@ -500,6 +509,13 @@ static void dw100_buf_queue(struct vb2_buffer *vb)
>  	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
>  }
>  
> +static void dw100_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct dw100_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> +}
> +
>  static void dw100_return_all_buffers(struct vb2_queue *q,
>  				     enum vb2_buffer_state state)
>  {
> @@ -553,11 +569,13 @@ static void dw100_stop_streaming(struct vb2_queue *q)
>  }
>  
>  static const struct vb2_ops dw100_qops = {
> -	.queue_setup	 = dw100_queue_setup,
> -	.buf_prepare	 = dw100_buf_prepare,
> -	.buf_queue	 = dw100_buf_queue,
> -	.start_streaming = dw100_start_streaming,
> -	.stop_streaming  = dw100_stop_streaming,
> +	.queue_setup	      = dw100_queue_setup,
> +	.buf_out_validate     = dw100_buf_out_validate,
> +	.buf_prepare	      = dw100_buf_prepare,
> +	.buf_queue	      = dw100_buf_queue,
> +	.start_streaming      = dw100_start_streaming,
> +	.stop_streaming       = dw100_stop_streaming,
> +	.buf_request_complete = dw100_buf_request_complete,
>  };
>  
>  static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> @@ -575,6 +593,7 @@ static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	src_vq->lock = &ctx->vq_mutex;
>  	src_vq->dev = ctx->dw_dev->v4l2_dev.dev;
> +	src_vq->supports_requests = true;
>  
>  	ret = vb2_queue_init(src_vq);
>  	if (ret)
> @@ -1058,7 +1077,6 @@ static const struct v4l2_ioctl_ops dw100_ioctl_ops = {
>  static void dw100_job_finish(struct dw100_device *dw_dev, bool with_error)
>  {
>  	struct dw100_ctx *curr_ctx;
> -	struct vb2_v4l2_buffer *src_vb, *dst_vb;
>  	enum vb2_buffer_state buf_state;
>  
>  	curr_ctx = v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
> @@ -1069,16 +1087,13 @@ static void dw100_job_finish(struct dw100_device *dw_dev, bool with_error)
>  		return;
>  	}
>  
> -	src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
> -	dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
> -
>  	if (likely(!with_error))
>  		buf_state = VB2_BUF_STATE_DONE;
>  	else
>  		buf_state = VB2_BUF_STATE_ERROR;
>  
> -	v4l2_m2m_buf_done(src_vb, buf_state);
> -	v4l2_m2m_buf_done(dst_vb, buf_state);
> +	v4l2_m2m_buf_done_and_job_finish(dw_dev->m2m_dev, curr_ctx->fh.m2m_ctx,
> +					 buf_state);
>  
>  	dev_dbg(&dw_dev->pdev->dev, "Finishing transaction with%s error(s)\n",
>  		with_error ? "" : "out");
> @@ -1460,6 +1475,12 @@ static void dw100_device_run(void *priv)
>  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>  

I'd add a comment here, as the complete() call before start() can be
confusing.

	/*
	 * Apply controls from the request to the device and copy back the value
	 * of volatile controls to the request. We can do the latter before
	 * starting the dewarper as no controls are updated as a result of the
	 * hardware operation.
	 /

It could be me not being familiar enough with the API, but I think
discussions during review of v2 showed that this confused other people
too.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> +				&ctx->hdl);
> +
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +				   &ctx->hdl);
> +
>  	dw100_start(ctx, src_buf, dst_buf);
>  }
>  
> @@ -1467,6 +1488,11 @@ static const struct v4l2_m2m_ops dw100_m2m_ops = {
>  	.device_run	= dw100_device_run,
>  };
>  
> +static const struct media_device_ops dw100_m2m_media_ops = {
> +	.req_validate = vb2_request_validate,
> +	.req_queue = v4l2_m2m_request_queue,
> +};
> +
>  static struct video_device *dw100_init_video_device(struct dw100_device *dw_dev)
>  {
>  	struct video_device *vfd = &dw_dev->vfd;
> @@ -1578,6 +1604,7 @@ static int dw100_probe(struct platform_device *pdev)
>  	dw_dev->mdev.dev = &pdev->dev;
>  	strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
>  	media_device_init(&dw_dev->mdev);
> +	dw_dev->mdev.ops = &dw100_m2m_media_ops;
>  	dw_dev->v4l2_dev.mdev = &dw_dev->mdev;
>  
>  	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);

-- 
Regards,

Laurent Pinchart

