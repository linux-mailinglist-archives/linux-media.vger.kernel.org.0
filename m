Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDCA01C335
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 08:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfENGXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 02:23:32 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:60542 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725866AbfENGXc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 02:23:32 -0400
X-UUID: 0610b7c3d51243d38803326d708de7b0-20190514
X-UUID: 0610b7c3d51243d38803326d708de7b0-20190514
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1307224132; Tue, 14 May 2019 14:23:22 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 May 2019 14:23:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 14:23:15 +0800
Message-ID: <1557814995.8395.7.camel@mtksdccf07>
Subject: Re: [RFC,V2,07/11] media: platform: Add Mediatek ISP P1 private
 control
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <tfiga@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <seraph.huang@mediatek.com>,
        <ryan.yu@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>
Date:   Tue, 14 May 2019 14:23:15 +0800
In-Reply-To: <49a8ba54-aba4-1915-6732-987a58e8bd3c@xs4all.nl>
References: <Jungo Lin <jungo.lin@mediatek.com>
         <20190510015755.51495-8-jungo.lin@mediatek.com>
         <49a8ba54-aba4-1915-6732-987a58e8bd3c@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: A6C92AFC9AF8422C6BA4AE83C062E28003A7DB75F6F8AE730D763C6854F5A3F72000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for your comments.

On Mon, 2019-05-13 at 10:46 +0200, Hans Verkuil wrote:
> On 5/10/19 3:58 AM, Jungo Lin wrote:
> > Reserved Mediatek ISP P1 private control number with 16.
> > Moreover, add two private controls for ISP P1 user space
> > usage.
> > 
> > 1. V4L2_CID_PRIVATE_GET_BIN_INFO
> > - Provide the image output width & height in case
> > camera binning mode is enabled.
> > 
> > 2. V4L2_CID_PRIVATE_RAW_PATH
> > - Export the path control of the main stream to user space.
> > One is pure raw and the other is processing raw.
> > The default image path is pure raw.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> >  .../mtk-isp/isp_50/cam/mtk_cam-ctrl.c         | 133 ++++++++++++++++++
> >  .../mtk-isp/isp_50/cam/mtk_cam-ctrl.h         |  32 +++++
> >  include/uapi/linux/v4l2-controls.h            |   4 +
> >  3 files changed, 169 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
> >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h
> > 
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
> > new file mode 100644
> > index 000000000000..520adbe367ed
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
> > @@ -0,0 +1,133 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Ryan Yu <ryan.yu@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> 
> Don't combine both SPDX and a license text. Just use the SPDX.
> 
> I see it being used elsewhere as well, so I won't repeat myself.
> 

Ok, we will revise the license declaration and only keep SPDX license
only as below in all files.

// SPDX-License-Identifier: GPL-2.0
//
// Copyright (c) 2019 MediaTek Inc.

> > +
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include "mtk_cam-dev.h"
> > +#include "mtk_cam-ctrl.h"
> > +#include "mtk_cam.h"
> > +
> > +static int handle_ctrl_get_bin_info(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> > +	const unsigned int idx = MTK_CAM_P1_MAIN_STREAM_OUT;
> > +	struct v4l2_format *imgo_fmt = &cam_dev->mem2mem2_nodes[idx].vdev_fmt;
> > +	unsigned int width, height;
> > +
> > +	width = imgo_fmt->fmt.pix_mp.width;
> > +	height = imgo_fmt->fmt.pix_mp.height;
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "Get bin info w*h:%d*%d",
> > +		width, height);
> > +
> > +	ctrl->val = (width << 16) | height;
> > +
> > +	return 0;
> > +}
> > +
> > +static int handle_ctrl_get_raw_path(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> > +	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
> > +
> > +	ctrl->val = p1_dev->isp_ctx.isp_raw_path;
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "Get raw path:%d", ctrl->val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int handle_ctrl_set_raw_path(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct mtk_cam_dev *cam_dev = ctrl->priv;
> > +	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
> > +
> > +	p1_dev->isp_ctx.isp_raw_path = ctrl->val;
> > +	dev_dbg(&cam_dev->pdev->dev, "Set raw path:%d", ctrl->val);
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_dev_g_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_PRIVATE_GET_BIN_INFO:
> > +		handle_ctrl_get_bin_info(ctrl);
> > +		break;
> > +	case V4L2_CID_PRIVATE_RAW_PATH:
> > +		handle_ctrl_get_raw_path(ctrl);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int mtk_cam_dev_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_PRIVATE_RAW_PATH:
> > +		return handle_ctrl_set_raw_path(ctrl);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static const struct v4l2_ctrl_ops mtk_cam_dev_ctrl_ops = {
> > +	.g_volatile_ctrl = mtk_cam_dev_g_ctrl,
> > +	.s_ctrl = mtk_cam_dev_s_ctrl,
> > +};
> > +
> > +struct v4l2_ctrl_config mtk_cam_controls[] = {
> > +	{
> > +	.ops = &mtk_cam_dev_ctrl_ops,
> > +	.id = V4L2_CID_PRIVATE_GET_BIN_INFO,
> 
> Don't use "PRIVATE" in the name. I'd replace that with MTK to indicate
> that this is mediatek-specific. Same for the next control below.
> 

We will adopt your suggestion and revise these naming in the next patch.

> > +	.name = "MTK CAM GET BIN INFO",
> > +	.type = V4L2_CTRL_TYPE_INTEGER,
> > +	.min = (IMG_MIN_WIDTH << 16) | IMG_MIN_HEIGHT,
> > +	.max = (IMG_MAX_WIDTH << 16) | IMG_MAX_HEIGHT,
> > +	.step = 1,
> > +	.def = (IMG_MAX_WIDTH << 16) | IMG_MAX_HEIGHT,
> > +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> 
> Don't mix width and height. I recommend splitting this into two controls.
> 
> Sakari might have an opinion on this as well.
> 

Ok, we will split this control into different two controls for width &
height usage.  

> > +	},
> > +	{
> > +	.ops = &mtk_cam_dev_ctrl_ops,
> > +	.id = V4L2_CID_PRIVATE_RAW_PATH,
> > +	.name = "MTK CAM RAW PATH",
> > +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> > +	.min = 0,
> > +	.max = 1,
> > +	.step = 1,
> > +	.def = 1,
> > +	},
> 
> RAW_PATH is a very vague name. If it is 0, then it is pure raw, and if it
> is 1, then it is 'processing raw'? If so, call it "Processing Raw".
> 
> Although you have to describe in the header or here what that means.
> 
> Private controls should be well documented.

Yes, you are right. We will rename this control to
V4L2_CID_MTK_PROCESSING_RAW and describes its usage in detail.

> 
> > +};
> > +
> > +int mtk_cam_ctrl_init(struct mtk_cam_dev *cam_dev,
> > +		      struct v4l2_ctrl_handler *hdl)
> > +{
> > +	unsigned int i;
> > +
> > +	/* Initialized HW controls, allow V4L2_CID_MTK_CAM_MAX ctrls */
> > +	v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_CAM_MAX);
> > +	if (hdl->error) {
> > +		v4l2_ctrl_handler_free(hdl);
> > +		return hdl->error;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(mtk_cam_controls); i++)
> > +		v4l2_ctrl_new_custom(hdl, &mtk_cam_controls[i], cam_dev);
> > +
> > +	dev_dbg(&cam_dev->pdev->dev, "%s done", __func__);
> > +	return 0;
> > +}
> > diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h
> > new file mode 100644
> > index 000000000000..74a6538c81ac
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Ryan Yu <ryan.yu@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef __MTK_CAM_CTRL_H__
> > +#define __MTK_CAM_CTRL_H__
> > +
> > +#include <media/v4l2-ctrls.h>
> > +
> > +#define V4L2_CID_MTK_CAM_PRIVATE_CAM  V4L2_CID_USER_MTK_CAM_BASE
> > +#define V4L2_CID_PRIVATE_GET_BIN_INFO \
> > +	(V4L2_CID_MTK_CAM_PRIVATE_CAM + 1)
> > +#define V4L2_CID_PRIVATE_RAW_PATH \
> > +	(V4L2_CID_MTK_CAM_PRIVATE_CAM + 2)
> 
> These last two defines can be on a single line.
> 
> They need to be documented in the header.
> 

Ok, we will pay attenuation on this.
We will provide the detail information of these controls in next patch.

> > +
> > +#define V4L2_CID_MTK_CAM_MAX	16
> > +
> > +int mtk_cam_ctrl_init(struct mtk_cam_dev *cam_dev,
> > +		      struct v4l2_ctrl_handler *hdl);
> > +
> > +#endif /* __MTK_CAM_CTRL_H__ */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 06479f2fb3ae..cbe8f5f7782b 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -192,6 +192,10 @@ enum v4l2_colorfx {
> >   * We reserve 16 controls for this driver. */
> >  #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
> >  
> > +/* The base for the mediatek ISP Pass 1 driver controls */
> > +/* We reserve 16 controls for this driver. */
> > +#define V4L2_CID_USER_MTK_CAM_BASE		(V4L2_CID_USER_BASE + 0x10c0)
> > +
> >  /* MPEG-class control IDs */
> >  /* The MPEG controls are applicable to all codec controls
> >   * and the 'MPEG' part of the define is historical */
> > 
> 
> Regards,
> 
> 	Hans

Best regards,

Jungo

