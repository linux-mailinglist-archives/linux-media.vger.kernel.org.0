Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DDB2F8E6B
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 18:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbhAPRom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 12:44:42 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:57838 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbhAPRol (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 12:44:41 -0500
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9E1663A4623
        for <linux-media@vger.kernel.org>; Sat, 16 Jan 2021 15:57:31 +0000 (UTC)
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B21C51C000B;
        Sat, 16 Jan 2021 15:56:28 +0000 (UTC)
Date:   Sat, 16 Jan 2021 16:56:47 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 03/13] media: renesas-ceu: Use
 v4l2_async_notifier_add_{i2c,fwnode_remote}_subdev helpers
Message-ID: <20210116155647.kjmsv2zch2dmqgfk@uno.localdomain>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-4-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112132339.5621-4-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, Jan 12, 2021 at 10:23:29AM -0300, Ezequiel Garcia wrote:
> The use of v4l2_async_notifier_add_subdev is discouraged.
> Drivers are instead encouraged to use a helper such as
> v4l2_async_notifier_add_i2c_subdev.
>
> This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> should get a kmalloc'ed struct v4l2_async_subdev,
> removing some boilerplate code while at it.
>
> Use the appropriate helper: v4l2_async_notifier_add_i2c_subdev
> or v4l2_async_notifier_add_fwnode_remote_subdev, which handles
> the needed setup, instead of open-coding it.
>
> Using v4l2-async to allocate the driver-specific structs,
> requires to change struct ceu_subdev so the embedded
> struct v4l2_async_subdev is now the first element.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/renesas-ceu.c | 89 ++++++++++------------------
>  1 file changed, 31 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index 4a633ad0e8fa..18485812a21e 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -152,8 +152,8 @@ static inline struct ceu_buffer *vb2_to_ceu(struct vb2_v4l2_buffer *vbuf)
>   * ceu_subdev - Wraps v4l2 sub-device and provides async subdevice.
>   */
>  struct ceu_subdev {
> -	struct v4l2_subdev *v4l2_sd;
>  	struct v4l2_async_subdev asd;
> +	struct v4l2_subdev *v4l2_sd;
>
>  	/* per-subdevice mbus configuration options */
>  	unsigned int mbus_flags;
> @@ -174,7 +174,7 @@ struct ceu_device {
>  	struct v4l2_device	v4l2_dev;
>
>  	/* subdevices descriptors */
> -	struct ceu_subdev	*subdevs;
> +	struct ceu_subdev	**subdevs;
>  	/* the subdevice currently in use */
>  	struct ceu_subdev	*sd;
>  	unsigned int		sd_index;
> @@ -1195,7 +1195,7 @@ static int ceu_enum_input(struct file *file, void *priv,
>  	if (inp->index >= ceudev->num_sd)
>  		return -EINVAL;
>
> -	ceusd = &ceudev->subdevs[inp->index];
> +	ceusd = ceudev->subdevs[inp->index];
>
>  	inp->type = V4L2_INPUT_TYPE_CAMERA;
>  	inp->std = 0;
> @@ -1230,7 +1230,7 @@ static int ceu_s_input(struct file *file, void *priv, unsigned int i)
>  		return 0;
>
>  	ceu_sd_old = ceudev->sd;
> -	ceudev->sd = &ceudev->subdevs[i];
> +	ceudev->sd = ceudev->subdevs[i];
>
>  	/*
>  	 * Make sure we can generate output image formats and apply
> @@ -1423,7 +1423,7 @@ static int ceu_notify_complete(struct v4l2_async_notifier *notifier)
>  	 * ceu formats.
>  	 */
>  	if (!ceudev->sd) {
> -		ceudev->sd = &ceudev->subdevs[0];
> +		ceudev->sd = ceudev->subdevs[0];
>  		ceudev->sd_index = 0;
>  	}
>
> @@ -1465,28 +1465,6 @@ static const struct v4l2_async_notifier_operations ceu_notify_ops = {
>  	.complete	= ceu_notify_complete,
>  };
>
> -/*
> - * ceu_init_async_subdevs() - Initialize CEU subdevices and async_subdevs in
> - *			      ceu device. Both DT and platform data parsing use
> - *			      this routine.
> - *
> - * Returns 0 for success, -ENOMEM for failure.
> - */
> -static int ceu_init_async_subdevs(struct ceu_device *ceudev, unsigned int n_sd)
> -{
> -	/* Reserve memory for 'n_sd' ceu_subdev descriptors. */
> -	ceudev->subdevs = devm_kcalloc(ceudev->dev, n_sd,
> -				       sizeof(*ceudev->subdevs), GFP_KERNEL);
> -	if (!ceudev->subdevs)
> -		return -ENOMEM;
> -
> -	ceudev->sd = NULL;
> -	ceudev->sd_index = 0;
> -	ceudev->num_sd = 0;
> -

As Laurent the array of subdevs still needs to be allocated, and the
zeroing of the ceudev fields could be removed. If you don't want to
mix too many things I can do it on top as..

> -	return 0;
> -}
> -

[snip]

>  		}
>
>  		/* Setup the ceu subdevice and the async subdevice. */
> -		ceu_sd = &ceudev->subdevs[i];
> -		INIT_LIST_HEAD(&ceu_sd->asd.list);
> -
> -		remote = of_graph_get_remote_port_parent(ep);
> -		ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
> -		ceu_sd->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -		ceu_sd->asd.match.fwnode = of_fwnode_handle(remote);
> -
> -		ret = v4l2_async_notifier_add_subdev(&ceudev->notifier,
> -						     &ceu_sd->asd);
> -		if (ret) {
> -			of_node_put(remote);
> +		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> +				&ceudev->notifier, of_fwnode_handle(ep),
> +				sizeof(*ceu_sd));
> +		if (IS_ERR(asd)) {
> +			ret = PTR_ERR(asd);

This could also probably be moved before the endpoint parsing to
avoid that if the async subdev registration fails.

All on top though and not major.
With the subdev allocation fixed
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>  			goto error_cleanup;
>  		}
> +		ceu_sd = to_ceu_subdev(asd);
> +		ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
> +		ceudev->subdevs[i] = ceu_sd;
>
>  		of_node_put(ep);
>  	}
> --
> 2.29.2
>
