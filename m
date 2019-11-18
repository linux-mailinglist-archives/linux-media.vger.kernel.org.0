Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E1A1005F3
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 13:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfKRMyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 07:54:39 -0500
Received: from mga17.intel.com ([192.55.52.151]:27375 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbfKRMyj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 07:54:39 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 04:54:38 -0800
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; 
   d="scan'208";a="231155977"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 04:54:37 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5620E20731; Mon, 18 Nov 2019 14:54:35 +0200 (EET)
Date:   Mon, 18 Nov 2019 14:54:35 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 09/11] media: v4l2-ctrls: Add helper to register
 properties
Message-ID: <20191118125435.GF5391@paasikivi.fi.intel.com>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
 <20191108155944.1040883-10-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108155944.1040883-10-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Nov 08, 2019 at 04:59:42PM +0100, Jacopo Mondi wrote:
> Add an helper function to v4l2-ctrls to register controls associated
> with a device property.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 40 ++++++++++++++++++++++++++++
>  include/media/v4l2-ctrls.h           | 26 ++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 97e97c8069c9..ac1934558969 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -16,6 +16,7 @@
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
>  #include <media/v4l2-ioctl.h>
>  
>  #define dprintk(vdev, fmt, arg...) do {					\
> @@ -4587,3 +4588,42 @@ __poll_t v4l2_ctrl_poll(struct file *file, struct poll_table_struct *wait)
>  	return 0;
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_poll);
> +
> +int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
> +				    const struct v4l2_ctrl_ops *ctrl_ops,
> +				    const struct v4l2_fwnode_device_properties *p)
> +{
> +	if (p->location != V4L2_FWNODE_PROPERTY_UNSET) {
> +		u32 location_ctrl;
> +
> +		switch (p->location) {
> +		case V4L2_FWNODE_LOCATION_FRONT:
> +			location_ctrl = V4L2_LOCATION_FRONT;
> +			break;
> +		case V4L2_FWNODE_LOCATION_BACK:
> +			location_ctrl = V4L2_LOCATION_BACK;
> +			break;
> +		case V4L2_FWNODE_LOCATION_EXTERNAL:
> +			location_ctrl = V4L2_LOCATION_EXTERNAL;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		if (!v4l2_ctrl_new_std(hdl, ctrl_ops,
> +				       V4L2_CID_CAMERA_SENSOR_LOCATION,
> +				       location_ctrl, location_ctrl, 1,
> +				       location_ctrl))
> +			return hdl->error;
> +	}
> +
> +	if (p->rotation != V4L2_FWNODE_PROPERTY_UNSET) {
> +		if (!v4l2_ctrl_new_std(hdl, ctrl_ops,
> +				       V4L2_CID_CAMERA_SENSOR_ROTATION,
> +				       p->rotation, p->rotation, 1,
> +				       p->rotation))
> +			return hdl->error;
> +	}
> +
> +	return 0;

I think you should return hdl->error also here: calling this function on a
failed control handler should result in an error.

> +}
> +EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index cf59abafb0d9..409c800ab1f5 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -30,6 +30,7 @@ struct v4l2_ctrl;
>  struct v4l2_ctrl_handler;
>  struct v4l2_ctrl_helper;
>  struct v4l2_fh;
> +struct v4l2_fwnode_device_properties;
>  struct v4l2_subdev;
>  struct v4l2_subscribed_event;
>  struct video_device;
> @@ -1417,4 +1418,29 @@ int v4l2_ctrl_subdev_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
>   */
>  int v4l2_ctrl_subdev_log_status(struct v4l2_subdev *sd);
>  
> +/**
> + * v4l2_ctrl_new_fwnode_properties() - Register controls for the device
> + *				       properties
> + *
> + * @hdl: pointer to &struct v4l2_ctrl_handler to register controls on
> + * @ctrl_ops: pointer to &struct v4l2_ctrl_ops to register controls with
> + * @p: pointer to &struct v4l2_fwnode_device_properties
> + *
> + * This function registers controls associated to device properties, using the
> + * property values contained in @p parameter, if the property has been set to
> + * a value.
> + *
> + * Currently the following v4l2 controls are parsed and registered:
> + * - V4L2_CID_CAMERA_SENSOR_LOCATION;
> + * - V4L2_CID_CAMERA_SENSOR_ROTATION;
> + *
> + * Controls already registered by the caller with the @hdl control handler are
> + * not overwritten. Callers should register the controls they want to handle
> + * themselves before calling this function.
> + *
> + * Return: 0 on success, a negative error code on failure.
> + */
> +int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
> +				    const struct v4l2_ctrl_ops *ctrl_ops,
> +				    const struct v4l2_fwnode_device_properties *p);
>  #endif

-- 
Regards,

Sakari Ailus
