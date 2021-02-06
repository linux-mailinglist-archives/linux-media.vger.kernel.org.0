Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7D4311C1B
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 09:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhBFIQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 03:16:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:53706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229561AbhBFIQh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Feb 2021 03:16:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0116B64FC5;
        Sat,  6 Feb 2021 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612599356;
        bh=jqGCxEeBWunPKAj1T6+j5F/200v/Uy1a5eG/HUmIMdA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BbiAKlWaquYvtG3PZojkSd7Tge7RIJfAPQHD87xH98M0ZOKD2XtlC5zTuZcJFpYZF
         vFxC7aezfjv8Hs4/oBbTKxQpLt+zCVNFECjqnqgWrJFlmh0EJE0sV1j4BOkqBJHmWt
         doNjgXnQNHupmul+TiOLb8dd1hTKUu9Y1i/ct7FOhWD/vFuc1q1u14zVJvKnVUlmHv
         o4mQG929jGf8l0KRUCJAs5063iq9PR40cBhe+IHkzdpIysj5vBOjFgRiNHbE+aj8Oc
         vNgwL0FK9MRflT5xbMOL3ssRSsuS2urd4DjADNuzwsZCSSUzrzeP7vGZxxKZ0nwrJ3
         rtdD38RoPPXFA==
Date:   Sat, 6 Feb 2021 09:15:46 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v5 11/13] media: v4l2-async: Discourage use of
 v4l2_async_notifier_add_subdev
Message-ID: <20210206091546.1497bbcb@coco.lan>
In-Reply-To: <20210202135611.13920-12-sakari.ailus@linux.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
        <20210202135611.13920-12-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue,  2 Feb 2021 15:56:09 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Most -if not all- use-cases are expected to be covered by one of:
> v4l2_async_notifier_add_fwnode_subdev,
> v4l2_async_notifier_add_fwnode_remote_subdev or
> v4l2_async_notifier_add_i2c_subdev.

Actually, all cases outside V4L2 core:

$ git grep v4l2_async_notifier_add_subdev
Documentation/driver-api/media/v4l2-subdev.rst:using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
drivers/media/v4l2-core/v4l2-async.c:int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
drivers/media/v4l2-core/v4l2-async.c:EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
drivers/media/v4l2-core/v4l2-async.c:   ret = v4l2_async_notifier_add_subdev(notifier, asd);
drivers/media/v4l2-core/v4l2-async.c:   ret = v4l2_async_notifier_add_subdev(notifier, asd);
drivers/media/v4l2-core/v4l2-fwnode.c:  ret = v4l2_async_notifier_add_subdev(notifier, asd);
include/media/v4l2-async.h: * before the first call to @v4l2_async_notifier_add_subdev.
include/media/v4l2-async.h: * v4l2_async_notifier_add_subdev - Add an async subdev to the
include/media/v4l2-async.h:int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
include/media/v4l2-async.h: * @v4l2_async_notifier_add_subdev,


> 
> We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
> so rename it as __v4l2_async_notifier_add_subdev. This is
> typically a good hint for drivers to avoid using the function.

IMO, the best here would be to create a header file:

	drivers/media/v4l2-core/v4l2-async-priv.h

and move v4l2_async_notifier_add_subdev from include/media/v4l2-async.h.

This will warrant that only the V4L2 core would have access to it.
Also, it is a lot better than adding something like this:

> + * \warning: Drivers should avoid using this function and instead use one of:
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_fwnode_remote_subdev or
> + * @v4l2_async_notifier_add_i2c_subdev.
> + *


Please submit a followup patch.

-

On a separate but related note, The names of the async notifiers are
too big, causing lots of coding style warnings, like:

+       asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+               &fmd->subdev_notifier, of_fwnode_handle(ep), sizeof(*asd));
...
+                       asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+                               &isp->notifier, ep, sizeof(*isd));

Ending a line with an open parenthesis is not natural: you won't see
any good written English texts (or on any other natural language) that would
have a line ending with a '('.

While I understand that the name describes precisely what those 
functions, such non-intuitive usage of parenthesis makes the line
obfuscated, for no good reason.

Also, the entire meaning of the V4L2 async API is to allow subdevs
to be registered later. So, IMHO, the namespace for those 3
calls could be simplified to:

	v4l2_async_notifier_add_fwnode(),
	v4l2_async_notifier_add_fwnode_remote()
	v4l2_async_notifier_add_i2c().

Also, we should place at least the first argument afer the
parenthesis, even if this would violate the 80 columns
coding style rule[1]. 

So, the above examples would be written as:


        asd = v4l2_async_notifier_add_fwnode_remote(&fmd->subdev_notifier,
						    of_fwnode_handle(ep),
						    sizeof(*asd));

and:

                        asd = v4l2_async_notifier_add_fwnode_remote(&isp->notifier,
								    ep,
								    sizeof(*isd));

Which better matches the Kernel coding style, and it is way easier to
review, as the brain will see the parenthesis just like it would on
a natural language.

[1] The 80 columns warning is a "soft" coding style violation. It serves
as a reference that either the function code is becoming too complex with too
many loops, or that the function names are becoming too big. As it produces
lots of false positives, and people were breaking strings or finishing
lines with open parenthesis, this rule got relaxed, and checkpatch now
warns only (by default) if the line has more than 100 columns.


> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c  | 8 ++++----
>  drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
>  include/media/v4l2-async.h            | 9 +++++++--
>  3 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index ed603ae63cad..d848db962dc7 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -611,7 +611,7 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
>  
> -int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> +int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd)
>  {
>  	int ret;
> @@ -628,7 +628,7 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  	mutex_unlock(&list_lock);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
> +EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
>  
>  struct v4l2_async_subdev *
>  v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> @@ -645,7 +645,7 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
>  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
>  	asd->match.fwnode = fwnode_handle_get(fwnode);
>  
> -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
>  	if (ret) {
>  		fwnode_handle_put(fwnode);
>  		kfree(asd);
> @@ -695,7 +695,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
>  	asd->match.i2c.adapter_id = adapter_id;
>  	asd->match.i2c.address = address;
>  
> -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
>  	if (ret) {
>  		kfree(asd);
>  		return ERR_PTR(ret);
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index c1c2b3060532..63be16c8eb83 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -822,7 +822,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  	if (ret < 0)
>  		goto out_err;
>  
> -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
>  	if (ret < 0) {
>  		/* not an error if asd already exists */
>  		if (ret == -EEXIST)
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 8815e233677e..b113329582ff 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -133,17 +133,22 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
>  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>  
>  /**
> - * v4l2_async_notifier_add_subdev - Add an async subdev to the
> + * __v4l2_async_notifier_add_subdev - Add an async subdev to the
>   *				notifier's master asd list.
>   *
>   * @notifier: pointer to &struct v4l2_async_notifier
>   * @asd: pointer to &struct v4l2_async_subdev
>   *
> + * \warning: Drivers should avoid using this function and instead use one of:
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_fwnode_remote_subdev or
> + * @v4l2_async_notifier_add_i2c_subdev.
> + *

The markups here are violating kernel-doc. Functions should be declared
as:

    * v4l2_async_notifier_add_fwnode_subdev(),
    * v4l2_async_notifier_add_fwnode_remote_subdev() or
    * v4l2_async_notifier_add_i2c_subdev().

Please address it on a followup patch.


>   * Call this function before registering a notifier to link the provided @asd to
>   * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
>   * it will be freed by the framework when the notifier is destroyed.
>   */
> -int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> +int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd);
>  
>  /**



Thanks,
Mauro
