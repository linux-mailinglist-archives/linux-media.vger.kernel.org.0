Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07A11150829
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 15:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgBCOOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 09:14:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57614 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbgBCOOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 09:14:33 -0500
Received: from pendragon.ideasonboard.com (64.177-245-81.adsl-dyn.isp.belgacom.be [81.245.177.64])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E349C5A4;
        Mon,  3 Feb 2020 15:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1580739272;
        bh=TVC9CPxSYx0Spdietak78wug/PfrqVz2zT5We+eQ9iE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qy3DfxvcSWYDq57PlKbrG+2VjQqIcWgtYehC2gJjozgEEq6xA+vHj2Ma0nTaC2iF9
         QlZk70m2aV6B7b+N63UW1dUziaCz6axZbLBETguHJ82wxZK/f5acGtRepof1R2NoHJ
         bX66ku5nQe9b9mqjJOEIOdi8BhTtb9E3YE2vU5b8=
Date:   Mon, 3 Feb 2020 16:14:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 01/11] media: rename VFL_TYPE_GRABBER to _VIDEO
Message-ID: <20200203141417.GA4722@pendragon.ideasonboard.com>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
 <20200203114119.1177490-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200203114119.1177490-2-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Feb 03, 2020 at 12:41:09PM +0100, Hans Verkuil wrote:
> We currently have the following devnode types:
> 
> enum vfl_devnode_type {
>         VFL_TYPE_GRABBER        = 0,
>         VFL_TYPE_VBI,
>         VFL_TYPE_RADIO,
>         VFL_TYPE_SUBDEV,
>         VFL_TYPE_SDR,
>         VFL_TYPE_TOUCH,
>         VFL_TYPE_MAX /* Shall be the last one */
> };
> 
> They all make sense, except for the first: GRABBER really refers to /dev/videoX
> devices, which can be capture, output or m2m, so 'grabber' doesn't even refer to
> their function anymore.
> 
> Let's call a spade a spade and rename this to VFL_TYPE_VIDEO.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/media/kapi/v4l2-dev.rst                  |  4 ++--
>  .../translations/zh_CN/video4linux/v4l2-framework.txt  |  4 ++--
>  drivers/media/v4l2-core/v4l2-dev.c                     | 10 +++++-----
>  drivers/media/v4l2-core/v4l2-ioctl.c                   |  4 ++--
>  include/media/v4l2-dev.h                               |  6 ++++--
>  samples/v4l/v4l2-pci-skeleton.c                        |  2 +-
>  6 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/media/kapi/v4l2-dev.rst b/Documentation/media/kapi/v4l2-dev.rst
> index 4c5a15c53dbf..63c064837c00 100644
> --- a/Documentation/media/kapi/v4l2-dev.rst
> +++ b/Documentation/media/kapi/v4l2-dev.rst
> @@ -185,7 +185,7 @@ This will create the character device for you.
>  
>  .. code-block:: c
>  
> -	err = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> +	err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (err) {
>  		video_device_release(vdev); /* or kfree(my_vdev); */
>  		return err;
> @@ -201,7 +201,7 @@ types exist:
>  ========================== ====================	 ==============================
>  :c:type:`vfl_devnode_type` Device name		 Usage
>  ========================== ====================	 ==============================
> -``VFL_TYPE_GRABBER``       ``/dev/videoX``       for video input/output devices
> +``VFL_TYPE_VIDEO``         ``/dev/videoX``       for video input/output devices
>  ``VFL_TYPE_VBI``           ``/dev/vbiX``         for vertical blank data (i.e.
>  						 closed captions, teletext)
>  ``VFL_TYPE_RADIO``         ``/dev/radioX``       for radio tuners
> diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
> index 66c7c568bd86..9c39ee58ea50 100644
> --- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
> +++ b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
> @@ -649,7 +649,7 @@ video_device注册
>  
>  接下来你需要注册视频设备：这会为你创建一个字符设备。
>  
> -	err = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> +	err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (err) {
>  		video_device_release(vdev); /* or kfree(my_vdev); */
>  		return err;
> @@ -660,7 +660,7 @@ video_device注册
>  
>  注册哪种设备是根据类型（type）参数。存在以下类型：
>  
> -VFL_TYPE_GRABBER: 用于视频输入/输出设备的 videoX
> +VFL_TYPE_VIDEO: 用于视频输入/输出设备的 videoX
>  VFL_TYPE_VBI: 用于垂直消隐数据的 vbiX (例如，隐藏式字幕，图文电视)
>  VFL_TYPE_RADIO: 用于广播调谐器的 radioX
>  
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index da42d172714a..97b6a3af1361 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -542,13 +542,13 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			      V4L2_CAP_META_OUTPUT;
>  	DECLARE_BITMAP(valid_ioctls, BASE_VIDIOC_PRIVATE);
>  	const struct v4l2_ioctl_ops *ops = vdev->ioctl_ops;
> -	bool is_vid = vdev->vfl_type == VFL_TYPE_GRABBER &&
> +	bool is_vid = vdev->vfl_type == VFL_TYPE_VIDEO &&
>  		      (vdev->device_caps & vid_caps);
>  	bool is_vbi = vdev->vfl_type == VFL_TYPE_VBI;
>  	bool is_radio = vdev->vfl_type == VFL_TYPE_RADIO;
>  	bool is_sdr = vdev->vfl_type == VFL_TYPE_SDR;
>  	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
> -	bool is_meta = vdev->vfl_type == VFL_TYPE_GRABBER &&
> +	bool is_meta = vdev->vfl_type == VFL_TYPE_VIDEO &&
>  		       (vdev->device_caps & meta_caps);
>  	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
> @@ -783,7 +783,7 @@ static int video_register_media_controller(struct video_device *vdev)
>  	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
>  
>  	switch (vdev->vfl_type) {
> -	case VFL_TYPE_GRABBER:
> +	case VFL_TYPE_VIDEO:
>  		intf_type = MEDIA_INTF_T_V4L_VIDEO;
>  		vdev->entity.function = MEDIA_ENT_F_IO_V4L;
>  		break;
> @@ -891,7 +891,7 @@ int __video_register_device(struct video_device *vdev,
>  
>  	/* Part 1: check device type */
>  	switch (type) {
> -	case VFL_TYPE_GRABBER:
> +	case VFL_TYPE_VIDEO:
>  		name_base = "video";
>  		break;
>  	case VFL_TYPE_VBI:
> @@ -935,7 +935,7 @@ int __video_register_device(struct video_device *vdev,
>  	 * of 128-191 and just pick the first free minor there
>  	 * (new style). */
>  	switch (type) {
> -	case VFL_TYPE_GRABBER:
> +	case VFL_TYPE_VIDEO:
>  		minor_offset = 0;
>  		minor_cnt = 64;
>  		break;
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index aaf83e254272..fbcc7a20eedf 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -941,12 +941,12 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  			      V4L2_CAP_META_OUTPUT;
>  	struct video_device *vfd = video_devdata(file);
>  	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
> -	bool is_vid = vfd->vfl_type == VFL_TYPE_GRABBER &&
> +	bool is_vid = vfd->vfl_type == VFL_TYPE_VIDEO &&
>  		      (vfd->device_caps & vid_caps);
>  	bool is_vbi = vfd->vfl_type == VFL_TYPE_VBI;
>  	bool is_sdr = vfd->vfl_type == VFL_TYPE_SDR;
>  	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
> -	bool is_meta = vfd->vfl_type == VFL_TYPE_GRABBER &&
> +	bool is_meta = vfd->vfl_type == VFL_TYPE_VIDEO &&
>  		       (vfd->device_caps & meta_caps);
>  	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 48531e57cc5a..5e7c0f8acd05 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -24,7 +24,8 @@
>  /**
>   * enum vfl_devnode_type - type of V4L2 device node
>   *
> - * @VFL_TYPE_GRABBER:	for video input/output devices
> + * @VFL_TYPE_VIDEO:	for video input/output devices
> + * @VFL_TYPE_GRABBER:	deprecated, same as VFL_TYPE_VIDEO
>   * @VFL_TYPE_VBI:	for vertical blank data (i.e. closed captions, teletext)
>   * @VFL_TYPE_RADIO:	for radio tuners
>   * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
> @@ -33,7 +34,8 @@
>   * @VFL_TYPE_MAX:	number of VFL types, must always be last in the enum
>   */
>  enum vfl_devnode_type {
> -	VFL_TYPE_GRABBER	= 0,
> +	VFL_TYPE_VIDEO,
> +	VFL_TYPE_GRABBER = VFL_TYPE_VIDEO,
>  	VFL_TYPE_VBI,
>  	VFL_TYPE_RADIO,
>  	VFL_TYPE_SUBDEV,
> diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
> index f6a551bd57ef..3fa6582b4a68 100644
> --- a/samples/v4l/v4l2-pci-skeleton.c
> +++ b/samples/v4l/v4l2-pci-skeleton.c
> @@ -879,7 +879,7 @@ static int skeleton_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	vdev->tvnorms = SKEL_TVNORMS;
>  	video_set_drvdata(vdev, skel);
>  
> -	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret)
>  		goto free_hdl;
>  

-- 
Regards,

Laurent Pinchart
