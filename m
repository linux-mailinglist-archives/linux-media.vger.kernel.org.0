Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3071E7EF40
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2019 10:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404161AbfHBI2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Aug 2019 04:28:25 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41880 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404147AbfHBI2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Aug 2019 04:28:25 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so25354360pgg.8
        for <linux-media@vger.kernel.org>; Fri, 02 Aug 2019 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eQxQ79gnES252LoRvQXY8UpntVW/XhQkExx8sFrON9s=;
        b=S3HCF2X6dkm9bhED8QXs491dH4CHhlZsrEaxoDN7H70RYd8m6lzIMgDxcmB6wnV815
         e8WbDDBiHn7jEwKlT9YwDi/FfU6ZV1C2yWpcXauLVL3TpJP2Ve1gaprhdwdVV1/WTj2y
         +DVXWsegcXNSl0GgiUhxM7DCevKRMB9BxueRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eQxQ79gnES252LoRvQXY8UpntVW/XhQkExx8sFrON9s=;
        b=ckqErpNULWvRlN4zcBw4oXJlhNSJm5EL7X5wvvXNvKOpP/cmET98ATISSN7plE46o6
         DlYPApDEeoLVK4hdnOcr4lOVtQGD9M0ETdd1SV0ahlrV2wm36lq8/6DFoTI0uYdpAkDX
         foBRfXECrKZ0bCZ+wSptfI5QwuZ/umKKxgN5kSTiOxVycs1pHwa7BdLbsblwe/KPST2m
         KebMtxjLylE4RGH+tTJ7NLjE84qB1goyYeuIF8l9uJAmCZkmLEiEOB1AJLGrE4vhEo7Z
         H5dkXkajPALswM+E6cVT68yvX2j1Nz8GjS6ie4DJq6Ujj1kvRFAP6iQsETdh4zBPSnaD
         rDuw==
X-Gm-Message-State: APjAAAW+DRLWcjXWab6NAHuAVTVDv8B+bVRoiHfYOULOgoSPej43FwVp
        pTuQZLVmBQgrSgoz7LC9wYhPoA==
X-Google-Smtp-Source: APXvYqw7tDCCESSlctnV4UOvfQNpzHOGPMAQGIVeX5cKxmoo77+v5ARedPKwDRuhIoqhjC8OGmqxGQ==
X-Received: by 2002:a63:8dc9:: with SMTP id z192mr68136025pgd.151.1564734503298;
        Fri, 02 Aug 2019 01:28:23 -0700 (PDT)
Received: from chromium.org ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id z13sm6422673pjn.32.2019.08.02.01.28.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 02 Aug 2019 01:28:22 -0700 (PDT)
Date:   Fri, 2 Aug 2019 17:28:15 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        matthias.bgg@gmail.com, mchehab@kernel.org, yuzhao@chromium.org,
        zwisler@chromium.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, po-yang.huang@mediatek.com,
        shik@chromium.org, suleiman@chromium.org,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
Message-ID: <20190802082815.GA203993@chromium.org>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jerry,

On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> This patch adds the driver of Face Detection (FD) unit in
> Mediatek camera system, providing face detection function.
> 
> The mtk-isp directory will contain drivers for multiple IP
> blocks found in Mediatek ISP system. It will include ISP Pass 1
> driver (CAM), sensor interface driver, DIP driver and face
> detection driver.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> ---
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
>  drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  157 +++
>  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1259 +++++++++++++++++++++++++
>  include/uapi/linux/v4l2-controls.h            |    4 +
>  5 files changed, 1427 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
>  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
>

Thanks for the patch! I finally got a chance to fully review the code. Sorry
for the delay. Please check my comments inline.

> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index e6deb25..8b817cc 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -94,6 +94,8 @@ obj-$(CONFIG_VIDEO_MEDIATEK_MDP)	+= mtk-mdp/
>  
>  obj-$(CONFIG_VIDEO_MEDIATEK_JPEG)	+= mtk-jpeg/
>  
> +obj-$(CONFIG_VIDEO_MEDIATEK_FD)		+= mtk-isp/fd/
> +
>  obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
>  
>  obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
> diff --git a/drivers/media/platform/mtk-isp/fd/Makefile b/drivers/media/platform/mtk-isp/fd/Makefile
> new file mode 100644
> index 0000000..9b1c501
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/fd/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +mtk-fd-objs += mtk_fd_40.o
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_FD) += mtk-fd.o
> \ No newline at end of file
> diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd.h b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> new file mode 100644
> index 0000000..289999b
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +//
> +// Copyright (c) 2018 MediaTek Inc.
> +
> +#ifndef __MTK_FD_HW_H__
> +#define __MTK_FD_HW_H__
> +
> +#include <linux/io.h>
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define MTK_FD_OUTPUT_MIN_WIDTH			26U
> +#define MTK_FD_OUTPUT_MIN_HEIGHT		26U
> +#define MTK_FD_OUTPUT_MAX_WIDTH			640U
> +#define MTK_FD_OUTPUT_MAX_HEIGHT		480U
> +
> +/* Control the user defined image widths and heights
> + * to be scaled and performed face detection in FD HW.
> + * MTK FD support up to 14 user defined image sizes to perform face detection.
> + */
> +#define V4L2_CID_MTK_FD_SCALE_IMG_WIDTH		(V4L2_CID_USER_MTK_FD_BASE + 1)
> +#define V4L2_CID_MTK_FD_SCALE_IMG_HEIGHT	(V4L2_CID_USER_MTK_FD_BASE + 2)
> +
> +/* Control the numbers of user defined image sizes.
> + * The default value is 0 which means user is not going
> + * to define the specific image sizes.
> + */
> +#define V4L2_CID_MTK_FD_SCALE_IMG_NUM		(V4L2_CID_USER_MTK_FD_BASE + 3)
> +
> +/* Control the Face Pose to be detected.
> + * Here describe the value as following:
> + * {0, detect the front face with rotation from 0 to 270 degrees},
> + * {1, detect the front face with rotation from 0 to 240 and 300 degrees},
> + * {2, detect the front face with rotation from 0 to 240 and 330 degrees},
> + * {3, detect the front face with rotation from 0 to 240 and left side face}.
> + */
> +#define V4L2_CID_MTK_FD_DETECT_POSE		(V4L2_CID_USER_MTK_FD_BASE + 4)
> +#define V4L2_CID_MTK_FD_DETECT_SPEEDUP		(V4L2_CID_USER_MTK_FD_BASE + 5)
> +#define V4L2_CID_MTK_FD_EXTRA_MODEL		(V4L2_CID_USER_MTK_FD_BASE + 6)
> +
> +/* We reserve 16 controls for this driver. */
> +#define V4L2_CID_MTK_FD_MAX			16
> +
> +#define ENABLE_FD				0x111
> +#define FD_HW_ENABLE				0x4
> +#define FD_INT_EN				0x15c
> +#define FD_INT					0x168
> +#define FD_RESULT				0x178
> +#define FD_IRQ_MASK				0x001
> +
> +#define RS_MAX_BUF_SIZE				2288788
> +#define FD_MAX_SPEEDUP				7
> +#define FD_MAX_POSE_VAL				0xfffffffffffffff
> +#define FD_DEF_POSE_VAL				0x3ff
> +#define MAX_FD_SEL_NUM				1026
> +
> +/* The max. number of face sizes could be detected, for feature scaling */
> +#define FACE_SIZE_NUM_MAX			14
> +/* FACE_SIZE_NUM_MAX + 1, first scale for input image W/H */
> +#define FD_SCALE_NUM				15
> +
> +enum fd_state {
> +	FD_ENQ,
> +	FD_CBD,
> +};
> +
> +enum fd_img_format {
> +	FMT_VYUY = 2,
> +	FMT_UYVY,
> +	FMT_YVYU,
> +	FMT_YUYV,
> +	FMT_UNKNOWN
> +};

Please use #define macros for hardware/firmware interface definitions.

> +
> +struct fd_buffer {
> +	__u32 scp_addr;	/* used by SCP */
> +	__u32 dma_addr;	/* used by DMA HW */
> +} __packed;
> +
> +enum fd_scp_cmd {
> +	FD_CMD_INIT,
> +	FD_CMD_ENQUEUE,
> +};

Ditto.

> +
> +struct fd_user_output {
> +	__u64 results[MAX_FD_SEL_NUM];
> +	__u16 number;
> +};
> +
> +struct user_param {
> +	u8 fd_pose;
> +	u8 fd_speedup;
> +	u8 fd_extra_model;
> +	u8 scale_img_num;
> +	u8 src_img_fmt;
> +	__u16 scale_img_width[FD_SCALE_NUM];
> +	__u16 scale_img_height[FD_SCALE_NUM];
> +} __packed;
> +
> +struct fd_hw_param {
> +	struct fd_buffer src_img;
> +	struct fd_buffer user_result;
> +	struct user_param user_param;
> +} __packed;
> +
> +struct cmd_init_info {
> +	struct fd_buffer fd_manager;
> +	__u32 rs_dma_addr;
> +} __packed;
> +
> +struct ipi_message {
> +	u8 cmd_id;
> +	union {
> +		struct cmd_init_info init_param;
> +		struct fd_hw_param hw_param;
> +	};
> +} __packed;
> +
> +struct mtk_fd_hw {
> +	struct clk *fd_clk;
> +	struct rproc *rproc_handle;
> +	struct platform_device *scp_pdev;
> +	struct fd_buffer scp_mem;
> +	wait_queue_head_t wq;
> +	void __iomem *fd_base;
> +	atomic_t fd_user_cnt;
> +	enum fd_state state;
> +	u32 fd_irq_result;
> +	/* Ensure only one job in hw */
> +	struct mutex fd_hw_lock;
> +};
> +
> +struct mtk_fd_dev {
> +	struct platform_device *pdev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_m2m_dev *m2m_dev;
> +	struct media_device mdev;
> +	struct video_device vfd;
> +	struct mtk_fd_hw fd_hw;

Could we just put the contents of that struct directly here? That should
simplify dereference chains in the code.

> +	/* Lock for V4L2 operations */
> +	struct mutex vfd_lock;
> +};
> +
> +struct mtk_fd_ctx {
> +	struct mtk_fd_dev *fd_dev;
> +	struct device *dev;
> +	struct v4l2_fh fh;
> +	struct v4l2_ctrl_handler hdl;
> +	struct v4l2_pix_format_mplane src_fmt;
> +	struct v4l2_meta_format dst_fmt;
> +	struct user_param user_param;
> +};
> +
> +#endif/*__MTK_FD_HW_H__*/
> diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd_40.c b/drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> new file mode 100644
> index 0000000..246d3aa
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> @@ -0,0 +1,1259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2018 MediaTek Inc.
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_data/mtk_scp.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <linux/wait.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-core.h>
> +
> +#include "mtk_fd.h"
> +
> +static struct v4l2_meta_format fw_param_fmts[] = {

const?

Also, isn't this the buffer with the detected faces rather than params?

> +	{
> +		.dataformat = V4L2_META_FMT_MTISP_PARAMS,

This should use its own format.

> +		.buffersize = 1024 * 30,

Please define a C struct for this buffer and use sizeof() here.

> +	},
> +};

Actually, is there a reason to have this array at all if there is only 1
format supported? I think we could just put the right constants directly in
the code.

> +
> +static const struct v4l2_pix_format_mplane in_img_fmts[] = {
> +	{
> +		.width = MTK_FD_OUTPUT_MAX_WIDTH,
> +		.height = MTK_FD_OUTPUT_MAX_HEIGHT,
> +		.pixelformat = V4L2_PIX_FMT_VYUY,
> +		.colorspace = V4L2_COLORSPACE_BT2020,
> +		.field = V4L2_FIELD_NONE,
> +		.num_planes = 1,
> +	},
> +	{
> +		.width = MTK_FD_OUTPUT_MAX_WIDTH,
> +		.height = MTK_FD_OUTPUT_MAX_HEIGHT,
> +		.pixelformat = V4L2_PIX_FMT_YUYV,
> +		.colorspace = V4L2_COLORSPACE_BT2020,
> +		.field = V4L2_FIELD_NONE,
> +		.num_planes = 1,
> +	},
> +	{
> +		.width = MTK_FD_OUTPUT_MAX_WIDTH,
> +		.height = MTK_FD_OUTPUT_MAX_HEIGHT,
> +		.pixelformat = V4L2_PIX_FMT_YVYU,
> +		.colorspace = V4L2_COLORSPACE_BT2020,
> +		.field = V4L2_FIELD_NONE,
> +		.num_planes = 1,
> +	},
> +	{
> +		.width = MTK_FD_OUTPUT_MAX_WIDTH,
> +		.height = MTK_FD_OUTPUT_MAX_HEIGHT,
> +		.pixelformat = V4L2_PIX_FMT_UYVY,
> +		.colorspace = V4L2_COLORSPACE_BT2020,
> +		.field = V4L2_FIELD_NONE,
> +		.num_planes = 1,

If all the formats have the same values for a field, there is no reason to
have the field initialized here. Just make initialize them to the constant
values inside TRY_FMT.

Hmm, are the interleaved YUV formats the only formats supported by this
hardware? That would be quite unfortunate given the formats supported by the
other IP blocks on this SoC use the more typical planar formats.

> +	},
> +};
> +
> +#define NUM_FORMATS ARRAY_SIZE(in_img_fmts)
> +
> +static inline struct mtk_fd_dev *mtk_fd_hw_to_dev(struct mtk_fd_hw *fd_hw)
> +{
> +	return container_of(fd_hw, struct mtk_fd_dev, fd_hw);
> +}
> +
> +static inline struct mtk_fd_ctx *fh_to_ctx(struct v4l2_fh *fh)
> +{
> +	return container_of(fh, struct mtk_fd_ctx, fh);
> +}
> +
> +static int mtk_fd_load_scp(struct mtk_fd_hw *fd_hw)
> +{
> +	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
> +	struct device *dev = &fd_dev->pdev->dev;
> +	phandle rproc_phandle;
> +	int ret;
> +
> +	/* init scp */
> +	fd_hw->scp_pdev = scp_get_pdev(fd_dev->pdev);
> +	if (!fd_hw->scp_pdev) {
> +		dev_err(dev, "Failed to get scp device\n");
> +		return -ENODEV;
> +	}
> +
> +	if (of_property_read_u32(fd_dev->pdev->dev.of_node, "mediatek,scp",
> +				 &rproc_phandle)) {
> +		dev_err(dev, "Could not get scp device\n");
> +		return -EINVAL;
> +	}
> +
> +	fd_hw->rproc_handle = rproc_get_by_phandle(rproc_phandle);
> +	if (!fd_hw->rproc_handle) {
> +		dev_err(dev, "Could not get FD's rproc_handle\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = rproc_boot(fd_hw->rproc_handle);
> +	if (ret < 0) {
> +		/**
> +		 * Return 0 if downloading firmware successfully,
> +		 * otherwise it is failed
> +		 */
> +		dev_err(dev, "rproc_boot failed\n");
> +		return -ENODEV;
> +	}
> +
> +	return ret;
> +}
> +
> +static dma_addr_t mtk_fd_hw_alloc_rs_dma_addr(struct mtk_fd_hw *fd_hw)
> +{
> +	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
> +	struct device *dev = &fd_dev->pdev->dev;
> +	void *va;
> +	dma_addr_t dma_handle;
> +
> +	va = dma_alloc_coherent(dev, RS_MAX_BUF_SIZE, &dma_handle, GFP_KERNEL);

I see this allocated here, but I don't see this freed anywhere.

> +	if (!va) {
> +		dev_err(dev, "dma_alloc null va\n");
> +		return -ENOMEM;
> +	}
> +	memset(va, 0, RS_MAX_BUF_SIZE);
> +
> +	return dma_handle;
> +}
> +
> +static int mtk_fd_send_ipi_init(struct mtk_fd_hw *fd_hw)
> +{
> +	struct ipi_message fd_init_msg;
> +	dma_addr_t rs_dma_addr;
> +
> +	fd_init_msg.cmd_id = FD_CMD_INIT;
> +
> +	fd_init_msg.init_param.fd_manager.scp_addr = fd_hw->scp_mem.scp_addr;
> +	fd_init_msg.init_param.fd_manager.dma_addr = fd_hw->scp_mem.dma_addr;
> +
> +	rs_dma_addr = mtk_fd_hw_alloc_rs_dma_addr(fd_hw);
> +	if (!rs_dma_addr)
> +		return -ENOMEM;
> +
> +	fd_init_msg.init_param.rs_dma_addr = rs_dma_addr;
> +
> +	return scp_ipi_send(fd_hw->scp_pdev, SCP_IPI_FD_CMD, &fd_init_msg,
> +			    sizeof(fd_init_msg), 0);
> +}
> +
> +static int mtk_fd_hw_enable(struct mtk_fd_hw *fd_hw)
> +{
> +	int ret;
> +
> +	ret = mtk_fd_load_scp(fd_hw);
> +	if (ret)
> +		return ret;
> +
> +	ret = mtk_fd_send_ipi_init(fd_hw);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_hw_connect(struct mtk_fd_hw *fd_hw)
> +{
> +	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
> +	s32 usercount;
> +
> +	mutex_lock(&fd_hw->fd_hw_lock);

First of all, we don't need a mutex here, because all the V4L2 ioctls are
already running with the video device mutex.

> +	usercount = atomic_inc_return(&fd_hw->fd_user_cnt);

If we already use a mutex, there is no point in using atomic types.

> +	if (usercount == 1) {
> +		pm_runtime_get_sync(&fd_dev->pdev->dev);
> +		if (mtk_fd_hw_enable(fd_hw)) {
> +			pm_runtime_put_sync(&fd_dev->pdev->dev);
> +			atomic_dec_return(&fd_hw->fd_user_cnt);
> +			mutex_unlock(&fd_hw->fd_hw_lock);
> +			return -EINVAL;
> +		}
> +	}

This is a simple mem-to-mem device, so there is no reason to keep it active
all the time it's streaming. Please just get the runtime PM counter when
queuing a job to the hardware and release it when the job finishes.

I guess we might still want to do the costly operations like rproc_boot()
when we start streaming, though.

> +	mutex_unlock(&fd_hw->fd_hw_lock);
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_wait_irq(struct mtk_fd_hw *fd_hw)
> +{
> +	int timeout;
> +	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
> +	struct device *dev = &fd_dev->pdev->dev;
> +
> +	timeout = wait_event_interruptible_timeout
> +		(fd_hw->wq, (fd_hw->fd_irq_result & FD_IRQ_MASK),
> +		 usecs_to_jiffies(1000000));
> +	if (!timeout) {
> +		dev_err(dev, "%s timeout, %d\n", __func__,
> +			fd_hw->fd_irq_result);
> +		return -EAGAIN;
> +	} else if (!(fd_hw->fd_irq_result & FD_IRQ_MASK)) {
> +		dev_err(dev, "%s No IRQ mask:0x%8x\n",
> +			__func__, fd_hw->fd_irq_result);
> +		return -EINVAL;
> +	}
> +	fd_hw->fd_irq_result = 0;
> +
> +	return 0;
> +}
> +
> +static void mtk_fd_hw_disconnect(struct mtk_fd_hw *fd_hw)
> +{
> +	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
> +	s32 usercount;
> +
> +	mutex_lock(&fd_hw->fd_hw_lock);
> +	atomic_dec_return(&fd_hw->fd_user_cnt);
> +	usercount = atomic_read(&fd_hw->fd_user_cnt);
> +	if (usercount == 0) {
> +		if (fd_hw->state == FD_ENQ)
> +			mtk_fd_wait_irq(fd_hw);

This shouldn't be possible to happen as the queues should be already stopped
at this point.

> +
> +		pm_runtime_put_sync(&fd_dev->pdev->dev);

Any reason to use pm_runtime_put_sync() over pm_runtime_put()?

> +		rproc_shutdown(fd_hw->rproc_handle);
> +		rproc_put(fd_hw->rproc_handle);
> +	}
> +	mutex_unlock(&fd_hw->fd_hw_lock);
> +}
> +
> +static void mtk_fd_hw_job_finish(struct mtk_fd_hw *fd_hw,
> +				 struct fd_hw_param *fd_param,
> +				 enum vb2_buffer_state vb_state)
> +{
> +	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
> +	struct mtk_fd_ctx *ctx;
> +	struct device *dev = &fd_dev->pdev->dev;
> +	struct vb2_buffer *src_vb, *dst_vb;
> +	struct vb2_v4l2_buffer *src_vbuf = NULL, *dst_vbuf = NULL;
> +
> +	ctx = v4l2_m2m_get_curr_priv(fd_dev->m2m_dev);
> +	if (!ctx) {
> +		dev_err(dev, "Instance released before end of transaction\n");
> +		return;
> +	}

This shouldn't be possible. I suspect you're seeing this because
.stop_streaming is not implemented correctly. See my comment there.

> +
> +	src_vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	if (WARN_ON(!src_vb))
> +		return;

This shouldn't be possible.

> +	src_vbuf = to_vb2_v4l2_buffer(src_vb);
> +
> +	dst_vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	if (WARN_ON(!dst_vb))
> +		return;

Ditto.

> +	dst_vbuf = to_vb2_v4l2_buffer(dst_vb);
> +
> +	dst_vbuf->vb2_buf.timestamp = src_vbuf->vb2_buf.timestamp;
> +	dst_vbuf->timecode = src_vbuf->timecode;
> +	dst_vbuf->flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
> +	dst_vbuf->flags |= src_vbuf->flags & V4L2_BUF_FLAG_TSTAMP_SRC_MASK;

We should be able to just use v4l2_m2m_buf_copy_metadata().

> +
> +	v4l2_m2m_buf_done(src_vbuf, vb_state);
> +	v4l2_m2m_buf_done(dst_vbuf, vb_state);
> +	v4l2_m2m_job_finish(fd_dev->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
> +static int mtk_fd_hw_job_exec(struct mtk_fd_hw *fd_hw,
> +			      struct fd_hw_param *fd_param,
> +			      void *output_vaddr)
> +{
> +	struct fd_user_output *fd_output;
> +	struct ipi_message fd_ipi_msg;
> +	int ret;
> +	u32 num;
> +
> +	if (fd_param->user_param.src_img_fmt == FMT_UNKNOWN)
> +		goto param_err;

Is this possible?

> +
> +	mutex_lock(&fd_hw->fd_hw_lock);
> +	fd_hw->state = FD_ENQ;

What is this state for?

> +	fd_ipi_msg.cmd_id = FD_CMD_ENQUEUE;
> +	memcpy(&fd_ipi_msg.hw_param, fd_param, sizeof(fd_ipi_msg.hw_param));
> +	ret = scp_ipi_send(fd_hw->scp_pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
> +			   sizeof(fd_ipi_msg), 0);
> +	if (ret)
> +		goto buf_err;
> +
> +	ret = mtk_fd_wait_irq(fd_hw);
> +	if (ret)
> +		goto buf_err;

This function is called from device_run and it shouldn't be synchronous. It
should only queue the job to the hardware to be handled asynchronously when
it finishes.

> +
> +	num = readl(fd_hw->fd_base + FD_RESULT);
> +	/* Disable FD ISR */
> +	writel(0x0, fd_hw->fd_base + FD_INT_EN);
> +
> +	fd_output = (struct fd_user_output *)output_vaddr;
> +	fd_output->number = num;
> +	fd_hw->state = FD_CBD;
> +	mutex_unlock(&fd_hw->fd_hw_lock);
> +
> +	mtk_fd_hw_job_finish(fd_hw, fd_param, VB2_BUF_STATE_DONE);
> +	return 0;
> +
> +buf_err:
> +	mutex_unlock(&fd_hw->fd_hw_lock);
> +param_err:
> +	mtk_fd_hw_job_finish(fd_hw, fd_param, VB2_BUF_STATE_ERROR);
> +	return ret;
> +}
> +
> +static int mtk_fd_vb2_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_buf->field = V4L2_FIELD_NONE;

We need to fail with -EINVAL if v4l2_buf->field was different than
V4L2_FIELD_ANY or _NONE.

> +
> +	return 0;
> +}
> +
> +static int mtk_fd_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct device *dev = ctx->dev;
> +	struct v4l2_pix_format_mplane *pixfmt;
> +
> +	switch (vq->type) {
> +	case V4L2_BUF_TYPE_META_CAPTURE:
> +		if (vb2_plane_size(vb, 0) < ctx->dst_fmt.buffersize) {
> +			dev_err(dev, "meta size %d is too small\n");

Please make this dev_dbg(), because userspace misbehavior must not trigger
kernel error logs.

> +			return -EINVAL;
> +		}
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		pixfmt = &ctx->src_fmt;
> +
> +		if (vbuf->field == V4L2_FIELD_ANY)
> +			vbuf->field = V4L2_FIELD_NONE;
> +
> +		if (vb->num_planes != 1 || vbuf->field != V4L2_FIELD_NONE) {
> +			dev_err(dev, "plane or field %d not supported\n",
> +				vb->num_planes, vbuf->field);

Ditto.

> +			return -EINVAL;
> +		}
> +		if (vb2_plane_size(vb, 0) < pixfmt->plane_fmt[0].sizeimage) {
> +			dev_err(dev, "plane %d is too small\n");

Ditto.

> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		dev_err(dev, "invalid queue type: %d\n", vq->type);
> +		return -EINVAL;

We shouldn't need to handle this.

> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_fd_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> +				  unsigned int *num_buffers,
> +				  unsigned int *num_planes,
> +				  unsigned int sizes[],
> +				  struct device *alloc_devs[])
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct device *dev = ctx->dev;
> +	unsigned int size;
> +
> +	switch (vq->type) {
> +	case V4L2_BUF_TYPE_META_CAPTURE:
> +		size = ctx->dst_fmt.buffersize;
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		size = ctx->src_fmt.plane_fmt[0].sizeimage;
> +		break;
> +	default:
> +		dev_err(dev, "invalid queue type: %d\n", vq->type);

We should need to handle this.

> +		return -EINVAL;
> +	}
> +
> +	if (!*num_planes) {
> +		*num_planes = 1;
> +		sizes[0] = size;
> +	}

We need to handle the case when *num_planes is non-zero. We then need to
check if it's 1 and *sizes >= size and fail with -EINVAL if not.

> +
> +	return 0;
> +}
> +
> +static int mtk_fd_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +
> +	return mtk_fd_hw_connect(&ctx->fd_dev->fd_hw);

This would be called twice for every context, once for the VIDEO_OUTPUT
queue and once for the META_CAPTURE queue. Perhaps it would make sense to
just do this for the VIDEO_OUTPUT queue?

> +}
> +
> +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct vb2_buffer *vb;

How do we guarantee here that the hardware isn't still accessing the buffers
removed below?

> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +		vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	else
> +		vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +	while (vb) {
> +		v4l2_m2m_buf_done(to_vb2_v4l2_buffer(vb), VB2_BUF_STATE_ERROR);
> +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +			vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	}

We can use v4l2_m2m_buf_remove(). Also we can move the call into the loop
condition:

while ((vb == v4l2_m2m_buf_remove(...)))
	v4l2_m2m_buf_done(...);

> +
> +	mtk_fd_hw_disconnect(&ctx->fd_dev->fd_hw);

This should also probably be done only for 1 queue. Since the VIDEO_OUTPUT
queue supports requestes, I'd consider it the master one.

> +}
> +
> +static void mtk_fd_vb2_request_complete(struct vb2_buffer *vb)
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> +}
> +
> +static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> +				  const struct v4l2_pix_format_mplane *sfmt)
> +{
> +	dfmt->width = sfmt->width;
> +	dfmt->height = sfmt->height;
> +	dfmt->pixelformat = sfmt->pixelformat;
> +	dfmt->field = sfmt->field;
> +	dfmt->colorspace = sfmt->colorspace;
> +	dfmt->num_planes = sfmt->num_planes;
> +
> +	/* Use default */
> +	dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	dfmt->xfer_func =
> +		V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> +	dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> +	dfmt->plane_fmt[0].sizeimage =
> +		dfmt->height * dfmt->plane_fmt[0].bytesperline;
> +	memset(dfmt->reserved, 0, sizeof(dfmt->reserved));
> +}

Could we unify this function with mtk_fd_m2m_try_fmt_out_mp()? That function
should be almost directly reusable for the default format initialization +/-
the arguments passed to it.

> +
> +static const struct v4l2_pix_format_mplane *mtk_fd_find_fmt(u32 format)
> +{
> +	unsigned int i;
> +	const struct v4l2_pix_format_mplane *dev_fmt;
> +
> +	for (i = 0; i < NUM_FORMATS; i++) {
> +		dev_fmt = &in_img_fmts[i];
> +		if (dev_fmt->pixelformat == format)
> +			return dev_fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int mtk_fd_m2m_querycap(struct file *file, void *fh,
> +			       struct v4l2_capability *cap)
> +{
> +	struct mtk_fd_dev *fd_dev = video_drvdata(file);
> +	struct device *dev = &fd_dev->pdev->dev;
> +
> +	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));

Please use dev_driver_string().

> +	strscpy(cap->card, fd_dev->vfd.name, sizeof(cap->card));

I think we can also make this dev_driver_string().

> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +		 dev_name(&fd_dev->pdev->dev));
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_m2m_enum_fmt_out_mp(struct file *file, void *fh,
> +				      struct v4l2_fmtdesc *f)
> +{
> +	int i;
> +
> +	for (i = 0; i < NUM_FORMATS; ++i) {
> +		if (i == f->index) {
> +			f->pixelformat = in_img_fmts[i].pixelformat;
> +			return 0;
> +		}
> +	}

Why don't we just check if f->index is within the [0, ARRAY_SIZE()-1] bounds
and then just use it to index the array directly?

> +
> +	return -EINVAL;
> +}
> +
> +static int mtk_fd_m2m_try_fmt_out_mp(struct file *file,
> +				     void *fh,
> +				     struct v4l2_format *f)

I think we could just shorten the function prefixes to "mtk_fd_".

> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	const struct v4l2_pix_format_mplane *fmt;
> +
> +	fmt = mtk_fd_find_fmt(pix_mp->pixelformat);
> +	if (!fmt) {
> +		/* Get default img fmt */
> +		fmt = &in_img_fmts[0];
> +		f->fmt.pix.pixelformat = fmt->pixelformat;
> +	}
> +
> +	/* Use default */
> +	pix_mp->field = fmt->field;
> +	pix_mp->colorspace = fmt->colorspace;
> +	pix_mp->num_planes = fmt->num_planes;
> +	pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	pix_mp->xfer_func =
> +		V4L2_MAP_XFER_FUNC_DEFAULT(pix_mp->colorspace);
> +
> +	/* Keep user setting as possible */
> +	pix_mp->width = clamp(pix_mp->width,
> +			      MTK_FD_OUTPUT_MIN_WIDTH,
> +			      MTK_FD_OUTPUT_MAX_WIDTH);
> +	pix_mp->height = clamp(pix_mp->height,
> +			       MTK_FD_OUTPUT_MIN_HEIGHT,
> +			       MTK_FD_OUTPUT_MAX_HEIGHT);
> +
> +	pix_mp->plane_fmt[0].bytesperline = pix_mp->width * 2;

Please add a comment explaining why this is always 2.

> +	pix_mp->plane_fmt[0].sizeimage =
> +		pix_mp->plane_fmt[0].bytesperline * pix_mp->height;
> +	memset(pix_mp->plane_fmt[0].reserved, 0,
> +	       sizeof(pix_mp->plane_fmt[0].reserved));

No need to zero this here. The core will handle it.

> +
> +	return 0;
> +}
> +
> +static int mtk_fd_m2m_g_fmt_out_mp(struct file *file, void *fh,
> +				   struct v4l2_format *f)
> +{
> +	struct mtk_fd_ctx *ctx = fh_to_ctx(fh);
> +
> +	f->fmt.pix_mp = ctx->src_fmt;
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_m2m_s_fmt_out_mp(struct file *file, void *fh,
> +				   struct v4l2_format *f)
> +{
> +	struct mtk_fd_ctx *ctx = fh_to_ctx(fh);
> +	struct vb2_queue *vq;
> +
> +	/* Change not allowed if queue is streaming. */
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (vb2_is_streaming(vq) || vb2_is_busy(vq)) {

vb2_is_busy() is a superset of vb2_is_streaming(), so it's enough to just
check the former.

> +		dev_dbg(ctx->dev, "vb2_is_streaming or vb2_is_busy");
> +		return -EBUSY;
> +	}
> +
> +	mtk_fd_m2m_try_fmt_out_mp(file, fh, f);
> +	ctx->src_fmt = f->fmt.pix_mp;
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_m2m_enum_fmt_meta_cap(struct file *file, void *fh,
> +					struct v4l2_fmtdesc *f)
> +{
> +	if (f->index)
> +		return -EINVAL;
> +
> +	strscpy(f->description, "Face detection result",
> +		sizeof(f->description));
> +	f->pixelformat = fw_param_fmts[0].dataformat;
> +	f->flags = 0;
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_m2m_g_fmt_meta_cap(struct file *file, void *fh,
> +				     struct v4l2_format *f)
> +{
> +	f->fmt.meta.dataformat = fw_param_fmts[0].dataformat;
> +	f->fmt.meta.buffersize = fw_param_fmts[0].buffersize;
> +
> +	return 0;
> +}
> +
> +static const struct vb2_ops mtk_fd_vb2_ops = {
> +	.queue_setup = mtk_fd_vb2_queue_setup,
> +	.buf_out_validate = mtk_fd_vb2_buf_out_validate,
> +	.buf_prepare  = mtk_fd_vb2_buf_prepare,
> +	.buf_queue = mtk_fd_vb2_buf_queue,
> +	.start_streaming = mtk_fd_vb2_start_streaming,
> +	.stop_streaming = mtk_fd_vb2_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.buf_request_complete = mtk_fd_vb2_request_complete,
> +};
> +
> +static const struct v4l2_ioctl_ops mtk_fd_v4l2_video_out_ioctl_ops = {
> +	.vidioc_querycap = mtk_fd_m2m_querycap,
> +	.vidioc_enum_fmt_vid_out_mplane = mtk_fd_m2m_enum_fmt_out_mp,
> +	.vidioc_g_fmt_vid_out_mplane = mtk_fd_m2m_g_fmt_out_mp,
> +	.vidioc_s_fmt_vid_out_mplane = mtk_fd_m2m_s_fmt_out_mp,
> +	.vidioc_try_fmt_vid_out_mplane = mtk_fd_m2m_try_fmt_out_mp,
> +	.vidioc_enum_fmt_meta_cap = mtk_fd_m2m_enum_fmt_meta_cap,
> +	.vidioc_g_fmt_meta_cap = mtk_fd_m2m_g_fmt_meta_cap,
> +	.vidioc_s_fmt_meta_cap = mtk_fd_m2m_g_fmt_meta_cap,
> +	.vidioc_try_fmt_meta_cap = mtk_fd_m2m_g_fmt_meta_cap,
> +	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
> +	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static int
> +mtk_fd_queue_init(void *priv, struct vb2_queue *src_vq,
> +		  struct vb2_queue *dst_vq)
> +{
> +	struct mtk_fd_ctx *ctx = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->supports_requests = true;
> +	src_vq->drv_priv = ctx;
> +	src_vq->ops = &mtk_fd_vb2_ops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->fd_dev->vfd_lock;
> +	src_vq->dev = ctx->fd_dev->v4l2_dev.dev;
> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_META_CAPTURE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->ops = &mtk_fd_vb2_ops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->fd_dev->vfd_lock;
> +	dst_vq->dev = ctx->fd_dev->v4l2_dev.dev;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +static int mtk_fd_dev_g_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_fd_ctx *ctx = ctrl->priv;
> +	int i;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_MTK_FD_SCALE_IMG_WIDTH:
> +		for (i = 0; i < ctrl->elems; i++)
> +			ctrl->p_new.p_u16[i] =
> +				ctx->user_param.scale_img_width[i];
> +		break;
> +	case V4L2_CID_MTK_FD_SCALE_IMG_HEIGHT:
> +		for (i = 0; i < ctrl->elems; i++)
> +			ctrl->p_new.p_u16[i] =
> +				ctx->user_param.scale_img_height[i];
> +		break;
> +	case V4L2_CID_MTK_FD_DETECT_POSE:
> +		ctrl->val = ctx->user_param.fd_pose;
> +		break;
> +	case V4L2_CID_MTK_FD_DETECT_SPEEDUP:
> +		ctrl->val = ctx->user_param.fd_speedup;
> +		break;
> +	case V4L2_CID_MTK_FD_SCALE_IMG_NUM:
> +		ctrl->val = ctx->user_param.scale_img_num;
> +		break;
> +	case V4L2_CID_MTK_FD_EXTRA_MODEL:
> +		ctrl->val = ctx->user_param.fd_extra_model;
> +		break;
> +	default:
> +		dev_dbg(ctx->dev, "%s: unexpected control: 0x%x:%d",
> +			__func__, ctrl->id, ctrl->val);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_dev_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_fd_ctx *ctx = ctrl->priv;
> +	int i;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_MTK_FD_SCALE_IMG_WIDTH:
> +		for (i = 0; i < ctrl->elems; i++)
> +			ctx->user_param.scale_img_width[i] =
> +				ctrl->p_new.p_u16[i];
> +		break;
> +	case V4L2_CID_MTK_FD_SCALE_IMG_HEIGHT:
> +		for (i = 0; i < ctrl->elems; i++)
> +			ctx->user_param.scale_img_height[i] =
> +				ctrl->p_new.p_u16[i];
> +		break;
> +	case V4L2_CID_MTK_FD_DETECT_POSE:
> +		ctx->user_param.fd_pose = ctrl->val;
> +		break;
> +	case V4L2_CID_MTK_FD_DETECT_SPEEDUP:
> +		ctx->user_param.fd_speedup = ctrl->val;
> +		break;
> +	case V4L2_CID_MTK_FD_SCALE_IMG_NUM:
> +		ctx->user_param.scale_img_num = ctrl->val;
> +		break;
> +	case V4L2_CID_MTK_FD_EXTRA_MODEL:
> +		ctx->user_param.fd_extra_model = ctrl->val;
> +		break;
> +	default:
> +		dev_dbg(ctx->dev, "%s: unexpected control: 0x%x:%d",
> +			__func__, ctrl->id, ctrl->val);
> +		return -EINVAL;

No need to handle this, as the framework will only pass the controls we
registered earlier to this function.

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops mtk_fd_dev_ctrl_ops = {
> +	.g_volatile_ctrl = mtk_fd_dev_g_ctrl,

I don't see any volatile controls below. No need to implement this callback.

> +	.s_ctrl = mtk_fd_dev_s_ctrl,

I think you might not even need to implement this function (or just provide
a dummy one that returns 0 if its required) if you just use the controls
directly when preparing the job for the hardware. Check v4l2_ctrl_find().

> +};
> +
> +struct v4l2_ctrl_config mtk_fd_controls[] = {
> +	{
> +	.ops = &mtk_fd_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_FD_SCALE_IMG_WIDTH,
> +	.name = "FD scale image widths",
> +	.type = V4L2_CTRL_TYPE_U16,
> +	.min = MTK_FD_OUTPUT_MIN_WIDTH,
> +	.max = MTK_FD_OUTPUT_MAX_WIDTH,
> +	.step = 1,
> +	.def = MTK_FD_OUTPUT_MAX_WIDTH,
> +	.dims = { FD_SCALE_NUM },

Something wrong with indentation here.

> +	},
> +	{
> +	.ops = &mtk_fd_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_FD_SCALE_IMG_HEIGHT,
> +	.name = "FD scale image heights",
> +	.type = V4L2_CTRL_TYPE_U16,
> +	.min = MTK_FD_OUTPUT_MIN_HEIGHT,
> +	.max = MTK_FD_OUTPUT_MAX_HEIGHT,
> +	.step = 1,
> +	.def = MTK_FD_OUTPUT_MAX_HEIGHT,
> +	.dims = { FD_SCALE_NUM },
> +	},
> +	{
> +	.ops = &mtk_fd_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_FD_SCALE_IMG_NUM,
> +	.name = "FD scale size counts",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 0,
> +	.max = FACE_SIZE_NUM_MAX,
> +	.step = 1,
> +	.def = 0,
> +	},
> +	{
> +	.ops = &mtk_fd_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_FD_DETECT_POSE,
> +	.name = "FD detect face pose",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 0,
> +	.max = 3,
> +	.step = 1,
> +	.def = 0,
> +	},
> +	{
> +	.ops = &mtk_fd_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_FD_DETECT_SPEEDUP,
> +	.name = "FD detection speedup",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 0,
> +	.max = FD_MAX_SPEEDUP,
> +	.step = 1,
> +	.def = 0,
> +	},
> +	{
> +	.ops = &mtk_fd_dev_ctrl_ops,
> +	.id = V4L2_CID_MTK_FD_EXTRA_MODEL,
> +	.name = "FD use extra model",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.min = 0,
> +	.max = 1,
> +	.step = 1,
> +	.def = 0,
> +	},
> +};
> +
> +static int mtk_fd_ctrls_setup(struct mtk_fd_ctx *ctx)
> +{
> +	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
> +	struct v4l2_ctrl *ctl;
> +	int i;
> +
> +	v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_FD_MAX);
> +	if (hdl->error)
> +		return hdl->error;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_fd_controls); i++) {
> +		ctl = v4l2_ctrl_new_custom(hdl, &mtk_fd_controls[i], ctx);
> +		if (hdl->error) {
> +			v4l2_ctrl_handler_free(hdl);
> +			dev_err(ctx->dev, "Failed to register controls:%d", i);
> +			return hdl->error;
> +		}
> +	}
> +
> +	ctx->fh.ctrl_handler = &ctx->hdl;
> +	v4l2_ctrl_handler_setup(hdl);
> +
> +	return 0;
> +}
> +
> +static unsigned int get_fd_img_fmt(unsigned int fourcc)
> +{
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_VYUY:
> +		return FMT_VYUY;
> +	case V4L2_PIX_FMT_YUYV:
> +		return FMT_YUYV;
> +	case V4L2_PIX_FMT_YVYU:
> +		return FMT_YVYU;
> +	case V4L2_PIX_FMT_UYVY:
> +		return FMT_UYVY;
> +	default:
> +		return FMT_UNKNOWN;
> +	}
> +}
> +
> +static void init_ctx_fmt(struct mtk_fd_ctx *ctx)
> +{
> +	const struct v4l2_pix_format_mplane *fmt;
> +
> +	/* Initialize M2M source fmt */
> +	fmt = &in_img_fmts[0];
> +	mtk_fd_fill_pixfmt_mp(&ctx->src_fmt, fmt);
> +
> +	/* Initialize M2M destination fmt */
> +	ctx->dst_fmt.buffersize = fw_param_fmts[0].buffersize;
> +	ctx->dst_fmt.dataformat = fw_param_fmts[0].dataformat;

Why not just make dst_fmt a pointer and assign &fw_params_fmt[0] there?

> +}
> +
> +/*
> + * V4L2 file operations.
> + */
> +static int mtk_vfd_open(struct file *filp)
> +{
> +	struct mtk_fd_dev *fd_dev = video_drvdata(filp);
> +	struct video_device *vdev = video_devdata(filp);
> +	struct mtk_fd_ctx *ctx;
> +	int ret;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->fd_dev = fd_dev;
> +	ctx->dev = &fd_dev->pdev->dev;
> +
> +	v4l2_fh_init(&ctx->fh, vdev);
> +	filp->private_data = &ctx->fh;
> +
> +	init_ctx_fmt(ctx);
> +
> +	ret = mtk_fd_ctrls_setup(ctx);
> +	if (ret) {
> +		dev_err(ctx->dev, "Failed to set up controls:%d\n", ret);
> +		goto err_fh_ctrl;
> +	}
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(fd_dev->m2m_dev, ctx,
> +					    &mtk_fd_queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto err_init_ctx;
> +	}
> +
> +	v4l2_fh_add(&ctx->fh);
> +
> +	return 0;
> +
> +err_init_ctx:
> +	v4l2_ctrl_handler_free(&ctx->hdl);
> +err_fh_ctrl:
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +	return ret;
> +}
> +
> +static int mtk_vfd_release(struct file *filp)
> +{
> +	struct mtk_fd_ctx *ctx = container_of(filp->private_data,
> +					      struct mtk_fd_ctx, fh);
> +
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +
> +	v4l2_ctrl_handler_free(&ctx->hdl);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations fd_video_fops = {
> +	.owner = THIS_MODULE,
> +	.open = mtk_vfd_open,
> +	.release = mtk_vfd_release,
> +	.poll = v4l2_m2m_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = v4l2_m2m_fop_mmap,

We also need the compat_ioctl here for 32-bit userspace on 64-bit kernels.

> +};
> +
> +static void mtk_fd_device_run(void *priv)
> +{
> +	struct mtk_fd_ctx *ctx = priv;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct fd_hw_param fd_param;
> +	void *fd_result_vaddr;
> +
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	memset(&fd_param, 0, sizeof(fd_param));
> +
> +	fd_param.src_img.dma_addr =
> +		vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	fd_param.user_result.dma_addr =
> +		vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	fd_result_vaddr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> +
> +	ctx->user_param.src_img_fmt = get_fd_img_fmt(ctx->src_fmt.pixelformat);
> +	memcpy(&fd_param.user_param, &ctx->user_param, sizeof(ctx->user_param));
> +
> +	/* Complete request controls if any */
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
> +
> +	mtk_fd_hw_job_exec(&ctx->fd_dev->fd_hw, &fd_param, fd_result_vaddr);
> +}
> +
> +static struct v4l2_m2m_ops fd_m2m_ops = {
> +	.device_run = mtk_fd_device_run,
> +};
> +
> +static int mtk_fd_request_validate(struct media_request *req)
> +{
> +	unsigned int count;
> +
> +	count = vb2_request_buffer_cnt(req);
> +	if (!count)
> +		return -ENOENT;

Why -ENOENT?

> +	else if (count > 1)
> +		return -EINVAL;
> +
> +	return vb2_request_validate(req);
> +}
> +
> +static const struct media_device_ops fd_m2m_media_ops = {
> +	.req_validate	= mtk_fd_request_validate,
> +	.req_queue	= v4l2_m2m_request_queue,
> +};
> +
> +static int mtk_fd_video_device_register(struct mtk_fd_dev *fd_dev)
> +{
> +	struct video_device *vfd = &fd_dev->vfd;
> +	struct v4l2_m2m_dev *m2m_dev = fd_dev->m2m_dev;
> +	struct device *dev = &fd_dev->pdev->dev;
> +	int function, ret;
> +
> +	vfd->fops = &fd_video_fops;
> +	vfd->release = video_device_release;
> +	vfd->lock = &fd_dev->vfd_lock;
> +	vfd->v4l2_dev = &fd_dev->v4l2_dev;
> +	vfd->vfl_dir = VFL_DIR_M2M;
> +	vfd->device_caps = V4L2_CAP_STREAMING  | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +		V4L2_CAP_META_CAPTURE;
> +	vfd->ioctl_ops = &mtk_fd_v4l2_video_out_ioctl_ops;
> +
> +	strscpy(vfd->name, "MTK-FD-V4L2", sizeof(vfd->name));

Please use dev_driver_string().

> +	video_set_drvdata(vfd, fd_dev);
> +
> +	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to register video device\n");
> +		goto err_free_dev;
> +	}
> +
> +	function = MEDIA_ENT_F_PROC_VIDEO_DECODER;

MEDIA_ENT_F_PROC_VIDEO_STATISTICS fits here much more.

Also nit: Any reason to have this assigned to this intermediate variable
rather than just directly passed to the function?

> +	ret = v4l2_m2m_register_media_controller(m2m_dev, vfd, function);
> +	if (ret) {
> +		dev_err(dev, "Failed to init mem2mem media controller\n");
> +		goto err_unreg_video;
> +	}
> +	return 0;
> +
> +err_unreg_video:
> +	video_unregister_device(vfd);
> +err_free_dev:
> +	video_device_release(vfd);
> +	return ret;
> +}
> +
> +static int mtk_fd_dev_v4l2_init(struct mtk_fd_dev *fd_dev)
> +{
> +	struct media_device *mdev = &fd_dev->mdev;
> +	struct device *dev = &fd_dev->pdev->dev;
> +	int ret;
> +
> +	ret = v4l2_device_register(dev, &fd_dev->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register v4l2 device\n");
> +		return ret;
> +	}
> +
> +	fd_dev->m2m_dev = v4l2_m2m_init(&fd_m2m_ops);
> +	if (IS_ERR(fd_dev->m2m_dev)) {
> +		dev_err(dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(fd_dev->m2m_dev);
> +		goto fail_m2m_dev;

Please name the labels after the next clean-up step to be done, not the
failure.

> +	}
> +
> +	mdev->dev = dev;
> +	strscpy(mdev->model, "MTK-FD-V4L2", sizeof(mdev->model));

Could we just use dev_driver_string() here instead?

> +	snprintf(mdev->bus_info, sizeof(mdev->bus_info),
> +		 "platform:%s", dev_name(dev));
> +	media_device_init(mdev);
> +	mdev->ops = &fd_m2m_media_ops;
> +	fd_dev->v4l2_dev.mdev = mdev;
> +
> +	ret = mtk_fd_video_device_register(fd_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register video device\n");
> +		goto err_vdev;
> +	}
> +
> +	ret = media_device_register(mdev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register mem2mem media device\n");
> +		goto fail_mdev;
> +	}
> +
> +	return 0;
> +
> +fail_mdev:
> +	v4l2_m2m_unregister_media_controller(fd_dev->m2m_dev);
> +	video_unregister_device(&fd_dev->vfd);
> +	video_device_release(&fd_dev->vfd);
> +err_vdev:
> +	media_device_cleanup(mdev);
> +	v4l2_m2m_release(fd_dev->m2m_dev);
> +fail_m2m_dev:
> +	v4l2_device_unregister(&fd_dev->v4l2_dev);
> +	return ret;
> +}
> +
> +static void mtk_fd_dev_v4l2_release(struct mtk_fd_dev *fd_dev)
> +{
> +	v4l2_m2m_unregister_media_controller(fd_dev->m2m_dev);
> +	video_unregister_device(&fd_dev->vfd);
> +	video_device_release(&fd_dev->vfd);
> +	media_device_cleanup(&fd_dev->mdev);
> +	v4l2_m2m_release(fd_dev->m2m_dev);
> +	v4l2_device_unregister(&fd_dev->v4l2_dev);
> +}
> +
> +static irqreturn_t mtk_fd_irq(int irq, void *data)
> +{
> +	struct mtk_fd_hw *fd_hw = (struct mtk_fd_hw *)data;
> +
> +	fd_hw->fd_irq_result = readl(fd_hw->fd_base + FD_INT);

We should be able to just handle the job completion directly from here.

> +	wake_up_interruptible(&fd_hw->wq);
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_fd_hw_get_scp_mem(struct mtk_fd_hw *fd_hw,
> +				 struct fd_buffer *scp_mem)
> +{
> +	struct mtk_fd_dev *fd_dev = mtk_fd_hw_to_dev(fd_hw);
> +	struct device *dev = &fd_dev->pdev->dev;
> +	dma_addr_t addr;
> +	u32 size;
> +
> +	scp_mem->scp_addr = scp_get_reserve_mem_phys(SCP_FD_MEM_ID);
> +	size = scp_get_reserve_mem_size(SCP_FD_MEM_ID);
> +	if (!scp_mem->scp_addr || !size)
> +		return -EPROBE_DEFER;

Why -EPROBE_DEFER? Should we have some way to distinguish between the SCP
driver not being initialized yet and some other error?

> +
> +	/* get dma addr address */
> +	addr = dma_map_page_attrs(dev, phys_to_page(scp_mem->scp_addr), 0,
> +				  size, DMA_BIDIRECTIONAL,

Should this be really bidirectional?

> +				  DMA_ATTR_SKIP_CPU_SYNC);
> +	if (dma_mapping_error(dev, addr)) {
> +		scp_mem->scp_addr = 0;
> +		dev_err(dev, "Failed to map scp addr\n");
> +		return -ENOMEM;
> +	}
> +	scp_mem->dma_addr = addr;
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_probe(struct platform_device *pdev)
> +{
> +	struct mtk_fd_dev *fd_dev;

nit: Perhaps just fd, to have shorter code?

> +	struct device *dev = &pdev->dev;
> +	struct mtk_fd_hw *fd_hw;
> +	struct resource *res;
> +	int irq;
> +	int ret;
> +
> +	fd_dev = devm_kzalloc(&pdev->dev, sizeof(*fd_dev), GFP_KERNEL);
> +	if (!fd_dev)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, fd_dev);
> +	fd_hw = &fd_dev->fd_hw;
> +	fd_dev->pdev = pdev;

Is pdev useful for anything? Perhaps you want to store &pdev->dev instead?

> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "no IRQ:%d resource info\n", irq);
> +		return irq;
> +	}
> +	ret = devm_request_irq(dev, irq, mtk_fd_irq, IRQF_SHARED,
> +			       dev_driver_string(dev),
> +			       fd_hw);

Why not just fd_dev?

> +	if (ret) {
> +		dev_err(dev, "req_irq fail:%d\n", irq);
> +		return ret;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	fd_hw->fd_base = devm_ioremap_resource(dev, res);
> +	if (!fd_hw->fd_base) {
> +		dev_err(dev, "unable to get fd reg base\n");
> +		return PTR_ERR(fd_hw->fd_base);
> +	}
> +
> +	fd_hw->fd_clk = devm_clk_get(dev, "fd");
> +	if (IS_ERR(fd_hw->fd_clk)) {
> +		dev_err(dev, "cannot get fd_clk_img_fd clock\n");
> +		return PTR_ERR(fd_hw->fd_clk);
> +	}
> +
> +	ret = mtk_fd_hw_get_scp_mem(fd_hw, &fd_hw->scp_mem);
> +	if (ret) {
> +		dev_err(dev, "scp memory init failed: %d\n", ret);

nit: Could we make the error messages a bit more consistent? For example
"Failed to get IRQ resource (%d)", "Failed to request IRQ (%d)", "Failed to
... (%d)", etc.

> +		return ret;
> +	}
> +
> +	atomic_set(&fd_hw->fd_user_cnt, 0);
> +	init_waitqueue_head(&fd_hw->wq);
> +	mutex_init(&fd_dev->vfd_lock);
> +	mutex_init(&fd_hw->fd_hw_lock);
> +	pm_runtime_enable(dev);
> +
> +	ret = mtk_fd_dev_v4l2_init(fd_dev);
> +	if (ret) {
> +		mutex_destroy(&fd_dev->fd_hw.fd_hw_lock);
> +		mutex_destroy(&fd_dev->vfd_lock);
> +		pm_runtime_disable(&pdev->dev);

Please move the clean-up to an error path on the bottom of the function.

> +		dev_err(dev, "v4l2 init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_fd_remove(struct platform_device *pdev)
> +{
> +	struct mtk_fd_dev *fd_dev = dev_get_drvdata(&pdev->dev);
> +
> +	mtk_fd_dev_v4l2_release(fd_dev);
> +	mutex_destroy(&fd_dev->fd_hw.fd_hw_lock);
> +	mutex_destroy(&fd_dev->vfd_lock);
> +	pm_runtime_disable(&pdev->dev);

The order of calls in remove should normally be the opposite to probe.

> +
> +	return 0;
> +}
> +
> +static int mtk_fd_suspend(struct device *dev)
> +{
> +	struct mtk_fd_dev *fd_dev = dev_get_drvdata(dev);
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	/* suspend FD HW */
> +	writel(0x0, fd_dev->fd_hw.fd_base + FD_HW_ENABLE);
> +	writel(0x0, fd_dev->fd_hw.fd_base + FD_INT_EN);
> +	clk_disable_unprepare(fd_dev->fd_hw.fd_clk);
> +	return 0;
> +}
> +
> +static int mtk_fd_resume(struct device *dev)
> +{
> +	struct mtk_fd_dev *fd_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	ret = clk_prepare_enable(fd_dev->fd_hw.fd_clk);
> +	if (ret < 0) {
> +		dev_dbg(dev, "open fd clk failed\n");
> +		clk_disable_unprepare(fd_dev->fd_hw.fd_clk);
> +	}
> +
> +	/* resume FD HW */
> +	writel(ENABLE_FD, fd_dev->fd_hw.fd_base + FD_HW_ENABLE);
> +	if (fd_dev->fd_hw.state == FD_ENQ)
> +		writel(0x1, fd_dev->fd_hw.fd_base + FD_INT_EN);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_fd_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mtk_fd_suspend, mtk_fd_resume)
> +	SET_RUNTIME_PM_OPS(mtk_fd_suspend, mtk_fd_resume, NULL)

We need separate runtime and system PM ops. Their behavior is expected to be
different.

For runtime PM ops, you the functions should just unconditionally power on
or power off the device.

For system PM ops, suspend needs to make sure that no further job is queued
to the hardware and that any job being already processed by the hardware is
completed. Resume needs to resume the processing if there are any further
jobs to be queued to the hardware.

> +};
> +
> +static const struct of_device_id mtk_fd_of_ids[] = {
> +	{ .compatible = "mediatek,mt8183-fd", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_fd_of_ids);
> +
> +static struct platform_driver mtk_fd_driver = {
> +	.probe   = mtk_fd_probe,
> +	.remove  = mtk_fd_remove,
> +	.driver  = {
> +		.name  = "mtk-fd-4.0",
> +		.of_match_table = of_match_ptr(mtk_fd_of_ids),
> +		.pm = &mtk_fd_pm_ops,
> +	}
> +};
> +module_platform_driver(mtk_fd_driver);
> +
> +MODULE_DESCRIPTION("Mediatek FD driver");
> +MODULE_LICENSE("GPL");

GPL v2

Best regards,
Tomasz

