Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A68416ED993
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 03:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbjDYBHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 21:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbjDYBHM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 21:07:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03F9C145
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 18:06:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 806DC75B;
        Tue, 25 Apr 2023 03:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682384792;
        bh=gtuEPY8+05hCs15zQViq15CTwGwjmDG9AHAUmGP7zi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FPUB1+Vwq1NgKX5XoX5iJSsHck7snigYV9ZzfCNEdmHoBqEOj7V8VqyvUZIWkOAxR
         51ydZeNhvm5G579UuDv0s6waHq4/2ZZSEAY+0WdgvTUHgQKNrd0xdxpu3Z+KmTyHmk
         GCHw+WVUf8JR4wsG4VCHtG33VLDuZuXzHXCpLGUE=
Date:   Tue, 25 Apr 2023 04:06:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 19/18] media: v4l: Drop
 v4l2_async_nf_parse_fwnode_endpoints()
Message-ID: <20230425010654.GG4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230414091437.83449-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230414091437.83449-1-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Apr 14, 2023 at 11:14:37AM +0200, Jacopo Mondi wrote:
> The v4l2_async_nf_parse_fwnode_endpoints() function, part of
> v4l2-fwnode.c, was an helper meant to register one async sub-dev

s/an helper/a helper/

> for each fwnode endpoint of a device.
> 
> The function is marked as deprecated in the documentation and is
> actually not used anywhere anymore. Drop it and remove the helper
> function v4l2_async_nf_fwnode_parse_endpoint() from v4l2-fwnode.c.
> 
> This change allows to make the helper function
> __v4l2_async_nf_add_connection() visibility private to v4l2-async.c so
> that there is no risk drivers can mistakenly use it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c  |  1 -
>  drivers/media/v4l2-core/v4l2-fwnode.c | 97 ---------------------------
>  include/media/v4l2-async.h            | 25 -------
>  include/media/v4l2-fwnode.h           | 65 ------------------
>  4 files changed, 188 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index c9874b3f411e..e4cd70da4814 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -782,7 +782,6 @@ int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
>  	mutex_unlock(&list_lock);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_connection);
>  
>  struct v4l2_async_connection *
>  __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 7f4fb6208b1f..a84af48ed4e3 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -798,103 +798,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
>  
> -static int
> -v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
> -				    struct v4l2_async_notifier *notifier,
> -				    struct fwnode_handle *endpoint,
> -				    unsigned int asd_struct_size,
> -				    parse_endpoint_func parse_endpoint)
> -{
> -	struct v4l2_fwnode_endpoint vep = { .bus_type = 0 };
> -	struct v4l2_async_connection *asd;
> -	int ret;
> -
> -	asd = kzalloc(asd_struct_size, GFP_KERNEL);
> -	if (!asd)
> -		return -ENOMEM;
> -
> -	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
> -	asd->match.fwnode =
> -		fwnode_graph_get_remote_port_parent(endpoint);
> -	if (!asd->match.fwnode) {
> -		dev_dbg(dev, "no remote endpoint found\n");
> -		ret = -ENOTCONN;
> -		goto out_err;
> -	}
> -
> -	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &vep);
> -	if (ret) {
> -		dev_warn(dev, "unable to parse V4L2 fwnode endpoint (%d)\n",
> -			 ret);
> -		goto out_err;
> -	}
> -
> -	ret = parse_endpoint ? parse_endpoint(dev, &vep, asd) : 0;
> -	if (ret == -ENOTCONN)
> -		dev_dbg(dev, "ignoring port@%u/endpoint@%u\n", vep.base.port,
> -			vep.base.id);
> -	else if (ret < 0)
> -		dev_warn(dev,
> -			 "driver could not parse port@%u/endpoint@%u (%d)\n",
> -			 vep.base.port, vep.base.id, ret);
> -	v4l2_fwnode_endpoint_free(&vep);
> -	if (ret < 0)
> -		goto out_err;
> -
> -	ret = __v4l2_async_nf_add_connection(notifier, asd);
> -	if (ret < 0) {
> -		/* not an error if asd already exists */
> -		if (ret == -EEXIST)
> -			ret = 0;
> -		goto out_err;
> -	}
> -
> -	return 0;
> -
> -out_err:
> -	fwnode_handle_put(asd->match.fwnode);
> -	kfree(asd);
> -
> -	return ret == -ENOTCONN ? 0 : ret;
> -}
> -
> -int
> -v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
> -				     struct v4l2_async_notifier *notifier,
> -				     size_t asd_struct_size,
> -				     parse_endpoint_func parse_endpoint)
> -{
> -	struct fwnode_handle *fwnode;
> -	int ret = 0;
> -
> -	if (WARN_ON(asd_struct_size < sizeof(struct v4l2_async_connection)))
> -		return -EINVAL;
> -
> -	fwnode_graph_for_each_endpoint(dev_fwnode(dev), fwnode) {
> -		struct fwnode_handle *dev_fwnode;
> -		bool is_available;
> -
> -		dev_fwnode = fwnode_graph_get_port_parent(fwnode);
> -		is_available = fwnode_device_is_available(dev_fwnode);
> -		fwnode_handle_put(dev_fwnode);
> -		if (!is_available)
> -			continue;
> -
> -
> -		ret = v4l2_async_nf_fwnode_parse_endpoint(dev, notifier,
> -							  fwnode,
> -							  asd_struct_size,
> -							  parse_endpoint);
> -		if (ret < 0)
> -			break;
> -	}
> -
> -	fwnode_handle_put(fwnode);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(v4l2_async_nf_parse_fwnode_endpoints);
> -
>  /*
>   * v4l2_fwnode_reference_parse - parse references for async sub-devices
>   * @dev: the device node the properties of which are parsed for references
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index cf2082e17fc4..44080543e1b9 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -167,8 +167,6 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
>   * v4l2_async_nf_add_fwnode_remote(),
>   * v4l2_async_nf_add_fwnode(),
>   * v4l2_async_nf_add_i2c(),

s/,/./

> - * __v4l2_async_nf_add_connection() or
> - * v4l2_async_nf_parse_fwnode_endpoints().
>   */
>  void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
>  			struct v4l2_async_notifier *notifier);
> @@ -184,31 +182,10 @@ void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
>   * v4l2_async_nf_add_fwnode_remote(),
>   * v4l2_async_nf_add_fwnode(),
>   * v4l2_async_nf_add_i2c(),

s/,/./

> - * __v4l2_async_nf_add_connection() or
> - * v4l2_async_nf_parse_fwnode_endpoints().
>   */
>  void v4l2_async_subdev_nf_init(struct v4l2_subdev *sd,
>  			       struct v4l2_async_notifier *notifier);
>  
> -/**
> - * __v4l2_async_nf_add_connection() - Add an async subdev to the notifier's
> - *				      master asc list.
> - *
> - * @notifier: pointer to &struct v4l2_async_notifier
> - * @asc: pointer to &struct v4l2_async_connection
> - *
> - * \warning: Drivers should avoid using this function and instead use one of:
> - * v4l2_async_nf_add_fwnode(),
> - * v4l2_async_nf_add_fwnode_remote() or
> - * v4l2_async_nf_add_i2c().
> - *
> - * Call this function before registering a notifier to link the provided @asc to
> - * the notifiers master @asc_list. The @asc must be allocated with k*alloc() as
> - * it will be freed by the framework when the notifier is destroyed.
> - */

You could move this documentation to the .c file (dropping the warning).
There's little documentation of internal function for v4l2-async, which
makes the code hard to understand. Let's not make it worse by dropping
existing documentation :-)

> -int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
> -				   struct v4l2_async_connection *asc);
> -
>  struct v4l2_async_connection *
>  __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
>  			   struct fwnode_handle *fwnode,
> @@ -306,8 +283,6 @@ void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier);
>   * v4l2_async_nf_add_fwnode_remote(),
>   * v4l2_async_nf_add_fwnode(),
>   * v4l2_async_nf_add_i2c(),

s/,/./

> - * __v4l2_async_nf_add_connection() or
> - * v4l2_async_nf_parse_fwnode_endpoints().
>   *
>   * There is no harm from calling v4l2_async_nf_cleanup() in other
>   * cases as long as its memory has been zeroed after it has been
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index ebb83154abd5..f84fa73f041c 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -393,71 +393,6 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
>  int v4l2_fwnode_device_parse(struct device *dev,
>  			     struct v4l2_fwnode_device_properties *props);
>  
> -/**
> - * typedef parse_endpoint_func - Driver's callback function to be called on
> - *	each V4L2 fwnode endpoint.
> - *
> - * @dev: pointer to &struct device
> - * @vep: pointer to &struct v4l2_fwnode_endpoint
> - * @asd: pointer to &struct v4l2_async_connection
> - *
> - * Return:
> - * * %0 on success
> - * * %-ENOTCONN if the endpoint is to be skipped but this
> - *   should not be considered as an error
> - * * %-EINVAL if the endpoint configuration is invalid
> - */
> -typedef int (*parse_endpoint_func)(struct device *dev,
> -				  struct v4l2_fwnode_endpoint *vep,
> -				  struct v4l2_async_connection *asd);
> -
> -/**
> - * v4l2_async_nf_parse_fwnode_endpoints - Parse V4L2 fwnode endpoints in a
> - *						device node
> - * @dev: the device the endpoints of which are to be parsed
> - * @notifier: notifier for @dev
> - * @asd_struct_size: size of the driver's async sub-device struct, including
> - *		     sizeof(struct v4l2_async_connection). The &struct
> - *		     v4l2_async_connection shall be the first member of
> - *		     the driver's async sub-device struct, i.e. both
> - *		     begin at the same memory address.
> - * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
> - *		    endpoint. Optional.
> - *
> - * DEPRECATED! This function is deprecated. Don't use it in new drivers.
> - * Instead see an example in cio2_parse_firmware() function in
> - * drivers/media/pci/intel/ipu3/ipu3-cio2.c .
> - *
> - * Parse the fwnode endpoints of the @dev device and populate the async sub-
> - * devices list in the notifier. The @parse_endpoint callback function is
> - * called for each endpoint with the corresponding async sub-device pointer to
> - * let the caller initialize the driver-specific part of the async sub-device
> - * structure.
> - *
> - * The notifier memory shall be zeroed before this function is called on the
> - * notifier.
> - *
> - * This function may not be called on a registered notifier and may be called on
> - * a notifier only once.
> - *
> - * The &struct v4l2_fwnode_endpoint passed to the callback function
> - * @parse_endpoint is released once the function is finished. If there is a need
> - * to retain that configuration, the user needs to allocate memory for it.
> - *
> - * Any notifier populated using this function must be released with a call to
> - * v4l2_async_nf_cleanup() after it has been unregistered and the async
> - * sub-devices are no longer in use, even if the function returned an error.
> - *
> - * Return: %0 on success, including when no async sub-devices are found
> - *	   %-ENOMEM if memory allocation failed
> - *	   %-EINVAL if graph or endpoint parsing failed
> - *	   Other error codes as returned by @parse_endpoint
> - */
> -int
> -v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
> -				     struct v4l2_async_notifier *notifier,
> -				     size_t asd_struct_size,
> -				     parse_endpoint_func parse_endpoint);
>  
>  /* Helper macros to access the connector links. */
>  

-- 
Regards,

Laurent Pinchart
