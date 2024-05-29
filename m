Return-Path: <linux-media+bounces-12126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE98D2994
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 02:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BC791C240EA
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 00:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3F215A4B3;
	Wed, 29 May 2024 00:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mVerHYnh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFBE1F176;
	Wed, 29 May 2024 00:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943682; cv=none; b=N1/CM/jQfYK9sFGrI34KEdaNbomJ/sP5p4xD4cjDrNGI/GdHPEWQ12AVsSlkd6EiqPCKccLGGw2z2Qrdiz5WQJwVXLIDd0n6aHO6OOaRVvF4RBXamNivQIeY7GkFGQ62ZWwS8C8eIvCupFx3NcGoGpHbYD+lscFjvGkiXZJkHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943682; c=relaxed/simple;
	bh=yNW3rG6pZ4UL9Ggbp80ChOyff9I5y5PiTC7mr1zcTF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIbOwZcI0ueC/laxC1netPzQCaQvceUV8l43lzkTQeRJHb0cacloiNISGNak+SphS7C38fnP+V1XQFgy53YmyuP4sSjAVt2oImRP56y2QMMc8z0fRkUZ3n0+4ev9nb+xKju9TgJftPxhhkmwUwmLjIzDySfW2npZZlKXoSfhnfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mVerHYnh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BD489CA;
	Wed, 29 May 2024 02:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716943675;
	bh=yNW3rG6pZ4UL9Ggbp80ChOyff9I5y5PiTC7mr1zcTF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVerHYnhPHx9r33n0Y6mi4ZsEFcEjZxG0fPinytbQgXe7ziqo2Oh3i/ZkPn8dkdTM
	 KfbBQP98Q9F2BafkrE0C92FvVqKAkTr8bSyr9uyTvEVpkFTwmILnR+nkbSyAGbVBr0
	 GH1SCrTNVi506VZMGPHKg0Jq9g5u9DXgwuydSfjw=
Date: Wed, 29 May 2024 03:47:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 4/8] media: platform: ti: use
 for_each_endpoint_of_node()
Message-ID: <20240529004746.GD1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87cyp54hky.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cyp54hky.wl-kuninori.morimoto.gx@renesas.com>

Hello Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:42PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
>  drivers/media/platform/ti/davinci/vpif_capture.c | 12 ++++++------
>  2 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 77e12457d1495..009ff68a2b43c 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2287,7 +2287,7 @@ static const struct v4l2_async_notifier_operations vpfe_async_ops = {
>  static struct vpfe_config *
>  vpfe_get_pdata(struct vpfe_device *vpfe)
>  {
> -	struct device_node *endpoint = NULL;
> +	struct device_node *endpoint;
>  	struct device *dev = vpfe->pdev;
>  	struct vpfe_subdev_info *sdinfo;
>  	struct vpfe_config *pdata;
> @@ -2306,14 +2306,11 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  	if (!pdata)
>  		return NULL;
>  
> -	for (i = 0; ; i++) {
> +	i = 0;
> +	for_each_endpoint_of_node(dev->of_node, endpoint) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		struct device_node *rem;
>  
> -		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
> -		if (!endpoint)
> -			break;
> -
>  		sdinfo = &pdata->sub_devs[i];
>  		sdinfo->grp_id = 0;
>  
> @@ -2371,9 +2368,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  		of_node_put(rem);
>  		if (IS_ERR(pdata->asd[i]))
>  			goto cleanup;
> +
> +		i++;
>  	}
>  
> -	of_node_put(endpoint);
>  	return pdata;
>  
>  cleanup:
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> index c28794b6677b7..078ae11cd0787 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -1517,16 +1517,12 @@ vpif_capture_get_pdata(struct platform_device *pdev,
>  	if (!pdata->subdev_info)
>  		return NULL;
>  
> -	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
> +	i = 0;
> +	for_each_endpoint_of_node(pdev->dev.of_node, endpoint) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		unsigned int flags;
>  		int err;
>  
> -		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
> -						      endpoint);
> -		if (!endpoint)
> -			break;
> -
>  		rem = of_graph_get_remote_port_parent(endpoint);
>  		if (!rem) {
>  			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
> @@ -1577,6 +1573,10 @@ vpif_capture_get_pdata(struct platform_device *pdev,
>  			goto err_cleanup;
>  
>  		of_node_put(rem);
> +
> +		i++;
> +		if (i >= VPIF_CAPTURE_NUM_CHANNELS)
> +			break;
>  	}
>  
>  done:

-- 
Regards,

Laurent Pinchart

