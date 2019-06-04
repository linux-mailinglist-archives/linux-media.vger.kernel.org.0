Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C6733F78
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 09:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfFDHDD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 03:03:03 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:43907 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726663AbfFDHDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 03:03:03 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y3TEhQWbUsDWyY3TIhvIjD; Tue, 04 Jun 2019 09:03:00 +0200
Subject: Re: [PATCH v5 2/2] media: v4l2: Get rid of
 ->vidioc_enum_fmt_vid_{cap,out}_mplane
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20190603135850.7689-1-boris.brezillon@collabora.com>
 <20190603135850.7689-2-boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <71e2f8b2-db8e-68da-f627-86b22e5a0d39@xs4all.nl>
Date:   Tue, 4 Jun 2019 09:02:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603135850.7689-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNg7Kb4Vmw5jWxMZgtBUx4EfLtagZgarI/cJcKIWwpMuBNM6ZQoHVR5bzEyvjHhF9cCrhISiAEVL1ojq3dR/3avlkbLXFYMYw7aR5S3RTFXCY21hpYTQ
 ENhNcoX4HzyoZ+zdLkt/K88yE1PDZnJnTLk+3/eJ7oZtB0uxz/Er8fOekTiDzRnowZ8kxDVYr4bE6ly537FpdJs769W5IKwRJbPJJKvqU4GWqvlHLU0crDt2
 /iTxXxDxfBxbvM/BVO1sEwtswFCGyWMFWP+M9s2nkQ779zfhzIKmxLX5a8C9Re4yAQuzbhedKkKIjN8xjmRrQxeLD0zu4C/kWu+kPjbwV4rKkGd4q0QrNf6e
 XPKoU6BQwaSBdrg3DzPjjRe3sZEH4T9H5R1qmS9IzMp42ml4s0GbClXmfwHkVstBvG8rVPUaQGJlVAkadQEN1bdYtY57HK8HD0YaIoIUys9qhKtVccj7+2c2
 /1b5osFKvxasfwzdbIbEDtdUbQWsjhH7JCAF3QwTVtkTknvD6yE6NJqhezE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/3/19 3:58 PM, Boris Brezillon wrote:
> Support for multiplanar and singleplanar formats is mutually exclusive,
> at least in practice. In our attempt to unify support for support for
> mplane and !mplane in v4l, let's get rid of the
> ->vidioc_enum_fmt_{vid,out}_cap_mplane() hooks and call
> ->vidioc_enum_fmt_{vid,out}_cap() instead.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v5:
> - None
> 
> Changes in v4:
> - None
> 
> Changes in v3:
> - Send this patch separately (was previously part of the EXT_BUF/FMT
>   rework)
> 
> Changes in v2:
> - None
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  2 +-
>  drivers/media/platform/exynos-gsc/gsc-core.c  |  2 +-
>  drivers/media/platform/exynos-gsc/gsc-core.h  |  2 +-
>  drivers/media/platform/exynos-gsc/gsc-m2m.c   | 10 ++++-----
>  .../media/platform/exynos4-is/fimc-capture.c  |  6 +++---
>  .../platform/exynos4-is/fimc-isp-video.c      |  6 +++---
>  drivers/media/platform/exynos4-is/fimc-lite.c |  6 +++---
>  drivers/media/platform/exynos4-is/fimc-m2m.c  |  8 +++----
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  4 ++--
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  | 18 ++++++++--------
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 12 +++++------
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 12 +++++------
>  .../media/platform/qcom/camss/camss-video.c   |  2 +-
>  drivers/media/platform/qcom/venus/vdec.c      |  4 ++--
>  drivers/media/platform/qcom/venus/venc.c      |  4 ++--
>  drivers/media/platform/rcar_fdp1.c            |  4 ++--
>  drivers/media/platform/rcar_jpu.c             |  4 ++--
>  drivers/media/platform/renesas-ceu.c          |  2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  | 12 +++++------
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  | 12 +++++------
>  drivers/media/platform/ti-vpe/vpe.c           |  4 ++--
>  drivers/media/platform/vicodec/vicodec-core.c |  2 --
>  drivers/media/platform/vivid/vivid-core.c     |  6 ++----
>  .../media/platform/vivid/vivid-vid-common.c   | 20 ------------------
>  .../media/platform/vivid/vivid-vid-common.h   |  2 --
>  drivers/media/v4l2-core/v4l2-dev.c            |  2 --
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 21 ++++++++++---------
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |  4 ++--
>  .../media/rockchip/vpu/rockchip_vpu_v4l2.c    | 12 +++++------
>  include/media/v4l2-ioctl.h                    | 14 ++-----------
>  30 files changed, 91 insertions(+), 128 deletions(-)
> 

<snip>

> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0fbee3caef5d..3768eb012cef 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1382,6 +1382,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> +	struct video_device *vdev = video_devdata(file);
>  	struct v4l2_fmtdesc *p = arg;
>  	int ret = check_fmt(file, p->type);
>  
> @@ -1391,30 +1392,30 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  
>  	switch (p->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
> +		    p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +			break;
> +
>  		if (unlikely(!ops->vidioc_enum_fmt_vid_cap))
>  			break;
>  		ret = ops->vidioc_enum_fmt_vid_cap(file, fh, arg);
>  		break;
> -	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (unlikely(!ops->vidioc_enum_fmt_vid_cap_mplane))
> -			break;
> -		ret = ops->vidioc_enum_fmt_vid_cap_mplane(file, fh, arg);
> -		break;

We got kbuild test robot complaints about this. The new check is a bit
complicated, and I propose we do this instead:

 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
		if (!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) &&
		    ops->vidioc_enum_fmt_vid_cap)
 			ret = ops->vidioc_enum_fmt_vid_cap(file, fh, arg);
 		break;
	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
		if ((vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) &&
		    ops->vidioc_enum_fmt_vid_cap)
 			ret = ops->vidioc_enum_fmt_vid_cap(file, fh, arg);
 		break;


>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>  		if (unlikely(!ops->vidioc_enum_fmt_vid_overlay))
>  			break;
>  		ret = ops->vidioc_enum_fmt_vid_overlay(file, fh, arg);
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
> +		    p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +			break;
> +
>  		if (unlikely(!ops->vidioc_enum_fmt_vid_out))
>  			break;
>  		ret = ops->vidioc_enum_fmt_vid_out(file, fh, arg);
>  		break;

And the same here, of course.

Regards,

	Hans

> -	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (unlikely(!ops->vidioc_enum_fmt_vid_out_mplane))
> -			break;
> -		ret = ops->vidioc_enum_fmt_vid_out_mplane(file, fh, arg);
> -		break;
>  	case V4L2_BUF_TYPE_SDR_CAPTURE:
>  		if (unlikely(!ops->vidioc_enum_fmt_sdr_cap))
>  			break;
