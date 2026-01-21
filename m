Return-Path: <linux-media+bounces-51173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KElBAusvcGkEXAAAu9opvQ
	(envelope-from <linux-media+bounces-51173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:46:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A31E4F500
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F55F90FC89
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 01:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E3B306491;
	Wed, 21 Jan 2026 01:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r42NAdXj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75078307492;
	Wed, 21 Jan 2026 01:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768959919; cv=none; b=LRLCaR9b0bB4A7feO7GhNwXO6omUmccnSy+Jl09DolTV0EgLVbR5lKPS/M+3XqzdKNPBuSBv+2cXvY0W6ufh+CH+EdSy7zxcWs3IsqA9IR+XMcOZzequcsAJ657zEQ+AU4lOMnBiLknn7elFxFw7gTEDVJ6mYN5CV6ueexQEHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768959919; c=relaxed/simple;
	bh=nmAfG/XlG9vHuJu/mIOfcC99iytyWXrNE1aifn7DYyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Unq43k5OEgDXXLukM3v04Qjr1dlEkLw33CAkLs+XJI9LPC7z8kusspFIfHB002vummiucmEVAV7kSG+EKbh6yVnf3rgW5sl3qSXQJbidzxXoZlRDhZgeu4MeLKNJVGmxa6KR1amG2k5VKmlBQo3H06RFr1YWNZLhjO4tICXCm2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r42NAdXj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9510E2D7;
	Wed, 21 Jan 2026 02:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768959878;
	bh=nmAfG/XlG9vHuJu/mIOfcC99iytyWXrNE1aifn7DYyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r42NAdXjWHWSoz2tIjwMAOAli4jSLCb6ERMj6Bwab4lICVrrquFsSKtXWueO4ZxgT
	 Fxd8cfcG5soV+98MWe+LusCV8gZYUMqMe/pD/Jxg1LDDDfx1V1dph93aQrHs/2RJcT
	 GSaFWDVh+H96GHP6g3IFKBV0qaTK6M+ZFB6nk+ow=
Date: Wed, 21 Jan 2026 03:45:08 +0200
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
Subject: Re: [PATCH v4 3/4] media: nxp: use cleanup __free(fwnode_handle)
 simplify code
Message-ID: <20260121014508.GB403250@killaraus>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
 <20260116-cam_cleanup-v4-3-29ce01640443@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-cam_cleanup-v4-3-29ce01640443@nxp.com>
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
	TAGGED_FROM(0.00)[bounces-51173-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,posteo.de,puri.sm,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,nxp.com:email,msgid.link:url]
X-Rspamd-Queue-Id: 7A31E4F500
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

Thank you for the patch.

On Fri, Jan 16, 2026 at 11:29:21AM -0500, Frank Li wrote:
> Use cleanup __free(fwnode_handle) simplify code. No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> change in v3
> - Rollback to v1 version to align guide at cleanup.h.
> - Ref similar link
> 
>     Link: https://lore.kernel.org/r/20240904044825.1048256-1-dmitry.torokhov@gmail.com
>     Link: https://patch.msgid.link/20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com
> 
> 452e0adff2618 Input: iqs7222 - use cleanup facility for fwnodes
> 52776177d8b7e Input: iqs626a - use cleanup facility for fwnodes
> 9a540b67a9c26 Input: iqs269a - use cleanup facility for fwnodes
> cc3b18f9fedec i3c: master: Fix confusing cleanup.h syntax
> 
> change in v2.
> - move variable define to top.
> - remove dev_err_probe() change
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c    | 25 ++++++++-----------------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 25 ++++++++-----------------
>  2 files changed, 16 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index ce93d868746f002c22e2f86b1e0aa84ec1a76061..9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -12,6 +12,7 @@
>   *
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> @@ -1349,27 +1350,26 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  		.bus_type = V4L2_MBUS_CSI2_DPHY,
>  	};
>  	struct v4l2_async_connection *asd;
> -	struct fwnode_handle *ep;
>  	unsigned int i;
>  	int ret;
>  
>  	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
>  
> -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> -					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
>  		return -ENOTCONN;
>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		goto err_parse;
> +		return ret;
>  
>  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
>  		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
>  			dev_err(csis->dev,
>  				"data lanes reordering is not supported");
> -			ret = -EINVAL;
> -			goto err_parse;
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -1381,12 +1381,8 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
>  					      struct v4l2_async_connection);
> -	if (IS_ERR(asd)) {
> -		ret = PTR_ERR(asd);
> -		goto err_parse;
> -	}
> -
> -	fwnode_handle_put(ep);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>  
>  	csis->notifier.ops = &mipi_csis_notify_ops;
>  
> @@ -1395,11 +1391,6 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  		return ret;
>  
>  	return v4l2_async_register_subdev(&csis->sd);
> -
> -err_parse:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>  }
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 83da050a1dcbad1d41c94de0e352dcafe3f25e62..9d946b68cf59d9f4fb3413fc90219efd380d9d95 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
> @@ -717,27 +718,26 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  		.bus_type = V4L2_MBUS_CSI2_DPHY,
>  	};
>  	struct v4l2_async_connection *asd;
> -	struct fwnode_handle *ep;
>  	unsigned int i;
>  	int ret;
>  
>  	v4l2_async_subdev_nf_init(&state->notifier, &state->sd);
>  
> -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> -					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
>  	if (!ep)
>  		return -ENOTCONN;
>  
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
> -		goto err_parse;
> +		return ret;
>  
>  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
>  		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
>  			dev_err(state->dev,
>  				"data lanes reordering is not supported");
> -			ret = -EINVAL;
> -			goto err_parse;
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -749,12 +749,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
>  					      struct v4l2_async_connection);
> -	if (IS_ERR(asd)) {
> -		ret = PTR_ERR(asd);
> -		goto err_parse;
> -	}
> -
> -	fwnode_handle_put(ep);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>  
>  	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
>  
> @@ -763,11 +759,6 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
>  		return ret;
>  
>  	return v4l2_async_register_subdev(&state->sd);
> -
> -err_parse:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>  }
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

