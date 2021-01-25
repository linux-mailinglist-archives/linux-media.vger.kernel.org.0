Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32433048AA
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388425AbhAZFo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:44:27 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40963 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727557AbhAYKZm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 05:25:42 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3z2slT9JIiWRg3z2vlfsGd; Mon, 25 Jan 2021 11:24:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611570274; bh=kmHFrl41CYcqrNiUZ72T0IMxn1HeaqRQUa+uQpTKAh4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oXmmdET7/MG/IZ6DB+YbjqvMyhUlv+UHIP/hooPMt+bj5p4JvdWpj7cKP9ZenlLRd
         uiexvauakHRez0Bck0x0rbTX0KBmRRvX6Ho9uQWFT+sHUVs/HihYCyNeLjm8nafR6s
         jppMSjbGCkxBY/y0C4QkkDKMspDT2pwCvL3oBv4F9xOk8k5TJKtBV8GTTGvSVwfPDB
         9ROhVFjx7qTPgR3i2n7tLGMa3kA+M1KVMXDT0KxXSAiB3dYeAr5Ktr+GcNUFLphWpG
         sP7G3JmSIyVNfbnaISVDX1XVdEPIbOfNirESEyeA886EoGEOZdsCzKhq6yIAH/u/+j
         CygTI7tJRSGOQ==
Subject: Re: [PATCH v4 4/5] docs: Document CLL and Mastering display
 colorimetry controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
 <20210120092606.3987207-5-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e93c5dec-94a9-89f6-dae2-b1d14092d674@xs4all.nl>
Date:   Mon, 25 Jan 2021 11:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120092606.3987207-5-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfA2/LOkNI9VQJ8+gVuoFSlqX10OKjpezettPw9cfd1F+z945XPysL/FtmxGPSQh6w2Nxgn4pZxYFMO3HxMQyC5bmacnsaKD0DGwgog/IMieaPYtfB+eT
 KsGJTtWapnowAtcuxLk8FwO46TguaqfFzdAp29e27RYPtEEkyOE2raaxnVgBKADvJefm9ILJhT/fQ4SWaXPXIO5+jsVAFVyvIG1zL11MvxXXekykbKDT+18y
 g++RnhJcjbbjmJxb+gq2tn3k8nlZrTrQp3nDa/Rg0aAlaFV4sB+FXIR9LWGDXbrANdL5l29xoCKtBbortuK7tcSxXbE84hkGTKrWP5TxJXcNbaedp69UuWWK
 XiENvPOTMyqkkoIW+xZo6nKnEvjhfXjCJDSEo+CbL7RVOMxef6rTLiaLi7LP+BxlM6oIXszJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/01/2021 10:26, Stanimir Varbanov wrote:
> Document Content Light Level and Mastering Display v4l2 colorimetry
> controls.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/v4l/ext-ctrls-colorimetry.rst       | 71 +++++++++++++++++++
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  2 files changed, 73 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> index 6b0cd2054e84..e7e55323651f 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> @@ -17,3 +17,74 @@ Colorimetry Control IDs
>      The Colorimetry class descriptor. Calling
>      :ref:`VIDIOC_QUERYCTRL` for this control will
>      return a description of this control class.
> +
> +``V4L2_CID_COLORIMETRY_HDR10_CLL_INFO (struct)``
> +    The Content Light Level defines upper bounds for the nominal target
> +    brightness light level of the pictures.
> +
> +.. c:type:: v4l2_ctrl_hdr10_cll_info
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hdr10_cll_info
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u16
> +      - ``max_content_light_level``
> +      - The upper bound for the maximum light level among all individual
> +        samples for the pictures of a coded video sequence, cd/m2. When

For this document:

cd/m2 -> cd/m\ :sup:`2`

> +        equal to 0 no such upper bound is present.
> +    * - __u16
> +      - ``max_pic_average_light_level``
> +      - The upper bound for the maximum average light level among the
> +        samples for any individual picture of a coded video sequence, cd/m2.
> +        When equal to 0 no such upper bound is present.
> +
> +``V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY (struct)``
> +    The mastering display defines the colour volume (the colour primaries,

For this document: colour -> color

(The US spelling is used)

> +    white point and luminance range) of a display considered to be the
> +    mastering display for the current video content.
> +
> +.. c:type:: v4l2_ctrl_hdr10_mastering_display
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hdr10_mastering_display
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u16
> +      - ``display_primaries_x[3]``
> +      - Specifies the normalized x chromaticity coordinate of the colour
> +        primary component c of the mastering display in increments of 0.00002.
> +        For describing the mastering display that uses Red, Green and Blue
> +        colour primaries, index value c equal to 0 corresponds to the Green
> +        primary, c equal to 1 corresponds to Blue primary and c equal to 2
> +        corresponds to the Red colour primary.
> +    * - __u16
> +      - ``display_primaries_y[3]``
> +      - Specifies the normalized y chromaticity coordinate of the colour
> +        primary component c of the mastering display in increments of 0.00002.
> +        For describing the mastering display that uses Red, Green and Blue
> +        colour primaries, index value c equal to 0 corresponds to the Green
> +        primary, c equal to 1 corresponds to Blue primary and c equal to 2
> +        corresponds to Red colour primary.
> +    * - __u16
> +      - ``white_point_x``
> +      - Specifies the normalized x chromaticity coordinate of the white
> +        point of the mastering display in increments of 0.00002.
> +    * - __u16
> +      - ``white_point_y``
> +      - Specifies the normalized y chromaticity coordinate of the white
> +        point of the mastering display in increments of 0.00002.
> +    * - __u32
> +      - ``max_luminance``
> +      - Specifies the nominal maximum display luminance of the mastering
> +        display in units of 0.0001 cd/m2.
> +    * - __u32
> +      - ``min_luminance``
> +      - specifies the nominal minimum display luminance of the mastering
> +        display in units of 0.0001 cd/m2.
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 0ed170c6e720..af4b8b87c5d7 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -147,6 +147,8 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_hdr10_cll_info`
> +replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_hdr10_mastering_display`

No, these two should be :c:type:`v4l2_ctrl_type` like the others.

>  
>  # V4L2 capability defines
>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> 

You also need to document the new p_hdr10_cll and p_hdr10_mastering
fields in Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst.

Regards,

	Hans
