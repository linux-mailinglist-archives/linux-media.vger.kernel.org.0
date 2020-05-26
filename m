Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E582B1999CD
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 17:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgCaPfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 11:35:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46846 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbgCaPfQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 11:35:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 801BB29685C
Subject: Re: [v6, 5/5] media: platform: Add Mediatek ISP P1 V4L2 device driver
To:     Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, ddavenport@chromium.org,
        robh@kernel.org, Sean.Cheng@mediatek.com, sj.huang@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        frankie.chiu@mediatek.com, ryan.yu@mediatek.com,
        Rynn.Wu@mediatek.com, yuzhao@chromium.org, zwisler@chromium.org,
        shik@chromium.org, suleiman@chromium.org,
        Pi-Hsun Shih <pihsun@chromium.org>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
 <20191219054930.29513-6-jungo.lin@mediatek.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <6cd0b8e9-2914-9440-b9ec-dbc7e01de5a1@collabora.com>
Date:   Tue, 31 Mar 2020 12:34:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20191219054930.29513-6-jungo.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jungo,

I was taking a look at this patch (thanks for the work),
I didn't look in deep details, but I have some comments, please see
below. I hope it helps.

On 12/19/19 3:49 AM, Jungo Lin wrote:
> This patch adds the Mediatek ISP P1 HW control device driver.
> It handles the ISP HW configuration, provides interrupt handling and
> initializes the V4L2 device nodes and other V4L2 functions. Moreover,
> implement standard V4L2 video driver that utilizes V4L2 and media
> framework APIs. It supports one media device, one sub-device and
> several video devices during initialization. Moreover, it also connects
> with sensor and seninf drivers with V4L2 async APIs. Communicate with
> co-process via SCP communication to compose ISP registers in the
> firmware.
> 
> (The current metadata interface used in meta input and partial
> meta nodes is only a temporary solution to kick off the driver
> development and is not ready to be reviewed yet.)
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
> Changes from v6:
>  - Revise help description for VIDEO_MEDIATEK_ISP_PASS1
>  - Apply SCP v21 change in P1 driver by Pi-Hsun Shih
>  - Correct auto suspend timer value for suspend/resume issue
>  - Increase IPI guard timer to 1 second to avoid false alarm command timeout event
>  - Fix KE due to no sen-inf sub-device
> ---
>  drivers/media/platform/mtk-isp/Kconfig        |   20 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
>  .../platform/mtk-isp/isp_50/cam/Makefile      |    6 +
>  .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.c  |  636 +++++
>  .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.h  |   64 +
>  .../platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h |  222 ++
>  .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |   95 +
>  .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 2087 +++++++++++++++++

I think I would split this file a bit, to separate which code is being used for the subdevice, which for
capture, which for metadata, and what is being used to deal with requests.

It would make it easier to review imho.

>  .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  244 ++

It would be nice to chose beween mtk_cam or mtk-isp for naming functions, files and configs, and keep consistency.

Or maybe something like:

mtkisp_p1_core.c (with probe, who creates all the media entities, deals with fwnodes, etc)
mtkisp_p1_capture.c
mtkisp_p1_meta.c
mtkisp_p1_isp.c
mtkisp_p1_hw.c (or maybe split this between the other files)
mtkisp_p1_request.c
mtkisp_p1_common.c (?)

or s/mtkisp_p1/mtk_cam/

what do you think?

>  9 files changed, 3377 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
> 
> diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
> new file mode 100644
> index 000000000000..f86e1b59ad1e
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Kconfig
> @@ -0,0 +1,20 @@
> +config VIDEO_MEDIATEK_ISP_PASS1
> +	tristate "Mediatek ISP Pass 1 driver"
> +	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API

I think you need OF as well

depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && OF

> +	depends on ARCH_MEDIATEK

depends on ARCH_MEDIATEK || COMPILE_TEST

> +	select V4L2_FWNODE
> +	select VIDEOBUF2_VMALLOC
> +	select VIDEOBUF2_DMA_CONTIG
> +	select MTK_SCP
> +	default n
> +	help
> +		Pass 1 driver controls 3A (auto-focus, exposure,
> +		and white balance) with tuning feature and outputs
> +		the captured image buffers in Mediatek's camera system.
> +
> +		Choose Y if you want to use Mediatek SoCs to create image
> +		captured application such as video recording and still image
> +		capturing.

I would re-word this a bit, since people can use a captured application (and not create one) :)

> +
> +		To compile this driver as a module, choose M here; the module
> +		will be called mtk-cam-isp.
> diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
> new file mode 100644
> index 000000000000..ce79d283b209
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1) += cam/
> \ No newline at end of file
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
> new file mode 100644
> index 000000000000..53b54d3c26a0
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +mtk-cam-isp-objs += mtk_cam.o
> +mtk-cam-isp-objs += mtk_cam-hw.o
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1) += mtk-cam-isp.o
> \ No newline at end of file
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.c
> new file mode 100644
> index 000000000000..4065d0d29b7f
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.c
> @@ -0,0 +1,636 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2019 MediaTek Inc.
> +
> +#include <linux/atomic.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_irq.h>
> +#include <linux/module.h>
> +#include <linux/remoteproc/mtk_scp.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <linux/sched.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
> +#include <linux/vmalloc.h>
> +
> +#include <media/v4l2-event.h>

Please sort headers alphabetically.

> +
> +#include "mtk_cam.h"
> +#include "mtk_cam-hw.h"
> +#include "mtk_cam-regs.h"
> +
> +#define MTK_ISP_COMPOSER_MEM_SIZE		0x200000
> +#define MTK_ISP_CQ_BUFFER_COUNT			3
> +#define MTK_ISP_CQ_ADDRESS_OFFSET		0x640
> +
> +/*
> + *
> + * MTK Camera ISP P1 HW supports 3 ISP HW (CAM A/B/C).
> + * The T-put capability of CAM B is the maximum (max line buffer: 5376 pixels)
> + * For CAM A/C, it only supports max line buffer with 3328 pixels.
> + * In current driver, only supports CAM B.
> + *
> + */
> +#define MTK_ISP_CAM_ID_B			3
> +#define MTK_ISP_AUTOSUSPEND_DELAY_MS		66
> +#define MTK_ISP_IPI_SEND_TIMEOUT		1000
> +#define MTK_ISP_STOP_HW_TIMEOUT			(33 * USEC_PER_MSEC)
> +
> +static void isp_tx_frame_worker(struct work_struct *work)

I suggest prefixing all the function and macros with mtk_isp_, it is easier to know they are not
an external function.

> +{
> +	struct mtk_cam_dev_request *req =
> +		container_of(work, struct mtk_cam_dev_request, frame_work);
> +	struct mtk_cam_dev *cam =
> +		container_of(req->req.mdev, struct mtk_cam_dev, media_dev);
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
> +
> +	scp_ipi_send(p1_dev->scp, SCP_IPI_ISP_FRAME, &req->frame_params,
> +		     sizeof(req->frame_params), MTK_ISP_IPI_SEND_TIMEOUT);
> +}
> +
> +static void isp_composer_handler(void *data, unsigned int len, void *priv)
> +{
> +	struct mtk_isp_p1_device *p1_dev = (struct mtk_isp_p1_device *)priv;
> +	struct device *dev = p1_dev->dev;
> +	struct mtk_isp_scp_p1_cmd *ipi_msg;
> +
> +	ipi_msg = (struct mtk_isp_scp_p1_cmd *)data;
> +
> +	if (len < offsetofend(struct mtk_isp_scp_p1_cmd, ack_info)) {
> +		dev_err(dev, "wrong IPI len:%d\n", len);
> +		return;
> +	}
> +
> +	if (ipi_msg->cmd_id != ISP_CMD_ACK ||
> +	    ipi_msg->ack_info.cmd_id != ISP_CMD_FRAME_ACK)
> +		return;
> +
> +	p1_dev->composed_frame_seq_no = ipi_msg->ack_info.frame_seq_no;
> +	dev_dbg(dev, "ack frame_num:%d\n", p1_dev->composed_frame_seq_no);
> +}
> +
> +static int isp_composer_init(struct mtk_isp_p1_device *p1_dev)
> +{
> +	struct device *dev = p1_dev->dev;
> +	int ret;
> +
> +	ret = scp_ipi_register(p1_dev->scp, SCP_IPI_ISP_CMD,
> +			       isp_composer_handler, p1_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register IPI cmd\n");
> +		return ret;
> +	}
> +	ret = scp_ipi_register(p1_dev->scp, SCP_IPI_ISP_FRAME,
> +			       isp_composer_handler, p1_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register IPI frame\n");
> +		goto unreg_ipi_cmd;
> +	}
> +
> +	p1_dev->composer_wq =
> +		alloc_ordered_workqueue(dev_name(p1_dev->dev),
> +					__WQ_LEGACY | WQ_MEM_RECLAIM |
> +					WQ_FREEZABLE);
> +	if (!p1_dev->composer_wq) {
> +		dev_err(dev, "failed to alloc composer workqueue\n");
> +		goto unreg_ipi_frame;
> +	}
> +
> +	return 0;
> +
> +unreg_ipi_frame:
> +	scp_ipi_unregister(p1_dev->scp, SCP_IPI_ISP_FRAME);
> +unreg_ipi_cmd:
> +	scp_ipi_unregister(p1_dev->scp, SCP_IPI_ISP_CMD);
> +
> +	return ret;
> +}
> +
> +static void isp_composer_uninit(struct mtk_isp_p1_device *p1_dev)
> +{
> +	destroy_workqueue(p1_dev->composer_wq);
> +	scp_ipi_unregister(p1_dev->scp, SCP_IPI_ISP_CMD);
> +	scp_ipi_unregister(p1_dev->scp, SCP_IPI_ISP_FRAME);
> +}
> +
> +static void isp_composer_hw_init(struct mtk_isp_p1_device *p1_dev)
> +{
> +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> +
> +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> +	composer_tx_cmd.cmd_id = ISP_CMD_INIT;
> +	composer_tx_cmd.init_param.hw_module = MTK_ISP_CAM_ID_B;
> +
> +	/*
> +	 * Passed coherent reserved memory info. for SCP firmware usage.
> +	 * This buffer is used for SCP's ISP composer to compose.
> +	 * The size of is fixed to 0x200000 for the requirement of composer.
> +	 */
> +	composer_tx_cmd.init_param.cq_addr.iova = p1_dev->composer_iova;
> +	composer_tx_cmd.init_param.cq_addr.scp_addr = p1_dev->composer_scp_addr;
> +
> +	scp_ipi_send(p1_dev->scp, SCP_IPI_ISP_CMD, &composer_tx_cmd,
> +		     sizeof(composer_tx_cmd), MTK_ISP_IPI_SEND_TIMEOUT);
> +}
> +
> +static void isp_composer_hw_deinit(struct mtk_isp_p1_device *p1_dev)
> +{
> +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> +
> +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> +	composer_tx_cmd.cmd_id = ISP_CMD_DEINIT;
> +
> +	scp_ipi_send(p1_dev->scp, SCP_IPI_ISP_CMD, &composer_tx_cmd,
> +		     sizeof(composer_tx_cmd), MTK_ISP_IPI_SEND_TIMEOUT);
> +
> +	isp_composer_uninit(p1_dev);

I think you can copy the 3 lines of this isp_composer_uninit() function here, since
this seems the only place it is being used, and having a deinit and uninit function is
a bit confusing.

> +}
> +
> +void mtk_isp_hw_config(struct mtk_cam_dev *cam,
> +		       struct p1_config_param *config_param)
> +{
> +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
> +
> +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> +	composer_tx_cmd.cmd_id = ISP_CMD_CONFIG;
> +	memcpy(&composer_tx_cmd.config_param, config_param,
> +	       sizeof(*config_param));
> +
> +	scp_ipi_send(p1_dev->scp, SCP_IPI_ISP_CMD, &composer_tx_cmd,
> +		     sizeof(composer_tx_cmd), MTK_ISP_IPI_SEND_TIMEOUT);
> +}
> +
> +void mtk_isp_stream(struct mtk_cam_dev *cam, int on)

I prefer not having a int parameter, this is easier to read:

mtk_isp_stream_on(cam);
mtk_isp_stream_off(cam);

or

mtk_isp_stream(cam, MTK_ISP_STREAM_ON);
mtk_isp_stream(cam, MTK_ISP_STREAM_OFF);

instead of:

mtk_isp_stream(cam, 1);
mtk_isp_stream(cam, 0);

You can add wrappers to this function, and leave this one (that receives the boolean parameter) internal.

> +{
> +	struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
> +
> +	memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> +	composer_tx_cmd.cmd_id = ISP_CMD_STREAM;
> +	composer_tx_cmd.is_stream_on = on;

s/is_stream_on/is_streaming

> +
> +	scp_ipi_send(p1_dev->scp, SCP_IPI_ISP_CMD, &composer_tx_cmd,
> +		     sizeof(composer_tx_cmd), MTK_ISP_IPI_SEND_TIMEOUT);
> +}
> +
> +int mtk_isp_hw_init(struct mtk_cam_dev *cam)
> +{
> +	struct device *dev = cam->dev;
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = rproc_boot(p1_dev->rproc_handle);
> +	if (ret) {
> +		dev_err(dev, "failed to rproc_boot\n");

It would be nice to improve this error message for users, how about:

dev_err(dev, "Initialization of remote processor %s failed", p1_dev->rproc_handle);

Or maybe even remove this message, since rproc_boot() already have several error messages.

> +		return ret;
> +	}
> +
> +	ret = isp_composer_init(p1_dev);
> +	if (ret)

should rproc_shutdown() be called here?

> +		return ret;
> +
> +	pm_runtime_get_sync(dev);

You should check return value here.

> +	isp_composer_hw_init(p1_dev);
> +
> +	p1_dev->enqueued_frame_seq_no = 0;
> +	p1_dev->dequeued_frame_seq_no = 0;
> +	p1_dev->composed_frame_seq_no = 0;
> +	p1_dev->sof_count = 0;
> +
> +	dev_dbg(dev, "%s done\n", __func__);
> +
> +	return 0;
> +}
> +
> +int mtk_isp_hw_release(struct mtk_cam_dev *cam)
> +{
> +	struct device *dev = cam->dev;
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
> +
> +	isp_composer_hw_deinit(p1_dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +	rproc_shutdown(p1_dev->rproc_handle);
> +
> +	dev_dbg(dev, "%s done\n", __func__);
> +
> +	return 0;
> +}
> +
> +void mtk_isp_req_enqueue(struct mtk_cam_dev *cam,
> +			 struct mtk_cam_dev_request *req)
> +{
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(cam->dev);
> +
> +	/* Accumulated frame sequence number */
> +	req->frame_params.frame_seq_no = ++p1_dev->enqueued_frame_seq_no;
> +
> +	INIT_WORK(&req->frame_work, isp_tx_frame_worker);
> +	queue_work(p1_dev->composer_wq, &req->frame_work);
> +	dev_dbg(cam->dev, "enqueue fd:%s frame_seq_no:%d job cnt:%d\n",
> +		req->req.debug_str, req->frame_params.frame_seq_no,
> +		cam->running_job_count);
> +}
> +
> +static void isp_irq_handle_sof(struct mtk_isp_p1_device *p1_dev,
> +			       unsigned int dequeued_frame_seq_no)
> +{
> +	dma_addr_t base_addr = p1_dev->composer_iova;
> +	struct device *dev = p1_dev->dev;
> +	struct mtk_cam_dev_request *req;
> +	int composed_frame_seq_no = p1_dev->composed_frame_seq_no;
> +	unsigned int addr_offset;
> +
> +	/* Send V4L2_EVENT_FRAME_SYNC event */
> +	mtk_cam_dev_event_frame_sync(&p1_dev->cam_dev, dequeued_frame_seq_no);
> +
> +	p1_dev->sof_count += 1;
> +	/* Save frame information */
> +	p1_dev->dequeued_frame_seq_no = dequeued_frame_seq_no;
> +
> +	req = mtk_cam_dev_get_req(&p1_dev->cam_dev, dequeued_frame_seq_no);
> +	if (req)
> +		req->timestamp = ktime_get_boottime_ns();
> +
> +	/* Update CQ base address if needed */
> +	if (composed_frame_seq_no <= dequeued_frame_seq_no) {
> +		dev_dbg(dev,
> +			"SOF_INT_ST, no update, cq_num:%d, frame_seq:%d\n",
> +			composed_frame_seq_no, dequeued_frame_seq_no);
> +		return;
> +	}
> +	addr_offset = MTK_ISP_CQ_ADDRESS_OFFSET *
> +		(dequeued_frame_seq_no % MTK_ISP_CQ_BUFFER_COUNT);
> +	writel(base_addr + addr_offset, p1_dev->regs + REG_CQ_THR0_BASEADDR);
> +	dev_dbg(dev,
> +		"SOF_INT_ST, update next, cq_num:%d, frame_seq:%d cq_addr:0x%x\n",
> +		composed_frame_seq_no, dequeued_frame_seq_no, addr_offset);
> +}
> +
> +static void isp_irq_handle_dma_err(struct mtk_isp_p1_device *p1_dev)
> +{
> +	u32 val;
> +
> +	dev_err(p1_dev->dev,
> +		"IMGO:0x%x, RRZO:0x%x, AAO=0x%x, AFO=0x%x, LMVO=0x%x\n",
> +		readl(p1_dev->regs + REG_IMGO_ERR_STAT),
> +		readl(p1_dev->regs + REG_RRZO_ERR_STAT),
> +		readl(p1_dev->regs + REG_AAO_ERR_STAT),
> +		readl(p1_dev->regs + REG_AFO_ERR_STAT),
> +		readl(p1_dev->regs + REG_LMVO_ERR_STAT));
> +	dev_err(p1_dev->dev,
> +		"LCSO=0x%x, PSO=0x%x, FLKO=0x%x, BPCI:0x%x, LSCI=0x%x\n",
> +		readl(p1_dev->regs + REG_LCSO_ERR_STAT),
> +		readl(p1_dev->regs + REG_PSO_ERR_STAT),
> +		readl(p1_dev->regs + REG_FLKO_ERR_STAT),
> +		readl(p1_dev->regs + REG_BPCI_ERR_STAT),
> +		readl(p1_dev->regs + REG_LSCI_ERR_STAT));

I think if would be better to transfor those into dev_dbg and add a counter
in debugfs.

> +
> +	/* Disable DMA error mask to avoid too much error log */
> +	val = readl(p1_dev->regs + REG_CTL_RAW_INT_EN);
> +	writel((val & (~DMA_ERR_INT_EN)), p1_dev->regs + REG_CTL_RAW_INT_EN);
> +	dev_dbg(p1_dev->dev, "disable DMA error mask:0x%x\n", val);
> +}
> +
> +static irqreturn_t isp_irq_cam(int irq, void *data)
> +{
> +	struct mtk_isp_p1_device *p1_dev = (struct mtk_isp_p1_device *)data;
> +	struct device *dev = p1_dev->dev;
> +	unsigned int dequeued_frame_seq_no;
> +	unsigned int irq_status, err_status, dma_status;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&p1_dev->spinlock_irq, flags);
> +	irq_status = readl(p1_dev->regs + REG_CTL_RAW_INT_STAT);
> +	err_status = irq_status & INT_ST_MASK_CAM_ERR;
> +	dma_status = readl(p1_dev->regs + REG_CTL_RAW_INT2_STAT);
> +	dequeued_frame_seq_no = readl(p1_dev->regs + REG_FRAME_SEQ_NUM);
> +	spin_unlock_irqrestore(&p1_dev->spinlock_irq, flags);
> +
> +	/*
> +	 * In normal case, the next SOF ISR should come after HW PASS1 DONE ISR.
> +	 * If these two ISRs come together, print warning msg to hint.
> +	 */
> +	if ((irq_status & SOF_INT_ST) && (irq_status & HW_PASS1_DON_ST))
> +		dev_dbg(dev, "sof_done block cnt:%d\n", p1_dev->sof_count);
> +
> +	/* De-queue frame */
> +	if (irq_status & SW_PASS1_DON_ST) {

I suppose this means "done streaming"?

> +		mtk_cam_dev_dequeue_req_frame(&p1_dev->cam_dev,
> +					      p1_dev->dequeued_frame_seq_no);
> +		mtk_cam_dev_req_try_queue(&p1_dev->cam_dev);
> +	}
> +
> +	/* Save frame info. & update CQ address for frame HW en-queue */
> +	if (irq_status & SOF_INT_ST)
> +		isp_irq_handle_sof(p1_dev, dequeued_frame_seq_no);
> +
> +	/* Check ISP error status */
> +	if (err_status) {
> +		dev_err(dev, "int_err:0x%x 0x%x\n", irq_status, err_status);
> +		/* Show DMA errors in detail */
> +		if (err_status & DMA_ERR_ST)
> +			isp_irq_handle_dma_err(p1_dev);
> +	}
> +
> +	dev_dbg(dev, "SOF:%d irq:0x%x, dma:0x%x, frame_num:%d\n",
> +		p1_dev->sof_count, irq_status, dma_status,
> +		dequeued_frame_seq_no);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int isp_setup_scp_rproc(struct mtk_isp_p1_device *p1_dev,
> +			       struct platform_device *pdev)
> +{
> +	struct device *dev = p1_dev->dev;
> +	dma_addr_t addr;
> +	void *ptr;

Maybe "composer_buffer" would be a better name.

But is this variable required at all? Can't it be allocated directly to p1_dev->composer_virt_addr ?

> +	int ret;
> +
> +	p1_dev->scp = scp_get(pdev);
> +	if (!p1_dev->scp) {
> +		dev_err(dev, "failed to get scp device\n");
> +		return -ENODEV;
> +	}
> +
> +	p1_dev->rproc_handle = scp_get_rproc(p1_dev->scp);
> +	dev_dbg(dev, "p1 rproc_phandle: 0x%pK\n", p1_dev->rproc_handle);
> +	p1_dev->cam_dev.smem_dev = scp_get_device(p1_dev->scp);

I would rename smem_dev to scp_dev, this helps making it clear when allocating dma buffers
which mapping we are refering to.

> +
> +	/*
> +	 * Allocate coherent reserved memory for SCP firmware usage.
> +	 * The size of SCP composer's memory is fixed to 0x200000
> +	 * for the requirement of firmware.
> +	 */
> +	ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
> +				 MTK_ISP_COMPOSER_MEM_SIZE, &addr, GFP_KERNEL);
> +	if (!ptr) {
> +		ret = -ENOMEM;
> +		goto fail_put_scp;
> +	}
> +
> +	p1_dev->composer_scp_addr = addr;
> +	p1_dev->composer_virt_addr = ptr;
> +	dev_dbg(dev, "scp addr:%pad va:%pK\n", &addr, ptr);
> +
> +	/*
> +	 * This reserved memory is also be used by ISP P1 HW.
> +	 * Need to get iova address for ISP P1 DMA.
> +	 */
> +	addr = dma_map_resource(dev, addr, MTK_ISP_COMPOSER_MEM_SIZE,
> +				DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
> +	if (dma_mapping_error(dev, addr)) {
> +		dev_err(dev, "failed to map scp iova\n");
> +		ret = -ENOMEM;
> +		goto fail_free_mem;
> +	}
> +	p1_dev->composer_iova = addr;

why not rename this to composer_isp_addr ?
Since, afaik, composer_scp_addr is also iova.

At least my concept of iova (IO virtual address), are an address behind an IOMMU (or bus address to be given to a device).

> +	dev_dbg(dev, "scp iova addr:%pad\n", &addr);
> +
> +	return 0;
> +
> +fail_free_mem:
> +	dma_free_coherent(p1_dev->cam_dev.smem_dev, MTK_ISP_COMPOSER_MEM_SIZE,
> +			  p1_dev->composer_virt_addr,
> +			  p1_dev->composer_scp_addr);
> +	p1_dev->composer_scp_addr = 0;
> +fail_put_scp:
> +	scp_put(p1_dev->scp);
> +
> +	return ret;
> +}
> +
> +static void isp_teardown_scp_rproc(struct mtk_isp_p1_device *p1_dev)
> +{
> +	dma_free_coherent(p1_dev->cam_dev.smem_dev, MTK_ISP_COMPOSER_MEM_SIZE,
> +			  p1_dev->composer_virt_addr,
> +			  p1_dev->composer_scp_addr);
> +	p1_dev->composer_scp_addr = 0;
> +	scp_put(p1_dev->scp);
> +}
> +
> +static int mtk_isp_pm_suspend(struct device *dev)
> +{
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +
> +	dev_dbg(dev, "- %s\n", __func__);
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	/* Disable ISP's view finder and wait for TG idle if possible */
> +	dev_dbg(dev, "cam suspend, disable VF\n");
> +	val = readl(p1_dev->regs + REG_TG_VF_CON);
> +	writel(val & (~TG_VF_CON_VFDATA_EN), p1_dev->regs + REG_TG_VF_CON);
> +	readl_poll_timeout_atomic(p1_dev->regs + REG_TG_INTER_ST, val,
> +				  (val & TG_CS_MASK) == TG_IDLE_ST,
> +				  USEC_PER_MSEC, MTK_ISP_STOP_HW_TIMEOUT);
> +
> +	/* Disable CMOS */
> +	val = readl(p1_dev->regs + REG_TG_SEN_MODE);
> +	writel(val & (~TG_SEN_MODE_CMOS_EN), p1_dev->regs + REG_TG_SEN_MODE);
> +
> +	/* Force ISP HW to idle */
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret) {
> +		dev_err(dev, "failed to force suspend:%d\n", ret);
> +		goto reenable_hw;
> +	}
> +
> +	return 0;
> +
> +reenable_hw:
> +	val = readl(p1_dev->regs + REG_TG_SEN_MODE);
> +	writel(val | TG_SEN_MODE_CMOS_EN, p1_dev->regs + REG_TG_SEN_MODE);
> +	val = readl(p1_dev->regs + REG_TG_VF_CON);
> +	writel(val | TG_VF_CON_VFDATA_EN, p1_dev->regs + REG_TG_VF_CON);
> +
> +	return ret;
> +}
> +
> +static int mtk_isp_pm_resume(struct device *dev)
> +{
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +
> +	dev_dbg(dev, "- %s\n", __func__);
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	/* Force ISP HW to resume */
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable CMOS */
> +	dev_dbg(dev, "cam resume, enable CMOS/VF\n");
> +	val = readl(p1_dev->regs + REG_TG_SEN_MODE);
> +	writel(val | TG_SEN_MODE_CMOS_EN, p1_dev->regs + REG_TG_SEN_MODE);
> +
> +	/* Enable VF */
> +	val = readl(p1_dev->regs + REG_TG_VF_CON);
> +	writel(val | TG_VF_CON_VFDATA_EN, p1_dev->regs + REG_TG_VF_CON);
> +
> +	return 0;
> +}
> +
> +static int mtk_isp_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "%s:disable clock\n", __func__);
> +	clk_bulk_disable_unprepare(p1_dev->num_clks, p1_dev->clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_isp_runtime_resume(struct device *dev)
> +{
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(dev, "%s:enable clock\n", __func__);
> +	ret = clk_bulk_prepare_enable(p1_dev->num_clks, p1_dev->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock:%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_isp_probe(struct platform_device *pdev)
> +{
> +	/* List of clocks required by isp cam */
> +	static const char * const clk_names[] = {
> +		"camsys_cam_cgpdn", "camsys_camtg_cgpdn"
> +	};
> +	struct mtk_isp_p1_device *p1_dev;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int irq, ret, i;
> +
> +	p1_dev = devm_kzalloc(dev, sizeof(*p1_dev), GFP_KERNEL);
> +	if (!p1_dev)
> +		return -ENOMEM;
> +
> +	p1_dev->dev = dev;
> +	dev_set_drvdata(dev, p1_dev);
> +
> +	/*
> +	 * Now only support single CAM with CAM B.
> +	 * Get CAM B register base with CAM B index.
> +	 * Support multiple CAMs in future.
> +	 */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, MTK_ISP_CAM_ID_B);
> +	p1_dev->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(p1_dev->regs)) {
> +		dev_err(dev, "failed to map reister base\n");

s/reister/register

> +		return PTR_ERR(p1_dev->regs);
> +	}
> +	dev_dbg(dev, "cam, map_addr=0x%pK\n", p1_dev->regs);
> +
> +	/*
> +	 * The cam_sys unit only supports reg., but has no IRQ support.
> +	 * The reg. & IRQ index is shifted with 1 for CAM B in DTS.
> +	 */
> +	irq = platform_get_irq(pdev, MTK_ISP_CAM_ID_B - 1);
> +	if (!irq) {
> +		dev_err(dev, "failed to get irq\n");
> +		return -ENODEV;
> +	}
> +	ret = devm_request_irq(dev, irq, isp_irq_cam, 0, dev_name(dev),
> +			       p1_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to request irq=%d\n", irq);
> +		return ret;
> +	}
> +	dev_dbg(dev, "registered irq=%d\n", irq);
> +	spin_lock_init(&p1_dev->spinlock_irq);
> +
> +	p1_dev->num_clks = ARRAY_SIZE(clk_names);
> +	p1_dev->clks = devm_kcalloc(dev, p1_dev->num_clks,
> +				    sizeof(*p1_dev->clks), GFP_KERNEL);
> +	if (!p1_dev->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < p1_dev->num_clks; ++i)
> +		p1_dev->clks[i].id = clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, p1_dev->num_clks, p1_dev->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to get isp cam clock:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = isp_setup_scp_rproc(p1_dev, pdev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, MTK_ISP_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);
> +
> +	/* Initialize the v4l2 common part */
> +	ret = mtk_cam_dev_init(pdev, &p1_dev->cam_dev);
> +	if (ret) {
> +		isp_teardown_scp_rproc(p1_dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_isp_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_isp_p1_device *p1_dev = dev_get_drvdata(dev);
> +
> +	mtk_cam_dev_cleanup(&p1_dev->cam_dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +	dma_unmap_page_attrs(dev, p1_dev->composer_iova,
> +			     MTK_ISP_COMPOSER_MEM_SIZE, DMA_TO_DEVICE,
> +			     DMA_ATTR_SKIP_CPU_SYNC);
> +	isp_teardown_scp_rproc(p1_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_isp_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mtk_isp_pm_suspend, mtk_isp_pm_resume)
> +	SET_RUNTIME_PM_OPS(mtk_isp_runtime_suspend, mtk_isp_runtime_resume,
> +			   NULL)
> +};
> +
> +static const struct of_device_id mtk_isp_of_ids[] = {
> +	{.compatible = "mediatek,mt8183-camisp",},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_isp_of_ids);
> +
> +static struct platform_driver mtk_isp_driver = {
> +	.probe   = mtk_isp_probe,
> +	.remove  = mtk_isp_remove,
> +	.driver  = {
> +		.name  = "mtk-cam-p1",
> +		.of_match_table = of_match_ptr(mtk_isp_of_ids),
> +		.pm     = &mtk_isp_pm_ops,
> +	}
> +};
> +
> +module_platform_driver(mtk_isp_driver);
> +
> +MODULE_DESCRIPTION("Mediatek ISP P1 driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.h
> new file mode 100644
> index 000000000000..837662f92a5e
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.h

This header file is really short, why not merge it with mtk_cam.h (that is small too) and call it mtk_isp_common.h or mtk_cam_common?

> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CAM_HW_H__
> +#define __MTK_CAM_HW_H__
> +
> +#include <linux/types.h>
> +
> +#include "mtk_cam.h"
> +#include "mtk_cam-ipi.h"
> +
> +/*
> + * struct mtk_isp_p1_device - the Mediatek ISP P1 device information
> + *
> + * @dev: Pointer to device.
> + * @scp_pdev: Pointer to SCP platform device.
> + * @rproc_handle: Pointer to new remoteproc instance.
> + * @cam_dev: Embedded struct cam_dev
> + * @regs: Camera ISP HW base register address
> + * @num_clks: The number of driver's clocks
> + * @clks: The clock data array
> + * @spinlock_irq: Used to protect register read/write data
> + * @enqueued_frame_seq_no: Frame sequence number of enqueued frame
> + * @dequeued_frame_seq_no: Frame sequence number of dequeued frame
> + * @composed_frame_seq_no: Frame sequence number of composed frame
> + * @timestamp: Frame timestamp in ns
> + * @sof_count: SOF counter
> + * @composer_wq: The work queue for frame request composing
> + * @composer_scp_addr: SCP address of ISP composer memory
> + * @composer_iova: DMA address of ISP composer memory
> + * @virt_addr: Virtual address of ISP composer memory
> + *
> + */
> +struct mtk_isp_p1_device {
> +	struct device *dev;
> +	struct mtk_scp *scp;
> +	struct rproc *rproc_handle;
> +	struct mtk_cam_dev cam_dev;
> +	void __iomem *regs;
> +	unsigned int num_clks;
> +	struct clk_bulk_data *clks;
> +	/* Used to protect register read/write data */
> +	spinlock_t spinlock_irq;
> +	unsigned int enqueued_frame_seq_no;
> +	unsigned int dequeued_frame_seq_no;
> +	unsigned int composed_frame_seq_no;
> +	u8 sof_count;
> +	struct workqueue_struct *composer_wq;
> +	dma_addr_t composer_scp_addr;
> +	dma_addr_t composer_iova;
> +	void *composer_virt_addr;
> +};
> +
> +int mtk_isp_hw_init(struct mtk_cam_dev *cam_dev);
> +int mtk_isp_hw_release(struct mtk_cam_dev *cam_dev);
> +void mtk_isp_hw_config(struct mtk_cam_dev *cam_dev,
> +		       struct p1_config_param *config_param);
> +void mtk_isp_stream(struct mtk_cam_dev *cam_dev, int on);
> +void mtk_isp_req_enqueue(struct mtk_cam_dev *cam_dev,
> +			 struct mtk_cam_dev_request *req);

It would be nice to have docs for these too.

> +
> +#endif /* __MTK_CAM_HW_H__ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h
> new file mode 100644
> index 000000000000..981b634dd91f
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h

I'm skipping this file, since, if I understand correctly, this is not ready for review right?

> @@ -0,0 +1,222 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CAM_IPI_H__
> +#define __MTK_CAM_IPI_H__
> +
> +#include <linux/types.h>
> +
> +/*
> + * struct img_size - Image size information.
> + *
> + * @w: Image width, the unit is pixel
> + * @h: Image height, the unit is pixel
> + * @xsize: Bytes per line based on width.
> + * @stride: Bytes per line when changing line.
> + *          Stride is based on xsize + HW constrain(byte align).
> + *
> + */
> +struct img_size {
> +	u32 w;
> +	u32 h;
> +	u32 xsize;
> +	u32 stride;
> +} __packed;
> +
> +/*
> + * struct p1_img_crop - image corp information
> + *
> + * @left: The left of crop area.
> + * @top: The top of crop area.
> + * @width: The width of crop area.
> + * @height: The height of crop area.
> + *
> + */
> +struct p1_img_crop {
> +	u32 left;
> +	u32 top;
> +	u32 width;
> +	u32 height;
> +} __packed;
> +
> +/*
> + * struct dma_buffer - DMA buffer address information
> + *
> + * @iova: DMA address for ISP DMA device
> + * @scp_addr: SCP address for external co-process unit
> + *
> + */
> +struct dma_buffer {
> +	u32 iova;

I would rename this to isp_addr, since scp_addr is also iova (at least this is the way I understand).

> +	u32 scp_addr;
> +} __packed;
> +
> +/*
> + * struct p1_img_output - ISP P1 image output information
> + *
> + * @buffer: DMA buffer address of image.
> + * @size: The image size configuration.
> + * @crop: The crop configuration.
> + * @pixel_bits: The bits per image pixel.
> + * @img_fmt: The image format.
> + *
> + */
> +struct p1_img_output {
> +	struct dma_buffer buffer;
> +	struct img_size size;
> +	struct p1_img_crop crop;
> +	u8 pixel_bits;
> +	u32 img_fmt;
> +} __packed;
> +
> +/*
> + * struct cfg_in_param - Image input parameters structure.
> + *                       Normally, it comes from sensor information.
> + *
> + * @continuous: Indicate the sensor mode. Continuous or single shot.
> + * @subsample: Indicate to enables SOF subsample or not.
> + * @pixel_mode: Describe 1/2/4 pixels per clock cycle.
> + * @data_pattern: Describe input data pattern.
> + * @raw_pixel_id: Bayer sequence.
> + * @tg_fps: The fps rate of TG (time generator).
> + * @img_fmt: The image format of input source.
> + * @p1_img_crop: The crop configuration of input source.
> + *
> + */
> +struct cfg_in_param {
> +	u8 continuous;
> +	u8 subsample;
> +	u8 pixel_mode;
> +	u8 data_pattern;
> +	u8 raw_pixel_id;
> +	u16 tg_fps;
> +	u32 img_fmt;
> +	struct p1_img_crop crop;
> +} __packed;
> +
> +/*
> + * struct cfg_main_out_param - The image output parameters of main stream.
> + *
> + * @bypass: Indicate this device is enabled or disabled or not.
> + * @pure_raw: Indicate the image path control.
> + *            True: pure raw
> + *            False: processing raw
> + * @pure_raw_pack: Indicate the image is packed or not.
> + *                 True: packed mode
> + *                 False: unpacked mode
> + * @p1_img_output: The output image information.
> + *
> + */
> +struct cfg_main_out_param {
> +	u8 bypass;
> +	u8 pure_raw;
> +	u8 pure_raw_pack;
> +	struct p1_img_output output;
> +} __packed;
> +
> +/*
> + * struct cfg_resize_out_param - The image output parameters of
> + *                               packed out stream.
> + *
> + * @bypass: Indicate this device is enabled or disabled or not.
> + * @p1_img_output: The output image information.
> + *
> + */
> +struct cfg_resize_out_param {
> +	u8 bypass;
> +	struct p1_img_output output;
> +} __packed;
> +
> +/*
> + * struct p1_config_param - ISP P1 configuration parameters.
> + *
> + * @cfg_in_param: The Image input parameters.
> + * @cfg_main_param: The main output image parameters.
> + * @cfg_resize_out_param: The packed output image parameters.
> + * @enabled_dmas: The enabled DMA port information.
> + *
> + */
> +struct p1_config_param {
> +	struct cfg_in_param cfg_in_param;
> +	struct cfg_main_out_param cfg_main_param;
> +	struct cfg_resize_out_param cfg_resize_param;
> +	u32 enabled_dmas;
> +} __packed;
> +
> +/*
> + * struct P1_meta_frame - ISP P1 meta frame information.
> + *
> + * @enabled_dma: The enabled DMA port information.
> + * @vb_index: The VB2 index of meta buffer.
> + * @meta_addr: DMA buffer address of meta buffer.
> + *
> + */
> +struct P1_meta_frame {
> +	u32 enabled_dma;
> +	u32 vb_index;
> +	struct dma_buffer meta_addr;
> +} __packed;
> +
> +/*
> + * struct isp_init_info - ISP P1 composer init information.
> + *
> + * @hw_module: The ISP Camera HW module ID.
> + * @cq_addr: The DMA address of composer memory.
> + *
> + */
> +struct isp_init_info {
> +	u8 hw_module;
> +	struct dma_buffer cq_addr;
> +} __packed;
> +
> +/*
> + * struct isp_ack_info - ISP P1 IPI command ack information.
> + *
> + * @cmd_id: The IPI command ID is acked.
> + * @frame_seq_no: The IPI frame sequence number is acked.
> + *
> + */
> +struct isp_ack_info {
> +	u8 cmd_id;
> +	u32 frame_seq_no;
> +} __packed;
> +
> +/*
> + * The IPI command enumeration.
> + */
> +enum mtk_isp_scp_cmds {
> +	ISP_CMD_INIT,
> +	ISP_CMD_CONFIG,
> +	ISP_CMD_STREAM,
> +	ISP_CMD_DEINIT,
> +	ISP_CMD_ACK,
> +	ISP_CMD_FRAME_ACK,
> +	ISP_CMD_RESERVED,
> +};
> +
> +/*
> + * struct mtk_isp_scp_p1_cmd - ISP P1 IPI command strcture.
> + *
> + * @cmd_id: The IPI command ID.
> + * @init_param: The init formation for ISP_CMD_INIT.
> + * @config_param: The cmd configuration for ISP_CMD_CONFIG.
> + * @enabled_dmas: The meta configuration information for ISP_CMD_CONFIG_META.
> + * @is_stream_on: The stream information for ISP_CMD_STREAM.
> + * @ack_info: The cmd ack. information for ISP_CMD_ACK.
> + *
> + */
> +struct mtk_isp_scp_p1_cmd {
> +	u8 cmd_id;
> +	union {
> +		struct isp_init_info init_param;
> +		struct p1_config_param config_param;
> +		u32 enabled_dmas;
> +		struct P1_meta_frame meta_frame;
> +		u8 is_stream_on;
> +		struct isp_ack_info ack_info;
> +	};
> +} __packed;
> +
> +#endif /* __MTK_CAM_IPI_H__ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
> new file mode 100644
> index 000000000000..ab2277f45fa4
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CAM_REGS_H__
> +#define __MTK_CAM_REGS_H__
> +
> +/* ISP interrupt enable */
> +#define REG_CTL_RAW_INT_EN		0x0020
> +#define DMA_ERR_INT_EN			BIT(29)
> +
> +/* ISP interrupt status */
> +#define REG_CTL_RAW_INT_STAT		0x0024
> +#define VS_INT_ST			BIT(0)
> +#define TG_ERR_ST			BIT(4)
> +#define TG_GBERR_ST			BIT(5)
> +#define CQ_CODE_ERR_ST			BIT(6)
> +#define CQ_APB_ERR_ST			BIT(7)
> +#define CQ_VS_ERR_ST			BIT(8)
> +#define HW_PASS1_DON_ST			BIT(11)
> +#define SOF_INT_ST			BIT(12)
> +#define AMX_ERR_ST			BIT(15)
> +#define RMX_ERR_ST			BIT(16)
> +#define BMX_ERR_ST			BIT(17)
> +#define RRZO_ERR_ST			BIT(18)
> +#define AFO_ERR_ST			BIT(19)
> +#define IMGO_ERR_ST			BIT(20)
> +#define AAO_ERR_ST			BIT(21)
> +#define PSO_ERR_ST			BIT(22)
> +#define LCSO_ERR_ST			BIT(23)
> +#define BNR_ERR_ST			BIT(24)
> +#define LSCI_ERR_ST			BIT(25)
> +#define DMA_ERR_ST			BIT(29)
> +#define SW_PASS1_DON_ST			BIT(30)
> +
> +/* ISP interrupt 2 status */
> +#define REG_CTL_RAW_INT2_STAT		0x0034
> +#define AFO_DONE_ST			BIT(5)
> +#define AAO_DONE_ST			BIT(7)
> +
> +/* Configures sensor mode */
> +#define REG_TG_SEN_MODE			0x0230
> +#define TG_SEN_MODE_CMOS_EN		BIT(0)
> +
> +/* View finder mode control */
> +#define REG_TG_VF_CON			0x0234
> +#define TG_VF_CON_VFDATA_EN		BIT(0)
> +
> +/* View finder mode control */
> +#define REG_TG_INTER_ST			0x026c
> +#define TG_CS_MASK			0x3f00
> +#define TG_IDLE_ST			BIT(8)
> +
> +/* IMGO error status register */
> +#define REG_IMGO_ERR_STAT		0x1360
> +/* RRZO error status register */
> +#define REG_RRZO_ERR_STAT		0x1364
> +/* AAO error status register */
> +#define REG_AAO_ERR_STAT		0x1368
> +/* AFO error status register */
> +#define REG_AFO_ERR_STAT		0x136c
> +/* LCSO error status register */
> +#define REG_LCSO_ERR_STAT		0x1370
> +/* BPCI error status register */
> +#define REG_BPCI_ERR_STAT		0x137c
> +/* LSCI error status register */
> +#define REG_LSCI_ERR_STAT		0x1384
> +/* LMVO error status register */
> +#define REG_LMVO_ERR_STAT		0x1390
> +/* FLKO error status register */
> +#define REG_FLKO_ERR_STAT		0x1394
> +/* PSO error status register */
> +#define REG_PSO_ERR_STAT		0x13a0
> +
> +/* CQ0 base address */
> +#define REG_CQ_THR0_BASEADDR		0x0198
> +/* Frame sequence number */
> +#define REG_FRAME_SEQ_NUM		0x13b8
> +
> +/* IRQ Error Mask */
> +#define INT_ST_MASK_CAM_ERR		( \
> +					TG_ERR_ST |\
> +					TG_GBERR_ST |\
> +					CQ_CODE_ERR_ST |\
> +					CQ_APB_ERR_ST |\
> +					CQ_VS_ERR_ST |\
> +					BNR_ERR_ST |\
> +					RMX_ERR_ST |\
> +					BMX_ERR_ST |\
> +					BNR_ERR_ST |\
> +					LSCI_ERR_ST |\
> +					DMA_ERR_ST)
> +

I would add a common prefix all the registers in the file.

Also, add some docs to know what those acronyms means would be nice.

> +#endif	/* __MTK_CAM_REGS_H__ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
> new file mode 100644
> index 000000000000..23fdb8b4abc5
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
> @@ -0,0 +1,2087 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 MediaTek Inc.
> +
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/videodev2.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-dma-contig.h>

Please sort in alphabetical order.

> +
> +#include "mtk_cam.h"
> +#include "mtk_cam-hw.h"
> +
> +#define R_IMGO		BIT(0)
> +#define R_RRZO		BIT(1)
> +#define R_AAO		BIT(3)
> +#define R_AFO		BIT(4)
> +#define R_LCSO		BIT(5)
> +#define R_LMVO		BIT(7)
> +#define R_FLKO		BIT(8)
> +#define R_PSO		BIT(10)

It would be nice to have better names of docs of what these means.

> +
> +#define MTK_ISP_ONE_PIXEL_MODE		1
> +#define MTK_ISP_MIN_RESIZE_RATIO	6
> +#define MTK_ISP_MAX_RUNNING_JOBS	3
> +
> +#define MTK_CAM_CIO_PAD_SRC		4
> +#define MTK_CAM_CIO_PAD_SINK		11
> +
> +static inline struct mtk_cam_video_device *
> +file_to_mtk_cam_node(struct file *__file)
> +{
> +	return container_of(video_devdata(__file),
> +		struct mtk_cam_video_device, vdev);
> +}
> +
> +static inline struct mtk_cam_video_device *
> +mtk_cam_vbq_to_vdev(struct vb2_queue *__vq)

no need for the underscore in __vq

> +{
> +	return container_of(__vq, struct mtk_cam_video_device, vbq);
> +}
> +
> +static inline struct mtk_cam_dev_request *
> +mtk_cam_req_to_dev_req(struct media_request *__req)
> +{
> +	return container_of(__req, struct mtk_cam_dev_request, req);
> +}
> +
> +static inline struct mtk_cam_dev_buffer *
> +mtk_cam_vb2_buf_to_dev_buf(struct vb2_buffer *__vb)
> +{
> +	return container_of(__vb, struct mtk_cam_dev_buffer, vbb.vb2_buf);
> +}
> +
> +static void mtk_cam_dev_job_done(struct mtk_cam_dev *cam,
> +				 struct mtk_cam_dev_request *req,
> +				 enum vb2_buffer_state state)
> +{
> +	struct media_request_object *obj, *obj_prev;
> +	unsigned long flags;
> +	u64 ts_eof = ktime_get_boottime_ns();
> +
> +	if (!cam->streaming)

s/streaming/is_streaming

this makes a bit more intuitive of what the the boolean means.

> +		return;
> +
> +	dev_dbg(cam->dev, "job done request:%s frame_seq:%d state:%d\n",
> +		req->req.debug_str, req->frame_params.frame_seq_no, state);
> +
> +	list_for_each_entry_safe(obj, obj_prev, &req->req.objects, list) {
> +		struct vb2_buffer *vb;
> +		struct mtk_cam_dev_buffer *buf;
> +		struct mtk_cam_video_device *node;
> +
> +		if (!vb2_request_object_is_buffer(obj))
> +			continue;
> +		vb = container_of(obj, struct vb2_buffer, req_obj);
> +		buf = mtk_cam_vb2_buf_to_dev_buf(vb);
> +		node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> +		spin_lock_irqsave(&node->buf_list_lock, flags);
> +		list_del(&buf->list);
> +		spin_unlock_irqrestore(&node->buf_list_lock, flags);
> +		buf->vbb.sequence = req->frame_params.frame_seq_no;
> +		if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
> +			vb->timestamp = ts_eof;
> +		else
> +			vb->timestamp = req->timestamp;
> +		vb2_buffer_done(&buf->vbb.vb2_buf, state);
> +	}
> +}
> +
> +struct mtk_cam_dev_request *mtk_cam_dev_get_req(struct mtk_cam_dev *cam,
> +						unsigned int frame_seq_no)
> +{
> +	struct mtk_cam_dev_request *req, *req_prev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cam->running_job_lock, flags);
> +	list_for_each_entry_safe(req, req_prev, &cam->running_job_list, list) {
> +		dev_dbg(cam->dev, "frame_seq:%d, get frame_seq:%d\n",
> +			req->frame_params.frame_seq_no, frame_seq_no);
> +
> +		/* Match by the en-queued request number */
> +		if (req->frame_params.frame_seq_no == frame_seq_no) {
> +			spin_unlock_irqrestore(&cam->running_job_lock, flags);
> +			return req;
> +		}
> +	}
> +	spin_unlock_irqrestore(&cam->running_job_lock, flags);
> +
> +	return NULL;
> +}
> +
> +void mtk_cam_dev_dequeue_req_frame(struct mtk_cam_dev *cam,
> +				   unsigned int frame_seq_no)
> +{
> +	struct mtk_cam_dev_request *req, *req_prev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cam->running_job_lock, flags);
> +	list_for_each_entry_safe(req, req_prev, &cam->running_job_list, list) {
> +		dev_dbg(cam->dev, "frame_seq:%d, de-queue frame_seq:%d\n",
> +			req->frame_params.frame_seq_no, frame_seq_no);
> +
> +		/* Match by the en-queued request number */
> +		if (req->frame_params.frame_seq_no == frame_seq_no) {
> +			cam->running_job_count--;
> +			/* Pass to user space */
> +			mtk_cam_dev_job_done(cam, req, VB2_BUF_STATE_DONE);
> +			list_del(&req->list);
> +			break;
> +		} else if (req->frame_params.frame_seq_no < frame_seq_no) {
> +			cam->running_job_count--;
> +			/* Pass to user space for frame drop */
> +			mtk_cam_dev_job_done(cam, req, VB2_BUF_STATE_ERROR);
> +			dev_warn(cam->dev, "frame_seq:%d drop\n",
> +				 req->frame_params.frame_seq_no);

maybe a counter in debugfs instead of the warning.

> +			list_del(&req->list);
> +		} else {
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&cam->running_job_lock, flags);
> +}
> +
> +static void mtk_cam_dev_req_cleanup(struct mtk_cam_dev *cam)
> +{
> +	struct mtk_cam_dev_request *req, *req_prev;
> +	unsigned long flags;
> +
> +	dev_dbg(cam->dev, "%s\n", __func__);
> +
> +	spin_lock_irqsave(&cam->pending_job_lock, flags);
> +	list_for_each_entry_safe(req, req_prev, &cam->pending_job_list, list)
> +		list_del(&req->list);
> +	spin_unlock_irqrestore(&cam->pending_job_lock, flags);
> +
> +	spin_lock_irqsave(&cam->running_job_lock, flags);
> +	list_for_each_entry_safe(req, req_prev, &cam->running_job_list, list)
> +		list_del(&req->list);
> +	spin_unlock_irqrestore(&cam->running_job_lock, flags);
> +}
> +
> +void mtk_cam_dev_req_try_queue(struct mtk_cam_dev *cam)
> +{
> +	struct mtk_cam_dev_request *req, *req_prev;
> +	unsigned long flags;
> +
> +	if (!cam->streaming) {
> +		dev_dbg(cam->dev, "stream is off\n");
> +		return;
> +	}
> +
> +	spin_lock_irqsave(&cam->pending_job_lock, flags);
> +	spin_lock_irqsave(&cam->running_job_lock, flags);
> +	list_for_each_entry_safe(req, req_prev, &cam->pending_job_list, list) {
> +		if (cam->running_job_count >= MTK_ISP_MAX_RUNNING_JOBS) {
> +			dev_dbg(cam->dev, "jobs are full\n");
> +			break;
> +		}
> +		cam->running_job_count++;
> +		list_del(&req->list);
> +		list_add_tail(&req->list, &cam->running_job_list);

list_move_tail() can be used.

> +		mtk_isp_req_enqueue(cam, req);
> +	}
> +	spin_unlock_irqrestore(&cam->running_job_lock, flags);
> +	spin_unlock_irqrestore(&cam->pending_job_lock, flags);
> +}
> +
> +static struct media_request *mtk_cam_req_alloc(struct media_device *mdev)
> +{
> +	struct mtk_cam_dev_request *cam_dev_req;
> +
> +	cam_dev_req = kzalloc(sizeof(*cam_dev_req), GFP_KERNEL);
> +
> +	return &cam_dev_req->req;
> +}
> +
> +static void mtk_cam_req_free(struct media_request *req)
> +{
> +	struct mtk_cam_dev_request *cam_dev_req = mtk_cam_req_to_dev_req(req);
> +
> +	kfree(cam_dev_req);
> +}
> +
> +static void mtk_cam_req_queue(struct media_request *req)
> +{
> +	struct mtk_cam_dev_request *cam_req = mtk_cam_req_to_dev_req(req);
> +	struct mtk_cam_dev *cam = container_of(req->mdev, struct mtk_cam_dev,
> +					       media_dev);
> +	unsigned long flags;
> +
> +	/* update frame_params's dma_bufs in mtk_cam_vb2_buf_queue */
> +	vb2_request_queue(req);
> +
> +	/* add to pending job list */
> +	spin_lock_irqsave(&cam->pending_job_lock, flags);
> +	list_add_tail(&cam_req->list, &cam->pending_job_list);
> +	spin_unlock_irqrestore(&cam->pending_job_lock, flags);
> +
> +	mtk_cam_dev_req_try_queue(cam);
> +}
> +
> +static unsigned int get_pixel_bits(unsigned int pix_fmt)
> +{
> +	switch (pix_fmt) {
> +	case V4L2_PIX_FMT_MTISP_SBGGR8:
> +	case V4L2_PIX_FMT_MTISP_SGBRG8:
> +	case V4L2_PIX_FMT_MTISP_SGRBG8:
> +	case V4L2_PIX_FMT_MTISP_SRGGB8:
> +	case V4L2_PIX_FMT_MTISP_SBGGR8F:
> +	case V4L2_PIX_FMT_MTISP_SGBRG8F:
> +	case V4L2_PIX_FMT_MTISP_SGRBG8F:
> +	case V4L2_PIX_FMT_MTISP_SRGGB8F:
> +		return 8;
> +	case V4L2_PIX_FMT_MTISP_SBGGR10:
> +	case V4L2_PIX_FMT_MTISP_SGBRG10:
> +	case V4L2_PIX_FMT_MTISP_SGRBG10:
> +	case V4L2_PIX_FMT_MTISP_SRGGB10:
> +	case V4L2_PIX_FMT_MTISP_SBGGR10F:
> +	case V4L2_PIX_FMT_MTISP_SGBRG10F:
> +	case V4L2_PIX_FMT_MTISP_SGRBG10F:
> +	case V4L2_PIX_FMT_MTISP_SRGGB10F:
> +		return 10;
> +	case V4L2_PIX_FMT_MTISP_SBGGR12:
> +	case V4L2_PIX_FMT_MTISP_SGBRG12:
> +	case V4L2_PIX_FMT_MTISP_SGRBG12:
> +	case V4L2_PIX_FMT_MTISP_SRGGB12:
> +	case V4L2_PIX_FMT_MTISP_SBGGR12F:
> +	case V4L2_PIX_FMT_MTISP_SGBRG12F:
> +	case V4L2_PIX_FMT_MTISP_SGRBG12F:
> +	case V4L2_PIX_FMT_MTISP_SRGGB12F:
> +		return 12;
> +	case V4L2_PIX_FMT_MTISP_SBGGR14:
> +	case V4L2_PIX_FMT_MTISP_SGBRG14:
> +	case V4L2_PIX_FMT_MTISP_SGRBG14:
> +	case V4L2_PIX_FMT_MTISP_SRGGB14:
> +	case V4L2_PIX_FMT_MTISP_SBGGR14F:
> +	case V4L2_PIX_FMT_MTISP_SGBRG14F:
> +	case V4L2_PIX_FMT_MTISP_SGRBG14F:
> +	case V4L2_PIX_FMT_MTISP_SRGGB14F:
> +		return 14;
> +	default:
> +		return 0;
> +	}
> +}

which patchset are these pixel formats defined?
I couldn't find them in the ones you pointed.

I also wonder if all of them need to be defined, or if the pre-defined ones can be used,
so you can use v4l2_format_info() to get the number of bytes.

> +
> +static void cal_image_pix_mp(struct mtk_cam_dev *cam, unsigned int node_id,
> +			     struct v4l2_pix_format_mplane *mp)
> +{
> +	unsigned int bpl, ppl;

bytes per line and pixels per line right?

> +	unsigned int pixel_bits = get_pixel_bits(mp->pixelformat);

wouldn't be easier a get_pixel_bytes() function instead of bits?

> +	unsigned int width = mp->width;
> +
> +	bpl = 0;
> +	if (node_id == MTK_CAM_P1_MAIN_STREAM_OUT) {
> +		/* Bayer encoding format & 2 bytes alignment */
> +		bpl = ALIGN(DIV_ROUND_UP(width * pixel_bits, 8), 2);
> +	} else if (node_id == MTK_CAM_P1_PACKED_BIN_OUT) {
> +		/*
> +		 * The FULL-G encoding format
> +		 * 1 G component per pixel
> +		 * 1 R component per 4 pixel
> +		 * 1 B component per 4 pixel
> +		 * Total 4G/1R/1B in 4 pixel (pixel per line:ppl)
> +		 */
> +		ppl = DIV_ROUND_UP(width * 6, 4);
> +		bpl = DIV_ROUND_UP(ppl * pixel_bits, 8);
> +
> +		/* 4 bytes alignment for 10 bit & others are 8 bytes */
> +		if (pixel_bits == 10)
> +			bpl = ALIGN(bpl, 4);
> +		else
> +			bpl = ALIGN(bpl, 8);
> +	}
> +	/*
> +	 * This image output buffer will be input buffer of MTK CAM DIP HW
> +	 * For MTK CAM DIP HW constrained, it needs 4 bytes alignment
> +	 */
> +	bpl = ALIGN(bpl, 4);
> +
> +	mp->plane_fmt[0].bytesperline = bpl;
> +	mp->plane_fmt[0].sizeimage = bpl * mp->height;
> +
> +	dev_dbg(cam->dev, "node:%d width:%d bytesperline:%d sizeimage:%d\n",
> +		node_id, width, bpl, mp->plane_fmt[0].sizeimage);
> +}
> +
> +static const struct v4l2_format *
> +mtk_cam_dev_find_fmt(struct mtk_cam_dev_node_desc *desc, u32 format)
> +{
> +	int i;

unsigned

> +	const struct v4l2_format *dev_fmt;
> +
> +	for (i = 0; i < desc->num_fmts; i++) {
> +		dev_fmt = &desc->fmts[i];
> +		if (dev_fmt->fmt.pix_mp.pixelformat == format)
> +			return dev_fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +/* Get the default format setting */
> +static void
> +mtk_cam_dev_load_default_fmt(struct mtk_cam_dev *cam,
> +			     struct mtk_cam_dev_node_desc *queue_desc,
> +			     struct v4l2_format *dest)
> +{
> +	const struct v4l2_format *default_fmt =
> +		&queue_desc->fmts[queue_desc->default_fmt_idx];
> +
> +	dest->type = queue_desc->buf_type;
> +
> +	/* Configure default format based on node type */
> +	if (!queue_desc->image) {
> +		dest->fmt.meta.dataformat = default_fmt->fmt.meta.dataformat;
> +		dest->fmt.meta.buffersize = default_fmt->fmt.meta.buffersize;
> +		return;
> +	}
> +
> +	dest->fmt.pix_mp.pixelformat = default_fmt->fmt.pix_mp.pixelformat;
> +	dest->fmt.pix_mp.width = default_fmt->fmt.pix_mp.width;
> +	dest->fmt.pix_mp.height = default_fmt->fmt.pix_mp.height;
> +	/* bytesperline & sizeimage calculation */
> +	cal_image_pix_mp(cam, queue_desc->id, &dest->fmt.pix_mp);
> +	dest->fmt.pix_mp.num_planes = 1;
> +
> +	dest->fmt.pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
> +	dest->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +	dest->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	dest->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	dest->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
> +}
> +
> +/* Utility functions */
> +static unsigned int get_sensor_pixel_id(unsigned int fmt)
> +{
> +	switch (fmt) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +		return MTK_CAM_RAW_PXL_ID_B;
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +		return MTK_CAM_RAW_PXL_ID_GB;
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +		return MTK_CAM_RAW_PXL_ID_GR;
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +		return MTK_CAM_RAW_PXL_ID_R;
> +	default:
> +		return MTK_CAM_RAW_PXL_ID_UNKNOWN;
> +	}
> +}
> +
> +static unsigned int get_sensor_fmt(unsigned int fmt)
> +{
> +	switch (fmt) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		return MTK_CAM_IMG_FMT_BAYER8;
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		return MTK_CAM_IMG_FMT_BAYER10;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		return MTK_CAM_IMG_FMT_BAYER12;
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +		return MTK_CAM_IMG_FMT_BAYER14;
> +	default:
> +		return MTK_CAM_IMG_FMT_UNKNOWN;
> +	}
> +}

I was wondering if it is not better to save all the media bus format
into a table, instead of having several swtch case statements.

> +
> +static unsigned int get_img_fmt(unsigned int fourcc)
> +{
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_MTISP_SBGGR8:
> +	case V4L2_PIX_FMT_MTISP_SGBRG8:
> +	case V4L2_PIX_FMT_MTISP_SGRBG8:
> +	case V4L2_PIX_FMT_MTISP_SRGGB8:
> +		return MTK_CAM_IMG_FMT_BAYER8;
> +	case V4L2_PIX_FMT_MTISP_SBGGR8F:
> +	case V4L2_PIX_FMT_MTISP_SGBRG8F:
> +	case V4L2_PIX_FMT_MTISP_SGRBG8F:
> +	case V4L2_PIX_FMT_MTISP_SRGGB8F:
> +		return MTK_CAM_IMG_FMT_FG_BAYER8;
> +	case V4L2_PIX_FMT_MTISP_SBGGR10:
> +	case V4L2_PIX_FMT_MTISP_SGBRG10:
> +	case V4L2_PIX_FMT_MTISP_SGRBG10:
> +	case V4L2_PIX_FMT_MTISP_SRGGB10:
> +		return MTK_CAM_IMG_FMT_BAYER10;
> +	case V4L2_PIX_FMT_MTISP_SBGGR10F:
> +	case V4L2_PIX_FMT_MTISP_SGBRG10F:
> +	case V4L2_PIX_FMT_MTISP_SGRBG10F:
> +	case V4L2_PIX_FMT_MTISP_SRGGB10F:
> +		return MTK_CAM_IMG_FMT_FG_BAYER10;
> +	case V4L2_PIX_FMT_MTISP_SBGGR12:
> +	case V4L2_PIX_FMT_MTISP_SGBRG12:
> +	case V4L2_PIX_FMT_MTISP_SGRBG12:
> +	case V4L2_PIX_FMT_MTISP_SRGGB12:
> +		return MTK_CAM_IMG_FMT_BAYER12;
> +	case V4L2_PIX_FMT_MTISP_SBGGR12F:
> +	case V4L2_PIX_FMT_MTISP_SGBRG12F:
> +	case V4L2_PIX_FMT_MTISP_SGRBG12F:
> +	case V4L2_PIX_FMT_MTISP_SRGGB12F:
> +		return MTK_CAM_IMG_FMT_FG_BAYER12;
> +	case V4L2_PIX_FMT_MTISP_SBGGR14:
> +	case V4L2_PIX_FMT_MTISP_SGBRG14:
> +	case V4L2_PIX_FMT_MTISP_SGRBG14:
> +	case V4L2_PIX_FMT_MTISP_SRGGB14:
> +		return MTK_CAM_IMG_FMT_BAYER14;
> +	case V4L2_PIX_FMT_MTISP_SBGGR14F:
> +	case V4L2_PIX_FMT_MTISP_SGBRG14F:
> +	case V4L2_PIX_FMT_MTISP_SGRBG14F:
> +	case V4L2_PIX_FMT_MTISP_SRGGB14F:
> +		return MTK_CAM_IMG_FMT_FG_BAYER14;
> +	default:
> +		return MTK_CAM_IMG_FMT_UNKNOWN;
> +	}> +}

same for the pixelformat.

Then you can cache object with the pixelformat in the main struct.

> +
> +static int config_img_fmt(struct mtk_cam_dev *cam, unsigned int node_id,
> +			  struct p1_img_output *out_fmt, int sd_width,
> +			  int sd_height)
> +{
> +	const struct v4l2_format *cfg_fmt = &cam->vdev_nodes[node_id].vdev_fmt;
> +
> +	/* Check output & input image size dimension */
> +	if (cfg_fmt->fmt.pix_mp.width > sd_width ||
> +	    cfg_fmt->fmt.pix_mp.height > sd_height) {
> +		dev_err(cam->dev, "node:%d cfg size is larger than sensor\n",
> +			node_id);
> +		return -EINVAL;
> +	}
> +
> +	/* Check resize ratio for resize out stream due to HW constraint */
> +	if (((cfg_fmt->fmt.pix_mp.width * 100 / sd_width) <
> +	    MTK_ISP_MIN_RESIZE_RATIO) ||
> +	    ((cfg_fmt->fmt.pix_mp.height * 100 / sd_height) <
> +	    MTK_ISP_MIN_RESIZE_RATIO)) {
> +		dev_err(cam->dev, "node:%d resize ratio is less than %d%%\n",
> +			node_id, MTK_ISP_MIN_RESIZE_RATIO);
> +		return -EINVAL;
> +	}
> +
> +	out_fmt->img_fmt = get_img_fmt(cfg_fmt->fmt.pix_mp.pixelformat);
> +	out_fmt->pixel_bits = get_pixel_bits(cfg_fmt->fmt.pix_mp.pixelformat);
> +	if (out_fmt->img_fmt == MTK_CAM_IMG_FMT_UNKNOWN ||
> +	    !out_fmt->pixel_bits) {
> +		dev_err(cam->dev, "node:%d unknown pixel fmt:%d\n",
> +			node_id, cfg_fmt->fmt.pix_mp.pixelformat);
> +		return -EINVAL;
> +	}
> +	dev_dbg(cam->dev, "node:%d pixel_bits:%d img_fmt:0x%x\n",
> +		node_id, out_fmt->pixel_bits, out_fmt->img_fmt);
> +
> +	out_fmt->size.w = cfg_fmt->fmt.pix_mp.width;
> +	out_fmt->size.h = cfg_fmt->fmt.pix_mp.height;
> +	out_fmt->size.stride = cfg_fmt->fmt.pix_mp.plane_fmt[0].bytesperline;
> +	out_fmt->size.xsize = cfg_fmt->fmt.pix_mp.plane_fmt[0].bytesperline;
> +
> +	out_fmt->crop.left = 0;
> +	out_fmt->crop.top = 0;
> +	out_fmt->crop.width = sd_width;
> +	out_fmt->crop.height = sd_height;
> +
> +	dev_dbg(cam->dev,
> +		"node:%d size=%0dx%0d, stride:%d, xsize:%d, crop=%0dx%0d\n",
> +		node_id, out_fmt->size.w, out_fmt->size.h,
> +		out_fmt->size.stride, out_fmt->size.xsize,
> +		out_fmt->crop.width, out_fmt->crop.height);
> +
> +	return 0;
> +}
> +
> +static void mtk_cam_dev_init_stream(struct mtk_cam_dev *cam)
> +{
> +	int i;
> +
> +	cam->enabled_count = 0;
> +	cam->enabled_dmas = 0;
> +	cam->stream_count = 0;
> +	cam->running_job_count = 0;
> +
> +	/* Get the enabled meta DMA ports */
> +	for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++) {
> +		if (!cam->vdev_nodes[i].enabled)
> +			continue;
> +		cam->enabled_count++;
> +		cam->enabled_dmas |= cam->vdev_nodes[i].desc.dma_port;
> +	}
> +
> +	dev_dbg(cam->dev, "%s:%d:0x%x\n", __func__, cam->enabled_count,
> +		cam->enabled_dmas);
> +}
> +
> +static int mtk_cam_dev_isp_config(struct mtk_cam_dev *cam)
> +{
> +	struct device *dev = cam->dev;
> +	struct p1_config_param config_param;
> +	struct cfg_in_param *cfg_in_param;
> +	struct v4l2_subdev_format sd_fmt;
> +	int sd_width, sd_height, sd_code;

are this sd_* variables required? Can't sd_fmt be directly accessed?

> +	unsigned int enabled_dma_ports = cam->enabled_dmas;
> +	int ret;
> +
> +	/* Get sensor format configuration */
> +	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	ret = v4l2_subdev_call(cam->sensor, pad, get_fmt, NULL, &sd_fmt);
> +	if (ret) {
> +		dev_dbg(dev, "sensor g_fmt failed:%d\n", ret);
> +		return ret;
> +	}
> +	sd_width = sd_fmt.format.width;
> +	sd_height = sd_fmt.format.height;
> +	sd_code = sd_fmt.format.code;
> +	dev_dbg(dev, "sd fmt w*h=%d*%d, code=0x%x\n", sd_width, sd_height,
> +		sd_code);

If V4L2_SUBDEV_FL_HAS_DEVNODE is used, then format shouldn't propagate from one node to the other,
it should be configured from userspace.

> +
> +	memset(&config_param, 0, sizeof(config_param));
> +
> +	/* Update cfg_in_param */
> +	cfg_in_param = &config_param.cfg_in_param;
> +	cfg_in_param->continuous = true;
> +	/* Fix to one pixel mode in default */
> +	cfg_in_param->pixel_mode = MTK_ISP_ONE_PIXEL_MODE;
> +	cfg_in_param->crop.width = sd_width;
> +	cfg_in_param->crop.height = sd_height;
> +	cfg_in_param->raw_pixel_id = get_sensor_pixel_id(sd_code);
> +	cfg_in_param->img_fmt = get_sensor_fmt(sd_code);
> +	if (cfg_in_param->img_fmt == MTK_CAM_IMG_FMT_UNKNOWN ||
> +	    cfg_in_param->raw_pixel_id == MTK_CAM_RAW_PXL_ID_UNKNOWN) {
> +		dev_err(dev, "unknown sd code:%d\n", sd_code);
> +		return -EINVAL;
> +	}
> +
> +	/* Update cfg_main_param */
> +	config_param.cfg_main_param.pure_raw = true;
> +	config_param.cfg_main_param.pure_raw_pack = true;
> +	ret = config_img_fmt(cam, MTK_CAM_P1_MAIN_STREAM_OUT,
> +			     &config_param.cfg_main_param.output,
> +			     sd_width, sd_height);
> +	if (ret)
> +		return ret;
> +
> +	/* Update cfg_resize_param */
> +	if (enabled_dma_ports & R_RRZO) {
> +		ret = config_img_fmt(cam, MTK_CAM_P1_PACKED_BIN_OUT,
> +				     &config_param.cfg_resize_param.output,
> +				     sd_width, sd_height);
> +		if (ret)
> +			return ret;
> +	} else {
> +		config_param.cfg_resize_param.bypass = true;
> +	}
> +
> +	/* Update enabled_dmas */
> +	config_param.enabled_dmas = enabled_dma_ports;
> +	mtk_isp_hw_config(cam, &config_param);
> +	dev_dbg(dev, "%s done\n", __func__);
> +
> +	return 0;
> +}
> +
> +void mtk_cam_dev_event_frame_sync(struct mtk_cam_dev *cam,
> +				  unsigned int frame_seq_no)
> +{
> +	struct v4l2_event event = {
> +		.type = V4L2_EVENT_FRAME_SYNC,
> +		.u.frame_sync.frame_sequence = frame_seq_no,
> +	};
> +
> +	v4l2_event_queue(cam->subdev.devnode, &event);
> +}
> +
> +static struct v4l2_subdev *
> +mtk_cam_cio_get_active_sensor(struct mtk_cam_dev *cam)
> +{
> +	struct media_device *mdev = cam->seninf->entity.graph_obj.mdev;
> +	struct device *dev = cam->dev;
> +	struct media_entity *entity;
> +	struct v4l2_subdev *sensor;
> +
> +	sensor = NULL;
> +	media_device_for_each_entity(entity, mdev) {
> +		dev_dbg(dev, "media entity: %s:0x%x:%d\n",
> +			entity->name, entity->function, entity->stream_count);
> +		if (entity->function == MEDIA_ENT_F_CAM_SENSOR &&
> +		    entity->stream_count) {
> +			sensor = media_entity_to_v4l2_subdev(entity);
> +			dev_dbg(dev, "sensor found: %s\n", entity->name);
> +			break;
> +		}
> +	}
> +
> +	if (!sensor)
> +		dev_err(dev, "no seninf connected\n");
> +
> +	return sensor;
> +}
> +
> +static int mtk_cam_cio_stream_on(struct mtk_cam_dev *cam)
> +{
> +	struct device *dev = cam->dev;
> +	int ret;
> +
> +	if (!cam->seninf) {
> +		dev_err(dev, "no seninf connected\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Get active sensor from graph topology */
> +	cam->sensor = mtk_cam_cio_get_active_sensor(cam);
> +	if (!cam->sensor)
> +		return -ENODEV;
> +
> +	/* Seninf must stream on first */
> +	ret = v4l2_subdev_call(cam->seninf, video, s_stream, 1);
> +	if (ret) {
> +		dev_err(dev, "failed to stream on %s:%d\n",
> +			cam->seninf->entity.name, ret);
> +		return ret;
> +	}
> +
> +	ret = v4l2_subdev_call(cam->sensor, video, s_stream, 1);
> +	if (ret) {
> +		dev_err(dev, "failed to stream on %s:%d\n",
> +			cam->sensor->entity.name, ret);
> +		goto fail_seninf_off;
> +	}
> +
> +	ret = mtk_cam_dev_isp_config(cam);
> +	if (ret)
> +		goto fail_sensor_off;
> +
> +	cam->streaming = true;
> +	mtk_isp_stream(cam, 1);
> +	mtk_cam_dev_req_try_queue(cam);
> +	dev_dbg(dev, "streamed on Pass 1\n");
> +
> +	return 0;
> +
> +fail_sensor_off:
> +	v4l2_subdev_call(cam->sensor, video, s_stream, 0);
> +fail_seninf_off:
> +	v4l2_subdev_call(cam->seninf, video, s_stream, 0);
> +
> +	return ret;
> +}
> +
> +static int mtk_cam_cio_stream_off(struct mtk_cam_dev *cam)
> +{
> +	struct device *dev = cam->dev;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(cam->sensor, video, s_stream, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to stream off %s:%d\n",
> +			cam->sensor->entity.name, ret);
> +		return -EPERM;

Why -EPERM ?

> +	}
> +
> +	ret = v4l2_subdev_call(cam->seninf, video, s_stream, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to stream off %s:%d\n",
> +			cam->seninf->entity.name, ret);
> +		return -EPERM;
> +	}
> +
> +	cam->streaming = false;
> +	mtk_isp_stream(cam, 0);
> +	mtk_isp_hw_release(cam);
> +
> +	dev_dbg(dev, "streamed off Pass 1\n");
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_sd_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct mtk_cam_dev *cam = container_of(sd, struct mtk_cam_dev, subdev);
> +
> +	if (enable) {
> +		/* Align vb2_core_streamon design */
> +		if (cam->streaming) {
> +			dev_warn(cam->dev, "already streaming on\n");

I think just dev_dbg is enough.

> +			return 0;
> +		}
> +		return mtk_cam_cio_stream_on(cam);
> +	}
> +
> +	if (!cam->streaming) {
> +		dev_warn(cam->dev, "already streaming off\n");

same here

> +		return 0;
> +	}
> +	return mtk_cam_cio_stream_off(cam);
> +}
> +
> +static int mtk_cam_sd_subscribe_event(struct v4l2_subdev *subdev,
> +				      struct v4l2_fh *fh,
> +				      struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_FRAME_SYNC:
> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int mtk_cam_media_link_setup(struct media_entity *entity,
> +				    const struct media_pad *local,
> +				    const struct media_pad *remote, u32 flags)
> +{
> +	struct mtk_cam_dev *cam =
> +		container_of(entity, struct mtk_cam_dev, subdev.entity);
> +	u32 pad = local->index;
> +
> +	dev_dbg(cam->dev, "%s: %d->%d flags:0x%x\n",
> +		__func__, pad, remote->index, flags);
> +
> +	/*
> +	 * The video nodes exposed by the driver have pads indexes
> +	 * from 0 to MTK_CAM_P1_TOTAL_NODES - 1.
> +	 */
> +	if (pad < MTK_CAM_P1_TOTAL_NODES)
> +		cam->vdev_nodes[pad].enabled =
> +			!!(flags & MEDIA_LNK_FL_ENABLED);

Can't you just check the state of the link in the pad instead of saving it in cam->vdev_nodes[pad].enabled ?

> +
> +	return 0;
> +}
> +
> +static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mtk_cam_dev_buffer *buf = mtk_cam_vb2_buf_to_dev_buf(vb);
> +	struct mtk_cam_dev_request *req = mtk_cam_req_to_dev_req(vb->request);
> +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> +	struct device *dev = cam->dev;
> +	unsigned long flags;
> +
> +	dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n", __func__,
> +		node->id, buf->vbb.request_fd, buf->vbb.vb2_buf.index);
> +
> +	/* added the buffer into the tracking list */
> +	spin_lock_irqsave(&node->buf_list_lock, flags);
> +	list_add_tail(&buf->list, &node->buf_list);
> +	spin_unlock_irqrestore(&node->buf_list_lock, flags);
> +
> +	/* update buffer internal address */
> +	req->frame_params.dma_bufs[buf->node_id].iova = buf->daddr;
> +	req->frame_params.dma_bufs[buf->node_id].scp_addr = buf->scp_addr;

isn't it an issue if userspace queue two buffers for the same video device in the same request?

vb2_request_queue(req) will call all the .buf_queue() callbacks, and only the last buffer in the list
will be at req->frame_params.dma_bufs[buf->node_id], no?

Also, what happens if a request doesn't contain buffers for all node_ids ? Will it put data in the previous programmed
buffer?

Please, let me know if these questions doesn't make sense, I'm not that familiar with the request API internals.

> +}
> +
> +static int mtk_cam_vb2_buf_init(struct vb2_buffer *vb)
> +{
> +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> +	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
> +	struct device *dev = cam->dev;
> +	struct mtk_cam_dev_buffer *buf;
> +	dma_addr_t addr;
> +
> +	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
> +	buf->node_id = node->id;
> +	buf->daddr = vb2_dma_contig_plane_dma_addr(vb, 0);
> +	buf->scp_addr = 0;
> +
> +	/* SCP address is only valid for meta input buffer */
> +	if (!node->desc.smem_alloc)
> +		return 0;
> +
> +	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
> +	/* Use coherent address to get iova address */
> +	addr = dma_map_resource(dev, buf->daddr, vb->planes[0].length,
> +				DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);> +	if (dma_mapping_error(dev, addr)) {
> +		dev_err(dev, "failed to map meta addr:%pad\n", &buf->daddr);
> +		return -EFAULT;
> +	}
> +	buf->scp_addr = buf->daddr;
> +	buf->daddr = addr;
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> +	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +	const struct v4l2_format *fmt = &node->vdev_fmt;
> +	unsigned int size;
> +
> +	if (vb->vb2_queue->type == V4L2_BUF_TYPE_META_OUTPUT ||
> +	    vb->vb2_queue->type == V4L2_BUF_TYPE_META_CAPTURE)
> +		size = fmt->fmt.meta.buffersize;
> +	else
> +		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +	if (vb2_plane_size(vb, 0) < size) {
> +		dev_dbg(cam->dev, "plane size is too small:%lu<%u\n",
> +			vb2_plane_size(vb, 0), size);
> +		return -EINVAL;
> +	}
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> +		if (vb2_get_plane_payload(vb, 0) != size) {
> +			dev_dbg(cam->dev, "plane payload is mismatch:%lu:%u\n",
> +				vb2_get_plane_payload(vb, 0), size);
> +			return -EINVAL;
> +		}
> +		return 0;
> +	}
> +
> +	v4l2_buf->field = V4L2_FIELD_NONE;
> +	vb2_set_plane_payload(vb, 0, size);
> +
> +	return 0;
> +}
> +
> +static void mtk_cam_vb2_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vb->vb2_queue);
> +	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mtk_cam_dev_buffer *buf;
> +	struct device *dev = cam->dev;
> +
> +	if (!node->desc.smem_alloc)
> +		return;
> +
> +	buf = mtk_cam_vb2_buf_to_dev_buf(vb);
> +	dma_unmap_page_attrs(dev, buf->daddr,
> +			     vb->planes[0].length,
> +			     DMA_BIDIRECTIONAL,
> +			     DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +
> +static void mtk_cam_vb2_request_complete(struct vb2_buffer *vb)
> +{
> +	struct mtk_cam_dev *cam = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	dev_dbg(cam->dev, "%s\n", __func__);
> +}
> +
> +static int mtk_cam_vb2_queue_setup(struct vb2_queue *vq,
> +				   unsigned int *num_buffers,
> +				   unsigned int *num_planes,
> +				   unsigned int sizes[],
> +				   struct device *alloc_devs[])
> +{
> +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
> +	unsigned int max_buffer_count = node->desc.max_buf_count;
> +	const struct v4l2_format *fmt = &node->vdev_fmt;
> +	unsigned int size;
> +
> +	/* Check the limitation of buffer size */
> +	if (max_buffer_count)
> +		*num_buffers = clamp_val(*num_buffers, 1, max_buffer_count);
> +
> +	if (node->desc.smem_alloc)
> +		vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
> +
> +	if (vq->type == V4L2_BUF_TYPE_META_OUTPUT ||
> +	    vq->type == V4L2_BUF_TYPE_META_CAPTURE)
> +		size = fmt->fmt.meta.buffersize;
> +	else
> +		size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +	/* Add for q.create_bufs with fmt.g_sizeimage(p) / 2 test */
> +	if (*num_planes) {
> +		if (sizes[0] < size || *num_planes != 1)
> +			return -EINVAL;
> +	} else {
> +		*num_planes = 1;
> +		sizes[0] = size;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_cam_vb2_return_all_buffers(struct mtk_cam_dev *cam,
> +					   struct mtk_cam_video_device *node,
> +					   enum vb2_buffer_state state)
> +{
> +	struct mtk_cam_dev_buffer *buf, *buf_prev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&node->buf_list_lock, flags);
> +	list_for_each_entry_safe(buf, buf_prev, &node->buf_list, list) {
> +		list_del(&buf->list);
> +		vb2_buffer_done(&buf->vbb.vb2_buf, state);
> +	}
> +	spin_unlock_irqrestore(&node->buf_list_lock, flags);
> +}
> +
> +static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
> +				       unsigned int count)
> +{
> +	struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
> +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
> +	struct device *dev = cam->dev;
> +	int ret;
> +
> +	if (!node->enabled) {
> +		dev_err(dev, "Node:%d is not enabled\n", node->id);
> +		ret = -ENOLINK;
> +		goto fail_ret_buf;
> +	}
> +
> +	mutex_lock(&cam->op_lock);
> +	/* Start streaming of the whole pipeline now*/
> +	if (!cam->pipeline.streaming_count) {

No need for this check, vb2 won't call .start_streaming() twice without stop_streaming() in between.

> +		ret = media_pipeline_start(&node->vdev.entity, &cam->pipeline);
> +		if (ret) {
> +			dev_err(dev, "failed to start pipeline:%d\n", ret);
> +			goto fail_unlock;
> +		}
> +		mtk_cam_dev_init_stream(cam);
> +		ret = mtk_isp_hw_init(cam);
> +		if (ret) {
> +			dev_err(dev, "failed to init HW:%d\n", ret);
> +			goto fail_stop_pipeline;
> +		}
> +	}
> +
> +	/* Media links are fixed after media_pipeline_start */
> +	cam->stream_count++;
> +	dev_dbg(dev, "%s: count info:%d:%d\n", __func__, cam->stream_count,
> +		cam->enabled_count);
> +	if (cam->stream_count < cam->enabled_count) {
> +		mutex_unlock(&cam->op_lock);
> +		return 0;
> +	}
> +
> +	/* Stream on sub-devices node */
> +	ret = v4l2_subdev_call(&cam->subdev, video, s_stream, 1);
> +	if (ret)
> +		goto fail_no_stream;
> +	mutex_unlock(&cam->op_lock);
> +
> +	return 0;
> +
> +fail_no_stream:
> +	cam->stream_count--;
> +fail_stop_pipeline:
> +	if (cam->stream_count == 0)
> +		media_pipeline_stop(&node->vdev.entity);
> +fail_unlock:
> +	mutex_unlock(&cam->op_lock);
> +fail_ret_buf:
> +	mtk_cam_vb2_return_all_buffers(cam, node, VB2_BUF_STATE_QUEUED);
> +
> +	return ret;
> +}
> +
> +static void mtk_cam_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
> +	struct mtk_cam_video_device *node = mtk_cam_vbq_to_vdev(vq);
> +	struct device *dev = cam->dev;
> +
> +	mutex_lock(&cam->op_lock);
> +	dev_dbg(dev, "%s node:%d count info:%d\n", __func__, node->id,
> +		cam->stream_count);
> +	/* Check the first node to stream-off */
> +	if (cam->stream_count == cam->enabled_count)
> +		v4l2_subdev_call(&cam->subdev, video, s_stream, 0);
> +
> +	mtk_cam_vb2_return_all_buffers(cam, node, VB2_BUF_STATE_ERROR);
> +	cam->stream_count--;
> +	if (cam->stream_count) {
> +		mutex_unlock(&cam->op_lock);
> +		return;
> +	}
> +	mutex_unlock(&cam->op_lock);
> +
> +	mtk_cam_dev_req_cleanup(cam);
> +	media_pipeline_stop(&node->vdev.entity);
> +}
> +
> +static int mtk_cam_vidioc_querycap(struct file *file, void *fh,
> +				   struct v4l2_capability *cap)
> +{
> +	struct mtk_cam_dev *cam = video_drvdata(file);
> +
> +	strscpy(cap->driver, dev_driver_string(cam->dev), sizeof(cap->driver));
> +	strscpy(cap->card, dev_driver_string(cam->dev), sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +		 dev_name(cam->dev));
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_vidioc_enum_fmt(struct file *file, void *fh,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> +
> +	if (f->index >= node->desc.num_fmts)
> +		return -EINVAL;
> +
> +	/* f->description is filled in v4l_fill_fmtdesc function */
> +	f->pixelformat = node->desc.fmts[f->index].fmt.pix_mp.pixelformat;
> +	f->flags = 0;
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_vidioc_g_fmt(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> +
> +	f->fmt = node->vdev_fmt.fmt;
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_vidioc_try_fmt(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct mtk_cam_dev *cam = video_drvdata(file);
> +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> +	struct device *dev = cam->dev;
> +	const struct v4l2_format *dev_fmt;
> +	struct v4l2_format try_fmt;
> +
> +	memset(&try_fmt, 0, sizeof(try_fmt));
> +	try_fmt.type = f->type;
> +
> +	/* Validate pixelformat */
> +	dev_fmt = mtk_cam_dev_find_fmt(&node->desc, f->fmt.pix_mp.pixelformat);
> +	if (!dev_fmt) {
> +		dev_dbg(dev, "unknown fmt:%d\n", f->fmt.pix_mp.pixelformat);
> +		dev_fmt = &node->desc.fmts[node->desc.default_fmt_idx];
> +	}
> +	try_fmt.fmt.pix_mp.pixelformat = dev_fmt->fmt.pix_mp.pixelformat;
> +
> +	/* Validate image width & height range */
> +	try_fmt.fmt.pix_mp.width = clamp_val(f->fmt.pix_mp.width,
> +					     IMG_MIN_WIDTH, IMG_MAX_WIDTH);
> +	try_fmt.fmt.pix_mp.height = clamp_val(f->fmt.pix_mp.height,
> +					      IMG_MIN_HEIGHT, IMG_MAX_HEIGHT);
> +	/* 4 bytes alignment for width */
> +	try_fmt.fmt.pix_mp.width = ALIGN(try_fmt.fmt.pix_mp.width, 4);
> +
> +	/* Only support one plane */
> +	try_fmt.fmt.pix_mp.num_planes = 1;
> +
> +	/* bytesperline & sizeimage calculation */
> +	cal_image_pix_mp(cam, node->id, &try_fmt.fmt.pix_mp);
> +
> +	/* Constant format fields */
> +	try_fmt.fmt.pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
> +	try_fmt.fmt.pix_mp.field = V4L2_FIELD_NONE;
> +	try_fmt.fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	try_fmt.fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	try_fmt.fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
> +
> +	*f = try_fmt;
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_vidioc_s_fmt(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct mtk_cam_dev *cam = video_drvdata(file);
> +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> +
> +	if (vb2_is_busy(node->vdev.queue)) {
> +		dev_dbg(cam->dev, "%s: queue is busy\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	/* Get the valid format */
> +	mtk_cam_vidioc_try_fmt(file, fh, f);
> +	/* Configure to video device */
> +	node->vdev_fmt = *f;
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_vidioc_enum_framesizes(struct file *filp, void *priv,
> +					  struct v4l2_frmsizeenum *sizes)
> +{
> +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(filp);
> +	const struct v4l2_format *dev_fmt;
> +
> +	dev_fmt = mtk_cam_dev_find_fmt(&node->desc, sizes->pixel_format);
> +	if (!dev_fmt || sizes->index)
> +		return -EINVAL;
> +
> +	sizes->type = node->desc.frmsizes->type;
> +	memcpy(&sizes->stepwise, &node->desc.frmsizes->stepwise,
> +	       sizeof(sizes->stepwise));
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_vidioc_meta_enum_fmt(struct file *file, void *fh,
> +					struct v4l2_fmtdesc *f)
> +{
> +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> +
> +	if (f->index)
> +		return -EINVAL;
> +
> +	/* f->description is filled in v4l_fill_fmtdesc function */
> +	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
> +	f->flags = 0;
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_vidioc_g_meta_fmt(struct file *file, void *fh,
> +				     struct v4l2_format *f)
> +{
> +	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
> +
> +	f->fmt.meta.dataformat = node->vdev_fmt.fmt.meta.dataformat;
> +	f->fmt.meta.buffersize = node->vdev_fmt.fmt.meta.buffersize;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops mtk_cam_subdev_core_ops = {
> +	.subscribe_event = mtk_cam_sd_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops mtk_cam_subdev_video_ops = {
> +	.s_stream =  mtk_cam_sd_s_stream,
> +};
> +
> +static const struct v4l2_subdev_ops mtk_cam_subdev_ops = {
> +	.core = &mtk_cam_subdev_core_ops,
> +	.video = &mtk_cam_subdev_video_ops,
> +};

hmm, since this subdevice is exposed with V4L2_SUBDEV_FL_HAS_DEVNODE,
I wonder if pad ops shouldn't be implemented too (to be verified).

> +
> +static const struct media_entity_operations mtk_cam_media_entity_ops = {
> +	.link_setup = mtk_cam_media_link_setup,
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct vb2_ops mtk_cam_vb2_ops = {
> +	.queue_setup = mtk_cam_vb2_queue_setup,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.buf_init = mtk_cam_vb2_buf_init,
> +	.buf_prepare = mtk_cam_vb2_buf_prepare,
> +	.start_streaming = mtk_cam_vb2_start_streaming,
> +	.stop_streaming = mtk_cam_vb2_stop_streaming,
> +	.buf_queue = mtk_cam_vb2_buf_queue,
> +	.buf_cleanup = mtk_cam_vb2_buf_cleanup,
> +	.buf_request_complete = mtk_cam_vb2_request_complete,
> +};> +
> +static const struct v4l2_file_operations mtk_cam_v4l2_fops = {
> +	.unlocked_ioctl = video_ioctl2,
> +	.open = v4l2_fh_open,
> +	.release = vb2_fop_release,
> +	.poll = vb2_fop_poll,
> +	.mmap = vb2_fop_mmap,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl32 = v4l2_compat_ioctl32,
> +#endif
> +};
> +
> +static const struct media_device_ops mtk_cam_media_ops = {
> +	.req_alloc = mtk_cam_req_alloc,
> +	.req_free = mtk_cam_req_free,
> +	.req_validate = vb2_request_validate,
> +	.req_queue = mtk_cam_req_queue,
> +};
> +
> +static int mtk_cam_media_register(struct mtk_cam_dev *cam,
> +				  struct media_device *media_dev)
> +{
> +	/* Reserved MTK_CAM_CIO_PAD_SINK + 1 pads to use */
> +	unsigned int num_pads = MTK_CAM_CIO_PAD_SINK + 1;
> +	struct device *dev = cam->dev;
> +	int i, ret;
> +
> +	media_dev->dev = cam->dev;
> +	strscpy(media_dev->model, dev_driver_string(dev),
> +		sizeof(media_dev->model));
> +	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
> +		 "platform:%s", dev_name(dev));
> +	media_dev->hw_revision = 0;
> +	media_device_init(media_dev);
> +	media_dev->ops = &mtk_cam_media_ops;
> +
> +	ret = media_device_register(media_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register media device:%d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Initialize subdev pads */
> +	cam->subdev_pads = devm_kcalloc(dev, num_pads,
> +					sizeof(*cam->subdev_pads),
> +					GFP_KERNEL);
> +	if (!cam->subdev_pads) {
> +		dev_err(dev, "failed to allocate subdev_pads\n");
> +		ret = -ENOMEM;
> +		goto fail_media_unreg;
> +	}
> +
> +	ret = media_entity_pads_init(&cam->subdev.entity, num_pads,
> +				     cam->subdev_pads);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize media pads:%d\n", ret);
> +		goto fail_media_unreg;
> +	}
> +
> +	/* Initialize all pads with MEDIA_PAD_FL_SOURCE */
> +	for (i = 0; i < num_pads; i++)
> +		cam->subdev_pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	/* Customize the last one pad as CIO sink pad. */
> +	cam->subdev_pads[MTK_CAM_CIO_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +
> +	return 0;
> +
> +fail_media_unreg:
> +	media_device_unregister(&cam->media_dev);
> +	media_device_cleanup(&cam->media_dev);
> +
> +	return ret;
> +}
> +
> +static int
> +mtk_cam_video_register_device(struct mtk_cam_dev *cam,
> +			      struct mtk_cam_video_device *node)
> +{
> +	struct device *dev = cam->dev;
> +	struct video_device *vdev = &node->vdev;
> +	struct vb2_queue *vbq = &node->vbq;
> +	unsigned int output = V4L2_TYPE_IS_OUTPUT(node->desc.buf_type);
> +	unsigned int link_flags = node->desc.link_flags;
> +	int ret;
> +
> +	/* Initialize mtk_cam_video_device */
> +	if (link_flags & MEDIA_LNK_FL_IMMUTABLE)
> +		node->enabled = true;
> +	else
> +		node->enabled = false;
> +	mtk_cam_dev_load_default_fmt(cam, &node->desc, &node->vdev_fmt);
> +
> +	cam->subdev_pads[node->id].flags = output ?
> +		MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> +
> +	/* Initialize media entities */
> +	ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize media pad:%d\n", ret);
> +		return ret;
> +	}
> +	node->vdev_pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
> +
> +	/* Initialize vbq */
> +	vbq->type = node->desc.buf_type;
> +	if (vbq->type == V4L2_BUF_TYPE_META_OUTPUT)
> +		vbq->io_modes = VB2_MMAP;
> +	else
> +		vbq->io_modes = VB2_MMAP | VB2_DMABUF;
> +
> +	if (node->desc.smem_alloc) {
> +		vbq->bidirectional = 1;
> +		vbq->dev = cam->smem_dev;
> +	} else {
> +		vbq->dev = dev;
> +	}
> +	vbq->ops = &mtk_cam_vb2_ops;
> +	vbq->mem_ops = &vb2_dma_contig_memops;
> +	vbq->buf_struct_size = sizeof(struct mtk_cam_dev_buffer);
> +	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_BOOTIME;
> +	if (output)
> +		vbq->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
> +	else
> +		vbq->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
> +	/* No minimum buffers limitation */
> +	vbq->min_buffers_needed = 0;
> +	vbq->drv_priv = cam;
> +	vbq->lock = &node->vdev_lock;
> +	vbq->supports_requests = true;
> +	vbq->requires_requests = true;
> +
> +	ret = vb2_queue_init(vbq);
> +	if (ret) {
> +		dev_err(dev, "failed to init. vb2 queue:%d\n", ret);
> +		goto fail_media_clean;
> +	}
> +
> +	/* Initialize vdev */
> +	snprintf(vdev->name, sizeof(vdev->name), "%s %s",
> +		 dev_driver_string(dev), node->desc.name);
> +	/* set cap/type/ioctl_ops of the video device */
> +	vdev->device_caps = node->desc.cap | V4L2_CAP_STREAMING;
> +	vdev->ioctl_ops = node->desc.ioctl_ops;
> +	vdev->fops = &mtk_cam_v4l2_fops;
> +	vdev->release = video_device_release_empty;
> +	vdev->lock = &node->vdev_lock;
> +	vdev->v4l2_dev = &cam->v4l2_dev;
> +	vdev->queue = &node->vbq;
> +	vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
> +	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
> +	vdev->entity.ops = NULL;
> +	video_set_drvdata(vdev, cam);
> +	dev_dbg(dev, "registered vdev:%d:%s\n", node->id, vdev->name);
> +
> +	/* Initialize miscellaneous variables */
> +	mutex_init(&node->vdev_lock);
> +	INIT_LIST_HEAD(&node->buf_list);
> +	spin_lock_init(&node->buf_list_lock);
> +
> +	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> +	if (ret) {
> +		dev_err(dev, "failed to register vde:%d\n", ret);
> +		goto fail_vb2_rel;
> +	}
> +
> +	/* Create link between video node and the subdev pad */
> +	if (output) {
> +		ret = media_create_pad_link(&vdev->entity, 0,
> +					    &cam->subdev.entity,
> +					    node->id, link_flags);
> +	} else {
> +		ret = media_create_pad_link(&cam->subdev.entity,
> +					    node->id, &vdev->entity, 0,
> +					    link_flags);
> +	}

No need for the curly braces.

> +	if (ret)
> +		goto fail_vdev_ureg;
> +
> +	return 0;
> +
> +fail_vdev_ureg:
> +	video_unregister_device(vdev);
> +fail_vb2_rel:
> +	mutex_destroy(&node->vdev_lock);
> +	vb2_queue_release(vbq);
> +fail_media_clean:
> +	media_entity_cleanup(&vdev->entity);
> +
> +	return ret;
> +}
> +
> +static void
> +mtk_cam_video_unregister_device(struct mtk_cam_video_device *node)
> +{
> +	video_unregister_device(&node->vdev);
> +	vb2_queue_release(&node->vbq);
> +	media_entity_cleanup(&node->vdev.entity);
> +	mutex_destroy(&node->vdev_lock);
> +}
> +
> +static int mtk_cam_v4l2_register(struct mtk_cam_dev *cam)
> +{
> +	struct device *dev = cam->dev;
> +	int i, ret;
> +
> +	/* Set up media device & pads */
> +	ret = mtk_cam_media_register(cam, &cam->media_dev);
> +	if (ret)
> +		return ret;
> +	dev_info(dev, "Registered media%d\n", cam->media_dev.devnode->minor);
> +
> +	/* Set up v4l2 device */
> +	cam->v4l2_dev.mdev = &cam->media_dev;
> +	ret = v4l2_device_register(dev, &cam->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register V4L2 device:%d\n", ret);
> +		goto fail_media_unreg;
> +	}
> +	dev_info(dev, "Registered %s\n", cam->v4l2_dev.name);
> +
> +	/* Initialize subdev */
> +	v4l2_subdev_init(&cam->subdev, &mtk_cam_subdev_ops);
> +	cam->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	cam->subdev.entity.ops = &mtk_cam_media_entity_ops;
> +	cam->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> +				V4L2_SUBDEV_FL_HAS_EVENTS;
> +	snprintf(cam->subdev.name, sizeof(cam->subdev.name),
> +		 "%s", dev_driver_string(dev));
> +	v4l2_set_subdevdata(&cam->subdev, cam);
> +
> +	ret = v4l2_device_register_subdev(&cam->v4l2_dev, &cam->subdev);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize subdev:%d\n", ret);
> +		goto fail_clean_media_entiy;
> +	}
> +	dev_dbg(dev, "registered %s\n", cam->subdev.name);
> +
> +	/* Create video nodes and links */
> +	for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++) {
> +		struct mtk_cam_video_device *node = &cam->vdev_nodes[i];
> +
> +		node->id = node->desc.id;
> +		ret = mtk_cam_video_register_device(cam, node);
> +		if (ret)
> +			goto fail_vdev_unreg;
> +	}
> +	vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
> +
> +	return 0;
> +
> +fail_vdev_unreg:
> +	for (i--; i >= 0; i--)
> +		mtk_cam_video_unregister_device(&cam->vdev_nodes[i]);
> +fail_clean_media_entiy:
> +	media_entity_cleanup(&cam->subdev.entity);
> +	v4l2_device_unregister(&cam->v4l2_dev);
> +fail_media_unreg:
> +	media_device_unregister(&cam->media_dev);
> +	media_device_cleanup(&cam->media_dev);
> +
> +	return ret;
> +}
> +
> +static int mtk_cam_v4l2_unregister(struct mtk_cam_dev *cam)
> +{
> +	int i;
> +
> +	for (i = 0; i < MTK_CAM_P1_TOTAL_NODES; i++)
> +		mtk_cam_video_unregister_device(&cam->vdev_nodes[i]);
> +
> +	vb2_dma_contig_clear_max_seg_size(cam->dev);
> +	v4l2_device_unregister_subdev(&cam->subdev);
> +	v4l2_device_unregister(&cam->v4l2_dev);
> +	media_entity_cleanup(&cam->subdev.entity);
> +	media_device_unregister(&cam->media_dev);
> +	media_device_cleanup(&cam->media_dev);
> +
> +	return 0;
> +}
> +
> +static int mtk_cam_dev_notifier_bound(struct v4l2_async_notifier *notifier,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_subdev *asd)
> +{
> +	struct mtk_cam_dev *cam =
> +		container_of(notifier, struct mtk_cam_dev, notifier);
> +
> +	if (!(sd->entity.function & MEDIA_ENT_F_VID_IF_BRIDGE)) {
> +		dev_dbg(cam->dev, "no MEDIA_ENT_F_VID_IF_BRIDGE function\n");
> +		return -ENODEV;
> +	}
> +
> +	cam->seninf = sd;
> +	dev_dbg(cam->dev, "%s is bound\n", sd->entity.name);
> +
> +	return 0;
> +}
> +
> +static void mtk_cam_dev_notifier_unbind(struct v4l2_async_notifier *notifier,
> +					struct v4l2_subdev *sd,
> +					struct v4l2_async_subdev *asd)
> +{
> +	struct mtk_cam_dev *cam =
> +		container_of(notifier, struct mtk_cam_dev, notifier);
> +
> +	cam->seninf = NULL;
> +	dev_dbg(cam->dev, "%s is unbound\n", sd->entity.name);
> +}
> +
> +static int mtk_cam_dev_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct mtk_cam_dev *cam =
> +		container_of(notifier, struct mtk_cam_dev, notifier);
> +	struct device *dev = cam->dev;
> +	int ret;
> +
> +	if (!cam->seninf) {
> +		dev_err(dev, "No seninf subdev\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = media_create_pad_link(&cam->seninf->entity, MTK_CAM_CIO_PAD_SRC,
> +				    &cam->subdev.entity, MTK_CAM_CIO_PAD_SINK,
> +				    MEDIA_LNK_FL_IMMUTABLE |
> +				    MEDIA_LNK_FL_ENABLED);
> +	if (ret) {
> +		dev_err(dev, "failed to create pad link %s %s err:%d\n",
> +			cam->seninf->entity.name, cam->subdev.entity.name,
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = v4l2_device_register_subdev_nodes(&cam->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize subdev nodes:%d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_async_notifier_operations mtk_cam_v4l2_async_ops = {
> +	.bound = mtk_cam_dev_notifier_bound,
> +	.unbind = mtk_cam_dev_notifier_unbind,
> +	.complete = mtk_cam_dev_notifier_complete,
> +};
> +
> +static int mtk_cam_v4l2_async_register(struct mtk_cam_dev *cam)
> +{
> +	struct device *dev = cam->dev;
> +	int ret;
> +
> +	v4l2_async_notifier_init(&cam->notifier);
> +	ret = v4l2_async_notifier_parse_fwnode_endpoints(dev,
> +		&cam->notifier, sizeof(struct v4l2_async_subdev), NULL);

It seems we shouldn't be using this function, please see comments at https://patchwork.kernel.org/patch/11066527/

Regards,
Helen

> +	if (ret) {
> +		dev_err(dev, "failed to parse fwnode endpoints:%d\n", ret);
> +		return ret;
> +	}
> +
> +	cam->notifier.ops = &mtk_cam_v4l2_async_ops;
> +	dev_dbg(dev, "mtk_cam v4l2_async_notifier_register\n");
> +	ret = v4l2_async_notifier_register(&cam->v4l2_dev, &cam->notifier);
> +	if (ret) {
> +		dev_err(dev, "failed to register async notifier : %d\n", ret);
> +		v4l2_async_notifier_cleanup(&cam->notifier);
> +	}
> +
> +	return ret;
> +}
> +
> +static void mtk_cam_v4l2_async_unregister(struct mtk_cam_dev *cam)
> +{
> +	v4l2_async_notifier_unregister(&cam->notifier);
> +	v4l2_async_notifier_cleanup(&cam->notifier);
> +}
> +
> +static const struct v4l2_ioctl_ops mtk_cam_v4l2_vcap_ioctl_ops = {
> +	.vidioc_querycap = mtk_cam_vidioc_querycap,
> +	.vidioc_enum_framesizes = mtk_cam_vidioc_enum_framesizes,
> +	.vidioc_enum_fmt_vid_cap = mtk_cam_vidioc_enum_fmt,
> +	.vidioc_g_fmt_vid_cap_mplane = mtk_cam_vidioc_g_fmt,
> +	.vidioc_s_fmt_vid_cap_mplane = mtk_cam_vidioc_s_fmt,
> +	.vidioc_try_fmt_vid_cap_mplane = mtk_cam_vidioc_try_fmt,
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_cap_ioctl_ops = {
> +	.vidioc_querycap = mtk_cam_vidioc_querycap,
> +	.vidioc_enum_fmt_meta_cap = mtk_cam_vidioc_meta_enum_fmt,
> +	.vidioc_g_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
> +	.vidioc_s_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
> +	.vidioc_try_fmt_meta_cap = mtk_cam_vidioc_g_meta_fmt,
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +};
> +
> +static const struct v4l2_ioctl_ops mtk_cam_v4l2_meta_out_ioctl_ops = {
> +	.vidioc_querycap = mtk_cam_vidioc_querycap,
> +	.vidioc_enum_fmt_meta_out = mtk_cam_vidioc_meta_enum_fmt,
> +	.vidioc_g_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
> +	.vidioc_s_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
> +	.vidioc_try_fmt_meta_out = mtk_cam_vidioc_g_meta_fmt,
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +};> +
> +static const struct v4l2_format meta_fmts[] = {
> +	{
> +		.fmt.meta = {
> +			.dataformat = V4L2_META_FMT_MTISP_PARAMS,
> +			.buffersize = 512 * SZ_1K,
> +		},
> +	},
> +	{
> +		.fmt.meta = {
> +			.dataformat = V4L2_META_FMT_MTISP_3A,
> +			.buffersize = 1200 * SZ_1K,
> +		},
> +	},
> +	{
> +		.fmt.meta = {
> +			.dataformat = V4L2_META_FMT_MTISP_AF,
> +			.buffersize = 640 * SZ_1K,
> +		},
> +	},
> +	{
> +		.fmt.meta = {
> +			.dataformat = V4L2_META_FMT_MTISP_LCS,
> +			.buffersize = 288 * SZ_1K,
> +		},
> +	},
> +	{
> +		.fmt.meta = {
> +			.dataformat = V4L2_META_FMT_MTISP_LMV,
> +			.buffersize = 256,
> +		},
> +	},
> +};
> +
> +static const struct v4l2_format stream_out_fmts[] = {
> +	/* This is a default image format */
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR10,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR8,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR12,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR14,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG8,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG10,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG12,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG14,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG8,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG10,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG12,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG14,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB8,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB10,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB12,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB14,
> +		},
> +	},
> +};
> +
> +static const struct v4l2_format bin_out_fmts[] = {
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR8F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR10F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR12F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SBGGR14F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG8F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG10F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG12F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGBRG14F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG8F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG10F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG12F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SGRBG14F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB8F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB10F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB12F,
> +		},
> +	},
> +	{
> +		.fmt.pix_mp = {
> +			.width = IMG_MAX_WIDTH,
> +			.height = IMG_MAX_HEIGHT,
> +			.pixelformat = V4L2_PIX_FMT_MTISP_SRGGB14F,
> +		},
> +	},
> +};
> +
> +static const struct
> +mtk_cam_dev_node_desc output_queues[] = {
> +	{
> +		.id = MTK_CAM_P1_META_IN_0,
> +		.name = "meta input",
> +		.cap = V4L2_CAP_META_OUTPUT,
> +		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
> +		.link_flags = 0,
> +		.image = false,
> +		.smem_alloc = true,
> +		.fmts = meta_fmts,
> +		.default_fmt_idx = 0,
> +		.max_buf_count = 10,
> +		.ioctl_ops = &mtk_cam_v4l2_meta_out_ioctl_ops,
> +	},
> +};
> +
> +static const struct
> +mtk_cam_dev_node_desc capture_queues[] = {
> +	{
> +		.id = MTK_CAM_P1_MAIN_STREAM_OUT,
> +		.name = "main stream",
> +		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
> +		.image = true,
> +		.smem_alloc = false,
> +		.dma_port = R_IMGO,
> +		.fmts = stream_out_fmts,
> +		.num_fmts = ARRAY_SIZE(stream_out_fmts),
> +		.default_fmt_idx = 0,
> +		.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
> +		.frmsizes = &(struct v4l2_frmsizeenum) {
> +			.index = 0,
> +			.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
> +			.stepwise = {
> +				.max_width = IMG_MAX_WIDTH,
> +				.min_width = IMG_MIN_WIDTH,
> +				.max_height = IMG_MAX_HEIGHT,
> +				.min_height = IMG_MIN_HEIGHT,
> +				.step_height = 1,
> +				.step_width = 1,
> +			},
> +		},
> +	},
> +	{
> +		.id = MTK_CAM_P1_PACKED_BIN_OUT,
> +		.name = "packed out",
> +		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +		.link_flags = 0,
> +		.image = true,
> +		.smem_alloc = false,
> +		.dma_port = R_RRZO,
> +		.fmts = bin_out_fmts,
> +		.num_fmts = ARRAY_SIZE(bin_out_fmts),
> +		.default_fmt_idx = 0,
> +		.ioctl_ops = &mtk_cam_v4l2_vcap_ioctl_ops,
> +		.frmsizes = &(struct v4l2_frmsizeenum) {
> +			.index = 0,
> +			.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
> +			.stepwise = {
> +				.max_width = IMG_MAX_WIDTH,
> +				.min_width = IMG_MIN_WIDTH,
> +				.max_height = IMG_MAX_HEIGHT,
> +				.min_height = IMG_MIN_HEIGHT,
> +				.step_height = 1,
> +				.step_width = 1,
> +			},
> +		},
> +	},
> +	{
> +		.id = MTK_CAM_P1_META_OUT_0,
> +		.name = "partial meta 0",
> +		.cap = V4L2_CAP_META_CAPTURE,
> +		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
> +		.link_flags = 0,
> +		.image = false,
> +		.smem_alloc = false,
> +		.dma_port = R_AAO | R_FLKO | R_PSO,
> +		.fmts = meta_fmts,
> +		.default_fmt_idx = 1,
> +		.max_buf_count = 5,
> +		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
> +	},
> +	{
> +		.id = MTK_CAM_P1_META_OUT_1,
> +		.name = "partial meta 1",
> +		.cap = V4L2_CAP_META_CAPTURE,
> +		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
> +		.link_flags = 0,
> +		.image = false,
> +		.smem_alloc = false,
> +		.dma_port = R_AFO,
> +		.fmts = meta_fmts,
> +		.default_fmt_idx = 2,
> +		.max_buf_count = 5,
> +		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
> +	},
> +	{
> +		.id = MTK_CAM_P1_META_OUT_2,
> +		.name = "partial meta 2",
> +		.cap = V4L2_CAP_META_CAPTURE,
> +		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
> +		.link_flags = 0,
> +		.image = false,
> +		.smem_alloc = false,
> +		.dma_port = R_LCSO,
> +		.fmts = meta_fmts,
> +		.default_fmt_idx = 3,
> +		.max_buf_count = 10,
> +		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
> +	},
> +	{
> +		.id = MTK_CAM_P1_META_OUT_3,
> +		.name = "partial meta 3",
> +		.cap = V4L2_CAP_META_CAPTURE,
> +		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
> +		.link_flags = 0,
> +		.image = false,
> +		.smem_alloc = false,
> +		.dma_port = R_LMVO,
> +		.fmts = meta_fmts,
> +		.default_fmt_idx = 4,
> +		.max_buf_count = 10,
> +		.ioctl_ops = &mtk_cam_v4l2_meta_cap_ioctl_ops,
> +	},
> +};
> +
> +/* The helper to configure the device context */
> +static void mtk_cam_dev_queue_setup(struct mtk_cam_dev *cam)
> +{
> +	unsigned int node_idx;
> +	int i;
> +
> +	node_idx = 0;
> +	/* Setup the output queue */
> +	for (i = 0; i < ARRAY_SIZE(output_queues); i++)
> +		cam->vdev_nodes[node_idx++].desc = output_queues[i];
> +
> +	/* Setup the capture queue */
> +	for (i = 0; i < ARRAY_SIZE(capture_queues); i++)
> +		cam->vdev_nodes[node_idx++].desc = capture_queues[i];
> +}
> +
> +int mtk_cam_dev_init(struct platform_device *pdev,
> +		     struct mtk_cam_dev *cam)
> +{
> +	int ret;
> +
> +	cam->dev = &pdev->dev;
> +	mtk_cam_dev_queue_setup(cam);
> +
> +	spin_lock_init(&cam->pending_job_lock);
> +	spin_lock_init(&cam->running_job_lock);
> +	INIT_LIST_HEAD(&cam->pending_job_list);
> +	INIT_LIST_HEAD(&cam->running_job_list);
> +	mutex_init(&cam->op_lock);
> +
> +	/* v4l2 sub-device registration */
> +	ret = mtk_cam_v4l2_register(cam);
> +	if (ret)
> +		return ret;
> +
> +	ret = mtk_cam_v4l2_async_register(cam);
> +	if (ret)
> +		goto fail_v4l2_unreg;
> +
> +	return 0;
> +
> +fail_v4l2_unreg:
> +	mutex_destroy(&cam->op_lock);
> +	mtk_cam_v4l2_unregister(cam);
> +
> +	return ret;
> +}
> +
> +void mtk_cam_dev_cleanup(struct mtk_cam_dev *cam)
> +{
> +	mtk_cam_v4l2_async_unregister(cam);
> +	mtk_cam_v4l2_unregister(cam);
> +	mutex_destroy(&cam->op_lock);
> +}
> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
> new file mode 100644
> index 000000000000..0a340a1e65ea
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
> @@ -0,0 +1,244 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CAM_H__
> +#define __MTK_CAM_H__
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "mtk_cam-ipi.h"
> +
> +#define IMG_MAX_WIDTH		5376
> +#define IMG_MAX_HEIGHT		4032
> +#define IMG_MIN_WIDTH		80
> +#define IMG_MIN_HEIGHT		60
> +
> +/*
> + * ID enum value for struct mtk_cam_dev_node_desc:id
> + * or mtk_cam_video_device:id
> + */
> +enum  {
> +	MTK_CAM_P1_META_IN_0 = 0,
> +	MTK_CAM_P1_MAIN_STREAM_OUT,
> +	MTK_CAM_P1_PACKED_BIN_OUT,
> +	MTK_CAM_P1_META_OUT_0,
> +	MTK_CAM_P1_META_OUT_1,
> +	MTK_CAM_P1_META_OUT_2,
> +	MTK_CAM_P1_META_OUT_3,
> +	MTK_CAM_P1_TOTAL_NODES
> +};
> +
> +/* Supported image format list */
> +#define MTK_CAM_IMG_FMT_UNKNOWN		0x0000
> +#define MTK_CAM_IMG_FMT_BAYER8		0x2200
> +#define MTK_CAM_IMG_FMT_BAYER10		0x2201
> +#define MTK_CAM_IMG_FMT_BAYER12		0x2202
> +#define MTK_CAM_IMG_FMT_BAYER14		0x2203
> +#define MTK_CAM_IMG_FMT_FG_BAYER8	0x2204
> +#define MTK_CAM_IMG_FMT_FG_BAYER10	0x2205
> +#define MTK_CAM_IMG_FMT_FG_BAYER12	0x2206
> +#define MTK_CAM_IMG_FMT_FG_BAYER14	0x2207
> +
> +/* Supported bayer pixel order */
> +#define MTK_CAM_RAW_PXL_ID_B		0
> +#define MTK_CAM_RAW_PXL_ID_GB		1
> +#define MTK_CAM_RAW_PXL_ID_GR		2
> +#define MTK_CAM_RAW_PXL_ID_R		3
> +#define MTK_CAM_RAW_PXL_ID_UNKNOWN	4
> +
> +/*
> + * struct mtk_p1_frame_param - MTK ISP P1 driver frame parameters.
> + *
> + * @frame_seq_no: The frame sequence of frame in driver layer.
> + * @dma_bufs: The DMA buffer address information of enabled DMA nodes.
> + *
> + */
> +struct mtk_p1_frame_param {
> +	unsigned int frame_seq_no;
> +	struct dma_buffer dma_bufs[MTK_CAM_P1_TOTAL_NODES];
> +} __packed;
> +
> +/*
> + * struct mtk_cam_dev_request - MTK camera device request.
> + *
> + * @req: Embedded struct media request.
> + * @frame_params: The frame info. & address info. of enabled DMA nodes.
> + * @frame_work: work queue entry for frame transmission to SCP.
> + * @list: List entry of the object for @struct mtk_cam_dev:
> + *        pending_job_list or running_job_list.
> + * @timestamp: Start of frame timestamp in ns
> + *
> + */
> +struct mtk_cam_dev_request {
> +	struct media_request req;
> +	struct mtk_p1_frame_param frame_params;
> +	struct work_struct frame_work;
> +	struct list_head list;
> +	u64 timestamp;
> +};
> +
> +/*
> + * struct mtk_cam_dev_buffer - MTK camera device buffer.
> + *
> + * @vbb: Embedded struct vb2_v4l2_buffer.
> + * @list: List entry of the object for @struct mtk_cam_video_device:
> + *        buf_list.
> + * @daddr: The DMA address of this buffer.
> + * @scp_addr: The SCP address of this buffer which
> + *            is only supported for meta input node.
> + * @node_id: The vidoe node id which this buffer belongs to.
> + *
> + */
> +struct mtk_cam_dev_buffer {
> +	struct vb2_v4l2_buffer vbb;
> +	struct list_head list;
> +	/* Intenal part */
> +	dma_addr_t daddr;
> +	dma_addr_t scp_addr;
> +	unsigned int node_id;
> +};
> +
> +/*
> + * struct mtk_cam_dev_node_desc - MTK camera device node descriptor
> + *
> + * @id: id of the node
> + * @name: name of the node
> + * @cap: supported V4L2 capabilities
> + * @buf_type: supported V4L2 buffer type
> + * @dma_port: the dma ports associated to the node
> + * @link_flags: default media link flags
> + * @smem_alloc: using the smem_dev as alloc device or not
> + * @image: true for image node, false for meta node
> + * @num_fmts: the number of supported node formats
> + * @default_fmt_idx: default format of this node
> + * @max_buf_count: maximum VB2 buffer count
> + * @ioctl_ops:  mapped to v4l2_ioctl_ops
> + * @fmts: supported format
> + * @frmsizes: supported V4L2 frame size number
> + *
> + */
> +struct mtk_cam_dev_node_desc {
> +	u8 id;
> +	const char *name;
> +	u32 cap;
> +	u32 buf_type;
> +	u32 dma_port;
> +	u32 link_flags;
> +	u8 smem_alloc:1;
> +	u8 image:1;
> +	u8 num_fmts;
> +	u8 default_fmt_idx;
> +	u8 max_buf_count;
> +	const struct v4l2_ioctl_ops *ioctl_ops;
> +	const struct v4l2_format *fmts;
> +	const struct v4l2_frmsizeenum *frmsizes;
> +};
> +
> +/*
> + * struct mtk_cam_video_device - Mediatek video device structure
> + *
> + * @id: Id for index of mtk_cam_dev:vdev_nodes array
> + * @enabled: Indicate the video device is enabled or not
> + * @desc: The node description of video device
> + * @vdev_fmt: The V4L2 format of video device
> + * @vdev_pad: The media pad graph object of video device
> + * @vbq: A videobuf queue of video device
> + * @vdev: The video device instance
> + * @vdev_lock: Serializes vb2 queue and video device operations
> + * @buf_list: List for enqueue buffers
> + * @buf_list_lock: Lock used to protect buffer list.
> + *
> + */
> +struct mtk_cam_video_device {
> +	unsigned int id;
> +	unsigned int enabled;
> +	struct mtk_cam_dev_node_desc desc;
> +	struct v4l2_format vdev_fmt;
> +	struct media_pad vdev_pad;
> +	struct vb2_queue vbq;
> +	struct video_device vdev;
> +	/* Serializes vb2 queue and video device operations */
> +	struct mutex vdev_lock;
> +	struct list_head buf_list;
> +	/* Lock used to protect buffer list */
> +	spinlock_t buf_list_lock;
> +};
> +
> +/*
> + * struct mtk_cam_dev - Mediatek camera device structure.
> + *
> + * @dev: Pointer to device.
> + * @smem_pdev: Pointer to shared memory device.
> + * @pipeline: Media pipeline information.
> + * @media_dev: Media device instance.
> + * @subdev: The V4L2 sub-device instance.
> + * @v4l2_dev: The V4L2 device driver instance.
> + * @notifier: The v4l2_device notifier data.
> + * @subdev_pads: Pointer to the number of media pads of this sub-device.
> + * @vdev_nodes: The array list of mtk_cam_video_device nodes.
> + * @seninf: Pointer to the seninf sub-device.
> + * @sensor: Pointer to the active sensor V4L2 sub-device when streaming on.
> + * @streaming: Indicate the overall streaming status is on or off.
> + * @enabled_dmas: The enabled dma port information when streaming on.
> + * @enabled_count: Number of enabled video nodes
> + * @stream_count: Number of streaming video nodes
> + * @running_job_count: Nunber of running jobs in the HW driver.
> + * @pending_job_list: List to keep the media requests before en-queue into
> + *                    HW driver.
> + * @pending_job_lock: Protect the pending_job_list data & running_job_count.
> + * @running_job_list: List to keep the media requests after en-queue into
> + *                    HW driver.
> + * @running_job_lock: Protect the running_job_list data.
> + * @op_lock: Serializes driver's VB2 callback operations.
> + *
> + */
> +struct mtk_cam_dev {
> +	struct device *dev;
> +	struct device *smem_dev;
> +	struct media_pipeline pipeline;
> +	struct media_device media_dev;
> +	struct v4l2_subdev subdev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_async_notifier notifier;
> +	struct media_pad *subdev_pads;
> +	struct mtk_cam_video_device vdev_nodes[MTK_CAM_P1_TOTAL_NODES];
> +	struct v4l2_subdev *seninf;
> +	struct v4l2_subdev *sensor;
> +	unsigned int streaming;
> +	unsigned int enabled_dmas;
> +	unsigned int enabled_count;
> +	unsigned int stream_count;
> +	unsigned int running_job_count;
> +	struct list_head pending_job_list;
> +	/* Protect the pending_job_list data */
> +	spinlock_t pending_job_lock;
> +	struct list_head running_job_list;
> +	/* Protect the running_job_list data & running_job_count */
> +	spinlock_t running_job_lock;
> +	/* Serializes driver's VB2 callback operations */
> +	struct mutex op_lock;
> +};
> +
> +int mtk_cam_dev_init(struct platform_device *pdev,
> +		     struct mtk_cam_dev *cam_dev);
> +void mtk_cam_dev_cleanup(struct mtk_cam_dev *cam_dev);
> +void mtk_cam_dev_req_try_queue(struct mtk_cam_dev *cam_dev);
> +void mtk_cam_dev_dequeue_req_frame(struct mtk_cam_dev *cam_dev,
> +				   unsigned int frame_seq_no);
> +void mtk_cam_dev_event_frame_sync(struct mtk_cam_dev *cam_dev,
> +				  unsigned int frame_seq_no);
> +struct mtk_cam_dev_request *mtk_cam_dev_get_req(struct mtk_cam_dev *cam,
> +						unsigned int frame_seq_no);
> +
> +#endif /* __MTK_CAM_H__ */
> 
