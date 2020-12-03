Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7852CD3FD
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 11:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388692AbgLCKv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 05:51:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:45480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387870AbgLCKv2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 05:51:28 -0500
Date:   Thu, 3 Dec 2020 11:50:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606992647;
        bh=OZctrYku5K/KfIYp1pFo+GxElIOfjHw3Xv4FHAUJppI=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=hi9DHFcC3MjwLmnUI/eH5Pnqdv6optE9D92ImUcF98L4u0OoAe99sDqW4UgLKCAZA
         XCtZn8HHur0oUr2Tc+RRRfH1T+RsE2nH0F+8btPAMXSfmIARz35HcFHl9RG9FvPEcs
         lFXGcDswU4D6IkPC5W0uArcADKVz3fG0YM5Pz3Jv2HnX2g1lCZ4aXTqQWt0Ty8ajsD
         n9ei0z3bRDHCoACiFXVrWSkwPCm2bR23gX6r5fx8oZvmzUe5rYziilMuuQpdVa1wDh
         eJgdrOk8J//p7oj9OF64LGlIGpBSZcaI4gPsfnO9dWE/z9Pt/Cba2rpqRjluXuO28h
         qCBl7hbYBH1wA==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 6/6] userspace-api/media: finalize stateless FWHT codec
 docs
Message-ID: <20201203115043.53990672@coco.lan>
In-Reply-To: <20201126132717.1216907-7-hverkuil-cisco@xs4all.nl>
References: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
        <20201126132717.1216907-7-hverkuil-cisco@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 26 Nov 2020 14:27:17 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> Document V4L2_CTRL_TYPE_FWHT_PARAMS and p_fwht_params. Also
> improve the V4L2_PIX_FMT_FWHT_STATELESS description.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 4 +++-
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst          | 4 ++++
>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst  | 6 ++++++
>  .../userspace-api/media/videodev2.h.rst.exceptions          | 1 +
>  4 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 4ae737520925..acad5f3ca0c1 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -217,4 +217,6 @@ Compressed Formats
>        - ``V4L2_PIX_FMT_FWHT_STATELESS``
>        - 'SFWH'
>        - Same format as V4L2_PIX_FMT_FWHT but requires stateless codec implementation.
> -	See the :ref:`associated Codec Control IDs <v4l2-mpeg-fwht>`.
> +        Metadata associated with the frame to decode is required to be passed
> +        through the ``V4L2_CID_STATELESS_FWHT_PARAMS`` control.
> +	See the :ref:`associated Codec Control ID <codec-stateless-fwht>`.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 5b1fc62ade0d..116d128fa9cf 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -208,6 +208,10 @@ still cause this situation.
>        - ``p_h264_decode_params``
>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_decode_params`. Valid if this control is
>          of type ``V4L2_CTRL_TYPE_H264_DECODE_PARAMS``.
> +    * - struct :c:type:`v4l2_ctrl_fwht_params` *
> +      - ``p_fwht_params``
> +      - A pointer to a struct :c:type:`v4l2_ctrl_fwht_params`. Valid if this control is
> +        of type ``V4L2_CTRL_TYPE_FWHT_PARAMS``.

Please see my notes for patch 5/6. The same applies here.

Regards,
Mauro

>      * - void *
>        - ``ptr``
>        - A pointer to a compound type which can be an N-dimensional array
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 9b8716f90f12..82f61f1e2fb8 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -462,6 +462,12 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_h264_decode_params`, containing H264
>  	decode parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_FWHT_PARAMS``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_fwht_params`, containing FWHT
> +	parameters for stateless video decoders.
>      * - ``V4L2_CTRL_TYPE_HEVC_SPS``
>        - n/a
>        - n/a
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 7f6a4cc2ac4e..0ed170c6e720 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -146,6 +146,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
>  
>  # V4L2 capability defines
>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities



Thanks,
Mauro
