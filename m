Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006A7A1A84
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 14:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfH2MyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 08:54:20 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55477 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbfH2MyU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 08:54:20 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DB382E0016;
        Thu, 29 Aug 2019 12:54:16 +0000 (UTC)
Date:   Thu, 29 Aug 2019 14:55:48 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] media: v4l2-fwnode: Add helper to register
 controls from fw
Message-ID: <20190829125548.npqgit4guqunxyuu@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-9-jacopo@jmondi.org>
 <20190827131620.GX5054@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z5gqvpubktw44elr"
Content-Disposition: inline
In-Reply-To: <20190827131620.GX5054@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--z5gqvpubktw44elr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 27, 2019 at 04:16:20PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 27, 2019 at 11:23:34AM +0200, Jacopo Mondi wrote:
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
> Passing the ctrl_ops is a bit annoying. Would there be a way to get the
> V4L2 control framework to accept NULL ops for read-only controls ?
>

That would require a core change that is imho outside the scope of
this patch

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
>
> dev_warn() would be nicer. Is there a way we could either pass the
> struct device pointer, or maybe a subdev that would be populated with
> the device, fwnode and hdl pointers ?
>

I went for pr_ as in all other functions of this file it is used when
a fwnode_handle is passed as parameter. I could pass the device node,
but I'm not sure passing an already populated subdevice is a good
idea, as the subdevice ctrl_handler is usually populated after having
made sure all controls have been registered without errors.

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
> > +			pr_warn("Unsupported rotation: %u\n", val);
> > +			return -EINVAL;
> > +		}
>
> We need to define the range of allowed values in the control
> documentation. 360 doesn't seem very useful as it's equivalent to 0.
> A few possible options are [0, 360[, [-180, +180[ or ]-180, +180].
>

As asked to Hans, why should we restrict this? I don't see a use case
for a 73 degrees rotated camera, but why prevent it?

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
>
> I don't think that description is accurate.
>

How so? The function parses the device (not yet endpoint, right)
properties and register a control for each of them.

How would you phrase this?

Thanks
  j

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
>
> --
> Regards,
>
> Laurent Pinchart

--z5gqvpubktw44elr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1ny1QACgkQcjQGjxah
VjxsYw/8DOkSahukB3RXl75l7HrdDooo2IplDOETbm6Zn3eYbGHT5agQWQoxGQpy
oec8Vg9rnAg8uakk3uDXKEFRYiSO0sW+i3axu0amgISoMDDwXfATdAgcUFQh38Do
YkW+I9B4VhmBN7XFX9oexKK9ZSQmqF7V4HBmHHConRBzQ6KJl8zhRZ/Mb5UHcPdi
iV+5NdPN8hyiiqN2Pvm6WNMAxYfUB0RNo6z6BOzj84NyOwBYdjba3mn6FVC0V4wc
SLPJVzNUPL8s94dUjtxnhoacIzftJ88HyWOCURKJML3FOy9HEkyYv5AL6yIXfZY4
S5h30brdzbDOuhg76lwjp7YF/s2cjGLicexHZ3jsOSltQR4lkRu9fU8MS/DGTQZL
HLev+MdKco+Z8WeZi26h2Jw+MjuCispD+z9SD1PhJlkCSaE90I4hOT2urF69fGrE
PV3W/Ou39TSOtPkR1cuZeBeIpRuRwTSolAR264P9cAsIGzOXNtVPA3kI0X9oJCal
Cuhy//pRdYsx9D1bs8yNcJsppvpP/aohD0lWhUXs9pVRWalmrfRHT9TWVACnffzS
maf920c/PMXzzFF4pk2JHLjkkWo7VEUU5/4hPj1rIT0jpghARK3hlYwUa8gQcVKx
S2c2UL/wTpU2TaHrKm1g+RTl2fpsJ+EBQH3eCuLQZF3n1k5w120=
=X0gy
-----END PGP SIGNATURE-----

--z5gqvpubktw44elr--
