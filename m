Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A982F2CF7
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 11:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390793AbhALKfX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 05:35:23 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:41051 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727244AbhALKfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 05:35:23 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zH0WkDlJTVfyLzH0ZkpA7c; Tue, 12 Jan 2021 11:34:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610447680; bh=flI2m2OYvvYwq34nZBN1oPO/rcFlJyp9HTRjxCqn/rI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=O6Bq3KJtu2PLIseydAYVf4v7fIkJhlIinr11yYW6fbRQvBm2bqT1BumT6YzbmCb0D
         SPqaf3LzqC0zef8E08rUE4pZ7aHL083RVkb600OhBWuS9hY6UXugslbELAORK2TUvg
         d83CT6RFpYdSMstFuiY6foKeeWWXwxUBUuSjFa3Lxi+VQQBzz1ihGNSoY9jSFUVm1Z
         dB5CAkvdRyyPlTsOimR1elFB1EX/FWlC3J6R90lpwu/fv+WnylSmXgyDTxa2f8ZlQP
         HFlUbf+dLTq+wr46tvZA5DTknqxAdXWFU9rWOvaIWhhFDOSrkBgIK/38in679ex5LU
         JxSMOxrzC8Ziw==
Subject: Re: [PATCH v3 2/3] docs: media: Document CLL and Mastering display
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20201208145931.6187-1-stanimir.varbanov@linaro.org>
 <20201208145931.6187-3-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d0f1df68-5a5a-7fa1-1ed1-406e98e1be89@xs4all.nl>
Date:   Tue, 12 Jan 2021 11:34:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201208145931.6187-3-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLn5yFlcPCKIbJCAywzXVjY8kBd0JyQRjCVw/DIsw6OxTvgV5bQ3bEthxeUUv4D66bRa2qmqnh0l8UpHaji7Rc+41Lnem7kqxVbAxbMBIGIsnrMP3zEH
 GdiNvwbxexOi82xwPn6wpGoZ+R8fZLc/+p0GcUfRj9favlofwz0yV5asisR1LJWwWqmxwwVMf50BTMm1bWYqiC26lwTkrRTSUlz1iZwYD22KlEyfut/gDvs7
 WT7oYFBZ5ThbAmdRFPQSHZ7M4dSbzL6xgfQBQLadYKpXoHmaRo1XARQXa+ZNTm3MHaX3FM/V0EG+pizss9dTv1/1NCYYlCCQlpTR3GUHz8bHP3MNTyYvW5bU
 R1yFeo2ZHBhVtmKp7SZZyQkUSqIKtYi+S6+WXBcccKxMXpu38CxemPIC9bIKPOJX5vnsG8sy
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/12/2020 15:59, Stanimir Varbanov wrote:
> Document Content light level and Mastering display colour volume.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../userspace-api/media/v4l/common.rst        |  1 +
>  .../media/v4l/ext-ctrls-colorimetry.rst       | 88 +++++++++++++++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
> index 8c263c5a85d8..ea0435182e44 100644
> --- a/Documentation/userspace-api/media/v4l/common.rst
> +++ b/Documentation/userspace-api/media/v4l/common.rst
> @@ -51,6 +51,7 @@ applicable to all devices.
>      ext-ctrls-fm-tx
>      ext-ctrls-fm-rx
>      ext-ctrls-detect
> +    ext-ctrls-colorimetry
>      fourcc
>      format
>      planar-apis
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> new file mode 100644
> index 000000000000..16d9ddadbab6
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> @@ -0,0 +1,88 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _colorimetry-controls:
> +
> +*****************************
> +Colorimetry Control Reference
> +*****************************
> +
> +Below are controls within the Colorimetry control class.
> +
> +Colorimetry Control IDs
> +-----------------------
> +
> +.. _colorimetry-control-id:
> +
> +``V4L2_CID_COLORIMETRY_CLASS (class)``
> +    The Colorimetry class descriptor.
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
> +      - An upper bound on the maximum light level among all individual

An -> The
on -> for

> +        samples for the pictures of coded video sequence, cd/m2. When

of -> of a

> +        equal to 0 no such uppper bound is present.

uppper -> upper

> +    * - __u16
> +      - ``max_pic_average_light_level``
> +      - An upper bound on the maximum average light level among the

An -> The
on -> for

> +        samples for any individual picture of coded video sequence, cd/m2.

of -> of a

> +        When equal to 0 no such uppper bound is present.

uppper -> upper

> +
> +``V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY (struct)``
> +    The mastering display defines the colour volume (the colour primaries,
> +    white point and luminance range) of a display considered to be the
> +    mastering display for current video content.

for -> for the

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

describing -> describing the
use -> uses

> +        primaries, index value c equal to 0 correspond to Green primary, c

to Green -> to the Green
correspond -> corresponds

> +        equal to 1 correspond to Blue primary and c equal to 2 correspond to

ditto

> +        Red colour primary.
> +    * - __u16
> +      - ``display_primaries_y[3]``
> +      - Specifies the normalized y chromaticity coordinate of the colour
> +        primary component c of the mastering display in increments of 0.00002.
> +        For describing mastering display that use Red, Green and  Blue colour
> +        primaries, index value c equal to 0 correspond to Green primary, c
> +        equal to 1 correspond to Blue primary and c equal to 2 correspond to
> +        Red colour primary.

ditto

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

Regards,

	Hans
