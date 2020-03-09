Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 028C817E1AD
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 14:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgCINwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 09:52:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:38105 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgCINwh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 09:52:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 06:52:35 -0700
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; 
   d="scan'208";a="241975188"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 06:52:33 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B61DE20AC3; Mon,  9 Mar 2020 15:52:31 +0200 (EET)
Date:   Mon, 9 Mar 2020 15:52:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v4 1/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Message-ID: <20200309135231.GU5379@paasikivi.fi.intel.com>
References: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
 <20200306163935.805333-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306163935.805333-2-niklas.soderlund@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Mar 06, 2020 at 05:39:33PM +0100, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Add a video device capability flag to indicate that its inputs and/or
> outputs are controlled by the Media Controller instead of the V4L2 API.
> When this flag is set, ioctl for enum inputs and outputs are
> automatically enabled and programmed to call a helper function.
> 
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v3
> - Update documentation for V4L2_CAP_IO_MC
> - Only enable VIDIOC_{G,S}_{INPUT,OUTPUT} if V4L2_CAP_IO_MC is set
>   (instead of unconditionally)
> - Merge v4l2_ioctl_enum_input_mc() into v4l_enuminput()
> - Merge v4l2_ioctl_enum_output_mc() into v4l_enumoutput()
> 
> * Changes since v2
> - Merged the two patches touching V4L2 core stuff to a single patch.
> - Updated documentation for V4L2_CAP_IO_MC
> - Added is_io_mc bool in determine_valid_ioctls()
> - Folded or moved code closer to where it's used
> - Remove unneeded memset()
> - Use strscpy() instead of strlcpy()
> ---
>  .../media/uapi/v4l/vidioc-querycap.rst        |  6 ++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/v4l2-core/v4l2-dev.c            | 25 ++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 57 +++++++++++++++++--
>  include/uapi/linux/videodev2.h                |  2 +
>  5 files changed, 81 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-querycap.rst b/Documentation/media/uapi/v4l/vidioc-querycap.rst
> index 5f9930195d624c73..497a6aa2cbebad71 100644
> --- a/Documentation/media/uapi/v4l/vidioc-querycap.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-querycap.rst
> @@ -264,6 +264,12 @@ specification the ioctl returns an ``EINVAL`` error code.
>      * - ``V4L2_CAP_TOUCH``
>        - 0x10000000
>        - This is a touch device.
> +    * - ``V4L2_CAP_IO_MC``
> +      - 0x20000000
> +      - There is only one input and/or output seen from userspace. The whole
> +        video topology configuration, including which I/O entity is routed to
> +        the input/output, is configured by userspace via the Media Controller.
> +        See :ref:`media_controller`.
>      * - ``V4L2_CAP_DEVICE_CAPS``
>        - 0x80000000
>        - The driver fills the ``device_caps`` field. This capability can
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> index cb6ccf91776e6b56..a625fb90e3a989a7 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -176,6 +176,7 @@ replace define V4L2_CAP_STREAMING device-capabilities
>  replace define V4L2_CAP_META_OUTPUT device-capabilities
>  replace define V4L2_CAP_DEVICE_CAPS device-capabilities
>  replace define V4L2_CAP_TOUCH device-capabilities
> +replace define V4L2_CAP_IO_MC device-capabilities
>  
>  # V4L2 pix flags
>  replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 97b6a3af13614639..a593ea0598b551b4 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -552,6 +552,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		       (vdev->device_caps & meta_caps);
>  	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
> +	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
>  
>  	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
>  
> @@ -725,9 +726,15 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
>  		if (is_rx) {
>  			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
> -			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
> -			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
> -			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
> +			if (is_io_mc) {

One more comment.

I'd make this dependent on the device node type, i.e. devices with
meta_caps set, the IOCTLs won't be supported.

So the check would become:

			if (is_io_mc && !is_meta)

> +				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
> +				set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
> +				set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
> +			} else {
> +				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
> +				SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
> +				SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
> +			}
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDIO, vidioc_g_audio);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);

-- 
Sakari Ailus
