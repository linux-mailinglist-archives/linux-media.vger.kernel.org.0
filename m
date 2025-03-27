Return-Path: <linux-media+bounces-28883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10DA73F22
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA4B173601
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 19:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CDF1C5F1F;
	Thu, 27 Mar 2025 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="btDuSomF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C1418AE2;
	Thu, 27 Mar 2025 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105346; cv=none; b=Vm+N4DE3Y74HFmvHHuershawoqX/spLiNSIZce9hdu1nOQ4L5PXbSLv2KaaJ8PEFkROeJqcGqY2YA1/Wj+2BxXS6QWC+gp7R/0oubS5to75rvWYDOVgKrdHQWliaH1u1OqAqT7xEKxexDFk8N0jUhZJyncWe8BhcsitAoBHhTks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105346; c=relaxed/simple;
	bh=2WNWM9kf9hPjB2M8fdeez0uvpVDEQQZTBElzx+pQr2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj1pH6YOYmKXYQofp4gGTja4GsOgzt2fa/Z/riISabjFzBtJlaBf2LPHuzhcdzLWrSba1kKhtBMV5XdUi4sN7Xd06cth8HE/H1hGpNgyuZfe/jI+PnRmMtwP6WElI1jWRRQPKlgUrknoTzjxuMEiELvUi7qaZib7kiD3w7EzeJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=btDuSomF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85C1F446;
	Thu, 27 Mar 2025 20:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743105234;
	bh=2WNWM9kf9hPjB2M8fdeez0uvpVDEQQZTBElzx+pQr2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btDuSomFB2B+2MnMXMOVOR1LJ4pat4LuKmecXbaVDZxhFE3Zr5pFZYj0f/M21ze8P
	 R3K7Z9ek9b7+qKS+V0iA4qz0LXIrSD96M/RISaKnyBPndmJedXF/DOXr6qj9q5lSOF
	 tmG8NM80yzbsNJraioK9EE/NuUaEWaVZw/6Oe2Ys=
Date: Thu, 27 Mar 2025 21:55:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 04/12] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
Message-ID: <20250327195520.GH4861@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:23PM -0500, Frank Li wrote:
> Allow num_sources (drvdata: num_channels) to be greater than num_sink
> (drvdata: num_ports + 1).
> 
> ISI support stream multiplexing, such as differentiates multiple cameras
> from a single 2-lane MIPI input, or duplicates input stream into multiple
> outputs. So num_channels may be greater than num_ports at some platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v3
> - none
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 93a55c97cd173..ba5b2d3617a23 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
>  	 * Create a 1:1 mapping between pixel link inputs and outputs to
>  	 * pipelines by default.
>  	 */

Move

	routing.num_routes = xbar->num_sinks - 1;

here, and use routing.num_routes below to replace xbar->num_sinks - 1.

This assumes that there will always be as many or more pipelines than
pixel links. It's true for all the currently supported SoCs and the ones
you add in this series, but maybe we could make it safer with

	routing.num_routes = min(xbar->num_sinks - 1, xbar->num_sources);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -	routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
> +	routes = kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERNEL);
>  	if (!routes)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < xbar->num_sources; ++i) {
> +	for (i = 0; i < xbar->num_sinks - 1; ++i) {
>  		struct v4l2_subdev_route *route = &routes[i];
>  
>  		route->sink_pad = i;
> @@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
>  		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>  	}
>  
> -	routing.num_routes = xbar->num_sources;
> +	routing.num_routes = xbar->num_sinks - 1;
>  	routing.routes = routes;
>  
>  	ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
> @@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>  	 * the memory input.
>  	 */
>  	xbar->num_sinks = isi->pdata->num_ports + 1;
> -	xbar->num_sources = isi->pdata->num_ports;
> +	xbar->num_sources = isi->pdata->num_channels;
>  	num_pads = xbar->num_sinks + xbar->num_sources;
>  
>  	xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);

-- 
Regards,

Laurent Pinchart

