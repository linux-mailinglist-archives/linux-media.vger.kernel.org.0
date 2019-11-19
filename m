Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C381022FA
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfKSLZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:25:45 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:52837 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfKSLZo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:25:44 -0500
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 088B3200011;
        Tue, 19 Nov 2019 11:25:40 +0000 (UTC)
Date:   Tue, 19 Nov 2019 12:27:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 06/11] media: v4l2-fwnode: Add helper to parse device
 properties
Message-ID: <20191119112743.3zn6csysmp7xvezx@uno.localdomain>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
 <20191108155944.1040883-7-jacopo@jmondi.org>
 <20191118125240.GE5391@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w2pmzuspfoo4472a"
Content-Disposition: inline
In-Reply-To: <20191118125240.GE5391@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--w2pmzuspfoo4472a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,

On Mon, Nov 18, 2019 at 02:52:40PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Nov 08, 2019 at 04:59:39PM +0100, Jacopo Mondi wrote:
> > Add an helper function to parse common device properties in the same
> > way as v4l2_fwnode_endpoint_parse() parses common endpoint properties.
> >
> > Parse the 'rotation' and 'location' properties from the firmware
> > interface.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 42 +++++++++++++++++++++++
> >  include/media/v4l2-fwnode.h           | 48 +++++++++++++++++++++++++++
> >  2 files changed, 90 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 192cac076761..8af4174a2bbf 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -596,6 +596,48 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> >
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +			     struct v4l2_fwnode_device_properties *props)
> > +{
> > +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +	u32 val;
> > +	int ret;
> > +
> > +	memset(props, 0, sizeof(*props));
> > +
> > +	props->location = V4L2_FWNODE_PROPERTY_UNSET;
> > +	ret = fwnode_property_read_u32(fwnode, "location", &val);
> > +	if (!ret) {
> > +		switch (val) {
> > +		case V4L2_FWNODE_LOCATION_FRONT:
> > +		case V4L2_FWNODE_LOCATION_BACK:
> > +		case V4L2_FWNODE_LOCATION_EXTERNAL:
> > +			break;
> > +		default:
> > +			dev_warn(dev, "Unsupported device location: %u\n", val);
> > +			return -EINVAL;
> > +		}
> > +
> > +		props->location = val;
> > +		dev_dbg(dev, "device location: %u\n", val);
> > +	}
> > +
> > +	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
> > +	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> > +	if (!ret) {
> > +		if (val >= 360 || val % 90) {
> > +			dev_warn(dev, "Unsupported device rotation: %u\n", val);
> > +			return -EINVAL;
>
> In both cases, you return an error back to the user if there's a problem
> with the value of an optinoal property.
>
> It could prevent probing the driver if someone screwed up the firmware
> somehow, but also makes the matter more visible. I think it's good to start
> with this way, and hope we don't need to change it.
>
> > +		}
> > +
> > +		props->rotation = val;
> > +		dev_dbg(dev, "device rotation: %u\n", val);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> > +
> >  static int
> >  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> >  					  struct v4l2_async_notifier *notifier,
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index f6a7bcd13197..6d46d6fc3007 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -109,6 +109,36 @@ struct v4l2_fwnode_endpoint {
> >  	unsigned int nr_of_link_frequencies;
> >  };
> >
> > +/**
> > + * v4l2_fwnode_location - identify a non initialized property.
> > + *
> > + * All properties in &struct v4l2_fwnode_device_properties are initialized
> > + * to this value.
> > + */
> > +#define V4L2_FWNODE_PROPERTY_UNSET   (-1U)
>
> On the naming --- this is relevant for only one property at the moment, so
> I'd make it specific to that property, too. This also makes it fit for the
> enum below.

It is used also for rotation, not only for location. I need an
"UNSET" value as a 0 degree rotation is valid. To be hones I will keep
it generic, I do expect more properties to need it, as it will have to
be renamed later...

>
> > +
> > +/**
> > + * enum v4l2_fwnode_location - possible device locations
> > + * @V4L2_FWNODE_LOCATION_FRONT: device installed on the front side
> > + * @V4L2_FWNODE_LOCATION_BACK: device installed on the back side
> > + * @V4L2_FWNODE_LOCATION_EXTERNAL: device externally located
> > + */
> > +enum v4l2_fwnode_location {
> > +	V4L2_FWNODE_LOCATION_FRONT,
> > +	V4L2_FWNODE_LOCATION_BACK,
> > +	V4L2_FWNODE_LOCATION_EXTERNAL
> > +};
> > +
> > +/**
> > + * struct v4l2_fwnode_device_properties - fwnode device properties
> > + * @location: device location. See &enum v4l2_fwnode_location
> > + * @rotation: device rotation
> > + */
> > +struct v4l2_fwnode_device_properties {
> > +	enum v4l2_fwnode_location location;
> > +	unsigned int rotation;
> > +};
> > +
> >  /**
> >   * struct v4l2_fwnode_link - a link between two endpoints
> >   * @local_node: pointer to device_node of this endpoint
> > @@ -233,6 +263,24 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
> >   */
> >  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
> >
> > +/**
> > + * v4l2_fwnode_device_parse() - parse fwnode device properties
> > + * @dev: pointer to &struct device
> > + * @props: pointer to &struct v4l2_fwnode_device_properties where to store the
> > + *	   parsed properties values
> > + *
> > + * This function parses and validates the V4L2 fwnode device properties from
> > + * the firmware interface. It is responsibility of the caller to allocate a
> > + * valid @struct v4l2_fwnode_device_properties structure and provide a pointer
> > + * to it in the @props parameter.
>
> I think the latter sentence (inserted before the leading comma of the
> previous sentence) could be phrased as:
>
> "and fills the @struct v4l2_fwnode_device_properties provided by the
> caller".

Yeah, thanks, better! I'll take it in!

Thanks
   j
>
> > + *
> > + * Return:
> > + *	% 0 on success
> > + *	%-EINVAL if a parsed property value is not valid
> > + */
> > +int v4l2_fwnode_device_parse(struct device *dev,
> > +			     struct v4l2_fwnode_device_properties *props);
> > +
> >  /**
> >   * typedef parse_endpoint_func - Driver's callback function to be called on
> >   *	each V4L2 fwnode endpoint.
>
> --
> Regards,
>
> Sakari Ailus

--w2pmzuspfoo4472a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3T0a8ACgkQcjQGjxah
Vjx1NxAAs8pBDZruIF9ctVXjkQRojbVSL1WDC92oHiWngCtetuaco7baZ8tHSXLm
Dng3OksfE81fFxgIydX3t7mtZ2AxmVLVv9kGVMj4HEMkPsDB4Rfsp7wp/5C82lVX
KZ4U4LMKiAFpKVvZKpcBBG5X0hiY+ibLegz3/mtGBsQDL3SW5N8+V8cu3vb7hP/m
h+UZ/xYo7VO2tAo+dHMlg7BweTn7qc+tu+l9dh4dyU+4v/f6hoX9CKCz9zfbpgIQ
PkADYNn3v1JjDJ7e7oSgg65Vv+/n1lr60O0xw7kSURRcBXew0rSuvBt9Kbzb3T8t
K/rP22EeTM8iVYD39mbpkl/frVifoKNehONpViNlIFTLXe5qr4CFsqeVw9ROL4PS
kg3QpokRgIjWA3AkW+kaHtp3mgQ8XiZZip5ji9rTX73th5haOnpMjzOuKimpbQ+i
XrDauKeGLTrVsBnoI96sH4SqEbqMnUTEZQTS53UCuKlk8hvmVw1tBeRhikB2M5cC
1BKsPjQx5aKQsXh90781vN7vtp/YvGSbEJ0wtd5kZ5UDmvfZN1qm31z+T2tsEHT5
Jc0x6mbd+bT70JGNkwc09He8cPcNrmUP6GrO5wNTkDg5Bf/TguFdiVjvbOXVZhmb
2C6dKRMwP1yMUf50tOivGfpjE6SklBC3/l/ofKmRPISCQ7ZGxaw=
=R8hR
-----END PGP SIGNATURE-----

--w2pmzuspfoo4472a--
