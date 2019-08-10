Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839C9887B3
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 05:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfHJDPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 23:15:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59204 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfHJDPS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 23:15:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 57C3428C01A
Subject: Re: [PATCH 1/3] media: vimc: move private defines to a common header
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1565386363.git.skhan@linuxfoundation.org>
 <142cc5a6a10f75ed97de8b2d9b1e73b034a88b2f.1565386363.git.skhan@linuxfoundation.org>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <5f9df1e2-41d6-b301-a841-0670f56464e3@collabora.com>
Date:   Sat, 10 Aug 2019 00:15:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <142cc5a6a10f75ed97de8b2d9b1e73b034a88b2f.1565386363.git.skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah,

Thanks for the patch.

On 8/9/19 6:45 PM, Shuah Khan wrote:
> In preparation for collapsing the component driver structure into
> a monolith, move private device structure defines to a new common
> header file.
> 
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

I was wondering if instead of creating a vimc.h, if we could move
to vimc-common.h,just because it is not clear to me the difference
between the two now, what do you think?

Regards,
Helen

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
> 
