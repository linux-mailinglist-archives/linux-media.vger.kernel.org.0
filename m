Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19E833D31B
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhCPLeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:34:23 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55807 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237189AbhCPLeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:34:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M7xfl1ZAO4ywlM7xjlAlXV; Tue, 16 Mar 2021 12:34:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615894451; bh=JkEdXlW1bhCgFYkEP/igDT2s8R0tOEhcNGr/T9WCMLk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=f0KbRRBk2E6aDJo/dBE3MWpAuoNF9QE2ADbfj4+X8AbSEct/y2SvXmruGMy0U3rOo
         fJOxXhY+aqXGT1ySV4jFvfRWV92shoeah88O0Wsi3DYmMUuo6ShGo0jB9O+lngoanJ
         tN+SZ/+16ajJlj9VaCBegkXYOe+QdL20LkSsIL9pXraodchRXa019SQZRbaW3yGf4K
         IzvxoxRCsRmgnzMDPmdF4xm+NH+Qmzl7BGYnYRTzGRdL65uGSlbwwSFPZ3wRqSPiL8
         pXdkRueeP/TTIzyxxbxIQN+3k499hpYXFNDtiocnfO7GIiVCKg3Bsg/uROpck/hj2N
         7S1jFCzGYaEyw==
Subject: Re: [PATCH v2 1/2] v4l2-ctrl: Add decoder conceal color control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210302114430.3594475-1-stanimir.varbanov@linaro.org>
 <20210302114430.3594475-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a36a9400-462d-c50e-4b7f-e2e8a181c4e3@xs4all.nl>
Date:   Tue, 16 Mar 2021 12:34:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302114430.3594475-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfImq5vL9PsgjEwQz3Dpb/PGz34BpmFR9uEAxCCND4Pv+CZswM6wL8TDzxMhyNP3+gDNrFxp/6OICOH5wqKdVBBN1R55nqsTAax30xg45tm3HvYF5d8fZ
 VKLSi2UERkoBeEQUTnWldjyLyqkmfdBmm+l9jrapIfQm/0BpwOU9TLKtQsqCyuLA3QJMmtI/kiaY4U1AWaxYI1Q0em0AT5+HhBIQrMpIqUZYqm2xO5TCOCvx
 FvwStzXDS8NAjnqA6wvXWb/E9qBLtocSdiJuUFhElS9daCQpxD/XVoItwaMucpS7X/IDWQm9tR/dpKlRJx9l8utcXgbcXkaH/LcFAta7o+g=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2021 12:44, Stanimir Varbanov wrote:
> Add decoder v4l2 control to set conceal color.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 33 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  3 files changed, 43 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 00944e97d638..817da8a14572 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -674,6 +674,39 @@ enum v4l2_mpeg_video_frame_skip_mode -
>      is currently displayed (decoded). This value is reset to 0 whenever
>      the decoder is started.
>  
> +``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
> +    This control sets conceal color in YUV color space. It describes the

conceal -> the conceal

> +    client preference of error conceal color in case of error where

client preference of the error conceal color in case of an error where the

> +    reference frame is missing. The decoder should fill the reference
> +    buffer with preferred color and use it for future decoding. The control

with the

> +    is using 16bits per channel.

16bits -> 16 bits

> +    Applicable to decoders.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * -
> +      - 8bit  format
> +      - 10bit format
> +      - 12bit format
> +    * - Y luminance
> +      - Bit 0:7
> +      - Bit 0:9
> +      - Bit 0:11
> +    * - Cb chrominance
> +      - Bit 16:23
> +      - Bit 16:25
> +      - Bit 16:27
> +    * - Cr chrominance
> +      - Bit 32:39
> +      - Bit 32:41
> +      - Bit 32:43
> +    * - Must be zero
> +      - Bit 48:63
> +      - Bit 48:63
> +      - Bit 48:63
> +
>  ``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
>      If enabled the decoder expects to receive a single slice per buffer,
>      otherwise the decoder expects a single frame in per buffer.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 016cf6204cbb..a3b9d28a00b7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -945,6 +945,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
>  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
>  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
>  	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
>  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
>  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
> @@ -1430,6 +1431,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*max = 0x7fffffffffffffffLL;
>  		*step = 1;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
> +		*type = V4L2_CTRL_TYPE_INTEGER64;
> +		*min = 0;
> +		/* default for 8bit black, luma is 16, chroma is 128 */

8bit -> 8 bit

> +		*def = 0x8000800010LL;
> +		*max = 0xffffffffffffLL;
> +		*step = 1;
> +		break;
>  	case V4L2_CID_PIXEL_RATE:
>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..5e5a3068be2d 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
>  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
>  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
>  #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
> +#define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+231)
>  
>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> 

After fixing the typos:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
