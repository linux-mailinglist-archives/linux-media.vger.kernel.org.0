Return-Path: <linux-media+bounces-5151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23799854BF1
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 15:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2CD31F2346C
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 14:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E7C5B1F4;
	Wed, 14 Feb 2024 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C+jWOqnb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF695914A;
	Wed, 14 Feb 2024 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707922550; cv=none; b=sEy/eE0L+tqmeEgb/Nxtw9Q9pncgEOnsj+U+5F041awqqU9UFKwwKelH3jrPTZeuerHGT+LksqhxmoZVhy6liIjWG9nQ1dWee7bl9daLvZRLYuuPK6q3E8VOwl7sk9j1b0+1FbAP3ghunO1nQDXfaHsDnTln3AmgZVxN9iLof7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707922550; c=relaxed/simple;
	bh=W6bth3p4rwPUgpDajZWTwbquJlpBySusUVL6pfc+ewY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXrvqZ2XpFKPH+gTq/YwepdCZwjDmo3MP2Vg6rOOFaoHkQ0FKXRPnxozXgjwbTRxBK3ODhuOHUXElG2caI3OjzpRjSG5rUHtE94uRwIxae++KJUE35qFpZxIoh2Ne3+oAcqarJXG9jgy/69JBzceWEy2SdZSYJuJkd/zN3ljYVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C+jWOqnb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-118-194-nat.elisa-mobile.fi [85.76.118.194])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90CC0B3;
	Wed, 14 Feb 2024 15:55:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707922544;
	bh=W6bth3p4rwPUgpDajZWTwbquJlpBySusUVL6pfc+ewY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+jWOqnbaxQwopkLrd+yIWbQaKRyhcpcnSWsHOKrhVnuobBEdK8f0fejiSrtcPon9
	 sNpH/AMs+J7BFvG8tAirC7jJXzF66m/V8Gr06gMSoKZqa0qb/GgWtxiSWCaqKXrZSs
	 sbJGAy053oizECL/Rqzs0AxGBqd4OLP49SGaVCWI=
Date: Wed, 14 Feb 2024 16:55:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/5] media: platform: rzg2l-cru: rzg2l-video: Fix
 start reception procedure
Message-ID: <20240214145548.GB7120@pendragon.ideasonboard.com>
References: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
 <20240213181233.242316-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240213181233.242316-6-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Feb 13, 2024 at 06:12:33PM +0000, Biju Das wrote:
> As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
> latest hardware manual (R01UH0914EJ0145 Rev.1.45) we need to supply all
> the clocks and then release the CRU resets. Currently we are releasing
> the resets and then supplying the clocks. So, fix the start reception
> procedure.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch.
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 59 +++++++++----------
>  1 file changed, 28 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index d15a9bfcc98b..b16b8af6e8f8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -489,39 +489,24 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>  
>  		video_device_pipeline_stop(&cru->vdev);
>  
> -		pm_runtime_put_sync(cru->dev);
> -		clk_disable_unprepare(cru->vclk);
> -
>  		return stream_off_ret;
>  	}
>  
> -	ret = pm_runtime_resume_and_get(cru->dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(cru->vclk);
> -	if (ret)
> -		goto err_pm_put;
> -
>  	ret = rzg2l_cru_mc_validate_format(cru, sd, pad);
>  	if (ret)
> -		goto err_vclk_disable;
> +		return ret;
>  
>  	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
>  	ret = video_device_pipeline_start(&cru->vdev, pipe);
>  	if (ret)
> -		goto err_vclk_disable;
> +		return ret;
>  
>  	ret = v4l2_subdev_call(sd, video, pre_streamon, 0);
> -	if (ret == -ENOIOCTLCMD)
> -		ret = 0;
> -	if (ret)
> +	if (ret && ret != -ENOIOCTLCMD)
>  		goto pipe_line_stop;
>  
>  	ret = v4l2_subdev_call(sd, video, s_stream, 1);
> -	if (ret == -ENOIOCTLCMD)
> -		ret = 0;
> -	if (ret)
> +	if (ret && ret != -ENOIOCTLCMD)
>  		goto err_s_stream;
>  
>  	return 0;
> @@ -532,12 +517,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>  pipe_line_stop:
>  	video_device_pipeline_stop(&cru->vdev);
>  
> -err_vclk_disable:
> -	clk_disable_unprepare(cru->vclk);
> -
> -err_pm_put:
> -	pm_runtime_put_sync(cru->dev);
> -
>  	return ret;
>  }
>  
> @@ -636,25 +615,33 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
>  	int ret;
>  
> +	ret = pm_runtime_resume_and_get(cru->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(cru->vclk);
> +	if (ret)
> +		goto err_pm_put;
> +
>  	/* Release reset state */
>  	ret = reset_control_deassert(cru->aresetn);
>  	if (ret) {
>  		dev_err(cru->dev, "failed to deassert aresetn\n");
> -		return ret;
> +		goto err_vclk_disable;
>  	}
>  
>  	ret = reset_control_deassert(cru->presetn);
>  	if (ret) {
>  		reset_control_assert(cru->aresetn);
>  		dev_err(cru->dev, "failed to deassert presetn\n");
> -		return ret;
> +		goto assert_aresetn;
>  	}
>  
>  	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
>  			  IRQF_SHARED, KBUILD_MODNAME, cru);

Requesting the IRQ every time the device is started seems strange.
That's not related to this patch, but you may want to address it in a
separate series.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	if (ret) {
>  		dev_err(cru->dev, "failed to request irq\n");
> -		goto assert_resets;
> +		goto assert_presetn;
>  	}
>  
>  	/* Allocate scratch buffer. */
> @@ -686,10 +673,18 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  free_image_conv_irq:
>  	free_irq(cru->image_conv_irq, cru);
>  
> -assert_resets:
> +assert_presetn:
>  	reset_control_assert(cru->presetn);
> +
> +assert_aresetn:
>  	reset_control_assert(cru->aresetn);
>  
> +err_vclk_disable:
> +	clk_disable_unprepare(cru->vclk);
> +
> +err_pm_put:
> +	pm_runtime_put_sync(cru->dev);
> +
>  	return ret;
>  }
>  
> @@ -704,9 +699,11 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
>  			  cru->scratch, cru->scratch_phys);
>  
>  	free_irq(cru->image_conv_irq, cru);
> -	reset_control_assert(cru->presetn);
> -
>  	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
> +
> +	reset_control_assert(cru->presetn);
> +	clk_disable_unprepare(cru->vclk);
> +	pm_runtime_put_sync(cru->dev);
>  }
>  
>  static const struct vb2_ops rzg2l_cru_qops = {

-- 
Regards,

Laurent Pinchart

