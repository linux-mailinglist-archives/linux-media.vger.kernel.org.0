Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED53E0624
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 16:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388374AbfJVOOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 10:14:48 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34337 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727831AbfJVOOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 10:14:47 -0400
Received: from [IPv6:2001:420:44c1:2577:31:9f59:b53f:5d72]
 ([IPv6:2001:420:44c1:2577:31:9f59:b53f:5d72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Muvpi3OTnPduvMuvsiMpfc; Tue, 22 Oct 2019 16:14:45 +0200
Subject: Re: [PATCH v4 04/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-5-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <04decceb-688c-0db1-fd72-b44cd663f819@xs4all.nl>
Date:   Tue, 22 Oct 2019 16:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007162913.250743-5-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJsyULJ9FoPK8TwEM3z0I1YKRpmPBXUaJf9POCfQ3BY6F+2/uPAa/bioFRaUFQa8DTJUWD1SafCVx+iL7wM5qYKrtghXIvAVC8Ix7fiMEFhFFZLqqxHQ
 9N2j3b/NX94l5SBl9WngGFnqPy8RtGSoYklQl/2xUQe85YZAEovZSV/MnKakmCq2jB9rUpZUcNTfM5H3udC36nWsxM2ttkehlsY9wRpTEt6dqutcyUkQPTXs
 7VVN8Mrtm0fX6eLU3SSllFxxklAmcQkAf6l9Eu88f5lIZ5qyOP2nsxtJa4LSqHJ8Gc3fRdnJMiHz+yDaF2Lh2gUvLfAy9K5OXQQwvO2zZw8A90KZzfMoxi28
 IFNCelBXCxBnaHD0f22R4vq6eyvoqpNVEWyVm+LbyiH96lm+llEkUcBaUgmao3jmWq9EnFC/Zbs5kt0KBoOIHRUM2xyw8TvxZZszGPyLdkJXR2ZcGnVEDlWA
 FClIUIw5NKVNR9k4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/7/19 6:29 PM, Jacopo Mondi wrote:
> Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
> control. The newly added read-only control reports the camera device
> mounting rotation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> index b151c016256c..e1fee4814e5b 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
> @@ -542,6 +542,122 @@ enum v4l2_scene_mode -
>  
>  
>  
> +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
> +    This read-only control describes the sensor orientation expressed as
> +    rotation in counterclockwise degrees along the axis perpendicular to the
> +    device mounting plane, and directed away from the sensor lens. Possible
> +    values for the control are 90, 180 and 270 degrees. To compensate for the
> +    device mounting rotation on the captured images, a rotation of the same
> +    amount of degrees, in the same counterclockwise rotation direction should be
> +    applied along the axis directed from the observer to the captured image when
> +    displayed on a screen.
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
> +                                   x
> +            (0,0)------------------->
> +              ! 0,0 0,1 0,2 ... (0,num-col)
> +              ! 1,0 1,1 1,2 ...
> +              ! ...
> +              ! ...
> +              ! (num-lines,0)...(num-col,num-lines)

Hmm, how about 'max-col' and 'max-row'?

num-col is wrong anyway since it would have to be num-cols - 1 because you
start at 0. It's easier to go with max-col/row.

> +            y V
> +
> +
> +    Assuming pixels are scanned out from (0,0) to (num-lines,num-col)
> +    progressively::
> +
> +             (0,0) ---->------------->   (0,num-col)
> +             (1,0) ---->------------->   (1,num-col)
> +             ( .... )-->------------->   (   ....   )
> +             (num-lines,0)----------->(num-lines,num-col)
> +
> +
> +    If a rotation of 90 degrees counterclockwise along the axis perpendicular to
> +    the sensor's lens and directed towards the scene to be captured is applied
> +    to the sensor, the pixel array would then be rotated as follows::
> +
> +            x ^ (0,num-col) ...   ...   (num-lines,num-col)
> +              !  ....
> +              !  0,2        1,2   ...          ...
> +              !  0,1        1,1   ...          ...
> +              !  0,0        1,0   ...      (num-lines,0)
> +             (0,0)------------------------------------>
> +                                                    y
> +
> +    And the pixel scan-out sequence would then proceed as follows starting
> +    from pixel (0,0)::
> +
> +           (0,num-col)         (num-lines,num-col)
> +                ^    ^   ^   ^     ^
> +                !    !   !   !     !
> +                !    !   !   !     !
> +                !    !   !   !     !
> +                !    !   !   !     !
> +              (0,0) (1,0)....  (num-lines,0)
> +
> +    Which when applied to the capture scene gives::
> +
> +           (0,num-col)         (num-lines,num-col)
> +                ^    ^   ^   ^     ^
> +                !    !   0   !     !
> +                !    !  -|- !     !
> +                !    !  /!\  !     !
> +                !    !   !   !     !
> +              (0,0) (1,0)....  (num-lines,0)
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
> +    image when displayed on the screen.
> +
> +    In order to compensate the sensor mounting rotation, when expressed
> +    as counterclockwise rotation along the axis directed from the sensor to
> +    the captured scene, a rotation of the same amount of degrees in the
> +    same counterclockwise rotation direction but applied along the axis
> +    directed from the observer to the captured image, has to be applied::
> +
> +                +------+  90 degree counterclockwise
> +                |   o  |  mounting rotation applied
> +                |  -|- |  along the axis directed
> +                |  / \ |  away from the sensor lens
> +                +------+
> +                    |
> +                    V
> +                +------+
> +                | \ !  |  Resulting captured
> +                |  --0 |  image when displayed
> +                | / !  |  on screen
> +                +------+
> +                    |
> +                    V
> +                +------+
> +                |   o  |  Rotation compensation
> +                |  -|- |  is 90 degrees counterclockwise
> +                |  / \ |  along the axis directed to the
> +                +------+  displayed image
> +
> +
>  .. [#f1]
>     This control may be changed to a menu control in the future, if more
>     options are required.
> 

This gave me a headache, but you are correct w.r.t. image and mounting rotation.

Regards,

	Hans
