Return-Path: <linux-media+bounces-39852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CAB256D6
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 00:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9665C161D2A
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 22:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A75A2FCBE3;
	Wed, 13 Aug 2025 22:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VF3BxNVI"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF02F3C11
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755124870; cv=none; b=kxecyP0wD1njadUlIFdcGhMALt/Ujkp2DtCsUkh+Pa5PP/0TikTRmNWi6tUFibeqOqQkgvVtctZ9vhHaI4HuIf0bFELYro4GQJ8vOhPAyH6I51J3ZFq7vKv2rdnGLi3G8V+mpzxP3v/wOGbO3TKuf71ByDsXTZIV49CMU2Kb2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755124870; c=relaxed/simple;
	bh=BMLIgMFaj7ggz0QOd/t33dtTldDaZxhPufkXRNRmyKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cux1Bm2MtvJM9bdOu04k3KjX58gXfDS8slGkhqef40YrBr9i4T7fOPv0pqRJUNHN/RzKgivIZXHBhTq7FW6ltRb5CtirLVIWykXrFfDn4l8YIRNyHz3ukD9lLkv01fJT9RoZUo5xM/1NGnVwVMhGep94/ZRLgOPpJOm9KfjGddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VF3BxNVI; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 14 Aug 2025 00:40:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755124855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PuLxAdi0ouQstRyjt3UVUbNGz+6lyp41mZxES/mVnq0=;
	b=VF3BxNVIABF0M0UiVP3U8trC9Yn9rmUxIMhu7ZaP/UruwT/pOX0wkQkhnfsXgDjfOU/puN
	LWITZT5lRBCr4cS7+HI9lwpVaodtvjPEIu460NlDwv22V130HpQXAs47am/NbFve3zhNdR
	EjcBtgDqW74rZshZzygzzSgqlMRjqwk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] media: nxp: imx8-isi: Drop
 mxc_isi_video.is_streaming field
Message-ID: <l537p4daekgapclu4xagfvjw2cgb32r2b6rbyv7gwxrwgsujef@mpk6oyzw35np>
References: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
 <20250813212451.22140-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813212451.22140-3-laurent.pinchart@ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

On Thu, Aug 14, 2025 at 12:24:51AM +0300, Laurent Pinchart wrote:
> The mxc_isi_video.is_streaming field is used to track the streaming
> status of the video device. The same information is also tracked by the
> videobuf2 queue. Drop the is_streaming field, and check the queue
> streaming status instead.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h  | 3 +--
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 8 ++------
>  2 files changed, 3 insertions(+), 8 deletions(-)

Of course I also tested patch 2/2 from this series ;-).
Therefore please feel free to add

Tested-By: Richard Leitner <richard.leitner@linux.dev> # i.MX8MP

> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 206995bedca4..d86f5ede0c0e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -202,9 +202,8 @@ struct mxc_isi_video {
>  	struct video_device		vdev;
>  	struct media_pad		pad;
>  
> -	/* Protects is_streaming, and the vdev and vb2_q operations */
> +	/* Protects the vdev and vb2_q operations */
>  	struct mutex			lock;
> -	bool				is_streaming;
>  
>  	struct v4l2_pix_format_mplane	pix;
>  	const struct mxc_isi_format_info *fmtinfo;
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 042b554d2775..13682bf6e9f8 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -969,8 +969,6 @@ static int mxc_isi_vb2_prepare_streaming(struct vb2_queue *q)
>  	if (ret)
>  		goto err_stop;
>  
> -	video->is_streaming = true;
> -
>  	return 0;
>  
>  err_stop:
> @@ -1035,8 +1033,6 @@ static void mxc_isi_vb2_unprepare_streaming(struct vb2_queue *q)
>  	mxc_isi_video_free_discard_buffers(video);
>  	video_device_pipeline_stop(&video->vdev);
>  	mxc_isi_pipe_release(video->pipe);
> -
> -	video->is_streaming = false;
>  }
>  
>  static const struct vb2_ops mxc_isi_vb2_qops = {
> @@ -1317,7 +1313,7 @@ void mxc_isi_video_suspend(struct mxc_isi_pipe *pipe)
>  {
>  	struct mxc_isi_video *video = &pipe->video;
>  
> -	if (!video->is_streaming)
> +	if (!vb2_is_streaming(&video->vb2_q))
>  		return;
>  
>  	mxc_isi_pipe_disable(pipe);
> @@ -1348,7 +1344,7 @@ int mxc_isi_video_resume(struct mxc_isi_pipe *pipe)
>  {
>  	struct mxc_isi_video *video = &pipe->video;
>  
> -	if (!video->is_streaming)
> +	if (!vb2_is_streaming(&video->vb2_q))
>  		return 0;
>  
>  	mxc_isi_video_init_channel(video);
> -- 
> Regards,
> 
> Laurent Pinchart
> 

