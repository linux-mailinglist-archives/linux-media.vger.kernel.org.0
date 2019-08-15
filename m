Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4FE8EE49
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731795AbfHOOdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:33:00 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:42981 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729668AbfHOOdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:33:00 -0400
Received: from uno.localdomain (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id CE3A9240006;
        Thu, 15 Aug 2019 14:32:56 +0000 (UTC)
Date:   Thu, 15 Aug 2019 16:34:23 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190815143423.vaoswb4jvzd2blxp@uno.localdomain>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
 <664fe7b3-9051-30da-736e-710a4e9cecde@xs4all.nl>
 <d60e4664-3a3f-1723-6c96-4fc822b6a7bb@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fixbluj3hgdhxc76"
Content-Disposition: inline
In-Reply-To: <d60e4664-3a3f-1723-6c96-4fc822b6a7bb@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fixbluj3hgdhxc76
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

On Thu, Aug 15, 2019 at 04:14:38PM +0200, Hans Verkuil wrote:
> On 8/15/19 4:10 PM, Hans Verkuil wrote:
> > On 8/15/19 12:43 AM, Laurent Pinchart wrote:
> >> Hi Jacopo,
> >>
> >> Thank you for the patch.
> >>
> >> On Wed, Aug 14, 2019 at 10:28:12PM +0200, Jacopo Mondi wrote:
> >>> Add documentation for the V4L2_CID_LOCATION camera control. The newly
> >>> added read-only control reports the camera device mounting position.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>> ---
> >>>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
> >>>  1 file changed, 23 insertions(+)
> >>>
> >>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>> index 51c1d5c9eb00..fc0a02eee6d4 100644
> >>> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> >>> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
> >>>      value down. A value of zero stops the motion if one is in progress
> >>>      and has no effect otherwise.
> >>>
> >>> +``V4L2_CID_LOCATION (integer)``
> >>
> >> Maybe V4L2_CID_CAMERA_SENSOR_LOCATION ? Same for the values below.
> >
> > Probably a better name, if a bit long. But we might need other location
> > controls in the future (e.g. flash location), so CID_LOCATION is just too
> > generic.
>

Thanks for the feedback.

> Note that the location defines themselves can most likely be used with any
> LOCATION control, so V4L2_LOCATION_FRONT would be fine with any control.
>

What do you think instead of the control type? Would a single integer
control do or an integer menu one would be better? I see merit in both
proposals actually...

Once this is clarified, I can send a proper v1.

Thanks
  j

> Regards,
>
> 	Hans
>
> >
> > Regards,
> >
> > 	Hans
> >
> >>
> >>> +    This read-only control describes the camera location by reporting its
> >>
> >> Here too I would mention camera sensor instead of just camera (or
> >> possibly imaging sensor).
> >>
> >>> +    mounting position on the device where the camera is installed. This
> >>> +    control is particularly meaningful for devices which have a well defined
> >>> +    orientation, such as phones, laptops and portable devices as the camera
> >>> +    location is expressed as a position relative to the device intended
> >>> +    usage position. In example, a camera installed on the user-facing side
> >>> +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
> >>> +    position.
> >>
> >> The DT bindings could use such an example :-) I would extend this to
> >> tablets and laptops.
> >>
> >>> +
> >>> +
> >>> +
> >>
> >> Do we need three blank lines ?
> >>
> >>> +.. flat-table::
> >>> +    :header-rows:  0
> >>> +    :stub-columns: 0
> >>> +
> >>> +    * - ``V4L2_LOCATION_FRONT``
> >>> +      - The camera device is located on the front side of the device.
> >>> +    * - ``V4L2_LOCATION_BACK``
> >>> +      - The camera device is located on the back side of the device.
> >>> +
> >>> +
> >>> +
> >>>  .. [#f1]
> >>>     This control may be changed to a menu control in the future, if more
> >>>     options are required.
> >>
> >
>

--fixbluj3hgdhxc76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1VbW8ACgkQcjQGjxah
VjyARQ/+Mz9rvMdvMsyusC3DTUqrvRKQL6Fqjb9FJWy2lR184bCc8/Z6ocreqs+p
JDbXdSyDkDP4TaXcoz70xsLOiWUdPCR4Vr2SKNRffqCO+idS9BzK8uYu6pR4KnIz
AveQ9A2onENTf5CNUg3sodDAuMXHk1LDGX0gI+l6kDHtOc/4sG6H0rOoeDQ67sFP
MDeWk93Tnr+xet+q2wmKIP7EJrQTwVgt6Ovc2cBl9af798dTyIShYnmO4Gzi7ixH
sGhoa4X7xpJtPnHb0zGvYszit0E4xP4maNp9kPahcFFSiwsClToDloj1SjhXnJJ6
2ff8iKpuTWIDOj6jVtad8gmy6GdUvk671VopwtC1EQO0mmKnmXus55EKjKRJFWnb
fGwBj4u/nVHQ4zYoniUsiW868TXZC/v5r2pAaxaVscpquR0s1FoGnQE//w7cn96y
xYRRRZ4CXuGVXSgEX8lZTAtsQO8RrsPawyh1yyOAx2K3AX/n9y0Y+Rj9ZP/HSIjD
hbrVSgI3DCFdd4cPaAmjQguVQDcE5jto6pGtLuCTB2oAw6ejhPWRl9HPc9BAwFAB
RokMl5MKS4PRuSoV5BFHKb+Gju5WxiM9M77hzmoYSjooF+W7BNKw4uyH175Br2X/
doOiWAEEGEliKsYQnTFBrs2XJkf0LDdwNX55LVPEmzplTHss/+w=
=2ECY
-----END PGP SIGNATURE-----

--fixbluj3hgdhxc76--
