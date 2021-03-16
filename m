Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE1E33D3C4
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 13:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhCPMXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 08:23:14 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50859 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231189AbhCPMXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 08:23:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M8itl1o3n4ywlM8iylAt55; Tue, 16 Mar 2021 13:23:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615897380; bh=n53c6yVfIwwrrN7fAagCE8Fcpy6iTVZ0bDnUteVvvkg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tWymQcaIN44aHz312ZOo4B2cAhvdZ3YdjC1JvUdXOyoIEUe3ACxSQJN8BFXeJxrLl
         1Zue0865Cic0KtK+hHkM14hKiSFczCCgfoQNbm+eXLoD2mbuU978KQJU8vJtKNYBOl
         XAnK8O3igPqrBmt+vcWFYzYYPpeyDrT/nTJFoQ7Ma9prk0yCrupCg6TgotwZvAwDnG
         lRaq7T2YXyqlLVNSzKrrc0RW3ydwBC7pcmS445f/8m8s0yzmxnZ+R//kjeuRA+Nc4u
         xPbsOxtYZUh6fMe8+fb3UgfenrnthYrV/k7nzwkrR1NPm2+YRnvGw2TdnFgVCToDdJ
         i+50sefxqWe7A==
Subject: Re: [PATCH v5 4/5] docs: Document CLL and Mastering display
 colorimetry controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210209162425.3970393-1-stanimir.varbanov@linaro.org>
 <20210209162425.3970393-5-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ebb4d08f-9af6-f483-f901-4846911cd71b@xs4all.nl>
Date:   Tue, 16 Mar 2021 13:22:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209162425.3970393-5-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIm4uX2D11uRSgeYbh1Fd1oO8eCM2Sb27lS3Il7Jax/bbnSKpQf3D0crKs6D5KMY3w1a3bR2WHDOxsUQrzLvBU3JKzAeUA5aMj43cjqfUx83mPXen8me
 D9XNMbK6Vp0xDDAq4Nst+xKla+0POYFk0YpjswbTPLChZR9tDg/hQipgH9yOVTNrBegS/m7T9QpBQ/Nef8FbSeq9kiM+6pvY5h4vHyctz5b2ZkTHdZcWqjQL
 fbxIq3iAR0jeYS2qV9h6OpSXlBeo0jAo5a9NdjddHKngvD4dBuqNoXs7EZFXns9cVtVeJEvc3n8dft2zZ8sntaeXqXlu3ssfzE7fR6M6cQyIXMM91+QRyVEN
 lPUAB24m/VD4HGJSAZRVJFg5ZeYYG1ExYHz04C0apr4EL+p7YhxSQ0YW6Qj1RVETWhOQUGsp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/02/2021 17:24, Stanimir Varbanov wrote:
> Document Content Light Level and Mastering Display v4l2 colorimetry
> controls.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/v4l/ext-ctrls-colorimetry.rst       | 71 +++++++++++++++++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  8 +++
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  3 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> index 862f78b41b32..a9f206a46175 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
> @@ -20,3 +20,74 @@ Colorimetry Control IDs
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
> +        samples for the pictures of a coded video sequence, cd/m\ :sup:`2`.

I think 'coded' should be removed. This is equally valid when receiving
uncoded HDMI video, after all.

> +        When equal to 0 no such upper bound is present.
> +    * - __u16
> +      - ``max_pic_average_light_level``
> +      - The upper bound for the maximum average light level among the
> +        samples for any individual picture of a coded video sequence,

ditto.

> +        cd/m\ :sup:`2`. When equal to 0 no such upper bound is present.
> +
> +``V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY (struct)``
> +    The mastering display defines the color volume (the color primaries,
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
> +      - Specifies the normalized x chromaticity coordinate of the color
> +        primary component c of the mastering display in increments of 0.00002.
> +        For describing the mastering display that uses Red, Green and Blue
> +        color primaries, index value c equal to 0 corresponds to the Green
> +        primary, c equal to 1 corresponds to Blue primary and c equal to 2
> +        corresponds to the Red color primary.
> +    * - __u16
> +      - ``display_primaries_y[3]``
> +      - Specifies the normalized y chromaticity coordinate of the color
> +        primary component c of the mastering display in increments of 0.00002.
> +        For describing the mastering display that uses Red, Green and Blue
> +        color primaries, index value c equal to 0 corresponds to the Green
> +        primary, c equal to 1 corresponds to Blue primary and c equal to 2
> +        corresponds to Red color primary.
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
> +        display in units of 0.0001 cd/m\ :sup:`2`.
> +    * - __u32
> +      - ``min_luminance``
> +      - specifies the nominal minimum display luminance of the mastering
> +        display in units of 0.0001 cd/m\ :sup:`2`.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 8a95ebdd499a..2f6d0539fb93 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -212,6 +212,14 @@ still cause this situation.
>        - ``p_fwht_params``
>        - A pointer to a struct :c:type:`v4l2_ctrl_fwht_params`. Valid if this control is
>          of type ``V4L2_CTRL_TYPE_FWHT_PARAMS``.
> +    * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
> +      - ``p_hdr10_cll``
> +      - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid if this control is
> +        of type ``V4L2_CTRL_TYPE_HDR10_CLL_INFO``.
> +    * - struct :c:type:`v4l2_ctrl_hdr10_mastering_display` *
> +      - ``p_hdr10_mastering``
> +      - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_mastering_display`. Valid if this control is
> +        of type ``V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY``.
>      * - void *
>        - ``ptr``
>        - A pointer to a compound type which can be an N-dimensional array
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 0ed170c6e720..38b31a9b9580 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -147,6 +147,8 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_type`
>  
>  # V4L2 capability defines
>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> 

After making the change suggested above, you can add my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
