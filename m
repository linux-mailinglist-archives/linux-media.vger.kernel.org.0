Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72716240B82
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 18:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgHJQ57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 12:57:59 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:64455 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbgHJQ57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 12:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=ctMxK0Z8oy2njsya/7+8BEBKqDcR1ooEbr4AnEY4R/k=;
        b=XnjJtF7FDAwMuLt023T6hhnK0QhAIHmf/Ta17GYKH6kDYpmG+Q0VVKyuSQLuPf71R5Cn
        fUoP8N4VMAjSpn4XVA19RAmv/Y0wQmNgrcMaH0/1YMLHwg18yKjYKMIZ4ZhIhHKzwPWgms
        54xxBsnEinUWQG7qAADrTjzD4EvbWXffo=
Received: by filterdrecv-p3mdw1-7ff865655c-ppm4p with SMTP id filterdrecv-p3mdw1-7ff865655c-ppm4p-20-5F317C94-27
        2020-08-10 16:57:56.576942272 +0000 UTC m=+1032101.710634719
Received: from [10.13.72.117] (unknown)
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP
        id rDZWMxdJS8a2iUNuZZEEPQ
        Mon, 10 Aug 2020 16:57:56.319 +0000 (UTC)
Subject: Re: [PATCH v2 03/14] media: uapi: h264: Split prediction weight
 parameters
References: <20200806151310.98624-1-ezequiel@collabora.com>
 <ae2ac4ba-9272-ec67-d075-3429bc8926c3@kwiboo.se>
 <CAAEAJfAGW6M1YPQhPqdvpYugWk+RRTNOQbKfSWrnw_A8M2k=EA@mail.gmail.com>
 <2380739.qXQpHEDp1t@jernej-laptop>
 <8cf55169fa1dd55b5bdf746b321419f8c7988821.camel@collabora.com>
 <fcd4a18e-1442-4333-ec87-c53dba9890c5@kwiboo.se>
 <f0d2bdfc8f812052ecf4d7b77970a37260d1179c.camel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <8ca6a7ab-dfb9-08ad-3fcf-26dec5ac5980@kwiboo.se>
Date:   Mon, 10 Aug 2020 16:57:56 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f0d2bdfc8f812052ecf4d7b77970a37260d1179c.camel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h2rcavKcpl2B0nnq4?=
 =?us-ascii?Q?E13nbJxtrl1EEFylgo=2F1LJ0NYTdqYFmeFSkqNBn?=
 =?us-ascii?Q?XM5T65cqEDCZC6TINmCK9mEX19KCTCbORIxPxoh?=
 =?us-ascii?Q?CodWpsdsx1n+n2E9Ui1a1y1RzFD9TLJNCt7xnkI?=
 =?us-ascii?Q?76fvwwagGGu17ARgPV1S=2F3rLuwOMRF5rCe=2F1zWH?=
 =?us-ascii?Q?3jxoI5S6d7u+cfGGvTrEQ=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Jernej =?iso-8859-2?q?=A9krabec?= <jernej.skrabec@siol.net>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-10 17:28, Ezequiel Garcia wrote:
> On Mon, 2020-08-10 at 14:55 +0000, Jonas Karlman wrote:
>> On 2020-08-10 14:57, Ezequiel Garcia wrote:
>>> On Sun, 2020-08-09 at 23:11 +0200, Jernej Škrabec wrote:
>>>> Dne nedelja, 09. avgust 2020 ob 15:55:50 CEST je Ezequiel Garcia napisal(a):
>>>>> On Sat, 8 Aug 2020 at 18:01, Jonas Karlman <jonas@kwiboo.se> wrote:
>>>>>> On 2020-08-06 17:12, Ezequiel Garcia wrote:
>>>>>>> The prediction weight parameters are only required under
>>>>>>> certain conditions, which depend on slice header parameters.
>>>>>>>
>>>>>>> As specified in section 7.3.3 Slice header syntax, the prediction
>>>>>>> weight table is present if:
>>>>>>>
>>>>>>> ((weighted_pred_flag && (slice_type == P || slice_type == SP)) || \
>>>>>>> (weighted_bipred_idc == 1 && slice_type == B))
>>>>>>
>>>>>> Maybe a macro can be added to help check this contition?
>>>>>>
>>>>>> Something like this maybe:
>>>>>>
>>>>>> #define V4L2_H264_CTRL_PRED_WEIGHTS_REQUIRED(pps, slice) \
>>>>>>
>>>>>>         ((((pps)->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) && \
>>>>>>         
>>>>>>          ((slice)->slice_type == V4L2_H264_SLICE_TYPE_P || \
>>>>>>          
>>>>>>            (slice)->slice_type == V4L2_H264_SLICE_TYPE_SP)) || \
>>>>>>          
>>>>>>          ((pps)->weighted_bipred_idc == 1 && \
>>>>>>          
>>>>>>           (slice)->slice_type == V4L2_H264_SLICE_TYPE_B))
>>>>>
>>>>> Yeah, that could make sense.
>>>>>
>>>>> Note that the biggest value in having the prediction weight table
>>>>> separated is to allow  applications to skip setting this largish control,
>>>>> reducing the amount of data that needs to be passed from userspace
>>>>> -- especially when not needed :-)
>>>>>
>>>>>>> Given its size, it makes sense to move this table to its control,
>>>>>>> so applications can avoid passing it if the slice doesn't specify it.
>>>>>>>
>>>>>>> Before this change struct v4l2_ctrl_h264_slice_params was 960 bytes.
>>>>>>> With this change, it's 188 bytes and struct v4l2_ctrl_h264_pred_weight
>>>>>>> is 772 bytes.
>>>>>>>
>>>>>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>>>>> ---
>>>>>>> v2: Fix missing Cedrus changes and mssing control declaration,
>>>>>>>
>>>>>>>     as noted by Hans and Jernej.
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>>  .../media/v4l/ext-ctrls-codec.rst             | 19 ++++++++++++-------
>>>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  8 ++++++++
>>>>>>>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 +++++++
>>>>>>>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>>>>>>>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 ++
>>>>>>>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 ++----
>>>>>>>  include/media/h264-ctrls.h                    |  5 +++--
>>>>>>>  include/media/v4l2-ctrls.h                    |  2 ++
>>>>>>>  8 files changed, 37 insertions(+), 13 deletions(-)
>>>>>>>
>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst index
>>>>>>> d1438b1e259f..c36ce5a95fc5 100644
>>>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>> @@ -1879,18 +1879,23 @@ enum
>>>>>>> v4l2_mpeg_video_h264_hierarchical_coding_type -> > 
>>>>>>>        - 0x00000008
>>>>>>>        -
>>>>>>>
>>>>>>> -``Prediction Weight Table``
>>>>>>> +``V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS (struct)``
>>>>>>> +    Prediction weight table defined according to :ref:`h264`,
>>>>>>> +    section 7.4.3.2 "Prediction Weight Table Semantics".
>>>>>>> +    The prediction weight table must be passed by applications
>>>>>>> +    under the conditions explained in section 7.3.3 "Slice header
>>>>>>> +    syntax".
>>>>>>>
>>>>>>> -    The bitstream parameters are defined according to :ref:`h264`,
>>>>>>> -    section 7.4.3.2 "Prediction Weight Table Semantics". For further
>>>>>>> -    documentation, refer to the above specification, unless there is
>>>>>>> -    an explicit comment stating otherwise.
>>>>>>> +    .. note::
>>>>>>> +
>>>>>>> +       This compound control is not yet part of the public kernel API
>>>>>>> and
>>>>>>> +       it is expected to change.
>>>>>>>
>>>>>>> -.. c:type:: v4l2_h264_pred_weight_table
>>>>>>> +.. c:type:: v4l2_ctrl_h264_pred_weights
>>>>>>>
>>>>>>>  .. cssclass:: longtable
>>>>>>>
>>>>>>> -.. flat-table:: struct v4l2_h264_pred_weight_table
>>>>>>> +.. flat-table:: struct v4l2_ctrl_h264_pred_weights
>>>>>>>
>>>>>>>      :header-rows:  0
>>>>>>>      :stub-columns: 0
>>>>>>>      :widths:       1 1 2
>>>>>>>
>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>>>> b/drivers/media/v4l2-core/v4l2-ctrls.c index 3f3fbcd60cc6..76c8dc8fb31c
>>>>>>> 100644
>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>>>> @@ -897,6 +897,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>>>
>>>>>>>       case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:            return
>>>>>>>       "H264 Decode Parameters"; case
>>>>>>>       V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:              return "H264
>>>>>>>       Decode Mode"; case V4L2_CID_MPEG_VIDEO_H264_START_CODE:          
>>>>>>>           return "H264 Start Code";> > 
>>>>>>> +     case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:             return
>>>>>>> "H264 Prediction Weight Table";> > 
>>>>>>>       case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:                   return
>>>>>>>       "MPEG2 Level"; case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:           
>>>>>>>            return "MPEG2 Profile"; case
>>>>>>>       V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:              return "MPEG4
>>>>>>>       I-Frame QP Value";> > 
>>>>>>> @@ -1412,6 +1413,9 @@ void v4l2_ctrl_fill(u32 id, const char **name,
>>>>>>> enum v4l2_ctrl_type *type,> > 
>>>>>>>       case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
>>>>>>>               *type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
>>>>>>>               break;
>>>>>>>
>>>>>>> +     case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:
>>>>>>> +             *type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
>>>>>>> +             break;
>>>>>>>
>>>>>>>       case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
>>>>>>>               *type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
>>>>>>>               break;
>>>>>>>
>>>>>>> @@ -1790,6 +1794,7 @@ static int std_validate_compound(const struct
>>>>>>> v4l2_ctrl *ctrl, u32 idx,> > 
>>>>>>>       case V4L2_CTRL_TYPE_H264_SPS:
>>>>>>>       case V4L2_CTRL_TYPE_H264_PPS:
>>>>>>>
>>>>>>>       case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
>>>>>>> +     case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
>>>>>>>       case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
>>>>>>>       
>>>>>>>       case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
>>>>>>>               break;
>>>>>>>
>>>>>>> @@ -2553,6 +2558,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct
>>>>>>> v4l2_ctrl_handler *hdl,> > 
>>>>>>>       case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
>>>>>>>               elem_size = sizeof(struct v4l2_ctrl_h264_decode_params);
>>>>>>>               break;
>>>>>>>
>>>>>>> +     case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
>>>>>>> +             elem_size = sizeof(struct v4l2_ctrl_h264_pred_weights);
>>>>>>> +             break;
>>>>>>>
>>>>>>>       case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>>>>>>>               elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
>>>>>>>               break;
>>>>>>>
>>>>>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
>>>>>>> b/drivers/staging/media/sunxi/cedrus/cedrus.c index
>>>>>>> bc27f9430eeb..027cdd1be5a0 100644
>>>>>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
>>>>>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
>>>>>>> @@ -78,6 +78,13 @@ static const struct cedrus_control cedrus_controls[]
>>>>>>> = {
>>>>>>>
>>>>>>>               .codec          = CEDRUS_CODEC_H264,
>>>>>>>               .required       = true,
>>>>>>>       
>>>>>>>       },
>>>>>>>
>>>>>>> +     {
>>>>>>> +             .cfg = {
>>>>>>> +                     .id     = V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS,
>>>>>>> +             },
>>>>>>> +             .codec          = CEDRUS_CODEC_H264,
>>>>>>> +             .required       = true,
>>>>>>
>>>>>> This should probably be false if this control is to be optional as implied
>>>>>> by the commit message.
>>>>>
>>>>> Well, the control is optional if the driver implements it as optional,
>>>>> which Cedrus isn't currently doing :-)
>>>>
>>>> Why do you think so? Prediction weights are filled only when they are 
>>>> needed:https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/
>>>> sunxi/cedrus/cedrus_h264.c#L370
>>>>
>>>
>>> Right, but that should be changed to be really optional.
>>> How does the driver reject/fail the request if the table is NULL?
>>>
>>> In any case, I don't think it's necessarily something we need
>>> to tackle now.
>>
>> I do not fully follow, the commit message state following:
>>
>>   Note that the biggest value in having the prediction weight table
>>   separated is to allow applications to skip setting this largish control
>>
> 
> This is not exactly what the commit message says, but yeah
> that's the idea.

Hehe, I copied your reply instead of commit message / doc changes :-)

> 
>> Yet the driver still require this new control to be included in the request
>> thanks to the .required = true statement. (if i understand the code correctly)
>>
>> So applications still need to set this largish control?
>>
> 
> This is a uAPI change that paves the way for Cedrus to make the control
> optional. The series doesn't take care of it, but it prepares the road
> for it.
> 
> Since we are not stabilizing the uAPI (yet), I think we still have
> some room to make this change in steps: first we merge the new control
> and then we add the needed changes to Cedrus?
> 
> Does that make sense?

Sure, make sense, I will rephrase it as questions instead :-)

What is not fully clear to me is if this new ctrl should be considered
optional or required from userspace point of view.

Will there be a way for userspace to know if a ctrl is optional or not?

If I implement uapi changes as suggested in this patch in ffmpeg,
i.e. only set weight table ctrl when data if it is present in slice header,
then decoding stops working for cedrus when weight table is not present.

Should I just play it safe and continue to always set the new ctrl for slice
based decoding and treat it as required? Or are we saying that it should be
optional and cedrus is just not following the uapi after this series?

Best regards,
Jonas

> 
>> Best regards,
>> Jonas
>>
>>> Thanks,
>>> Ezequiel
>>>
> 
> 
