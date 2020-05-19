Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7EB1D903F
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 08:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgESGpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 02:45:53 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36105 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726881AbgESGpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 02:45:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aw0Vj0CAPtKAsaw0YjOtUV; Tue, 19 May 2020 08:45:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589870750; bh=/VOpZ6S5UVapFcGjI/tkSgoLzsnF7u2DxT+PCaSgZAs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Omln4iNvDCkowrmBrxoFuZxauf8hoieAv2zaw+S8GdfJIUy2C+0tlABUzxF9laSJG
         4wRjYCEdhtDVornz0427DFDil2/WMpqTydc5WEfToflqmbt2ajRuL/DM16Awy2FN84
         KipzlqLRrdHacmmUQ+gaHjLFSo+9hs+d/fMSUQSDn32yU2ikdo6GYm5DfNJfdGDhP/
         l0Tf8KQMsLGXQztWknpwVriPc3DgaOD3pQJOLNslfFjSUOwDqD5YQDyCMAZlths/Cx
         Ol2s9shMeQkUAd7J9KidLkqUi1Mn6JSurnX43tMOgRkRuRGGx4T5mdpyVEOPgpCAZy
         G8Xal0LUClUlg==
Subject: Re: [PATCH] media: v4l2-ctrls: Add encoded frame quality controls
To:     majja@codeaurora.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, p.zabel@pengutronix.de,
        ezequiel@collabora.com, jonas@kwiboo.se,
        boris.brezillon@collabora.com, posciak@chromium.org,
        ribalda@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     tglx@linutronix.de, sumitg@nvidia.com
References: <1589836035-16579-1-git-send-email-majja@codeaurora.org>
 <11481ef8fcee02aba17ef527c56c78d2@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b35cca3a-6444-1124-41da-2982a7711cff@xs4all.nl>
Date:   Tue, 19 May 2020 08:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <11481ef8fcee02aba17ef527c56c78d2@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFPrzoysGY0oSfo+El4WQoJo3tBRZCLZ0GdVi8air8jUHFd1lc1VGdDWiT/GNQWK1JV9Q+rOMSnttJj94G771ar6kdUVL5jGw3LEqQ2oXeLCl2UqkYic
 du14aqbJ5syQRAdhtJJD3dbEYeYRyYO7PApgfnTg8SohnqeVsFAkP4NrKyuhMKTgnyAkCNg6WIGVIYOqRVlEdVqQ8hOzcfXy34wb8CHy1BaWGeH7BY9AgCPB
 kTaKImKdj1uvmvzMGx1kNOVwYhe+CbnkP/pf1bGQDR3/TDLNOZk3g7RuT91xqJBJPbkrW/4H2j4KL2w62Ar5JvNbgzwANp6QqlQY+P23rG6hiktb6lrXAe28
 ATiXgpbIecTJnP7wl+zjvj3c21DblozzuKt3MpGOWhIjrMmsXos4qBJjrVpkvDU9L1P29d3PrA3stsOF2dVIzFSiyvtHEkm/U1C3ACiijiW9c4SfMuz9OX8G
 X08RxACuQ+7E33kcYGSfybdV7h+J83xM6McMFycQZTrPfn716UMbnkvur7vCTLmFGwrt1oDvkbqkEajphaVB0w4hlKbQ4iSMfgM+FKdxACEG3Uh67DZEmv0j
 lco=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maheshwar,

On 18/05/2020 23:09, majja@codeaurora.org wrote:
> Hi,
> 
> Regarding below patch -
> 
> HEIF/HEIC image encoding uses HEVC/AVC encoders and client can set image 
> quality level using
> V4L2_CID_MPEG_VIDEO_FRAME_QUALITY control.
> 
> Reference BITRATE_MODE_CQ at
> https://developer.android.com/reference/android/media/MediaCodecInfo.EncoderCapabilities#BITRATE_MODE_CQ

So what you are really introducing here is a new enum v4l2_mpeg_video_bitrate_mode
mode: V4L2_MPEG_VIDEO_BITRATE_MODE_CQ.

Why not just add that new mode, then add V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY
which is only used if the bitrate mode is MODE_CQ.

That builds nicely on top of the already existing V4L2_CID_MPEG_VIDEO_BITRATE_MODE
control.

Regards,

	Hans

> 
> Regards,
>      Maheshwar.
> 
> 
> On 2020-05-18 14:07, Maheshwar Ajja wrote:
>> When frame quality control is enabled encoder will choose
>> the appropriate quantization parameter and bitrate to
>> produce the client requested frame quality level.
>> When frame quality control is disabled then frame quality
>> is decided based on appropriate controls (i.e.
>> V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE and/or
>> V4L2_CID_MPEG_VIDEO_BITRATE_MODE)
>>
>> Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
>> ---
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst          | 16 
>> ++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c                     |  3 +++
>>  include/uapi/linux/v4l2-controls.h                       |  2 ++
>>  3 files changed, 21 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index d0d506a..495b39b 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1081,6 +1081,22 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>>      Macroblock level rate control enable. Applicable to the MPEG4 and
>>      H264 encoders.
>>
>> +``V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE (boolean)``
>> +    Encoded frame quality control enable. If this control is enabled 
>> then
>> +    the quality level of the encoded frame is set with control
>> +    ``V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY``. If this control is 
>> disabled
>> +    then the quality level of encoded frame is adjusted with 
>> appropriate
>> +    controls (e.g. ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE`` or
>> +    ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE``). Applicable to encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_FRAME_QUALITY (integer)``
>> +    Encoded frame quality control. If the control
>> +    ``V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE`` is enabled then the
>> +    quality of encoded frame is set with this control. Valid range is 
>> 1 to
>> +    100 where 1 indicates lowest quality and 100 indicates highest 
>> quality.
>> +    Encoder will decide the appropriate quantization parameter and 
>> bitrate
>> +    to produce requested frame quality. Applicable to encoders.
>> +
>>  ``V4L2_CID_MPEG_VIDEO_MPEG4_QPEL (boolean)``
>>      Quarter pixel motion estimation for MPEG4. Applicable to the MPEG4
>>      encoder.
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c
>> b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index 1c617b4..1477198 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -982,6 +982,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice 
>> Parameters";
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode 
>> Mode";
>>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE:		return "Frame Quality 
>> Enable";
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_QUALITY:			return "Frame Quality";
>>
>>  	/* CAMERA controls */
>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>> @@ -1178,6 +1180,7 @@ void v4l2_ctrl_fill(u32 id, const char **name,
>> enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_FLASH_READY:
>>  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
>>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
>> +	case V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE:
>>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
>>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
>>  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
>> diff --git a/include/uapi/linux/v4l2-controls.h
>> b/include/uapi/linux/v4l2-controls.h
>> index 0ba1005..d97a934 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -742,6 +742,8 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field 
>> {
>>  #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE 
>> + 642)
>>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE 
>> + 643)
>>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE 
>> + 644)
>> +#define V4L2_CID_MPEG_VIDEO_FRAME_QUALITY_ENABLE	(V4L2_CID_MPEG_BASE + 
>> 645)
>> +#define V4L2_CID_MPEG_VIDEO_FRAME_QUALITY		(V4L2_CID_MPEG_BASE + 646)
>>
>>  /*  MPEG-class control IDs specific to the CX2341x driver as defined 
>> by V4L2 */
>>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)

