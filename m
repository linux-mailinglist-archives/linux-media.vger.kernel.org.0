Return-Path: <linux-media+bounces-13532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A490CA9D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 987ABB29351
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D73E156661;
	Tue, 18 Jun 2024 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cYQvTcdt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5CC149E00;
	Tue, 18 Jun 2024 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718710534; cv=none; b=TudqwUYfOCMWP3xuym+f5HSGXgrVCdwCtj+/nNLuz9FaJxHPRqOaHyxyMiBSan1Z6Dt66q/0y74LEHJALsbQ7ztMag1onu67Ur6mbLA6motdVJ2txL3xlgRFsfkHK3XMdk/jy14ZohpKeQzdFTYAuaXz+IQbNE/wDxBvcFPrEnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718710534; c=relaxed/simple;
	bh=tts7zWHx9oWDIpSCBaTv2lsj2nXH3nw8AMkSrGBFFGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0omjHyDha9DcdwoXAFt0UFyde9EpEA3imdYzBjLlkH3rYMyfqUXgv6jp52BEoHBCO6k+y0lbuXABcfhz1+Ps65nGgl/r+BP7wo1DNdG1f2I3h8l1Y1gZkL3THsPKrYHew0xTfsQp7ETd0/DRSotrD1VmNglPYyiGwhISGTMKpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cYQvTcdt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F36497E1;
	Tue, 18 Jun 2024 13:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718710514;
	bh=tts7zWHx9oWDIpSCBaTv2lsj2nXH3nw8AMkSrGBFFGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYQvTcdtkliKXlW5DCE58cuKoAUpXhQ+jP//w0xeFbuQ8VvX+rMOYN1Y4Gacs69Or
	 4OES9U334tzs1QYRWLrZJQUouxtTIQM8SJZ4UTZ9f4qL0OPIQ/cFsk7DwJMBcaEXeo
	 FWFqGP/T1JEWRDEqebmWFOf4VKIs/x5VT9+MOajM=
Date: Tue, 18 Jun 2024 13:35:28 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 13/19] media: renesas: vsp1: Compute partitions
 for DRM pipelines
Message-ID: <z626wu6fmkshc2kisyv5hyldowghhu4eidaedlebrrrazdg23g@xlousfrfcthi>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-14-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-14-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:30:03AM GMT, Laurent Pinchart wrote:
> The DRM pipelines don't partition frames, as the hardware operates
> synchronously with the display. The entity operations access
> configuration data from the entity state in that case, instead of
> accessing the partition structure. This requires special cases in
> entity-specific code, increasing the driver complexity.
>
> To prepare for simplifying the code, initialize a single partition for
> the DRM pipelines, similarly to how video pipelines create one partition
> spanning the full image when partitioning isn't needed. The partition is
> allocated statically in the vsp1_drm_pipeline structure instead of
> dynamically as for video pipelines, as DRM pipelines are guaranteed to
> operate on a single partition.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 9 ++++++++-
>  drivers/media/platform/renesas/vsp1/vsp1_drm.h | 2 ++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index e44359b661b6..11313e26a298 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -550,6 +550,9 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
>  	struct vsp1_dl_body *dlb;
>  	unsigned int dl_flags = 0;
>
> +	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
> +					  drm_pipe->width, 0);
> +
>  	if (drm_pipe->force_brx_release)
>  		dl_flags |= VSP1_DL_FRAME_END_INTERNAL;
>  	if (pipe->output->writeback)
> @@ -573,7 +576,8 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
>  		vsp1_entity_route_setup(entity, pipe, dlb);
>  		vsp1_entity_configure_stream(entity, pipe, dl, dlb);
>  		vsp1_entity_configure_frame(entity, pipe, dl, dlb);
> -		vsp1_entity_configure_partition(entity, pipe, NULL, dl, dlb);
> +		vsp1_entity_configure_partition(entity, pipe,
> +						&pipe->part_table[0], dl, dlb);
>  	}
>
>  	vsp1_dl_list_commit(dl, dl_flags);
> @@ -968,6 +972,9 @@ int vsp1_drm_init(struct vsp1_device *vsp1)
>
>  		vsp1_pipeline_init(pipe);
>
> +		pipe->partitions = 1;
> +		pipe->part_table = &drm_pipe->partition;
> +
>  		pipe->frame_end = vsp1_du_pipeline_frame_end;
>
>  		/*
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
> index ab8b7e3161a2..3fd95b53f27e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
> @@ -20,6 +20,7 @@
>  /**
>   * struct vsp1_drm_pipeline - State for the API exposed to the DRM driver
>   * @pipe: the VSP1 pipeline used for display
> + * @partition: the pre-calculated partition used by the pipeline
>   * @width: output display width
>   * @height: output display height
>   * @force_brx_release: when set, release the BRx during the next reconfiguration
> @@ -31,6 +32,7 @@
>   */
>  struct vsp1_drm_pipeline {
>  	struct vsp1_pipeline pipe;
> +	struct vsp1_partition partition;
>
>  	unsigned int width;
>  	unsigned int height;
> --
> Regards,
>
> Laurent Pinchart
>
>

