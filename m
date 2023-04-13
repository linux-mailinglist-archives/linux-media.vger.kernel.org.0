Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07036E12CD
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 18:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjDMQuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 12:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjDMQuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 12:50:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE692688
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 09:50:10 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD272617B;
        Thu, 13 Apr 2023 18:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681404605;
        bh=+JuqW17ST3sQVOEd4chGNx76lpVSvz/cNURHR8uVZTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k8VPyQOx54qrm8TEnyvtLKbS1W7ShHZoi9cRd3nn9eDWPXK6WqQERhIaVa5cJ4EkL
         KmFhIM3u14134van49rR8YCWBMlAjSc9bmuLBESsLjpfk+G0Psq/fnhM41eIwW5vpr
         iYI9X5EZ5EfOi5bmsG7oe94upH5ZxIx4STX1zZkk=
Date:   Thu, 13 Apr 2023 18:50:04 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 03/18] media: v4l: async: Simplify async sub-device
 fwnode matching
Message-ID: <dpw2fvycehgud3ijdzppy24bep2a54ceceksmifetczikdmgeq@ok4vru42ocvy>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Thu, Mar 30, 2023 at 02:58:38PM +0300, Sakari Ailus wrote:
> V4L2 async sub-device matching originally used the device nodes only.
> Endpoint nodes were taken into use instead as using the device nodes was
> problematic for it was in some cases ambiguous which link might have been
> in question.
>
> There is however no need to use endpoint nodes on both sides, as the async
> sub-device's fwnode can always be trivially obtained using
> fwnode_graph_get_remote_endpoint() when needed while what counts is
> whether or not the link is between two device nodes, i.e. the device nodes
> match.
>

As you know I'm a bit debated.

Strict endpoint-matching requires one subdev to be registed per each
endpoint, and this is tedious for drivers that have to register a
subdev for each of its endpoints

Allowing a subdev to be matched multiple times on different endpoints
gives a way for lazy drivers to take a shortcut and simplify their
topologies to a single subdev, when they would actually need more.

Also, knowing where this series is going, I wonder if this wouldn't be
a good time to enforce all async subdevices to be registered with an
endpoint. From a very quick look at the drivers we have in mainline
only a few still use v4l2_async_nf_add_fwnode() and only 4 of them
(camss, rcar_drif, am437x-vpfe, vpif_capture, xilinx_vipp) use as
match.fwnode what the remote port parent.

I wonder if this would be a good occasione to enforce with a WARN() if
!fwnode_graph_is_endpoint(fwnode) in v4l2_async_nf_add_fwnode() (or
possibily, even remove that function and port all drivers to use
vl2_async_nf_add_fwnode_remote(). I can help, if the above makes sense
to you as well.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c |  3 -
>  drivers/media/i2c/max9286.c              | 14 +---
>  drivers/media/i2c/rdacm20.c              | 15 +----
>  drivers/media/i2c/rdacm21.c              | 15 +----
>  drivers/media/i2c/tc358746.c             |  3 -
>  drivers/media/v4l2-core/v4l2-async.c     | 86 ++++++------------------
>  6 files changed, 24 insertions(+), 112 deletions(-)
>
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index bd4f3fe0e309..3d830816243f 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -300,9 +300,6 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>  			    MEDIA_ENT_F_VID_IF_BRIDGE,
>  			    is_txa(tx) ? "txa" : "txb");
>
> -	/* Ensure that matching is based upon the endpoint fwnodes */
> -	tx->sd.fwnode = of_fwnode_handle(state->endpoints[tx->port]);
> -
>  	/* Register internal ops for incremental subdev registration */
>  	tx->sd.internal_ops = &adv748x_csi2_internal_ops;
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 701038d6d19b..2d0f43e3fb9f 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1051,7 +1051,6 @@ static const struct v4l2_ctrl_ops max9286_ctrl_ops = {
>  static int max9286_v4l2_register(struct max9286_priv *priv)
>  {
>  	struct device *dev = &priv->client->dev;
> -	struct fwnode_handle *ep;
>  	int ret;
>  	int i;
>
> @@ -1093,25 +1092,14 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	if (ret)
>  		goto err_async;
>
> -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), MAX9286_SRC_PAD,
> -					     0, 0);
> -	if (!ep) {
> -		dev_err(dev, "Unable to retrieve endpoint on \"port@4\"\n");
> -		ret = -ENOENT;
> -		goto err_async;
> -	}
> -	priv->sd.fwnode = ep;
> -


You should also remove the fwnode_handle_put() call from

static void max9286_v4l2_unregister(struct max9286_priv *priv)
{
	fwnode_handle_put(priv->sd.fwnode);
	v4l2_async_unregister_subdev(&priv->sd);
	max9286_v4l2_notifier_unregister(priv);
}

>  	ret = v4l2_async_register_subdev(&priv->sd);
>  	if (ret < 0) {
>  		dev_err(dev, "Unable to register subdevice\n");
> -		goto err_put_node;
> +		goto err_async;
>  	}
>
>  	return 0;
>
> -err_put_node:
> -	fwnode_handle_put(ep);
>  err_async:
>  	v4l2_ctrl_handler_free(&priv->ctrls);
>  	max9286_v4l2_notifier_unregister(priv);
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index a2263fa825b5..ea1111152285 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -567,7 +567,6 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  static int rdacm20_probe(struct i2c_client *client)
>  {
>  	struct rdacm20_device *dev;
> -	struct fwnode_handle *ep;
>  	int ret;
>
>  	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
> @@ -616,24 +615,12 @@ static int rdacm20_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto error_free_ctrls;
>
> -	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
> -	if (!ep) {
> -		dev_err(&client->dev,
> -			"Unable to get endpoint in node %pOF\n",
> -			client->dev.of_node);
> -		ret = -ENOENT;
> -		goto error_free_ctrls;
> -	}
> -	dev->sd.fwnode = ep;

Same for this driver and for rdacm21

> -
>  	ret = v4l2_async_register_subdev(&dev->sd);
>  	if (ret)
> -		goto error_put_node;
> +		goto error_free_ctrls;
>
>  	return 0;
>
> -error_put_node:
> -	fwnode_handle_put(ep);
>  error_free_ctrls:
>  	v4l2_ctrl_handler_free(&dev->ctrls);
>  error:
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 9ccc56c30d3b..d67cfcb2e05a 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -543,7 +543,6 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
>  static int rdacm21_probe(struct i2c_client *client)
>  {
>  	struct rdacm21_device *dev;
> -	struct fwnode_handle *ep;
>  	int ret;
>
>  	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
> @@ -588,24 +587,12 @@ static int rdacm21_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto error_free_ctrls;
>
> -	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
> -	if (!ep) {
> -		dev_err(&client->dev,
> -			"Unable to get endpoint in node %pOF\n",
> -			client->dev.of_node);
> -		ret = -ENOENT;
> -		goto error_free_ctrls;
> -	}
> -	dev->sd.fwnode = ep;
> -
>  	ret = v4l2_async_register_subdev(&dev->sd);
>  	if (ret)
> -		goto error_put_node;
> +		goto error_free_ctrls;
>
>  	return 0;
>
> -error_put_node:
> -	fwnode_handle_put(dev->sd.fwnode);
>  error_free_ctrls:
>  	v4l2_ctrl_handler_free(&dev->ctrls);
>  error:
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index 4063754a6732..56f2b43d4edf 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -1476,9 +1476,6 @@ static int tc358746_async_register(struct tc358746 *tc358746)
>  	if (err)
>  		goto err_cleanup;
>
> -	tc358746->sd.fwnode = fwnode_graph_get_endpoint_by_id(
> -		dev_fwnode(tc358746->sd.dev), TC358746_SOURCE, 0, 0);
> -
>  	err = v4l2_async_register_subdev(&tc358746->sd);
>  	if (err)
>  		goto err_unregister;
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 6dd426c2ca68..13fe0bdc70b6 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -86,84 +86,33 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
>  		 struct v4l2_async_subdev *asd)
>  {
> -	struct fwnode_handle *other_fwnode;
> -	struct fwnode_handle *dev_fwnode;
> -	bool asd_fwnode_is_ep;
> -	bool sd_fwnode_is_ep;
> -	struct device *dev;
> +	struct fwnode_handle *asd_dev_fwnode;
> +	bool ret;
>
>  	dev_dbg(sd->dev, "async: fwnode match: need %pfw, trying %pfw\n",
>  		sd_fwnode, asd->match.fwnode);
>
> -	/*
> -	 * Both the subdev and the async subdev can provide either an endpoint
> -	 * fwnode or a device fwnode. Start with the simple case of direct
> -	 * fwnode matching.
> -	 */
>  	if (sd_fwnode == asd->match.fwnode) {
>  		dev_dbg(sd->dev, "async: direct match found\n");
>  		return true;
>  	}
>
> -	/*
> -	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> -	 * endpoint or a device. If they're of the same type, there's no match.
> -	 * Technically speaking this checks if the nodes refer to a connected
> -	 * endpoint, which is the simplest check that works for both OF and
> -	 * ACPI. This won't make a difference, as drivers should not try to
> -	 * match unconnected endpoints.
> -	 */
> -	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
> -	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
> -
> -	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
> -		dev_dbg(sd->dev, "async: matching node types\n");
> +	if (!fwnode_graph_is_endpoint(asd->match.fwnode)) {
> +		dev_dbg(sd->dev,
> +			"async: async subdev fwnode not endpoint, no match\n");

As per the previous patch I would just say "direct match failed";

>  		return false;
>  	}
>
> -	/*
> -	 * The sd and asd fwnodes are of different types. Get the device fwnode
> -	 * parent of the endpoint fwnode, and compare it with the other fwnode.
> -	 */
> -	if (sd_fwnode_is_ep) {
> -		dev_fwnode = fwnode_graph_get_port_parent(sd_fwnode);
> -		other_fwnode = asd->match.fwnode;
> -	} else {
> -		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> -		other_fwnode = sd_fwnode;
> -	}
> -
> -	dev_dbg(sd->dev, "async: fwnode compat match, need %pfw, trying %pfw\n",
> -		dev_fwnode, other_fwnode);
> +	asd_dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
>
> -	fwnode_handle_put(dev_fwnode);
> +	ret = sd_fwnode == asd_dev_fwnode;
>
> -	if (dev_fwnode != other_fwnode) {
> -		dev_dbg(sd->dev, "async: compat match not found\n");
> -		return false;
> -	}
> +	fwnode_handle_put(asd_dev_fwnode);
>
> -	/*
> -	 * We have a heterogeneous match. Retrieve the struct device of the side
> -	 * that matched on a device fwnode to print its driver name.
> -	 */
> -	if (sd_fwnode_is_ep)
> -		dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
> -		    : notifier->sd->dev;
> -	else
> -		dev = sd->dev;
> -
> -	if (dev && dev->driver) {
> -		if (sd_fwnode_is_ep)
> -			dev_warn(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
> -				 dev->driver->name);
> -		dev_notice(dev, "Consider updating driver %s to match on endpoints\n",
> -			   dev->driver->name);
> -	}
> -
> -	dev_dbg(sd->dev, "async: compat match found\n");
> +	dev_dbg(sd->dev, "async: device--endpoint match %sfound\n",

double '--'

However now that I think about it, a subdev will be matched agains a
rather large number of async subdevs and most attempts will fail.. do
we want a printout for each of them ?


> +		ret ? "" : "not ");
>
> -	return true;
> +	return ret;
>  }
>
>  static bool match_fwnode(struct v4l2_async_notifier *notifier,
> @@ -804,12 +753,19 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  	int ret;
>
>  	/*
> -	 * No reference taken. The reference is held by the device
> -	 * (struct v4l2_subdev.dev), and async sub-device does not
> -	 * exist independently of the device at any point of time.
> +	 * No reference taken. The reference is held by the device (struct
> +	 * v4l2_subdev.dev), and async sub-device does not exist independently
> +	 * of the device at any point of time.
> +	 *
> +	 * The async sub-device shall always be registered for its device node,
> +	 * not the endpoint node. Issue a warning in that case. Once there is
> +	 * certainty no driver no longer does this, remove the warning (and
> +	 * compatibility code) below.
>  	 */
>  	if (!sd->fwnode && sd->dev)
>  		sd->fwnode = dev_fwnode(sd->dev);
> +	else if (WARN_ON(fwnode_graph_is_endpoint(sd->fwnode)))
> +		sd->fwnode = fwnode_graph_get_port_parent(sd->fwnode);
>
>  	mutex_lock(&list_lock);
>
> --
> 2.30.2
>
