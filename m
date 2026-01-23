Return-Path: <linux-media+bounces-51368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO36BkG6cmmtowAAu9opvQ
	(envelope-from <linux-media+bounces-51368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 01:01:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595D6EA2C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 01:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD4A630120D1
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 00:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1791C28E;
	Fri, 23 Jan 2026 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vI5FuHED"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1F17C203;
	Fri, 23 Jan 2026 00:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769126458; cv=none; b=D5uUeMkk9EHRPlOSGEPPlkPuzYuqgD7SdKHkCNqlrSYV16UEsWxjysSCgKjmKxlm7dClmhTiufY+Il2SjzEyj5thVutUmiqgblVnphie5KO3EkM06CTHskQNAVlHamC2MZsK/eMB989Ne5VXhiH4JxNqNgt4wlVy4PXlTF0zy7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769126458; c=relaxed/simple;
	bh=m5cqibSmGWvJs1iTmsUdJGmNIvWdxJWw6DAZhp/XEtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qddWeTfk2BXIM2OUEIPqc3rsO1TAmJweQ4xQbDe0WtPbm+96QZI/L+duqS/8CjPsQj38+fLLXXnLDIErhTzy8dX1ZzaYN4ABRwbQM7Ln3vLgZISmv6outccUdAriGRSzb2zly//YYiwdwGPOPrPiQBgZi8kSStnBIbNaw5RwYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vI5FuHED; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1736B14C7;
	Fri, 23 Jan 2026 01:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769126416;
	bh=m5cqibSmGWvJs1iTmsUdJGmNIvWdxJWw6DAZhp/XEtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vI5FuHEDtyvsGR7I+74xw3BEghRy9D0pz3wBqB8fgVcNWpS5dSzFj35THsAmPnHi+
	 cmMdlBN/d80XEDgOc+mp9Pykg1JH+yXEJydkugCjTzRq7h718rhbJAM9QiFKXTxWxJ
	 dirV0g+CyT+AbI4lMach4Y+q7c9hgGYL+l3L2VPw=
Date: Fri, 23 Jan 2026 02:00:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] media: nxp: Add dev_err_probe() to all error paths in
 *async_register() helpers
Message-ID: <20260123000047.GG215800@killaraus>
References: <20260121-cam_cleanup-v5-1-01d1ab38db9d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121-cam_cleanup-v5-1-01d1ab38db9d@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51368-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,posteo.de,puri.sm,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.957];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8595D6EA2C
X-Rspamd-Action: no action

Hi Frank,

Thank you for the patch.

On Wed, Jan 21, 2026 at 03:42:03PM -0500, Frank Li wrote:
> Add dev_err_probe() to all error branches in the *async_register() helpers
> to provide clearer diagnostic information when device registration fails.
> 
> Drop the explicit error message after returning from
> mipi_csis_async_register(), as the error is already reported by this
> helper.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Some trivial patch to reduce goto at probe functions.
> ---
> Changes in v5:
> - rebase to https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20260120
> - Link to v4: https://lore.kernel.org/r/20260116-cam_cleanup-v4-0-29ce01640443@nxp.com
> 
> Changes in v4:
> - collect alex's review tag
> - fix grammer in error message
> - Link to v3: https://lore.kernel.org/r/20251215-cam_cleanup-v3-0-a61995068f38@nxp.com
> 
> Changes in v3:
> - rebase to v6.19-rc1
> - avoid use __free() == NULL according to cleanup.h
> - Link to v2: https://lore.kernel.org/r/20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com
> 
> Changes in v2:
> - add new patch media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
> - detail change see each patch's change log.
> - Link to v1: https://lore.kernel.org/r/20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com
> ---
> Change in v5
> - remove "no functional change" in commit message
> - fix error message.
> 
> change in v2
> - new patch
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c    | 31 ++++++++++++++++-----------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 27 ++++++++++++++---------
>  2 files changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9..06ea96b8eaf61058d6979b7be747496480c4bc69 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1359,18 +1359,18 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
>  						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
> -		return -ENOTCONN;
> +		return dev_err_probe(csis->dev, -ENOTCONN,
> +				     "failed to get local endpoint\n");
>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(csis->dev, ret,
> +				     "failed to parse endpoint\n");
>  
>  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> -			dev_err(csis->dev,
> -				"data lanes reordering is not supported");
> -			return -EINVAL;
> -		}
> +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> +			return dev_err_probe(csis->dev, -EINVAL,
> +					     "data lanes reordering is not supported\n");
>  	}
>  
>  	csis->bus = vep.bus.mipi_csi2;
> @@ -1382,15 +1382,22 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
>  					      struct v4l2_async_connection);
>  	if (IS_ERR(asd))
> -		return PTR_ERR(asd);
> +		return dev_err_probe(csis->dev, PTR_ERR(asd),
> +				     "failed to add remote fnnode to notifier\n");

s/fnnode/fwnode/

>  
>  	csis->notifier.ops = &mipi_csis_notify_ops;
>  
>  	ret = v4l2_async_nf_register(&csis->notifier);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(csis->dev, ret,
> +				     "failed to register notifier\n");
>  
> -	return v4l2_async_register_subdev(&csis->sd);
> +	ret = v4l2_async_register_subdev(&csis->sd);
> +	if (ret)
> +		return dev_err_probe(csis->dev, ret,
> +				     "failed to register subdev\n");
> +
> +	return 0;
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -1549,10 +1556,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, &csis->sd);
>  
>  	ret = mipi_csis_async_register(csis);
> -	if (ret < 0) {
> -		dev_err(dev, "async register failed: %d\n", ret);
> +	if (ret < 0)
>  		goto err_cleanup;
> -	}
>  
>  	/* Initialize debugfs. */
>  	mipi_csis_debugfs_init(csis);
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 9d946b68cf59d9f4fb3413fc90219efd380d9d95..8304b3d3a338394d6325929d28aa69d865ac8a92 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -727,18 +727,18 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
>  						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
> -		return -ENOTCONN;
> +		return dev_err_probe(state->dev, -ENOTCONN,
> +				     "failed to get remote endpoint fwnode\n");

s/remote/local/

>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(state->dev, ret,
> +				     "failed to parse endpoint fwnode\n");

s/ fwnode//

to match the message above.

With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll apply the changes locally, no need to submit a v6.

>  
>  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> -			dev_err(state->dev,
> -				"data lanes reordering is not supported");
> -			return -EINVAL;
> -		}
> +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> +			return dev_err_probe(state->dev, -EINVAL,
> +					     "data lanes reordering is not supported");
>  	}
>  
>  	state->bus = vep.bus.mipi_csi2;
> @@ -750,15 +750,22 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
>  					      struct v4l2_async_connection);
>  	if (IS_ERR(asd))
> -		return PTR_ERR(asd);
> +		return dev_err_probe(state->dev, PTR_ERR(asd),
> +				     "failed to add fwnode to notifier\n");
>  
>  	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
>  
>  	ret = v4l2_async_nf_register(&state->notifier);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(state->dev, ret,
> +				     "failed to register notifier\n");
>  
> -	return v4l2_async_register_subdev(&state->sd);
> +	ret = v4l2_async_register_subdev(&state->sd);
> +	if (ret)
> +		return dev_err_probe(state->dev, ret,
> +				     "failed to register subdev\n");
> +
> +	return 0;
>  }
>  
>  /* -----------------------------------------------------------------------------
> 
> ---
> base-commit: b7af7c950e1076a9e3d855045571be2de4ce9f2c
> change-id: 20250807-cam_cleanup-b6d90ba9dac3

-- 
Regards,

Laurent Pinchart

