Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA3A47A8F5
	for <lists+linux-media@lfdr.de>; Mon, 20 Dec 2021 12:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhLTLtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Dec 2021 06:49:01 -0500
Received: from mga14.intel.com ([192.55.52.115]:7101 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229619AbhLTLtB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Dec 2021 06:49:01 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="240371977"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="240371977"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 03:49:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="613040685"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 03:48:58 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9A29C21DB2;
        Mon, 20 Dec 2021 13:48:56 +0200 (EET)
Date:   Mon, 20 Dec 2021 13:48:56 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 05/38] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Message-ID: <YcBtqIFbQ8nut/WC@paasikivi.fi.intel.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-6-tomi.valkeinen@ideasonboard.com>
 <YbtObq+RJbW70pjD@pendragon.ideasonboard.com>
 <YbzMW+dvmwgZhhST@paasikivi.fi.intel.com>
 <YbzO3htQHR+gRT9M@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbzO3htQHR+gRT9M@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Dec 17, 2021 at 07:54:38PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Dec 17, 2021 at 07:43:55PM +0200, Sakari Ailus wrote:
> > On Thu, Dec 16, 2021 at 04:34:22PM +0200, Laurent Pinchart wrote:
> > > On Tue, Nov 30, 2021 at 04:15:03PM +0200, Tomi Valkeinen wrote:
> > > > All suitable subdev ops are now passed either the TRY or the ACTIVE
> > > > state by the v4l2 core. However, other subdev drivers can still call the
> > > > ops passing NULL as the state, implying the active case.
> > > > 
> > > > For all current upstream drivers this doesn't matter, as they do not
> > > > expect to get a valid state for ACTIVE case. But future drivers which
> > > > support multiplexed streaming and routing will depend on getting a state
> > > > for both active and try cases.
> > > > 
> > > > For new drivers we can mandate that the pipelines where the drivers are
> > > > used need to pass the state properly, or preferably, not call such
> > > > subdev ops at all.
> > > > 
> > > > However, if an existing subdev driver is changed to support multiplexed
> > > > streams, the driver has to consider cases where its ops will be called
> > > > with NULL state. The problem can easily be solved by using the
> > > > v4l2_subdev_lock_and_return_state() helper, introduced here.
> > > > 
> > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > ---
> > > >  include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
> > > >  1 file changed, 31 insertions(+)
> > > > 
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index 1810dde9c7fc..873bbe0686e3 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -1317,4 +1317,35 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> > > >   */
> > > >  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
> > > >  
> > > > +/**
> > > > + * v4l2_subdev_lock_and_return_state() - Gets locked TRY or ACTIVE subdev state
> > > > + * @sd: subdevice
> > > > + * @state: subdevice state as passed to the subdev op
> > > > + *
> > > > + * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
> > > > + * NULL as the state parameter, as subdevs always used to have their active
> > > > + * state stored privately.
> > > > + *
> > > > + * However, newer state-aware subdev drivers, which store their active state in
> > > > + * a common place, subdev->active_state, expect to always get a proper state as
> > > > + * a parameter.
> > > > + *
> > > > + * These state-aware drivers can use v4l2_subdev_lock_and_return_state() instead
> > > > + * of v4l2_subdev_lock_state(). v4l2_subdev_lock_and_return_state() solves the
> > > > + * issue by using subdev->state in case the passed state is NULL.
> > > > + *
> > > > + * This is a temporary helper function, and should be removed when we can ensure
> > > > + * that all drivers pass proper state when calling other subdevs.
> > > > + */
> > > > +static inline struct v4l2_subdev_state *
> > > > +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> > > > +				  struct v4l2_subdev_state *state)
> > > > +{
> > > > +	state = state ? state : sd->active_state;
> > > 
> > > Can we add a dev_warn() when state is NULL ? This will help speeding up
> > > the transition.
> > 
> > Wouldn't this produce lots of warnings? I'd rather use dev_warn_once() to
> > avoid flooding logs.
> 
> The goal is to notice the issue, to get it fixed, so I'd prefer a few
> warnings instead of a dev_warn_once().

This wouldn't be a few, but quite possibly system logs full of such lines
unless some kind of limiting factor is in place.

> 
> Please note that the first 6 patches from this series have been posted
> in a new version as "[PATCH v2 0/6] v4l: subdev active state"
> (20211217135022.364954-1-tomi.valkeinen@ideasonboard.com).

Yes, I see this is addressed in v2.

-- 
Sakari Ailus
