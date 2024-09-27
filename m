Return-Path: <linux-media+bounces-18716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C361988C88
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 00:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54EEA28353C
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 22:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4436B1B4C26;
	Fri, 27 Sep 2024 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PirvY3K3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27907183CB6;
	Fri, 27 Sep 2024 22:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727476894; cv=none; b=pXUUTpA5qSaQ23YfcClMGFXAdbdMYb2Y/WfPDmOGg695RQgidj1lQ7D0CH/3Qq7M4+pf/6POIj3K4u0ALFg/qbt7EGOXzyQbML2eh0inAVEJSsFYB20BP0tDu2OAUpkxdMf1R5XNVvCupJswRnv0Zf7a8QTj8c9YDPocsUep2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727476894; c=relaxed/simple;
	bh=3QuSDwf5vQFjk9R7fG2khFOxXjWuN+uTJF8657r6494=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUAUcDsIlIslE4LpaIusxTOEVL8ZObwE1XRXUd8GcDjlXcM73c4QbTzlo5HbxS5aBzhG5y8ZJMa/cFsoFGqvj69XsIAvN4u8VnOFqnNWIwe85BOTlvtHFb5UG6mTFozr/YTnyiO4bEzEIriN/YZsEMCFl+gtG0r86Y55ZbRhfRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PirvY3K3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A62056DE;
	Sat, 28 Sep 2024 00:40:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727476801;
	bh=3QuSDwf5vQFjk9R7fG2khFOxXjWuN+uTJF8657r6494=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PirvY3K3/Oo17cr1FE16ZNHJz7LjlL9P8HoIENURP1HMirQr0Dsewxx/k423AA+s3
	 Y+wxwKy1xYyq9mkwhl0n4yw1bI2EGht6qHNzeX0QlnAPePz12Jqij9+Z+BxY3r9J+9
	 a9gJEfGCc+7Pm3E2+s/9xzkV0cWD9YFXId3ywGCU=
Date: Sat, 28 Sep 2024 01:41:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 07/16] media: platform: rzg2l-cru: Remove `channel`
 member from `struct rzg2l_cru_csi`
Message-ID: <20240927224127.GG12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-8-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:48PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Remove the CSI virtual channel number from `struct rzg2l_cru_csi`.
> Instead, pass the CSI virtual channel number as an argument to
> `rzg2l_cru_csi2_setup()`.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 -
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 -
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 69cd45b26951..b21a66e2ce5c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -72,7 +72,6 @@ static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
>  			source->name, sink->name);
>  		return ret;
>  	}
> -	cru->csi.channel = 0;
>  	cru->ip.remote = cru->csi.subdev;
>  
>  	/* Create media device link between CRU IP <-> CRU OUTPUT */
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 8fbd45c43763..4fe24bdde5b2 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -53,7 +53,6 @@ enum rzg2l_cru_dma_state {
>  struct rzg2l_cru_csi {
>  	struct v4l2_async_connection *asd;
>  	struct v4l2_subdev *subdev;
> -	u32 channel;
>  };
>  
>  struct rzg2l_cru_ip {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 7cd33eb1939c..9ab7ef33c9da 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -301,7 +301,7 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  }
>  
>  static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
> -				 struct v4l2_mbus_framefmt *ip_sd_fmt)
> +				 struct v4l2_mbus_framefmt *ip_sd_fmt, u8 csi_vc)
>  {
>  	u32 icnmc;
>  
> @@ -319,19 +319,20 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
>  	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
>  
>  	/* Set virtual channel CSI2 */
> -	icnmc |= ICnMC_VCSEL(cru->csi.channel);
> +	icnmc |= ICnMC_VCSEL(csi_vc);
>  
>  	rzg2l_cru_write(cru, ICnMC, icnmc);
>  }
>  
>  static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
> -					   struct v4l2_mbus_framefmt *ip_sd_fmt)
> +					   struct v4l2_mbus_framefmt *ip_sd_fmt,
> +					   u8 csi_vc)
>  {
>  	bool output_is_yuv = false;
>  	bool input_is_yuv = false;
>  	u32 icndmr;
>  
> -	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt);
> +	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
>  
>  	/* Output format */
>  	switch (cru->format.pixelformat) {
> @@ -466,12 +467,13 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
>  	unsigned long flags;
> +	u8 csi_vc;
>  	int ret;
>  
>  	ret = rzg2l_cru_get_virtual_channel(cru);
>  	if (ret < 0)
>  		return ret;
> -	cru->csi.channel = ret;
> +	csi_vc = ret;
>  
>  	spin_lock_irqsave(&cru->qlock, flags);
>  
> @@ -489,7 +491,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_initialize_axi(cru);
>  
>  	/* Initialize image convert */
> -	ret = rzg2l_cru_initialize_image_conv(cru, fmt);
> +	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
>  	if (ret) {
>  		spin_unlock_irqrestore(&cru->qlock, flags);
>  		return ret;

-- 
Regards,

Laurent Pinchart

