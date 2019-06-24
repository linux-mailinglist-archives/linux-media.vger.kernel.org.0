Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88F4150DBE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 16:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbfFXOWU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 10:22:20 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:47529 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfFXOWU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 10:22:20 -0400
X-UUID: bc85d54c6caf4c33b6f7aefe75ea9252-20190624
X-UUID: bc85d54c6caf4c33b6f7aefe75ea9252-20190624
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 54198288; Mon, 24 Jun 2019 22:22:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Jun 2019 22:22:02 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 24 Jun 2019 22:22:02 +0800
Message-ID: <1561386122.15267.223.camel@mtksdccf07>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek FD driver
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Holmes Chiou =?UTF-8?Q?=28=E9=82=B1=E6=8C=BA=29?= 
        <holmes.chiou@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shik@chromium.org" <shik@chromium.org>,
        "suleiman@chromium.org" <suleiman@chromium.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        <po-yang.huang@mediatek.com>, <jerry-ch.chen@mediatek.com>
Date:   Mon, 24 Jun 2019 22:22:02 +0800
In-Reply-To: <20190606104347.GA107267@chromium.org>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
         <20190423104505.38778-7-Jerry-Ch.chen@mediatek.com>
         <20190606104347.GA107267@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8F10AEAAFF4173427CA3EBE4F88DAC5010F28317B870F9E7D23A6AE7F3BB75BA2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Thu, 2019-06-06 at 18:43 +0800, Tomasz Figa wrote:
> Hi Jerry,
> 
> On Tue, Apr 23, 2019 at 06:45:05PM +0800, Jerry-ch Chen wrote:
> > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > 
> > This patch adds the driver of Face Detection (FD) unit in
> > Mediatek camera system, providing face detection function.
> > 
> > The mtk-isp directory will contain drivers for multiple IP
> > blocks found in Mediatek ISP system. It will include ISP Pass 1
> > driver (CAM), sensor interface driver, DIP driver and face
> > detection driver.
> > 
> 
> Thanks for the patch.
> 
> First of all a general comment about the design:
> 
> My understanding is that this is a relatively straightforward
> memory-to-memory device that reads a video frame and detects faces on it.
> Such devices should be implemented as normal V4L2 memory-to-memory devices,
> with contexts (instances; pipes) represented by v4l2_fh.
> 
> Also, please replace the META_OUTPUT queue with proper V4L2 controls, as I
> don't think there is anything that we couldn't model using controls here.
> 
> The end result should be a V4L2 m2m driver (using the m2m helpers), where
> you get a new context (instance; pipe) whenever you open the video node,
> similar to codecs, video processors (like MTK MDP) and so on.
> 
> Also please see my comments inline.
> 
I appreciate your comments,
sorry for sending the previous two unfinished mail...

FD driver will be implemented as a normal V4L2 m2m driver which has an
IMAGE_OUTPUT queue and a META_CAPTURE queue(face result).

We will use the following properties.
/* Is a video mem-to-mem device that supports multiplanar formats */
#define V4L2_CAP_VIDEO_M2M_MPLANE    0x00004000

The original META_OUTPUT queue contains the following structure will be
replaced by V4L2 controls,

/* FD_SCALE_NUM is 15. */
struct fd_user_param {
	uint8_t rip_feature;
	uint8_t gfd_skip;
	uint8_t dynamic_change_model;
	uint8_t scale_num_from_user;
	uint16_t source_img_width[FD_SCALE_NUM];
	uint16_t source_img_height[FD_SCALE_NUM];
} __packed; //share with co-processor

However, we found that testM2MFormats() in the V4L2 compliance test will
assume the capture queue has the same format as output queue has,
therefore, FD driver's capture queue wouldn't be able to use META format
or the v4l2 test will be failed. 

reference: v4l2-compliance/v4l2-test-formats.cpp
// m2m devices are special in that the format is often per-filehandle.
// But colorspace information should be passed from output to capture,
// so test that.
	if (node->is_m2m)
		return testM2MFormats(node);

May we ask for your suggestions about this part?


> > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > ---
> >  drivers/media/platform/mtk-isp/Makefile       |   16 +
> >  drivers/media/platform/mtk-isp/fd/Makefile    |   25 +
> >  .../media/platform/mtk-isp/fd/mtk_fd-dev.c    |  754 +++++++++++
> >  .../media/platform/mtk-isp/fd/mtk_fd-dev.h    |  315 +++++
> >  drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h |  158 +++
> >  .../media/platform/mtk-isp/fd/mtk_fd-smem.c   |  322 +++++
> >  .../media/platform/mtk-isp/fd/mtk_fd-smem.h   |   39 +
> >  .../media/platform/mtk-isp/fd/mtk_fd-v4l2.c   | 1171 +++++++++++++++++
> >  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c |  555 ++++++++
> 
> This is a small driver. Please just put all the code in one file. (Except
> the smem stuff, which should go away.)
> 
Ok, we will fix it.

> >  9 files changed, 3355 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-smem.c
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.c
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> > 
> > diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
> > new file mode 100644
> > index 000000000000..5e3a9aa7f8b2
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/Makefile
> > @@ -0,0 +1,16 @@
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
> > +ifeq ($(CONFIG_VIDEO_MEDIATEK_FD_SUPPORT),y)
> 
> There is no value in having "SUPPORT" in the Kconfig symbol name. It just
> makes it unnecessarily long.
> 
> > +obj-y += fd/
> > +endif
> 
> You can just add this directly in drivers/media/platform/Makefile. No need
> for this intermediate file.
> 
> Also, the driver should be compilable as a module too.
> 
Ok, we will fix it.

> > diff --git a/drivers/media/platform/mtk-isp/fd/Makefile b/drivers/media/platform/mtk-isp/fd/Makefile
> > new file mode 100644
> > index 000000000000..f2b64cf53da9
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/fd/Makefile
> > @@ -0,0 +1,25 @@
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
> > +obj-y += mtk_fd_40.o
> > +obj-y += mtk_fd-v4l2.o
> > +
> > +# To provide alloc context managing memory shared
> > +# between CPU and camera coprocessor
> > +obj-y += mtk_fd-smem.o
> > +
> > +# Utilits to provide frame-based streaming model
> > +# with v4l2 user interfaces
> > +obj-y += mtk_fd-dev.o
> 
> This wouldn't work if the driver is compiled as a module.
> Please use something like if you have more than 1 object.
> 
> 	mtk-fd-objs += list of .o objects
> 
> 	obj-$(CONFIG_VIDEO_MEDIATEK_FD) += mtk-fd.o
> 
> Otherwise just use the last line directly.
> 
Ok, we will fix it.

> > diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c b/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c
> > new file mode 100644
> > index 000000000000..207e5d20ad46
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c
> > @@ -0,0 +1,754 @@
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
> 
> No need for this text if there is SPDX.
> 
Fixed.

> [snip]
> > diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h b/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h
> > new file mode 100644
> > index 000000000000..c13627f2bac4
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h
> > @@ -0,0 +1,315 @@
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
> > +#ifndef _MTK_FD_DEV_H_
> > +#define _MTK_FD_DEV_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/platform_device.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/videobuf2-v4l2.h>
> > +
> > +#include "mtk_fd-hw.h"
> > +#include "mtk_fd-smem.h"
> > +
> > +#define MTK_FD_PIPE_ID_STREAM_0				0
> > +#define MTK_FD_PIPE_ID_STREAM_1				1
> > +#define MTK_FD_PIPE_ID_TOTAL_NUM			2
> > +
> > +#define MTK_FD_VIDEO_NODE_ID_YUV_OUT			0
> > +#define MTK_FD_VIDEO_NODE_ID_CONFIG_OUT			1
> > +#define MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM		2
> > +#define MTK_FD_VIDEO_NODE_ID_CAPTURE			2
> > +#define MTK_FD_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM		1
> > +#define MTK_FD_VIDEO_NODE_ID_TOTAL_NUM \
> > +	(MTK_FD_VIDEO_NODE_ID_OUT_TOTAL_NUM + \
> > +	MTK_FD_VIDEO_NODE_ID_CAPTURE_TOTAL_NUM)
> > +
> > +#define MTK_FD_VIDEO_NODE_ID_NO_MASTER			-1
> > +
> > +#define MTK_FD_OUTPUT_MIN_WIDTH				2U
> > +#define MTK_FD_OUTPUT_MIN_HEIGHT			2U
> > +#define MTK_FD_OUTPUT_MAX_WIDTH				5376U
> > +#define MTK_FD_OUTPUT_MAX_HEIGHT			4032U
> > +#define MTK_FD_CAPTURE_MIN_WIDTH			2U
> > +#define MTK_FD_CAPTURE_MIN_HEIGHT			2U
> > +#define MTK_FD_CAPTURE_MAX_WIDTH			5376U
> > +#define MTK_FD_CAPTURE_MAX_HEIGHT			4032U
> > +
> > +#define MTK_FD_PIPE_MEDIA_MODEL_NAME	"MTK-FD-V4L2"
> > +#define MTK_FD_PIPE_NAME_STREAM_0	MTK_FD_PIPE_MEDIA_MODEL_NAME
> > +#define MTK_FD_PIPE_NAME_STREAM_1	"MTK-FD-V4L2-STREAM-1"
> > +
> > +#define MTK_FD_DEV_META_BUF_DEFAULT_SIZE		(1110 * 1024)
> > +
> > +/*
> > + * Supported format and the information used for
> > + * size calculation
> > + */
> > +struct mtk_fd_dev_meta_format {
> > +	u32 dataformat;
> > +	u32 max_buffer_size;
> > +	u8 flags;
> > +};
> > +
> > +/* MDP part private format definitation */
> > +struct mtk_fd_dev_mdp_format {
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
> > +struct mtk_fd_dev_format {
> > +	union {
> > +		struct mtk_fd_dev_meta_format meta;
> > +		struct mtk_fd_dev_mdp_format img;
> > +	} fmt;
> > +};
> 
> This looks like a copy/paste from the DIP driver. Please merge the 3
> structures above into 1 as suggested in review of that driver.
> 
Ok, we will fix it.

> [snip]
> > diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h b/drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h
> > new file mode 100644
> > index 000000000000..40e09d66c479
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-hw.h
> > @@ -0,0 +1,158 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + * Copyright (C) 2015 MediaTek Inc.
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
> > +#ifndef __MTK_FD_HW_H__
> > +#define __MTK_FD_HW_H__
> > +
> > +#include <linux/io.h>
> > +#define SIG_ERESTARTSYS 512
> > +
> > +#define FD_WR32(v, a) \
> > +do { \
> > +	__raw_writel((v), (void __force __iomem *)((a))); \
> > +	mb(); /* ensure written */ \
> > +} while (0)
> > +
> > +#define FD_RD32(addr) ioread32((void *)addr)
> > +
> > +#define FD_INT_EN		0x15c
> > +#define FD_INT			0x168
> > +#define FD_RESULT		0x178
> > +#define FD_IRQ_MASK		0x001
> > +
> > +#define RS_BUF_SIZE_MAX		2288788
> > +#define VA_OFFSET		0xffff000000000000
> > +
> > +#define MTK_FD_MAX_NO		1024
> > +#define MAX_FACE_SEL_NUM	(MTK_FD_MAX_NO + 2)
> > +
> > +/* The max number of face sizes could be detected, for feature scaling */
> > +#define FACE_SIZE_NUM_MAX	14
> > +
> > +/* FACE_SIZE_NUM_MAX + 1, first scale for input image W/H */
> > +#define FD_SCALE_NUM		15
> > +
> > +/* Number of Learning data sets */
> > +#define LEARNDATA_NUM		18
> > +
> > +#define mtk_fd_us_to_jiffies(us) \
> > +	((((unsigned long)(us) / 1000) * HZ + 512) >> 10)
> > +
> 
> Uhm, looking at the arbitrary numbers involved in this computation I'm
> afraid to even ask what this macro is expected to do.
> 
> Judging by the name, why not just use usecs_to_jiffies()?
> 
Fixed. Using usecs_to_jiffies() instead.

> [snip]
> > diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h b/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h
> > new file mode 100644
> > index 000000000000..758a4ab68ec2
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h
> > @@ -0,0 +1,39 @@
> [snip]
> > +
> > +struct mtk_fd_smem_dev {
> > +	struct device dev;
> > +	struct sg_table sgt;
> > +	struct page **smem_pages;
> > +	int num_smem_pages;
> > +	phys_addr_t smem_base;
> > +	dma_addr_t smem_dma_base;
> > +	int smem_size;
> > +};
> > +
> > +phys_addr_t mtk_fd_smem_iova_to_phys(struct mtk_fd_smem_dev *smem_dev,
> > +				     dma_addr_t iova);
> > +int mtk_fd_smem_alloc_dev_init(struct mtk_fd_smem_dev *smem_dev,
> > +			       struct device *default_alloc_dev);
> > +void mtk_fd_smem_alloc_dev_release(struct mtk_fd_smem_dev *smem_dev);
> > +
> 
> Please remove this custom smem thing as we should just use dma_alloc_*()
> from the right struct device attached to the right reserved memory pool.
> 
FD driver may not need smem things after we use v4l2 control to replace
the META_OUTPUT queuues.

> [snip]
> > +static int mtk_fd_videoc_enum_fmt(struct file *file, void *fh,
> > +				  struct v4l2_fmtdesc *f)
> 
> It's "vidioc".
> 
Fixed.

> > +{
> > +	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
> > +
> > +	if (f->index > node->desc->num_fmts ||
> > +	    f->type != node->dev_q.vbq.type)
> 
> No need to check the type.
> 
Ok, we will fix it.

> > +		return -EINVAL;
> > +
> > +	strscpy(f->description, node->desc->description,
> > +		sizeof(f->description));
> > +
> > +	f->pixelformat = node->desc->fmts[f->index].fmt.img.pixelformat;
> > +	f->flags = 0;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_fd_meta_enum_format(struct file *file,
> > +				   void *fh, struct v4l2_fmtdesc *f)
> 
> Please name the functions consistently. Above it has the vidioc prefix (with
> typo) and enum_fmt, but here it doesn't have a prefix and is enum_format.
> 
Fixed.

> > +{
> > +	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
> > +
> > +	if (f->index > 0 || f->type != node->dev_q.vbq.type)
> 
> There is no need to check the type, as the core should already check it for
> you.
> 
Fixed.

> > +		return -EINVAL;
> > +
> > +	strscpy(f->description, node->desc->description,
> > +		sizeof(f->description));
> > +
> > +	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
> 
> Also set flags to 0.
> 
Fixed.

> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_fd_videoc_g_meta_fmt(struct file *file,
> > +				    void *fh, struct v4l2_format *f)
> > +{
> > +	struct mtk_fd_video_device *node = mtk_fd_file_to_node(file);
> 
> The Linux coding style requires 1 blank line between variable declarations
> and code.
> 
Fixed.

> > +	*f = node->vdev_fmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +mtk_fd_vidioc_subscribe_event(struct v4l2_fh *fh,
> > +			      const struct v4l2_event_subscription *sub)
> > +{
> > +	switch (sub->type) {
> > +	case V4L2_EVENT_CTRL:
> > +		return v4l2_ctrl_subscribe_event(fh, sub);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> 
> This driver doesn't seem to support any controls, so there is no point in
> supporting the above event.
> 
Ok, we will use v4l2_ctrl_subscribe_event when we replace meta output
queue with v4l2 control.

> [snip]
> > +static void mtk_fd_node_to_v4l2(struct mtk_fd_pipe *fd_pipe,
> > +				u32 idx,
> > +				 struct video_device *vdev,
> > +				 struct v4l2_format *f)
> > +{
> > +	struct mtk_fd_video_device *node = &fd_pipe->nodes[idx];
> > +
> > +	vdev->ioctl_ops = node->desc->ops;
> > +	vdev->device_caps = V4L2_CAP_STREAMING | node->desc->cap;
> > +	f->type = node->desc->buf_type;
> > +	mtk_fd_pipe_load_default_fmt(fd_pipe, node, f);
> > +}
> 
> This function is only called once, is very short and has a very misleading
> name (this kind of name is used for functions that convert things).
> Just move the code back to the caller.
> 
Fixed.

> > +
> > +int mtk_fd_dev_media_register(struct device *dev,
> > +			      struct media_device *media_dev,
> > +			      const char *model)
> > +{
> > +	int ret = 0;
> > +
> > +	media_dev->dev = dev;
> > +	dev_dbg(dev, "setup media_dev.dev: %p\n",
> > +		media_dev->dev);
> 
> I don't think these logs every second line are useful even for debugging.
> Please remove.
> 
Fixed.

> > +
> > +	strlcpy(media_dev->model, model,
> > +		sizeof(media_dev->model));
> 
> No need to pass model here as an argument. Just write the string here
> directly.
> 
Fixed.

> > +	dev_dbg(dev, "setup media_dev.model: %s\n",
> > +		media_dev->model);
> > +
> > +	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
> > +		 "platform:%s", dev_name(dev));
> > +	dev_dbg(dev, "setup media_dev.bus_info: %s\n",
> > +		media_dev->bus_info);
> > +
> > +	media_dev->hw_revision = 0;
> > +	dev_dbg(dev, "setup media_dev.hw_revision: %d\n",
> > +		media_dev->hw_revision);
> 
> No need to explicitly initialize to 0.
> 
Fixed.

> > +
> > +	media_dev->ops = &mtk_fd_media_req_ops;
> > +
> > +	dev_dbg(dev, "media_device_init: media_dev:%p\n",
> > +		media_dev);
> > +	media_device_init(media_dev);
> > +
> > +	pr_debug("Register media device: %s, %p",
> > +		 media_dev->model,
> > +		media_dev);
> > +
> > +	ret = media_device_register(media_dev);
> > +
> > +	if (ret) {
> > +		dev_err(dev, "failed to register media device (%d)\n", ret);
> > +		goto fail_media_dev;
> > +	}
> > +	return 0;
> > +
> > +fail_media_dev:
> > +	media_device_unregister(media_dev);
> 
> We jump here even if media_device_register() failed. Unregistering something
> that wasn't registered doesn't sound like a good idea.
> 
Fixed.

> > +	media_device_cleanup(media_dev);
> > +
> > +	return ret;
> > +}
> 
> There isn't much happening in this function. Perhaps just move the code back
> to the caller?
> 
Moved back.

> > +
> > +int mtk_fd_dev_v4l2_register(struct device *dev,
> > +			     struct media_device *media_dev,
> > +			     struct v4l2_device *v4l2_dev)
> > +{
> > +	int ret = 0;
> 
> Add a blank line between variable declarations and code.
> 
Fixed.

> > +	/* Set up v4l2 device */
> > +	v4l2_dev->mdev = media_dev;
> > +	dev_dbg(dev, "setup v4l2_dev->mdev: %p",
> > +		v4l2_dev->mdev);
> 
> Please clean up such debugging messages, it makes it much harder to review
> the code.
> 
Fixed.

> > +	v4l2_dev->ctrl_handler = NULL;
> 
> No need for explicit NULL assignments, as the structure was zero-filled
> already.
> 
Fixed.

> > +	dev_dbg(dev, "setup v4l2_dev->ctrl_handler: %p",
> > +		v4l2_dev->ctrl_handler);
> > +
> > +	pr_debug("Register v4l2 device: %p",
> > +		 v4l2_dev);
> 
> dev_dbg()? But I would still just remove it.
> 
Fixed.

> > +
> > +	ret = v4l2_device_register(dev, v4l2_dev);
> > +
> > +	if (ret) {
> > +		dev_err(dev, "failed to register V4L2 device (%d)\n", ret);
> > +		goto fail_v4l2_dev;
> > +	}
> > +
> > +	return 0;
> > +
> > +fail_v4l2_dev:
> > +	media_device_unregister(media_dev);
> > +	media_device_cleanup(media_dev);
> > +
> > +	return ret;
> > +}
> > +
> 
> There isn't much happening in this function. Perhaps just move the code back
> to the caller?
> 
Fixed and moved back.

> > +int mtk_fd_pipe_v4l2_register(struct mtk_fd_pipe *fd_pipe,
> > +			      struct media_device *media_dev,
> > +			      struct v4l2_device *v4l2_dev)
> > +{
> > +	int i, ret;
> > +
> > +	/* Initialize miscellaneous variables */
> > +	fd_pipe->streaming = 0;
> > +
> > +	/* Initialize subdev media entity */
> > +	fd_pipe->subdev_pads = kcalloc(fd_pipe->num_nodes,
> > +				       sizeof(*fd_pipe->subdev_pads),
> > +					GFP_KERNEL);
> > +	if (!fd_pipe->subdev_pads) {
> > +		ret = -ENOMEM;
> > +		goto fail_subdev_pads;
> 
> There isn't anything to clean up at this point, so just return.
> 
Fixed.

> > +	}
> > +
> > +	ret = media_entity_pads_init(&fd_pipe->subdev.entity,
> > +				     fd_pipe->num_nodes,
> > +				     fd_pipe->subdev_pads);
> > +	if (ret) {
> > +		dev_err(&fd_pipe->fd_dev->pdev->dev,
> > +			"failed initialize subdev media entity (%d)\n", ret);
> > +		goto fail_media_entity;
> 
> Please name the labels after the next cleanup step to happen after jumping
> to it.
> 
Fixed.

> > +	}
> > +
> > +	/* Initialize subdev */
> > +	v4l2_subdev_init(&fd_pipe->subdev, &mtk_fd_subdev_ops);
> > +
> > +	fd_pipe->subdev.entity.function =
> > +		MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> > +
> > +	fd_pipe->subdev.entity.ops = &mtk_fd_media_ops;
> > +
> > +	for (i = 0; i < fd_pipe->num_nodes; i++) {
> > +		struct mtk_fd_video_device_desc *desc =
> > +			fd_pipe->nodes[i].desc;
> > +
> > +		fd_pipe->subdev_pads[i].flags =
> > +			V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
> > +			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> > +	}
> > +
> > +	fd_pipe->subdev.flags =
> > +		V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> > +	snprintf(fd_pipe->subdev.name, sizeof(fd_pipe->subdev.name),
> > +		 "%s", fd_pipe->desc->name);
> > +	v4l2_set_subdevdata(&fd_pipe->subdev, fd_pipe);
> > +	fd_pipe->subdev.ctrl_handler = NULL;
> > +	fd_pipe->subdev.internal_ops = &mtk_fd_subdev_internal_ops;
> 
> The above code registers a subdev, so it sounds like it could be a separate
> function.
> 
This function may be removed after we make we use the v4l2 control and
make it a m2m device.

> > +
> > +	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
> > +		"register subdev: %s, ctrl_handler %p\n",
> > +		 fd_pipe->subdev.name, fd_pipe->subdev.ctrl_handler);
> > +	ret = v4l2_device_register_subdev(&fd_pipe->fd_dev->v4l2_dev,
> > +					  &fd_pipe->subdev);
> > +	if (ret) {
> > +		dev_err(&fd_pipe->fd_dev->pdev->dev,
> > +			"failed initialize subdev (%d)\n", ret);
> > +		goto fail_subdev;
> > +	}
> > +
> > +	ret = v4l2_device_register_subdev_nodes(&fd_pipe->fd_dev->v4l2_dev);
> > +	if (ret) {
> > +		dev_err(&fd_pipe->fd_dev->pdev->dev,
> > +			"failed to register subdevs (%d)\n", ret);
> > +		goto fail_subdevs;
> > +	}
> 
> This isn't per-pipe, but global for the whole v4l2_device. It should be
> called after all subdevs are fully initialized, to expose the device nodes
> to the userspace atomically.
> 
Ditto.

> > +
> > +	/* Create video nodes and links */
> > +	for (i = 0; i < fd_pipe->num_nodes; i++) {
> 
> Please move the contents of the loop into a separate function that handles
> one node.
> 
Ditto.

> > +		struct mtk_fd_video_device *node = &fd_pipe->nodes[i];
> > +		struct video_device *vdev = &node->vdev;
> > +		struct vb2_queue *vbq = &node->dev_q.vbq;
> > +		struct mtk_fd_video_device_desc *desc = node->desc;
> > +		u32 flags;
> > +
> > +		/* Initialize miscellaneous variables */
> > +		mutex_init(&node->dev_q.lock);
> 
> Please just use the video_device lock for vb2 queues too. It simplifies the
> overall driver locking and doesn't really have any practical performance
> difference.
> 
Ok, we got it.

> > +
> > +		/* Initialize formats to default values */
> > +		mtk_fd_node_to_v4l2(fd_pipe, i, vdev, &node->vdev_fmt);
> > +
> > +		/* Initialize media entities */
> > +		ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
> > +		if (ret) {
> > +			dev_err(&fd_pipe->fd_dev->pdev->dev,
> 
> This kind of long chains of pointer dereferences signal a problem in the
> design of driver structures and/or function arguments.
> 
> I'd suggest passing fd_dev to this function and also storing dev instead of
> pdev inside fd_dev.
> 
Ok, we got it.

> > +				"failed initialize media entity (%d)\n", ret);
> > +			goto fail_vdev_media_entity;
> > +		}
> > +
> > +		node->vdev_pad.flags = V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
> > +			MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
> > +		vdev->entity.ops = NULL;
> > +
> > +		/* Initialize vbq */
> > +		vbq->type = node->vdev_fmt.type;
> > +		vbq->io_modes = VB2_MMAP | VB2_DMABUF;
> > +		vbq->ops = &mtk_fd_vb2_ops;
> > +		vbq->mem_ops = &vb2_dma_contig_memops;
> > +		vbq->supports_requests = true;
> > +		vbq->buf_struct_size = sizeof(struct mtk_fd_dev_buffer);
> > +		vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> 
> This is a mem2mem device so the timestamps should be copied from OUTPUT to
> CAPTURE. Please set the flag appropriately.
> 
Ok, we will use V4L2_BUF_FLAG_TIMESTAMP_COPY.

> > +		vbq->min_buffers_needed = 0;
> > +		/* Put the process hub sub device in the vb2 private data*/
> > +		vbq->drv_priv = fd_pipe;
> > +		vbq->lock = &node->dev_q.lock;
> > +		ret = vb2_queue_init(vbq);
> > +		if (ret) {
> > +			dev_err(&fd_pipe->fd_dev->pdev->dev,
> > +				"failed to initialize video queue (%d)\n", ret);
> > +			goto fail_vdev;
> > +		}
> > +
> > +		/* Initialize vdev */
> > +		snprintf(vdev->name, sizeof(vdev->name), "%s %s",
> > +			 fd_pipe->desc->name,
> > +			 node->desc->name);
> > +		vdev->release = video_device_release_empty;
> > +		vdev->fops = &mtk_fd_v4l2_fops;
> > +		vdev->lock = &node->dev_q.lock;
> 
> Aha, so it's in fact the same lock. Please move it to the "node" struct
> then.
> 
Ok, we got it.

> > +		vdev->ctrl_handler = NULL;
> > +		vdev->v4l2_dev = &fd_pipe->fd_dev->v4l2_dev;
> > +		vdev->queue = &node->dev_q.vbq;
> > +		vdev->vfl_dir = V4L2_TYPE_IS_OUTPUT(desc->buf_type) ?
> > +			VFL_DIR_TX : VFL_DIR_RX;
> > +		video_set_drvdata(vdev, fd_pipe);
> > +		pr_debug("register vdev: %s\n", vdev->name);
> 
> dev_dbg()?
> 
Fixed.

> > +		ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> > +		if (ret) {
> > +			dev_err(&fd_pipe->fd_dev->pdev->dev,
> > +				"failed to register video device (%d)\n", ret);
> > +			goto fail_vdev;
> > +		}
> > +
> > +		/* Create link between video node and the subdev pad */
> > +		flags = 0;
> > +		if (desc->dynamic)
> > +			flags |= MEDIA_LNK_FL_DYNAMIC;
> > +		if (node->enabled)
> > +			flags |= MEDIA_LNK_FL_ENABLED;
> > +		if (node->immutable)
> > +			flags |= MEDIA_LNK_FL_IMMUTABLE;
> 
> Wouldn't all the nodes be always ENABLED and IMMUTABLE and not DYNAMIC for
> this driver?
> 
This will be removed after FD driver become m2m device driver and use
v4l2 controls.
> > +
> > +		if (V4L2_TYPE_IS_OUTPUT(desc->buf_type))
> > +			ret = media_create_pad_link(&vdev->entity, 0,
> > +						    &fd_pipe->subdev.entity,
> > +						    i, flags);
> > +		else
> > +			ret = media_create_pad_link(&fd_pipe->subdev.entity,
> > +						    i, &vdev->entity, 0,
> > +						    flags);
> > +
> 
> No need for this blank line.
> 
Fixed.

> > +		if (ret)
> > +			goto fail_link;
> > +	}
> > +
> > +	return 0;
> > +
> > +	for (; i >= 0; i--) {
> > +fail_link:
> > +		video_unregister_device(&fd_pipe->nodes[i].vdev);
> > +fail_vdev:
> > +		vb2_queue_release(&fd_pipe->nodes[i].dev_q.vbq);
> > +		media_entity_cleanup(&fd_pipe->nodes[i].vdev.entity);
> > +fail_vdev_media_entity:
> > +		mutex_destroy(&fd_pipe->nodes[i].dev_q.lock);
> > +	}
> > +fail_subdevs:
> > +	v4l2_device_unregister_subdev(&fd_pipe->subdev);
> > +fail_subdev:
> > +	media_entity_cleanup(&fd_pipe->subdev.entity);
> > +fail_media_entity:
> > +	kfree(fd_pipe->subdev_pads);
> > +fail_subdev_pads:
> > +	v4l2_device_unregister(&fd_pipe->fd_dev->v4l2_dev);
> 
> We haven't registered the v4l2_device in this function.
> 
Fixed.

> > +	pr_err("fail_v4l2_dev: media_device_unregister and clenaup:%p",
> > +	       &fd_pipe->fd_dev->mdev);
> 
> Error messages should be printed at the place of the failure.
> 
Fixed.

> > +	media_device_unregister(&fd_pipe->fd_dev->mdev);
> > +	media_device_cleanup(&fd_pipe->fd_dev->mdev);
> 
> We haven't registered or initialized media_device in this function.
> 
Fixed.

> > +
> > +	return ret;
> > +}
> > +
> > +int mtk_fd_pipe_v4l2_unregister(struct mtk_fd_pipe *fd_pipe)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < fd_pipe->num_nodes; i++) {
> > +		video_unregister_device(&fd_pipe->nodes[i].vdev);
> > +		vb2_queue_release(&fd_pipe->nodes[i].dev_q.vbq);
> > +		media_entity_cleanup(&fd_pipe->nodes[i].vdev.entity);
> > +		mutex_destroy(&fd_pipe->nodes[i].dev_q.lock);
> > +	}
> > +
> > +	v4l2_device_unregister_subdev(&fd_pipe->subdev);
> > +	media_entity_cleanup(&fd_pipe->subdev.entity);
> > +	kfree(fd_pipe->subdev_pads);
> > +	v4l2_device_unregister(&fd_pipe->fd_dev->v4l2_dev);
> > +	media_device_unregister(&fd_pipe->fd_dev->mdev);
> > +	media_device_cleanup(&fd_pipe->fd_dev->mdev);
> 
> Please make this consistent with the registration functions. For each
> registration function there should be a matching unregister function that
> cleans up only whatever was registered in that function.
> 
Ok, I got it.
> > +
> > +	return 0;
> > +}
> > +
> > +void mtk_fd_v4l2_buffer_done(struct vb2_buffer *vb,
> > +			     enum vb2_buffer_state state)
> > +{
> > +	struct mtk_fd_pipe *fd_pipe;
> > +	struct mtk_fd_video_device *node;
> > +
> > +	fd_pipe = vb2_get_drv_priv(vb->vb2_queue);
> > +	node = mtk_fd_vbq_to_node(vb->vb2_queue);
> > +	dev_dbg(&fd_pipe->fd_dev->pdev->dev,
> > +		"%s:%s: return buf, idx(%d), state(%d)\n",
> > +		fd_pipe->desc->name, node->desc->name,
> > +		vb->index, state);
> > +	vb2_buffer_done(vb, state);
> > +}
> 
> No need for this function. Just call vb2_buffer_done() directly from the
> caller. (I already mentioned this in MTK DIP driver review. Please
> coordinate with other driver owners and make sure that similar comments are
> addressed in all drivers...)
> 
Ok, this function is removed.

> > +
> > +/********************************************
> > + * MTK FD V4L2 Settings *
> > + ********************************************/
> > +
> > +static const struct v4l2_ioctl_ops mtk_fd_v4l2_video_out_ioctl_ops = {
> > +	.vidioc_querycap = mtk_fd_videoc_querycap,
> > +	.vidioc_enum_framesizes = mtk_fd_videoc_enum_framesizes,
> > +	.vidioc_enum_fmt_vid_cap_mplane = mtk_fd_videoc_enum_fmt,
> > +	.vidioc_g_fmt_vid_cap_mplane = mtk_fd_videoc_g_fmt,
> > +	.vidioc_s_fmt_vid_cap_mplane = mtk_fd_videoc_s_fmt,
> > +	.vidioc_try_fmt_vid_cap_mplane = mtk_fd_videoc_try_fmt,
> 
> No need for *cap* ops if this is only for an OUTPUT device.
> 
Ok, we will remove it.

> > +	.vidioc_enum_fmt_vid_out_mplane = mtk_fd_videoc_enum_fmt,
> > +	.vidioc_g_fmt_vid_out_mplane = mtk_fd_videoc_g_fmt,
> > +	.vidioc_s_fmt_vid_out_mplane = mtk_fd_videoc_s_fmt,
> > +	.vidioc_try_fmt_vid_out_mplane = mtk_fd_videoc_try_fmt,
> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +	.vidioc_subscribe_event = mtk_fd_vidioc_subscribe_event,
> > +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> > +
> > +};
> > +
> > +static const struct v4l2_ioctl_ops mtk_fd_v4l2_video_cap_ioctl_ops = {
> > +	.vidioc_querycap = mtk_fd_videoc_querycap,
> > +	.vidioc_enum_framesizes = mtk_fd_videoc_enum_framesizes,
> > +	.vidioc_enum_fmt_vid_cap_mplane = mtk_fd_videoc_enum_fmt,
> > +	.vidioc_g_fmt_vid_cap_mplane = mtk_fd_videoc_g_fmt,
> > +	.vidioc_s_fmt_vid_cap_mplane = mtk_fd_videoc_s_fmt,
> > +	.vidioc_try_fmt_vid_cap_mplane = mtk_fd_videoc_try_fmt,
> > +	.vidioc_enum_fmt_vid_out_mplane = mtk_fd_videoc_enum_fmt,
> > +	.vidioc_g_fmt_vid_out_mplane = mtk_fd_videoc_g_fmt,
> > +	.vidioc_s_fmt_vid_out_mplane = mtk_fd_videoc_s_fmt,
> > +	.vidioc_try_fmt_vid_out_mplane = mtk_fd_videoc_try_fmt,
> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +	.vidioc_subscribe_event = mtk_fd_vidioc_subscribe_event,
> > +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> > +
> > +};
> 
> This structure is unused.
> 
Fixed.

> > +
> > +static const struct v4l2_ioctl_ops mtk_fd_v4l2_meta_out_ioctl_ops = {
> > +	.vidioc_querycap = mtk_fd_videoc_querycap,
> > +
> > +	.vidioc_enum_fmt_meta_cap = mtk_fd_meta_enum_format,
> > +	.vidioc_g_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
> > +	.vidioc_s_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
> > +	.vidioc_try_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
> > +
> > +	.vidioc_enum_fmt_meta_out = mtk_fd_meta_enum_format,
> > +	.vidioc_g_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
> > +	.vidioc_s_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
> > +	.vidioc_try_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
> > +
> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +};
> > +
> > +static const struct v4l2_ioctl_ops mtk_fd_v4l2_meta_cap_ioctl_ops = {
> > +	.vidioc_querycap = mtk_fd_videoc_querycap,
> > +
> > +	.vidioc_enum_fmt_meta_cap = mtk_fd_meta_enum_format,
> > +	.vidioc_g_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
> > +	.vidioc_s_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
> > +	.vidioc_try_fmt_meta_cap = mtk_fd_videoc_g_meta_fmt,
> > +
> > +	.vidioc_enum_fmt_meta_out = mtk_fd_meta_enum_format,
> > +	.vidioc_g_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
> > +	.vidioc_s_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
> > +	.vidioc_try_fmt_meta_out = mtk_fd_videoc_g_meta_fmt,
> > +
> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +};
> 
> Aren't the 2 structures above identical? Should be merged if so.
> 
Fixed.

> [snip]
> > +int mtk_fd_dev_v4l2_init(struct mtk_fd_dev *fd_dev)
> > +{
> > +	struct media_device *media_dev;
> > +	struct v4l2_device *v4l2_dev;
> > +	struct mtk_fd_smem_dev *smem_alloc_dev = &fd_dev->smem_alloc_dev;
> > +	int i;
> > +	int ret = 0;
> 
> Please don't initialize local variables unless that's needed by the logic.
> It prevents the compiler from detecting missing assignments.
> 
Ok, I got it.

> > +
> > +	media_dev = &fd_dev->mdev;
> > +	v4l2_dev = &fd_dev->v4l2_dev;
> 
> Just pass fd_dev to the functions below. No need to extract only some
> fields.
> 
Fixed.

> > +
> > +	ret = mtk_fd_dev_media_register(&fd_dev->pdev->dev,
> > +					media_dev,
> > +					 MTK_FD_PIPE_MEDIA_MODEL_NAME);
> 
> We should bail out on error.
> 
Fixed.

> > +
> > +	ret = mtk_fd_dev_v4l2_register(&fd_dev->pdev->dev,
> > +				       media_dev,
> > +					v4l2_dev);
> 
> We should clean up the previous steps and bail out on error.
> 
Fixed.

> > +
> > +	ret = mtk_fd_smem_alloc_dev_init(smem_alloc_dev, &fd_dev->pdev->dev);
> 
> Ditto.
> 
Fixed.

> > +
> > +	for (i = 0; i < MTK_FD_PIPE_ID_TOTAL_NUM; i++) {
> > +		ret = mtk_fd_pipe_init(&fd_dev->fd_pipe[i], fd_dev,
> > +				       &pipe_settings[i],
> > +					media_dev, v4l2_dev, smem_alloc_dev);
> > +		if (ret) {
> > +			dev_err(&fd_dev->pdev->dev,
> > +				"%s: Pipe id(%d) init failed(%d)\n",
> > +				fd_dev->fd_pipe[i].desc->name,
> > +				i, ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +void mtk_fd_dev_v4l2_release(struct mtk_fd_dev *fd_dev)
> > +{
> > +	int i = 0;
> 
> No need for initialization.
> 
Fixed.

> > +
> > +	if (fd_dev)
> 
> Why could it ever be NULL?
> 
Fixed.

> > +		for (i = 0; i < MTK_FD_PIPE_ID_TOTAL_NUM; i++)
> > +			mtk_fd_pipe_release(&fd_dev->fd_pipe[i]);
> > +
> > +	mtk_fd_smem_alloc_dev_release(&fd_dev->smem_alloc_dev);
> > +}
> > +
> 
> [snip]
> 
> > +static int mtk_fd_probe(struct platform_device *pdev)
> > +{
> > +	struct mtk_fd_dev *fd_dev;
> > +	struct mtk_fd_hw *fd_hw;
> > +	struct device_node *node;
> > +	struct platform_device *larb_pdev;
> > +	int irq_num;
> > +	int ret;
> > +
> > +	fd_dev = devm_kzalloc(&pdev->dev, sizeof(*fd_dev), GFP_KERNEL);
> > +
> 
> nit: No need for this blank line, because the if below is directly related.
> 
> > +	if (!fd_dev)
> > +		return -ENOMEM;
> > +
> > +	dev_set_drvdata(&pdev->dev, fd_dev);
> > +	fd_hw = &fd_dev->fd_hw;
> > +
> > +	if (!fd_hw) {
> 
> How is this possible for a struct member?
> 
Fixed.

> > +		dev_err(&pdev->dev, "Unable to allocate fd_hw\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	fd_dev->pdev = pdev;
> > +
> > +	irq_num = irq_of_parse_and_map(pdev->dev.of_node, FD_IRQ_IDX);
> 
> We should use platform_get_irq() here instead, because the IRQs were already
> parsed for us when the platform core created the platform_device.
> 
Fixed.

> > +	ret = request_irq(irq_num, (irq_handler_t)mtk_fd_irq,
> > +			  IRQF_TRIGGER_NONE, FD_DRVNAME, fd_hw);
> 
> It should be a device name, not driver name. One would normally use
> dev_name() here.
> 
> Also devm_request_irq() should simplify the cleanup.
> 
Fixed.

> > +	if (ret) {
> > +		dev_dbg(&pdev->dev, "%s request_irq fail, irq=%d\n",
> > +			__func__, irq_num);
> 
> This is an error, so dev_err().
> 
Fixed.

> > +		return ret;
> > +	}
> > +	dev_dbg(&pdev->dev, "irq_num=%d\n", irq_num);
> 
> That's probably not very useful.
> 
Fixed.

> > +
> > +	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
> > +	if (!node) {
> > +		dev_err(&pdev->dev, "no mediatek, larb found");
> > +		return -EINVAL;
> > +	}
> > +	larb_pdev = of_find_device_by_node(node);
> > +	if (!larb_pdev) {
> > +		dev_err(&pdev->dev, "no mediatek, larb device found");
> > +		return -EINVAL;
> > +	}
> > +	fd_hw->larb_dev = &larb_pdev->dev;
> > +
> 
> LARBs are handled automatically by the IOMMU driver, no need to do anything
> with them explicitly anymore.
> 
Fixed.

> > +	node = pdev->dev.of_node;
> > +	if (!node) {
> > +		dev_err(&pdev->dev, "find fd node failed!!!\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	fd_hw->fd_base = of_iomap(node, 0);
> 
> One would normally use platform_get_resource() and devm_ioremap_resource()
> here.
> 
Fixed.

> > +
> > +	if (!fd_hw->fd_base) {
> > +		dev_err(&pdev->dev, "unable to map fd node!!!\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	dev_dbg(&pdev->dev, "fd_hw->fd_base: %lx\n",
> > +		(unsigned long)fd_hw->fd_base);
> 
> Not very useful either.
> 
Fixed.

> > +
> > +	fd_hw->fd_clk = devm_clk_get(&pdev->dev, "FD_CLK_IMG_FD");
> 
> Clock names should be lowercase and name just inputs of the IP block, so
> simply "fd", should be enough.
> 
Fixed.

> > +	if (IS_ERR(fd_hw->fd_clk)) {
> > +		dev_err(&pdev->dev, "cannot get FD_CLK_IMG_FD clock\n");
> > +		return PTR_ERR(fd_hw->fd_clk);
> > +	}
> > +
> > +	pm_runtime_enable(&pdev->dev);
> > +	atomic_set(&fd_hw->fd_user_cnt, 0);
> > +	init_waitqueue_head(&fd_hw->wq);
> > +	mutex_init(&fd_hw->fd_hw_lock);
> > +	fd_hw->fd_irq_result = 0;
> > +
> > +	ret = mtk_fd_dev_v4l2_init(fd_dev);
> > +	if (ret)
> > +		dev_err(&pdev->dev, "v4l2 init failed: %d\n", ret);
> 
> We should clean up and return the error code, not 0.
> 
Fixed.

> > +
> > +	dev_info(&pdev->dev, "Mediatek Camera FD driver probe.\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_fd_remove(struct platform_device *pdev)
> > +{
> > +	int irq_i4;
> > +	struct mtk_fd_dev *fd_dev = dev_get_drvdata(&pdev->dev);
> > +
> > +	if (fd_dev) {
> > +		mtk_fd_dev_v4l2_release(fd_dev);
> > +	} else {
> 
> This is impossible.
> 
Fixed.

> > +		dev_err(&pdev->dev, "Can't find fd driver data\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	mutex_destroy(&fd_dev->fd_hw.fd_hw_lock);
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	irq_i4 = platform_get_irq(pdev, 0);
> > +	free_irq(irq_i4, NULL);
> > +	kfree(fd_dev);
> 
> fd_dev was allocated using devm_kzalloc(), no need to free it explicitly.
> 
Fixed.

> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_fd_suspend(struct device *dev)
> > +{
> > +	struct mtk_fd_dev *fd_dev;
> > +	int ret;
> > +
> > +	if (pm_runtime_suspended(dev))
> > +		return 0;
> > +
> > +	fd_dev = dev_get_drvdata(dev);
> > +
> > +	if (atomic_read(&fd_dev->fd_hw.fd_user_cnt) > 0) {
> > +		ret = pm_runtime_put_sync(fd_dev->fd_hw.larb_dev);
> > +		clk_disable_unprepare(fd_dev->fd_hw.fd_clk);
> > +		return ret;
> > +	}
> 
> This isn't going to work, because the hardware may be still processing a
> frame at this point. You need a way to ensure that the hardware goes idle
> here first and then in resume, you need to make the hardware continue when
> it left before suspend.
> 
For this part, I would like to do as following:
when suspend, it should set the driver power state as idle or suspended
to stop further enqueue jobs, should be judged in mtk_fd_hw_job_exec()
or somewhere, then wait for the unfinished job return or timeout, and
finally close the clock.
When resume, we set the driver power state as resumed and let the new
jobs to be enqueued.

Or another way is to create a wait queue or work queue to store the jobs
from user. When suspend, we change the driver status to restrict the new
jobs joining to work queue and close the clock. When resume, driver
continue execute the jobs from the work queue.

> > +	return 0;
> > +}
> > +
> > +static int mtk_fd_resume(struct device *dev)
> > +{
> > +	struct mtk_fd_dev *fd_dev;
> > +	int ret;
> > +
> > +	if (pm_runtime_suspended(dev))
> > +		return 0;
> > +
> > +	fd_dev = dev_get_drvdata(dev);
> > +
> > +	if (atomic_read(&fd_dev->fd_hw.fd_user_cnt) > 0) {
> > +		ret = pm_runtime_get_sync(fd_dev->fd_hw.larb_dev);
> > +		if (ret) {
> > +			dev_dbg(&fd_dev->pdev->dev, "open larb clk failed\n");
> > +			return ret;
> > +		}
> > +
> > +		ret = clk_prepare_enable(fd_dev->fd_hw.fd_clk);
> > +		if (ret) {
> > +			dev_dbg(&fd_dev->pdev->dev, "open fd clk failed\n");
> > +			return ret;
> > +		}
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops mtk_fd_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(mtk_fd_suspend, mtk_fd_resume)
> > +	SET_RUNTIME_PM_OPS(mtk_fd_suspend, mtk_fd_resume, NULL)
> > +};
> > +
> > +static const struct of_device_id mtk_fd_of_ids[] = {
> > +	{ .compatible = "mediatek,mt8183-fd", },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_fd_of_ids);
> > +
> > +static struct platform_driver mtk_fd_driver = {
> > +	.probe   = mtk_fd_probe,
> > +	.remove  = mtk_fd_remove,
> > +	.driver  = {
> > +		.name  = FD_DRVNAME,
> 
> Please just set the name explicitly here and remove the macro.
> 
Fixed.

> > +		.of_match_table = mtk_fd_of_ids,
> 
> Please use of_match_ptr().
> 
Fixed.

> > +		.pm = &mtk_fd_pm_ops,
> > +	}
> > +};
> > +module_platform_driver(mtk_fd_driver);
> > +
> > +MODULE_DESCRIPTION("Mediatek FD driver");
> > +MODULE_LICENSE("GPL");
> 
> GPL v2
> 
> > -- 
> > 2.18.0
> > 
Sincerely,

Jerry

