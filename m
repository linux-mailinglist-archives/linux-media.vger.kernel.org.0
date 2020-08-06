Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A115823D92E
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 12:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgHFKPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 06:15:55 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50763 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729120AbgHFKPx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 06:15:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3cw9kgel6ywL53cwAk44Pu; Thu, 06 Aug 2020 12:15:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596708950; bh=gNLyASUNByD3HO6tVw8Df9yaWFza/lOZVkhsrcazWZE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MUbGgnP6qOK0DUanWJ6mS+wyqcw+m2uyg2/UoQ/rDWqe2k/yyQmkLIFQR5YVe/FQm
         diN/h+Y2+cLpYNqyIxjGJcb2AwNqh6y8ji3rpgtsIr66T7ndI07ar+6pYSjTuXaqjy
         BFWSDegel3y5VywdSXNQXY3coWmPXWLP515hBlzs8LbEzhNOqFbot0jjDFIA7ro0tJ
         MStLT1BDTTrmH+83lEcexMcpNyU0yvw5JsS1v0t+IAkR/5E9/PILdoOHAimMSoYpZ4
         dahtm5agbZXlePIzH2tKYx3A1WbJIDVMKH7xbc3vxE1KkE+7wHM7xFZcP1/EiQ2kjG
         57q0rNA7yYFYw==
Subject: Re: [PATCH 2/4] media: docs: Describe targets for sensor properties
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-3-jacopo@jmondi.org>
 <1896673c-ae91-84c3-9573-5da91fb00f41@xs4all.nl>
 <20200806100822.kvlzivbtnqzni3xw@uno.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <851192ea-6498-4f9e-a6b4-bf5164f3c5a7@xs4all.nl>
Date:   Thu, 6 Aug 2020 12:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806100822.kvlzivbtnqzni3xw@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFDgt0kq2D3IT0EjvVdOm5VtmDAHmvuKxFs/+PvvqSYR/7rj+4dTyGp8H4Dl7i/pAJOFEJ/Ni+id5+l9MtFC5Gykn+vAit86U10GRBdzbzl+D7eQjgeB
 Qk8rKiNTtrvRxXvAKteJmLVwBGuPxNqecwGCEg6LuyKOpragdloUWQdymQlpi3UocqfcXdYxoTBKSHKZsogIUdH9EgVZd2LPuJvOuqQgY+4cdxtlTUXMCPe+
 nwVXdJTlbBR2RYHHhyN2KQ3JA0ylVxO2oPuqMkVzHb8vtbxehuhCsabSgi5dwLmqszUl1jXG1jBkWfTG7oWGB5qCX/CdFK2SLy0HLFa2APhdkZKH+KJjrRS3
 aR2QT99c5go6Yaqqzpzj02Lzl2+2kqcN99/bZJTssP57QZ5KEiEAoOqM3iL1YMeYLo7Bz6zWAJIYAic7pP5FQOwMhg0bSLBUh1QdhbjzDqp++E2u4Q7kw5h0
 wlsLvebNFMP8XvGfQbFCIQTz9H75soP8JeumVZro2gch1BL0KItkLqZIwWY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/08/2020 12:08, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Thu, Aug 06, 2020 at 10:45:17AM +0200, Hans Verkuil wrote:
>> On 05/08/2020 12:57, Jacopo Mondi wrote:
>>> Provide a table to describe how the V4L2 selection targets can be used
>>> to access an image sensor pixel array properties.
>>>
>>> Reference the table in the sub-device documentation.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  .../userspace-api/media/v4l/dev-subdev.rst    |  4 ++
>>>  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++++++++++
>>>  2 files changed, 53 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> index c47861dff9b9b..2f7da3832f458 100644
>>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> @@ -467,6 +467,10 @@ desired image resolution. If the sub-device driver supports that, userspace
>>>  can set the analog crop rectangle to select which portion of the pixel array
>>>  to read out.
>>>
>>> +A description of each of the above mentioned targets when used to access the
>>> +image sensor pixel array properties is provided by
>>> +:ref:`v4l2-selection-targets-image-sensor-table`
>>> +
>>>
>>>  Types of selection targets
>>>  --------------------------
>>> diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
>>> index 69f500093aa2a..632e6448b784e 100644
>>> --- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
>>> +++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
>>> @@ -76,3 +76,52 @@ of the two interfaces they are used.
>>>  	modified by hardware.
>>>        - Yes
>>>        - No
>>> +
>>> +
>>> +.. _v4l2-selection-targets-image-sensor-table:
>>> +
>>> +********************************************
>>> +Selection Targets For Pixel Array Properties
>>> +********************************************
>>> +
>>> +The V4L2 selection API can be used to retrieve the size and disposition of the
>>> +pixel units that compose and image sensor pixel matrix when applied to a video
>>> +sub-device that represents an image sensor.
>>> +
>>> +A description of the properties associated with each of the sensor pixel array
>>> +areas is provided by the :ref:`v4l2-subdev-pixel-array-properties` section.
>>> +
>>> +.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p(1.4cm)|
>>> +
>>> +.. flat-table:: Selection target definitions
>>> +    :header-rows:  1
>>> +    :stub-columns: 0
>>> +
>>> +    * - Target name
>>> +      - id
>>> +      - Definition
>>> +      - Read/Write
>>> +    * - ``V4L2_SEL_TGT_CROP``
>>> +      - 0x0000
>>> +      - The analog crop rectangle. Represents the portion of the active pixel
>>> +        array which is processed to produce images.
>>> +      - RW
>>> +    * - ``V4L2_SEL_TGT_CROP_DEFAULT``
>>> +      - 0x0001
>>> +      - The active pixel array rectangle. It includes only active pixels and
>>> +        excludes other ones such as optical black pixels. Its width and height
>>> +        represent the maximum image resolution an image sensor can produce.
>>> +      - RO
>>> +    * - ``V4L2_SEL_TGT_CROP_BOUNDS``
>>> +      - 0x0002
>>> +      - The readable portion of the physical pixel array matrix. It includes
>>> +        pixels that contains valid image data and calibration pixels such as the
>>> +        optical black ones.
>>> +      - RO
>>> +    * - ``V4L2_SEL_TGT_NATIVE_SIZE``
>>> +      - 0x0003
>>> +      - The physical pixel array size, including readable and not readable
>>> +        pixels. As pixels that cannot be read from application processor are not
>>> +        relevant for calibration purposes, this rectangle is useful to calculate
>>> +        the physical properties of the image sensor.
>>> +      - RO
>>>
>>
>> Hmm, this basically just duplicates the previous patch.
>>
>> I think you are documenting things at the wrong place. What you documented in the
>> previous patch really belongs here since it is shared between the subdev API and the
>> regular V4L2 API. And in dev-subdev.rst you then refer to here.
> 
> I originally had it here, but then I moved to dev-subdev as an image
> sensor will always be represented as a video sub-device, doen't it ?

No. Some camera drivers are V4L2 only, most notably uvc. Also there are several simple
platform drivers that don't use the subdev API.

> 
>>
>> Frankly, the selection API documentation is a mess. It's spread out over various sections:
> 
> I know :(
> 
>> The VIDIOC_G/S_SELECTION and VIDIOC_SUBDEV_G/S_SELECTION descriptions in the Function Reference,
>> section 8 ("Common definitions for V4L2 and V4L2 subdev interfaces"), 1.25 "Cropping, composing
>> and scaling – the SELECTION API" and 4.13.3.2-4.13.3.3 "Selections: cropping, scaling and composition".
>>
>> In my view section 8 should be moved to section 1.25.2. Ideally 1.25 should be rewritten for both
>> the V4L2 and V4L2 subdev APIs, but that's a lot of work.
> 
> That's a lot of work indeed. But it could be split as
> 
> 1) Augment the 1.25.1 section with a mention of subdev, maybe using
>    pieces of 4.13.3.2
> 2) Move what's in section 8 to be 1.25.x
>    Actually merging 1.25.2 and 8.1.1, splitting 1.25.2 in a device and
>    sub-device section
>>
>> I would suggest that you add a first patch that moves section 8 to 1.25.2. Note that I don't like
>> the tables for the selection targets and flags: the 'Valid for V4L2/V4L2 subdevs' columns should
>> be removed and it should either be mentioned in the definition if a target/flag is invalid for
>> an API, or it should be put in a separate table.
> 
> Two tables seems about right
> 
>>
>> And in 1.25.2 perhaps a new picture can be created for the specific sensor use-case that includes
>> the NATIVE_SIZE target.
> 
> I know 'image sensor' is not an API concept like device and subdevice,
> but if we split 1.25.2 in 'video device' and 'subdevice' parts, a
> section for 'image sensors' with what I've now put in section 4.13.3.3
> (the description of the sensor array areas) could fit there ?

I think so.

> 
> Seems like a long re-work. Can the imx219 patch be broke out and
> fast-tracked ?

Yes.

Regards,

	Hans

> 
> Thanks
>   j
> 
>>
>> Another pet peeve of mine is that section 8 splits the selection targets and flags into separate
>> subsections. I'd just keep it in one section.
>>
>> Regards,
>>
>> 	Hans

