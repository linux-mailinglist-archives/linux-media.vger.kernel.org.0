Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C07202759
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 01:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgFTXOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 19:14:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57036 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbgFTXOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 19:14:52 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B588532;
        Sun, 21 Jun 2020 01:14:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592694890;
        bh=LgsUQqHiMawIS/GxWayIMDBgw4Xir9RZxuOZ8W6wCwk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uNk/auS8qKqwLCNUJOH8t+Mmxo0M4kIEcuux16ni71pq/NbKTEroDO341EumX6bRr
         Pt+vdUcJ/JtIgf+DF4KEq1Ckqd1QIWZVQpj3zhPoCc49C8RBJCmDQrRSzJXfzOn+DD
         JMwzY35xKuewcR/IEAL1EuipF+EGXHbMI84rUy8o=
Date:   Sun, 21 Jun 2020 02:14:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: v4l2-async: Log message in case of
 heterogenous fwnode match
Message-ID: <20200620231426.GB20179@pendragon.ideasonboard.com>
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200318002507.30336-4-laurent.pinchart+renesas@ideasonboard.com>
 <a7d96e73-c86c-951e-d586-a1cee1a7fa59@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a7d96e73-c86c-951e-d586-a1cee1a7fa59@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Mar 18, 2020 at 09:16:01AM +0000, Kieran Bingham wrote:
> On 18/03/2020 00:25, Laurent Pinchart wrote:
> > When a notifier supplies a device fwnode and a subdev supplies an
> > endpoint fwnode, incorrect matches may occur if multiple subdevs
> > correspond to the same device fwnode. This can't be handled
> > transparently in the framework, and requires the notifier to switch to
> > endpoint fwnodes. Log a message to notify of this problem. A second
> > message is added to help accelerating the transition to endpoint
> > matching.
> 
> Only minor comments and discussion below:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 224b39a7aeb1..9f393a7be455 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -77,6 +77,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  	struct fwnode_handle *dev_fwnode;
> >  	bool asd_fwnode_is_ep;
> >  	bool sd_fwnode_is_ep;
> > +	struct device *dev;
> >  	const char *name;
> >  
> >  	/*
> > @@ -113,7 +114,28 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  
> >  	fwnode_handle_put(dev_fwnode);
> >  
> > -	return dev_fwnode == other_fwnode;
> > +	if (dev_fwnode != other_fwnode)
> > +		return false;
> > +
> > +	/*
> > +	 * We have an heterogenous match. Retrieve the struct device of the
> 
> s/an/a/
> 
> s/heterogenous/heterogeneous/ (and that's not an en-gb/en-us thing)
> Also in $SUBJECT
> 
> > +	 * side that matched on a device fwnode to print its driver name.
> > +	 */
> > +	if (sd_fwnode_is_ep)
> > +		dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
> > +		    : notifier->sd->dev;
> 
> Eugh ... I guess if this gets needed elsewhere, notifiers need a helper
> to get the appropriate dev out... but if this is the only place, then so
> be it.

I'll let the next person who needs this create a helper :-)

> > +	else
> > +		dev = sd->dev;
> > +
> > +	if (dev && dev->driver) {
> > +		if (sd_fwnode_is_ep)
> > +			dev_info(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
> > +				 dev->driver->name);
> > +		dev_info(dev, "Consider updating driver %s to match on endpoints\n",
> > +			 dev->driver->name);
> 
> I think I interpret that in the case that existing drivers match on
> dev->dev (i.e. no endpoints involved) then this will not print, as we
> would already have matched and returned earlier in the function.
> 
> I don't think that's a problem, but it means people will not be
> 'encouraged' to move to endpoint matching until they encounter a device
> which uses endpoints.
> 
> Perhaps that's ok ... but I was almost thinking of being more 'pushy'
> and guiding device matches to move to endpoints too ;-)

I don't think we can do that, as not all devices have endpoints. For
instance, a lens controller or a flash controller will be referred to by
phandle properties, without using OF graph. We still need to support
matching them.

> > +	}
> > +
> > +	return true;
> >  }
> >  
> >  static bool match_custom(struct v4l2_async_notifier *notifier,

-- 
Regards,

Laurent Pinchart
