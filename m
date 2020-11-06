Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9952A926D
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 10:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgKFJYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 04:24:09 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35555 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726165AbgKFJYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 04:24:08 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id axyRkJM3KNanzaxyUkraCB; Fri, 06 Nov 2020 10:24:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604654646; bh=+SRU62A1TNMW2XcktsIfP/8EVTr1hndZCqONhoCXAYU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cTq71RpQeXlpg6vupxcbb0sWwyJvaOuGkL2wl6+u8IdEoHFEL3r3aXyeLfJOXBdDt
         GlwOMB4txHFRyCbRPP7FFceFgLrwwrQoeE5N3QXSukQlinXkEJqTz+RwK+0ODzms8c
         VIvTYYEZFl7lWBsFQaXSr4NsB6KSy0RXlWQ1rv1HYlvPT8EuYO16wCzQTWrR01bcOM
         ZN0IHp3Cj+XMmwOsyQ+RryuM3E2IBRmZbSKM41Ufb54lXYMyA2fuxalx+TJxV9AH06
         7hMudSRXbjG3WmpdRfo6lE8+415XUq2nDh6IP8s7ALAel7lyj7/nLCbAxDXxG09Nq8
         nmaWJ5brufSew==
Subject: Re: [PATCH v3 1/5] media: uapi: v4l2-core: Add sensor ancillary data
 V4L2 fourcc type
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Cc:     naush@raspberrypi.com, dave.stevenson@raspberrypi.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, sakari.ailus@iki.fi,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
References: <20201102165258.408049-1-jacopo@jmondi.org>
 <20201102165258.408049-2-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d7d041b6-92d7-d1fa-f74f-ff4a63e5ad89@xs4all.nl>
Date:   Fri, 6 Nov 2020 10:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102165258.408049-2-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN4TvxmpVhulHXOiArsttRWXwzRMpQahRWe+xdPjPT1cNu+jCsRz+Kj8b1emwUv/W6C+ptXCVYvvX4Aip0cxHnjS8l6DEwixjmCoRVOpHUkjPaJgm6nW
 w07FmEXj9KYzQTVIwyCsWNc4T/4cnLUppr90SgP9Jgn4Y+KsenqfPSUcpcfispG3M+3Mz55Lnfoqrq1rMHHMYvNpbK37b+6fSgt7JPFB8hfPlVNV4RfgeOc2
 MTA3dnnWmkjK33pq4j5sysws1emruilYtWMHo5C+LlD3rDgDogofTJfyP2unep/ktYobtRgYlOfDi/AGG8iImEWQ+t1+/0rJff8CMWb6/4PD8Og+ms6x28zQ
 L6x4NMaHyBYvPEHa8USubX7ZQsVfPBUvtZ6N5uHBuqAAwKdDcKMMctwOfOJvx4rfZwWeBcNPCS22PMDXcmLZczAHuse8jb1T8dK3XYPohjWU2xa3i1/nxcJU
 4ET7lHrN7T5tJY48SSgqkxwqgDNtVKUZwnpNICndvmFB7YUnQU0kRm96bUXtT3bH1vmUHb6YlHAQlGFv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, Naushir,

On 02/11/2020 17:52, Jacopo Mondi wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add V4L2_META_FMT_SENSOR_DATA format 4CC.
> 
> This new format will be used to return camera sensor embedded data.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
>  .../media/v4l/pixfmt-meta-sensor-data.rst     | 32 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 35 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index fff25357fe860..b2201d1524eb6 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
>      pixfmt-meta-d4xx
>      pixfmt-meta-intel-ipu3
>      pixfmt-meta-rkisp1
> +    pixfmt-meta-sensor-data
>      pixfmt-meta-uvc
>      pixfmt-meta-vsp1-hgo
>      pixfmt-meta-vsp1-hgt
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst
> new file mode 100644
> index 0000000000000..639ede1a8fee3
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst
> @@ -0,0 +1,32 @@
> +.. Permission is granted to copy, distribute and/or modify this
> +.. document under the terms of the GNU Free Documentation License,
> +.. Version 1.1 or any later version published by the Free Software
> +.. Foundation, with no Invariant Sections, no Front-Cover Texts
> +.. and no Back-Cover Texts. A copy of the license is included at
> +.. Documentation/media/uapi/fdl-appendix.rst.
> +..
> +.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections

You can now use this:

.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later

and drop the TODO and license notice.

> +
> +.. _v4l2-meta-fmt-sensor-data:
> +
> +***********************************
> +V4L2_META_FMT_SENSOR_DATA  ('SENS')
> +***********************************
> +
> +Sensor Ancillary Metadata
> +
> +Description
> +===========
> +
> +This format describes ancillary data generated by a camera sensor and
> +transmitted over a stream on the camera bus. Most sensor vendors have their
> +own custom format for this ancillary data. Some vendors follow a generic
> +CSI-2/SMIA embedded data format as described in the `CSI-2 specification.
> +<https://mipi.org/specifications/csi-2>`_

There are really two metadata formats here: one is a custom sensor format and one
a CSI2 format. That's two pixel formats.

Of course, if the custom format used by a sensor (or sensor vendor) is known,
then it should get its own fourcc.

I suggest creating two metadata formats:

V4L2_META_FMT_CSI2_SENSOR_DATA
V4L2_META_FMT_CUSTOM_SENSOR_DATA

Where the format of the latter is unknown (unless you have the information
from the sensor vendor under NDA).

> +
> +The size of the embedded buffer is defined as a single line with a pixel width
> +specified in bytes. This is obtained by a call to the
> +:c:type:`VIDIOC_SUBDEV_G_FMT` ioctl on the sensor subdevice where the ``pad``
> +field in :c:type:`v4l2_subdev_format` is set to 1.  Note that this size is fixed
> +and cannot be modified with a call to :c:type:`VIDIOC_SUBDEV_S_FMT`.
> +
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index eeff398fbdcc1..d01d9ca6578df 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1402,6 +1402,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> +	case V4L2_META_FMT_SENSOR_DATA:	descr = "Sensor Ancillary Metadata"; break;
>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 534eaa4d39bc8..b7e3185e66631 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -769,6 +769,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>  #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S') /* Sensor Ancillary metadata */
>  
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> 

Regards,

	Hans
