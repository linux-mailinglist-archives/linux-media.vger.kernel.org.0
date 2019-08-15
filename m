Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22E858EE6D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731935AbfHOOkJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:40:09 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50157 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731530AbfHOOkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:40:09 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGv5hwP37DqPeyGv8hYYW0; Thu, 15 Aug 2019 16:40:07 +0200
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
 <664fe7b3-9051-30da-736e-710a4e9cecde@xs4all.nl>
 <d60e4664-3a3f-1723-6c96-4fc822b6a7bb@xs4all.nl>
 <20190815143423.vaoswb4jvzd2blxp@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cb36e8a0-b941-ff37-e58c-0f9b7f62116a@xs4all.nl>
Date:   Thu, 15 Aug 2019 16:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190815143423.vaoswb4jvzd2blxp@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBXmdoRG6SqSWrIh2Ld6aZRwkKsBqGQCUhW+GjxLiXTbYf4+n0aNJb8LBfyk0kWf0UDuV1Wu3QWpYEuUh14tqeZGTuIbcFC1X8DwZPzTo1LVldc7+6sR
 ku9tqsCbG41mtmdmHUIHTwk+8QkXeUAEwOKM6FNE6/N7DXo3elUIefDZNjEghImgvW2JphtX8j4OAsFftMq30sj7mSAPov5HljuG631NRjx8+REkwz8wIPi2
 049j6QlGyF9PEvqIxFNgF60UZv39LWgHzYi+JalgyE+YHEZmXrNt09G9bkuy+zbEdVJNgIvkROp98swKdcsmibmMYWr7CvgH9sydBR84O43TZyg8QCjOnZBQ
 5HSJ6C5mGZLv7PkmBUjTVQsQmHV/HG7BxfLaCF9Y3cDXKlH5vJHIzJKRLMCrtMQLwhHrEzmhzKf20ovg8XELOp1XLh4iGKGwfgwbQQAtUSB/ljcKTIZVg8gp
 6NW3NNuSu9bi9UKr
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 4:34 PM, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Thu, Aug 15, 2019 at 04:14:38PM +0200, Hans Verkuil wrote:
>> On 8/15/19 4:10 PM, Hans Verkuil wrote:
>>> On 8/15/19 12:43 AM, Laurent Pinchart wrote:
>>>> Hi Jacopo,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Wed, Aug 14, 2019 at 10:28:12PM +0200, Jacopo Mondi wrote:
>>>>> Add documentation for the V4L2_CID_LOCATION camera control. The newly
>>>>> added read-only control reports the camera device mounting position.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>>> ---
>>>>>  .../media/uapi/v4l/ext-ctrls-camera.rst       | 23 +++++++++++++++++++
>>>>>  1 file changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>>>>> index 51c1d5c9eb00..fc0a02eee6d4 100644
>>>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>>>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-camera.rst
>>>>> @@ -510,6 +510,29 @@ enum v4l2_scene_mode -
>>>>>      value down. A value of zero stops the motion if one is in progress
>>>>>      and has no effect otherwise.
>>>>>
>>>>> +``V4L2_CID_LOCATION (integer)``
>>>>
>>>> Maybe V4L2_CID_CAMERA_SENSOR_LOCATION ? Same for the values below.
>>>
>>> Probably a better name, if a bit long. But we might need other location
>>> controls in the future (e.g. flash location), so CID_LOCATION is just too
>>> generic.
>>
> 
> Thanks for the feedback.
> 
>> Note that the location defines themselves can most likely be used with any
>> LOCATION control, so V4L2_LOCATION_FRONT would be fine with any control.
>>
> 
> What do you think instead of the control type? Would a single integer
> control do or an integer menu one would be better? I see merit in both
> proposals actually...

Single integer. It's read-only, so it just reports the location.

It would be different if this was a writable control: then you need to
know which locations are possible to set, and that requires a menu type.

But it doesn't make sense to set the location from software. However, the
location might change as a result of other changes: e.g. if the camera
has motor control of the tilt and the tilt changes from forward facing to
downward facing, then the driver might change the location from FRONT
to DOWN. A convoluted example perhaps, but this is just brainstorming.

Regards,

	Hans

> 
> Once this is clarified, I can send a proper v1.
> 
> Thanks
>   j
> 
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>>
>>>>> +    This read-only control describes the camera location by reporting its
>>>>
>>>> Here too I would mention camera sensor instead of just camera (or
>>>> possibly imaging sensor).
>>>>
>>>>> +    mounting position on the device where the camera is installed. This
>>>>> +    control is particularly meaningful for devices which have a well defined
>>>>> +    orientation, such as phones, laptops and portable devices as the camera
>>>>> +    location is expressed as a position relative to the device intended
>>>>> +    usage position. In example, a camera installed on the user-facing side
>>>>> +    of a phone device is said to be installed in the ``V4L2_LOCATION_FRONT``
>>>>> +    position.
>>>>
>>>> The DT bindings could use such an example :-) I would extend this to
>>>> tablets and laptops.
>>>>
>>>>> +
>>>>> +
>>>>> +
>>>>
>>>> Do we need three blank lines ?
>>>>
>>>>> +.. flat-table::
>>>>> +    :header-rows:  0
>>>>> +    :stub-columns: 0
>>>>> +
>>>>> +    * - ``V4L2_LOCATION_FRONT``
>>>>> +      - The camera device is located on the front side of the device.
>>>>> +    * - ``V4L2_LOCATION_BACK``
>>>>> +      - The camera device is located on the back side of the device.
>>>>> +
>>>>> +
>>>>> +
>>>>>  .. [#f1]
>>>>>     This control may be changed to a menu control in the future, if more
>>>>>     options are required.
>>>>
>>>
>>

