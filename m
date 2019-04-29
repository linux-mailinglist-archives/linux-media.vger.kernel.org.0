Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFAAE044
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 12:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbfD2KJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 06:09:43 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35191 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727428AbfD2KJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 06:09:42 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L3E9hKf6nb8gSL3ECh7owH; Mon, 29 Apr 2019 12:09:40 +0200
Subject: Re: [PATCH v5 06/14] media: vimc: cap: Add handler for multiplanar
 fmt ioctls
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, helen.koike@collabora.com,
        kernel@collabora.com, lucmaga@gmail.com,
        lkcamp@lists.libreplanetbr.org
References: <20190426195114.5002-1-andrealmeid@collabora.com>
 <20190426195114.5002-7-andrealmeid@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <186492ef-087f-272a-a30a-79d07a93d29d@xs4all.nl>
Date:   Mon, 29 Apr 2019 12:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190426195114.5002-7-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNT+KabqdVcFfL6/BoHj1eKKsJlsDlK8tZjtO8O9jiefwN4/u8DMe8oVRrhXuPqXnSsHIn8XmsnnxT/Eg1rG7rWj6HsECtmgrfRYKg6JmAXw1n+/hX74
 Al6kzXskaciBxwNp/aoL4NjTvTxWnE7uPUrpe+M3kNm232+YK58YdR0jbqAE68Y+LbK6KlVR2JaHanHr/ZOvRtCZAC+lpGhCvc8aB3bX1eMOgMQBqByUQxRN
 8swodkv5eIqEfNiXvsy7bxEZMelfYRodcksVHeQLJar+yP9qYfkLnLecZikfBGNog3pHPGev1y2pTmC368I2bL9rX1KCuqFGz12i5ftZYQaCaOj1zzxrR11S
 NbNkIadctEj2AeIsk28O+jEHhSMthA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/26/19 9:51 PM, André Almeida wrote:
> Add functions to handle multiplanar format ioctls, calling
> the generic format ioctls functions when possible.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
> Change in v5: none
> 
> Change in v4:
> - Split from multiplanar parameter commit
> - Use `IS_MULTIPLANAR` instead of `multiplanar`
> - Move "Functions to handle..." to commit 5
> 
> Change in v3:
> - Remove functions that only did the `IS_MULTIPLANAR(vcap)` check
> - Squash with multiplanar parameter commit
> 
> Change in v2:
> - Fix alignment
> 
>  drivers/media/platform/vimc/vimc-capture.c | 63 +++++++++++++++++++---
>  1 file changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index fa0d75eb06e8..652d3d08bc50 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -211,6 +211,44 @@ static int vimc_cap_s_fmt_vid_cap_sp(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +/*
> + * VIDIOC handlers for multi-planar formats
> + */
> +static int vimc_cap_s_fmt_vid_cap_mp(struct file *file, void *priv,
> +				     struct v4l2_format *f)
> +{
> +	struct vimc_cap_device *vcap = video_drvdata(file);
> +	int ret;
> +
> +	/* Do not change the format while stream is on */
> +	if (vb2_is_busy(&vcap->queue))
> +		return -EBUSY;
> +
> +	ret = vimc_cap_try_fmt_vid_cap_mp(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(vcap->dev, "%s: format update: "
> +		"old:%dx%d (0x%x, %d, %d, %d, %d) "
> +		"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vcap->vdev.name,
> +		/* old */
> +		vcap->format.fmt.pix_mp.width, vcap->format.fmt.pix_mp.height,
> +		vcap->format.fmt.pix_mp.pixelformat,
> +		vcap->format.fmt.pix_mp.colorspace,
> +		vcap->format.fmt.pix_mp.quantization,
> +		vcap->format.fmt.pix_mp.xfer_func,
> +		vcap->format.fmt.pix_mp.ycbcr_enc,
> +		/* new */
> +		f->fmt.pix_mp.width, f->fmt.pix_mp.height,
> +		f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.colorspace,
> +		f->fmt.pix_mp.quantization, f->fmt.pix_mp.xfer_func,
> +		f->fmt.pix_mp.ycbcr_enc);
> +
> +	vcap->format = *f;
> +
> +	return 0;
> +}
> +
>  static bool vimc_cap_is_pixfmt_supported(u32 pixelformat)
>  {
>  	unsigned int i;
> @@ -251,13 +289,9 @@ static const struct v4l2_file_operations vimc_cap_fops = {
>  	.mmap           = vb2_fop_mmap,
>  };
>  
> -static const struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
> +static struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
>  	.vidioc_querycap = vimc_cap_querycap,
>  
> -	.vidioc_g_fmt_vid_cap = vimc_cap_g_fmt_vid_cap,
> -	.vidioc_s_fmt_vid_cap = vimc_cap_s_fmt_vid_cap_sp,
> -	.vidioc_try_fmt_vid_cap = vimc_cap_try_fmt_vid_cap_sp,
> -	.vidioc_enum_fmt_vid_cap = vimc_cap_enum_fmt_vid_cap,
>  	.vidioc_enum_framesizes = vimc_cap_enum_framesizes,
>  
>  	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> @@ -455,6 +489,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>  {
>  	struct v4l2_device *v4l2_dev = master_data;
>  	struct vimc_platform_data *pdata = comp->platform_data;
> +	struct v4l2_ioctl_ops *ioctl_ops = &vimc_cap_ioctl_ops;
>  	struct vimc_cap_device *vcap;
>  	struct video_device *vdev;
>  	struct vb2_queue *q;
> @@ -527,7 +562,23 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
>  	vdev->entity.ops = &vimc_cap_mops;
>  	vdev->release = vimc_cap_release;
>  	vdev->fops = &vimc_cap_fops;
> -	vdev->ioctl_ops = &vimc_cap_ioctl_ops;
> +
> +	if (IS_MULTIPLANAR(vcap)) {
> +		ioctl_ops->vidioc_g_fmt_vid_cap_mplane = vimc_cap_g_fmt_vid_cap;
> +		ioctl_ops->vidioc_s_fmt_vid_cap_mplane =
> +						vimc_cap_s_fmt_vid_cap_mp;
> +		ioctl_ops->vidioc_try_fmt_vid_cap_mplane =
> +						vimc_cap_try_fmt_vid_cap_mp;
> +		ioctl_ops->vidioc_enum_fmt_vid_cap_mplane =
> +						vimc_cap_enum_fmt_vid_cap;
> +	} else {
> +		ioctl_ops->vidioc_g_fmt_vid_cap = vimc_cap_g_fmt_vid_cap;
> +		ioctl_ops->vidioc_s_fmt_vid_cap = vimc_cap_s_fmt_vid_cap_sp;
> +		ioctl_ops->vidioc_try_fmt_vid_cap = vimc_cap_try_fmt_vid_cap_sp;
> +		ioctl_ops->vidioc_enum_fmt_vid_cap = vimc_cap_enum_fmt_vid_cap;
> +	}

I don't really like this approach. It is good practice to keep vimc_cap_ioctl_ops
a const struct.

Instead do the same thing that vivid does: see e.g. vidioc_s_fmt_vid_cap and
vidioc_s_fmt_vid_cap_mplane in vivid-vid-cap.c.

Regards,

	Hans

> +
> +	vdev->ioctl_ops = ioctl_ops;
>  	vdev->lock = &vcap->lock;
>  	vdev->queue = q;
>  	vdev->v4l2_dev = v4l2_dev;
> 

