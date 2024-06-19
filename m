Return-Path: <linux-media+bounces-13685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004290EA50
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174A21F21E59
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 12:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6634513E034;
	Wed, 19 Jun 2024 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sKgLjsZV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6679C135A6D;
	Wed, 19 Jun 2024 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718798570; cv=none; b=TG1k6oIMd8cnQ8wmIzYllAQmAqLvpl0t2+U1asfAVLx2poR39GLBji8lNUyFwi7JcGQrnSVN73jkO7GjEghpmbhFi4ghimFzQgXtBvp6F/zCIKcXdz8xyGgqpqEhpqltL5QFU46edvsEW7o59sPd4R9XzE5f//i2Ao0YqZqFzJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718798570; c=relaxed/simple;
	bh=hhPC12TSdAfNczkdDEp35qzTdIl4a0w8PrCOZyWruS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFIYKHRLaNmMszgp0DV94tvkA5HT7jFGlxmq1g4tWT8XtRpXsVqKPbmAlPFAJpRQHYl7ZFptPqhyxrv0I+P2vs8pDPJaBVpgihDMPo5vdQLwgjk7iCrLjf0Ii0e5MvODFzztdbtk+w0NYQdKV2350xmtHya7hKYlrHIs8SvfUVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sKgLjsZV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 389A8541;
	Wed, 19 Jun 2024 14:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718798549;
	bh=hhPC12TSdAfNczkdDEp35qzTdIl4a0w8PrCOZyWruS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKgLjsZVWmrZ26m1ZMfuFtMUC8ZPSraOOZTRL0YEy4ObTq046HqzXcxYe76vy5VVk
	 wKa1wnkgObZcZomqjtkthHS+wL9htg/y7kB4L3RnzznZeMJhddV4a/mAJs4nWxgkiX
	 BjZ3BslTk+Q+V+yxIBHegJUcT/i7395rcn/t40EI=
Date: Wed, 19 Jun 2024 14:02:44 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 12/19] media: renesas: vsp1: Keep the DRM pipeline
 entities sorted
Message-ID: <h2db3y4w2d3u2uakkkhwuknp3mebrbl6cxexruf5cgqurcllpo@mzos4lsuz4in>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-13-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-13-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:30:02AM GMT, Laurent Pinchart wrote:
> Some of the code that handles pipeline configuration assumes that
> entities in a pipeline's entities list are sorted from sink to source.
> To prepare for using that code with the DRM pipeline, insert the BRx
> just before the WPF, and the RPFs at the head of the list.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

With the meaning of pipe->output->entity.list_pipe clarified offline

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index 1aa59a74672f..e44359b661b6 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -317,7 +317,10 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
>  			list_add_tail(&released_brx->list_pipe,
>  				      &pipe->entities);
>
> -		/* Add the BRx to the pipeline. */
> +		/*
> +		 * Add the BRx to the pipeline, inserting it just before the
> +		 * WPF.
> +		 */
>  		dev_dbg(vsp1->dev, "%s: pipe %u: acquired %s\n",
>  			__func__, pipe->lif->index, BRX_NAME(brx));
>
> @@ -326,7 +329,8 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
>  		pipe->brx->sink = &pipe->output->entity;
>  		pipe->brx->sink_pad = 0;
>
> -		list_add_tail(&pipe->brx->list_pipe, &pipe->entities);
> +		list_add_tail(&pipe->brx->list_pipe,
> +			      &pipe->output->entity.list_pipe);
>  	}
>
>  	/*
> @@ -420,7 +424,7 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
>
>  		if (!rpf->entity.pipe) {
>  			rpf->entity.pipe = pipe;
> -			list_add_tail(&rpf->entity.list_pipe, &pipe->entities);
> +			list_add(&rpf->entity.list_pipe, &pipe->entities);
>  		}
>
>  		brx->inputs[i].rpf = rpf;
> --
> Regards,
>
> Laurent Pinchart
>
>

