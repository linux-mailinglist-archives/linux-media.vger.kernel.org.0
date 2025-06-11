Return-Path: <linux-media+bounces-34551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82921AD63E8
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDD8F7AC7D8
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 23:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529A62C325B;
	Wed, 11 Jun 2025 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oUXVVRyR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62F2580F9;
	Wed, 11 Jun 2025 23:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749684987; cv=none; b=p3IfJQPRaWSKlW/yQM0cqBw/NhJoAPKtOOGtjqhBs4NThcjM+ehdzq6DIZo75xIPOGyV3uFskLY0w7cAE6TY5svmacIzHbZf/lGRTjbANNYVNUwbhbgdMHgetRfg9m/bZTOLk+YxFVEh95FA68tmbfHrXm28rAkmbYy3K17ZR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749684987; c=relaxed/simple;
	bh=0ezuTcWRuV87/NrpSBg1ipbPs8UNJkLPjKdmfj7dhsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRCqgToS2nL2S6PQKbR8aTD6IC3Ilj9ZjTut/InCutUaF6j49YC4fNAPjaE1lPVeg+fC6gWEUZe8w3Y6zReHO+J1OSlmIK2XMhlppDZGk6/1PrrmdhzQ98724aj9FmnsBcdOKOQvbokmv8LsAAq+ea5JKDvswxqB0MrLJEyo7bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oUXVVRyR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B58F8D52;
	Thu, 12 Jun 2025 01:36:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749684975;
	bh=0ezuTcWRuV87/NrpSBg1ipbPs8UNJkLPjKdmfj7dhsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUXVVRyRSdJP57KSpwh9aoP3xMfKx5IaLeWKgkQYloXMM+ywn6vmsMX0SZj6YQL0O
	 zSFYgP0fdXo9x6/phN8YgZ411MlKDtsK6j5Mg++1uTFjw/hZ3cEnllHQEZDg2WT4NQ
	 qeMNJoWQkXxiEMjN2KNMaNputiSBM0ir6MhZGFEQ=
Date: Thu, 12 Jun 2025 02:36:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: vsp1: Reset FCP for VSPX
Message-ID: <20250611233611.GR24465@pendragon.ideasonboard.com>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-3-9f17277ff1e2@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609-vspx-reset-v1-3-9f17277ff1e2@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Jun 09, 2025 at 09:01:44PM +0200, Jacopo Mondi wrote:
> According section "62.3.7.1 "Operation Control Setting

"According to"

> IP set VSPX+FCPVX" of the R-Car Gen4 Hardware Manual, FCPX has to
> be reset when stopping the image processing.

That's only when stopping "image process of VSPX+FCPVX immediately".
Note the "immediately", which involves resetting the VSP too. The code
below waits for the pipeline to stop at the end of the frame. Resetting
the FCP doesn't seem to be required in that case.

> Softawre reset the FCPX after the vsp1 pipe has stopped.

s/Softawre/Software/

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index a6e5e10f3ef275c1b081c3d957e6cf356332afce..c6f2417aabc479384012ab8ab99556029ede1f44 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -499,6 +499,7 @@ bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe)
>  int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
>  {
>  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
> +	u32 version = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
>  	struct vsp1_entity *entity;
>  	unsigned long flags;
>  	int ret;
> @@ -515,8 +516,7 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
>  			spin_unlock_irqrestore(&pipe->irqlock, flags);
>  		}
>  
> -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> -		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
> +		if (version == VI6_IP_VERSION_MODEL_VSPD_GEN3)
>  			ret |= rcar_fcp_soft_reset(vsp1->fcp);
>  
>  	} else {
> @@ -529,6 +529,9 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
>  		ret = wait_event_timeout(pipe->wq, vsp1_pipeline_stopped(pipe),
>  					 msecs_to_jiffies(500));
>  		ret = ret == 0 ? -ETIMEDOUT : 0;
> +
> +		if (version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> +			ret |= rcar_fcp_soft_reset(vsp1->fcp);
>  	}
>  
>  	list_for_each_entry(entity, &pipe->entities, list_pipe) {

-- 
Regards,

Laurent Pinchart

