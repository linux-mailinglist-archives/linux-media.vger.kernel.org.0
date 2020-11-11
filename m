Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8EF42AF74F
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 18:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgKKRVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 12:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726625AbgKKRVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 12:21:07 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC46C0613D1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 09:21:07 -0800 (PST)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C5E92634C24;
        Wed, 11 Nov 2020 19:19:28 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kctmL-0004A6-UE; Wed, 11 Nov 2020 19:19:29 +0200
Date:   Wed, 11 Nov 2020 19:19:29 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hverkuil@xs4all.nl, nsaenzjulienne@suse.de,
        mchehab+huawei@kernel.org
Subject: Re: [PATCH v3 1/5] media: uapi: v4l2-core: Add sensor ancillary data
 V4L2 fourcc type
Message-ID: <20201111171929.GA6899@valkosipuli.retiisi.org.uk>
References: <20201102165258.408049-1-jacopo@jmondi.org>
 <20201102165258.408049-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102165258.408049-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 02, 2020 at 05:52:54PM +0100, Jacopo Mondi wrote:
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

How about "Embedded" instead? This is called embedded data virtually
everywhere.

Is it meant that all sensors would use this mbus code, or just some? I was
thinking we'd have sensor specific embedded data formats, but this approach
admittedly makes implementation easier in quite a few places. What will be
the documentation requirements for embedded data formats? Anything goes,
or...? I'm not sure I like that idea. Thoughts, anyone?

If we use an opaque format here, it'll be impossible for the receiver
driver to know how to pack the data in memory. Although... I guess this is
generally the responsibility of the software.

This approach will also have the consequence that we'll have an opaque
sensor embedded data format.

How does the receiver figure out the bits per pixel for this? That'll be
needed at least for calculating the buffer size when the data is written to
the memory.

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

-- 
Kind regards,

Sakari Ailus
