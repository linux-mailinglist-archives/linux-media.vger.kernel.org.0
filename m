Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E462AD2DA
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 10:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731306AbgKJJu6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 04:50:58 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55871 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730559AbgKJJuc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 04:50:32 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id cQIDkkqmfNanzcQIHk5Fhn; Tue, 10 Nov 2020 10:50:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605001829; bh=o/Slietjg3JS+yzZDR327jrRld/7IiJNzS3HQkfzM9c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iX3PQ2/TJZdjnQ8kMvJ7Tsl0f67sEizpx8xn1fP0OyCFdOwAA5jjyeDfArInbBEd1
         QCsYS949zjWLr9F5HNeHBWnXsKUaUJleZUoZS4R6IMA6tYY9NHhtY8aZPG2hVcYj70
         Rr2WdpzRBTxJP1ckWmZiBX8jjdWOYdjOMD2w1ECz0jGqHqn0mLtno9qr23gi9waWx2
         RzbDDIWcNWMrSRd8PeS+Nqnk9gRAocXrHVKmzJDvbQ6lEils9glEP9+F4y222Tl+Kp
         oCPG62vNpWBSCT6ZLsoLqvrBMBNnYd+omrPK1+bkANo72qtC/ROenYQTCYUaBmtYFY
         P1ML44WrrT17w==
Subject: Re: [PATCH 2/3] docs: media: Document CLL and Mastering display
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
 <20201109173153.23720-3-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c907b185-a272-bef5-1aa0-313c7789b07d@xs4all.nl>
Date:   Tue, 10 Nov 2020 10:50:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109173153.23720-3-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfATtX920J02neZzjkurJjTu4twjJVU1mDc7wO+Lo5PvApGbQkudw8FTYKIvi1Uv4m1276ltKCNCd/DHIhTkXQrudiliiAQp33BjeCk8N1R3qn3Sptz5O
 0YjkKscoItmXuf4rueKiMtk/G02AzdYGGwQpwfTIuKzSCgxuNg1dp5JATtG/cvQQofbRyxo/P7YF6Ax/5BAfrFcGT9m8fI4YDHULD1Ycfd3zRpn74WhrbK4h
 ZTchkT28fyvkhqEkzwhjlZZ5+nOkoibI0r0avfunqUzI3fNj6SVt5aPgdHOUKkoB8SoXsJMWEEtIQfn4Ad9ak/PyyGYtO0AGR+xgj9j31KAEWEyljV80j0pI
 NtLN/lz/zDCw5UGPPoiS6SiPaUhOTqrc5y/haXVk0ReS4BHOD7TWASDRJHn6ruTS+UUuKGeL
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/11/2020 18:31, Stanimir Varbanov wrote:
> Document Content light level and Mastering display colour volume.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ce728c757eaf..39d0aab5ca3d 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -4382,3 +4382,64 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - Selecting this value specifies that HEVC slices are expected
>          to be prefixed by Annex B start codes. According to :ref:`hevc`
>          valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
> +
> +``V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO (struct)``
> +    The Content Light Level defines upper bounds for the nominal target
> +    brightness light level of the pictures.
> +
> +.. c:type:: v4l2_ctrl_hevc_cll_info
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_cll_info
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u16
> +      - ``max_content_light_level``
> +      - An upper bound on the maximum light level among all individual
> +        samples for the pictures of coded video sequence, cd/m2.
> +    * - __u16
> +      - ``max_pic_average_light_level``
> +      - An upper bound on the maximum average light level among the
> +        samples for any idividual picture of coded video sequence, cd/m2.

idividual -> individual

In the CTA-861-G spec value 0 is used to indicate that this information is
not present. How is that handled here? Can it be 0 as well in an HEVC stream?

Same for the next control.

> +
> +``V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY (struct)``
> +    The mastering display defines the colour volume (the colour primaries,
> +    white point and luminance range) of a display considered to be the
> +    mastering display for current video content.
> +
> +.. c:type:: v4l2_ctrl_hevc_mastering_display
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_mastering_display
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u16
> +      - ``display_primaries_x[3]``
> +      - Specifies the normalized x chromaticity coordinate of the colour
> +        primary component of the mastering display.

CTA-861-G defines this as: "coded as unsigned 16-bit values in units
of 0.00002, where 0x0000 represents zero and 0xC350 represents 1.0000."

Is that true here as well? If so, then this should be documented because
"normalized x chromaticity coordinate" doesn't say anything meaningful.

> +    * - __u16
> +      - ``display_primaries_y[3]``
> +      - Specifies the normalized y chromaticity coordinate of the colour
> +        primary component of the mastering display.
> +    * - __u16
> +      - ``white_point_x``
> +      - Specifies the normalized x chromaticity coordinate of the white
> +        point of the mastering display.
> +    * - __u16
> +      - ``white_point_y``
> +      - Specifies the normalized y chromaticity coordinate of the white
> +        point of the mastering display.
> +    * - __u32
> +      - ``max_luminance``
> +      - Specifies the nominal maximum display luminance of the mastering
> +        display.

In CTA-861-G this is in 1 cd/m^2 units.

> +    * - __u32
> +      - ``min_luminance``
> +      - specifies the nominal minimum display luminance of the mastering
> +        display.

And this in units of 0.0001 cd/m^2.

Regards,

	Hans
