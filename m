Return-Path: <linux-media+bounces-35363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E93BAAE0B86
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76F911894576
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C2728C026;
	Thu, 19 Jun 2025 16:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cZb7dgT/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3BC17D2
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 16:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352186; cv=none; b=OVTtOhgfSBJUCzxA5/5JbHgZVr2xqqxNVe964f6dlyXeCMQomPWWON8w1Mdh1jpYxcCn+ztTNpN0jutSZNoE4kDea2VAMRLH21yAmIBtInbtwaFDK4+74KUVGOlVIB5kIbzfH/9uhpaYQD/hYfu7on4YyhDGK3D4yno79wYT8Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352186; c=relaxed/simple;
	bh=NOwE4lxwyQuv5TQ4bvzHNITx01vVTGgECCwh1Vj/7G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FE/GGxSC3FULnQNl9lpZ6GkVTZr+4ETB6C5b1DKm8jKqpZGll0VAolmr90DvzdIK0syNl2+XqbzzccL3igkX47n5XQ2t3Ph2p/xKLeTAGEvTcNQtdJ6OP4c7p13NqlVtVYlc/U5FkNQAYOWzWNkWjazC+YaY6HUQdr5Wmddj/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cZb7dgT/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7AD92EC;
	Thu, 19 Jun 2025 18:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750352168;
	bh=NOwE4lxwyQuv5TQ4bvzHNITx01vVTGgECCwh1Vj/7G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZb7dgT/X6dQnoasWcdKvjL2v2u8MfW1HX+EgqvBF6jpTrYGnqX1mFbkwU9iD3l68
	 kX+b0ZQ4B9uDfaacxb7Wl28+ZMtE30IuNtYaIPMneBqjMr1aa7obGa273rIw5Ls+2a
	 aDrCff7/BjBpVPGF8bTRy0pwkSaxXjLug5ON5xdY=
Date: Thu, 19 Jun 2025 19:56:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 06/13] media: v4l2-subdev: Mark both streams of a route
 enabled
Message-ID: <20250619165604.GH32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-7-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Jun 19, 2025 at 11:15:39AM +0300, Sakari Ailus wrote:
> Streams are stored in sink-source pairs in sub-device state.

Is it really this simple ? Don't we support for instance stream merging
where two streams on possibly different sink pads are routed to a single
stream on a source pad ?

> When a stream
> was marked enabled (or disabled), only the state of one end of the stream
> was modified, leaving the stream in an incoherent state. Mark both ends of
> the stream enabled (or disabled).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 60b8febd3339..5afdd9d548b5 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2254,9 +2254,11 @@ static void v4l2_subdev_set_streams_enabled(struct v4l2_subdev *sd,
>  	for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
>  		struct v4l2_subdev_stream_config *cfg =
>  			&state->stream_configs.configs[i];
> +		struct v4l2_subdev_stream_config *cfg2 =
> +			&state->stream_configs.configs[i ^ 1U];
>  
>  		if (cfg->pad == pad && (streams_mask & BIT_ULL(cfg->stream)))
> -			cfg->enabled = enabled;
> +			cfg->enabled = cfg2->enabled = enabled;
>  	}
>  }
>  

-- 
Regards,

Laurent Pinchart

