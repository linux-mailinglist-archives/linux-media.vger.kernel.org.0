Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 761F8A6CCB
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 17:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbfICPVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 11:21:12 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38755 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729630AbfICPVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 11:21:12 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2BF511BF218;
        Tue,  3 Sep 2019 15:21:07 +0000 (UTC)
Date:   Tue, 3 Sep 2019 17:22:35 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomasz Figa <tfiga@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
Message-ID: <20190903152235.iw72hxka7kpf25s6@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-4-jacopo@jmondi.org>
 <20190827125132.GU5054@pendragon.ideasonboard.com>
 <20190902112049.uwnawj5rm3tk4eqe@uno.localdomain>
 <20190902164315.GE12197@pendragon.ideasonboard.com>
 <CAAFQd5CTn_6gDZL+kxN=112JW1tRSXo2PG1-twgnYycb0uGPYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fglqki24nxibynuv"
Content-Disposition: inline
In-Reply-To: <CAAFQd5CTn_6gDZL+kxN=112JW1tRSXo2PG1-twgnYycb0uGPYA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fglqki24nxibynuv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Tomasz, Laurent

On Tue, Sep 03, 2019 at 01:16:21PM +0900, Tomasz Figa wrote:
> On Tue, Sep 3, 2019 at 1:43 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Jacopo,
> >
> > On Mon, Sep 02, 2019 at 01:20:49PM +0200, Jacopo Mondi wrote:
> > > On Tue, Aug 27, 2019 at 03:51:32PM +0300, Laurent Pinchart wrote:
> > > > On Tue, Aug 27, 2019 at 11:23:29AM +0200, Jacopo Mondi wrote:
> > > >> Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> > > >> control. The newly added read-only control reports the camera device
> > > >> mounting rotation.
> > > >>
> > > >> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > >> ---
> > > >>  Documentation/media/uapi/v4l/ext-ctrls-camera.rst | 9 +++++++++
> > > >>  1 file changed, 9 insertions(+)
> > > >>
> > > >> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > > >> index ecf151f3f0f4..03d1c23d18f7 100644
> > > >> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > > >> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> > > >> @@ -544,6 +544,15 @@ enum v4l2_scene_mode -
> > > >>
> > > >>
> > > >>
> > > >> +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> > > >> +    This read-only control describes the camera sensor orientation by
> > > >> +    reporting its mounting rotation in respect to the device intended usage
> > > >> +    orientation, expressed in counter clockwise degrees. The control value is
> > > >
> > > > Counter clockwise relative to what ? :-)
> > >
> > > I think it is expressed in the previous line:
> > > "mounting rotation in respect to the device intended usage
> > > orientation, expressed in counter clockwise degrees"
> > >
> > > Would you prefer to have this re-phrased as:
> > >
> > > This read-only control describes the camera sensor orientation
> > > expressed as rotation in counter clockwise degrees in respect to
> > > the device intended usage orientation.
> > >
> > > ?
> >
> > Rotation is expressed in degrees around an axis, which is itself
> > expressed as a vector. It's pretty intuitive that the rotation vector
> > should be perpendicular to the plane of the sensor (which itself should
> > be parallel to the plane of the device side on which it is mounted, as
> > expressed by the location property), but there are still two possible
> > directions for the vector, facing in the same direction as the sensor or
> > the opposite direction. Unless there's a good reason to do so, I would
> > use the same direction as the one defined by Android. I don't know what
> > direction that is though :-)

What about:
   This read-only control describes the sensor orientation
   expressed as rotation in counterclockwise degrees along the axis
   perpendicular to the device mounting reference plane, assuming a
   canonical right-handed orientation with the y axis being positive
   towards the system's top and negative towards the bottom, and the
   axis directed pointing away from the sensor lens. Possible values
   for the control are 90, 180 and 270 degrees. To compensate the
   device mounting rotation on the captured images, a rotation of
   the same amount of degrees, in the same counterclockwise rotation
   direction should be applied along the axis directed from the
   observer to the captured image when displayed on a screen

This is for the control, while the 'rotation' DT property is simply
documented as:

- rotation: The device, typically an image sensor, is not mounted upright,
  but a number of degrees counter clockwise. Typical values are 0 and 180
  (upside down).

I would expand it with a description of the effects of rotation on
captured images and how that should be compensated.

Let me have some ascii-art fun:
-------------------------------------------------------------------------------

  To understand the effect of the sensor rotation on the acquired
  images, it is helpful to consider a fictional scan-out sequence of
  the sensor's pixels.

  Assuming the pixel array having its top-left pixel at position (0,
  0) with x increasing towards the right direction, and y increasing
  towards the bottom direction, the effect of sensor rotation could be
  easily visualized considering the sequence of captured pixels.

  Assuming the following scene has to be captured

                o
               -|-
               / \

  An upright mounted sensor has its pixel array displaced as follows

                                 x
      (0,0)---------------------->
        ! 0,0 0,1 0,2 ... 0,line-len
        ! 1,0 1,1 1,2 ...
        ! ...
        ! ...
        ! (num-col,0)...  (num-col,line-len)
      y V


  Assuming pixels are scanned out from (0,0) to (num-col,line-len)
  progressively.

    (0,0) ------------------> (0,line-len)---!
      !------------------------------------<-!
      V
    (1,0) ------------------> (1,line-len)---!
      !------------------------------------<-!
      V
    (...) .-----------------> ( ,,,, )    ---!
      !------------------------------------<-!
      V
    (num-col,0)------------->(num-col,line-len)

  If a rotation of 90 degrees counterclockwise along the axis
  perpendicular to the sensor's lens and directed towards the scene
  to be captured is applied to the sensor, the pixel array would then
  be rotated as follows

      x ^  0,line-len,,,(num-col,line-len
        !  ....
        !  0,2 1,2      ...
        !  0,1 1,1      ...
        !  0,0 1,0 ... num-col,0
       (0,0)------------------------>
                                   y

   And the pixel scan-out sequence would then proceed as follows

   (0,line-len)            (num-cols,line-len)
        ^\    ^\    ^\    ^\    ^
        ! \   ! \   ! \   ! \   !
        !  \  !  \  !  \  !  \  !
        !   \ !   \ !   \ !   \ !
        !    \!    \!    \!    \!
      (0,0)  (1,0) ....      (num-cols,0)

   Which when applied on the capture scene gives

   (0,line-len)            (num-cols,line-len)
        ^\    ^\    ^\    ^\    ^
        ! \   ! \   0 \   ! \   !
        !  \  !  \ -|- \  !  \  !
        !   \ !    / \  \ !   \ !
        !    \!    \!    \!    \!
      (0,0)  (1,0) ....      (num-cols,0)

   Producing the following image once captured to memory and
   displayed to the user

         \ !
           --0
         / !

   which (ascii-art shortcomings apart in the drawing) has a rotation
   of the  same amount of degrees applied on the opposite rotation direction
   along the axis that goes from the observer to the displayed image.

   To summarize, to compensate the sensor mounting rotation, when expressed
   as counterclockwise rotation along the axis directed from the sensor
   the captured scene, a rotation of the same amount of degrees in the
   same counterclockwise rotation direction applied along the axis
   directed from the observer to the captured image, has to be applied.

 -------                     -------                        -------
 |   o  |  90deg sensor      | \ !  |  90degrees image      |   o  |
 |  -|- |  counterclockwise  |  --0 | counterclockwise      |  -|- |
 |  / \ |  mounting rotation | / !  | compensation rotation |  / \ |
 -------                     -------                        -------

------------------End of ascii-art fun -----------------------------------------

As it took me some off-line discussions to get this right (thanks :)
do you think something along these lines should be anywhere in the
control or the property documentation ?

I know you're still in favour of going from something like the
'mount-matrix' property Rob suggested, but I still think it's an
unnecessary complication for such a 'trivial' concept. Asking developers
to provide a 3D rotation matrix where they could only express
rotations of 90 degrees multiples on 2 axes out of tree is calling for
them simply ignoring this complication and going for custom methods to
report the mounting rotation.

>
> I don't think Android exposes camera rotation to the layers above the
> HAL. The stream is expected to be pre-rotated by the HAL, taking into
> account the desired target rotation of the stream itself [1].
>
> [1] https://android.googlesource.com/platform/hardware/libhardware/+/master/include/hardware/camera3.h#1428
>
> That said, Android seems to use "degrees counterclockwise" for rotations.

https://jmondi.org/android_metadata_tags/docs.html#static_android.lens.facing
I see the property description reporting

"Clockwise angle through which the output image needs to be rotated to be
upright on the device screen in its native orientation."

Who knows which direction of the rotation axis do they take into
account :)

Thanks
  j

>
> Best regards,
> Tomasz

--fglqki24nxibynuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1uhTcACgkQcjQGjxah
VjwqgxAAqRoqIQdr+sfti8LEW87INPdAiws8RYoiBLPgRySNIvHlKsA1uzCzBp8H
+vNtS8i1OR6gfjKL6eL23WyhvrPoSLjXcC4pEqq7z0CN2QZfdiJoM6uH+UwbEPjN
IKarNs03A+ZLlVaQ6tfBGeDK/x8ZU2c/WoKhkWlrbP4ZepC75eB3P0NwLreOQkZt
/48UL7MAIhpENhn7LEezUWSnxUfTvlqWaLZQxT6PmliizqIQE8x2hdWAFFhSEWEm
GV9vJWjTNHY+x/yVH7CndNK9a4ho4XABzNHOrw3rUKcXYsasqMfWAiUDK0T5Xqqu
jI+dpeT0w+WM4/O/5plcklEN9jJ7bzcoNYhs3j8dgl2CecBI1t9hM7uMM4S1W63a
9jSEPY1fZqL3jmXc+8lnfs8U/KAY20hBwicCeO04omY6JcUU+jWS23assh60g5n9
gUk60R+IBm50/esiwif3gihEJVjBtbJiyiiCsjKcDy7ArWizh6zLVdGZzZzAMBrx
/wDgpAQWHkpwXg5qELx7Zu6yNCYsQLTIOrzWVEXQMc35RIyTrFzZmtub1KN1qykS
rI5eL9kK6JaQCiYxA0JfKp3kgezaqzTk2s/uZz6DkUkDlQxXnzrV8N9Gh+ywy2uH
0C8FeAlYIJautYoUw811JgKvZPEDMUyIxR5H32E2VDepq0BWpoQ=
=Zt2q
-----END PGP SIGNATURE-----

--fglqki24nxibynuv--
