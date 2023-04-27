Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53C5A6F033E
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 11:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243231AbjD0JTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 05:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243215AbjD0JTH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 05:19:07 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B457CE1
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682587145; x=1714123145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TRapMmPsrRRtoTwX8awfCINNPSS1zgZN59+ylf+pSvA=;
  b=cmSw4j/HVbOVIfvS0sGxeu08Xz8YbAiYIYHYdedDtRgWcqYMt5v4xF+1
   7y4tpnFtKtmNeRQyWxLaRyXcvCAjrimCuIecUi46trKCBbmRTD/e6gaVk
   TKpKTkxx7/HpiLrZUmnvG35olLisNoiFA8gvML6G/vUbroLZxwPoU4adb
   Z4n9MRXr3H2CSMolh5SbhznBKXLhK63MJlhcb3cKx7AKaR0Jnzoch8h8h
   0ENGsQoUW0gqv+z210cxRi66cgmrDojDoo+CR4HFW4PiZzx+bZlSzcR+0
   gMyCEzuY2Mv3KUfaOQmYpmFYOxsqNGaVNef838hg+YoHUTPyJPc7YxSdT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="327700464"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="327700464"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 02:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="671711846"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="671711846"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 02:18:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B49A011FC9F;
        Thu, 27 Apr 2023 12:18:43 +0300 (EEST)
Date:   Thu, 27 Apr 2023 12:18:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 02/18] media: v4l: async: Add some debug prints
Message-ID: <ZEo980G94VUofYSp@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-3-sakari.ailus@linux.intel.com>
 <hptfblbjryeq7xeyhzy7c6sqqpj25q3c4uw5xsyrjv6luqry7s@w5xehghs5c4o>
 <ZDkvHgdlIwx5h4ks@kekkonen.localdomain>
 <20230421081842.GH21943@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421081842.GH21943@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Apr 21, 2023 at 11:18:42AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Fri, Apr 14, 2023 at 01:46:54PM +0300, Sakari Ailus wrote:
> > On Thu, Apr 13, 2023 at 06:49:52PM +0200, Jacopo Mondi wrote:
> > > On Thu, Mar 30, 2023 at 02:58:37PM +0300, Sakari Ailus wrote:
> > > > Just add some debug prints for V4L2 async sub-device matching process.
> > > > These might come useful in figuring out why things don't work as expected.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-async.c | 59 ++++++++++++++++++++++++----
> > > >  1 file changed, 52 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > index 008a2a3e312e..6dd426c2ca68 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > @@ -75,6 +75,12 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
> > > >  #endif
> > > >  }
> > > >
> > > > +static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
> > > > +{
> > > > +	return notifier->sd ? notifier->sd->dev : notifier->v4l2_dev ?
> > > > +		notifier->v4l2_dev->dev : NULL;
> 
> Nested ?: operators can be confusing, I'd write
> 
> 	if (notifier->sd)
> 		return notifier->sd->dev
> 	if (notifier->v4l2_dev)
> 		return notifier->v4l2_dev->dev;
> 	return NULL;

I don't mind. I can use that, I'll add some newlines, too.

> 
> > > > +}
> > > > +
> > > >  static bool
> > > >  match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > >  		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
> > > > @@ -86,13 +92,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > >  	bool sd_fwnode_is_ep;
> > > >  	struct device *dev;
> > > >
> > > > +	dev_dbg(sd->dev, "async: fwnode match: need %pfw, trying %pfw\n",
> 
> "async:" is a bit too generic as a prefix. Maybe "v4l2_async:" or
> "async_nf:" instead ?

"v4l2-async"?

> 
> > > > +		sd_fwnode, asd->match.fwnode);
> > > > +
> > > >  	/*
> > > >  	 * Both the subdev and the async subdev can provide either an endpoint
> > > >  	 * fwnode or a device fwnode. Start with the simple case of direct
> > > >  	 * fwnode matching.
> > > >  	 */
> > > > -	if (sd_fwnode == asd->match.fwnode)
> > > > +	if (sd_fwnode == asd->match.fwnode) {
> > > > +		dev_dbg(sd->dev, "async: direct match found\n");
> > > >  		return true;
> > > > +	}
> > > >
> > > >  	/*
> > > >  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> > > > @@ -105,8 +116,10 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > >  	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
> > > >  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
> > > >
> > > > -	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> > > > +	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
> > > > +		dev_dbg(sd->dev, "async: matching node types\n");
> > > 
> > > "matching node type" is misleading as it suggests a match has been
> > > found. As both sd and asd are of the same type, I would use a
> > > message similar to the above
> > > 
> > > 		dev_dbg(sd->dev, "async: direct match failed\n");
> > 
> > As it seems further matching attempts will always produce more debug
> > prints, I'll just drop this altogether.
> 
> I'm not sure what you mean here. Isn't it useful to have an explicit
> message on failure ? I like Jacopo's proposal.

I'm fine with that.

> 
> > > >  		return false;
> > > > +	}
> > > >
> > > >  	/*
> > > >  	 * The sd and asd fwnodes are of different types. Get the device fwnode
> > > > @@ -120,10 +133,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > >  		other_fwnode = sd_fwnode;
> > > >  	}
> > > >
> > > > +	dev_dbg(sd->dev, "async: fwnode compat match, need %pfw, trying %pfw\n",
> > > > +		dev_fwnode, other_fwnode);
> > > > +
> > > >  	fwnode_handle_put(dev_fwnode);
> > > >
> > > > -	if (dev_fwnode != other_fwnode)
> > > > +	if (dev_fwnode != other_fwnode) {
> > > > +		dev_dbg(sd->dev, "async: compat match not found\n");
> > > 
> > > and to be more consistent: "compat match failed"
> > 
> > I think it's in all cases either "found" or "not found" in this patch.
> > 
> > > >  		return false;
> > > > +	}
> > > >
> > > >  	/*
> > > >  	 * We have a heterogeneous match. Retrieve the struct device of the side
> > > > @@ -143,12 +161,17 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > >  			   dev->driver->name);
> > > >  	}
> > > >
> > > > +	dev_dbg(sd->dev, "async: compat match found\n");
> > > > +
> > > >  	return true;
> > > >  }
> > > >
> > > >  static bool match_fwnode(struct v4l2_async_notifier *notifier,
> > > >  			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> > > >  {
> > > > +	dev_dbg(sd->dev, "async: matching for notifier %pfw, sd %pfw\n",
> 
> Maybe mentioning "fwnode" here ?

Yes. I'll remove "for", too.

> 
> > > > +		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
> 
> Is there a reason to print the notifier dev as a fwnode instead of using
> dev_name() ?

Yes. These strings are comparable to sub-device node names, so this should
help figuring out what is the async sub-device being matched to. This is
the case on both DT and ACPI.

But see below.

> 
> I'm also wondering, wouldn't it be better to use notifier_dev(notifier)
> as the dev argument to dev_dbg(), and print dev_name(sd->dev) in the
> format string ? That's what you're doing below.

Once there is a match, yes. But if that fails to happen, fwnodes are the
most relevant...

> 
> Also, sd->fwnode is printed in match_fwnode_one(), so you could possibly
> drop it from here.

but yes, that's a good point. I'll drop printing fwnodes here.

> 
> > > > +
> > > >  	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
> > > >  		return true;
> > > >
> > > > @@ -156,6 +179,8 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> > > >  	if (IS_ERR_OR_NULL(sd->fwnode->secondary))
> > > >  		return false;
> > > >
> > > > +	dev_dbg(sd->dev, "async: trying secondary fwnode match\n");
> > > > +
> > > >  	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
> > > >  }
> > > >
> > > > @@ -247,16 +272,21 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> > > >  {
> > > >  	struct v4l2_subdev *sd;
> > > >
> > > > -	if (!list_empty(&notifier->waiting))
> > > > +	if (!list_empty(&notifier->waiting)) {
> > > > +		dev_dbg(notifier_dev(notifier), "async: waiting for subdevs\n");
> > > >  		return false;
> > > > +	}
> > > >
> > > >  	list_for_each_entry(sd, &notifier->done, async_list) {
> > > >  		struct v4l2_async_notifier *subdev_notifier =
> > > >  			v4l2_async_find_subdev_notifier(sd);
> > > >
> > > >  		if (subdev_notifier &&
> > > > -		    !v4l2_async_nf_can_complete(subdev_notifier))
> > > > +		    !v4l2_async_nf_can_complete(subdev_notifier)) {
> > > > +			dev_dbg(notifier_dev(notifier),
> > > > +				"async: cannot complete\n");
> > > 
> > > These two will be printed out a lot of times, don't they ?
> > 
> > That may be, if you have many async sub-devices. Perhaps these could be
> > dropped --- the user will be able to find what is still pending via sysfs.
> 
> I'm fine with that. If you want to keep the message, can you print the
> subdev_notifier dev in the message here ?

I'll drop it for now.

-- 
Kind regards,

Sakari Ailus
