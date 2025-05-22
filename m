Return-Path: <linux-media+bounces-33168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FEBAC0FED
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 066C84E0D1B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFCD29826F;
	Thu, 22 May 2025 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OQsjAE98"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9267298986
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927615; cv=none; b=TpZha+51F5qhDKBwk7o82StWJo5Ml0Zxbzi7N+Thb9iKL08LE3THmpuMK1p3VNpcsG0WZSYZPtZBsz81ApfYSxfS1TAQPUWlIgc3p+5kvj4iBUWVAVPJCfI8HwxYj+BUjQFWzCUYpCd9MRNPv4CWFbi/viD5vY0siNZI3F87CZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927615; c=relaxed/simple;
	bh=3vgB5xe8h0Ac0HX4R8W4NCM3nLD44/mLKpe7F7SkdXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6F6gE0g3sd3bX2FCbCrsGD41U/yC9GI2W31hQZQlPZTgeE4Izp8ntbBA8CFKEL4uWtd9spP6PitwtG+pZDDlwN9Z0qtXt1HmKknqudJ8CEuIGIG4a0B/JeHJN0ZPunb61w2fw4ONIcLJN2z9KCB/f4D4RfId+9QBmZRXMT+Sgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OQsjAE98; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4DD28FA;
	Thu, 22 May 2025 17:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747927590;
	bh=3vgB5xe8h0Ac0HX4R8W4NCM3nLD44/mLKpe7F7SkdXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQsjAE98J6DPK3laF62msi3T3h9qdFdCNnohLbAH7v5yrDdsh/IqgnGLFwnyuFyir
	 /rU9iI3Mji5/LDH3kJTpUdjAsCZQ6vB73xfzhU5xUFg1AjJD54RGndguMKt3BBBRfJ
	 1ymAfhc+vaTe8+tWa4qWiAIG53RyTUBB434JNWaU=
Date: Thu, 22 May 2025 17:26:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Cleanup video device in error path
Message-ID: <20250522152645.GS12514@pendragon.ideasonboard.com>
References: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Thu, May 22, 2025 at 03:30:08PM +0100, Daniel Scally wrote:
> mxc_isi_v4l2_init() registers video devices and v4l2 subdevices but
> the video devices are not cleaned up in that function's error path
> which means they're left hanging if it fails. Update the function
> to clean them up properly.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 1e79b1211b603a71f0427e82a997787110f7e4ac..4a74b988217f504a03dfe330a7bac76cdecc933c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -154,7 +154,7 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  		if (ret < 0) {
>  			dev_err(isi->dev, "Failed to register pipe%u: %d\n", i,
>  				ret);
> -			goto err_v4l2;
> +			goto err_cleanup_pipe;
>  		}
>  
>  		ret = media_create_pad_link(&isi->crossbar.sd.entity,
> @@ -164,14 +164,14 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  					    MEDIA_LNK_FL_IMMUTABLE |
>  					    MEDIA_LNK_FL_ENABLED);
>  		if (ret < 0)
> -			goto err_v4l2;
> +			goto err_cleanup_pipe;
>  	}
>  
>  	/* Register the M2M device. */
>  	ret = mxc_isi_m2m_register(isi, v4l2_dev);
>  	if (ret < 0) {
>  		dev_err(isi->dev, "Failed to register M2M device: %d\n", ret);
> -		goto err_v4l2;
> +		goto err_cleanup_pipe;
>  	}
>  
>  	/* Initialize, fill and register the async notifier. */
> @@ -212,6 +212,9 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  err_m2m:
>  	mxc_isi_m2m_unregister(isi);
>  	v4l2_async_nf_cleanup(&isi->notifier);
> +err_cleanup_pipe:
> +	for (i = 0; i < isi->pdata->num_channels; ++i)
> +		mxc_isi_pipe_unregister(&isi->pipes[i]);

mxc_isi_pipe_unregister() calls mxc_isi_video_unregister(), which locks
the video->lock mutex. The mutex is initialized in
mxc_isi_video_register(), so you will have an issue here when reaching
this label from within the pipe registration loop for any non-registered
pipe.

One option to address this would be to return from
mxc_isi_video_unregister() if video->pipe is NULL.

>  err_v4l2:
>  	v4l2_device_unregister(v4l2_dev);
>  err_media:
> 
> ---
> base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
> change-id: 20250522-djrscally-imx8-isi-fixes-fed2d7cffb1c

-- 
Regards,

Laurent Pinchart

