Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F2621C3B8
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 12:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgGKKWA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 06:22:00 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:51123 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbgGKKWA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 06:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=hKkiZdQQQCV7LCEzPFLeR2jKYXURO3Db8fTbLBVLOzM=;
        b=roI/CBDdvtdfO+tdrcxWtxXDQztqaWnyzVYdpzdfDAMLP9fn1JO/eSwez7VNlpymbCzl
        5zzKbEjCgUMJTzboObIFpZguC1nI+zHsxmTEr1V7JbFtPFtHQFbOoA4ENbD0NTSAY/RQIr
        342C2ZQrUqYAcRNHeI28ECV9r03gGtzPQ=
Received: by filterdrecv-p3mdw1-75c584b9c6-jp7b2 with SMTP id filterdrecv-p3mdw1-75c584b9c6-jp7b2-18-5F0992C5-3E
        2020-07-11 10:21:57.869390778 +0000 UTC m=+1271538.380795897
Received: from [192.168.1.14] (unknown)
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP
        id 9PlySEwUR9ap1X6LQ-LTfQ
        Sat, 11 Jul 2020 10:21:57.603 +0000 (UTC)
Subject: Re: [RFC 07/12] media: uapi: h264: Add DPB entry field reference
 flags
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
 <HE1PR06MB4011559BF2447047C66285D2ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <233509924f72d69824920d9312373eced68674c0.camel@collabora.com>
 <20200710101333.05077f18@collabora.com>
 <6232d8475e169ee53b5864959af21d14bf0fc620.camel@collabora.com>
 <20200710140502.627b2b54@collabora.com>
 <05b6cff6ba230c0ab6a562e17926d8503e2dfadd.camel@collabora.com>
 <9a897ef99048077233685b121b03bd750e4d4a83.camel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <cf4a5d3f-934f-de59-b5df-97b23e30cb1b@kwiboo.se>
Date:   Sat, 11 Jul 2020 10:21:57 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9a897ef99048077233685b121b03bd750e4d4a83.camel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h=2F3MSfh0EOMJ0496t?=
 =?us-ascii?Q?Jf=2F+iUqhESCgGvRvw6so+hSgvWFjaMthfbkbcQR?=
 =?us-ascii?Q?g=2FAKU=2F=2F1LNxdwDk6bYbn=2FB5M6FbNNIVUo98opuY?=
 =?us-ascii?Q?tCDW5LoNY38jY0Dcmip1i9A4R0A9spKgEF0qvr4?=
 =?us-ascii?Q?Atwufgsxqc0mlUkgdF7ijhlpDPIWPY7Til6m37u?=
 =?us-ascii?Q?0fCxfUwr3vh468hk2FydA=3D=3D?=
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Language: sv
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-07-10 23:49, Nicolas Dufresne wrote:
> Le vendredi 10 juillet 2020 à 09:25 -0300, Ezequiel Garcia a écrit :
>> +Nicolas
>>
>> On Fri, 2020-07-10 at 14:05 +0200, Boris Brezillon wrote:
>>> On Fri, 10 Jul 2020 08:50:28 -0300
>>> Ezequiel Garcia <ezequiel@collabora.com> wrote:
>>>
>>>> On Fri, 2020-07-10 at 10:13 +0200, Boris Brezillon wrote:
>>>>> On Fri, 10 Jul 2020 01:21:07 -0300
>>>>> Ezequiel Garcia <ezequiel@collabora.com> wrote:
>>>>>   
>>>>>> Hello Jonas,
>>>>>>
>>>>>> In the context of the uAPI cleanup,
>>>>>> I'm revisiting this patch.
>>>>>>
>>>>>> On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote:  
>>>>>>> Add DPB entry flags to help indicate when a reference frame is a
>>>>>>> field picture
>>>>>>> and how the DPB entry is referenced, top or bottom field or full
>>>>>>> frame.
>>>>>>>
>>>>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>>>>> ---
>>>>>>>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++++++
>>>>>>>  include/media/h264-ctrls.h                       |  4 ++++
>>>>>>>  2 files changed, 16 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>>>>> b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>>>>> index bc5dd8e76567..eb6c32668ad7 100644
>>>>>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>>>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>>>>> @@ -2022,6 +2022,18 @@ enum
>>>>>>> v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>>>>>      * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
>>>>>>>        - 0x00000004
>>>>>>>        - The DPB entry is a long term reference frame
>>>>>>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE``
>>>>>>> +      - 0x00000008
>>>>>>> +      - The DPB entry is a field picture
>>>>>>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_TOP``
>>>>>>> +      - 0x00000010
>>>>>>> +      - The DPB entry is a top field reference
>>>>>>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM``
>>>>>>> +      - 0x00000020
>>>>>>> +      - The DPB entry is a bottom field reference
>>>>>>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME``
>>>>>>> +      - 0x00000030
>>>>>>> +      - The DPB entry is a reference frame
>>>>>>>  
>>>>>>>  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
>>>>>>>      Specifies the decoding mode to use. Currently exposes slice-
>>>>>>> based and
>>>>>>> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
>>>>>>> index e877bf1d537c..76020ebd1e6c 100644
>>>>>>> --- a/include/media/h264-ctrls.h
>>>>>>> +++ b/include/media/h264-ctrls.h
>>>>>>> @@ -185,6 +185,10 @@ struct v4l2_ctrl_h264_slice_params {
>>>>>>>  #define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
>>>>>>>  #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
>>>>>>>  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
>>>>>>> +#define V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE	0x08
>>>>>>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_TOP	0x10
>>>>>>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM	0x20
>>>>>>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME	0x30
>>>>>>>      
>>>>>>
>>>>>> I've been going thru the H264 spec and I'm unsure,
>>>>>> are all these flags semantically needed?
>>>>>>
>>>>>> For instance, if one of REF_BOTTOM or REF_TOP (or both)
>>>>>> are set, doesn't that indicate it's a field picture?
>>>>>>
>>>>>> Or conversely, if neither REF_BOTTOM or REF_TOP are set,
>>>>>> then it's a frame picture?  
>>>>>
>>>>> I think that's what I was trying to do here [1]
>>>>>
>>>>> [1]https://patchwork.kernel.org/patch/11392095/  
>>>>
>>>> Right. Aren't we missing a DPB_ENTRY_FLAG_TOP_FIELD?
>>>>
>>>> If I understand correctly, the DPB can contain:
>>>>
>>>> * frames (FLAG_FIELD not set)
>>>> * a field pair, with a single field (FLAG_FIELD and either TOP or BOTTOM).
>>>> * a field pair, with boths fields (FLAG_FIELD and both TOP or BOTTOM).
>>>
>>> Well, my understand is that, if the buffer contains both a TOP and
>>> BOTTOM field, it actually becomes a full frame, so you actually have
>>> those cases:
>>>
>>> * FLAG_FIELD not set: this a frame (note that a TOP/BOTTOM field
>>>   decoded buffer can become of frame if it's complemented with the
>>>   missing field later during the decoding)
>>> * FLAG_FIELD set + BOTTOM_FIELD not set: this is a TOP field
>>> * FLAG_FIELD set + BOTTOM_FIELD set: this is a BOTTOM field
>>> * FLAG_FIELD not set + BOTTOM_FIELD set: invalid combination
> 
> Let's admit, while this work, it's odd. Can we just move to that instewad ?
> 
>   FLAG_TOP_FIELD
>   FLAG_BOTTOM_FIELD
>   FLAG_FRAME = (FLAG_TOP_FIELD | FLAG_BOTTOM_FIELD)
> 
> So it can be used as a flag, but also is a proper enum and there is no longer an
> invalid combination.
>   
>>>
>>> but I might be wrong.

There seems to be some misunderstanding here, the top/bottom flagging should
not be used to describe if the picture is a field, field pair or frame, it
should be used to flag if a frame or the top and/or bottom field (in case of
a field pair) is "used for short-term reference".

FLAG_TOP_REF
FLAG_BOTTOM_REF
FLAG_FRAME_REF = (FLAG_TOP_REF | FLAG_BOTTOM_REF)

Would be a more appropriate naming.

The FIELD_PIC flag would then be used to describe if the picture is a
reference frame or a complementary reference field pair.

As described in hantro h264 driver [1] the MV buffer is split in two
for field encoded frames, and I guess the rkvdec block does something
similar and therefore the HW blocks probably needs to know if the reference
picture is a reference frame or a complementary reference field pair.
It should be possible to keep such state in driver but since such information
was easily available in ffmpeg and the driver being "stateless" using a flag
seamed like a good choice at the time.

Please note that I have not done any test without the "field pic" flagging
but both mpp and the imx/hantro reference code are configuring this bit.

[1] https://git.linuxtv.org/media_tree.git/tree/drivers/staging/media/hantro/hantro_g1_h264_dec.c#n265

Regards,
Jonas

>>
>> Yes, perhaps that's correct. I was trying to think strictly
>> in terms of the H264 semantics, to define a clean interface.
>>
>> From the mpp code, looks like the above is enough for rkvdec
>> (although I haven't done any tests).
>>
>> Ezequiel
>>
>>
>>
> 
