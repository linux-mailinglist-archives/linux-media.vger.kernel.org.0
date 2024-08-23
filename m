Return-Path: <linux-media+bounces-16669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D395D181
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 17:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 032ED283077
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E15A188A2D;
	Fri, 23 Aug 2024 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V/+Q+HiF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F518892E;
	Fri, 23 Aug 2024 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427339; cv=none; b=flhtAHsbvIRVg540Lab0xj/V7FyMsW/mYJ0qpahhsHo1N9jQXyupLf12j7oVKjDiw8BcLDGE4TTACt+ghBf19sIpXzekeBuPANGWiGA2NAa/Eh+imXJPB2MJpA9Fz/0ktaXFLbhFY6RRiQoDz4IWYqE5ThbAWyQAHhWeokjk85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427339; c=relaxed/simple;
	bh=Oz4OozUWgYGHt6sdQr0sb6EVEAAUbITyTDQwZmFG0+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upAzkfQI784sdyvvE6Gyh9UYdgsKuO4KEQ5GqOxzyJ9qWdjP2SMyQq0PWdbgO2fxYyDTdhCs2yPwBadUI5zsdZfEMrOp9m0enCREHmNbJEE1iWo/fXzsd/iMKtxXIr1NGrnV/EUZ6xGgilyp2mX+B4M2JAN9JfDtjoAeQQEI9pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V/+Q+HiF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E96472D5;
	Fri, 23 Aug 2024 17:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724427272;
	bh=Oz4OozUWgYGHt6sdQr0sb6EVEAAUbITyTDQwZmFG0+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/+Q+HiFG/XgdE8d45ufumUJlPfMV64RauieuM6csAkXyzyij+KRZBpsFO1+zeo9g
	 oGMjiCYLQlTwrQ5qtbHzyKfhsqtO5oW6VsNA4Mxj5DUJFymIeQisGBQmrkyVgb4rub
	 RJvAxRdCOjRT0pxLrVwrAm8kohmSWe4q9j/8M4d8=
Date: Fri, 23 Aug 2024 18:35:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Message-ID: <20240823153533.GQ26098@pendragon.ideasonboard.com>
References: <20240605175010.405638-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240605175010.405638-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Wed, Jun 05, 2024 at 06:50:10PM +0100, Biju Das wrote:
> Move request_irq() to probe(), in order to avoid requesting IRQ during
> device start which happens frequently. As this function is in probe(), it
> is better to replace it with its devm variant for managing the resource
> efficiently.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit header and description.
>  * Moved rzg2l_cru_irq from rzg2l-video.c->rzg2l-core.c and introduced
>    rzg2l_cru_process_irq() in video.c to process irq.
>  * Dropped image_conv_irq from struct rzg2l_cru_dev
>  * Replaced request_irq with its devm variant.
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 20 +++++++++++++++----
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 +----
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 18 +++--------------
>  3 files changed, 20 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 280efd2a8185..b80e5960b88b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -239,10 +239,17 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
>  	return 0;
>  }
>  
> +static irqreturn_t rzg2l_cru_irq(int irq, void *data)
> +{
> +	struct rzg2l_cru_dev *cru = data;
> +
> +	return IRQ_RETVAL(rzg2l_cru_process_irq(cru));
> +}
> +

Is there a neew to introduce this intermediate wrapper function ? Can't
the existing rzg2l_cru_irq() function from rzg2l-video.c be used, just
dropping the static keyword ? With that fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  static int rzg2l_cru_probe(struct platform_device *pdev)
>  {
>  	struct rzg2l_cru_dev *cru;
> -	int ret;
> +	int irq, ret;
>  
>  	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
>  	if (!cru)
> @@ -270,9 +277,14 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  	cru->dev = &pdev->dev;
>  	cru->info = of_device_get_match_data(&pdev->dev);
>  
> -	cru->image_conv_irq = platform_get_irq(pdev, 0);
> -	if (cru->image_conv_irq < 0)
> -		return cru->image_conv_irq;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, IRQF_SHARED,
> +			       KBUILD_MODNAME, cru);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
>  
>  	platform_set_drvdata(pdev, cru);
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index a5a99b004322..72405e632aca 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -68,8 +68,6 @@ struct rzg2l_cru_ip {
>   *
>   * @vclk:		CRU Main clock
>   *
> - * @image_conv_irq:	Holds image conversion interrupt number
> - *
>   * @vdev:		V4L2 video device associated with CRU
>   * @v4l2_dev:		V4L2 device
>   * @num_buf:		Holds the current number of buffers enabled
> @@ -105,8 +103,6 @@ struct rzg2l_cru_dev {
>  
>  	struct clk *vclk;
>  
> -	int image_conv_irq;
> -
>  	struct video_device vdev;
>  	struct v4l2_device v4l2_dev;
>  	u8 num_buf;
> @@ -141,6 +137,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
>  
>  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
> +unsigned int rzg2l_cru_process_irq(struct rzg2l_cru_dev *cru);
>  
>  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index b16b8af6e8f8..1512844fecb0 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -527,9 +527,8 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_set_stream(cru, 0);
>  }
>  
> -static irqreturn_t rzg2l_cru_irq(int irq, void *data)
> +unsigned int rzg2l_cru_process_irq(struct rzg2l_cru_dev *cru)
>  {
> -	struct rzg2l_cru_dev *cru = data;
>  	unsigned int handled = 0;
>  	unsigned long flags;
>  	u32 irq_status;
> @@ -607,7 +606,7 @@ static irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  done:
>  	spin_unlock_irqrestore(&cru->qlock, flags);
>  
> -	return IRQ_RETVAL(handled);
> +	return handled;
>  }
>  
>  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
> @@ -637,13 +636,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto assert_aresetn;
>  	}
>  
> -	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
> -			  IRQF_SHARED, KBUILD_MODNAME, cru);
> -	if (ret) {
> -		dev_err(cru->dev, "failed to request irq\n");
> -		goto assert_presetn;
> -	}
> -
>  	/* Allocate scratch buffer. */
>  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>  					  &cru->scratch_phys, GFP_KERNEL);
> @@ -651,7 +643,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
>  		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
>  		ret = -ENOMEM;
> -		goto free_image_conv_irq;
> +		goto assert_presetn;
>  	}
>  
>  	cru->sequence = 0;
> @@ -670,9 +662,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  	if (ret)
>  		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
>  				  cru->scratch_phys);
> -free_image_conv_irq:
> -	free_irq(cru->image_conv_irq, cru);
> -
>  assert_presetn:
>  	reset_control_assert(cru->presetn);
>  
> @@ -698,7 +687,6 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
>  	dma_free_coherent(cru->dev, cru->format.sizeimage,
>  			  cru->scratch, cru->scratch_phys);
>  
> -	free_irq(cru->image_conv_irq, cru);
>  	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
>  
>  	reset_control_assert(cru->presetn);

-- 
Regards,

Laurent Pinchart

