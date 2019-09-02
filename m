Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1F6A533F
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 11:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbfIBJrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 05:47:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59154 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729831AbfIBJrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 05:47:00 -0400
Received: from pendragon.ideasonboard.com (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2B6D303;
        Mon,  2 Sep 2019 11:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567417617;
        bh=xgPkCvAqveURzwoQQHqUp/T0MAnkDpmgStDPY8iB70w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gjMsNumWOcF38lMybMWR9bNWcZyUaQ21NIHGHjnSYHGRgjfJrKU5SgplNvo+VAelY
         UIjkqBwEGJQrOnFdiimE008hDdtMIVkmgNWr4gwn2KeddIyQrG7CqgTogaimjZ/F5g
         MLZlyyHaNdw/6D6wdg/e8NVgOdmW5SIBA9p9M/b8=
Date:   Mon, 2 Sep 2019 12:46:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] media: v4l2-fwnode: Add helper to register
 controls from fw
Message-ID: <20190902094651.GA9963@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-9-jacopo@jmondi.org>
 <f4e57a0c-08e5-c52c-bd52-7bf7e8f54c30@xs4all.nl>
 <20190829124516.3fbvxcrligtbiy7d@uno.localdomain>
 <54707d6c-fb8e-c10c-e48a-c0ae72075190@xs4all.nl>
 <20190829150548.GF5875@pendragon.ideasonboard.com>
 <6bd504eb-d56c-f07d-8daa-363b1618a1bd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6bd504eb-d56c-f07d-8daa-363b1618a1bd@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Aug 29, 2019 at 05:32:52PM +0200, Hans Verkuil wrote:
> On 8/29/19 5:05 PM, Laurent Pinchart wrote:
> > On Thu, Aug 29, 2019 at 03:04:42PM +0200, Hans Verkuil wrote:
> >> On 8/29/19 2:45 PM, Jacopo Mondi wrote:
> >>> On Thu, Aug 29, 2019 at 12:31:37PM +0200, Hans Verkuil wrote:
> >>>> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
> >>>>> Add the 'v4l2_fwnode_register_controls()' helper to v4l2-fwnode. The
> >>>>> function parses the device node and endpoint firmware properties to
> >>>>> which a v4l2 control is associated to and registers the control with the
> >>>>> provided handler.
> >>>>>
> >>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>> ---
> >>>>>  drivers/media/v4l2-core/v4l2-fwnode.c | 57 +++++++++++++++++++++++++++
> >>>>>  include/media/v4l2-fwnode.h           | 30 ++++++++++++++
> >>>>>  2 files changed, 87 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> >>>>> index 3bd1888787eb..669801fceb64 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> >>>>> @@ -25,6 +25,7 @@
> >>>>>  #include <linux/types.h>
> >>>>>
> >>>>>  #include <media/v4l2-async.h>
> >>>>> +#include <media/v4l2-ctrls.h>
> >>>>>  #include <media/v4l2-fwnode.h>
> >>>>>  #include <media/v4l2-subdev.h>
> >>>>>
> >>>>> @@ -595,6 +596,62 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> >>>>>  }
> >>>>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> >>>>>
> >>>>> +int v4l2_fwnode_register_controls(struct fwnode_handle *fwnode,
> >>>>> +				  struct v4l2_ctrl_handler *hdl,
> >>>>> +				  const struct v4l2_ctrl_ops *ctrl_ops)
> >>>>
> >>>> I'm not convinced that this helper is a good idea.
> >>>>
> >>>> A helper that parses and validates this information makes sense,
> >>>> but combining that with creating the controls feels wrong to me.
> >>>>
> >>>> You're mixing two very different things in one function.
> >>>>
> >>>> I think something like this would work better in a driver:
> >>>>
> >>>> 	if (!v4l2_fwnode_parse_location(&val))
> >>>> 		v4l2_ctrl_new_std(hdl, ctrl_ops,
> >>>> 				  V4L2_CID_CAMERA_SENSOR_LOCATION,
> >>>> 				  val, val, 1, val);
> >>>> 	if (!v4l2_fwnode_parse_rotation(&val))
> >>>> 		v4l2_ctrl_new_std(hdl, ctrl_ops,
> >>>> 				  V4L2_CID_CAMERA_SENSOR_ROTATION,
> >>>> 				  val, val, 1, val);
> >>>>
> >>>> Much cleaner IMHO. (Just a brainstorm, so don't get stuck on these
> >>>> function prototypes!)
> >>>>
> >>>
> >>> Could the control registration being conditional on the presence of
> >>> the *hdl parameter otherwise, or would you split the two operations
> >>> (property parsing and control registration) nonetheless ?
> >>
> >> Split it. My main problem with this helper is that it is mixing two
> >> frameworks. Most of Laurent's comments on this patch just go away if
> >> you leave the control creation to the driver.
> >>
> >> It really isn't much code, and it is much easier to review a driver
> >> if all the controls are created in the same place instead of some
> >> controls being magically created in a helper function.
> > 
> > But this would require copying the above code in every single camera
> > sensor driver. Furthermore, the helper proposed by Jacopo would make
> > addition of new firmware properties much simpler, as we wouldn't need to
> > modify all sensor drivers.
> > 
> > V4L2 requires lots of boilerplate code for sensor drivers, and I think
> > more helper would be useful. There's really not point in doing the same
> > thing slightly differently in dozens of drivers. Maybe we could
> > experiment with a v4l2_camera_subdev structure ?
> 
> You can make one v4l2_fwnode helper that parses all the sensor properties,
> and another helper in v4l2-ctrl.c or v4l2-common.c that uses the parsed
> result to create the controls. That way if the driver needs to do something
> unusual with the controls it can just create them manually.

Looks good to me.

> But don't mix the two in one helper.
> 
> Note that creating some more advanced framework for sensors wouldn't hurt
> since it's a bit mess at the moment IMHO.

It's a bit too much as a prerequisite for this patch series, but I'd
like to see this happening sooner than later, yes.

> >>> An helper was suggested in the v1 review, Laurent, Sakari, what do you
> >>> think here?
> >>>
> >>>>> +{
> >>>>> +	u32 val;
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	ret = fwnode_property_read_u32(fwnode, "location", &val);
> >>>>> +	if (!ret) {
> >>>>> +		switch (val) {
> >>>>> +		case V4L2_LOCATION_FRONT:
> >>>>> +		case V4L2_LOCATION_BACK:
> >>>>> +		case V4L2_LOCATION_EXTERNAL:
> >>>>> +			break;
> >>>>> +		default:
> >>>>> +			pr_warn("Unsupported location: %u\n", val);
> >>>>> +			return -EINVAL;
> >>>>> +		}
> >>>>> +
> >>>>> +		if (v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_LOCATION))
> >>>>> +			pr_debug("Skip control '%s': already registered",
> >>>>> +				 v4l2_ctrl_get_name(
> >>>>> +					 V4L2_CID_CAMERA_SENSOR_LOCATION));
> >>>>> +		else
> >>>>> +			v4l2_ctrl_new_std(hdl, ctrl_ops,
> >>>>> +					  V4L2_CID_CAMERA_SENSOR_LOCATION,
> >>>>> +					  val, val, 1, val);
> >>>>> +	}
> >>>>> +
> >>>>> +	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> >>>>> +	if (!ret) {
> >>>>> +		if (val > 360) {
> >>>>
> >>>> I'd add '|| val % 90' to this condition.
> >>>
> >>> Do we want to enforce this? I can't imagine any use case, but why a
> >>> camera cannot be rotated of an arbitrary number of degrees ?
> >>
> >> I would start out by enforcing this until someone comes up with a
> >> realistic use-case.
> >>
> >> As long as it is a multiple of 90 degree, then there is a clear interaction
> >> with the ROTATE/HFLIP/VFLIP controls. For other angles that gets more confusing
> >> and I'd rather avoid that for now.
> > 
> > If we enfore this, then let's update the DT bindings accordingly. yaml
> > would help with validation ;-)
> > 
> >>>>> +			pr_warn("Unsupported rotation: %u\n", val);
> >>>>> +			return -EINVAL;
> >>>>> +		}
> >>>>> +
> >>>>> +		if (v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_ROTATION))
> >>>>> +			pr_debug("Skip control '%s': already registered",
> >>>>> +				 v4l2_ctrl_get_name(
> >>>>> +					 V4L2_CID_CAMERA_SENSOR_ROTATION));
> >>>>> +		else
> >>>>> +			v4l2_ctrl_new_std(hdl, ctrl_ops,
> >>>>> +					  V4L2_CID_CAMERA_SENSOR_ROTATION,
> >>>>> +					  val, val, 1, val);
> >>>>> +	}
> >>>>> +
> >>>>> +	if (hdl->error) {
> >>>>> +		pr_warn("Failed to register controls from firmware: %d\n",
> >>>>> +			hdl->error);
> >>>>> +		return hdl->error;
> >>>>> +	}
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +EXPORT_SYMBOL_GPL(v4l2_fwnode_register_controls);
> >>>>> +
> >>>>>  static int
> >>>>>  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> >>>>>  					  struct v4l2_async_notifier *notifier,
> >>>>> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> >>>>> index f6a7bcd13197..0dad6968bde9 100644
> >>>>> --- a/include/media/v4l2-fwnode.h
> >>>>> +++ b/include/media/v4l2-fwnode.h
> >>>>> @@ -25,6 +25,8 @@
> >>>>>  struct fwnode_handle;
> >>>>>  struct v4l2_async_notifier;
> >>>>>  struct v4l2_async_subdev;
> >>>>> +struct v4l2_ctrl_handler;
> >>>>> +struct v4l2_ctrl_ops;
> >>>>>
> >>>>>  #define V4L2_FWNODE_CSI2_MAX_DATA_LANES	4
> >>>>>
> >>>>> @@ -233,6 +235,34 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
> >>>>>   */
> >>>>>  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
> >>>>>
> >>>>> +/**
> >>>>> + * v4l2_fwnode_register_controls() - parse device and endpoint fwnode
> >>>>> + *				     properties and register a v4l2 control
> >>>>> + *				     for each of them
> >>>>> + * @fwnode: pointer to the device fwnode handle
> >>>>> + * @hdl: pointer to the v4l2 control handler to register controls with
> >>>>> + * @ctrl_ops: pointer to the v4l2 control operations to register with the handler
> >>>>> + *
> >>>>> + * Parse the @fwnode device and endpoint properties to which a v4l2 control
> >>>>> + * is associated and register them with the provided handler @hdl.
> >>>>> + * Currently the following v4l2 controls are parsed and registered:
> >>>>> + * - V4L2_CID_CAMERA_SENSOR_LOCATION;
> >>>>> + * - V4L2_CID_CAMERA_SENSOR_ROTATION;
> >>>>> + *
> >>>>> + * Controls already registered by the caller with the @hdl control handler are
> >>>>> + * not overwritten. Callers should register the controls they want to handle
> >>>>> + * themselves before calling this function.
> >>>>> + *
> >>>>> + * NOTE: This function locks the @hdl control handler mutex, the caller shall
> >>>>> + * not hold the lock when calling this function.
> >>>>> + *
> >>>>> + * Return: 0 on success, -EINVAL if the fwnode properties are not correctly
> >>>>> + * specified.
> >>>>> + */
> >>>>> +int v4l2_fwnode_register_controls(struct fwnode_handle *fwnode,
> >>>>> +				  struct v4l2_ctrl_handler *hdl,
> >>>>> +				  const struct v4l2_ctrl_ops *ctrl_ops);
> >>>>> +
> >>>>>  /**
> >>>>>   * typedef parse_endpoint_func - Driver's callback function to be called on
> >>>>>   *	each V4L2 fwnode endpoint.

-- 
Regards,

Laurent Pinchart
