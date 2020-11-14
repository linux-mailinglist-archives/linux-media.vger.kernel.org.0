Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1017E2B2D3D
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 13:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgKNM5V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 07:57:21 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58861 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726591AbgKNM5V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 07:57:21 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dv7CkXYra6t6Hdv7Gk3t1q; Sat, 14 Nov 2020 13:57:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605358638; bh=RsSQn2DamVaMOaw0wvH1ixJbCSWSXZMja/t/L3GxxDg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Fiff2m4YzCm2nxRNwrYKaFrFI4iiW/o6tvY1Dr+jCxnxXWh369T4ZN9nvFKnz5wRF
         mipAJxEcUtdtIdbEQPqimg0B8s04OH/YRDOMBaGMtwe5QGFtzJBpXzGHUi4JoRJ07H
         uLjBeXG4uohuNgw392wfNagyfMUKzUOCRYedl9vVmxDYXHjkI6MvFqXp56qgPI4WDM
         +fDKfQBhMJWK+3n69nVA9ogFnfcrW1UIGE5fU1ZG91ttI2xm80zy5hfjt+DlXY6PUT
         fYTadV7HbWqUpeTbk9GgQdpk0nRf36kNgbp71wThL9D2fmXeXccRBFL1kRjeHDyHC4
         bdc0BdVLdxBOw==
Subject: Re: [PATCH v2 9/9] media: docs: Move the H264 stateless codec uAPI
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201113215121.505173-1-ezequiel@collabora.com>
 <20201113215121.505173-10-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <df05d7ea-45be-76d6-78a0-47b1a6846ad4@xs4all.nl>
Date:   Sat, 14 Nov 2020 13:57:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201113215121.505173-10-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCWjAIUz60bBsmUKHmsxzZulSPf39ECNiJm/w7O2sw1elwKxhXZXf3Dj5q0+jyF6A6gOQoKIhlhoYJenVmyE6WBUkolGTvCmhR4lOv8pExxUqmGy5nrv
 TyDyiJ8Rm41/0RR+GLtoRV3IiES+U6oZalnZEnC4U1rl0mgQeuYq8coQNuVXKepXabfEs71v8kDTuEIEChOOF3u9VfULCuLwebUIePik4fjsnYUsEUTAwI/m
 Mr8yOsLFvV03xmYdf1uTAxfyDQe9C9ZgNBgv7G0JNJXt7UD5bQLu6QSM6/qpnThlgZqN1ljLfoAUhj7xQYj8CGEHyvTMrxjh2fL6Nx5WwHCeHhMv7Pu/ANNf
 wp0QDKXMtRB/FcKhRVvbvfAjzQSft/eBCHXbGvnrBdnBwC83EBSXa9AhdlORnzMLJkyWyHPAL7AMMVbto4LC6ApcYIPhNCa5DViKoouuoFek60EQnliWQqFC
 zW3gxSF+qoIueJbJgCpClr/hGZsBALsDZb9I/3MVYcprDYxEdUgs2rujWWs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/11/2020 22:51, Ezequiel Garcia wrote:
> Now that we've destaged the H264 stateless codec controls,
> and with all the pieces in place, update the documentation
> and move it to its own section.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++++
>  .../media/v4l/ext-ctrls-codec.rst             | 692 ------------------
>  .../media/v4l/pixfmt-compressed.rst           |  14 +-
>  4 files changed, 682 insertions(+), 699 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> 

<snip>

> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index d585909bc4e2..32b91ce0f0d9 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -59,14 +59,14 @@ Compressed Formats
>  	This format is adapted for stateless video decoders that implement an
>  	H264 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
>  	This pixelformat has two modifiers that must be set at least once
> -	through the ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE``
> -        and ``V4L2_CID_MPEG_VIDEO_H264_START_CODE`` controls.
> +	through the ``V4L2_CID_STATELESS_H264_DECODE_MODE``
> +        and ``V4L2_CID_STATELESS_H264_START_CODE`` controls.
>  	In addition, metadata associated with the frame to decode are
> -	required to be passed through the ``V4L2_CID_MPEG_VIDEO_H264_SPS``,
> -	``V4L2_CID_MPEG_VIDEO_H264_PPS``,
> -	``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX``,
> -	``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS`` and
> -	``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS`` controls.  See the
> +	required to be passed through the ``V4L2_CID_STATELESS_H264_SPS``,
> +	``V4L2_CID_STATELESS_H264_PPS``,
> +	``V4L2_CID_STATELESS_H264_SCALING_MATRIX``,
> +	``V4L2_CID_STATELESS_H264_SLICE_PARAMS`` and
> +	``V4L2_CID_STATELESS_H264_DECODE_PARAMS`` controls.  See the
>  	:ref:`associated Codec Control IDs <v4l2-mpeg-h264>`.  Exactly
>  	one output and one capture buffer must be provided for use
>  	with this pixel format. The output buffer must contain the
> 

There is a note about this 'format not yet part of the public API' that
needs to be deleted as well.

Regards,

	Hans
