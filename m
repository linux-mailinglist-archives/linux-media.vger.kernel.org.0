Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FA647B213
	for <lists+linux-media@lfdr.de>; Mon, 20 Dec 2021 18:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240203AbhLTRZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Dec 2021 12:25:31 -0500
Received: from mga18.intel.com ([134.134.136.126]:43694 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233139AbhLTRZ3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Dec 2021 12:25:29 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="227083675"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="227083675"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 09:25:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="484128478"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 09:25:27 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id C9FC121DB2;
        Mon, 20 Dec 2021 19:25:24 +0200 (EET)
Date:   Mon, 20 Dec 2021 19:25:24 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 5/6] media: subdev: Add
 v4l2_subdev_lock_and_return_state()
Message-ID: <YcC8hBTaH39AeY2g@paasikivi.fi.intel.com>
References: <20211217135022.364954-1-tomi.valkeinen@ideasonboard.com>
 <20211217135022.364954-6-tomi.valkeinen@ideasonboard.com>
 <YcB8VPVuSqhY40A5@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcB8VPVuSqhY40A5@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 20, 2021 at 02:51:32PM +0200, Sakari Ailus wrote:
> Moi,
> 
> On Fri, Dec 17, 2021 at 03:50:21PM +0200, Tomi Valkeinen wrote:
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
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 867e19ef80bd..d6c7db1d37e4 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1321,4 +1321,40 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
> >   */
> >  void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
> >  
> > +/**
> > + * v4l2_subdev_lock_and_return_state() - Gets locked try or active subdev state
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
> > + * issue by using subdev->active_state in case the passed state is NULL.
> > + *
> > + * This is a temporary helper function, and should be removed when we can ensure
> > + * that all drivers pass proper state when calling other subdevs.
> > + */
> > +static inline struct v4l2_subdev_state *
> > +v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *state)
> > +{
> > +	if (!state)
> > +		dev_notice_once(sd->dev,
> 
> I thought about this a little more.
> 
> This currently warns once when there's something that calls the function
> with NULL state.
> 
> How about going a bit further, moving this to a macro so all instances will
> be covered, and then using WARN_ON_ONCE() so there would be a clear
> indication where the warning comes from?

Actually --- please ignore this. The function is already static inline in
the header and prints the device name. That should be enough to point out
the culprit.

-- 
Sakari Ailus
