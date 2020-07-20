Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440FF225AF9
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 11:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgGTJOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 05:14:25 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41971 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728017AbgGTJOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 05:14:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xRsLjXWaqNPeYxRsMjmgmy; Mon, 20 Jul 2020 11:14:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595236462; bh=WIIL3wd1SaruQ4eJeLdchyT8TKOMRbcfsrO2FzK4uqI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=W5RHTpCsN0cNDdNnxWy5UrRFDzidCTwVkawtTde6o5qKeYa+Q32kq4V08P3C5VN/0
         +AObhL8WdGOABuUYxVQcw+WaKOpWQs5nXELJjkQctecGM8UGO/YZq1U20D0aioCi52
         m100stnpxhQ8/ZtFlEslpDLpErutdOOsuzwwksWcaxYRDMKajOXbpF2HUCBCx8jwQG
         ImpCz0KM32I+MfwkRaV77t6TwIuPAJmP2fDqsWO7bQcmHK+0M9P+Wk9/kb3r6e4x3a
         /3zW5TL9/PmdoWbQD9AZAOrA8sFukeKQgry3UwMkHmeoy2scoBJAQOxY+7npt0RfzX
         nxrGPfaJUiMoA==
Subject: Re: [PATCH v2 3/4] v4l2-ctrl: Add control for intra only decode
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
 <20200616201446.15996-4-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7a1f0819-1e56-a76f-f6b5-87c0385fd52a@xs4all.nl>
Date:   Mon, 20 Jul 2020 11:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200616201446.15996-4-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI3AfBbugxoCuvmvzoYOu3paFGukukdoILOIob8TS2Qn1T7yCJqpl5BD3Y5Ho+0FPpf0bI2F1r/zZbKCh9sP7v0Pc1nhfHAvQ5GrgtQaFwGYcYmdUZgX
 yoeBd1mKCcz4f1qxMEEQ/nPFL20tRdnG7Qy8QPzQLLsQoSi0WsKr8DCGI6nQV6f+tj4lyAlyDerfLYtsLYwDYAXNOW/w4nxDiL7ggNLiZS2Tis6WLtbNvzb8
 ym4WlOR+ugqkc6hrtrUTgd0DWzbih2dkyJo7WupX8PaS1y4Chdj3YhvPyPMGTALKyH6JgHZlWkRfYhSnulXS1RQU5NRggh7UlZmKtTcI1stgGFT87xMcd0rX
 A5HhIUxSVaHt9LYKys29JfmQFCl0cZhKai8elsnDgEfa2NM+DtpbcqBUcLGX/CGK/BAA90rU8g2wuPrDgNB9LmocCHX3OnggIMrr1xHmruusBX4Z84xbfiJm
 ojAfw+K1NjKwiuHkdPcbuJa5pzzzNSvr6tbu5A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2020 22:14, Stanimir Varbanov wrote:
> This adds a new decoder control to instruct the decoders to
> produce on its output intra frames only. Usually in this mode
> decoders might lower the count of output decoder buffers and
> hence reduce memory usage.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst          | 9 +++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c                     | 2 ++
>  include/uapi/linux/v4l2-controls.h                       | 1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index b9d3f7ae6486..d7f34596f95b 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -652,6 +652,15 @@ enum v4l2_mpeg_video_bitrate_mode -
>      otherwise the decoder expects a single frame in per buffer.
>      Applicable to the decoder, all codecs.
>  
> +``V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY (boolean)``
> +    If enabled the decoder should start decoding only intra frames. The

should -> will

('should' indicates something optional, that does not apply here)

> +    decoder consume first input buffer for progressive stream (or first
> +    two buffers for interlace). Decoder might not allocate more output
> +    buffers than it is required to consume one input frame.

These last two sentences ("The decoder ... one input frame.") make no sense.
The 'Decoder' does not allocate buffers, it's userspace that decides that.
And the number of input buffers it consumes is also irrelevant (i.e., it's
enough to be able to generate an intra frame).

I'd just drop them and so the new text becomes:

"If enabled the decoder should start decoding only intra frames. Usually the
decoder input buffers will contain only intra frames but it is not mandatory.
This control could be used for thumbnails generation. Applicable to the decoder,
all codecs."

 Usually the
> +    decoder input buffers will contain only intra frames but it is not
> +    mandatory. This control could be used for thumbnails generation.
> +    Applicable to the decoder, all codecs.
> +
>  ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
>      Enable writing sample aspect ratio in the Video Usability
>      Information. Applicable to the H264 encoder.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index bc00d02e411f..2b1fb8dcd360 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -846,6 +846,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
>  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
> +	case V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY:	return "Decode intra frames only";

Use capitals: "Decode Intra Frames Only"

>  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
>  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
> @@ -1197,6 +1198,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
>  	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
> +	case V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY:
>  	case V4L2_CID_WIDE_DYNAMIC_RANGE:
>  	case V4L2_CID_IMAGE_STABILIZATION:
>  	case V4L2_CID_RDS_RECEPTION:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 0f7e4388dcce..c64471e64aa7 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -744,6 +744,7 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
>  #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
>  #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
>  #define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
> +#define V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY	(V4L2_CID_MPEG_BASE + 646)
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
> 

Regards,

	Hans
