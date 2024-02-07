Return-Path: <linux-media+bounces-4846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447784D598
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 23:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7B01F23363
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 22:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE39C535B7;
	Wed,  7 Feb 2024 21:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qL3sZUqT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D0535A0;
	Wed,  7 Feb 2024 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707343181; cv=none; b=MDNrtq1sbXUkAzDNMTAE/U3UEMIaLWzWhQGV56B7AJTQgo/MiKozcLE3JyE6y597NVtkpPb9etxLaytXYDX704qvlRtTp70NqBsp+XP4S0lNS2e5KGeSpuMTihIyEjtYOIkMVKRZzgRh+mrfOpGcSQApMY5QQzGoFSxHwLPH4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707343181; c=relaxed/simple;
	bh=SLpvpsQA1rmH9zd3fX1+FbXtAFhPBnUvIjeD49Zj/v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYonw2V/H9YX3EORVk4nyv+/xBkhv2xd0yMnzcCwsm7dhNS8CTzVqkjQWL48LOBpJZ4EK15ZIVor0HGvLbp8HtrMfFU/lR32Rj2pgToTjmJpueGHle9D4Iq90UXf0j8QksTejWyI89fEDQ/U5TMqF2/bwTsmFGWyRXeKGcx5Zzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qL3sZUqT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B6A3975;
	Wed,  7 Feb 2024 22:58:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707343091;
	bh=SLpvpsQA1rmH9zd3fX1+FbXtAFhPBnUvIjeD49Zj/v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qL3sZUqToG2/8oPQamLnzlCXh2Zan/2KNjIW6K3dLR7rzgzF0yH+p818e2L1NZyJN
	 ibFQt06JYIKPekme2Znjo6CsuX440Mjo2PfWE7VjzTPrQqPzKQiig0lvVAlR/IYXo+
	 qZ2L8M7T3n3iK4aZG0hKDxAorQg8fURPCL+/Ifzk=
Date: Wed, 7 Feb 2024 23:59:37 +0200
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
Subject: Re: [PATCH v2 RESEND 4/4] media: platform: rzg2l-cru: rzg2l-video:
 Restructure clk handling
Message-ID: <20240207215937.GB7331@pendragon.ideasonboard.com>
References: <20240130164115.116613-1-biju.das.jz@bp.renesas.com>
 <20240130164115.116613-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240130164115.116613-5-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jan 30, 2024 at 04:41:15PM +0000, Biju Das wrote:
> As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
> latest hardware manual (R01UH0914EJ0140 Rev.1.40) it is mentioned that
> we need to supply all CRU clks and we need to disable the vclk before
> enabling the LINK reception and enable the vclk after enabling the link
> Reception. So restructure clk handling as per the HW manual.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped clk-provider.h and __clk_is_enabled() as consumer clk should
>    not use it. Plan to send RFC for clk_disable_unprepare_sync() in ccf.
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 28 +++++---
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 15 +---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69 ++++++++-----------
>  4 files changed, 47 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 811603f18af0..a5a99b004322 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -133,9 +133,6 @@ struct rzg2l_cru_dev {
>  	struct v4l2_pix_format format;
>  };
>  
> -void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru);
> -int rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru);
> -
>  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index e00d9379dd2c..e68fcdaea207 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -108,6 +108,7 @@ struct rzg2l_csi2 {
>  	struct reset_control *presetn;
>  	struct reset_control *cmn_rstb;
>  	struct clk *sysclk;
> +	struct clk *vclk;
>  	unsigned long vclk_rate;
>  
>  	struct v4l2_subdev subdev;
> @@ -361,7 +362,7 @@ static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
>  	return rzg2l_csi2_dphy_disable(csi2);
>  }
>  
> -static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> +static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
>  {
>  	unsigned long vclk_rate = csi2->vclk_rate / HZ_PER_MHZ;
>  	u32 frrskw, frrclk, frrskw_coeff, frrclk_coeff;
> @@ -386,11 +387,15 @@ static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
>  	rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
>  	rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
>  
> +	clk_disable_unprepare(csi2->vclk);
> +
>  	/* Enable LINK reception */
>  	rzg2l_csi2_write(csi2, CSI2nMCT3, CSI2nMCT3_RXEN);
> +
> +	return clk_prepare_enable(csi2->vclk);
>  }
>  
> -static void rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
> +static int rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
>  {
>  	unsigned int timeout = VSRSTS_RETRIES;
>  
> @@ -409,18 +414,21 @@ static void rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
>  
>  	if (!timeout)
>  		dev_err(csi2->dev, "Clearing CSI2nRTST.VSRSTS timed out\n");
> +
> +	return 0;
>  }
>  
>  static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
>  {
>  	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
> +	int ret;
>  
>  	if (on)
> -		rzg2l_csi2_mipi_link_enable(csi2);
> +		ret = rzg2l_csi2_mipi_link_enable(csi2);
>  	else
> -		rzg2l_csi2_mipi_link_disable(csi2);
> +		ret = rzg2l_csi2_mipi_link_disable(csi2);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int rzg2l_csi2_s_stream(struct v4l2_subdev *sd, int enable)
> @@ -731,7 +739,6 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
>  static int rzg2l_csi2_probe(struct platform_device *pdev)
>  {
>  	struct rzg2l_csi2 *csi2;
> -	struct clk *vclk;
>  	int ret;
>  
>  	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
> @@ -757,12 +764,11 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
>  				     "Failed to get system clk\n");
>  
> -	vclk = clk_get(&pdev->dev, "video");
> -	if (IS_ERR(vclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(vclk),
> +	csi2->vclk = devm_clk_get(&pdev->dev, "video");
> +	if (IS_ERR(csi2->vclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
>  				     "Failed to get video clock\n");
> -	csi2->vclk_rate = clk_get_rate(vclk);
> -	clk_put(vclk);
> +	csi2->vclk_rate = clk_get_rate(csi2->vclk);
>  
>  	csi2->dev = &pdev->dev;
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 8466b4e55909..2d22c373588b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -80,20 +80,9 @@ static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)
>  			return ret;
>  		}
>  
> -		rzg2l_cru_vclk_unprepare(cru);
> -
>  		ret = v4l2_subdev_call(cru->ip.remote, video, s_stream, enable);
> -		if (ret == -ENOIOCTLCMD)
> -			ret = 0;
> -		if (!ret) {
> -			ret = rzg2l_cru_vclk_prepare(cru);
> -			if (!ret)
> -				return 0;
> -		} else {
> -			/* enable back vclk so that s_stream in error path disables it */
> -			if (rzg2l_cru_vclk_prepare(cru))
> -				dev_err(cru->dev, "Failed to enable vclk\n");
> -		}
> +		if (!ret || (ret == -ENOIOCTLCMD))
> +			return 0;
>  
>  		s_stream_ret = ret;
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a7d6fe831d54..b16b8af6e8f8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -461,16 +461,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	return 0;
>  }
>  
> -void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru)
> -{
> -	clk_disable_unprepare(cru->vclk);
> -}
> -
> -int rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru)
> -{
> -	return clk_prepare_enable(cru->vclk);
> -}
> -
>  static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>  {
>  	struct media_pipeline *pipe;
> @@ -499,39 +489,24 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
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

Why is this moved to rzg2l_cru_start_streaming_vq() ? At the very least
the commit message should explain it, but it may be best to split it to
a separate patch.

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
> @@ -542,12 +517,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
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
> @@ -646,25 +615,33 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
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
>  	if (ret) {
>  		dev_err(cru->dev, "failed to request irq\n");
> -		goto assert_resets;
> +		goto assert_presetn;
>  	}
>  
>  	/* Allocate scratch buffer. */
> @@ -696,10 +673,18 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
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
> @@ -714,9 +699,11 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
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

