Return-Path: <linux-media+bounces-12125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 786428D298C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 02:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEEF3B250CC
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 00:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D956D15A4B5;
	Wed, 29 May 2024 00:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JSMnw6Vn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81AF15A489;
	Wed, 29 May 2024 00:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943385; cv=none; b=Hd57zZrJ+0G84ynnoM+L6dbU35r/lxPA0QPxP0nHX29VxJevW/c/jA3DD5G+oeOI7jFJuzYD26VbQf1BMidd8uW3edmgZu6IZIHG1E8vlpHDERQCq+BXUUoIP0c9NS9rBdSMvRLggdAH6qqxfOr/q/gNZGfjW2oiGlcbJxVUAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943385; c=relaxed/simple;
	bh=WRQmk2bmrtgVScrWpDc5GmDMyi9WKStNv5pUGwSRIXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTnU00JYL78O+9NJqp5GEdHqcZMCaPjMOi18P17G0VqpYL4yoyhr0X9bv9ZV/Vohs39St9ScdWeQ/y0jXUwthTO6dOGD7u2t/EFoOQk5CMM9wSbOQQxDhXN1x8kwBp3N2AXs1g6siRYBteKAYETzvHuRTUalNvCu3oPsq+8C1N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JSMnw6Vn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 610799CA;
	Wed, 29 May 2024 02:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716943378;
	bh=WRQmk2bmrtgVScrWpDc5GmDMyi9WKStNv5pUGwSRIXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSMnw6Vnu2Hia2/lDQYZ7abQinPotiFgt/lqod2BqX7NVv/gTHRbc1IWBwqiF5acw
	 qJxLJ5uBMCJKSOYKWgx+KRTxPPmaJf24C8qo27+DvhqfBZvi9p4IAT4BD47X926agq
	 WRh64JO0cMOhJueK81uMiwsMlosmqJ3OEV948624=
Date: Wed, 29 May 2024 03:42:49 +0300
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
Subject: Re: [PATCH v2 resend 3/8] media: platform: microchip: use
 for_each_endpoint_of_node()
Message-ID: <20240529004249.GC1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87ed9l4hl2.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ed9l4hl2.wl-kuninori.morimoto.gx@renesas.com>

Hello Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:37PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../microchip/microchip-sama5d2-isc.c         | 19 +++++++------------
>  .../microchip/microchip-sama7g5-isc.c         | 19 +++++++------------
>  2 files changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> index 5ac149cf3647f..d9298771f5097 100644
> --- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> @@ -356,30 +356,26 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  	struct device_node *epn = NULL;

There's no need anymore to initialize epn to NULL. Same in
microchip-sama7g5-isc.c. With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	struct isc_subdev_entity *subdev_entity;
>  	unsigned int flags;
> -	int ret;
>  
>  	INIT_LIST_HEAD(&isc->subdev_entities);
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
> -
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> +		int ret;
>  
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {
> -			ret = -EINVAL;
> +			of_node_put(epn);
>  			dev_err(dev, "Could not parse the endpoint\n");
> -			break;
> +			return -EINVAL;
>  		}
>  
>  		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
>  					     GFP_KERNEL);
>  		if (!subdev_entity) {
> -			ret = -ENOMEM;
> -			break;
> +			of_node_put(epn);
> +			return -ENOMEM;
>  		}
>  		subdev_entity->epn = epn;
>  
> @@ -400,9 +396,8 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  
>  		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
>  	}
> -	of_node_put(epn);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int microchip_isc_probe(struct platform_device *pdev)
> diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> index 73445f33d26ba..36204fee10aa2 100644
> --- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> @@ -339,33 +339,29 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
>  	struct device_node *epn = NULL;
>  	struct isc_subdev_entity *subdev_entity;
>  	unsigned int flags;
> -	int ret;
>  	bool mipi_mode;
>  
>  	INIT_LIST_HEAD(&isc->subdev_entities);
>  
>  	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
> -
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> +		int ret;
>  
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {
> -			ret = -EINVAL;
> +			of_node_put(epn);
>  			dev_err(dev, "Could not parse the endpoint\n");
> -			break;
> +			return -EINVAL;
>  		}
>  
>  		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
>  					     GFP_KERNEL);
>  		if (!subdev_entity) {
> -			ret = -ENOMEM;
> -			break;
> +			of_node_put(epn);
> +			return -ENOMEM;
>  		}
>  		subdev_entity->epn = epn;
>  
> @@ -389,9 +385,8 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
>  
>  		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
>  	}
> -	of_node_put(epn);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int microchip_xisc_probe(struct platform_device *pdev)

-- 
Regards,

Laurent Pinchart

