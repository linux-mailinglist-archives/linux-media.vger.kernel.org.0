Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BDE474E66
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 00:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbhLNXBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 18:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbhLNXBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 18:01:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC9CC061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 15:01:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F15D292;
        Wed, 15 Dec 2021 00:01:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639522876;
        bh=WW05fv1VLQrbsGZbylUTBiWpqUxjM7JMu++jEWs2he8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IEeCxvWQfkN4g4qZhFGelmInKwbfZEOLAMmx2skgO18hs78L8X2oneNmcDdS2vn66
         tsAJc27oK7Eg5QrZdeu1sj0kXZyNUKrMC3uyQ9AUsNy5jZnTdsUJ/kUszbPB3x+ePV
         1NoRTSa0OUNBfr7DT/mFIT2JmwsNCAsOrez1K4pk=
Date:   Wed, 15 Dec 2021 01:01:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 5/5] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Message-ID: <YbkiOoHnl9duDjUR@pendragon.ideasonboard.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-6-djrscally@gmail.com>
 <YbkZEDKHP2gyKjqd@pendragon.ideasonboard.com>
 <73e56a19-13a8-2c76-386f-dbc5e1babce7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73e56a19-13a8-2c76-386f-dbc5e1babce7@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Dec 14, 2021 at 10:36:01PM +0000, Daniel Scally wrote:
> On 14/12/2021 22:22, Laurent Pinchart wrote:
> > On Mon, Dec 13, 2021 at 11:28:49PM +0000, Daniel Scally wrote:
> >> Upon an async fwnode match, there's some typical behaviour that the
> >> notifier and matching subdev will want to do. For example, a notifier
> >> representing a sensor matching to an async subdev representing its
> >> VCM will want to create an ancillary link to expose that relationship
> >> to userspace.
> >>
> >> To avoid lots of code in individual drivers, try to build these links
> >> within v4l2 core.
> >>
> >> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >> ---
> >> Changes since the rfc:
> >>
> >> 	- None
> >>
> >>  drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
> >>  1 file changed, 51 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> >> index 0404267f1ae4..6575b1cbe95f 100644
> >> --- a/drivers/media/v4l2-core/v4l2-async.c
> >> +++ b/drivers/media/v4l2-core/v4l2-async.c
> >> @@ -275,6 +275,45 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> >>  static int
> >>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> >>  
> >> +static int
> >> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
> >> +				   struct v4l2_subdev *sd)
> >> +{
> >> +	struct media_link *link;
> >> +
> >> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> >> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
> >> +		return -EINVAL;
> >> +
> >> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
> > 
> > Is there a guarantee at this point that notifier->sd->entity has already
> > been registered with the media_device ? That's done by
> > media_device_register_entity() called from
> > v4l2_device_register_subdev().
> 
> v4l2_async_match_notify() calls v4l2_device_register_subdev() before the
> point that I've added the call to v4l2_async_try_create_links(), so I
> think that's covered there.

It calls it on sd, not notifier->sd. It's the latter that concerns me.

> >> +					   MEDIA_LNK_FL_ENABLED |
> >> +					   MEDIA_LNK_FL_IMMUTABLE);
> >> +
> >> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
> >> +}
> >> +
> >> +/*
> >> + * Setup links on behalf of the notifier and subdev, where it's obvious what
> > 
> > s/Setup/Create/ ("link setup" refers to another operation, enabling and
> > disabling links at runtime)
> 
> Yes, good point; although that too is a piece of terminology I find a
> bit jarring to be honest; I would have named that function
> media_entity_configure_link()
> 
> >> + * should be done. At the moment, we only support cases where the notifier
> >> + * is a sensor and the subdev is a lens.
> > 
> > s/sensor/camera sensor/
> > s/lens/lens controller/
> > 
> >> + *
> >> + * TODO: Setup pad links if the notifier's function is MEDIA_ENT_F_VID_IF_BRIDGE
> >> + * and the subdev's is MEDIA_ENT_F_CAM_SENSOR
> >> + */
> >> +static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
> >> +				       struct v4l2_subdev *sd)
> >> +{
> >> +	if (!notifier->sd)
> >> +		return 0;
> >> +
> >> +	switch (notifier->sd->entity.function) {
> >> +	case MEDIA_ENT_F_CAM_SENSOR:
> >> +		return __v4l2_async_create_ancillary_link(notifier, sd);
> >> +	default:
> >> +		return 0;
> >> +	}
> >> +}
> >> +
> >>  static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >>  				   struct v4l2_device *v4l2_dev,
> >>  				   struct v4l2_subdev *sd,
> >> @@ -293,6 +332,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >>  		return ret;
> >>  	}
> >>  
> >> +	/*
> >> +	 * Depending of the function of the entities involved, we may want to
> >> +	 * create links between them (for example between a sensor and its lens
> >> +	 * or between a sensor's source pad and the connected device's sink
> >> +	 * pad)
> > 
> > s/)/)./
> > 
> >> +	 */
> >> +	ret = v4l2_async_try_create_links(notifier, sd);
> >> +	if (ret) {
> >> +		v4l2_device_unregister_subdev(sd);
> >> +		return ret;
> >> +	}
> >> +
> >>  	/* Remove from the waiting list */
> >>  	list_del(&asd->list);
> >>  	sd->asd = asd;

-- 
Regards,

Laurent Pinchart
