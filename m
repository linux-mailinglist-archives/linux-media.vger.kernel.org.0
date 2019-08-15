Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A07A8ED47
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732541AbfHONtT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:49:19 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:45307 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732504AbfHONtS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:49:18 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.localdomain (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8F425C0006;
        Thu, 15 Aug 2019 13:49:15 +0000 (UTC)
Date:   Thu, 15 Aug 2019 15:50:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 3/5] media: v4l2-ctrls: Add support for V4L2_CID_LOCATION
Message-ID: <20190815135042.mm2co73badsv2wbo@uno.localdomain>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-4-jacopo@jmondi.org>
 <6c9460e2-b607-9863-f8f0-1a94773c6556@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ipri7ukjihz5d7ak"
Content-Disposition: inline
In-Reply-To: <6c9460e2-b607-9863-f8f0-1a94773c6556@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ipri7ukjihz5d7ak
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

On Thu, Aug 15, 2019 at 03:23:47PM +0200, Hans Verkuil wrote:
> On 8/14/19 10:28 PM, Jacopo Mondi wrote:
> > Add support for the newly defined V4L2_CID_LOCATION read-only control
> > used to report the camera device mounting position.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 7 +++++++
> >  include/uapi/linux/v4l2-controls.h   | 4 ++++
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index 7d3a33258748..8ab0857df59a 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -943,6 +943,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
> >  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
> >  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> > +	case V4L2_CID_LOCATION:			return "Location";
> >
> >  	/* FM Radio Modulator controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1300,6 +1301,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  		break;
> >  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
> >  		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
>
> Missing break!
>

Sorry, this was a trivial mistake. Thanks for spotting!

> Regards,
>
> 	Hans
>
> > +	case V4L2_CID_LOCATION:
> > +		*type = V4L2_CTRL_TYPE_INTEGER;
> > +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +		*min = V4L2_LOCATION_FRONT;
> > +		*max = V4L2_LOCATION_BACK;
> > +		*step = 1;
> >  		break;
> >  	default:
> >  		*type = V4L2_CTRL_TYPE_INTEGER;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 37807f23231e..5c4c7b245921 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -889,6 +889,10 @@ enum v4l2_auto_focus_range {
> >  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
> >  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
> >
> > +#define V4L2_CID_LOCATION			(V4L2_CID_CAMERA_CLASS_BASE+34)
> > +#define V4L2_LOCATION_FRONT			(0 << 0)
> > +#define V4L2_LOCATION_BACK			(1 << 0)
> > +
> >  /* FM Modulator class control IDs */
> >
> >  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> >
>

--ipri7ukjihz5d7ak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1VYzEACgkQcjQGjxah
VjyXGg//TtjdcaQodf+iq7So6at1omA6DRghCTKwiwhy/mXsNnNp6O3SHF42nFsU
3Mv9EBaYdzpcmaASPMiT82hxUufOT16IOVQ1L/bBs+/JHnVv0fPtw0LbmuVPIQwD
gzGHQDKRkgzCzcp54oodPZ9UvtEvxRyUWU/GEzmewd8QTa5kccKEj9+VYPHrRhoz
SLXzVXSj6ux5kQOvnv9Ys3a3k3EVXhEnNAGvq5kYLohvhlFeI46rQJoSZYsFOfpx
aFLxfcoRYhOU33LEFLiOykQsIPzUyRMkzbfPOkLUSSUlgFjF8g2tAkusdOWGtU4Q
KGd9XF4u51zc2O/nUAb0dWjgSOCmALq/Gn6hwH4rFV1pj0m9kfALYOJCwoMpCFrF
pwxK6sVPkYRrihMz3t0aEEV6iPei9z06S5Ri7hGT+xlE6nfwn2MRy1Biia+NN95Y
y/AJx9KzSQKba2idsSXMXYBakFJah5p5RnJhIxE1WZef0e0fdTiXnQKp9lvFhA82
Q9s/48w/bQ2xMyM8A7G8z4NOoxeGeQEfFkytSiR2jxW9cgleDc63zVvwQdUBU+ZW
4Doso5lGdaUBlkv84HqCAknKF3sQOcMEmpe40eDxYswJ7cTiR2h5bw3ur1VwPhRP
eIBta5yHl9GShlIXTG5jaSLXIMHp8ZKScISLWuNl0y86ETm+JnM=
=UjlD
-----END PGP SIGNATURE-----

--ipri7ukjihz5d7ak--
