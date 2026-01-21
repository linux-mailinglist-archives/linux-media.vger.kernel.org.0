Return-Path: <linux-media+bounces-51179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFDvK202cGl9XAAAu9opvQ
	(envelope-from <linux-media+bounces-51179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:14:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0D4F956
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 664ABB0FDDA
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F49E32B9A8;
	Wed, 21 Jan 2026 02:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wCvViTFm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACCE306496;
	Wed, 21 Jan 2026 02:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961632; cv=none; b=McOx7UWVrz5lc4JHKsIATeMk70POZsLWaMoW+PLoNiTTPUlfc+B/DhPRs/Afabu/3n4jpfCZJJzZip+CHUvjvksbfsae8XoFXKKGjEImPAx3YkTbYXk/u8aqs2NV6prWnXXSbJMjxKkBVL+yx4vS2HZSDRD8h8QEbkfFe+pSG/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961632; c=relaxed/simple;
	bh=Xe1nmcNnParGKTT36BF5z73M+2mDyrArtK+cq8m9Fj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxqCZZdFImOSftbx/XM3/4lvIX0d07MvPFuaocc2xuRKIMG8/uKkpFbD4xo9V/6z+jL5n16X2E5YCoZIFOC9HNNeEVJwWFmRrwgnQjCPxLkANwRXzJLzoOPnyVQxDwhOhChsfyc/NcAuK/G+YF9uOaJIC5Z9dYJfEOhaGPEIHO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wCvViTFm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C70812D7;
	Wed, 21 Jan 2026 03:13:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768961598;
	bh=Xe1nmcNnParGKTT36BF5z73M+2mDyrArtK+cq8m9Fj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wCvViTFm0WUujGrdnzCktwQ6GchNtco7Q3jb1CP2O7qUQSJ81oyjbblLHI4sn87I7
	 YpxtmMZAOqzRDggSjFyK/hG77NbfBYcd2JAN7QVJhUb98o3mgvBT0xS2G2ZqdWVd4M
	 uYp+cR10in8QBvqqruwvT2ncuZ0z+XDmgK3cVPBA=
Date: Wed, 21 Jan 2026 04:13:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 4/5] media: staging: media: imx6-mipi-csi2: use
 guard() to simplify code
Message-ID: <20260121021348.GH403250@killaraus>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
 <20260116-stage-csi2-cleanup-v2-4-a56e9cb25196@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-stage-csi2-cleanup-v2-4-a56e9cb25196@nxp.com>
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
	TAGGED_FROM(0.00)[bounces-51179-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ideasonboard.com:email,ideasonboard.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 62A0D4F956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

Thank you for the patch.

On Fri, Jan 16, 2026 at 11:17:59AM -0500, Frank Li wrote:
> Use guard() to simplify mutex locking. No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> leave as it without cleanup goto branch because there are two path to
> update stream_count.
> 
> And it will be replaced soon at
> 
> Use new v4l2_subdev_pad_ops.enable_streams(disalbe_stream) replace
> deprecated s_stream interface.
> 
> https://lore.kernel.org/imx/20250821-95_cam-v3-18-c9286fbb34b9@nxp.com/
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 54 +++++++++++-------------------
>  1 file changed, 19 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index e1b4b7fb53131ce9515b9441d8fc420e85d3e993..762f19ffd0858c952027afa8e0f36fc87246e1ea 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -412,21 +412,17 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct csi2_dev *csi2 = sd_to_dev(sd);
>  	int i, ret = 0;
>  
> -	mutex_lock(&csi2->lock);
> +	guard(mutex)(&csi2->lock);
>  
> -	if (!csi2->src_sd) {
> -		ret = -EPIPE;
> -		goto out;
> -	}
> +	if (!csi2->src_sd)
> +		return -EPIPE;
>  
>  	for (i = 0; i < CSI2_NUM_SRC_PADS; i++) {
>  		if (csi2->sink_linked[i])
>  			break;
>  	}
> -	if (i >= CSI2_NUM_SRC_PADS) {
> -		ret = -EPIPE;
> -		goto out;
> -	}
> +	if (i >= CSI2_NUM_SRC_PADS)
> +		return -EPIPE;
>  
>  	/*
>  	 * enable/disable streaming only if stream_count is
> @@ -441,14 +437,12 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
>  	else
>  		csi2_stop(csi2);
>  	if (ret)
> -		goto out;
> +		return ret;
>  
>  update_count:
>  	csi2->stream_count += enable ? 1 : -1;
>  	if (csi2->stream_count < 0)
>  		csi2->stream_count = 0;
> -out:
> -	mutex_unlock(&csi2->lock);
>  	return ret;
>  }
>  
> @@ -466,32 +460,28 @@ static int csi2_link_setup(struct media_entity *entity,
>  
>  	remote_sd = media_entity_to_v4l2_subdev(remote->entity);
>  
> -	mutex_lock(&csi2->lock);
> +	guard(mutex)(&csi2->lock);
>  
>  	if (local->flags & MEDIA_PAD_FL_SOURCE) {
>  		if (flags & MEDIA_LNK_FL_ENABLED) {
> -			if (csi2->sink_linked[local->index - 1]) {
> -				ret = -EBUSY;
> -				goto out;
> -			}
> +			if (csi2->sink_linked[local->index - 1])
> +				return -EBUSY;
> +
>  			csi2->sink_linked[local->index - 1] = true;
>  		} else {
>  			csi2->sink_linked[local->index - 1] = false;
>  		}
>  	} else {
>  		if (flags & MEDIA_LNK_FL_ENABLED) {
> -			if (csi2->src_sd) {
> -				ret = -EBUSY;
> -				goto out;
> -			}
> +			if (csi2->src_sd)
> +				return -EBUSY;
> +
>  			csi2->src_sd = remote_sd;
>  		} else {
>  			csi2->src_sd = NULL;
>  		}
>  	}
>  
> -out:
> -	mutex_unlock(&csi2->lock);
>  	return ret;

You can

	return 0;

here and drop the local ret variable. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
> @@ -512,14 +502,12 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
>  	struct csi2_dev *csi2 = sd_to_dev(sd);
>  	struct v4l2_mbus_framefmt *fmt;
>  
> -	mutex_lock(&csi2->lock);
> +	guard(mutex)(&csi2->lock);
>  
>  	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
>  
>  	sdformat->format = *fmt;
>  
> -	mutex_unlock(&csi2->lock);
> -
>  	return 0;
>  }
>  
> @@ -529,17 +517,14 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
>  {
>  	struct csi2_dev *csi2 = sd_to_dev(sd);
>  	struct v4l2_mbus_framefmt *fmt;
> -	int ret = 0;
>  
>  	if (sdformat->pad >= CSI2_NUM_PADS)
>  		return -EINVAL;
>  
> -	mutex_lock(&csi2->lock);
> +	guard(mutex)(&csi2->lock);
>  
> -	if (csi2->stream_count > 0) {
> -		ret = -EBUSY;
> -		goto out;
> -	}
> +	if (csi2->stream_count > 0)
> +		return -EBUSY;
>  
>  	/* Output pads mirror active input pad, no limits on input pads */
>  	if (sdformat->pad != CSI2_SINK_PAD)
> @@ -548,9 +533,8 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
>  	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
>  
>  	*fmt = sdformat->format;
> -out:
> -	mutex_unlock(&csi2->lock);
> -	return ret;
> +
> +	return 0;
>  }
>  
>  static int csi2_registered(struct v4l2_subdev *sd)

-- 
Regards,

Laurent Pinchart

