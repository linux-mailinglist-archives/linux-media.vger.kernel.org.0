Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8570F1C3E8D
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 17:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgEDPcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 11:32:50 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:60571 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729395AbgEDPct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 11:32:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Vd5GjOm0ihEkrVd5JjvB9S; Mon, 04 May 2020 17:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588606366; bh=CQJMiIRS7DdB+gRE84At/YdWCEinRgji6tHL3JB7jBs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aIkWiXppI2jZabGwFIZl6wyFcsh6S2srXBaoeJ+v9GKz5ysSla/hFoslbZFfrd9QK
         O6phWTcaI6/7wbVG0AxprbAzYr4BlSNsPCYCBKjRpaqnxUjE3SkDIPV5rH6SUqv8iT
         sXHtxsnkgwIo6L6OfcV7phgFANS0Awp7FsV6BJNMwTjz60Qw3ZAbVuqdZZ46gBfQss
         7JVMcBna6Z40pV54jvObaRbXa3mKUMZt+ZOmoyHaAWlhEMYsQhF9w6dk0RERHXpsqw
         9zCQddT/h8CMVGeg050SYS+xjzGh7Qxhd/PxjYXVRZajAAQAsUnSbTxIk+CO6KmSEV
         QAr5qqB1/3DjQ==
Subject: Re: [PATCH v2 01/34] media: uapi: v4l2-core: Add sensor ancillary
 data V4L2 fourcc type
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-2-laurent.pinchart@ideasonboard.com>
 <b4c2bb55-a93b-2035-289c-50e10282e54f@xs4all.nl>
 <CAPY8ntALc=2gWJ_hK+j3TopP_ipQ5GMRBdVpG5CQz64pcqgrPQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <55a5c2e3-4a76-57b7-910e-f7fb16181c0f@xs4all.nl>
Date:   Mon, 4 May 2020 17:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntALc=2gWJ_hK+j3TopP_ipQ5GMRBdVpG5CQz64pcqgrPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNdd2QyytUpYlGARnXy435Jb8dG04WwUKQ/q67HH5R5oRrn3JA9Xb7d9AxxFKG6IkhbkBxC0iW6E5OtK0aWg+hiCLSjcPKP4x2Z2NKEB7dOS/0g7SIC2
 4fgzU3iSQBzIvbVRXkR8tesnKBUhDUfBD8FZJv1wG2AG1bONxcc7EkzqRcy0/8rhWfyOeTe1e+Gq7noZo//KXC46hpM9Uw3LADPHHoyF+ouMj7GRJIeTdHRE
 9fyUa7qbTWtx7OcMnZT5NcegqUj/9aRiHK66FTl0QDS9hRKuSymcWRZBKeYPxr1f7c678vQoJ+5+EoMeqEbtrJgoy/AmM+HNzi6bqJuVtEvejCliCx8OjHsR
 tMyoO/xioUSunFTlmKV5ASGBn4ocDtTVMuInShnCRTXvb9GwMu3b2OFQMXOc3XwoKoiTseFl
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/05/2020 16:39, Dave Stevenson wrote:
> Hi Hans
> 
> On Mon, 4 May 2020 at 14:48, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 04/05/2020 11:25, Laurent Pinchart wrote:
>>> From: Naushir Patuck <naush@raspberrypi.com>
>>>
>>> Add V4L2_META_FMT_SENSOR_DATA format 4CC.
>>>
>>> This new format will be used by the BCM2835 Unicam device to return
>>> out camera sensor embedded data.
>>
>> out -> our (I think)
> 
> More like drop the word totally.
> "used by BCM2835 Unicam device to return camera sensor embedded data"
> 
> The reference to Unicam probably ought to be dropped as other SoCs may
> also be able to return embedded data.
> 
>>>
>>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
>>> ---
>>>  Documentation/media/uapi/v4l/meta-formats.rst |  1 +
>>>  .../uapi/v4l/pixfmt-meta-sensor-data.rst      | 32 +++++++++++++++++++
>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>>>  include/uapi/linux/videodev2.h                |  1 +
>>>  4 files changed, 35 insertions(+)
>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
>>>
>>> diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
>>> index 74c8659ee9d6..5474086ef6f0 100644
>>> --- a/Documentation/media/uapi/v4l/meta-formats.rst
>>> +++ b/Documentation/media/uapi/v4l/meta-formats.rst
>>> @@ -21,6 +21,7 @@ These formats are used for the :ref:`metadata` interface only.
>>>
>>>      pixfmt-meta-d4xx
>>>      pixfmt-meta-intel-ipu3
>>> +    pixfmt-meta-sensor-data
>>>      pixfmt-meta-uvc
>>>      pixfmt-meta-vsp1-hgo
>>>      pixfmt-meta-vsp1-hgt
>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst b/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
>>> new file mode 100644
>>> index 000000000000..4a67e204d08a
>>> --- /dev/null
>>> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
>>> @@ -0,0 +1,32 @@
>>> +.. Permission is granted to copy, distribute and/or modify this
>>> +.. document under the terms of the GNU Free Documentation License,
>>> +.. Version 1.1 or any later version published by the Free Software
>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>> +.. Documentation/media/uapi/fdl-appendix.rst.
>>> +..
>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>>> +
>>> +.. _v4l2-meta-fmt-sensor-data:
>>> +
>>> +***********************************
>>> +V4L2_META_FMT_SENSOR_DATA  ('SENS')
>>> +***********************************
>>> +
>>> +Sensor Ancillary Metadata
>>> +
>>> +Description
>>> +===========
>>> +
>>> +This format describes ancillary data generated by a camera sensor and
>>> +transmitted over a stream on the camera bus. Sensor vendors generally have their
>>
>> 'generally' can be dropped.
>>
>>> +own custom format for this ancillary data. Some vendors follow a generic
>>> +CSI-2/SMIA embedded data format as described in the `CSI-2 specification.
>>> +<https://mipi.org/specifications/csi-2>`_
>>
>> So what does this format represent? Sensor specific custom data where you need
>> sensor-specific NDA knowledge in userspace to parse it? Or SMIA formatted sensor
>> data?
>>
>> A 4cc should map to a specific data format. I understand that this is not always
>> known, but at least the SMIA data format would need its own 4cc. I assume that the
>> sensor driver will at least know that it produces SMIA data, right?
>>
>> "SENSOR_DATA" is also much too generic IMHO.
> 
> It's a tricky one to call as to either creating a vast number of
> formats vs being too generic.
> 
> With V4L2 setting exposure as a number of lines, and analogue gain as
> the precomputed the gain code, decoding the register set from embedded
> data almost always requires sensor specific information.
> 
> SMIA defines a strict register set. Yes you could decode that using
> the defined rules. However I'm not aware of any current sensors that
> actually implement the SMIA spec - that pretty much died with Nokia.

OK.

> 
> Looking slightly more generically, there is the encoding of the
> embedded data based on the Bayer format
> Raw 10 puts a dummy byte in every 5th byte to "match" the Bayer
> encoding of the least sig bits for 4 pixels being packed in the 5th
> byte.
> Raw 12 puts a dummy byte in every 3rd byte to "match" the Bayer raw 12 format.
> Raw 14 I have no idea over with 3 pixels in 7 bytes packing.
> (Raw 8 has no additional bytes, and I wouldn't expect raw 16 to have
> any either).
> This could be defined as a SMIA-style packing, and is very common.
> They also tend to use the same 0x55 0x5a 0xa5 0xaa values for
> signalling for which registers are used number is being presented.
> 
> So you could reasonably define a SENSOR_DATA_RAW8, SENSOR_DATA_RAW10,
> SENSOR_DATA_RAW12, SENSOR_DATA_RAW14, and SENSOR_DATA_RAW16 formats,
> but userland still needs to know in which registers the actual useful
> values are.
> You've also now mandated support of V4L2_EVENT_SOURCE_CHANGE events,
> as changing the Bayer format on the video node will change the
> metadata format on the other.
> 
> However unless you also know the exact sensor, you still don't know
> which register(s) relates to exposure or analogue gain. To do that
> would imply a unique 4CC in both mediabus and V4L2 domains for every
> sensor that varies the register configuration (families of sensors may
> put them in the same place if you're lucky). And you'll need
> raw10/12/14 packing variants of each based on the formats supported by
> the sensor.

Out of curiosity: is the description of this metadata still something
that is typically under NDA? Or is this opening up more?

> 
> So as I see it you have 3 levels:
> 1) Totally generic and let userspace have to worry about the problem.
> (1 new format)
> 2) Semi generic raw8/10/12/14/16 packing for the data, but still
> userspace needs to know sensor specifics to decode anything useful
> from it (5 new formats)
> 3) Unique formats for every sensor, and for each bit depth that that
> sensor can produce (I'd estimate around ~20 new formats for the
> drivers in existing mainline kernel, and probably adding 1 or 2 per
> new driver).
> 
> Personally I don't see the third option as being practical, and the
> second doesn't really add anything that significant over the first as
> you still need to know the register setup.
> 
> You can't even easily take the second option and add read-only
> controls telling userspace the registers for exposure and gain (and
> anything else?). You'd also need the info on how many bits of each
> register(s) are used, for exposure are all bits denoting whole lines,
> or and do you compute the analogue gain code (this can often be
> defined via 4 co-efficients, but that's not guaranteed). Perhaps it
> can be described in a dozen new read only controls if you're lucky,
> but then there's bound to be one sensor that can't.
> 
> 
> So where do you draw the line between too generic and totally
> unscalable? Over to you.

So a proper description of this format would be that it is custom sensor
specific data stored in the first line of the image sent by the sensor.

Since this is sensor specific, how does libcamera know which sensor it is?
It uses the sensor entity information for that?

Regards,

	Hans

> 
> Regards
>   Dave
> 
>>> +
>>> +The size of the embedded buffer is defined as a single line with a pixel width
>>> +width specified in bytes. This is obtained by a call to the
>>
>> "pixel width width"? Typo?
>>
>>> +:c:type:`VIDIOC_SUBDEV_G_FMT` ioctl on the sensor subdevice where the ``pad``
>>> +field in :c:type:`v4l2_subdev_format` is set to 1.  Note that this size is fixed
>>
>> Should this description be explicit about the pad number?
>>
>> Regards,
>>
>>         Hans
>>
>>> +and cannot be modified with a call to :c:type:`VIDIOC_SUBDEV_S_FMT`.
>>> +
>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> index b2ef8e60ea7d..faf5a0f5eb6b 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> @@ -1346,6 +1346,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
>>>       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
>>>       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>>> +     case V4L2_META_FMT_SENSOR_DATA: descr = "Sensor Ancillary Metadata"; break;
>>>
>>>       default:
>>>               /* Compressed formats */
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index 9817b7e2c968..a96146223843 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -766,6 +766,7 @@ struct v4l2_pix_format {
>>>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>>>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>>>  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>>> +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S') /* Sensor Ancillary metadata */
>>>
>>>  /* priv field value to indicates that subsequent fields are valid. */
>>>  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
>>>
>>

