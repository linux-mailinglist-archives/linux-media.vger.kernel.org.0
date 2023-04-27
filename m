Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2011C6F0519
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 13:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243459AbjD0LqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 07:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243201AbjD0LqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 07:46:19 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E2E4C01
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682595977; x=1714131977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IXm5GEuztyV6pnaZtmkl1XvTY2KAC44iG4hY5Sh+FsU=;
  b=mSbd0gE3GZ1bLeKSPOXKpv5V7poFmaU5yDa1mwGNO82CDU3A8Gki7HFg
   Odfdzhd7MSQY157al8X8ecdpcZC7qFjKSZfQnyYxSH2ZPj5usH7gbTzND
   yZetYuksGwQ94YeDHZCmsb4nZofpk6JQanddo/DMn3W14ldIdV/9lniNg
   NEzxbkrvtI7pOkcgwLX5qd3kGAc/HpQEOgFTvZNe717vjcrP9+08tQ+NI
   VCvEtSv9p7aUj/0kf8a2zlsl2uU+mnn9yqs5FEWhhEjjhlhZuYwByD2Fp
   N7v7I0uOhUnAL+3n9pLEstkLFS9hCQquYI2cNTzTxFyMcskwsxffDmQ9i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410439987"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="410439987"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="818499531"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="818499531"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:45:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id AE5F0122D21;
        Thu, 27 Apr 2023 14:45:50 +0300 (EEST)
Date:   Thu, 27 Apr 2023 14:45:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 06/18] media: v4l: async: Only pass match information for
 async subdev validation
Message-ID: <ZEpgbke+4BsgH+Yl@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-7-sakari.ailus@linux.intel.com>
 <20230425012426.GJ4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425012426.GJ4921@pendragon.ideasonboard.com>
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

On Tue, Apr 25, 2023 at 04:24:26AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review.

> 
> On Thu, Mar 30, 2023 at 02:58:41PM +0300, Sakari Ailus wrote:
> > Pass only information required for sub-device matching to functions
> > checking whether the async sub-device already exists. Do the same for
> > debug message printing. This makes further changes to other aspects of
> > async sub-devices easier.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 93 ++++++++++++++--------------
> >  1 file changed, 46 insertions(+), 47 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index fc9ae22e2b47..224ebf50f2d0 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -62,14 +62,14 @@ static void v4l2_async_nf_call_destroy(struct v4l2_async_notifier *n,
> >  }
> >  
> >  static bool match_i2c(struct v4l2_async_notifier *notifier,
> > -		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> > +		      struct v4l2_subdev *sd, struct v4l2_async_match *match)
> >  {
> >  #if IS_ENABLED(CONFIG_I2C)
> >  	struct i2c_client *client = i2c_verify_client(sd->dev);
> >  
> >  	return client &&
> > -		asd->match.i2c.adapter_id == client->adapter->nr &&
> > -		asd->match.i2c.address == client->addr;
> > +		match->i2c.adapter_id == client->adapter->nr &&
> > +		match->i2c.address == client->addr;
> >  #else
> >  	return false;
> >  #endif
> > @@ -84,26 +84,26 @@ static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
> >  static bool
> >  match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
> > -		 struct v4l2_async_subdev *asd)
> > +		 struct v4l2_async_match *match)
> >  {
> >  	struct fwnode_handle *asd_dev_fwnode;
> 
> match_dev_node, to remove references to asd ?

Sounds good.

> 
> >  	bool ret;
> >  
> >  	dev_dbg(sd->dev, "async: fwnode match: need %pfw, trying %pfw\n",
> > -		sd_fwnode, asd->match.fwnode);
> > +		sd_fwnode, match->fwnode);
> >  
> > -	if (sd_fwnode == asd->match.fwnode) {
> > +	if (sd_fwnode == match->fwnode) {
> >  		dev_dbg(sd->dev, "async: direct match found\n");
> >  		return true;
> >  	}
> >  
> > -	if (!fwnode_graph_is_endpoint(asd->match.fwnode)) {
> > +	if (!fwnode_graph_is_endpoint(match->fwnode)) {
> >  		dev_dbg(sd->dev,
> >  			"async: async subdev fwnode not endpoint, no match\n");
> 
> The reference to "subdev" could be dropped here too.

This will get changed in an earlier patch to "v4l2-async: direct match
failed".

> 
> >  		return false;
> >  	}
> >  
> > -	asd_dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> > +	asd_dev_fwnode = fwnode_graph_get_port_parent(match->fwnode);
> >  
> >  	ret = sd_fwnode == asd_dev_fwnode;
> >  
> > @@ -116,12 +116,12 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
> >  }
> >  
> >  static bool match_fwnode(struct v4l2_async_notifier *notifier,
> > -			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> > +			 struct v4l2_subdev *sd, struct v4l2_async_match *match)
> >  {
> >  	dev_dbg(sd->dev, "async: matching for notifier %pfw, sd %pfw\n",
> >  		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
> >  
> > -	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
> > +	if (match_fwnode_one(notifier, sd, sd->fwnode, match))
> >  		return true;
> >  
> >  	/* Also check the secondary fwnode. */
> > @@ -130,7 +130,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  
> >  	dev_dbg(sd->dev, "async: trying secondary fwnode match\n");
> >  
> > -	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
> > +	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, match);
> >  }
> >  
> >  static LIST_HEAD(subdev_list);
> > @@ -142,7 +142,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >  		      struct v4l2_subdev *sd)
> >  {
> >  	bool (*match)(struct v4l2_async_notifier *notifier,
> > -		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
> > +		      struct v4l2_subdev *sd, struct v4l2_async_match *match);
> >  	struct v4l2_async_subdev *asd;
> >  
> >  	list_for_each_entry(asd, &notifier->waiting, list) {
> > @@ -161,7 +161,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >  		}
> >  
> >  		/* match cannot be NULL here */
> > -		if (match(notifier, sd, asd))
> > +		if (match(notifier, sd, &asd->match))
> >  			return asd;
> >  	}
> >  
> > @@ -169,20 +169,18 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >  }
> >  
> >  /* Compare two async sub-device descriptors for equivalence */
> > -static bool asd_equal(struct v4l2_async_subdev *asd_x,
> > -		      struct v4l2_async_subdev *asd_y)
> > +static bool asd_equal(struct v4l2_async_match *match1,
> > +		      struct v4l2_async_match *match2)
> 
> The function doesn't deal with asds anymore, let's rename it.
> v4l2_async_match_equal() could be a good name. Please also update the
> comment above the function.

Seems fine.

> 
> >  {
> > -	if (asd_x->match.type != asd_y->match.type)
> > +	if (match1->type != match2->type)
> >  		return false;
> >  
> > -	switch (asd_x->match.type) {
> > +	switch (match1->type) {
> >  	case V4L2_ASYNC_MATCH_I2C:
> > -		return asd_x->match.i2c.adapter_id ==
> > -			asd_y->match.i2c.adapter_id &&
> > -			asd_x->match.i2c.address ==
> > -			asd_y->match.i2c.address;
> > +		return match1->i2c.adapter_id == match2->i2c.adapter_id &&
> > +			match1->i2c.address == match2->i2c.address;
> >  	case V4L2_ASYNC_MATCH_FWNODE:
> > -		return asd_x->match.fwnode == asd_y->match.fwnode;
> > +		return match1->fwnode == match2->fwnode;
> >  	default:
> >  		break;
> >  	}
> > @@ -434,20 +432,20 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
> >  /* See if an async sub-device can be found in a notifier's lists. */
> >  static bool
> >  __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> > -				 struct v4l2_async_subdev *asd)
> > +				 struct v4l2_async_match *match)
> 
> This function should be renamed to drop "subdev" as well.
> __v4l2_async_nf_has_match() is a candidate,
> __v4l2_async_nf_has_match_entry() is also an option to avoid implying
> that the function tests for a match between a subdev and a match entry.

Seems fine to me.

> 
> >  {
> > -	struct v4l2_async_subdev *asd_y;
> > +	struct v4l2_async_subdev *asd;
> >  	struct v4l2_subdev *sd;
> >  
> > -	list_for_each_entry(asd_y, &notifier->waiting, list)
> > -		if (asd_equal(asd, asd_y))
> > +	list_for_each_entry(asd, &notifier->waiting, list)
> > +		if (asd_equal(&asd->match, match))
> >  			return true;
> >  
> >  	list_for_each_entry(sd, &notifier->done, async_list) {
> >  		if (WARN_ON(!sd->asd))
> >  			continue;
> >  
> > -		if (asd_equal(asd, sd->asd))
> > +		if (asd_equal(&sd->asd->match, match))
> >  			return true;
> >  	}
> >  
> > @@ -460,49 +458,50 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> >   */
> >  static bool
> >  v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> > -			       struct v4l2_async_subdev *asd, bool skip_self)
> > +			       struct v4l2_async_match *match, bool skip_self)
> 
> Same here.
> 
> >  {
> > -	struct v4l2_async_subdev *asd_y;
> > +	struct v4l2_async_subdev *asd;
> >  
> >  	lockdep_assert_held(&list_lock);
> >  
> >  	/* Check that an asd is not being added more than once. */
> > -	list_for_each_entry(asd_y, &notifier->asd_list, asd_list) {
> > -		if (asd == asd_y)
> > +	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> > +		if (&asd->match == match)
> >  			break;
> > -		if (asd_equal(asd, asd_y))
> > +		if (asd_equal(&asd->match, match))
> >  			return true;
> >  	}
> >  
> >  	/* Check that an asd does not exist in other notifiers. */
> >  	list_for_each_entry(notifier, &notifier_list, list)
> > -		if (__v4l2_async_nf_has_async_subdev(notifier, asd))
> > +		if (__v4l2_async_nf_has_async_subdev(notifier, match))
> >  			return true;
> >  
> >  	return false;
> >  }
> >  
> >  static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> > -				   struct v4l2_async_subdev *asd,
> > +				   struct v4l2_async_match *match,
> >  				   bool skip_self)
> 
> And here.
> 
> >  {
> >  	struct device *dev =
> >  		notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
> >  
> > -	if (!asd)
> > +	if (!match)
> >  		return -EINVAL;
> >  
> > -	switch (asd->match.type) {
> > +	switch (match->type) {
> >  	case V4L2_ASYNC_MATCH_I2C:
> >  	case V4L2_ASYNC_MATCH_FWNODE:
> > -		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
> > +		if (v4l2_async_nf_has_async_subdev(notifier, match,
> > +						   skip_self)) {
> >  			dev_dbg(dev, "subdev descriptor already listed in this or other notifiers\n");
> 
> "match descriptor" ?


Yes!

> 
> >  			return -EEXIST;
> >  		}
> >  		break;
> >  	default:
> > -		dev_err(dev, "Invalid match type %u on %p\n",
> > -			asd->match.type, asd);
> > +		dev_err(dev, "Invalid match type %u on %p\n", match->type,
> > +			match);
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -526,7 +525,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
> >  	mutex_lock(&list_lock);
> >  
> >  	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> > -		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
> > +		ret = v4l2_async_nf_asd_valid(notifier, &asd->match, true);
> >  		if (ret)
> >  			goto err_unlock;
> >  
> > @@ -659,7 +658,7 @@ int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
> >  
> >  	mutex_lock(&list_lock);
> >  
> > -	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
> > +	ret = v4l2_async_nf_asd_valid(notifier, &asd->match, false);
> >  	if (ret)
> >  		goto unlock;
> >  
> > @@ -846,15 +845,15 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> >  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> >  
> >  static void print_waiting_subdev(struct seq_file *s,
> 
> Same here. v4l2_async_print_match() or v4l2_async_print_match_entry()
> could be good names.

v4l2_async_print_waiting_matches()?

> 
> In general, it would be useful to have a glossary of terms used in
> v4l2-async, and make sure they're used consistently.

I think this should be already outside this set. I'm all for consolidated
terms though. I'll go through the set in this respect as well.

> 
> > -				 struct v4l2_async_subdev *asd)
> > +				 struct v4l2_async_match *match)
> >  {
> > -	switch (asd->match.type) {
> > +	switch (match->type) {
> >  	case V4L2_ASYNC_MATCH_I2C:
> > -		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
> > -			   asd->match.i2c.address);
> > +		seq_printf(s, " [i2c] dev=%d-%04x\n", match->i2c.adapter_id,
> > +			   match->i2c.address);
> >  		break;
> >  	case V4L2_ASYNC_MATCH_FWNODE: {
> > -		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
> > +		struct fwnode_handle *devnode, *fwnode = match->fwnode;
> >  
> >  		devnode = fwnode_graph_is_endpoint(fwnode) ?
> >  			  fwnode_graph_get_port_parent(fwnode) :
> > @@ -891,7 +890,7 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
> >  	list_for_each_entry(notif, &notifier_list, list) {
> >  		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
> >  		list_for_each_entry(asd, &notif->waiting, list)
> > -			print_waiting_subdev(s, asd);
> > +			print_waiting_subdev(s, &asd->match);
> >  	}
> >  
> >  	mutex_unlock(&list_lock);
> 

-- 
Regards,

Sakari Ailus
