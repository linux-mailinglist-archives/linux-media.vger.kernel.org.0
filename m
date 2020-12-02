Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8B42CBB30
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 12:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgLBLCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 06:02:07 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46315 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726250AbgLBLCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 06:02:06 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kPsukDEjwN7XgkPsxksZ82; Wed, 02 Dec 2020 12:01:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606906883; bh=qt3ZG35zMOHZ30lMXbRyDBGMwzHfKhatMhIPX3hMudQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GcEE67yL8bcq8lv9T4Gmxhf6dIBqvZmwLtIbM1tDZ5ClP6E5hCnQ/eUpSMTzPQM1/
         fyDRaSObluGHOEtUJZf0S5s0CmitWg9BYSBK3LFMAqFr3hapGlF1nfBMzQ7+Q1Gqy0
         IoFDaOUXguLlimVTm2bakVfA8MbeeOVjRKomVM4DxFdBxid6dt6oZDiLwC4xhuYV10
         dR2djV09GbOK2ws8K6eN9bHFc/Yc+xSRiaZqvCse8elzrBQ+vFZumgpJwD1fo0RRWE
         n/Cf0xPTXPy5+CzR4DjLoaQ8OreWqwKj4pRj/7lYL+N+988/aNFUgCI8tMdMzSKRS4
         DAvij8VPufOCg==
Subject: Re: [PATCH v2 2/3] docs: media: Document CLL and Mastering display
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20201123230257.31690-1-stanimir.varbanov@linaro.org>
 <20201123230257.31690-3-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <de469e16-80a6-9a2f-30b1-ddf04b314e61@xs4all.nl>
Date:   Wed, 2 Dec 2020 12:01:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201123230257.31690-3-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHsf8jl5nk5NviNBzXEZ0TfpZ2rtQHdu6dfzrKh9Dr0FpC6CGQE9fOSrrLl0oqwf+dkDCOhnChbmOYdJbzexvG5GvV0sCDkLBCXhOt0As4qUYRPTsdGM
 dSWeGAjqPQ4VqPaYe6WfOPxO1boxCrNdUD+hF/pW5H5JDYSB9zruy57REbj/M3HsIpTyqmRrE7yUOmb6BX7H7WDYqY2TxrH9u1zW7lPPHGRj4oLSXv9vlfTk
 cq+sZHK8r8SzSp85klbqqo42sdurZ6iLXMysuALz4sKb/DROy8x1Y48P0bSsoV6B442Q8UiE7UMbFsWY0dbBO3cKhZwUPKF5RJXAPk8S31Y7XvXT65zusO94
 SnOpNd4n5Qwf0764354CEQ3/cbJ49kPhJksLrg/LFrvxxZ76ATtzaQ9xgEt/UixPzjVW0ktI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/11/2020 00:02, Stanimir Varbanov wrote:
> Document Content light level and Mastering display colour volume.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ce728c757eaf..1d26a5db07ef 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -4382,3 +4382,74 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - Selecting this value specifies that HEVC slices are expected
>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
> +
> +``V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO (struct)``
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
> +      - An upper bound on the maximum light level among all individual
> +        samples for the pictures of coded video sequence, cd/m2. When
> +        equal to 0 no such uppper bound is present.
> +    * - __u16
> +      - ``max_pic_average_light_level``
> +      - An upper bound on the maximum average light level among the
> +        samples for any individual picture of coded video sequence, cd/m2.
> +        When equal to 0 no such uppper bound is present.
> +
> +``V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY (struct)``
> +    The mastering display defines the colour volume (the colour primaries,
> +    white point and luminance range) of a display considered to be the
> +    mastering display for current video content.
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
> +        For describing mastering display that use Red, Green and  Blue colour
> +        primaries, index value c equal to 0 correspond to Green primary, c
> +        equal to 1 correspond to Blue primary and c equal to 2 correspond to

correspond -> corresponds (3 times)

> +        Red colour primary.
> +    * - __u16
> +      - ``display_primaries_y[3]``
> +      - Specifies the normalized y chromaticity coordinate of the colour
> +        primary component c of the mastering display in increments of 0.00002.
> +        For describing mastering display that use Red, Green and  Blue colour
> +        primaries, index value c equal to 0 correspond to Green primary, c
> +        equal to 1 correspond to Blue primary and c equal to 2 correspond to

Ditto.

> +        Red colour primary.
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
> 

I'd rename these last two fields to max/min_display_mastering_luminance to stay
in sync with the H.265 spec.

Regards,

	Hans
