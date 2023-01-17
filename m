Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7456C66DED1
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 14:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbjAQN3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 08:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjAQN3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 08:29:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD8334C25
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 05:29:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4BD410C;
        Tue, 17 Jan 2023 14:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673962173;
        bh=IOuDef7xBtqguJyG7k6MJzMpqfB05RJyZyr9xYTh/uE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AY341X0DWg7k9QVtNifuZYk8/Yvz4hht4dpAHyhxMdjYdzTlE4ydWjbMaK1Per2zI
         eKc84i5DtEkQrez2ev9JGJazqBAYcQYrk41vAq1k0VnM//MmnzeikuY/KtDD/7JTGd
         uHoG7WBIXmRwe/zAkYREvx8yLASItoK4ceNlrgfM=
Date:   Tue, 17 Jan 2023 15:29:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Message-ID: <Y8aivWrN6Hg/O7Wr@pendragon.ideasonboard.com>
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <Y8afrhfjw+EhAH4o@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8afrhfjw+EhAH4o@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 17, 2023 at 01:16:30PM +0000, Sakari Ailus wrote:
> Hi Philipp,
> 
> On Wed, Aug 10, 2022 at 12:48:48PM +0200, Philipp Zabel wrote:
> > Asynchronous subdevice probing on imx-media with imx6-mipi-csi2 is
> > broken since commit 1f391df44607 ("media: v4l2-async: Use endpoints in
> > __v4l2_async_nf_add_fwnode_remote()").
> > 
> > This is a side effect of imx6-mipi-csi2 having a single subdevice with
> > four separate source ports connected to different subdevices. Before,
> > the imx-media-csi and video-mux devices registered async sub-devices
> > via device fwnode that matched the imx6-mipi-csi2 device on their
> > respective notifiers. This caused the first asd to be put on the
> > notifier waiting list, and the other three to return -EEXIST and be
> > ignored.
> > 
> > With async subdev registration via endpoint fwnode, all four asds are
> > distinct and three of them keep dangling on their notifiers after the
> > first one is bound.
> > 
> > This patch modifies __v4l2_async_nf_has_async_subdev() to consider
> > asds matching different fwnode endpoints of the same sub-device equal
> > if the latter is already bound and matches via device fwnode. Further,
> > v4l2_async_register_subdev() is modified to remove dangling duplicate
> > asds that were registered before the sub-device was available to check
> > its fwnode.
> > 
> > Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 43 ++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 2f1b718a9189..b24220ed7077 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -452,6 +452,22 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> >  
> >  		if (asd_equal(asd, sd->asd))
> >  			return true;
> > +
> > +		/*
> > +		 * If the asd matches an endpoint fwnode, handle sub-devices
> > +		 * with device fwnode that were already matched by another asd
> > +		 * with a different endpoint fwnode on the same device.
> > +		 */
> > +		if (asd->match_type == V4L2_ASYNC_MATCH_FWNODE &&
> > +		    fwnode_graph_is_endpoint(asd->match.fwnode) &&
> > +		    sd->fwnode && !fwnode_graph_is_endpoint(sd->fwnode)) {
> > +			struct fwnode_handle *devnode;
> > +
> > +			devnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> > +			fwnode_handle_put(devnode);
> > +			if (devnode == sd->fwnode)
> > +				return true;
> > +		}
> >  	}
> >  
> >  	return false;
> > @@ -749,6 +765,24 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
> >  }
> >  EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
> >  
> > +static void v4l2_async_remove_duplicate_matches(struct v4l2_subdev *sd)
> > +{
> > +	struct v4l2_async_notifier *notifier;
> > +
> > +	lockdep_assert_held(&list_lock);
> > +
> > +	list_for_each_entry(notifier, &notifier_list, list) {
> > +		struct v4l2_async_subdev *asd;
> > +
> > +		asd = v4l2_async_find_match(notifier, sd);
> > +		if (!asd)
> > +			continue;
> > +
> > +		/* Remove from the waiting list */
> > +		list_del(&asd->list);
> 
> This leaves asd->list pointers dangling.
> 
> > +	}
> > +}
> > +
> >  int v4l2_async_register_subdev(struct v4l2_subdev *sd)
> >  {
> >  	struct v4l2_async_notifier *subdev_notifier;
> > @@ -783,6 +817,15 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
> >  		if (ret)
> >  			goto err_unbind;
> >  
> > +		/*
> > +		 * At this point the asd is removed from the notifier wait list.
> > +		 * There might be other notifiers with asds matching different
> > +		 * fwnode endpoints of the same sd remaining. If the sd matches
> > +		 * by device fwnode, remove the dangling asds.
> > +		 */
> > +		if (sd->fwnode && !fwnode_graph_is_endpoint(sd->fwnode))
> > +			v4l2_async_remove_duplicate_matches(sd);
> > +
> >  		ret = v4l2_async_nf_try_complete(notifier);
> >  		if (ret)
> >  			goto err_unbind;
> 
> This patch is essentially a workaround, not a fix.
> 
> The root of the problem is that registering async sub-devices (and thus
> registering a sub-device later) and link creation (via bound callback) are
> handled together.

I'm not sure to see how that's related to the problem at hand. The issue
here is that there are four consumers for one subdevice, and the
v4l2-async framework doesn't support that. Two of those consumers could
be made to know about each other, but the other two (video-mux) are
modelled completely independently. That doesn't seem tied to link
creation to me.

> They should be separated instead, at least in the
> v4l2-async framework if not in the interfaces. We could at least have a
> helper doing the both using existing API for devices that have a single
> source pad.
> 
> While merging this might not break anything as such, it would certainly
> make fixing the underlying problem later on much harder as you'd need to
> take drivers depending on it into account --- for which I, for instance,
> don't have hardware for.
> 
> I'm thus not overly enthusiastic of the idea of merging this.

-- 
Regards,

Laurent Pinchart
