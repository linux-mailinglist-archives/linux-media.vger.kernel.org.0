Return-Path: <linux-media+bounces-51174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ASMLU0xcGkSXAAAu9opvQ
	(envelope-from <linux-media+bounces-51174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:52:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DCA4F5FD
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 639EA40B700
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 01:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D174631ED64;
	Wed, 21 Jan 2026 01:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vm1fklwy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E8320A06;
	Wed, 21 Jan 2026 01:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768960296; cv=none; b=nQtMjrEFh9vO3puQ+BSamoSTeO7VwCXxzGAPIhz+Qs7pQCa3g2kZ2KfB91pYVON/yzIuCYTdDhSkZri/K4fdWFuYkjKonWWGALMAKUCJDEb+SEK53mPaH4nWvjIr+WLOnYdGReOoCxw8md/uPayP5WZHc+uLWgzr8FSmUss3jrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768960296; c=relaxed/simple;
	bh=uu0TV3T46JBjmZ/Z1O6mRrRy6UkFsA3BqZKe+FAucfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp7vCbsL63ejNkruZHFjhkrzvCHGSAwbMzk3QH1HPFyjdaHD0N3zX6XWvpKStY59/yV2W/75Ay3OqmOoTLOx2hY7w/uWqZDRDUGjoifFKBbjzkDecviqL9V9yMQj5bBvEo0HLshaqSiwIL99Uoe80yoivjryi11sdk4JyIJ3ymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vm1fklwy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BE0A62D7;
	Wed, 21 Jan 2026 02:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768960256;
	bh=uu0TV3T46JBjmZ/Z1O6mRrRy6UkFsA3BqZKe+FAucfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vm1fklwyGGytKhk4N0Axmw4L56BjsGI7RKgeBhzBkID372ar77nKR2XMQ/BTaMvYX
	 xzS14slInMpXfv+JsRz/ioAcHToZYNI5LQrsHa9YUlAlvtow5jRbZkhXyBldTp8zOR
	 1/Ir1ZxHJzWtboL7wKjQ0eQ1Evmrl2QwLxrsh+YM=
Date: Wed, 21 Jan 2026 03:51:27 +0200
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
Subject: Re: [PATCH v4 4/4] media: nxp: Add dev_err_probe() to all error
 paths in *async_register() helpers
Message-ID: <20260121015127.GC403250@killaraus>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
 <20260116-cam_cleanup-v4-4-29ce01640443@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-cam_cleanup-v4-4-29ce01640443@nxp.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51174-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,posteo.de,puri.sm,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 93DCA4F5FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

Thank you for the patch.

On Fri, Jan 16, 2026 at 11:29:22AM -0500, Frank Li wrote:
> Add dev_err_probe() to all error branches in the *async_register() helpers
> to provide clearer diagnostic information when device registration fails.
> 
> Drop the explicit error message after returning from
> mipi_csis_async_register(), as the error is already reported by this
> helper.
> 
> No functional change.

That's not quite exact, there are functional changes.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - new patch
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c    | 31 ++++++++++++++++-----------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 27 ++++++++++++++---------
>  2 files changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9..85098824f4917b3cda3aa71c4ed0a41939283e12 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1359,18 +1359,18 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
>  						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
> -		return -ENOTCONN;
> +		return dev_err_probe(csis->dev, -ENOTCONN,
> +				     "failed to get remote endpoint\n");

It's not the remote endpoint, but the local endpoint.

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
> +					     "data lanes reordering is not supported");

Missing \n

>  	}
>  
>  	csis->bus = vep.bus.mipi_csi2;
> @@ -1382,15 +1382,22 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
>  					      struct v4l2_async_connection);
>  	if (IS_ERR(asd))
> -		return PTR_ERR(asd);
> +		return dev_err_probe(csis->dev, PTR_ERR(asd),
> +				     "failed to add remote fwmode to notifier\n");

s/fwmode/fwnode/

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
> index 9d946b68cf59d9f4fb3413fc90219efd380d9d95..b3b9e9dc8a95c76628d573824c12f9391fb7b4a0 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -727,18 +727,18 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
>  						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
> -		return -ENOTCONN;
> +		return dev_err_probe(state->dev, -ENOTCONN,
> +				     "failed to get remote endpoint fwnode\n");
>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(state->dev, ret,
> +				     "failed parse endpoint fwnode\n");

I'd write

+				     "failed to parse endpoint\n");

to match the imx-mipi-csis.c driver.

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
> +				     "failed add fwnode to notifier\n");

s/failed add/failed to add/

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

-- 
Regards,

Laurent Pinchart

