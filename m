Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 942A3199353
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 12:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730153AbgCaKVS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 06:21:18 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36003 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729997AbgCaKVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 06:21:18 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id JE15j7jDGfHuvJE19jAeiU; Tue, 31 Mar 2020 12:21:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585650075; bh=oBKxSIWLg/ZeflHV6yO0FZ/V0yGBe3qnQEZH1qE85yE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SDJNQfDHQ1+y9mpmsGKuRDz9pORZD+P89pMq8CTlWSts8HdOcdYv9ERSIoY5jzNh/
         +ByczAgDy+cP1DBEXXpJFd6rkdIzUBQVQyJO10IEibM8G5g72gF6PRXOB4wIrDuDP4
         a1ARZLF+gIv0Axzr4a8ZnIth+3VbI8kPhz98D2FwuV+njvN3qS/zhwjgSF5s7RGekp
         bOgOMrkVxkJT3462DBSIJ52GmgSDIzLlEz7hs9k6Wdc1QesxbfwzkiwkKMeEULwHT5
         1ybeT3i9IPGiBMbdzh4LYYqOysSln+t2FKxxtrwu9qLoVwcK/+OvnN6eXmK+7NNqrp
         hQlmL/NyxjAxg==
Subject: Re: [PATCH v7 03/11] dt-bindings: video-interface: Replace 'rotation'
 description
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        robh@kernel.org, devicetree@vger.kernel.org,
        Niklas Soderlund <niklas.soderlund@ragnatech.se>
References: <20200318205034.949531-1-jacopo@jmondi.org>
 <20200318205034.949531-4-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9837f79e-4a5f-5a74-33eb-ed35b59a94a5@xs4all.nl>
Date:   Tue, 31 Mar 2020 12:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318205034.949531-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKTXalS5F4CnePXJFgCAXNVXlKNLpT1vkpCkUqA2Dzx8xcGYaq0MR75R8lvAIWakRVL53fhVExnvENPkUHqQvzBNgV5E+6YFqRxJaZqdABcEDZqPxaUQ
 PCKwLUnDUJeKULlgIk1dy4CdgA014vDPvBc0s6VDD4/xaj58UkAsuecFUihwmTfVxMoTho4bxiuZwaeh6iv0FuG33twqJsj2j/zJ8jXEKQIaSz1sOan0BmgL
 jIz39FCWUymLFCzBHqgrNahlXKAn1eARftV3DAfGFORnoRbxp1gFVeVUDFhHlh32A7YhqoIcvPLENJEiYzffFsndj9PKSYZ+hoMMlXB57UEG+CddGYkAMS86
 Eg8PD2eTPH6lGHflWmMvmmgshDm43txsQa/MEelZ2ZbL87w995Fr+IJJ/2Zg234hsU7ZD3UD5Ba8XSxEEKwOTTpkSvyzT9uhDXHRM+EVpt55cLel+JIhh7mL
 b/PK1GZgcv+/hkf/ULqyVVxHFWwlYYPrA2MOIxStz154UFpsJgEgQvnugaa7M5io30sL/vONAfeqEFQ0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/18/20 9:50 PM, Jacopo Mondi wrote:
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

is -> is:

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

is -> is:

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

I think here 'With' can be 'with' (since you continue the previous sentence)
and 'plane.' should be 'plane:' since it refers to the picture below that explains
the focal plane.

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

follow -> follows:

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

rotation -> rotation:

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

Ditto here and for the 180 and 270 examples below.

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

effect. -> effect:

The : links the sentence with the following picture. I think this should be
done in the remainder of this section, so I won't repeat myself.

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
> --
> 2.25.1
> 

Regards,

	Hans
