Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA20C1B321E
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 23:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgDUVuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 17:50:03 -0400
Received: from mga09.intel.com ([134.134.136.24]:42879 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726079AbgDUVuD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 17:50:03 -0400
IronPort-SDR: eBhV8ye255mPZRr6jgDGJGSILVaNHscIz37C79CCp0L4vOXdYLbFXu+IhP7XqdVGUNzGe4NYft
 mHEdH/TL0VfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 14:50:02 -0700
IronPort-SDR: z1UETDf5I2yEaDNWyhkFj4ZOg0jbAul3v7gyMa3Dg4yr7Re6po1veZEvaJrbFd8psSPyr5IlzY
 uJCEP6NmOnag==
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; 
   d="scan'208";a="402325444"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 14:50:00 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A11AF204D0; Wed, 22 Apr 2020 00:49:58 +0300 (EEST)
Date:   Wed, 22 Apr 2020 00:49:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v4 4/5] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
Message-ID: <20200421214958.GD5381@paasikivi.fi.intel.com>
References: <20200418103216.140572-1-jacopo@jmondi.org>
 <20200418103216.140572-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200418103216.140572-5-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the patch.

On Sat, Apr 18, 2020 at 12:32:15PM +0200, Jacopo Mondi wrote:
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
>  include/uapi/linux/v4l2-subdev.h      | 15 +++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1dc263c2ca0a..ca0aa54429c5 100644
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
> @@ -336,6 +337,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	int rval;
>  
>  	switch (cmd) {
> +	case VIDIOC_SUBDEV_QUERYCAP: {
> +		struct v4l2_subdev_capability *cap = arg;
> +
> +		memset(cap, 0, sizeof(*cap));
> +		cap->version = LINUX_VERSION_CODE;
> +		cap->subdev_caps |= ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV
> +					      : V4L2_SUBDEV_CAP_RW_SUBDEV;
> +
> +		return 0;
> +	}
> +
>  	case VIDIOC_QUERYCTRL:
>  		/*
>  		 * TODO: this really should be folded into v4l2_queryctrl (this
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 03970ce30741..0886f88be193 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -155,9 +155,24 @@ struct v4l2_subdev_selection {
>  	__u32 reserved[8];
>  };
>  
> +/**
> + * struct v4l2_subdev_capability - subdev capabilities
> + * @device_caps: the subdev capabilities, see V4L2_SUBDEV_CAP_*.
> + */
> +struct v4l2_subdev_capability {
> +	__u32 version;
> +	__u32 subdev_caps;

No reserved fields? Is the intent to extend this later on based on the size
of the IOCTL argument?

> +};
> +
> +/* The v4l2 sub-device video device node is registered in read-only mode. */
> +#define V4L2_SUBDEV_CAP_RO_SUBDEV		(1 << 0)

1U << 0

> +/* The v4l2 sub-device video device node is registered in read/write mode. */
> +#define V4L2_SUBDEV_CAP_RW_SUBDEV		(1 << 1)

1U << 1

> +
>  /* Backwards compatibility define --- to be removed */
>  #define v4l2_subdev_edid v4l2_edid
>  
> +#define VIDIOC_SUBDEV_QUERYCAP			_IOR('V',  0, struct v4l2_subdev_capability)
>  #define VIDIOC_SUBDEV_G_FMT			_IOWR('V',  4, struct v4l2_subdev_format)
>  #define VIDIOC_SUBDEV_S_FMT			_IOWR('V',  5, struct v4l2_subdev_format)
>  #define VIDIOC_SUBDEV_G_FRAME_INTERVAL		_IOWR('V', 21, struct v4l2_subdev_frame_interval)

-- 
Regards,

Sakari Ailus
