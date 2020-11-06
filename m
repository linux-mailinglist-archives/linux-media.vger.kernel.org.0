Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BB32A958B
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 12:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgKFLjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 06:39:15 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47261 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726010AbgKFLjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 06:39:14 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id b05DkKDb9Nanzb05HksAJL; Fri, 06 Nov 2020 12:39:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604662751; bh=/mbSse+8xdr+tSbtvU7pW3DGEQyJHWzSBL50UnDHU3Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NxrlBWUiIA4MPZTeh/3NsH+rVQUR+d1T7qu//eXTcRNltYx1oXUe1MKoF1cMys/Eg
         +UfVU5y8/qoEJXY2HkGTnS5dbpUdeOqoDTi4rrFVYMW40wiEo8DV+9eyvwUxwcYOU1
         67wHCCn+O3kJJcIfL40tGGAoAx32f4J31C3lYgBaXroowIa6lqHhRhCPnznH+wZ/qn
         TaPPNrC/G5CvQJ5TrzS5idSXGla+isM6YBpuHreBQ3Gv6YzIgJuW0ZMLCVgUWV/xbK
         CjWcEFar15h8b2S6SZBjxe69q7DZkeg43hb0/dznpQicP+TZiYCugfRFJsEtcWH33C
         UFQaoQUzWTfhA==
Subject: Re: [PATCH v3 1/5] media: uapi: v4l2-core: Add sensor ancillary data
 V4L2 fourcc type
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Naushir Patuck <naush@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "cc: Kieran Bingham" <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        mchehab+huawei@kernel.org
References: <20201102165258.408049-1-jacopo@jmondi.org>
 <20201102165258.408049-2-jacopo@jmondi.org>
 <d7d041b6-92d7-d1fa-f74f-ff4a63e5ad89@xs4all.nl>
 <CAPY8ntBjTyC0iN4OzqxLryTSHtBepGoRT28pdXbga-2=DeszkA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e40079e0-ee76-1125-4388-15b9220de3b9@xs4all.nl>
Date:   Fri, 6 Nov 2020 12:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBjTyC0iN4OzqxLryTSHtBepGoRT28pdXbga-2=DeszkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfExi3c787DjTUxQdcufQXhCFt6tdk7KSva81tUU9Zh+V6+IcpocWvhO2u/44slSk8WHdSYPhI+et/JQSlHVCzy9MjCjQSIGYufkUljqOgWDrGEizcXXo
 CXhi9VpjFwB+BD7rz56qlyy0i4F4NYz9kYhvN0IqKy532olvrKJB9z5/TgAw0CFKbEv/Uil81QccgxRWJFA3y3G417/Zs+Yt4D3TFUNyRPhJhvEM6Rj53LIp
 oRq1SJIal36XIoC1kOZ3kSU1fUJChtMOiL+tEnBeOLhOsv5bL8auSfZ5dMQdTBxf2mjPNdRfT6wqWw7qPUh4uWOtIL7b8DbQAVcUDg/9YzWjTzmTaoMEiTXV
 8vCldeLAuiysywXWCNg0LgR5RiyLRm33vyIjgZhFFidpY3gkYxjnG6RYt7vjx0LYhaMplvgbJaNLAwOJ+IiScV2gkgKbcIB8KQTQqmodyHAHMpH8aHlT2GjR
 a+GZaRY9/FyrO1/ABsJfcZUKiIsFdgsBWzgHVSIEhJ9Faeg+naZcagS3U+e82hlvQ5qOa4iJ8sPnHat6
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/11/2020 12:26, Dave Stevenson wrote:
> Hi Hans
> 
> On Fri, 6 Nov 2020 at 09:24, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Jacopo, Naushir,
>>
>> On 02/11/2020 17:52, Jacopo Mondi wrote:
>>> From: Naushir Patuck <naush@raspberrypi.com>
>>>
>>> Add V4L2_META_FMT_SENSOR_DATA format 4CC.
>>>
>>> This new format will be used to return camera sensor embedded data.
>>>
>>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
>>>  .../media/v4l/pixfmt-meta-sensor-data.rst     | 32 +++++++++++++++++++
>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>>>  include/uapi/linux/videodev2.h                |  1 +
>>>  4 files changed, 35 insertions(+)
>>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
>>> index fff25357fe860..b2201d1524eb6 100644
>>> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
>>> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
>>> @@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
>>>      pixfmt-meta-d4xx
>>>      pixfmt-meta-intel-ipu3
>>>      pixfmt-meta-rkisp1
>>> +    pixfmt-meta-sensor-data
>>>      pixfmt-meta-uvc
>>>      pixfmt-meta-vsp1-hgo
>>>      pixfmt-meta-vsp1-hgt
>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst
>>> new file mode 100644
>>> index 0000000000000..639ede1a8fee3
>>> --- /dev/null
>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst
>>> @@ -0,0 +1,32 @@
>>> +.. Permission is granted to copy, distribute and/or modify this
>>> +.. document under the terms of the GNU Free Documentation License,
>>> +.. Version 1.1 or any later version published by the Free Software
>>> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
>>> +.. and no Back-Cover Texts. A copy of the license is included at
>>> +.. Documentation/media/uapi/fdl-appendix.rst.
>>> +..
>>> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
>>
>> You can now use this:
>>
>> .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>>
>> and drop the TODO and license notice.
>>
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
>>> +transmitted over a stream on the camera bus. Most sensor vendors have their
>>> +own custom format for this ancillary data. Some vendors follow a generic
>>> +CSI-2/SMIA embedded data format as described in the `CSI-2 specification.
>>> +<https://mipi.org/specifications/csi-2>`_
>>
>> There are really two metadata formats here: one is a custom sensor format and one
>> a CSI2 format. That's two pixel formats.
>>
>> Of course, if the custom format used by a sensor (or sensor vendor) is known,
>> then it should get its own fourcc.
>>
>> I suggest creating two metadata formats:
>>
>> V4L2_META_FMT_CSI2_SENSOR_DATA
>> V4L2_META_FMT_CUSTOM_SENSOR_DATA
>>
>> Where the format of the latter is unknown (unless you have the information
>> from the sensor vendor under NDA).
> 
> It's possibly badly worded here, but the SMIA functional spec[1] only
> gives information on a packing, not of the actual meaning of those
> packed bytes. It defines how the sensor register set that applied for
> that captured frame has been packed into the buffer. Without
> additional sensor specific information (eg which register controls
> gain, how is the gain code computed, what's the register(s) for
> exposure and then the units for that, etc) that is still meaningless.
> A fully SMIA compliant sensor did specify the register set, and it
> included enough config information to give those formulae. However
> SMIA is dead, and the MIPI CCS is being fairly slow in gaining
> traction as the next iteration of that "generic sensor" concept.
> 
> Thread from the last round of review -
> https://www.spinics.net/lists/linux-media/msg168700.html
> 
> If you want V4L2_META_FMT_CSI2_SENSOR_DATA to denote that it can be
> unpacked to a (sensor specific) register set, then you actually need
> separate formats for 8, 10, 12, 14, and two 16bit packings.
> That format will change based on the image format selected from the
> sensor, so now you need to support the source changed event callback
> for any sensors that support multiple bit depths. (Change the image
> bit depth and get a source changed for the metadata)
> 
> Do we just drop any mention of how this data is formatted and that the
> SMIA packing spec exists?
> If smiapp or Sakari's new CCS driver wants to expand on this at a
> later date so that you can write a generic parser to get back to
> something meaningful, then those formats get added at that point.
> Denoting SMIA packing on a non-SMIA compliant sensor is a meaningless
> distinction.
> 
> Libcamera already has a sensor specific lookup based on the name to
> know how to interpret the embedded data, and that is going to be the
> case for every user (except on fully compliant SMIA or CCS sensors).

What a mess.

OK, let's pick V4L2_META_FMT_CUSTOM_SENSOR_DATA or something along those
lines that indicates that the format is sensor specific.

Just calling it V4L2_META_FMT_SENSOR_DATA is too generic and doesn't
convey that in order to understand the metadata, you have to know what
the sensor does.

Regards,

	Hans

> 
>   Dave
> 
> [1] http://read.pudn.com/downloads95/doc/project/382834/SMIA/SMIA_Functional_specification_1.0.pdf
> page 74, section 4.9.1.
> 
>>> +
>>> +The size of the embedded buffer is defined as a single line with a pixel width
>>> +specified in bytes. This is obtained by a call to the
>>> +:c:type:`VIDIOC_SUBDEV_G_FMT` ioctl on the sensor subdevice where the ``pad``
>>> +field in :c:type:`v4l2_subdev_format` is set to 1.  Note that this size is fixed
>>> +and cannot be modified with a call to :c:type:`VIDIOC_SUBDEV_S_FMT`.
>>> +
>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> index eeff398fbdcc1..d01d9ca6578df 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> @@ -1402,6 +1402,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
>>>       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
>>>       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>>> +     case V4L2_META_FMT_SENSOR_DATA: descr = "Sensor Ancillary Metadata"; break;
>>>
>>>       default:
>>>               /* Compressed formats */
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index 534eaa4d39bc8..b7e3185e66631 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -769,6 +769,7 @@ struct v4l2_pix_format {
>>>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>>>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>>>  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
>>> +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S') /* Sensor Ancillary metadata */
>>>
>>>  /* priv field value to indicates that subsequent fields are valid. */
>>>  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
>>>
>>
>> Regards,
>>
>>         Hans

