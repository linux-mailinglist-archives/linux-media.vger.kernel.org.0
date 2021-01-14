Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99F92F57D1
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 04:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbhANCHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 21:07:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37834 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730190AbhANCHf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 21:07:35 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD32C279;
        Thu, 14 Jan 2021 03:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610590013;
        bh=JgdIZiLxk9q1B38ti25OWY0D1Lrs2/XMY68L7Uiy4aM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SQ8cDS9fjzdfDc402xw3QMMKh0ezBqyJUFmOu1diFVzhAg73axS76ZcnSLGMKuARK
         UxV37MwriLCjdmyCEDGnMgIBFhMLNMS5oehXNLnGfhKOXgjuiiiOHA31cVd7V3IBST
         Sw4VRc2LlnrkX/9kEyztowd7iim1Zx/kv8r7Sjeo=
Date:   Thu, 14 Jan 2021 04:06:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 03/13] media: renesas-ceu: Use
 v4l2_async_notifier_add_{i2c,fwnode_remote}_subdev helpers
Message-ID: <X/+nKwhIhDY7Z9HW@pendragon.ideasonboard.com>
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

Thank you for the patch.

On Tue, Jan 12, 2021 at 10:23:29AM -0300, Ezequiel Garcia wrote:
> The use of v4l2_async_notifier_add_subdev is discouraged.

It's not yet, that only happens at the end of the series :-)

s/is discouraged/will be discouraged/

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

I may be missing something, but it looks like the subdevs array isn't
allocated anymore. It turned to an array of pointers, but it still need
allocation.

> -	if (!ceudev->subdevs)
> -		return -ENOMEM;
> -
> -	ceudev->sd = NULL;
> -	ceudev->sd_index = 0;
> -	ceudev->num_sd = 0;
> -
> -	return 0;
> -}
> -
>  /*
>   * ceu_parse_platform_data() - Initialize async_subdevices using platform
>   *			       device provided data.
> @@ -1495,6 +1473,7 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
>  				   const struct ceu_platform_data *pdata)
>  {
>  	const struct ceu_async_subdev *async_sd;
> +	struct v4l2_async_subdev *asd;
>  	struct ceu_subdev *ceu_sd;
>  	unsigned int i;
>  	int ret;
> @@ -1502,29 +1481,26 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
>  	if (pdata->num_subdevs == 0)
>  		return -ENODEV;
>  
> -	ret = ceu_init_async_subdevs(ceudev, pdata->num_subdevs);
> -	if (ret)
> -		return ret;
> +	ceudev->sd = NULL;
> +	ceudev->sd_index = 0;
> +	ceudev->num_sd = 0;

ceudev is kzalloc()ed, so I think you could skip this.

>  
>  	for (i = 0; i < pdata->num_subdevs; i++) {
>  
>  		/* Setup the ceu subdevice and the async subdevice. */
>  		async_sd = &pdata->subdevs[i];
> -		ceu_sd = &ceudev->subdevs[i];
> -
> -		INIT_LIST_HEAD(&ceu_sd->asd.list);
> -
> -		ceu_sd->mbus_flags	= async_sd->flags;
> -		ceu_sd->asd.match_type	= V4L2_ASYNC_MATCH_I2C;
> -		ceu_sd->asd.match.i2c.adapter_id = async_sd->i2c_adapter_id;
> -		ceu_sd->asd.match.i2c.address = async_sd->i2c_address;
> -
> -		ret = v4l2_async_notifier_add_subdev(&ceudev->notifier,
> -						     &ceu_sd->asd);
> -		if (ret) {
> +		asd = v4l2_async_notifier_add_i2c_subdev(&ceudev->notifier,
> +				async_sd->i2c_adapter_id,
> +				async_sd->i2c_address,
> +				sizeof(*ceu_sd));
> +		if (IS_ERR(asd)) {
> +			ret = PTR_ERR(asd);
>  			v4l2_async_notifier_cleanup(&ceudev->notifier);
>  			return ret;
>  		}
> +		ceu_sd = to_ceu_subdev(asd);
> +		ceu_sd->mbus_flags = async_sd->flags;
> +		ceudev->subdevs[i] = ceu_sd;
>  	}
>  
>  	return pdata->num_subdevs;
> @@ -1536,7 +1512,8 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
>  static int ceu_parse_dt(struct ceu_device *ceudev)
>  {
>  	struct device_node *of = ceudev->dev->of_node;
> -	struct device_node *ep, *remote;
> +	struct device_node *ep;
> +	struct v4l2_async_subdev *asd;
>  	struct ceu_subdev *ceu_sd;
>  	unsigned int i;
>  	int num_ep;
> @@ -1546,9 +1523,9 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
>  	if (!num_ep)
>  		return -ENODEV;
>  
> -	ret = ceu_init_async_subdevs(ceudev, num_ep);
> -	if (ret)
> -		return ret;
> +	ceudev->sd = NULL;
> +	ceudev->sd_index = 0;
> +	ceudev->num_sd = 0;

Same here, I think this could be skipped.

>  
>  	for (i = 0; i < num_ep; i++) {
>  		struct v4l2_fwnode_endpoint fw_ep = {
> @@ -1578,20 +1555,16 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
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
>  			goto error_cleanup;
>  		}
> +		ceu_sd = to_ceu_subdev(asd);
> +		ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
> +		ceudev->subdevs[i] = ceu_sd;
>  
>  		of_node_put(ep);
>  	}

-- 
Regards,

Laurent Pinchart
