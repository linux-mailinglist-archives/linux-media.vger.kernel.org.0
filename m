Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38966A54B0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 13:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730599AbfIBLTT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 07:19:19 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51789 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729805AbfIBLTT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 07:19:19 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1E9851BF207;
        Mon,  2 Sep 2019 11:19:15 +0000 (UTC)
Date:   Mon, 2 Sep 2019 13:20:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
Message-ID: <20190902112049.uwnawj5rm3tk4eqe@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-4-jacopo@jmondi.org>
 <20190827125132.GU5054@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xprsf7t2ure76bpd"
Content-Disposition: inline
In-Reply-To: <20190827125132.GU5054@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xprsf7t2ure76bpd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

HI Laurent,
On Tue, Aug 27, 2019 at 03:51:32PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 27, 2019 at 11:23:29AM +0200, Jacopo Mondi wrote:
> > Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> > control. The newly added read-only control reports the camera device
> > mounting rotation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > index ecf151f3f0f4..03d1c23d18f7 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > @@ -544,6 +544,15 @@ enum v4l2_scene_mode -
> >
> >
> >
> > +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> > +    This read-only control describes the camera sensor orientation by
> > +    reporting its mounting rotation in respect to the device intended usage
> > +    orientation, expressed in counter clockwise degrees. The control value is
>
> Counter clockwise relative to what ? :-)

I think it is expressed in the previous line:
"mounting rotation in respect to the device intended usage
orientation, expressed in counter clockwise degrees"

Would you prefer to have this re-phrased as:

This read-only control describes the camera sensor orientation
expressed as rotation in counter clockwise degrees in respect to
the device intended usage orientation.

?

>
> > +    constant and not modifiable by software and its value is retrieved from the
> > +    firmware interface by parsing the 'rotation' property. Typical values are 0
> > +    degrees for upright mounted sensors and 180 degrees for sensors mounted
> > +    upside down.
>
> Same comment as for 02/10 regarding how the value is known to the
> driver.
>
> > +
> >  .. [#f1]
> >     This control may be changed to a menu control in the future, if more
> >     options are required.
>
> --
> Regards,
>
> Laurent Pinchart

--xprsf7t2ure76bpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1s+xEACgkQcjQGjxah
VjxeoQ//fevBWy16WJTVRSRkTAkMsSLOyNHjJy/KWaBrK87TEotQ78oh/3QwUbAW
fvEEWEFzbtWrzi7wuSG1ZkwT1FNXMAP5w6tufYoabZmCWS1EIaA/+QyhSMHR4d+W
T4mOfWzrSqRY8tBGjnzt3OHyhKIAqN6rWn3XM9AgEmn4T6yplgTcG3myJcv06/V+
A3lEFOcDCiZEvY/cSuw5mVhcEwKBavJ0OZ24kE4U03I4vsRDVydgB+MHnJLhX7II
wkrkpr+m9xYWIp54o9xhKM++XoemT2MIfOSQ6WeNmWRR3Uz4BLRPlPPiauyPxy9w
kIwgzsE0/urrRcEM/QbrTbEQMywgbfThPrkgzn5C70LYCLgsa8c2auJktwqLjdRo
WLOfzRPt1Bot1js4FFKxh6uIz24lHPyoLKI4WLuRASw5SogDxxjN2XRFGBmDIc6y
/rvA/5NYecPmIIxDUzTnA4AyoYZT76MLSauW5WobqyMxBfehgeYHqXwMVUBh8+8w
PGSPbZKdf9ddiMm8Av6wgTyUi25RPuinbABX0PgbGu/0dzBgEUz9gZWgWuFDUC4s
0p6KUu1cdGmZrJCapEsrxSVDw7yw33J+q5kOJeH/CiE/5dQ1A4xqUBGul6K7axRo
Wg0Fd+E3TRKuBC3SNHYkvlKz4AJ4Xx6bA2upTz5OpwHB1B3QDqA=
=GWSq
-----END PGP SIGNATURE-----

--xprsf7t2ure76bpd--
