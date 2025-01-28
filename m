Return-Path: <linux-media+bounces-25350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC28A20D3D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 16:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91701888C4D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 15:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2916E1D5165;
	Tue, 28 Jan 2025 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vMGRKl84"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A081A2387
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 15:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738078855; cv=none; b=LO+vJoevhaiGcPjrdFevR/OZreJa1zJFpXM6P9zkboAGGU9Q6+HSXPUskCZb8WuJ4Og8gRx8Yjeckm7N54IKOUpGmZtKrpfJR80iLvvQkYQLNn1fkLUKs5jj9X4kybEn3SLyqIxOMXKSNC36APowgy+a9v9kNfqr60xM+tJBiGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738078855; c=relaxed/simple;
	bh=IjwfJQOGLm7JAyq8nvvk0JCfBYZDOsDgD2p0l79Me/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+jsBneOluD44GMzuh5GJkSwzfneiuBGwiHeclz+cPpVEFEpNiZaMt7Kgqi62Ns37J3LgoljIZ3Z0pD9+UshLJd0jlXYei+j0FD0+sBwY/Ewzid/Mb89yeh4WDLblaqlB66g6syFygfqRhbGkqIjivHedHa1pQOYL5uoeqSpEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vMGRKl84; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D0343A4;
	Tue, 28 Jan 2025 16:39:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738078784;
	bh=IjwfJQOGLm7JAyq8nvvk0JCfBYZDOsDgD2p0l79Me/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMGRKl84GkWdc269MnrGXE5w2EhbPcKHsHsdXGMBJHrpgvQ8BD8veYO+BqiJ4FuKX
	 SJXxztYfhZp79j0Uh9/7p5KcZ+/PKeHwdLvbtD11ecK21pvxgFekiE1KQjHXWeShFW
	 tSfsDMoYLPOaDt5WCmwnIPJyBHdn5eYpFr+bqm+Q=
Date: Tue, 28 Jan 2025 17:40:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: omap3isp: drop wait_prepare/finish callbacks
Message-ID: <20250128154040.GF12673@pendragon.ideasonboard.com>
References: <218877d9-5f95-42ab-8bbf-2325cb31ed73@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <218877d9-5f95-42ab-8bbf-2325cb31ed73@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Tue, Jan 28, 2025 at 04:08:18PM +0100, Hans Verkuil wrote:
> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL") it is no longer needed to set the wait_prepare/finish
> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> 
> Set the queue lock to &video->queue_lock, which makes it possible to drop
> the wait_prepare/finish callbacks.
> 
> This simplifies the code and this is a step towards the goal of deleting
> these callbacks.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
>  drivers/media/platform/ti/omap3isp/ispvideo.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 5c9aa80023fd..78e30298c7ad 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -480,29 +480,11 @@ static int isp_video_start_streaming(struct vb2_queue *queue,
>  	return 0;
>  }
> 
> -static void omap3isp_wait_prepare(struct vb2_queue *vq)
> -{
> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
> -	struct isp_video *video = vfh->video;
> -
> -	mutex_unlock(&video->queue_lock);
> -}
> -
> -static void omap3isp_wait_finish(struct vb2_queue *vq)
> -{
> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
> -	struct isp_video *video = vfh->video;
> -
> -	mutex_lock(&video->queue_lock);
> -}
> -
>  static const struct vb2_ops isp_video_queue_ops = {
>  	.queue_setup = isp_video_queue_setup,
>  	.buf_prepare = isp_video_buffer_prepare,
>  	.buf_queue = isp_video_buffer_queue,
>  	.start_streaming = isp_video_start_streaming,
> -	.wait_prepare = omap3isp_wait_prepare,
> -	.wait_finish = omap3isp_wait_finish,
>  };
> 
>  /*
> @@ -1338,6 +1320,7 @@ static int isp_video_open(struct file *file)
>  	queue->buf_struct_size = sizeof(struct isp_buffer);
>  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	queue->dev = video->isp->dev;
> +	queue->lock = &video->queue_lock;

This is goind to deadlock at least when calling VIDIOC_DQBUF in blocking
mode.

> 
>  	ret = vb2_queue_init(&handle->queue);
>  	if (ret < 0) {

-- 
Regards,

Laurent Pinchart

