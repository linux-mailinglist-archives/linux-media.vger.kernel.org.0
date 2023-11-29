Return-Path: <linux-media+bounces-1365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A47FD8DB
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 15:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9143282D6D
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E30249FE;
	Wed, 29 Nov 2023 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bRsY/8PI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BE610C9
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 06:01:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1895276;
	Wed, 29 Nov 2023 15:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701266439;
	bh=bsCUEPHkbprB2cJmvODkL1CKSTSpgzCDjFBzaqTwR14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRsY/8PI+I3BXcVDSj1253PkM11rFlJGLnaZNjiruXI1p0RWZD8xwq9U0Org+j+gt
	 tuMCzi67VmC40UA2IgagKqMsbUCEBUte9An2hzrO+w31AJaIz7PpiL9LZHqpdjxVfe
	 rKcmNDAZcusdMJFQ3nr63z9/FQYfpRxxrSVf2DE0=
Date: Wed, 29 Nov 2023 16:01:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jacopo Mondi <jacopo@jmondi.org>, Bingbu Cao <bingbu.cao@intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Maxime Ripard <mripard@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 1/1] media: v4l2-subdev: Rename .init_cfg() operation
 to .init_state()
Message-ID: <20231129140122.GE18109@pendragon.ideasonboard.com>
References: <20231127090744.30012-1-laurent.pinchart@ideasonboard.com>
 <20231127090744.30012-2-laurent.pinchart@ideasonboard.com>
 <a3bfe0e7-45de-41ce-b720-078f69cdcd69@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3bfe0e7-45de-41ce-b720-078f69cdcd69@xs4all.nl>

Hi Hans,

On Tue, Nov 28, 2023 at 09:55:06AM +0100, Hans Verkuil wrote:
> On 27/11/2023 10:07, Laurent Pinchart wrote:
> > The subdev .init_cfg() operation is affected by two issues:
> > 
> > - It has long been extended to initialize a whole v4l2_subdev_state
> >   instead of just a v4l2_subdev_pad_config, but its name has stuck
> >   around.
> > 
> > - Despite operating on a whole subdev state and not being directly
> >   exposed to the subdev users (either in-kernel or through the userspace
> >   API), .init_cfg() is categorized as a subdev pad operation.
> > 
> > This participates in making the subdev API confusing for new developers.
> > Fix it by renaming the operation to .init_state(), and make it a subdev
> > internal operation.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Michael Riesch <michael.riesch@wolfvision.net> # for imx415
> > Acked-by: Shuah Khan <skhan@linuxfoundation.org> # for vimc
> > ---
> > Changes since v3:
> > 
> > - Rebase on top of the new stm32-dcmipp driver
> > - Fix uninitialized variable in __v4l2_subdev_state_alloc() due to bad
> >   rebase
> > 
> > Changes since v2:
> > 
> > - Rebase on top of the latest media tree
> > 
> > Changes since v1:
> > 
> > - Fix compilation of the vsp1 driver
> > ---
> 
> <snip>
> 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > index 0280b8ff7ba9..0a5a7f9cc870 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> > @@ -170,33 +170,6 @@ vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
> >  	}
> >  }
> >  
> > -/*
> > - * vsp1_entity_init_cfg - Initialize formats on all pads
> > - * @subdev: V4L2 subdevice
> > - * @sd_state: V4L2 subdev state
> > - *
> > - * Initialize all pad formats with default values in the given subdev state.
> > - * This function can be used as a handler for the subdev pad::init_cfg
> > - * operation.
> > - */
> > -int vsp1_entity_init_cfg(struct v4l2_subdev *subdev,
> > -			 struct v4l2_subdev_state *sd_state)
> > -{
> > -	unsigned int pad;
> > -
> > -	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
> > -		struct v4l2_subdev_format format = {
> > -			.pad = pad,
> > -			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
> > -			       : V4L2_SUBDEV_FORMAT_ACTIVE,
> > -		};
> > -
> > -		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >  /*
> >   * vsp1_subdev_get_pad_format - Subdev pad get_fmt handler
> >   * @subdev: V4L2 subdevice
> > @@ -424,6 +397,29 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
> >  	return ret;
> >  }
> >  
> > +static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
> > +				  struct v4l2_subdev_state *sd_state)
> > +{
> > +	unsigned int pad;
> > +
> > +	/* Initialize all pad formats with default values. */
> > +	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
> > +		struct v4l2_subdev_format format = {
> > +			.pad = pad,
> > +			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
> > +			       : V4L2_SUBDEV_FORMAT_ACTIVE,
> > +		};
> > +
> > +		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_internal_ops vsp1_entity_internal_ops = {
> > +	.init_state = vsp1_entity_init_state,
> > +};
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Media Operations
> >   */
> > @@ -658,6 +654,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
> >  	/* Initialize the V4L2 subdev. */
> >  	subdev = &entity->subdev;
> >  	v4l2_subdev_init(subdev, ops);
> > +	subdev->internal_ops = &vsp1_entity_internal_ops;
> >  
> >  	subdev->entity.function = function;
> >  	subdev->entity.ops = &vsp1->media_ops;
> > @@ -666,7 +663,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
> >  	snprintf(subdev->name, sizeof(subdev->name), "%s %s",
> >  		 dev_name(vsp1->dev), name);
> >  
> > -	vsp1_entity_init_cfg(subdev, NULL);
> > +	vsp1_entity_init_state(subdev, NULL);
> 
> This is the only media driver that calls init_cfg/state directly.
> That's a bit unexpected, and perhaps this could use a comment. That
> can be a follow-up patch as well.

I have already posted a patch series to drop all this and use the V4L2
subdev active state API. That is hopefully better than a comment :-)

There are actually quite a few sensor drivers that don't use the active
state, and call the .init_cfg() handler at probe time to initialize
their private copy of the active state. All this should eventually go
away as drivers are converter. I try to keep an eye when reviewing new
code and push all new drivers to use the subdev active state.

> >  
> >  	/*
> >  	 * Allocate the subdev state to store formats and selection
> 
> In any case, you can add my:
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> to this patch.

-- 
Regards,

Laurent Pinchart

