Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE61B2189
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 16:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388700AbfIMOCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 10:02:53 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:36245 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388084AbfIMOCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 10:02:52 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8m9tiX3w6V17O8m9wi31N4; Fri, 13 Sep 2019 16:02:50 +0200
Subject: Re: [PATCH v3 04/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-5-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <549569c7-64bd-f6bd-30f6-e0fe27687780@xs4all.nl>
Date:   Fri, 13 Sep 2019 16:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912201055.13964-5-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLDhaDIAgmc0qYNLJEd9nLoo7hsjBQExa8PmR5nbbveNGwQj8RtMmmPDxWPi6n6wqSqDUISuSriHKtjp5BpvHWWtcfeyB43FcXixQWai6xNnseN6NzFm
 6ArAz8NYikpMuxGXG7VL+mogtQMTorHVATsESMMgIrJnaG+bpVtT9qsDR6H+QtyO9O9HGeuwpO4peDc3P3sLw9oHMYRVrxueA7TUgava8DdkjQ5rSO+ttq5x
 pgP5tQyQtrHYpUk/4wtifFTX4dgXCo8X2JABOwU1p/jmriH733cXfVtBEgN+oFjrckqlJR/zZvT3gtUHt1WmItL2xyRc3kUvm37ijXoV5QfTIXaG7FHFGxE/
 MRGJ6cT3MpymxwQP2bsBVwzCbFhD9nq2pTdyIEoT0h0lVq2kE2VfAs0vEq1UgWuUyc3h+/IDgcDk9U1jpZW+aJL09Y2ET4p+hgoVN0XMyAIjhjHpQyIDIKIK
 bUk0nL8KCJAJyeDIdtRu5Vo6tFt81uFY8kXjyQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> control. The newly added read-only control reports the camera device
> mounting rotation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> index f879dcc9409c..74991522ca3a 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> @@ -542,6 +542,123 @@ enum v4l2_scene_mode -
>  
>  
>  
> +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> +    This read-only control describes the sensor orientation expressed as
> +    rotation in counterclockwise degrees along the axis perpendicular to the
> +    device mounting plane, and directed away from the sensor lens. Possible
> +    values for the control are 90, 180 and 270 degrees. To compensate the device

compensate -> compensate for

> +    mounting rotation on the captured images, a rotation of the same amount of
> +    degrees, in the same counterclockwise rotation direction should be applied
> +    along the axis directed from the observer to the captured image when
> +    displayed on a screen.

Is this right? Shouldn't that be "in the clockwise direction"? If the sensor is
mounted 90 degrees counterclockwise, then I need to rotate by 90 degrees clockwise
to compensate for that, right?

> +
> +    To better understand the effect of the sensor rotation on the acquired
> +    images when displayed on a screen, it is helpful to consider a fictional
> +    scan-out sequence of the sensor's pixels, assuming the pixel array having
> +    its top-left pixel at position (0, 0) with values on the 'x' axis increasing
> +    towards the right direction, and values on the 'y' axis increasing towards
> +    the bottom. The effect of sensor rotation could be easily visualized
> +    considering the sequence of captured pixels.
> +
> +    Assuming the following scene has to be captured::
> +
> +                o
> +               -|-
> +               / \
> +
> +    An upright mounted sensor has its pixel array displaced as follow::
> +
> +                                      x
> +            (0,0)---------------------->
> +              ! 0,0 0,1 0,2 ... 0,line-len

Isn't that 0,0 ... 0,num-col?
line-len is a weird name, shouldn't that be num-lines?

line-len sounds like it is the same as num-col.

I'm totally confused.

> +              ! 1,0 1,1 1,2 ...
> +              ! ...
> +              ! ...
> +              ! (num-col,0)...  (num-col,line-len)
> +            y V
> +
> +
> +    Assuming pixels are scanned out from (0,0) to (num-col,line-len)
> +    progressively::
> +
> +             (0,0) ---->-------------> (0,line-len)---!
> +             !------------------------------------<a--!
> +             V
> +             (1,0) ---->-------------> (1,line-len)---!
> +             !------------------------------------<---!
> +             V
> +             (...) .-->--------------> ( ,,,, )    ---!
> +             !------------------------------------<---!
> +             V
> +             (num-col,0)------------->(num-col,line-len)
> +
> +
> +    If a rotation of 90 degrees counterclockwise along the axis perpendicular to
> +    the sensor's lens and directed towards the scene to be captured is applied
> +    to the sensor, the pixel array would then be rotated as follows::
> +
> +            x ^  0,line-len,,,(num-col,line-len
> +              !  ....
> +              !  0,2 1,2      ...
> +              !  0,1 1,1      ...
> +              !  0,0 1,0 ... num-col,0
> +             (0,0)------------------------>
> +                                   y
> +
> +    And the pixel scan-out sequence would then proceed as follows::
> +
> +            (0,line-len)            (num-cols,line-len)
> +                 ^\    ^\    ^\    ^\    ^
> +                 ! \   ! \   ! \   ! \   !
> +                 !  \  !  \  !  \  !  \  !
> +                 !   \ !   \ !   \ !   \ !
> +                 !    \!    \!    \!    \!
> +               (0,0)  (1,0) ....      (num-cols,0)
> +
> +    Which when applied to the capture scene gives::
> +
> +            (0,line-len)            (num-cols,line-len)
> +                ^\    ^\    ^\    ^\    ^
> +                ! \   ! \   0 \   ! \   !
> +                !  \  !  \ -|- \  !  \  !
> +                !   \ !    / \  \ !   \ !
> +                !    \!    \!    \!    \!
> +              (0,0)  (1,0) ....      (num-cols,0)
> +
> +    Producing the following image once captured to memory and
> +    displayed to the user::
> +
> +             \ !
> +               --0
> +             / !
> +
> +    Which has a rotation of the same amount of degrees applied on the opposite
> +    rotation direction along the axis that goes from the observer to the
> +    displayed image.
> +
> +    In order to compensate the sensor mounting rotation, when expressed
> +    as counterclockwise rotation along the axis directed from the sensor to
> +    the captured scene, a rotation of the same amount of degrees in the
> +    same counterclockwise rotation direction but applied along the axis
> +    directed from the observer to the captured image, has to be applied.::

.:: -> :

> +
> +                -------   90 degree counterclockwise
> +                |   o  |  mounting rotation applied
> +                |  -|- |  along the axis directed
> +                |  / \ |  away from the sensor lens
> +                -------
> +                -------
> +                | \ !  |  Resulting captured
> +                |  --0 |  image when displayed
> +                | / !  |  on screen
> +                -------

Trying this with my webcam turning it 90 degrees counterclockwise, I
and up with my head to the left, not to the right.

> +                -------
> +                |   o  |  Rotation compensation
> +                |  -|- |  is 90 degrees counterclockwise
> +                |  / \ |  along the axis directed to the
> +                -------   displayed image
> +
> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.
> 

Regards,

	Hans
