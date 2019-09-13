Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C080B25A7
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 21:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbfIMTDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 15:03:40 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57117 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfIMTDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 15:03:39 -0400
X-Originating-IP: 85.243.204.24
Received: from uno.localdomain (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B01791BF207;
        Fri, 13 Sep 2019 19:03:23 +0000 (UTC)
Date:   Fri, 13 Sep 2019 21:04:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 06/11] media: v4l2-fwnode: Add helper to parse device
 properties
Message-ID: <20190913190457.rmavdokwo3pz7muw@uno.localdomain>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-7-jacopo@jmondi.org>
 <eb2ff7be-39d3-07e8-aa6e-a24426e3fbbe@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fz7banjg2t2jw2kk"
Content-Disposition: inline
In-Reply-To: <eb2ff7be-39d3-07e8-aa6e-a24426e3fbbe@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fz7banjg2t2jw2kk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

On Fri, Sep 13, 2019 at 04:08:10PM +0200, Hans Verkuil wrote:
> On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> > Add an helper function to parse common device properties in the same
> > way as v4l2_fwnode_endpoint_parse() parses common endpoint properties.
> >
> > Initially parse the 'rotation' and 'location' properties from the
>
> Just drop 'Initially'. It's redundant.
>
> > firmware interface.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 42 +++++++++++++++++++++++++++
> >  include/media/v4l2-fwnode.h           | 40 +++++++++++++++++++++++++
> >  2 files changed, 82 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 3bd1888787eb..d325a2d5c088 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -595,6 +595,48 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
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
> > +	dev_dbg(dev, "===== begin V4L2 device properties parsing\n");
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
> > +	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
> > +	if (!ret) {
> > +		if (val >= 360 || val % 90) {
> > +			dev_warn(dev, "Unsupported device rotation: %u\n", val);
> > +			return -EINVAL;
> > +		}
> > +
> > +		props->rotation = val;
> > +		dev_dbg(dev, "device rotation: %u\n", val);
> > +	}
> > +	dev_dbg(dev, "===== end V4L2 device properties parsing\n");
>
> Are these dev_dbg lines really needed? It seems a bit overkill to me.
>

It's the same debug output we have in v4l2_fwnode_endpoint_parse() so
I tried to be consistent. Should I drop it?

> What if rotation is set, but not location. Then location defaults to Front.
> Is that what we want, or should we add an UNKNOWN location?
>

As you have noticed I have added a value to encode UNKNOW in the later
patch, I should probably add them in this one as you suggested ?

> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
> > +
> >  static int
> >  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> >  					  struct v4l2_async_notifier *notifier,
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index f6a7bcd13197..86af6d9d11fe 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -109,6 +109,28 @@ struct v4l2_fwnode_endpoint {
> >  	unsigned int nr_of_link_frequencies;
> >  };
> >
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
> > @@ -233,6 +255,24 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
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
> >
>
> Regards,
>
> 	Hans

--fz7banjg2t2jw2kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl176FkACgkQcjQGjxah
VjzB8g/+OiCu+mxHBIJHXv95kMEJSwTvAN7QxOSB8AptWkJbH+zm/4tSPa+HkJX2
tcFhh1jYvSaTJTSkhFWBIRLdMBr4P8owzzh+XqbRZqgQPnVD3JWjveMJ/hncbb6i
Y3o1YmjiW8vYc9yOY+JJ5fggVXSiaqil+1EWXsHe5HFNLXilbk/totySeif1QikH
eS/mkj4S2r01VCmgIxTMSiUpNS3g/bomG2U7zR6AFQARQaluGEmy9QKAOOpuzfGA
HN0Cy/Wx5p+XnK0CZPn9EgHErMMdlwoktb6HqvXXgsnoPt225YucuKkBBoyS+Oug
Ce/yhRpMoOe0MlGa5yzbEntmbW1QqGgPMF1NvWajD2Ya3rLeVSHj/jT+RzKjNhkP
EuJNKjjuwLgIWNIflmwhj38eP3FZIHmuAhjXiMyWG9MCj9pfCswZQJEG5H9VFF7N
vtpdPuhfloFAy3rLT00YbWIb7KNWHxa9unsC+A4IF3EgLscf6W0MMgCK/SJnG6/h
G4DVr3Zruom3avW81zGZMDGf8+S9aFtqao9AqA+c2ipAYK6d0mw9tDRjQuMrp885
U60iSOOHnaGl/t4Ep0NVW3mrBO21XCqYORjdnwBCowVkm+YBUFENRCgz4vVK1qyu
Fi8B7RSW8kAiksWcgeDA1RmXMBXBys9/69b26jYm2evFWuRqVo4=
=wLP8
-----END PGP SIGNATURE-----

--fz7banjg2t2jw2kk--
