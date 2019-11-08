Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08726F42F5
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 10:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730887AbfKHJSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 04:18:42 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:39727 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfKHJSl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 04:18:41 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 90EB81BF211;
        Fri,  8 Nov 2019 09:18:37 +0000 (UTC)
Date:   Fri, 8 Nov 2019 10:20:30 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 06/11] media: v4l2-fwnode: Add helper to parse device
 properties
Message-ID: <20191108092030.ozz4usl4xirrele4@uno.localdomain>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-7-jacopo@jmondi.org>
 <20191018193640.GE3712@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4npncarjmrkb7hxj"
Content-Disposition: inline
In-Reply-To: <20191018193640.GE3712@kekkonen.localdomain>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--4npncarjmrkb7hxj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,

On Fri, Oct 18, 2019 at 10:36:40PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Oct 07, 2019 at 06:29:08PM +0200, Jacopo Mondi wrote:
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
>
> How about adding V4L2_FWNODE_LOCATION_UNDEFINED instead? Same for the
> rotation. I'd use 0 for that value, so memset above already sets it.
>

I'm not sure... 0 is actually a valid rotation value, and to use 0
here the location properties available to users
(V4L2_FWNODE_LOCATION_FRONT, V4L2_FWNODE_LOCATION_BACK etc) should be
numbered starting from 1... I would keep PROPERTY_UNSET (or
_UNDEFINED) as (-1U) to be honest...

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
>
> I think it should be up to the caller to determine what's supported.
>

well, I tend to agree.. Hans and Laurent suggested to have fixed
values, but I would actually just check for (val >= 360) here and let
the caller figure out if it supports the specified location or not...

Thanks for feedback, I'll send a v5 shortly

> > +			return -EINVAL;
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
> Kind regards,
>
> Sakari Ailus
> sakari.ailus@linux.intel.com

--4npncarjmrkb7hxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3FM14ACgkQcjQGjxah
VjyUERAArnbKCY7MgL41crY8OgpUkz8iZ1QduYPSbODmO9raO92ZSNVWcV44kHQi
8t2TKPF+AiFr/FVOA3zz0fM7xjzPVhQp8iomm91uCGiUJJo8xOX39GfrYo98s63H
vZLbMgRStVQbpFaUZClyU5JhH6xzd6LlWVTMr+mFpaCwNyUifGn1FfO6AG3QI7WC
0hPhY6f8H6ciA97Zzoa/fgL4wd4qgnBTv9IpkWYkx0L205dUUo6g49+bhn48is9M
evgzTJ+/XIclXmVZECIBbFu++aatBnubYiMzaB/Px06XrVVtkf/HuBkL+WYrih/7
c7YyaG3M6GUW67YJ3ho9sjaEy/l7nJJQr5OhuONVyd2nyTdY3J5uFjea641WPw7T
guugU7ziSuiuCv5cnS0u1v0Dmv3qnsmkF82j9sRmhZkpDBY61stx54KULa8LVBde
2JoTPhERT0lvcTWX2dOUxCEWVRebDKSl3QXPVQhih4AiuXQnjBGxTXZFa+T1ZQJq
nxd0UEQRC3yx7xmZp9aa3Dgf5B8l6D28m1Yh3vcEVi7jqgaI84Cgo+5xH0EkpoVq
MSLzuXAylMbmYAn3loz5EOgsVwLbPJY+LnHpctsYy2DBQUeo9hW/MqXOGDE3I/Fy
XTBUChEXbbSPsmZfoPxOpvTa31laIJV6o0laeI3uhG1ZJ0CPK0c=
=oCNh
-----END PGP SIGNATURE-----

--4npncarjmrkb7hxj--
