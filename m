Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684FFC86C0
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 12:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfJBK4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 06:56:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:2158 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726694AbfJBK4H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 06:56:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 03:56:07 -0700
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; 
   d="scan'208";a="216414918"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 03:56:02 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E87CC20976; Wed,  2 Oct 2019 13:55:59 +0300 (EEST)
Date:   Wed, 2 Oct 2019 13:55:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org,
        laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        christie.yu@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com,
        seraph.huang@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org
Subject: Re: [RFC,V2,07/11] media: platform: Add Mediatek ISP P1 private
 control
Message-ID: <20191002105559.GC972@paasikivi.fi.intel.com>
References: <jungo.lin@mediatek.com>
 <20190510015755.51495-8-jungo.lin@mediatek.com>
 <49a8ba54-aba4-1915-6732-987a58e8bd3c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a8ba54-aba4-1915-6732-987a58e8bd3c@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo, Hans,

On Mon, May 13, 2019 at 10:46:46AM +0200, Hans Verkuil wrote:
> On 5/10/19 3:58 AM, Jungo Lin wrote:
...
> > +struct v4l2_ctrl_config mtk_cam_controls[] = {
> > +	{
> > +	.ops = &mtk_cam_dev_ctrl_ops,
> > +	.id = V4L2_CID_PRIVATE_GET_BIN_INFO,
> 
> Don't use "PRIVATE" in the name. I'd replace that with MTK to indicate
> that this is mediatek-specific. Same for the next control below.
> 
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

Jungo: what's the purpose of 

> 
> Although you have to describe in the header or here what that means.
> 
> Private controls should be well documented.
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

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
