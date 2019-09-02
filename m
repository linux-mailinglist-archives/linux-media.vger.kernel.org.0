Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D20A52F6
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 11:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730608AbfIBJi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 05:38:26 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34307 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729690AbfIBJi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 05:38:26 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C525960006;
        Mon,  2 Sep 2019 09:38:21 +0000 (UTC)
Date:   Mon, 2 Sep 2019 11:39:54 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] media: v4l2-fwnode: Add helper to register
 controls from fw
Message-ID: <20190902093954.rzqqdfdbbwxv6sir@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-9-jacopo@jmondi.org>
 <f4e57a0c-08e5-c52c-bd52-7bf7e8f54c30@xs4all.nl>
 <20190829124516.3fbvxcrligtbiy7d@uno.localdomain>
 <54707d6c-fb8e-c10c-e48a-c0ae72075190@xs4all.nl>
 <20190829150548.GF5875@pendragon.ideasonboard.com>
 <6bd504eb-d56c-f07d-8daa-363b1618a1bd@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="antg6nvaz2ztsqkp"
Content-Disposition: inline
In-Reply-To: <6bd504eb-d56c-f07d-8daa-363b1618a1bd@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--antg6nvaz2ztsqkp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Laurent,

On Thu, Aug 29, 2019 at 05:32:52PM +0200, Hans Verkuil wrote:
> On 8/29/19 5:05 PM, Laurent Pinchart wrote:
> > Hi Hans,
> >
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
>
> But don't mix the two in one helper.
>

I see, I like this better than a single helper per property, as this
is not going to scale well if the number of static properties
increases.

> Note that creating some more advanced framework for sensors wouldn't hurt
> since it's a bit mess at the moment IMHO.
>

I would start by defining a v4l2_sensor_properties structure, filled
by parsing the fwnode properties and then used by to register controls
with the informations there collected.

Thanks
   j
> Regards,
>
> 	Hans
>
> >
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
> >
>

--antg6nvaz2ztsqkp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1s42oACgkQcjQGjxah
VjxAbw/8CG3DcWMl071xSZKmHVEUQWk7xneuaq/49Pw62mqla2u2N4ksSC+zbf3Y
uXiuze2Y8Kj5zUCdaGRBmgZ840kzQfQanuRCzjeAAVr2AG7IaNCDAEwWMYCikWpL
LI2TVYag+jNbCsqt9p9GGduQVxSQVxZbjQxJmSTOYfWM0LEtqGv2ucGM2ekyIxl7
QNFFbEen/TeNUPw2k3XQ3s/Dy80gHAQttcKLkp1tazGwxwdfJCBgZhAwpU0A5bOO
bx6tNkP1ivdLmAUpfO/h+CHP4vGp22JSv/giqhqbjo77el3HRLVPknzcjNhQmZf6
b+QPmoDPsXPLhwYRjUPummapeAAXPmJrdDCrSj9c9tIvyEisocESVqZZQQwMcxv8
HXOnv5RAGwDg62NRnJOqNnVQ9uyJSiNSdNpvW0jZ4ie3+eyLjAwyrEBKZ+YTvV85
XEiMsHyahSSDIOWXoUR6PjLfTwyNC/YZeZvdr4RhE4zRcX/7R07hkBJJGoA2qs+E
ooZs9u5CEW//Vnvquv9Dx2j9zPYYO4qb2Tv0pBTs0t3omT2LP6XshdDA3zjV0aWR
KWRTyr3YElKqZ0cp0kUooy+5LYW80Xl878Zym7gec4SALe8F+zt9UIQWLbCj2BHa
JSgxSqffoow+srTxNoyGS1L6yDA4pz8t1gWhomSg9mcHF9ZPLoI=
=FxJ/
-----END PGP SIGNATURE-----

--antg6nvaz2ztsqkp--
