Return-Path: <linux-media+bounces-35917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF6AE9159
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 00:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7225E3A6ED3
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 22:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3B22882A3;
	Wed, 25 Jun 2025 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fi/KZheW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560001DD877;
	Wed, 25 Jun 2025 22:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750891956; cv=none; b=NY7JjLm3ITtzf6HcNvJ0WF6BzUGMHxpWHnmWpGSzF+UEXq+LgMPP5QRHDvNqGclqV7HVC0CsFwcGdnniwdZZHB/4dK+clA5a/k2w2jt5pjewydjTCy1k6SMvBifGTOCGiVovqNWpOeA0/GlaBDiWuRlIcfzEm1FKRDGCi+5z0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750891956; c=relaxed/simple;
	bh=CFgiBDv/pQPAeBIpzQMtFJ/iwyShp6K8dPz+RX2CupU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twvrlFPkOdH80GskpPX7BJNzAsuZuPuNoVjvO7SkfdMU55EhcdNV9jHMMcvlmXqfIw4XZ2YD7m0DRIPC9560WymH+N9dQT7O/Nz56n/5j5ahYSke1i/ycRv9vRLoLqiTlRKoe0wQxROtbcAsIFIaTuDi+23GRd1xeNt1mxrOm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fi/KZheW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4A81A6BE;
	Thu, 26 Jun 2025 00:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750891934;
	bh=CFgiBDv/pQPAeBIpzQMtFJ/iwyShp6K8dPz+RX2CupU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fi/KZheWiP70jRSylOa6l1uxr5U8Wc+yHmY/3TyopgOuDULZWe+jDAJesg5D5+DBR
	 KmyFjDhG4liiE9MOz7xBw9PqYLt29iKHXbXHXX+4Xlj2PDEWTl5X+BNqC6a63vI/CS
	 K4+bhZgZmyKqzed0E1qhD1CluRUPPu2NnIhn/uVQ=
Date: Thu, 26 Jun 2025 01:52:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 3/7] media: renesas: vsp1: Fix code checks in frame size
 enumeration
Message-ID: <20250625225209.GB15008@pendragon.ideasonboard.com>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-4-laurent.pinchart+renesas@ideasonboard.com>
 <67wmgwoousxbasom5rt5gbji7uymncdfwxp5usufqmkm4r5kqj@et4xswfrjn4w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67wmgwoousxbasom5rt5gbji7uymncdfwxp5usufqmkm4r5kqj@et4xswfrjn4w>

On Wed, May 28, 2025 at 04:45:58PM +0200, Jacopo Mondi wrote:
> On Wed, Apr 30, 2025 at 02:53:18AM +0300, Laurent Pinchart wrote:
> > The media bus code passed to the .enum_frame_size() operation for the
> > sink pad is required to be supported by the device, but not to match the
> > current format. All entities that use the vsp1_subdev_enum_frame_size()
> > helper, as well as the SRU and UDS entities that implement the operation
> > manually, perform the check incorrectly.
> >
> > Fix the issue by implementing the correct code check in the
> > vsp1_subdev_enum_frame_size(). For the SRU and UDS, to avoid duplicating
> > code, use the vsp1_subdev_enum_frame_size() as a base and override the
> > enumerated size on the source pad with entity-specific constraints.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_entity.c | 47 +++++++++++--------
> >  .../media/platform/renesas/vsp1/vsp1_sru.c    | 36 ++++++--------
> >  .../media/platform/renesas/vsp1/vsp1_uds.c    | 36 ++++++--------
> >  3 files changed, 58 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > index 0d4fe0028b13..a3d4bf2887ec 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > @@ -233,42 +233,51 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
> >  				struct v4l2_subdev_frame_size_enum *fse)
> >  {
> >  	struct vsp1_entity *entity = to_vsp1_entity(subdev);
> > -	struct v4l2_subdev_state *state;
> > -	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> >
> > -	state = vsp1_entity_get_state(entity, sd_state, fse->which);
> > -	if (!state)
> > +	if (fse->index)
> >  		return -EINVAL;
> >
> > -	format = v4l2_subdev_state_get_format(state, fse->pad);
> > -
> > -	mutex_lock(&entity->lock);
> > -
> > -	if (fse->index || fse->code != format->code) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > -
> >  	if (fse->pad == 0) {
> > +		unsigned int i;
> > +
> > +		for (i = 0; i < entity->num_codes; ++i) {
> > +			if (fse->code == entity->codes[i])
> > +				break;
> > +		}
> > +
> > +		if (i == entity->num_codes)
> > +			return -EINVAL;
> > +
> >  		fse->min_width = entity->min_width;
> >  		fse->max_width = entity->max_width;
> >  		fse->min_height = entity->min_height;
> >  		fse->max_height = entity->max_height;
> >  	} else {
> > +		struct v4l2_subdev_state *state;
> > +		struct v4l2_mbus_framefmt *format;
> > +
> > +		state = vsp1_entity_get_state(entity, sd_state, fse->which);
> > +		if (!state)
> > +			return -EINVAL;
> > +
> >  		/*
> > -		 * The size on the source pad are fixed and always identical to
> > -		 * the size on the sink pad.
> > +		 * The media bus code and size on the source pad are fixed and
> > +		 * always identical to the sink pad.
> >  		 */
> > +		format = v4l2_subdev_state_get_format(state, 0);
> > +
> > +		guard(mutex)(&entity->lock);
> 
> Should you now include cleanup.h ?

I'm in two minds about that. Yes, the guard() macro is provided by
cleanup.h, but the API here is really guard(mutex), which is provided by
mutex.h by using DEFINE_GUARD(), provided by cleanup.h. There's
therefore a guarantee cleanup.h is included.

I think I'll still include cleanup.h in v2, and while at it I'll also
include mutex.h that was missing.

> > +
> > +		if (fse->code != format->code)
> > +			return -EINVAL;
> > +
> >  		fse->min_width = format->width;
> >  		fse->max_width = format->width;
> >  		fse->min_height = format->height;
> >  		fse->max_height = format->height;
> >  	}
> >
> > -done:
> > -	mutex_unlock(&entity->lock);
> > -	return ret;
> > +	return 0;
> >  }
> >
> >  /*
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > index 1dc34e6a510d..e821eac1cbc2 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > @@ -116,29 +116,25 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
> >  			       struct v4l2_subdev_frame_size_enum *fse)
> >  {
> >  	struct vsp1_sru *sru = to_sru(subdev);
> > -	struct v4l2_subdev_state *state;
> > -	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> > +	int ret;
> >
> > -	state = vsp1_entity_get_state(&sru->entity, sd_state, fse->which);
> > -	if (!state)
> > -		return -EINVAL;
> > +	ret = vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
> > +	if (ret)
> > +		return ret;
> >
> > -	format = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
> > +	if (fse->pad == SRU_PAD_SOURCE) {
> > +		struct v4l2_subdev_state *state;
> > +		struct v4l2_mbus_framefmt *format;
> >
> > -	mutex_lock(&sru->entity.lock);
> > +		state = vsp1_entity_get_state(&sru->entity, sd_state,
> > +					      fse->which);
> > +		if (!state)
> > +			return -EINVAL;
> >
> > -	if (fse->index || fse->code != format->code) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +		format = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
> > +
> > +		guard(mutex)(&sru->entity.lock);
> >
> > -	if (fse->pad == SRU_PAD_SINK) {
> > -		fse->min_width = SRU_MIN_SIZE;
> > -		fse->max_width = SRU_MAX_SIZE;
> > -		fse->min_height = SRU_MIN_SIZE;
> > -		fse->max_height = SRU_MAX_SIZE;
> > -	} else {
> >  		fse->min_width = format->width;
> >  		fse->min_height = format->height;
> >  		if (format->width <= SRU_MAX_SIZE / 2 &&
> > @@ -151,9 +147,7 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
> >  		}
> >  	}
> >
> > -done:
> > -	mutex_unlock(&sru->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >
> >  static void sru_try_format(struct vsp1_sru *sru,
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > index 8006d49ffbea..95c9939ae077 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > @@ -121,38 +121,32 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
> >  			       struct v4l2_subdev_frame_size_enum *fse)
> >  {
> >  	struct vsp1_uds *uds = to_uds(subdev);
> > -	struct v4l2_subdev_state *state;
> > -	struct v4l2_mbus_framefmt *format;
> > -	int ret = 0;
> > +	int ret;
> >
> > -	state = vsp1_entity_get_state(&uds->entity, sd_state, fse->which);
> > -	if (!state)
> > -		return -EINVAL;
> > +	ret = vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
> > +	if (ret)
> > +		return ret;
> >
> > -	format = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
> > +	if (fse->pad == UDS_PAD_SOURCE) {
> > +		struct v4l2_subdev_state *state;
> > +		struct v4l2_mbus_framefmt *format;
> >
> > -	mutex_lock(&uds->entity.lock);
> > +		state = vsp1_entity_get_state(&uds->entity, sd_state,
> > +					      fse->which);
> > +		if (!state)
> > +			return -EINVAL;
> >
> > -	if (fse->index || fse->code != format->code) {
> > -		ret = -EINVAL;
> > -		goto done;
> > -	}
> > +		format = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
> > +
> > +		guard(mutex)(&uds->entity.lock);
> >
> > -	if (fse->pad == UDS_PAD_SINK) {
> > -		fse->min_width = UDS_MIN_SIZE;
> > -		fse->max_width = UDS_MAX_SIZE;
> > -		fse->min_height = UDS_MIN_SIZE;
> > -		fse->max_height = UDS_MAX_SIZE;
> > -	} else {
> >  		uds_output_limits(format->width, &fse->min_width,
> >  				  &fse->max_width);
> >  		uds_output_limits(format->height, &fse->min_height,
> >  				  &fse->max_height);
> >  	}
> >
> > -done:
> > -	mutex_unlock(&uds->entity.lock);
> > -	return ret;
> > +	return 0;
> >  }
> >
> >  static void uds_try_format(struct vsp1_uds *uds,

-- 
Regards,

Laurent Pinchart

