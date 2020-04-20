Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E21F1B0E5D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 16:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgDTO3v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 10:29:51 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:41717 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726398AbgDTO3u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 10:29:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QXQcj1rFA7xncQXQgjHkBT; Mon, 20 Apr 2020 16:29:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587392987; bh=Kga8ROrOSxgTcuk9rK0fgyjTnbqAqyy/Fkq+RXaM0cI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e6zfXkZrtFTqJW+BQhnTt2dLDqL6jinTaBQqef52tM9rWg+iWe2Ez5NuWG5mYY80U
         Upn7aBq6anJC8PFTaHJzZVRLyVPvFKMFzzhPs061JN2+/4AKRH8oAug+B2FCuWZ/nD
         bpqQQgkwc07r3XlJwG9prHDNa2RAQGkywoZJW2EXfw1r8p7in2hF6+xnt5QVW6+Md3
         GwRi23qqjoTUlaR0sDVLC9sBXrjESrgFJh9eu1DhDUObBMUbhvY/+zKbY5DqfSQ6L/
         oNvlbt0fH0LlcdgZHo/p+MTMLA9l1Kqnp1dpty9tZK3lIPqdUlZgnQK9Bkf/vb73hW
         eQ/Duel90ex3g==
Subject: Re: [PATCH v7 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
 <20200413202351.1359754-4-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7fa8a42b-7902-1c6e-a9a0-c3a2f814905b@xs4all.nl>
Date:   Mon, 20 Apr 2020 16:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200413202351.1359754-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBLwLnlBvPrT5/mwGLvUkKftNcAZUEj5AkkYnD5Qcciwnf7ehakzQN0R6vmsFu3PtqBm60Mow97WUQzNcKwrzZWLYKbukgdrl3CC6KPnZO6x1EzQPL/2
 Nh3SInDzArc51n92KGh32jxxCl7+34bnuPxw912QM6NoL7Jku9HKb1MPxYdCghTzB8KB0Z+WyCsBNjBCmES/wSKURwOs0B76qasz4CqSNevMQ/xS8vKlxvaX
 SwHF4eSccOoUUDssByDd3wY1aaEDLgXBgXTulRUYY0TA5svkxKiMLJ5gjMmbcbbAT9pMlnRUGH0MbrK8oNdraEUuya0Iq2bQIPgf/6nggWD5xNlo68TymZ5l
 65VPL8IXOKciC2pQqGsoX26Cm+WPXuHopB+BCZWRGWLn2/zakjhb3CaLaleL7ULtQSx03y1w
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/04/2020 22:23, Niklas Söderlund wrote:
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

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../media/uapi/v4l/vidioc-enum-fmt.rst          | 17 ++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c            | 13 +++++++++++--
>  include/uapi/linux/videodev2.h                  |  3 ++-
>  3 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 8ca6ab701e4ab99c..82792d8e910b2313 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -48,10 +48,21 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
>  formats in preference order, where preferred formats are returned before
>  (that is, with lower ``index`` value) less-preferred formats.
>  
> -.. note::
> +If the driver doesn't advertise the ``V4L2_CAP_IO_MC``
> +:ref:`device-capabilities <capability>`, applications shall initialize the
> +``mbus_code`` field to zero. Drivers shall enumerate all image formats supported
> +by the device. The enumerated formats may depend on the active input or output
> +of the device.
>  
> -   After switching input or output the list of enumerated image
> -   formats may be different.
> +If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`device-capabilities
> +<capability>`, applications may initialize the ``mbus_code`` to a valid
> +:ref:`v4l2_mbus_pixelcode <media bus format code>`. If the ``mbus_code` field
> +is not zero, drivers shall restrict enumeration to only the image formats that
> +can produce (for video output devices) or be produced from (for video capture
> +devices) that media bus code. Regardless of the value of the ``mbus_code``
> +field, the enumerated image formats shall not depend on the active
> +configuration of the video device or device pipeline. Enumeration shall
> +otherwise operate as previously described.
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

