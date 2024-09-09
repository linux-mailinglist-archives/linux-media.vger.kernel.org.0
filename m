Return-Path: <linux-media+bounces-18019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B742971E7C
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 17:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 417231C23634
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 15:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EE27E0E8;
	Mon,  9 Sep 2024 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hpXFx3MN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF3B1BC40;
	Mon,  9 Sep 2024 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725897370; cv=none; b=G+i/fpZfvGGD9kZlFDoPL1nnT/QXNNH2FcLCT9HInfvp7FzQtUjc9WOaNeQ35vR6v10zm01l+zHigidzokVBIuOVYaVXVFYPGgKQwk3dNUKVZRLVDr4ru+XEPCrsVPHTdlTQjxH0+4pVrZL5oWr8aUKA7YVxNUwTVRFh+uB+dm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725897370; c=relaxed/simple;
	bh=ML4VMZgUPn5ht7kjEORCwWPFN4nCez7subw2JMIInQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTBEKFSWFhIPQ+1Udm6esRl26dcdDhDJ4gB3fca8HQemQ/M/itHnWdHFNml9p47kHMbUM9aCQVWWnbgyfVrVGJ/i/l+fE5SsICkOjWhXAPSPOPl9daY936w3bw+MqioI9c8y6awLgpUh6DHC2GjA0dFPo3vflXgmEOlCTFPmIEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hpXFx3MN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 736E1827;
	Mon,  9 Sep 2024 17:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725897290;
	bh=ML4VMZgUPn5ht7kjEORCwWPFN4nCez7subw2JMIInQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpXFx3MNKVClzt74xGPu3qbSZX89HH3GihEDux5d7VxSswcZp3D+QuhheqVyRqQMm
	 5caLR8f5qDo6WkzrccB8jYV6f/GRJBCiSMvd9LmSbaQ/ruayFa2Iir4VUoWBwb0w6g
	 9RA31bfL1Y4w3v+ZafQnNV7dryjTM8BVN6EIkN28=
Date: Mon, 9 Sep 2024 18:56:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: platform: video-mux: Fix mutex locking
Message-ID: <20240909155603.GE9448@pendragon.ideasonboard.com>
References: <20240909154828.1661627-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909154828.1661627-1-paul.elder@ideasonboard.com>

Hi Paul,

Thank you for the patch.

On Mon, Sep 09, 2024 at 05:48:28PM +0200, Paul Elder wrote:
> The current order of locking between the driver mutex and the v4l2
> subdev state lock causes a circuluar locking dependency when trying to
> set up a link. Fix this.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This being said, I think we should deprecate the video-mux driver and
implement a driver that uses the V4L2 subdev internal routing API
instead of basing the routing configuration on link setup. Any opinion ?

> ---
>  drivers/media/platform/video-mux.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
> index 31e9e92e723eb..f43849db56800 100644
> --- a/drivers/media/platform/video-mux.c
> +++ b/drivers/media/platform/video-mux.c
> @@ -52,6 +52,7 @@ static int video_mux_link_setup(struct media_entity *entity,
>  				const struct media_pad *remote, u32 flags)
>  {
>  	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct v4l2_subdev_state *sd_state;
>  	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
>  	u16 source_pad = entity->num_pads - 1;
>  	int ret = 0;
> @@ -67,10 +68,10 @@ static int video_mux_link_setup(struct media_entity *entity,
>  		remote->entity->name, remote->index, local->entity->name,
>  		local->index, flags & MEDIA_LNK_FL_ENABLED);
>  
> +	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
>  	mutex_lock(&vmux->lock);
>  
>  	if (flags & MEDIA_LNK_FL_ENABLED) {
> -		struct v4l2_subdev_state *sd_state;
>  		struct v4l2_mbus_framefmt *source_mbusformat;
>  
>  		if (vmux->active == local->index)
> @@ -88,12 +89,10 @@ static int video_mux_link_setup(struct media_entity *entity,
>  		vmux->active = local->index;
>  
>  		/* Propagate the active format to the source */
> -		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
>  		source_mbusformat = v4l2_subdev_state_get_format(sd_state,
>  								 source_pad);
>  		*source_mbusformat = *v4l2_subdev_state_get_format(sd_state,
>  								   vmux->active);
> -		v4l2_subdev_unlock_state(sd_state);
>  	} else {
>  		if (vmux->active != local->index)
>  			goto out;
> @@ -105,6 +104,7 @@ static int video_mux_link_setup(struct media_entity *entity,
>  
>  out:
>  	mutex_unlock(&vmux->lock);
> +	v4l2_subdev_unlock_state(sd_state);
>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart

