Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A79CAFEB8A
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 10:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfKPJta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Nov 2019 04:49:30 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53533 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726366AbfKPJta (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Nov 2019 04:49:30 -0500
Received: from [IPv6:2001:983:e9a7:1:a4e1:babe:5472:a07]
 ([IPv6:2001:983:e9a7:1:a4e1:babe:5472:a07])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VuhqiV5cyecrtVuhrisDgi; Sat, 16 Nov 2019 10:49:27 +0100
Subject: Re: [PATCH v2 4/6] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
 <20191115235559.806041-5-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e8261b94-da58-0f3e-1910-c4a7f6906fb6@xs4all.nl>
Date:   Sat, 16 Nov 2019 10:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115235559.806041-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfA6TqBWQWXC2RrFR/G2E/DLS3vj2sKz3037/o1l5eorzIgB10zW8pBGvmLJcHzZiWAkUAsjlqeyXrgyK3o48bJ89bhB6Ic8FJl5pPOkUJjGPkv7UQAzt
 PMjwqPWtgJZmD50V9j53t8Xdw/l/3UkW2zXZ+4/Jg+RD/wbdpGHXcW8DAX4j+KWE+j0auaPwby8qc6g5oH6T1kn+fOIan8UVWdU3yscUVM7HuD89qUIYulHD
 mf2DGH5vZLztKPGxjIpYHkM0bHMu9DSQodSiRJMyjuyACO78CLlFtXI/i5mbetQ7a0eeGXRBc252EswpHM1fyB4UdQTldL5TBPPoFrc6CIqzB3AVyPl0n0oS
 aWn2wZEQu4de1AH6gSmND50TrTPETcExMpOzkzmved04KgF+pvIkqzb/HrqPmZo+SBPghWyRfcRAvQ5F3QXF+lFSLMkwA029uG7xApyPF6mfdUXiyM4+Qsyl
 VVxZULk26hqSrlUvP6s0+OFt2Bc5xbVB4WtZBg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/16/19 12:55 AM, Niklas Söderlund wrote:
> Add a video device capability flag to indicate that its inputs and/or
> outputs are controlled by the Media Controller instead of the V4L2 API.
> When this flag is set, ioctl for enum inputs and outputs are
> automatically enabled and programmed to call a helper function.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../media/uapi/v4l/vidioc-querycap.rst        |  3 ++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/v4l2-core/v4l2-dev.c            | 10 ++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 36 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  2 ++
>  5 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-querycap.rst b/Documentation/media/uapi/v4l/vidioc-querycap.rst
> index 5f9930195d624c73..8b621ecb906afe96 100644
> --- a/Documentation/media/uapi/v4l/vidioc-querycap.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-querycap.rst
> @@ -264,6 +264,9 @@ specification the ioctl returns an ``EINVAL`` error code.
>      * - ``V4L2_CAP_TOUCH``
>        - 0x10000000
>        - This is a touch device.
> +    * - ``V4L2_CAP_IO_MC``
> +      - 0x20000000
> +      - The inputs and/or outputs of this device are controlled by the Media Controller see :ref:`media_controller`.

'see' should start a new sentence. So: ... Controller. See ...

I also think this needs a more detailed description. At minimum this should explain that there is only one
input and/or output as seen from userspace and it depends on the topology from/to which actual video source the
video device captures/outputs its video.

And be very precise when you are talking about inputs/outputs: are those the inputs/outputs as seen from
userspace, or the inputs/outputs to the video I/O entity?

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
> index 4293df8d664f70b3..f0f5fcaa618c7be8 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -725,7 +725,6 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
>  		if (is_rx) {
>  			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
> -			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
>  			set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
>  			set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
> @@ -733,14 +732,21 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
>  			SET_VALID_IOCTL(ops, VIDIOC_QUERY_DV_TIMINGS, vidioc_query_dv_timings);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
> +			if (vdev->device_caps & V4L2_CAP_IO_MC)

Add an is_io_mc bool at the top and use that.

> +				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
> +			else
> +				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);

Ah, now I see why you did things the way you did in patch 1.

This is confusing in this series: for once I think it is better if patches 1 and 4 are
combined in a single patch.

In any case, this means that the G/S_IN/OUTPUT ioctls should only be valid if:

- CAP_IO_MC is set
- or the vidioc_g/s_in/output op is set by the driver
- or the vidioc_enum_in/output op is set by the driver

I've been wondering: now that we know what the device caps are we can do a much
better job of validating if the driver supports the right ioctls.

We've been relying on v4l2-compliance for that, but part of the v4l2-compliance
validation can be done here instead, issuing a WARN_ON if the driver forgets to
implement something that it should have implemented.

Something for a future patch, though.

>  		}
>  		if (is_tx) {
> -			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
>  			set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
>  			set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
> +			if (vdev->device_caps & V4L2_CAP_IO_MC)
> +				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
> +			else
> +				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
>  		}
>  		if (ops->vidioc_g_parm || ops->vidioc_g_std)
>  			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 4a461de28677c5a8..a1c048c8fe6eff2f 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1085,6 +1085,36 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>  	return ret;
>  }
>  
> +static int v4l2_ioctl_enum_input_mc(struct file *file, void *priv,
> +				    struct v4l2_input *i)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +
> +	if (i->index > 0)

Just say: if (i->index)

> +		return -EINVAL;
> +
> +	memset(i, 0, sizeof(*i));

Not needed, everything after index is already zeroed.

> +	strlcpy(i->name, vfd->name, sizeof(i->name));

strscpy

> +	i->type = V4L2_INPUT_TYPE_CAMERA;
> +
> +	return 0;
> +}
> +
> +static int v4l2_ioctl_enum_output_mc(struct file *file, void *priv,
> +				     struct v4l2_output *o)
> +{
> +	struct video_device *vfd = video_devdata(file);
> +
> +	if (o->index > 0)
> +		return -EINVAL;
> +
> +	memset(o, 0, sizeof(*o));
> +	strlcpy(o->name, vfd->name, sizeof(o->name));

Same comments as for v4l2_ioctl_enum_input_mc.

> +	o->type = V4L2_OUTPUT_TYPE_ANALOG;
> +
> +	return 0;
> +}
> +
>  static int v4l2_ioctl_g_single_input(struct file *file, void *priv, unsigned int *i)
>  {
>  	*i = 0;
> @@ -1181,6 +1211,9 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
>  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
>  		p->capabilities |= V4L2_IN_CAP_STD;
>  
> +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> +		return v4l2_ioctl_enum_input_mc(file, fh, p);

I think you can incorporate the code of v4l2_ioctl_enum_input_mc
here instead of creating a separate function. It's a matter of taste, though.

> +
>  	return ops->vidioc_enum_input(file, fh, p);
>  }
>  
> @@ -1199,6 +1232,9 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
>  	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
>  		p->capabilities |= V4L2_OUT_CAP_STD;
>  
> +	if (vfd->device_caps & V4L2_CAP_IO_MC)
> +		return v4l2_ioctl_enum_output_mc(file, fh, p);

If you DO keep separate functions, then it is better to move v4l2_ioctl_enum_output_mc
to just before this function, so the two are close together.

> +
>  	return ops->vidioc_enum_output(file, fh, p);
>  }
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 04481c717fee75c4..c97b55bc19eb892a 100644
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
> 

Regards,

	Hans
