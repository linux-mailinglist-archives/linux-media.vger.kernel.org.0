Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD3F88BB7
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 16:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfHJOOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Aug 2019 10:14:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57214 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfHJOOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Aug 2019 10:14:37 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5536F67;
        Sat, 10 Aug 2019 16:14:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565446474;
        bh=bSif1YUXdro/ri2Eo/hCoZ/bPT1nH7AYvUtuX1zxJVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rX88nVNe4tp7g4UFh28oVuvXOLwkmI1337WGUPcWEtL+R63qc4UNuW5A++iGb6gmS
         Ael0LZAiF5xWpeFDvCZSlxeH6LSEzaY8ca0w84XRvlBOZT9s9iZc7a9U5dfCvTxLOa
         +hDo/eqpUoFJ90Q02Tw/ESir0JUih1GyRRJBaii4=
Date:   Sat, 10 Aug 2019 17:14:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: vimc: move private defines to a common header
Message-ID: <20190810141432.GA30451@pendragon.ideasonboard.com>
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <142cc5a6a10f75ed97de8b2d9b1e73b034a88b2f.1565386363.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <142cc5a6a10f75ed97de8b2d9b1e73b034a88b2f.1565386363.git.skhan@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah,

Thank you for the patch.

On Fri, Aug 09, 2019 at 03:45:41PM -0600, Shuah Khan wrote:
> In preparation for collapsing the component driver structure into
> a monolith, move private device structure defines to a new common
> header file.

Apart from the vimc_device structure, this doesn't seem to be needed.
I'd rather keep each structure private to the .c file that handles it,
and only share vimc_device globally.

> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  drivers/media/platform/vimc/vimc-capture.c |  21 +----
>  drivers/media/platform/vimc/vimc-core.c    |  18 +---
>  drivers/media/platform/vimc/vimc-debayer.c |  16 +---
>  drivers/media/platform/vimc/vimc-scaler.c  |  15 +--
>  drivers/media/platform/vimc/vimc-sensor.c  |  13 +--
>  drivers/media/platform/vimc/vimc.h         | 102 +++++++++++++++++++++
>  6 files changed, 107 insertions(+), 78 deletions(-)
>  create mode 100644 drivers/media/platform/vimc/vimc.h
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 664855708fdf..c52fc5d97c2d 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -13,6 +13,7 @@
>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-vmalloc.h>
>  
> +#include "vimc.h"
>  #include "vimc-common.h"
>  #include "vimc-streamer.h"
>  
> @@ -44,26 +45,6 @@ static const u32 vimc_cap_supported_pixfmt[] = {
>  	V4L2_PIX_FMT_SRGGB12,
>  };
>  
> -struct vimc_cap_device {
> -	struct vimc_ent_device ved;
> -	struct video_device vdev;
> -	struct device *dev;
> -	struct v4l2_pix_format format;
> -	struct vb2_queue queue;
> -	struct list_head buf_list;
> -	/*
> -	 * NOTE: in a real driver, a spin lock must be used to access the
> -	 * queue because the frames are generated from a hardware interruption
> -	 * and the isr is not allowed to sleep.
> -	 * Even if it is not necessary a spinlock in the vimc driver, we
> -	 * use it here as a code reference
> -	 */
> -	spinlock_t qlock;
> -	struct mutex lock;
> -	u32 sequence;
> -	struct vimc_stream stream;
> -};
> -
>  static const struct v4l2_pix_format fmt_default = {
>  	.width = 640,
>  	.height = 480,
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index 571c55aa0e16..c9b351472272 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -12,6 +12,7 @@
>  #include <media/media-device.h>
>  #include <media/v4l2-device.h>
>  
> +#include "vimc.h"
>  #include "vimc-common.h"
>  
>  #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
> @@ -24,23 +25,6 @@
>  	.flags = link_flags,					\
>  }
>  
> -struct vimc_device {
> -	/* The platform device */
> -	struct platform_device pdev;
> -
> -	/* The pipeline configuration */
> -	const struct vimc_pipeline_config *pipe_cfg;
> -
> -	/* The Associated media_device parent */
> -	struct media_device mdev;
> -
> -	/* Internal v4l2 parent device*/
> -	struct v4l2_device v4l2_dev;
> -
> -	/* Subdevices */
> -	struct platform_device **subdevs;
> -};
> -
>  /* Structure which describes individual configuration for each entity */
>  struct vimc_ent_config {
>  	const char *name;
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 00598fbf3cba..750752bb173c 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -13,6 +13,7 @@
>  #include <linux/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>  
> +#include "vimc.h"
>  #include "vimc-common.h"
>  
>  #define VIMC_DEB_DRV_NAME "vimc-debayer"
> @@ -44,21 +45,6 @@ struct vimc_deb_pix_map {
>  	enum vimc_deb_rgb_colors order[2][2];
>  };
>  
> -struct vimc_deb_device {
> -	struct vimc_ent_device ved;
> -	struct v4l2_subdev sd;
> -	struct device *dev;
> -	/* The active format */
> -	struct v4l2_mbus_framefmt sink_fmt;
> -	u32 src_code;
> -	void (*set_rgb_src)(struct vimc_deb_device *vdeb, unsigned int lin,
> -			    unsigned int col, unsigned int rgb[3]);
> -	/* Values calculated when the stream starts */
> -	u8 *src_frame;
> -	const struct vimc_deb_pix_map *sink_pix_map;
> -	unsigned int sink_bpp;
> -};
> -
>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
>  	.width = 640,
>  	.height = 480,
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index c7123a45c55b..fe99b9102ada 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -13,6 +13,7 @@
>  #include <linux/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>  
> +#include "vimc.h"
>  #include "vimc-common.h"
>  
>  #define VIMC_SCA_DRV_NAME "vimc-scaler"
> @@ -31,20 +32,6 @@ static const u32 vimc_sca_supported_pixfmt[] = {
>  	V4L2_PIX_FMT_ARGB32,
>  };
>  
> -struct vimc_sca_device {
> -	struct vimc_ent_device ved;
> -	struct v4l2_subdev sd;
> -	struct device *dev;
> -	/* NOTE: the source fmt is the same as the sink
> -	 * with the width and hight multiplied by mult
> -	 */
> -	struct v4l2_mbus_framefmt sink_fmt;
> -	/* Values calculated when the stream starts */
> -	u8 *src_frame;
> -	unsigned int src_line_size;
> -	unsigned int bpp;
> -};
> -
>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
>  	.width = 640,
>  	.height = 480,
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 51359472eef2..6c57b1e262f9 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -16,22 +16,11 @@
>  #include <media/v4l2-subdev.h>
>  #include <media/tpg/v4l2-tpg.h>
>  
> +#include "vimc.h"
>  #include "vimc-common.h"
>  
>  #define VIMC_SEN_DRV_NAME "vimc-sensor"
>  
> -struct vimc_sen_device {
> -	struct vimc_ent_device ved;
> -	struct v4l2_subdev sd;
> -	struct device *dev;
> -	struct tpg_data tpg;
> -	struct task_struct *kthread_sen;
> -	u8 *frame;
> -	/* The active format */
> -	struct v4l2_mbus_framefmt mbus_format;
> -	struct v4l2_ctrl_handler hdl;
> -};
> -
>  static const struct v4l2_mbus_framefmt fmt_default = {
>  	.width = 640,
>  	.height = 480,
> diff --git a/drivers/media/platform/vimc/vimc.h b/drivers/media/platform/vimc/vimc.h
> new file mode 100644
> index 000000000000..a5adebdda941
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *
> + * Copyright (C) 2019 Shuah Khan <skhan@linuxfoundation.org>
> + *
> + */
> +
> +/*
> + * This file defines vimc driver device and sub-device structures.
> + */
> +
> +#ifndef _VIMC_H_
> +#define _VIMC_H_
> +
> +#include <linux/platform_device.h>
> +#include <media/media-device.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-core.h>
> +#include <media/tpg/v4l2-tpg.h>
> +#include <media/v4l2-ctrls.h>
> +
> +#include "vimc-common.h"
> +
> +struct vimc_cap_device {
> +	struct vimc_ent_device ved;
> +	struct video_device vdev;
> +	struct device *dev;
> +	struct v4l2_pix_format format;
> +	struct vb2_queue queue;
> +	struct list_head buf_list;
> +	/*
> +	 * NOTE: in a real driver, a spin lock must be used to access the
> +	 * queue because the frames are generated from a hardware interruption
> +	 * and the isr is not allowed to sleep.
> +	 * Even if it is not necessary a spinlock in the vimc driver, we
> +	 * use it here as a code reference
> +	 */
> +	spinlock_t qlock;
> +	struct mutex lock;
> +	u32 sequence;
> +	struct vimc_stream stream;
> +};
> +
> +struct vimc_sca_device {
> +	struct vimc_ent_device ved;
> +	struct v4l2_subdev sd;
> +	struct device *dev;
> +	/* NOTE: the source fmt is the same as the sink
> +	 * with the width and hight multiplied by mult
> +	 */
> +	struct v4l2_mbus_framefmt sink_fmt;
> +	/* Values calculated when the stream starts */
> +	u8 *src_frame;
> +	unsigned int src_line_size;
> +	unsigned int bpp;
> +};
> +
> +struct vimc_deb_device {
> +	struct vimc_ent_device ved;
> +	struct v4l2_subdev sd;
> +	struct device *dev;
> +	/* The active format */
> +	struct v4l2_mbus_framefmt sink_fmt;
> +	u32 src_code;
> +	void (*set_rgb_src)(struct vimc_deb_device *vdeb, unsigned int lin,
> +			    unsigned int col, unsigned int rgb[3]);
> +	/* Values calculated when the stream starts */
> +	u8 *src_frame;
> +	const struct vimc_deb_pix_map *sink_pix_map;
> +	unsigned int sink_bpp;
> +};
> +
> +struct vimc_sen_device {
> +	struct vimc_ent_device ved;
> +	struct v4l2_subdev sd;
> +	struct device *dev;
> +	struct tpg_data tpg;
> +	struct task_struct *kthread_sen;
> +	u8 *frame;
> +	/* The active format */
> +	struct v4l2_mbus_framefmt mbus_format;
> +	struct v4l2_ctrl_handler hdl;
> +};
> +
> +struct vimc_device {
> +	/* The platform device */
> +	struct platform_device pdev;
> +
> +	/* The pipeline configuration */
> +	const struct vimc_pipeline_config *pipe_cfg;
> +
> +	/* The Associated media_device parent */
> +	struct media_device mdev;
> +
> +	/* Internal v4l2 parent device*/
> +	struct v4l2_device v4l2_dev;
> +
> +	/* Subdevices */
> +	struct platform_device **subdevs;
> +};
> +
> +#endif

-- 
Regards,

Laurent Pinchart
