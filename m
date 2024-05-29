Return-Path: <linux-media+bounces-12128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 377788D29A3
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 02:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D0361C213BB
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 00:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44E815A85B;
	Wed, 29 May 2024 00:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WNXx8tjH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0425E15A49F;
	Wed, 29 May 2024 00:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943865; cv=none; b=ah4ciw8MsGxd1T5jBEyBGTtESG+zww50SVK7qxErYFwgS9tegUdmgonANzwpx+El85i6OabrqOtK/D8uefl5kw45KeMSgSgLu3ugvjFuocfERVDjEIqHaOCCbH4PwTMOtZ9dVuuCtYagRLaLA9i4FiAaYsRfV1cr7IVkXaWuwAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943865; c=relaxed/simple;
	bh=oxzWo4SwjbvRFOKddJfB0DznWCKdAbbtpmERDpFGBp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOYtAWGjJWTOyTfGL9MhsMEMOOaEVqpWogKv4eZIm/KKCSU5qdOnD8z4pk/bbfI/lOkuB7ZrU/YCAl7rLFSr2lbNzGri2jTEwrgBgUz5wOW8HbXxUiRnGH6z1CEGPkGQT4QAP1SmsIhlBTsG9wsVDSGs6EnyOrrgh4/FIalD9QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WNXx8tjH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 701329CA;
	Wed, 29 May 2024 02:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716943859;
	bh=oxzWo4SwjbvRFOKddJfB0DznWCKdAbbtpmERDpFGBp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNXx8tjHJiTvI90Zi+rECjUBV1Q5P7JLat8G4UEa7lmoVEr+9ejlSy3FP6Fmx54FY
	 oHpWXvobf6uQReZujdjLiV8DJlomhT5cSguEth2Ktirk/wdNAJvqzNFuwV4xn0OWhM
	 zB6mkdDREFYU1EdyRK/vbOQL1zy3ebpwXzI7eFO4=
Date: Wed, 29 May 2024 03:50:50 +0300
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
Subject: Re: [PATCH v2 resend 6/8] staging: media: atmel: use
 for_each_endpoint_of_node()
Message-ID: <20240529005050.GF1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87a5k94hkp.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a5k94hkp.wl-kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:51PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 6 +-----
>  drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 6 +-----
>  2 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> index 31b2b48085c59..cbfbec0c6cb57 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
> @@ -340,13 +340,9 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  
>  	INIT_LIST_HEAD(&isc->subdev_entities);
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {

I think epn doesn't have to be initialized to NULL anymore. Same below.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> -
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> index 020034f631f57..7c477b1d3c484 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
> @@ -326,13 +326,9 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
>  
>  	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
>  
> -	while (1) {
> +	for_each_endpoint_of_node(np, epn) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> -		if (!epn)
> -			return 0;
> -
>  		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
>  						 &v4l2_epn);
>  		if (ret) {

-- 
Regards,

Laurent Pinchart

