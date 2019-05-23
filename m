Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2760827F78
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 16:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730792AbfEWOY1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 10:24:27 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:26174 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730668AbfEWOY1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 10:24:27 -0400
X-UUID: 077889d4ca044e6fa6aab84145110526-20190523
X-UUID: 077889d4ca044e6fa6aab84145110526-20190523
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1193637410; Thu, 23 May 2019 22:24:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 23 May 2019 22:24:01 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 23 May 2019 22:24:01 +0800
Message-ID: <1558621441.7995.42.camel@mtksdccf07>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
From:   Frederic Chen <frederic.chen@mediatek.com>
To:     Shik Chen <shik@chromium.org>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>, <suleiman@chromium.org>
Date:   Thu, 23 May 2019 22:24:01 +0800
In-Reply-To: <20190522095141.GB235603@google.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
         <20190417104511.21514-7-frederic.chen@mediatek.com>
         <20190522095141.GB235603@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: E39401C2F1CD171E2B7BD5DA5A1226F2D1FE7BB8D9DDC921568C293F4CDB34232000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shilk,


I appreciate your comments.


On Wed, 2019-05-22 at 17:51 +0800, Shik Chen wrote:
> Hi Frederic,
> 
> Most reviews are already covered by Tomasz, here are some small missing pieces.
> Please see my comments inline.
> 
> On Wed, Apr 17, 2019 at 06:45:11PM +0800, Frederic Chen wrote:
> > This patch adds the driver of Digital Image Processing (DIP)
> > unit in Mediatek ISP system, providing image format
> > conversion, resizing, and rotation features.
> > 
> > The mtk-isp directory will contain drivers for multiple IP
> > blocks found in Mediatek ISP system. It will include ISP
> > Pass 1 driver(CAM), sensor interface driver, DIP driver and
> > face detection driver.
> > 
> > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > ---
> >  drivers/media/platform/mtk-isp/Makefile       |   18 +
> >  .../media/platform/mtk-isp/isp_50/Makefile    |   17 +
> >  .../platform/mtk-isp/isp_50/dip/Makefile      |   32 +
> >  .../mtk-isp/isp_50/dip/mtk_dip-ctrl.c         |  124 ++
> >  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c | 1116 +++++++++++++
> >  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  321 ++++
> >  .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  167 ++
> >  .../mtk-isp/isp_50/dip/mtk_dip-smem.c         |  322 ++++
> >  .../mtk-isp/isp_50/dip/mtk_dip-smem.h         |   39 +
> >  .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c | 1384 +++++++++++++++++
> >  .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 1310 ++++++++++++++++
> >  11 files changed, 4850 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.h
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> > 
> > diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
> > new file mode 100644
> > index 000000000000..24bc5354e2f6
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/Makefile
> > @@ -0,0 +1,18 @@
> > +#
> > +# Copyright (C) 2018 MediaTek Inc.
> > +#
> > +# This program is free software: you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License version 2 as
> > +# published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > +# GNU General Public License for more details.
> > +#
> > +
> > +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_COMMON) += common/
> > +
> > +obj-y += isp_50/
> > +
> > +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_FD_SUPPORT) += fd/
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
> > new file mode 100644
> > index 000000000000..fd0e5bd3c781
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
> > @@ -0,0 +1,17 @@
> > +#
> > +# Copyright (C) 2018 MediaTek Inc.
> > +#
> > +# This program is free software: you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License version 2 as
> > +# published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > +# GNU General Public License for more details.
> > +#
> > +
> > +ifeq ($(CONFIG_VIDEO_MEDIATEK_ISP_DIP_SUPPORT),y)
> > +obj-y += dip/
> > +endif
> > +
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/Makefile b/drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> > new file mode 100644
> > index 000000000000..03137416857b
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> > @@ -0,0 +1,32 @@
> > +#
> > +# Copyright (C) 2018 MediaTek Inc.
> > +#
> > +# This program is free software: you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License version 2 as
> > +# published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > +# GNU General Public License for more details.
> > +#
> > +$(info $(srctree))
> > +ccflags-y += -I$(srctree)/drivers/media/platform/mtk-mdp3
> > +
> > +obj-y += mtk_dip-sys.o
> > +
> > +# To provide alloc context managing memory shared
> > +# between CPU and ISP coprocessor
> > +mtk_dip_smem-objs := \
> > +mtk_dip-smem.o
> > +
> > +obj-y += mtk_dip_smem.o
> > +
> > +# Utilits to provide frame-based streaming model
> 
> typo? should be Utilities.
> 

I will correct it in the next patch.

> > +# with v4l2 user interfaces
> > +mtk_dip_util-objs := \
> > +mtk_dip-dev.o \
> > +mtk_dip-v4l2.o \
> > +mtk_dip-ctrl.o \
> > +
> > +obj-y += mtk_dip_util.o
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c
> > new file mode 100644
> > index 000000000000..e35574818120
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-ctrl.c
> > @@ -0,0 +1,124 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Frederic Chen <frederic.chen@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include "mtk_dip-dev.h"
> > +
> > +static void handle_buf_usage_config(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mtk_dip_video_device *node =
> > +		container_of(ctrl->handler,
> > +			     struct mtk_dip_video_device, ctrl_handler);
> > +
> > +	if (ctrl->val < MTK_DIP_V4l2_BUF_USAGE_DEFAULT ||
> > +	    ctrl->val >= MTK_DIP_V4l2_BUF_USAGE_NONE) {
> > +		pr_err("Invalid buffer usage id %d", ctrl->val);
> > +		return;
> > +	}
> > +	node->dev_q.buffer_usage = ctrl->val;
> > +}
> > +
> > +static void handle_buf_rotate_config(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mtk_dip_video_device *node =
> > +		container_of(ctrl->handler,
> > +			     struct mtk_dip_video_device, ctrl_handler);
> > +
> > +	if (ctrl->val != 0 || ctrl->val != 90 ||
> > +	    ctrl->val != 180 || ctrl->val != 270) {
> 
> Should we use "and" here instead of "or"?

Yes, it should be "and". I will fix it.

> 
> > +		pr_err("Invalid buffer rotation %d", ctrl->val);
> > +		return;
> > +	}
> > +	node->dev_q.rotation = ctrl->val;
> > +}
> > +
> > +static int mtk_dip_video_device_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_PRIVATE_SET_BUFFER_USAGE:
> > +		handle_buf_usage_config(ctrl);
> > +		break;
> > +	case V4L2_CID_ROTATE:
> > +		handle_buf_rotate_config(ctrl);
> > +		break;
> > +	default:
> > +			break;
> 
> redundant indentation?
> 

I will correct it.

> > +	}
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mtk_dip_video_device_ctrl_ops = {
> > +	.s_ctrl = mtk_dip_video_device_s_ctrl,
> > +};
> > +
> > +static const struct v4l2_ctrl_config mtk_dip_buf_usage_config = {
> > +	.ops	= &mtk_dip_video_device_ctrl_ops,
> > +	.id	= V4L2_CID_PRIVATE_SET_BUFFER_USAGE,
> > +	.name	= "MTK ISP SET BUFFER USAGE",
> > +	.type	= V4L2_CTRL_TYPE_INTEGER,
> > +	.min	= MTK_DIP_V4l2_BUF_USAGE_DEFAULT,
> > +	.max	= MTK_DIP_V4l2_BUF_USAGE_POSTPROC,
> > +	.step	= 1,
> > +	.def	= MTK_DIP_V4l2_BUF_USAGE_DEFAULT,
> > +	.flags	= V4L2_CTRL_FLAG_SLIDER | V4L2_CTRL_FLAG_EXECUTE_ON_WRITE,
> > +	};
> > +
> > +int mtk_dip_ctrl_init(struct mtk_dip_pipe *dip_pipe)
> > +{
> > +	struct v4l2_ctrl_handler *hdl = &dip_pipe->ctrl_handler;
> > +	struct mtk_dip_video_device *node;
> > +	int i;
> > +	int img_nodes_to_be_init[3] = {
> > +		MTK_DIP_VIDEO_NODE_ID_RAW_OUT,
> > +		MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE,
> > +		MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE
> > +	};
> > +
> > +	v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_DIP_MAX);
> > +
> > +	pr_debug("%s init ctrl: %p\n", __func__, hdl);
> > +
> > +	if (hdl->error) {
> > +		pr_err("Failed in v4l2_ctrl_handler_init\n");
> > +		return hdl->error;
> > +	}
> > +
> > +	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++)
> > +		v4l2_ctrl_handler_init(&dip_pipe->nodes[i].ctrl_handler,
> > +				       V4L2_CID_MTK_DIP_MAX);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(img_nodes_to_be_init); i++) {
> > +		node = &dip_pipe->nodes[img_nodes_to_be_init[i]];
> > +
> > +		if (v4l2_ctrl_new_custom(&node->ctrl_handler,
> > +					 &mtk_dip_buf_usage_config,
> > +					 NULL) == NULL)
> > +			dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +				"Node(%s) create buf_usage_config ctrl failed:(%d)",
> > +				node->desc->name,
> > +				node->ctrl_handler.error);
> > +
> > +		if (v4l2_ctrl_new_std(&dip_pipe->ctrl_handler,
> > +				      &mtk_dip_video_device_ctrl_ops,
> > +			V4L2_CID_ROTATE, 0, 270, 90, 0)	== NULL)
> > +			dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +				"Node(%s) create rotate ctrl failed:(%d)",
> > +				node->desc->name, node->ctrl_handler.error);
> > +	}
> > +
> > +return 0;
> 
> missing indentation?
> 

I will correct it.

> > +}
> > +EXPORT_SYMBOL_GPL(mtk_dip_ctrl_init);
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> > new file mode 100644
> > index 000000000000..9f450dae2820
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> > @@ -0,0 +1,1116 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Frederic Chen <frederic.chen@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <linux/dma-mapping.h>
> > +#include <media/v4l2-event.h>
> > +#include "mtk_dip-dev.h"
> > +#include "mtk_dip-smem.h"
> > +#include "mtk-mdp3-regs.h"
> > +#include "mtk-img-ipi.h"
> > +
> > +int mtk_dip_pipe_init(struct mtk_dip_pipe *dip_pipe,
> > +		      struct mtk_dip_dev *dip_dev,
> > +		      struct mtk_dip_pipe_desc *setting,
> > +		      struct media_device *media_dev,
> > +		      struct v4l2_device *v4l2_dev,
> > +		      struct mtk_dip_smem_dev *smem_alloc_dev)
> > +{
> > +	int ret, i;
> > +
> > +	dip_pipe->dip_dev = dip_dev;
> > +	dip_pipe->desc = setting;
> > +	dip_pipe->smem_alloc_dev = smem_alloc_dev;
> > +
> > +	atomic_set(&dip_pipe->pipe_job_sequence, 0);
> > +	spin_lock_init(&dip_pipe->job_lock);
> > +	mutex_init(&dip_pipe->lock);
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev, "init pipe(%s,%d)\n",
> > +		dip_pipe->desc->name,
> > +		dip_pipe->desc->id);
> > +
> > +	dip_pipe->num_nodes = MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM;
> > +
> > +	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM; i++) {
> > +		dip_pipe->nodes[i].desc =
> > +			&dip_pipe->desc->output_queue_descs[i];
> > +		dip_pipe->nodes[i].immutable = 0;
> > +		dip_pipe->nodes[i].enabled =
> > +			dip_pipe->nodes[i].desc->default_enable;
> > +		atomic_set(&dip_pipe->nodes[i].sequence, 0);
> > +
> > +		dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s: init node(%s,%d)\n",
> > +			dip_pipe->desc->name,
> > +			dip_pipe->nodes[i].desc->name, i);
> > +	}
> > +
> > +	for (i = MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM;
> > +	     i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
> > +		int cap_idx = i - MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM;
> > +
> > +		dip_pipe->nodes[i].desc =
> > +			&dip_pipe->desc->capture_queue_descs[cap_idx];
> > +		dip_pipe->nodes[i].immutable = 0;
> > +		dip_pipe->nodes[i].enabled =
> > +			dip_pipe->nodes[i].desc->default_enable;
> > +		atomic_set(&dip_pipe->nodes[i].sequence, 0);
> > +
> > +		dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s: init node(%s,%d)\n",
> > +			dip_pipe->desc->name,
> > +			dip_pipe->nodes[i].desc->name, i);
> > +	}
> 
> Can we merge these two for loops and check if i < OUT_TOTAL_NUM inside the loop
> to remove some duplicate code?

Yes. I will merge them to remove duplicate code.

> 
> > +
> > +	if (dip_pipe->desc->master >= 0 &&
> > +	    dip_pipe->desc->master < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM) {
> > +		dip_pipe->nodes[dip_pipe->desc->master].immutable = 1;
> > +		dip_pipe->nodes[dip_pipe->desc->master].enabled = 1;
> > +	}
> > +
> > +	ret = mtk_dip_ctrl_init(dip_pipe);
> > +
> > +	if (ret) {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s: failed(%d) to initialize ctrls\n",
> > +			dip_pipe->desc->name, ret);
> > +		goto failed_ctrl;
> > +	}
> > +
> > +	ret = mtk_dip_pipe_v4l2_register(dip_pipe, media_dev, v4l2_dev);
> > +
> > +	if (ret) {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s: failed(%d) to create V4L2 devices\n",
> > +			dip_pipe->desc->name, ret);
> > +		goto failed_pipe;
> > +	}
> > +
> > +	return 0;
> > +
> > +failed_ctrl:
> > +failed_pipe:
> > +	mutex_destroy(&dip_pipe->lock);
> > +	return ret;
> > +}
> > +
> > +static int mtk_dip_pipe_next_job_id(struct mtk_dip_pipe *dip_pipe)
> > +{
> > +	int global_job_id =
> > +		atomic_inc_return(&dip_pipe->pipe_job_sequence);
> > +
> > +	global_job_id =
> > +		(global_job_id & 0x0000FFFF) |
> > +		(dip_pipe->desc->id << 16);
> > +
> > +	return global_job_id;
> > +}
> > +
> > +int mtk_dip_pipe_init_job_infos(struct mtk_dip_pipe *dip_pipe)
> > +{
> > +	int i;
> > +
> > +	spin_lock(&dip_pipe->job_lock);
> > +
> > +	dip_pipe->num_pipe_job_infos = ARRAY_SIZE(dip_pipe->pipe_job_infos);
> > +	INIT_LIST_HEAD(&dip_pipe->pipe_job_running_list);
> > +	INIT_LIST_HEAD(&dip_pipe->pipe_job_free_list);
> > +
> > +	for (i = 0; i < dip_pipe->num_pipe_job_infos; i++) {
> > +		struct mtk_dip_pipe_job_info *pipe_job_info =
> > +			&dip_pipe->pipe_job_infos[i];
> > +		list_add_tail(&pipe_job_info->list,
> > +			      &dip_pipe->pipe_job_free_list);
> > +	}
> > +
> > +	spin_unlock(&dip_pipe->job_lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_dip_pipe_process_pipe_job_info(struct mtk_dip_pipe *dip_pipe,
> > +					      struct mtk_dip_pipe_job_info
> > +					      *pipe_job_info)
> > +{
> > +	spin_lock(&dip_pipe->job_lock);
> > +
> > +	list_del(&pipe_job_info->list);
> > +	list_add_tail(&pipe_job_info->list, &dip_pipe->pipe_job_running_list);
> > +
> > +	spin_unlock(&dip_pipe->job_lock);
> > +	return 0;
> > +}
> > +
> > +struct mtk_dip_pipe_job_info *
> > +mtk_dip_pipe_get_running_job_info(struct mtk_dip_pipe *dip_pipe,
> > +				  int pipe_job_id)
> > +{
> > +	struct mtk_dip_pipe_job_info *pipe_job_info = NULL;
> > +
> > +	spin_lock(&dip_pipe->job_lock);
> > +
> > +	list_for_each_entry(pipe_job_info,
> > +			    &dip_pipe->pipe_job_running_list, list) {
> > +		if (pipe_job_info->id == pipe_job_id) {
> > +			spin_unlock(&dip_pipe->job_lock);
> > +			return pipe_job_info;
> > +		}
> > +	}
> > +
> > +	spin_unlock(&dip_pipe->job_lock);
> > +
> > +	return NULL;
> > +}
> > +
> > +static int
> > +mtk_dip_pipe_free_job_info(struct mtk_dip_pipe *dip_pipe,
> > +			   struct mtk_dip_pipe_job_info *pipe_job_info)
> > +{
> > +	spin_lock(&dip_pipe->job_lock);
> > +
> > +	list_del(&pipe_job_info->list);
> > +	list_add_tail(&pipe_job_info->list, &dip_pipe->pipe_job_free_list);
> > +
> > +	spin_unlock(&dip_pipe->job_lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct mtk_dip_pipe_job_info *
> > +mtk_dip_pipe_get_free_job_info(struct mtk_dip_pipe *dip_pipe)
> > +{
> > +	struct mtk_dip_pipe_job_info *pipe_job_info = NULL;
> > +
> > +	spin_lock(&dip_pipe->job_lock);
> > +	list_for_each_entry(pipe_job_info,
> > +			    &dip_pipe->pipe_job_free_list, list) {
> > +		dev_dbg(&dip_pipe->dip_dev->pdev->dev, "Found free pipe job\n");
> > +		spin_unlock(&dip_pipe->job_lock);
> > +		return pipe_job_info;
> > +	}
> > +	spin_unlock(&dip_pipe->job_lock);
> > +
> > +	dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s: can't found free pipe job\n",
> > +		dip_pipe->desc->name);
> > +
> > +	return NULL;
> > +}
> > +
> > +static void
> > +mtk_dip_pipe_update_job_info(struct mtk_dip_pipe *dip_pipe,
> > +			     struct mtk_dip_pipe_job_info *pipe_job_info,
> > +			     struct mtk_dip_video_device *node,
> > +			     struct mtk_dip_dev_buffer *dev_buf)
> > +{
> > +	if (!pipe_job_info || !dev_buf || !node) {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s: update pipe-job(%p) failed, buf(%p),node(%p)\n",
> > +			dip_pipe->desc->name,
> > +			pipe_job_info, dev_buf, node);
> > +		return;
> > +	}
> > +
> > +	if (pipe_job_info->buf_map[node->desc->id])
> > +		dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s:%s: buf overwrite\n",
> > +			 dip_pipe->desc->name,
> > +			 node->desc->name);
> > +
> > +	if (node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> > +		pipe_job_info->num_img_capture_bufs++;
> > +
> > +	if (node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > +		pipe_job_info->num_img_output_bufs++;
> > +
> > +	if (node->desc->buf_type == V4L2_BUF_TYPE_META_OUTPUT)
> > +		pipe_job_info->num_meta_output_bufs++;
> > +
> > +	if (node->desc->buf_type == V4L2_BUF_TYPE_META_CAPTURE)
> > +		pipe_job_info->num_meta_capture_bufs++;
> > +
> > +	pipe_job_info->buf_map[node->desc->id] = dev_buf;
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s:%s: added buf(%p) to pipe-job(%p)\n",
> > +		dip_pipe->desc->name, node->desc->name, dev_buf,
> > +		pipe_job_info);
> > +}
> > +
> > +static void mtk_dip_pipe_debug_job(struct mtk_dip_pipe *dip_pipe,
> > +				   struct mtk_dip_pipe_job_info *pipe_job_info)
> > +{
> > +	int i;
> > +
> > +	if (!dip_pipe || !pipe_job_info)
> > +		return;
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s: pipe-job(%p),id(%d),req(%p)buf nums(%d,%d,%d,%d)\n",
> > +		dip_pipe->desc->name,
> > +		pipe_job_info,
> > +		pipe_job_info->id,
> > +		pipe_job_info->req,
> > +		pipe_job_info->num_img_capture_bufs,
> > +		pipe_job_info->num_img_output_bufs,
> > +		pipe_job_info->num_meta_capture_bufs,
> > +		pipe_job_info->num_meta_output_bufs);
> > +
> > +	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM ; i++) {
> > +		if (pipe_job_info->buf_map[i])
> > +			dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +				"Node(%s,%d), buf(%p)\n",
> > +				dip_pipe->nodes[i].desc->name, i,
> > +				pipe_job_info->buf_map[i]);
> > +	}
> > +}
> > +
> > +int mtk_dip_pipe_job_finish(struct mtk_dip_pipe *dip_pipe,
> > +			    unsigned int pipe_job_info_id,
> > +			    enum vb2_buffer_state vbf_state)
> > +{
> > +	int i;
> > +	struct mtk_dip_pipe_job_info *job_info = NULL;
> > +	const int pipe_id =
> > +		mtk_dip_pipe_get_pipe_from_job_id(pipe_job_info_id);
> > +	u64 timestamp = 0;
> > +
> > +	if (!dip_pipe)
> > +		pr_err("%s: pipe-job id(%d) release failed, dip_pipe is null\n",
> > +		       __func__, pipe_job_info_id);
> > +
> > +	job_info = mtk_dip_pipe_get_running_job_info(dip_pipe,
> > +						     pipe_job_info_id);
> > +
> > +	if (!job_info) {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s:%s: can't find pipe-job id(%d)\n",
> > +			__func__, dip_pipe->desc->name, pipe_id);
> > +		return -EINVAL;
> > +	}
> > +
> > +	timestamp = ktime_get_ns();
> > +
> > +	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
> > +		struct mtk_dip_dev_buffer *dev_buf = job_info->buf_map[i];
> > +
> > +		if (!dev_buf) {
> > +			continue;
> > +		} else {
> > +			dev_buf->vbb.vb2_buf.timestamp = ktime_get_ns();
> > +			mtk_dip_v4l2_buffer_done(&dev_buf->vbb.vb2_buf,
> > +						 vbf_state);
> > +		}
> > +	}
> > +
> > +	mtk_dip_pipe_free_job_info(dip_pipe, job_info);
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s:%s: finish pipe-job, id(%d), vb state(%d)\n",
> > +		__func__, dip_pipe->desc->name, pipe_id,
> > +		pipe_job_info_id, vbf_state);
> 
> The format string does not match the arguments. There are two ids in the
> arguments but only one %d for them.
> 

I will fix it by removing the pipe_id as following:

	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
		"%s:%s: finish pipe-job, id(%d), vb state(%d)\n",
		__func__, dip_pipe->desc->name, pipe_job_info_id,
		vbf_state);

> > +
> > +	return 0;
> > +}
> > +
> > +static void mtk_dip_dev_buf_fill_info(struct mtk_dip_pipe *dip_pipe,
> > +				      struct mtk_dip_dev_buffer *dev_buf)
> > +{
> > +	struct vb2_v4l2_buffer *b;
> > +	struct mtk_dip_video_device *node;
> > +	struct mtk_dip_video_device_desc *desc;
> > +
> > +	b = &dev_buf->vbb;
> > +	node = mtk_dip_vbq_to_node(b->vb2_buf.vb2_queue);
> > +	desc = node->desc;
> > +	dev_buf->fmt = node->vdev_fmt;
> > +	dev_buf->dev_fmt = node->dev_q.dev_fmt;
> > +	dev_buf->isp_daddr =
> > +		vb2_dma_contig_plane_dma_addr(&b->vb2_buf, 0);
> > +	dev_buf->vaddr = vb2_plane_vaddr(&b->vb2_buf, 0);
> > +	dev_buf->buffer_usage = node->dev_q.buffer_usage;
> > +	dev_buf->rotation = node->dev_q.rotation;
> > +
> > +	if (desc->smem_alloc) {
> > +		dev_buf->scp_daddr =
> > +			mtk_dip_smem_iova_to_phys
> > +			(dip_pipe->smem_alloc_dev,
> > +			 dev_buf->isp_daddr);
> > +	} else {
> > +		dev_buf->scp_daddr = 0;
> > +	}
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s:%s: buf type(%d), idx(%d), mem(%d), isp_daddr(%p), scp_daddr(%p)\n",
> > +		dip_pipe->desc->name,
> > +		desc->name,
> > +		b->vb2_buf.type,
> > +		b->vb2_buf.index,
> > +		b->vb2_buf.memory,
> > +		dev_buf->isp_daddr,
> > +		dev_buf->scp_daddr);
> > +}
> > +
> > +int mtk_dip_pipe_queue_buffers(struct media_request *req,
> > +			       int initial)
> > +{
> > +	struct media_request_object *obj;
> > +	struct mtk_dip_pipe *dip_pipe;
> > +	struct mtk_dip_pipe_job_info *pipe_job_info = NULL;
> > +	int ret = 0;
> > +
> > +	list_for_each_entry(obj, &req->objects, list) {
> > +		struct vb2_buffer *vb;
> > +
> > +		if (vb2_request_object_is_buffer(obj)) {
> > +			struct mtk_dip_dev_buffer *buf;
> > +			struct mtk_dip_dev_buffer *dev_buf;
> > +			struct mtk_dip_video_device *node;
> > +
> > +			vb = container_of(obj, struct vb2_buffer, req_obj);
> > +			node = mtk_dip_vbq_to_node(vb->vb2_queue);
> > +			dip_pipe = vb2_get_drv_priv(vb->vb2_queue);
> > +			dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
> > +			buf = dev_buf;
> > +
> > +			if (!pipe_job_info) {
> > +				pipe_job_info = mtk_dip_pipe_get_free_job_info
> > +					(dip_pipe);
> > +
> > +				if (!pipe_job_info)
> > +					goto FAILE_JOB_NOT_TRIGGER;
> > +
> > +				memset(pipe_job_info->buf_map, 0,
> > +				       sizeof(pipe_job_info->buf_map));
> > +				pipe_job_info->num_img_capture_bufs = 0;
> > +				pipe_job_info->num_img_output_bufs = 0;
> > +				pipe_job_info->num_meta_capture_bufs = 0;
> > +				pipe_job_info->num_meta_output_bufs = 0;
> > +			}
> > +
> > +			mtk_dip_dev_buf_fill_info(dip_pipe,
> > +						  buf);
> > +
> > +			mtk_dip_pipe_update_job_info(dip_pipe,
> > +						     pipe_job_info,
> > +						     node,
> > +						     buf);
> > +		}
> > +	}
> > +
> > +	if (!pipe_job_info)
> > +		return -EINVAL;
> > +
> > +	pipe_job_info->id =
> > +		mtk_dip_pipe_next_job_id(dip_pipe);
> > +
> > +	mtk_dip_pipe_debug_job(dip_pipe, pipe_job_info);
> > +
> > +	mutex_lock(&dip_pipe->lock);
> > +
> > +	if (!dip_pipe->streaming) {
> > +		dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s:%s:  stream is off, no hw enqueue triggered\n",
> > +			__func__, dip_pipe->desc->name);
> > +		mutex_unlock(&dip_pipe->lock);
> > +		return 0;
> > +	}
> > +
> > +	if (mtk_dip_pipe_process_pipe_job_info(dip_pipe, pipe_job_info)) {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s:%s: can't start to run pipe job id(%d)\n",
> > +			__func__, dip_pipe->desc->name,
> > +			pipe_job_info->id);
> > +		mutex_unlock(&dip_pipe->lock);
> > +		goto FAILE_JOB_NOT_TRIGGER;
> > +	}
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s: trigger pipe job, id(%d)\n",
> > +		dip_pipe->desc->name,
> > +		dip_pipe->desc->id);
> > +
> > +	if (mtk_dip_pipe_job_start(dip_pipe, pipe_job_info)) {
> > +		mutex_unlock(&dip_pipe->lock);
> > +		goto FAILE_JOB_NOT_TRIGGER;
> > +	}
> > +
> > +	mutex_unlock(&dip_pipe->lock);
> > +
> > +	return 0;
> > +
> > +FAILE_JOB_NOT_TRIGGER:
> 
> The label should be snake_case. Is "FAILE" a typo of "FAILED"?

Yes. I will correct it.

> 
> > +	if (initial)
> > +		return ret;
> > +
> > +	mtk_dip_pipe_job_finish(dip_pipe, pipe_job_info->id,
> > +				VB2_BUF_STATE_ERROR);
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +int mtk_dip_pipe_release(struct mtk_dip_pipe *dip_pipe)
> > +{
> > +	mtk_dip_pipe_v4l2_unregister(dip_pipe);
> > +	v4l2_ctrl_handler_free(&dip_pipe->ctrl_handler);
> > +	mutex_destroy(&dip_pipe->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static void set_img_fmt(struct v4l2_pix_format_mplane *mfmt_to_fill,
> > +			struct mtk_dip_dev_format *dev_fmt)
> > +{
> > +	int i;
> > +
> > +	mfmt_to_fill->pixelformat = dev_fmt->fmt.img.pixelformat;
> > +	mfmt_to_fill->num_planes = dev_fmt->fmt.img.num_planes;
> > +	mfmt_to_fill->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > +	mfmt_to_fill->quantization = V4L2_QUANTIZATION_DEFAULT;
> > +	mfmt_to_fill->colorspace = dev_fmt->fmt.img.colorspace;
> > +
> > +	memset(mfmt_to_fill->reserved, 0, sizeof(mfmt_to_fill->reserved));
> > +
> > +	pr_debug("%s: Fmt(%d),w(%d),h(%d),f(%d)\n",
> > +		 __func__,
> > +		 mfmt_to_fill->pixelformat,
> > +		 mfmt_to_fill->width,
> > +		 mfmt_to_fill->height,
> > +		 mfmt_to_fill->field);
> > +
> > +	for (i = 0 ; i < mfmt_to_fill->num_planes; ++i) {
> 
> Please remove the space after "i = 0".

I got it.

> 
> > +		int bpl = (mfmt_to_fill->width *
> > +			dev_fmt->fmt.img.row_depth[i]) / 8;
> > +		int sizeimage = (mfmt_to_fill->width * mfmt_to_fill->height *
> > +			dev_fmt->fmt.img.depth[i]) / 8;
> > +
> > +		mfmt_to_fill->plane_fmt[i].bytesperline = bpl;
> > +		mfmt_to_fill->plane_fmt[i].sizeimage = sizeimage;
> > +		memset(mfmt_to_fill->plane_fmt[i].reserved,
> > +		       0, sizeof(mfmt_to_fill->plane_fmt[i].reserved));
> > +
> > +		pr_debug("plane(%d):bpl(%d),sizeimage(%u)\n",
> > +			 i, bpl,
> > +			 mfmt_to_fill->plane_fmt[i].sizeimage);
> > +	}
> > +}
> > +
> > +static void set_meta_fmt(struct v4l2_meta_format *metafmt_to_fill,
> > +			 struct mtk_dip_dev_format *dev_fmt)
> > +{
> > +	metafmt_to_fill->dataformat = dev_fmt->fmt.meta.dataformat;
> > +
> > +	if (dev_fmt->fmt.meta.max_buffer_size <= 0) {
> > +		pr_debug("Invalid meta buf size(%u), use default(%u)\n",
> > +			 dev_fmt->fmt.meta.max_buffer_size,
> > +			 MTK_DIP_DEV_META_BUF_DEFAULT_SIZE);
> > +		metafmt_to_fill->buffersize = MTK_DIP_DEV_META_BUF_DEFAULT_SIZE;
> > +	} else {
> > +		pr_debug("Use meta size(%u)\n",
> > +			 dev_fmt->fmt.meta.max_buffer_size);
> > +		metafmt_to_fill->buffersize = dev_fmt->fmt.meta.max_buffer_size;
> > +	}
> > +}
> > +
> > +void mtk_dip_pipe_load_default_fmt(struct mtk_dip_pipe *dip_pipe,
> > +				   struct mtk_dip_video_device *node,
> > +				   struct v4l2_format *fmt_to_fill)
> > +{
> > +	struct mtk_dip_dev_format *dev_fmt;
> > +	struct mtk_dip_video_device_desc *desc = node->desc;
> > +
> > +	if (desc->num_fmts == 0) {
> > +		pr_err("%s:%s: desc->num_fmts is 0, no format support list\n",
> > +		       __func__, desc->name);
> > +		return;
> > +	}
> > +
> > +	if (desc->default_fmt_idx >= desc->num_fmts) {
> > +		pr_debug("%s:%s: invalid idx(%d), must < num_fmts(%d)\n",
> > +			 __func__, desc->name, desc->default_fmt_idx,
> > +			desc->num_fmts);
> > +		desc->default_fmt_idx = 0;
> > +	}
> > +
> > +	dev_fmt	= &desc->fmts[desc->default_fmt_idx];
> > +	fmt_to_fill->type = desc->buf_type;
> > +	if (mtk_dip_buf_is_meta(desc->buf_type)) {
> > +		set_meta_fmt(&fmt_to_fill->fmt.meta, dev_fmt);
> > +	} else {
> > +		fmt_to_fill->fmt.pix_mp.width = desc->default_width;
> > +		fmt_to_fill->fmt.pix_mp.height = desc->default_height;
> > +		fmt_to_fill->fmt.pix_mp.field = V4L2_FIELD_NONE;
> > +
> > +		set_img_fmt(&fmt_to_fill->fmt.pix_mp, dev_fmt);
> > +	}
> > +}
> > +
> > +struct mtk_dip_dev_format *
> > +mtk_dip_pipe_find_fmt(struct mtk_dip_pipe *dip_pipe,
> > +		      struct mtk_dip_video_device *node,
> > +		      u32 format)
> > +{
> > +	int i;
> > +	struct mtk_dip_dev_format *dev_fmt;
> > +
> > +	struct mtk_dip_video_device_desc *desc = node->desc;
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev, "fmt to find(%x)\n", format);
> > +
> > +	for (i = 0; i < desc->num_fmts; i++) {
> > +		dev_fmt = &desc->fmts[i];
> > +		if (!mtk_dip_buf_is_meta(desc->buf_type)) {
> > +			if (dev_fmt->fmt.img.pixelformat == format)
> > +				return dev_fmt;
> > +		} else {
> > +			if (dev_fmt->fmt.meta.dataformat == format)
> > +				return dev_fmt;
> > +		}
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +int mtk_dip_pipe_set_meta_fmt(struct mtk_dip_pipe *dip_pipe,
> > +			      struct mtk_dip_video_device *node,
> > +			      struct v4l2_meta_format *user_fmt,
> > +			      struct v4l2_meta_format *node_fmt)
> > +{
> > +	struct mtk_dip_dev_format *dev_fmt;
> > +
> > +	if (!user_fmt || !node_fmt)
> > +		return -EINVAL;
> > +
> > +	dev_fmt = mtk_dip_pipe_find_fmt(dip_pipe, node,
> > +					user_fmt->dataformat);
> > +
> > +	if (!dev_fmt)
> > +		return -EINVAL;
> > +
> > +	node->dev_q.dev_fmt = dev_fmt;
> > +	set_meta_fmt(node_fmt, dev_fmt);
> > +	*user_fmt = *node_fmt;
> > +
> > +	return 0;
> > +}
> > +
> > +int mtk_dip_pipe_set_img_fmt(struct mtk_dip_pipe *dip_pipe,
> > +			     struct mtk_dip_video_device *node,
> > +			     struct v4l2_pix_format_mplane *user_fmt,
> > +			     struct v4l2_pix_format_mplane *dest_fmt)
> > +{
> > +	struct mtk_dip_dev_format *dev_fmt;
> > +
> > +	if (!user_fmt || !dest_fmt)
> > +		return -EINVAL;
> > +
> > +	dev_fmt = mtk_dip_pipe_find_fmt(dip_pipe, node,
> > +					user_fmt->pixelformat);
> > +
> > +	if (!dev_fmt) {
> > +		pr_debug("%s:%s:%s: dev_fmt(%d) not found\n",
> > +			 __func__, dip_pipe->desc->name,
> > +			 node->desc->name, user_fmt->pixelformat);
> > +		return -EINVAL;
> > +	}
> > +
> > +	node->dev_q.dev_fmt = dev_fmt;
> > +	dest_fmt->width = user_fmt->width;
> > +	dest_fmt->height = user_fmt->height;
> > +	dest_fmt->field = V4L2_FIELD_NONE;
> > +
> > +	set_img_fmt(dest_fmt, dev_fmt);
> > +
> > +	return 0;
> > +}
> > +
> > +int mtk_dip_pipe_streamon(struct mtk_dip_pipe *dip_pipe)
> > +{
> > +	int ret;
> > +	struct mtk_dip_dev *dip_dev;
> > +
> > +	if (!dip_pipe)
> > +		return -EINVAL;
> > +
> > +	dip_dev = dev_get_drvdata(&dip_pipe->dip_dev->pdev->dev);
> > +
> > +	mutex_lock(&dip_pipe->lock);
> > +
> > +	ret = mtk_dip_hw_streamon(&dip_dev->dip_hw,
> > +				  dip_pipe->desc->id);
> > +
> > +	if (ret) {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s:%s:%d: failed to start hw\n",
> > +			__func__, dip_pipe->desc->name,
> > +			dip_pipe->desc->id);
> > +		mutex_unlock(&dip_pipe->lock);
> > +		return -EBUSY;
> > +	}
> > +
> > +	dip_pipe->streaming = 1;
> > +	mutex_unlock(&dip_pipe->lock);
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s:%s:%d: start hw\n",
> > +		__func__, dip_pipe->desc->name,
> > +		dip_pipe->desc->id);
> > +
> > +	return ret;
> > +}
> > +
> > +int mtk_dip_pipe_streamoff(struct mtk_dip_pipe *dip_pipe)
> > +{
> > +	int ret;
> > +	struct mtk_dip_dev *dip_dev;
> > +
> > +	if (!dip_pipe)
> > +		return -EINVAL;
> > +
> > +	dip_dev = dev_get_drvdata(&dip_pipe->dip_dev->pdev->dev);
> > +
> > +	mutex_lock(&dip_pipe->lock);
> > +
> > +	ret = mtk_dip_hw_streamoff(&dip_dev->dip_hw,
> > +				   dip_pipe->desc->id);
> > +
> > +	if (ret) {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s:%s:%d: failed to stop hw\n",
> > +			__func__, dip_pipe->desc->name,
> > +			dip_pipe->desc->id);
> > +		mutex_unlock(&dip_pipe->lock);
> > +		return -EBUSY;
> > +	}
> > +
> > +	dip_pipe->streaming = 0;
> > +	mutex_unlock(&dip_pipe->lock);
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s:%s:%d: stop hw\n",
> > +		__func__, dip_pipe->desc->name,
> > +		dip_pipe->desc->id);
> > +
> > +	return 0;
> > +}
> > +
> > +static enum mdp_ycbcr_profile
> > +map_ycbcr_prof_mplane(struct v4l2_pix_format_mplane *pix_mp,
> > +		      u32 mdp_color)
> > +{
> > +	if (MDP_COLOR_IS_RGB(mdp_color))
> > +		return MDP_YCBCR_PROFILE_FULL_BT601;
> > +
> > +	switch (pix_mp->colorspace) {
> > +	case V4L2_COLORSPACE_JPEG:
> > +		return MDP_YCBCR_PROFILE_JPEG;
> > +	case V4L2_COLORSPACE_REC709:
> > +	case V4L2_COLORSPACE_DCI_P3:
> > +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +			return MDP_YCBCR_PROFILE_FULL_BT709;
> > +		return MDP_YCBCR_PROFILE_BT709;
> > +	case V4L2_COLORSPACE_BT2020:
> > +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +			return MDP_YCBCR_PROFILE_FULL_BT2020;
> > +		return MDP_YCBCR_PROFILE_BT2020;
> > +	}
> > +	/* V4L2_COLORSPACE_SRGB or else */
> > +	if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> > +		return MDP_YCBCR_PROFILE_FULL_BT601;
> > +	return MDP_YCBCR_PROFILE_BT601;
> > +}
> > +
> > +/* Stride that is accepted by MDP HW */
> > +static u32 dip_mdp_fmt_get_stride(const struct mtk_dip_dev_mdp_format *fmt,
> > +				  u32 bytesperline,
> > +				  unsigned int plane)
> > +{
> > +	enum mdp_color c = fmt->mdp_color;
> > +	u32 stride;
> > +
> > +	stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
> > +		/ fmt->row_depth[0];
> > +	if (plane == 0)
> > +		return stride;
> > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> > +			stride = stride / 2;
> > +		return stride;
> > +	}
> > +	return 0;
> > +}
> > +
> > +/* Stride that is accepted by MDP HW of format with contiguous planes */
> > +static u32
> > +dip_mdp_fmt_get_stride_contig(const struct mtk_dip_dev_mdp_format *fmt,
> > +			      u32 pix_stride,
> > +			      unsigned int plane)
> > +{
> > +	enum mdp_color c = fmt->mdp_color;
> > +	u32 stride = pix_stride;
> > +
> > +	if (plane == 0)
> > +		return stride;
> > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > +		stride = stride >> MDP_COLOR_GET_H_SUBSAMPLE(c);
> > +		if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
> > +			stride = stride * 2;
> > +		return stride;
> > +	}
> > +	return 0;
> > +}
> > +
> > +/* Plane size that is accepted by MDP HW */
> > +static u32
> > +dip_mdp_fmt_get_plane_size(const struct mtk_dip_dev_mdp_format *fmt,
> > +			   u32 stride, u32 height,
> > +			   unsigned int plane)
> > +{
> > +	enum mdp_color c = fmt->mdp_color;
> > +	u32 bytesperline;
> > +
> > +	bytesperline = (stride * fmt->row_depth[0])
> > +		/ MDP_COLOR_BITS_PER_PIXEL(c);
> > +	if (plane == 0)
> > +		return bytesperline * height;
> > +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > +		height = height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> > +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> > +			bytesperline = bytesperline * 2;
> > +		return bytesperline * height;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int is_contig_mp_buffer(struct mtk_dip_dev_buffer *dev_buf)
> > +{
> > +	if (MDP_COLOR_GET_PLANE_COUNT(dev_buf->dev_fmt->fmt.img.mdp_color)
> > +	    == 1)
> > +		return 0;
> > +	else
> > +		return 1;
> > +}
> > +
> > +static int fill_ipi_img_param_mp(struct mtk_dip_pipe *dip_pipe,
> > +				 struct img_image_buffer *b,
> > +				 struct mtk_dip_dev_buffer *dev_buf,
> > +				 char *buf_name)
> > +{
> > +	struct v4l2_pix_format_mplane *pix_mp;
> > +	struct mtk_dip_dev_mdp_format *mdp_fmt;
> > +	unsigned int i;
> > +	unsigned int total_plane_size = 0;
> > +
> > +	if (!dev_buf || !dev_buf->dev_fmt) {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s: %s's dev format not set\n",
> > +			__func__, buf_name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	pix_mp = &dev_buf->fmt.fmt.pix_mp;
> > +	mdp_fmt = &dev_buf->dev_fmt->fmt.img;
> > +
> > +	b->format.colorformat = dev_buf->dev_fmt->fmt.img.mdp_color;
> > +	b->format.width = dev_buf->fmt.fmt.pix_mp.width;
> > +	b->format.height = dev_buf->fmt.fmt.pix_mp.height;
> > +	b->format.ycbcr_prof =
> > +		map_ycbcr_prof_mplane(pix_mp,
> > +				      dev_buf->dev_fmt->fmt.img.mdp_color);
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s: buf(%s), IPI: w(%d),h(%d),c(0x%x)\n",
> > +		dip_pipe->desc->name,
> > +		buf_name,
> > +		b->format.width,
> > +		b->format.height,
> > +		b->format.colorformat);
> > +
> > +	for (i = 0; i < pix_mp->num_planes; ++i) {
> > +		u32 stride =
> > +			dip_mdp_fmt_get_stride
> > +			(mdp_fmt, pix_mp->plane_fmt[i].bytesperline, i);
> > +
> > +		b->format.plane_fmt[i].stride = stride;
> > +		b->format.plane_fmt[i].size =
> > +			dip_mdp_fmt_get_plane_size(mdp_fmt,
> > +						   stride,
> > +						   pix_mp->height, i);
> > +		b->iova[i] = dev_buf->isp_daddr;
> > +		dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +			"Contiguous-mp-buf:plane(%i),stride(%d),size(%d),iova(%p)",
> > +			i,
> > +			b->format.plane_fmt[i].stride,
> > +			b->format.plane_fmt[i].size,
> > +			b->iova[i]);
> 
> iova is an u32, so should we use %x instead of %llx here?

Yes. I will use %llx here.

> 
> > +		total_plane_size = b->format.plane_fmt[i].size;
> > +	}
> > +
> > +	for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
> > +		u32 stride =
> > +			dip_mdp_fmt_get_stride_contig
> > +			(mdp_fmt, b->format.plane_fmt[0].stride, i);
> > +
> > +		b->format.plane_fmt[i].stride = stride;
> > +		b->format.plane_fmt[i].size =
> > +			dip_mdp_fmt_get_plane_size(mdp_fmt, stride,
> > +						   pix_mp->height, i);
> > +		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
> > +		dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +			"Contiguous-mp-buf:plane(%i),stride(%d),size(%d),iova(%p)",
> > +			i,
> > +			b->format.plane_fmt[i].stride,
> > +			b->format.plane_fmt[i].size,
> > +			b->iova[i]);
> 
> iova is an u32, so should we use %x instead of %llx here?
> 

Yes. I will use %llx here.


> > +		total_plane_size += b->format.plane_fmt[i].size;
> > +	}
> > +
> > +	b->usage = dev_buf->buffer_usage;
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"Contiguous-mp-buf(%s),v4l2-sizeimage(%d),total-plane-size(%d)\n",
> > +		buf_name,
> > +		pix_mp->plane_fmt[0].sizeimage,
> > +		total_plane_size);
> > +
> > +	return 0;
> > +}
> > +
> > +static int fill_ipi_img_param(struct mtk_dip_pipe *dip_pipe,
> > +			      struct img_image_buffer *img,
> > +			      struct mtk_dip_dev_buffer *dev_buf,
> > +			      char *buf_name)
> > +{
> > +	img->format.width = dev_buf->fmt.fmt.pix_mp.width;
> > +	img->format.height = dev_buf->fmt.fmt.pix_mp.height;
> > +
> > +	if (dev_buf && dev_buf->dev_fmt) {
> > +		img->format.colorformat =
> > +			dev_buf->dev_fmt->fmt.img.mdp_color;
> > +	} else {
> > +		dev_err(&dip_pipe->dip_dev->pdev->dev,
> > +			"%s: %s's dev format not set\n",
> > +			__func__, buf_name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s: buf(%s) IPI: w(%d),h(%d),c(0x%x)\n",
> > +		dip_pipe->desc->name,
> > +		buf_name,
> > +		img->format.width,
> > +		img->format.height,
> > +		img->format.colorformat);
> > +
> > +	img->format.plane_fmt[0].size =
> > +		dev_buf->fmt.fmt.pix_mp.plane_fmt[0].sizeimage;
> > +	img->format.plane_fmt[0].stride =
> > +		dev_buf->fmt.fmt.pix_mp.plane_fmt[0].bytesperline;
> > +	img->iova[0] = dev_buf->isp_daddr;
> > +	img->usage = dev_buf->buffer_usage;
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"size(%d), stride(%d),ycbcr(%d),iova(%p),u(%d)\n",
> > +		img->format.plane_fmt[0].size,
> > +		img->format.plane_fmt[0].stride,
> > +		img->format.ycbcr_prof,
> > +		img->iova[0],
> > +		img->usage);
> > +
> > +	return 0;
> > +}
> > +
> > +static int fill_input_ipi_param(struct mtk_dip_pipe *dip_pipe,
> > +				struct img_input *iin,
> > +				struct mtk_dip_dev_buffer *dev_buf,
> > +				char *buf_name)
> > +{
> > +	struct img_image_buffer *img = &iin->buffer;
> > +
> > +	/* Will map the vale with V4L2 color space in the future */
> 
> typo? vale => value
> 

I will fix it.

> > +	img->format.ycbcr_prof = 1;
> > +	if (is_contig_mp_buffer(dev_buf))
> > +		return fill_ipi_img_param_mp(dip_pipe, img, dev_buf,
> > +					     buf_name);
> > +	else
> > +		return fill_ipi_img_param(dip_pipe, img, dev_buf,
> > +					  buf_name);
> > +}
> > +
> > +static int fill_output_ipi_param(struct mtk_dip_pipe *dip_pipe,
> > +				 struct img_output *iout,
> > +				 struct mtk_dip_dev_buffer *dev_buf_out,
> > +				 struct mtk_dip_dev_buffer *dev_buf_in,
> > +				 char *buf_name)
> > +{
> > +	int ret;
> > +	struct img_image_buffer *img = &iout->buffer;
> > +
> > +	img->format.ycbcr_prof = 0;
> > +
> > +	if (is_contig_mp_buffer(dev_buf_out))
> > +		ret = fill_ipi_img_param_mp(dip_pipe, img, dev_buf_out,
> > +					    buf_name);
> > +	else
> > +		ret = fill_ipi_img_param(dip_pipe, img, dev_buf_out,
> > +					 buf_name);
> > +
> > +	iout->crop.left = 0;
> > +	iout->crop.top = 0;
> > +	iout->crop.width = dev_buf_in->fmt.fmt.pix_mp.width;
> > +	iout->crop.height = dev_buf_in->fmt.fmt.pix_mp.height;
> > +	iout->crop.left_subpix = 0;
> > +	iout->crop.top_subpix = 0;
> > +	iout->crop.width_subpix = 0;
> > +	iout->crop.height_subpix = 0;
> > +	iout->rotation = dev_buf_out->rotation;
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"%s: buf(%s) IPI-ext:c_l(%d),c_t(%d),c_w(%d),c_h(%d)\n",
> > +		dip_pipe->desc->name,
> > +		buf_name,
> > +		iout->crop.left,
> > +		iout->crop.top,
> > +		iout->crop.width,
> > +		iout->crop.height);
> > +
> > +	dev_dbg(&dip_pipe->dip_dev->pdev->dev,
> > +		"c_ls(%d),c_ts(%d),c_ws(%d),c_hs(%d),rot(%d)\n",
> > +		iout->crop.left_subpix,
> > +		iout->crop.top_subpix,
> > +		iout->crop.width_subpix,
> > +		iout->crop.height_subpix,
> > +		iout->rotation);
> > +
> > +	return ret;
> > +}
> > +
> > +int mtk_dip_pipe_job_start(struct mtk_dip_pipe *dip_pipe,
> > +			   struct mtk_dip_pipe_job_info *pipe_job_info)
> > +{
> > +	struct platform_device *pdev = dip_pipe->dip_dev->pdev;
> > +	int ret;
> > +	int out_img_buf_idx;
> > +	struct img_ipi_frameparam dip_param;
> > +	struct mtk_dip_dev_buffer *dev_buf_in;
> > +	struct mtk_dip_dev_buffer *dev_buf_out;
> > +	struct mtk_dip_dev_buffer *dev_buf_tuning;
> > +
> > +	if (!pipe_job_info) {
> > +		dev_err(&pdev->dev,
> > +			"pipe_job_info(%p) in start can't be NULL\n",
> > +			pipe_job_info);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* We need RAW and at least MDP0 or MDP 1 buffer */
> > +	if (!pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT] ||
> > +	    (!pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE] &&
> > +		 !pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE])){
> > +		struct mtk_dip_dev_buffer **map = pipe_job_info->buf_map;
> > +
> > +		dev_dbg(&pdev->dev,
> > +			"can't trigger job: raw(%p), mdp0(%p), mdp1(%p)\n",
> > +			map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT],
> > +			map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE],
> > +			map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE]);
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(&pdev->dev,
> > +		"%s:%s: pipe-job id(%d)\n",
> > +		__func__, dip_pipe->desc->name,
> > +		pipe_job_info->id);
> > +
> > +	/* Fill ipi params for DIP driver */
> > +	memset(&dip_param, 0, sizeof(struct img_ipi_frameparam));
> > +
> > +	dip_param.index = pipe_job_info->id;
> > +	dip_param.num_outputs = pipe_job_info->num_img_capture_bufs;
> > +	dip_param.num_inputs = pipe_job_info->num_img_output_bufs;
> > +	dip_param.type = STREAM_ISP_IC;
> > +
> > +	/* Tuning buffer */
> > +	dev_buf_tuning =
> > +		pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_TUNING_OUT];
> > +	if (dev_buf_tuning) {
> > +		dev_dbg(&pdev->dev,
> > +			"Tuning buf queued: pa(%p),va(%p),iova(%p)\n",
> > +			dev_buf_tuning->scp_daddr,
> > +			dev_buf_tuning->vaddr,
> > +			dev_buf_tuning->isp_daddr);
> > +		dip_param.tuning_data.pa = (uint32_t)dev_buf_tuning->scp_daddr;
> > +		dip_param.tuning_data.va = (uint64_t)dev_buf_tuning->vaddr;
> > +		dip_param.tuning_data.iova =
> > +			(uint32_t)dev_buf_tuning->isp_daddr;
> > +	} else {
> > +		dev_dbg(&pdev->dev,
> > +			"Doesn't enqueued tuning buffer, by-pass\n");
> > +	dip_param.tuning_data.pa = 0;
> > +	dip_param.tuning_data.va = 0;
> > +	dip_param.tuning_data.iova = 0;
> > +	}
> > +
> > +	/* Raw-in buffer */
> > +	dev_buf_in =
> > +		pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT];
> > +	if (dev_buf_in) {
> > +		struct img_input *iin = &dip_param.inputs[0];
> > +
> > +		fill_input_ipi_param(dip_pipe, iin, dev_buf_in, "RAW");
> > +	}
> > +
> > +	out_img_buf_idx = 0;
> > +
> > +	/* MDP 0 buffer */
> > +	dev_buf_out =
> > +		pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE];
> > +	if (dev_buf_out) {
> > +		struct img_output *iout = &dip_param.outputs[out_img_buf_idx];
> > +
> > +		fill_output_ipi_param(dip_pipe, iout, dev_buf_out,
> > +				      dev_buf_in, "MDP0");
> > +		out_img_buf_idx++;
> > +	}
> > +
> > +	/* MDP 1 buffer */
> > +	dev_buf_out =
> > +		pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE];
> > +	if (dev_buf_out) {
> > +		struct img_output *iout = &dip_param.outputs[out_img_buf_idx];
> > +
> > +		fill_output_ipi_param(dip_pipe, iout, dev_buf_out,
> > +				      dev_buf_in, "MDP1");
> > +		out_img_buf_idx++;
> > +	}
> > +
> > +	ret = mtk_dip_hw_enqueue(&dip_pipe->dip_dev->dip_hw, &dip_param);
> > +
> > +	if (ret) {
> > +		dev_dbg(&pdev->dev,
> > +			"%s:%s: enqueue to HW failed(%d)\n",
> > +			 __func__, dip_pipe->desc->name, ret);
> > +		return -EBUSY;
> > +	}
> > +
> > +	return ret;
> > +}
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> > new file mode 100644
> > index 000000000000..f51f7a44379a
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> > @@ -0,0 +1,321 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Frederic Chen <frederic.chen@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _MTK_DIP_DEV_H_
> > +#define _MTK_DIP_DEV_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-subdev.h>
> > +#include <media/v4l2-device.h>
> > +#include <linux/videodev2.h>
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-v4l2.h>
> > +
> > +#include "mtk_dip-hw.h"
> > +#include "mtk_dip-smem.h"
> > +
> > +#define MTK_DIP_PIPE_ID_PREVIEW				0
> > +#define MTK_DIP_PIPE_ID_CAPTURE				1
> > +#define MTK_DIP_PIPE_ID_REPROCESS			2
> > +#define MTK_DIP_PIPE_ID_TOTAL_NUM			3
> > +
> > +#define MTK_DIP_VIDEO_NODE_ID_RAW_OUT			0
> > +#define MTK_DIP_VIDEO_NODE_ID_TUNING_OUT		1
> > +#define MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM		2
> > +#define MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE		2
> > +#define MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE		3
> > +#define MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM		2
> > +#define MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM \
> > +	(MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM + \
> > +	MTK_DIP_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM)
> > +
> > +#define MTK_DIP_VIDEO_NODE_ID_NO_MASTER			-1
> > +
> > +#define MTK_DIP_OUTPUT_MIN_WIDTH		2U
> > +#define MTK_DIP_OUTPUT_MIN_HEIGHT		2U
> > +#define MTK_DIP_OUTPUT_MAX_WIDTH		5376U
> > +#define MTK_DIP_OUTPUT_MAX_HEIGHT		4032U
> > +#define MTK_DIP_CAPTURE_MIN_WIDTH		2U
> > +#define MTK_DIP_CAPTURE_MIN_HEIGHT		2U
> > +#define MTK_DIP_CAPTURE_MAX_WIDTH		5376U
> > +#define MTK_DIP_CAPTURE_MAX_HEIGHT		4032U
> > +
> > +#define MTK_DIP_DEV_DIP_MEDIA_MODEL_NAME	"MTK-ISP-DIP-V4L2"
> > +#define MTK_DIP_DEV_DIP_PREVIEW_NAME \
> > +	MTK_DIP_DEV_DIP_MEDIA_MODEL_NAME
> > +#define MTK_DIP_DEV_DIP_CAPTURE_NAME		"MTK-ISP-DIP-CAP-V4L2"
> > +#define MTK_DIP_DEV_DIP_REPROCESS_NAME		"MTK-ISP-DIP-REP-V4L2"
> > +
> > +#define MTK_DIP_DEV_META_BUF_DEFAULT_SIZE (1110 * 1024)
> > +
> > +#define V4L2_CID_PRIVATE_UT_NUM			(V4L2_CID_USER_BASE | 0x1001)
> > +#define V4L2_CID_PRIVATE_SET_BUFFER_USAGE	(V4L2_CID_PRIVATE_UT_NUM + 2)
> > +#define V4L2_CID_MTK_DIP_MAX			100
> > +
> > +enum mtk_dip_v4l2_buffer_usage {
> > +	MTK_DIP_V4l2_BUF_USAGE_DEFAULT = 0,
> > +	MTK_DIP_V4l2_BUF_USAGE_FD,
> > +	MTK_DIP_V4l2_BUF_USAGE_POSTPROC,
> > +	MTK_DIP_V4l2_BUF_USAGE_NONE,
> > +};
> 
> The constants in enums should be capitalized. Could we use V4L2 instead of V4l2
> here?
> 

Yes. I will use V4L2 instead.

> > +
> > +/*
> > + * Supported format and the information used for
> > + * size calculation
> > + */
> > +struct mtk_dip_dev_meta_format {
> > +	u32 dataformat;
> > +	u32 max_buffer_size;
> > +	u8 flags;
> > +};
> > +
> > +/* MDP part private format definitation */
> > +struct mtk_dip_dev_mdp_format {
> > +	u32 pixelformat;
> > +	u32 mdp_color;
> > +	u32 colorspace;
> > +	u8 depth[VIDEO_MAX_PLANES];
> > +	u8 row_depth[VIDEO_MAX_PLANES];
> > +	u8 num_planes;
> > +	u8 walign;
> > +	u8 halign;
> > +	u8 salign;
> > +	u32 flags;
> > +};
> > +
> > +struct mtk_dip_dev_format {
> > +	union {
> > +		struct mtk_dip_dev_meta_format meta;
> > +		struct mtk_dip_dev_mdp_format img;
> > +	} fmt;
> > +};
> > +
> > +struct mtk_dip_pipe_job_info {
> > +	struct media_request *req;
> > +	int id;
> > +	struct mtk_dip_dev_buffer*
> > +		buf_map[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM];
> > +	int num_img_capture_bufs;
> > +	int num_img_output_bufs;
> > +	int num_meta_capture_bufs;
> > +	int num_meta_output_bufs;
> > +	struct list_head list;
> > +};
> > +
> > +struct mtk_dip_dev_buffer {
> > +	struct vb2_v4l2_buffer vbb;
> > +	struct v4l2_format fmt;
> > +	struct mtk_dip_dev_format *dev_fmt;
> > +	int pipe_job_id;
> > +	void *vaddr;
> > +	dma_addr_t isp_daddr;
> > +	dma_addr_t scp_daddr;
> > +	unsigned int buffer_usage;
> > +	int rotation;
> > +	struct list_head list;
> > +};
> > +
> > +struct mtk_dip_pipe_desc {
> > +	char *name;
> > +	int master;
> > +	int id;
> > +	struct mtk_dip_video_device_desc *output_queue_descs;
> > +	int total_output_queues;
> > +	struct mtk_dip_video_device_desc *capture_queue_descs;
> > +	int total_capture_queues;
> > +};
> > +
> > +struct mtk_dip_video_device_desc {
> > +	int id;
> > +	char *name;
> > +	u32 buf_type;
> > +	u32 cap;
> > +	int smem_alloc;
> > +	int dynamic;
> > +	int default_enable;
> > +	struct mtk_dip_dev_format *fmts;
> > +	int num_fmts;
> > +	char *description;
> > +	int default_width;
> > +	int default_height;
> > +	const struct v4l2_ioctl_ops *ops;
> > +	int default_fmt_idx;
> > +};
> > +
> > +struct mtk_dip_dev_queue {
> > +	struct vb2_queue vbq;
> > +	/* Serializes vb2 queue and video device operations */
> > +	struct mutex lock;
> > +	struct mtk_dip_dev_format *dev_fmt;
> > +	/* Firmware uses buffer_usage to select suitable DMA ports */
> > +	unsigned int buffer_usage;
> > +	int rotation;
> > +};
> > +
> > +struct mtk_dip_video_device {
> > +	struct video_device vdev;
> > +	struct mtk_dip_dev_queue dev_q;
> > +	struct v4l2_format vdev_fmt;
> > +	struct media_pad vdev_pad;
> > +	struct v4l2_mbus_framefmt pad_fmt;
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +	int immutable;
> > +	int enabled;
> > +	struct mtk_dip_video_device_desc *desc;
> > +	atomic_t sequence;
> > +};
> > +
> > +struct mtk_dip_pipe {
> > +	struct mtk_dip_dev *dip_dev;
> > +	struct mtk_dip_video_device nodes[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM];
> > +	int num_nodes;
> > +	int streaming;
> > +	struct media_pad *subdev_pads;
> > +	struct media_pipeline pipeline;
> > +	struct v4l2_subdev subdev;
> > +	struct v4l2_subdev_fh *fh;
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +	struct mtk_dip_smem_dev *smem_alloc_dev;
> > +	atomic_t pipe_job_sequence;
> > +	struct mtk_dip_pipe_job_info pipe_job_infos[VB2_MAX_FRAME];
> > +	int num_pipe_job_infos;
> > +	struct list_head pipe_job_running_list;
> > +	struct list_head pipe_job_free_list;
> > +	/* Serializes pipe's stream on/off and buffers enqueue operations */
> > +	struct mutex lock;
> > +	spinlock_t job_lock; /* protect the pipe job list */
> > +	struct mtk_dip_pipe_desc *desc;
> > +};
> > +
> > +struct mtk_dip_dev {
> > +	struct platform_device *pdev;
> > +	struct media_device mdev;
> > +	struct v4l2_device v4l2_dev;
> > +	struct mtk_dip_pipe dip_pipe[MTK_DIP_PIPE_ID_TOTAL_NUM];
> > +	struct mtk_dip_smem_dev smem_alloc_dev;
> > +	struct mtk_dip_hw dip_hw;
> > +};
> > +
> > +int mtk_dip_dev_media_register(struct device *dev,
> > +			       struct media_device *media_dev,
> > +			       const char *model);
> > +
> > +int mtk_dip_dev_v4l2_init(struct mtk_dip_dev *dip_dev);
> > +
> > +void mtk_dip_dev_v4l2_release(struct mtk_dip_dev *dip_dev);
> > +
> > +int mtk_dip_dev_v4l2_register(struct device *dev,
> > +			      struct media_device *media_dev,
> > +			      struct v4l2_device *v4l2_dev);
> > +
> > +int mtk_dip_pipe_v4l2_register(struct mtk_dip_pipe *dip_pipe,
> > +			       struct media_device *media_dev,
> > +			       struct v4l2_device *v4l2_dev);
> > +
> > +int mtk_dip_pipe_v4l2_unregister(struct mtk_dip_pipe *dip_pipe);
> > +
> > +void mtk_dip_v4l2_buffer_done(struct vb2_buffer *vb,
> > +			      enum vb2_buffer_state state);
> > +
> > +int mtk_dip_pipe_queue_buffers(struct media_request *req, int initial);
> > +
> > +int mtk_dip_pipe_init(struct mtk_dip_pipe *dip_pipe,
> > +		      struct mtk_dip_dev *dip_dev,
> > +		      struct mtk_dip_pipe_desc *setting,
> > +		      struct media_device *media_dev,
> > +		      struct v4l2_device *v4l2_dev,
> > +		      struct mtk_dip_smem_dev *smem_alloc_dev);
> > +
> > +int mtk_dip_pipe_release(struct mtk_dip_pipe *dip_pipe);
> > +
> > +int mtk_dip_pipe_job_finish(struct mtk_dip_pipe *dip_pipe,
> > +			    unsigned int pipe_job_info_id,
> > +			    enum vb2_buffer_state state);
> > +
> > +int mtk_dip_pipe_job_start(struct mtk_dip_pipe *dip_pipe,
> > +			   struct mtk_dip_pipe_job_info *pipe_job_info);
> > +
> > +int mtk_dip_pipe_init_job_infos(struct mtk_dip_pipe *dip_pipe);
> > +
> > +struct mtk_dip_dev_format *
> > +mtk_dip_pipe_find_fmt(struct mtk_dip_pipe *dip_pipe,
> > +		      struct mtk_dip_video_device *node,
> > +		      u32 format);
> > +
> > +int mtk_dip_pipe_set_img_fmt(struct mtk_dip_pipe *dip_pipe,
> > +			     struct mtk_dip_video_device *node,
> > +			     struct v4l2_pix_format_mplane *user_fmt,
> > +			     struct v4l2_pix_format_mplane *node_fmt);
> > +
> > +int mtk_dip_pipe_set_meta_fmt(struct mtk_dip_pipe *dip_pipe,
> > +			      struct mtk_dip_video_device *node,
> > +			      struct v4l2_meta_format *user_fmt,
> > +			      struct v4l2_meta_format *node_fmt);
> 
> Where do we use this function?
> 

mtk_dip_pipe_set_meta_fmt() will not be used anymore. I will remove it.

> > +
> > +void mtk_dip_pipe_load_default_fmt(struct mtk_dip_pipe *dip_pipe,
> > +				   struct mtk_dip_video_device *node,
> > +				   struct v4l2_format *fmt_to_fill);
> > +
> > +int mtk_dip_pipe_streamon(struct mtk_dip_pipe *dip_pipe);
> > +
> > +int mtk_dip_pipe_streamoff(struct mtk_dip_pipe *dip_pipe);
> > +
> > +int mtk_dip_ctrl_init(struct mtk_dip_pipe *dip_pipe);
> > +
> > +static inline struct mtk_dip_video_device *
> > +mtk_dip_file_to_node(struct file *file)
> > +{
> > +	return container_of(video_devdata(file),
> > +			    struct mtk_dip_video_device, vdev);
> > +}
> > +
> > +static inline struct mtk_dip_pipe *
> > +mtk_dip_subdev_to_pipe(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct mtk_dip_pipe, subdev);
> > +}
> > +
> > +static inline struct mtk_dip_video_device *
> > +mtk_dip_vbq_to_node(struct vb2_queue *vq)
> > +{
> > +	return container_of(vq, struct mtk_dip_video_device, dev_q.vbq);
> > +}
> > +
> > +static inline struct mtk_dip_dev_buffer *
> > +mtk_dip_vb2_buf_to_dev_buf(struct vb2_buffer *vb)
> > +{
> > +	return container_of(vb, struct mtk_dip_dev_buffer, vbb.vb2_buf);
> > +}
> > +
> > +static inline struct mtk_dip_dev *mtk_dip_hw_to_dev(struct mtk_dip_hw *dip_hw)
> > +{
> > +	return container_of(dip_hw, struct mtk_dip_dev, dip_hw);
> > +}
> > +
> > +static inline int mtk_dip_buf_is_meta(u32 type)
> > +{
> > +	return type == V4L2_BUF_TYPE_META_CAPTURE ||
> > +		type == V4L2_BUF_TYPE_META_OUTPUT;
> > +}
> > +
> > +static inline int mtk_dip_pipe_get_pipe_from_job_id(int pipe_job_id)
> > +{
> > +	return (pipe_job_id >> 16) & 0x0000FFFF;
> > +}
> > +
> > +#endif /* _MTK_DIP_DEV_H_ */
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> > new file mode 100644
> > index 000000000000..d813d8b92e8b
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> > @@ -0,0 +1,167 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2018 MediaTek Inc.
> > + * Author: Holmes Chiou <holmes.chiou@mediatek.com>
> > + *
> > + * This program is free software: you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _MTK_DIP_HW_H_
> > +#define _MTK_DIP_HW_H_
> > +
> > +#include <linux/clk.h>
> > +#include "mtk-img-ipi.h"
> > +
> > +enum STREAM_TYPE_ENUM {
> > +	STREAM_UNKNOWN,
> > +	STREAM_BITBLT,
> > +	STREAM_GPU_BITBLT,
> > +	STREAM_DUAL_BITBLT,
> > +	STREAM_2ND_BITBLT,
> > +	STREAM_ISP_IC,
> > +	STREAM_ISP_VR,
> > +	STREAM_ISP_ZSD,
> > +	STREAM_ISP_IP,
> > +	STREAM_ISP_VSS,
> > +	STREAM_ISP_ZSD_SLOW,
> > +	STREAM_WPE,
> > +	STREAM_WPE2,
> > +};
> > +
> > +enum mtk_dip_hw_user_state {
> > +	DIP_STATE_INIT	= 0,
> > +	DIP_STATE_STREAMON,
> > +	DIP_STATE_STREAMOFF
> > +};
> > +
> > +struct mtk_dip_hw_frame_job {
> > +	struct img_frameparam fparam;
> > +	int sequence;
> > +};
> > +
> > +struct mtk_dip_hw_user_id {
> > +	struct list_head list_entry;
> > +	u16 id;
> > +	u32 num;
> > +	u16 state;
> > +};
> > +
> > +struct mtk_dip_hw_subframe {
> > +	struct img_addr buffer;
> > +	struct sg_table table;
> > +	struct img_sw_addr config_data;
> > +	struct img_addr tuning_buf;
> > +	struct img_sw_addr frameparam;
> > +	struct list_head list_entry;
> > +};
> > +
> > +struct mtk_dip_hw_queue {
> > +	struct list_head queue;
> > +	struct mutex queuelock; /* protect queue and queue_cnt */
> > +	u32 queue_cnt;
> > +};
> > +
> > +struct mtk_dip_hw_joblist {
> > +	struct list_head queue;
> > +	spinlock_t queuelock; /* protect job list */
> > +	u32 queue_cnt;
> > +};
> > +
> > +struct mtk_dip_hw_thread {
> > +	struct task_struct *thread;
> > +	wait_queue_head_t wq;
> > +};
> > +
> > +struct mtk_dip_hw_work {
> > +	struct list_head list_entry;
> > +	struct img_ipi_frameparam frameparams;
> > +	struct mtk_dip_hw_user_id *user_id;
> > +};
> > +
> > +struct mtk_dip_hw_submit_work {
> > +	struct work_struct frame_work;
> > +	struct mtk_dip_hw *dip_hw;
> > +};
> > +
> > +struct mtk_dip_hw_mdpcb_work {
> > +	struct work_struct frame_work;
> > +	struct img_ipi_frameparam *frameparams;
> > +};
> > +
> > +struct mtk_dip_hw_clk {
> > +	struct clk *img_larb5;
> > +	struct clk *img_dip;
> > +};
> > +
> > +enum frame_state {
> > +	FRAME_STATE_INIT = 0,
> > +	FRAME_STATE_COMPOSING,
> > +	FRAME_STATE_RUNNING,
> > +	FRAME_STATE_DONE,
> > +	FRAME_STATE_STREAMOFF,
> > +	FRAME_STATE_ERROR,
> > +	FRAME_STATE_HW_TIMEOUT
> > +};
> > +
> > +struct mtk_dip_hw {
> > +	struct mtk_dip_hw_clk dip_clk;
> > +	struct device *larb_dev;
> > +	struct mtk_dip_hw_joblist dip_gcejoblist;
> > +	struct mtk_dip_hw_queue dip_freebufferlist;
> > +	struct mtk_dip_hw_queue dip_usedbufferlist;
> > +	struct mtk_dip_hw_thread dip_runner_thread;
> > +	struct mtk_dip_hw_queue dip_useridlist;
> > +	struct mtk_dip_hw_queue dip_worklist;
> > +	struct workqueue_struct *composer_wq;
> > +	struct mtk_dip_hw_submit_work submit_work;
> > +	wait_queue_head_t composing_wq;
> > +	wait_queue_head_t flushing_wq;
> > +	atomic_t num_composing;	/* increase after ipi */
> > +	/* increase after calling MDP driver */
> > +	atomic_t num_running;
> > +	/*MDP/GCE callback workqueue */
> 
> Missing space after "/*".

I will correct it.

> 
> > +	struct workqueue_struct *mdpcb_workqueue;
> > +	/* for MDP driver  */
> > +	struct platform_device *mdp_pdev;
> > +	/* for VPU driver  */
> > +	struct platform_device *vpu_pdev;
> > +	struct rproc *rproc_handle;
> > +	dma_addr_t scp_workingbuf_addr;
> > +	/* increase after enqueue */
> > +	atomic_t dip_enque_cnt;
> > +	/* increase after Stream ON, decrease when Stream OFF */
> > +	atomic_t dip_stream_cnt;
> > +	/* increase after open, decrease when close */
> > +	atomic_t dip_user_cnt;
> > +};
> > +
> > +int mtk_dip_hw_enqueue(struct mtk_dip_hw *dip_hw,
> > +		       struct img_ipi_frameparam *frameparams);
> > +int mtk_dip_hw_connect(struct mtk_dip_hw *dip_hw);
> > +int mtk_dip_hw_disconnect(struct mtk_dip_hw *dip_hw);
> > +int mtk_dip_hw_streamon(struct mtk_dip_hw *dip_hw, u16 id);
> > +int mtk_dip_hw_streamoff(struct mtk_dip_hw *dip_hw, u16 id);
> > +
> > +static inline struct mtk_dip_hw_frame_job
> > +*mtk_dip_fparam_to_job(struct img_frameparam *fparam)
> > +{
> > +	return container_of(fparam, struct mtk_dip_hw_frame_job, fparam);
> > +}
> > +
> > +static inline struct mtk_dip_hw_frame_job *
> > +mtk_dip_ipi_fparam_to_job(struct img_ipi_frameparam *ipi_fparam)
> > +{
> > +	return container_of(ipi_fparam,
> > +			    struct mtk_dip_hw_frame_job,
> > +			    fparam.frameparam);
> > +}
> > +
> > +#endif /* _MTK_DIP_HW_H_ */
> > +
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c
> > new file mode 100644
> > index 000000000000..5456c0b54ad4
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-smem.c
> > @@ -0,0 +1,322 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Frederic Chen <frederic.chen@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/dma-contiguous.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/slab.h>
> > +#include <linux/err.h>
> > +#include <linux/iommu.h>
> > +#include <asm/cacheflush.h>
> > +#include "mtk_dip-smem.h"
> > +
> > +#define MTK_DIP_SMEM_DEV_NAME "MTK-DIP-SMEM"
> > +
> > +static struct reserved_mem *dip_reserved_smem;
> > +static struct dma_map_ops smem_dma_ops;
> > +
> > +struct dma_coherent_mem {
> > +	void		*virt_base;
> > +	dma_addr_t	device_base;
> > +	unsigned long	pfn_base;
> > +	int		size;
> > +	int		flags;
> > +	unsigned long	*bitmap;
> > +	spinlock_t	spinlock; /* protect dma_coherent_mem member */
> > +	bool		use_dev_dma_pfn_offset;
> > +};
> > +
> > +static struct dma_coherent_mem *dev_get_coherent_memory(struct device *dev)
> > +{
> > +	if (dev && dev->dma_mem)
> > +		return dev->dma_mem;
> > +	return NULL;
> > +}
> > +
> > +phys_addr_t mtk_dip_smem_iova_to_phys(struct mtk_dip_smem_dev *smem_dev,
> > +				      dma_addr_t iova)
> > +{
> > +		struct iommu_domain *smem_dom;
> > +		phys_addr_t addr;
> > +		phys_addr_t limit;
> > +
> > +		if (!smem_dev)
> > +			return 0;
> > +
> > +		smem_dom = iommu_get_domain_for_dev(smem_dev->dev.parent);
> > +
> > +		if (!smem_dom)
> > +			return 0;
> > +
> > +		addr = iommu_iova_to_phys(smem_dom, iova);
> > +
> > +		limit = smem_dev->smem_base + smem_dev->smem_size;
> > +
> > +		if (addr < smem_dev->smem_base || addr >= limit) {
> > +			dev_err(&smem_dev->dev,
> > +				"Unexpected scp_daddr %pa (must >= %pa and <%pa)\n",
> > +				&addr, &smem_dev->smem_base, &limit);
> > +			return 0;
> > +		}
> > +		dev_dbg(&smem_dev->dev, "Pa verifcation pass: %pa(>=%pa, <%pa)\n",
> > +			&addr, &smem_dev->smem_base, &limit);
> > +		return addr;
> > +}
> > +
> > +/********************************************
> > + * MTK DIP SMEM DMA ops *
> > + ********************************************/
> > +static int mtk_dip_smem_get_sgtable(struct device *dev,
> > +				    struct sg_table *sgt,
> > +				    void *cpu_addr,
> > +				    dma_addr_t dma_addr,
> > +				    size_t size, unsigned long attrs)
> > +{
> > +	struct mtk_dip_smem_dev *smem_dev = dev_get_drvdata(dev);
> > +	int n_pages_align;
> > +	int size_align;
> > +	int page_start;
> > +	unsigned long long offset_p;
> > +
> > +	phys_addr_t paddr = mtk_dip_smem_iova_to_phys(smem_dev, dma_addr);
> > +
> > +	offset_p = (unsigned long long)paddr -
> > +		(unsigned long long)smem_dev->smem_base;
> > +
> > +	dev_dbg(dev, "%s: dma_addr(%p), cpu_addr(%p), pa(%p), size(%d)\n",
> > +		__func__, dma_addr, cpu_addr, paddr, size);
> 
> Please use %zd for size as it is a size_t.

I got it.

> 
> > +
> > +	size_align = round_up(size, PAGE_SIZE);
> > +	n_pages_align = size_align >> PAGE_SHIFT;
> > +	page_start = offset_p >> PAGE_SHIFT;
> > +
> > +	dev_dbg(dev, "%s: page_start(%d), page pa(%p), pa(%p), aligned size(%d)\n",
> > +		__func__,
> > +		page_start,
> > +		page_to_phys(*(smem_dev->smem_pages + page_start)),
> > +		paddr,
> > +		size_align
> > +		);
> > +
> > +	if (!smem_dev) {
> > +		dev_err(dev, "can't get sgtable from smem_dev\n");
> > +		return -EINVAL;
> > +	}
> 
> We already dereference smem_dev above. Should we move this check or simply
> remove it?
> 

Yes, I will remove it.

> > +
> > +	dev_dbg(dev, "%s: get sgt of the smem: %d pages\n", __func__,
> > +		n_pages_align);
> > +
> > +	return sg_alloc_table_from_pages(sgt,
> > +					 smem_dev->smem_pages + page_start,
> > +					 n_pages_align,
> > +					 0, size_align, GFP_KERNEL);
> > +}
> > +
> 
> <snip>
> 
> > +
> > -- 
> > 2.18.0
> > 
> 
> Sincerely,
> Shik



Sincerely,

Frederic Chen


