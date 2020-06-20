Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CF020276C
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 01:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgFTXoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 19:44:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59700 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgFTXob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 19:44:31 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69788552;
        Sun, 21 Jun 2020 01:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592696669;
        bh=M79ETXTzM32J79uNfHOc2I4TcDZ3nt/E76NRU/wBgpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RpZ9oN6R/xRT0kJlD3U3aLzTUG70dZM7RKMuz1h8mp5xIDuJjodt7blBBwkbjfr2z
         x+nmJ7NWqluRAD+YBLXfb9hRdHDR9RWRyuZXZtKMZhkDekHqST0LoiY9byq9P8fd/1
         N+5OcRz4LCbtgQ3V1jIRo+tHdtpQxDpAXB7NHhJY=
Date:   Sun, 21 Jun 2020 02:44:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: v4l2-async: Log message in case of
 heterogenous fwnode match
Message-ID: <20200620234405.GD20179@pendragon.ideasonboard.com>
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200318002507.30336-4-laurent.pinchart+renesas@ideasonboard.com>
 <20200318140326.nbgyhad3zxgaxjgd@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200318140326.nbgyhad3zxgaxjgd@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Mar 18, 2020 at 03:03:26PM +0100, Jacopo Mondi wrote:
> On Wed, Mar 18, 2020 at 02:25:06AM +0200, Laurent Pinchart wrote:
> > When a notifier supplies a device fwnode and a subdev supplies an
> > endpoint fwnode, incorrect matches may occur if multiple subdevs
> > correspond to the same device fwnode. This can't be handled
> > transparently in the framework, and requires the notifier to switch to
> > endpoint fwnodes. Log a message to notify of this problem. A second
> > message is added to help accelerating the transition to endpoint
> > matching.
> >
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
> > +	 * side that matched on a device fwnode to print its driver name.
> > +	 */
> > +	if (sd_fwnode_is_ep)
> > +		dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
> > +		    : notifier->sd->dev;
> 
> Have you considered passing the device directly ? seems notifier is
> only used for that...

Yes, but I thought that match functions could use the notifier for other
purposes in the future, so I think this approach is more versatile.

> Apart this small nit, for the series
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> > +	else
> > +		dev = sd->dev;
> > +
> > +	if (dev && dev->driver) {
> > +		if (sd_fwnode_is_ep)
> > +			dev_info(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
> > +				 dev->driver->name);
> > +		dev_info(dev, "Consider updating driver %s to match on endpoints\n",
> > +			 dev->driver->name);
> > +	}
> > +
> > +	return true;
> >  }
> >
> >  static bool match_custom(struct v4l2_async_notifier *notifier,

-- 
Regards,

Laurent Pinchart
