Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07B42CBEAC
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgLBNti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:49:38 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34963 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726023AbgLBNth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 08:49:37 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kSV1kEQE5N7XgkSV4ktJOp; Wed, 02 Dec 2020 14:48:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606916934; bh=3KTrEnxK8WSO3V61lmcyvwAYIX9am2Ht8S65/XrGBkE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=inc6anPv0urPLKfCs+dcDiHR/Rb59/iQ6XMaXOSDFAGg59PTr/C2B6DbfIMKPPPNP
         NW0CzGFJ0mPGL2A/j04Des/znBAIIOjQ7MjsK1FlJkbWEh/IXHGRWK4T+KUELAYZmV
         UBDMTcabkpbd01EgKbPps9YRFXpDiG9uM+BI/E1xyjWAHGNwEadKwyeKPLrnwawgMm
         cVAUQOrEe16UOx8CbYz8Bwn97jopQ/ssCSaHd8i8ePaqFnnHa3SDNujqszChjMkon2
         FrzY1ivStxzNibTgpW9Ul6ELd7rcX8OaWe9o+33Aqc0vcQYQGOoLNf++GY/YBi+e6n
         1oEBntbUmZvLQ==
Subject: Re: [PATCH v4] media: v4l2-ctrl: add control for long term reference.
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1606810437-2797-1-git-send-email-dikshita@codeaurora.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <47ac36cf-3931-ed68-62e9-821a669378f8@xs4all.nl>
Date:   Wed, 2 Dec 2020 14:48:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1606810437-2797-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDYSzoM02AHmjGcfzEqZg7lrXtfhvfc4+JREvhhlPl5QFY/tq9tNjExelHzj8hWvMp6sRxhvCLNMMJfjdYL0KYO2IeuOSWt9EuOta5Gnfpz58KV6YEp4
 SelqMesbB+CO/tO7M47wHIiw1PG4VetvP1oScSu9FbWvNk+UgN9JhbWoSjweymbLgcuD1G7Nu8WH/RByZv/jLVTplR8BKGcKdfR1bxiowdBhTDSkxQafrznE
 icXKX8+MQeowhefxr7knvNbJLsY740nOvAT5V+xUGd8fKTti7d5Po9bxjUI6eL2iItcRsJXag5ASEzzgimZBRlXfCe0PtDlB4MsmY2pH+4s0FEC7H3JO4Xny
 lDLGvt1/NW7fjPgacGw6JdAebvaSHe5XaclLCNZjIUl25uW0/C7dJknT28rMBsIxrwtZwufcFa8F/dAlkTQ6ENOYLk59ug==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/12/2020 09:13, Dikshita Agarwal wrote:
> Long Term Reference (LTR) frames are the frames that are encoded
> sometime in the past and stored in the DPB buffer list to be used
> as reference to encode future frames.
> This change adds controls to enable this feature.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 18 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                   | 14 ++++++++++++++
>  include/uapi/linux/v4l2-controls.h                     |  3 +++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 3b86959..40634f8 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -4450,3 +4450,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - Selecting this value specifies that HEVC slices are expected
>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
> +
> +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
> +       Specifies the number of Long Term Reference (LTR) frames encoder needs
> +       to generate or keep. This is applicable to H264 and HEVC encoder.
> +
> +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
> +       The current frame is marked as a Long Term Reference (LTR) frame
> +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
> +       This is applicable to H264 and HEVC encoder and can be applied using
> +       Request Api.
> +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
> +
> +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
> +       Specifies the Long Term Reference (LTR) frame(s) to be used for
> +       encoding the current frame.
> +       This provides a bitmask which consists of bits [0, LTR_COUNT-1].
> +       This is applicable to H264 and HEVC encoder and can be applied using
> +       Request Api.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index e5b726f..0b81b39 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -958,6 +958,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "frame LTR index";

"Frame LTR Index"

> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frame(s)";

Just: "Use LTR Frames". No '(s)'.

>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
> @@ -1273,6 +1276,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
> +		*type = V4L2_CTRL_TYPE_BITMASK;
> +		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>  	case V4L2_CID_PAN_RESET:
>  	case V4L2_CID_TILT_RESET:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index e37b85f..710bc53 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -421,6 +421,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
> +#define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_MPEG_BASE + 230)
> +#define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            (V4L2_CID_MPEG_BASE + 231)
> +#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES             (V4L2_CID_MPEG_BASE + 232)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
> 

Note that this and the other patches from you that add V4L2_CID_MPEG_VIDEO controls
will need to be rebased as soon as this PR is merged:

https://patchwork.linuxtv.org/project/linux-media/patch/d68da172-b251-000f-653d-38a8a4c7b715@xs4all.nl/

I recommend waiting until that's in.

I currently have the following patches from you adding new controls besides this one:

https://patchwork.linuxtv.org/project/linux-media/patch/1606121442-31074-1-git-send-email-dikshita@codeaurora.org/
https://patchwork.linuxtv.org/project/linux-media/patch/1605682497-29273-2-git-send-email-dikshita@codeaurora.org/
https://patchwork.linuxtv.org/project/linux-media/patch/1605682497-29273-3-git-send-email-dikshita@codeaurora.org/

What is missing is driver support for these new controls. I recommend that, once
the PR mentioned above is merged, you make a new series combining all three
patches + patches that add support for this to the venus driver.

Regards,

	Hans
