Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8CB866B52F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 02:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbjAPBIc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 20:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbjAPBI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 20:08:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7596E3AC
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 17:08:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10355802;
        Mon, 16 Jan 2023 02:08:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673831307;
        bh=9CXSMYrUnksFakb6bHJNCO1b+2+HUWKskMjOq4LE1eg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U3218FVccr+Qzmoy+DMR9W5bYbenbzrZ7R3OICnjegdO1zSRmDRjzYABPFO8Yag7R
         7kkBToxFbb/tSmmlBbEUmDjwwPjC5twnrpCgmKzw1LI1g0S9IpTokTYKO3M8PZuYT/
         Gh3D4QItL581jV56algF/lBXefVmntG/FU4kmVfo=
Date:   Mon, 16 Jan 2023 03:08:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH] media: v4l2-async: fix binding async subdevs with
 multiple source ports
Message-ID: <Y8Sji3VUaPvKprCF@pendragon.ideasonboard.com>
References: <20220810104848.846783-1-p.zabel@pengutronix.de>
 <20230113112456.GA9093@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230113112456.GA9093@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

(CC'ing Francesco)

My apologies for not having noticed the patch.

On Fri, Jan 13, 2023 at 12:24:56PM +0100, Philipp Zabel wrote:
> Hi,
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

To make sure I understand this correctly, you need both changes, with
the change in __v4l2_async_nf_has_async_subdev() meant to address asds
being added after the subdev has been registered, and the change in
v4l2_async_register_subdev() meant to address asds that have been added
before ?

The imx6 ipu drivers implement a "clever hack" to handle the
multi-endpoint issue that was never officially supported by v4l2-async.
Obviously, as it has worked so far, leaving it broken isn't a very nice
option. The fix feels a bit like a hack though, and a better solution
would be to allow subdevs to be matched multiple times, by multiple
consumers. That's a more intrusive change though, so I could be OK with
this as a short term fix, assuming it doesn't break anything else.

I would however want to ensure this doesn't get abused by new drivers.
Could we add a dev_warn() somewhere to indicate that multi-endpoint
matching is not supported and shouldn't be used until fixed ? Sakari,
what do you think ?

> > Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Any comments on this? The issue persists on v6.2-rc3.

Francesco, does this fix your issue ?

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

-- 
Regards,

Laurent Pinchart
