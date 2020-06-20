Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9143920274A
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 01:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbgFTXFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 19:05:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728625AbgFTXFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 19:05:09 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1881C532;
        Sun, 21 Jun 2020 01:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592694304;
        bh=zW0d2Rohe8zQ0abE1oeyODsBSQJQuCqM9F8bIiQBhk4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YmUbey16lREtYx5Ms1JWu7+W2dYndg5bzGXIV5iKe55b6YiT5BLD2lD6QCZC8lKWj
         VaFNn/V5C5WS6CSYU5C3LeXru1VR3ZT4Qrtgn5ZF8vYnuBEX8AnwqIrL4Uuqicuz4T
         wOWDjhprrOb4ZEPJW2wdpZnPe1UP+38TkhsBGcsI=
Date:   Sun, 21 Jun 2020 02:04:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: v4l2-async: Don't check fwnode name to
 detect endpoint
Message-ID: <20200620230440.GA20179@pendragon.ideasonboard.com>
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200318002507.30336-5-laurent.pinchart+renesas@ideasonboard.com>
 <42d4269d-7498-b5f8-d966-86ecb75e7999@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42d4269d-7498-b5f8-d966-86ecb75e7999@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Mar 18, 2020 at 09:22:21AM +0000, Kieran Bingham wrote:
> On 18/03/2020 00:25, Laurent Pinchart wrote:
> > Use the presence of a "remote-endpoint" property to detect if a fwnode
> > is an endpoint node, as checking the node name won't work on ACPI-based
> > implementations.
> 
> Technically, won't this property only detect that the endpoint is
> connected to another endpoint, and 'un-connected' endpoints wont' match?
> 
> Of course in this instance - an unconnected endpoint is likely not much
> use and probably even shouldn't match ;-) ~(but it may still 'be' an
> endpoint).

Yes, technically speaking, this detects whether the node is an endpoint
and is connected. As you mentioned, there's little use in unconnected
endpoints here, as nobody would attempt to match them.

> Also - would this patch be squashed into 1/4?

I think that would make sense, yes. I'll do so in v3.

> I'll leave it to Sakari to comment on the actual validity of this
> approach all the same :-)

ACPI has a remote-endpoint property, but has no endpoint nodes. I wonder
what the remote-endpoint points to...

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 9f393a7be455..a5f83ba502df 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -78,7 +78,6 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  	bool asd_fwnode_is_ep;
> >  	bool sd_fwnode_is_ep;
> >  	struct device *dev;
> > -	const char *name;
> >  
> >  	/*
> >  	 * Both the subdev and the async subdev can provide either an endpoint
> > @@ -92,10 +91,10 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> >  	 * endpoint or a device. If they're of the same type, there's no match.
> >  	 */
> > -	name = fwnode_get_name(sd->fwnode);
> > -	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> > -	name = fwnode_get_name(asd->match.fwnode);
> > -	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> > +	sd_fwnode_is_ep = fwnode_property_present(sd->fwnode,
> > +						  "remote-endpoint");
> > +	asd_fwnode_is_ep = fwnode_property_present(asd->match.fwnode,
> > +						   "remote-endpoint");
> >  
> >  	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> >  		return false;

-- 
Regards,

Laurent Pinchart
