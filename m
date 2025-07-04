Return-Path: <linux-media+bounces-36867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34316AF9ABE
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 20:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3956148555C
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 18:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02182147F9;
	Fri,  4 Jul 2025 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LdXArvf3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D720D4E7;
	Fri,  4 Jul 2025 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653670; cv=none; b=b5p5/R1AGTQ/EjitNZUjoSQXq2AyKVAkfKHZA9/jrYOAJ/5nBuL4IUCQ+NE1Bwp7oPZR3lmhP6pgeysahGn4MLRnkCcoXcG30PU0YJmG2qDl7qS2Ku6Ukj0wMXHqdTj/ygCMV24RHQIXz+EqTIruNZtNGyd04tVt4by0N9f/9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653670; c=relaxed/simple;
	bh=Zj5qu/kkmfBFwOZ2USLUoDM/IE0DN8MTCFgGhhVnSho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YymfGWnNEtTdzqqTB8sbSjynzQrLrtZAgalB8RZiYuEn8taJIhktxijwMsJFfsX0eGk9PwTnfCCvBbF9fPiozZIVM8gfkevbwIwV3tjemMOu5661Sj+VwIHe5i24mGeHvW/qZ6Ut6dUIJvodPgsiZr6FZpXq9ihLh0sHXMD+vNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LdXArvf3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8A460669;
	Fri,  4 Jul 2025 20:27:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751653641;
	bh=Zj5qu/kkmfBFwOZ2USLUoDM/IE0DN8MTCFgGhhVnSho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdXArvf3QpJL0MSNFj8lJ2DKwj99kSMCvBayVA3Lgo1GTXKg/gBPnrjHdfXG3uBTF
	 J1BSQPewjcMAwndJr3MQmxBfgMrx574tX35cMiPQnTELkL7KhLCWiG2NjxLIU5nGHs
	 pMKfXJhAozqqyZK/eqZC3ysPZrdtHawslMUt5dZs=
Date: Fri, 4 Jul 2025 21:27:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 3/8] media: renesas: vsp1: Fix code checks in frame
 size enumeration
Message-ID: <20250704182718.GA30285@pendragon.ideasonboard.com>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250704001812.30064-4-laurent.pinchart+renesas@ideasonboard.com>
 <tsa2qbc6lqvo5xbl4rdr5suxpoqlxd3qppvx7mvliwv2jinzij@3vjpl4df23ec>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tsa2qbc6lqvo5xbl4rdr5suxpoqlxd3qppvx7mvliwv2jinzij@3vjpl4df23ec>

On Fri, Jul 04, 2025 at 06:27:48PM +0200, Jacopo Mondi wrote:
> On Fri, Jul 04, 2025 at 03:18:07AM +0300, Laurent Pinchart wrote:
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
> > While at it, include the missing <linux/mutex.h> as the code locks
> > mutexes.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Include <linux/cleanup.h> and <linux/mutex.h>
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_entity.c | 49 ++++++++++++-------
> >  .../media/platform/renesas/vsp1/vsp1_sru.c    | 38 +++++++-------
> >  .../media/platform/renesas/vsp1/vsp1_uds.c    | 38 +++++++-------
> >  3 files changed, 64 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > index 04b7ae6fb935..892a2adfdf3a 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > @@ -7,8 +7,10 @@
> >   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/device.h>
> >  #include <linux/gfp.h>
> > +#include <linux/mutex.h>
> >
> >  #include <media/media-entity.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -238,42 +240,51 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
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
> > index 1dc34e6a510d..37fd36d09045 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> > @@ -7,8 +7,10 @@
> >   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/device.h>
> >  #include <linux/gfp.h>
> > +#include <linux/mutex.h>
> >
> >  #include <media/v4l2-subdev.h>
> >
> > @@ -116,29 +118,25 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
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
> 
> Here, in case of PAD_SOURCE, we have validated that the fse->code
> matches the format on the sink
> 
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
> 
> and we get here where we do SRU-specific adjustments to the sizes but
> we don't re-check for the code.
> 
> Can the code on the sink change between the above call to
> vsp1_subdev_enum_frame_size() and here ? Is this a concern ?

I guess it could change, but I don't think that's a concern. The only
reason we check the format is to return an error if it doesn't match.
Failure to do so will make enumeration of sizes succeed with an
incorrect format, but will have no other bad effect. As such a case will
only occur when userspace races itself, I don't think we introduce a
problem here. If the change occurs after validation and before the
enum_frame_size call returns to userspace, that won't be distinguishible
in userspace from a case where the enum_frame_size function completes
before the change, followed by the current thread being scheduled out,
and returning from the ioctl after the format change completes.

All this will also get simplified when switching to the subdev active
state API, which I'm working on.

> Same for UDS I guess..
> 
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
> > @@ -151,9 +149,7 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
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
> > index 8006d49ffbea..dd4722315c56 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> > @@ -7,8 +7,10 @@
> >   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/device.h>
> >  #include <linux/gfp.h>
> > +#include <linux/mutex.h>
> >
> >  #include <media/v4l2-subdev.h>
> >
> > @@ -121,38 +123,32 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
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

