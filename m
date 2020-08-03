Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B5C23A190
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgHCJHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 05:07:43 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:34903 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725907AbgHCJHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 05:07:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2WRWkmjIxuuXO2WRXkbeso; Mon, 03 Aug 2020 11:07:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596445659; bh=EqUk9GcEZtsBypCIj6LmZZULyVMnU4zfU00tqyyDETU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SPxg41ZZpl48HvtS6C30ITD9zP6tZvy7bEPt6molJahgRqKz3qJkCxmfOucDeBRhb
         7nsnUqwU3PH4bE7oXRF/DKL0RzC/3O41zCxKCwK51pagc8mDwLjXBpDbA4xeqgi0Rj
         CGvVceNoaBGKh1O+He8zFqgq4FVBfeqHVCq6UHUfZpGSJRPSBIHmlQztcu6axALTUI
         6+iQfNme4uGj6E8vDknd7g1YWz6KmrfcmIJUws5vBMFlLRhRzzc+hEUsRs8zPepzKJ
         WNZ1pijuCo3RT48chRFmOcg0yZmHBgqqOVRsqUqZdsjIpF7rTm0WGuObhGYoBcaszz
         H20bndidczUbg==
Subject: Re: [PATCH] imx219: selection compliance fixes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        libcamera-devel@lists.libcamera.org
References: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
 <20200801111903.zt2d2djusjdh27vc@uno.localdomain>
 <20200801151317.GF11820@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ded11ad4-29b9-1cce-5150-ca8253b1a862@xs4all.nl>
Date:   Mon, 3 Aug 2020 11:07:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200801151317.GF11820@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF4Gn3q0oIZs5N/9b0ragvQRJvAROi9+9MHRyB0bGoqIRvevH8BHaKUyXI0O0rgrUzfT7cJJulq9ZSStR+TEDzCNh/gB4fHf1UZZMI+anntwNcZbnVwH
 mdJa1YBqGWfnLc+UGmC/tmduzrb+10j8RyuvmpKIzdwClXKroKAUCwKAhTBr3AaC9O8iHS7ZBZD0CkHfTDi4iIBYEENm2VfQELomMQ0hUETM8BAZThq66Ee6
 6MRnb7QhKm00mwkkofZNIzptoX05J7S9yUZ757eUEUYEWheE3TcCRDJfXBtNMB/VJxsh23GoBfR2/3fiOo6tYW2MxKcrjhLvgXfL6FqOoMfe6iFo5+zvddDT
 P/4A+JPYZOVC8sqwitsgKxDVVOfYTdXgbapb2Jznp8HCpmB3HbTyk0Q8ICL7f3FN1Wpv4X+ggR5bMYPhD+eRrjn4+CE44/jj8kniXuIFp4xj0Ej0vryAM/2G
 mqDBVGx70SnjB99MnxF5HMwjJ1lc+IQJRuzYjET5fTDFae7tfZqQGJ9cBGu7Rg6ZBd1aN5VNm16u57NcVxH5pJJG8k97ZdnBn7/GVBGmbUQ54DU6aEZGVZyY
 ZLPYqa0cb0ERGyN6OAadWtAJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/08/2020 17:13, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Sat, Aug 01, 2020 at 01:19:03PM +0200, Jacopo Mondi wrote:
>> Hi Hans, Laurent,
>>
>>     sorry, long email, contains a few things on the general definition
>>     of the selection target, a question for libcamera, and a few more
>>     details at the end.
>>
>> Adding Sakari, libcamera ml, Ricardo which helped with the
>> definition of pixel array properties in libcamera recently and
>> Dave and Naush as this sensor is the RPi camera module v2 and some
>> information on the sensor come from their BSP.
>>
>> On Thu, Jul 02, 2020 at 03:50:04PM +0200, Hans Verkuil wrote:
>>> The top/left crop coordinates were 0, 0 instead of 8, 8 in the
>>> supported_modes array. This was a mismatch with the default values,
>>> so this is corrected. Found with v4l2-compliance.
>>>
>>> Also add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and CROP_BOUNDS
>>> always go together. Found with v4l2-compliance.
>>
>> Let me try to summarize the outcome of the discussion
>>
>> 1) All selection rectangles are defined in respect to the NATIVE_SIZE
>>    target, which returns the full pixel array size, which includes
>>    readable and non-readable pixels. It's top-left corner is in
>>    position (0,0)
> 
> Yes, except that, to be pedantic, it's not that the top-left corner *is*
> in position (0,0) but that the top-left corner is defined as (0,0).
> NATIVE_SIZE is the root of the coordinates system, and by definition the
> top-left coordinates must be set to (0,0).
> 
>> 3) CROP_BOUND returns the portion of the full pixel array which can be
>>    read out, including optical black pixels, and is defined in respect
>>    to the full pixel array size
> 
> Yes. I'd say it's defined in respect to NATIVE_SIZE to avoid the
> indirection in the definition (NATIVE_SIZE and pixel array size are the
> same).
> 
> This maps to the libcamera PixelArraySize property in libcamera.
> 
>> 2) CROP_DEFAULT returns the portion of the readable part of the pixel array
>>    which contains valid image data (aka 'active' pixels). It is again
>>    defined in respect to the full pixel array rectangle returned by
>>    NATIVE_SIZE target.
> 
> Correct.
> 
> This maps to the PixelArrayActiveAreas property in libcamera (assuming
> the property contains a single value).
> 
>> With an ack on my understanding, I think it's worth expanding the
>> target documentation a bit. As I've said I've been hesitant in doing
>> so, as those targets do not only apply to image sensors, but I think a
>> section that goes like "If the sub-device represents and image sensor
>> then the V4L2_SEL_TGT_.. target represents ... "
> 
> It's totally fine by me to add a section that defines the targets
> precisely for sensors.
> 
>> Laurent: this will have some impact on libcamera as well
>> https://git.linuxtv.org/libcamera.git/tree/src/libcamera/camera_sensor.cpp#n503
>> When we read the analogCrop rectangle, we decided it is defined in
>> respect to the active portion of the pixel array (CROP_DEFAULT) and
>> not from the full pixel array size (NATIVE_SIZE).
> 
> Note that the non-readable portion of NATIVE_SIZE has no impact in
> practice. A sensor driver could return NATIVE_SIZE == CROP_BOUND, as
> long as CROP_BOUND, CROP_DEFAULT and CROP are all expressed relatively
> to NATIVE_SIZE, it will make no difference for userspace.
> 
> We could thus mandate that NATIVE_SIZE == CROP_BOUND to simplify things.

Grepping for V4L2_SEL_TGT_NATIVE_SIZE shows it being used in three drivers:

imx219, smiapp and coda. The use in coda is bogus (seems to be a left-over of old
code) and it can be removed in that driver.

It's not quite clear how it is used in smiapp: it appears to be mapped to
CROP_BOUNDS as well, but it is only exposed if the drivers knows the native size.

Going back to Sailus' original patch series from 2014 adding the NATIVE_SIZE
target, it appears that it was added as a CROP_BOUNDS replacement. From the
cover letter:

"The two latter patches create a V4L2_SEL_TGT_NATIVE_SIZE target which is
used in the smiapp driver. The CROP_BOUNDS target is still supported as
compatibility means."

and from patch 5/5 ("smiapp: Support V4L2_SEL_TGT_NATIVE_SIZE"):

"Add support for selection target V4L2_SEL_TGT_NATIVE_SIZE. It is equivalent
of what V4L2_SEL_TGT_CROP_BOUNDS used to be. Support for
V4L2_SEL_TGT_CROP_BOUNDS is still supported by the driver as a compatibility
interface."

So in the context of sensors NATIVE_SIZE == CROP_BOUNDS. What I can't remember
is why this new target was added if it acts the same as CROP_BOUNDS.

There is a valid use-case for NATIVE_SIZE for hardware that can create a 'canvas'
of a programmable size in which incoming video streams are composed and the whole
canvas is streamed out. But we don't have such devices at the moment.

Regards,

	Hans
