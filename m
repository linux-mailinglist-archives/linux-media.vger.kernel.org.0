Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDD5A1A53
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 14:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfH2Mns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 08:43:48 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53191 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfH2Mns (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 08:43:48 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9B0802000F;
        Thu, 29 Aug 2019 12:43:44 +0000 (UTC)
Date:   Thu, 29 Aug 2019 14:45:16 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] media: v4l2-fwnode: Add helper to register
 controls from fw
Message-ID: <20190829124516.3fbvxcrligtbiy7d@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-9-jacopo@jmondi.org>
 <f4e57a0c-08e5-c52c-bd52-7bf7e8f54c30@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aker6cxdp5fggndt"
Content-Disposition: inline
In-Reply-To: <f4e57a0c-08e5-c52c-bd52-7bf7e8f54c30@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--aker6cxdp5fggndt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

On Thu, Aug 29, 2019 at 12:31:37PM +0200, Hans Verkuil wrote:
> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
> > Add the 'v4l2_fwnode_register_controls()' helper to v4l2-fwnode. The
> > function parses the device node and endpoint firmware properties to
> > which a v4l2 control is associated to and registers the control with the
> > provided handler.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 57 +++++++++++++++++++++++++++
> >  include/media/v4l2-fwnode.h           | 30 ++++++++++++++
> >  2 files changed, 87 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 3bd1888787eb..669801fceb64 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/types.h>
> >
> >  #include <media/v4l2-async.h>
> > +#include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> >
> > @@ -595,6 +596,62 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> >
> > +int v4l2_fwnode_register_controls(struct fwnode_handle *fwnode,
> > +				  struct v4l2_ctrl_handler *hdl,
> > +				  const struct v4l2_ctrl_ops *ctrl_ops)
>
> I'm not convinced that this helper is a good idea.
>
> A helper that parses and validates this information makes sense,
> but combining that with creating the controls feels wrong to me.
>
> You're mixing two very different things in one function.
>
> I think something like this would work better in a driver:
>
> 	if (!v4l2_fwnode_parse_location(&val))
> 		v4l2_ctrl_new_std(hdl, ctrl_ops,
> 				  V4L2_CID_CAMERA_SENSOR_LOCATION,
> 				  val, val, 1, val);
> 	if (!v4l2_fwnode_parse_rotation(&val))
> 		v4l2_ctrl_new_std(hdl, ctrl_ops,
> 				  V4L2_CID_CAMERA_SENSOR_ROTATION,
> 				  val, val, 1, val);
>
> Much cleaner IMHO. (Just a brainstorm, so don't get stuck on these
> function prototypes!)
>

Could the control registration being conditional on the presence of
the *hdl parameter otherwise, or would you split the two operations
(property parsing and control registration) nonetheless ?

An helper was suggested in the v1 review, Laurent, Sakari, what do you
think here?

> > +{
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = fwnode_property_read_u32(fwnode, "location", &val);
> > +	if (!ret) {
> > +		switch (val) {
> > +		case V4L2_LOCATION_FRONT:
> > +		case V4L2_LOCATION_BACK:
> > +		case V4L2_LOCATION_EXTERNAL:
> > +			break;
> > +		default:
> > +			pr_warn("Unsupported location: %u\n", val);
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_LOCATION))
> > +			pr_debug("Skip control '%s': already registered",
> > +				 v4l2_ctrl_get_name(
> > +					 V4L2_CID_CAMERA_SENSOR_LOCATION));
> > +		else
> > +			v4l2_ctrl_new_std(hdl, ctrl_ops,
> > +					  V4L2_CID_CAMERA_SENSOR_LOCATION,
> > +					  val, val, 1, val);
> > +	}
> > +
> > +	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> > +	if (!ret) {
> > +		if (val > 360) {
>
> I'd add '|| val % 90' to this condition.
>

Do we want to enforce this? I can't imagine any use case, but why a
camera cannot be rotated of an arbitrary number of degrees ?

Thanks
   j
> Regards,
>
> 	Hans
>
> > +			pr_warn("Unsupported rotation: %u\n", val);
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (v4l2_ctrl_find(hdl, V4L2_CID_CAMERA_SENSOR_ROTATION))
> > +			pr_debug("Skip control '%s': already registered",
> > +				 v4l2_ctrl_get_name(
> > +					 V4L2_CID_CAMERA_SENSOR_ROTATION));
> > +		else
> > +			v4l2_ctrl_new_std(hdl, ctrl_ops,
> > +					  V4L2_CID_CAMERA_SENSOR_ROTATION,
> > +					  val, val, 1, val);
> > +	}
> > +
> > +	if (hdl->error) {
> > +		pr_warn("Failed to register controls from firmware: %d\n",
> > +			hdl->error);
> > +		return hdl->error;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_fwnode_register_controls);
> > +
> >  static int
> >  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> >  					  struct v4l2_async_notifier *notifier,
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index f6a7bcd13197..0dad6968bde9 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -25,6 +25,8 @@
> >  struct fwnode_handle;
> >  struct v4l2_async_notifier;
> >  struct v4l2_async_subdev;
> > +struct v4l2_ctrl_handler;
> > +struct v4l2_ctrl_ops;
> >
> >  #define V4L2_FWNODE_CSI2_MAX_DATA_LANES	4
> >
> > @@ -233,6 +235,34 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
> >   */
> >  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
> >
> > +/**
> > + * v4l2_fwnode_register_controls() - parse device and endpoint fwnode
> > + *				     properties and register a v4l2 control
> > + *				     for each of them
> > + * @fwnode: pointer to the device fwnode handle
> > + * @hdl: pointer to the v4l2 control handler to register controls with
> > + * @ctrl_ops: pointer to the v4l2 control operations to register with the handler
> > + *
> > + * Parse the @fwnode device and endpoint properties to which a v4l2 control
> > + * is associated and register them with the provided handler @hdl.
> > + * Currently the following v4l2 controls are parsed and registered:
> > + * - V4L2_CID_CAMERA_SENSOR_LOCATION;
> > + * - V4L2_CID_CAMERA_SENSOR_ROTATION;
> > + *
> > + * Controls already registered by the caller with the @hdl control handler are
> > + * not overwritten. Callers should register the controls they want to handle
> > + * themselves before calling this function.
> > + *
> > + * NOTE: This function locks the @hdl control handler mutex, the caller shall
> > + * not hold the lock when calling this function.
> > + *
> > + * Return: 0 on success, -EINVAL if the fwnode properties are not correctly
> > + * specified.
> > + */
> > +int v4l2_fwnode_register_controls(struct fwnode_handle *fwnode,
> > +				  struct v4l2_ctrl_handler *hdl,
> > +				  const struct v4l2_ctrl_ops *ctrl_ops);
> > +
> >  /**
> >   * typedef parse_endpoint_func - Driver's callback function to be called on
> >   *	each V4L2 fwnode endpoint.
> >
>

--aker6cxdp5fggndt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1nyNwACgkQcjQGjxah
VjwO9Q/+IeyBNvBAIr294MwaDl88rbZLBgN+VrHK6jGjV0rmTqc0ep+5Fc2tC4np
xARwIQiPRGUoHFHSA9Fv9C9F+jyforrk7h6LNtGNTs80IUZtPAVyuoLKItVWqP/B
QUAxZ+3fHnA56b8cS6385GxLIj0CivL3fWesAyf2ooKuu3lR2/FaO9B+u17Yi9VM
DZqIEGk1IM8YxPCyEGsdvAVY1rJDdf1MN3nKQSFWqTLuOSynAkPcuKwrSnwLfu9O
DclMN2ltV8BbeopVOqHMMNYTRTNhZtppyoGwZR1fl8nwwssA0T9HMUnU1nKt9o9O
FIVpFb1eoJv3KbLhpDdoHZlpja9uDhkTnwdlsQVqcH8uqUERfM+RyCscdX+DMkWL
2KcpLqBHq8t1uWNk6u/8cRgHlhYCo0m5GT3tvIao17n38vq3YupNpaMOxpPPtmj7
LovVHtoZjzqRWqJ1lNd69dXEhcp3dGj5GKmbiWCdOCjaUrOCTj5ewXJF1NZyEsFN
GVbDO0TLNQ0RoYigWXC8Jr+O+bvJ09QOOk09XcU25eBP1UNxyXLT7AgrsDEACm8Z
X/a1iuAS1snT2vCIb08ccLLoJxUy0LnKu7mtLaffn/luH6GKKsvWOTduW7CQRHGK
aWPNla5LVE0cAQZlJfrG6xK8zY2RtiBQ2fH2hyPzsGmHmFo7krg=
=G8/R
-----END PGP SIGNATURE-----

--aker6cxdp5fggndt--
