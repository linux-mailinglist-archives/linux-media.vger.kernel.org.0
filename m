Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A042777C11
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 17:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbjHJPYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 11:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234177AbjHJPYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 11:24:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363832683
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 08:24:19 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-14-125.net.vodafone.it [5.90.14.125])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F0484DE;
        Thu, 10 Aug 2023 17:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691680988;
        bh=gHybPZMG2B9dSwtQhuOn4Qw7akPM5IEsrO+kxMHVmNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PF6RRm3jCMWRKkpMwKPw+pgR0IRG/bAkwQtYUWVppDns0NunsBREeNUjEqHbmm8ix
         Y/iWYna1Nb+tef0bnau0PGyrZ5oNxoY42xUAwgIyMMH7QffNn7v+jh3zguY8aV14Tg
         VivbjY6V6aXu+1cAotO7OsQ+1FIZZF8erubqE1iM=
Date:   Thu, 10 Aug 2023 17:24:14 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 08/10] media: v4l: Support line-based metadata capture
Message-ID: <ejo4a5dhvdukmle6lqddhsmvge6krezx5mhfq2ghoy23cnjygb@byo2u34seqz3>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-9-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808075538.3043934-9-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, Aug 08, 2023 at 10:55:36AM +0300, Sakari Ailus wrote:
> many camera sensors, among other devices, transmit embedded data and image
> data for each CSI-2 frame. This embedded data typically contains register
> configuration of the sensor that has been used to capture the image data
> of the same frame.
>
> The embedded data is received by the CSI-2 receiver and has the same
> properties as the image data, including that it is line based: it has
> width, height and bytesperline (stride).
>
> Add these fields to struct v4l2_meta_format and document them.
>
> Also add V4L2_FMT_FLAG_META_LINE_BASED to tell a given format is
> line-based i.e. these fields of struct v4l2_meta_format are valid for it.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/dev-meta.rst          | 15 +++++++++++++++
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst   |  7 +++++++
>  .../media/videodev2.h.rst.exceptions              |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c              |  5 +++--
>  include/uapi/linux/videodev2.h                    | 10 ++++++++++
>  5 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/dev-meta.rst b/Documentation/userspace-api/media/v4l/dev-meta.rst
> index 0e7e1ee1471a..4b24bae6e171 100644
> --- a/Documentation/userspace-api/media/v4l/dev-meta.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-meta.rst
> @@ -65,3 +65,18 @@ to 0.
>        - ``buffersize``
>        - Maximum buffer size in bytes required for data. The value is set by the
>          driver.
> +    * - __u32
> +      - ``width``
> +      - Width of a line of metadata in samples. Valid when :c:type`v4l2_fmtdesc`
> +	flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> +	:c:func:`VIDIOC_ENUM_FMT`.
> +    * - __u32
> +      - ``height``
> +      - Number of rows of metadata. Valid when :c:type`v4l2_fmtdesc` flag
> +	``V4L2_FMT_FLAG_META_LINE_BASED`` is set, otherwise zero. See
> +	:c:func:`VIDIOC_ENUM_FMT`.
> +    * - __u32
> +      - ``bytesperline``
> +      - Offset in bytes between the beginning of two consecutive lines. Valid
> +	when :c:type`v4l2_fmtdesc` flag ``V4L2_FMT_FLAG_META_LINE_BASED`` is
> +	set, otherwise zero. See :c:func:`VIDIOC_ENUM_FMT`.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 000c154b0f98..6d7664345a4e 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -227,6 +227,13 @@ the ``mbus_code`` field is handled differently:
>  	The application can ask to configure the quantization of the capture
>  	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
>  	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
> +    * - ``V4L2_FMT_FLAG_META_LINE_BASED``
> +      - 0x0200
> +      - The metadata format is line-based. In this case the ``width``,
> +	``height`` and ``bytesperline`` fields of :c:type:`v4l2_meta_format` are
> +	valid. The buffer consists of ``height`` lines, each having ``width``
> +	bytes of data and offset between the beginning of each two consecutive

Isn't ``width`` in samples ?

> +	lines is ``bytesperline``.
>
>  Return Value
>  ============
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 3e58aac4ef0b..bdc628e8c1d6 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -215,6 +215,7 @@ replace define V4L2_FMT_FLAG_CSC_XFER_FUNC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
> +replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index fbbddc333a30..971d784e7429 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -343,8 +343,9 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		meta = &p->fmt.meta;
>  		pixelformat = meta->dataformat;
> -		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
> -			&pixelformat, meta->buffersize);
> +		pr_cont(", dataformat=%p4cc, buffersize=%u, width=%u, height=%u, bytesperline=%u\n",
> +			&pixelformat, meta->buffersize, meta->width,
> +			meta->height, meta->bytesperline);
>  		break;
>  	}
>  }
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index b4284a564025..d26c0650c6a7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -877,6 +877,7 @@ struct v4l2_fmtdesc {
>  #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
>  #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> +#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>
>  	/* Frame Size and frame rate enumeration */
>  /*
> @@ -2420,10 +2421,19 @@ struct v4l2_sdr_format {
>   * struct v4l2_meta_format - metadata format definition
>   * @dataformat:		little endian four character code (fourcc)
>   * @buffersize:		maximum size in bytes required for data
> + * @width:		number of bytes of data per line (valid for line based

I'm a bit confused here as well, isn't width in samples ?

> + *			formats only, see format documentation)
> + * @height:		number of lines of data per buffer (valid for line based
> + *			formats only)
> + * @bytesperline:	offset between the beginnings of two adjacent lines in
> + *			bytes (valid for line based formats only)
>   */
>  struct v4l2_meta_format {
>  	__u32				dataformat;
>  	__u32				buffersize;
> +	__u32				width;
> +	__u32				height;
> +	__u32				bytesperline;
>  } __attribute__ ((packed));
>
>  /**
> --
> 2.39.2
>
