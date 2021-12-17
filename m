Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D068447932F
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 18:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239961AbhLQRzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 12:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbhLQRzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 12:55:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DD0C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Dec 2021 09:55:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 738BF93;
        Fri, 17 Dec 2021 18:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639763705;
        bh=+sO0awAPvb4G2BEz01+/kjKxoErVX9Jnjy1DAkim3zA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aCxd+v2K+GyjCCNW08oPgTy6Fpl0pwe8vT0Sm5sg6EE0JOsvx/E+Cj+I/i00DfUZx
         ZcmY36E3S2GazqLvXwzxZitU/+8HAUaJaKatuoWebfVRUvLItl0wmazMOxTwKJGDrv
         1UFKtQF0JqtBEN10DvL40QfZ9nZEDiSPyy4TYPj4=
Date:   Fri, 17 Dec 2021 19:55:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 05/38] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Message-ID: <YbzO99yha/iG3OyG@pendragon.ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-6-tomi.valkeinen@ideasonboard.com>
 <66a7fd43-663a-a180-4ddf-82dc896d3e16@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66a7fd43-663a-a180-4ddf-82dc896d3e16@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Dec 17, 2021 at 12:48:56PM +0100, Hans Verkuil wrote:
> On 30/11/2021 15:15, Tomi Valkeinen wrote:
> > All suitable subdev ops are now passed either the TRY or the ACTIVE
> > state by the v4l2 core. However, other subdev drivers can still call the
> > ops passing NULL as the state, implying the active case.
> > 
> > For all current upstream drivers this doesn't matter, as they do not
> > expect to get a valid state for ACTIVE case. But future drivers which
> > support multiplexed streaming and routing will depend on getting a state
> > for both active and try cases.
> > 
> > For new drivers we can mandate that the pipelines where the drivers are
> > used need to pass the state properly, or preferably, not call such
> > subdev ops at all.
> > 
> > However, if an existing subdev driver is changed to support multiplexed
> > streams, the driver has to consider cases where its ops will be called
> > with NULL state. The problem can easily be solved by using the
> > v4l2_subdev_lock_and_return_state() helper, introduced here.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 1810dde9c7fc..873bbe0686e3 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1317,4 +1317,35 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> >   */
> >  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
> >  
> > +/**
> > + * v4l2_subdev_lock_and_return_state() - Gets locked TRY or ACTIVE subdev state
> > + * @sd: subdevice
> > + * @state: subdevice state as passed to the subdev op
> > + *
> > + * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
> > + * NULL as the state parameter, as subdevs always used to have their active
> > + * state stored privately.
> > + *
> > + * However, newer state-aware subdev drivers, which store their active state in
> > + * a common place, subdev->active_state, expect to always get a proper state as
> > + * a parameter.
> > + *
> > + * These state-aware drivers can use v4l2_subdev_lock_and_return_state() instead
> > + * of v4l2_subdev_lock_state(). v4l2_subdev_lock_and_return_state() solves the
> > + * issue by using subdev->state in case the passed state is NULL.
> 
> Should be: by using subdev->active_state
> 
> With that change:
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Please note that the first 6 patches from this series have been posted
in a new version as "[PATCH v2 0/6] v4l: subdev active state"
(20211217135022.364954-1-tomi.valkeinen@ideasonboard.com).

> > + *
> > + * This is a temporary helper function, and should be removed when we can ensure
> > + * that all drivers pass proper state when calling other subdevs.
> > + */
> > +static inline struct v4l2_subdev_state *
> > +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *state)
> > +{
> > +	state = state ? state : sd->active_state;
> > +
> > +	v4l2_subdev_lock_state(state);
> > +
> > +	return state;
> > +}
> > +
> >  #endif
> > 

-- 
Regards,

Laurent Pinchart
