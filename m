Return-Path: <linux-media+bounces-29599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF063A7FA2D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11B0C3AD036
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 09:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8102063C6;
	Tue,  8 Apr 2025 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="OTcxFdqd"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC62641D7
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105264; cv=none; b=KT238z/a6qMDeXzgss/bdhwM5O+Ivvy1+ZsDLbaOIKcYA3fOxqpGRlcVOUoZOV4tnSRtvEZ61HfaF12OE+FPZ2xxLDHo83wP2YjAGAAnqTocFDuD+z4LxXjCG6BIirbUsHdl5gYo76zKs4lG4Ka7S6VP5nmuRt0kusN/0LX0ZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105264; c=relaxed/simple;
	bh=kBAcBfslxJGz8Pxf5uz1abWpns5XyvtoS0wjq14nBBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pU3EFezDVyFRqcGmRCfYe8qTsEseN+LJxMmYaZlWofA1BQ4s1CWQMu2kBcC+LY0w4iIxHG8DPWzqAJv2+NpBHJl63XheIen+sE5biOmwBQ6J/ql/FsIbmEjJN74zw4EaIWUp+SXb1Bj9+Kuiicve2GW/cfG9cTiBBNOWs8qTNIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=OTcxFdqd; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 7cae0a4c-145d-11f0-8ec8-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 7cae0a4c-145d-11f0-8ec8-005056994fde;
	Tue, 08 Apr 2025 11:40:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=jjYN1q3Ms1tSUdQDQ/wwfCGr5RGocV911yRQJir+ALo=;
	b=OTcxFdqdrVrN5CKLasySyCr1E0onpVrt4+3D6iDdkZN7WH5QloXmDgPo2eS+0s8w4bVqwwtTj5bLJ
	 mR93N7qPJA9u7oq3pdMMDEfEJrO1QbCpuaA6kSYOCQgkyZuChnXUIYV5yj5tXKuegHEouOAf+o9ejq
	 l3ftXLefZ//iXFncCHdby0VE8Qi4AYVuwQEv1mavirc4F5MYaoZQRusoPdTB6vK6Xm3pi3dJOcIJ8J
	 LE5+zo6SmRMHJ4M9UFd8hQ20szlrwtuqN2yj5wzcMyyYEdFb4Ene3m5I9R+RSM68UcVP8XzwLLTNXv
	 949EdBRcfHAZ0l7GpMflv8VrXLlIsjw==
X-KPN-MID: 33|g+xnS26cNzt8wErNkdEFALrZe2Mu+m0s0xvGObYCBXJEo3puK9g1wlRrHW4pDjT
 gvhLhNNCuh0fZXVrqsVTereT1iDJ9cWBA+qHazu9TAq0=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|u76Tcj/Ul03SflLAUVahVOQyELJUfw8e1vzqjd7qYMyIVNJ+32FEb+F2UerQ9BN
 MCH7HmYiMOHd6pEDt03Wx6Q==
Received: from [10.47.75.249] (unknown [173.38.220.43])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 6bb6836a-145d-11f0-af99-005056998788;
	Tue, 08 Apr 2025 11:39:52 +0200 (CEST)
Message-ID: <d2a1a4d2-dbce-40e2-9cca-fe2fbf1d6daa@xs4all.nl>
Date: Tue, 8 Apr 2025 11:39:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: v4l: dev-decoder: Add source change
 V4L2_EVENT_SRC_CH_COLORSPACE
Content-Language: en-US
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org
Cc: nicolas@ndufresne.ca, shawnguo@kernel.org, robh+dt@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
 <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
 <50ce67b7-ef06-4e8e-bf4f-f4b0d5e40961@oss.nxp.com>
 <d5a8988f-1038-4a8b-8478-968ceca37879@xs4all.nl>
 <c9aef3f6-43cd-48fb-8aba-0abd33c4e263@oss.nxp.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <c9aef3f6-43cd-48fb-8aba-0abd33c4e263@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/8/25 10:45, Ming Qian(OSS) wrote:
> Hi Hans,
> 
> On 2025/4/8 16:30, Hans Verkuil wrote:
>> On 08/04/2025 08:34, Ming Qian(OSS) wrote:
>>> Hi Hans,
>>>
>>> On 2025/4/7 17:54, Hans Verkuil wrote:
>>>> On 17/01/2025 07:19, Ming Qian wrote:
>>>>> Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
>>>>> indicates colorspace change in the stream.
>>>>> The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
>>>>> the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.
>>>>>
>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>> ---
>>>>>    Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 +++++++++
>>>>>    .../userspace-api/media/videodev2.h.rst.exceptions       | 1 +
>>>>>    include/uapi/linux/videodev2.h                           | 1 +
>>>>>    3 files changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>> index 8db103760930..91e6b86c976d 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>>>> @@ -369,6 +369,15 @@ call.
>>>>>    	loss of signal and so restarting streaming I/O is required in order for
>>>>>    	the hardware to synchronize to the video signal.
>>>>>    
>>>>> +    * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
>>>>> +      - 0x0002
>>>>> +      - This event gets triggered when a colorsapce change is detected at
>>>>
>>>> colorsapce -> colorspace
>>>>
>>>
>>> Will fix in v3
>>>
>>>>> +	an input. This can come from a video decoder. Applications will query
>>>>
>>>> It can also come from a video receiver. E.g. an HDMI source changes colorspace
>>>> signaling, but not the resolution.
>>>>
>>>>> +	the new colorspace information (if any, the signal may also have been
>>>>> +	lost)
>>>>
>>>> Missing . at the end. Also, if the signal is lost, then that is a CH_RESOLUTION
>>>> change, not CH_COLORSPACE.
>>>>
>>> OK, will fix in v3
>>>>> +
>>>>> +	For stateful decoders follow the guidelines in :ref:`decoder`.
>>>>
>>>> I think this should emphasize that if CH_COLORSPACE is set, but not CH_RESOLUTION,
>>>> then only the colorspace changed and there is no need to reallocate buffers.
>>>>
>>>
>>> OK, will add in v3
>>>
>>>> I also wonder if the description of CH_RESOLUTION should be enhanced to explain
>>>> that this might also imply a colorspace change. I'm not sure what existing codec
>>>> drivers do if there is a colorspace change but no resolution change.
>>>
>>> I think there is no uniform behavior at the moment, it depends on the
>>> behavior of the decoder. Maybe most decoders ignore this.
>>
>> Can you try to do a quick analysis of this? Don't spend too much time on this,
>> but it is helpful to have an idea of how existing codecs handle this.
>>
>> Regards,
>>
>> 	Hans
>>
> 
> I checked the vpu used in our platforms,
> 1. amphion vpu, it will ignore the colorspace change.
> 2. hantro g1/g2 decoder, it also ignore the colorspace change.
> 3. chipsnmedia wave6 decoder, the firmware detect the colorspace change
> for HEVC format, but ignore for AVC format. But its driver just ignore
> it.
> 4. chipsnmedia wave511 decoder, same as wave6.

I meant stateful codec drivers that are in mainline. Out-of-tree drivers do not
concern me.

Regards,

	Hans

> 
> Regards,
> Ming
> 
>>>
>>>>
>>>> I'm a bit concerned about backwards compatibility issues: if a userspace application
>>>> doesn't understand this new flag and just honors CH_RESOLUTION, then it would
>>>> never react to just a colorspace change.
>>>>
>>>> Nicolas, does gstreamer look at these flags?
>>>
>>> I checked the gstreamer code, it does check this flag:
>>>
>>> if (event.type == V4L2_EVENT_SOURCE_CHANGE &&
>>>       (event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION)) {
>>>     GST_DEBUG_OBJECT (v4l2object->dbg_obj,
>>>         "Can't streamon capture as the resolution have changed.");
>>>     ret = GST_V4L2_FLOW_RESOLUTION_CHANGE;
>>> }
>>>
>>> Currently the gstreamer can't handle the CH_COLORSPACE flag.
>>>
>>> Thanks,
>>> Ming
>>>
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>> +
>>>>>    Return Value
>>>>>    ============
>>>>>    
>>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>> index 35d3456cc812..ac47c6d9448b 100644
>>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>>>> @@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>>>    replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
>>>>>    
>>>>>    replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>>>> +replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
>>>>>    
>>>>>    replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>>>>    
>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>> index c8cb2796130f..242242c8e57b 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
>>>>>    };
>>>>>    
>>>>>    #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
>>>>> +#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
>>>>>    
>>>>>    struct v4l2_event_src_change {
>>>>>    	__u32 changes;
>>>>
>>>
>>
> 


