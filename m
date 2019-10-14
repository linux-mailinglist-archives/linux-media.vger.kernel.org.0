Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6D4D6B4E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 23:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731901AbfJNVgk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 17:36:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48596 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731408AbfJNVgk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 17:36:40 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47950324;
        Mon, 14 Oct 2019 23:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571088997;
        bh=qkA8A1P4HFXMswsTumj1GuBdA/NjXHRNHGuPmgtgCUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cNpuuRBz3nO4+oRAQMfASRp5W+bm6I6UkNB2tVXPASIuzcTwIQJLMyXh8T0/7eVqa
         d3+DUwjehfJWnniTsE3Y9Cvu3MZWpI/VuNXTaMAx8IZiezzIjP8iMzgOFmjaV3uJXF
         xIZjNIcQOf+eb3m1PcsMlWe5xI4CDyNlR+CyL5hQ=
Date:   Tue, 15 Oct 2019 00:36:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv6 1/3] v4l2-core: correctly validate video and metadata
 ioctls
Message-ID: <20191014213634.GE23442@pendragon.ideasonboard.com>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
 <20191014084021.54191-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191014084021.54191-2-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Tank you for the patch.

On Mon, Oct 14, 2019 at 10:40:19AM +0200, Hans Verkuil wrote:
> From: Vandana BN <bnvandana@gmail.com>
> 
> If the type is VFL_TYPE_GRABBER, then also check device_caps
> to see if the video device supports video and/or metadata and
> disable unneeded ioctls.
> 
> Without this change, format ioctls for both video and metadata devices
> could be called on both device nodes. This is true for other ioctls as
> well, even if the device supports only video or metadata.
> 
> Metadata devices act similar to VBI devices w.r.t. which ioctls should
> be enabled. This makes sense since VBI *is* metadata.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> Co-Developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   | 62 +++++++++++++++++-----------
>  drivers/media/v4l2-core/v4l2-ioctl.c | 16 +++++--
>  2 files changed, 52 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 4037689a945a..1bf543932e4f 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -533,13 +533,23 @@ static int get_index(struct video_device *vdev)
>   */
>  static void determine_valid_ioctls(struct video_device *vdev)
>  {
> +	const u32 vid_caps = V4L2_CAP_VIDEO_CAPTURE |
> +			     V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +			     V4L2_CAP_VIDEO_OUTPUT |
> +			     V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +			     V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE;
> +	const u32 meta_caps = V4L2_CAP_META_CAPTURE |
> +			      V4L2_CAP_META_OUTPUT;
>  	DECLARE_BITMAP(valid_ioctls, BASE_VIDIOC_PRIVATE);
>  	const struct v4l2_ioctl_ops *ops = vdev->ioctl_ops;
> -	bool is_vid = vdev->vfl_type == VFL_TYPE_GRABBER;
> +	bool is_vid = vdev->vfl_type == VFL_TYPE_GRABBER &&
> +		      (vdev->device_caps & vid_caps);
>  	bool is_vbi = vdev->vfl_type == VFL_TYPE_VBI;
>  	bool is_radio = vdev->vfl_type == VFL_TYPE_RADIO;
>  	bool is_sdr = vdev->vfl_type == VFL_TYPE_SDR;
>  	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
> +	bool is_meta = vdev->vfl_type == VFL_TYPE_GRABBER &&
> +		       (vdev->device_caps & meta_caps);
>  	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
>  
> @@ -587,39 +597,31 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
>  
>  	if (is_vid || is_tch) {
> -		/* video and metadata specific ioctls */
> +		/* video and touch specific ioctls */
>  		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
> -			       ops->vidioc_enum_fmt_vid_overlay ||
> -			       ops->vidioc_enum_fmt_meta_cap)) ||
> -		    (is_tx && (ops->vidioc_enum_fmt_vid_out ||
> -			       ops->vidioc_enum_fmt_meta_out)))
> +			       ops->vidioc_enum_fmt_vid_overlay)) ||
> +		    (is_tx && ops->vidioc_enum_fmt_vid_out))
>  			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
>  		if ((is_rx && (ops->vidioc_g_fmt_vid_cap ||
>  			       ops->vidioc_g_fmt_vid_cap_mplane ||
> -			       ops->vidioc_g_fmt_vid_overlay ||
> -			       ops->vidioc_g_fmt_meta_cap)) ||
> +			       ops->vidioc_g_fmt_vid_overlay)) ||
>  		    (is_tx && (ops->vidioc_g_fmt_vid_out ||
>  			       ops->vidioc_g_fmt_vid_out_mplane ||
> -			       ops->vidioc_g_fmt_vid_out_overlay ||
> -			       ops->vidioc_g_fmt_meta_out)))
> +			       ops->vidioc_g_fmt_vid_out_overlay)))
>  			 set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
>  		if ((is_rx && (ops->vidioc_s_fmt_vid_cap ||
>  			       ops->vidioc_s_fmt_vid_cap_mplane ||
> -			       ops->vidioc_s_fmt_vid_overlay ||
> -			       ops->vidioc_s_fmt_meta_cap)) ||
> +			       ops->vidioc_s_fmt_vid_overlay)) ||
>  		    (is_tx && (ops->vidioc_s_fmt_vid_out ||
>  			       ops->vidioc_s_fmt_vid_out_mplane ||
> -			       ops->vidioc_s_fmt_vid_out_overlay ||
> -			       ops->vidioc_s_fmt_meta_out)))
> +			       ops->vidioc_s_fmt_vid_out_overlay)))
>  			 set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
>  		if ((is_rx && (ops->vidioc_try_fmt_vid_cap ||
>  			       ops->vidioc_try_fmt_vid_cap_mplane ||
> -			       ops->vidioc_try_fmt_vid_overlay ||
> -			       ops->vidioc_try_fmt_meta_cap)) ||
> +			       ops->vidioc_try_fmt_vid_overlay)) ||
>  		    (is_tx && (ops->vidioc_try_fmt_vid_out ||
>  			       ops->vidioc_try_fmt_vid_out_mplane ||
> -			       ops->vidioc_try_fmt_vid_out_overlay ||
> -			       ops->vidioc_try_fmt_meta_out)))
> +			       ops->vidioc_try_fmt_vid_out_overlay)))
>  			 set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
>  		SET_VALID_IOCTL(ops, VIDIOC_OVERLAY, vidioc_overlay);
>  		SET_VALID_IOCTL(ops, VIDIOC_G_FBUF, vidioc_g_fbuf);
> @@ -641,7 +643,21 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			set_bit(_IOC_NR(VIDIOC_S_CROP), valid_ioctls);
>  		SET_VALID_IOCTL(ops, VIDIOC_G_SELECTION, vidioc_g_selection);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_SELECTION, vidioc_s_selection);
> -	} else if (is_vbi) {
> +	}

Here you allow for is_vid and is_meta to be both true.

> +	if (is_meta && is_rx) {
> +		/* metadata capture specific ioctls */
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_cap);
> +	} else if (is_meta && is_tx) {
> +		/* metadata output specific ioctls */
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
> +	}

And here for is_vbi to be true as well. But further down (not shown in
this patch), is_sdr is still considered to be mutually exclusive with
is_vbi. This is a bit confusing, even if I think it's correct.

> +	if (is_vbi) {
>  		/* vbi specific ioctls */
>  		if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
>  			       ops->vidioc_g_fmt_sliced_vbi_cap)) ||
> @@ -681,8 +697,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
>  	}
>  
> -	if (is_vid || is_vbi || is_sdr || is_tch) {
> -		/* ioctls valid for video, metadata, vbi or sdr */
> +	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
> +		/* ioctls valid for video, vbi, sdr, touch and metadata */
>  		SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
>  		SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
>  		SET_VALID_IOCTL(ops, VIDIOC_QBUF, vidioc_qbuf);
> @@ -694,8 +710,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
>  	}
>  
> -	if (is_vid || is_vbi || is_tch) {
> -		/* ioctls valid for video or vbi */
> +	if (is_vid || is_vbi || is_tch || is_meta) {
> +		/* ioctls valid for video, vbi, touch and metadata */

Are all those ioctls valid for metadata ?

>  		if (ops->vidioc_s_std)
>  			set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_STD, vidioc_s_std);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 51b912743f0f..20b3107dd4e8 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -932,12 +932,22 @@ static int check_ext_ctrls(struct v4l2_ext_controls *c, int allow_priv)
>  
>  static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  {
> +	const u32 vid_caps = V4L2_CAP_VIDEO_CAPTURE |
> +			     V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +			     V4L2_CAP_VIDEO_OUTPUT |
> +			     V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +			     V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE;
> +	const u32 meta_caps = V4L2_CAP_META_CAPTURE |
> +			      V4L2_CAP_META_OUTPUT;
>  	struct video_device *vfd = video_devdata(file);
>  	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
> -	bool is_vid = vfd->vfl_type == VFL_TYPE_GRABBER;
> +	bool is_vid = vfd->vfl_type == VFL_TYPE_GRABBER &&
> +		      (vfd->device_caps & vid_caps);
>  	bool is_vbi = vfd->vfl_type == VFL_TYPE_VBI;
>  	bool is_sdr = vfd->vfl_type == VFL_TYPE_SDR;
>  	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
> +	bool is_meta = vfd->vfl_type == VFL_TYPE_GRABBER &&
> +		       (vfd->device_caps & meta_caps);
>  	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
>  
> @@ -996,11 +1006,11 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  			return 0;
>  		break;
>  	case V4L2_BUF_TYPE_META_CAPTURE:
> -		if (is_vid && is_rx && ops->vidioc_g_fmt_meta_cap)
> +		if (is_meta && is_rx && ops->vidioc_g_fmt_meta_cap)
>  			return 0;
>  		break;
>  	case V4L2_BUF_TYPE_META_OUTPUT:
> -		if (is_vid && is_tx && ops->vidioc_g_fmt_meta_out)
> +		if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
>  			return 0;
>  		break;
>  	default:

-- 
Regards,

Laurent Pinchart
