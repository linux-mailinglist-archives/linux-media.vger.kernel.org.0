Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9500C8EC16
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 14:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730497AbfHOM5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 08:57:00 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:40495 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfHOM5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 08:57:00 -0400
Received: from uno.localdomain (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id E2778240007;
        Thu, 15 Aug 2019 12:56:55 +0000 (UTC)
Date:   Thu, 15 Aug 2019 14:58:22 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190815125822.ik6mlcaolxdyhyd6@uno.localdomain>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fo4e5w67urwfcyy2"
Content-Disposition: inline
In-Reply-To: <20190814224340.GD5015@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fo4e5w67urwfcyy2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Aug 15, 2019 at 01:43:40AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, Aug 14, 2019 at 10:28:12PM +0200, Jacopo Mondi wrote:
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
>
> Maybe V4L2_CID_CAMERA_SENSOR_LOCATION ? Same for the values below.
>
> > +    This read-only control describes the camera location by reporting its
>
> Here too I would mention camera sensor instead of just camera (or
> possibly imaging sensor).
>

Let's sort this out in the discussion on the dt property.

> > +    mounting position on the device where the camera is installed. This
> > +    control is particularly meaningful for devices which have a well defined
> > +    orientation, such as phones, laptops and portable devices as the camera
> > +    location is expressed as a position relative to the device intended
> > +    usage position. In example, a camera installed on the user-facing side
> > +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
> > +    position.
>
> The DT bindings could use such an example :-) I would extend this to
> tablets and laptops.

I could copy part of the text there and expand the example device
list.

>
> > +
> > +
> > +
>
> Do we need three blank lines ?
>

I don't know :) I copied this style from the other tables in the file.
There doesn't seem to a requirement about this, I just tried to keep
the style consistent :)

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
>
> --
> Regards,
>
> Laurent Pinchart

--fo4e5w67urwfcyy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1VVu4ACgkQcjQGjxah
Vjwveg/+JKy6+TrvF1i7DUeIFc2WRXtrmT4PHKMFySy6A1AaMdKNyuES2s/GD1Vn
JdtbhCaWZ2Lo7WXRbx1xNJlDLfGUPx55raR/G8JuRRaBdR1PYt6S1bjpDXlNLkCn
CeBdL379wxhbHuAal4mZoXW9iMlRj4WVco+K2DpdSwQULbeq9zisBWTwV32j9ArS
kT+9Wikaeu4rTieHRkbZb3prIyyEaCRnhorFYXVk4vrpjJ4M0ksfSCF9Trj19FP4
Qa/twQVHWXPksbNEoLUDgV4nUK4PPFoUiY1Vo68EpuSO0IlUsHsPJ6aOCPxjEuE/
yrvbgbjCzC+oqbmfyaunWzkrxkAPAFYutLFjnzTUJ3m15KXd5VdA8mycVk7pxee8
vTlpQ7h0U/zJVkQGgw8IjFOh1bw6ssq01YN88g/Z5jHdEqs2e4SX3gPxkSUw5Z/b
TMYJJ48aqxvekt+h7p91lpDJxdIM/0PhTCPftSynX8jx7BH40i8NdnOMqIoSlk2f
e9DcZSE/NaL3/kgJAoOv3trwjd3xOPBD4Q2qsGksu0Vej5jL1ss32zlNFpffiCs9
Echpa4m1HPfgTfCivjIOk3Gdl9pQSmHvA2k64Kyg4BPzqI+lPRM0UbnO3gzGd1YU
b1iOZB/L6SPKIRyw72ewQ1tps1+kozDTAOZHbAnDDrBoNHwkA8Q=
=geG3
-----END PGP SIGNATURE-----

--fo4e5w67urwfcyy2--
