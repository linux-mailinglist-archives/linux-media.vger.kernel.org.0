Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6A9BCBDA
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 17:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390477AbfIXPvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 11:51:42 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34015 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390614AbfIXPvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 11:51:42 -0400
X-Originating-IP: 213.45.248.89
Received: from uno.localdomain (host89-248-dynamic.45-213-r.retail.telecomitalia.it [213.45.248.89])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B68DF6000A;
        Tue, 24 Sep 2019 15:51:37 +0000 (UTC)
Date:   Tue, 24 Sep 2019 17:53:17 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 04/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
Message-ID: <20190924155317.nd7f5bp2ey2rkb54@uno.localdomain>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-5-jacopo@jmondi.org>
 <549569c7-64bd-f6bd-30f6-e0fe27687780@xs4all.nl>
 <20190913184906.6tpl374n4anzja5c@uno.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="okq6vozo6yankmca"
Content-Disposition: inline
In-Reply-To: <20190913184906.6tpl374n4anzja5c@uno.localdomain>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--okq6vozo6yankmca
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

On Fri, Sep 13, 2019 at 08:49:06PM +0200, Jacopo Mondi wrote:
> Hi Hans,
>
> On Fri, Sep 13, 2019 at 04:02:45PM +0200, Hans Verkuil wrote:
> > On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> > > Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> > > control. The newly added read-only control reports the camera device
> > > mounting rotation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  .../media/uapi/v4l/ext-ctrls-camera.rst       | 117 ++++++++++++++++++
> > >  1 file changed, 117 insertions(+)
> > >
> > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > > index f879dcc9409c..74991522ca3a 100644
> > > --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > > @@ -542,6 +542,123 @@ enum v4l2_scene_mode -
> > >
> > >
> > >
> > > +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> > > +    This read-only control describes the sensor orientation expressed as
> > > +    rotation in counterclockwise degrees along the axis perpendicular to the
> > > +    device mounting plane, and directed away from the sensor lens. Possible
> > > +    values for the control are 90, 180 and 270 degrees. To compensate the device
> >
> > compensate -> compensate for
> >
> > > +    mounting rotation on the captured images, a rotation of the same amount of
> > > +    degrees, in the same counterclockwise rotation direction should be applied
> > > +    along the axis directed from the observer to the captured image when
> > > +    displayed on a screen.
> >
> > Is this right? Shouldn't that be "in the clockwise direction"? If the sensor is
> > mounted 90 degrees counterclockwise, then I need to rotate by 90 degrees clockwise
> > to compensate for that, right?
> >
>
> It really depend along which axis direction you are applying the mounting
> rotation and the compensation rotation... See below...
>
> > > +
> > > +    To better understand the effect of the sensor rotation on the acquired
> > > +    images when displayed on a screen, it is helpful to consider a fictional
> > > +    scan-out sequence of the sensor's pixels, assuming the pixel array having
> > > +    its top-left pixel at position (0, 0) with values on the 'x' axis increasing
> > > +    towards the right direction, and values on the 'y' axis increasing towards
> > > +    the bottom. The effect of sensor rotation could be easily visualized
> > > +    considering the sequence of captured pixels.
> > > +
> > > +    Assuming the following scene has to be captured::
> > > +
> > > +                o
> > > +               -|-
> > > +               / \
> > > +
> > > +    An upright mounted sensor has its pixel array displaced as follow::
> > > +
> > > +                                      x
> > > +            (0,0)---------------------->
> > > +              ! 0,0 0,1 0,2 ... 0,line-len
> >
> > Isn't that 0,0 ... 0,num-col?
>
> Yes indeed sorry
>
> > line-len is a weird name, shouldn't that be num-lines?
> >
> > line-len sounds like it is the same as num-col.
> >
> > I'm totally confused.
> >
>
> num-col is totally wrong, that should have been num-lines
>
> In general
> s/line-len/num-col
> s/num-col/num-lines
>
> > > +              ! 1,0 1,1 1,2 ...
> > > +              ! ...
> > > +              ! ...
> > > +              ! (num-col,0)...  (num-col,line-len)
> > > +            y V
> > > +
> > > +
> > > +    Assuming pixels are scanned out from (0,0) to (num-col,line-len)
> > > +    progressively::
> > > +
> > > +             (0,0) ---->-------------> (0,line-len)---!
> > > +             !------------------------------------<a--!
> > > +             V
> > > +             (1,0) ---->-------------> (1,line-len)---!
> > > +             !------------------------------------<---!
> > > +             V
> > > +             (...) .-->--------------> ( ,,,, )    ---!
> > > +             !------------------------------------<---!
> > > +             V
> > > +             (num-col,0)------------->(num-col,line-len)
> > > +
> > > +
> > > +    If a rotation of 90 degrees counterclockwise along the axis perpendicular to
> > > +    the sensor's lens and directed towards the scene to be captured is applied
> > > +    to the sensor, the pixel array would then be rotated as follows::
> > > +
> > > +            x ^  0,line-len,,,(num-col,line-len
> > > +              !  ....
> > > +              !  0,2 1,2      ...
> > > +              !  0,1 1,1      ...
> > > +              !  0,0 1,0 ... num-col,0
> > > +             (0,0)------------------------>
> > > +                                   y
> > > +
> > > +    And the pixel scan-out sequence would then proceed as follows::
> > > +
> > > +            (0,line-len)            (num-cols,line-len)
> > > +                 ^\    ^\    ^\    ^\    ^
> > > +                 ! \   ! \   ! \   ! \   !
> > > +                 !  \  !  \  !  \  !  \  !
> > > +                 !   \ !   \ !   \ !   \ !
> > > +                 !    \!    \!    \!    \!
> > > +               (0,0)  (1,0) ....      (num-cols,0)
> > > +
> > > +    Which when applied to the capture scene gives::
> > > +
> > > +            (0,line-len)            (num-cols,line-len)
> > > +                ^\    ^\    ^\    ^\    ^
> > > +                ! \   ! \   0 \   ! \   !
> > > +                !  \  !  \ -|- \  !  \  !
> > > +                !   \ !    / \  \ !   \ !
> > > +                !    \!    \!    \!    \!
> > > +              (0,0)  (1,0) ....      (num-cols,0)
> > > +
> > > +    Producing the following image once captured to memory and
> > > +    displayed to the user::
> > > +
> > > +             \ !
> > > +               --0
> > > +             / !
> > > +
> > > +    Which has a rotation of the same amount of degrees applied on the opposite
> > > +    rotation direction along the axis that goes from the observer to the
> > > +    displayed image.
> > > +
> > > +    In order to compensate the sensor mounting rotation, when expressed
> > > +    as counterclockwise rotation along the axis directed from the sensor to
> > > +    the captured scene, a rotation of the same amount of degrees in the
> > > +    same counterclockwise rotation direction but applied along the axis
> > > +    directed from the observer to the captured image, has to be applied.::
> >
> > .:: -> :
> >
>
> Don't I need the :: to mark the following block of text as verbatim ?
>
> > > +
> > > +                -------   90 degree counterclockwise
> > > +                |   o  |  mounting rotation applied
> > > +                |  -|- |  along the axis directed
> > > +                |  / \ |  away from the sensor lens
> > > +                -------
> > > +                -------
> > > +                | \ !  |  Resulting captured
> > > +                |  --0 |  image when displayed
> > > +                | / !  |  on screen
> > > +                -------
> >
> > Trying this with my webcam turning it 90 degrees counterclockwise, I
> > and up with my head to the left, not to the right.
> >
>
> Along which axis direction are you rotating the camera counterclockwise ?
>
> If you see your face, and you rotate the camera counterclockwise while
> looking at it, you're actually rotating along the axis directed -towards-
> the sensor.
>
> The rotation here in the example and in the 'rotation' property
> description has to be applied along the axis pointing aways from the
> sensor, so what you're actually doing is rotating clockwise along that
> direction (I guess)... So yes, to compensate that, you need to rotate
> clockwise when you look at the image on the screen... Confusing,
> right?
>

Does it work for you? Can I send a new iteration with your comments on
the previous patches taken in ?

Thanks
  j

> > > +                -------
> > > +                |   o  |  Rotation compensation
> > > +                |  -|- |  is 90 degrees counterclockwise
> > > +                |  / \ |  along the axis directed to the
> > > +                -------   displayed image
> > > +
> > > +
> > >  .. [#f1]
> > >     This control may be changed to a menu control in the future, if more
> > >     options are required.
> > >
> >
> > Regards,
> >
> > 	Hans



--okq6vozo6yankmca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2KO+0ACgkQcjQGjxah
Vjx2HQ//bXcwyB+j1yKdxWSnGf0ryFMaRAp+YF2/c8jzK6NW5ggKETILRL/Yke5U
8ZULrpNDO2Hnug9FT/v5dIU6NWAx4aj5QB9dEbxCIJeUORRrGAmyAW3ZP+ro7CrL
bChn/gYLNwwpFYzjnD7GX076aPME3oKAnrVH68VjdOJzSyAYiWyTpirwxEhBED1K
DAZd/x8VFAIIIN4JXx99/OF72BjZoq+4GWnsqgfmuRlSWjTAbPUTQPlhmeCyWsqZ
mRj9jVZ8xFCOgqrFLFoDOEgTkjnd0SGOaixXUs3EHhtvrFnHigtTuoO4/aLXWHvy
UXQfS4cUcKGvbicVftEpVAs9rseWRuqHuwFkKOuhIGmjXOgNiSWzDPgo0omue8tY
GQ+LwmnV46xwigN6x4YXY5tPIAaXcF093WoT1n8/dCjCx1mqyLSV7hregABcMlZU
+AiXax1Lu7QL7xfjKfzYHiqouAn5/7H5oOKOgFk3ItS5PEvSFlDCsDY6KbP61E2r
21A+JFfdkWKNUl8LHsQep+HPy3NmavXVrshoJzMUbLy3p7yhxTLHQK3IU9Z69t36
If3/85xDDnQGJkYOAeewKDf4qsx/FRwXodx0FHO1sS40ZEOFoqhL84EobUu0BnX5
suwHmEVfn5bwPKqQPsq1Mtw9Rb1sKDVtBNT6O1jtiwOWnkGNDyI=
=HcLT
-----END PGP SIGNATURE-----

--okq6vozo6yankmca--
