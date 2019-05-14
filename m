Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE8F1C878
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 14:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfENMYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 08:24:00 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:32795 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725893AbfENMX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 08:23:59 -0400
Received: from [IPv6:2001:420:44c1:2579:859d:cefd:f7a7:d8be] ([IPv6:2001:420:44c1:2579:859d:cefd:f7a7:d8be])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QWTJhvRq93qlsQWTMh3eLj; Tue, 14 May 2019 14:23:57 +0200
Subject: Re: [PATCH v2] media/doc: Allow sizeimage to be set by v4l clients
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
 <a1807c37-99cf-d1fa-bcb9-67af2935abaf@xs4all.nl>
 <ecdb8da5f00a8f5bd5d5ec125e2aa162e0091728.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <72987956-49f0-c6fe-be45-42b357f541a1@xs4all.nl>
Date:   Tue, 14 May 2019 14:23:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <ecdb8da5f00a8f5bd5d5ec125e2aa162e0091728.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDsKrimLIgQxo4gW55w4bBX4S8inS9QnnKVDHGMSVyP1VxS0rwKZK1PQPH/ejahgKGTh31j7CaVij6+d6NhruWCR6R6KesTtZ0hlcYfy2RmlBdzY5REA
 X5F0gnkwUyLum31eBShxbchK33Q7c1SCTpC7suKxM+GnrDxDlrToziwVwsDR7z1iXPJFKb5E+/A01+rHW/0/JhAoC4kxM48i7y88nZp0qshhmIApEvapUs2i
 +F41v9D0fAgDrLBscKTV5h/Hgp7Hjn/JA/i/d0dJGKdqLkvlHH3yMWPyjofG47KyGBzZhd8Dpiuxr+/yMkLeH9gQtNO1EF/PmTBdVjkacscseoPa6MT7GOSy
 XaDG5rMI96eGz9H2tF+9N0uK3ZJ9TDzXCzJcj0pxt07vLSM5IbyQHgwZqteIDbbU9pGvuL7RTEFElP/jfiLslgn53YehTM0UU9LtauB4wOut8FC/fUcTCJF+
 KGg7us049hQp11P1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/14/19 2:19 PM, Nicolas Dufresne wrote:
> Le mardi 14 mai 2019 à 10:54 +0200, Hans Verkuil a écrit :
>> Hi Stanimir,
>>
>> On 4/12/19 5:59 PM, Stanimir Varbanov wrote:
>>> This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
>>> field description to allow v4l clients to set bigger image size
>>> in case of variable length compressed data.
>>
>> I've been reconsidering this change. The sizeimage value in the format
>> is the minimum size a buffer should have in order to store the data of
>> an image of the width and height as described in the format.
> 
> Should this read as the minimum size for the specific (returned by
> driver) width/height/bytesperline ?

Yes. Although for compressed formats the bytesperline value plays no role
of course.

Regards,

	Hans

> 
>>
>> But there is nothing that prevents userspace from calling VIDIOC_CREATEBUFS
>> instead of VIDIOC_REQBUFS to allocate larger buffers.
>>
>> So do we really need this change?
>>
>> The more I think about this, the more uncomfortable I become with this change.
>>
>> Regards,
>>
>> 	Hans
>>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>  Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst | 13 ++++++++++++-
>>>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst        | 11 ++++++++++-
>>>  2 files changed, 22 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>>> index 5688c816e334..005428a8121e 100644
>>> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>>> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>>> @@ -31,7 +31,18 @@ describing all planes of that format.
>>>  
>>>      * - __u32
>>>        - ``sizeimage``
>>> -      - Maximum size in bytes required for image data in this plane.
>>> +      - Maximum size in bytes required for image data in this plane,
>>> +	set by the driver. When the image consists of variable length
>>> +	compressed data this is the number of bytes required by the
>>> +	codec to support the worst-case compression scenario.
>>> +
>>> +	For uncompressed images the driver will set the value. For
>>> +	variable length compressed data clients are allowed to set
>>> +	the sizeimage field, but the driver may ignore it and set the
>>> +	value itself, or it may modify the provided value based on
>>> +	alignment requirements or minimum/maximum size requirements.
>>> +	If the client wants to leave this to the driver, then it should
>>> +	set sizeimage to 0.
>>>      * - __u32
>>>        - ``bytesperline``
>>>        - Distance in bytes between the leftmost pixels in two adjacent
>>> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>>> index 71eebfc6d853..0f7771151db9 100644
>>> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>>> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>>> @@ -89,7 +89,16 @@ Single-planar format structure
>>>        - Size in bytes of the buffer to hold a complete image, set by the
>>>  	driver. Usually this is ``bytesperline`` times ``height``. When
>>>  	the image consists of variable length compressed data this is the
>>> -	maximum number of bytes required to hold an image.
>>> +	number of bytes required by the codec to support the worst-case
>>> +	compression scenario.
>>> +
>>> +	For uncompressed images the driver will set the value. For
>>> +	variable length compressed data clients are allowed to set
>>> +	the sizeimage field, but the driver may ignore it and set the
>>> +	value itself, or it may modify the provided value based on
>>> +	alignment requirements or minimum/maximum size requirements.
>>> +	If the client wants to leave this to the driver, then it should
>>> +	set sizeimage to 0.
>>>      * - __u32
>>>        - ``colorspace``
>>>        - Image colorspace, from enum :c:type:`v4l2_colorspace`.
>>>
> 

