Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8652D301F
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 17:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbgLHQqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 11:46:25 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53605 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730216AbgLHQqZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Dec 2020 11:46:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id mg7NkDtV0YbdWmg7RkuKXj; Tue, 08 Dec 2020 17:45:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607445941; bh=8MUa98fO64oBVqSnBVfXJEGXjP2Dg0UX4TOinNqniLg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nwspB0SSu3A2F6koUE+zC8iaj0zwSD2Qln/kCScDZIVaSNukGlESpTX0I8HgHEIsK
         Eqc9ACMnGkUA89nxr6qsW9lHKRKB1Za9k/RSQOGmJfwfIPGUrUA3c44s1Om0aGaslt
         E4bMj0vYVhEp2l6eYhQt8W9vTysmHdU3haMFZEZNczo+gYKJ2nUwieBlrSwegH4FR5
         +zAZzvt0Px9NqTlnCzbFVAUrCWlERN+gYuUXTy5OMKE59z0HFb/WQPBIdoLvgIaTZQ
         nsXnUjdJoR36/M+cNv7XUE+4O3gGQtz3oLMx7ojwpUOaY/xDL4o3jGnsT9deqRM8on
         QwKdzbbCkRWhg==
Subject: Re: [PATCH v4] media: v4l2-ctrl: add control for long term reference.
To:     dikshita@codeaurora.org
Cc:     linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
References: <1606810437-2797-1-git-send-email-dikshita@codeaurora.org>
 <47ac36cf-3931-ed68-62e9-821a669378f8@xs4all.nl>
 <6b044c9be4a99adc18dd76765b089760@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6c6f56ce-750b-0706-1ff0-46adefcfe542@xs4all.nl>
Date:   Tue, 8 Dec 2020 17:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6b044c9be4a99adc18dd76765b089760@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN6WVuBRVj/Ft16vzCX/GNupMf+y1H1wIgFehQG4r7R/QNklsC51bDOoZa+i6mM0YGxBRk3CJ9LuICOKqY3acpkmuyd7gNP+n/zdd6KOS5AXRf4/mZ9e
 IGINfkfwkafsSxd1igc/XQRALyb/4yit8BP2t055krrRB/FqzsdJTInRFSdQmghfcHfxCntoKp9vkhafmN0g3cKdZcZS8T1QQS3mZPlS6MCJl5X7BGw7n60J
 f6g21T1RYpHAwgyKyR+TpLTjlhVmj9z9p+lcnrppdvCqovKdc65hIgE+NcF8R9gHaEMITYmJmfr6aOElKIRBpb7aapJAEihhGgpGwGLFocZpIbyKlOAECYuD
 WuDBdN7mxD3H7T8ieEtpT4CnjrgkAIYn7Ai+tIUBmMt2QODmFE8mbGGnaBdt8esfqNpGq/WMDI52P9Qi9qlUxxKg9WrVbg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/12/2020 17:44, dikshita@codeaurora.org wrote:
> Hi Hans,
> 
> On 2020-12-02 19:18, Hans Verkuil wrote:
>> On 01/12/2020 09:13, Dikshita Agarwal wrote:
>>> Long Term Reference (LTR) frames are the frames that are encoded
>>> sometime in the past and stored in the DPB buffer list to be used
>>> as reference to encode future frames.
>>> This change adds controls to enable this feature.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>>> ---
>>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 18 
>>> ++++++++++++++++++
>>>  drivers/media/v4l2-core/v4l2-ctrls.c                   | 14 
>>> ++++++++++++++
>>>  include/uapi/linux/v4l2-controls.h                     |  3 +++
>>>  3 files changed, 35 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
>>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> index 3b86959..40634f8 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> @@ -4450,3 +4450,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field 
>>> -
>>>        - Selecting this value specifies that HEVC slices are expected
>>>          to be prefixed by Annex B start codes. According to 
>>> :ref:`hevc`
>>>          valid start codes can be 3-bytes 0x000001 or 4-bytes 
>>> 0x00000001.
>>> +
>>> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
>>> +       Specifies the number of Long Term Reference (LTR) frames 
>>> encoder needs
>>> +       to generate or keep. This is applicable to H264 and HEVC 
>>> encoder.
>>> +
>>> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
>>> +       The current frame is marked as a Long Term Reference (LTR) 
>>> frame
>>> +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
>>> +       This is applicable to H264 and HEVC encoder and can be applied 
>>> using
>>> +       Request Api.
>>> +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
>>> +
>>> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
>>> +       Specifies the Long Term Reference (LTR) frame(s) to be used 
>>> for
>>> +       encoding the current frame.
>>> +       This provides a bitmask which consists of bits [0, 
>>> LTR_COUNT-1].
>>> +       This is applicable to H264 and HEVC encoder and can be applied 
>>> using
>>> +       Request Api.
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c 
>>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> index e5b726f..0b81b39 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -958,6 +958,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV 
>>> Search Range";
>>>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence 
>>> Header";
>>>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
>>> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
>>> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "frame LTR index";
>>
>> "Frame LTR Index"
>>
>>> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frame(s)";
>>
>> Just: "Use LTR Frames". No '(s)'.
>>
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice 
>>> Parameters";
>>>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 
>>> Quantization Matrices";
>>>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless 
>>> Parameters";
>>> @@ -1273,6 +1276,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, 
>>> enum v4l2_ctrl_type *type,
>>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>>  		break;
>>> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
>>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>>> +		break;
>>> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
>>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>>> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>>> +		break;
>>> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
>>> +		*type = V4L2_CTRL_TYPE_BITMASK;
>>> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
>>> +		break;
>>>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>>>  	case V4L2_CID_PAN_RESET:
>>>  	case V4L2_CID_TILT_RESET:
>>> diff --git a/include/uapi/linux/v4l2-controls.h 
>>> b/include/uapi/linux/v4l2-controls.h
>>> index e37b85f..710bc53 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -421,6 +421,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>>  #define 
>>> V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
>>>  #define 
>>> V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
>>>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
>>> +#define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  
>>> (V4L2_CID_MPEG_BASE + 230)
>>> +#define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            
>>> (V4L2_CID_MPEG_BASE + 231)
>>> +#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES             
>>> (V4L2_CID_MPEG_BASE + 232)
>>>
>>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
>>>
>>
>> Note that this and the other patches from you that add
>> V4L2_CID_MPEG_VIDEO controls
>> will need to be rebased as soon as this PR is merged:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/
>>
>> I recommend waiting until that's in.
>>
>> I currently have the following patches from you adding new controls
>> besides this one:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/1606121442-31074-1-git-send-email-dikshita@codeaurora.org/
>> https://patchwork.linuxtv.org/project/linux-media/patch/1605682497-29273-2-git-send-email-dikshita@codeaurora.org/
>> https://patchwork.linuxtv.org/project/linux-media/patch/1605682497-29273-3-git-send-email-dikshita@codeaurora.org/
>>
>> What is missing is driver support for these new controls. I recommend 
>> that, once
>> the PR mentioned above is merged, you make a new series combining all 
>> three
>> patches + patches that add support for this to the venus driver.
>>
> I will address all comments in the next version and will include driver 
> implementation as well.
> Once all the driver changes are reviewed, I will make a series with all 
> final patches, Hope that's fine.

That sounds great!

Regards,

	Hans

> 
> Thanks,
> Dikshita
> 
>> Regards,
>>
>> 	Hans

