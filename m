Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078461882A0
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 12:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgCQL4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 07:56:02 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:47459 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgCQL4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 07:56:02 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F073360010;
        Tue, 17 Mar 2020 11:55:58 +0000 (UTC)
Date:   Tue, 17 Mar 2020 12:58:54 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH/RFC] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200317115854.h4oh2m2kipzjhmg3@uno.localdomain>
References: <20200313152406.13347-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313152406.13347-1-laurent.pinchart@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 13, 2020 at 05:24:06PM +0200, Laurent Pinchart wrote:
> The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
> node. For MC-centric devices, its behaviour has always been ill-defined,
> with drivers implementing one of the following behaviours:
>
> - No support for VIDIOC_ENUM_FMT at all
> - Enumerating all formats supported by the video node, regardless of the
>   configuration of the pipeline
> - Enumerating formats supported by the video node for the active
>   configuration of the connected subdevice
>
> The first behaviour is obviously useless for applications. The second
> behaviour provides the most information, but doesn't offer a way to find
> what formats are compatible with a given pipeline configuration. The
> third behaviour fixes that, but with the drawback that applications
> can't enumerate all supported formats anymore, and have to modify the
> active configuration of the pipeline to enumerate formats.
>
> The situation is messy as none of the implemented behaviours are ideal,
> and userspace can't predict what will happen as the behaviour is
> driver-specific.
>
> To fix this, let's extend the VIDIOC_ENUM_FMT with a missing capability:
> enumerating pixel formats for a given media bus code. The media bus code
> is passed through the v4l2_fmtdesc structure in a new mbus_code field
> (repurposed from the reserved fields), and an additional flag is added
> to report if the driver supports this API extension. With this
> capability in place, applications can enumerate pixel formats for a
> given media bus code without modifying the active configuration of the
> device.
>
> The current behaviour of the ioctl is preserved when the new mbus_code
> field is set to 0, ensuring compatibility with existing userspace. This
> behaviour is now documented as mandatory for MC-centric devices as well
> as the traditional video node-centric devices. This allows applications
> to query MC-centric devices for all the supported pixel formats, as well
> as for the pixel formats corresponding to a given media bus code.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Hello,
>
> This API extension comes from a need I encountered when working on a
> simple pipeline handler for libcamera. The pipeline handlers we have so
> far are device-specific, and hardcode knowledge about the device drivers
> in their implementation, such as the mapping from media bus codes to
> pixel formats. For "simple" devices (currently defined as linear
> pipelines with no processing, which we will probably extend to include
> basic processing such as scaling and format conversion in the future),
> we want to have a single pipeline handler that will auto-configure the
> pipeline based on information retrieved from the kernel. I thus need an
> API to extract the mapping from media bus code to pixel format.
>
> Once Niklas patches that add V4L2_CAP_IO_MC land in master, I think this
> patch should be rebased, and specify that this API is mandatory for
> drivers that expose V4L2_CAP_IO_MC and invalid otherwise. It would be a
> good step towards correctly specifying the behaviour of video nodes for
> MC-centric devices.
>
> I will of course provide patches for v4l2-ctrl to support this
> extension, as well as for v4l2-compliance, but I would like feedback on
> the API first.
>
>  .../media/uapi/v4l/vidioc-enum-fmt.rst        | 40 +++++++++++++------
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 10 ++++-
>  include/uapi/linux/videodev2.h                |  4 +-
>  3 files changed, 38 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 8ca6ab701e4a..60cac7eef76c 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -39,19 +39,26 @@ Arguments
>  Description
>  ===========
>
> -To enumerate image formats applications initialize the ``type`` and
> -``index`` field of struct :c:type:`v4l2_fmtdesc` and call
> -the :ref:`VIDIOC_ENUM_FMT` ioctl with a pointer to this structure. Drivers
> -fill the rest of the structure or return an ``EINVAL`` error code. All
> -formats are enumerable by beginning at index zero and incrementing by
> -one until ``EINVAL`` is returned. If applicable, drivers shall return
> -formats in preference order, where preferred formats are returned before
> -(that is, with lower ``index`` value) less-preferred formats.
> -
> -.. note::
> -
> -   After switching input or output the list of enumerated image
> -   formats may be different.
> +To enumerate image formats applications initialize the ``type``, ``index`` and
> +``mbus_code`` fields of struct :c:type:`v4l2_fmtdesc` and call the
> +:ref:`VIDIOC_ENUM_FMT` ioctl with a pointer to this structure. Drivers fill the
> +rest of the structure or return an ``EINVAL`` error code. All formats are
> +enumerable by beginning at index zero and incrementing by one until ``EINVAL``
> +is returned. If applicable, drivers shall return formats in preference order,
> +where preferred formats are returned before (that is, with lower ``index``
> +value) less-preferred formats.
> +
> +If the ``mbus_code`` is set to zero, drivers shall enumerate all image formats
> +supported by the device. For video node-centric devices, the enumerated formats
> +may depend on the active input or output of the device. For MC-centric devices,
> +the enumerated formats shall not depend on the active configuration of the
> +device.

s/device/pipeline ?

> +
> +If the ``mbus_code`` field is set to a non-zero value, drivers shall restrict
> +enumeration to only the image formats that can be produced from that media bus
> +code, and set the ``V4L2_FMT_FLAG_MBUS_CODE`` flag in the ``flags`` field. The
> +enumerated imge formats shall not depend on the active configuration of the
> +device. Enumeration shall otherwise operate as previously described.

If I got this right an application can set mbus_code != 0 to a driver
non supporting restricted enumeration and receive back a list of
formats. It's up to the application to check for the V4L2_FMT_FLAG_MBUS_CODE
flag to see if enumeration is restricted or not.

This is a bit of a ping-pong that could be saved having driver
non-supporting nbus-restricted enumeration returning an error if the
mbus_code field is set. I know, this implies changing all current
drivers to check for the mbus_config field and return an error in case
they don't support it. I have not followed CAP_IO_MC closely, but I
wonder if that could help catching that situation in the core and
return an error earlier. Maybe there could be a way for drivers to
advertise support for that feature to the core and fail earlier if
mbus_code is set and they don't claim to support it ?

Thanks
   j
>
>
>  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> @@ -145,6 +152,13 @@ formats in preference order, where preferred formats are returned before
>  	parameters are detected. This flag can only be used in combination
>  	with the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to
>  	compressed formats only. It is also only applies to stateful codecs.
> +    * - ``V4L2_FMT_FLAG_MBUS_CODE``
> +      - 0x0010
> +      - The ``mbus_code`` field has been taken into account and only formats
> +        compatible with the supplied media bus code are enumerated. This flag
> +        shall only be  set by drivers, and only when ``mbus_code`` is not zero.
> +        Applications may read the flag to check if code-aware enumeration is
> +        supported by the driver.
>
>
>  Return Value
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index aaf83e254272..2d635a5f0797 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -264,12 +264,13 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
>  {
>  	const struct v4l2_fmtdesc *p = arg;
>
> -	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, description='%.*s'\n",
> +	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
>  		p->index, prt_names(p->type, v4l2_type_names),
>  		p->flags, (p->pixelformat & 0xff),
>  		(p->pixelformat >>  8) & 0xff,
>  		(p->pixelformat >> 16) & 0xff,
>  		(p->pixelformat >> 24) & 0xff,
> +		p->mbus_code,
>  		(int)sizeof(p->description), p->description);
>  }
>
> @@ -1416,12 +1417,17 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  	struct video_device *vdev = video_devdata(file);
>  	struct v4l2_fmtdesc *p = arg;
>  	int ret = check_fmt(file, p->type);
> +	u32 mbus_code;
>  	u32 cap_mask;
>
>  	if (ret)
>  		return ret;
>  	ret = -EINVAL;
>
> +	mbus_code = p->mbus_code;
> +	CLEAR_AFTER_FIELD(p, type);
> +	p->mbus_code = mbus_code;
> +
>  	switch (p->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> @@ -2703,7 +2709,7 @@ DEFINE_V4L_STUB_FUNC(dv_timings_cap)
>
>  static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
> -	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, INFO_FL_CLEAR(v4l2_fmtdesc, type)),
> +	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
>  	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
>  	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5f9357dcb060..b13e54e196e3 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -777,13 +777,15 @@ struct v4l2_fmtdesc {
>  	__u32               flags;
>  	__u8		    description[32];   /* Description string */
>  	__u32		    pixelformat;       /* Format fourcc      */
> -	__u32		    reserved[4];
> +	__u32		    mbus_code;		/* Media bus code    */
> +	__u32		    reserved[3];
>  };
>
>  #define V4L2_FMT_FLAG_COMPRESSED		0x0001
>  #define V4L2_FMT_FLAG_EMULATED			0x0002
>  #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
>  #define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
> +#define V4L2_FMT_FLAG_MBUS_CODE			0x0010
>
>  	/* Frame Size and frame rate enumeration */
>  /*
> --
> Regards,
>
> Laurent Pinchart
>
