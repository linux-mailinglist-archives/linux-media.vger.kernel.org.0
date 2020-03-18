Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B582A189D66
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgCRNzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:55:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45634 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgCRNzD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:55:03 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14830F9;
        Wed, 18 Mar 2020 14:55:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584539700;
        bh=3WGbTxOkx0L94i10mDsEFfH4pxKsyDuhuKPLxF3scuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d+vr2B90QoNWqXbfDYwbiEHEPtOExKBbbDc6GnOm8wefm8grXL/fNjPXlCCnjmJ1t
         tCBlwyfAnMYqzveq6J/v4ToSNR8qk0ecMK1yg8wTpWtJTlJMENjf4a3ACB4l0HrAnF
         Pbv9B46ugbC7x229dU65TsM/Gee6VTNMKVpLYH5I=
Date:   Wed, 18 Mar 2020 15:54:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Message-ID: <20200318135454.GN4733@pendragon.ideasonboard.com>
References: <20200318132513.3089234-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318132513.3089234-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318132513.3089234-2-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

One question for Hans below.

On Wed, Mar 18, 2020 at 02:25:10PM +0100, Niklas Söderlund wrote:
> Add a video device capability flag to indicate that its inputs and/or
> outputs are controlled by the Media Controller instead of the V4L2 API.
> When this flag is set, ioctl for enum inputs and outputs are
> automatically enabled and programmed to call a helper function.
> 
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> * Changes since v4
> - Cast to int, not unsigned int.
> - IOCTLs are not valid if meta capability is set.
> 
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
> index 97b6a3af13614639..3048811450182185 100644
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
> +			if (is_io_mc && !is_meta) {
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
> @@ -735,9 +742,15 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
>  		}
>  		if (is_tx) {
> -			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
> -			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
> -			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
> +			if (is_io_mc && !is_meta) {
> +				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
> +				set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
> +				set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
> +			} else {
> +				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
> +				SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
> +				SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
> +			}
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index fbcc7a20eedf553a..4c3fec1d3c65e166 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1085,6 +1085,32 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>  	return ret;
>  }
>  
> +static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
> +		       struct file *file, void *fh, void *arg)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +
> +	if (vfd->device_caps & V4L2_CAP_IO_MC) {
> +		*(int *)arg = 0;
> +		return 0;
> +	}
> +
> +	return ops->vidioc_g_input(file, fh, arg);
> +}
> +
> +static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
> +		       struct file *file, void *fh, void *arg)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +
> +	if (vfd->device_caps & V4L2_CAP_IO_MC) {
> +		*(int *)arg = 0;
> +		return 0;
> +	}
> +
> +	return ops->vidioc_g_output(file, fh, arg);
> +}
> +
>  static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1094,12 +1120,21 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
>  	ret = v4l_enable_media_source(vfd);
>  	if (ret)
>  		return ret;
> +
> +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> +		return  *(int *)arg ? -EINVAL : 0;
> +
>  	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
>  }
>  
>  static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> +	struct video_device *vfd = video_devdata(file);
> +
> +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> +		return  *(int *)arg ? -EINVAL : 0;
> +
>  	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
>  }
>  
> @@ -1143,6 +1178,14 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
>  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
>  		p->capabilities |= V4L2_IN_CAP_STD;
>  
> +	if (vfd->device_caps & V4L2_CAP_IO_MC) {
> +		if (p->index)
> +			return -EINVAL;
> +		strscpy(p->name, vfd->name, sizeof(p->name));
> +		p->type = V4L2_INPUT_TYPE_CAMERA;
> +		return 0;
> +	}
> +
>  	return ops->vidioc_enum_input(file, fh, p);
>  }
>  
> @@ -1161,6 +1204,14 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
>  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
>  		p->capabilities |= V4L2_OUT_CAP_STD;
>  
> +	if (vfd->device_caps & V4L2_CAP_IO_MC) {
> +		if (p->index)
> +			return -EINVAL;
> +		strscpy(p->name, vfd->name, sizeof(p->name));
> +		p->type = V4L2_OUTPUT_TYPE_ANALOG;
> +		return 0;
> +	}
> +
>  	return ops->vidioc_enum_output(file, fh, p);
>  }
>  

Do we really need all of this with V4L2_CAP_IO_MC ? Can't we document
the ioctls as not being supported when V4L2_CAP_IO_MC is set ? What's
the value for userspace, with the behaviour hardcoded ? Real
device-specific applications will never call these, while real generic
applications now have a much better way (V4L2_CAP_IO_MC) to determine
that input/output ioctls are pointless to call. Test applications and
compliance applications also get a flag, so they can just skip those
steps. What's the point in adding code that has no use ? There's not
even a need to support existing applications in a backward-compatible
way, as several MC-based drivers don't implement these ioctls, so we're
not breaking anything that is guaranteed to be working today. Shouldn't
we simplify the API by not defining pointless ioctls for MC-based
devices, instead of making it more complex ?

> @@ -2678,10 +2729,8 @@ DEFINE_V4L_STUB_FUNC(expbuf)
>  DEFINE_V4L_STUB_FUNC(g_std)
>  DEFINE_V4L_STUB_FUNC(g_audio)
>  DEFINE_V4L_STUB_FUNC(s_audio)
> -DEFINE_V4L_STUB_FUNC(g_input)
>  DEFINE_V4L_STUB_FUNC(g_edid)
>  DEFINE_V4L_STUB_FUNC(s_edid)
> -DEFINE_V4L_STUB_FUNC(g_output)
>  DEFINE_V4L_STUB_FUNC(g_audout)
>  DEFINE_V4L_STUB_FUNC(s_audout)
>  DEFINE_V4L_STUB_FUNC(g_jpegcomp)
> @@ -2730,11 +2779,11 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
>  	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
> -	IOCTL_INFO(VIDIOC_G_INPUT, v4l_stub_g_input, v4l_print_u32, 0),
> +	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
>  	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
>  	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
> -	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_stub_g_output, v4l_print_u32, 0),
> +	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
>  	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_ENUMOUTPUT, v4l_enumoutput, v4l_print_enumoutput, INFO_FL_CLEAR(v4l2_output, index)),
>  	IOCTL_INFO(VIDIOC_G_AUDOUT, v4l_stub_g_audout, v4l_print_audioout, 0),
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index f48e47e230c3ef35..872564ba88155599 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -487,6 +487,8 @@ struct v4l2_capability {
>  
>  #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
>  
> +#define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
> +
>  #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
>  
>  /*

-- 
Regards,

Laurent Pinchart
