Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A37B69A21E
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 00:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjBPXLK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 18:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBPXLJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 18:11:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678613800F
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 15:11:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB3B42D8;
        Fri, 17 Feb 2023 00:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676589065;
        bh=Wvhp9UY+QHMvGeZbAQO4WciZnjDP1ZUifki0espzuUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bd6tU4pdCohJnpas80dZAJKA9cYOHTclyFWViZNIe5RYVhnyqRT2KyO5w9HY5NdDn
         Ixhx3+Ve+nPhOzuZglBzkoqqmfs/Y6oUXzCOGyIp0Rvo+WigpoYZkRozwGkkHzSyDV
         VchrctJ4cGqXec7SWgl6a+XnqQB2UUUR7m8RXvwY=
Date:   Fri, 17 Feb 2023 01:11:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, frieder.schrempf@kontron.de,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <Y+64CdATkoeE5AdL@pendragon.ideasonboard.com>
References: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <20230209221634.35239-1-sakari.ailus@linux.intel.com>
 <Y+V02fe9lqVrt3lb@pendragon.ideasonboard.com>
 <Y+zJboHu13jqo+Mv@kekkonen.localdomain>
 <Y+0xGRgQdACCIqnL@pendragon.ideasonboard.com>
 <Y+3lZs3S1EhYuuHp@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+3lZs3S1EhYuuHp@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Feb 16, 2023 at 10:12:22AM +0200, Sakari Ailus wrote:
> On Wed, Feb 15, 2023 at 09:23:05PM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 15, 2023 at 02:00:46PM +0200, Sakari Ailus wrote:
> > > On Fri, Feb 10, 2023 at 12:34:01AM +0200, Laurent Pinchart wrote:
> > > > Thank you for the patch.
> > > 
> > > Thanks for the review!
> > > 
> > > This was indeed hastily written, to help debugging a particular issue. But
> > > I hope it'll be useful for other purposes, too. V4L2 async is about to get
> > > more complicated soon.
> > 
> > Could it get simpler instead ? :-) Maybe one day v4l2-async may cross
> > the threshold of how much pain I can bear, and I'll rewrite it...
> 
> I wish it could, but often supporting complex needs is complicated.
> "Simplicated" is not even a proper word after all. Let's see.

Don't try to lure me into rewriting it sooner than later ;-)

> > > > On Fri, Feb 10, 2023 at 12:16:34AM +0200, Sakari Ailus wrote:
> > > > > Just add some debug prints for V4L2 async sub-device matching process. These
> > > > > might come useful in figuring out why things don't work as expected.
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > > Frieder,
> > > > > 
> > > > > Can you try this? It prints what is being matched with what. Perhaps this
> > > > > could be merged in a bit more refined form if it proves useful.
> > > > > 
> > > > > Not tested in any way.
> > > > > 
> > > > >  drivers/media/v4l2-core/v4l2-async.c | 41 ++++++++++++++++++++++++----
> > > > >  1 file changed, 36 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > index 2f1b718a9189..6c13a9488415 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > @@ -86,13 +86,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  	bool sd_fwnode_is_ep;
> > > > >  	struct device *dev;
> > > > >  
> > > > > +	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
> > > > > +		asd->match.fwnode);
> > > > 
> > > > Let's be more explicit:
> > > > 
> > > > 	dev_dbg(sd->dev, "async fwnode match: need %pfw, trying %pfw\n",
> > > > 		sd_fwnode, asd->match.fwnode);
> > > > 
> > > > (feel free to adjust, as long as we differentiate what we're looking for
> > > > from what we're testing)
> > > 
> > > Yes.
> > > 
> > > > > +
> > > > >  	/*
> > > > >  	 * Both the subdev and the async subdev can provide either an endpoint
> > > > >  	 * fwnode or a device fwnode. Start with the simple case of direct
> > > > >  	 * fwnode matching.
> > > > >  	 */
> > > > > -	if (sd_fwnode == asd->match.fwnode)
> > > > > +	if (sd_fwnode == asd->match.fwnode) {
> > > > > +		dev_dbg(sd->dev, "true\n");
> > > > 
> > > > 		dev_dbg(sd->dev, "direct match found\n");
> > > > 
> > > > >  		return true;
> > > > > +	}
> > > > >  
> > > > >  	/*
> > > > >  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> > > > > @@ -105,8 +110,12 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
> > > > >  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
> > > > >  
> > > > > -	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> > > > > +	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
> > > > > +		asd->match.fwnode);
> > > > 
> > > > You've already printed this above, no need to repeat it.
> > > > 
> > > > > +	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
> > > > > +		dev_dbg(sd->dev, "unmatching node types (false)\n");
> > > > 
> > > > 		dev_dbg(sd->dev, "direct match not found\n");
> > > > 
> > > > >  		return false;
> > > > > +	}
> > > > >  
> > > > >  	/*
> > > > >  	 * The sd and asd fwnodes are of different types. Get the device fwnode
> > > > > @@ -120,10 +129,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  		other_fwnode = sd_fwnode;
> > > > >  	}
> > > > >  
> > > > > +	dev_dbg(sd->dev, "async fwnode (compat) match %pfw vs. %pfw\n",
> > > > > +		dev_fwnode, other_fwnode);
> > > > 
> > > > Same comment as above regarding "vs." not telling which is which.
> > > > 
> > > > > +
> > > > >  	fwnode_handle_put(dev_fwnode);
> > > > >  
> > > > > -	if (dev_fwnode != other_fwnode)
> > > > > +	if (dev_fwnode != other_fwnode) {
> > > > > +		dev_dbg(sd->dev, "false\n");
> > > > 
> > > > 		dev_dbg(sd->dev, "compat match not found\n");
> > > > 
> > > > >  		return false;
> > > > > +	}
> > > > >  
> > > > >  	/*
> > > > >  	 * We have a heterogeneous match. Retrieve the struct device of the side
> > > > > @@ -143,6 +157,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> > > > >  			   dev->driver->name);
> > > > >  	}
> > > > >  
> > > > > +	dev_dbg(sd->dev, "true\n");
> > > > 
> > > > 	dev_dbg(sd->dev, "compat match found\n");
> > > > 
> > > > > +
> > > > >  	return true;
> > > > >  }
> > > > >  
> > > > > @@ -255,7 +271,10 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
> > > > >  			v4l2_async_find_subdev_notifier(sd);
> > > > >  
> > > > >  		if (subdev_notifier &&
> > > > > -		    !v4l2_async_nf_can_complete(subdev_notifier))
> > > > > +		    !v4l2_async_nf_can_complete(subdev_notifier)) {
> > > > > +			if (subdev_notifier->sd)
> > > > > +				deb_dbg(subdev_notifier->sd->dev,
> > > > > +					"cannot complete\n");
> > > > 
> > > > I'd add a reference to v4l2-async, either directly in the string, or
> > > > with a "%s: ", __func__ prefix. Otherwise the message will be easy to
> > > > miss. Same in other messages. Maybe a "v4l2-async: " prefix for all
> > > > debug messages ?
> > > 
> > > How about just "async: " for all of these? It's shorther, still unique, and
> > > these lines will be long.
> > 
> > "async" is a bit vague, I think you should mention V4L2 too. If this
> > ends up printing
> > 
> > 3-0010 async: cannot complete
> > 
> > someone may wonder what it relates to. We're talking about debugging
> > messages here, let's make sure they improve debugging as much as
> > possible.
> 
> These messages include the device name which already implies what it is
> about, so I'm frankly not concerned about this. Also these messages tend to
> occur in series. Having them shorter, instead, is a small plus. An example:
> 
> [    5.716093] dw9807 i2c-PRP0001:01: async: matching for notifier \_SB.PCI0.CIO2, sd \_SB.PCI0.I2C2.VCM0
> [    5.716109] dw9807 i2c-PRP0001:01: async: fwnode match: need \_SB.PCI0.I2C2.VCM0, trying \_SB_.PCI0.I2C2.CAM0/port@0/endpoint@0
> [    5.716123] dw9807 i2c-PRP0001:01: async: fwnode compat match, need \_SB_.PCI0.I2C2.CAM0, trying \_SB.PCI0.I2C2.VCM0
> [    5.716131] dw9807 i2c-PRP0001:01: async: compat match not found
> [   30.333138] imx258 i2c-SONY258A:00: async: matching for notifier \_SB.PCI0.CIO2, sd \_SB.PCI0.I2C2.CAM0
> [   30.333154] imx258 i2c-SONY258A:00: async: fwnode match: need \_SB.PCI0.I2C2.CAM0, trying \_SB_.PCI0.I2C2.CAM0/port@0/endpoint@0
> [   30.333168] imx258 i2c-SONY258A:00: async: fwnode compat match, need \_SB_.PCI0.I2C2.CAM0, trying \_SB.PCI0.I2C2.CAM0
> [   30.333175] imx258 i2c-SONY258A:00: async: compat match not found
> [   30.333178] imx258 i2c-SONY258A:00: async: trying secondary fwnode match
> [   30.333181] imx258 i2c-SONY258A:00: async: fwnode match: need \_SB_.PCI0.I2C2.CAM0, trying \_SB_.PCI0.I2C2.CAM0/port@0/endpoint@0
> [   30.333189] imx258 i2c-SONY258A:00: async: fwnode compat match, need \_SB_.PCI0.I2C2.CAM0, trying \_SB_.PCI0.I2C2.CAM0
> [   30.333196] imx258 i2c-SONY258A:00: async: compat match found
> [   30.333214] dw9807 i2c-PRP0001:01: async: matching for notifier \_SB.PCI0.I2C2.CAM0, sd \_SB.PCI0.I2C2.VCM0
> [   30.333225] dw9807 i2c-PRP0001:01: async: fwnode match: need \_SB.PCI0.I2C2.VCM0, trying \_SB.PCI0.I2C2.VCM0
> [   30.333235] dw9807 i2c-PRP0001:01: async: direct match found
> [   30.333248] dw9807 i2c-PRP0001:01: async: bound to i2c-SONY258A:00's notifier (ret 0)
> [   30.333252] ipu3-cio2 0000:00:14.3: async: complete

I would still prefer v4l2-async, but I won't nack the patch just for
that.

> > > > >  			return false;
> > > > >  	}
> > > > >  
> > > > > @@ -273,18 +292,27 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> > > > >  	if (!list_empty(&notifier->waiting))
> > > > >  		return 0;
> > > > >  
> > > > > +	if (notifier->sd)
> > > > > +		deb_dbg(notifier->sd->dev, "trying to complete\n");
> > > > > +
> > > > >  	/* Check the entire notifier tree; find the root notifier first. */
> > > > >  	while (notifier->parent)
> > > > >  		notifier = notifier->parent;
> > > > >  
> > > > >  	/* This is root if it has v4l2_dev. */
> > > > > -	if (!notifier->v4l2_dev)
> > > > > +	if (!notifier->v4l2_dev) {
> > > > > +		if (notifier->sd)
> > > > > +			deb_dbg(notifier->sd->dev,
> > > > > +				"V4L2 device not available\n");
> > > > >  		return 0;
> > > > > +	}
> > > > >  
> > > > >  	/* Is everything ready? */
> > > > >  	if (!v4l2_async_nf_can_complete(notifier))
> > > > >  		return 0;
> > > > >  
> > > > > +	deb_dbg(notifier->sd->dev, "complete\n");
> > > > 
> > > > You guard against notifier->sd being NULL above, but not here. At least
> > > > one of the two is wrong.
> > > 
> > > I'll add a helper function to get the device safely.
> > > 
> > > > > +
> > > > >  	return v4l2_async_nf_call_complete(notifier);
> > > > >  }
> > > > >  
> > > > > @@ -386,6 +414,9 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
> > > > >  			continue;
> > > > >  
> > > > >  		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
> > > > > +		deb_dbg(sd->dev, "bound to %s's notifier (ret %d)\n",
> > > > > +			notifier->sd ? dev_name(notifier->sd->dev) : "no-dev",
> > > > > +			ret);
> > > > >  		if (ret < 0)
> > > > >  			return ret;
> > > > >  

-- 
Regards,

Laurent Pinchart
