Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B4D1C9092
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 16:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgEGOrF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 10:47:05 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:47835 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726218AbgEGOrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 10:47:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WhnfjvQNU8hmdWhnijFrvc; Thu, 07 May 2020 16:47:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588862822; bh=xhbR5zjpUF3DY1TQnuMQP3VjlnOa3Vl/AUt6VyxHOsc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eErFTK8iJPfhRwLylknY9wjwaecw57F5avixznyw0+TrY+GQI+0WIUvftiGOTkj81
         Vi/nW0q8qHXdv5nzOe90OxjYPmxtbBu8BBuxfxH4qQtZvSerpvG3wc/a+qzAeob3LS
         K00njXTDwqA4voxKqKa9mm7+TcW15zi1TicErR3ISbVayS41zsm/EqmnBHTdc4KFmK
         59tuQ/cdTW39CzJub9c75PxiWlTHmIq74DiUp01s1GJCBaSmp1hc5eJK+yS+1xZYqG
         E87ahiP7hJT6JmhOxthcocwoAS0rA1B7k/a879FzvN4X/SbKLoCgYxNTXDhgMTHh+S
         a0a5I+SVmrkXg==
Subject: Re: [PATCH v6 5/6] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
References: <20200507143537.2945672-1-jacopo@jmondi.org>
 <20200507143537.2945672-6-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5cd4a741-68af-9276-a822-f478385188d2@xs4all.nl>
Date:   Thu, 7 May 2020 16:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200507143537.2945672-6-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEgTwCEM8NCcQbqDfPCC9ay4SeJNlmXsWgOsIqo8GfX5r+JhMtvVxbJX/Qrjb19FImg9c+u7/XBQhWnZDLoVJr0HXxM8zsEQ1XU8fPABK/xTEVOCJAv3
 MBQcNtN05KoVXKB/J7gx0xWQLfFXlGTb3D2ccgVTPzJFlAJ9OGi4RUTdcwOQN+FNhJdkVOLqGwcKbN1+vqvar/152E10sPmusQGAN6Uh4QgBNfvBnXKIghsC
 sXQQq5qXmvmT3dz75xXbpQPjCslBUOZ7lUSrVBIw/0RZA3ZMDqtgD8cjZtPIOut/CvJtmUxx+1s6u6CoOGtuQp/OG+jH5evl29eh+0rZ2M0LUIaev2hv3i6S
 cqq6h7QzomcnCQx/f2HXKtxu9y2erV3psl3snyXyiBZRV0zj/RTdDcI22y0IzY/y8E73tYKy00GYtUVQVDF+GVmUNbiMtGHlqKiLGgVkLap+9l+TnrE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/05/2020 16:35, Jacopo Mondi wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> While normal video/radio/vbi/swradio nodes have a proper QUERYCAP ioctl
> that apps can call to determine that it is indeed a V4L2 device, there
> is currently no equivalent for v4l-subdev nodes. Adding this ioctl will
> solve that, and it will allow utilities like v4l2-compliance to be used
> with these devices as well.
> 
> SUBDEV_QUERYCAP currently returns the version and subdev_caps of the
> subdevice. Define as the initial set of subdev_caps the read-only or
> read/write flags, to signal to userspace which set of IOCTLs are
> available on the subdevice.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++++
>  include/uapi/linux/v4l2-subdev.h      | 18 ++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 174778f9c0bc4..6ae617a1e7e78 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -15,6 +15,7 @@
>  #include <linux/types.h>
>  #include <linux/videodev2.h>
>  #include <linux/export.h>
> +#include <linux/version.h>
> 
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -344,6 +345,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	int rval;
> 
>  	switch (cmd) {
> +	case VIDIOC_SUBDEV_QUERYCAP: {
> +		struct v4l2_subdev_capability *cap = arg;
> +
> +		memset(cap->reserved, 0, sizeof(cap->reserved));
> +		cap->version = LINUX_VERSION_CODE;
> +		cap->capabilities = ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV
> +					      : V4L2_SUBDEV_CAP_RW_SUBDEV;
> +
> +		return 0;
> +	}
> +
>  	case VIDIOC_QUERYCTRL:
>  		/*
>  		 * TODO: this really should be folded into v4l2_queryctrl (this
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 03970ce307419..29d1874cb5e95 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -155,9 +155,27 @@ struct v4l2_subdev_selection {
>  	__u32 reserved[8];
>  };
> 
> +/**
> + * struct v4l2_subdev_capability - subdev capabilities
> + * @version: the driver versioning number
> + * @capabilities: the subdev capabilities, see V4L2_SUBDEV_CAP_*
> + * @reserved: for future use, set to zero for now
> + */
> +struct v4l2_subdev_capability {
> +	__u32 version;
> +	__u32 capabilities;
> +	__u32 reserved[14];
> +};
> +
> +/* The v4l2 sub-device video device node is registered in read-only mode. */
> +#define V4L2_SUBDEV_CAP_RO_SUBDEV		BIT(0)
> +/* The v4l2 sub-device video device node is registered in read/write mode. */
> +#define V4L2_SUBDEV_CAP_RW_SUBDEV		BIT(1)

Huh? Read-write is the default, so why create a capability for that? Just drop
this cap. If bit RO_SUBDEV is set, then this is read-only, otherwise it is read-write.
Makes perfect sense.

Otherwise this series looks good, so a v7 that removes V4L2_SUBDEV_CAP_RW_SUBDEV
should be ready for a pull request.

Regards,

	Hans

> +
>  /* Backwards compatibility define --- to be removed */
>  #define v4l2_subdev_edid v4l2_edid
> 
> +#define VIDIOC_SUBDEV_QUERYCAP			_IOR('V',  0, struct v4l2_subdev_capability)
>  #define VIDIOC_SUBDEV_G_FMT			_IOWR('V',  4, struct v4l2_subdev_format)
>  #define VIDIOC_SUBDEV_S_FMT			_IOWR('V',  5, struct v4l2_subdev_format)
>  #define VIDIOC_SUBDEV_G_FRAME_INTERVAL		_IOWR('V', 21, struct v4l2_subdev_frame_interval)
> --
> 2.26.1
> 

