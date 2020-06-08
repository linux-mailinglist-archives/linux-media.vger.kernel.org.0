Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9200A1F166C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 12:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbgFHKJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 06:09:14 -0400
Received: from mga09.intel.com ([134.134.136.24]:63881 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729259AbgFHKJN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 06:09:13 -0400
IronPort-SDR: kNMyI6VWcLLHkkUBAsQmCteUH/qGJ4bkK/aem6q/MdDFD8Mt9s4Wr6Y87bEllPM5tOgNPWTsf+
 YlJtKLYtw7yg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 03:09:08 -0700
IronPort-SDR: 3hoq503CB203GgsJeiHodsHadP5DLaOolS9GC4umV1jiQAqfWAcSDYRr97BjVPsMvNcEJx/1yQ
 2t9ZFOEd6dNg==
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="270462924"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 03:09:05 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4B7D720699; Mon,  8 Jun 2020 13:09:03 +0300 (EEST)
Date:   Mon, 8 Jun 2020 13:09:03 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        robh@kernel.org, devicetree@vger.kernel.org,
        Niklas Soderlund <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v7 03/11] dt-bindings: video-interface: Replace
 'rotation' description
Message-ID: <20200608100903.GZ16711@paasikivi.fi.intel.com>
References: <20200318205034.949531-1-jacopo@jmondi.org>
 <20200318205034.949531-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318205034.949531-4-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for this great piece of ASCII art. Also my apologies for
reviewing this so late. The latest version is 11 but I believe the content
is the same on the commented matters.

On Wed, Mar 18, 2020 at 09:50:26PM +0100, Jacopo Mondi wrote:
> Replace the 'rotation' property description by providing a definition
> relative to the camera sensor pixel array coordinate system and the
> captured scene.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Co-developed-by: Niklas Soderlund <niklas.soderlund@ragnatech.se>
> 
> ---
>  .../bindings/media/video-interfaces.txt       | 359 +++++++++++++++++-
>  1 file changed, 356 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 1211bdf80722..36e61d599f34 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -85,9 +85,362 @@ Optional properties
> 
>  - lens-focus: A phandle to the node of the focus lens controller.
> 
> -- rotation: The device, typically an image sensor, is not mounted upright,
> -  but a number of degrees counter clockwise. Typical values are 0 and 180
> -  (upside down).
> +- rotation: The camera rotation is expressed as the angular difference in
> +  degrees between two reference systems, one relative to the camera module, and
> +  one defined on the external world scene to be captured when projected on the
> +  image sensor pixel array.
> +
> +  A camera sensor has a 2-dimensional reference system 'Rc' defined by
> +  its pixel array read-out order. The origin is set to the first pixel
> +  being read out, the X-axis points along the column read-out direction
> +  towards the last columns, and the Y-axis along the row read-out
> +  direction towards the last row.
> +
> +  A typical example for a sensor with a 2592x1944 pixel array matrix
> +  observed from the front is
> +
> +              2591       X-axis          0
> +                <------------------------+ 0
> +                .......... ... ..........!
> +                .......... ... ..........! Y-axis
> +                           ...           !
> +                .......... ... ..........!
> +                .......... ... ..........! 1943
> +                                         V
> +
> +  The external world scene reference system 'Rs' is a 2-dimensional
> +  reference system on the focal plane of the camera module. The origin is
> +  placed on the top-left corner of the visible scene, the X-axis points
> +  towards the right, and the Y-axis points towards the bottom of the
> +  scene. The top, bottom, left and right directions are intentionally not
> +  defined and depend on the environment in which the camera is used.
> +
> +  A typical example of a (very common) picture of a shark swimming from
> +  left to right, as seen from the camera, is

In the previous paragraph, it is stated that "top, bottom, left and right
directions are intentionally not defined". How about something like

	A typical example of a (very common) pictore of a shark swimming in
	the direction of X axis, as seen from the camera, is

> +
> +               0               X-axis
> +             0 +------------------------------------->
> +               !
> +               !
> +               !
> +               !           |\____)\___
> +               !           ) _____  __`<
> +               !           |/     )/
> +               !
> +               !
> +               !
> +               V
> +             Y-axis
> +
> +  With the reference system 'Rs' placed on the camera focal plane.
> +
> +                                  ¸.·˙!
> +                              ¸.·˙    !
> +                  _       ¸.·˙        !
> +               +-/ \-+¸.·˙            !
> +               | (o) |                ! Camera focal plane
> +               +-----+˙·.¸            !
> +                          ˙·.¸        !
> +                              ˙·.¸    !
> +                                  ˙·.¸!
> +
> +  When projected on the sensor's pixel array, the image and the associated
> +  reference system 'Rs' are typically (but not always) inverted, due to
> +  the camera module's lens optical inversion effect.
> +
> +  Assuming the above represented scene of the swimming shark, the lens
> +  inversion projects the scene and its reference system onto the sensor
> +  pixel array, seen from the front of the camera sensor, as follow
> +
> +            Y-axis
> +               ^
> +               !
> +               !
> +               !
> +               !            |\_____)\__
> +               !            ) ____  ___.<
> +               !            |/    )/
> +               !
> +               !
> +               !
> +             0 +------------------------------------->
> +               0               X-axis
> +
> +  Note the shark being upside-down.

As it's inverted, wouldn't the same happen on the X axis as well?

> +
> +  The resulting projected reference system is named 'Rp'.
> +
> +  The camera rotation property is then defined as the angular difference
> +  in the counter-clockwise direction between the camera reference system
> +  'Rc' and the projected scene reference system 'Rp'. It is expressed in
> +  degrees as a number in the range [0, 360[.
> +
> +  Examples
> +
> +  0 degrees camera rotation
> +
> +
> +                    Y-Rp
> +                     ^
> +              Y-Rc   !
> +               ^     !
> +               !     !
> +               !     !
> +               !     !
> +               !     !
> +               !     !
> +               !     !
> +               !     !
> +               !   0 +------------------------------------->
> +               !     0               X-Rp
> +             0 +------------------------------------->
> +               0               X-Rc
> +
> +
> +                                X-Rc                0
> +               <------------------------------------+ 0
> +                           X-Rp                 0   !
> +           <------------------------------------+ 0 !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   V
> +                                                !  Y-Rc
> +                                                V
> +                                               Y-Rp
> +
> +  90 degrees camera rotation
> +
> +               0        Y-Rc
> +             0 +-------------------->
> +               !   Y-Rp
> +               !    ^
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !  0 +------------------------------------->
> +               !    0              X-Rp
> +               !
> +               !
> +               !
> +               !
> +               V
> +              X-Rc
> +
> +  180 degrees camera rotation
> +
> +                                            0
> +       <------------------------------------+ 0
> +                        X-Rc                !
> +              Y-Rp                          !
> +               ^                            !
> +               !                            !
> +               !                            !
> +               !                            !
> +               !                            !
> +               !                            !
> +               !                            !
> +               !                            V
> +               !                           Y-Rc
> +             0 +------------------------------------->
> +               0              X-Rp
> +
> +  270 degrees camera rotation
> +
> +               0        Y-Rc
> +             0 +-------------------->
> +               !                                        0
> +               !    <-----------------------------------+ 0
> +               !                    X-Rp                !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        V
> +               !                                       Y-Rp
> +               !
> +               !
> +               !
> +               !
> +               V
> +              X-Rc
> +
> +
> +  Example one - Webcam
> +
> +  A camera module installed on the user facing part of a laptop screen
> +  casing used for video calls. The captured images are meant to be
> +  displayed in landscape mode (width > height) on the laptop screen.
> +
> +  The camera is typically mounted upside-down to compensate the lens
> +  optical inversion effect.
> +
> +                    Y-Rp
> +              Y-Rc   ^
> +               ^     !
> +               !     !
> +               !     !       |\_____)\__
> +               !     !       ) ____  ___.<
> +               !     !       |/    )/
> +               !     !
> +               !     !
> +               !     !
> +               !   0 +------------------------------------->
> +               !     0           X-Rp
> +             0 +------------------------------------->
> +               0            X-Rc
> +
> +  The two reference systems are aligned, the resulting camera rotation is
> +  0 degrees, no rotation correction needs to be applied to the resulting
> +  image once captured to memory buffers to correctly display it to users.
> +
> +               +--------------------------------------+
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               !             |\____)\___              !
> +               !             ) _____  __`<            !
> +               !             |/     )/                !
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               +--------------------------------------+
> +
> +  If the camera sensor is not mounted upside-down to compensate for the
> +  lens optical inversion, the two reference systems will not be aligned,
> +  with 'Rp' being rotated 180 degrees relatively to 'Rc'.

I'd say the camera is mounted upright (rotation 0) if the image it produces
is read from the top-left corner towards the bottom. That is what the
current rotation property refers to, and I don't think we can change that
anymore.

Note that the lens is a part of the camera (or camera module). Could this
be defined for the camera module instead, to be compatible with the
existing definition and to take the entire lens system in the module into
account?

> +
> +
> +                        X-Rc                0
> +       <------------------------------------+ 0
> +                                            !
> +              Y-Rp                          !
> +               ^                            !
> +               !                            !
> +               !       |\_____)\__          !
> +               !       ) ____  ___.<        !
> +               !       |/    )/             !
> +               !                            !
> +               !                            !
> +               !                            V
> +               !                           Y-Rc
> +             0 +------------------------------------->
> +               0            X-Rp
> +
> +  The image once captured to memory will then be rotated by 180 degrees
> +
> +               +--------------------------------------+
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               !              __/(_____/|             !
> +               !            >.___  ____ (             !
> +               !                 \(    \|             !
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               +--------------------------------------+
> +
> +  A software rotation correction of 180 degrees should be applied to
> +  correctly display the image.
> +
> +               +--------------------------------------+
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               !             |\____)\___              !
> +               !             ) _____  __`<            !
> +               !             |/     )/                !
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               +--------------------------------------+
> +
> +  Example two - Phone camera
> +
> +  A camera installed on the back side of a mobile device facing away from
> +  the user. The captured images are meant to be displayed in portrait mode
> +  (height > width) to match the device screen orientation and the device
> +  usage orientation used when taking the picture.
> +
> +  The camera sensor is typically mounted with its pixel array longer side
> +  aligned to the device longer side, upside-down mounted to compensate for
> +  the lens optical inversion effect.
> +
> +               0        Y-Rc
> +             0 +-------------------->
> +               !   Y-Rp
> +               !    ^
> +               !    !
> +               !    !
> +               !    !
> +               !    !            |\_____)\__
> +               !    !            ) ____  ___.<
> +               !    !            |/    )/
> +               !    !
> +               !    !
> +               !    !
> +               !  0 +------------------------------------->
> +               !    0                X-Rp
> +               !
> +               !
> +               !
> +               !
> +               V
> +              X-Rc
> +
> +  The two reference systems are not aligned and the 'Rp' reference
> +  system is rotated by 90 degrees in the counter-clockwise direction
> +  relatively to the 'Rc' reference system.
> +
> +  The image once captured to memory will be rotated.
> +
> +               +-------------------------------------+
> +               |                 _ _                 |
> +               |                \   /                |
> +               |                 | |                 |
> +               |                 | |                 |
> +               |                 |  >                |
> +               |                <  |                 |
> +               |                 | |                 |
> +               |                   .                 |
> +               |                  V                  |
> +               +-------------------------------------+
> +
> +  A correction of 90 degrees in counter-clockwise direction has to be
> +  applied to correctly display the image in portrait mode on the device
> +  screen.
> +
> +                        +--------------------+
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |   |\____)\___      |
> +                        |   ) _____  __`<    |
> +                        |   |/     )/        |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        +--------------------+
> 
>  - location: The mount location of a device (typically an image sensor or a flash
>    LED) expressed as a position relative to the usage orientation of the system

-- 
Kind regards,

Sakari Ailus
