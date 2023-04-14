Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C08936E1CFE
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 09:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjDNHPb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 03:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjDNHPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 03:15:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5558B3AAD
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 00:15:28 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E11F4D20;
        Fri, 14 Apr 2023 09:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681456523;
        bh=oAPosc+IqiyrqoJcWVt3xS34qu98UcbVHvkzG56pcyE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EeB9zxOhxtxNrO7F5LJadTl02REqqup9/g8sXz1XFx6UkRTl7Xjbikys67VQaM5WC
         NGjkNRJTxidV3ABpVZ5Ea/4xKeN1M7jubZFJw0mRNcOYWd1jzFxxxwpSqhNBaTbHnB
         q22lz04OdXSROahQ70wzQZjdBGvFfbvhkjlmwNnw=
Date:   Fri, 14 Apr 2023 09:15:23 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 06/18] media: v4l: async: Only pass match information for
 async subdev validation
Message-ID: <647w6asful7m4wkjbetw33pxig7rkql66vghecafo34eggx7b2@o4ewbzx7xh3z>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-7-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Thu, Mar 30, 2023 at 02:58:41PM +0300, Sakari Ailus wrote:
> Pass only information required for sub-device matching to functions
> checking whether the async sub-device already exists. Do the same for
> debug message printing. This makes further changes to other aspects of
> async sub-devices easier.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 93 ++++++++++++++--------------
>  1 file changed, 46 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index fc9ae22e2b47..224ebf50f2d0 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -62,14 +62,14 @@ static void v4l2_async_nf_call_destroy(struct v4l2_async_notifier *n,
>  }
>
>  static bool match_i2c(struct v4l2_async_notifier *notifier,
> -		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +		      struct v4l2_subdev *sd, struct v4l2_async_match *match)
>  {
>  #if IS_ENABLED(CONFIG_I2C)
>  	struct i2c_client *client = i2c_verify_client(sd->dev);
>
>  	return client &&
> -		asd->match.i2c.adapter_id == client->adapter->nr &&
> -		asd->match.i2c.address == client->addr;
> +		match->i2c.adapter_id == client->adapter->nr &&
> +		match->i2c.address == client->addr;
>  #else
>  	return false;
>  #endif
> @@ -84,26 +84,26 @@ static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
>  static bool
>  match_fwnode_one(struct v4l2_async_notifier *notifier,
>  		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
> -		 struct v4l2_async_subdev *asd)
> +		 struct v4l2_async_match *match)
>  {
>  	struct fwnode_handle *asd_dev_fwnode;
>  	bool ret;
>
>  	dev_dbg(sd->dev, "async: fwnode match: need %pfw, trying %pfw\n",
> -		sd_fwnode, asd->match.fwnode);
> +		sd_fwnode, match->fwnode);
>
> -	if (sd_fwnode == asd->match.fwnode) {
> +	if (sd_fwnode == match->fwnode) {
>  		dev_dbg(sd->dev, "async: direct match found\n");
>  		return true;
>  	}
>
> -	if (!fwnode_graph_is_endpoint(asd->match.fwnode)) {
> +	if (!fwnode_graph_is_endpoint(match->fwnode)) {
>  		dev_dbg(sd->dev,
>  			"async: async subdev fwnode not endpoint, no match\n");
>  		return false;
>  	}
>
> -	asd_dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> +	asd_dev_fwnode = fwnode_graph_get_port_parent(match->fwnode);
>
>  	ret = sd_fwnode == asd_dev_fwnode;
>
> @@ -116,12 +116,12 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  }
>
>  static bool match_fwnode(struct v4l2_async_notifier *notifier,
> -			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +			 struct v4l2_subdev *sd, struct v4l2_async_match *match)
>  {
>  	dev_dbg(sd->dev, "async: matching for notifier %pfw, sd %pfw\n",
>  		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
>
> -	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
> +	if (match_fwnode_one(notifier, sd, sd->fwnode, match))
>  		return true;
>
>  	/* Also check the secondary fwnode. */
> @@ -130,7 +130,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>
>  	dev_dbg(sd->dev, "async: trying secondary fwnode match\n");
>
> -	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
> +	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, match);
>  }
>
>  static LIST_HEAD(subdev_list);
> @@ -142,7 +142,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_subdev *sd)
>  {
>  	bool (*match)(struct v4l2_async_notifier *notifier,
> -		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
> +		      struct v4l2_subdev *sd, struct v4l2_async_match *match);
>  	struct v4l2_async_subdev *asd;
>
>  	list_for_each_entry(asd, &notifier->waiting, list) {
> @@ -161,7 +161,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		}
>
>  		/* match cannot be NULL here */
> -		if (match(notifier, sd, asd))
> +		if (match(notifier, sd, &asd->match))
>  			return asd;
>  	}
>
> @@ -169,20 +169,18 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  }
>
>  /* Compare two async sub-device descriptors for equivalence */
> -static bool asd_equal(struct v4l2_async_subdev *asd_x,
> -		      struct v4l2_async_subdev *asd_y)
> +static bool asd_equal(struct v4l2_async_match *match1,
> +		      struct v4l2_async_match *match2)
>  {
> -	if (asd_x->match.type != asd_y->match.type)
> +	if (match1->type != match2->type)
>  		return false;
>
> -	switch (asd_x->match.type) {
> +	switch (match1->type) {
>  	case V4L2_ASYNC_MATCH_I2C:
> -		return asd_x->match.i2c.adapter_id ==
> -			asd_y->match.i2c.adapter_id &&
> -			asd_x->match.i2c.address ==
> -			asd_y->match.i2c.address;
> +		return match1->i2c.adapter_id == match2->i2c.adapter_id &&
> +			match1->i2c.address == match2->i2c.address;
>  	case V4L2_ASYNC_MATCH_FWNODE:
> -		return asd_x->match.fwnode == asd_y->match.fwnode;
> +		return match1->fwnode == match2->fwnode;
>  	default:
>  		break;
>  	}
> @@ -434,20 +432,20 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
>  /* See if an async sub-device can be found in a notifier's lists. */
>  static bool
>  __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> -				 struct v4l2_async_subdev *asd)
> +				 struct v4l2_async_match *match)
>  {
> -	struct v4l2_async_subdev *asd_y;
> +	struct v4l2_async_subdev *asd;
>  	struct v4l2_subdev *sd;
>
> -	list_for_each_entry(asd_y, &notifier->waiting, list)
> -		if (asd_equal(asd, asd_y))
> +	list_for_each_entry(asd, &notifier->waiting, list)
> +		if (asd_equal(&asd->match, match))
>  			return true;
>
>  	list_for_each_entry(sd, &notifier->done, async_list) {
>  		if (WARN_ON(!sd->asd))
>  			continue;
>
> -		if (asd_equal(asd, sd->asd))
> +		if (asd_equal(&sd->asd->match, match))
>  			return true;
>  	}
>
> @@ -460,49 +458,50 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>   */
>  static bool
>  v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> -			       struct v4l2_async_subdev *asd, bool skip_self)
> +			       struct v4l2_async_match *match, bool skip_self)
>  {
> -	struct v4l2_async_subdev *asd_y;
> +	struct v4l2_async_subdev *asd;
>
>  	lockdep_assert_held(&list_lock);
>
>  	/* Check that an asd is not being added more than once. */
> -	list_for_each_entry(asd_y, &notifier->asd_list, asd_list) {
> -		if (asd == asd_y)
> +	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> +		if (&asd->match == match)
>  			break;
> -		if (asd_equal(asd, asd_y))
> +		if (asd_equal(&asd->match, match))
>  			return true;
>  	}
>
>  	/* Check that an asd does not exist in other notifiers. */
>  	list_for_each_entry(notifier, &notifier_list, list)
> -		if (__v4l2_async_nf_has_async_subdev(notifier, asd))
> +		if (__v4l2_async_nf_has_async_subdev(notifier, match))
>  			return true;
>
>  	return false;
>  }
>
>  static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> -				   struct v4l2_async_subdev *asd,
> +				   struct v4l2_async_match *match,

I would have kept the asd here, but I presume having match here makes
things easier in the next patches


>  				   bool skip_self)
>  {
>  	struct device *dev =
>  		notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
>
> -	if (!asd)
> +	if (!match)
>  		return -EINVAL;

Match cannot be null, as it's a member of struct v4l2_async_subdev

>
> -	switch (asd->match.type) {
> +	switch (match->type) {
>  	case V4L2_ASYNC_MATCH_I2C:
>  	case V4L2_ASYNC_MATCH_FWNODE:
> -		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
> +		if (v4l2_async_nf_has_async_subdev(notifier, match,
> +						   skip_self)) {
>  			dev_dbg(dev, "subdev descriptor already listed in this or other notifiers\n");
>  			return -EEXIST;
>  		}
>  		break;
>  	default:
> -		dev_err(dev, "Invalid match type %u on %p\n",
> -			asd->match.type, asd);
> +		dev_err(dev, "Invalid match type %u on %p\n", match->type,
> +			match);
>  		return -EINVAL;
>  	}
>
> @@ -526,7 +525,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	mutex_lock(&list_lock);
>
>  	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> -		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
> +		ret = v4l2_async_nf_asd_valid(notifier, &asd->match, true);
>  		if (ret)
>  			goto err_unlock;
>
> @@ -659,7 +658,7 @@ int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
>
>  	mutex_lock(&list_lock);
>
> -	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
> +	ret = v4l2_async_nf_asd_valid(notifier, &asd->match, false);
>  	if (ret)
>  		goto unlock;
>
> @@ -846,15 +845,15 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
>
>  static void print_waiting_subdev(struct seq_file *s,
> -				 struct v4l2_async_subdev *asd)
> +				 struct v4l2_async_match *match)
>  {
> -	switch (asd->match.type) {
> +	switch (match->type) {
>  	case V4L2_ASYNC_MATCH_I2C:
> -		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
> -			   asd->match.i2c.address);
> +		seq_printf(s, " [i2c] dev=%d-%04x\n", match->i2c.adapter_id,
> +			   match->i2c.address);
>  		break;
>  	case V4L2_ASYNC_MATCH_FWNODE: {
> -		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
> +		struct fwnode_handle *devnode, *fwnode = match->fwnode;
>
>  		devnode = fwnode_graph_is_endpoint(fwnode) ?
>  			  fwnode_graph_get_port_parent(fwnode) :
> @@ -891,7 +890,7 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
>  	list_for_each_entry(notif, &notifier_list, list) {
>  		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
>  		list_for_each_entry(asd, &notif->waiting, list)
> -			print_waiting_subdev(s, asd);
> +			print_waiting_subdev(s, &asd->match);
>  	}
>
>  	mutex_unlock(&list_lock);
> --
> 2.30.2
>
