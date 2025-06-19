Return-Path: <linux-media+bounces-35364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5834AE0B9D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 19:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F5F81BC391D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E838235046;
	Thu, 19 Jun 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="llq8vl7O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896B23CB
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352452; cv=none; b=nQKJLZkzVUswsm9ilZeHFzFvGUtJN88S/HJrTMyKXSnfw2e7Pp7qnSIBLWBYP1P2xBbmn7Nvl85dMgdESmD40wMpvHgVXu+/Fnp4CPKZNfI3Eaw5EVPNAj1u25F2DOwK2SkJf8VvjRm9MvquHrBu8dymabE9hJfkWMLr8X2Pa6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352452; c=relaxed/simple;
	bh=HOAawe8RoHXU0igQ1aBz8Y3PvOGQutTSFZWLkCJgMoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELK51KYwgo3kQ/wxN7nidgPWLK8CPpaI6T6jzJgKWDmAf9NOUhGTcvocX17hAubsGemXNlCLYjYdQStBMNkSR6Gpd/2Y8/DrmcgUeyZHUltLtkJygGrtO0pTgm3W4oloLKhMOj1V/w7GIDWUQPxmi4BbYx6D9+/ujFB9Hg77CmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=llq8vl7O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB56C2EC;
	Thu, 19 Jun 2025 19:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750352434;
	bh=HOAawe8RoHXU0igQ1aBz8Y3PvOGQutTSFZWLkCJgMoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=llq8vl7O6qgxNlk6vBpLOWsIGWCi1eGzmheE+/DKDjPV0uwgYutiva2PU0b9tQlF/
	 KwcHodvcE9uILAm0J3lIEx6Vu8hq2TKYXm1awuyb43WFXWSDEj0Iue+5SwS/nuciLv
	 GSB5aQShEISQf5W8uq/L32vZ7qOEIvhqZhx6h1hk=
Date: Thu, 19 Jun 2025 20:00:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 07/13] media: ipu6: Set up CSI-2 receiver at correct
 moment
Message-ID: <20250619170030.GI32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-8-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Jun 19, 2025 at 11:15:40AM +0300, Sakari Ailus wrote:
> Enable the CSI-2 receiver before the first stream is started and disable
> it when the last stream is stopped. Before this patch, every time a stream
> was started, the CSI-2 receiver was enabled and similarly, it was disabled
> when any stream was stopped.

You mentioned in 03/13 that we should only enable the source when all
video capture devices have been started. Shouldn't you enable the CSI-2
receiver when *all* streams are enabled, not when the first one is
enabled (and similarly when stopping) ?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 6030bd23b4b9..3b837e9ccffe 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -348,7 +348,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
>  	struct ipu6_isys_csi2_timing timing = { };
>  	struct v4l2_subdev *remote_sd;
>  	struct media_pad *remote_pad;
> -	u64 sink_streams;
> +	u64 sink_streams, already_enabled;
>  	int ret;
>  
>  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> @@ -358,13 +358,17 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
>  		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
>  						&streams_mask);
>  
> -	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
> -	if (ret)
> -		return ret;
> +	already_enabled = v4l2_subdev_state_streams_enabled(sd, state,
> +							    CSI2_PAD_SINK);

It would be cheaper to store a bitmask of enabled streams on the csi2
structure.

> +	if (!already_enabled) {
> +		ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
> +		if (ret)
> +			return ret;
>  
> -	ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
> -	if (ret)
> -		return ret;
> +		ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
>  					 sink_streams);
> @@ -382,7 +386,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
>  {
>  	struct v4l2_subdev *remote_sd;
>  	struct media_pad *remote_pad;
> -	u64 sink_streams;
> +	u64 sink_streams, still_enabled;
>  
>  	sink_streams =
>  		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> @@ -391,7 +395,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
>  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  
> -	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
> +	still_enabled = v4l2_subdev_state_streams_enabled(sd, state,
> +							  CSI2_PAD_SINK);
> +	if (still_enabled == sink_streams)
> +		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
>  
>  	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
>  

-- 
Regards,

Laurent Pinchart

