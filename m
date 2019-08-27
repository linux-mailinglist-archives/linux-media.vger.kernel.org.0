Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5839E8DD
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 15:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfH0NQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 09:16:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46752 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfH0NQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 09:16:28 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CBA02F0;
        Tue, 27 Aug 2019 15:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566911786;
        bh=z5PZjhDR12uPaYibMNmabCaz4NixQiQc5Bc+B+IvZEQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H9JYEAaGRzqxrSJTVNaUwykdaO7THI1VVoQG7eS5Toh8XeuUWcK3GYnS61KHGDFVc
         X+IQ/7ugR7ysA8wVbPAquSI62x2orbbwcRoPAqWoCM1M8T93YAGjRIf743nHCAFlgv
         evOnTtawH1eMFCUKuI7R7zF0SGvQQBku+o4DmAas=
Date:   Tue, 27 Aug 2019 16:16:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] media: v4l2-fwnode: Add helper to register
 controls from fw
Message-ID: <20190827131620.GX5054@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-9-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190827092339.8858-9-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2019 at 11:23:34AM +0200, Jacopo Mondi wrote:
> Add the 'v4l2_fwnode_register_controls()' helper to v4l2-fwnode. The
> function parses the device node and endpoint firmware properties to
> which a v4l2 control is associated to and registers the control with the
> provided handler.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 57 +++++++++++++++++++++++++++
>  include/media/v4l2-fwnode.h           | 30 ++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 3bd1888787eb..669801fceb64 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -25,6 +25,7 @@
>  #include <linux/types.h>
>  
>  #include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> @@ -595,6 +596,62 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
>  
> +int v4l2_fwnode_register_controls(struct fwnode_handle *fwnode,
> +				  struct v4l2_ctrl_handler *hdl,
> +				  const struct v4l2_ctrl_ops *ctrl_ops)

Passing the ctrl_ops is a bit annoying. Would there be a way to get the
V4L2 control framework to accept NULL ops for read-only controls ?

> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "location", &val);
> +	if (!ret) {
> +		switch (val) {
> +		case V4L2_LOCATION_FRONT:
> +		case V4L2_LOCATION_BACK:
> +		case V4L2_LOCATION_EXTERNAL:
> +			break;
> +		default:
> +			pr_warn("Unsupported location: %u\n", val);

dev_warn() would be nicer. Is there a way we could either pass the
struct device pointer, or maybe a subdev that would be populated with
the device, fwnode and hdl pointers ?

> +			return -EINVAL;
> +		}
> +
> +		if (v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_LOCATION))
> +			pr_debug("Skip control '%s': already registered",
> +				 v4l2_ctrl_get_name(
> +					 V4L2_CID_CAMERA_SENSOR_LOCATION));
> +		else
> +			v4l2_ctrl_new_std(hdl, ctrl_ops,
> +					  V4L2_CID_CAMERA_SENSOR_LOCATION,
> +					  val, val, 1, val);
> +	}
> +
> +	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> +	if (!ret) {
> +		if (val > 360) {
> +			pr_warn("Unsupported rotation: %u\n", val);
> +			return -EINVAL;
> +		}

We need to define the range of allowed values in the control
documentation. 360 doesn't seem very useful as it's equivalent to 0.
A few possible options are [0, 360[, [-180, +180[ or ]-180, +180].

> +
> +		if (v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_ROTATION))
> +			pr_debug("Skip control '%s': already registered",
> +				 v4l2_ctrl_get_name(
> +					 V4L2_CID_CAMERA_SENSOR_ROTATION));
> +		else
> +			v4l2_ctrl_new_std(hdl, ctrl_ops,
> +					  V4L2_CID_CAMERA_SENSOR_ROTATION,
> +					  val, val, 1, val);
> +	}
> +
> +	if (hdl->error) {
> +		pr_warn("Failed to register controls from firmware: %d\n",
> +			hdl->error);
> +		return hdl->error;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fwnode_register_controls);
> +
>  static int
>  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  					  struct v4l2_async_notifier *notifier,
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index f6a7bcd13197..0dad6968bde9 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -25,6 +25,8 @@
>  struct fwnode_handle;
>  struct v4l2_async_notifier;
>  struct v4l2_async_subdev;
> +struct v4l2_ctrl_handler;
> +struct v4l2_ctrl_ops;
>  
>  #define V4L2_FWNODE_CSI2_MAX_DATA_LANES	4
>  
> @@ -233,6 +235,34 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
>   */
>  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
>  
> +/**
> + * v4l2_fwnode_register_controls() - parse device and endpoint fwnode
> + *				     properties and register a v4l2 control
> + *				     for each of them

I don't think that description is accurate.

> + * @fwnode: pointer to the device fwnode handle
> + * @hdl: pointer to the v4l2 control handler to register controls with
> + * @ctrl_ops: pointer to the v4l2 control operations to register with the handler
> + *
> + * Parse the @fwnode device and endpoint properties to which a v4l2 control
> + * is associated and register them with the provided handler @hdl.
> + * Currently the following v4l2 controls are parsed and registered:
> + * - V4L2_CID_CAMERA_SENSOR_LOCATION;
> + * - V4L2_CID_CAMERA_SENSOR_ROTATION;
> + *
> + * Controls already registered by the caller with the @hdl control handler are
> + * not overwritten. Callers should register the controls they want to handle
> + * themselves before calling this function.
> + *
> + * NOTE: This function locks the @hdl control handler mutex, the caller shall
> + * not hold the lock when calling this function.
> + *
> + * Return: 0 on success, -EINVAL if the fwnode properties are not correctly
> + * specified.
> + */
> +int v4l2_fwnode_register_controls(struct fwnode_handle *fwnode,
> +				  struct v4l2_ctrl_handler *hdl,
> +				  const struct v4l2_ctrl_ops *ctrl_ops);
> +
>  /**
>   * typedef parse_endpoint_func - Driver's callback function to be called on
>   *	each V4L2 fwnode endpoint.

-- 
Regards,

Laurent Pinchart
