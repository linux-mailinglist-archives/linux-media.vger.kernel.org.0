Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601AE23D900
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 11:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729246AbgHFJ7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 05:59:02 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47263 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729072AbgHFJ6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 05:58:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3cfPkgYiMywL53cfQk41BL; Thu, 06 Aug 2020 11:58:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596707913; bh=5JXbKgf63QVLKGGLkUFPCqfAkSQdJKzIvSOnHkq4rVM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GMKF/dyqKNpyC7GNHZAIXlI2nPI2WBuH0/KScNw0qUOm/FJues3eMXLlGJQL68vQ7
         RPaOfzzIv338agcqLNIOLvwHpLGKdsDLo3mj/O7KouJlqpxMU7aiw4LYRpVooCqj83
         0DDTrjjOuYQTR2+2cKFNImnNxNzBTUZti0TBG/SE72nfS8twuyhnRRtv7G07B3lggg
         71FJ5IP+tUJHuE9gxsKDghFVlVUXOLsd0czi8yrUKVtOi7BKFs4AHKMFKDloZnPBGg
         YjPRqaIe81yVcvdE4DfYMcv3SjMp5Ki6NyDTG58Ure+o/UMuUkwt4VezYQ2BgoaxFX
         fNY/rA7L0fQcg==
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
 <184f8787-ebf1-90e3-82b3-44fa66e65a84@xs4all.nl>
 <20200806095038.tc6mmwknqdinaeth@uno.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f4e50cbb-8b25-1269-d8b9-9c81fa73b7e1@xs4all.nl>
Date:   Thu, 6 Aug 2020 11:58:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806095038.tc6mmwknqdinaeth@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOlaVSnd2HzorfG+f3KpcOhibeiNtEKTMg46QVABODSvwqAfMLtR2/zrrFllfZiDqCRCev0xlV2WpeGAdD1EOQA7E4Q5+kE7kG6yBPoUsj/w6KFbVKM7
 heKgceLEHjeHA717zvv3T0OeGQnXnwlaGwFaajMeCaeh1K4rh/otCqiNgD7IPXaEFxsF+w1bIeUZtY1o8IJYkObc1tFC09+Cj8xkkqSwgz0Hhp2rKP8yMS12
 t+PaQd18hQ9mIgPMdHZlK6yjs0XBLLZSB6Kzmvpt4xCfp1OwBVE9t518Db4Y8x/xAYyPGZHJ941xmVei8fB0xLAmVUhU1Hm+jURPowne9ZzWQXZQ7SBhjrZf
 q9RKALUqsAhvKIosPs5jMRtTm/TQoIUFRbxhYJg3RL2KKO1Pq+BgfwhDydA1vBwkZym1y6I7pZGreegQkgGjzdmKgt+rUTg0i94pvHFW03sCBpOpH9IXRD1f
 C6N7fRORccceTimvc4nJhKCRqI0xiOd+gV/ovA9P0DoAkmIKiqco5lwNHhY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/08/2020 11:50, Jacopo Mondi wrote:
> Hi Hans,
> 
> On Thu, Aug 06, 2020 at 10:05:37AM +0200, Hans Verkuil wrote:
>> Hi Jacopo,
>>
>> Some review comments below:
>>
>> On 05/08/2020 12:57, Jacopo Mondi wrote:
>>> The V4L2 selection API are also used to access the pixel array
>>
>> are -> is
>>
>>> properties of an image sensor, such as the size and position of active
>>> pixels and the cropped area of the pixel matrix used to produce images.
>>>
>>> Currently no clear definition of the different areas that compose an
>>> image sensor pixel array matrix is provided in the specification, and
>>> the actual meaning of each selection target when applied to an image
>>> sensor was not provided.
>>>
>>> Provide in the sub-device documentation the definition of the pixel
>>> matrix properties and the selection target associated to each of them.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  .../userspace-api/media/v4l/dev-subdev.rst    | 81 +++++++++++++++++++
>>>  1 file changed, 81 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> index 134d2fb909fa4..c47861dff9b9b 100644
>>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
>>> @@ -386,6 +386,87 @@ requests on all selection targets, unless specifically told otherwise.
>>>  ``V4L2_SEL_FLAG_GE`` and ``V4L2_SEL_FLAG_LE`` flags may be used to round
>>>  the image size either up or down. :ref:`v4l2-selection-flags`
>>>
>>> +.. _v4l2-subdev-pixel-array-properties:
>>> +
>>> +Selection targets for image sensors properties
>>> +----------------------------------------------
>>> +
>>> +The V4L2 selection API can be used on sub-devices that represent an image
>>> +sensor to retrieve the sensor's pixel array matrix properties by using the
>>> +:ref:`selection <VIDIOC_SUBDEV_G_SELECTION>` ioctls.
>>> +
>>> +Sub-device drivers for image sensor usually register a single source pad, but in
>>> +the case they expose more, the pixel array properties can be accessed from
>>> +any of them.
>>> +
>>> +The ``V4L2_SEL_TGT_NATIVE``, ``V4L2_SEL_TGT_CROP_BOUNDS``,
>>
>> V4L2_SEL_TGT_NATIVE -> V4L2_SEL_TGT_NATIVE_SIZE
>>
>> (same mistake is made elsewhere).
> 
> Ah ups, I used TGT_NATIVE consistently, seems like I thought that was
> the right name
> 
>>
>>> +``V4L2_SEL_TGT_CROP_DEFAULT`` and ``V4L2_TGT_CROP`` targets are used to retrieve
>>> +the immutable properties of the several different areas that compose the sensor
>>> +pixel array matrix. Each area describes a rectangle of logically adjacent pixel
>>> +units. The logical disposition of pixels is defined by the sensor read-out
>>> +starting point and direction, and may differ from the physical disposition of
>>> +the pixel units in the pixel array matrix.
>>> +
>>> +Each pixel matrix portion is contained in a larger rectangle, with the most
>>> +largest being the one that describes the pixel matrix physical size. This
>>> +defines a hierarchical positional system, where each rectangle is defined
>>> +relatively to the largest available one among the ones exposed by the
>>> +sub-device driver. Each selection target and the associated pixel array portion
>>> +it represents are below presented in order from the largest to the smallest one.
>>> +
>>> +Pixel array physical size
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +The image sensor chip is composed by a number of physical pixels, not all of
>>> +them readable by the application processor. Invalid or unreadable lines might
>>> +not be transmitted on the data bus at all, or in case on CSI-2 capable sensors
>>> +they might be tagged with an invalid data type (DT) so that the receiver
>>> +automatically discard them. The size of the whole pixel matrix area is
>>> +retrieved using the V4L2_SEL_TGT_NATIVE target, which has its top-left corner
>>> +defined as position (0, 0). All the other selection targets are defined
>>> +relatively to this, larger, rectangle. The rectangle returned by
>>> +V4L2_SEL_TGT_NATIVE describes an immutable property of the image sensor, it
>>> +does not change at run-time and cannot be modified from userspace.
>>
>> It is a good idea to mention that if there are no invalid or unreadable pixels/lines,
>> then V4L2_SEL_TGT_NATIVE_SIZE == V4L2_SEL_TGT_CROP_BOUNDS.
> 
> Yes it is! I'll add it here
> 
>>
>>> +
>>> +Pixel array readable area
>>> +^^^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +The V4L2_SEL_TGT_CROP_BOUNDS targets returns size and position of the readable
>>> +area of the pixel array matrix, including pixels with valid image data and pixel
>>> +used for calibration purposes, such as optical black pixels. It is not unlikely
>>> +that valid pixels and optical black pixels are surrounded by non-readable rows
>>> +and columns of pixels. Those does not concur in the definition of the
>>> +V4L2_SEL_TGT_CROP_BOUNDS rectangle. The rectangle returned by
>>> +V4L2_SEL_TGT_CROP_BOUNDS describes an immutable property of the image sensor, it
>>> +does not change at run-time and cannot be modified from userspace.
>>
>> Mention that BOUNDS is enclosed by NATIVE_SIZE.
>>
> 
> I tried to express that in the intro section with
> 
> "Each pixel matrix portion is contained in a larger rectangle, with the most
> largest being the one that describes the pixel matrix physical size."
> 
> But I guess it's worth to express that for each target!
> 
>>> +
>>> +Pixel array active area
>>> +^^^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +The portion of the pixel array which contains valid image data is defined as the
>>> +active area of the pixel matrix. The active pixel array is is accessed by mean
>>
>> mean -> means
>>
>>> +of the V4L2_SEL_TGT_CROP_DEFAULT target, and is contained in the larger
>>> +V4L2_SEL_TGT_CROP_BOUNDS rectangle. It represents the largest possible frame
>>> +resolution the sensor can produce and defines the dimension of the full
>>> +field-of-view. The rectangle returned by V4L2_SEL_TGT_CROP_BOUNDS describes an
>>
>> BOUNDS -> DEFAULT
>>
> 
> ups
> 
>>> +immutable property of the image sensor, it does not change at run-time and
>>> +cannot be modified from userspace.
>>
>> Mention that CROP_DEFAULT is enclosed by CROP_BOUNDS
>>
>>> +
>>> +Analog crop rectangle
>>
>> Why analog? It's just the crop rectangle, nothing analog about it.
>>
> 
> We used the 'analogCrop' term in libcamera to differentiate the
> cropping which happens on the sensor pixel array matrix to select the
> region to process and produce image from. Sensor with an on-board
> scaler can perform other cropping steps to implement, in example digital
> zoom, so we expect to have a 'digital crop' phase as well. RAW
> sensors, in example, will only have an analogCrop rectangle.
> 
> Quoting the libcamera definition of analog crop:
> 
>  * horizontal and vertical sizes define the portion of the pixel array which
>  * is read-out and provided to the sensor's internal processing pipeline, before
>  * any pixel sub-sampling method, such as pixel binning, skipping and averaging
>  * take place.
> 
> should I keep it or remove it ?

It's a very confusing term. Especially since this API can also be used with analog
video capture devices (Composite/S-Video) where the video signal actually is analog.

In the V4L2 API there is no such thing as 'analog crop', so please remove it.

> 
>>> +^^^^^^^^^^^^^^^^^^^^^
>>> +
>>> +The sensor driver might decide, in order to adjust the image resolution to best
>>> +match the one requested by applications, to only process a part of the active
>>> +pixel array matrix. The selected area is read-out and processed by the image
>>> +sensor on-board ISP in order to produce images of the desired size and
>>> +resolution while possible maintaing the largest possible field-of-view. The
>>
>> maintaing -> maintaining
>>
>> Actually, I'd drop 'while possible maintaing the largest possible field-of-view'
>> entirely. It doesn't make much sense.
> 
> Ack
> 
>>
>>> +cropped portion of the pixel array which is used to produce images is returned
>>> +by the V4L2_SEL_TGT_CROP target and represent the only information that can
>>
>> represent -> represents
>>
>>> +change at runtime as it depends on the currently configured sensor mode and
>>> +desired image resolution. If the sub-device driver supports that, userspace
>>> +can set the analog crop rectangle to select which portion of the pixel array
>>
>> s/analog//
>>
>>> +to read out.
>>
>> Mention that CROP is enclosed by CROP_BOUNDS and defaults to CROP_DEFAULT.
>>
>> Make a note that CROP can also be used to obtain optical black pixels.
>>
> 
> What about:
> 
> +desired image resolution. If the sub-device driver supports that, userspace
> +can set the analog crop rectangle to select which portion of the pixel array
> +to read out including, if supported, optical black pixels.

Hmm, that's a bit awkward. How about:

+desired image resolution. If supported by the sub-device driver, userspace
+can set the crop rectangle to select which portion of the pixel array
+to read out. This may include optical black pixels if those are part of
+V4L2_SEL_TGT_CROP_BOUNDS.

Regards,

	Hans

> 
> ?
> 
> Thanks
>   j
> 
>>> +
>>>
>>>  Types of selection targets
>>>  --------------------------
>>>
>>
>> Regards,
>>
>> 	Hans

