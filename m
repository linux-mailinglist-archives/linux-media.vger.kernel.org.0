Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E99839CBC0
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 01:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhFEXs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 19:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhFEXs3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 19:48:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C17C061766
        for <linux-media@vger.kernel.org>; Sat,  5 Jun 2021 16:46:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D67E3E7;
        Sun,  6 Jun 2021 01:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622936799;
        bh=v1EDtf/Gx5B7YuVqnBf9Lr3TizqZAnh4Yl2QzHUZXW4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XDekTIC8UwOlSkvphfS8k7PhzqU4It29X5jnUjP1J27n8l0jTY1NRh/8RJRywxGtY
         BND6VubP+beQQcW9J/FK/R3Fjmd2drEYueBWHPZCeLBkCmJdbveJDkBgPltrwuM0EA
         ZAHSZz/NQyTipc1opZgK+FDz7BLJOHOlJsUX7YcM=
Date:   Sun, 6 Jun 2021 02:46:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 23/27] v4l: subdev: add 'stream' to subdev ioctls
Message-ID: <YLwM0kvJC+1AoZA9@pendragon.ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-24-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524104408.599645-24-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 01:44:04PM +0300, Tomi Valkeinen wrote:
> Add 'stream' field to all subdev configuration related ioctls.

This change is simple enough and should be fine, but you're missing the
documentation. The userspace API has to clearly define how streams are
handled. I assume documentation is missing as you're looking for general
feedback on the approach first, but be aware that 500-1000 lines of
documentation will likely be required. The hard part will be to specify
interactions between all the ioctls.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../v4l/vidioc-subdev-enum-frame-interval.rst |  5 ++++-
>  .../v4l/vidioc-subdev-enum-frame-size.rst     |  5 ++++-
>  .../v4l/vidioc-subdev-enum-mbus-code.rst      |  5 ++++-
>  .../media/v4l/vidioc-subdev-g-crop.rst        |  5 ++++-
>  .../media/v4l/vidioc-subdev-g-fmt.rst         |  5 ++++-
>  .../v4l/vidioc-subdev-g-frame-interval.rst    |  5 ++++-
>  .../media/v4l/vidioc-subdev-g-selection.rst   |  5 ++++-
>  include/uapi/linux/v4l2-subdev.h              | 21 ++++++++++++-------
>  8 files changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
> index 3703943b412f..8def4c05d3da 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
> @@ -92,7 +92,10 @@ multiple pads of the same sub-device is not defined.
>        - Frame intervals to be enumerated, from enum
>  	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>      * - __u32
> -      - ``reserved``\ [8]
> +      - ``stream``
> +      - Stream identifier.
> +    * - __u32
> +      - ``reserved``\ [7]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
> index c25a9896df0e..3ef361c0dca7 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
> @@ -97,7 +97,10 @@ information about try formats.
>        - Frame sizes to be enumerated, from enum
>  	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>      * - __u32
> -      - ``reserved``\ [8]
> +      - ``stream``
> +      - Stream identifier.
> +    * - __u32
> +      - ``reserved``\ [7]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> index 417f1a19bcc4..248f6f9ee7c5 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
> @@ -73,7 +73,10 @@ information about the try formats.
>        - ``flags``
>        - See :ref:`v4l2-subdev-mbus-code-flags`
>      * - __u32
> -      - ``reserved``\ [7]
> +      - ``stream``
> +      - Stream identifier.
> +    * - __u32
> +      - ``reserved``\ [6]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> index bd15c0a5a66b..1d267f7e7991 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> @@ -96,7 +96,10 @@ modified format should be as close as possible to the original request.
>        - ``rect``
>        - Crop rectangle boundaries, in pixels.
>      * - __u32
> -      - ``reserved``\ [8]
> +      - ``stream``
> +      - Stream identifier.
> +    * - __u32
> +      - ``reserved``\ [7]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
> index 7acdbb939d89..ed253a1e44b7 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
> @@ -102,7 +102,10 @@ should be as close as possible to the original request.
>        - Definition of an image format, see :c:type:`v4l2_mbus_framefmt` for
>  	details.
>      * - __u32
> -      - ``reserved``\ [8]
> +      - ``stream``
> +      - Stream identifier.
> +    * - __u32
> +      - ``reserved``\ [7]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
> index d7fe7543c506..842f962d2aea 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
> @@ -90,7 +90,10 @@ the same sub-device is not defined.
>        - ``interval``
>        - Period, in seconds, between consecutive video frames.
>      * - __u32
> -      - ``reserved``\ [9]
> +      - ``stream``
> +      - Stream identifier.
> +    * - __u32
> +      - ``reserved``\ [8]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
> index f9172a42f036..6b629c19168c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
> @@ -94,7 +94,10 @@ Selection targets and flags are documented in
>        - ``r``
>        - Selection rectangle, in pixels.
>      * - __u32
> -      - ``reserved``\ [8]
> +      - ``stream``
> +      - Stream identifier.
> +    * - __u32
> +      - ``reserved``\ [7]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index f20491e1f53f..a6fbdd3456bf 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -50,7 +50,8 @@ struct v4l2_subdev_format {
>  	__u32 which;
>  	__u32 pad;
>  	struct v4l2_mbus_framefmt format;
> -	__u32 reserved[8];
> +	__u32 stream;
> +	__u32 reserved[7];
>  };
>  
>  /**
> @@ -64,7 +65,8 @@ struct v4l2_subdev_crop {
>  	__u32 which;
>  	__u32 pad;
>  	struct v4l2_rect rect;
> -	__u32 reserved[8];
> +	__u32 stream;
> +	__u32 reserved[7];
>  };
>  
>  #define V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE	0x00000001
> @@ -88,7 +90,8 @@ struct v4l2_subdev_mbus_code_enum {
>  	__u32 code;
>  	__u32 which;
>  	__u32 flags;
> -	__u32 reserved[7];
> +	__u32 stream;
> +	__u32 reserved[6];
>  };
>  
>  /**
> @@ -112,7 +115,8 @@ struct v4l2_subdev_frame_size_enum {
>  	__u32 min_height;
>  	__u32 max_height;
>  	__u32 which;
> -	__u32 reserved[8];
> +	__u32 stream;
> +	__u32 reserved[7];
>  };
>  
>  /**
> @@ -124,7 +128,8 @@ struct v4l2_subdev_frame_size_enum {
>  struct v4l2_subdev_frame_interval {
>  	__u32 pad;
>  	struct v4l2_fract interval;
> -	__u32 reserved[9];
> +	__u32 stream;
> +	__u32 reserved[8];
>  };
>  
>  /**
> @@ -146,7 +151,8 @@ struct v4l2_subdev_frame_interval_enum {
>  	__u32 height;
>  	struct v4l2_fract interval;
>  	__u32 which;
> -	__u32 reserved[8];
> +	__u32 stream;
> +	__u32 reserved[7];
>  };
>  
>  /**
> @@ -170,7 +176,8 @@ struct v4l2_subdev_selection {
>  	__u32 target;
>  	__u32 flags;
>  	struct v4l2_rect r;
> -	__u32 reserved[8];
> +	__u32 stream;
> +	__u32 reserved[7];
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
