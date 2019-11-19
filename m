Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B2F1022FC
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKSL0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:26:54 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54997 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKSL0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:26:54 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 29B5920002;
        Tue, 19 Nov 2019 11:26:49 +0000 (UTC)
Date:   Tue, 19 Nov 2019 12:28:52 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 09/11] media: v4l2-ctrls: Add helper to register
 properties
Message-ID: <20191119112852.5m5qjutsl7k4n4th@uno.localdomain>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
 <20191108155944.1040883-10-jacopo@jmondi.org>
 <20191118125435.GF5391@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gijqaprsi4xj2aky"
Content-Disposition: inline
In-Reply-To: <20191118125435.GF5391@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gijqaprsi4xj2aky
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,

On Mon, Nov 18, 2019 at 02:54:35PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Nov 08, 2019 at 04:59:42PM +0100, Jacopo Mondi wrote:
> > Add an helper function to v4l2-ctrls to register controls associated
> > with a device property.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 40 ++++++++++++++++++++++++++++
> >  include/media/v4l2-ctrls.h           | 26 ++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index 97e97c8069c9..ac1934558969 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -16,6 +16,7 @@
> >  #include <media/v4l2-dev.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-ioctl.h>
> >
> >  #define dprintk(vdev, fmt, arg...) do {					\
> > @@ -4587,3 +4588,42 @@ __poll_t v4l2_ctrl_poll(struct file *file, struct poll_table_struct *wait)
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(v4l2_ctrl_poll);
> > +
> > +int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
> > +				    const struct v4l2_ctrl_ops *ctrl_ops,
> > +				    const struct v4l2_fwnode_device_properties *p)
> > +{
> > +	if (p->location != V4L2_FWNODE_PROPERTY_UNSET) {
> > +		u32 location_ctrl;
> > +
> > +		switch (p->location) {
> > +		case V4L2_FWNODE_LOCATION_FRONT:
> > +			location_ctrl = V4L2_LOCATION_FRONT;
> > +			break;
> > +		case V4L2_FWNODE_LOCATION_BACK:
> > +			location_ctrl = V4L2_LOCATION_BACK;
> > +			break;
> > +		case V4L2_FWNODE_LOCATION_EXTERNAL:
> > +			location_ctrl = V4L2_LOCATION_EXTERNAL;
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +		if (!v4l2_ctrl_new_std(hdl, ctrl_ops,
> > +				       V4L2_CID_CAMERA_SENSOR_LOCATION,
> > +				       location_ctrl, location_ctrl, 1,
> > +				       location_ctrl))
> > +			return hdl->error;
> > +	}
> > +
> > +	if (p->rotation != V4L2_FWNODE_PROPERTY_UNSET) {
> > +		if (!v4l2_ctrl_new_std(hdl, ctrl_ops,
> > +				       V4L2_CID_CAMERA_SENSOR_ROTATION,
> > +				       p->rotation, p->rotation, 1,
> > +				       p->rotation))
> > +			return hdl->error;
> > +	}
> > +
> > +	return 0;
>
> I think you should return hdl->error also here: calling this function on a
> failed control handler should result in an error.
>

I assume it would have failed at v4l2_ctrl_new_std() time, but indeed
it does not hurt to return hdl->error here. Thanks, I'll take this in.

Thanks
  j

> > +}
> > +EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index cf59abafb0d9..409c800ab1f5 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -30,6 +30,7 @@ struct v4l2_ctrl;
> >  struct v4l2_ctrl_handler;
> >  struct v4l2_ctrl_helper;
> >  struct v4l2_fh;
> > +struct v4l2_fwnode_device_properties;
> >  struct v4l2_subdev;
> >  struct v4l2_subscribed_event;
> >  struct video_device;
> > @@ -1417,4 +1418,29 @@ int v4l2_ctrl_subdev_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
> >   */
> >  int v4l2_ctrl_subdev_log_status(struct v4l2_subdev *sd);
> >
> > +/**
> > + * v4l2_ctrl_new_fwnode_properties() - Register controls for the device
> > + *				       properties
> > + *
> > + * @hdl: pointer to &struct v4l2_ctrl_handler to register controls on
> > + * @ctrl_ops: pointer to &struct v4l2_ctrl_ops to register controls with
> > + * @p: pointer to &struct v4l2_fwnode_device_properties
> > + *
> > + * This function registers controls associated to device properties, using the
> > + * property values contained in @p parameter, if the property has been set to
> > + * a value.
> > + *
> > + * Currently the following v4l2 controls are parsed and registered:
> > + * - V4L2_CID_CAMERA_SENSOR_LOCATION;
> > + * - V4L2_CID_CAMERA_SENSOR_ROTATION;
> > + *
> > + * Controls already registered by the caller with the @hdl control handler are
> > + * not overwritten. Callers should register the controls they want to handle
> > + * themselves before calling this function.
> > + *
> > + * Return: 0 on success, a negative error code on failure.
> > + */
> > +int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
> > +				    const struct v4l2_ctrl_ops *ctrl_ops,
> > +				    const struct v4l2_fwnode_device_properties *p);
> >  #endif
>
> --
> Regards,
>
> Sakari Ailus

--gijqaprsi4xj2aky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3T0fQACgkQcjQGjxah
Vjyiwg/9H+3LNTCmfNBJViQlqIm1/h/lYhR8safBe6HEw0H/+c99HSGPErxl23I7
L5qVIA/+GDEnA+xHt7brd8baz9s/VzFknLXRfYzPnpUikts5IVn6DrR2YXsfOOhp
Uikaf9vNvGrnrqdgcZjYpbT2Xqb5/tQ4slZGs9KFlGXrfk1rl+bqsT9SZVTMuEi2
CB/kTSQAr7mudA9wvWNrb2eeG4M82jCJmYDpAPWVhq9EcWtChktN9r1RNVSNZqSP
z3+xvJ+EBYxBqD9zUBLq/2ojzQvqsEr/zxbLry8MfXWs1IlnGYj7y0xaUMqej+R3
3b4NSjiTXXl59ZCfVvDkH9IMaKzzxgEjJX3XRLF1kqyfNcdyJpyboUjxum0/FPLa
oNXCHUCDyO0AXPT8l3nkIdHf1lVbBQ/VpuSb4afUKr9VB38ix5G49w1vUANNH2/k
lwM79SEj1dF3fpF8gKK3ZGRTj2iiKBTS1jPEvmDU6ZtjEER+ZDhmE41mwISnPb6K
FJtqMIXvoKmPrn+xgv0+zfeNI4JFP8zRGnq/4jUKEkW27GldrxMso4FLWEX2IJg1
CDRzGd6Ky+Ts//2JBC92jX8cUAcuFqJsP0ATHAY5ECdQgEo3iw5YlQjDXTzbYTR+
Ds/xLZRv0DpiAsYnN32g0KypsU/etZXU06maLUEVePy0q0MAevE=
=oMdZ
-----END PGP SIGNATURE-----

--gijqaprsi4xj2aky--
