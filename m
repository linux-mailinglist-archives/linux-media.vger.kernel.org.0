Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D32187F3
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 11:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfEIJtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 05:49:00 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:42379 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfEIJtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 05:49:00 -0400
Received: by mail-pf1-f181.google.com with SMTP id 13so1032491pfw.9
        for <linux-media@vger.kernel.org>; Thu, 09 May 2019 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kZGlNv8HU5eJmhTO4Csi72Jvnlis18I4YybZ0fG03PU=;
        b=RLPE9WTp66zOsVhpZ9SzPM2/Dd8ZsbWUZy2UZBy+vOxIXVti6NWkwJYtlL9UHNJg8B
         gsvswpmReJLCvK+0G1hHic7yseOPccnpZTjvrJ4hf5GgIjFalQf9lFE6U+i2SUpWHLif
         hKSADSpz+pyUpoQT38Uc2M61sni02ypyZ1MsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kZGlNv8HU5eJmhTO4Csi72Jvnlis18I4YybZ0fG03PU=;
        b=IsPq19vCFp/f/PeWUHyGExw9Je4Cp+tQby2NhI0UmZd0f6zNU3Ndcy982BgIvkYhPq
         M8VquEOhpbVE6qj6Xa3XDf0tqbzuemRLW70utPIsEz7Jtrn3GJMn7nAiIiRS6ALWbE2l
         EZpgaLtIm8F8Ss3O6tdWPm9TcAMVgtXDneiD5sTlcimL9WlqbR6+hDp3h4Z20EmE6TLh
         utAyUja8MzYRbCFQ/zzuh9fg4wV1deqyo9dax+XOpgcrKqwUDBqbIa/52w4kU+q3D2iF
         BQJi0ym/PZOx+sxwGHEKBL1UH+JDdWAmd6LSS+eXQOOCtKvcqC55BYnjFPsXndvZEXKJ
         G0bA==
X-Gm-Message-State: APjAAAXT+0tcaSuqq42buEVVPMXdmeE3TI/fLPmkYPR4Et0s2scLVI0U
        bUQ4k4rJoqQGWfijSRrT6Dw8GLuOdGY=
X-Google-Smtp-Source: APXvYqwN/2wKD4nXOg1TDJtNTpTuTM8q/K0b+tEfKV9+lG5yu8y/0Nz/lDQOiMjslSIlSeMvL7pU2w==
X-Received: by 2002:a65:654c:: with SMTP id a12mr4115958pgw.101.1557395334671;
        Thu, 09 May 2019 02:48:54 -0700 (PDT)
Received: from google.com ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id j10sm2405766pfa.37.2019.05.09.02.48.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 09 May 2019 02:48:53 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
X-Google-Original-From: Tomasz Figa <tfiga@google.com>
Date:   Thu, 9 May 2019 18:48:46 +0900
To:     Frederic Chen <frederic.chen@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, shik@chromium.org,
        suleiman@chromium.org
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
Message-ID: <20190509094846.GA65444@google.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-7-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190417104511.21514-7-frederic.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frederic,

On Wed, Apr 17, 2019 at 7:45 PM Frederic Chen <frederic.chen@mediatek.com> wrote:
>
> This patch adds the driver of Digital Image Processing (DIP)
> unit in Mediatek ISP system, providing image format
> conversion, resizing, and rotation features.
>
> The mtk-isp directory will contain drivers for multiple IP
> blocks found in Mediatek ISP system. It will include ISP
> Pass 1 driver(CAM), sensor interface driver, DIP driver and
> face detection driver.
>
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> ---
>  drivers/media/platform/mtk-isp/Makefile       |   18 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |   17 +
>  .../platform/mtk-isp/isp_50/dip/Makefile      |   32 +
>  .../mtk-isp/isp_50/dip/mtk_dip-ctrl.c         |  124 ++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c | 1116 +++++++++++++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  321 ++++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  167 ++
>  .../mtk-isp/isp_50/dip/mtk_dip-smem.c         |  322 ++++
>  .../mtk-isp/isp_50/dip/mtk_dip-smem.h         |   39 +
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c | 1384 +++++++++++++++++
>  .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 1310 ++++++++++++++++
>  11 files changed, 4850 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
>

Thanks for the patch. Please see my comments inline.

Note that I'm reviewing from the bottom up, as it seems to be easier to
follow the driver flow this way. This means that some comments higher in my
reply may have more context lower in my reply. Please make sure to read all
the comments first before seeking further clarification.

> diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
> new file mode 100644
> index 000000000000..24bc5354e2f6
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Makefile
> @@ -0,0 +1,18 @@
> +#
> +# Copyright (C) 2018 MediaTek Inc.
> +#
> +# This program is free software: you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> +# GNU General Public License for more details.
> +#
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_COMMON) += common/
> +
> +obj-y += isp_50/
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_FD_SUPPORT) += fd/
> diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
> new file mode 100644
> index 000000000000..fd0e5bd3c781
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
> @@ -0,0 +1,17 @@
> +#
> +# Copyright (C) 2018 MediaTek Inc.
> +#
> +# This program is free software: you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> +# GNU General Public License for more details.
> +#
> +
> +ifeq ($(CONFIG_VIDEO_MEDIATEK_ISP_DIP_SUPPORT),y)
> +obj-y += dip/
> +endif

Why not just obj-$(CONFIG_VIDEO_MEDIATEK_ISP_DIP_SUPPORT)?

Also, the "_SUPPORT" suffix in the config option name is meaningless,
please remove it.

> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/Makefile b/drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> new file mode 100644
> index 000000000000..03137416857b
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> @@ -0,0 +1,32 @@
> +#
> +# Copyright (C) 2018 MediaTek Inc.
> +#
> +# This program is free software: you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> +# GNU General Public License for more details.
> +#
> +$(info $(srctree))
> +ccflags-y += -I$(srctree)/drivers/media/platform/mtk-mdp3
> +
> +obj-y += mtk_dip-sys.o

obj-$(CONFIG_VIDEO_MEDIATEK_ISP_DIP_SUPPORT)

> +
> +# To provide alloc context managing memory shared
> +# between CPU and ISP coprocessor
> +mtk_dip_smem-objs := \
> +mtk_dip-smem.o
> +
> +obj-y += mtk_dip_smem.o

Ditto.

> +
> +# Utilits to provide frame-based streaming model
> +# with v4l2 user interfaces
> +mtk_dip_util-objs := \
> +mtk_dip-dev.o \
> +mtk_dip-v4l2.o \
> +mtk_dip-ctrl.o \
> +
> +obj-y += mtk_dip_util.o

Ditto.

> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c
> new file mode 100644
> index 000000000000..e35574818120
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include "mtk_dip-dev.h"
> +
> +static void handle_buf_usage_config(struct v4l2_ctrl *ctrl)
> +{
> +       struct mtk_dip_video_device *node =
> +               container_of(ctrl->handler,
> +                            struct mtk_dip_video_device, ctrl_handler);
> +
> +       if (ctrl->val < MTK_DIP_V4l2_BUF_USAGE_DEFAULT ||
> +           ctrl->val >= MTK_DIP_V4l2_BUF_USAGE_NONE) {
> +               pr_err("Invalid buffer usage id %d", ctrl->val);
> +               return;
> +       }
> +       node->dev_q.buffer_usage = ctrl->val;
> +}
> +
> +static void handle_buf_rotate_config(struct v4l2_ctrl *ctrl)
> +{
> +       struct mtk_dip_video_device *node =
> +               container_of(ctrl->handler,
> +                            struct mtk_dip_video_device, ctrl_handler);
> +
> +       if (ctrl->val != 0 || ctrl->val != 90 ||
> +           ctrl->val != 180 || ctrl->val != 270) {
> +               pr_err("Invalid buffer rotation %d", ctrl->val);
> +               return;
> +       }
> +       node->dev_q.rotation = ctrl->val;
> +}
> +
> +static int mtk_dip_video_device_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       switch (ctrl->id) {
> +       case V4L2_CID_PRIVATE_SET_BUFFER_USAGE:
> +               handle_buf_usage_config(ctrl);
> +               break;
> +       case V4L2_CID_ROTATE:
> +               handle_buf_rotate_config(ctrl);
> +               break;
> +       default:
> +                       break;
> +       }
> +       return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops mtk_dip_video_device_ctrl_ops = {
> +       .s_ctrl = mtk_dip_video_device_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config mtk_dip_buf_usage_config = {
> +       .ops    = &mtk_dip_video_device_ctrl_ops,
> +       .id     = V4L2_CID_PRIVATE_SET_BUFFER_USAGE,
> +       .name   = "MTK ISP SET BUFFER USAGE",
> +       .type   = V4L2_CTRL_TYPE_INTEGER,
> +       .min    = MTK_DIP_V4l2_BUF_USAGE_DEFAULT,
> +       .max    = MTK_DIP_V4l2_BUF_USAGE_POSTPROC,
> +       .step   = 1,
> +       .def    = MTK_DIP_V4l2_BUF_USAGE_DEFAULT,
> +       .flags  = V4L2_CTRL_FLAG_SLIDER | V4L2_CTRL_FLAG_EXECUTE_ON_WRITE,
> +       };

What is this control for?

It looks like it selects which DMA should a buffer go to? If so, that's
not the right way to do it. Each DMA port should have its corresponding
/dev/video node and to which video node the buffer is queued determines
to which hardware DMA it goes.

> +
> +int mtk_dip_ctrl_init(struct mtk_dip_pipe *dip_pipe)
> +{
> +       struct v4l2_ctrl_handler *hdl = &dip_pipe->ctrl_handler;
> +       struct mtk_dip_video_device *node;
> +       int i;
> +       int img_nodes_to_be_init[3] = {
> +               MTK_DIP_VIDEO_NODE_ID_RAW_OUT,
> +               MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE,
> +               MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE
> +       };
> +
> +       v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_DIP_MAX);
> +
> +       pr_debug("%s init ctrl: %p\n", __func__, hdl);
> +
> +       if (hdl->error) {
> +               pr_err("Failed in v4l2_ctrl_handler_init\n");
> +               return hdl->error;
> +       }
> +
> +       for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++)
> +               v4l2_ctrl_handler_init(&dip_pipe->nodes[i].ctrl_handler,
> +                                      V4L2_CID_MTK_DIP_MAX);
> +
> +       for (i = 0; i < ARRAY_SIZE(img_nodes_to_be_init); i++) {
> +               node = &dip_pipe->nodes[img_nodes_to_be_init[i]];
> +
> +               if (v4l2_ctrl_new_custom(&node->ctrl_handler,
> +                                        &mtk_dip_buf_usage_config,
> +                                        NULL) == NULL)
> +                       dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                               "Node(%s) create buf_usage_config ctrl failed:(%d)",
> +                               node->desc->name,
> +                               node->ctrl_handler.error);
> +
> +               if (v4l2_ctrl_new_std(&dip_pipe->ctrl_handler,
> +                                     &mtk_dip_video_device_ctrl_ops,
> +                       V4L2_CID_ROTATE, 0, 270, 90, 0) == NULL)
> +                       dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                               "Node(%s) create rotate ctrl failed:(%d)",
> +                               node->desc->name, node->ctrl_handler.error);
> +       }
> +
> +return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_dip_ctrl_init);
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> new file mode 100644
> index 000000000000..9f450dae2820
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> @@ -0,0 +1,1116 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <linux/dma-mapping.h>
> +#include <media/v4l2-event.h>
> +#include "mtk_dip-dev.h"
> +#include "mtk_dip-smem.h"
> +#include "mtk-mdp3-regs.h"
> +#include "mtk-img-ipi.h"
> +
> +int mtk_dip_pipe_init(struct mtk_dip_pipe *dip_pipe,
> +                     struct mtk_dip_dev *dip_dev,
> +                     struct mtk_dip_pipe_desc *setting,
> +                     struct media_device *media_dev,
> +                     struct v4l2_device *v4l2_dev,
> +                     struct mtk_dip_smem_dev *smem_alloc_dev)
> +{
> +       int ret, i;
> +
> +       dip_pipe->dip_dev = dip_dev;
> +       dip_pipe->desc = setting;
> +       dip_pipe->smem_alloc_dev = smem_alloc_dev;
> +
> +       atomic_set(&dip_pipe->pipe_job_sequence, 0);
> +       spin_lock_init(&dip_pipe->job_lock);
> +       mutex_init(&dip_pipe->lock);
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev, "init pipe(%s,%d)\n",
> +               dip_pipe->desc->name,
> +               dip_pipe->desc->id);
> +
> +       dip_pipe->num_nodes = MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM;
> +
> +       for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM; i++) {
> +               dip_pipe->nodes[i].desc =
> +                       &dip_pipe->desc->output_queue_descs[i];
> +               dip_pipe->nodes[i].immutable = 0;
> +               dip_pipe->nodes[i].enabled =
> +                       dip_pipe->nodes[i].desc->default_enable;
> +               atomic_set(&dip_pipe->nodes[i].sequence, 0);
> +
> +               dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s: init node(%s,%d)\n",
> +                       dip_pipe->desc->name,
> +                       dip_pipe->nodes[i].desc->name, i);
> +       }
> +
> +       for (i = MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM;
> +            i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
> +               int cap_idx = i - MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM;
> +
> +               dip_pipe->nodes[i].desc =
> +                       &dip_pipe->desc->capture_queue_descs[cap_idx];
> +               dip_pipe->nodes[i].immutable = 0;
> +               dip_pipe->nodes[i].enabled =
> +                       dip_pipe->nodes[i].desc->default_enable;
> +               atomic_set(&dip_pipe->nodes[i].sequence, 0);
> +
> +               dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s: init node(%s,%d)\n",
> +                       dip_pipe->desc->name,
> +                       dip_pipe->nodes[i].desc->name, i);
> +       }
> +
> +       if (dip_pipe->desc->master >= 0 &&
> +           dip_pipe->desc->master < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM) {
> +               dip_pipe->nodes[dip_pipe->desc->master].immutable = 1;
> +               dip_pipe->nodes[dip_pipe->desc->master].enabled = 1;
> +       }
> +
> +       ret = mtk_dip_ctrl_init(dip_pipe);
> +
> +       if (ret) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s: failed(%d) to initialize ctrls\n",
> +                       dip_pipe->desc->name, ret);
> +               goto failed_ctrl;
> +       }
> +
> +       ret = mtk_dip_pipe_v4l2_register(dip_pipe, media_dev, v4l2_dev);
> +
> +       if (ret) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s: failed(%d) to create V4L2 devices\n",
> +                       dip_pipe->desc->name, ret);
> +               goto failed_pipe;
> +       }
> +
> +       return 0;
> +
> +failed_ctrl:
> +failed_pipe:
> +       mutex_destroy(&dip_pipe->lock);
> +       return ret;
> +}
> +
> +static int mtk_dip_pipe_next_job_id(struct mtk_dip_pipe *dip_pipe)
> +{
> +       int global_job_id =
> +               atomic_inc_return(&dip_pipe->pipe_job_sequence);
> +
> +       global_job_id =
> +               (global_job_id & 0x0000FFFF) |
> +               (dip_pipe->desc->id << 16);
> +
> +       return global_job_id;
> +}
> +
> +int mtk_dip_pipe_init_job_infos(struct mtk_dip_pipe *dip_pipe)
> +{
> +       int i;
> +
> +       spin_lock(&dip_pipe->job_lock);
> +
> +       dip_pipe->num_pipe_job_infos = ARRAY_SIZE(dip_pipe->pipe_job_infos);
> +       INIT_LIST_HEAD(&dip_pipe->pipe_job_running_list);
> +       INIT_LIST_HEAD(&dip_pipe->pipe_job_free_list);
> +
> +       for (i = 0; i < dip_pipe->num_pipe_job_infos; i++) {
> +               struct mtk_dip_pipe_job_info *pipe_job_info =
> +                       &dip_pipe->pipe_job_infos[i];
> +               list_add_tail(&pipe_job_info->list,
> +                             &dip_pipe->pipe_job_free_list);
> +       }
> +
> +       spin_unlock(&dip_pipe->job_lock);
> +
> +       return 0;
> +}
> +
> +static int mtk_dip_pipe_process_pipe_job_info(struct mtk_dip_pipe *dip_pipe,
> +                                             struct mtk_dip_pipe_job_info
> +                                             *pipe_job_info)
> +{
> +       spin_lock(&dip_pipe->job_lock);
> +
> +       list_del(&pipe_job_info->list);
> +       list_add_tail(&pipe_job_info->list, &dip_pipe->pipe_job_running_list);
> +
> +       spin_unlock(&dip_pipe->job_lock);
> +       return 0;
> +}

This function is also only called once, is very small and can't fail, so I
don't see any advantage over just moving its contents there.

> +
> +struct mtk_dip_pipe_job_info *
> +mtk_dip_pipe_get_running_job_info(struct mtk_dip_pipe *dip_pipe,
> +                                 int pipe_job_id)
> +{
> +       struct mtk_dip_pipe_job_info *pipe_job_info = NULL;
> +
> +       spin_lock(&dip_pipe->job_lock);
> +
> +       list_for_each_entry(pipe_job_info,
> +                           &dip_pipe->pipe_job_running_list, list) {
> +               if (pipe_job_info->id == pipe_job_id) {
> +                       spin_unlock(&dip_pipe->job_lock);
> +                       return pipe_job_info;
> +               }
> +       }
> +
> +       spin_unlock(&dip_pipe->job_lock);
> +
> +       return NULL;
> +}
> +
> +static int
> +mtk_dip_pipe_free_job_info(struct mtk_dip_pipe *dip_pipe,
> +                          struct mtk_dip_pipe_job_info *pipe_job_info)
> +{
> +       spin_lock(&dip_pipe->job_lock);
> +
> +       list_del(&pipe_job_info->list);
> +       list_add_tail(&pipe_job_info->list, &dip_pipe->pipe_job_free_list);
> +
> +       spin_unlock(&dip_pipe->job_lock);
> +
> +       return 0;
> +}
> +
> +static struct mtk_dip_pipe_job_info *
> +mtk_dip_pipe_get_free_job_info(struct mtk_dip_pipe *dip_pipe)
> +{
> +       struct mtk_dip_pipe_job_info *pipe_job_info = NULL;
> +
> +       spin_lock(&dip_pipe->job_lock);
> +       list_for_each_entry(pipe_job_info,
> +                           &dip_pipe->pipe_job_free_list, list) {
> +               dev_dbg(&dip_pipe->dip_dev->pdev->dev, "Found free pipe job\n");
> +               spin_unlock(&dip_pipe->job_lock);
> +               return pipe_job_info;
> +       }
> +       spin_unlock(&dip_pipe->job_lock);
> +
> +       dev_err(&dip_pipe->dip_dev->pdev->dev,
> +               "%s: can't found free pipe job\n",
> +               dip_pipe->desc->name);
> +
> +       return NULL;
> +}
> +
> +static void
> +mtk_dip_pipe_update_job_info(struct mtk_dip_pipe *dip_pipe,
> +                            struct mtk_dip_pipe_job_info *pipe_job_info,
> +                            struct mtk_dip_video_device *node,
> +                            struct mtk_dip_dev_buffer *dev_buf)
> +{
> +       if (!pipe_job_info || !dev_buf || !node) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s: update pipe-job(%p) failed, buf(%p),node(%p)\n",
> +                       dip_pipe->desc->name,
> +                       pipe_job_info, dev_buf, node);
> +               return;
> +       }

This function is only called in once place and all the arguments there can't
be NULL. This check is useless.

I'd recommend moving this function lower, closer to where it's called from.

> +
> +       if (pipe_job_info->buf_map[node->desc->id])
> +               dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s: buf overwrite\n",
> +                        dip_pipe->desc->name,
> +                        node->desc->name);a

This is also impossible to happen.

> +
> +       if (node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +               pipe_job_info->num_img_capture_bufs++;
> +
> +       if (node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +               pipe_job_info->num_img_output_bufs++;
> +
> +       if (node->desc->buf_type == V4L2_BUF_TYPE_META_OUTPUT)
> +               pipe_job_info->num_meta_output_bufs++;
> +`
> +       if (node->desc->buf_type == V4L2_BUF_TYPE_META_CAPTURE)
> +               pipe_job_info->num_meta_capture_bufs++;

These two counters seem to be only used for debugging messages. I don't
think there is any good use for them. We should have a generic debug message
for the request queue operation, printing the request objects there. Please
remove.

> +
> +       pipe_job_info->buf_map[node->desc->id] = dev_buf;

Given that with my other comments, we reduce this function to only a few
lines, I'd just suggest moving this line to the place this function is
currently being called from.

> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s: added buf(%p) to pipe-job(%p)\n",
> +               dip_pipe->desc->name, node->desc->name, dev_buf,
> +               pipe_job_info);
> +}
> +
> +static void mtk_dip_pipe_debug_job(struct mtk_dip_pipe *dip_pipe,
> +                                  struct mtk_dip_pipe_job_info *pipe_job_info)
> +{
> +       int i;
> +
> +       if (!dip_pipe || !pipe_job_info)
> +               return;
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s: pipe-job(%p),id(%d),req(%p)buf nums(%d,%d,%d,%d)\n",
> +               dip_pipe->desc->name,
> +               pipe_job_info,
> +               pipe_job_info->id,
> +               pipe_job_info->req,
> +               pipe_job_info->num_img_capture_bufs,
> +               pipe_job_info->num_img_output_bufs,
> +               pipe_job_info->num_meta_capture_bufs,
> +               pipe_job_info->num_meta_output_bufs);
> +
> +       for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM ; i++) {
> +               if (pipe_job_info->buf_map[i])
> +                       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +                               "Node(%s,%d), buf(%p)\n",
> +                               dip_pipe->nodes[i].desc->name, i,
> +                               pipe_job_info->buf_map[i]);
> +       }
> +}
> +
> +int mtk_dip_pipe_job_finish(struct mtk_dip_pipe *dip_pipe,
> +                           unsigned int pipe_job_info_id,
> +                           enum vb2_buffer_state vbf_state)
> +{
> +       int i;
> +       struct mtk_dip_pipe_job_info *job_info = NULL;
> +       const int pipe_id =
> +               mtk_dip_pipe_get_pipe_from_job_id(pipe_job_info_id);
> +       u64 timestamp = 0;

Unnecessary initialization.

> +
> +       if (!dip_pipe)
> +               pr_err("%s: pipe-job id(%d) release failed, dip_pipe is null\n",
> +                      __func__, pipe_job_info_id);
> +
> +       job_info = mtk_dip_pipe_get_running_job_info(dip_pipe,
> +                                                    pipe_job_info_id);
> +
> +       if (!job_info) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s: can't find pipe-job id(%d)\n",
> +                       __func__, dip_pipe->desc->name, pipe_id);
> +               return -EINVAL;
> +       }

None of the 2 conditions above should be possible to happen.

> +
> +       timestamp = ktime_get_ns();

This timestamp is unused.

> +
> +       for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
> +               struct mtk_dip_dev_buffer *dev_buf = job_info->buf_map[i];
> +
> +               if (!dev_buf) {
> +                       continue;
> +               } else {

No need to put this code under else.

> +                       dev_buf->vbb.vb2_buf.timestamp = ktime_get_ns();

Did you mean to use the timestamp variable here?

> +                       mtk_dip_v4l2_buffer_done(&dev_buf->vbb.vb2_buf,
> +                                                vbf_state);

Just call vb2_buffer_done() directly, as pointed in another comment.

> +               }
> +       }
> +
> +       mtk_dip_pipe_free_job_info(dip_pipe, job_info);
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s: finish pipe-job, id(%d), vb state(%d)\n",
> +               __func__, dip_pipe->desc->name, pipe_id,
> +               pipe_job_info_id, vbf_state);
> +
> +       return 0;
> +}
> +
> +static void mtk_dip_dev_buf_fill_info(struct mtk_dip_pipe *dip_pipe,
> +                                     struct mtk_dip_dev_buffer *dev_buf)
> +{
> +       struct vb2_v4l2_buffer *b;
> +       struct mtk_dip_video_device *node;
> +       struct mtk_dip_video_device_desc *desc;
> +
> +       b = &dev_buf->vbb;

We can just have this together with the declaration.

> +       node = mtk_dip_vbq_to_node(b->vb2_buf.vb2_queue);
> +       desc = node->desc;

I don't see too much savings from having a local variable for this over just
using node->desc directly.

> +       dev_buf->fmt = node->vdev_fmt;
> +       dev_buf->dev_fmt = node->dev_q.dev_fmt;
> +       dev_buf->isp_daddr =
> +               vb2_dma_contig_plane_dma_addr(&b->vb2_buf, 0);
> +       dev_buf->vaddr = vb2_plane_vaddr(&b->vb2_buf, 0);

Why do we need a virtual address? Note that depending on how the buffer was
allocated, this may not be a cheap operation, e.g. it may involve creating
actual CPU mapping at the point of the first call to vb2_plane_vaddr(),
which is costly.

> +       dev_buf->buffer_usage = node->dev_q.buffer_usage;

There should be no buffer_usage, but rather separate queue for each usage.

> +       dev_buf->rotation = node->dev_q.rotation;
> +
> +       if (desc->smem_alloc) {
> +               dev_buf->scp_daddr =
> +                       mtk_dip_smem_iova_to_phys
> +                       (dip_pipe->smem_alloc_dev,
> +                        dev_buf->isp_daddr);

Isn't this overly wrapped? The first argument should fit in the second line.

> +       } else {
> +               dev_buf->scp_daddr = 0;
> +       }

Things like DMA addresses should be initialized in the .buf_init vb2
callback, which is only called once the backing memory of the buffer
changes.

> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s: buf type(%d), idx(%d), mem(%d), isp_daddr(%p), scp_daddr(%p)\n",
> +               dip_pipe->desc->name,
> +               desc->name,
> +               b->vb2_buf.type,
> +               b->vb2_buf.index,
> +               b->vb2_buf.memory,
> +               dev_buf->isp_daddr,
> +               dev_buf->scp_daddr);
> +}
> +
> +int mtk_dip_pipe_queue_buffers(struct media_request *req,
> +                              int initial)

This seems to be always called with initial == 0. Please remove the dead
argument and related code paths.

> +{
> +       struct media_request_object *obj;
> +       struct mtk_dip_pipe *dip_pipe;
> +       struct mtk_dip_pipe_job_info *pipe_job_info = NULL;
> +       int ret = 0;

Unnecessary initialization.

> +
> +       list_for_each_entry(obj, &req->objects, list) {
> +               struct vb2_buffer *vb;
> +
> +               if (vb2_request_object_is_buffer(obj)) {

Please invert the condition and use the continue statement to make the code
less indented.

> +                       struct mtk_dip_dev_buffer *buf;
> +                       struct mtk_dip_dev_buffer *dev_buf;
> +                       struct mtk_dip_video_device *node;
> +
> +                       vb = container_of(obj, struct vb2_buffer, req_obj);
> +                       node = mtk_dip_vbq_to_node(vb->vb2_queue);
> +                       dip_pipe = vb2_get_drv_priv(vb->vb2_queue);
> +                       dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
> +                       buf = dev_buf;
> +
> +                       if (!pipe_job_info) {
> +                               pipe_job_info = mtk_dip_pipe_get_free_job_info
> +                                       (dip_pipe);
> +
> +                               if (!pipe_job_info)
> +                                       goto FAILE_JOB_NOT_TRIGGER;

Labels should be lower case.

Generally, we already validated the request and know that there are buffers
there, so we can just move this before the loop.

> +
> +                               memset(pipe_job_info->buf_map, 0,
> +                                      sizeof(pipe_job_info->buf_map));
> +                               pipe_job_info->num_img_capture_bufs = 0;
> +                               pipe_job_info->num_img_output_bufs = 0;
> +                               pipe_job_info->num_meta_capture_bufs = 0;
> +                               pipe_job_info->num_meta_output_bufs = 0;

Couldn't mtk_dip_pipe_get_free_job_info() initialize these for us?

> +                       }
> +
> +                       mtk_dip_dev_buf_fill_info(dip_pipe,
> +                                                 buf);
> +
> +                       mtk_dip_pipe_update_job_info(dip_pipe,
> +                                                    pipe_job_info,
> +                                                    node,
> +                                                    buf);
> +               }
> +       }
> +
> +       if (!pipe_job_info)
> +               return -EINVAL;

This function is called from request queue callback, so it can't return an
error. If it fails here for some reason, it should return any matching
buffers with error state and complete the request.

I'd still recommend designing this in a way that request queuing can't fail
anymore. For example, we can implement our own .req_alloc in
media_device_ops and wrap the generic media_request struct into our
mtk_dip_request struct that would include any data that currently
mtk_dip_pipe_job_info has. Then, we wouldn't have a way to run out of free
job info structs and so no more reason to fail here.

> +
> +       pipe_job_info->id =
> +               mtk_dip_pipe_next_job_id(dip_pipe);
> +
> +       mtk_dip_pipe_debug_job(dip_pipe, pipe_job_info);
> +
> +       mutex_lock(&dip_pipe->lock);
> +
> +       if (!dip_pipe->streaming) {
> +               dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s:  stream is off, no hw enqueue triggered\n",
> +                       __func__, dip_pipe->desc->name);
> +               mutex_unlock(&dip_pipe->lock);
> +               return 0;

We should be able to leverage vb2 for protecting us from this. I just
realized this issue comes from the bad request handling in
mtk_dip_vb2_request_queue(). I added a more detailed comment there.

> +       }
> +
> +       if (mtk_dip_pipe_process_pipe_job_info(dip_pipe, pipe_job_info)) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s: can't start to run pipe job id(%d)\n",
> +                       __func__, dip_pipe->desc->name,
> +                       pipe_job_info->id);
> +               mutex_unlock(&dip_pipe->lock);a

Wouldn't it make sense to add a label called err_unlock and unlock the mutex
there?

> +               goto FAILE_JOB_NOT_TRIGGER;
> +       }
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s: trigger pipe job, id(%d)\n",
> +               dip_pipe->desc->name,
> +               dip_pipe->desc->id);
> +
> +       if (mtk_dip_pipe_job_start(dip_pipe, pipe_job_info)) {
> +               mutex_unlock(&dip_pipe->lock);
> +               goto FAILE_JOB_NOT_TRIGGER;
> +       }
> +
> +       mutex_unlock(&dip_pipe->lock);
> +
> +       return 0;
> +
> +FAILE_JOB_NOT_TRIGGER:

Labels should be lowercase and named after the first clean up step that
happens after the jump.

> +       if (initial)
> +               return ret;
> +
> +       mtk_dip_pipe_job_finish(dip_pipe, pipe_job_info->id,
> +                               VB2_BUF_STATE_ERROR);

We jump here from above if mtk_dip_pipe_get_free_job_info() returns NULL,
so this is going to nicely crash on a NULL pointer dereference. Do we
actually need to jump here from there, rather than just instantly returning
an error?

> +
> +       return -EINVAL;
> +}
> +
> +int mtk_dip_pipe_release(struct mtk_dip_pipe *dip_pipe)
> +{
> +       mtk_dip_pipe_v4l2_unregister(dip_pipe);
> +       v4l2_ctrl_handler_free(&dip_pipe->ctrl_handler);
> +       mutex_destroy(&dip_pipe->lock);
> +
> +       return 0;
> +}
> +
> +static void set_img_fmt(struct v4l2_pix_format_mplane *mfmt_to_fill,
> +                       struct mtk_dip_dev_format *dev_fmt)
> +{
> +       int i;
> +
> +       mfmt_to_fill->pixelformat = dev_fmt->fmt.img.pixelformat;
> +       mfmt_to_fill->num_planes = dev_fmt->fmt.img.num_planes;
> +       mfmt_to_fill->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +       mfmt_to_fill->quantization = V4L2_QUANTIZATION_DEFAULT;
> +       mfmt_to_fill->colorspace = dev_fmt->fmt.img.colorspace;
> +
> +       memset(mfmt_to_fill->reserved, 0, sizeof(mfmt_to_fill->reserved));
> +
> +       pr_debug("%s: Fmt(%d),w(%d),h(%d),f(%d)\n",
> +                __func__,
> +                mfmt_to_fill->pixelformat,
> +                mfmt_to_fill->width,
> +                mfmt_to_fill->height,
> +                mfmt_to_fill->field);
> +
> +       for (i = 0 ; i < mfmt_to_fill->num_planes; ++i) {
> +               int bpl = (mfmt_to_fill->width *
> +                       dev_fmt->fmt.img.row_depth[i]) / 8;
> +               int sizeimage = (mfmt_to_fill->width * mfmt_to_fill->height *
> +                       dev_fmt->fmt.img.depth[i]) / 8;
> +
> +               mfmt_to_fill->plane_fmt[i].bytesperline = bpl;
> +               mfmt_to_fill->plane_fmt[i].sizeimage = sizeimage;
> +               memset(mfmt_to_fill->plane_fmt[i].reserved,
> +                      0, sizeof(mfmt_to_fill->plane_fmt[i].reserved));
> +
> +               pr_debug("plane(%d):bpl(%d),sizeimage(%u)\n",
> +                        i, bpl,
> +                        mfmt_to_fill->plane_fmt[i].sizeimage);
> +       }
> +}
> +
> +static void set_meta_fmt(struct v4l2_meta_format *metafmt_to_fill,
> +                        struct mtk_dip_dev_format *dev_fmt)
> +{
> +       metafmt_to_fill->dataformat = dev_fmt->fmt.meta.dataformat;
> +
> +       if (dev_fmt->fmt.meta.max_buffer_size <= 0) {
> +               pr_debug("Invalid meta buf size(%u), use default(%u)\n",
> +                        dev_fmt->fmt.meta.max_buffer_size,
> +                        MTK_DIP_DEV_META_BUF_DEFAULT_SIZE);
> +               metafmt_to_fill->buffersize = MTK_DIP_DEV_META_BUF_DEFAULT_SIZE;
> +       } else {
> +               pr_debug("Use meta size(%u)\n",
> +                        dev_fmt->fmt.meta.max_buffer_size);
> +               metafmt_to_fill->buffersize = dev_fmt->fmt.meta.max_buffer_size;
> +       }
> +}
> +
> +void mtk_dip_pipe_load_default_fmt(struct mtk_dip_pipe *dip_pipe,
> +                                  struct mtk_dip_video_device *node,
> +                                  struct v4l2_format *fmt_to_fill)
> +{
> +       struct mtk_dip_dev_format *dev_fmt;
> +       struct mtk_dip_video_device_desc *desc = node->desc;
> +
> +       if (desc->num_fmts == 0) {
> +               pr_err("%s:%s: desc->num_fmts is 0, no format support list\n",
> +                      __func__, desc->name);
> +               return;
> +       }
> +
> +       if (desc->default_fmt_idx >= desc->num_fmts) {
> +               pr_debug("%s:%s: invalid idx(%d), must < num_fmts(%d)\n",
> +                        __func__, desc->name, desc->default_fmt_idx,
> +                       desc->num_fmts);
> +               desc->default_fmt_idx = 0;
> +       }
> +
> +       dev_fmt = &desc->fmts[desc->default_fmt_idx];
> +       fmt_to_fill->type = desc->buf_type;
> +       if (mtk_dip_buf_is_meta(desc->buf_type)) {
> +               set_meta_fmt(&fmt_to_fill->fmt.meta, dev_fmt);
> +       } else {
> +               fmt_to_fill->fmt.pix_mp.width = desc->default_width;
> +               fmt_to_fill->fmt.pix_mp.height = desc->default_height;
> +               fmt_to_fill->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +
> +               set_img_fmt(&fmt_to_fill->fmt.pix_mp, dev_fmt);
> +       }
> +}
> +
> +struct mtk_dip_dev_format *
> +mtk_dip_pipe_find_fmt(struct mtk_dip_pipe *dip_pipe,
> +                     struct mtk_dip_video_device *node,
> +                     u32 format)
> +{
> +       int i;
> +       struct mtk_dip_dev_format *dev_fmt;
> +
> +       struct mtk_dip_video_device_desc *desc = node->desc;
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev, "fmt to find(%x)\n", format);
> +
> +       for (i = 0; i < desc->num_fmts; i++) {
> +               dev_fmt = &desc->fmts[i];
> +               if (!mtk_dip_buf_is_meta(desc->buf_type)) {
> +                       if (dev_fmt->fmt.img.pixelformat == format)
> +                               return dev_fmt;
> +               } else {
> +                       if (dev_fmt->fmt.meta.dataformat == format)
> +                               return dev_fmt;
> +               }
> +       }
> +
> +       return NULL;
> +}
> +
> +int mtk_dip_pipe_set_meta_fmt(struct mtk_dip_pipe *dip_pipe,
> +                             struct mtk_dip_video_device *node,
> +                             struct v4l2_meta_format *user_fmt,
> +                             struct v4l2_meta_format *node_fmt)
> +{
> +       struct mtk_dip_dev_format *dev_fmt;
> +
> +       if (!user_fmt || !node_fmt)
> +               return -EINVAL;
> +
> +       dev_fmt = mtk_dip_pipe_find_fmt(dip_pipe, node,
> +                                       user_fmt->dataformat);
> +
> +       if (!dev_fmt)
> +               return -EINVAL;
> +
> +       node->dev_q.dev_fmt = dev_fmt;
> +       set_meta_fmt(node_fmt, dev_fmt);
> +       *user_fmt = *node_fmt;
> +
> +       return 0;
> +}
> +
> +int mtk_dip_pipe_set_img_fmt(struct mtk_dip_pipe *dip_pipe,
> +                            struct mtk_dip_video_device *node,
> +                            struct v4l2_pix_format_mplane *user_fmt,
> +                            struct v4l2_pix_format_mplane *dest_fmt)
> +{
> +       struct mtk_dip_dev_format *dev_fmt;
> +
> +       if (!user_fmt || !dest_fmt)
> +               return -EINVAL;
> +
> +       dev_fmt = mtk_dip_pipe_find_fmt(dip_pipe, node,
> +                                       user_fmt->pixelformat);
> +
> +       if (!dev_fmt) {
> +               pr_debug("%s:%s:%s: dev_fmt(%d) not found\n",
> +                        __func__, dip_pipe->desc->name,
> +                        node->desc->name, user_fmt->pixelformat);
> +               return -EINVAL;
> +       }
> +
> +       node->dev_q.dev_fmt = dev_fmt;
> +       dest_fmt->width = user_fmt->width;
> +       dest_fmt->height = user_fmt->height;
> +       dest_fmt->field = V4L2_FIELD_NONE;
> +
> +       set_img_fmt(dest_fmt, dev_fmt);
> +
> +       return 0;
> +}
> +
> +int mtk_dip_pipe_streamon(struct mtk_dip_pipe *dip_pipe)
> +{
> +       int ret;
> +       struct mtk_dip_dev *dip_dev;
> +
> +       if (!dip_pipe)
> +               return -EINVAL;
> +
> +       dip_dev = dev_get_drvdata(&dip_pipe->dip_dev->pdev->dev);
> +
> +       mutex_lock(&dip_pipe->lock);
> +
> +       ret = mtk_dip_hw_streamon(&dip_dev->dip_hw,
> +                                 dip_pipe->desc->id);
> +
> +       if (ret) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s:%d: failed to start hw\n",
> +                       __func__, dip_pipe->desc->name,
> +                       dip_pipe->desc->id);
> +               mutex_unlock(&dip_pipe->lock);
> +               return -EBUSY;
> +       }
> +
> +       dip_pipe->streaming = 1;
> +       mutex_unlock(&dip_pipe->lock);

Shouldn't we also check if there isn't anything to queue to the hardware at
this point? We might have been given buffers and requests before starting
streaming on all the nodes. It should be relatively easy, if you follow my
suggestion to redesign the request handling in another comment, i.e. you
should be able to just call the mtk_dip_pipe_try_enqueue() function here.

(That call could be placed in mtk_dip_hw_streamon() as well, if we remove
this function as suggested in my other comment.)

> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s:%d: start hw\n",
> +               __func__, dip_pipe->desc->name,
> +               dip_pipe->desc->id);
> +
> +       return ret;
> +}

Similar comments for this function as for the one below.

> +
> +int mtk_dip_pipe_streamoff(struct mtk_dip_pipe *dip_pipe)
> +{
> +       int ret;
> +       struct mtk_dip_dev *dip_dev;
> +
> +       if (!dip_pipe)
> +               return -EINVAL;

How could this happen?

> +
> +       dip_dev = dev_get_drvdata(&dip_pipe->dip_dev->pdev->dev);

Hold on, isn't dip_pipe->dip_dev just what we're looking for here?

> +
> +       mutex_lock(&dip_pipe->lock);
> +
> +       ret = mtk_dip_hw_streamoff(&dip_dev->dip_hw,
> +                                  dip_pipe->desc->id);
> +
> +       if (ret) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,

We already have a direct pointer to dip_dev, no need to go through dip_pipe
again.  Also, it sounds like simply storing a pointer to dev, rather pdev in
dip_dev would make more sense.

> +                       "%s:%s:%d: failed to stop hw\n",
> +                       __func__, dip_pipe->desc->name,
> +                       dip_pipe->desc->id);
> +               mutex_unlock(&dip_pipe->lock);
> +               return -EBUSY;

We must never end up in such case. If for some reason the hardware fails to
stop normally, we must forcefully stop it (e.g. reset), since any memory and
other resources are expected to be freed after streaming stops.

> +       }
> +
> +       dip_pipe->streaming = 0;
> +       mutex_unlock(&dip_pipe->lock);
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s:%d: stop hw\n",
> +               __func__, dip_pipe->desc->name,
> +               dip_pipe->desc->id);
> +
> +       return 0;
> +}

The 2 functions above could be easily merged into mtk_dip_subdev_s_stream(),
which could call mtk_dip_hw_stream{off,on}() directly.

> +
> +static enum mdp_ycbcr_profile
> +map_ycbcr_prof_mplane(struct v4l2_pix_format_mplane *pix_mp,
> +                     u32 mdp_color)
> +{
> +       if (MDP_COLOR_IS_RGB(mdp_color))
> +               return MDP_YCBCR_PROFILE_FULL_BT601;
> +
> +       switch (pix_mp->colorspace) {
> +       case V4L2_COLORSPACE_JPEG:
> +               return MDP_YCBCR_PROFILE_JPEG;
> +       case V4L2_COLORSPACE_REC709:
> +       case V4L2_COLORSPACE_DCI_P3:
> +               if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +                       return MDP_YCBCR_PROFILE_FULL_BT709;
> +               return MDP_YCBCR_PROFILE_BT709;
> +       case V4L2_COLORSPACE_BT2020:
> +               if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +                       return MDP_YCBCR_PROFILE_FULL_BT2020;
> +               return MDP_YCBCR_PROFILE_BT2020;
> +       }
> +       /* V4L2_COLORSPACE_SRGB or else */
> +       if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +               return MDP_YCBCR_PROFILE_FULL_BT601;
> +       return MDP_YCBCR_PROFILE_BT601;
> +}
> +
> +/* Stride that is accepted by MDP HW */
> +static u32 dip_mdp_fmt_get_stride(const struct mtk_dip_dev_mdp_format *fmt,
> +                                 u32 bytesperline,
> +                                 unsigned int plane)
> +{
> +       enum mdp_color c = fmt->mdp_color;
> +       u32 stride;
> +
> +       stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
> +               / fmt->row_depth[0];
> +       if (plane == 0)
> +               return stride;
> +       if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> +               if (MDP_COLOR_IS_BLOCK_MODE(c))
> +                       stride = stride / 2;
> +               return stride;
> +       }
> +       return 0;
> +}
> +
> +/* Stride that is accepted by MDP HW of format with contiguous planes */
> +static u32
> +dip_mdp_fmt_get_stride_contig(const struct mtk_dip_dev_mdp_format *fmt,
> +                             u32 pix_stride,
> +                             unsigned int plane)
> +{
> +       enum mdp_color c = fmt->mdp_color;
> +       u32 stride = pix_stride;
> +
> +       if (plane == 0)
> +               return stride;
> +       if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> +               stride = stride >> MDP_COLOR_GET_H_SUBSAMPLE(c);
> +               if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
> +                       stride = stride * 2;
> +               return stride;
> +       }
> +       return 0;
> +}
> +
> +/* Plane size that is accepted by MDP HW */
> +static u32
> +dip_mdp_fmt_get_plane_size(const struct mtk_dip_dev_mdp_format *fmt,
> +                          u32 stride, u32 height,
> +                          unsigned int plane)
> +{
> +       enum mdp_color c = fmt->mdp_color;
> +       u32 bytesperline;
> +
> +       bytesperline = (stride * fmt->row_depth[0])
> +               / MDP_COLOR_BITS_PER_PIXEL(c);
> +       if (plane == 0)
> +               return bytesperline * height;
> +       if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> +               height = height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> +               if (MDP_COLOR_IS_BLOCK_MODE(c))
> +                       bytesperline = bytesperline * 2;
> +               return bytesperline * height;
> +       }
> +       return 0;
> +}
> +
> +static int is_contig_mp_buffer(struct mtk_dip_dev_buffer *dev_buf)
> +{
> +       if (MDP_COLOR_GET_PLANE_COUNT(dev_buf->dev_fmt->fmt.img.mdp_color)
> +           == 1)
> +               return 0;
> +       else
> +               return 1;
> +}
> +
> +static int fill_ipi_img_param_mp(struct mtk_dip_pipe *dip_pipe,
> +                                struct img_image_buffer *b,
> +                                struct mtk_dip_dev_buffer *dev_buf,
> +                                char *buf_name)
> +{
> +       struct v4l2_pix_format_mplane *pix_mp;
> +       struct mtk_dip_dev_mdp_format *mdp_fmt;
> +       unsigned int i;
> +       unsigned int total_plane_size = 0;
> +
> +       if (!dev_buf || !dev_buf->dev_fmt) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s: %s's dev format not set\n",
> +                       __func__, buf_name);
> +               return -EINVAL;
> +       }
> +
> +       pix_mp = &dev_buf->fmt.fmt.pix_mp;
> +       mdp_fmt = &dev_buf->dev_fmt->fmt.img;
> +
> +       b->format.colorformat = dev_buf->dev_fmt->fmt.img.mdp_color;
> +       b->format.width = dev_buf->fmt.fmt.pix_mp.width;
> +       b->format.height = dev_buf->fmt.fmt.pix_mp.height;
> +       b->format.ycbcr_prof =
> +               map_ycbcr_prof_mplane(pix_mp,
> +                                     dev_buf->dev_fmt->fmt.img.mdp_color);
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s: buf(%s), IPI: w(%d),h(%d),c(0x%x)\n",
> +               dip_pipe->desc->name,
> +               buf_name,
> +               b->format.width,
> +               b->format.height,
> +               b->format.colorformat);
> +
> +       for (i = 0; i < pix_mp->num_planes; ++i) {
> +               u32 stride =
> +                       dip_mdp_fmt_get_stride
> +                       (mdp_fmt, pix_mp->plane_fmt[i].bytesperline, i);
> +
> +               b->format.plane_fmt[i].stride = stride;
> +               b->format.plane_fmt[i].size =
> +                       dip_mdp_fmt_get_plane_size(mdp_fmt,
> +                                                  stride,
> +                                                  pix_mp->height, i);
> +               b->iova[i] = dev_buf->isp_daddr;
> +               dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +                       "Contiguous-mp-buf:plane(%i),stride(%d),size(%d),iova(%p)",
> +                       i,
> +                       b->format.plane_fmt[i].stride,
> +                       b->format.plane_fmt[i].size,
> +                       b->iova[i]);
> +               total_plane_size = b->format.plane_fmt[i].size;
> +       }
> +
> +       for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
> +               u32 stride =
> +                       dip_mdp_fmt_get_stride_contig
> +                       (mdp_fmt, b->format.plane_fmt[0].stride, i);
> +
> +               b->format.plane_fmt[i].stride = stride;
> +               b->format.plane_fmt[i].size =
> +                       dip_mdp_fmt_get_plane_size(mdp_fmt, stride,
> +                                                  pix_mp->height, i);
> +               b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;

That's not true for multiplane buffers. We can't assume this. Is this a
hardware limitation?

> +               dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +                       "Contiguous-mp-buf:plane(%i),stride(%d),size(%d),iova(%p)",
> +                       i,
> +                       b->format.plane_fmt[i].stride,
> +                       b->format.plane_fmt[i].size,
> +                       b->iova[i]);
> +               total_plane_size += b->format.plane_fmt[i].size;
> +       }
> +
> +       b->usage = dev_buf->buffer_usage;
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "Contiguous-mp-buf(%s),v4l2-sizeimage(%d),total-plane-size(%d)\n",
> +               buf_name,
> +               pix_mp->plane_fmt[0].sizeimage,
> +               total_plane_size);
> +
> +       return 0;
> +}
> +
> +static int fill_ipi_img_param(struct mtk_dip_pipe *dip_pipe,
> +                             struct img_image_buffer *img,
> +                             struct mtk_dip_dev_buffer *dev_buf,
> +                             char *buf_name)
> +{
> +       img->format.width = dev_buf->fmt.fmt.pix_mp.width;
> +       img->format.height = dev_buf->fmt.fmt.pix_mp.height;
> +
> +       if (dev_buf && dev_buf->dev_fmt) {
> +               img->format.colorformat =
> +                       dev_buf->dev_fmt->fmt.img.mdp_color;
> +       } else {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s: %s's dev format not set\n",
> +                       __func__, buf_name);
> +               return -EINVAL;
> +       }
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s: buf(%s) IPI: w(%d),h(%d),c(0x%x)\n",
> +               dip_pipe->desc->name,
> +               buf_name,
> +               img->format.width,
> +               img->format.height,
> +               img->format.colorformat);
> +
> +       img->format.plane_fmt[0].size =
> +               dev_buf->fmt.fmt.pix_mp.plane_fmt[0].sizeimage;
> +       img->format.plane_fmt[0].stride =
> +               dev_buf->fmt.fmt.pix_mp.plane_fmt[0].bytesperline;
> +       img->iova[0] = dev_buf->isp_daddr;
> +       img->usage = dev_buf->buffer_usage;
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "size(%d), stride(%d),ycbcr(%d),iova(%p),u(%d)\n",
> +               img->format.plane_fmt[0].size,
> +               img->format.plane_fmt[0].stride,
> +               img->format.ycbcr_prof,
> +               img->iova[0],
> +               img->usage);
> +
> +       return 0;
> +}
> +
> +static int fill_input_ipi_param(struct mtk_dip_pipe *dip_pipe,
> +                               struct img_input *iin,
> +                               struct mtk_dip_dev_buffer *dev_buf,
> +                               char *buf_name)
> +{
> +       struct img_image_buffer *img = &iin->buffer;
> +
> +       /* Will map the vale with V4L2 color space in the future */
> +       img->format.ycbcr_prof = 1;
> +       if (is_contig_mp_buffer(dev_buf))
> +               return fill_ipi_img_param_mp(dip_pipe, img, dev_buf,
> +                                            buf_name);
> +       else
> +               return fill_ipi_img_param(dip_pipe, img, dev_buf,
> +                                         buf_name);

Could we support only the multiplane case?

> +}
> +
> +static int fill_output_ipi_param(struct mtk_dip_pipe *dip_pipe,
> +                                struct img_output *iout,
> +                                struct mtk_dip_dev_buffer *dev_buf_out,
> +                                struct mtk_dip_dev_buffer *dev_buf_in,
> +                                char *buf_name)
> +{
> +       int ret;
> +       struct img_image_buffer *img = &iout->buffer;
> +
> +       img->format.ycbcr_prof = 0;
> +
> +       if (is_contig_mp_buffer(dev_buf_out))
> +               ret = fill_ipi_img_param_mp(dip_pipe, img, dev_buf_out,
> +                                           buf_name);
> +       else
> +               ret = fill_ipi_img_param(dip_pipe, img, dev_buf_out,
> +                                        buf_name);

Could we support only the multiplane case?

> +
> +       iout->crop.left = 0;
> +       iout->crop.top = 0;
> +       iout->crop.width = dev_buf_in->fmt.fmt.pix_mp.width;
> +       iout->crop.height = dev_buf_in->fmt.fmt.pix_mp.height;
> +       iout->crop.left_subpix = 0;
> +       iout->crop.top_subpix = 0;
> +       iout->crop.width_subpix = 0;
> +       iout->crop.height_subpix = 0;
> +       iout->rotation = dev_buf_out->rotation;
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s: buf(%s) IPI-ext:c_l(%d),c_t(%d),c_w(%d),c_h(%d)\n",
> +               dip_pipe->desc->name,
> +               buf_name,
> +               iout->crop.left,
> +               iout->crop.top,
> +               iout->crop.width,
> +               iout->crop.height);
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "c_ls(%d),c_ts(%d),c_ws(%d),c_hs(%d),rot(%d)\n",
> +               iout->crop.left_subpix,
> +               iout->crop.top_subpix,
> +               iout->crop.width_subpix,
> +               iout->crop.height_subpix,
> +               iout->rotation);
> +
> +       return ret;
> +}
> +
> +int mtk_dip_pipe_job_start(struct mtk_dip_pipe *dip_pipe,
> +                          struct mtk_dip_pipe_job_info *pipe_job_info)
> +{
> +       struct platform_device *pdev = dip_pipe->dip_dev->pdev;
> +       int ret;
> +       int out_img_buf_idx;
> +       struct img_ipi_frameparam dip_param;
> +       struct mtk_dip_dev_buffer *dev_buf_in;
> +       struct mtk_dip_dev_buffer *dev_buf_out;
> +       struct mtk_dip_dev_buffer *dev_buf_tuning;
> +
> +       if (!pipe_job_info) {
> +               dev_err(&pdev->dev,
> +                       "pipe_job_info(%p) in start can't be NULL\n",
> +                       pipe_job_info);
> +               return -EINVAL;
> +       }

This should be impossible to happen.

> +
> +       /* We need RAW and at least MDP0 or MDP 1 buffer */
> +       if (!pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT] ||
> +           (!pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE] &&
> +                !pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE])){
> +               struct mtk_dip_dev_buffer **map = pipe_job_info->buf_map;
> +
> +               dev_dbg(&pdev->dev,
> +                       "can't trigger job: raw(%p), mdp0(%p), mdp1(%p)\n",
> +                       map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT],
> +                       map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE],
> +                       map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE]);
> +               return -EINVAL;

This must be validated at the time of request_validate. We can't fail at
this stage anymore.

> +       }
> +
> +       dev_dbg(&pdev->dev,
> +               "%s:%s: pipe-job id(%d)\n",
> +               __func__, dip_pipe->desc->name,
> +               pipe_job_info->id);
> +
> +       /* Fill ipi params for DIP driver */
> +       memset(&dip_param, 0, sizeof(struct img_ipi_frameparam));

sizeof(dip_param)

> +
> +       dip_param.index = pipe_job_info->id;
> +       dip_param.num_outputs = pipe_job_info->num_img_capture_bufs;
> +       dip_param.num_inputs = pipe_job_info->num_img_output_bufs;
> +       dip_param.type = STREAM_ISP_IC;
> +
> +       /* Tuning buffer */
> +       dev_buf_tuning =
> +               pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_TUNING_OUT];
> +       if (dev_buf_tuning) {
> +               dev_dbg(&pdev->dev,
> +                       "Tuning buf queued: pa(%p),va(%p),iova(%p)\n",
> +                       dev_buf_tuning->scp_daddr,
> +                       dev_buf_tuning->vaddr,
> +                       dev_buf_tuning->isp_daddr);
> +               dip_param.tuning_data.pa = (uint32_t)dev_buf_tuning->scp_daddr;
> +               dip_param.tuning_data.va = (uint64_t)dev_buf_tuning->vaddr;
> +               dip_param.tuning_data.iova =
> +                       (uint32_t)dev_buf_tuning->isp_daddr;
> +       } else {
> +               dev_dbg(&pdev->dev,
> +                       "Doesn't enqueued tuning buffer, by-pass\n");
> +       dip_param.tuning_data.pa = 0;
> +       dip_param.tuning_data.va = 0;
> +       dip_param.tuning_data.iova = 0;

We just called memset() on this whole struct above, so no need to explicitly
set these fields to 0.

> +       }
> +
> +       /* Raw-in buffer */
> +       dev_buf_in =
> +               pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT];
> +       if (dev_buf_in) {
> +               struct img_input *iin = &dip_param.inputs[0];
> +
> +               fill_input_ipi_param(dip_pipe, iin, dev_buf_in, "RAW");
> +       }
> +
> +       out_img_buf_idx = 0;
> +
> +       /* MDP 0 buffer */
> +       dev_buf_out =
> +               pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE];
> +       if (dev_buf_out) {
> +               struct img_output *iout = &dip_param.outputs[out_img_buf_idx];
> +
> +               fill_output_ipi_param(dip_pipe, iout, dev_buf_out,
> +                                     dev_buf_in, "MDP0");
> +               out_img_buf_idx++;
> +       }
> +
> +       /* MDP 1 buffer */
> +       dev_buf_out =
> +               pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE];
> +       if (dev_buf_out) {
> +               struct img_output *iout = &dip_param.outputs[out_img_buf_idx];
> +
> +               fill_output_ipi_param(dip_pipe, iout, dev_buf_out,
> +                                     dev_buf_in, "MDP1");
> +               out_img_buf_idx++;
> +       }

The 2 buffers above could be handled in a loop.

> +
> +       ret = mtk_dip_hw_enqueue(&dip_pipe->dip_dev->dip_hw, &dip_param);
> +

Unnecessary blank line.

> +       if (ret) {
> +               dev_dbg(&pdev->dev,
> +                       "%s:%s: enqueue to HW failed(%d)\n",
> +                        __func__, dip_pipe->desc->name, ret);
> +               return -EBUSY;
> +       }
> +
> +       return ret;
> +}

This function could be just merged together with mtk_dip_hw_enqueue().
Please avoid unnecessary layering inside the driver.

> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> new file mode 100644
> index 000000000000..f51f7a44379a
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> @@ -0,0 +1,321 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _MTK_DIP_DEV_H_
> +#define _MTK_DIP_DEV_H_
> +
> +#include <linux/types.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-device.h>
> +#include <linux/videodev2.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "mtk_dip-hw.h"
> +#include "mtk_dip-smem.h"
> +
> +#define MTK_DIP_PIPE_ID_PREVIEW                                0
> +#define MTK_DIP_PIPE_ID_CAPTURE                                1
> +#define MTK_DIP_PIPE_ID_REPROCESS                      2
> +#define MTK_DIP_PIPE_ID_TOTAL_NUM                      3
> +
> +#define MTK_DIP_VIDEO_NODE_ID_RAW_OUT                  0
> +#define MTK_DIP_VIDEO_NODE_ID_TUNING_OUT               1
> +#define MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM            2
> +#define MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE             2
> +#define MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE             3
> +#define MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM                2
> +#define MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM \
> +       (MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM + \
> +       MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM)
> +
> +#define MTK_DIP_VIDEO_NODE_ID_NO_MASTER                        -1
> +
> +#define MTK_DIP_OUTPUT_MIN_WIDTH               2U
> +#define MTK_DIP_OUTPUT_MIN_HEIGHT              2U
> +#define MTK_DIP_OUTPUT_MAX_WIDTH               5376U
> +#define MTK_DIP_OUTPUT_MAX_HEIGHT              4032U
> +#define MTK_DIP_CAPTURE_MIN_WIDTH              2U
> +#define MTK_DIP_CAPTURE_MIN_HEIGHT             2U
> +#define MTK_DIP_CAPTURE_MAX_WIDTH              5376U
> +#define MTK_DIP_CAPTURE_MAX_HEIGHT             4032U
> +
> +#define MTK_DIP_DEV_DIP_MEDIA_MODEL_NAME       "MTK-ISP-DIP-V4L2"
> +#define MTK_DIP_DEV_DIP_PREVIEW_NAME \
> +       MTK_DIP_DEV_DIP_MEDIA_MODEL_NAME
> +#define MTK_DIP_DEV_DIP_CAPTURE_NAME           "MTK-ISP-DIP-CAP-V4L2"
> +#define MTK_DIP_DEV_DIP_REPROCESS_NAME         "MTK-ISP-DIP-REP-V4L2"
> +
> +#define MTK_DIP_DEV_META_BUF_DEFAULT_SIZE (1110 * 1024)
> +
> +#define V4L2_CID_PRIVATE_UT_NUM                        (V4L2_CID_USER_BASE | 0x1001)
> +#define V4L2_CID_PRIVATE_SET_BUFFER_USAGE      (V4L2_CID_PRIVATE_UT_NUM + 2)
> +#define V4L2_CID_MTK_DIP_MAX                   100
> +
> +enum mtk_dip_v4l2_buffer_usage {
> +       MTK_DIP_V4l2_BUF_USAGE_DEFAULT = 0,
> +       MTK_DIP_V4l2_BUF_USAGE_FD,
> +       MTK_DIP_V4l2_BUF_USAGE_POSTPROC,
> +       MTK_DIP_V4l2_BUF_USAGE_NONE,
> +};
> +
> +/*
> + * Supported format and the information used for
> + * size calculation
> + */
> +struct mtk_dip_dev_meta_format {
> +       u32 dataformat;
> +       u32 max_buffer_size;

There should not be such a thing as "max buffer size" for metadata
buffers. The buffer should always have a fixed size, equal to the size
of the metadata struct.

> +       u8 flags;
> +};
> +
> +/* MDP part private format definitation */
> +struct mtk_dip_dev_mdp_format {
> +       u32 pixelformat;
> +       u32 mdp_color;
> +       u32 colorspace;
> +       u8 depth[VIDEO_MAX_PLANES];
> +       u8 row_depth[VIDEO_MAX_PLANES];
> +       u8 num_planes;
> +       u8 walign;
> +       u8 halign;
> +       u8 salign;
> +       u32 flags;
> +};
> +
> +struct mtk_dip_dev_format {
> +       union {
> +               struct mtk_dip_dev_meta_format meta;
> +               struct mtk_dip_dev_mdp_format img;
> +       } fmt;

I don't see much value in having this as an union. Couldn't we just
merge both structs and have as one mtk_dip_dev_format? meta.dataformat
seems equivalent to img.pixelformat and both have flags.

> +};
> +
> +struct mtk_dip_pipe_job_info {
> +       struct media_request *req;
> +       int id;
> +       struct mtk_dip_dev_buffer*
> +               buf_map[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM];
> +       int num_img_capture_bufs;
> +       int num_img_output_bufs;
> +       int num_meta_capture_bufs;
> +       int num_meta_output_bufs;
> +       struct list_head list;
> +};
> +
> +struct mtk_dip_dev_buffer {
> +       struct vb2_v4l2_buffer vbb;
> +       struct v4l2_format fmt;
> +       struct mtk_dip_dev_format *dev_fmt;
> +       int pipe_job_id;
> +       void *vaddr;
> +       dma_addr_t isp_daddr;
> +       dma_addr_t scp_daddr;
> +       unsigned int buffer_usage;
> +       int rotation;
> +       struct list_head list;
> +};
> +
> +struct mtk_dip_pipe_desc {
> +       char *name;
> +       int master;
> +       int id;
> +       struct mtk_dip_video_device_desc *output_queue_descs;
> +       int total_output_queues;
> +       struct mtk_dip_video_device_desc *capture_queue_descs;
> +       int total_capture_queues;
> +};
> +
> +struct mtk_dip_video_device_desc {
> +       int id;
> +       char *name;
> +       u32 buf_type;
> +       u32 cap;
> +       int smem_alloc;
> +       int dynamic;
> +       int default_enable;
> +       struct mtk_dip_dev_format *fmts;
> +       int num_fmts;
> +       char *description;
> +       int default_width;
> +       int default_height;
> +       const struct v4l2_ioctl_ops *ops;
> +       int default_fmt_idx;
> +};
> +
> +struct mtk_dip_dev_queue {
> +       struct vb2_queue vbq;
> +       /* Serializes vb2 queue and video device operations */
> +       struct mutex lock;
> +       struct mtk_dip_dev_format *dev_fmt;
> +       /* Firmware uses buffer_usage to select suitable DMA ports */
> +       unsigned int buffer_usage;
> +       int rotation;
> +};
> +
> +struct mtk_dip_video_device {
> +       struct video_device vdev;
> +       struct mtk_dip_dev_queue dev_q;
> +       struct v4l2_format vdev_fmt;
> +       struct media_pad vdev_pad;
> +       struct v4l2_mbus_framefmt pad_fmt;
> +       struct v4l2_ctrl_handler ctrl_handler;
> +       int immutable;
> +       int enabled;
> +       struct mtk_dip_video_device_desc *desc;
> +       atomic_t sequence;
> +};
> +
> +struct mtk_dip_pipe {
> +       struct mtk_dip_dev *dip_dev;
> +       struct mtk_dip_video_device nodes[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM];
> +       int num_nodes;
> +       int streaming;
> +       struct media_pad *subdev_pads;
> +       struct media_pipeline pipeline;
> +       struct v4l2_subdev subdev;
> +       struct v4l2_subdev_fh *fh;
> +       struct v4l2_ctrl_handler ctrl_handler;
> +       struct mtk_dip_smem_dev *smem_alloc_dev;
> +       atomic_t pipe_job_sequence;
> +       struct mtk_dip_pipe_job_info pipe_job_infos[VB2_MAX_FRAME];
> +       int num_pipe_job_infos;
> +       struct list_head pipe_job_running_list;
> +       struct list_head pipe_job_free_list;
> +       /* Serializes pipe's stream on/off and buffers enqueue operations */
> +       struct mutex lock;
> +       spinlock_t job_lock; /* protect the pipe job list */
> +       struct mtk_dip_pipe_desc *desc;
> +};
> +
> +struct mtk_dip_dev {
> +       struct platform_device *pdev;
> +       struct media_device mdev;
> +       struct v4l2_device v4l2_dev;
> +       struct mtk_dip_pipe dip_pipe[MTK_DIP_PIPE_ID_TOTAL_NUM];
> +       struct mtk_dip_smem_dev smem_alloc_dev;
> +       struct mtk_dip_hw dip_hw;
> +};
> +
> +int mtk_dip_dev_media_register(struct device *dev,
> +                              struct media_device *media_dev,
> +                              const char *model);
> +
> +int mtk_dip_dev_v4l2_init(struct mtk_dip_dev *dip_dev);
> +
> +void mtk_dip_dev_v4l2_release(struct mtk_dip_dev *dip_dev);
> +
> +int mtk_dip_dev_v4l2_register(struct device *dev,
> +                             struct media_device *media_dev,
> +                             struct v4l2_device *v4l2_dev);
> +
> +int mtk_dip_pipe_v4l2_register(struct mtk_dip_pipe *dip_pipe,
> +                              struct media_device *media_dev,
> +                              struct v4l2_device *v4l2_dev);
> +
> +int mtk_dip_pipe_v4l2_unregister(struct mtk_dip_pipe *dip_pipe);
> +
> +void mtk_dip_v4l2_buffer_done(struct vb2_buffer *vb,
> +                             enum vb2_buffer_state state);
> +
> +int mtk_dip_pipe_queue_buffers(struct media_request *req, int initial);
> +
> +int mtk_dip_pipe_init(struct mtk_dip_pipe *dip_pipe,
> +                     struct mtk_dip_dev *dip_dev,
> +                     struct mtk_dip_pipe_desc *setting,
> +                     struct media_device *media_dev,
> +                     struct v4l2_device *v4l2_dev,
> +                     struct mtk_dip_smem_dev *smem_alloc_dev);
> +
> +int mtk_dip_pipe_release(struct mtk_dip_pipe *dip_pipe);
> +
> +int mtk_dip_pipe_job_finish(struct mtk_dip_pipe *dip_pipe,
> +                           unsigned int pipe_job_info_id,
> +                           enum vb2_buffer_state state);
> +
> +int mtk_dip_pipe_job_start(struct mtk_dip_pipe *dip_pipe,
> +                          struct mtk_dip_pipe_job_info *pipe_job_info);
> +
> +int mtk_dip_pipe_init_job_infos(struct mtk_dip_pipe *dip_pipe);
> +
> +struct mtk_dip_dev_format *
> +mtk_dip_pipe_find_fmt(struct mtk_dip_pipe *dip_pipe,
> +                     struct mtk_dip_video_device *node,
> +                     u32 format);
> +
> +int mtk_dip_pipe_set_img_fmt(struct mtk_dip_pipe *dip_pipe,
> +                            struct mtk_dip_video_device *node,
> +                            struct v4l2_pix_format_mplane *user_fmt,
> +                            struct v4l2_pix_format_mplane *node_fmt);
> +
> +int mtk_dip_pipe_set_meta_fmt(struct mtk_dip_pipe *dip_pipe,
> +                             struct mtk_dip_video_device *node,
> +                             struct v4l2_meta_format *user_fmt,
> +                             struct v4l2_meta_format *node_fmt);
> +
> +void mtk_dip_pipe_load_default_fmt(struct mtk_dip_pipe *dip_pipe,
> +                                  struct mtk_dip_video_device *node,
> +                                  struct v4l2_format *fmt_to_fill);
> +
> +int mtk_dip_pipe_streamon(struct mtk_dip_pipe *dip_pipe);
> +
> +int mtk_dip_pipe_streamoff(struct mtk_dip_pipe *dip_pipe);
> +
> +int mtk_dip_ctrl_init(struct mtk_dip_pipe *dip_pipe);
> +
> +static inline struct mtk_dip_video_device *
> +mtk_dip_file_to_node(struct file *file)
> +{
> +       return container_of(video_devdata(file),
> +                           struct mtk_dip_video_device, vdev);
> +}
> +
> +static inline struct mtk_dip_pipe *
> +mtk_dip_subdev_to_pipe(struct v4l2_subdev *sd)
> +{
> +       return container_of(sd, struct mtk_dip_pipe, subdev);
> +}
> +
> +static inline struct mtk_dip_video_device *
> +mtk_dip_vbq_to_node(struct vb2_queue *vq)
> +{
> +       return container_of(vq, struct mtk_dip_video_device, dev_q.vbq);
> +}
> +
> +static inline struct mtk_dip_dev_buffer *
> +mtk_dip_vb2_buf_to_dev_buf(struct vb2_buffer *vb)
> +{
> +       return container_of(vb, struct mtk_dip_dev_buffer, vbb.vb2_buf);
> +}
> +
> +static inline struct mtk_dip_dev *mtk_dip_hw_to_dev(struct mtk_dip_hw *dip_hw)
> +{
> +       return container_of(dip_hw, struct mtk_dip_dev, dip_hw);
> +}
> +
> +static inline int mtk_dip_buf_is_meta(u32 type)
> +{
> +       return type == V4L2_BUF_TYPE_META_CAPTURE ||
> +               type == V4L2_BUF_TYPE_META_OUTPUT;
> +}
> +
> +static inline int mtk_dip_pipe_get_pipe_from_job_id(int pipe_job_id)
> +{
> +       return (pipe_job_id >> 16) & 0x0000FFFF;
> +}
> +
> +#endif /* _MTK_DIP_DEV_H_ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> new file mode 100644
> index 000000000000..d813d8b92e8b
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> @@ -0,0 +1,167 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2018 MediaTek Inc.
> + * Author: Holmes Chiou <holmes.chiou@mediatek.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _MTK_DIP_HW_H_
> +#define _MTK_DIP_HW_H_
> +
> +#include <linux/clk.h>
> +#include "mtk-img-ipi.h"
> +
> +enum STREAM_TYPE_ENUM {
> +       STREAM_UNKNOWN,
> +       STREAM_BITBLT,
> +       STREAM_GPU_BITBLT,
> +       STREAM_DUAL_BITBLT,
> +       STREAM_2ND_BITBLT,
> +       STREAM_ISP_IC,
> +       STREAM_ISP_VR,
> +       STREAM_ISP_ZSD,
> +       STREAM_ISP_IP,
> +       STREAM_ISP_VSS,
> +       STREAM_ISP_ZSD_SLOW,
> +       STREAM_WPE,
> +       STREAM_WPE2,
> +};
> +
> +enum mtk_dip_hw_user_state {
> +       DIP_STATE_INIT  = 0,
> +       DIP_STATE_STREAMON,
> +       DIP_STATE_STREAMOFF
> +};
> +
> +struct mtk_dip_hw_frame_job {
> +       struct img_frameparam fparam;
> +       int sequence;
> +};
> +
> +struct mtk_dip_hw_user_id {
> +       struct list_head list_entry;
> +       u16 id;
> +       u32 num;
> +       u16 state;
> +};
> +
> +struct mtk_dip_hw_subframe {
> +       struct img_addr buffer;
> +       struct sg_table table;
> +       struct img_sw_addr config_data;
> +       struct img_addr tuning_buf;
> +       struct img_sw_addr frameparam;
> +       struct list_head list_entry;
> +};
> +
> +struct mtk_dip_hw_queue {
> +       struct list_head queue;
> +       struct mutex queuelock; /* protect queue and queue_cnt */
> +       u32 queue_cnt;
> +};
> +
> +struct mtk_dip_hw_joblist {
> +       struct list_head queue;
> +       spinlock_t queuelock; /* protect job list */
> +       u32 queue_cnt;
> +};
> +
> +struct mtk_dip_hw_thread {
> +       struct task_struct *thread;
> +       wait_queue_head_t wq;
> +};
> +
> +struct mtk_dip_hw_work {
> +       struct list_head list_entry;
> +       struct img_ipi_frameparam frameparams;
> +       struct mtk_dip_hw_user_id *user_id;
> +};
> +
> +struct mtk_dip_hw_submit_work {
> +       struct work_struct frame_work;
> +       struct mtk_dip_hw *dip_hw;
> +};
> +
> +struct mtk_dip_hw_mdpcb_work {
> +       struct work_struct frame_work;
> +       struct img_ipi_frameparam *frameparams;
> +};
> +
> +struct mtk_dip_hw_clk {
> +       struct clk *img_larb5;
> +       struct clk *img_dip;
> +};
> +
> +enum frame_state {
> +       FRAME_STATE_INIT = 0,
> +       FRAME_STATE_COMPOSING,
> +       FRAME_STATE_RUNNING,
> +       FRAME_STATE_DONE,
> +       FRAME_STATE_STREAMOFF,
> +       FRAME_STATE_ERROR,
> +       FRAME_STATE_HW_TIMEOUT
> +};
> +
> +struct mtk_dip_hw {
> +       struct mtk_dip_hw_clk dip_clk;
> +       struct device *larb_dev;
> +       struct mtk_dip_hw_joblist dip_gcejoblist;
> +       struct mtk_dip_hw_queue dip_freebufferlist;
> +       struct mtk_dip_hw_queue dip_usedbufferlist;
> +       struct mtk_dip_hw_thread dip_runner_thread;
> +       struct mtk_dip_hw_queue dip_useridlist;
> +       struct mtk_dip_hw_queue dip_worklist;
> +       struct workqueue_struct *composer_wq;
> +       struct mtk_dip_hw_submit_work submit_work;
> +       wait_queue_head_t composing_wq;
> +       wait_queue_head_t flushing_wq;
> +       atomic_t num_composing; /* increase after ipi */
> +       /* increase after calling MDP driver */
> +       atomic_t num_running;
> +       /*MDP/GCE callback workqueue */
> +       struct workqueue_struct *mdpcb_workqueue;
> +       /* for MDP driver  */
> +       struct platform_device *mdp_pdev;
> +       /* for VPU driver  */
> +       struct platform_device *vpu_pdev;
> +       struct rproc *rproc_handle;
> +       dma_addr_t scp_workingbuf_addr;
> +       /* increase after enqueue */
> +       atomic_t dip_enque_cnt;
> +       /* increase after Stream ON, decrease when Stream OFF */
> +       atomic_t dip_stream_cnt;
> +       /* increase after open, decrease when close */
> +       atomic_t dip_user_cnt;
> +};
> +
> +int mtk_dip_hw_enqueue(struct mtk_dip_hw *dip_hw,
> +                      struct img_ipi_frameparam *frameparams);
> +int mtk_dip_hw_connect(struct mtk_dip_hw *dip_hw);
> +int mtk_dip_hw_disconnect(struct mtk_dip_hw *dip_hw);
> +int mtk_dip_hw_streamon(struct mtk_dip_hw *dip_hw, u16 id);
> +int mtk_dip_hw_streamoff(struct mtk_dip_hw *dip_hw, u16 id);
> +
> +static inline struct mtk_dip_hw_frame_job
> +*mtk_dip_fparam_to_job(struct img_frameparam *fparam)
> +{
> +       return container_of(fparam, struct mtk_dip_hw_frame_job, fparam);
> +}
> +
> +static inline struct mtk_dip_hw_frame_job *
> +mtk_dip_ipi_fparam_to_job(struct img_ipi_frameparam *ipi_fparam)
> +{
> +       return container_of(ipi_fparam,
> +                           struct mtk_dip_hw_frame_job,
> +                           fparam.frameparam);
> +}
> +
> +#endif /* _MTK_DIP_HW_H_ */
> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c
> new file mode 100644
> index 000000000000..5456c0b54ad4
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/dma-contiguous.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/iommu.h>
> +#include <asm/cacheflush.h>
> +#include "mtk_dip-smem.h"
> +
> +#define MTK_DIP_SMEM_DEV_NAME "MTK-DIP-SMEM"
> +
> +static struct reserved_mem *dip_reserved_smem;
> +static struct dma_map_ops smem_dma_ops;
> +
> +struct dma_coherent_mem {
> +       void            *virt_base;
> +       dma_addr_t      device_base;
> +       unsigned long   pfn_base;
> +       int             size;
> +       int             flags;
> +       unsigned long   *bitmap;
> +       spinlock_t      spinlock; /* protect dma_coherent_mem member */
> +       bool            use_dev_dma_pfn_offset;
> +};
> +
> +static struct dma_coherent_mem *dev_get_coherent_memory(struct device *dev)
> +{
> +       if (dev && dev->dma_mem)
> +               return dev->dma_mem;
> +       return NULL;
> +}
> +
> +phys_addr_t mtk_dip_smem_iova_to_phys(struct mtk_dip_smem_dev *smem_dev,
> +                                     dma_addr_t iova)
> +{
> +               struct iommu_domain *smem_dom;
> +               phys_addr_t addr;
> +               phys_addr_t limit;
> +
> +               if (!smem_dev)
> +                       return 0;
> +
> +               smem_dom = iommu_get_domain_for_dev(smem_dev->dev.parent);
> +
> +               if (!smem_dom)
> +                       return 0;
> +
> +               addr = iommu_iova_to_phys(smem_dom, iova);
> +
> +               limit = smem_dev->smem_base + smem_dev->smem_size;
> +
> +               if (addr < smem_dev->smem_base || addr >= limit) {
> +                       dev_err(&smem_dev->dev,
> +                               "Unexpected scp_daddr %pa (must >= %pa and <%pa)\n",
> +                               &addr, &smem_dev->smem_base, &limit);
> +                       return 0;
> +               }
> +               dev_dbg(&smem_dev->dev, "Pa verifcation pass: %pa(>=%pa, <%pa)\n",
> +                       &addr, &smem_dev->smem_base, &limit);
> +               return addr;
> +}
> +
> +/********************************************
> + * MTK DIP SMEM DMA ops *
> + ********************************************/
> +static int mtk_dip_smem_get_sgtable(struct device *dev,
> +                                   struct sg_table *sgt,
> +                                   void *cpu_addr,
> +                                   dma_addr_t dma_addr,
> +                                   size_t size, unsigned long attrs)
> +{
> +       struct mtk_dip_smem_dev *smem_dev = dev_get_drvdata(dev);
> +       int n_pages_align;
> +       int size_align;
> +       int page_start;
> +       unsigned long long offset_p;
> +
> +       phys_addr_t paddr = mtk_dip_smem_iova_to_phys(smem_dev, dma_addr);
> +
> +       offset_p = (unsigned long long)paddr -
> +               (unsigned long long)smem_dev->smem_base;
> +
> +       dev_dbg(dev, "%s: dma_addr(%p), cpu_addr(%p), pa(%p), size(%d)\n",
> +               __func__, dma_addr, cpu_addr, paddr, size);
> +
> +       size_align = round_up(size, PAGE_SIZE);
> +       n_pages_align = size_align >> PAGE_SHIFT;
> +       page_start = offset_p >> PAGE_SHIFT;
> +
> +       dev_dbg(dev, "%s: page_start(%d), page pa(%p), pa(%p), aligned size(%d)\n",
> +               __func__,
> +               page_start,
> +               page_to_phys(*(smem_dev->smem_pages + page_start)),
> +               paddr,
> +               size_align
> +               );
> +
> +       if (!smem_dev) {
> +               dev_err(dev, "can't get sgtable from smem_dev\n");
> +               return -EINVAL;
> +       }
> +
> +       dev_dbg(dev, "%s: get sgt of the smem: %d pages\n", __func__,
> +               n_pages_align);
> +
> +       return sg_alloc_table_from_pages(sgt,
> +                                        smem_dev->smem_pages + page_start,
> +                                        n_pages_align,
> +                                        0, size_align, GFP_KERNEL);
> +}
> +
> +static void *mtk_dip_smem_get_cpu_addr(struct mtk_dip_smem_dev *smem_dev,
> +                                      struct scatterlist *sg)
> +{
> +       struct device *dev = &smem_dev->dev;
> +       struct dma_coherent_mem *dma_mem =
> +               dev_get_coherent_memory(dev);
> +
> +       phys_addr_t addr = (phys_addr_t)sg_phys(sg);
> +
> +       if (addr < smem_dev->smem_base ||
> +           addr > smem_dev->smem_base + smem_dev->smem_size) {
> +               dev_err(dev, "%s: Invalid paddr %p from sg\n", __func__, addr);
> +               return NULL;
> +       }
> +
> +       return dma_mem->virt_base + (addr - smem_dev->smem_base);
> +}
> +
> +static void mtk_dip_smem_sync_sg_for_cpu(struct device *dev,
> +                                        struct scatterlist *sgl,
> +                                        int nelems,
> +                                        enum dma_data_direction dir)
> +{
> +       struct mtk_dip_smem_dev *smem_dev =
> +               dev_get_drvdata(dev);
> +       void *cpu_addr;
> +
> +       cpu_addr = mtk_dip_smem_get_cpu_addr(smem_dev, sgl);
> +
> +       dev_dbg(dev, "%s: paddr(%p),vaddr(%p),size(%d)\n",
> +               __func__, sg_phys(sgl), cpu_addr, sgl->length);
> +
> +       if (cpu_addr)
> +               __dma_unmap_area(cpu_addr, sgl->length, dir);
> +}
> +
> +static void mtk_dip_smem_sync_sg_for_device(struct device *dev,
> +                                           struct scatterlist *sgl,
> +                                           int nelems,
> +                                           enum dma_data_direction dir)
> +{
> +       struct mtk_dip_smem_dev *smem_dev =
> +                       dev_get_drvdata(dev);
> +       void *cpu_addr;
> +
> +       cpu_addr = mtk_dip_smem_get_cpu_addr(smem_dev, sgl);
> +
> +       dev_dbg(dev, "%s: pa(%p),va(%p),size(%d),dir(%d)\n",
> +               __func__, sg_phys(sgl), cpu_addr, sgl->length, dir);
> +
> +       if (cpu_addr)
> +               __dma_map_area(cpu_addr, sgl->length, dir);
> +}
> +
> +static int mtk_dip_smem_setup_dma_ops(struct device *dev,
> +                                     struct device *default_alloc_dev)
> +{
> +       memcpy((void *)&smem_dma_ops, default_alloc_dev->dma_ops,
> +              sizeof(smem_dma_ops));
> +
> +       smem_dma_ops.get_sgtable =
> +               mtk_dip_smem_get_sgtable;
> +       smem_dma_ops.sync_sg_for_device =
> +               mtk_dip_smem_sync_sg_for_device;
> +       smem_dma_ops.sync_sg_for_cpu =
> +               mtk_dip_smem_sync_sg_for_cpu;
> +
> +       dev->dma_ops = &smem_dma_ops;
> +
> +       dev_dbg(dev, "setup smem_dma_ops: %p\n", dev->dma_ops);
> +
> +       return 0;
> +}
> +
> +void mtk_dip_smem_alloc_dev_release(struct mtk_dip_smem_dev *smem_dev)
> +{
> +       device_unregister(&smem_dev->dev);
> +}
> +
> +int mtk_dip_smem_alloc_dev_init(struct mtk_dip_smem_dev *smem_dev,
> +                               struct device *parent)
> +{
> +       int ret;
> +       struct device *dev = &smem_dev->dev;
> +
> +       dev->parent  = parent;
> +       dev_set_name(&smem_dev->dev, "dip-smem");
> +
> +       ret = device_register(dev);
> +
> +       if (ret)
> +               dev_err(parent, "Failed to register smem device\n");
> +
> +       dev_dbg(dev, "init alloc dev(%p), parent(%p)\n", dev, dev->parent);
> +
> +       dev_set_drvdata(dev, smem_dev);
> +
> +       if (dip_reserved_smem) {
> +               dma_addr_t dma_addr;
> +               phys_addr_t addr;
> +               struct iommu_domain *smem_dom;
> +               int i;
> +               int size_align;
> +               struct page **pages;
> +               int n_pages;
> +               struct sg_table *sgt = &smem_dev->sgt;
> +
> +               size_align = round_down(dip_reserved_smem->size, PAGE_SIZE);
> +               n_pages = size_align >> PAGE_SHIFT;
> +               pages = kmalloc_array(n_pages, sizeof(struct page *),
> +                                     GFP_KERNEL);
> +
> +               if (!pages)
> +                       return -ENOMEM;
> +
> +               for (i = 0; i < n_pages; i++)
> +                       pages[i] = phys_to_page(dip_reserved_smem->base
> +                                               + i * PAGE_SIZE);
> +
> +               ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0,
> +                                               size_align, GFP_KERNEL);
> +
> +               if (ret) {
> +                       dev_err(dev, "failed to get alloca sg table\n");
> +                       return -ENOMEM;
> +               }
> +
> +               dma_map_sg_attrs(parent, sgt->sgl, sgt->nents,
> +                                DMA_BIDIRECTIONAL,
> +                                DMA_ATTR_SKIP_CPU_SYNC);
> +
> +               dma_addr = sg_dma_address(sgt->sgl);
> +               smem_dom = iommu_get_domain_for_dev(parent);
> +               addr = iommu_iova_to_phys(smem_dom, dma_addr);
> +
> +               if (addr != dip_reserved_smem->base)
> +                       dev_warn(dev,
> +                                "incorrect pa(%p) from iommu_iova_to_phys, should be %p\n",
> +                                addr, dip_reserved_smem->base);
> +
> +               ret = dma_declare_coherent_memory(dev,
> +                                                 dip_reserved_smem->base,
> +                                                 dma_addr, size_align,
> +                                                 DMA_MEMORY_EXCLUSIVE);
> +
> +               dev_dbg(dev, "Coherent mem base(%p,%p),size(%lx),ret(%d)\n",
> +                       dip_reserved_smem->base, dma_addr, size_align, ret);
> +
> +               smem_dev->smem_base = dip_reserved_smem->base;
> +               smem_dev->smem_size = size_align;
> +               smem_dev->smem_pages = pages;
> +               smem_dev->num_smem_pages = n_pages;
> +               smem_dev->smem_dma_base = dma_addr;
> +
> +               dev_dbg(dev, "smem_dev setting (%p,%lx,%p,%d)\n",
> +                       smem_dev->smem_base, smem_dev->smem_size,
> +                       smem_dev->smem_pages, smem_dev->num_smem_pages);
> +       }
> +
> +       ret = mtk_dip_smem_setup_dma_ops(dev, parent);
> +
> +       return ret;
> +}
> +
> +static int __init mtk_dip_smem_dma_setup(struct reserved_mem *rmem)
> +{
> +       unsigned long node = rmem->fdt_node;
> +
> +       if (of_get_flat_dt_prop(node, "reusable", NULL))
> +               return -EINVAL;
> +
> +       if (!of_get_flat_dt_prop(node, "no-map", NULL)) {
> +               pr_err("Reserved memory: regions without no-map are not yet supported\n");
> +               return -EINVAL;
> +       }
> +
> +       dip_reserved_smem = rmem;
> +
> +       pr_debug("Reserved memory: created DMA memory pool at %pa, size %ld MiB\n",
> +                &rmem->base, (unsigned long)rmem->size / SZ_1M);
> +       return 0;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(mtk_dip_smem,
> +                      "mediatek,reserve-memory-dip_smem",
> +                      mtk_dip_smem_dma_setup);
> +
> +MODULE_AUTHOR("Frederic Chen <frederic.chen@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Mediatek Camera DIP shared memory alloc device");
> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.h
> new file mode 100644
> index 000000000000..a2f7559cc49d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _MTK_DIP_SMEM_H_
> +#define _MTK_DIP_SMEM_H_
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/device.h>
> +
> +struct mtk_dip_smem_dev {
> +       struct device dev;
> +       struct sg_table sgt;
> +       struct page **smem_pages;
> +       int num_smem_pages;
> +       phys_addr_t smem_base;
> +       dma_addr_t smem_dma_base;
> +       int smem_size;
> +};
> +
> +phys_addr_t mtk_dip_smem_iova_to_phys(struct mtk_dip_smem_dev *smem_dev,
> +                                     dma_addr_t iova);
> +int mtk_dip_smem_alloc_dev_init(struct mtk_dip_smem_dev *smem_dev,
> +                               struct device *default_alloc_dev);
> +void mtk_dip_smem_alloc_dev_release(struct mtk_dip_smem_dev *smem_dev);
> +
> +#endif /*_MTK_DIP_SMEM_H_*/
> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> new file mode 100644
> index 000000000000..54d2b5f5b802
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> @@ -0,0 +1,1384 @@
> +// SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Holmes Chiou <holmes.chiou@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/kthread.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/dma-iommu.h>
> +#include <linux/spinlock.h>
> +#include <linux/slab.h>
> +#include <linux/remoteproc.h>
> +#include <linux/platform_data/mtk_scp.h>
> +#include "mtk-mdp3-cmdq.h"
> +#include "mtk_dip-dev.h"
> +#include "mtk_dip-hw.h"
> +
> +#define DIP_DEV_NAME                   "camera-dip"
> +
> +#define DIP_COMPOSER_THREAD_TIMEOUT     16U
> +#define DIP_COMPOSING_WQ_TIMEOUT       16U
> +#define DIP_COMPOSING_MAX_NUM          3
> +#define DIP_FLUSHING_WQ_TIMEOUT                16U
> +#define DIP_MAX_ERR_COUNT              188U
> +
> +#define DIP_FRM_SZ                     (76 * 1024)
> +#define DIP_SUB_FRM_SZ                 (16 * 1024)
> +#define DIP_TUNING_SZ                  (32 * 1024)
> +#define DIP_COMP_SZ                    (24 * 1024)
> +#define DIP_FRAMEPARAM_SZ              (4 * 1024)
> +
> +#define DIP_TUNING_OFFSET              DIP_SUB_FRM_SZ
> +#define DIP_COMP_OFFSET                        (DIP_TUNING_OFFSET + DIP_TUNING_SZ)
> +#define DIP_FRAMEPARAM_OFFSET          (DIP_COMP_OFFSET + DIP_COMP_SZ)
> +#define DIP_SUB_FRM_DATA_NUM           32
> +#define DIP_SCP_WORKINGBUF_OFFSET      (5 * 1024 * 1024)
> +
> +static inline struct mtk_dip_hw *get_dip_device(struct device *dev)
> +{
> +       struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> +
> +       if (dip_dev)
> +               return &dip_dev->dip_hw;
> +       else
> +               return NULL;
> +}
> +
> +static struct img_frameparam *dip_create_framejob(int sequence)
> +{
> +       struct mtk_dip_hw_frame_job *fjob;
> +
> +       fjob = kzalloc(sizeof(*fjob), GFP_ATOMIC);
> +
> +       if (!fjob)
> +               return NULL;
> +
> +       fjob->sequence = sequence;
> +
> +       return &fjob->fparam;
> +}
> +
> +static void dip_free_framejob(struct img_frameparam *fparam)
> +{
> +       struct mtk_dip_hw_frame_job *fjob;
> +
> +       fjob = mtk_dip_fparam_to_job(fparam);
> +
> +       /* to avoid use after free issue */
> +       fjob->sequence = -1;
> +
> +       kfree(fjob);
> +}
> +
> +static void dip_enable_ccf_clock(struct mtk_dip_hw *dip_hw)
> +{
> +       struct mtk_dip_dev *dip_dev;
> +       int ret;
> +
> +       dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       ret = pm_runtime_get_sync(dip_hw->larb_dev);
> +       if (ret < 0)
> +               dev_err(&dip_dev->pdev->dev, "%cannot get smi larb clock\n");

Uhm, this is not a clock operation.

The driver must get a runtime PM reference whenever the hardware power
domain needs to stay powered on. In other words, as long as the hardware
needs to preserve some state (in the registers, SRAM, etc.), the runtime PM
status must be active.

> +
> +       ret = clk_prepare_enable(dip_hw->dip_clk.img_larb5);
> +       if (ret)
> +               dev_err(&dip_dev->pdev->dev,
> +                       "cannot prepare and enable img_larb5 clock\n");
> +
> +       ret = clk_prepare_enable(dip_hw->dip_clk.img_dip);
> +       if (ret)
> +               dev_err(&dip_dev->pdev->dev,
> +                       "cannot prepare and enable img_dip clock\n");
> +}

There should be no need to have this function. Instead, you could use the
clk_bulk_prepare_enable() API.

> +
> +static void dip_disable_ccf_clock(struct mtk_dip_hw *dip_hw)
> +{
> +       clk_disable_unprepare(dip_hw->dip_clk.img_dip);
> +       clk_disable_unprepare(dip_hw->dip_clk.img_larb5);
> +       pm_runtime_put_sync(dip_hw->larb_dev);
> +}

See above.

> +
> +static int dip_send(struct platform_device *pdev, enum scp_ipi_id id,
> +                   void *buf, unsigned int  len, unsigned int wait)
> +{
> +       return scp_ipi_send(pdev, id, buf, len, wait);
> +}
> +
> +static struct mtk_dip_pipe *get_mtk_dip_pipe(struct mtk_dip_dev *dip_dev,
> +                                            unsigned int pipe_id)
> +{
> +       if (pipe_id < 0 && pipe_id >= MTK_DIP_PIPE_ID_TOTAL_NUM)
> +               return NULL;
> +       return &dip_dev->dip_pipe[pipe_id];
> +}
> +
> +static void call_mtk_dip_pipe_finish(struct mtk_dip_hw *dip_hw,
> +                                    struct img_ipi_frameparam *iparam)
> +{
> +       struct mtk_dip_dev *dip_dev;
> +       struct mtk_dip_pipe *dip_pipe;
> +       enum vb2_buffer_state vbf_state;
> +       int pipe_id;
> +       int ret;
> +
> +       if (!dip_hw) {
> +               pr_err("%s: can't update buffer status, dip_hw is NULL\n",
> +                      __func__);
> +               return;
> +       }
> +
> +       dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +
> +       if (!iparam) {
> +               dev_dbg(&dip_dev->pdev->dev, "%s: iparam can't be NULL\n",
> +                       __func__);
> +               return;
> +       }

None of the 2 error conditions above should be possible happen.

> +
> +       pipe_id = mtk_dip_pipe_get_pipe_from_job_id(iparam->index);
> +       dip_pipe = get_mtk_dip_pipe(dip_dev, pipe_id);
> +
> +       if (!dip_pipe) {
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: unknown pipe id(%d)\n", __func__, pipe_id);

Since this is a sign of some serious problem, I'd make it dev_err().

> +               return;
> +       }
> +
> +       if (iparam->state == FRAME_STATE_ERROR)
> +               vbf_state = VB2_BUF_STATE_ERROR;
> +       else
> +               vbf_state = VB2_BUF_STATE_DONE;
> +
> +       dev_dbg(&dip_dev->pdev->dev,
> +               "%s: ready to return buffers,pipe(%d),pipe_job_id(%d)\n",
> +               __func__, pipe_id, iparam->index);
> +
> +       ret = mtk_dip_pipe_job_finish(dip_pipe, iparam->index, vbf_state);
> +

Unnecessary blank line.

> +       if (ret)
> +               dev_dbg(&dip_dev->pdev->dev, "%s: finish CB failed(%d)\n",
> +                       __func__, ret);

I don't see why it would ever fail. It should be just made a void function.

> +}
> +
> +static void mtk_dip_notify(void *data)

Why void?

> +{
> +       struct mtk_dip_hw *dip_hw;
> +       struct mtk_dip_dev *dip_dev;
> +       struct img_frameparam *framejob;
> +       struct mtk_dip_hw_user_id *user_id;
> +       struct mtk_dip_hw_subframe *buf, *tmpbuf;
> +       struct img_ipi_frameparam *frameparam;
> +       u32 num;
> +       bool found = false;
> +
> +       frameparam = (struct img_ipi_frameparam *)data;
> +       dip_hw = (struct mtk_dip_hw *)frameparam->drv_data;
> +       dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       framejob = container_of(frameparam,
> +                               struct img_frameparam,
> +                               frameparam);
> +
> +       if (frameparam->state == FRAME_STATE_HW_TIMEOUT) {M
> +               dip_send(dip_hw->vpu_pdev, SCP_IPI_DIP_FRAME,
> +                        (void *)frameparam, sizeof(*frameparam), 0);
> +               dev_err(&dip_dev->pdev->dev, "%s: frame no(%d) HW timeout\n",
> +                       __func__, frameparam->frame_no);
> +       }
> +
> +       mutex_lock(&dip_hw->dip_usedbufferlist.queuelock);
> +       list_for_each_entry_safe(buf, tmpbuf,
> +                                &dip_hw->dip_usedbufferlist.queue,
> +                                list_entry) {
> +               if (buf->buffer.pa == frameparam->subfrm_data.pa) {
> +                       list_del(&buf->list_entry);
> +                       dip_hw->dip_usedbufferlist.queue_cnt--;
> +                       found = true;
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s: Found used buffer(%x)\n",
> +                               __func__, buf->buffer.pa);
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&dip_hw->dip_usedbufferlist.queuelock);
> +
> +       if (!found) {
> +               dev_err(&dip_dev->pdev->dev,
> +                       "%s: frame_no(%d), buf(%x), used buf cnt(%d)\n",
> +                       __func__, frameparam->frame_no,
> +                       frameparam->subfrm_data.pa,
> +                       dip_hw->dip_usedbufferlist.queue_cnt);
> +
> +               frameparam->state = FRAME_STATE_ERROR;
> +
> +       } else {
> +               mutex_lock(&dip_hw->dip_freebufferlist.queuelock);
> +               list_add_tail(&buf->list_entry,
> +                             &dip_hw->dip_freebufferlist.queue);
> +               dip_hw->dip_freebufferlist.queue_cnt++;
> +               mutex_unlock(&dip_hw->dip_freebufferlist.queuelock);
> +
> +               frameparam->state = FRAME_STATE_DONE;
> +       }
> +
> +       call_mtk_dip_pipe_finish(dip_hw, frameparam);
> +
> +       found = false;
> +       mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +       list_for_each_entry(user_id,
> +                           &dip_hw->dip_useridlist.queue,
> +                           list_entry) {
> +               if (mtk_dip_pipe_get_pipe_from_job_id(frameparam->index)
> +                       == user_id->id) {
> +                       user_id->num--;
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s: user_id(%x) found, cnt(%d)\n",
> +                               __func__, user_id->id, user_id->num);
> +                       found = true;
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +       wake_up(&dip_hw->flushing_wq);
> +       dev_dbg(&dip_dev->pdev->dev,
> +               "%s: frame_no(%d) is finished\n",
> +               __func__, framejob->frameparam.frame_no);
> +       dip_free_framejob(framejob);
> +
> +       num = atomic_dec_return(&dip_hw->num_running);
> +       dev_dbg(&dip_dev->pdev->dev, "%s: running cnt(%d)\n", __func__, num);
> +}
> +
> +static void mdp_cb_worker(struct work_struct *work)
> +{
> +       struct mtk_dip_hw_mdpcb_work *mdpcb_work;
> +
> +       mdpcb_work = container_of(work, struct mtk_dip_hw_mdpcb_work,
> +                                 frame_work);
> +       mtk_dip_notify(mdpcb_work->frameparams);
> +       kfree(mdpcb_work);
> +}
> +
> +static struct img_ipi_frameparam *convert_to_fparam(struct cmdq_cb_data *data)
> +{
> +       struct mtk_dip_hw *dip_hw;
> +       struct mtk_dip_dev *dip_dev;
> +       struct mtk_dip_hw_frame_job *fjob;
> +       struct img_ipi_frameparam *ipi_fparam;
> +
> +       if (!data) {
> +               pr_err("%s: cmdq_cb_data can't be NULL\n",
> +                      __func__);
> +               return NULL;
> +       }

This is impossible to happen with the way this function is called.

> +
> +       if (data->sta != CMDQ_CB_NORMAL)
> +               pr_debug("%s: got CMDQ CB(%d) without CMDQ_CB_NORMAL\n",
> +                        __func__, data->sta);

Is this a condition that could happen normally on a system working
correctly?

> +
> +       if (!data->data) {
> +               pr_err("%s: got NULL in cmdq_cb_data\n",
> +                      __func__);

Use dev_err() and also make the error message more descriptive, e.g.
"%s: data->data is NULL"

> +               return NULL;
> +       }
> +
> +       fjob = mtk_dip_ipi_fparam_to_job(data->data);

Hmm, if we want struct mtk_dip_hw_frame_job here, why don't we just pass it
to the cmdq driver with the callback?

> +
> +       if (fjob->sequence == -1) {
> +               pr_err("%s: Invalid cmdq_cb_data(%p)\n",
> +                      __func__, data);
> +               ipi_fparam = NULL;

As far as I can see, we always get the data we explicitly gave to the cmdq
driver together with the callback function, so it sounds like we shouldn't
be able to get invalid data here.

> +       } else {
> +               ipi_fparam = &fjob->fparam.frameparam;
> +               dip_hw = (struct mtk_dip_hw *)ipi_fparam->drv_data;

Hmm, isn't ipi_fparam a firmware ABI struct? It shouldn't contain kernel
pointers.

> +               dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       }
> +
> +       dev_dbg(&dip_dev->pdev->dev, "%s: framejob(%p), seq(%d)\n",
> +               __func__, fjob, fjob->sequence);
> +       dev_dbg(&dip_dev->pdev->dev, "%s: idx(%d), no(%d), s(%d), n_in(%d), n_out(%d), drv(%p)\n",
> +               __func__,
> +               fjob->fparam.frameparam.index,
> +               fjob->fparam.frameparam.frame_no,
> +               fjob->fparam.frameparam.state,
> +               fjob->fparam.frameparam.num_inputs,
> +               fjob->fparam.frameparam.num_outputs,
> +               fjob->fparam.frameparam.drv_data
> +       );

This would crash if the fjob->dequence == -1 case of the if/else above hit.

> +
> +       return ipi_fparam;
> +}
> +
> +/* Maybe in IRQ context of cmdq */
> +static void dip_mdp_cb_func(struct cmdq_cb_data data)
> +{
> +       struct img_ipi_frameparam *frameparam;
> +       struct mtk_dip_hw *dip_hw;
> +       struct mtk_dip_dev *dip_dev;
> +       struct mtk_dip_hw_mdpcb_work *mdpcb_work;
> +
> +       frameparam = convert_to_fparam(&data);
> +
> +       if (!frameparam) {
> +               pr_err("%s: return due to NULL cmdq_cb_data)",
> +                      __func__, &data);
> +               return;
> +       }
> +
> +       dip_hw = (struct mtk_dip_hw *)frameparam->drv_data;
> +       dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +
> +       mdpcb_work = kzalloc(sizeof(*mdpcb_work), GFP_ATOMIC);

We shouldn't need to allocate anything here. Normally one would just look up
some internal driver structure matching the completed job and the work
would be embedded there.

> +
> +       if (WARN_ONCE(!mdpcb_work, "%s: frame_no(%d) is lost",
> +                     __func__, frameparam->frame_no))
> +               return;
> +
> +       INIT_WORK(&mdpcb_work->frame_work, mdp_cb_worker);
> +       mdpcb_work->frameparams = frameparam;
> +       if (data.sta != CMDQ_CB_NORMAL)
> +               mdpcb_work->frameparams->state = FRAME_STATE_HW_TIMEOUT;
> +
> +       queue_work(dip_hw->mdpcb_workqueue, &mdpcb_work->frame_work);

Looking at mdp_cb_worker() and mtk_dip_notify() called by it, after fixing
the locking to use spinlocks rather than mutexes and remove some dynamic
allocations pointed out in other comments, we could just run them in atomic
context, without the need for this workqueue.

> +}
> +
> +static void dip_vpu_handler(void *data, unsigned int len, void *priv)
> +{
> +       struct img_frameparam *framejob;
> +       struct img_ipi_frameparam *frameparam;
> +       struct mtk_dip_hw *dip_hw;
> +       struct mtk_dip_dev *dip_dev;
> +       unsigned long flags;
> +       u32 num;
> +
> +       if (WARN_ONCE(!data, "%s: failed due to NULL data\n", __func__))
> +               return;
> +
> +       frameparam = (struct img_ipi_frameparam *)data;
> +       framejob = dip_create_framejob(frameparam->index);

Rather than creating this dynamically, it should be already created. The
reason you have the priv argument to this function is that you can have the
SCP driver give to you a pointer to some struct that you gave to it when
calling scp_ipi_register(). That struct should have a list of valid VPU jobs
and here you should iterate through that list and find a matching job or
fail if there is no matching one. (We need to validate here, because we
can't trust the values coming from the firmware.)

> +
> +       if (WARN_ONCE(!framejob, "%s: frame_no(%d) is lost\n",
> +                     __func__, frameparam->frame_no))
> +               return;
> +
> +       dip_hw = (struct mtk_dip_hw *)frameparam->drv_data;
> +       dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +
> +       wake_up(&dip_hw->composing_wq);
> +       memcpy(&framejob->frameparam, data, sizeof(framejob->frameparam));
> +       num = atomic_dec_return(&dip_hw->num_composing);

The order here is wrong. If you wake up before decrementing, you may end up
making the woken up thread wait again, because the value is still not
decremented.

> +
> +       spin_lock_irqsave(&dip_hw->dip_gcejoblist.queuelock, flags);
> +       list_add_tail(&framejob->list_entry, &dip_hw->dip_gcejoblist.queue);
> +       dip_hw->dip_gcejoblist.queue_cnt++;
> +       spin_unlock_irqrestore(&dip_hw->dip_gcejoblist.queuelock, flags);
> +
> +       dev_dbg(&dip_dev->pdev->dev,
> +               "%s: frame_no(%d) is back, composing num(%d)\n",
> +               __func__, frameparam->frame_no, num);
> +
> +       wake_up(&dip_hw->dip_runner_thread.wq);
> +}
> +
> +static int dip_runner_func(void *data)
> +{
> +       struct img_frameparam *framejob;
> +       struct mtk_dip_hw *dip_hw;
> +       struct mtk_dip_dev *dip_dev;
> +       struct mtk_dip_hw_user_id *user_id;
> +       unsigned long flags;
> +       bool found;
> +       u32 queuecnt, num;
> +       int ret;
> +
> +       dip_hw = (struct mtk_dip_hw *)data;
> +       dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +
> +       while (1) {
> +               spin_lock_irqsave(&dip_hw->dip_gcejoblist.queuelock, flags);
> +               queuecnt = dip_hw->dip_gcejoblist.queue_cnt;
> +               spin_unlock_irqrestore(&dip_hw->dip_gcejoblist.queuelock,
> +                                      flags);
> +
> +               ret = wait_event_interruptible_timeout
> +                       (dip_hw->dip_runner_thread.wq,
> +                        queuecnt || kthread_should_stop(),
> +                        msecs_to_jiffies(DIP_COMPOSER_THREAD_TIMEOUT));

Checking queuecnt here is also wrong. Please check my comment to another
wait_event_* in this patch.

Also the interruptibility and timeout don't make sense here, because we just
want to keep waiting unless something shows up or the kthread is forcefully
woken up for stopping.

However, we probably want it to be freezable(), so that we don't have to
bring the thread down and up on suspend/resume.

> +
> +               if (kthread_should_stop())
> +                       break;
> +
> +               if (ret == 0) {
> +                       /* Timeout */
> +                       ret = -ETIME;
> +               } else if (ret == -ERESTARTSYS) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: interrupted by a signal\n", __func__);
> +               }

All this will not be needed after fixing the comment above.

> +
> +               if (queuecnt > 0) {

You can invert this condition and use continue to just go back to waiting
again and reduce the code complexity.

Still, it shouldn't be possible to end up without a job in the queue anymore after
fixing the waiting, as per the other comments above.

> +                       spin_lock_irqsave(&dip_hw->dip_gcejoblist.queuelock,
> +                                         flags);
> +                       framejob = list_first_entry
> +                               (&dip_hw->dip_gcejoblist.queue,
> +                                struct img_frameparam, list_entry);
> +
> +                       dip_hw->dip_gcejoblist.queue_cnt--;
> +                       list_del(&framejob->list_entry);
> +                       spin_unlock_irqrestore
> +                               (&dip_hw->dip_gcejoblist.queuelock, flags);
> +
> +                       found = false;
> +                       mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +                       list_for_each_entry(user_id,
> +                                           &dip_hw->dip_useridlist.queue,
> +                                           list_entry) {
> +                               int id = framejob->frameparam.index;
> +
> +                               if (mtk_dip_pipe_get_pipe_from_job_id(id) ==
> +                                       user_id->id) {
> +                                       found = true;
> +                                       break;
> +                               }
> +                       }
> +                       mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +
> +                       if (!found) {
> +                               dev_err(&dip_dev->pdev->dev,
> +                                       "%s: frame_no(%d), idx(0x%x) is abnormal\n",
> +                                       __func__,
> +                                       framejob->frameparam.frame_no,
> +                                       framejob->frameparam.index);
> +                               /*
> +                                * Due to error index, DIP driver could NOT
> +                                * notify the V4L2 common driver to
> +                                * return buffer
> +                                */
> +                               dip_free_framejob(framejob);
> +                               continue;
> +                       }
> +
> +                       mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +                       if (user_id->state == DIP_STATE_STREAMOFF) {

I'd handle this in the streamoff function to avoid polluting the main path
with handling of special stop conditions. As suggested in the other similar
place, we should just remove the jobs from the list there, so in this thread
we wouldn't end up with any jobs from any "users" being stopped.

> +                               user_id->num--;
> +                               mutex_unlock
> +                                       (&dip_hw->dip_useridlist.queuelock);
> +                               framejob->frameparam.state =
> +                                       FRAME_STATE_STREAMOFF;
> +                               call_mtk_dip_pipe_finish(dip_hw,
> +                                                        &framejob->frameparam);
> +
> +                               dev_dbg(&dip_dev->pdev->dev,
> +                                       "%s: user_id(%x) streamoff, current num(%d); frame_no(%d) flushed\n",
> +                                       __func__, user_id->id, user_id->num,
> +                                       framejob->frameparam.frame_no);
> +
> +                               dip_free_framejob(framejob);
> +                               continue;
> +                       }
> +                       mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s: MDP run frame_no(%d) and the rest joblist cnt(%d)\n",
> +                               __func__, framejob->frameparam.frame_no,
> +                               dip_hw->dip_gcejoblist.queue_cnt);
> +
> +                       /*
> +                        * Call MDP/GCE API to do HW excecution
> +                        * Pass the framejob to MDP driver
> +                        */
> +                       framejob->frameparam.state = FRAME_STATE_COMPOSING;
> +
> +                       mdp_cmdq_sendtask
> +                               (dip_hw->mdp_pdev,
> +                                (struct img_config *)
> +                                       framejob->frameparam.config_data.va,
> +                                &framejob->frameparam, NULL, false,
> +                                dip_mdp_cb_func,
> +                                (void *)&framejob->frameparam);

These pointer casts shouldn't be needed.

> +
> +                       num = atomic_inc_return(&dip_hw->num_running);
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s,MDP running num(%d)\n", __func__, num);
> +               }
> +
> +       };
> +
> +       return 0;
> +}
> +
> +static void dip_submit_worker(struct work_struct *work)
> +{
> +       struct mtk_dip_hw_submit_work *dip_submit_work =
> +               container_of(work, struct mtk_dip_hw_submit_work, frame_work);
> +       struct mtk_dip_hw *dip_hw = dip_submit_work->dip_hw;
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       struct mtk_dip_hw_work *dip_work;
> +       struct mtk_dip_hw_subframe *buf;
> +       u32 len, num;
> +       int ret;
> +
> +       num  = atomic_read(&dip_hw->num_composing);
> +
> +       mutex_lock(&dip_hw->dip_worklist.queuelock);
> +       dip_work = list_first_entry(&dip_hw->dip_worklist.queue,
> +                                   struct mtk_dip_hw_work, list_entry);
> +       list_del(&dip_work->list_entry);
> +       dip_hw->dip_worklist.queue_cnt--;
> +       len = dip_hw->dip_worklist.queue_cnt;
> +       mutex_unlock(&dip_hw->dip_worklist.queuelock);
> +
> +       mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +       if (dip_work->user_id->state == DIP_STATE_STREAMOFF) {

This shouldn't be possible. If we're stopping the streaming, we should remove any
dip_work of that user from the list, so we shouldn't be able to end up here.

> +               dip_work->user_id->num--;
> +               mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +
> +               dip_work->frameparams.state = FRAME_STATE_STREAMOFF;
> +               call_mtk_dip_pipe_finish(dip_hw, &dip_work->frameparams);
> +
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: user_id(%x) is streamoff,num(%d),frame_no(%d),idx:0x%x\n",
> +                        __func__, dip_work->user_id->id,
> +                        dip_work->user_id->num,
> +                        dip_work->frameparams.frame_no,
> +                        dip_work->frameparams.index);
> +
> +               goto free_work_list;
> +       }
> +       mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +
> +       while (num >= DIP_COMPOSING_MAX_NUM) {
> +               ret = wait_event_interruptible_timeout
> +                       (dip_hw->composing_wq,
> +                        (num < DIP_COMPOSING_MAX_NUM),

Waiting on a local variable?

Perhaps instead of a custom wait, we could use a semaphore initialized to
DIP_COMPOSING_MAX_NUM?

> +                        msecs_to_jiffies(DIP_COMPOSING_WQ_TIMEOUT));
> +
> +               if (ret == -ERESTARTSYS)
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: interrupted by a signal\n", __func__);

The interruptible variant doesn't make sense here. There is no reason why a
workqueue could be interrupted.

> +               else if (ret == 0)
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s: timeout frame_no(%d),num(%d)\n",
> +                               __func__, dip_work->frameparams.frame_no,
> +                               num);
> +               else
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s: wakeup frame_no(%d),num(%d)\n",
> +                               __func__, dip_work->frameparams.frame_no, num);
> +
> +               num = atomic_read(&dip_hw->num_composing);
> +       };
> +
> +       mutex_lock(&dip_hw->dip_freebufferlist.queuelock);
> +       if (list_empty(&dip_hw->dip_freebufferlist.queue)) {
> +               mutex_unlock(&dip_hw->dip_freebufferlist.queuelock);
> +
> +               dev_err(&dip_dev->pdev->dev,
> +                       "%s: frame_no(%d), idx(0x%x), no free buffer(%d)\n",
> +                       __func__, dip_work->frameparams.frame_no,
> +                       dip_work->frameparams.index,
> +                       dip_hw->dip_freebufferlist.queue_cnt);
> +
> +               /*
> +                * Call callback to notify V4L2 common framework
> +                * for failure of enqueue
> +                */
> +               dip_work->frameparams.state = FRAME_STATE_ERROR;
> +               call_mtk_dip_pipe_finish(dip_hw, &dip_work->frameparams);

This is incorrect. Any request that went through req_validate must not fail
for reasons other than an unexpected firmware/hardware failure. The driver
must be able to handle arbitrary number of requests. (In practice, the limit
of requests is limited by the number of VB2 buffers.)

> +
> +               mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +               dip_work->user_id->num--;
> +               mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +
> +               goto free_work_list;
> +       }
> +
> +       buf = list_first_entry(&dip_hw->dip_freebufferlist.queue,
> +                              struct mtk_dip_hw_subframe,
> +                              list_entry);
> +       list_del(&buf->list_entry);
> +       dip_hw->dip_freebufferlist.queue_cnt--;
> +       mutex_unlock(&dip_hw->dip_freebufferlist.queuelock);
> +
> +       mutex_lock(&dip_hw->dip_usedbufferlist.queuelock);
> +       list_add_tail(&buf->list_entry, &dip_hw->dip_usedbufferlist.queue);
> +       dip_hw->dip_usedbufferlist.queue_cnt++;
> +       mutex_unlock(&dip_hw->dip_usedbufferlist.queuelock);
> +
> +       memcpy(&dip_work->frameparams.subfrm_data,
> +              &buf->buffer, sizeof(buf->buffer));

These are typed struct members, so you can just assign them:

dip_work->frameparams.subfrm_data = buf->buffer;

> +       memset((char *)buf->buffer.va, 0, DIP_SUB_FRM_SZ);

No cast should be needed here.

> +       memcpy(&dip_work->frameparams.config_data,
> +              &buf->config_data, sizeof(buf->config_data));

Ditto.

> +       memset((char *)buf->config_data.va, 0, DIP_COMP_SZ);

Ditto.

> +
> +       if (dip_work->frameparams.tuning_data.pa == 0) {
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: frame_no(%d) has no tuning_data\n",
> +                       __func__, dip_work->frameparams.frame_no);
> +
> +               memcpy(&dip_work->frameparams.tuning_data,
> +                      &buf->tuning_buf, sizeof(buf->tuning_buf));

Ditto.

> +               memset((char *)buf->tuning_buf.va, 0, DIP_TUNING_SZ);

Ditto.

> +               /*
> +                * When user enqueued without tuning buffer,
> +                * it would use driver internal buffer.
> +                * So, tuning_data.va should be 0
> +                */
> +               dip_work->frameparams.tuning_data.va = 0;

I don't understand this. We just zeroed the buffer via this kernel VA few
lines above, so why would it have to be set to 0?

> +       }
> +
> +       dip_work->frameparams.drv_data = (u64)dip_hw;

Passing kernel pointers to firmware?

> +       dip_work->frameparams.state = FRAME_STATE_COMPOSING;
> +
> +       memcpy((void *)buf->frameparam.va, &dip_work->frameparams,
> +              sizeof(dip_work->frameparams));

There shouldn't be a need to type cast the pointer.

> +
> +       dip_send(dip_hw->vpu_pdev, SCP_IPI_DIP_FRAME,
> +                (void *)&dip_work->frameparams,

Ditto.

> +                sizeof(dip_work->frameparams), 0);
> +       num = atomic_inc_return(&dip_hw->num_composing);

Why the assignment? Perhaps you just want atomic_inc()?

> +
> +free_work_list:
> +
> +       dev_dbg(&dip_dev->pdev->dev,
> +               "%s, free: frame_no(%d),idx(0x%x),worklist cnt(%d),composing num(%d)\n",
> +               __func__, dip_work->frameparams.frame_no,
> +               dip_work->frameparams.index, len, num);
> +
> +       kfree(dip_work);

We haven't allocated this object and so we shouldn't free it here. The layer
that allocated it should receive it back and free. (But we probably don't
need to allocate it dynamically as per my other comments.)

Also a general note - a work can be queued only once. This means that
current code races when two dip_works are attempted to be queued very
quickly one after another (or even at the same time from different threads).

I can think of two potential options for fixing this:

1) Loop in the work function until there is nothing to queue to the hardware
   anymore - but this needs tricky synchronization, because there is still
   short time at the end of the work function when a new dip_work could be
   added.

2) Change this to a kthread that just keeps running in a loop waiting for
   some available dip_work to show up and then sending it to the firmware.
   This should be simpler, as the kthread shouldn't have a chance to miss
   any dip_work queued.

I'm personally in favor of option 2, as it should simplify the
synchronization.

> +}
> +
> +static void mtk_dip_hw_set_clk(struct mtk_dip_hw *dip_hw, bool enable)
> +{
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +
> +       if (enable) {
> +               dev_dbg(&dip_dev->pdev->dev, "CCF:prepare_enable clk\n");
> +               dip_enable_ccf_clock(dip_hw);
> +       } else {
> +               dev_dbg(&dip_dev->pdev->dev, "CCF:disable_unprepare clk\n");
> +               dip_disable_ccf_clock(dip_hw);
> +       }
> +}

There is no value in having this function. Just call the enable/disable
functions directly.

> +
> +static int mtk_dip_hw_res_init(struct mtk_dip_hw *dip_hw)
> +{
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       u32 i;
> +       dma_addr_t scp_daddr;
> +       u64 scp_mem_va;
> +       int ret = 0;
> +
> +       dip_hw->mdp_pdev = mdp_get_plat_device(dip_dev->pdev);
> +
> +       if (!dip_hw->mdp_pdev) {
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: failed to get MDP device\n",
> +                       __func__);
> +               return -EINVAL;
> +       }
> +
> +       init_waitqueue_head(&dip_hw->dip_runner_thread.wq);
> +
> +       /*  All lists in DIP initialization */
> +       INIT_LIST_HEAD(&dip_hw->dip_gcejoblist.queue);
> +       spin_lock_init(&dip_hw->dip_gcejoblist.queuelock);
> +       dip_hw->dip_gcejoblist.queue_cnt = 0;
> +
> +       INIT_LIST_HEAD(&dip_hw->dip_freebufferlist.queue);
> +       mutex_init(&dip_hw->dip_freebufferlist.queuelock);
> +       dip_hw->dip_freebufferlist.queue_cnt = 0;
> +
> +       INIT_LIST_HEAD(&dip_hw->dip_usedbufferlist.queue);
> +       mutex_init(&dip_hw->dip_usedbufferlist.queuelock);
> +       dip_hw->dip_usedbufferlist.queue_cnt = 0;
> +
> +       dip_hw->mdpcb_workqueue =
> +               create_singlethread_workqueue("mdp_callback");
> +       if (!dip_hw->mdpcb_workqueue) {
> +               dev_err(&dip_dev->pdev->dev,
> +                       "%s: unable to alloc mdpcb workqueue\n", __func__);
> +               ret = -ENOMEM;
> +               goto err_alloc_mdpcb_wq;
> +       }

The related work seems to do a very simple task, so is there really a reason
to have a separate workqueue for it?

> +
> +       dip_hw->composer_wq =
> +               create_singlethread_workqueue("dip_composer");
> +       if (!dip_hw->composer_wq) {
> +               dev_err(&dip_dev->pdev->dev,
> +                       "%s: unable to alloc composer workqueue\n", __func__);
> +               ret = -ENOMEM;
> +               goto err_alloc_composer_wq;
> +       }
> +       init_waitqueue_head(&dip_hw->composing_wq);
> +       init_waitqueue_head(&dip_hw->flushing_wq);
> +
> +       dip_hw->submit_work.dip_hw = dip_hw;
> +       INIT_WORK(&dip_hw->submit_work.frame_work, dip_submit_worker);
> +
> +       INIT_LIST_HEAD(&dip_hw->dip_worklist.queue);
> +       mutex_init(&dip_hw->dip_worklist.queuelock);
> +       dip_hw->dip_worklist.queue_cnt = 0;
> +
> +       INIT_LIST_HEAD(&dip_hw->dip_useridlist.queue);
> +       mutex_init(&dip_hw->dip_useridlist.queuelock);
> +       dip_hw->dip_useridlist.queue_cnt = 0;
> +
> +       dip_hw->dip_runner_thread.thread =
> +               kthread_run(dip_runner_func, (void *)dip_hw, "dip_runner");
> +
> +       if (IS_ERR(dip_hw->dip_runner_thread.thread)) {
> +               dev_err(&dip_dev->pdev->dev, "%s: unable to alloc workqueue\n",
> +                       __func__);
> +               ret = PTR_ERR(dip_hw->dip_runner_thread.thread);
> +               dip_hw->dip_runner_thread.thread = NULL;
> +               goto err_create_thread;
> +       }
> +
> +       scp_mem_va = scp_get_reserve_mem_virt(SCP_DIP_MEM_ID);
> +       scp_daddr = scp_get_reserve_mem_phys(SCP_DIP_MEM_ID);
> +       dip_hw->scp_workingbuf_addr = scp_daddr + DIP_SCP_WORKINGBUF_OFFSET;
> +       dev_dbg(&dip_dev->pdev->dev,
> +               "%s: scp_mem_va(%p) ,pa(%p)\n", __func__, scp_mem_va,
> +               (u64)scp_daddr);
> +
> +       scp_ipi_register(dip_hw->vpu_pdev, SCP_IPI_DIP_FRAME,
> +                        dip_vpu_handler, NULL);
> +
> +       for (i = 0; i < DIP_SUB_FRM_DATA_NUM; i++) {
> +               u32 size_align;
> +               struct mtk_dip_hw_subframe *buf;
> +               struct sg_table *sgt;
> +               struct page **pages;
> +               u32 npages, j;
> +
> +               buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +               if (!buf) {
> +                       ret = -ENOMEM;
> +                       goto err_create_thread;
> +               }
> +
> +               /*
> +                * Total: 0 ~ 72 KB
> +                * SubFrame: 0 ~ 16 KB
> +                */
> +               buf->buffer.pa = scp_daddr + i * DIP_FRM_SZ;
> +               buf->buffer.va = scp_mem_va + i * DIP_FRM_SZ;
> +
> +               /* Tuning: 16 ~ 48 KB */
> +               buf->tuning_buf.pa = buf->buffer.pa + DIP_TUNING_OFFSET;
> +               buf->tuning_buf.va = buf->buffer.va + DIP_TUNING_OFFSET;
> +
> +               /* Config_data: 48 ~ 72 KB */
> +               buf->config_data.pa = buf->buffer.pa + DIP_COMP_OFFSET;
> +               buf->config_data.va = buf->buffer.va + DIP_COMP_OFFSET;
> +
> +               /* Frame parameters: 72 ~ 76 KB */
> +               buf->frameparam.pa = buf->buffer.pa + DIP_FRAMEPARAM_OFFSET;
> +               buf->frameparam.va = buf->buffer.va + DIP_FRAMEPARAM_OFFSET;
> +
> +               /* get iova */
> +               npages = (DIP_SUB_FRM_SZ + DIP_TUNING_SZ) >> PAGE_SHIFT;
> +               pages = kmalloc_array(npages,
> +                                     sizeof(struct page *),
> +                                     GFP_KERNEL);
> +               if (!pages) {
> +                       kfree(buf);
> +                       ret = -ENOMEM;
> +                       goto err_create_thread;
> +               }
> +
> +               sgt = &buf->table;
> +               for (j = 0; j < npages; j++)
> +                       pages[j] =
> +                               phys_to_page(buf->buffer.pa + j * PAGE_SIZE);
> +
> +               size_align = round_up(DIP_SUB_FRM_SZ + DIP_TUNING_SZ,
> +                                     PAGE_SIZE);
> +               ret = sg_alloc_table_from_pages(sgt, pages, npages,
> +                                               0, size_align, GFP_KERNEL);
> +               if (ret < 0) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: failed to get sgt from pages\n", __func__);
> +                       ret = -ENOMEM;
> +                       kfree(pages);
> +                       kfree(buf);
> +                       goto err_create_thread;
> +               }

We're operating on a physically contiguous memory here (i.e. on a contiguous
range of pages), so is there really a need to have an SG table for it?

> +
> +               dma_map_sg_attrs(&dip_dev->pdev->dev, sgt->sgl, sgt->nents,
> +                                DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);

I guess you just want to call dma_map_single_attrs() with the kernel VA here.

> +               buf->buffer.iova = sg_dma_address(buf->table.sgl);
> +               buf->tuning_buf.iova = buf->buffer.iova +
> +                       DIP_TUNING_OFFSET;
> +
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: buf(%d), pa(%p), iova(%p)\n",
> +                       __func__, i, buf->buffer.pa, buf->buffer.iova);
> +
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: config_data(%d), pa(%p), iova(%p)\n",
> +                       __func__, i, buf->config_data.pa, buf->config_data.va);
> +
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: tuning_buf(%d), pa(%p), iova(%p)\n",
> +                       __func__, i, buf->tuning_buf.pa, buf->tuning_buf.iova);
> +
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: frameparam(%d), pa(%p), iova(%p)\n",
> +                       __func__, i, buf->frameparam.pa, buf->frameparam.va);
> +
> +               list_add_tail(&buf->list_entry,
> +                             &dip_hw->dip_freebufferlist.queue);
> +               dip_hw->dip_freebufferlist.queue_cnt++;
> +               kfree(pages);
> +       }

But actually, why aren't these buffers managed by VB2?

> +
> +       return 0;
> +
> +err_create_thread:

Please name the labels after the first cleanup step to be performed after
the jump.

> +       mutex_destroy(&dip_hw->dip_useridlist.queuelock);
> +       mutex_destroy(&dip_hw->dip_worklist.queuelock);
> +       mutex_destroy(&dip_hw->dip_usedbufferlist.queuelock);
> +       mutex_destroy(&dip_hw->dip_freebufferlist.queuelock);
> +
> +err_alloc_composer_wq:
> +       destroy_workqueue(dip_hw->composer_wq);
> +
> +err_alloc_mdpcb_wq:
> +       destroy_workqueue(dip_hw->mdpcb_workqueue);
> +
> +       return ret;
> +}
> +
> +static int mtk_dip_hw_res_release(struct mtk_dip_hw *dip_hw)
> +{
> +       u32 i = 0;
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       struct mtk_dip_hw_subframe *buf, *tmpbuf;
> +       struct mtk_dip_hw_work *dip_work, *tmp_work;
> +       struct mtk_dip_hw_user_id  *dip_userid, *tmp_id;
> +
> +       dev_dbg(&dip_dev->pdev->dev, "%s: composer work queue(%d)\n",
> +               __func__, dip_hw->dip_worklist.queue_cnt);
> +
> +       mutex_lock(&dip_hw->dip_worklist.queuelock);
> +       list_for_each_entry_safe(dip_work, tmp_work,
> +                                &dip_hw->dip_worklist.queue,
> +                                list_entry) {
> +               list_del(&dip_work->list_entry);
> +               dev_dbg(&dip_dev->pdev->dev, "%s: dip work frame no(%d)\n",
> +                       __func__, dip_work->frameparams.frame_no);
> +               kfree(dip_work);
> +               dip_hw->dip_worklist.queue_cnt--;
> +       }
> +       mutex_unlock(&dip_hw->dip_worklist.queuelock);

There shouldn't be anything in the worklist anymore at this point. Each
"user" should be respnsible for cleaning after itself.

> +
> +       if (dip_hw->dip_worklist.queue_cnt != 0)
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: dip_worklist is not empty(%d)\n",
> +                       __func__, dip_hw->dip_worklist.queue_cnt);
> +
> +       mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +       list_for_each_entry_safe(dip_userid, tmp_id,
> +                                &dip_hw->dip_useridlist.queue,
> +                                list_entry) {
> +               list_del(&dip_userid->list_entry);
> +               dev_dbg(&dip_dev->pdev->dev, "%s: dip user id(0x%x)\n",
> +                       __func__, dip_userid->id);
> +               kfree(dip_userid);
> +               dip_hw->dip_useridlist.queue_cnt--;
> +       }
> +       mutex_unlock(&dip_hw->dip_useridlist.queuelock);a

Ditto.

> +
> +       if (dip_hw->dip_useridlist.queue_cnt != 0)
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: dip_useridlist is not empty(%d)\n",
> +                       __func__, dip_hw->dip_useridlist.queue_cnt);
> +
> +       flush_workqueue(dip_hw->mdpcb_workqueue);
> +       destroy_workqueue(dip_hw->mdpcb_workqueue);
> +       dip_hw->mdpcb_workqueue = NULL;
> +
> +       flush_workqueue(dip_hw->composer_wq);
> +       destroy_workqueue(dip_hw->composer_wq);
> +       dip_hw->composer_wq = NULL;
> +
> +       atomic_set(&dip_hw->num_composing, 0);
> +       atomic_set(&dip_hw->num_running, 0);
> +
> +       kthread_stop(dip_hw->dip_runner_thread.thread);
> +       dip_hw->dip_runner_thread.thread = NULL;
> +
> +       atomic_set(&dip_hw->dip_user_cnt, 0);
> +       atomic_set(&dip_hw->dip_stream_cnt, 0);
> +       atomic_set(&dip_hw->dip_enque_cnt, 0);
> +
> +       /* All the buffer should be in the freebufferlist when release */

This isn't a very good pattern. We use a constant number of buffers, so we
can just have an array in struct dip_hw that contains points to all the
allocated mtk_dip_hw_subframe structs.

> +       list_for_each_entry_safe(buf, tmpbuf,
> +                                &dip_hw->dip_freebufferlist.queue,
> +                                list_entry) {
> +               struct sg_table *sgt = &buf->table;
> +
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: buf(%d) pa(%p)\n", __func__, i,
> +                       buf->buffer.pa);
> +               dip_hw->dip_freebufferlist.queue_cnt--;
> +               dma_unmap_sg_attrs(&dip_dev->pdev->dev, sgt->sgl,
> +                                  sgt->orig_nents,
> +                                  DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);
> +               sg_free_table(sgt);
> +               list_del(&buf->list_entry);
> +               kfree(buf);
> +               buf = NULL;
> +               i++;
> +       }
> +
> +       if (dip_hw->dip_freebufferlist.queue_cnt != 0 &&
> +           i != DIP_SUB_FRM_DATA_NUM)
> +               dev_err(&dip_dev->pdev->dev,
> +                       "%s: dip_freebufferlist is not empty (%d/%d)\n",
> +                       __func__, dip_hw->dip_freebufferlist.queue_cnt, i);
> +
> +       mutex_destroy(&dip_hw->dip_useridlist.queuelock);
> +       mutex_destroy(&dip_hw->dip_worklist.queuelock);
> +       mutex_destroy(&dip_hw->dip_usedbufferlist.queuelock);
> +       mutex_destroy(&dip_hw->dip_freebufferlist.queuelock);
> +
> +       return 0;
> +}
> +
> +static int mtk_dip_hw_flush_by_id(struct mtk_dip_hw *dip_hw,
> +                                 u16 id,
> +                              struct mtk_dip_hw_user_id *user_id)
> +{
> +       struct mtk_dip_dev *dip_dev;
> +       u32 num, err_cnt;
> +       int ret;
> +
> +       dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       err_cnt = 0;
> +       do {
> +               mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +               num = user_id->num;
> +               mutex_unlock(&dip_hw->dip_useridlist.queuelock);

Spinlock would be a better candidate here.

> +
> +               ret = wait_event_interruptible_timeout
> +                       (dip_hw->flushing_wq,
> +                        (num == 0),

What is this condition expected to do? num is a local variable in this
function and nobody can change it asynchronously.

> +                        msecs_to_jiffies(DIP_FLUSHING_WQ_TIMEOUT));
> +

Do you perhaps mean something like:

static bool mtk_dip_hw_queue_empty(struct mtk_dip_hw *dip_hw,
				   struct mtk_dip_hw_user_id *user_id)
{
	int num;

	mutex_lock(&dip_hw->dip_useridlist.queuelock);
	num = user_id->num;
	mutex_unlock(&dip_hw->dip_useridlist.queuelock);

	return !num;
}

and then later in this function:

	ret = wait_event*(dip_hw->flushing_wq,
			  mtk_dip_hw_queue_empty(dip_hw, user_id), ...);

> +               if (ret == -ERESTARTSYS)
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: interrupted by a signal, num(%d)\n",
> +                               __func__, num);

There is no point in using the interruptible variant of wait_event if we
can't just abort on an interrupt.

Given that this is only called from streamoff, we can't abort, so we should
use wait_event_timeout().

> +               else if (ret == 0)
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s: timeout num(%d)\n", __func__, num);
> +               else
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s: wakeup  num(%d)\n", __func__, num);
> +
> +               err_cnt++;
> +
> +               if (num > 0 && err_cnt >= DIP_MAX_ERR_COUNT) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: flushing is aborted, num(%d), err_cnt(%d)\n",
> +                               __func__, num, err_cnt);
> +                       return -EINVAL;
> +               }
> +
> +       } while (num > 0);

With my comments above, it shouldn't be necessary to loop anymore.

> +
> +       dev_dbg(&dip_dev->pdev->dev, "Flushing is done num: %d\n", num);
> +       return 0;
> +}
> +
> +int mtk_dip_hw_connect(struct mtk_dip_hw *dip_hw)
> +{
> +       int ret;
> +       s32 usercount;
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       phandle rproc_phandle;
> +
> +       if (!dip_hw) {
> +               pr_err("%s: dip_hw can't be NULL\n", __func__);
> +               return -EINVAL;
> +       }

How is this possible?

> +
> +       usercount = atomic_inc_return(&dip_hw->dip_user_cnt);
> +
> +       if (usercount == 1) {

Is this really correctly synchronized? If we have 2 users calling this
functions at the same time, one would return early assuming that the
hardware is "connected" already, but the other one would be still
"connecting", which could actually fail.

> +               struct img_ipi_frameparam frameparam;
> +
> +               dip_hw->vpu_pdev = scp_get_pdev(dip_dev->pdev);
> +               if (!dip_hw->vpu_pdev) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: failed to get VPU device\n",
> +                               __func__);
> +                       return -EINVAL;
> +               }
> +
> +               if (of_property_read_u32(dip_dev->pdev->dev.of_node,
> +                                        "mediatek,scp",
> +                                        &rproc_phandle)) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: could not get scp device\n",
> +                               __func__);
> +                       return  -EINVAL;
> +               }
> +
> +               dip_hw->rproc_handle = rproc_get_by_phandle(rproc_phandle);
> +
> +               if (!dip_hw->rproc_handle) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: could not get DIP's rproc_handle\n",
> +                               __func__);
> +                       return  -EINVAL;
> +               }
> +
> +               /*
> +                * Return 0 if downloading firmware successfully,
> +                * otherwise it is failed.
> +                */
> +               if (rproc_boot(dip_hw->rproc_handle)) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: FW load failed(rproc:%p):%d\n",
> +                               __func__, dip_hw->rproc_handle, ret);
> +                       return -EINVAL;
> +               }
> +
> +               dev_dbg(&dip_dev->pdev->dev, "%s: FW loaded(rproc:%p)\n",
> +                       __func__, dip_hw->rproc_handle);
> +
> +               /* Enable clocks */
> +               mtk_dip_hw_set_clk(dip_hw, true);
> +               /* DIP HW INIT */
> +               memset(&frameparam, 0, sizeof(frameparam));
> +               /* SCP only support 32bits address */
> +               frameparam.drv_data = (u64)dip_hw;

Sending kernel pointers to remote processor?

> +               frameparam.state = FRAME_STATE_INIT;
> +               dip_send(dip_hw->vpu_pdev, SCP_IPI_DIP_INIT,
> +                        (void *)&frameparam, sizeof(frameparam), 0);

Is the call above synchronous? If not, don't we need to wait here for SCP to
initialize?

> +
> +               mtk_dip_hw_res_init(dip_hw);
> +       }
> +
> +       dev_dbg(&dip_dev->pdev->dev, "%s: dip_hw connected, usercount(%d)\n",
> +               __func__, usercount);
> +
> +       return 0;
> +}
> +
> +int mtk_dip_hw_disconnect(struct mtk_dip_hw *dip_hw)
> +{
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +
> +       if (atomic_dec_and_test(&dip_hw->dip_user_cnt)) {
> +               mtk_dip_hw_res_release(dip_hw);
> +               mtk_dip_hw_set_clk(dip_hw, false);

Clock should be gated dynamically by the driver when there is no more work
to be done and ungated when some new work is queued.

> +       }
> +
> +       dev_dbg(&dip_dev->pdev->dev,
> +               "%s: dip_hw disconnected, usercount(%d)\n",
> +               __func__, atomic_read(&dip_hw->dip_user_cnt));
> +
> +       return 0;

This function always returns 0, so it can be just void.

> +}
> +
> +int mtk_dip_hw_streamon(struct mtk_dip_hw  *dip_hw, u16 id)
> +{
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       struct mtk_dip_hw_user_id *user_id;
> +       s32 count, len;
> +
> +       count = atomic_inc_return(&dip_hw->dip_stream_cnt);
> +
> +       dev_dbg(&dip_dev->pdev->dev, "%s: id(0x%x)\n", __func__, id);
> +
> +       user_id = kzalloc(sizeof(*user_id), GFP_KERNEL);
> +
> +       if (!user_id)
> +               return -ENOMEM;

We shouldn't need to allocate anything here. This "user_id" has a 1:1
mapping with the subdevice, so we should just store any related data
directly in the structure with subdevice data.

> +
> +       user_id->id = id;
> +       user_id->state = DIP_STATE_STREAMON;
> +
> +       mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +       list_add_tail(&user_id->list_entry, &dip_hw->dip_useridlist.queue);

Is this really a queue? We just put pipes (subdevs) there in streamon order
and they stay there in the same order all the time. It just sounds like a
plain list, not a queue.

> +       dip_hw->dip_useridlist.queue_cnt++;
> +       len = dip_hw->dip_useridlist.queue_cnt;
> +       mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +
> +       dev_dbg(&dip_dev->pdev->dev,
> +               "%s: stream count(%d),id(0x%x),len(%d)\n", __func__,
> +               count, id, len);
> +
> +       return 0;
> +}
> +
> +int mtk_dip_hw_streamoff(struct mtk_dip_hw  *dip_hw, u16 id)
> +{
> +       struct mtk_dip_hw_user_id *user_id;
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       s32 count = -1;
> +       bool found = false;
> +       int ret;
> +
> +       dev_dbg(&dip_dev->pdev->dev, "%s: streamoff id(0x%x)\n",
> +               __func__, id);
> +
> +       mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +       list_for_each_entry(user_id,
> +                           &dip_hw->dip_useridlist.queue, list_entry) {
> +               if (user_id->id == id) {
> +                       user_id->state = DIP_STATE_STREAMOFF;
> +                       found = true;
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&dip_hw->dip_useridlist.queuelock);

Similar comment as below. We shouldn't need any look-up like this.

> +
> +       if (found) {
> +               ret = mtk_dip_hw_flush_by_id(dip_hw, id, user_id);
> +               if (ret != 0) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: stream id(0x%x), streamoff err(%d)\n",
> +                               __func__, id, ret);
> +                       WARN_ON(1);
> +               }
> +
> +               mutex_lock(&dip_hw->dip_useridlist.queuelock);

One normally uses spinlocks for list operations. (I've explained the rule of
a thumb in one of my other comments for this or other patch for this or
another MTK ISP driver, please check it for details.)

> +               list_del(&user_id->list_entry);
> +               dip_hw->dip_useridlist.queue_cnt--;

Is this counter actually useful? Isn't it redundant with
dip_hw->dip_stream_cnt?

> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: stream id(%x), user_id cnt(%d)\n",
> +                       __func__, id, dip_hw->dip_useridlist.queue_cnt);
> +               mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +
> +               kfree(user_id);
> +               user_id = NULL;

It's a local variable, nobody will reference it anymore after this function
returns, so no need to reset it to NULL.

> +               count = atomic_dec_return(&dip_hw->dip_stream_cnt);
> +
> +               dev_dbg(&dip_dev->pdev->dev, "%s: stream id(%d),cnt(%d)\n",
> +                       __func__, id, count);
> +       } else {
> +               dev_dbg(&dip_dev->pdev->dev,
> +                       "%s: stream id(%x) not found\n",
> +                       __func__, id);
> +       }
> +
> +       if (count < 0)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +int mtk_dip_hw_enqueue(struct mtk_dip_hw *dip_hw,
> +                      struct img_ipi_frameparam *frameparams)
> +{
> +       struct mtk_dip_hw_work  *framework = NULL;
> +       struct mtk_dip_hw_user_id *user_id = NULL;
> +       struct mtk_dip_dev *dip_dev = mtk_dip_hw_to_dev(dip_hw);
> +       bool    found = false;
> +       u32     tmpcount;
> +
> +       dev_dbg(&dip_dev->pdev->dev, "%s: frame idx(0x%x)",
> +               __func__, frameparams->index);
> +
> +       mutex_lock(&dip_hw->dip_useridlist.queuelock);
> +       list_for_each_entry(user_id, &dip_hw->dip_useridlist.queue,
> +                           list_entry) {
> +               if (mtk_dip_pipe_get_pipe_from_job_id(frameparams->index) ==
> +                       user_id->id) {
> +                       user_id->num++;
> +                       dev_dbg(&dip_dev->pdev->dev,
> +                               "%s: user_id(%x) found, current num(%d)\n",
> +                               __func__, user_id->id, user_id->num);
> +                       found = true;
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&dip_hw->dip_useridlist.queuelock);
> +
> +       if (!found) {
> +               dev_err(&dip_dev->pdev->dev,
> +                       "%s: user_id(0x%x) not found, idx(0x%x)\n",
> +                       __func__,
> +                       mtk_dip_pipe_get_pipe_from_job_id(frameparams->index),
> +                       frameparams->index);
> +               return -EINVAL;
> +       }

This smells like some unnecessary abstraction. The relation between
mtk_dip_pipe and mtk_dip_hw_user_id seems to be 1:1, so we should just merge
both structs and have this function take a pointer to the former. Then we
wouldn't need any iteration or error handling here.

We probably also should have this function fill in the hardware job id
in the img_ipi_frameparam struct rather than the caller.

By the way, I can't find where img_ipi_frameparam is defined. Is this a
struct used to communicate with the firmware?

> +
> +       framework = kzalloc(sizeof(*framework), GFP_KERNEL);
> +       if (!framework)
> +               return -ENOMEM;

We would not need to allocate anything here if we just have this structure
already existing as a member of the mtk_media_request struct I mentioned in
other comments.

> +
> +       memcpy(&framework->frameparams, frameparams, sizeof(*frameparams));

You can just assign it:

	framework->frameparams = *frameparams;

> +       framework->frameparams.state = FRAME_STATE_INIT;
> +       framework->frameparams.frame_no =
> +               atomic_inc_return(&dip_hw->dip_enque_cnt);

It sounds like the struct passed as the frameparams argument to this
function and framework->frameparams should be two different structs.

> +       framework->user_id = user_id;
> +
> +       mutex_lock(&dip_hw->dip_worklist.queuelock);
> +       list_add_tail(&framework->list_entry, &dip_hw->dip_worklist.queue);
> +       dip_hw->dip_worklist.queue_cnt++;
> +       tmpcount = dip_hw->dip_worklist.queue_cnt;
> +       mutex_unlock(&dip_hw->dip_worklist.queuelock);
> +       dev_dbg(&dip_dev->pdev->dev,
> +               "%s: frame_no(%d) into worklist, cnt(%d)\n",
> +               __func__, framework->frameparams.frame_no, tmpcount);
> +
> +       queue_work(dip_hw->composer_wq, &dip_hw->submit_work.frame_work);

What if the work was already running?

> +       return 0;
> +}

The split of functions between files seems at least strange to me. The
platform driver ops deal with initialization of all the media and V4L2
stuff, so I'd put them in them in the same file as all the V4L2/media ops.

> +
> +static int mtk_dip_probe(struct platform_device *pdev)
> +{
> +       struct mtk_dip_dev *dip_dev;
> +       struct mtk_dip_hw *dip_hw;
> +       struct device_node *node;
> +       struct platform_device *larb_pdev;
> +       int ret = 0;
> +
> +       dip_dev = devm_kzalloc(&pdev->dev, sizeof(*dip_dev), GFP_KERNEL);
> +       if (!dip_dev)
> +               return -ENOMEM;
> +
> +       dip_dev->pdev = pdev;
> +       dev_set_drvdata(&pdev->dev, dip_dev);
> +       dip_hw = &dip_dev->dip_hw;
> +
> +       node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
> +       if (!node) {
> +               dev_err(&pdev->dev, "No mediatek,larb found");
> +               return -EINVAL;
> +       }
> +       larb_pdev = of_find_device_by_node(node);
> +       if (!larb_pdev) {
> +               dev_err(&pdev->dev, "No mediatek,larb device found");
> +               return -EINVAL;
> +       }
> +       dip_hw->larb_dev = &larb_pdev->dev;

I thought we already solved the larb dependency by using device links,
so that drivers don't need to explicitly handle it?

See: https://lore.kernel.org/patchwork/cover/1028436/

> +
> +       /* Grab clock */
> +       dip_hw->dip_clk.img_larb5 = devm_clk_get(&pdev->dev,
> +                                                "DIP_CG_IMG_LARB5");
> +       dip_hw->dip_clk.img_dip = devm_clk_get(&pdev->dev,
> +                                              "DIP_CG_IMG_DIP");

Clock names should be lowercase. Also, I don't see any point in having
the "DIP_CG_IMG_" prefix in the clock name

> +       if (IS_ERR(dip_hw->dip_clk.img_larb5)) {
> +               dev_err(&pdev->dev, "Cannot get img_larb5 clock\n");
> +               return PTR_ERR(dip_hw->dip_clk.img_larb5);
> +       }
> +       if (IS_ERR(dip_hw->dip_clk.img_dip)) {
> +               dev_err(&pdev->dev, "Cannot get img_dip clock\n");
> +               return PTR_ERR(dip_hw->dip_clk.img_dip);
> +       }
> +
> +       pm_runtime_enable(&pdev->dev);
> +
> +       atomic_set(&dip_hw->dip_user_cnt, 0);
> +       atomic_set(&dip_hw->dip_stream_cnt, 0);
> +       atomic_set(&dip_hw->dip_enque_cnt, 0);
> +       atomic_set(&dip_hw->num_composing, 0);
> +       atomic_set(&dip_hw->num_running, 0);
> +       dip_hw->dip_worklist.queue_cnt = 0;
> +
> +       ret = mtk_dip_dev_v4l2_init(dip_dev);
> +
> +       if (ret)
> +               dev_err(&pdev->dev, "v4l2 init failed(%d)\n", ret);
> +
> +       dev_info(&pdev->dev, "DIP driver probe\n");

We can just remove this message.

> +
> +       return ret;
> +}
> +
> +static int mtk_dip_remove(struct platform_device *pdev)
> +{
> +       mtk_dip_dev_v4l2_release(dev_get_drvdata(&pdev->dev));
> +       pm_runtime_disable(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused mtk_dip_pm_suspend(struct device *dev)
> +{
> +       struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> +
> +       if (atomic_read(&dip_dev->dip_hw.dip_user_cnt) > 0) {
> +               mtk_dip_hw_set_clk(&dip_dev->dip_hw, false);
> +               dev_dbg(&dip_dev->pdev->dev, "%s: disable clock\n",
> +                       __func__);
> +       }

Don't we need to do something to prevent the driver from scheduling next
frames here and wait for the hardware to finish processing current frame
here?

> +
> +       return 0;
> +}
> +
> +static int __maybe_unused mtk_dip_pm_resume(struct device *dev)
> +{
> +       struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> +
> +       if (atomic_read(&dip_dev->dip_hw.dip_user_cnt) > 0) {
> +               mtk_dip_hw_set_clk(&dip_dev->dip_hw, true);
> +               dev_dbg(&dip_dev->pdev->dev, "%s: enable clock\n",
> +                       __func__);
> +       }

Don't we need to kick off the hardware here to continue processing from
the next frame?

> +
> +       return 0;
> +}
> +
> +static int __maybe_unused mtk_dip_suspend(struct device *dev)
> +{
> +       if (pm_runtime_suspended(dev))
> +               return 0;
> +
> +       return mtk_dip_pm_suspend(dev);
> +}
> +
> +static int __maybe_unused mtk_dip_resume(struct device *dev)
> +{
> +       if (pm_runtime_suspended(dev))
> +               return 0;
> +
> +       return mtk_dip_pm_resume(dev);
> +}
> +
> +static const struct dev_pm_ops mtk_dip_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(mtk_dip_suspend, mtk_dip_resume)
> +       SET_RUNTIME_PM_OPS(mtk_dip_suspend, mtk_dip_resume, NULL)
> +};
> +
> +static const struct of_device_id mtk_dip_of_match[] = {
> +       { .compatible = "mediatek,mt8183-dip", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_dip_of_match);
> +
> +static struct platform_driver mtk_dip_driver = {
> +       .probe          = mtk_dip_probe,
> +       .remove         = mtk_dip_remove,
> +       .driver = {
> +               .name   = DIP_DEV_NAME,

The value behind this macro is only used here once. Please just have the
string here directly.

> +               .pm     = &mtk_dip_pm_ops,
> +               .of_match_table = mtk_dip_of_match,

Please use the of_match_ptr() wrapper.

> +       }
> +};
> +
> +module_platform_driver(mtk_dip_driver);
> +
> +MODULE_DESCRIPTION("Mediatek Camera DIP V4L2 driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> new file mode 100644
> index 000000000000..fa1c0d029208
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> @@ -0,0 +1,1310 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-event.h>
> +#include "mtk_dip-dev.h"
> +#include "mtk_dip-hw.h"
> +#include "mtk-mdp3-regs.h"
> +
> +static int mtk_dip_subdev_open(struct v4l2_subdev *sd,
> +                              struct v4l2_subdev_fh *fh)
> +{
> +       struct mtk_dip_pipe *dip_pipe = mtk_dip_subdev_to_pipe(sd);
> +       struct mtk_dip_dev *dip_dev =
> +               dev_get_drvdata(&dip_pipe->dip_dev->pdev->dev);
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s: pipe(%d) connects to dip_hw\n",
> +               __func__, dip_pipe->desc->name,
> +               dip_pipe->desc->id);
> +
> +       dip_pipe->fh = fh;
> +
> +       mtk_dip_pipe_init_job_infos(dip_pipe);
> +
> +       return mtk_dip_hw_connect(&dip_dev->dip_hw);
> +}
> +
> +static int mtk_dip_subdev_close(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_fh *fh)
> +{
> +       struct mtk_dip_pipe *dip_pipe = mtk_dip_subdev_to_pipe(sd);
> +       struct mtk_dip_dev *dip_dev =
> +               dev_get_drvdata(&dip_pipe->dip_dev->pdev->dev);
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s: pipe(%d) disconnect to dip_hw\n",
> +               __func__, dip_pipe->desc->name,
> +               dip_pipe->desc->id);
> +
> +       return mtk_dip_hw_disconnect(&dip_dev->dip_hw);
> +}

We shouldn't do any hardware operations just at subdev open or close. Those
should happen once the streaming actually starts.

Userspace is expected to open device nodes just to query them and that
shouldn't have any side effects.

In general I don't see why we actually should even do anything in subdev ops
in this driver. The subdev is only exposed to bridge all the video nodes
together and any control is done via either video ioctls or metadata
buffers.

> +
> +static int mtk_dip_subdev_s_stream(struct v4l2_subdev *sd,
> +                                  int enable)
> +{
> +       struct mtk_dip_pipe *dip_pipe = mtk_dip_subdev_to_pipe(sd);
> +       int ret;
> +
> +       if (enable)
> +               ret = mtk_dip_pipe_streamon(dip_pipe);
> +       else
> +               ret = mtk_dip_pipe_streamoff(dip_pipe);
> +
> +       return ret;
> +}
> +
> +static int mtk_dip_subdev_subscribe_event(struct v4l2_subdev *subdev,
> +                                         struct v4l2_fh *fh,
> +                                         struct v4l2_event_subscription *sub)
> +{
> +       switch (sub->type) {
> +       case V4L2_EVENT_CTRL:
> +               return v4l2_ctrl_subscribe_event(fh, sub);
> +       default:
> +               return -EINVAL;
> +       }
> +}

We probably wouldn't need this anymore after removing the custom controls.

> +
> +static int mtk_dip_link_setup(struct media_entity *entity,
> +                             const struct media_pad *local,
> +                             const struct media_pad *remote, u32 flags)
> +{
> +       struct mtk_dip_pipe *dip_pipe =
> +               container_of(entity, struct mtk_dip_pipe, subdev.entity);
> +       u32 pad = local->index;
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s: link setup, flags(0x%x), (%s)%d -->(%s)%d\n",
> +               dip_pipe->desc->name,
> +               flags,
> +               local->entity->name,
> +               local->index,
> +               remote->entity->name,
> +               remote->index);
> +
> +       WARN_ON(entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV);
> +
> +       WARN_ON(pad >= dip_pipe->num_nodes);
> +
> +       dip_pipe->nodes[pad].enabled = !!(flags & MEDIA_LNK_FL_ENABLED);

How is this synchronized with video node streamon/streamoff ioctls?

> +
> +       return 0;
> +}
> +
> +static int mtk_dip_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +
> +       v4l2_buf->field = V4L2_FIELD_NONE;
> +       return 0;
> +}
> +
> +static int mtk_dip_vb2_buf_out_validate(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +
> +       v4l2_buf->field = V4L2_FIELD_NONE;

We need to return an error here if the field is neither ANY or NONE.

Perhaps we could do something like this:

if (v4l2_buf->field == V4L2_FIELD_ANY)
	v4l2_buf->field = V4L2_FIELD_NONE;

if (v4l2_buf->field != V4L2_FIELD_NONE)
	return -EINVAL;

> +
> +       return 0;
> +}
> +
> +static void mtk_dip_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +
> +       v4l2_buf->field = V4L2_FIELD_NONE;
> +}

Do we really need to set the field in all the 3 functions here?
The natural flow would be to set it in buf_out_validate for OUTPUT
buffers and before calling vb2_buffer_done() for CAPTURE buffers.

Then we wouldn't even need to implement the .buf_prepare or .buf_queue
callbacks.

> +
> +static int mtk_dip_vb2_queue_setup(struct vb2_queue *vq,
> +                                  unsigned int *num_buffers,
> +                                  unsigned int *num_planes,
> +                                  unsigned int sizes[],
> +                                  struct device *alloc_devs[])
> +{
> +       struct mtk_dip_pipe *dip_pipe = vb2_get_drv_priv(vq);
> +       struct mtk_dip_video_device *node =
> +               mtk_dip_vbq_to_node(vq);
> +       struct device *dev = &dip_pipe->dip_dev->pdev->dev;
> +       struct device *buf_alloc_ctx;
> +
> +       /* Get V4L2 format with the following method */

This comment doesn't add any additional information than visible from the
code itself.

> +       const struct v4l2_format *fmt = &node->vdev_fmt;
> +       unsigned int size;
> +
> +       *num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);

This should be already clamped to [1, VB2_MAX_FRAME].

> +
> +       if (node->desc->smem_alloc) {
> +               buf_alloc_ctx = &dip_pipe->smem_alloc_dev->dev;
> +               dev_dbg(dev, "%s:%s: select smem_vb2_alloc_ctx(%p)\n",
> +                       dip_pipe->desc->name,
> +                       node->desc->name,
> +                       buf_alloc_ctx);
> +       } else {
> +               buf_alloc_ctx = &dip_pipe->dip_dev->pdev->dev;
> +               dev_dbg(dev, "%s:%s: select default_vb2_alloc_ctx(%p)\n",
> +                       dip_pipe->desc->name,
> +                       node->desc->name,
> +                       buf_alloc_ctx);
> +       }
> +
> +       alloc_devs[0] = buf_alloc_ctx;

This function shouldn't need to assign alloc_decs[] at all. You can just set
vb2_queue::dev to the right struct device pointer at driver initialization
and the core would use that.

> +
> +       if (vq->type == V4L2_BUF_TYPE_META_CAPTURE ||
> +           vq->type == V4L2_BUF_TYPE_META_OUTPUT)
> +               size = fmt->fmt.meta.buffersize;
> +       else
> +               size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +       if (*num_planes) {
> +               if (sizes[0] < size) {
> +                       dev_dbg(dev, "%s:%s:%s: size error(user:%d, max:%d)\n",
> +                               __func__, dip_pipe->desc->name,
> +                               node->desc->name, sizes[0], size);
> +                       return -EINVAL;
> +               }

I don't think this is an error. This is for handling VIDIOC_CREATE_BUFS,
which can allocate for any arbitrary format.

Whether the size of the buffer is big enough for current format should be
checked in .buf_prepare callback.

> +       } else {
> +               *num_planes = 1;
> +               sizes[0] = size;
> +       }
> +
> +       dev_dbg(dev, "%s:%s:%s: n_planes(%d), n_bufs(%d), size(%d)\n",
> +               __func__, dip_pipe->desc->name,
> +               node->desc->name, *num_planes, *num_buffers, sizes[0]);
> +
> +       return 0;
> +}
> +
> +static int
> +       mtk_dip_all_nodes_streaming(struct mtk_dip_pipe *dip_pipe,
> +                                   struct mtk_dip_video_device *except)
> +{
> +       int i;
> +
> +       for (i = 0; i < dip_pipe->num_nodes; i++) {
> +               struct mtk_dip_video_device *node = &dip_pipe->nodes[i];
> +
> +               if (node == except)
> +                       continue;
> +               if (node->enabled &&
> +                   !vb2_start_streaming_called(&node->dev_q.vbq))
> +                       return 0;

How is this synchronized? What happens if another thread stops streaming of
the node at the same time?

I think we could do smarter here, for example, by maintaing a counter of
nodes not streaming yet.

> +       }
> +
> +       return 1;
> +}
> +
> +static void mtk_dip_return_all_buffers(struct mtk_dip_pipe *dip_pipe,
> +                                      struct mtk_dip_video_device *node,
> +                                      enum vb2_buffer_state state)
> +{
> +       int i;
> +
> +       for (i = 0; i < node->dev_q.vbq.num_buffers; i++) {
> +               if (node->dev_q.vbq.bufs[i]->state ==
> +                       VB2_BUF_STATE_ACTIVE)
> +                       vb2_buffer_done(node->dev_q.vbq.bufs[i],
> +                                       state);
> +       }

We can't just access vb2_queue internals like this. The driver should hold
any queued buffers in its own list and iterate over the list here.

> +}
> +
> +static int mtk_dip_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +       struct mtk_dip_pipe *dip_pipe = vb2_get_drv_priv(vq);
> +       struct mtk_dip_video_device *node =
> +               mtk_dip_vbq_to_node(vq);
> +       int ret;
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s:%s\n",
> +               dip_pipe->desc->name, node->desc->name,
> +               __func__);
> +
> +       if (!node->enabled) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s: stream on failed, node is not enabled\n",
> +                       dip_pipe->desc->name, node->desc->name);
> +               ret = -EINVAL;

This should be -ENOLINK.

> +               goto fail_return_bufs;
> +       }
> +
> +       ret = media_pipeline_start(&node->vdev.entity, &dip_pipe->pipeline);
> +

A general hint: Please don't add blank lines between the assignments and
then conditional blocks on the variable being assigned. Both are closely
related and so shouldn't be separated.

Also, do we need to do it for every node? I think we could just move this
just before the v4l2_subdev_call() below.

> +       if (ret < 0) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s: media_pipeline_start failed(%d)\n",
> +                       dip_pipe->desc->name, node->desc->name,
> +                       ret);
> +               goto fail_return_bufs;
> +       }
> +
> +       if (!mtk_dip_all_nodes_streaming(dip_pipe, node))
> +               return 0;
> +
> +       /* Start streaming of the whole pipeline */
> +       ret = v4l2_subdev_call(&dip_pipe->subdev, video, s_stream, 1);
> +       if (ret < 0) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s: sub dev s_stream(1) failed(%d)\n",
> +                       dip_pipe->desc->name, node->desc->name,
> +                       ret);
> +               goto fail_stop_pipeline;
> +       }
> +       return 0;
> +
> +fail_stop_pipeline:
> +       media_pipeline_stop(&node->vdev.entity);
> +fail_return_bufs:
> +       mtk_dip_return_all_buffers(dip_pipe, node, VB2_BUF_STATE_QUEUED);
> +
> +       return ret;
> +}
> +
> +static void mtk_dip_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> +       struct mtk_dip_pipe *dip_pipe = vb2_get_drv_priv(vq);
> +       struct mtk_dip_video_device *node =
> +               mtk_dip_vbq_to_node(vq);
> +       int ret;
> +
> +       WARN_ON(!node->enabled);
> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s:%s\n",
> +               dip_pipe->desc->name, node->desc->name,
> +               __func__);
> +
> +       if (mtk_dip_all_nodes_streaming(dip_pipe, node)) {
> +               ret = v4l2_subdev_call(&dip_pipe->subdev, video, s_stream, 0);
> +

nit: Unnecessary blank line.

> +       if (ret)
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "%s:%s: sub dev s_stream(0) failed(%d)\n",
> +                       dip_pipe->desc->name, node->desc->name,
> +                       ret);

Something wrong with intentation here.

> +       }
> +
> +       mtk_dip_return_all_buffers(dip_pipe, node, VB2_BUF_STATE_ERROR);
> +       media_pipeline_stop(&node->vdev.entity);
> +}
> +
> +static void mtk_dip_vb2_request_complete(struct vb2_buffer *vb)
> +{
> +       struct mtk_dip_video_device *node =
> +               mtk_dip_vbq_to_node(vb->vb2_queue);
> +
> +       v4l2_ctrl_request_complete(vb->req_obj.req,
> +                                  &node->ctrl_handler);

We're probably not expecting any controls in this driver.

> +}
> +
> +static u32 mtk_dip_node_get_v4l2_cap(struct mtk_dip_pipe *dip_pipe,
> +                                    struct mtk_dip_video_device *node)
> +{
> +       return node->desc->cap;
> +}

Do we really need a function for this simple dereference?

> +
> +static int mtk_dip_videoc_querycap(struct file *file, void *fh,
> +                                  struct v4l2_capability *cap)
> +{
> +       struct mtk_dip_pipe *dip_pipe = video_drvdata(file);
> +
> +       strlcpy(cap->driver, dip_pipe->desc->name,
> +               sizeof(cap->driver));
> +       strlcpy(cap->card, dip_pipe->desc->name,
> +               sizeof(cap->card));
> +       snprintf(cap->bus_info, sizeof(cap->bus_info),
> +                "platform:%s", dev_name(dip_pipe->dip_dev->mdev.dev));
> +
> +       return 0;
> +}
> +
> +static int mtk_dip_videoc_try_fmt(struct file *file,
> +                                 void *fh,
> +        struct v4l2_format *f)
> +{
> +       struct mtk_dip_pipe *dip_pipe = video_drvdata(file);
> +       struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +       struct v4l2_format try_fmt;
> +       int ret;
> +
> +       memset(&try_fmt, 0, sizeof(try_fmt));
> +
> +       try_fmt.type = node->dev_q.vbq.type;
> +
> +       ret = mtk_dip_pipe_set_img_fmt(dip_pipe, node, &f->fmt.pix_mp,
> +                                      &try_fmt.fmt.pix_mp);

Name of the function is confusing, as it suggests that format is actually
set. Also, that function is not very long and only called once, here. Please
just move its contents here.

> +
> +       if (ret)
> +               mtk_dip_pipe_load_default_fmt(dip_pipe, node, &try_fmt);

This is not a very good behavior. Ideally the driver should adjust the
format to the closest supported one, not default. At least the fields that
are acceptable should stay as is and just those that are unsupported should
be adjusted.

> +
> +       *f = try_fmt;
> +
> +       return 0;
> +}
> +
> +static int mtk_dip_videoc_g_fmt(struct file *file, void *fh,
> +                               struct v4l2_format *f)
> +{
> +       struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +
> +       *f = node->vdev_fmt;
> +
> +       return 0;
> +}
> +
> +static int mtk_dip_videoc_s_fmt(struct file *file, void *fh,
> +                               struct v4l2_format *f)
> +{
> +       struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +       struct mtk_dip_pipe *dip_pipe = video_drvdata(file);
> +

nit: Unnecessary blank line.

> +       int ret;
> +
> +       if (dip_pipe->streaming)
> +               return -EBUSY;
> +
> +       ret = mtk_dip_videoc_try_fmt(file, fh, f);
> +

nit: Unnecessary blank line.

> +       if (!ret)

If mtk_dip_videoc_try_fmt() returns an error, we should return an error here
too.

> +               node->vdev_fmt = *f;
> +
> +       return 0;
> +}
> +
> +static int mtk_dip_videoc_enum_framesizes(struct file *file,
> +                                         void *priv,
> +                                         struct v4l2_frmsizeenum *sizes)
> +{
> +       struct mtk_dip_pipe *dip_pipe = video_drvdata(file);
> +       struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +       struct mtk_dip_dev_format *dev_fmt;
> +
> +       dev_fmt = mtk_dip_pipe_find_fmt(dip_pipe, node, sizes->pixel_format);
> +
> +       if (!dev_fmt || sizes->index)
> +               return -EINVAL;
> +
> +       sizes->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +
> +       if (V4L2_TYPE_IS_OUTPUT(node->desc->buf_type)) {
> +               sizes->stepwise.max_width = MTK_DIP_OUTPUT_MAX_WIDTH;
> +               sizes->stepwise.min_width = MTK_DIP_OUTPUT_MIN_WIDTH;
> +               sizes->stepwise.max_height = MTK_DIP_OUTPUT_MAX_HEIGHT;
> +               sizes->stepwise.min_height = MTK_DIP_OUTPUT_MIN_HEIGHT;
> +               sizes->stepwise.step_height = 1;
> +               sizes->stepwise.step_width = 1;
> +       } else {
> +               sizes->stepwise.max_width = MTK_DIP_CAPTURE_MAX_WIDTH;
> +               sizes->stepwise.min_width = MTK_DIP_CAPTURE_MIN_WIDTH;
> +               sizes->stepwise.max_height = MTK_DIP_CAPTURE_MAX_HEIGHT;
> +               sizes->stepwise.min_height = MTK_DIP_CAPTURE_MIN_HEIGHT;
> +               sizes->stepwise.step_height = 1;
> +               sizes->stepwise.step_width = 1;
> +       }

Could we have 2 predefined v4l2_framesizeenum structs and pointers to them
in mtk_dip_video_device_desc structs and just copy the contents here? That
would eliminate the conditional handling.

> +
> +       return 0;
> +}
> +
> +static int mtk_dip_videoc_enum_fmt(struct file *file, void *fh,
> +                                  struct v4l2_fmtdesc *f)
> +{
> +       struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +
> +       if (f->index > node->desc->num_fmts ||

Not >=?

> +           f->type != node->dev_q.vbq.type)

The second part of the condition should be already handled by the core.

> +               return -EINVAL;
> +
> +       strscpy(f->description, node->desc->description,
> +               sizeof(f->description));
> +
> +       f->pixelformat = node->desc->fmts[f->index].fmt.img.pixelformat;
> +       f->flags = 0;
> +
> +       return 0;
> +}
> +
> +static int mtk_dip_meta_enum_format(struct file *file,
> +                                   void *fh, struct v4l2_fmtdesc *f)
> +{
> +       struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +
> +       if (f->index > 0 || f->type != node->dev_q.vbq.type)

The second part of the condition should be already handled by the core.

> +               return -EINVAL;
> +
> +       strscpy(f->description, node->desc->description,
> +               sizeof(f->description));
> +
> +       f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;

Also flags to 0.

> +
> +       return 0;
> +}
> +
> +static int mtk_dip_videoc_g_meta_fmt(struct file *file,
> +                                    void *fh, struct v4l2_format *f)
> +{
> +       struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +       *f = node->vdev_fmt;
> +
> +       return 0;
> +}
> +
> +static int
> +mtk_dip_vidioc_subscribe_event(struct v4l2_fh *fh,
> +                              const struct v4l2_event_subscription *sub)
> +{
> +       switch (sub->type) {
> +       case V4L2_EVENT_CTRL:
> +               return v4l2_ctrl_subscribe_event(fh, sub);

We can just use this helper directly as the callback, without the need to
implement it here.

> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +/******************** function pointers ********************/
> +
> +/* subdev internal operations */
> +static const struct v4l2_subdev_internal_ops mtk_dip_subdev_internal_ops = {
> +       .open = mtk_dip_subdev_open,
> +       .close = mtk_dip_subdev_close,
> +};
> +
> +static const struct v4l2_subdev_core_ops mtk_dip_subdev_core_ops = {
> +       .subscribe_event = mtk_dip_subdev_subscribe_event,
> +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops mtk_dip_subdev_video_ops = {
> +       .s_stream = mtk_dip_subdev_s_stream,
> +};
> +
> +static const struct v4l2_subdev_ops mtk_dip_subdev_ops = {
> +       .core = &mtk_dip_subdev_core_ops,
> +       .video = &mtk_dip_subdev_video_ops,
> +};
> +
> +static const struct media_entity_operations mtk_dip_media_ops = {
> +       .link_setup = mtk_dip_link_setup,
> +       .link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static int mtk_dip_request_buf_validate(struct media_request *req,
> +                                       int all_enable_node_need_buf)

This seems to be always called with all_enable_node_need_buf == 0. Please
remove the unused argument and dead code paths.

> +{
> +       struct media_request_object *obj;
> +       struct mtk_dip_pipe *dip_pipe;
> +       struct mtk_dip_pipe *dip_dev_first;

No need for the dip_ prefix in the variables if there is no collision.

> +       struct vb2_buffer *vbs[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM] = {};
> +       int count = 0;
> +
> +       if (!all_enable_node_need_buf)
> +               return  vb2_request_validate(req);

Don't we still need to validate whether all the buffers in the request
belong to the same pipe?

Also double space after return.

> +
> +       list_for_each_entry(obj, &req->objects, list) {
> +               struct vb2_buffer *vb;
> +
> +               if (vb2_request_object_is_buffer(obj)) {

If we're only interested in buffers, we can invert the condition and use the
continue keyword to reduce the indentation level.

> +                       struct mtk_dip_video_device *node;
> +
> +                       vb = container_of(obj, struct vb2_buffer, req_obj);
> +                       node = mtk_dip_vbq_to_node(vb->vb2_queue);
> +                       dip_pipe = vb2_get_drv_priv(vb->vb2_queue);
> +                       vbs[node->desc->id] = vb;
> +
> +                       if (count == 0)
> +                               dip_dev_first = dip_pipe;

count is not changed in this loop. How is it possible for this condition to
be false?

Anyway, we can do it without a counter:

struct mtk_dip_pipe *pipe, *pipe_prev = NULL;
//...
list_for_each_entry(...) {
	// ...
	pipe = vb2_get_drv_priv(,,,);
	if (pipe_prev && pipe != pipe_prev) {
		// error
	}
	pipe_prev = pipe;
}

> +
> +                       if (dip_dev_first != dip_pipe) {
> +                               pr_err("Req(%p):found buf of different pipes(%p,%p)",
> +                                      req, dip_dev_first, dip_pipe);
> +                               return -EINVAL;
> +                       }
> +               }
> +       }
> +
> +       if (!dip_pipe) {
> +               pr_debug("No dip dev found for the request\n");
> +               return -EINVAL;
> +       }

Can we get a buffer that isn't associated to any pipe? If not, doesn't that
mean that there was no buffer in the request? In such case, probably the
debug message should say that there was no buffers instead.

> +
> +       for (count = 0; count < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; count++) {
> +               if (dip_pipe->nodes[count].enabled) {
> +                       pr_debug("Node(%d:%s): vb(0x%x)\n",
> +                                count, dip_pipe->nodes[count].desc->name,
> +                                vbs[count]);
> +
> +                       if (!vbs[count]) {
> +                               pr_debug("Node(%s) enable and no buf enqueue\n",
> +                                        dip_pipe->nodes[count].desc->name);
> +                               return -EINVAL;
> +                       }
> +               }
> +       }

We shouldn't need to handle the enabled status anymore, since with requests
we decide what's enabled based on what buffers are in the request.

> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s: all bufs found, ready for req(%p) enqueue\n",
> +               __func__, dip_pipe->desc->name, req);
> +
> +       return vb2_request_validate(req);
> +}

Why not just have this code inside mtk_dip_vb2_request_validate()?

> +
> +static int mtk_dip_vb2_request_validate(struct media_request *req)
> +{
> +       return mtk_dip_request_buf_validate(req, 0);
> +}
> +
> +static void mtk_dip_vb2_request_queue(struct media_request *req)
> +{
> +       vb2_request_queue(req);
> +       mtk_dip_pipe_queue_buffers(req, 0);

This is problematic, because vb2_request_queue() doesn't necessarily hand
the buffers over to the driver. For example, you can still queue some
requests before starting streaming on the queues and then
vb2_request_queue() would keep those buffers owned by the vb2 framework
until streaming is started.

I'd suggest a following redesign:
 - do any driver-specific job data preparation in
   mtk_dip_vb2_request_validate() and store it inside the mtk_dip_request
   struct (superclass of struct media_request that I mentioned in another
   comment),
 - have a driver-internal queue of requests,
 - have a counter field in mtk_dip_request that would track the number of
   remaining buffers that still need to be handed over to the driver by the
   vb2,
 - in .buf_queue() dereference the request attached to the buffer and
   decrement the above counter,
 - have a function like mtk_dip_pipe_try_enqueue() that checks if the
   hardware is streaming and if so, tries to schedule as many requests from
   the top of the request queue as long as they are ready (buffer counter is
   0).

> +}
> +
> +static const struct media_device_ops mtk_dip_media_req_ops = {
> +       .req_validate = mtk_dip_vb2_request_validate,
> +       .req_queue = mtk_dip_vb2_request_queue,
> +};
> +
> +static const struct vb2_ops mtk_dip_vb2_ops = {
> +       .buf_queue = mtk_dip_vb2_buf_queue,
> +       .queue_setup = mtk_dip_vb2_queue_setup,
> +       .buf_prepare  = mtk_dip_vb2_buf_prepare,
> +       .buf_out_validate = mtk_dip_vb2_buf_out_validate,
> +       .start_streaming = mtk_dip_vb2_start_streaming,
> +       .stop_streaming = mtk_dip_vb2_stop_streaming,
> +       .wait_prepare = vb2_ops_wait_prepare,
> +       .wait_finish = vb2_ops_wait_finish,
> +       .buf_request_complete = mtk_dip_vb2_request_complete,
> +};
> +
> +static const struct v4l2_file_operations mtk_dip_v4l2_fops = {
> +       .unlocked_ioctl = video_ioctl2,
> +       .open = v4l2_fh_open,
> +       .release = vb2_fop_release,
> +       .poll = vb2_fop_poll,
> +       .mmap = vb2_fop_mmap,
> +#ifdef CONFIG_COMPAT
> +       .compat_ioctl32 = v4l2_compat_ioctl32,
> +#endif
> +};
> +
> +static void mtk_dip_node_to_v4l2(struct mtk_dip_pipe *dip_pipe,
> +                                u32 idx,
> +                                struct video_device *vdev,
> +                                struct v4l2_format *f)
> +{
> +       u32 cap;
> +       struct mtk_dip_video_device *node = &dip_pipe->nodes[idx];
> +
> +       cap = mtk_dip_node_get_v4l2_cap(dip_pipe, node);
> +       vdev->ioctl_ops = node->desc->ops;
> +       vdev->device_caps = V4L2_CAP_STREAMING | cap;

Why not just have mtk_dip_node_get_v4l2_cap() include V4L2_CAP_STREAMING in
the return value?

> +       f->type = node->desc->buf_type;

mtk_dip_pipe_load_default_fmt() initializes this field.

> +       mtk_dip_pipe_load_default_fmt(dip_pipe, node, f);
> +}

Once we remove the 2 lines mentioned above, this function becomes really
small and it's only used in one place, in mtk_dip_pipe_v4l2_register().
There is no need to have this in a function, just put the code directly
where it's called.

> +
> +int mtk_dip_dev_media_register(struct device *dev,
> +                              struct media_device *media_dev,
> +                              const char *model)
> +{
> +       int ret = 0;

Unnecessary variable initialization.

> +
> +       media_dev->dev = dev;
> +       dev_dbg(dev, "setup media_dev.dev: %p\n",
> +               media_dev->dev);
> +
> +       strlcpy(media_dev->model, model,
> +               sizeof(media_dev->model));
> +       dev_dbg(dev, "setup media_dev.model: %s\n",
> +               media_dev->model);
> +
> +       snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
> +                "platform:%s", dev_name(dev));
> +       dev_dbg(dev, "setup media_dev.bus_info: %s\n",
> +               media_dev->bus_info);
> +
> +       media_dev->hw_revision = 0;
> +       dev_dbg(dev, "setup media_dev.hw_revision: %d\n",
> +               media_dev->hw_revision);
> +
> +       media_dev->ops = &mtk_dip_media_req_ops;
> +
> +       dev_dbg(dev, "media_device_init: media_dev:%p\n",
> +               media_dev);

Why all those debugging messages? There isn't anything special happening
above, so I don't see a point in having those. Please remove.

> +       media_device_init(media_dev);
> +
> +       pr_debug("Register media device: %s, %p",
> +                media_dev->model,
> +               media_dev);

Use dev_dbg().

> +
> +       ret = media_device_register(media_dev);
> +

nit: Unnecessary blank line.

> +       if (ret) {
> +               dev_err(dev, "failed to register media device (%d)\n", ret);
> +               goto fail_media_dev;
> +       }

nit: Add a blank line.

> +       return 0;
> +
> +fail_media_dev:
> +       media_device_unregister(media_dev);
> +       media_device_cleanup(media_dev);
> +
> +       return ret;
> +}
> +
> +int mtk_dip_dev_v4l2_register(struct device *dev,
> +                             struct media_device *media_dev,
> +                             struct v4l2_device *v4l2_dev)
> +{
> +       int ret = 0;

Please avoid unnecessary variable initialization.

nit: Variable declarations should be separated with a blank line.

> +       /* Set up v4l2 device */
> +       v4l2_dev->mdev = media_dev;
> +       dev_dbg(dev, "setup v4l2_dev->mdev: %p",
> +               v4l2_dev->mdev);
> +       v4l2_dev->ctrl_handler = NULL;
> +       dev_dbg(dev, "setup v4l2_dev->ctrl_handler: %p",
> +               v4l2_dev->ctrl_handler);

The two debugging messages above are not useful, please remove them.

> +
> +       pr_debug("Register v4l2 device: %p",
> +                v4l2_dev);

Please use dev_dbg(). Also no need for line wrapping here.

> +
> +       ret = v4l2_device_register(dev, v4l2_dev);
> +

nit: Unnecessary blank line.

> +       if (ret) {
> +               dev_err(dev, "failed to register V4L2 device (%d)\n", ret);
> +               goto fail_v4l2_dev;
> +       }
> +
> +       return 0;
> +
> +fail_v4l2_dev:
> +       media_device_unregister(media_dev);
> +       media_device_cleanup(media_dev);
> +
> +       return ret;
> +}
> +
> +int mtk_dip_pipe_v4l2_register(struct mtk_dip_pipe *dip_pipe,
> +                              struct media_device *media_dev,
> +                              struct v4l2_device *v4l2_dev)
> +{
> +       int i, ret;
> +
> +       /* Initialize miscellaneous variables */
> +       dip_pipe->streaming = 0;
> +
> +       /* Initialize subdev media entity */
> +       dip_pipe->subdev_pads = kcalloc(dip_pipe->num_nodes,
> +                                       sizeof(*dip_pipe->subdev_pads),
> +                                       GFP_KERNEL);

I think we could just use devm_kcalloc() here and remove any matching
calls to kfree(), since that would be cleaned up for us when removing
the driver.

> +       if (!dip_pipe->subdev_pads) {
> +               ret = -ENOMEM;
> +               goto fail_subdev_pads;

There is nothing to clean up here, we can just return directly.

A hint for avoiding this kind of mistakes: Always name the label after
the first thing that needs to be cleaned up after jumping to it. In this
case you wouldn't have a name for it! :)

> +       }
> +
> +       ret = media_entity_pads_init(&dip_pipe->subdev.entity,
> +                                    dip_pipe->num_nodes,
> +                                    dip_pipe->subdev_pads);
> +       if (ret) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "failed initialize subdev media entity (%d)\n", ret);
> +               goto fail_media_entity;
> +       }
> +
> +       /* Initialize subdev */
> +       v4l2_subdev_init(&dip_pipe->subdev, &mtk_dip_subdev_ops);
> +
> +       dip_pipe->subdev.entity.function =
> +               MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +
> +       dip_pipe->subdev.entity.ops = &mtk_dip_media_ops;
> +
> +       for (i = 0; i < dip_pipe->num_nodes; i++) {
> +               struct mtk_dip_video_device_desc *desc =
> +                       dip_pipe->nodes[i].desc;
> +
> +               dip_pipe->subdev_pads[i].flags =
> +                       V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
> +                       MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> +       }
> +
> +       dip_pipe->subdev.flags =
> +               V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> +       snprintf(dip_pipe->subdev.name, sizeof(dip_pipe->subdev.name),
> +                "%s", dip_pipe->desc->name);
> +       v4l2_set_subdevdata(&dip_pipe->subdev, dip_pipe);
> +       dip_pipe->subdev.ctrl_handler = &dip_pipe->ctrl_handler;
> +       dip_pipe->subdev.internal_ops = &mtk_dip_subdev_internal_ops;

Please group all the direct assignment to dip_pipe->subdev fields, for
better code readabiltiy.

> +
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "register subdev: %s, ctrl_handler %p\n",
> +                dip_pipe->subdev.name, dip_pipe->subdev.ctrl_handler);

nit: Add a blank line here.

> +       ret = v4l2_device_register_subdev(&dip_pipe->dip_dev->v4l2_dev,
> +                                         &dip_pipe->subdev);
> +       if (ret) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "failed initialize subdev (%d)\n", ret);
> +               goto fail_subdev;
> +       }
> +
> +       ret = v4l2_device_register_subdev_nodes(&dip_pipe->dip_dev->v4l2_dev);
> +       if (ret) {
> +               dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                       "failed to register subdevs (%d)\n", ret);
> +               goto fail_subdevs;
> +       }
> +
> +       /* Create video nodes and links */
> +       for (i = 0; i < dip_pipe->num_nodes; i++) {

I'd suggest moving the contents of this loop out into a separate
function, which should simplify error handling and make the code more
readable - shorter functions, less indentation.

> +               struct mtk_dip_video_device *node = &dip_pipe->nodes[i];
> +               struct video_device *vdev = &node->vdev;
> +               struct vb2_queue *vbq = &node->dev_q.vbq;
> +               struct mtk_dip_video_device_desc *desc = node->desc;
> +               u32 flags;
> +
> +               /* Initialize miscellaneous variables */
> +               mutex_init(&node->dev_q.lock);
> +
> +               /* Initialize formats to default values */
> +               mtk_dip_node_to_v4l2(dip_pipe, i, vdev, &node->vdev_fmt);

Name of this function is at least confusing, because it sounds like one of
the functions for getting a "superclass" pointer from a "subclass".

> +
> +               /* Initialize media entities */

Where is entity name and function set?

> +               ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
> +               if (ret) {
> +                       dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                               "failed initialize media entity (%d)\n", ret);
> +                       goto fail_vdev_media_entity;
> +               }
> +
> +               node->vdev_pad.flags = V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
> +                       MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
> +               vdev->entity.ops = NULL;
> +
> +               /* Initialize vbq */
> +               vbq->type = node->vdev_fmt.type;
> +               vbq->io_modes = VB2_MMAP | VB2_DMABUF;
> +               vbq->ops = &mtk_dip_vb2_ops;
> +               vbq->mem_ops = &vb2_dma_contig_memops;
> +               vbq->supports_requests = true;
> +               vbq->buf_struct_size = sizeof(struct mtk_dip_dev_buffer);
> +               vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +               vbq->min_buffers_needed = 0;
> +               /* Put the process hub sub device in the vb2 private data*/
> +               vbq->drv_priv = dip_pipe;
> +               vbq->lock = &node->dev_q.lock;
> +               ret = vb2_queue_init(vbq);
> +               if (ret) {
> +                       dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                               "failed to initialize video queue (%d)\n", ret);
> +                       goto fail_vdev;
> +               }
> +
> +               /* Initialize vdev */
> +               snprintf(vdev->name, sizeof(vdev->name), "%s %s",
> +                        dip_pipe->desc->name,
> +                        node->desc->name);
> +               vdev->release = video_device_release_empty;
> +               vdev->fops = &mtk_dip_v4l2_fops;
> +               vdev->lock = &node->dev_q.lock;
> +               vdev->ctrl_handler = &dip_pipe->nodes[i].ctrl_handler;
> +               vdev->v4l2_dev = &dip_pipe->dip_dev->v4l2_dev;
> +               vdev->queue = &node->dev_q.vbq;
> +               vdev->vfl_dir = V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
> +                       VFL_DIR_TX : VFL_DIR_RX;
> +               video_set_drvdata(vdev, dip_pipe);
> +               pr_debug("register vdev: %s\n", vdev->name);
> +               ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> +               if (ret) {
> +                       dev_err(&dip_pipe->dip_dev->pdev->dev,
> +                               "failed to register video device (%d)\n", ret);
> +                       goto fail_vdev;
> +               }
> +
> +               /* Create link between video node and the subdev pad */
> +               flags = 0;
> +               if (desc->dynamic)
> +                       flags |= MEDIA_LNK_FL_DYNAMIC;
> +               if (node->enabled)
> +                       flags |= MEDIA_LNK_FL_ENABLED;
> +               if (node->immutable)
> +                       flags |= MEDIA_LNK_FL_IMMUTABLE;

Why not just have node->flags with all the flags already set there?

> +
> +               if (V4L2_TYPE_IS_OUTPUT(desc->buf_type))
> +                       ret = media_create_pad_link(&vdev->entity, 0,
> +                                                   &dip_pipe->subdev.entity,
> +                                                   i, flags);
> +               else
> +                       ret = media_create_pad_link(&dip_pipe->subdev.entity,
> +                                                   i, &vdev->entity, 0,
> +                                                   flags);
> +

nit: Unnecessary blank line.

> +               if (ret)
> +                       goto fail_link;

We also need to create interfaces and interface links with
media_devnode_create() and media_create_intf_link() respectively.

See how the generic mem2mem code deals with it, as an example:
https://elixir.bootlin.com/linux/v5.1-rc6/source/drivers/media/v4l2-core/v4l2-mem2mem.c#L778

> +       }
> +
> +       return 0;
> +
> +       for (; i >= 0; i--) {
> +fail_link:
> +               video_unregister_device(&dip_pipe->nodes[i].vdev);
> +fail_vdev:
> +               vb2_queue_release(&dip_pipe->nodes[i].dev_q.vbq);
> +               media_entity_cleanup(&dip_pipe->nodes[i].vdev.entity);
> +fail_vdev_media_entity:
> +               mutex_destroy(&dip_pipe->nodes[i].dev_q.lock);
> +       }
> +fail_subdevs:
> +       v4l2_device_unregister_subdev(&dip_pipe->subdev);
> +fail_subdev:
> +       media_entity_cleanup(&dip_pipe->subdev.entity);
> +fail_media_entity:
> +       kfree(dip_pipe->subdev_pads);
> +fail_subdev_pads:
> +       v4l2_device_unregister(&dip_pipe->dip_dev->v4l2_dev);
> +       pr_err("fail_v4l2_dev: media_device_unregister and clenaup:%p",
> +              &dip_pipe->dip_dev->mdev);
> +       media_device_unregister(&dip_pipe->dip_dev->mdev);
> +       media_device_cleanup(&dip_pipe->dip_dev->mdev);

Something is wrong here. This function doesn't seem to initialize the
things that are being cleaned up here. It must only clean up things that
set up on its own. Please fix this.

> +
> +       return ret;
> +}
> +
> +int mtk_dip_pipe_v4l2_unregister(struct mtk_dip_pipe *dip_pipe)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < dip_pipe->num_nodes; i++) {
> +               video_unregister_device(&dip_pipe->nodes[i].vdev);
> +               vb2_queue_release(&dip_pipe->nodes[i].dev_q.vbq);
> +               media_entity_cleanup(&dip_pipe->nodes[i].vdev.entity);
> +               mutex_destroy(&dip_pipe->nodes[i].dev_q.lock);
> +       }
> +
> +       v4l2_device_unregister_subdev(&dip_pipe->subdev);
> +       media_entity_cleanup(&dip_pipe->subdev.entity);
> +       kfree(dip_pipe->subdev_pads);
> +       v4l2_device_unregister(&dip_pipe->dip_dev->v4l2_dev);
> +       media_device_unregister(&dip_pipe->dip_dev->mdev);
> +       media_device_cleanup(&dip_pipe->dip_dev->mdev);
> +
> +       return 0;
> +}
> +
> +void mtk_dip_v4l2_buffer_done(struct vb2_buffer *vb,
> +                             enum vb2_buffer_state state)
> +{
> +       struct mtk_dip_pipe *dip_pipe;
> +       struct mtk_dip_video_device *node;
> +
> +       dip_pipe = vb2_get_drv_priv(vb->vb2_queue);
> +       node = mtk_dip_vbq_to_node(vb->vb2_queue);
> +       dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> +               "%s:%s: return buf, idx(%d), state(%d)\n",
> +               dip_pipe->desc->name, node->desc->name,
> +               vb->index, state);
> +       vb2_buffer_done(vb, state);
> +}

Hmm, all this function does is calling vb2_buffer_done(). Why couldn't
it be called directly from wherever this function is called?

> +
> +/********************************************
> + * MTK DIP V4L2 Settings *
> + ********************************************/
> +
> +static const struct v4l2_ioctl_ops mtk_dip_v4l2_video_out_ioctl_ops = {
> +       .vidioc_querycap = mtk_dip_videoc_querycap,
> +       .vidioc_enum_framesizes = mtk_dip_videoc_enum_framesizes,
> +       .vidioc_enum_fmt_vid_cap_mplane = mtk_dip_videoc_enum_fmt,
> +       .vidioc_g_fmt_vid_cap_mplane = mtk_dip_videoc_g_fmt,
> +       .vidioc_s_fmt_vid_cap_mplane = mtk_dip_videoc_s_fmt,
> +       .vidioc_try_fmt_vid_cap_mplane = mtk_dip_videoc_try_fmt,
> +       .vidioc_enum_fmt_vid_out_mplane = mtk_dip_videoc_enum_fmt,
> +       .vidioc_g_fmt_vid_out_mplane = mtk_dip_videoc_g_fmt,
> +       .vidioc_s_fmt_vid_out_mplane = mtk_dip_videoc_s_fmt,
> +       .vidioc_try_fmt_vid_out_mplane = mtk_dip_videoc_try_fmt,
> +       .vidioc_reqbufs = vb2_ioctl_reqbufs,
> +       .vidioc_create_bufs = vb2_ioctl_create_bufs,
> +       .vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +       .vidioc_querybuf = vb2_ioctl_querybuf,
> +       .vidioc_qbuf = vb2_ioctl_qbuf,
> +       .vidioc_dqbuf = vb2_ioctl_dqbuf,
> +       .vidioc_streamon = vb2_ioctl_streamon,
> +       .vidioc_streamoff = vb2_ioctl_streamoff,
> +       .vidioc_expbuf = vb2_ioctl_expbuf,
> +       .vidioc_subscribe_event = mtk_dip_vidioc_subscribe_event,
> +       .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +

Unnecessary blank line.

> +};
> +
> +static const struct v4l2_ioctl_ops mtk_dip_v4l2_video_cap_ioctl_ops = {
> +       .vidioc_querycap = mtk_dip_videoc_querycap,
> +       .vidioc_enum_framesizes = mtk_dip_videoc_enum_framesizes,
> +       .vidioc_enum_fmt_vid_cap_mplane = mtk_dip_videoc_enum_fmt,
> +       .vidioc_g_fmt_vid_cap_mplane = mtk_dip_videoc_g_fmt,
> +       .vidioc_s_fmt_vid_cap_mplane = mtk_dip_videoc_s_fmt,
> +       .vidioc_try_fmt_vid_cap_mplane = mtk_dip_videoc_try_fmt,
> +       .vidioc_enum_fmt_vid_out_mplane = mtk_dip_videoc_enum_fmt,
> +       .vidioc_g_fmt_vid_out_mplane = mtk_dip_videoc_g_fmt,
> +       .vidioc_s_fmt_vid_out_mplane = mtk_dip_videoc_s_fmt,
> +       .vidioc_try_fmt_vid_out_mplane = mtk_dip_videoc_try_fmt,
> +       .vidioc_reqbufs = vb2_ioctl_reqbufs,
> +       .vidioc_create_bufs = vb2_ioctl_create_bufs,
> +       .vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +       .vidioc_querybuf = vb2_ioctl_querybuf,
> +       .vidioc_qbuf = vb2_ioctl_qbuf,
> +       .vidioc_dqbuf = vb2_ioctl_dqbuf,
> +       .vidioc_streamon = vb2_ioctl_streamon,
> +       .vidioc_streamoff = vb2_ioctl_streamoff,
> +       .vidioc_expbuf = vb2_ioctl_expbuf,
> +       .vidioc_subscribe_event = mtk_dip_vidioc_subscribe_event,
> +       .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +

Unneecessary blank line.

> +};
> +
> +static const struct v4l2_ioctl_ops mtk_dip_v4l2_meta_out_ioctl_ops = {
> +       .vidioc_querycap = mtk_dip_videoc_querycap,
> +
> +       .vidioc_enum_fmt_meta_cap = mtk_dip_meta_enum_format,
> +       .vidioc_g_fmt_meta_cap = mtk_dip_videoc_g_meta_fmt,
> +       .vidioc_s_fmt_meta_cap = mtk_dip_videoc_g_meta_fmt,
> +       .vidioc_try_fmt_meta_cap = mtk_dip_videoc_g_meta_fmt,
> +
> +       .vidioc_enum_fmt_meta_out = mtk_dip_meta_enum_format,
> +       .vidioc_g_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
> +       .vidioc_s_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
> +       .vidioc_try_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
> +

I like the blank lines separating different types of the ops here. Could
you do the same for the other structs above?

> +       .vidioc_reqbufs = vb2_ioctl_reqbufs,
> +       .vidioc_create_bufs = vb2_ioctl_create_bufs,
> +       .vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +       .vidioc_querybuf = vb2_ioctl_querybuf,
> +       .vidioc_qbuf = vb2_ioctl_qbuf,
> +       .vidioc_dqbuf = vb2_ioctl_dqbuf,
> +       .vidioc_streamon = vb2_ioctl_streamon,
> +       .vidioc_streamoff = vb2_ioctl_streamoff,
> +       .vidioc_expbuf = vb2_ioctl_expbuf,
> +};
> +
> +static struct mtk_dip_dev_format fw_param_fmts[] = {
> +       {
> +               .fmt.meta = {
> +                       .dataformat = V4L2_META_FMT_MTISP_PARAMS,
> +                       .max_buffer_size = 1024 * 30,
> +               },
> +       },
> +};
> +
> +static struct mtk_dip_dev_format in_fmts[] = {

const

> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_MTISP_B10,
> +                       .mdp_color = MDP_COLOR_BAYER10,
> +                       .colorspace = V4L2_COLORSPACE_SRGB,
> +                       .depth = { 10 },
> +                       .row_depth = { 10 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_MTISP_F10,
> +                       .mdp_color = MDP_COLOR_FULLG10,
> +                       .colorspace = V4L2_COLORSPACE_RAW,
> +                       .depth = { 15 },
> +                       .row_depth = { 15 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_VYUY,
> +                       .mdp_color = MDP_COLOR_VYUY,
> +                       .colorspace = V4L2_COLORSPACE_BT2020,
> +                       .depth   = { 16 },
> +                       .row_depth = { 16 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_YUYV,
> +                       .mdp_color = MDP_COLOR_YUYV,
> +                       .colorspace = V4L2_COLORSPACE_BT2020,
> +                       .depth   = { 16 },
> +                       .row_depth = { 16 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_YVYU,
> +                       .mdp_color = MDP_COLOR_YVYU,
> +                       .colorspace = V4L2_COLORSPACE_BT2020,
> +                       .depth   = { 16 },
> +                       .row_depth = { 16 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_NV12,
> +                       .mdp_color = MDP_COLOR_NV12,
> +                       .colorspace = V4L2_COLORSPACE_BT2020,
> +                       .depth = { 12 },
> +                       .row_depth = { 8 },
> +                       .num_planes = 1,
> +               },
> +       }
> +};
> +
> +static struct mtk_dip_dev_format out_fmts[] = {

const

> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_VYUY,
> +                       .mdp_color = MDP_COLOR_VYUY,
> +                       .colorspace = MDP_YCBCR_PROFILE_BT601,

Does the hardware support only BT601 for this pixel format? Note that
V4L2 has color space information inside v4l2_pix_fmt_mplane, so if the
hardware supports more than one, it should be exposed via that part of
the format.

> +                       .depth = { 16 },
> +                       .row_depth = { 16 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_YUYV,
> +                       .mdp_color = MDP_COLOR_YUYV,
> +                       .colorspace = MDP_YCBCR_PROFILE_BT601,
> +                       .depth = { 16 },
> +                       .row_depth = { 16 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_YVYU,
> +                       .mdp_color = MDP_COLOR_YVYU,
> +                       .colorspace = MDP_YCBCR_PROFILE_BT601,
> +                       .depth = { 16 },
> +                       .row_depth = { 16 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_YVU420,
> +                       .mdp_color = MDP_COLOR_YV12,
> +                       .colorspace = MDP_YCBCR_PROFILE_BT601,
> +                       .depth = { 12 },
> +                       .row_depth = { 8 },
> +                       .num_planes = 1,
> +               },
> +       },
> +       {
> +               .fmt.img = {
> +                       .pixelformat = V4L2_PIX_FMT_NV12,
> +                       .mdp_color = MDP_COLOR_NV12,
> +                       .colorspace = MDP_YCBCR_PROFILE_BT601,
> +                       .depth = { 12 },
> +                       .row_depth = { 8 },
> +                       .num_planes = 1,

Is it a hardware limitation that we only support formats with 1 memory
planes here? (I.e. does the hardware has only 1 DMA address register or
1 register per color plane?)

Generally it's prefered to expose the M formats (e.g. NV12M) rather than
the non-M ones only and ideally both.

> +               },
> +       }
> +};
> +
> +static struct mtk_dip_video_device_desc

const

> +       output_queues_setting[MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM] = {

^ Unnecessary indentation.

> +       {
> +               .id = MTK_DIP_VIDEO_NODE_ID_RAW_OUT,
> +               .name = "Raw Input",
> +               .cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE,
> +               .buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +               .dynamic = 0,
> +               .smem_alloc = 0,
> +               .default_enable = 1,
> +               .fmts = in_fmts,
> +               .num_fmts = ARRAY_SIZE(in_fmts),
> +               .default_fmt_idx = 0,
> +               .default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +               .default_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
> +               .ops = &mtk_dip_v4l2_video_out_ioctl_ops,
> +               .description = "Main image source",
> +       },
> +       {
> +               .id = MTK_DIP_VIDEO_NODE_ID_TUNING_OUT,
> +               .name = "Tuning",
> +               .cap = V4L2_CAP_META_OUTPUT,
> +               .buf_type = V4L2_BUF_TYPE_META_OUTPUT,
> +               .dynamic = 0,
> +               .smem_alloc = 1,
> +               .default_enable = 0,
> +               .fmts = fw_param_fmts,
> +               .num_fmts = 1,
> +               .default_fmt_idx = 0,
> +               .ops = &mtk_dip_v4l2_meta_out_ioctl_ops,
> +               .description = "Tuning data",
> +       },
> +};
> +
> +static struct mtk_dip_video_device_desc

const

> +       reprocess_output_queues_setting[MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM] = {

^ Unnecessary indentation.

> +       {
> +               .id = MTK_DIP_VIDEO_NODE_ID_RAW_OUT,
> +               .name = "Raw Input",
> +               .cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE,
> +               .buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +               .dynamic = 0,
> +               .smem_alloc = 0,
> +               .default_enable = 1,
> +               .fmts = in_fmts,
> +               .num_fmts = ARRAY_SIZE(in_fmts),
> +               .default_fmt_idx = 5,
> +               .default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +               .default_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
> +               .ops = &mtk_dip_v4l2_video_out_ioctl_ops,
> +               .description = "Source image to be process",
> +
> +       },
> +       {
> +               .id = MTK_DIP_VIDEO_NODE_ID_TUNING_OUT,
> +               .name = "Tuning",
> +               .dynamic = 0,
> +               .cap = V4L2_CAP_META_OUTPUT,
> +               .buf_type = V4L2_BUF_TYPE_META_OUTPUT,
> +               .smem_alloc = 1,
> +               .default_enable = 0,
> +               .fmts = fw_param_fmts,
> +               .num_fmts = 1,
> +               .default_fmt_idx = 0,
> +               .ops = &mtk_dip_v4l2_meta_out_ioctl_ops,
> +               .description = "Tuning data for image enhancement",
> +       },
> +};
> +
> +static struct mtk_dip_video_device_desc

const

> +       capture_queues_setting[MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM] = {

^ Unnecessary indentation.

> +       {
> +               .id = MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE,
> +               .name = "MDP0",
> +               .cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
> +               .buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +               .dynamic = 1,
> +               .smem_alloc = 0,
> +               .default_enable = 1,
> +               .fmts = out_fmts,
> +               .num_fmts = ARRAY_SIZE(out_fmts),
> +               .default_fmt_idx = 1,
> +               .default_width = MTK_DIP_OUTPUT_MAX_WIDTH,
> +               .default_height = MTK_DIP_OUTPUT_MAX_HEIGHT,
> +               .ops = &mtk_dip_v4l2_video_cap_ioctl_ops,
> +               .description = "Output quality enhanced image",
> +       },
> +       {
> +               .id = MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE,
> +               .name = "MDP1",
> +               .cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
> +               .buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +               .dynamic = 1,
> +               .smem_alloc = 0,
> +               .default_enable = 1,
> +               .fmts = out_fmts,
> +               .num_fmts = ARRAY_SIZE(out_fmts),
> +               .default_fmt_idx = 1,
> +               .default_width = MTK_DIP_OUTPUT_MAX_WIDTH,
> +               .default_height = MTK_DIP_OUTPUT_MAX_HEIGHT,
> +               .ops = &mtk_dip_v4l2_video_cap_ioctl_ops,
> +               .description = "Output quality enhanced image",
> +
> +       },
> +};
> +
> +static struct mtk_dip_pipe_desc

const

> +       pipe_settings[MTK_DIP_PIPE_ID_TOTAL_NUM] = {

^ Unnecessary indentation.

> +       {
> +               .name = MTK_DIP_DEV_DIP_PREVIEW_NAME,
> +               .id = MTK_DIP_PIPE_ID_PREVIEW,
> +               .master = MTK_DIP_VIDEO_NODE_ID_NO_MASTER,
> +               .output_queue_descs = output_queues_setting,
> +               .total_output_queues = MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM,
> +               .capture_queue_descs = capture_queues_setting,
> +               .total_capture_queues = MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM,
> +       },
> +       {
> +               .name = MTK_DIP_DEV_DIP_CAPTURE_NAME,
> +               .id = MTK_DIP_PIPE_ID_CAPTURE,
> +               .master = MTK_DIP_VIDEO_NODE_ID_NO_MASTER,
> +               .output_queue_descs = output_queues_setting,
> +               .total_output_queues = MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM,
> +               .capture_queue_descs = capture_queues_setting,
> +               .total_capture_queues = MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM,
> +       },
> +       {
> +               .name = MTK_DIP_DEV_DIP_REPROCESS_NAME,
> +               .id = MTK_DIP_PIPE_ID_REPROCESS,
> +               .master = MTK_DIP_VIDEO_NODE_ID_NO_MASTER,
> +               .output_queue_descs = reprocess_output_queues_setting,
> +               .total_output_queues = MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM,
> +               .capture_queue_descs = capture_queues_setting,
> +               .total_capture_queues = MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM,
> +       },
> +};
> +
> +int mtk_dip_dev_v4l2_init(struct mtk_dip_dev *dip_dev)
> +{
> +       struct media_device *media_dev;
> +       struct v4l2_device *v4l2_dev;
> +       struct mtk_dip_smem_dev *smem_alloc_dev = &dip_dev->smem_alloc_dev;
> +       int i;
> +       int ret = 0;

Unnecessary variable initialization.

> +
> +       media_dev = &dip_dev->mdev;
> +       v4l2_dev = &dip_dev->v4l2_dev;
> +
> +       ret = mtk_dip_dev_media_register(&dip_dev->pdev->dev,
> +                                        media_dev,
> +                                        MTK_DIP_DEV_DIP_MEDIA_MODEL_NAME);

Missing error handling.

> +
> +       ret = mtk_dip_dev_v4l2_register(&dip_dev->pdev->dev,
> +                                       media_dev,
> +                                       v4l2_dev);

Missing error handling.

> +
> +       ret = mtk_dip_smem_alloc_dev_init(smem_alloc_dev, &dip_dev->pdev->dev);

Missing error handling.

> +
> +       for (i = 0; i < MTK_DIP_PIPE_ID_TOTAL_NUM; i++) {
> +               ret = mtk_dip_pipe_init(&dip_dev->dip_pipe[i], dip_dev,
> +                                       &pipe_settings[i],
> +                                       media_dev, v4l2_dev, smem_alloc_dev);
> +               if (ret) {
> +                       dev_err(&dip_dev->pdev->dev,
> +                               "%s: Pipe id(%d) init failed(%d)\n",
> +                               dip_dev->dip_pipe[i].desc->name,
> +                               i, ret);

Don't we need to clean up after the previous steps?

> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +void mtk_dip_dev_v4l2_release(struct mtk_dip_dev *dip_dev)
> +{
> +       int i = 0;

Unnecessary variable initialization.

> +
> +       if (dip_dev)

Why would one call this function with NULL argument?

> +               for (i = 0; i < MTK_DIP_PIPE_ID_TOTAL_NUM; i++)
> +                       mtk_dip_pipe_release(&dip_dev->dip_pipe[i]);
> +
> +       mtk_dip_smem_alloc_dev_release(&dip_dev->smem_alloc_dev);

Don't we need to unregister v4l2 and media, which we registered in
mtk_dip_dev_v4l2_init()?

Best regards,
Tomasz

