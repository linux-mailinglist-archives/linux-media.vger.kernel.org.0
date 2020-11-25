Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2450A2C3DF3
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 11:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbgKYKiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 05:38:00 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49257 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728444AbgKYKh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 05:37:59 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id hsBNkIplAN7XghsBRkVmy6; Wed, 25 Nov 2020 11:37:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606300677; bh=FjvmaPG3JrLfHAjmM74MB5cGyWQ6qFtt8VMNnEdUX4U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=G2A2Jo/U9waxPKZY7p228yYDqlXXIS8errOsyZYRCU5qMOTeFfH/u82nQzYE2mhVV
         1M6+xFJdRiagmWLYgQ7Th2Ly9ZScrKq2eAqDzWfUT0Ml0Gjw9amZOxeF3ophh8Prap
         ZTkQ9g7WHr+Ab1MN15fUxigaqW1NUNzLEuDF4MkzE1ChS0RJPHZIfdENCrGHWfrd5r
         8GdJffq716RcxaDWK/di0G0c6dYaXgR6B241000OqVy8YlgYSVd0oKQ2XJbi2FiZx5
         p1TmXwnlD0dieExln3a7/ort8AdCx1ym2ELjvqew3LBYa3Q+qmsLoJ103VXJBLP50k
         kuQmHaGAa9NnA==
Subject: Re: [PATCH v4 13/13] media: docs: Move the H264 stateless codec uAPI
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20201123144000.81310-1-ezequiel@collabora.com>
 <20201123144000.81310-14-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8cea43ca-eab2-8b57-477c-20fa4d270657@xs4all.nl>
Date:   Wed, 25 Nov 2020 11:37:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201123144000.81310-14-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLQAaQyACzwTFhjY0fw0C29sgmllMhOejA+FZRNNh8vgfTC1Nj9z2wvCyWAu8gkUl3ZwWDNoP612INmdaLDMeLjNBpBrVJL2Swzru5hC9QLCTyb2oro7
 XUNlOuRwb0y3t8zYMoI+5boSKHK8RM+JzM4gzXr46QeKXvdHLNiaEmNc8KdEXIipn+znggkQcZmaigwnQskN5tam1/xrjDJbY9BeehC36Nux6JalENyjl21N
 WZmyQpogHkN+OirYKtA0RxeFOsXGPwMe14FB561kHJP6YXgPm+eHreVhPEavhC9WMPkKkBxeXNg5MIWlIErq38OlIIoP22qfRfkQLnEQCSjCQFFxNA4lt8y0
 MYXm4jIJ41p4qv0sdBEFWm5Tm8FnflU7VGXGkc9sDks8lrOH3ame/5t8MN1gsA04PTMQ+aP7kN/OuNU/OKdoYrFL8/FH+NootYtmziwR46BgAd6WppMXdwX9
 QWmxZkhaF8EGIt3AZJxycRJY9WwIAiPYOvbYAdq4Woxko9B9NCjDYno7FLE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/11/2020 15:40, Ezequiel Garcia wrote:
> Now that we've destaged the H264 stateless codec controls,
> and with all the pieces in place, update the documentation
> and move it to its own section.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++++
>  .../media/v4l/ext-ctrls-codec.rst             | 692 ------------------
>  .../media/v4l/extended-controls.rst           |   3 +-
>  .../media/v4l/pixfmt-compressed.rst           |  21 +-
>  5 files changed, 685 insertions(+), 706 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> 

<snip>

> diff --git a/Documentation/userspace-api/media/v4l/extended-controls.rst b/Documentation/userspace-api/media/v4l/extended-controls.rst
> index 44fcd67f20bf..866bd787eef0 100644
> --- a/Documentation/userspace-api/media/v4l/extended-controls.rst
> +++ b/Documentation/userspace-api/media/v4l/extended-controls.rst
> @@ -56,7 +56,8 @@ group similar controls into a single class. For example, control class
>  ``V4L2_CTRL_CLASS_USER`` contains all user controls (i. e. all controls
>  that can also be set using the old :ref:`VIDIOC_S_CTRL <VIDIOC_G_CTRL>`
>  ioctl). Control class ``V4L2_CTRL_CLASS_CODEC`` contains controls
> -relating to codecs.
> +relating to codecs. See :ref:`codec-stateless-controls` for controls
> +specific to stateless codecs.

Drop this change. This text just gives an example about how control classes
work, it's not codec documentation as such.

Regards,

	Hans

>  
>  All controls in the control array must belong to the specified control
>  class. An error is returned if this is not the case.
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index d585909bc4e2..e28749ebf8d8 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -57,16 +57,16 @@ Compressed Formats
>        - H264 parsed slice data, including slice headers, either with or
>  	without the start code, as extracted from the H264 bitstream.
>  	This format is adapted for stateless video decoders that implement an
> -	H264 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
> +	H264 pipeline with the :ref:`stateless_decoder`.
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
> @@ -77,11 +77,6 @@ Compressed Formats
>  	7.3.2.8 "Slice layer without partitioning RBSP syntax" and the following
>  	sections.
>  
> -	.. note::
> -
> -	   This format is not yet part of the public kernel API and it
> -	   is expected to change.
> -
>      * .. _V4L2-PIX-FMT-H263:
>  
>        - ``V4L2_PIX_FMT_H263``
> 

