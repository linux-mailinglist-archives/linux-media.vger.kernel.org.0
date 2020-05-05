Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBF21C5556
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 14:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgEEMVq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 08:21:46 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47219 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727090AbgEEMVq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 08:21:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VwZujUiXihEkrVwZxjxgSF; Tue, 05 May 2020 14:21:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588681303; bh=VSlWp6YY5vmqNA0KvHBjNJgstMab0HWtn4YGAMMnP+E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=I7SKt9ox17hU5a+tH7Yal7vNqAYfj9JJ9N4wF098LQRPS6e0FiaTju9InlpzZ9vS7
         wmYaIxHHN9CDTFQdbQz9b5f5ziElG+i6HhjTR+w/IgO/m5CLjDlVMUidMpQ/TJ73El
         iaBhqN/cPkRfwX94IkCFScWfsxZM1gZsS+Nk/ilHy1q4sHGva5zkjSHJ/MTcmCbpdS
         9aVU4eVvK+252myKcZb5r8nhWN4LGE6vyuNsrXxcixZ+rxorZuxGYQx4+xlKO7w7AZ
         /uuKSJMlJMviP78+mwvyxxH7WTnOnsAx3owuiQehXXwiUBCIbsEqeSaq2CBhbtSa3W
         E9A1JmTaTGDVw==
Subject: Re: [PATCH v9 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org
References: <20200417124110.72313-1-jacopo@jmondi.org>
 <20200417124110.72313-3-jacopo@jmondi.org> <20200505140206.589f54ae@coco.lan>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
Date:   Tue, 5 May 2020 14:21:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200505140206.589f54ae@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ2jDJbsB6hOechOyjEE0pn5Kt1dWq8hx0v9oUdDo5YhMH05mQ2JPsHEzse0mXMEEOLAK6GEUcZvRC4CqmgnwxDB0BJIGMlkQv6jc59LFr00cgmv85+G
 yZJMgwtYXXceXLMSFMCTOoVCacwSr6QgXc03xH3L/L64mpCljAit5ptrfkBEjQZRWM7khWgCQaLxi9OweUkQNPiq5E2akyQSecRvEa1zESUDCdFKRswXaCwa
 RhVk9vyxOhUFIaqtawVLavxQPIMMjU3Pyc5tN3krPGMtP1VLC3lf2OFDAsa160N7XYVepOc4KDn3s9G6nwojq2SfypCr0hsd9oiPS0ZP+e4SK3YHcds1qXRS
 FTVnmWTauYIdVuIl24KurDi8K4vsau1J3YEmFMdZ1eMToiCkzhnyzkw37IeIcJt5YpywTJ/qnwjLEWfQeNXSX01MOzQcpA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2020 14:02, Mauro Carvalho Chehab wrote:
> Em Fri, 17 Apr 2020 14:41:01 +0200
> Jacopo Mondi <jacopo@jmondi.org> escreveu:
> 
>> Add documentation for the V4L2_CID_CAMERA_SENSOR_LOCATION camera
>> control. The newly added read-only control reports the camera device
>> mounting position.
>>
>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>>  .../media/v4l/ext-ctrls-camera.rst            | 32 +++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> index e39f84d2447f..01a9042d53a6 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> @@ -510,6 +510,38 @@ enum v4l2_scene_mode -
>>      value down. A value of zero stops the motion if one is in progress
>>      and has no effect otherwise.
>>  
>> +``V4L2_CID_CAMERA_SENSOR_LOCATION (integer)``
>> +    This read-only control describes the camera sensor location by reporting
>> +    its mounting position on the device where the camera is installed. The
>> +    control value is constant and not modifiable by software. This control is
>> +    particularly meaningful for devices which have a well defined orientation,
>> +    such as phones, laptops and portable devices since the camera location is
>> +    expressed as a position relative to the device's intended usage orientation.
>> +    For example, a camera sensor installed on the user-facing side of a phone,
>> +    a tablet or a laptop device is said to be installed in the
>> +    ``V4L2_LOCATION_FRONT`` location while camera sensors installed on the side
>> +    opposite the front one are said to be installed in the
>> +    ``V4L2_LOCATION_BACK`` location. Camera sensors not directly attached to
>> +    the device or attached in a way that allows them to move freely, such as
>> +    webcams and digital cameras, are said to have the ``V4L2_LOCATION_EXTERNAL``
>> +    location.
>> +
>> +
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +
>> +    * - ``
> ``
>> +      - The camera sensor is located on the front side of the device.
>> +    * - ``V4L2_LOCATION_BACK``
>> +      - The camera sensor is located on the back side of the device.
>> +    * - ``V4L2_LOCATION_EXTERNAL``
>> +      - The camera sensor is not directly attached to the device and is
>> +        freely movable.
> 
> I guess I mentioned this already, but IMHO this ioctl is somewhat flawed,
> for two reasons:
> 
> 1) newer devices may all top of the line mobile devices now are coming
>    with multiple camera sensors at the same side. So, just saying that
>    the location is front or back is not enough. A location syscall would
>    need have something more to better identify the location.
>    It probably doesn't need to be something fancy, but, at least, on a
>    device with 3 back sensors, I would call them as:
> 
> 	V4L2_LOCATION_BACK_1
> 	V4L2_LOCATION_BACK_2
> 	V4L2_LOCATION_BACK_3
> 
>    And add some comment at the control documentation that would allow to
>    uniquely number the other ones, like:
> 
> 	"when multiple sensors are present at the same side, sensors
> 	 will be numbered considering the ``(x,y)`` coordinates of the center
> 	 of each sensor, starting from the topmost, leftmost position.
> 
> 	 She first sensor will be the topmost sensor column at the leftmost
> 	 side. The other sensors that will have the same ``y`` coordinate,
> 	 counting from the left to the right, then increment the ``y`` and
> 	 parse the next column again until all sensors are numbered."

I think this isn't a good idea. In most cases you do not care about this.

And if you do care about this, then wouldn't it be better to do that through
a new control where you provide the precise coordinates in e.g. mm?

BACK_1/2/3 really doesn't tell you anything other than that there are three
sensors on the back, but we knew that already.

If we need support for the precise location in the future, then let's do that
right and not try to shoehorn into something that wasn't meant for it.

> 
> 2) There are also some devices that has a movable sensor, that can either
>    be taking a picture from the front or from the back, like those:
> 
> 	https://www.youtube.com/watch?v=br6G7MrkRUc
> 
>    On such case, the control should not be read-only, as one may need to
>    change this control in order to select if a sensor would either be on
>    FRONT or on BACK position.
> 
>    For such kind of sensors (when we start supporting them), we could 
>    for example call them like:
> 
> 	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_1
> 	V4L2_LOCATION_MOVABLE_IN_BACK_POSITION_2
> 	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_1
> 	V4L2_LOCATION_MOVABLE_IN_FRONT_POSITION_2

I don't like this. If the driver can tell when the position changes, then it
can update the control's value (it's still read-only because userspace
can't write to it, but that doesn't mean it can't be updated). So there is
no need to call it 'MOVABLE', you just report the correct location. And with
QUERYMENU you can tell that it is movable since multiple possible locations
are reported (BACK and FRONT in this example). If it is fixed, then QUERYMENU
will report only a single location.

This might have some consequences for the DT bindings, though. Not sure
how to represent this there.

If the driver cannot tell what the position is, then it makes no sense for
the driver to expose this location control since it clearly is something that
has to be hardcoded in userspace. I.e., there is no point for userspace to
write to the control and then read back what it wrote :-)

So I disagree that there is a need for FIXED vs MOVABLE, this can be
represented nicely with the current proposal.

Regards,

	Hans

> 
>    And add rename the other definitions to:
> 
> 	V4L2_LOCATION_FIXED_FRONT_1
> 	V4L2_LOCATION_FIXED_BACK_1
> 
> Ok, nobody has yet attempted to upstream code for such devices,
> so, we, for now, we don't need to add more than those 3 types.
> 
> But, IMO, we would change the sensors description in a way that it
> would be easier to add support for more than one sensor per location
> in the future, like:
> 
> 	* - ``V4L2_LOCATION_FIXED_FRONT_1``
>           - The camera sensor is fixed, being the first sensor
> 	    located on the front side of the device.
> 	* - ``V4L2_LOCATION_FIXED_BACK_1``
> 	  - The camera sensor is fixed, being the first sensor
> 	    located on the back side of the device.
> 	* - ``V4L2_LOCATION_EXTERNAL``
>           - The camera sensor is not directly attached to the device
> 	    and is freely movable.
> 
> 	.. note:: Please submit a patch upstream if you need to have
> 		  more than one sensor either at front or back position.
> 
> This would make a lot easier when someone upstream patches requiring 
> to locate more than one sensor location, or to support flipping
> sensors.
> 
> Thanks,
> Mauro
> 

