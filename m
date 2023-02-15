Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8C76979BC
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 11:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbjBOKUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 05:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233981AbjBOKUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 05:20:06 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C494736FFC
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 02:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676456396; x=1707992396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tk9j7+8CqItHWeFgqL0clkpGoWcrmm3VetmRICy96+g=;
  b=LOkE+xMKlEciV8x3wHSOxw34T7YBsQDehZAprokbGkH3Ez2oRCrmj4f6
   8n0yca2f6IfWYEdPaFeZpZzHlxLbIbejDttKB9BIQ4NR6rhGDBuLDQqlo
   1XvSwURaEfQaOl7aeKmvbXEy7L9lfuiubyWmLNIACzOUAGOlaBKRMhHdi
   lrxyo/KkHQtvAKudm45tnnFixu30+aPr1N4h9Dzehsjjyxx6VMGtSAPHf
   rmEyCaypWHKHMBWB0gPIZW+vKVO8FrhtUPPYBWuDxjQme/kDmaurIrEsP
   g4cJ16ooOBo4e3KoJ3/iqDzN4Q4oidpXZSTAdwPZY9gx3k6Klrux/KlZL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="330023117"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="330023117"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 02:19:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="915100402"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="915100402"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 02:19:55 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E184A11F915;
        Wed, 15 Feb 2023 12:10:35 +0200 (EET)
Date:   Wed, 15 Feb 2023 12:10:35 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Message-ID: <Y+yvm0B3bnO+mDP0@kekkonen.localdomain>
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <Y8afrhfjw+EhAH4o@paasikivi.fi.intel.com>
 <Y8aivWrN6Hg/O7Wr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8aivWrN6Hg/O7Wr@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Jan 17, 2023 at 03:29:33PM +0200, Laurent Pinchart wrote:
> On Tue, Jan 17, 2023 at 01:16:30PM +0000, Sakari Ailus wrote:
> > Hi Philipp,
> > 
> > On Wed, Aug 10, 2022 at 12:48:48PM +0200, Philipp Zabel wrote:
> > > Asynchronous subdevice probing on imx-media with imx6-mipi-csi2 is
> > > broken since commit 1f391df44607 ("media: v4l2-async: Use endpoints in
> > > __v4l2_async_nf_add_fwnode_remote()").
> > > 
> > > This is a side effect of imx6-mipi-csi2 having a single subdevice with
> > > four separate source ports connected to different subdevices. Before,
> > > the imx-media-csi and video-mux devices registered async sub-devices
> > > via device fwnode that matched the imx6-mipi-csi2 device on their
> > > respective notifiers. This caused the first asd to be put on the
> > > notifier waiting list, and the other three to return -EEXIST and be
> > > ignored.
> > > 
> > > With async subdev registration via endpoint fwnode, all four asds are
> > > distinct and three of them keep dangling on their notifiers after the
> > > first one is bound.
> > > 
> > > This patch modifies __v4l2_async_nf_has_async_subdev() to consider
> > > asds matching different fwnode endpoints of the same sub-device equal
> > > if the latter is already bound and matches via device fwnode. Further,
> > > v4l2_async_register_subdev() is modified to remove dangling duplicate
> > > asds that were registered before the sub-device was available to check
> > > its fwnode.
> > > 
> > > Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c | 43 ++++++++++++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 2f1b718a9189..b24220ed7077 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -452,6 +452,22 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> > >  
> > >  		if (asd_equal(asd, sd->asd))
> > >  			return true;
> > > +
> > > +		/*
> > > +		 * If the asd matches an endpoint fwnode, handle sub-devices
> > > +		 * with device fwnode that were already matched by another asd
> > > +		 * with a different endpoint fwnode on the same device.
> > > +		 */
> > > +		if (asd->match_type == V4L2_ASYNC_MATCH_FWNODE &&
> > > +		    fwnode_graph_is_endpoint(asd->match.fwnode) &&
> > > +		    sd->fwnode && !fwnode_graph_is_endpoint(sd->fwnode)) {
> > > +			struct fwnode_handle *devnode;
> > > +
> > > +			devnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> > > +			fwnode_handle_put(devnode);
> > > +			if (devnode == sd->fwnode)
> > > +				return true;
> > > +		}
> > >  	}
> > >  
> > >  	return false;
> > > @@ -749,6 +765,24 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
> > >  }
> > >  EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
> > >  
> > > +static void v4l2_async_remove_duplicate_matches(struct v4l2_subdev *sd)
> > > +{
> > > +	struct v4l2_async_notifier *notifier;
> > > +
> > > +	lockdep_assert_held(&list_lock);
> > > +
> > > +	list_for_each_entry(notifier, &notifier_list, list) {
> > > +		struct v4l2_async_subdev *asd;
> > > +
> > > +		asd = v4l2_async_find_match(notifier, sd);
> > > +		if (!asd)
> > > +			continue;
> > > +
> > > +		/* Remove from the waiting list */
> > > +		list_del(&asd->list);
> > 
> > This leaves asd->list pointers dangling.
> > 
> > > +	}
> > > +}
> > > +
> > >  int v4l2_async_register_subdev(struct v4l2_subdev *sd)
> > >  {
> > >  	struct v4l2_async_notifier *subdev_notifier;
> > > @@ -783,6 +817,15 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
> > >  		if (ret)
> > >  			goto err_unbind;
> > >  
> > > +		/*
> > > +		 * At this point the asd is removed from the notifier wait list.
> > > +		 * There might be other notifiers with asds matching different
> > > +		 * fwnode endpoints of the same sd remaining. If the sd matches
> > > +		 * by device fwnode, remove the dangling asds.
> > > +		 */
> > > +		if (sd->fwnode && !fwnode_graph_is_endpoint(sd->fwnode))
> > > +			v4l2_async_remove_duplicate_matches(sd);
> > > +
> > >  		ret = v4l2_async_nf_try_complete(notifier);
> > >  		if (ret)
> > >  			goto err_unbind;
> > 
> > This patch is essentially a workaround, not a fix.
> > 
> > The root of the problem is that registering async sub-devices (and thus
> > registering a sub-device later) and link creation (via bound callback) are
> > handled together.
> 
> I'm not sure to see how that's related to the problem at hand. The issue
> here is that there are four consumers for one subdevice, and the
> v4l2-async framework doesn't support that. Two of those consumers could
> be made to know about each other, but the other two (video-mux) are
> modelled completely independently. That doesn't seem tied to link
> creation to me.

It is, partly least. Also async sub-device registration as a sub-device
needs to be disconnected from binding a sub-device with a notifier. I don't
want to base this on opportunistically removing async sub-devices from the
notifier list.

That being said, it's been in my plans to improve V4L2 async in these
respects.

> 
> > They should be separated instead, at least in the
> > v4l2-async framework if not in the interfaces. We could at least have a
> > helper doing the both using existing API for devices that have a single
> > source pad.
> > 
> > While merging this might not break anything as such, it would certainly
> > make fixing the underlying problem later on much harder as you'd need to
> > take drivers depending on it into account --- for which I, for instance,
> > don't have hardware for.
> > 
> > I'm thus not overly enthusiastic of the idea of merging this.

-- 
Regards,

Sakari Ailus
