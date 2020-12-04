Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801E42CEEAB
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 14:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgLDNOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 08:14:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbgLDNOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 08:14:02 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAF9C061A4F
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 05:13:16 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 23so5278107wrc.8
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 05:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qDVxeWwAmtWSrwk0fTKbdPJheQPR8KPP9UH9PnzM3Uk=;
        b=IrjJE4DI4rUhKAe5PYTLHVxYbdvfYc1PuOLF45RzFc6Om5m3W2u4E8x8alvnbM0uf3
         UmQ3PZkAxXH2680bEdcXb+s+NS03rMSFYz6yMW39zUVzUnd4Cnc9PUJLUH3kgaDxiFaK
         dUyY2rEcXx3e88HL1P/5xtUUB+5FXZKcWqJjwColeKpgqDw5NPj1+RFiPkXlfuBtXQe8
         kMTZQFTUjcOqqSIn6QY1kfq9tBi2NnKh0crA/Pw7ddZIUIUkB8IK1WRHVBUxrMH9Ks7i
         cQKtKUQD8Cq3vWMHlgAicNBLqFWrNx5PQ/whSBJRQnAV9ZeZFNxyOv7jaNBbHqzJaaeO
         f6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qDVxeWwAmtWSrwk0fTKbdPJheQPR8KPP9UH9PnzM3Uk=;
        b=FohK0kchQ2xe0qgrs8EktT2AYhXgeKCiXEJXmGx/UdeybdJfmpHi2vErF57ilFtKZc
         qpuhJ31yAuzFDrwzeKZI34nh9B8Wtlf7khjjDYLIrIpfeDDz2VXmP0czxu/j4tSdueq8
         P6Bj/dsm2JN2NnnLCYIxm6tJX7oefU5MKUq/pbXUPOSjMt7+1tok5qoyKT3p2O+y2VHC
         uBRaP23iz7+N+d00wmMJJzvlQJMpok7RwS09pggqHZ94I1HStLsqB+LsnzAngstRGoaw
         hT638UCAo9QO2fJL42IkORBftu1BlaV+yMfdnSHByDHtnzs56kcYD5sWPGYrCM2nEV+M
         /KyQ==
X-Gm-Message-State: AOAM533nsRqxK6wqVadTlV3LoNh7WHbKj/ta0Nr+zd1S4T3IpfyQFH0s
        rAn+i741k8LqA6E8Ja1VK8GkTA==
X-Google-Smtp-Source: ABdhPJwkqCWM2TZ2CuesjaMX1RqD5Dv6PLd8YAbhhrKQrayUvZwKBaHKStV0cW7I7oBAmIhi9GmM5w==
X-Received: by 2002:adf:dd11:: with SMTP id a17mr3246735wrm.360.1607087595196;
        Fri, 04 Dec 2020 05:13:15 -0800 (PST)
Received: from [192.168.0.3] ([84.238.208.216])
        by smtp.googlemail.com with ESMTPSA id 2sm4329993wrq.87.2020.12.04.05.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Dec 2020 05:13:14 -0800 (PST)
Subject: Re: [PATCH 1/4] v4l2-ctrl: Make display delay and display enable std
 controls
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
 <20201109173541.10016-2-stanimir.varbanov@linaro.org>
 <e0a49eb2-f4d0-0532-52e0-5bc58ce85ad9@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <f775e5cf-3361-e7ed-bd85-6d0ad06db48c@linaro.org>
Date:   Fri, 4 Dec 2020 15:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0a49eb2-f4d0-0532-52e0-5bc58ce85ad9@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/2/20 4:09 PM, Hans Verkuil wrote:
> On 09/11/2020 18:35, Stanimir Varbanov wrote:
>> Make display delay and display delay enable MFC controls standard v4l
>> controls. This will allow reuse of the controls for other decoder
>> drivers. Also the new proposed controls are now codec agnostic because
>> they could be used for any codec.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst   | 15 +++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls.c              |  4 ++++
>>  include/uapi/linux/v4l2-controls.h                |  2 ++
>>  3 files changed, 21 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index ce728c757eaf..82c9cda40270 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -679,6 +679,21 @@ enum v4l2_mpeg_video_frame_skip_mode -
>>      otherwise the decoder expects a single frame in per buffer.
>>      Applicable to the decoder, all codecs.
>>  
>> +``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE (boolean)``
> 
> I'd use _DEC_ instead of _DECODER_.

OK.

> 
>> +    If the display delay is enabled then the decoder is forced to return
>> +    a CAPTURE buffer (decoded frame) after processing a certain number
>> +    of OUTPUT buffers. The delay can be set through
>> +    ``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY``. This
>> +    feature can be used for example for generating thumbnails of videos.
>> +    Applicable to the decoder.
> 
> Hmm. Is this: "after processing the first 'display delay' number of OUTPUT buffers."
> Or is this: "every 'display delay' number of OUTPUT buffers."
> 
> I.e., is it a one-shot thing or a periodical thing?

It is periodical.

> 
> If it is a one-shot thing, then this should probably be a button type, not
> a boolean.
> 
>> +
>> +``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY (integer)``
>> +    Display delay value for decoder. The decoder is forced to
>> +    return a decoded frame after the set 'display delay' number of
>> +    frames. If this number is low it may result in frames returned out
>> +    of display order, in addition the hardware may still be using the
>> +    returned buffer as a reference picture for subsequent frames.
> 
> Can this be 0? And if so, what does that mean?

Yes, it can be 0 and I'm using this to change decoder decode order in
Venus driver:

V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY ctl->val = 0
V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE ctl->val = true

Then the decoder will produce output buffers in decode-order instead of
default display-order.

> 
>> +
>>  ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
>>      Enable writing sample aspect ratio in the Video Usability
>>      Information. Applicable to the H264 encoder.
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index bd7f330c941c..4a21802e026b 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -874,6 +874,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
>>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
>>  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
>> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:		return "Display Delay";
>> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
>>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
>>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
>>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
>> @@ -1221,6 +1223,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_FLASH_READY:
>>  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
>>  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
>> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:
>>  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
>>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
>>  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
>> @@ -1256,6 +1259,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  		break;
>>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
>>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>> +	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:
>>  		*type = V4L2_CTRL_TYPE_INTEGER;
>>  		break;
>>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 7035f4fb182c..d6b19f8d0022 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -773,6 +773,8 @@ enum v4l2_mpeg_video_frame_skip_mode {
>>  	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
>>  	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
>>  };
>> +#define V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY		(V4L2_CID_MPEG_BASE + 647)
>> +#define V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE	(V4L2_CID_MPEG_BASE + 648)
> 
> This will need to be rebased once this PR is merged:
> https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/
> 
>>  
>>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
>>
> 
> Regards,
> 
> 	Hans
> 

-- 
regards,
Stan
