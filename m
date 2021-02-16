Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A9A31C7AF
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 09:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhBPI70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 03:59:26 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34295 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229695AbhBPI7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 03:59:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BwBnl0ykwZvk6BwBrl4Jfw; Tue, 16 Feb 2021 09:58:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613465920; bh=pBx+Qke923HfqOcaKzS2ABpma4SzvMPEpVSGK4JxA9Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=m7OlgFhgPECo9S8zXXrpLtSuGOGJqPSRn63NQZAzvyDVlhLUeJPXeQ3ndyzEigLSd
         xG7JgMYS3IJ02iFmNswAtl8O1QP91vPtJoWZpAlScdclAYybf5bK+lprFjiXQK0pAf
         hkrgRumps+RCaZlFVkhmNHrr0jLHkmIAgJ2HillKobOEzG27nSyu1Ki2ugN+oujll9
         nw+JAMkikDUi5yFpK9gVJBSlRMYToP8sO2KgXJI2q7PeRCwPNnu/gxLSyuzr4lYxfs
         UCcfeAE3hLIKmQSwEgVkT+wVQswnEoQ5/beVtDafvt+AHtO7O+cdh/0kpLnag51YkC
         9sAny4RLkKp3Q==
Subject: Re: [PATCH 1/2] v4l2-ctrl: Add decoder conceal color control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
 <20210209094527.2173690-2-stanimir.varbanov@linaro.org>
 <cccae00e-e30e-6691-d954-27379a104115@xs4all.nl>
 <489f1417-085d-4057-f2e8-1cc8db0ed161@linaro.org>
 <70c04719-39ac-9ba7-cd2f-6c5b9d5f2275@xs4all.nl>
 <12b37304-84d1-63fe-1d85-60268502d8bc@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <eb410d2c-9650-2251-cff8-4306663f41f9@xs4all.nl>
Date:   Tue, 16 Feb 2021 09:58:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <12b37304-84d1-63fe-1d85-60268502d8bc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKNfOOXNsqqd8CdqBPGXXyfXGAYFbE8Of9vkvtBLbAzMdNT4XwpIwN/tsjl4F2gs5hUXrmUgNn43vP6IBP64NuNebNz95IN863L/TiFzR8whaEfqRbVh
 0zeJ/d1VQMDIc8/LooNhX+dgf5bRzpNC1YJLJwvOU3NFNUnvpaPaGRKDcWVuAY04Hw/+W/q9LFUg8XevC0pSPoeIR/49SC5ppPLPPvwLlpn1iQLrmi06oqB9
 XfklOwwZxywzdJKrCuHOCc+qL7IfQVHuu3rIv3MKM/IkRWfqgDr0JEYT0PVEtt3FV5uwx3FSymiWMjaw39XyjDAujovDkKDVd73hn/tDWiY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/02/2021 09:56, Stanimir Varbanov wrote:
> 
> 
> On 2/15/21 1:57 PM, Hans Verkuil wrote:
>> On 15/02/2021 12:32, Stanimir Varbanov wrote:
>>>
>>>
>>> On 2/9/21 1:05 PM, Hans Verkuil wrote:
>>>> On 09/02/2021 10:45, Stanimir Varbanov wrote:
>>>>> Add decoder v4l2 control to set conceal color.
>>>>>
>>>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>>>> ---
>>>>>  .../media/v4l/ext-ctrls-codec.rst             | 20 +++++++++++++++++++
>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++++++
>>>>>  include/uapi/linux/v4l2-controls.h            |  1 +
>>>>>  3 files changed, 30 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> index 00944e97d638..994650052333 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> @@ -674,6 +674,26 @@ enum v4l2_mpeg_video_frame_skip_mode -
>>>>>      is currently displayed (decoded). This value is reset to 0 whenever
>>>>>      the decoder is started.
>>>>>  
>>>>> +``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
>>>>> +    This control sets conceal color in YUV color space. It describes the
>>>>> +    client preference of error conceal color in case of error where
>>>>> +    reference frame is missing. The decoder would paint the reference
>>>>> +    buffer with preferred color and use it for future decoding.
>>>>> +    Applicable to decoders.
>>>>
>>>> You should mention explicitly that this is using 16-bit color components
>>>> and expects Limited Range.
>>>
>>> I don't want to limit the client to Limited range only. I'll mention in
>>> the description that both ranges are valid.
>>
>> OK, but then you need to describe what the color format depends on. See more
>> below.
>>
>>>
>>>>
>>>>> +
>>>>> +.. flat-table::
>>>>> +    :header-rows:  0
>>>>> +    :stub-columns: 0
>>>>> +
>>>>> +    * - Bit 0:15
>>>>> +      - Y luminance
>>>>> +    * - Bit 16:31
>>>>> +      - Cb chrominance
>>>>> +    * - Bit 32:47
>>>>> +      - Cr chrominance
>>>>> +    * - Bit 48:63
>>>>> +      - Must be zero
>>>>> +
> 
> The table how the bits are spread into int64.
> 
>>>>>  ``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
>>>>>      If enabled the decoder expects to receive a single slice per buffer,
>>>>>      otherwise the decoder expects a single frame in per buffer.
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> index 016cf6204cbb..a3b9d28a00b7 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>>>> @@ -945,6 +945,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>  	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
>>>>>  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
>>>>>  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
>>>>> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
>>>>>  	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
>>>>>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
>>>>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>>>>> @@ -1430,6 +1431,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>>>  		*max = 0x7fffffffffffffffLL;
>>>>>  		*step = 1;
>>>>>  		break;
>>>>> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
>>>>> +		*type = V4L2_CTRL_TYPE_INTEGER64;
>>>>> +		*min = 0;
>>>>> +		/* default for 8bit black, luma is 16, chroma is 128 */
>>>>
>>>> Since this is 16 bit the actual default luma value for black is 4096 and for chroma use
>>>> 32768 (i.e. both values are times 256).
>>>
>>> If we follow this for pixel format with 10bit per channel we have to
>>> multiply by 64?
>>
>> No, you multiply by 4. 12 bit depth will multiple by 16, and 16 bit depth by 256.
>>
>> But how do you format this? Using bits 29-0? Or use 9-0 for one color component,
>> 25-16 for another and 41-32 for the last component?
> 
> I described this in the table above:
> 
> Bit  0:15 - Y luminance
> Bit 16:31 - Cb chrominance
> Bit 32:47 - Cr chrominance
> Bit 48:63 - Must be zero
> 
> So depending on the bit depth of the current pixel format:
> 
>  8bit - 0:7  Y', 16:23 Cb, 32:39 Cr
> 10bit - 0:9  Y', 16:25 Cb, 32:41 Cr
> 12bit - 0:11 Y', 16:27 Cb, 32:43 Cr

Apologies, I missed that table!

Regards,

	Hans

> 
>>
>> Also missing is an explanation of which bits are for Y', which for Cb and which for Cr.
>>
>> It is surprisingly hard to provide an unambiguous description of this :-)
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>>
>>>>> +		*def = 0x8000800010LL;
>>>>> +		*max = 0xffffffffffffLL;
>>>>> +		*step = 1;
>>>>> +		break;
>>>>>  	case V4L2_CID_PIXEL_RATE:
>>>>>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>>>>>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>>>> index 039c0d7add1b..5e5a3068be2d 100644
>>>>> --- a/include/uapi/linux/v4l2-controls.h
>>>>> +++ b/include/uapi/linux/v4l2-controls.h
>>>>> @@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>>>>>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>>>>>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>>>>>  #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
>>>>> +#define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+231)
>>>>>  
>>>>>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>>>>>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
>>>>>
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>
>>
> 

