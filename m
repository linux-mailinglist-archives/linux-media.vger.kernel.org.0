Return-Path: <linux-media+bounces-19771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C09A1372
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 22:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59BF285710
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 20:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8C7218D8E;
	Wed, 16 Oct 2024 20:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MR/ToICw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A9A2170B4;
	Wed, 16 Oct 2024 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729109325; cv=none; b=Vdc3fF4P2p78hLsdKrP9V0gaRfULA8ruy5eGDtqweeHx3gvroxMb9adRoJccyK4rJVC4cBdmM6VRDpsI2dQytQbXwYJqVoJ+40xxBixv6TqJ6tdjUlVjZ9vHQQjGzNgj2vRp/N+KdeOcU6V1TcoCo/HNNkuaglXGFREABkW01kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729109325; c=relaxed/simple;
	bh=ncs4lF1J9377PDY2VvSSwpTm5rKBTECZUImi+NbuJeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RW09Y1EUrjYuEAQT46MqPE0OeOxKagczhsqJjV0vtuoZZkUVKzmPqspUKbC00GThizVqMRWmeScggZ9eyrYNBzMujjY1nLG6lOHtpKvUxL9uVzHL9YEwohqkbkCp+y044ctj59Y1re4BpT4vXL8Z1LtRlMRebqyp/k5dqbCVod8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MR/ToICw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E095EA57;
	Wed, 16 Oct 2024 22:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729109219;
	bh=ncs4lF1J9377PDY2VvSSwpTm5rKBTECZUImi+NbuJeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MR/ToICwjBRDRCcjflya5yRQGvj7PhH4hm8tpkGZhpegzCbKewENLC9AJHVjSpm/n
	 oUtmUvyBz2H+XGSmddarclutrXxTZHXYzRkrtJQcfiNW4moWAKXrzMQNcZ1nipDzBx
	 8Zfe9Opd+DSeJIC2daIPjAFiizyucr1AB69kaZfU=
Date: Wed, 16 Oct 2024 23:08:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS supporty
Message-ID: <20241016200836.GF30496@pendragon.ideasonboard.com>
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
 <20241014175452.GB13238@pendragon.ideasonboard.com>
 <Zw4IrU8bOOtq26Gx@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zw6aZiBvRM5hvqVn@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

Hi Tommaso,

On Tue, Oct 15, 2024 at 06:37:58PM +0200, Tommaso Merciai wrote:
> On Tue, Oct 15, 2024 at 08:16:13AM +0200, Tommaso Merciai wrote:
> > On Mon, Oct 14, 2024 at 08:54:52PM +0300, Laurent Pinchart wrote:
> > > On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> > > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > > userspace has to be able to subscribe to control events so that it is
> > > > notified when the control changes value.
> > > > Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> > > > 
> > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > > ---
> > > >  drivers/media/i2c/ov5645.c | 10 +++++++++-
> > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > > index 0c32bd2940ec..2c5145d5c616 100644
> > > > --- a/drivers/media/i2c/ov5645.c
> > > > +++ b/drivers/media/i2c/ov5645.c
> > > > @@ -29,6 +29,7 @@
> > > >  #include <linux/slab.h>
> > > >  #include <linux/types.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > > +#include <media/v4l2-event.h>
> > > >  #include <media/v4l2-fwnode.h>
> > > >  #include <media/v4l2-subdev.h>
> > > >  
> > > > @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
> > > >  	.s_stream = ov5645_s_stream,
> > > >  };
> > > >  
> > > > +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> > > > +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > > +};
> > > > +
> > > >  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > >  	.enum_mbus_code = ov5645_enum_mbus_code,
> > > >  	.enum_frame_size = ov5645_enum_frame_size,
> > > > @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> > > >  };
> > > >  
> > > >  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> > > > +	.core = &ov5645_subdev_core_ops,
> > > >  	.video = &ov5645_video_ops,
> > > >  	.pad = &ov5645_subdev_pad_ops,
> > > >  };
> > > > @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
> > > >  
> > > >  	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
> > > >  	ov5645->sd.internal_ops = &ov5645_internal_ops;
> > > > -	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > +	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > > 
> > > Instead of patching every subdev driver, should we handle all of this in
> > > the subdev core ? If a control handler is set for the subdev, we could
> > > set the HAS_EVENTS flag automatically, and default to
> > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > if there are no control operations.
> 
> Premit:
>  - Don't know if I'm wrong eh.

Nobody knows :-)

> This can be done into:
> 
> __v4l2_subdev_init_finalize()
> 
> Adding:
> 
> 	if (sd->ctrl_handler)
> 		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> 
> And check if there are no control operations using:
> 
> bool has_subscribe_event;
> bool has_unsubscribe_event;
> 
> 
> has_subscribe_event = v4l2_subdev_has_op(sd, core, subscribe_event);
> has_unsubscribe_event = v4l2_subdev_has_op(sd, core, unsubscribe_event);
> 
> if (!has_subscribe_event)
> 	assign v4l2_ctrl_subdev_subscribe_event as default .subscribe ops(somehow)

We can't change the ops structure as it's constant. Something like this
could do:

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3a4ba08810d2..41ae18a0d41e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -691,10 +691,24 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);

 	case VIDIOC_SUBSCRIBE_EVENT:
-		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
+		if (v4l2_subdev_has_op(sd, core, subscribe_event))
+			return v4l2_subdev_call(sd, core, subscribe_event, vfh,
+						arg);
+		else if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
+			 vfh->ctrl_handler)
+			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
+		else
+			return -ENOIOCTLCMD;

 	case VIDIOC_UNSUBSCRIBE_EVENT:
-		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
+		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
+			return -ENOIOCTLCMD;
+
+		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
+			return v4l2_subdev_call(sd, core, unsubscribe_event,
+						vfh, arg);
+		else
+			return v4l2_event_subdev_unsubscribe(sd, vfh, sub);

 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	case VIDIOC_DBG_G_REGISTER:

> if (!has_unsubscribe_event)
> 	assign v4l2_event_subdev_unsubscribe as default .unsubscribe ops (somehow)
> 
> 
> Or maybe v4l2_subdev_init_finalize() it's too late?
> I'm completely wrong? What do you think?

I like v4l2_subdev_init_finalize() as we're pushing all subdev drivers
to use it, so it's an extra incentive.

> > Well :)
> > Not every subdev drivers, but only the ones I'm testing.
> > 
> > Yesterday I was playing with ov5645 :) And I got:
> > 
> > v4l2-compliance -d /dev/v4l-subdev1
> > 
> > test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > fail: v4l2-test-controls.cpp(1108): subscribe event for control 'User Controls' failed
> > 
> > Joke apart fully agree and thanks for your hint!
> > I will take  a look :)
> > 
> > > >  	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > >  	ov5645->sd.dev = &client->dev;
> > > >  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;

-- 
Regards,

Laurent Pinchart

