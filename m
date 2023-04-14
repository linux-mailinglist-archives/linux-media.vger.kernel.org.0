Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD9566E2138
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 12:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjDNKrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 06:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjDNKrB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 06:47:01 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1921FD0
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681469220; x=1713005220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SPlXbN7KeorB5pyFGd0KoQHf6Le9JhpYbNkDq8Tf0sc=;
  b=dyprKMnwHPnYR8QmQgFOY5YV9IEnz1hgTJxTYe21b4GTeAZ9vn/8/N5Z
   KVtx7PUQehccigYDz4+Rb1XJnIfYMqj5Dt5eLjcpDLzdnQ6VXgVqewjwB
   Ntlaub/IE/W5GYf3R9EYi0q8fWu4Rq5+NGhgVfA6Up76Hge6jJeehy5Xj
   iXTjWn4aIBkLTH5AuAdZg8gF3xXOmQbSIVsvirBuz3ybUhtSmfnJm7v5Y
   behIAG55TpQ8aJphChx4xumrp8E9ecQgoHqMuawioyYhiGWwq4J/VvDlD
   7BbK93aVy5vUG14WGkzMnqIz0HZon7Ewf+rEx0wKKYquXI2sVFD3upSg+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324787285"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324787285"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 03:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="667156452"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="667156452"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 03:46:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 47FB1121357;
        Fri, 14 Apr 2023 13:46:54 +0300 (EEST)
Date:   Fri, 14 Apr 2023 13:46:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 02/18] media: v4l: async: Add some debug prints
Message-ID: <ZDkvHgdlIwx5h4ks@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-3-sakari.ailus@linux.intel.com>
 <hptfblbjryeq7xeyhzy7c6sqqpj25q3c4uw5xsyrjv6luqry7s@w5xehghs5c4o>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hptfblbjryeq7xeyhzy7c6sqqpj25q3c4uw5xsyrjv6luqry7s@w5xehghs5c4o>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Many thanks for the review!

On Thu, Apr 13, 2023 at 06:49:52PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Mar 30, 2023 at 02:58:37PM +0300, Sakari Ailus wrote:
> > Just add some debug prints for V4L2 async sub-device matching process.
> > These might come useful in figuring out why things don't work as expected.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 59 ++++++++++++++++++++++++----
> >  1 file changed, 52 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 008a2a3e312e..6dd426c2ca68 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -75,6 +75,12 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
> >  #endif
> >  }
> >
> > +static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
> > +{
> > +	return notifier->sd ? notifier->sd->dev : notifier->v4l2_dev ?
> > +		notifier->v4l2_dev->dev : NULL;
> > +}
> > +
> >  static bool
> >  match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
> > @@ -86,13 +92,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  	bool sd_fwnode_is_ep;
> >  	struct device *dev;
> >
> > +	dev_dbg(sd->dev, "async: fwnode match: need %pfw, trying %pfw\n",
> > +		sd_fwnode, asd->match.fwnode);
> > +
> >  	/*
> >  	 * Both the subdev and the async subdev can provide either an endpoint
> >  	 * fwnode or a device fwnode. Start with the simple case of direct
> >  	 * fwnode matching.
> >  	 */
> > -	if (sd_fwnode == asd->match.fwnode)
> > +	if (sd_fwnode == asd->match.fwnode) {
> > +		dev_dbg(sd->dev, "async: direct match found\n");
> >  		return true;
> > +	}
> >
> >  	/*
> >  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> > @@ -105,8 +116,10 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
> >  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
> >
> > -	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> > +	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
> > +		dev_dbg(sd->dev, "async: matching node types\n");
> 
> "matching node type" is misleading as it suggests a match has been
> found. As both sd and asd are of the same type, I would use a
> message similar to the above
> 
> 		dev_dbg(sd->dev, "async: direct match failed\n");

As it seems further matching attempts will always produce more debug
prints, I'll just drop this altogether.

> 
> >  		return false;
> > +	}
> >
> >  	/*
> >  	 * The sd and asd fwnodes are of different types. Get the device fwnode
> > @@ -120,10 +133,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  		other_fwnode = sd_fwnode;
> >  	}
> >
> > +	dev_dbg(sd->dev, "async: fwnode compat match, need %pfw, trying %pfw\n",
> > +		dev_fwnode, other_fwnode);
> > +
> >  	fwnode_handle_put(dev_fwnode);
> >
> > -	if (dev_fwnode != other_fwnode)
> > +	if (dev_fwnode != other_fwnode) {
> > +		dev_dbg(sd->dev, "async: compat match not found\n");
> 
> and to be more consistent: "compat match failed"

I think it's in all cases either "found" or "not found" in this patch.

> 
> >  		return false;
> > +	}
> >
> >  	/*
> >  	 * We have a heterogeneous match. Retrieve the struct device of the side
> > @@ -143,12 +161,17 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  			   dev->driver->name);
> >  	}
> >
> > +	dev_dbg(sd->dev, "async: compat match found\n");
> > +
> >  	return true;
> >  }
> >
> >  static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> >  {
> > +	dev_dbg(sd->dev, "async: matching for notifier %pfw, sd %pfw\n",
> > +		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
> > +
> >  	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
> >  		return true;
> >
> > @@ -156,6 +179,8 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  	if (IS_ERR_OR_NULL(sd->fwnode->secondary))
> >  		return false;
> >
> > +	dev_dbg(sd->dev, "async: trying secondary fwnode match\n");
> > +
> >  	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
> >  }
> >
> > @@ -247,16 +272,21 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> >  {
> >  	struct v4l2_subdev *sd;
> >
> > -	if (!list_empty(&notifier->waiting))
> > +	if (!list_empty(&notifier->waiting)) {
> > +		dev_dbg(notifier_dev(notifier), "async: waiting for subdevs\n");
> >  		return false;
> > +	}
> >
> >  	list_for_each_entry(sd, &notifier->done, async_list) {
> >  		struct v4l2_async_notifier *subdev_notifier =
> >  			v4l2_async_find_subdev_notifier(sd);
> >
> >  		if (subdev_notifier &&
> > -		    !v4l2_async_nf_can_complete(subdev_notifier))
> > +		    !v4l2_async_nf_can_complete(subdev_notifier)) {
> > +			dev_dbg(notifier_dev(notifier),
> > +				"async: cannot complete\n");
> 
> These two will be printed out a lot of times, don't they ?

That may be, if you have many async sub-devices. Perhaps these could be
dropped --- the user will be able to find what is still pending via sysfs.

> 
> >  			return false;
> > +		}
> >  	}
> >
> >  	return true;
> > @@ -269,22 +299,32 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> >  static int
> >  v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> >  {
> > +	struct v4l2_async_notifier *__notifier = notifier;
> > +
> >  	/* Quick check whether there are still more sub-devices here. */
> >  	if (!list_empty(&notifier->waiting))
> >  		return 0;
> >
> > +	if (notifier->sd)
> > +		dev_dbg(notifier_dev(notifier), "async: trying to complete\n");
> > +
> >  	/* Check the entire notifier tree; find the root notifier first. */
> >  	while (notifier->parent)
> >  		notifier = notifier->parent;
> >
> >  	/* This is root if it has v4l2_dev. */
> > -	if (!notifier->v4l2_dev)
> > +	if (!notifier->v4l2_dev) {
> > +		dev_dbg(notifier_dev(__notifier),
> > +			"async: V4L2 device not available\n");
> 
> is this a BUG() ?

No. It's that we haven't got the root notifier with the V4L2 device. It
will presumably be found later on.

> 
> >  		return 0;
> > +	}
> >
> >  	/* Is everything ready? */
> >  	if (!v4l2_async_nf_can_complete(notifier))
> >  		return 0;
> >
> > +	dev_dbg(notifier_dev(__notifier), "async: complete\n");
> > +
> >  	return v4l2_async_nf_call_complete(notifier);
> >  }
> >
> > @@ -362,7 +402,12 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >  	 */
> >  	subdev_notifier->parent = notifier;
> >
> > -	return v4l2_async_nf_try_all_subdevs(subdev_notifier);
> > +	ret = v4l2_async_nf_try_all_subdevs(subdev_notifier);
> > +
> > +	dev_dbg(sd->dev, "async: bound to %s's notifier (ret %d)\n",
> > +		dev_name(notifier_dev(notifier)), ret);
> > +
> > +	return ret;
> 
> This will only be print out if there's no subnotifier as a few lines
> above we return early. Is this intentional ?

Good point. I'll move it up, this is about the sub-device itself, not its
notifier.

> 
> >  }
> >
> >  /* Test all async sub-devices in a notifier for a match. */

-- 
Kind regards,

Sakari Ailus
