Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6733C1B5961
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 12:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgDWKi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 06:38:56 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54751 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725863AbgDWKi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 06:38:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RZFpjLqYo7xncRZFsjQFiG; Thu, 23 Apr 2020 12:38:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587638332; bh=navaRimnR9rBBLMvcpN4leBA30lNa0An4ygk0CtmV/0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PpRYDB6RVjq2iTVzbveDXCT6eqBe0JfrvbdboOXZsNs8HBsc72QLRuxg+SBCFkZiE
         ELSJsh+UHBmayDvi1O7lNi7FUjc1Lh/eBa4754rCz/P0ra7Lq1FQ4rWEOdP2+UY8Po
         zWNx6VrYUpt0CDevrFvx/Pe52z+178gyggegjeL2nLPIP8LMVfxmJl/agZ/Qp2qdvd
         cLb7nsWCBhtgYLSc5hZY+d7RLGcJqECLXNDI4lcW1dH2gLrbGMBMcpW1vamDXi7G5y
         JpVlkw88BgSyWj0ocAzIdWI9Kq2uYDJrjay5iVaMgQ9/zGgXqtdpYIcH9amGdPKxf/
         pKWuweMzlK2Lw==
Subject: Re: [PATCH v8 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
 <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d234f2bf-9bda-e073-ad6f-392f6b5d0cdd@xs4all.nl>
Date:   Thu, 23 Apr 2020 12:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMGnnR36/4hbHS3twyWytg1zEw87eBVLsZKY4jChSxByy1KwPILv+oPSg2mEw4fChuhsoe69auEV8IgDne4ZX1ORWnm2PpIvHv8uPHpzd0SKAHHzMTIn
 idyqtUTsSlp9hOndFVu9A5aLEt4IGI+Nc/Z6rhgMtDI+yKVjEKz3RRPZ73FKvTTzFsHS96nP+kdfw8hlPyQiZB3rtYZVcek6Yh1A+O37MOlR3GrhDug0nHxT
 BLqSxEmNOO4Y0OKZUXNFGIpedoizTouAHDc55xd5hII0mumjjoHNpIWQy7ii/ydoV63WYqKlvtTwPaJTmGj2oG+5Uwjupx+SrU2hbEz1y5yaiC+o4QfLp6WN
 mcVfyJAN6DKfoyYEOGzd2ZT5rKg+ASXMyS9LdZkvWSmv/7o2mB1LP+q3abB9tDGjLvDviE+gem2PZkJBLAOyAQ2UX66gGg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2020 15:57, Niklas Söderlund wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
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
> (repurposed from the reserved fields). With this capability in place,
> applications can enumerate pixel formats for a given media bus code
> without modifying the active configuration of the device.
> 
> The current behaviour of the ioctl is preserved when the new mbus_code
> field is set to 0, ensuring compatibility with existing userspace. The
> API extension is documented as mandatory for MC-centric devices (as
> advertised through the V4L2_CAP_IO_MC capability), allowing applications
> and compliance tools to easily determine the availability of the
> VIDIOC_ENUM_FMT extension.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v7
> - Update documentation.
> ---
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 16 +++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c             | 13 +++++++++++--
>  include/uapi/linux/videodev2.h                   |  3 ++-
>  3 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 7e3142e11d77d9c0..8dc8a73c320dda98 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -48,10 +48,20 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
>  formats in preference order, where preferred formats are returned before
>  (that is, with lower ``index`` value) less-preferred formats.
>  
> -.. note::
> +If the driver doesn't advertise the ``V4L2_CAP_IO_MC``
> +:ref:`device-capabilities <capability>`, applications shall initialize the

That's :ref:`capability <device-capabilities>`

> +``mbus_code`` field to zero. Drivers shall enumerate all image formats. The
> +enumerated formats may depend on the active input or output of the device.
>  
> -   After switching input or output the list of enumerated image
> -   formats may be different.
> +If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`device-capabilities
> +<capability>`, applications may initialize the ``mbus_code`` to a valid

Ditto.

> +:ref:`v4l2_mbus_pixelcode <media bus format code>`. If the ``mbus_code` field

:ref:`media bus format code <v4l2-mbus-pixelcode>`

``mbus_code` -> ``mbus_code``

> +is not zero, drivers shall restrict enumeration to only the image formats that
> +can produce (for video output devices) or be produced from (for video capture
> +devices) that media bus code. Regardless of the value of the ``mbus_code``
> +field, the enumerated image formats shall not depend on the active
> +configuration of the video device or device pipeline. Enumeration shall
> +otherwise operate as previously described.

The new field isn't documented, vidioc-enum-fmt.rst still shows 'reserved[4]' in
the struct v4l2_fmtdesc description.

>  
>  
>  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index afd1f427df557f71..3e7b99fa415222c6 100644
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
> @@ -1472,12 +1473,20 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
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
> +	if (p->mbus_code && !(vdev->device_caps & V4L2_CAP_IO_MC))
> +		return -EINVAL;

I suggest changing this to:

	if (!(vdev->device_caps & V4L2_CAP_IO_MC))
		p->mbus_code = 0;

This is much more robust for existing userspace since they may not have
properly zeroed the reserved array. Also, mbus_code only makes sense in
combination with CAP_IO_MC, so zeroing it if CAP_IO_MC isn't set makes sense.

The documentation probably needs to be updated to reflect this change as well.

I'll post a patch for v4l2-compliance as well.

Regards,

	Hans

> +
> +	mbus_code = p->mbus_code;
> +	CLEAR_AFTER_FIELD(p, type);
> +	p->mbus_code = mbus_code;
> +
>  	switch (p->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> @@ -2757,7 +2766,7 @@ DEFINE_V4L_STUB_FUNC(dv_timings_cap)
>  
>  static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
> -	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, INFO_FL_CLEAR(v4l2_fmtdesc, type)),
> +	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
>  	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
>  	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index b18f3f7cde31c2e4..c3a1cf1c507f5506 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -784,7 +784,8 @@ struct v4l2_fmtdesc {
>  	__u32               flags;
>  	__u8		    description[32];   /* Description string */
>  	__u32		    pixelformat;       /* Format fourcc      */
> -	__u32		    reserved[4];
> +	__u32		    mbus_code;		/* Media bus code    */
> +	__u32		    reserved[3];
>  };
>  
>  #define V4L2_FMT_FLAG_COMPRESSED		0x0001
> 

