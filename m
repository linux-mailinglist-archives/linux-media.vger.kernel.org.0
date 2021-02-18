Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED6231EC9E
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbhBRQzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:55:47 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43399 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231970AbhBROj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 09:39:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CkMelFVsRZvk6CkMilAFbC; Thu, 18 Feb 2021 15:33:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613658792; bh=Co+60lUSkku7Y2NVFbZ7M2fVvW20h4Q0ggE3CNrsUXY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HgvFZ699Sgnc4JNE/N61OJZm+AEcDabCu/sh4eQdyycxhK5s1hXRsqTLdUtr0UBK6
         W0Vih7NhljWIEiGApclJS6NYNoRiMd85G4Zxwpjx5RfymCdGzZian84zhQQb+Nr7j4
         xiq27vEOfVItwwmN0x8XDusVyoNUcefY3hPUIYNAJYSPYiTAQSHlsm0rzrX1EsW2JO
         Ngh3hNXk+YqreWbqNctOm9JrtUwo/RIdgMfMsj4doCTIh8iRkobjLI1Bs46sBW2n8K
         HUh9MAR3JvtOF8/ln7SFZeYFvrLjc0Wd/mEb4dYT3oW8T0EkUtwaBWXobMupCbbkHg
         oNm+huEQ6ow1A==
Subject: Re: [PATCH v6 1/2] media: v4l2-ctrl: add controls for long term
 reference.
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, dikshita@codeaurora.org
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1611553919-17919-1-git-send-email-dikshita@codeaurora.org>
 <1611553919-17919-2-git-send-email-dikshita@codeaurora.org>
 <d20ba57f-54a7-5a61-a64b-2d9433b79281@xs4all.nl>
 <6e59d1bee1d0f1b64aab77959bb22e6e@codeaurora.org>
 <2a6bf75f-a44c-e921-55a0-abd6d6eaf67f@xs4all.nl>
 <26407550afb3d5a2ee4b3af4474acdcf4191ed68.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2e00937c-f0e8-5678-cade-56696e160fab@xs4all.nl>
Date:   Thu, 18 Feb 2021 15:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <26407550afb3d5a2ee4b3af4474acdcf4191ed68.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOnCV8vw8dChlz0q0aLZ/3Dg1RV9IOuLiZt75ML9fpHdb95weu/mfB91a9LbeUHmRJvUZuMxwpjmXXGabbnOuyfdXubxqPQJdxnNpxdOEa+vTG796XH0
 eKLJWWG6480h+ARlp9NxddkM6u8MPLoaPzczhxfCwCS/fkyFZyrua9+xp7HsNTSCAvR8SM5dtgiUcGSNq0+y6gqpQy/YxPp7XeXFrYoIZtEc5Hhz7akWscFi
 wHMhaRq+OLK1r/MOeto46YkNyOJB/zBxEd4zt7a5jLPmkKVupKpP5A4o6pLuHHxnoY3jyyEzGQ/8N6qZgfZwFV7lZEUUqUXQkfaDtF9ZDor1a/sx8sV5TjL4
 EGmTTAQoOUenia1/1XeBq1Jon7IoYQ8IifaTnzIlZdozwHGAZM0s3hYKXtkYEsXft5WLQapk/O7iSGT3960vYSI+HERreg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/02/2021 17:03, Nicolas Dufresne wrote:
> Le jeudi 04 février 2021 à 11:05 +0100, Hans Verkuil a écrit :
>> On 04/02/2021 06:01, dikshita@codeaurora.org wrote:
>>> On 2021-02-01 16:50, Hans Verkuil wrote:
>>>> On 25/01/2021 06:51, Dikshita Agarwal wrote:
>>>>> Long Term Reference (LTR) frames are the frames that are encoded
>>>>> sometime in the past and stored in the DPB buffer list to be used
>>>>> as reference to encode future frames.
>>>>> This change adds controls to enable this feature.
>>>>>
>>>>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>>>>> ---
>>>>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 18 
>>>>> ++++++++++++++++++
>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c                   | 14 
>>>>> ++++++++++++++
>>>>>  include/uapi/linux/v4l2-controls.h                     |  3 +++
>>>>>  3 files changed, 35 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>>>>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> index 400774c..a37d460 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> @@ -3637,3 +3637,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field 
>>>>> -
>>>>>        - Selecting this value specifies that HEVC slices are expected
>>>>>          to be prefixed by Annex B start codes. According to 
>>>>> :ref:`hevc`
>>>>>          valid start codes can be 3-bytes 0x000001 or 4-bytes 
>>>>> 0x00000001.
>>>>> +
>>>>> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
>>>>> +       Specifies the number of Long Term Reference (LTR) frames 
>>>>> encoder needs
>>>>> +       to generate or keep. This is applicable to the H264 and HEVC 
>>>>> encoders.
>>>>> +
>>>>> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
>>>>> +       The current frame is marked as a Long Term Reference (LTR) 
>>>>> frame
>>>>> +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
>>>>> +       This is applicable to the H264 and HEVC encoders and can be 
>>>>> applied using
>>>>> +       Request API.
>>>>
>>>> You mentioned in reply to my comment that the venus driver didn't 
>>>> support the
>>>> Request API that it is also possible to use it without that API.
>>>>
>>>> But that requires more precise documentation. I assume that without the 
>>>> Request
>>>> API you would set this control, then queue the buffer containing the 
>>>> frame this
>>>> control should apply to, then wait until it is dequeued. Since that's 
>>>> the only
>>>> way you can be certain this control is applied to the correct frame.
>>>>
>>>> Is this indeed what you do in your application?
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>>
>>> Hi Hans,
>>>
>>> Yes, It is possible without request API as well in a non-synchronized 
>>> way.
>>> And we don't need to wait for the frame to be dequeued.
>>> The driver implementation ensures that whenever the LTR control is 
>>> received,
>>> it applies to the frame received after that. Not to frame which would be 
>>> encoded next.
>>> So that it is at least synchronized between driver & encoder.
>>
>> This is highly driver dependent. I'm not even sure this is true for the venus
>> driver: if you prequeue, say, 4 output buffers to the encoder and call
>> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX after the second buffer (so it should
>> apply to the third), and only after the fourth you call VIDIOC_STREAMON,
>> does the venus driver still keep track of the order of the queued buffers
>> and when these controls are set? Once STREAMON is called it looks like it
>> stays synced since everything is queued into a command queue, if I understand
>> the code correctly.
>>
>> The problem is that when controls are applied in relation to queued buffers
>> is not defined, unless you use the Request API. Typically controls are applied
>> immediately, so the venus driver is a bit of an anomaly in that respect.
>>
>> You can make an explicit requirement that these controls apply to the next
>> queued buffer if no request API is used, but you really must be 100% certain
>> that the venus driver does that right (and as mentioned, I have my doubts
>> about
>> the case where you queue buffers before calling STREAMON).
> 
> Do you propose to start usign request for stateful encoder ? If this is the
> case, I'd like to remind that it's not always possible to notify encode
> completion in request queue order for this type of HW. Reordering might be
> implicit in the firmware design, so the driver may not have any notification
> until multiple frames have been encoded.
> 
> To resume, we can use request for this type of application, no issues, but
> userspace may not switch to waiting on the request for completion as this may
> have HW specific behaviour. It will have to resort to polling for READ, and
> dequeue from capture queue and figure-out after the fact which request are now
> complete.

Good point. Perhaps we should hold off using the request api here, at least for
the time being.

Regards,

	Hans

> 
> Nicolas
> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> Thanks,
>>> Dikshita
>>>
>>>>> +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
>>>>> +
>>>>> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
>>>>> +       Specifies the Long Term Reference (LTR) frame(s) to be used 
>>>>> for
>>>>> +       encoding the current frame.
>>>>> +       This provides a bitmask which consists of bits [0, 
>>>>> LTR_COUNT-1].
>>>>> +       This is applicable to the H264 and HEVC encoders and can be 
>>>>> applied using
>>>>> +       Request API.
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c 
>>>>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> index 16ab54f..84c1eb8 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> @@ -950,6 +950,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>         case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:             return
>>>>> "Vertical MV 
>>>>> Search Range";
>>>>>         case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:             return
>>>>> "Repeat Sequence 
>>>>> Header";
>>>>>         case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:               return
>>>>> "Force Key Frame";
>>>>> +       case V4L2_CID_MPEG_VIDEO_LTR_COUNT:                     return
>>>>> "LTR Count";
>>>>> +       case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:               return
>>>>> "Frame LTR Index";
>>>>> +       case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:                return
>>>>> "Use LTR Frames";
>>>>>         case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:            return
>>>>> "MPEG-2 Slice 
>>>>> Parameters";
>>>>>         case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:            return
>>>>> "MPEG-2 
>>>>> Quantization Matrices";
>>>>>         case V4L2_CID_FWHT_I_FRAME_QP:                          return
>>>>> "FWHT I-Frame QP Value";
>>>>> @@ -1277,6 +1280,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, 
>>>>> enum v4l2_ctrl_type *type,
>>>>>         case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>>>>>                 *type = V4L2_CTRL_TYPE_INTEGER;
>>>>>                 break;
>>>>> +       case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
>>>>> +               *type = V4L2_CTRL_TYPE_INTEGER;
>>>>> +               break;
>>>>> +       case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
>>>>> +               *type = V4L2_CTRL_TYPE_INTEGER;
>>>>> +               *flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>>>>> +               break;
>>>>> +       case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
>>>>> +               *type = V4L2_CTRL_TYPE_BITMASK;
>>>>> +               *flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>>>>> +               break;
>>>>>         case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>>>>>         case V4L2_CID_PAN_RESET:
>>>>>         case V4L2_CID_TILT_RESET:
>>>>> diff --git a/include/uapi/linux/v4l2-controls.h 
>>>>> b/include/uapi/linux/v4l2-controls.h
>>>>> index af8dda2..c0bb87b 100644
>>>>> --- a/include/uapi/linux/v4l2-controls.h
>>>>> +++ b/include/uapi/linux/v4l2-controls.h
>>>>> @@ -422,6 +422,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>>>>  #define 
>>>>> V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE           (V4L2_CID_CODEC_BASE+227
>>>>> )
>>>>>  #define 
>>>>> V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE           (V4L2_CID_CODEC_BASE+228
>>>>> )
>>>>>  #define 
>>>>> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME             (V4L2_CID_CODEC_BASE+229
>>>>> )
>>>>> +#define
>>>>> V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_CODEC_BASE+230)
>>>>> +#define 
>>>>> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX             (V4L2_CID_CODEC_BASE+231
>>>>> )
>>>>> +#define
>>>>> V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES             (V4L2_CID_CODEC_BASE+232)
>>>>>
>>>>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>>>>  #define
>>>>> V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL                        (V4L2_CID_CODEC_B
>>>>> ASE+270)
>>>>>
>>
> 
> 

