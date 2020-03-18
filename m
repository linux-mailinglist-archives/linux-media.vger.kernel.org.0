Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9055B189657
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 08:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgCRHwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 03:52:32 -0400
Received: from mga01.intel.com ([192.55.52.88]:6097 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgCRHwc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 03:52:32 -0400
IronPort-SDR: gvIKqm6dHtYpVQ9scZGjmSs2o+KzCDbqZZAoAFyH708IfQI5Y92fdfztwWJchso/wfTow25T5E
 0pucvbSeAHew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2020 00:52:32 -0700
IronPort-SDR: 9s72Yvik1vtrODb2JVQtn+MyMmDRDXwlAJ8siprl+tSvJPL1oEnH892wDdeOrlltY0zm+UOb/L
 6AmHELwlIhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; 
   d="scan'208";a="355620407"
Received: from jsowinsk-mobl.ger.corp.intel.com (HELO mara.localdomain) ([10.249.156.87])
  by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2020 00:52:29 -0700
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jETV4-0000YI-6n; Wed, 18 Mar 2020 09:52:26 +0200
Date:   Wed, 18 Mar 2020 09:52:25 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
Message-ID: <20200318075225.GA2101@mara.localdomain>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200317124455.GC13878@kekkonen.localdomain>
 <20200317230432.GO2527@pendragon.ideasonboard.com>
 <20200318001726.GQ2527@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318001726.GQ2527@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Mar 18, 2020 at 02:17:26AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, Mar 18, 2020 at 01:04:32AM +0200, Laurent Pinchart wrote:
> > On Tue, Mar 17, 2020 at 02:44:56PM +0200, Sakari Ailus wrote:
> > > On Sun, Mar 15, 2020 at 02:55:11PM +0200, Laurent Pinchart wrote:
> > > > fwnode matching was designed to match on nodes corresponding to a
> > > > device. Some drivers, however, needed to match on endpoints, and have
> > > > passed endpoint fwnodes to v4l2-async. This works when both the subdev
> > > > and the notifier use the same fwnode types (endpoint or device), but
> > > > makes drivers that use different types incompatible.
> > > > 
> > > > Fix this by extending the fwnode match to handle fwnodes of different
> > > > types. When the types (deduced from the node name) are different,
> > > > retrieve the device fwnode for the side that provides an endpoint
> > > > fwnode, and compare it with the device fwnode provided by the other
> > > > side. This allows interoperability between all drivers, regardless of
> > > > which type of fwnode they use for matching.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > ---
> > > > This has been compile-tested only. Prabhakar, could you check if it
> > > > fixes your issue ?
> > > > 
> > > >  drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
> > > >  1 file changed, 41 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > index 8bde33c21ce4..995e5464cba7 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > @@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
> > > >  
> > > >  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> > > >  {
> > > > -	return sd->fwnode == asd->match.fwnode;
> > > > +	struct fwnode_handle *other_fwnode;
> > > > +	struct fwnode_handle *dev_fwnode;
> > > > +	bool asd_fwnode_is_ep;
> > > > +	bool sd_fwnode_is_ep;
> > > > +	const char *name;
> > > > +
> > > > +	/*
> > > > +	 * Both the subdev and the async subdev can provide either an endpoint
> > > > +	 * fwnode or a device fwnode. Start with the simple case of direct
> > > > +	 * fwnode matching.
> > > > +	 */
> > > > +	if (sd->fwnode == asd->match.fwnode)
> > > > +		return true;
> > > > +
> > > > +	/*
> > > > +	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> > > > +	 * endpoint or a device. If they're of the same type, there's no match.
> > > > +	 */
> > > > +	name = fwnode_get_name(sd->fwnode);
> > > > +	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> > > > +	name = fwnode_get_name(asd->match.fwnode);
> > > > +	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> > > 
> > > Apart from the fact that you're parsing graph node names here, this looks
> > > good.
> 
> And why is that an issue btw ? the ACPI fwnode ops seem to provide a
> .get_name() operation, would it return the ACPI bus ID here ?

I'd really prefer not to do graph parsing outside the main parser(s), OF,
ACPI and property frameworks.

Just for an example, the v4l2_fwnode_link_parse() was broken for ACPI for a
long time just because it did not use the graph parsing functions, but
implemented graph parsing on its own.

> 
> > > How about checking instead that calling
> > > fwnode_graph_get_remote_endpoint(fwnode_graph_get_remote_endpoint()) yields
> > > the same node? That would ensure you're dealing with endpoint nodes without
> > > explicitly parsing the graph in any way.
> > 
> > Would it be simpler to check for the presence of an endpoint property ?

There's no endpoint property, apart from an old ACPI definition.

There are differences in the implementations and this is not the best place
to try to take them all into account.

-- 
Kind regards,

Sakari Ailus
