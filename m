Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E65CB108F
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 16:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732395AbfILOCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 10:02:11 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54919 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732297AbfILOCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 10:02:10 -0400
Received: from [IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985] ([IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8PfgiQGdUV17O8Pfkiz0wU; Thu, 12 Sep 2019 16:02:08 +0200
Subject: Re: [PATCH v2] v4l2-core: Add metadata type to vfl_devnode_type.
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <5234da10-2d65-b050-69bf-abe26d50ebbf@xs4all.nl>
 <20190912080607.4768-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a3ecdeee-883f-2ff7-7bbe-56d428a63015@xs4all.nl>
Date:   Thu, 12 Sep 2019 16:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912080607.4768-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMxj5AtWX68xhf3rpRwHM4QQ2P+v/br5XXUHpEVOkKDRDcO2zdg/UWs0wtkpKSLUTsCoI2r2EkIwR+wl6BdeheqoYonfcv4tMaOOgC50BKYawTxmHnWl
 Dvkk6XCrREN4rweXFFmU1c+3fUHU4o0NfffayAw9yjlyzlMO/FrQT3H0LYzjNEhHgmebLZO+5Fvqz0ctPyovByIGkPZcC6z+GRbNIWlGdCQxTbTCOSdojGOX
 yGfazjSA6y5ZKOEexIobExcziMErtGgudB7mxdSKR97XsAUbjZXlgXm630xtw22O4N41Y/1+rTnuMVkHcOFQLf1ITHi81C8X6FLqBRKsNNiQpptS1uojP7Jg
 SJCaMmLGnwKZsFVKUmHqsqmAb7yNyA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vandana,

On 9/12/19 10:06 AM, Vandana BN wrote:
> Add VFL_TYPE_METADATA, to detect devices of type metadata and
> to disable unneeded ioctls.

The commit text can be improved. It would be good to add the reason
for this change (in this case because without this check the format
ioctls for both video and meta data could be called for both device
nodes. And it's true for other ioctls as well.

It's always good to explain why a change is made.

Regards,

	Hans

> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   | 57 ++++++++++++++++++----------
>  drivers/media/v4l2-core/v4l2-ioctl.c |  5 ++-
>  include/media/v4l2-dev.h             |  2 +
>  3 files changed, 41 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 4037689a945a..5f2ead772c5f 100644
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
> @@ -540,6 +543,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  	bool is_radio = vdev->vfl_type == VFL_TYPE_RADIO;
>  	bool is_sdr = vdev->vfl_type == VFL_TYPE_SDR;
>  	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
> +	bool is_meta = vdev->vfl_type == VFL_TYPE_METADATA;
>  	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
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
> index 51b912743f0f..0d71c06c82cf 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -938,6 +938,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  	bool is_vbi = vfd->vfl_type == VFL_TYPE_VBI;
>  	bool is_sdr = vfd->vfl_type == VFL_TYPE_SDR;
>  	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
> +	bool is_meta = vfd->vfl_type == VFL_TYPE_METADATA;
>  	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
>  
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

