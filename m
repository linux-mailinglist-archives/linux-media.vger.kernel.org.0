Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB61F268CA9
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 15:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgINN6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 09:58:25 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53393 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726797AbgINN5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 09:57:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Hoy5k0nxZPTBMHoy8kc40W; Mon, 14 Sep 2020 15:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600091792; bh=mbclfXUxafdxgC26WPOez+ej6gFteViPVOesw+YXTBE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WmSn4/YEFgtY2eXUfpzSGSMIxOUQG12+Ecpj9pfIVYoOXSdJb4WD9jxIX4YerSiYt
         MCGuoU3OUvOewFZ7CI7GR+eJEhz5wq3ghQkK1WNzTwuvAx2/h+n1CRFIaj3PFyffHZ
         eUX9uWLrTGBFzy5Q8vibFaeC6lBhXMrMKHPfDxUVlEPww9r9Tk9mqdbuT6rmuMYVfX
         CDky98T0ORdMIpeaSfxJWJo5GRwbKRfPok24D49vDcnA53wRamofIGOYPwZqfbkeHI
         UAWobT0F0kvWlGdKdju859PPAOB41GUFqToTrWNmYWD1kEBcIHY0NKdCvy3o6pP/dd
         BghJdaHEGXWMw==
Subject: Re: [PATCH v2] media: v4l2-ctrl: add control for long term reference.
To:     dikshita@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        nicolas@ndufresne.ca, majja@codeaurora.org,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org
References: <1597382967-32729-1-git-send-email-dikshita@codeaurora.org>
 <506c9e88-e54b-2534-0df9-f7855456dcd8@xs4all.nl>
 <b6c14a61a5a63b68a07a539f39b88477@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b8508c3f-4f92-56a3-998b-0436cfb855e2@xs4all.nl>
Date:   Mon, 14 Sep 2020 15:56:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b6c14a61a5a63b68a07a539f39b88477@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLIm0duwF7QqZ4ulMFSf0JL5s2YDpOiIo+NsWj8ht3p4TlCQ+ripTkx3mVbQ4ALXe25Rs5JqZyX0FOXV0xJWqyGp0bsR3moBOJczIM302HbNCLoK2BGQ
 kSuZGIc1XuxfWU/YSn3UXXCwNdKxaZ0XxGXcBWZVPnEJ60mbBhzXDaazt6xEwknPDL3gH5eCWGA1rhoxfcWq2Pg6a5wJhGzK4+KUo6givVc5zTjYnMRb6nCK
 T8Kf5q6kasXqhLib8PDJmxpoBSxAWnWQ+SPMWLS/+Pi2BWmI2125VqEE06enJdwXGalX5ME8MSA5MVcfPWvia7Fr3/rrFDsEkHytbWHCfpOuDYo7ET/ZaW7g
 Cjedu4GDRKKFOMnN91XM+fYo6gdfjKWCTUrRSfDmmXildkm3v1Po1m4RCmGb3MM9Fc9qzwS/cRlCDKhk43nRC78p4ZvI9jLUc3tni8Ih+2Wq2D6T1bXIreVE
 FT1vpdzL9AaV5IaGskEvexd0N421/xNrwvvszklMT6BcBhrSFRYoJ7uZa0QA7oJIJmKL5E53fFIpPj1TZOJVJ/dZAKBmDszx2yn5XA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/08/2020 08:59, dikshita@codeaurora.org wrote:
> Hi Hans,
> 
> Thanks for your comments.
> 
> On 2020-08-25 15:34, Hans Verkuil wrote:
>> On 14/08/2020 07:29, Dikshita Agarwal wrote:
>>> LTR (Long Term Reference) frames are the frames that are encoded
>>> sometime in the past and stored in the DPB buffer list to be used
>>> as reference to encode future frames.
>>> This change adds controls to enable this feature.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>>> ---
>>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 23 ++++++++++++++++++++++
>>>  drivers/media/v4l2-core/v4l2-ctrls.c               |  6 ++++++
>>>  include/uapi/linux/v4l2-controls.h                 |  4 ++++
>>>  3 files changed, 33 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> index d0d506a..6d1b005 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> @@ -4272,3 +4272,26 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>>        - Selecting this value specifies that HEVC slices are expected
>>>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>>>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
>>> +
>>> +``V4L2_CID_MPEG_VIDEO_LTRCOUNT (enum)``
>>
>> I prefer _LTR_COUNT (same for the other control defines).
>>
>> I assume 'enum' is a mistake? This should be 'integer', right?
> Right, I will correct it at all the places.
>>
>>> +    Specifies the number of Long Term Reference frames encoder needs to
>>> +    generate or keep.
>>> +    This control is used to query or configure the number of Long Term
>>> +    Reference frames.
>>
>> Add something like: "Applicable to the H264 and HEVC encoder."
> Sure.
>>
>>> +
>>> +``V4L2_CID_MPEG_VIDEO_MARKLTRFRAME (enum)``
>>> +    This control is used to mark current frame as Long Term Reference
>>> +    frame.
>>
>> enum -> integer
>> _MARK_LTR_FRAME
>>
>> How about renaming this to: "_FRAME_LTR_INDEX"?
> You are suggesting to rename it to V4L2_CID_MPEG_VIDEO_MARK_LTR_FRAME or V4L2_CID_MPEG_VIDEO_MARK_FRAME_LTR_INDEX ?

V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX

>>
>> I would also suggest having the range as 0..LTR_COUNT where 0 means that
>> this is not a LTR frame. An alternative is to have two controls: one boolean
>> that determines if the frame is a LTR frame or not, and one control containing
>> the LTR index.
>>
>> Is the LTR index 0 or 1 based according to the standard? I think that if it is
>> 1 based you can use 0 to mean 'not an LTR frame'. If it is 0 based in
>> the standard,
>> then having two controls might be better.
>>
>> A third alternative might be to use -1 as the value to indicate that it is not
>> an LTR frame, but it feels hackish. I'm not sure yet.
>>
> Could you please help me to understand how this info will be helpful?
> This control won't be set by client for every frame. So a frame for which this control is not set
> is not a LTR frame and a frame for which this control is set is a LTR frame and will be marked with
> LTR index ranging from 0 to LTR_COUNT-1 (range is according to standard)

This isn't how requests work. If a control is not set in a request, then it is assumed
that the control value is unchanged. So in this case, the previously set value for this
control will be used.

Regards,

	Hans

>>> +    this provides a Long Term Reference index that ranges from 0
>>> +    to LTR count-1 and then the particular frame will be marked with that
>>> +    Long Term Reference index.
>>
>> Add something like: "Applicable to the H264 and HEVC encoder."
> sure, will add.
>>
>> This only makes sense when used with requests, right? Otherwise you cannot
>> reliably associate this control with a frame. That should be mentioned here.
> Sure, will add.
>>
>>> +
>>> +``V4L2_CID_MPEG_VIDEO_USELTRFRAME (enum)``
>>
>> enum -> bitmask
>> _USE_LTR_FRAMES
> Will correct this in next patch.
>>
>>> +    Specifies the Long Term Reference frame(s) to be used for encoding
>>> +    the current frame.
>>> +    This provides a bitmask which consists of bits [0, 15]. A total of N
>>> +    LSB bits of this field are valid, where N is the maximum number of
>>> +    Long Term Reference frames supported.
>>> +    All the other bits are invalid and should be rejected.
>>> +    The LSB corresponds to the Long Term Reference index 0. Bit N-1 from
>>> +    the LSB corresponds to the Long Term Reference index max LTR count-1.
>>
>> Add something like: "Applicable to the H264 and HEVC encoder."
>>
>> This too only makes sense when using requests, correct? That should be mentioned
>> here.
> Sure, will do.
>>
>> I assume that this must be set to 0 for LTR frames? Or at least this
>> control will
>> be ignored for LTR frames.
> Yes, frames marked as LTR frames will not be encoded by using any other LTR frame as a reference.
> So this control won't be set for LTR frames.
> This will be set only for the frames which needs to be encoded by using an LTR frame as a reference.
>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> index 3f3fbcd..3138c72 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -991,6 +991,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>      case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:        return "HEVC Slice Parameters";
>>>      case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:        return "HEVC Decode Mode";
>>>      case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:        return "HEVC Start Code";
>>> +    case V4L2_CID_MPEG_VIDEO_LTRCOUNT:        return "LTR Count";
>>> +    case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME:        return "Mark LTR";
>>> +    case V4L2_CID_MPEG_VIDEO_USELTRFRAME:        return "Use LTR";
>>
>> "Use LTR Frames"
>>
>>>
>>>      /* CAMERA controls */
>>>      /* Keep the order of the 'case's the same as in v4l2-controls.h! */
>>> @@ -1224,6 +1227,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>          break;
>>>      case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>>>      case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>>> +    case V4L2_CID_MPEG_VIDEO_LTRCOUNT:
>>> +    case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME:
>>> +    case V4L2_CID_MPEG_VIDEO_USELTRFRAME:
>>>          *type = V4L2_CTRL_TYPE_INTEGER;
>>>          break;
>>>      case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index 6227141..f2daa86 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -742,6 +742,10 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>>>  #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR    (V4L2_CID_MPEG_BASE + 642)
>>>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES    (V4L2_CID_MPEG_BASE + 643)
>>>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR    (V4L2_CID_MPEG_BASE + 644)
>>> +#define V4L2_CID_MPEG_VIDEO_LTRCOUNT    (V4L2_CID_MPEG_BASE + 645)
>>> +#define V4L2_CID_MPEG_VIDEO_MARKLTRFRAME    (V4L2_CID_MPEG_BASE + 646)
>>> +#define V4L2_CID_MPEG_VIDEO_USELTRFRAME        (V4L2_CID_MPEG_BASE + 647)
>>> +
>>>
>>>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>>  #define V4L2_CID_MPEG_CX2341X_BASE                (V4L2_CTRL_CLASS_MPEG | 0x1000)
>>>
>>
>> Regards,
>>
>>     Hans
> 
> Thanks,
> Dikshita

