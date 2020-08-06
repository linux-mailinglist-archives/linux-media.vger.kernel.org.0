Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D3923DB63
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 17:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgHFOUQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 10:20:16 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57845 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726150AbgHFOTz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 10:19:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3fkQkhdO1ywL53fkRk4Xfb; Thu, 06 Aug 2020 15:15:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596719755; bh=wGB2xCe1fjPvlGuz/wKVKuCa5euw35OniJ/tqt+nDxw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gKZZqyorAgaoRODpsGKov1BYoRENjf9zTfCcsCqbx04HLMWvcOc7b0uQmW8u8aAN8
         01NaThFY72VwUtEdh3zoi0BD/uHMH1lL4bm54e77eDqq4QrTxrOtoHEg8SSp9b6DPY
         k938e8faicytENHmYVMEi4051cEuVwz8iSX4hWudxn32sZZCqZ5f+6B0Adm3kAhWOE
         RKBImdsiG/Xu/mFpCJoDVuMyNQFSMZM8fUIvDfMYZwgCOjI1FJ3Xz4eYqxil9BbOdU
         cMLM4Bm674OPKGi+c03m8B+FLFZ7LKnbO9ZFLrtD76Tj/qRD/pDz0jgw70nNFktV+D
         uYWjI4jb1tz9w==
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
 <851192ea-6498-4f9e-a6b4-bf5164f3c5a7@xs4all.nl>
 <20200806124523.llccxvcz65ohqqwq@uno.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <db04abc6-c9a7-7170-05f3-0238e84c4445@xs4all.nl>
Date:   Thu, 6 Aug 2020 15:15:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806124523.llccxvcz65ohqqwq@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGzgtmk1JexUg2VEwGo5asrsXI0A7wQlNuAQks8si48bY8g40GvwMvFjPBSsRh15Q575WuvBfqdV0C37WShNg1Ss0nl+aKIxy6fyRmh70nTbFlFqOSA3
 RnHJpHT//SQ9OUUKFnOZcN5JzOrkSWpKhWqRQquLA+THMWGGrinDPMn0iOust2FBTBK4fuKV5CUpn1IAcrdHfo5VSUcUSaXYzFevW2qR8WOSZ17Pz47YkHh2
 iljJkX2S81HT2WNwvZnWfrymcim3P34wSbCd7p7xXUBTgEailvpSX2786S6frNQtkkbPBpbcm860mZRVWS47ff9bb211p4gAGZgxQtIJZHqZKPp125R4OsTe
 IQLy86T1V/5tjlIaERg/so1P17AG7pHdAAxZCG1nksKCLwkycbL+ANJ8+wVJuYVC/FAjjS8E3VYtNxcF5rQ8TMsiNkSm1dzozw1I+AXqBDvSvp0A7T/i4OQy
 L2r1gq/futoW36BexD5XHL6yf5Yi5gCL23/ZkxRdxnYvt5pkXVM6QB7X37I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/08/2020 14:45, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Thu, Aug 06, 2020 at 12:15:49PM +0200, Hans Verkuil wrote:
>> On 06/08/2020 12:08, Jacopo Mondi wrote:
>>> Hi Hans,
>>>
>>> On Thu, Aug 06, 2020 at 10:45:17AM +0200, Hans Verkuil wrote:
>>>> On 05/08/2020 12:57, Jacopo Mondi wrote:
>>>>> Provide a table to describe how the V4L2 selection targets can be used
>>>>> to access an image sensor pixel array properties.
>>>>>
>>>>> Reference the table in the sub-device documentation.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>>> ---
>>>>>  .../userspace-api/media/v4l/dev-subdev.rst    |  4 ++
>>>>>  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++++++++++
>>>>>  2 files changed, 53 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>>>> index c47861dff9b9b..2f7da3832f458 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>>>> @@ -467,6 +467,10 @@ desired image resolution. If the sub-device driver supports that, userspace
>>>>>  can set the analog crop rectangle to select which portion of the pixel array
>>>>>  to read out.
>>>>>
>>>>> +A description of each of the above mentioned targets when used to access the
>>>>> +image sensor pixel array properties is provided by
>>>>> +:ref:`v4l2-selection-targets-image-sensor-table`
>>>>> +
>>>>>
>>>>>  Types of selection targets
>>>>>  --------------------------
>>>>> diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
>>>>> index 69f500093aa2a..632e6448b784e 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
>>>>> @@ -76,3 +76,52 @@ of the two interfaces they are used.
>>>>>  	modified by hardware.
>>>>>        - Yes
>>>>>        - No
>>>>> +
>>>>> +
>>>>> +.. _v4l2-selection-targets-image-sensor-table:
>>>>> +
>>>>> +********************************************
>>>>> +Selection Targets For Pixel Array Properties
>>>>> +********************************************
>>>>> +
>>>>> +The V4L2 selection API can be used to retrieve the size and disposition of the
>>>>> +pixel units that compose and image sensor pixel matrix when applied to a video
>>>>> +sub-device that represents an image sensor.
>>>>> +
>>>>> +A description of the properties associated with each of the sensor pixel array
>>>>> +areas is provided by the :ref:`v4l2-subdev-pixel-array-properties` section.
>>>>> +
>>>>> +.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p(1.4cm)|
>>>>> +
>>>>> +.. flat-table:: Selection target definitions
>>>>> +    :header-rows:  1
>>>>> +    :stub-columns: 0
>>>>> +
>>>>> +    * - Target name
>>>>> +      - id
>>>>> +      - Definition
>>>>> +      - Read/Write
>>>>> +    * - ``V4L2_SEL_TGT_CROP``
>>>>> +      - 0x0000
>>>>> +      - The analog crop rectangle. Represents the portion of the active pixel
>>>>> +        array which is processed to produce images.
>>>>> +      - RW
>>>>> +    * - ``V4L2_SEL_TGT_CROP_DEFAULT``
>>>>> +      - 0x0001
>>>>> +      - The active pixel array rectangle. It includes only active pixels and
>>>>> +        excludes other ones such as optical black pixels. Its width and height
>>>>> +        represent the maximum image resolution an image sensor can produce.
>>>>> +      - RO
>>>>> +    * - ``V4L2_SEL_TGT_CROP_BOUNDS``
>>>>> +      - 0x0002
>>>>> +      - The readable portion of the physical pixel array matrix. It includes
>>>>> +        pixels that contains valid image data and calibration pixels such as the
>>>>> +        optical black ones.
>>>>> +      - RO
>>>>> +    * - ``V4L2_SEL_TGT_NATIVE_SIZE``
>>>>> +      - 0x0003
>>>>> +      - The physical pixel array size, including readable and not readable
>>>>> +        pixels. As pixels that cannot be read from application processor are not
>>>>> +        relevant for calibration purposes, this rectangle is useful to calculate
>>>>> +        the physical properties of the image sensor.
>>>>> +      - RO
>>>>>
>>>>
>>>> Hmm, this basically just duplicates the previous patch.
>>>>
>>>> I think you are documenting things at the wrong place. What you documented in the
>>>> previous patch really belongs here since it is shared between the subdev API and the
>>>> regular V4L2 API. And in dev-subdev.rst you then refer to here.
>>>
>>> I originally had it here, but then I moved to dev-subdev as an image
>>> sensor will always be represented as a video sub-device, doen't it ?
>>
>> No. Some camera drivers are V4L2 only, most notably uvc. Also there are several simple
>> platform drivers that don't use the subdev API.
> 
> Do we expect to be able to retrieve sensor array properties from video
> device nodes which represents, in my understanding a DMA engine that
> writes data to memory ? As I see it, not subdev for the image sensor,
> no pixel array properties. How can these be exposed by a video device
> which abstracts the full capture pipeline ?

They will typically ask the subdev driver. The vidioc_g_selection op
implementation will in turn call the get_selection op of the sensor subdev
driver and pass that information back to userspace.

There is nothing subdev specific to this API.

Regards,

	Hans
