Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E84DA8EE18
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 16:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732776AbfHOOWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 10:22:24 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38163 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730497AbfHOOWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 10:22:23 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yGduhwIEKDqPeyGdxhYUGh; Thu, 15 Aug 2019 16:22:21 +0200
Subject: Re: [PATCHv2 02/12] videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-3-hverkuil-cisco@xs4all.nl>
 <20190814125336.GB11714@aptenodytes>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <49144751-0e6e-015e-d33e-1292428a52d6@xs4all.nl>
Date:   Thu, 15 Aug 2019 16:22:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190814125336.GB11714@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDPHcCC62Af/itSxOfixsTEHF9uE5QHJxOiPjrtGJ8zT7GCogfB2qy2XMpqv5SkqcyMrMczH7qspF65p6twmLJ2265uprIzKQHMcdhCF2OjXT0lrY4u7
 S0B+V6l8wrkVZrlt404aTuZVWh4e2+t4XTOTkGI+1CNwDctYR+C696EX3/tD8RedBon7pOU8hYNo9Hh1tbuKtar+UjK4WtKttq6iGZUuSGAetQjM+/DexTOx
 2yOdz/ZRyBHW7pVKOJno14AoRMJf//Bicq+MB9OvvcLoPEaSmfC9QWg13U03fRO9Wjp2/K6imX1wl6qgnGIFTNm5BmxjnzmhNsl/XT80RBCztmCbT5M3cIg1
 MK4sXGxnG85h9HbVCAoJhRqmoPuFAJ2Y1YxLxlKzu6jVxU3ktT8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/19 2:53 PM, Paul Kocialkowski wrote:
> Hi,
> 
> On Mon 12 Aug 19, 13:05, Hans Verkuil wrote:
>> From: Maxime Jourdan <mjourdan@baylibre.com>
>>
>> Add an enum_fmt format flag to specifically tag coded formats where
>> dynamic resolution switching is supported by the device.
>>
>> This is useful for some codec drivers that can support dynamic
>> resolution switching for one or more of their listed coded formats. It
>> allows userspace to know whether it should extract the video parameters
>> itself, or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE
>> when such changes are detected.
> 
> Makes sense and looks good to me:
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> 
> The docs aren't saying that this only applies to stateful decoders, but I think
> it is quite clear that this can't apply to stateless decoders.
> 
> Cheers,
> 
> Paul
> 
>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> [hverkuil-cisco@xs4all.nl: added flag to videodev2.h.rst.exceptions]
>> [hverkuil-cisco@xs4all.nl: updated commit text: 'one or more' instead of 'all']
>> Acked-by: Tomasz Figa <tfiga@chromium.org>
>> ---
>>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
>>  Documentation/media/videodev2.h.rst.exceptions   | 1 +
>>  include/uapi/linux/videodev2.h                   | 1 +
>>  3 files changed, 10 insertions(+)
>>
>> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>> index ebc05ce74bdf..719f1ed64f7d 100644
>> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
>> @@ -135,6 +135,14 @@ one until ``EINVAL`` is returned.
>>  	between frames/fields. This flag can only be used in combination with
>>  	the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
>>  	formats only. This flag is valid for stateful decoders only.
>> +    * - ``V4L2_FMT_FLAG_DYN_RESOLUTION``
>> +      - 0x0008
>> +      - Dynamic resolution switching is supported by the device for this
>> +	compressed bytestream format (aka coded format). It will notify the user
>> +	via the event ``V4L2_EVENT_SOURCE_CHANGE`` when changes in the video
>> +	parameters are detected. This flag can only be used in combination
>> +	with the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
>> +	compressed formats only.

I added "It is also only applies to stateful codecs." at the end of this
paragraph.

Regards,

	Hans

>>  
>>  
>>  Return Value
>> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
>> index a0640b6d0f68..adeb6b7a15cb 100644
>> --- a/Documentation/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/media/videodev2.h.rst.exceptions
>> @@ -181,6 +181,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
>>  replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
>> +replace define V4L2_FMT_FLAG_DYN_RESOLUTION fmtdesc-flags
>>  
>>  # V4L2 timecode types
>>  replace define V4L2_TC_TYPE_24FPS timecode-type
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 67077d52c59d..530638dffd93 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -777,6 +777,7 @@ struct v4l2_fmtdesc {
>>  #define V4L2_FMT_FLAG_COMPRESSED		0x0001
>>  #define V4L2_FMT_FLAG_EMULATED			0x0002
>>  #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
>> +#define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
>>  
>>  	/* Frame Size and frame rate enumeration */
>>  /*
>> -- 
>> 2.20.1
>>
> 

