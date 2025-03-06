Return-Path: <linux-media+bounces-27764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D350CA55185
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F764189915E
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACA321ABBA;
	Thu,  6 Mar 2025 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="krhmM5S2"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524A021930B;
	Thu,  6 Mar 2025 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278813; cv=pass; b=kH1NQXvUtMgxNesAqzJvGVXqX++bFfJBNlOikXKkzELo2v/vbMJsAdI+3kvvNo9z3MHJ9c6VAbI7KmnK9FwzXV4RWxw7x2NL6hfBobk2oKDERTxbKRZuekt0z6JkY6mGJIiHI9H+XoChJ49CqJL5J/ANx8Z2e7D7NalGiROVX3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278813; c=relaxed/simple;
	bh=4lgMmgfNgoWC+JNlOHQFpGd5xL6R5LMAkgWVRtpFecM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbklRq9IqaGm59FzjQUL6EKHWdDESg42IKqi/a/lpnAICEb0egu5yNrrEJMnyFLHcuX0ZCN1cYtpudE0h+yuFaGNT46aoRFVJnWYkn46ARUGOEKcyk03Kf2elOjEtq2feQDpLnHcTOARlj7kJa6c/RYVM6OMddZWWQd5SE8rRvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=krhmM5S2; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Z7w2l38DYzyNC;
	Thu,  6 Mar 2025 18:33:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1741278802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU1dvFue8oQTK3aBF6A/gGzFXjSlyHzhzEo8txyLQPU=;
	b=krhmM5S23MXIk6gZMykk21LK/zIPu1rqMfjwHioPy9BIQygmc1k1BDThwP0FfLcyP89/x2
	b0aFigklgjtgVIa1fNkCUJicde2yBf1DPrUOOBQqqXte5R9EjZlHBKPi1F5ciVNfgWhxbZ
	ssajOLoE9KXYCbxfbj6bWyiXmGO4Hx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1741278802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU1dvFue8oQTK3aBF6A/gGzFXjSlyHzhzEo8txyLQPU=;
	b=fUfFyRsoegM4MnO2Zbhp69jDOLRMFOxbStL/SIzzNirCLgtYDC2Sy8jfpZ8B54ZTQdUlJR
	pXr6Xs+W79Q60zh9PeEfKmcl7h8SK60fKiOSpPsehUU/4U2UJW2KPckIIQqkHYlxtbU0cO
	CGF1ln7BGgAW/N7ZLiNa46bQmi7OVJM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1741278802; a=rsa-sha256; cv=none;
	b=h1BTf/HNzJqS0lWKnc3Auqvdnegs18T2wlEKyb/i7YrmPWa1aNKDa8UP8TGJ9Re43CCWJT
	zQ+5EQRJRUtf8ogmnHUdgTKLpObuFstm22EUntSsz+sYXKSYmmPYRz9iwiL0YE2FHGZyPX
	BTX6fQCporPXmRCOrgZwqynpzmSCbcs=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CC6CE634C93;
	Thu,  6 Mar 2025 18:33:18 +0200 (EET)
Date: Thu, 6 Mar 2025 16:33:18 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org, Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305113802.897087-2-mathis.foerst@mt.com>

Hi Mathis,

Thanks for the patch.

On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> The imx-media-csi driver requires upstream camera drivers to implement
> the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> implement this function are not usable on the i.MX6.
> 
> The docs for get_mbus_config [1] say:
> @get_mbus_config: get the media bus configuration of a remote sub-device.
>             The media bus configuration is usually retrieved from the
>             firmware interface at sub-device probe time, immediately
>             applied to the hardware and eventually adjusted by the
>             driver.
> 
> Currently, the imx-media-csi driver is not incorporating the information
> from the firmware interface and therefore relies on the implementation of
> get_mbus_config by the camera driver.
> 
> To be compatible with camera drivers not implementing get_mbus_config
> (which is the usual case), use the bus information from the fw interface:
> 
> The camera does not necessarily has a direct media bus link to the CSI as
> the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> between them on the media pipeline.
> The CSI driver already implements the functionality to find the connected
> camera sub-device to call get_mbus_config on it.
> 
> At this point the driver is modified as follows:
> In the case that get_mbus_config is not implemented by the upstream
> camera, try to get its endpoint configuration from the firmware interface
> usign v4l2_fwnode_endpoint_parse.
> For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> configuration.
> For all other mbus_types, return an error.
> 
> Note that parsing the mbus_config from the fw interface is not done during
> probing because the camera that's connected to the CSI can change based on
> the selected input of the video-mux at runtime.
> 
> [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> [1] include/media/v4l2-subdev.h - line 814
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 3edbc57be2ca..394a9321a10b 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
>  {
>  	struct v4l2_subdev *sd, *remote_sd;
>  	struct media_pad *remote_pad;
> +	struct fwnode_handle *ep_node;
> +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };

Are there any defaults in DT bindings (other than 0's)? Also initialising a
field to zero this way is redundant, just use {}.

>  	int ret;
>  
>  	if (!priv->src_sd)
> @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
>  
>  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
>  			       remote_pad->index, mbus_cfg);
> -	if (ret == -ENOIOCTLCMD)
> -		v4l2_err(&priv->sd,
> -			 "entity %s does not implement get_mbus_config()\n",
> -			 remote_pad->entity->name);
> +	if (ret == -ENOIOCTLCMD) {

	if (!ret)
		return 0;

And you can unindent the rest.

> +		/*
> +		 * If the upstream sd does not implement get_mbus_config,
> +		 * try to parse the link configuration from its fw_node
> +		 */
> +		ep_node = fwnode_graph_get_endpoint_by_id(dev_fwnode(remote_sd->dev),

Always parse only local, not remote endpoints.

Also: instead of supporting get_mbus_config() in a driver, we would ideally
have a helper that optionally uses it and secondarily gets the endpoint
configuration from a local endpoint. It's better to do that once rather
than have every driver do this differently, including a different set of
bugs.

That being said, V4L2 fwnode endpoint parsing is a somewhat driver specific
task and that should remain with the driver. So I'd think the helper should
take a driver-parsed struct v4l2_fwnode_endpoint as an argument, for that
endpoint.

I'm not saying no to this patch though. But in the long run we'll be better
off with a helper in the framework.

> +							  0, 0,
> +							  FWNODE_GRAPH_ENDPOINT_NEXT);
> +		if (!ep_node)
> +			return -ENOTCONN;
> +
> +		ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
> +		fwnode_handle_put(ep_node);
> +		if (ret)
> +			return ret;
>  
> +		mbus_cfg->type = ep.bus_type;
> +		switch (ep.bus_type) {
> +		case V4L2_MBUS_PARALLEL:
> +		case V4L2_MBUS_BT656:
> +			mbus_cfg->bus.parallel = ep.bus.parallel;
> +			break;
> +		case V4L2_MBUS_CSI2_DPHY:
> +			mbus_cfg->bus.mipi_csi2 = ep.bus.mipi_csi2;
> +			break;
> +		default:
> +			v4l2_err(&priv->sd, "Unsupported mbus_type: %i\n",
> +				 ep.bus_type);
> +			return -EINVAL;
> +		}
> +	}
>  	return ret;
>  }
>  

-- 
Kind regards,

Sakari Ailus

