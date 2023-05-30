Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771D871541A
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 05:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjE3DCV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 23:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjE3DCS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 23:02:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A055B2
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 20:02:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126158230151.30.openmobile.ne.jp [126.158.230.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E44D27C;
        Tue, 30 May 2023 05:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685415713;
        bh=5qTNhh8hJXd0mu0uprKge+zQcqJCZNrbVXzomAB20ro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jtw8Mjf2bcUymfbUMWVY7ZMHn3raEDhvhJbrt8Tlpxe3MzgTpGTpxjXMFg78Xofmo
         7XR/YAFpcDCfnu1xqtowtY1A26CCCgwDlkYfRUZE3iwFFK8O4rvY3qV8GkWpd1GhYe
         fQ+CGixl8H3KIfJT8q44h3mf9sBA1T8r5FwOmzfk=
Date:   Tue, 30 May 2023 06:02:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 11/32] media: v4l: async: Only pass match
 information for async subdev validation
Message-ID: <20230530030215.GL21633@pendragon.ideasonboard.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-12-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525091615.2324824-12-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, May 25, 2023 at 12:15:54PM +0300, Sakari Ailus wrote:
> Pass only information required for sub-device matching to functions
> checking whether the async sub-device already exists. Do the same for
> debug message printing. This makes further changes to other aspects of
> async sub-devices easier.
> 
> Accordingly, also perform further renames:
> 
> 	asd_equal as v4l2_async_match_equal,
> 	v4l2_async_nf_has_async_subdev as v4l2_async_nf_has_async_match,
> 	__v4l2_async_nf_has_async_subdev as
> 		v4l2_async_nf_has_async_subdev_entry and
> 	v4l2_async_nf_asd_valid as v4l2_async_nf_match_valid.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 109 ++++++++++++++-------------
>  1 file changed, 56 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 93234c316aa6e..5eb9850f1c6c4 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -64,14 +64,15 @@ static void v4l2_async_nf_call_destroy(struct v4l2_async_notifier *n,
>  }
>  
>  static bool match_i2c(struct v4l2_async_notifier *notifier,
> -		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +		      struct v4l2_subdev *sd,
> +		      struct v4l2_async_match_desc *match)
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
> @@ -91,7 +92,7 @@ static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
>  static bool
>  match_fwnode_one(struct v4l2_async_notifier *notifier,
>  		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
> -		 struct v4l2_async_subdev *asd)
> +		 struct v4l2_async_match_desc *match)
>  {
>  	struct fwnode_handle *other_fwnode;
>  	struct fwnode_handle *dev_fwnode;
> @@ -101,14 +102,14 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  
>  	dev_dbg(notifier_dev(notifier),
>  		"v4l2-async: fwnode match: need %pfw, trying %pfw\n",
> -		sd_fwnode, asd->match.fwnode);
> +		sd_fwnode, match->fwnode);
>  
>  	/*
>  	 * Both the subdev and the async subdev can provide either an endpoint
>  	 * fwnode or a device fwnode. Start with the simple case of direct
>  	 * fwnode matching.
>  	 */
> -	if (sd_fwnode == asd->match.fwnode) {
> +	if (sd_fwnode == match->fwnode) {
>  		dev_dbg(notifier_dev(notifier),
>  			"v4l2-async: direct match found\n");
>  		return true;
> @@ -123,7 +124,7 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	 * match unconnected endpoints.
>  	 */
>  	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
> -	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
> +	asd_fwnode_is_ep = fwnode_graph_is_endpoint(match->fwnode);
>  
>  	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
>  		dev_dbg(notifier_dev(notifier),
> @@ -137,9 +138,9 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	 */
>  	if (sd_fwnode_is_ep) {
>  		dev_fwnode = fwnode_graph_get_port_parent(sd_fwnode);
> -		other_fwnode = asd->match.fwnode;
> +		other_fwnode = match->fwnode;
>  	} else {
> -		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> +		dev_fwnode = fwnode_graph_get_port_parent(match->fwnode);
>  		other_fwnode = sd_fwnode;
>  	}
>  
> @@ -179,13 +180,14 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  }
>  
>  static bool match_fwnode(struct v4l2_async_notifier *notifier,
> -			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> +			 struct v4l2_subdev *sd,
> +			 struct v4l2_async_match_desc *match)
>  {
>  	dev_dbg(notifier_dev(notifier),
>  		"v4l2-async: matching for notifier %pfw, sd fwnode %pfw\n",
>  		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
>  
> -	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
> +	if (match_fwnode_one(notifier, sd, sd->fwnode, match))
>  		return true;
>  
>  	/* Also check the secondary fwnode. */
> @@ -195,7 +197,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	dev_dbg(notifier_dev(notifier),
>  		"v4l2-async: trying secondary fwnode match\n");
>  
> -	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
> +	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, match);
>  }
>  
>  static LIST_HEAD(subdev_list);
> @@ -207,7 +209,8 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_subdev *sd)
>  {
>  	bool (*match)(struct v4l2_async_notifier *notifier,
> -		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
> +		      struct v4l2_subdev *sd,
> +		      struct v4l2_async_match_desc *match);
>  	struct v4l2_async_subdev *asd;
>  
>  	list_for_each_entry(asd, &notifier->waiting, list) {
> @@ -226,7 +229,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		}
>  
>  		/* match cannot be NULL here */
> -		if (match(notifier, sd, asd))
> +		if (match(notifier, sd, &asd->match))
>  			return asd;
>  	}
>  
> @@ -234,20 +237,18 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  }
>  
>  /* Compare two async sub-device descriptors for equivalence */

s/sub-device/match/ ?

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> -static bool asd_equal(struct v4l2_async_subdev *asd_x,
> -		      struct v4l2_async_subdev *asd_y)
> +static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
> +				   struct v4l2_async_match_desc *match2)
>  {
> -	if (asd_x->match.type != asd_y->match.type)
> +	if (match1->type != match2->type)
>  		return false;
>  
> -	switch (asd_x->match.type) {
> +	switch (match1->type) {
>  	case V4L2_ASYNC_MATCH_TYPE_I2C:
> -		return asd_x->match.i2c.adapter_id ==
> -			asd_y->match.i2c.adapter_id &&
> -			asd_x->match.i2c.address ==
> -			asd_y->match.i2c.address;
> +		return match1->i2c.adapter_id == match2->i2c.adapter_id &&
> +			match1->i2c.address == match2->i2c.address;
>  	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
> -		return asd_x->match.fwnode == asd_y->match.fwnode;
> +		return match1->fwnode == match2->fwnode;
>  	default:
>  		break;
>  	}
> @@ -497,21 +498,21 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
>  
>  /* See if an async sub-device can be found in a notifier's lists. */
>  static bool
> -__v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> -				 struct v4l2_async_subdev *asd)
> +v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
> +				    struct v4l2_async_match_desc *match)
>  {
> -	struct v4l2_async_subdev *asd_y;
> +	struct v4l2_async_subdev *asd;
>  	struct v4l2_subdev *sd;
>  
> -	list_for_each_entry(asd_y, &notifier->waiting, list)
> -		if (asd_equal(asd, asd_y))
> +	list_for_each_entry(asd, &notifier->waiting, list)
> +		if (v4l2_async_match_equal(&asd->match, match))
>  			return true;
>  
>  	list_for_each_entry(sd, &notifier->done, async_list) {
>  		if (WARN_ON(!sd->asd))
>  			continue;
>  
> -		if (asd_equal(asd, sd->asd))
> +		if (v4l2_async_match_equal(&sd->asd->match, match))
>  			return true;
>  	}
>  
> @@ -523,46 +524,48 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
>   * whether it exists in a given notifier.
>   */
>  static bool
> -v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
> -			       struct v4l2_async_subdev *asd, bool skip_self)
> +v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
> +			      struct v4l2_async_match_desc *match,
> +			      bool skip_self)
>  {
> -	struct v4l2_async_subdev *asd_y;
> +	struct v4l2_async_subdev *asd;
>  
>  	lockdep_assert_held(&list_lock);
>  
>  	/* Check that an asd is not being added more than once. */
> -	list_for_each_entry(asd_y, &notifier->asd_list, asd_list) {
> -		if (skip_self && asd == asd_y)
> +	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> +		if (skip_self && &asd->match == match)
>  			break;
> -		if (asd_equal(asd, asd_y))
> +		if (v4l2_async_match_equal(&asd->match, match))
>  			return true;
>  	}
>  
>  	/* Check that an asd does not exist in other notifiers. */
>  	list_for_each_entry(notifier, &notifier_list, list)
> -		if (__v4l2_async_nf_has_async_subdev(notifier, asd))
> +		if (v4l2_async_nf_has_async_match_entry(notifier, match))
>  			return true;
>  
>  	return false;
>  }
>  
> -static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> -				   struct v4l2_async_subdev *asd,
> -				   bool skip_self)
> +static int v4l2_async_nf_match_valid(struct v4l2_async_notifier *notifier,
> +				     struct v4l2_async_match_desc *match,
> +				     bool skip_self)
>  {
>  	struct device *dev = notifier_dev(notifier);
>  
> -	switch (asd->match.type) {
> +	switch (match->type) {
>  	case V4L2_ASYNC_MATCH_TYPE_I2C:
>  	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
> -		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
> -			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in a notifier\n");
> +		if (v4l2_async_nf_has_async_match(notifier, match,
> +						  skip_self)) {
> +			dev_dbg(dev, "v4l2-async: match descriptor already listed in a notifier\n");
>  			return -EEXIST;
>  		}
>  		break;
>  	default:
> -		dev_err(dev, "v4l2-asymc: Invalid match type %u on %p\n",
> -			asd->match.type, asd);
> +		dev_err(dev, "v4l2-async: Invalid match type %u on %p\n",
> +			match->type, match);
>  		return -EINVAL;
>  	}
>  
> @@ -586,7 +589,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	mutex_lock(&list_lock);
>  
>  	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> -		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
> +		ret = v4l2_async_nf_match_valid(notifier, &asd->match, true);
>  		if (ret)
>  			goto err_unlock;
>  
> @@ -720,7 +723,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
>  
>  	mutex_lock(&list_lock);
>  
> -	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
> +	ret = v4l2_async_nf_match_valid(notifier, &asd->match, false);
>  	if (ret)
>  		goto unlock;
>  
> @@ -898,16 +901,16 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  }
>  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
>  
> -static void print_waiting_subdev(struct seq_file *s,
> -				 struct v4l2_async_subdev *asd)
> +static void print_waiting_match(struct seq_file *s,
> +				struct v4l2_async_match_desc *match)
>  {
> -	switch (asd->match.type) {
> +	switch (match->type) {
>  	case V4L2_ASYNC_MATCH_TYPE_I2C:
> -		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
> -			   asd->match.i2c.address);
> +		seq_printf(s, " [i2c] dev=%d-%04x\n", match->i2c.adapter_id,
> +			   match->i2c.address);
>  		break;
>  	case V4L2_ASYNC_MATCH_TYPE_FWNODE: {
> -		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
> +		struct fwnode_handle *devnode, *fwnode = match->fwnode;
>  
>  		devnode = fwnode_graph_is_endpoint(fwnode) ?
>  			  fwnode_graph_get_port_parent(fwnode) :
> @@ -944,7 +947,7 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
>  	list_for_each_entry(notif, &notifier_list, list) {
>  		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
>  		list_for_each_entry(asd, &notif->waiting, list)
> -			print_waiting_subdev(s, asd);
> +			print_waiting_match(s, &asd->match);
>  	}
>  
>  	mutex_unlock(&list_lock);

-- 
Regards,

Laurent Pinchart
