Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7643547558F
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 10:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241359AbhLOJzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 04:55:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51732 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233823AbhLOJzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 04:55:05 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA624292;
        Wed, 15 Dec 2021 10:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639562104;
        bh=Owpkw8ItCbtZtIQsPjnaUibtqD5JmFO9ijjqHGgWJjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ndR4yvM5OUyVIk3iJFFt7jvcqLF/BvNz10vY0C3CDF47uWCxDhV5quwMoN4nI1WXm
         CIvGRy8JKoLW+nghM5Rteh5+QgoegtklAhJdC6GHOdWREtrPUbx8igEZzQ8fAEthxJ
         03FIHtngc1Mb1bHxljGWEmqk/BTxmzf1kTtbM60Y=
Date:   Wed, 15 Dec 2021 11:55:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 5/5] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Message-ID: <Ybm7dR81LjKQycSB@pendragon.ideasonboard.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-6-djrscally@gmail.com>
 <YbkZEDKHP2gyKjqd@pendragon.ideasonboard.com>
 <73e56a19-13a8-2c76-386f-dbc5e1babce7@gmail.com>
 <YbkiOoHnl9duDjUR@pendragon.ideasonboard.com>
 <35553048-f338-8650-027f-708cfaac030d@gmail.com>
 <YbmvrHzvM9UzmwcV@pendragon.ideasonboard.com>
 <Ybm4/Ulnw5VwSOSk@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ybm4/Ulnw5VwSOSk@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Dec 15, 2021 at 11:44:29AM +0200, Sakari Ailus wrote:
> On Wed, Dec 15, 2021 at 11:04:44AM +0200, Laurent Pinchart wrote:
> > On Tue, Dec 14, 2021 at 11:41:27PM +0000, Daniel Scally wrote:
> > > On 14/12/2021 23:01, Laurent Pinchart wrote:
> > > > On Tue, Dec 14, 2021 at 10:36:01PM +0000, Daniel Scally wrote:
> > > >> On 14/12/2021 22:22, Laurent Pinchart wrote:
> > > >>> On Mon, Dec 13, 2021 at 11:28:49PM +0000, Daniel Scally wrote:
> > > >>>> Upon an async fwnode match, there's some typical behaviour that the
> > > >>>> notifier and matching subdev will want to do. For example, a notifier
> > > >>>> representing a sensor matching to an async subdev representing its
> > > >>>> VCM will want to create an ancillary link to expose that relationship
> > > >>>> to userspace.
> > > >>>>
> > > >>>> To avoid lots of code in individual drivers, try to build these links
> > > >>>> within v4l2 core.
> > > >>>>
> > > >>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> > > >>>> ---
> > > >>>> Changes since the rfc:
> > > >>>>
> > > >>>> 	- None
> > > >>>>
> > > >>>>  drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
> > > >>>>  1 file changed, 51 insertions(+)
> > > >>>>
> > > >>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > >>>> index 0404267f1ae4..6575b1cbe95f 100644
> > > >>>> --- a/drivers/media/v4l2-core/v4l2-async.c
> > > >>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > >>>> @@ -275,6 +275,45 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > > >>>>  static int
> > > >>>>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> > > >>>>  
> > > >>>> +static int
> > > >>>> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
> > > >>>> +				   struct v4l2_subdev *sd)
> > > >>>> +{
> > > >>>> +	struct media_link *link;
> > > >>>> +
> > > >>>> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> > > >>>> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > > >>>> +		return -EINVAL;
> > > >>>> +
> > > >>>> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
> > > >>>
> > > >>> Is there a guarantee at this point that notifier->sd->entity has already
> > > >>> been registered with the media_device ? That's done by
> > > >>> media_device_register_entity() called from
> > > >>> v4l2_device_register_subdev().
> > > >>
> > > >> v4l2_async_match_notify() calls v4l2_device_register_subdev() before the
> > > >> point that I've added the call to v4l2_async_try_create_links(), so I
> > > >> think that's covered there.
> > > >
> > > > It calls it on sd, not notifier->sd. It's the latter that concerns me.
> > > 
> > > Ah, you're right of course...I guess in that case the notifier->sd would
> > > get registered during the v4l2_async_match_notify() where the sensor
> > > driver's subdev is sd, but I don't think there's any guarantee that that
> > > would happen first...I haven't traced it through but my guess is that it
> > > would depend on the order in which the ipu3-cio2, sensor and lens
> > > controller drivers probed. I'll check to try and be sure how it works
> > > tomorrow
> > 
> > I was looking at media_device_register_entity(), and it sets
> > 
> > 	INIT_LIST_HEAD(&entity->links);
> > 	entity->num_links = 0;
> > 	entity->num_backlinks = 0;
> > 
> > If we create links before that, things may go bad.
> 
> Yes.
> 
> There's a guarantee that the notifier's complete callback is called once
> the notifier's subdevs as well as sub-notifiers are bound and complete. But
> there's no guarantee on the initialisation of related entities.
> 
> Especially for sensors, the async subdev is registered after the sensor's
> own async notifier.
> 
> I wonder if the ugly registered callback could be used for this purpose.
> Better of course would be to avoid that.

I'd really like all these links to be created automatically by the code,
but given the very loosely defined rules regarding entity
initialization, I'm worried this may not be possible without quite a bit
of cleanup first :-(

It looks like quite a bit of the work done in
media_device_register_entity() could (and likely should) be moved to
media_entity_init(), but I'm not sure if that would be enough to
properly fix the issue.

-- 
Regards,

Laurent Pinchart
