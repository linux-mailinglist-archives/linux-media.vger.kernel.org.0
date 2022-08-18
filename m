Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A30C25990A4
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 00:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244182AbiHRWkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 18:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241929AbiHRWkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 18:40:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B35AD8077
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 15:40:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65D9D8B;
        Fri, 19 Aug 2022 00:40:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660862415;
        bh=GSvknzqD7KvPXWvtrX61ph4XxGhYTdwL/HHkadUetZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tUyJhEvwndRTXRKIP9yCDHut68248bE/rD89PLI3yDHhmO7KTQe0crA6luy3zvaeH
         m5vhJZYxr1tFnesEHRdY69YRWKatG7tzDvrNA7ka034cb7AHHwIvOFjm4SF1HllRj5
         FWF6JlCmXYiVDgreIXu6Fx5qIs7wWW8bCtzCxJCU=
Date:   Fri, 19 Aug 2022 01:40:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCHv2] videodev2.h: drop V4L2_CAP_ASYNCIO
Message-ID: <Yv6/y1TIjVY0oYn1@pendragon.ideasonboard.com>
References: <657d6f87-0e77-2289-8e23-b9402a04bdcd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <657d6f87-0e77-2289-8e23-b9402a04bdcd@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Aug 18, 2022 at 09:51:40AM +0200, Hans Verkuil wrote:
> The V4L2_CAP_ASYNCIO capability was never implemented (and in fact
> it isn't clear what it was supposed to do in the first place).
> 
> Drop it from the capabilities list. Keep it in videodev2.h with the
> other defines under ifndef __KERNEL__ for backwards compatibility.
> 
> This will free up a capability bit for other future uses. And having
> an unused and undefined I/O method is just plain confusing.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes since v1:
> - Keep the old hex value for the capability as per suggestion from Laurent.
>   This ensures that old code using this will still keep running without
>   'if (caps & V4L2_CAP_ASYNCIO)' generating a 'condition is always false'
>   warning.
> - Add a comment in videodev2.h mentioning that it was never implemented.
> ---
>  Documentation/userspace-api/media/v4l/async.rst          | 9 ---------
>  Documentation/userspace-api/media/v4l/dev-raw-vbi.rst    | 2 +-
>  Documentation/userspace-api/media/v4l/dev-sdr.rst        | 2 +-
>  Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst | 2 +-
>  Documentation/userspace-api/media/v4l/hist-v4l2.rst      | 2 +-
>  Documentation/userspace-api/media/v4l/io.rst             | 4 +---
>  .../userspace-api/media/v4l/vidioc-querycap.rst          | 3 ---
>  include/uapi/linux/videodev2.h                           | 6 +++++-
>  8 files changed, 10 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/userspace-api/media/v4l/async.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/async.rst b/Documentation/userspace-api/media/v4l/async.rst
> deleted file mode 100644
> index d6960ff5c382..000000000000
> --- a/Documentation/userspace-api/media/v4l/async.rst
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _async:
> -
> -****************
> -Asynchronous I/O
> -****************
> -
> -This method is not defined yet.
> diff --git a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> index 58f97c3a7792..2bec20d87928 100644
> --- a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
> @@ -41,7 +41,7 @@ Devices supporting the raw VBI capturing or output API set the
>  in the ``capabilities`` field of struct
>  :c:type:`v4l2_capability` returned by the
>  :ref:`VIDIOC_QUERYCAP` ioctl. At least one of the
> -read/write, streaming or asynchronous I/O methods must be supported. VBI
> +read/write or streaming I/O methods must be supported. VBI
>  devices may or may not have a tuner or modulator.
>  
>  Supplemental Functions
> diff --git a/Documentation/userspace-api/media/v4l/dev-sdr.rst b/Documentation/userspace-api/media/v4l/dev-sdr.rst
> index 928884dfe09d..dfdeddbca41f 100644
> --- a/Documentation/userspace-api/media/v4l/dev-sdr.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-sdr.rst
> @@ -34,7 +34,7 @@ Devices supporting the SDR transmitter interface set the
>  device has an Digital to Analog Converter (DAC), which is a mandatory
>  element for the SDR transmitter.
>  
> -At least one of the read/write, streaming or asynchronous I/O methods
> +At least one of the read/write or streaming I/O methods
>  must be supported.
>  
>  
> diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> index 97ec2b115c71..44415822c7c5 100644
> --- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> @@ -36,7 +36,7 @@ Devices supporting the sliced VBI capturing or output API set the
>  respectively, in the ``capabilities`` field of struct
>  :c:type:`v4l2_capability` returned by the
>  :ref:`VIDIOC_QUERYCAP` ioctl. At least one of the
> -read/write, streaming or asynchronous :ref:`I/O methods <io>` must be
> +read/write or streaming :ref:`I/O methods <io>` must be
>  supported. Sliced VBI devices may have a tuner or modulator.
>  
>  Supplemental Functions
> diff --git a/Documentation/userspace-api/media/v4l/hist-v4l2.rst b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
> index 28a2750d5c8c..dbc04374dc22 100644
> --- a/Documentation/userspace-api/media/v4l/hist-v4l2.rst
> +++ b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
> @@ -316,7 +316,7 @@ This unnamed version was finally merged into Linux 2.5.46.
>      There are new fields to identify the driver, a new RDS device
>      function ``V4L2_CAP_RDS_CAPTURE``, the ``V4L2_CAP_AUDIO`` flag
>      indicates if the device has any audio connectors, another I/O
> -    capability ``V4L2_CAP_ASYNCIO`` can be flagged. In response to these
> +    capability V4L2_CAP_ASYNCIO can be flagged. In response to these
>      changes the ``type`` field became a bit set and was merged into the
>      ``flags`` field. ``V4L2_FLAG_TUNER`` was renamed to
>      ``V4L2_CAP_TUNER``, ``V4L2_CAP_VIDEO_OVERLAY`` replaced
> diff --git a/Documentation/userspace-api/media/v4l/io.rst b/Documentation/userspace-api/media/v4l/io.rst
> index ce0cece6f35f..4b1964df9d73 100644
> --- a/Documentation/userspace-api/media/v4l/io.rst
> +++ b/Documentation/userspace-api/media/v4l/io.rst
> @@ -17,8 +17,7 @@ read or write will fail at any time.
>  
>  Other methods must be negotiated. To select the streaming I/O method
>  with memory mapped or user buffers applications call the
> -:ref:`VIDIOC_REQBUFS` ioctl. The asynchronous I/O
> -method is not defined yet.
> +:ref:`VIDIOC_REQBUFS` ioctl.
>  
>  Video overlay can be considered another I/O method, although the
>  application does not directly receive the image data. It is selected by
> @@ -46,6 +45,5 @@ The following sections describe the various I/O methods in more detail.
>      mmap
>      userp
>      dmabuf
> -    async
>      buffer
>      field-order
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> index 63e23f6f95ee..6c57b8428356 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
> @@ -244,9 +244,6 @@ specification the ioctl returns an ``EINVAL`` error code.
>        - 0x01000000
>        - The device supports the :c:func:`read()` and/or
>  	:c:func:`write()` I/O methods.
> -    * - ``V4L2_CAP_ASYNCIO``
> -      - 0x02000000
> -      - The device supports the :ref:`asynchronous <async>` I/O methods.
>      * - ``V4L2_CAP_STREAMING``
>        - 0x04000000
>        - The device supports the :ref:`streaming <mmap>` I/O method.
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 01e630f2ec78..b8ee7dde1cbc 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -502,7 +502,6 @@ struct v4l2_capability {
>  #define V4L2_CAP_META_CAPTURE		0x00800000  /* Is a metadata capture device */
>  
>  #define V4L2_CAP_READWRITE              0x01000000  /* read/write systemcalls */
> -#define V4L2_CAP_ASYNCIO                0x02000000  /* async I/O */
>  #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioctls */
>  #define V4L2_CAP_META_OUTPUT		0x08000000  /* Is a metadata output device */
>  
> @@ -2682,6 +2681,11 @@ struct v4l2_create_buffers {
>  #ifndef __KERNEL__
>  #define V4L2_PIX_FMT_HM12 V4L2_PIX_FMT_NV12_16L16
>  #define V4L2_PIX_FMT_SUNXI_TILED_NV12 V4L2_PIX_FMT_NV12_32L32
> +/*
> + * This capability was never implemented, anyone using this cap should drop it
> + * from their code.
> + */
> +#define V4L2_CAP_ASYNCIO 0x02000000
>  #endif
>  
>  #endif /* _UAPI__LINUX_VIDEODEV2_H */

-- 
Regards,

Laurent Pinchart
