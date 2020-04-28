Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3351BCE9E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 23:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgD1V0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 17:26:50 -0400
Received: from mga02.intel.com ([134.134.136.20]:11462 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbgD1V0u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 17:26:50 -0400
IronPort-SDR: QFvMjC4eApdarImbMPsOKTQuxPI8TbBC//+CWASrlORt41Z+uyLrCZecdXqK6+CESBI/LxCpu/
 PGRqlD09RpLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 14:26:49 -0700
IronPort-SDR: UgXjeyV15rceUG43acMoWxi3jf1Eun8z9T92+mxmbXwzjmU3znEXJKrQ0wg/CbUmvPHagYo9nb
 D2nal31YLXMw==
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; 
   d="scan'208";a="249282168"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 14:26:47 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E84F0202F2; Wed, 29 Apr 2020 00:26:43 +0300 (EEST)
Date:   Wed, 29 Apr 2020 00:26:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 4/6] media: v4l2-subdev: Assume V4L2_SUBDEV_API is
 selected
Message-ID: <20200428212643.GB5381@paasikivi.fi.intel.com>
References: <20200428210609.6793-1-jacopo@jmondi.org>
 <20200428210609.6793-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428210609.6793-5-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Apr 28, 2020 at 11:06:07PM +0200, Jacopo Mondi wrote:
> A sub-device device node can be registered in user space only if the
> CONFIG_V4L2_SUBDEV_API Kconfig option is selected.
> 
> Remove checks from the v4l2-subdev file handle open/close functions and
> ioctl handler as they are only accessible if a device node was registered
> to user space in first place.

Is there other motivation with this than clean up things a little?

The change increases the binary size marginally if the Kconfig option is
disabled.

> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1dc263c2ca0a..f3fe515b8ccb 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -24,22 +24,19 @@
>  
>  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  {
> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	if (sd->entity.num_pads) {
>  		fh->pad = v4l2_subdev_alloc_pad_config(sd);
>  		if (fh->pad == NULL)
>  			return -ENOMEM;
>  	}
> -#endif
> +
>  	return 0;
>  }
>  
>  static void subdev_fh_free(struct v4l2_subdev_fh *fh)
>  {
> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	v4l2_subdev_free_pad_config(fh->pad);
>  	fh->pad = NULL;
> -#endif
>  }
>  
>  static int subdev_open(struct file *file)
> @@ -329,10 +326,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  	struct video_device *vdev = video_devdata(file);
>  	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
>  	struct v4l2_fh *vfh = file->private_data;
> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
> -#endif
>  	int rval;
>  
>  	switch (cmd) {
> @@ -466,7 +461,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		return ret;
>  	}
>  
> -#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	case VIDIOC_SUBDEV_G_FMT: {
>  		struct v4l2_subdev_format *format = arg;
>  
> @@ -646,7 +640,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  	case VIDIOC_SUBDEV_QUERYSTD:
>  		return v4l2_subdev_call(sd, video, querystd, arg);
> -#endif
> +
>  	default:
>  		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
>  	}
> -- 
> 2.26.1
> 

-- 
Sakari Ailus
