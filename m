Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E54697B55
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 13:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234002AbjBOMB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 07:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233996AbjBOMBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 07:01:13 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C5D3770D
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 04:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676462452; x=1707998452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pi/RWr1UFn7tZoB3/qq7JDoyMZtbKj+5kE9NFaao5Xc=;
  b=XeaeZ5B1wuthRFpZuA3VvT0FC5s19RHunh4eZMQp/E1N8NbsH5Ik2fGc
   kDAoioSn4AGJBkVVuUxKGNyuhc/EiX2lRfkaL05pVcSezer1pSxSiyqax
   7sods4G9wueBO/5S8CA3KphDc4EKJbm1HnvQG5Kiq0zedRPaEndI15i7b
   R2bDMOkCcNTXf8M1FsQwA0cxvXivqhC/sRF8Zzbf4oVhaCaE+l3+g1pLm
   wZW6rzT7hJaiCDpWQVAdPtvyuDLEGLirYVEiWquUIHLQ75yAVSfF07FvZ
   hHL3Ebl7mlGWo0uYDL498E3i4mEo8xT/6ubU7mn/k5mv5oBfXLuMVlPCa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="330040684"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="330040684"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 04:00:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="662899621"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="662899621"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 04:00:49 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 7FE391224B4;
        Wed, 15 Feb 2023 14:00:46 +0200 (EET)
Date:   Wed, 15 Feb 2023 14:00:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, frieder.schrempf@kontron.de,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <Y+zJboHu13jqo+Mv@kekkonen.localdomain>
References: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <20230209221634.35239-1-sakari.ailus@linux.intel.com>
 <Y+V02fe9lqVrt3lb@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+V02fe9lqVrt3lb@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Feb 10, 2023 at 12:34:01AM +0200, Laurent Pinchart wrote:
> Thank you for the patch.

Thanks for the review!

This was indeed hastily written, to help debugging a particular issue. But
I hope it'll be useful for other purposes, too. V4L2 async is about to get
more complicated soon.

> 
> On Fri, Feb 10, 2023 at 12:16:34AM +0200, Sakari Ailus wrote:
> > Just add some debug prints for V4L2 async sub-device matching process. These
> > might come useful in figuring out why things don't work as expected.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Frieder,
> > 
> > Can you try this? It prints what is being matched with what. Perhaps this
> > could be merged in a bit more refined form if it proves useful.
> > 
> > Not tested in any way.
> > 
> >  drivers/media/v4l2-core/v4l2-async.c | 41 ++++++++++++++++++++++++----
> >  1 file changed, 36 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 2f1b718a9189..6c13a9488415 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -86,13 +86,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  	bool sd_fwnode_is_ep;
> >  	struct device *dev;
> >  
> > +	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
> > +		asd->match.fwnode);
> 
> Let's be more explicit:
> 
> 	dev_dbg(sd->dev, "async fwnode match: need %pfw, trying %pfw\n",
> 		sd_fwnode, asd->match.fwnode);
> 
> (feel free to adjust, as long as we differentiate what we're looking for
> from what we're testing)

Yes.

> 
> > +
> >  	/*
> >  	 * Both the subdev and the async subdev can provide either an endpoint
> >  	 * fwnode or a device fwnode. Start with the simple case of direct
> >  	 * fwnode matching.
> >  	 */
> > -	if (sd_fwnode == asd->match.fwnode)
> > +	if (sd_fwnode == asd->match.fwnode) {
> > +		dev_dbg(sd->dev, "true\n");
> 
> 		dev_dbg(sd->dev, "direct match found\n");
> 
> >  		return true;
> > +	}
> >  
> >  	/*
> >  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> > @@ -105,8 +110,12 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
> >  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
> >  
> > -	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> > +	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
> > +		asd->match.fwnode);
> 
> You've already printed this above, no need to repeat it.
> 
> > +	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
> > +		dev_dbg(sd->dev, "unmatching node types (false)\n");
> 
> 		dev_dbg(sd->dev, "direct match not found\n");
> 
> >  		return false;
> > +	}
> >  
> >  	/*
> >  	 * The sd and asd fwnodes are of different types. Get the device fwnode
> > @@ -120,10 +129,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  		other_fwnode = sd_fwnode;
> >  	}
> >  
> > +	dev_dbg(sd->dev, "async fwnode (compat) match %pfw vs. %pfw\n",
> > +		dev_fwnode, other_fwnode);
> 
> Same comment as above regarding "vs." not telling which is which.
> 
> > +
> >  	fwnode_handle_put(dev_fwnode);
> >  
> > -	if (dev_fwnode != other_fwnode)
> > +	if (dev_fwnode != other_fwnode) {
> > +		dev_dbg(sd->dev, "false\n");
> 
> 		dev_dbg(sd->dev, "compat match not found\n");
> 
> >  		return false;
> > +	}
> >  
> >  	/*
> >  	 * We have a heterogeneous match. Retrieve the struct device of the side
> > @@ -143,6 +157,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  			   dev->driver->name);
> >  	}
> >  
> > +	dev_dbg(sd->dev, "true\n");
> 
> 	dev_dbg(sd->dev, "compat match found\n");
> 
> > +
> >  	return true;
> >  }
> >  
> > @@ -255,7 +271,10 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> >  			v4l2_async_find_subdev_notifier(sd);
> >  
> >  		if (subdev_notifier &&
> > -		    !v4l2_async_nf_can_complete(subdev_notifier))
> > +		    !v4l2_async_nf_can_complete(subdev_notifier)) {
> > +			if (subdev_notifier->sd)
> > +				deb_dbg(subdev_notifier->sd->dev,
> > +					"cannot complete\n");
> 
> I'd add a reference to v4l2-async, either directly in the string, or
> with a "%s: ", __func__ prefix. Otherwise the message will be easy to
> miss. Same in other messages. Maybe a "v4l2-async: " prefix for all
> debug messages ?

How about just "async: " for all of these? It's shorther, still unique, and
these lines will be long.

> 
> >  			return false;
> >  	}
> >  
> > @@ -273,18 +292,27 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> >  	if (!list_empty(&notifier->waiting))
> >  		return 0;
> >  
> > +	if (notifier->sd)
> > +		deb_dbg(notifier->sd->dev, "trying to complete\n");
> > +
> >  	/* Check the entire notifier tree; find the root notifier first. */
> >  	while (notifier->parent)
> >  		notifier = notifier->parent;
> >  
> >  	/* This is root if it has v4l2_dev. */
> > -	if (!notifier->v4l2_dev)
> > +	if (!notifier->v4l2_dev) {
> > +		if (notifier->sd)
> > +			deb_dbg(notifier->sd->dev,
> > +				"V4L2 device not available\n");
> >  		return 0;
> > +	}
> >  
> >  	/* Is everything ready? */
> >  	if (!v4l2_async_nf_can_complete(notifier))
> >  		return 0;
> >  
> > +	deb_dbg(notifier->sd->dev, "complete\n");
> 
> You guard against notifier->sd being NULL above, but not here. At least
> one of the two is wrong.

I'll add a helper function to get the device safely.

> 
> > +
> >  	return v4l2_async_nf_call_complete(notifier);
> >  }
> >  
> > @@ -386,6 +414,9 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
> >  			continue;
> >  
> >  		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
> > +		deb_dbg(sd->dev, "bound to %s's notifier (ret %d)\n",
> > +			notifier->sd ? dev_name(notifier->sd->dev) : "no-dev",
> > +			ret);
> >  		if (ret < 0)
> >  			return ret;
> >  
> 

-- 
Kind regards,

Sakari Ailus
