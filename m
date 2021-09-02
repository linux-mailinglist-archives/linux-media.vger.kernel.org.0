Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6984B3FF0B2
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 18:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhIBQGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 12:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhIBQGn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 12:06:43 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AE5C061575;
        Thu,  2 Sep 2021 09:05:44 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LpDhmkff9lQKhLpDimL3zp; Thu, 02 Sep 2021 18:05:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630598743; bh=w46IE5zJDeCcwvcsyCXC3gzRB4PiuDnqO5e4FTZY4Og=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Re0VWHTvu4MY5NFnqEDskVThXe4XQeQhzE7ZS53jwt26rHkW4+eNFqulYVGuxg7Sl
         c1AbAo7BkzeXL2gGHhO0kB+gGBFuSkEH83f/UiJ9tvXquwjTijmEu6t7Mi54pYQ7ig
         CcPz5m+X0BQCmULHZT7ZBYgKmwZ32MHCkL5OCQaHV5GF+J38k58R5+4E+eAeB03q44
         eFtL+379d/EGWTjf/atAhjXKqoS6OkbyAyxr8P8U1GNRWTE/0yZqQbcEsUuooDa3IC
         9HvRZ8FZzWjcVmA46V72D4aI0NRXE5TIUH+hr4cWoUqGCjmMLPpD3xzr8WNO6Q4dIk
         TFGgXdcLevKuQ==
Subject: Re: [RFC PATCH 2/2] media: vivpu: add virtual VPU driver
To:     daniel.almeida@collabora.com, stevecho@google.com,
        shawnku@google.com, tzungbi@google.com, mcasas@google.com,
        nhebert@google.com, abodenha@google.com, randy.wu@mediatek.com,
        yunfei.dong@mediatek.com, gustavo.padovan@collabora.com,
        andrzej.pietrasiewicz@collabora.com, enric.balletbo@collabora.com,
        ezequiel@collabora.com, nicolas.dufresne@collabora.com,
        tomeu.vizoso@collabora.com, nick.milner@collabora.com,
        xiaoyong.lu@mediatek.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20210810220552.298140-1-daniel.almeida@collabora.com>
 <20210810220552.298140-3-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <eaef8b37-1028-92d9-fe39-31f53389eb4b@xs4all.nl>
Date:   Thu, 2 Sep 2021 18:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210810220552.298140-3-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAXHOrWYs/ESnNgA+1dDfvgYcYcJloDQr+kLH4NaH/jRDYf8aIw+8GIn+5a0ATU5UJs4AwBkqhDEfYVRj7mHzXC4GHcaFDHq2SIIItj0pp+PITk+IHuN
 B/tjsu4VjVh+n6TNveSMb1ZhSPxuYR4VQGl3j4C+UXbAsqOnB936vFS6Hsn04rzxJpZ1l9kYHcTGquFFUUEafcaiS/DQME9JRbKFhc4SIwX+09QLTMe99Seu
 DhQFW5SFhswyxrsIQX/iymteFnRKnBHiN+I8KuOdxoFkG88Wm9/QwQrK0XbhQ+rXzTYplbL0rNSBfQ/36dY2AxuFQj2JPtTPuEg9JWrCQdcNMWLQfOTIiTFu
 HsLjXJwZHCncL0ETeExeQc6+/mN19y/VVliVq2sIl9wFinOH8u9viuQpz/Adg79qYZFWExRCRNqw5yQqjUN+rNBM/zZr8gl75xRbZzLSHmjXka/JAETPNw81
 X2WhaHZOCGSDpOYqXCbBwCG9N+Bitdui5RQgyWYptb+l814ZKVmF2tAdbC7eG1Rv6P0Bxv7s/jHu2HDr2AEC7Zp4jQn2/PUC5PuYIAp/iqEfKoE/LAX5uBQQ
 YoR2RKnf6Y7+3jCpelMz158Od/r1Re+xoklwb+vsR4RrkkX+Z9EJkinQ9ZFu31/F+89aAn5mOsSdYgrQGJUYkMY1ABVQhNW/rK6ni9g6LMXa8QWStGYVt9M9
 CAJyP5OFnwQtuQdEWKfrlQk7gjujzxn02ylOr2EKR4ciezT8ZQqY0mguaX5f0cp0RW3SyV3Md1kEHVby3WGvQOjWIULsB07yQDmPXPwjsh+kaJZl5Lf1sD3c
 toIOYHyTrI4sEzdPXgqC42wE84pVod0Kuq/8YjmRPP8RC2R/5LI92LR3aUSCrIJFyN3IPhqSsWf8o0g9mfgUQFFNqY+tlYiC2//RfGEQkl5QTDcxLcV+cLs2
 1B1JvNoWwRvl0WHdwtIjBCy4LIegZ+ngh2jQu1F3dWrzeOX4AL7LrGLstEiNQPU7KaV0h/BMqx+sbQnl+ZhKt/ZiTAQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/08/2021 00:05, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> Add a virtual VPU driver to aid userspace in testing stateless uAPI
> implementations for which no hardware is currently available.
> 
> A userspace implementation can use vivpu to run a decoding loop even
> when no hardware is available or when the kernel uAPI for the codec
> has not been upstreamed yet. This can reveal bugs at an early stage.
> 
> Also makes it possible to work on the kernel uAPI for a codec and
> a corresponding userspace implementation at the same time.

The commit log should mention that it currently only supports AV1.

But for a first version I would actually like to see FWHT (from vicodec)
support as well. It should be trivial to add, but it will be nice to have
in place.

> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/media/test-drivers/Kconfig            |   1 +
>  drivers/media/test-drivers/Makefile           |   1 +
>  drivers/media/test-drivers/vivpu/Kconfig      |  16 +

Even though it is a bit long, wouldn't vistateless be a better name?
'vpu' is a bit too generic, this driver is specifically for testing
stateless decoders (and potentially stateless encoders).

>  drivers/media/test-drivers/vivpu/Makefile     |   4 +
>  drivers/media/test-drivers/vivpu/vivpu-core.c | 418 ++++++++++++
>  drivers/media/test-drivers/vivpu/vivpu-dec.c  | 491 ++++++++++++++
>  drivers/media/test-drivers/vivpu/vivpu-dec.h  |  61 ++
>  .../media/test-drivers/vivpu/vivpu-video.c    | 599 ++++++++++++++++++
>  .../media/test-drivers/vivpu/vivpu-video.h    |  46 ++
>  drivers/media/test-drivers/vivpu/vivpu.h      | 119 ++++
>  10 files changed, 1756 insertions(+)
>  create mode 100644 drivers/media/test-drivers/vivpu/Kconfig
>  create mode 100644 drivers/media/test-drivers/vivpu/Makefile
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-core.c
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-dec.c
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-dec.h
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-video.c
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu-video.h
>  create mode 100644 drivers/media/test-drivers/vivpu/vivpu.h
> 
> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
> index e27d6602545d..b426cef7fc88 100644
> --- a/drivers/media/test-drivers/Kconfig
> +++ b/drivers/media/test-drivers/Kconfig
> @@ -22,6 +22,7 @@ config VIDEO_VIM2M
>  	  framework.
>  
>  source "drivers/media/test-drivers/vicodec/Kconfig"
> +source "drivers/media/test-drivers/vivpu/Kconfig"
>  
>  endif #V4L_TEST_DRIVERS
>  
> diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
> index 9f0e4ebb2efe..a4fadccc4b95 100644
> --- a/drivers/media/test-drivers/Makefile
> +++ b/drivers/media/test-drivers/Makefile
> @@ -7,4 +7,5 @@ obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
>  obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
>  obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
>  obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
> +obj-$(CONFIG_VIDEO_VIVPU)		+= vivpu/
>  obj-$(CONFIG_DVB_VIDTV)			+= vidtv/
> diff --git a/drivers/media/test-drivers/vivpu/Kconfig b/drivers/media/test-drivers/vivpu/Kconfig
> new file mode 100644
> index 000000000000..1e6267418d19
> --- /dev/null
> +++ b/drivers/media/test-drivers/vivpu/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_VIVPU
> +	tristate "Virtual VPU Driver (vivpu)"
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	select VIDEOBUF2_VMALLOC
> +	select V4L2_MEM2MEM_DEV
> +	select MEDIA_CONTROLLER
> +	select MEDIA_CONTROLLER_REQUEST_API
> +	help
> +	  A virtual stateless VPU example device for uAPI development purposes.
> +
> +	  A userspace implementation can use vivpu to run a decoding loop even
> +	  when no hardware is available or when the kernel uAPI for the codec
> +	  has not been upstreamed yet. This can reveal bugs at an early stage
> +
> +	  When in doubt, say N.
> diff --git a/drivers/media/test-drivers/vivpu/Makefile b/drivers/media/test-drivers/vivpu/Makefile
> new file mode 100644
> index 000000000000..d20a1dbbd9e5
> --- /dev/null
> +++ b/drivers/media/test-drivers/vivpu/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +vivpu-y := vivpu-core.o vivpu-video.o vivpu-dec.o
> +
> +obj-$(CONFIG_VIDEO_VIVPU) += vivpu.o
> diff --git a/drivers/media/test-drivers/vivpu/vivpu-core.c b/drivers/media/test-drivers/vivpu/vivpu-core.c
> new file mode 100644
> index 000000000000..1eb1ce33bab1
> --- /dev/null
> +++ b/drivers/media/test-drivers/vivpu/vivpu-core.c
> @@ -0,0 +1,418 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * A virtual stateless VPU example device for uAPI development purposes.
> + *
> + * A userspace implementation can use vivpu to run a decoding loop even
> + * when no hardware is available or when the kernel uAPI for the codec
> + * has not been upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version

This last paragraph can be dropped since you already have the SPDX tag. Ditto
for the other sources.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/font.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "vivpu.h"
> +#include "vivpu-dec.h"
> +#include "vivpu-video.h"
> +
> +unsigned int vivpu_debug;
> +module_param(vivpu_debug, uint, 0644);
> +MODULE_PARM_DESC(vivpu_debug, " activates debug info");
> +
> +const unsigned int vivpu_src_default_w = 640;
> +const unsigned int vivpu_src_default_h = 480;
> +const unsigned int vivpu_src_default_depth = 8;
> +
> +unsigned int vivpu_transtime;
> +module_param(vivpu_transtime, uint, 0644);
> +MODULE_PARM_DESC(vivpu_transtime, " simulated process time.");

In what unit? Second? Millisecond? Should be mentioned in the description.

> +
> +struct v4l2_ctrl *vivpu_find_control(struct vivpu_ctx *ctx, u32 id)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; ctx->ctrls[i]; i++)
> +		if (ctx->ctrls[i]->id == id)
> +			return ctx->ctrls[i];
> +
> +	return NULL;
> +}
> +
> +void *vivpu_find_control_data(struct vivpu_ctx *ctx, u32 id)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = vivpu_find_control(ctx, id);
> +	if (ctrl)
> +		return ctrl->p_cur.p;
> +
> +	return NULL;
> +}
> +
> +u32 vivpu_control_num_elems(struct vivpu_ctx *ctx, u32 id)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = vivpu_find_control(ctx, id);
> +	if (ctrl)
> +		return ctrl->elems;
> +
> +	return 0;
> +}
> +
> +static void vivpu_device_release(struct video_device *vdev)
> +{
> +	struct vivpu_dev *dev = container_of(vdev, struct vivpu_dev, vfd);
> +
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	v4l2_m2m_release(dev->m2m_dev);
> +	media_device_cleanup(&dev->mdev);
> +	kfree(dev);
> +}
> +
> +static const struct vivpu_control vivpu_controls[] = {
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_FRAME_HEADER,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_SEQUENCE,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_TILE_GROUP,
> +		.cfg.dims = { V4L2_AV1_MAX_TILE_COUNT },
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY,
> +		.cfg.dims = { V4L2_AV1_MAX_TILE_COUNT },
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_TILE_LIST,
> +		.cfg.dims = { V4L2_AV1_MAX_TILE_COUNT },
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_TILE_LIST_ENTRY,
> +		.cfg.dims = { V4L2_AV1_MAX_TILE_COUNT },
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_PROFILE,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_LEVEL,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_AV1_OPERATING_MODE,
> +	},
> +};
> +
> +#define VIVPU_CONTROLS_COUNT	ARRAY_SIZE(vivpu_controls)
> +
> +static int vivpu_init_ctrls(struct vivpu_ctx *ctx)
> +{
> +	struct vivpu_dev *dev = ctx->dev;
> +	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
> +	struct v4l2_ctrl *ctrl;
> +	unsigned int ctrl_size;
> +	unsigned int i;
> +
> +	v4l2_ctrl_handler_init(hdl, VIVPU_CONTROLS_COUNT);
> +	if (hdl->error) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "Failed to initialize control handler\n");
> +		return hdl->error;
> +	}
> +
> +	ctrl_size = sizeof(ctrl) * VIVPU_CONTROLS_COUNT + 1;
> +
> +	ctx->ctrls = kzalloc(ctrl_size, GFP_KERNEL);
> +	if (!ctx->ctrls)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < VIVPU_CONTROLS_COUNT; i++) {
> +		ctrl = v4l2_ctrl_new_custom(hdl, &vivpu_controls[i].cfg,
> +					    NULL);
> +		if (hdl->error) {
> +			v4l2_err(&dev->v4l2_dev,
> +				 "Failed to create new custom control, errno: %d\n",
> +				 hdl->error);
> +
> +			return hdl->error;
> +		}
> +
> +		ctx->ctrls[i] = ctrl;
> +	}
> +
> +	ctx->fh.ctrl_handler = hdl;
> +	v4l2_ctrl_handler_setup(hdl);
> +
> +	return 0;
> +}
> +
> +static void vivpu_free_ctrls(struct vivpu_ctx *ctx)
> +{
> +	kfree(ctx->ctrls);
> +	v4l2_ctrl_handler_free(&ctx->hdl);
> +}
> +
> +static int vivpu_open(struct file *file)
> +{
> +	struct vivpu_dev *dev = video_drvdata(file);
> +	struct vivpu_ctx *ctx = NULL;
> +	int rc = 0;
> +
> +	if (mutex_lock_interruptible(&dev->dev_mutex))
> +		return -ERESTARTSYS;
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx) {
> +		rc = -ENOMEM;
> +		goto unlock;
> +	}
> +
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data = &ctx->fh;
> +	ctx->dev = dev;
> +
> +	rc = vivpu_init_ctrls(ctx);
> +	if (rc)
> +		goto free_ctx;
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, ctx, &vivpu_queue_init);
> +
> +	mutex_init(&ctx->vb_mutex);
> +
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		rc = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto free_hdl;
> +	}
> +
> +	vivpu_set_default_format(ctx);
> +
> +	v4l2_fh_add(&ctx->fh);
> +
> +	dprintk(dev, "Created instance: %p, m2m_ctx: %p\n",
> +		ctx, ctx->fh.m2m_ctx);
> +
> +	mutex_unlock(&dev->dev_mutex);
> +	return rc;
> +
> +free_hdl:
> +	vivpu_free_ctrls(ctx);
> +	v4l2_fh_exit(&ctx->fh);
> +free_ctx:
> +	kfree(ctx);
> +unlock:
> +	mutex_unlock(&dev->dev_mutex);
> +	return rc;
> +}
> +
> +static int vivpu_release(struct file *file)
> +{
> +	struct vivpu_dev *dev = video_drvdata(file);
> +	struct vivpu_ctx *ctx = vivpu_file_to_ctx(file);
> +
> +	dprintk(dev, "Releasing instance %p\n", ctx);
> +
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	vivpu_free_ctrls(ctx);
> +	mutex_lock(&dev->dev_mutex);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	mutex_unlock(&dev->dev_mutex);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations vivpu_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= vivpu_open,
> +	.release	= vivpu_release,
> +	.poll		= v4l2_m2m_fop_poll,
> +	.unlocked_ioctl	= video_ioctl2,
> +	.mmap		= v4l2_m2m_fop_mmap,
> +};
> +
> +static const struct video_device vivpu_videodev = {
> +	.name		= VIVPU_NAME,
> +	.vfl_dir	= VFL_DIR_M2M,
> +	.fops		= &vivpu_fops,
> +	.ioctl_ops	= &vivpu_ioctl_ops,
> +	.minor		= -1,
> +	.release	= vivpu_device_release,
> +	.device_caps	= V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
> +};
> +
> +static const struct v4l2_m2m_ops vivpu_m2m_ops = {
> +	.device_run	= vivpu_device_run,
> +};
> +
> +static const struct media_device_ops vivpu_m2m_media_ops = {
> +	.req_validate	= vivpu_request_validate,
> +	.req_queue	= v4l2_m2m_request_queue,
> +};
> +
> +static int vivpu_probe(struct platform_device *pdev)
> +{
> +	struct vivpu_dev *dev;
> +	struct video_device *vfd;
> +	int ret;
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +	if (ret)
> +		goto error_vivpu_dev;
> +
> +	mutex_init(&dev->dev_mutex);
> +
> +	dev->vfd = vivpu_videodev;
> +	vfd = &dev->vfd;
> +	vfd->lock = &dev->dev_mutex;
> +	vfd->v4l2_dev = &dev->v4l2_dev;
> +
> +	video_set_drvdata(vfd, dev);
> +	v4l2_info(&dev->v4l2_dev,
> +		  "Device registered as /dev/video%d\n", vfd->num);
> +
> +	platform_set_drvdata(pdev, dev);
> +
> +	dev->m2m_dev = v4l2_m2m_init(&vivpu_m2m_ops);
> +	if (IS_ERR(dev->m2m_dev)) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(dev->m2m_dev);
> +		dev->m2m_dev = NULL;
> +		goto error_dev;
> +	}
> +
> +	dev->mdev.dev = &pdev->dev;
> +	strscpy(dev->mdev.model, "vivpu", sizeof(dev->mdev.model));
> +	strscpy(dev->mdev.bus_info, "platform:vivpu",
> +		sizeof(dev->mdev.bus_info));
> +	media_device_init(&dev->mdev);
> +	dev->mdev.ops = &vivpu_m2m_media_ops;
> +	dev->v4l2_dev.mdev = &dev->mdev;
> +
> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> +		goto error_m2m;
> +	}
> +
> +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
> +		goto error_v4l2;
> +	}
> +
> +	ret = media_device_register(&dev->mdev);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
> +		goto error_m2m_mc;
> +	}
> +
> +	return 0;
> +
> +error_m2m_mc:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> +error_v4l2:
> +	video_unregister_device(&dev->vfd);
> +	/* vivpu_device_release called by video_unregister_device to release various objects */
> +	return ret;
> +error_m2m:
> +	v4l2_m2m_release(dev->m2m_dev);
> +error_dev:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +error_vivpu_dev:
> +	kfree(dev);
> +
> +	return ret;
> +}
> +
> +static int vivpu_remove(struct platform_device *pdev)
> +{
> +	struct vivpu_dev *dev = platform_get_drvdata(pdev);
> +
> +	v4l2_info(&dev->v4l2_dev, "Removing " VIVPU_NAME);
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	if (media_devnode_is_registered(dev->mdev.devnode)) {
> +		media_device_unregister(&dev->mdev);
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> +	}
> +#endif
> +	video_unregister_device(&dev->vfd);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver vivpu_pdrv = {
> +	.probe		= vivpu_probe,
> +	.remove		= vivpu_remove,
> +	.driver		= {
> +		.name	= VIVPU_NAME,
> +	},
> +};
> +
> +static void vivpu_dev_release(struct device *dev) {}
> +
> +static struct platform_device vivpu_pdev = {
> +	.name		= VIVPU_NAME,
> +	.dev.release	= vivpu_dev_release,
> +};
> +
> +static void __exit vivpu_exit(void)
> +{
> +	platform_driver_unregister(&vivpu_pdrv);
> +	platform_device_unregister(&vivpu_pdev);
> +}
> +
> +static int __init vivpu_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_device_register(&vivpu_pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&vivpu_pdrv);
> +	if (ret)
> +		platform_device_unregister(&vivpu_pdev);
> +
> +	return ret;
> +}
> +
> +MODULE_DESCRIPTION("Virtual VPU device");
> +MODULE_AUTHOR("Daniel Almeida <daniel.almeida@collabora.com>");
> +MODULE_LICENSE("GPL v2");
> +
> +module_init(vivpu_init);
> +module_exit(vivpu_exit);
> diff --git a/drivers/media/test-drivers/vivpu/vivpu-dec.c b/drivers/media/test-drivers/vivpu/vivpu-dec.c
> new file mode 100644
> index 000000000000..f928768aff77
> --- /dev/null
> +++ b/drivers/media/test-drivers/vivpu/vivpu-dec.c
> @@ -0,0 +1,491 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * A virtual stateless VPU example device for uAPI development purposes.
> + *
> + * A userspace implementation can use vivpu to run a decoding loop even
> + * when no hardware is available or when the kernel uAPI for the codec
> + * has not been upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version
> + */
> +
> +#include "vivpu.h"
> +#include "vivpu-dec.h"
> +
> +#include <linux/delay.h>
> +#include <linux/workqueue.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/tpg/v4l2-tpg.h>
> +
> +static void
> +vivpu_av1_check_reference_frames(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	u32 i;
> +	int idx;
> +	const struct v4l2_ctrl_av1_frame_header *f;
> +	struct vb2_queue *capture_queue;
> +
> +	f = run->av1.frame_header;
> +	capture_queue = &ctx->fh.m2m_ctx->cap_q_ctx.q;
> +
> +	/*
> +	 * For every reference frame timestamp, make sure we can actually find
> +	 * the buffer in the CAPTURE queue.
> +	 */
> +	for (i = 0; i < V4L2_AV1_NUM_REF_FRAMES; i++) {
> +		idx = vb2_find_timestamp(capture_queue, f->reference_frame_ts[i], 0);
> +		if (idx < 0)
> +			v4l2_err(&ctx->dev->v4l2_dev,
> +				 "no capture buffer found for reference_frame_ts[%d] %llu",
> +				 i, f->reference_frame_ts[i]);
> +		else
> +			dprintk(ctx->dev,
> +				"found capture buffer %d for reference_frame_ts[%d] %llu\n",
> +				idx, i, f->reference_frame_ts[i]);
> +	}
> +}
> +
> +static void vivpu_dump_av1_seq(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_ctrl_av1_sequence *seq = run->av1.sequence;
> +
> +	dprintk(ctx->dev, "AV1 Sequence\n");
> +	dprintk(ctx->dev, "flags %d\n", seq->flags);
> +	dprintk(ctx->dev, "profile %d\n", seq->seq_profile);
> +	dprintk(ctx->dev, "order_hint_bits %d\n", seq->order_hint_bits);
> +	dprintk(ctx->dev, "bit_depth %d\n", seq->bit_depth);
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_tile_group(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_ctrl_av1_tile_group *tg;
> +	u32 n;
> +	u32 i;
> +
> +	n = vivpu_control_num_elems(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP);
> +	for (i = 0; i < n; i++) {
> +		tg = &run->av1.tile_group[i];
> +		dprintk(ctx->dev, "AV1 Tile Group\n");
> +		dprintk(ctx->dev, "flags %d\n", tg->flags);
> +		dprintk(ctx->dev, "tg_start %d\n", tg->tg_start);
> +		dprintk(ctx->dev, "tg_end %d\n", tg->tg_end);
> +		dprintk(ctx->dev, "\n");
> +	}
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_tile_group_entry(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_ctrl_av1_tile_group_entry *tge;
> +	u32 n;
> +	u32 i;
> +
> +	n = vivpu_control_num_elems(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
> +	for (i = 0; i < n; i++) {
> +		tge = &run->av1.tg_entries[i];
> +		dprintk(ctx->dev, "AV1 Tile Group Entry\n");
> +		dprintk(ctx->dev, "tile_offset %d\n", tge->tile_offset);
> +		dprintk(ctx->dev, "tile_size %d\n", tge->tile_size);
> +		dprintk(ctx->dev, "tile_row %d\n", tge->tile_row);
> +		dprintk(ctx->dev, "tile_col %d\n", tge->tile_col);
> +
> +		dprintk(ctx->dev, "\n");
> +	}
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_tile_list(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_ctrl_av1_tile_list *tl;
> +	u32 n;
> +	u32 i;
> +
> +	n = vivpu_control_num_elems(ctx, V4L2_CID_STATELESS_AV1_TILE_LIST);
> +	for (i = 0; i < n; i++) {
> +		tl = &run->av1.tile_list[i];
> +		dprintk(ctx->dev, "AV1 Tile List\n");
> +		dprintk(ctx->dev, "output_frame_width_in_tiles_minus_1 %d\n",
> +			tl->output_frame_width_in_tiles_minus_1);
> +		dprintk(ctx->dev, "output_frame_height_in_tiles_minus_1 %d\n",
> +			tl->output_frame_height_in_tiles_minus_1);
> +		dprintk(ctx->dev, "tile_count_minus_1 %d\n",
> +			tl->tile_count_minus_1);
> +		dprintk(ctx->dev, "\n");
> +	}
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_tile_list_entry(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_ctrl_av1_tile_list_entry *tle;
> +	u32 n;
> +	u32 i;
> +
> +	n = vivpu_control_num_elems(ctx, V4L2_CID_STATELESS_AV1_TILE_LIST_ENTRY);
> +	for (i = 0; i < n; i++) {
> +		tle = &run->av1.tl_entries[i];
> +		dprintk(ctx->dev, "AV1 Tile List Entry\n");
> +		dprintk(ctx->dev, "anchor_frame_idx %d\n", tle->anchor_frame_idx);
> +		dprintk(ctx->dev, "anchor_tile_row %d\n", tle->anchor_tile_row);
> +		dprintk(ctx->dev, "anchor_tile_col %d\n", tle->anchor_tile_col);
> +		dprintk(ctx->dev, "tile_data_size_minus_1 %d\n",
> +			tle->tile_data_size_minus_1);
> +		dprintk(ctx->dev, "\n");
> +	}
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_quantization(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_av1_quantization *q = &run->av1.frame_header->quantization;
> +
> +	dprintk(ctx->dev, "AV1 Quantization\n");
> +	dprintk(ctx->dev, "flags %d\n", q->flags);
> +	dprintk(ctx->dev, "base_q_idx %d\n", q->base_q_idx);
> +	dprintk(ctx->dev, "delta_q_y_dc %d\n", q->delta_q_y_dc);
> +	dprintk(ctx->dev, "delta_q_u_dc %d\n", q->delta_q_u_dc);
> +	dprintk(ctx->dev, "delta_q_u_ac %d\n", q->delta_q_u_ac);
> +	dprintk(ctx->dev, "delta_q_v_dc %d\n", q->delta_q_v_dc);
> +	dprintk(ctx->dev, "delta_q_v_ac %d\n", q->delta_q_v_ac);
> +	dprintk(ctx->dev, "qm_y %d\n", q->qm_y);
> +	dprintk(ctx->dev, "qm_u %d\n", q->qm_u);
> +	dprintk(ctx->dev, "qm_v %d\n", q->qm_v);
> +	dprintk(ctx->dev, "delta_q_res %d\n", q->delta_q_res);
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_segmentation(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_av1_segmentation *s = &run->av1.frame_header->segmentation;
> +	u32 i;
> +	u32 j;
> +
> +	dprintk(ctx->dev, "AV1 Segmentation\n");
> +	dprintk(ctx->dev, "flags %d\n", s->flags);
> +
> +	for (i = 0; i < ARRAY_SIZE(s->feature_enabled); i++)
> +		dprintk(ctx->dev,
> +			"feature_enabled[%d] %d\n",
> +			i, s->feature_enabled[i]);
> +
> +	for (i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++)
> +		for (j = 0; j < V4L2_AV1_SEG_LVL_MAX; j++)
> +			dprintk(ctx->dev,
> +				"feature_data[%d][%d] %d\n",
> +				i, j, s->feature_data[i][j]);
> +
> +	dprintk(ctx->dev, "last_active_seg_id %d\n", s->last_active_seg_id);
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_loop_filter(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_av1_loop_filter *lf = &run->av1.frame_header->loop_filter;
> +	u32 i;
> +
> +	dprintk(ctx->dev, "AV1 Loop Filter\n");
> +	dprintk(ctx->dev, "flags %d\n", lf->flags);
> +
> +	for (i = 0; i < ARRAY_SIZE(lf->level); i++)
> +		dprintk(ctx->dev, "level[%d] %d\n", i, lf->level[i]);
> +
> +	dprintk(ctx->dev, "sharpness %d\n", lf->sharpness);
> +
> +	for (i = 0; i < ARRAY_SIZE(lf->ref_deltas); i++)
> +		dprintk(ctx->dev, "ref_deltas[%d] %d\n", i, lf->ref_deltas[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(lf->mode_deltas); i++)
> +		dprintk(ctx->dev, "mode_deltas[%d], %d\n", i, lf->mode_deltas[i]);
> +
> +	dprintk(ctx->dev, "delta_lf_res %d\n", lf->delta_lf_res);
> +	dprintk(ctx->dev, "delta_lf_multi %d\n", lf->delta_lf_multi);
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_loop_restoration(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_av1_loop_restoration *lr;
> +	u32 i;
> +
> +	lr = &run->av1.frame_header->loop_restoration;
> +	dprintk(ctx->dev, "AV1 Loop Restoration\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(lr->frame_restoration_type); i++)
> +		dprintk(ctx->dev, "frame_restoration_type[%d] %d\n", i,
> +			lr->frame_restoration_type[i]);
> +
> +	dprintk(ctx->dev, "lr_unit_shift %d\n", lr->lr_unit_shift);
> +	dprintk(ctx->dev, "lr_uv_shift %d\n", lr->lr_uv_shift);
> +
> +	for (i = 0; i < ARRAY_SIZE(lr->loop_restoration_size); i++)
> +		dprintk(ctx->dev, "loop_restoration_size[%d] %d\n",
> +			i, lr->loop_restoration_size[i]);
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_cdef(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_av1_cdef *cdef = &run->av1.frame_header->cdef;
> +	u32 i;
> +
> +	dprintk(ctx->dev, "AV1 CDEF\n");
> +	dprintk(ctx->dev, "damping_minus_3 %d\n", cdef->damping_minus_3);
> +	dprintk(ctx->dev, "bits %d\n", cdef->bits);
> +
> +	for (i = 0; i < ARRAY_SIZE(cdef->y_pri_strength); i++)
> +		dprintk(ctx->dev,
> +			"y_pri_strength[%d] %d\n", i, cdef->y_pri_strength[i]);
> +	for (i = 0; i < ARRAY_SIZE(cdef->y_sec_strength); i++)
> +		dprintk(ctx->dev,
> +			"y_sec_strength[%d] %d\n", i, cdef->y_sec_strength[i]);
> +	for (i = 0; i < ARRAY_SIZE(cdef->uv_pri_strength); i++)
> +		dprintk(ctx->dev,
> +			"uv_pri_strength[%d] %d\n", i, cdef->uv_pri_strength[i]);
> +	for (i = 0; i < ARRAY_SIZE(cdef->uv_sec_strength); i++)
> +		dprintk(ctx->dev,
> +			"uv_sec_strength[%d] %d\n", i, cdef->uv_sec_strength[i]);
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_global_motion(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_av1_global_motion *gm;
> +	u32 i;
> +	u32 j;
> +
> +	gm = &run->av1.frame_header->global_motion;
> +
> +	dprintk(ctx->dev, "AV1 Global Motion\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(gm->flags); i++)
> +		dprintk(ctx->dev, "flags[%d] %d\n", i, gm->flags[i]);
> +	for (i = 0; i < ARRAY_SIZE(gm->type); i++)
> +		dprintk(ctx->dev, "type[%d] %d\n", i, gm->type[i]);
> +
> +	for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++)
> +		for (j = 0; j < 6; j++)
> +			dprintk(ctx->dev, "params[%d][%d] %d\n",
> +				i, j, gm->type[i]);
> +
> +	dprintk(ctx->dev, "invalid %d\n", gm->invalid);
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_film_grain(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_av1_film_grain *fg;
> +	u32 i;
> +
> +	fg = &run->av1.frame_header->film_grain;
> +
> +	dprintk(ctx->dev, "AV1 Film Grain\n");
> +	dprintk(ctx->dev, "flags %d\n", fg->flags);
> +	dprintk(ctx->dev, "grain_seed %d\n", fg->grain_seed);
> +	dprintk(ctx->dev, "film_grain_params_ref_idx %d\n",
> +		fg->film_grain_params_ref_idx);
> +	dprintk(ctx->dev, "num_y_points %d\n", fg->num_y_points);
> +
> +	for (i = 0; i < ARRAY_SIZE(fg->point_y_value); i++)
> +		dprintk(ctx->dev, "point_y_value[%d] %d\n",
> +			i, fg->point_y_value[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(fg->point_y_scaling); i++)
> +		dprintk(ctx->dev, "point_y_scaling[%d] %d\n",
> +			i, fg->point_y_scaling[i]);
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void
> +vivpu_dump_av1_tile_info(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_av1_tile_info *ti;
> +	u32 i;
> +
> +	ti = &run->av1.frame_header->tile_info;
> +
> +	dprintk(ctx->dev, "AV1 Tile Info\n");
> +
> +	dprintk(ctx->dev, "flags %d\n", ti->flags);
> +
> +	for (i = 0; i < ARRAY_SIZE(ti->mi_col_starts); i++)
> +		dprintk(ctx->dev, "mi_col_starts[%d] %d\n",
> +			i, ti->mi_col_starts[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(ti->mi_row_starts); i++)
> +		dprintk(ctx->dev, "mi_row_starts[%d] %d\n",
> +			i, ti->mi_row_starts[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(ti->width_in_sbs_minus_1); i++)
> +		dprintk(ctx->dev, "width_in_sbs_minus_1[%d] %d\n",
> +			i, ti->width_in_sbs_minus_1[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(ti->height_in_sbs_minus_1); i++)
> +		dprintk(ctx->dev, "height_in_sbs_minus_1[%d] %d\n",
> +			i, ti->height_in_sbs_minus_1[i]);
> +
> +	dprintk(ctx->dev, "tile_size_bytes %d\n", ti->tile_size_bytes);
> +	dprintk(ctx->dev, "context_update_tile_id %d\n", ti->context_update_tile_id);
> +	dprintk(ctx->dev, "tile_cols %d\n", ti->tile_cols);
> +	dprintk(ctx->dev, "tile_rows %d\n", ti->tile_rows);
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void vivpu_dump_av1_frame(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	const struct v4l2_ctrl_av1_frame_header *f = run->av1.frame_header;
> +	u32 i;
> +
> +	dprintk(ctx->dev, "AV1 Frame Header\n");
> +	dprintk(ctx->dev, "flags %d\n", f->flags);
> +	dprintk(ctx->dev, "frame_type %d\n", f->frame_type);
> +	dprintk(ctx->dev, "order_hint %d\n", f->order_hint);
> +	dprintk(ctx->dev, "superres_denom %d\n", f->superres_denom);
> +	dprintk(ctx->dev, "upscaled_width %d\n", f->upscaled_width);
> +	dprintk(ctx->dev, "interpolation_filter %d\n", f->interpolation_filter);
> +	dprintk(ctx->dev, "tx_mode %d\n", f->tx_mode);
> +	dprintk(ctx->dev, "frame_width_minus_1 %d\n", f->frame_width_minus_1);
> +	dprintk(ctx->dev, "frame_height_minus_1 %d\n", f->frame_height_minus_1);
> +	dprintk(ctx->dev, "render_width_minus_1 %d\n", f->render_width_minus_1);
> +	dprintk(ctx->dev, "render_height_minus_1 %d\n", f->render_height_minus_1);
> +	dprintk(ctx->dev, "current_frame_id %d\n", f->current_frame_id);
> +	dprintk(ctx->dev, "primary_ref_frame %d\n", f->primary_ref_frame);
> +
> +	for (i = 0; i < V4L2_AV1_MAX_OPERATING_POINTS; i++) {
> +		dprintk(ctx->dev, "buffer_removal_time[%d] %d\n",
> +			i, f->buffer_removal_time[i]);
> +	}
> +
> +	dprintk(ctx->dev, "refresh_frame_flags %d\n", f->refresh_frame_flags);
> +	dprintk(ctx->dev, "last_frame_idx %d\n", f->last_frame_idx);
> +	dprintk(ctx->dev, "gold_frame_idx %d\n", f->gold_frame_idx);
> +
> +	for (i = 0; i < ARRAY_SIZE(f->reference_frame_ts); i++)
> +		dprintk(ctx->dev, "reference_frame_ts[%d] %llu\n", i,
> +			f->reference_frame_ts[i]);
> +
> +	vivpu_dump_av1_tile_info(ctx, run);
> +	vivpu_dump_av1_quantization(ctx, run);
> +	vivpu_dump_av1_segmentation(ctx, run);
> +	vivpu_dump_av1_loop_filter(ctx, run);
> +	vivpu_dump_av1_cdef(ctx, run);
> +	vivpu_dump_av1_loop_restoration(ctx, run);
> +	vivpu_dump_av1_global_motion(ctx, run);
> +	vivpu_dump_av1_film_grain(ctx, run);
> +
> +	for (i = 0; i < ARRAY_SIZE(f->skip_mode_frame); i++)
> +		dprintk(ctx->dev, "skip_mode_frame[%d] %d\n",
> +			i, f->skip_mode_frame[i]);
> +
> +	dprintk(ctx->dev, "\n");
> +}
> +
> +static void vivpu_dump_av1_ctrls(struct vivpu_ctx *ctx, struct vivpu_run *run)
> +{
> +	vivpu_dump_av1_seq(ctx, run);
> +	vivpu_dump_av1_frame(ctx, run);
> +	vivpu_dump_av1_tile_group(ctx, run);
> +	vivpu_dump_av1_tile_group_entry(ctx, run);
> +	vivpu_dump_av1_tile_list(ctx, run);
> +	vivpu_dump_av1_tile_list_entry(ctx, run);
> +}
> +
> +void vivpu_device_run(void *priv)
> +{
> +	struct vivpu_ctx *ctx = priv;
> +	struct vivpu_run run = {};
> +	struct media_request *src_req;
> +
> +	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	/* Apply request(s) controls if needed. */
> +	src_req = run.src->vb2_buf.req_obj.req;
> +
> +	if (src_req)
> +		v4l2_ctrl_request_setup(src_req, &ctx->hdl);
> +
> +	switch (ctx->current_codec) {
> +	case VIVPU_CODEC_AV1:
> +		run.av1.sequence =
> +			vivpu_find_control_data(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
> +		run.av1.frame_header =
> +			vivpu_find_control_data(ctx, V4L2_CID_STATELESS_AV1_FRAME_HEADER);
> +		run.av1.tile_group =
> +			vivpu_find_control_data(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP);
> +		run.av1.tg_entries =
> +			vivpu_find_control_data(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
> +		run.av1.tile_list =
> +			vivpu_find_control_data(ctx, V4L2_CID_STATELESS_AV1_TILE_LIST);
> +		run.av1.tl_entries =
> +			vivpu_find_control_data(ctx, V4L2_CID_STATELESS_AV1_TILE_LIST_ENTRY);
> +
> +		vivpu_dump_av1_ctrls(ctx, &run);
> +		vivpu_av1_check_reference_frames(ctx, &run);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	v4l2_m2m_buf_copy_metadata(run.src, run.dst, true);
> +	run.dst->sequence = ctx->q_data[V4L2_M2M_DST].sequence++;
> +	run.src->sequence = ctx->q_data[V4L2_M2M_SRC].sequence++;
> +	run.dst->field = ctx->dst_fmt.fmt.pix.field;
> +
> +	dprintk(ctx->dev, "Got src buffer %p, sequence %d, timestamp %llu\n",
> +		run.src, run.src->sequence, run.src->vb2_buf.timestamp);
> +
> +	dprintk(ctx->dev, "Got dst buffer %p, sequence %d, timestamp %llu\n",
> +		run.dst, run.dst->sequence, run.dst->vb2_buf.timestamp);
> +
> +	/* Complete request(s) controls if needed. */
> +	if (src_req)
> +		v4l2_ctrl_request_complete(src_req, &ctx->hdl);
> +
> +	if (vivpu_transtime)
> +		usleep_range(vivpu_transtime, vivpu_transtime * 2);
> +
> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev,
> +					 ctx->fh.m2m_ctx, VB2_BUF_STATE_DONE);
> +}
> diff --git a/drivers/media/test-drivers/vivpu/vivpu-dec.h b/drivers/media/test-drivers/vivpu/vivpu-dec.h
> new file mode 100644
> index 000000000000..4a3ca5952e43
> --- /dev/null
> +++ b/drivers/media/test-drivers/vivpu/vivpu-dec.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * A virtual stateless VPU example device for uAPI development purposes.
> + *
> + * A userspace implementation can use vivpu to run a decoding loop even
> + * when no hardware is available or when the kernel uAPI for the codec
> + * has not been upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version
> + */
> +
> +#ifndef _VIVPU_DEC_H_
> +#define _VIVPU_DEC_H_
> +
> +#include "vivpu.h"
> +
> +struct vivpu_av1_run {
> +	const struct v4l2_ctrl_av1_sequence *sequence;
> +	const struct v4l2_ctrl_av1_frame_header *frame_header;
> +	const struct v4l2_ctrl_av1_tile_group *tile_group;
> +	const struct v4l2_ctrl_av1_tile_group_entry *tg_entries;
> +	const struct v4l2_ctrl_av1_tile_list *tile_list;
> +	const struct v4l2_ctrl_av1_tile_list_entry *tl_entries;
> +};
> +
> +struct vivpu_run {
> +	struct vb2_v4l2_buffer	*src;
> +	struct vb2_v4l2_buffer	*dst;
> +
> +	union {
> +		struct vivpu_av1_run	av1;
> +	};
> +};
> +
> +int vivpu_dec_start(struct vivpu_ctx *ctx);
> +int vivpu_dec_stop(struct vivpu_ctx *ctx);
> +int vivpu_job_ready(void *priv);
> +void vivpu_device_run(void *priv);
> +
> +#endif /* _VIVPU_DEC_H_ */
> diff --git a/drivers/media/test-drivers/vivpu/vivpu-video.c b/drivers/media/test-drivers/vivpu/vivpu-video.c
> new file mode 100644
> index 000000000000..a3018b0a4da3
> --- /dev/null
> +++ b/drivers/media/test-drivers/vivpu/vivpu-video.c
> @@ -0,0 +1,599 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * A virtual stateless VPU example device for uAPI development purposes.
> + *
> + * A userspace implementation can use vivpu to run a decoding loop even
> + * when no hardware is available or when the kernel uAPI for the codec
> + * has not been upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version
> + */
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#include "vivpu-video.h"
> +#include "vivpu.h"
> +
> +static const u32 vivpu_decoded_formats[] = {
> +	V4L2_PIX_FMT_NV12,
> +};
> +
> +static const struct vivpu_coded_format_desc coded_formats[] = {
> +	{
> +	.pixelformat = V4L2_PIX_FMT_AV1_FRAME,
> +	/* simulated frame sizes for AV1 */
> +	.frmsize = {
> +		.min_width = 48,
> +		.max_width = 4096,
> +		.step_width = 16,
> +		.min_height = 48,
> +		.max_height = 2304,
> +		.step_height = 16,
> +	},
> +	.num_decoded_fmts = ARRAY_SIZE(vivpu_decoded_formats),
> +	/* simulate that the AV1 coded format decodes to raw NV12 */
> +	.decoded_fmts = vivpu_decoded_formats,
> +	}
> +};
> +
> +static const struct vivpu_coded_format_desc*
> +vivpu_find_coded_fmt_desc(u32 fourcc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(coded_formats); i++) {
> +		if (coded_formats[i].pixelformat == fourcc)
> +			return &coded_formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +void vivpu_set_default_format(struct vivpu_ctx *ctx)
> +{
> +	struct v4l2_format src_fmt = {
> +		.fmt.pix = {
> +			.width = vivpu_src_default_w,
> +			.height = vivpu_src_default_h,
> +			/* Zero bytes per line for encoded source. */
> +			.bytesperline = 0,
> +			/* Choose some minimum size since this can't be 0 */
> +			.sizeimage = SZ_1K,
> +		},
> +	};
> +
> +	ctx->coded_format_desc = &coded_formats[0];
> +	ctx->src_fmt = src_fmt;
> +
> +	v4l2_fill_pixfmt_mp(&ctx->dst_fmt.fmt.pix_mp,
> +			    V4L2_PIX_FMT_NV12,
> +			    vivpu_src_default_w, vivpu_src_default_h);
> +
> +	/* Always apply the frmsize constraint of the coded end. */
> +	v4l2_apply_frmsize_constraints(&ctx->dst_fmt.fmt.pix.width,
> +				       &ctx->dst_fmt.fmt.pix.height,
> +				       &ctx->coded_format_desc->frmsize);
> +
> +	ctx->src_fmt.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	ctx->dst_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +}
> +
> +static const char *q_name(enum v4l2_buf_type type)
> +{
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +		return "Output";
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +		return "Capture";
> +	default:
> +		return "Invalid";
> +	}
> +}
> +
> +static struct vivpu_q_data *get_q_data(struct vivpu_ctx *ctx,
> +				       enum v4l2_buf_type type)
> +{
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		return &ctx->q_data[V4L2_M2M_SRC];
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		return &ctx->q_data[V4L2_M2M_DST];
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
> +static int vivpu_querycap(struct file *file, void *priv,
> +			  struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, VIVPU_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, VIVPU_NAME, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", VIVPU_NAME);
> +
> +	return 0;
> +}
> +
> +static int vivpu_enum_fmt_vid_cap(struct file *file, void *priv,
> +				  struct v4l2_fmtdesc *f)
> +{
> +	struct vivpu_ctx *ctx = vivpu_file_to_ctx(file);
> +
> +	if (f->index >= ctx->coded_format_desc->num_decoded_fmts)
> +		return -EINVAL;
> +
> +	f->pixelformat = ctx->coded_format_desc->decoded_fmts[f->index];
> +	return 0;
> +}
> +
> +static int vivpu_enum_fmt_vid_out(struct file *file, void *priv,
> +				  struct v4l2_fmtdesc *f)
> +{
> +	if (f->index >= ARRAY_SIZE(coded_formats))
> +		return -EINVAL;
> +
> +	f->pixelformat = coded_formats[f->index].pixelformat;
> +	return 0;
> +}
> +
> +static int vivpu_g_fmt_vid_cap(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
> +	struct vivpu_ctx *ctx = vivpu_file_to_ctx(file);
> +	*f = ctx->dst_fmt;
> +
> +	return 0;
> +}
> +
> +static int vivpu_g_fmt_vid_out(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
> +	struct vivpu_ctx *ctx = vivpu_file_to_ctx(file);
> +
> +	*f = ctx->src_fmt;
> +	return 0;
> +}
> +
> +static int vivpu_try_fmt_vid_cap(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	struct vivpu_ctx *ctx = vivpu_file_to_ctx(file);
> +	const struct vivpu_coded_format_desc *coded_desc;
> +	unsigned int i;
> +
> +	coded_desc = ctx->coded_format_desc;
> +	if (WARN_ON(!coded_desc))
> +		return -EINVAL;
> +
> +	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> +		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
> +			break;
> +	}
> +
> +	if (i == coded_desc->num_decoded_fmts)
> +		return -EINVAL;
> +
> +	v4l2_apply_frmsize_constraints(&pix_mp->width,
> +				       &pix_mp->height,
> +				       &coded_desc->frmsize);
> +
> +	pix_mp->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static int vivpu_try_fmt_vid_out(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	const struct vivpu_coded_format_desc *coded_desc;
> +
> +	coded_desc = vivpu_find_coded_fmt_desc(pix_mp->pixelformat);
> +	if (!coded_desc)
> +		return -EINVAL;
> +
> +	/* apply the (simulated) hw constraints */
> +	v4l2_apply_frmsize_constraints(&pix_mp->width,
> +				       &pix_mp->height,
> +				       &coded_desc->frmsize);
> +
> +	pix_mp->field = V4L2_FIELD_NONE;
> +	/* All coded formats are considered single planar for now. */
> +	pix_mp->num_planes = 1;
> +
> +	return 0;
> +}
> +
> +static int vivpu_s_fmt_vid_out(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
> +	struct vivpu_ctx *ctx = vivpu_file_to_ctx(file);
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	struct v4l2_format *cap_fmt = &ctx->dst_fmt;
> +	const struct vivpu_coded_format_desc *desc;
> +	struct vb2_queue *peer_vq;
> +	int ret;
> +
> +	peer_vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (vb2_is_busy(peer_vq))
> +		return -EBUSY;
> +
> +	dprintk(ctx->dev,
> +		"Current OUTPUT queue format: width %d, height %d, pixfmt %d\n",
> +		ctx->src_fmt.fmt.pix_mp.width, ctx->src_fmt.fmt.pix_mp.height,
> +		ctx->src_fmt.fmt.pix_mp.pixelformat);
> +
> +	dprintk(ctx->dev,
> +		"Current CAPTURE queue format: width %d, height %d, pixfmt %d\n",
> +		ctx->dst_fmt.fmt.pix_mp.width, ctx->dst_fmt.fmt.pix_mp.height,
> +		ctx->dst_fmt.fmt.pix_mp.pixelformat);
> +
> +	ret = vivpu_try_fmt_vid_out(file, priv, f);
> +	if (ret) {
> +		dprintk(ctx->dev,
> +			"Unsupported format for the OUTPUT queue: %d\n",
> +			f->fmt.pix_mp.pixelformat);
> +		return ret;
> +	}
> +
> +	desc = vivpu_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
> +	if (!desc) {
> +		dprintk(ctx->dev,
> +			"Unsupported format for the OUTPUT queue: %d\n",
> +			f->fmt.pix_mp.pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	ctx->coded_format_desc = desc;
> +
> +	ctx->src_fmt = *f;
> +
> +	v4l2_fill_pixfmt_mp(&ctx->dst_fmt.fmt.pix_mp,
> +			    ctx->coded_format_desc->decoded_fmts[0],
> +			    ctx->src_fmt.fmt.pix_mp.width,
> +			    ctx->src_fmt.fmt.pix_mp.height);
> +	cap_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
> +	cap_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
> +	cap_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
> +	cap_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
> +
> +	dprintk(ctx->dev,
> +		"Current OUTPUT queue format: width %d, height %d, pixfmt %d\n",
> +		ctx->src_fmt.fmt.pix_mp.width, ctx->src_fmt.fmt.pix_mp.height,
> +		ctx->src_fmt.fmt.pix_mp.pixelformat);
> +
> +	dprintk(ctx->dev,
> +		"Current CAPTURE queue format: width %d, height %d, pixfmt %d\n",
> +		ctx->dst_fmt.fmt.pix_mp.width, ctx->dst_fmt.fmt.pix_mp.height,
> +		ctx->dst_fmt.fmt.pix_mp.pixelformat);
> +
> +	return 0;
> +}
> +
> +static int vivpu_s_fmt_vid_cap(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
> +	struct vivpu_ctx *ctx = vivpu_file_to_ctx(file);
> +	int ret;
> +
> +	dprintk(ctx->dev,
> +		"Current CAPTURE queue format: width %d, height %d, pixfmt %d\n",
> +		ctx->dst_fmt.fmt.pix_mp.width, ctx->dst_fmt.fmt.pix_mp.height,
> +		ctx->dst_fmt.fmt.pix_mp.pixelformat);
> +
> +	ret = vivpu_try_fmt_vid_cap(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	ctx->dst_fmt = *f;
> +
> +	dprintk(ctx->dev,
> +		"Current CAPTURE queue format: width %d, height %d, pixfmt %d\n",
> +		ctx->dst_fmt.fmt.pix_mp.width, ctx->dst_fmt.fmt.pix_mp.height,
> +		ctx->dst_fmt.fmt.pix_mp.pixelformat);
> +
> +	return 0;
> +}
> +
> +static int vivpu_enum_framesizes(struct file *file, void *priv,
> +				 struct v4l2_frmsizeenum *fsize)
> +{
> +	const struct vivpu_coded_format_desc *fmt;
> +	struct vivpu_ctx *ctx = vivpu_file_to_ctx(file);
> +
> +	if (fsize->index != 0)
> +		return -EINVAL;
> +
> +	fmt = vivpu_find_coded_fmt_desc(fsize->pixel_format);
> +	if (!fmt) {
> +		dprintk(ctx->dev,
> +			"Unsupported format for the OUTPUT queue: %d\n",
> +			fsize->pixel_format);
> +
> +		return -EINVAL;
> +	}
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise = fmt->frmsize;
> +	return 0;
> +}
> +
> +const struct v4l2_ioctl_ops vivpu_ioctl_ops = {
> +	.vidioc_querycap		= vivpu_querycap,
> +	.vidioc_enum_framesizes		= vivpu_enum_framesizes,
> +
> +	.vidioc_enum_fmt_vid_cap	= vivpu_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap		= vivpu_g_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap		= vivpu_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap		= vivpu_s_fmt_vid_cap,
> +
> +	.vidioc_enum_fmt_vid_out	= vivpu_enum_fmt_vid_out,
> +	.vidioc_g_fmt_vid_out		= vivpu_g_fmt_vid_out,
> +	.vidioc_try_fmt_vid_out		= vivpu_try_fmt_vid_out,
> +	.vidioc_s_fmt_vid_out		= vivpu_s_fmt_vid_out,
> +
> +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
> +
> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> +
> +	.vidioc_try_decoder_cmd		= v4l2_m2m_ioctl_stateless_try_decoder_cmd,
> +	.vidioc_decoder_cmd		= v4l2_m2m_ioctl_stateless_decoder_cmd,
> +
> +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +};
> +
> +static int vivpu_queue_setup(struct vb2_queue *vq,
> +			     unsigned int *nbuffers,
> +			     unsigned int *nplanes,
> +			     unsigned int sizes[],
> +			     struct device *alloc_devs[])
> +{
> +	struct vivpu_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct v4l2_pix_format *pix_fmt;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +		pix_fmt = &ctx->src_fmt.fmt.pix;
> +	else
> +		pix_fmt = &ctx->dst_fmt.fmt.pix;
> +
> +	if (*nplanes) {
> +		if (sizes[0] < pix_fmt->sizeimage) {
> +			v4l2_err(&ctx->dev->v4l2_dev, "sizes[0] is %d, sizeimage is %d\n",
> +				 sizes[0], pix_fmt->sizeimage);
> +			return -EINVAL;
> +		}
> +	} else {
> +		sizes[0] = pix_fmt->sizeimage;
> +		*nplanes = 1;
> +	}
> +
> +	dprintk(ctx->dev, "%s: get %d buffer(s) of size %d each.\n",
> +		q_name(vq->type), *nbuffers, sizes[0]);
> +
> +	return 0;
> +}
> +
> +static void vivpu_queue_cleanup(struct vb2_queue *vq, u32 state)
> +{
> +	struct vivpu_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	dprintk(ctx->dev, "Cleaning up queues\n");
> +	for (;;) {
> +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +		if (!vbuf)
> +			break;
> +
> +		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
> +					   &ctx->hdl);
> +		dprintk(ctx->dev, "Marked request %p as complete\n",
> +			vbuf->vb2_buf.req_obj.req);
> +
> +		v4l2_m2m_buf_done(vbuf, state);
> +		dprintk(ctx->dev,
> +			"Marked buffer %llu as done, state is %d\n",
> +			vbuf->vb2_buf.timestamp,
> +			state);
> +	}
> +}
> +
> +static int vivpu_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +	return 0;
> +}
> +
> +static int vivpu_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct vivpu_ctx *ctx = vb2_get_drv_priv(vq);
> +	u32 plane_sz = vb2_plane_size(vb, 0);
> +	struct v4l2_pix_format *pix_fmt;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +		pix_fmt = &ctx->src_fmt.fmt.pix;
> +	else
> +		pix_fmt = &ctx->dst_fmt.fmt.pix;
> +
> +	if (plane_sz < pix_fmt->sizeimage) {
> +		v4l2_err(&ctx->dev->v4l2_dev, "plane[0] size is %d, sizeimage is %d\n",
> +			 plane_sz, pix_fmt->sizeimage);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
> +
> +	return 0;
> +}
> +
> +static int vivpu_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct vivpu_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct vivpu_q_data *q_data = get_q_data(ctx, vq->type);
> +	int ret = 0;
> +
> +	if (!q_data)
> +		return -EINVAL;
> +
> +	q_data->sequence = 0;
> +
> +	switch (ctx->src_fmt.fmt.pix.pixelformat) {
> +	case V4L2_PIX_FMT_AV1_FRAME:
> +		dprintk(ctx->dev, "Pixfmt is AV1F\n");
> +		ctx->current_codec = VIVPU_CODEC_AV1;
> +		break;
> +	default:
> +		v4l2_err(&ctx->dev->v4l2_dev, "Unsupported src format %d\n",
> +			 ctx->src_fmt.fmt.pix.pixelformat);
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	vivpu_queue_cleanup(vq, VB2_BUF_STATE_QUEUED);
> +	return ret;
> +}
> +
> +static void vivpu_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct vivpu_ctx *ctx = vb2_get_drv_priv(vq);
> +
> +	dprintk(ctx->dev, "Stop streaming\n");
> +	vivpu_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
> +}
> +
> +static void vivpu_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct vivpu_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static void vivpu_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct vivpu_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> +}
> +
> +const struct vb2_ops vivpu_qops = {
> +	.queue_setup          = vivpu_queue_setup,
> +	.buf_out_validate     = vivpu_buf_out_validate,
> +	.buf_prepare          = vivpu_buf_prepare,
> +	.buf_queue            = vivpu_buf_queue,
> +	.start_streaming      = vivpu_start_streaming,
> +	.stop_streaming       = vivpu_stop_streaming,
> +	.wait_prepare         = vb2_ops_wait_prepare,
> +	.wait_finish          = vb2_ops_wait_finish,
> +	.buf_request_complete = vivpu_buf_request_complete,
> +};
> +
> +int vivpu_queue_init(void *priv, struct vb2_queue *src_vq,
> +		     struct vb2_queue *dst_vq)
> +{
> +	struct vivpu_ctx *ctx = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	src_vq->drv_priv = ctx;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->ops = &vivpu_qops;
> +	src_vq->mem_ops = &vb2_vmalloc_memops;
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->vb_mutex;
> +	src_vq->supports_requests = true;
> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->ops = &vivpu_qops;
> +	dst_vq->mem_ops = &vb2_vmalloc_memops;
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->vb_mutex;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +int vivpu_request_validate(struct media_request *req)
> +{
> +	struct media_request_object *obj;
> +	struct vivpu_ctx *ctx = NULL;
> +	unsigned int count;
> +
> +	list_for_each_entry(obj, &req->objects, list) {
> +		struct vb2_buffer *vb;
> +
> +		if (vb2_request_object_is_buffer(obj)) {
> +			vb = container_of(obj, struct vb2_buffer, req_obj);
> +			ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +			break;
> +		}
> +	}
> +
> +	if (!ctx)
> +		return -ENOENT;
> +
> +	count = vb2_request_buffer_cnt(req);
> +	if (!count) {
> +		v4l2_err(&ctx->dev->v4l2_dev,
> +			 "No buffer was provided with the request\n");
> +		return -ENOENT;
> +	} else if (count > 1) {
> +		v4l2_err(&ctx->dev->v4l2_dev,
> +			 "More than one buffer was provided with the request\n");
> +		return -EINVAL;
> +	}
> +
> +	return vb2_request_validate(req);
> +}
> diff --git a/drivers/media/test-drivers/vivpu/vivpu-video.h b/drivers/media/test-drivers/vivpu/vivpu-video.h
> new file mode 100644
> index 000000000000..6cf8c1570887
> --- /dev/null
> +++ b/drivers/media/test-drivers/vivpu/vivpu-video.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * A virtual stateless VPU example device for uAPI development purposes.
> + *
> + * A userspace implementation can use vivpu to run a decoding loop even
> + * when no hardware is available or when the kernel uAPI for the codec
> + * has not been upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version
> + */
> +
> +#ifndef _VIVPU_VIDEO_H_
> +#define _VIVPU_VIDEO_H_
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "vivpu.h"
> +
> +extern const struct v4l2_ioctl_ops vivpu_ioctl_ops;
> +int vivpu_queue_init(void *priv, struct vb2_queue *src_vq,
> +		     struct vb2_queue *dst_vq);
> +
> +void vivpu_set_default_format(struct vivpu_ctx *ctx);
> +int vivpu_request_validate(struct media_request *req);
> +
> +#endif /* _VIVPU_VIDEO_H_ */
> diff --git a/drivers/media/test-drivers/vivpu/vivpu.h b/drivers/media/test-drivers/vivpu/vivpu.h
> new file mode 100644
> index 000000000000..89b993c460c1
> --- /dev/null
> +++ b/drivers/media/test-drivers/vivpu/vivpu.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * A virtual stateless VPU example device for uAPI development purposes.
> + *
> + * A userspace implementation can use vivpu to run a decoding loop even
> + * when no hardware is available or when the kernel uAPI for the codec
> + * has not been upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version
> + */
> +
> +#ifndef _VIVPU_H_
> +#define _VIVPU_H_
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/tpg/v4l2-tpg.h>
> +
> +#define VIVPU_NAME		"vivpu"
> +#define VIVPU_M2M_NQUEUES	2
> +
> +extern const unsigned int vivpu_src_default_w;
> +extern const unsigned int vivpu_src_default_h;
> +extern const unsigned int vivpu_src_default_depth;
> +extern unsigned int vivpu_transtime;
> +
> +struct vivpu_coded_format_desc {
> +	u32 pixelformat;
> +	struct v4l2_frmsize_stepwise frmsize;
> +	unsigned int num_decoded_fmts;
> +	const u32 *decoded_fmts;
> +};
> +
> +enum {
> +	V4L2_M2M_SRC = 0,
> +	V4L2_M2M_DST = 1,
> +};
> +
> +extern unsigned int vivpu_debug;
> +#define dprintk(dev, fmt, arg...) \
> +	v4l2_dbg(1, vivpu_debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
> +
> +struct vivpu_q_data {
> +	unsigned int		sequence;
> +};
> +
> +struct vivpu_dev {
> +	struct v4l2_device	v4l2_dev;
> +	struct video_device	vfd;
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	struct media_device	mdev;
> +#endif
> +
> +	struct mutex		dev_mutex;
> +
> +	struct v4l2_m2m_dev	*m2m_dev;
> +};
> +
> +enum vivpu_codec {
> +	VIVPU_CODEC_AV1,
> +};
> +
> +struct vivpu_ctx {
> +	struct v4l2_fh		fh;
> +	struct vivpu_dev	*dev;
> +	struct v4l2_ctrl_handler hdl;
> +	struct v4l2_ctrl	**ctrls;
> +
> +	struct mutex		vb_mutex;
> +
> +	struct vivpu_q_data	q_data[VIVPU_M2M_NQUEUES];
> +	enum   vivpu_codec	current_codec;
> +
> +	const struct vivpu_coded_format_desc *coded_format_desc;
> +
> +	struct v4l2_format	src_fmt;
> +	struct v4l2_format	dst_fmt;
> +};
> +
> +struct vivpu_control {
> +	struct v4l2_ctrl_config cfg;
> +};
> +
> +static inline struct vivpu_ctx *vivpu_file_to_ctx(struct file *file)
> +{
> +	return container_of(file->private_data, struct vivpu_ctx, fh);
> +}
> +
> +static inline struct vivpu_ctx *vivpu_v4l2fh_to_ctx(struct v4l2_fh *v4l2_fh)
> +{
> +	return container_of(v4l2_fh, struct vivpu_ctx, fh);
> +}
> +
> +void *vivpu_find_control_data(struct vivpu_ctx *ctx, u32 id);
> +struct v4l2_ctrl *vivpu_find_control(struct vivpu_ctx *ctx, u32 id);
> +u32 vivpu_control_num_elems(struct vivpu_ctx *ctx, u32 id);
> +
> +#endif /* _VIVPU_H_ */
> 

This looks quite interesting. I did wonder if it would make sense to improve
the validation of the tile information: is everything within range, no strange
values, etc. The more you can validate here, the more useful this driver
becomes for testing userspace decoders.

Another idea would be to add the test pattern generator to create 'real' images.

Regards,

	Hans
