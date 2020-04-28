Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89841BCEA2
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 23:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgD1V3E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 17:29:04 -0400
Received: from mga04.intel.com ([192.55.52.120]:54860 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbgD1V3E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 17:29:04 -0400
IronPort-SDR: qyV8W6PikB6hW2VrMwcl0EHRKlWf9p2eo9blRE4Cdd0u5pqQY6Hf4QEmyrItGs1D/KLyAdJfjl
 nBxA1DdSxOnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 14:29:02 -0700
IronPort-SDR: 8XwNGzG4p4tPap+LZoX1aq4HwHDwJQwL5IaKrPDDtvl3r7Dhx2xKTHg1fDNd37ao2+CS9lNWWX
 uniW+xiYx5iQ==
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; 
   d="scan'208";a="367621732"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 14:29:00 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E87C9202F2; Wed, 29 Apr 2020 00:28:58 +0300 (EEST)
Date:   Wed, 29 Apr 2020 00:28:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v5 5/6] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
Message-ID: <20200428212858.GC5381@paasikivi.fi.intel.com>
References: <20200428210609.6793-1-jacopo@jmondi.org>
 <20200428210609.6793-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428210609.6793-6-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Apr 28, 2020 at 11:06:08PM +0200, Jacopo Mondi wrote:
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
> index f3fe515b8ccb..b8c0071aa4d0 100644
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
> @@ -331,6 +332,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
> index 03970ce30741..89dc8f2ba6b3 100644
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

How do you intend to address additional fields being added to the struct in
the future? Something else than what's been done in V4L2 traditionally?

> +};
> +
> +/* The v4l2 sub-device video device node is registered in read-only mode. */
> +#define V4L2_SUBDEV_CAP_RO_SUBDEV		BIT(0)
> +/* The v4l2 sub-device video device node is registered in read/write mode. */
> +#define V4L2_SUBDEV_CAP_RW_SUBDEV		BIT(1)
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
