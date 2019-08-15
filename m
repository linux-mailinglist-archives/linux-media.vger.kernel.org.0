Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F758ED91
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732651AbfHOOAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:00:39 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:43583 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731849AbfHOOAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:00:39 -0400
Received: from uno.localdomain (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3D899240006;
        Thu, 15 Aug 2019 14:00:35 +0000 (UTC)
Date:   Thu, 15 Aug 2019 16:02:01 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190815140201.esdcv4vl7hdzkk4h@uno.localdomain>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <02b40da5-c30c-f1f3-2351-c04da932e94a@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uzp5e4rqcbnkjq7e"
Content-Disposition: inline
In-Reply-To: <02b40da5-c30c-f1f3-2351-c04da932e94a@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--uzp5e4rqcbnkjq7e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

On Thu, Aug 15, 2019 at 03:30:59PM +0200, Hans Verkuil wrote:
> On 8/14/19 10:28 PM, Jacopo Mondi wrote:
> > Add documentation for the V4L2_CID_LOCATION camera control. The newly
> > added read-only control reports the camera device mounting position.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > index 51c1d5c9eb00..fc0a02eee6d4 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
> >      value down. A value of zero stops the motion if one is in progress
> >      and has no effect otherwise.
> >
> > +``V4L2_CID_LOCATION (integer)``
> > +    This read-only control describes the camera location by reporting its
> > +    mounting position on the device where the camera is installed. This
> > +    control is particularly meaningful for devices which have a well defined
> > +    orientation, such as phones, laptops and portable devices as the camera
> > +    location is expressed as a position relative to the device intended
> > +    usage position. In example, a camera installed on the user-facing side
> > +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
> > +    position.
>
> When should this control be created? If there is only one location (e.g.
> all sensors are front-facing) would you still expose this? Or does it depend
> on the type of device?

If it's meaningful for the device, the location might be reported even
if there's only a single camera in the system.

>
> And is the sensor in a digital camera front or back facing? (Just curious
> about what you think about that situation!)

I would say it really depends on the device type. For a digital camera
like a webcam, defining what's front or back doesn't add much value.
Wherever the camera sensor is oriented to, that's the front :)

The same way, image sensor connected through long cables to the
remotely located base board (I'm thinking about cameras installed in
cars and connected by coax cables) will hardly have a position
defined in the mainline board DTS file, but if someone would like to add
"rearview-mirror" to the list of position and use them in their DTS
for whatever reason, this control gives a way to retrieve the
information easily.

I tried to convey this mentioning the "intended usage orientation" of
the device, to give the idea that the position is totally dependent
on the nature of the device the sensor is installed on. As said, it's
easy to define what "front" is for a smartphone, not so easy for a
camera in a car. But I would not tie themselves to device specific
detail, but instead focus on providing a meachanism to make easy to
expose them. In mainline, we could start with very simple "back" and
"front" position, and then grow them when the need arises.

>
> Regards,
>
> 	Hans
>
> > +
> > +
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +
> > +    * - ``V4L2_LOCATION_FRONT``
> > +      - The camera device is located on the front side of the device.
> > +    * - ``V4L2_LOCATION_BACK``
> > +      - The camera device is located on the back side of the device.
> > +
> > +
> > +
> >  .. [#f1]
> >     This control may be changed to a menu control in the future, if more
> >     options are required.
> > --
> > 2.22.0
> >
>

--uzp5e4rqcbnkjq7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1VZdkACgkQcjQGjxah
Vjx/cBAAmPTWGBuNkSQyn422PSU5Bf0ufZEr+U7lD8rZCAsJY3FEThUOBW0pBq+B
mmGWE8xvb1tISDHzLVcIVkMGhcgCbjemhlnBD1BnxHa1rDNxrPSWbPfIwv0md6+C
ViFmYLPzKudBdj7w6ya67gWm3Sct+rxyZpZp3TVtIiGSXrs9k4EDEMlgujitgJcY
WDBRZuvNZlMxq/TuY/8CBUEZmFeE1Lboq5aVUBzXPCvx36z/0RASEcdWtM3JLF2v
vGdckQJ5Ropx+cAun3/vERxsnNp3WAlVBvj5PayF6mX0UrWSAOEIrJQUooaf7SF5
0j7YjXm+pdmYELnAq2DOoEbpuVJFyeQItSlN8UzQJ3eBJl4rjhbPiN9h3yW5jODi
mJ69XvzRwIEZthbZCpvjrZKtT8uf7hN76Oi49enXhQVqkvRQWktBXcsOK38zuQ5B
keVlk6A7/bd605t87GDeTm3IGffBTYRQ5U7/Q/kAM+gF67R+YWZ4MwN1TRSvnwUl
98JA2df7dEZYczm0NQyTHwnL6fQMN6pUj6o8O6l3cGuwHzD53W/fJQsoglgzpd4r
AZTw+tqQKOlfC9I32ECl7B69W4BIK7YcatHENcO/Z7+9wmkZz46qM7+bDv8F4jdw
roy+kyFkRc/LJuaj0MRDzQMDXY3oFLcjLTdV/MuQUOQu6OBt0mk=
=y+sZ
-----END PGP SIGNATURE-----

--uzp5e4rqcbnkjq7e--
