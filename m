Return-Path: <linux-media+bounces-12130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CD28D29A9
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 02:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85233288466
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 00:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CFF15A84E;
	Wed, 29 May 2024 00:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SLi6d67P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8AC1E4A1;
	Wed, 29 May 2024 00:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943973; cv=none; b=pqFap9M6C2UvCtb52qpubRaiGGFiX0f3tUC+HXuHPDB+CJdz7qLuOTKQOtoWRsRkwLzwYMYS6drrIdfzlXZzObPHtrtUaui6Wya2sCMHLhY0LcItWJyscO/VLtg/BabYg9ARRyTXAIwC9c4LnPa2N0Jry3LX7hB4C+0gYC7KBTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943973; c=relaxed/simple;
	bh=1q+t0/VxxVLsjDI0GbCm3LqcOzQUbDeFhtPcR4Xj4hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoU4KemROAr0vllEnmzHunYSl27zUFjzDvQuxwUcBWTzvYYx1hiA6o8kqZpJfOhBdLqCHsLKzq1Hfdd3jxuXP6L62+KMcfGORIIzFfMxWPOnuYxJKwTVWjpIxCpiJqFl7BESIdq+O5kZIxwAkkkEPXJTJK/lqxRxE272TwmSze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SLi6d67P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28ECA9CA;
	Wed, 29 May 2024 02:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716943968;
	bh=1q+t0/VxxVLsjDI0GbCm3LqcOzQUbDeFhtPcR4Xj4hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SLi6d67PaQcDxO1ehYHD27ul03jDSkQfe+aeYaHbmw+zBrIbFAbDeraihzTh3VqUx
	 BQgdc7XK1n2LXjwZ5XW0ipdDqf2A9llXm7kMLsUW9sHjx+zCJAptRjt56EdoBykfU4
	 IQytp29wMllcifqLKAMkh2TLYfPeXR8NHnO3BbTc=
Date: Wed, 29 May 2024 03:52:39 +0300
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
Subject: Re: [PATCH v2 resend 8/8] fbdev: omapfb: use
 of_graph_get_remote_port()
Message-ID: <20240529005239.GH1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <877cfd4hkg.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877cfd4hkg.wl-kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:59PM +0000, Kuninori Morimoto wrote:
> We already have of_graph_get_remote_port(), Let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> index 14965a3fd05b7..4040e247e026e 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
>  	return reg;
>  }
>  
> -static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
> -{
> -	struct device_node *np;
> -
> -	np = of_graph_get_remote_endpoint(node);
> -	if (!np)
> -		return NULL;
> -
> -	np = of_get_next_parent(np);
> -
> -	return np;
> -}
> -
>  struct omap_dss_device *
>  omapdss_of_find_source_for_first_ep(struct device_node *node)
>  {
> @@ -141,7 +128,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
>  	if (!ep)
>  		return ERR_PTR(-EINVAL);
>  
> -	src_port = omapdss_of_get_remote_port(ep);
> +	src_port = of_graph_get_remote_port(ep);
>  	if (!src_port) {
>  		of_node_put(ep);
>  		return ERR_PTR(-EINVAL);

-- 
Regards,

Laurent Pinchart

