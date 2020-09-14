Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1CE268B87
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 14:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgINM4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 08:56:18 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:43219 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgINMv4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 08:51:56 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0C83D24000C;
        Mon, 14 Sep 2020 12:51:35 +0000 (UTC)
Date:   Mon, 14 Sep 2020 14:55:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH 5/5] media: i2c: max9286: Allocate v4l2_async_subdev
 dynamically
Message-ID: <20200914125526.kukq5pir7jgamekv@uno.localdomain>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200811205939.19550-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200811205939.19550-6-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Aug 11, 2020 at 11:59:39PM +0300, Laurent Pinchart wrote:
> v4l2_async_notifier_add_subdev() requires the asd to be allocated
> dynamically, but the max9286 driver embeds it in the max9286_source
> structure. This causes memory corruption when the notifier is destroyed
> at remove time with v4l2_async_notifier_cleanup().
>
> Fix this issue by registering the asd with
> v4l2_async_notifier_add_fwnode_subdev(), which allocates it dynamically
> internally. A new max9286_asd structure is introduced, to store a
> pointer to the corresonding max9286_source that needs to be accessed
> from bound and unbind callbacks. There's no need to take an extra
> explicit reference to the fwnode anymore as
> v4l2_async_notifier_add_fwnode_subdev() does so internally.
>
> While at it, use %u instead of %d to print the unsigned index in the
> error message from the v4l2_async_notifier_add_fwnode_subdev() error
> path.
>
> Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 38 +++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 47f280518fdb..5d890dddb376 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -135,13 +135,19 @@
>  #define MAX9286_SRC_PAD			4
>
>  struct max9286_source {
> -	struct v4l2_async_subdev asd;
>  	struct v4l2_subdev *sd;
>  	struct fwnode_handle *fwnode;
>  };
>
> -#define asd_to_max9286_source(_asd) \
> -	container_of(_asd, struct max9286_source, asd)
> +struct max9286_asd {
> +	struct v4l2_async_subdev base;
> +	struct max9286_source *source;
> +};
> +
> +static inline struct max9286_asd *to_max9286_asd(struct v4l2_async_subdev *asd)
> +{
> +	return container_of(asd, struct max9286_asd, base);
> +}
>
>  struct max9286_priv {
>  	struct i2c_client *client;
> @@ -480,7 +486,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
>  				struct v4l2_async_subdev *asd)
>  {
>  	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
> -	struct max9286_source *source = asd_to_max9286_source(asd);
> +	struct max9286_source *source = to_max9286_asd(asd)->source;
>  	unsigned int index = to_index(priv, source);
>  	unsigned int src_pad;
>  	int ret;
> @@ -544,7 +550,7 @@ static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
>  				  struct v4l2_async_subdev *asd)
>  {
>  	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
> -	struct max9286_source *source = asd_to_max9286_source(asd);
> +	struct max9286_source *source = to_max9286_asd(asd)->source;
>  	unsigned int index = to_index(priv, source);
>
>  	source->sd = NULL;
> @@ -569,23 +575,19 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>
>  	for_each_source(priv, source) {
>  		unsigned int i = to_index(priv, source);
> +		struct v4l2_async_subdev *asd;
>
> -		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -		source->asd.match.fwnode = source->fwnode;
> -
> -		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
> -						     &source->asd);
> -		if (ret) {
> -			dev_err(dev, "Failed to add subdev for source %d", i);
> +		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
> +							    source->fwnode,
> +							    sizeof(*asd));

This should be sizeof(struct max9286_asd), but suprisingly, it doesn't
fail at runtime :)

I'll send a patch for this in the meantime.

Thanks
  j

> +		if (IS_ERR(asd)) {
> +			dev_err(dev, "Failed to add subdev for source %u: %ld",
> +				i, PTR_ERR(asd));
>  			v4l2_async_notifier_cleanup(&priv->notifier);
> -			return ret;
> +			return PTR_ERR(asd);
>  		}
>
> -		/*
> -		 * Balance the reference counting handled through
> -		 * v4l2_async_notifier_cleanup()
> -		 */
> -		fwnode_handle_get(source->fwnode);
> +		to_max9286_asd(asd)->source = source;
>  	}
>
>  	priv->notifier.ops = &max9286_notify_ops;
> --
> Regards,
>
> Laurent Pinchart
>
