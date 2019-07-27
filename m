Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27BE4777EF
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 11:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbfG0Jht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 05:37:49 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51605 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbfG0Jht (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 05:37:49 -0400
X-Originating-IP: 176.158.46.5
Received: from aptenodytes (static-176-158-46-5.ftth.abo.bbox.fr [176.158.46.5])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B9F7A20004;
        Sat, 27 Jul 2019 09:37:45 +0000 (UTC)
Date:   Sat, 27 Jul 2019 11:37:45 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 02/14] videodev2.h: add V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
Message-ID: <20190727093745.GB16618@aptenodytes>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
 <20190724110523.29248-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190724110523.29248-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed 24 Jul 19, 13:05, Hans Verkuil wrote:
> Add an enum_fmt format flag to specifically tag coded formats where
> full bitstream parsing is supported by the device.
> 
> Some stateful decoders are capable of fully parsing a bitstream,
> but others require that userspace pre-parses the bitstream into
> frames or fields (see the corresponding pixelformat descriptions
> for details).
> 
> If this flag is set, then this pre-parsing step is not required
> (but still possible, of course).
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
>  Documentation/media/videodev2.h.rst.exceptions   | 1 +
>  include/uapi/linux/videodev2.h                   | 5 +++--
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 822d6730e7d2..4e24e671f32e 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
>        - This format is not native to the device but emulated through
>  	software (usually libv4l2), where possible try to use a native
>  	format instead for better performance.
> +    * - ``V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER``
> +      - 0x0004
> +      - The hardware decoder for this compressed bitstream format (aka coded
> +	format) is capable of parsing the bitstream. Applications do not
> +	need to parse the bitstream themselves to find the boundaries between
> +	frames/fields. This flag can only be used in combination with the
> +	``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
> +	formats only.

Should this flag be set for stateless codecs as well? It seems a bit over-kill
for this case. I am not sure whether "compressed bitstream format" clearly only
covers the formats used by stateful decoders and not the ones for stateless
decoders.

Cheers,

Paul

>  
>  Return Value
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> index 55cbe324b9fc..74fb9f00c12d 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -180,6 +180,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
>  # V4L2 format flags
>  replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
>  replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
> +replace define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER fmtdesc-flags
>  
>  # V4L2 tymecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 2427bc4d8eba..8c5a28666b16 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -774,8 +774,9 @@ struct v4l2_fmtdesc {
>  	__u32		    reserved[4];
>  };
>  
> -#define V4L2_FMT_FLAG_COMPRESSED 0x0001
> -#define V4L2_FMT_FLAG_EMULATED   0x0002
> +#define V4L2_FMT_FLAG_COMPRESSED		0x0001
> +#define V4L2_FMT_FLAG_EMULATED			0x0002
> +#define V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER	0x0004
>  
>  	/* Frame Size and frame rate enumeration */
>  /*
> -- 
> 2.20.1
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
