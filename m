Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762441C3BAE
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 15:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgEDNsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 09:48:08 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45085 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728110AbgEDNsI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 09:48:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VbRxjO9rbhEkrVbS1juowi; Mon, 04 May 2020 15:48:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588600085; bh=w0nAYnuvl9ueSxm/DVXXc1Afh5ASL3200XhvzxswWns=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RCk7cUiRSVk0fTxzdf+qP76rh2xTp/v56LijzpNmcNzl8QCDlgmo/G5ovXmoN/vN4
         5YQXFcb3mq/e7iOL0ix7xDCrmq81gNR3XMJnnOgwLG6lsTzgmf85giiWiExQdGCkuT
         Ks1TBVfDw3MTxOhTSvPq3IzEho8m1TABG3s8lVS0n5ZpZRc0QzfOeTgsgiut5aekeb
         9BCT63G/K6zI0kD35LqpWuGX5PpH0B7q8Ky9vfXbaAmDa/ZXaVw6xoSKrGJijTTEqD
         suaVZJtt7WjBVQnH/RqIxbO4I11zWrkDj7FfasLKfea9uMUzmKtqC+VqxiRlfd1WOX
         8T9Vba6+UUWbA==
Subject: Re: [PATCH v2 01/34] media: uapi: v4l2-core: Add sensor ancillary
 data V4L2 fourcc type
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-2-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b4c2bb55-a93b-2035-289c-50e10282e54f@xs4all.nl>
Date:   Mon, 4 May 2020 15:48:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200504092611.9798-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBBl4+E9EdfZh17dyLVl0f6Lck7RjxILbiwFG8Rg04FrjweaKRBD4Xk/yUTHZDKrMxLDioR5cF2HfOPG9Kp+I0OIXaWynBQmQQ5cNBTCMhjjrPOpdJn3
 WWOS6MmfRtgXXzGe09tbDDRxBeDRQ5Qoo/JrrJY2ay1TU2Y7mPGcnbO4mdkCHEO2DndEVXorEohalvbODfYJ3uy7+eyf8IQFzgnbdbT0GOpnK80edOw4NO9t
 PBPa7uMNkKPbhYaHa7zBPTlmThS8Tr7YVL0/Jihy7hhQeJcicLmHRvyRB0MJ4pUBJSDIb8gnb+ptEOWIECWiW9Zxg6i/EAvwRWUKF9Ce50wDxKK8xLfcJ0r1
 qNOx9i7iHFcmOgqnEXHoViiwR3Vw5u/zpHEOuHTFaUehX39Q/WKaixvGpK40luSNVjuOFlZ7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/05/2020 11:25, Laurent Pinchart wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add V4L2_META_FMT_SENSOR_DATA format 4CC.
> 
> This new format will be used by the BCM2835 Unicam device to return
> out camera sensor embedded data.

out -> our (I think)

> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  Documentation/media/uapi/v4l/meta-formats.rst |  1 +
>  .../uapi/v4l/pixfmt-meta-sensor-data.rst      | 32 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 35 insertions(+)
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
> 
> diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
> index 74c8659ee9d6..5474086ef6f0 100644
> --- a/Documentation/media/uapi/v4l/meta-formats.rst
> +++ b/Documentation/media/uapi/v4l/meta-formats.rst
> @@ -21,6 +21,7 @@ These formats are used for the :ref:`metadata` interface only.
>  
>      pixfmt-meta-d4xx
>      pixfmt-meta-intel-ipu3
> +    pixfmt-meta-sensor-data
>      pixfmt-meta-uvc
>      pixfmt-meta-vsp1-hgo
>      pixfmt-meta-vsp1-hgt
> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst b/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
> new file mode 100644
> index 000000000000..4a67e204d08a
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
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
> +transmitted over a stream on the camera bus. Sensor vendors generally have their

'generally' can be dropped.

> +own custom format for this ancillary data. Some vendors follow a generic
> +CSI-2/SMIA embedded data format as described in the `CSI-2 specification.
> +<https://mipi.org/specifications/csi-2>`_

So what does this format represent? Sensor specific custom data where you need
sensor-specific NDA knowledge in userspace to parse it? Or SMIA formatted sensor
data?

A 4cc should map to a specific data format. I understand that this is not always
known, but at least the SMIA data format would need its own 4cc. I assume that the
sensor driver will at least know that it produces SMIA data, right?

"SENSOR_DATA" is also much too generic IMHO.

> +
> +The size of the embedded buffer is defined as a single line with a pixel width
> +width specified in bytes. This is obtained by a call to the

"pixel width width"? Typo?

> +:c:type:`VIDIOC_SUBDEV_G_FMT` ioctl on the sensor subdevice where the ``pad``
> +field in :c:type:`v4l2_subdev_format` is set to 1.  Note that this size is fixed

Should this description be explicit about the pad number?

Regards,

	Hans

> +and cannot be modified with a call to :c:type:`VIDIOC_SUBDEV_S_FMT`.
> +
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index b2ef8e60ea7d..faf5a0f5eb6b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1346,6 +1346,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> +	case V4L2_META_FMT_SENSOR_DATA:	descr = "Sensor Ancillary Metadata"; break;
>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9817b7e2c968..a96146223843 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -766,6 +766,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>  #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S') /* Sensor Ancillary metadata */
>  
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> 

