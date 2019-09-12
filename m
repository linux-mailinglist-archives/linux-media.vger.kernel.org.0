Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55FC0B0973
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 09:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729252AbfILHYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 03:24:12 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:37367 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728558AbfILHYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 03:24:12 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 8JSViAPGrQUjz8JSZi8diL; Thu, 12 Sep 2019 09:24:09 +0200
Subject: Re: [PATCH] v4l2-core: Add metadata type to vfl_devnode_type.
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190910113854.7684-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f0153195-16a6-0630-eca5-d02fc3e3fa69@xs4all.nl>
Date:   Thu, 12 Sep 2019 09:24:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910113854.7684-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMSWPn6B15gcmJZ8RfRZvgKmAdtjmO9dSi4+6judO9QwEPwFG5P8WRaLy00OAGmhNm2f7XpCf8nNhC6qdBuRzFdLCr45BHt3imvfVM4+Y3KmG151RdjF
 d8PbCf/uwZWUdJBRhh0LtQFyKD9J0a+/M5AbYPCPYao7bSLBvM7pjDd7sJA8Gk0qRJYjcC/nnjemWJqBbIQTFTgrZO9yLywfZTAJNzLnDdhf0XYdUE0L3kjB
 hCMI+dELVcfN0L4gnCvTF8/albenqSR3Rm3e9HzwxmY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/10/19 1:38 PM, Vandana BN wrote:
> Add VFL_TYPE_METADATA, to detect devices of type metadata and
> to disable unneeded ioctls.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   | 57 ++++++++++++++++++----------
>  drivers/media/v4l2-core/v4l2-ioctl.c |  5 ++-
>  include/media/v4l2-dev.h             |  2 +
>  3 files changed, 41 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 4037689a945a..8110127d0e3d 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -112,6 +112,7 @@ static inline unsigned long *devnode_bits(enum vfl_devnode_type vfl_type)
>  	   one single bitmap for the purposes of finding a free node number
>  	   since all those unassigned types use the same minor range. */
>  	int idx = (vfl_type > VFL_TYPE_RADIO) ? VFL_TYPE_MAX - 1 : vfl_type;
> +	idx = (vfl_type == VFL_TYPE_METADATA) ? VFL_TYPE_GRABBER : vfl_type;
>  
>  	return devnode_nums[idx];
>  }
> @@ -119,7 +120,9 @@ static inline unsigned long *devnode_bits(enum vfl_devnode_type vfl_type)
>  /* Return the bitmap corresponding to vfl_type. */
>  static inline unsigned long *devnode_bits(enum vfl_devnode_type vfl_type)
>  {
> -	return devnode_nums[vfl_type];
> +	int idx = (vfl_type == VFL_TYPE_METADATA) ? VFL_TYPE_GRABBER : vfl_type;
> +
> +	return devnode_nums[idx];
>  }
>  #endif
>  
> @@ -542,6 +545,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
>  	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
> +	bool is_meta = vdev->vfl_type == VFL_TYPE_METADATA;

Move this up two line, it should come after the is_tch line.

That way all the bools describing the type of device are together.

>  
>  	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
>  
> @@ -571,8 +575,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		set_bit(_IOC_NR(VIDIOC_TRY_EXT_CTRLS), valid_ioctls);
>  	if (vdev->ctrl_handler || ops->vidioc_querymenu)
>  		set_bit(_IOC_NR(VIDIOC_QUERYMENU), valid_ioctls);
> -	SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
> -	SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
> +	if (!is_meta) {
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
> +	}
>  	SET_VALID_IOCTL(ops, VIDIOC_LOG_STATUS, vidioc_log_status);
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>  	set_bit(_IOC_NR(VIDIOC_DBG_G_CHIP_INFO), valid_ioctls);
> @@ -589,37 +595,29 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  	if (is_vid || is_tch) {
>  		/* video and metadata specific ioctls */
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
> @@ -679,9 +677,23 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
>  		if (ops->vidioc_try_fmt_sdr_out)
>  			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
> +	} else if (is_meta) {
> +		/* metadata specific ioctls */
> +		if ((is_rx && ops->vidioc_enum_fmt_meta_cap) ||
> +		    (is_tx && ops->vidioc_enum_fmt_meta_out))
> +			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
> +		if ((is_rx && ops->vidioc_g_fmt_meta_cap) ||
> +		    (is_tx && ops->vidioc_g_fmt_meta_out))
> +			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
> +		if ((is_rx && ops->vidioc_s_fmt_meta_cap) ||
> +		    (is_tx && ops->vidioc_s_fmt_meta_out))
> +			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
> +		if ((is_rx && ops->vidioc_try_fmt_meta_cap) ||
> +		    (is_tx && ops->vidioc_try_fmt_meta_out))
> +			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
>  	}
>  
> -	if (is_vid || is_vbi || is_sdr || is_tch) {
> +	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
>  		/* ioctls valid for video, metadata, vbi or sdr */
>  		SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
>  		SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
> @@ -734,7 +746,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_G_MODULATOR, vidioc_g_modulator);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_MODULATOR, vidioc_s_modulator);
>  	}
> -	if (is_rx) {
> +	if (is_rx && !is_meta) {
>  		/* receiver only ioctls */
>  		SET_VALID_IOCTL(ops, VIDIOC_G_TUNER, vidioc_g_tuner);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
> @@ -762,6 +774,7 @@ static int video_register_media_controller(struct video_device *vdev)
>  
>  	switch (vdev->vfl_type) {
>  	case VFL_TYPE_GRABBER:
> +	case VFL_TYPE_METADATA:
>  		intf_type = MEDIA_INTF_T_V4L_VIDEO;
>  		vdev->entity.function = MEDIA_ENT_F_IO_V4L;
>  		break;
> @@ -870,6 +883,7 @@ int __video_register_device(struct video_device *vdev,
>  	/* Part 1: check device type */
>  	switch (type) {
>  	case VFL_TYPE_GRABBER:
> +	case VFL_TYPE_METADATA:
>  		name_base = "video";
>  		break;
>  	case VFL_TYPE_VBI:
> @@ -914,6 +928,7 @@ int __video_register_device(struct video_device *vdev,
>  	 * (new style). */
>  	switch (type) {
>  	case VFL_TYPE_GRABBER:
> +	case VFL_TYPE_METADATA:
>  		minor_offset = 0;
>  		minor_cnt = 64;
>  		break;
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 51b912743f0f..686663be145a 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -940,6 +940,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
>  	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
> +	bool is_meta = vfd->vfl_type == VFL_TYPE_METADATA;

Move this up two line, it should come after the is_tch line.

>  
>  	if (ops == NULL)
>  		return -EINVAL;
> @@ -996,11 +997,11 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
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
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 48531e57cc5a..2da91d454c10 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -30,6 +30,7 @@
>   * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
>   * @VFL_TYPE_SDR:	for Software Defined Radio tuners
>   * @VFL_TYPE_TOUCH:	for touch sensors
> + * @VFL_TYPE_METADATA:	for Metadata device
>   * @VFL_TYPE_MAX:	number of VFL types, must always be last in the enum
>   */
>  enum vfl_devnode_type {
> @@ -39,6 +40,7 @@ enum vfl_devnode_type {
>  	VFL_TYPE_SUBDEV,
>  	VFL_TYPE_SDR,
>  	VFL_TYPE_TOUCH,
> +	VFL_TYPE_METADATA,
>  	VFL_TYPE_MAX /* Shall be the last one */
>  };
>  
> 

I'll post a follow-up patch to this one that improves the TOUCH handling, since
I noticed that that's a bit flaky.

Regards,

	Hans
