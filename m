Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F42C0406
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 13:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfI0LUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 07:20:34 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48507 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726483AbfI0LUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 07:20:34 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DoIViLOMH9D4hDoIZiBnCH; Fri, 27 Sep 2019 13:20:31 +0200
Subject: Re: [PATCH v3 04/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_ROTATION
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-5-jacopo@jmondi.org>
 <549569c7-64bd-f6bd-30f6-e0fe27687780@xs4all.nl>
 <20190913184906.6tpl374n4anzja5c@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3902ff28-6a77-070c-4fd4-ccd0334af991@xs4all.nl>
Date:   Fri, 27 Sep 2019 13:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913184906.6tpl374n4anzja5c@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB4iqECbVFqOBLFhMXTENNVvoc0Zmsf8JEkAVu2YxeXs80QJU0kg/WH2ZTwxHXSdGW9Fm0q/0iFXub0951S9ATIqj8/GnB0lFzX8V2sz+KrUxroUu1Wn
 BNtN2p2mXrGL9Dm/qgMk/nUJWWnncrHWRXPrCh4NzTMrM4NkDa1n/kh8FVLMY24wYC1LxzeOdVWEV8FS5xHtM0c4Doe2ZtGCLTpzxAO9ZOVVADKU2id5TBCZ
 mmCQh6c1QVrylxCwrva7IJMG5U5TyHrK7ah/oxMSsbVy372ripVF+qoNsJ9hIqB/siLBW+BgDGFy9UiLtNfyqNYi7XllPhE7CEMzkKT62n8TB4RGy0AvW8m2
 uhQhLH47dV6IWvC1HqRhS3ym2O0xNJrdQSPYyF1fP20wka/geifPu+wew/DM1nZn29F3qBUz/nf6uMTcE6bIzJ4P5Nd+yD41oJKwZ4IcWEse8JA1t9fHk52w
 C52cXc23GwwrudMusywZrhn/vWn0+9LKF/zeaQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Sorry for the late reply, it fell through the cracks...

On 9/13/19 8:49 PM, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Fri, Sep 13, 2019 at 04:02:45PM +0200, Hans Verkuil wrote:
>> On 9/12/19 10:10 PM, Jacopo Mondi wrote:
>>> Add documentation for the V4L2_CID_CAMERA_SENSOR_ROTATION camera
>>> control. The newly added read-only control reports the camera device
>>> mounting rotation.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 117 ++++++++++++++++++
>>>  1 file changed, 117 insertions(+)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>>> index f879dcc9409c..74991522ca3a 100644
>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>>> @@ -542,6 +542,123 @@ enum v4l2_scene_mode -
>>>
>>>
>>>
>>> +``V4L2_CID_CAMERA_SENSOR_ROTATION (integer)``
>>> +    This read-only control describes the sensor orientation expressed as
>>> +    rotation in counterclockwise degrees along the axis perpendicular to the
>>> +    device mounting plane, and directed away from the sensor lens. Possible
>>> +    values for the control are 90, 180 and 270 degrees. To compensate the device
>>
>> compensate -> compensate for
>>
>>> +    mounting rotation on the captured images, a rotation of the same amount of
>>> +    degrees, in the same counterclockwise rotation direction should be applied
>>> +    along the axis directed from the observer to the captured image when
>>> +    displayed on a screen.
>>
>> Is this right? Shouldn't that be "in the clockwise direction"? If the sensor is
>> mounted 90 degrees counterclockwise, then I need to rotate by 90 degrees clockwise
>> to compensate for that, right?
>>
> 
> It really depend along which axis direction you are applying the mounting
> rotation and the compensation rotation... See below...
> 
>>> +
>>> +    To better understand the effect of the sensor rotation on the acquired
>>> +    images when displayed on a screen, it is helpful to consider a fictional
>>> +    scan-out sequence of the sensor's pixels, assuming the pixel array having
>>> +    its top-left pixel at position (0, 0) with values on the 'x' axis increasing
>>> +    towards the right direction, and values on the 'y' axis increasing towards
>>> +    the bottom. The effect of sensor rotation could be easily visualized
>>> +    considering the sequence of captured pixels.
>>> +
>>> +    Assuming the following scene has to be captured::
>>> +
>>> +                o
>>> +               -|-
>>> +               / \
>>> +
>>> +    An upright mounted sensor has its pixel array displaced as follow::
>>> +
>>> +                                      x
>>> +            (0,0)---------------------->
>>> +              ! 0,0 0,1 0,2 ... 0,line-len
>>
>> Isn't that 0,0 ... 0,num-col?
> 
> Yes indeed sorry
> 
>> line-len is a weird name, shouldn't that be num-lines?
>>
>> line-len sounds like it is the same as num-col.
>>
>> I'm totally confused.
>>
> 
> num-col is totally wrong, that should have been num-lines
> 
> In general
> s/line-len/num-col
> s/num-col/num-lines
> 
>>> +              ! 1,0 1,1 1,2 ...
>>> +              ! ...
>>> +              ! ...
>>> +              ! (num-col,0)...  (num-col,line-len)
>>> +            y V
>>> +
>>> +
>>> +    Assuming pixels are scanned out from (0,0) to (num-col,line-len)
>>> +    progressively::
>>> +
>>> +             (0,0) ---->-------------> (0,line-len)---!
>>> +             !------------------------------------<a--!
>>> +             V
>>> +             (1,0) ---->-------------> (1,line-len)---!
>>> +             !------------------------------------<---!
>>> +             V
>>> +             (...) .-->--------------> ( ,,,, )    ---!
>>> +             !------------------------------------<---!
>>> +             V
>>> +             (num-col,0)------------->(num-col,line-len)
>>> +
>>> +
>>> +    If a rotation of 90 degrees counterclockwise along the axis perpendicular to
>>> +    the sensor's lens and directed towards the scene to be captured is applied
>>> +    to the sensor, the pixel array would then be rotated as follows::
>>> +
>>> +            x ^  0,line-len,,,(num-col,line-len
>>> +              !  ....
>>> +              !  0,2 1,2      ...
>>> +              !  0,1 1,1      ...
>>> +              !  0,0 1,0 ... num-col,0
>>> +             (0,0)------------------------>
>>> +                                   y
>>> +
>>> +    And the pixel scan-out sequence would then proceed as follows::
>>> +
>>> +            (0,line-len)            (num-cols,line-len)
>>> +                 ^\    ^\    ^\    ^\    ^
>>> +                 ! \   ! \   ! \   ! \   !
>>> +                 !  \  !  \  !  \  !  \  !
>>> +                 !   \ !   \ !   \ !   \ !
>>> +                 !    \!    \!    \!    \!
>>> +               (0,0)  (1,0) ....      (num-cols,0)
>>> +
>>> +    Which when applied to the capture scene gives::
>>> +
>>> +            (0,line-len)            (num-cols,line-len)
>>> +                ^\    ^\    ^\    ^\    ^
>>> +                ! \   ! \   0 \   ! \   !
>>> +                !  \  !  \ -|- \  !  \  !
>>> +                !   \ !    / \  \ !   \ !
>>> +                !    \!    \!    \!    \!
>>> +              (0,0)  (1,0) ....      (num-cols,0)
>>> +
>>> +    Producing the following image once captured to memory and
>>> +    displayed to the user::
>>> +
>>> +             \ !
>>> +               --0
>>> +             / !
>>> +
>>> +    Which has a rotation of the same amount of degrees applied on the opposite
>>> +    rotation direction along the axis that goes from the observer to the
>>> +    displayed image.
>>> +
>>> +    In order to compensate the sensor mounting rotation, when expressed
>>> +    as counterclockwise rotation along the axis directed from the sensor to
>>> +    the captured scene, a rotation of the same amount of degrees in the
>>> +    same counterclockwise rotation direction but applied along the axis
>>> +    directed from the observer to the captured image, has to be applied.::
>>
>> .:: -> :
>>
> 
> Don't I need the :: to mark the following block of text as verbatim ?

Ah, sorry, this is for the markup. I missed that.

> 
>>> +
>>> +                -------   90 degree counterclockwise
>>> +                |   o  |  mounting rotation applied
>>> +                |  -|- |  along the axis directed
>>> +                |  / \ |  away from the sensor lens
>>> +                -------
>>> +                -------
>>> +                | \ !  |  Resulting captured
>>> +                |  --0 |  image when displayed
>>> +                | / !  |  on screen
>>> +                -------
>>
>> Trying this with my webcam turning it 90 degrees counterclockwise, I
>> and up with my head to the left, not to the right.
>>
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

I think you are right, but let me take another look at this when v4 is
posted. The line-len/num-col confusion didn't help :-)

Regards,

	Hans

> 
>>> +                -------
>>> +                |   o  |  Rotation compensation
>>> +                |  -|- |  is 90 degrees counterclockwise
>>> +                |  / \ |  along the axis directed to the
>>> +                -------   displayed image
>>> +
>>> +
>>>  .. [#f1]
>>>     This control may be changed to a menu control in the future, if more
>>>     options are required.
>>>
>>
>> Regards,
>>
>> 	Hans

