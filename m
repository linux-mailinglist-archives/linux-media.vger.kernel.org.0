Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74B691390D0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 13:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgAMMJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 07:09:07 -0500
Received: from mga12.intel.com ([192.55.52.136]:32748 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbgAMMJH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 07:09:07 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 04:09:06 -0800
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; 
   d="scan'208";a="224881900"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 04:09:04 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E526A20AF3; Mon, 13 Jan 2020 14:09:02 +0200 (EET)
Date:   Mon, 13 Jan 2020 14:09:02 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/5] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Message-ID: <20200113120902.GF5440@paasikivi.fi.intel.com>
References: <20200112232458.2844506-1-niklas.soderlund+renesas@ragnatech.se>
 <20200112232458.2844506-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200112232458.2844506-2-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hejssan!

Tack för lappan!

On Mon, Jan 13, 2020 at 12:24:54AM +0100, Niklas Söderlund wrote:
> Add a video device capability flag to indicate that its inputs and/or
> outputs are controlled by the Media Controller instead of the V4L2 API.
> When this flag is set, ioctl for enum inputs and outputs are
> automatically enabled and programmed to call a helper function.
> 
> As a bonus fallback default handlers for VIDIOC_{G,S}_{INPUT,OUTPUT} are
> provided which can be used by drivers who only provide one input/output.
> Such drivers need just not declare vidioc_{g,s}_{input,output} in its
> struct v4l2_ioctl_ops and v4l2 will fallback to the single input/output
> defaults.
> 
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Merged the two patches touching V4L2 core stuff to a single patch.
> - Updated documentation for V4L2_CAP_IO_MC
> - Added is_io_mc bool in determine_valid_ioctls()
> - Folded or moved code closer to where it's used
> - Remove unneeded memset()
> - Use strscpy() instead of strlcpy()
> ---
>  .../media/uapi/v4l/vidioc-querycap.rst        |  5 ++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/v4l2-core/v4l2-dev.c            | 19 +++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 69 +++++++++++++++++--
>  include/uapi/linux/videodev2.h                |  2 +
>  5 files changed, 86 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-querycap.rst b/Documentation/media/uapi/v4l/vidioc-querycap.rst
> index 5f9930195d624c73..da17e0e3c6f9a571 100644
> --- a/Documentation/media/uapi/v4l/vidioc-querycap.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-querycap.rst
> @@ -264,6 +264,11 @@ specification the ioctl returns an ``EINVAL`` error code.
>      * - ``V4L2_CAP_TOUCH``
>        - 0x10000000
>        - This is a touch device.
> +    * - ``V4L2_CAP_IO_MC``
> +      - 0x20000000
> +      - There is only one input and/or output seen from userspace. Which I/O
> +        entity is routed to the input/output is controlled by the Media
> +        Controller. See :ref:`media_controller`.

I feel we should think of the MC flag in a bit wider context of device
profiles. They've been suggested but I don't think anyone has implemented
any code to support them.

Valid formats, for instance, also are determined by the format
configuration on the MC pipeline in this case.

I wonder if the MC input type (as below) would address this bit, without
going to the device profiles yet?

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
> index da42d172714adcb5..3c1a1200aa1fa9f3 100644
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
> @@ -725,22 +726,28 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
>  		if (is_rx) {
>  			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
> -			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
> -			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
> -			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
> +			set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
> +			set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDIO, vidioc_g_audio);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
>  			SET_VALID_IOCTL(ops, VIDIOC_QUERY_DV_TIMINGS, vidioc_query_dv_timings);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
> +			if (is_io_mc)
> +				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
> +			else
> +				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
>  		}
>  		if (is_tx) {
> -			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
> -			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
> -			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
> +			set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
> +			set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
> +			if (is_io_mc)
> +				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
> +			else
> +				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
>  		}
>  		if (ops->vidioc_g_parm || ops->vidioc_g_std)
>  			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index aaf83e25427288fd..e8e15deeb8f36a9d 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1085,6 +1085,28 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>  	return ret;
>  }
>  
> +static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
> +		       struct file *file, void *fh, void *arg)
> +{
> +	if (!ops->vidioc_g_input) {
> +		*(unsigned int *)arg = 0;
> +		return 0;
> +	}
> +
> +	return ops->vidioc_g_input(file, fh, arg);
> +}
> +
> +static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
> +		       struct file *file, void *fh, void *arg)
> +{
> +	if (!ops->vidioc_g_output) {
> +		*(unsigned int *)arg = 0;
> +		return 0;
> +	}
> +
> +	return ops->vidioc_g_output(file, fh, arg);
> +}
> +
>  static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1094,12 +1116,19 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
>  	ret = v4l_enable_media_source(vfd);
>  	if (ret)
>  		return ret;
> +
> +	if (!ops->vidioc_s_input)
> +		return  *(unsigned int *)arg ? -EINVAL : 0;
> +
>  	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
>  }
>  
>  static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> +	if (!ops->vidioc_s_output)
> +		return  *(unsigned int *)arg ? -EINVAL : 0;
> +
>  	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
>  }
>  
> @@ -1128,6 +1157,20 @@ static int v4l_s_priority(const struct v4l2_ioctl_ops *ops,
>  	return v4l2_prio_change(vfd->prio, &vfh->prio, *p);
>  }
>  
> +static int v4l2_ioctl_enum_input_mc(struct file *file, void *priv,
> +				    struct v4l2_input *i)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +
> +	if (i->index)
> +		return -EINVAL;
> +
> +	strscpy(i->name, vfd->name, sizeof(i->name));
> +	i->type = V4L2_INPUT_TYPE_CAMERA;

Doesn't this deserve its own input type? Say, V4L2_INPUT_TYPE_MC, for
instance?

Most MC-enabled drivers are related to cameras but you can attach e.g. a TV
tuner to at least some of them. The API is really not about cameras as such
either.

> +
> +	return 0;
> +}
> +
>  static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1143,9 +1186,26 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
>  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
>  		p->capabilities |= V4L2_IN_CAP_STD;
>  
> +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> +		return v4l2_ioctl_enum_input_mc(file, fh, p);
> +
>  	return ops->vidioc_enum_input(file, fh, p);
>  }
>  
> +static int v4l2_ioctl_enum_output_mc(struct file *file, void *priv,
> +				     struct v4l2_output *o)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +
> +	if (o->index)
> +		return -EINVAL;
> +
> +	strscpy(o->name, vfd->name, sizeof(o->name));
> +	o->type = V4L2_OUTPUT_TYPE_ANALOG;
> +
> +	return 0;
> +}
> +
>  static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1161,6 +1221,9 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
>  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
>  		p->capabilities |= V4L2_OUT_CAP_STD;
>  
> +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> +		return v4l2_ioctl_enum_output_mc(file, fh, p);
> +
>  	return ops->vidioc_enum_output(file, fh, p);
>  }
>  
> @@ -2678,10 +2741,8 @@ DEFINE_V4L_STUB_FUNC(expbuf)
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
> @@ -2730,11 +2791,11 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
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
> index 5f9357dcb0602126..c793263a37052856 100644
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
Kind regards,

Sakari Ailus
