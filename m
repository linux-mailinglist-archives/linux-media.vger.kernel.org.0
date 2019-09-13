Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD16B255E
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 20:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389860AbfIMSrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 14:47:40 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:40947 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388709AbfIMSrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 14:47:39 -0400
Received: from uno.localdomain (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5D927100006;
        Fri, 13 Sep 2019 18:47:35 +0000 (UTC)
Date:   Fri, 13 Sep 2019 20:49:06 +0200
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
Message-ID: <20190913184906.6tpl374n4anzja5c@uno.localdomain>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-5-jacopo@jmondi.org>
 <549569c7-64bd-f6bd-30f6-e0fe27687780@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h4hemdfkk64y7qu3"
Content-Disposition: inline
In-Reply-To: <549569c7-64bd-f6bd-30f6-e0fe27687780@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--h4hemdfkk64y7qu3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

On Fri, Sep 13, 2019 at 04:02:45PM +0200, Hans Verkuil wrote:
> On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> > Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> > control. The newly added read-only control reports the camera device
> > mounting rotation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  .../media/uapi/v4l/ext-ctrls-camera.rst       | 117 ++++++++++++++++++
> >  1 file changed, 117 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > index f879dcc9409c..74991522ca3a 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > @@ -542,6 +542,123 @@ enum v4l2_scene_mode -
> >
> >
> >
> > +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> > +    This read-only control describes the sensor orientation expressed as
> > +    rotation in counterclockwise degrees along the axis perpendicular to the
> > +    device mounting plane, and directed away from the sensor lens. Possible
> > +    values for the control are 90, 180 and 270 degrees. To compensate the device
>
> compensate -> compensate for
>
> > +    mounting rotation on the captured images, a rotation of the same amount of
> > +    degrees, in the same counterclockwise rotation direction should be applied
> > +    along the axis directed from the observer to the captured image when
> > +    displayed on a screen.
>
> Is this right? Shouldn't that be "in the clockwise direction"? If the sensor is
> mounted 90 degrees counterclockwise, then I need to rotate by 90 degrees clockwise
> to compensate for that, right?
>

It really depend along which axis direction you are applying the mounting
rotation and the compensation rotation... See below...

> > +
> > +    To better understand the effect of the sensor rotation on the acquired
> > +    images when displayed on a screen, it is helpful to consider a fictional
> > +    scan-out sequence of the sensor's pixels, assuming the pixel array having
> > +    its top-left pixel at position (0, 0) with values on the 'x' axis increasing
> > +    towards the right direction, and values on the 'y' axis increasing towards
> > +    the bottom. The effect of sensor rotation could be easily visualized
> > +    considering the sequence of captured pixels.
> > +
> > +    Assuming the following scene has to be captured::
> > +
> > +                o
> > +               -|-
> > +               / \
> > +
> > +    An upright mounted sensor has its pixel array displaced as follow::
> > +
> > +                                      x
> > +            (0,0)---------------------->
> > +              ! 0,0 0,1 0,2 ... 0,line-len
>
> Isn't that 0,0 ... 0,num-col?

Yes indeed sorry

> line-len is a weird name, shouldn't that be num-lines?
>
> line-len sounds like it is the same as num-col.
>
> I'm totally confused.
>

num-col is totally wrong, that should have been num-lines

In general
s/line-len/num-col
s/num-col/num-lines

> > +              ! 1,0 1,1 1,2 ...
> > +              ! ...
> > +              ! ...
> > +              ! (num-col,0)...  (num-col,line-len)
> > +            y V
> > +
> > +
> > +    Assuming pixels are scanned out from (0,0) to (num-col,line-len)
> > +    progressively::
> > +
> > +             (0,0) ---->-------------> (0,line-len)---!
> > +             !------------------------------------<a--!
> > +             V
> > +             (1,0) ---->-------------> (1,line-len)---!
> > +             !------------------------------------<---!
> > +             V
> > +             (...) .-->--------------> ( ,,,, )    ---!
> > +             !------------------------------------<---!
> > +             V
> > +             (num-col,0)------------->(num-col,line-len)
> > +
> > +
> > +    If a rotation of 90 degrees counterclockwise along the axis perpendicular to
> > +    the sensor's lens and directed towards the scene to be captured is applied
> > +    to the sensor, the pixel array would then be rotated as follows::
> > +
> > +            x ^  0,line-len,,,(num-col,line-len
> > +              !  ....
> > +              !  0,2 1,2      ...
> > +              !  0,1 1,1      ...
> > +              !  0,0 1,0 ... num-col,0
> > +             (0,0)------------------------>
> > +                                   y
> > +
> > +    And the pixel scan-out sequence would then proceed as follows::
> > +
> > +            (0,line-len)            (num-cols,line-len)
> > +                 ^\    ^\    ^\    ^\    ^
> > +                 ! \   ! \   ! \   ! \   !
> > +                 !  \  !  \  !  \  !  \  !
> > +                 !   \ !   \ !   \ !   \ !
> > +                 !    \!    \!    \!    \!
> > +               (0,0)  (1,0) ....      (num-cols,0)
> > +
> > +    Which when applied to the capture scene gives::
> > +
> > +            (0,line-len)            (num-cols,line-len)
> > +                ^\    ^\    ^\    ^\    ^
> > +                ! \   ! \   0 \   ! \   !
> > +                !  \  !  \ -|- \  !  \  !
> > +                !   \ !    / \  \ !   \ !
> > +                !    \!    \!    \!    \!
> > +              (0,0)  (1,0) ....      (num-cols,0)
> > +
> > +    Producing the following image once captured to memory and
> > +    displayed to the user::
> > +
> > +             \ !
> > +               --0
> > +             / !
> > +
> > +    Which has a rotation of the same amount of degrees applied on the opposite
> > +    rotation direction along the axis that goes from the observer to the
> > +    displayed image.
> > +
> > +    In order to compensate the sensor mounting rotation, when expressed
> > +    as counterclockwise rotation along the axis directed from the sensor to
> > +    the captured scene, a rotation of the same amount of degrees in the
> > +    same counterclockwise rotation direction but applied along the axis
> > +    directed from the observer to the captured image, has to be applied.::
>
> .:: -> :
>

Don't I need the :: to mark the following block of text as verbatim ?

> > +
> > +                -------   90 degree counterclockwise
> > +                |   o  |  mounting rotation applied
> > +                |  -|- |  along the axis directed
> > +                |  / \ |  away from the sensor lens
> > +                -------
> > +                -------
> > +                | \ !  |  Resulting captured
> > +                |  --0 |  image when displayed
> > +                | / !  |  on screen
> > +                -------
>
> Trying this with my webcam turning it 90 degrees counterclockwise, I
> and up with my head to the left, not to the right.
>

Along which axis direction are you rotating the camera counterclockwise ?

If you see your face, and you rotate the camera counterclockwise while
looking at it, you're actually rotating along the axis directed -towards-
the sensor.

The rotation here in the example and in the 'rotation' property
description has to be applied along the axis pointing aways from the
sensor, so what you're actually doing is rotating clockwise along that
direction (I guess)... So yes, to compensate that, you need to rotate
clockwise when you look at the image on the screen... Confusing,
right?

> > +                -------
> > +                |   o  |  Rotation compensation
> > +                |  -|- |  is 90 degrees counterclockwise
> > +                |  / \ |  along the axis directed to the
> > +                -------   displayed image
> > +
> > +
> >  .. [#f1]
> >     This control may be changed to a menu control in the future, if more
> >     options are required.
> >
>
> Regards,
>
> 	Hans

--h4hemdfkk64y7qu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl175KIACgkQcjQGjxah
VjwN+g/8CHkAzMxkyGtlGockikO9EpodchVygZNtC0JDtzvEKLQjXUxKZsP5rfa8
xIqaWebTwJO33rW3VFjcsV6+iA8BKlooaHwy9ydXMhwi6RdQiDY5ILHo325CcnvM
xZBHl6f/Qv6YVF2wvvyvu9NjEp1ALFPegtc3znuCXSF2a0dR4cp+s3IjEU/6fUf7
UdDvMqcdpGy5SaosclKdVkWCsuu1PU/WuFxcr2QyR47qgUWIsc4pYnEs5uFE5Se5
FzeZjBYqIzw6usuL7YxXw91WQMkJt9VmTzcTnSgD2G6CjF2kqKA2BvtUuB376ZJt
xj41StIOvFDtaNw2EKtAXsvs2HBRnzVzdXspkBPHvdB82sUVahV5pBBrSGIXyq13
cz5sAmJJi4yahi7Pm+e46o2n5R0XmxjB4mgauf9s8XhOkMuwo06A0wsLNDxXgo7r
Pnrq0QsjbvmQvk4m1wanDHkvBsNSHpS9y3m6h8q7dtNTv0uhZpcoUCAbKyO7T2In
sKRwpVnkQehnx+gPd+BefzrochbZlpL7tS3Vy0YgUQphj5p+W1K/8B3AaKDiz5rb
K7DGAX3bgF74F8mAvS6usHz+4qGS3xSIoIjYiyN4wPgdI/mE8EXJGsGU6HHZn7q9
GFZql59FLOeKf+hljU2L+ziqFdVzwj9sXzzs/+crqGD3ZeaOj/w=
=ZHHH
-----END PGP SIGNATURE-----

--h4hemdfkk64y7qu3--
