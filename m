Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA37C6F0AD7
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 19:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244256AbjD0R1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 13:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244127AbjD0R1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 13:27:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C451FCD
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 10:27:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA464C7E;
        Thu, 27 Apr 2023 19:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682616448;
        bh=TAFSSFI2KparrA49Nu1QEKYXpCSH1a/uCPAlSg460Fk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QgBT9iFPx5tyy/9H2zwwo0BJblV78mAVs7MefkrGWayEXyNZ0nTA1iHsVwtjEWiDp
         S5imS8wBQHKfgkVwYSbuDLDy2o8nhNb83ibgC2DZhARe9jRi439Pt9S1FuA9X0D+a/
         ZDh3Ttlhm58DWeYszgGYmnAX19DTb9yB+VqPLvac=
Date:   Thu, 27 Apr 2023 20:27:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 02/18] media: v4l: async: Add some debug prints
Message-ID: <20230427172752.GD26786@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-3-sakari.ailus@linux.intel.com>
 <hptfblbjryeq7xeyhzy7c6sqqpj25q3c4uw5xsyrjv6luqry7s@w5xehghs5c4o>
 <ZDkvHgdlIwx5h4ks@kekkonen.localdomain>
 <20230421081842.GH21943@pendragon.ideasonboard.com>
 <ZEo980G94VUofYSp@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZEo980G94VUofYSp@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 27, 2023 at 12:18:43PM +0300, Sakari Ailus wrote:
> On Fri, Apr 21, 2023 at 11:18:42AM +0300, Laurent Pinchart wrote:
> > On Fri, Apr 14, 2023 at 01:46:54PM +0300, Sakari Ailus wrote:
> > > On Thu, Apr 13, 2023 at 06:49:52PM +0200, Jacopo Mondi wrote:
> > > > On Thu, Mar 30, 2023 at 02:58:37PM +0300, Sakari Ailus wrote:
> > > > > Just add some debug prints for V4L2 async sub-device matching process.
> > > > > These might come useful in figuring out why things don't work as expected.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-async.c | 59 ++++++++++++++++++++++++----
> > > > >  1 file changed, 52 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > index 008a2a3e312e..6dd426c2ca68 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > @@ -75,6 +75,12 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
> > > > >  #endif
> > > > >  }
> > > > >
> > > > > +static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
> > > > > +{
> > > > > +	return notifier->sd ? notifier->sd->dev : notifier->v4l2_dev ?
> > > > > +		notifier->v4l2_dev->dev : NULL;
> > 
> > Nested ?: operators can be confusing, I'd write
> > 
> > 	if (notifier->sd)
> > 		return notifier->sd->dev
> > 	if (notifier->v4l2_dev)
> > 		return notifier->v4l2_dev->dev;
> > 	return NULL;
> 
> I don't mind. I can use that, I'll add some newlines, too.
> 
> > > > > +}
> > > > > +
> > > > >  static bool
> > > > >  match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
> > > > > @@ -86,13 +92,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  	bool sd_fwnode_is_ep;
> > > > >  	struct device *dev;
> > > > >
> > > > > +	dev_dbg(sd->dev, "async: fwnode match: need %pfw, trying %pfw\n",
> > 
> > "async:" is a bit too generic as a prefix. Maybe "v4l2_async:" or
> > "async_nf:" instead ?
> 
> "v4l2-async"?

Works for me.

> > > > > +		sd_fwnode, asd->match.fwnode);
> > > > > +
> > > > >  	/*
> > > > >  	 * Both the subdev and the async subdev can provide either an endpoint
> > > > >  	 * fwnode or a device fwnode. Start with the simple case of direct
> > > > >  	 * fwnode matching.
> > > > >  	 */
> > > > > -	if (sd_fwnode == asd->match.fwnode)
> > > > > +	if (sd_fwnode == asd->match.fwnode) {
> > > > > +		dev_dbg(sd->dev, "async: direct match found\n");
> > > > >  		return true;
> > > > > +	}
> > > > >
> > > > >  	/*
> > > > >  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> > > > > @@ -105,8 +116,10 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
> > > > >  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
> > > > >
> > > > > -	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> > > > > +	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
> > > > > +		dev_dbg(sd->dev, "async: matching node types\n");
> > > > 
> > > > "matching node type" is misleading as it suggests a match has been
> > > > found. As both sd and asd are of the same type, I would use a
> > > > message similar to the above
> > > > 
> > > > 		dev_dbg(sd->dev, "async: direct match failed\n");
> > > 
> > > As it seems further matching attempts will always produce more debug
> > > prints, I'll just drop this altogether.
> > 
> > I'm not sure what you mean here. Isn't it useful to have an explicit
> > message on failure ? I like Jacopo's proposal.
> 
> I'm fine with that.
> 
> > > > >  		return false;
> > > > > +	}
> > > > >
> > > > >  	/*
> > > > >  	 * The sd and asd fwnodes are of different types. Get the device fwnode
> > > > > @@ -120,10 +133,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  		other_fwnode = sd_fwnode;
> > > > >  	}
> > > > >
> > > > > +	dev_dbg(sd->dev, "async: fwnode compat match, need %pfw, trying %pfw\n",
> > > > > +		dev_fwnode, other_fwnode);
> > > > > +
> > > > >  	fwnode_handle_put(dev_fwnode);
> > > > >
> > > > > -	if (dev_fwnode != other_fwnode)
> > > > > +	if (dev_fwnode != other_fwnode) {
> > > > > +		dev_dbg(sd->dev, "async: compat match not found\n");
> > > > 
> > > > and to be more consistent: "compat match failed"
> > > 
> > > I think it's in all cases either "found" or "not found" in this patch.
> > > 
> > > > >  		return false;
> > > > > +	}
> > > > >
> > > > >  	/*
> > > > >  	 * We have a heterogeneous match. Retrieve the struct device of the side
> > > > > @@ -143,12 +161,17 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  			   dev->driver->name);
> > > > >  	}
> > > > >
> > > > > +	dev_dbg(sd->dev, "async: compat match found\n");
> > > > > +
> > > > >  	return true;
> > > > >  }
> > > > >
> > > > >  static bool match_fwnode(struct v4l2_async_notifier *notifier,
> > > > >  			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> > > > >  {
> > > > > +	dev_dbg(sd->dev, "async: matching for notifier %pfw, sd %pfw\n",
> > 
> > Maybe mentioning "fwnode" here ?
> 
> Yes. I'll remove "for", too.
> 
> > > > > +		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
> > 
> > Is there a reason to print the notifier dev as a fwnode instead of using
> > dev_name() ?
> 
> Yes. These strings are comparable to sub-device node names, so this should
> help figuring out what is the async sub-device being matched to. This is
> the case on both DT and ACPI.
> 
> But see below.
> 
> > I'm also wondering, wouldn't it be better to use notifier_dev(notifier)
> > as the dev argument to dev_dbg(), and print dev_name(sd->dev) in the
> > format string ? That's what you're doing below.
> 
> Once there is a match, yes. But if that fails to happen, fwnodes are the
> most relevant...

My main point was about using notifier_dev(notifier) as the dev argument
to dev_dbg(), and printing sd in the message. The notifier seems to be
the core object to me here, I think that's what we should use as context
for dev_dbg().

> > Also, sd->fwnode is printed in match_fwnode_one(), so you could possibly
> > drop it from here.
> 
> but yes, that's a good point. I'll drop printing fwnodes here.
> 
> > > > > +
> > > > >  	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
> > > > >  		return true;
> > > > >
> > > > > @@ -156,6 +179,8 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> > > > >  	if (IS_ERR_OR_NULL(sd->fwnode->secondary))
> > > > >  		return false;
> > > > >
> > > > > +	dev_dbg(sd->dev, "async: trying secondary fwnode match\n");
> > > > > +
> > > > >  	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
> > > > >  }
> > > > >
> > > > > @@ -247,16 +272,21 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> > > > >  {
> > > > >  	struct v4l2_subdev *sd;
> > > > >
> > > > > -	if (!list_empty(&notifier->waiting))
> > > > > +	if (!list_empty(&notifier->waiting)) {
> > > > > +		dev_dbg(notifier_dev(notifier), "async: waiting for subdevs\n");
> > > > >  		return false;
> > > > > +	}
> > > > >
> > > > >  	list_for_each_entry(sd, &notifier->done, async_list) {
> > > > >  		struct v4l2_async_notifier *subdev_notifier =
> > > > >  			v4l2_async_find_subdev_notifier(sd);
> > > > >
> > > > >  		if (subdev_notifier &&
> > > > > -		    !v4l2_async_nf_can_complete(subdev_notifier))
> > > > > +		    !v4l2_async_nf_can_complete(subdev_notifier)) {
> > > > > +			dev_dbg(notifier_dev(notifier),
> > > > > +				"async: cannot complete\n");
> > > > 
> > > > These two will be printed out a lot of times, don't they ?
> > > 
> > > That may be, if you have many async sub-devices. Perhaps these could be
> > > dropped --- the user will be able to find what is still pending via sysfs.
> > 
> > I'm fine with that. If you want to keep the message, can you print the
> > subdev_notifier dev in the message here ?
> 
> I'll drop it for now.

-- 
Regards,

Laurent Pinchart
