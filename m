Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D08C141C02
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2020 05:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgASElU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jan 2020 23:41:20 -0500
Received: from mga07.intel.com ([134.134.136.100]:21602 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgASElU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jan 2020 23:41:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jan 2020 20:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; 
   d="scan'208";a="221115254"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2020 20:41:17 -0800
Subject: Re: [PATCH v9 14/22] media: staging/intel-ipu3: Add imgu top level
 pci device driver
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <20181213095107.14894-1-sakari.ailus@linux.intel.com>
 <20181213095107.14894-15-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8fcfef90-1111-e6d1-e177-d405fe581ba8@linux.intel.com>
Date:   Sun, 19 Jan 2020 12:46:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20181213095107.14894-15-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/13/18 5:50 PM, Sakari Ailus wrote:
> From: Yong Zhi <yong.zhi@intel.com>
> 
> This patch adds support for the Intel IPU v3 as found
> on Skylake and Kaby Lake SoCs.
> 
> The driver glues v4l2, css(camera sub system) and other
> pieces together to perform its functions, it also loads
> the IPU3 firmware binary as part of its initialization.
> 
> Signed-off-by: Yong Zhi <yong.zhi@intel.com>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/Kconfig       |   2 +
>  drivers/staging/media/Makefile      |   1 +
>  drivers/staging/media/ipu3/Kconfig  |  14 +
>  drivers/staging/media/ipu3/Makefile |  11 +
>  drivers/staging/media/ipu3/TODO     |  23 +
>  drivers/staging/media/ipu3/ipu3.c   | 844 ++++++++++++++++++++++++++++++++++++
>  drivers/staging/media/ipu3/ipu3.h   | 152 +++++++
>  7 files changed, 1047 insertions(+)
>  create mode 100644 drivers/staging/media/ipu3/Kconfig
>  create mode 100644 drivers/staging/media/ipu3/Makefile
>  create mode 100644 drivers/staging/media/ipu3/TODO
>  create mode 100644 drivers/staging/media/ipu3/ipu3.c
>  create mode 100644 drivers/staging/media/ipu3/ipu3.h
> 
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index c6f3404dea43b..19cadd17e542a 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -39,4 +39,6 @@ source "drivers/staging/media/tegra-vde/Kconfig"
>  
>  source "drivers/staging/media/zoran/Kconfig"
>  
> +source "drivers/staging/media/ipu3/Kconfig"
> +
>  endif
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index 43c7bee1fc8c9..edde1960b030d 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
>  obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
>  obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
>  obj-$(CONFIG_VIDEO_ROCKCHIP_VPU) += rockchip/vpu/
> +obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
> diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
> new file mode 100644
> index 0000000000000..75cd889f18f76
> --- /dev/null
> +++ b/drivers/staging/media/ipu3/Kconfig
> @@ -0,0 +1,14 @@
> +config VIDEO_IPU3_IMGU
> +	tristate "Intel ipu3-imgu driver"
> +	depends on PCI && VIDEO_V4L2
> +	depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
> +	depends on X86
> +	select IOMMU_IOVA
> +	select VIDEOBUF2_DMA_SG
> +	---help---
> +	  This is the Video4Linux2 driver for Intel IPU3 image processing unit,
> +	  found in Intel Skylake and Kaby Lake SoCs and used for processing
> +	  images and video.
> +
> +	  Say Y or M here if you have a Skylake/Kaby Lake SoC with a MIPI
> +	  camera. The module will be called ipu3-imgu.
> diff --git a/drivers/staging/media/ipu3/Makefile b/drivers/staging/media/ipu3/Makefile
> new file mode 100644
> index 0000000000000..fb146d178bd4b
> --- /dev/null
> +++ b/drivers/staging/media/ipu3/Makefile
> @@ -0,0 +1,11 @@
> +#
> +# Makefile for the IPU3 ImgU drivers
> +#
> +
> +ipu3-imgu-objs += \
> +		ipu3-mmu.o ipu3-dmamap.o \
> +		ipu3-tables.o ipu3-css-pool.o \
> +		ipu3-css-fw.o ipu3-css-params.o \
> +		ipu3-css.o ipu3-v4l2.o ipu3.o
> +
> +obj-$(CONFIG_VIDEO_IPU3_IMGU) += ipu3-imgu.o
> diff --git a/drivers/staging/media/ipu3/TODO b/drivers/staging/media/ipu3/TODO
> new file mode 100644
> index 0000000000000..922b885f10a70
> --- /dev/null
> +++ b/drivers/staging/media/ipu3/TODO
> @@ -0,0 +1,23 @@
> +This is a list of things that need to be done to get this driver out of the
> +staging directory.
> +
> +- Request API conversion. Remove of the dual pipeline and associate buffers
> +  as well as formats and the binary used to a request. Remove the
> +  opportunistic buffer management. (Sakari)
> +
> +- Using ENABLED and IMMUTABLE link flags for the links where those are
> +  relevant. (Sakari)
> +
> +- Prefix imgu for all public APIs, i.e. change ipu3_v4l2_register() to
> +  imgu_v4l2_register(). (Sakari)
> +
> +- Use V4L2_CTRL_TYPE_MENU for dual-pipe mode control. (Sakari)
> +
> +- IPU3 driver documentation (Laurent)
> +  Add diagram in driver rst to describe output capability.
> +  Comments on configuring v4l2 subdevs for CIO2 and ImgU.
Hi, Laurent,

We are trying to remove the TODO items. I want get some input about your
comments from you, I hope you can remember that as it has been a long time from
last discussion on that.

- Comments on configuring v4l2 subdevs for CIO2 and ImgU.

Does this comment exist for Imgu only? We have a tool which can be used to
configure Imgu subdev -

https://github.com/intel/intel-ipu3-pipecfg

Please help review, thanks.

- Document different operation modes, and which buffer queues are relevant
  in each mode. To process an image, which queues require a buffer an in
  which ones is it optional?

For this item, I will document what is the difference of operation mode and how
user to make Imgu work, do you have other inputs on that?

> +
> +- uAPI documentation:
> +  Further clarification on some ambiguities such as data type conversion of
> +  IEFD CU inputs. (Sakari)
> +  Move acronyms to doc-rst file. (Mauro)
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> new file mode 100644
> index 0000000000000..3d0a34b86ff4c
> --- /dev/null
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -0,0 +1,844 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2017 - 2018 Intel Corporation
> + * Copyright 2017 Google LLC
> + *
> + * Based on Intel IPU4 driver.
> + *
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "ipu3.h"
> +#include "ipu3-dmamap.h"
> +#include "ipu3-mmu.h"
> +
> +#define IMGU_PCI_ID			0x1919
> +#define IMGU_PCI_BAR			0
> +#define IMGU_DMA_MASK			DMA_BIT_MASK(39)
> +#define IMGU_MAX_QUEUE_DEPTH		(2 + 2)
> +
> +/*
> + * pre-allocated buffer size for IMGU dummy buffers. Those
> + * values should be tuned to big enough to avoid buffer
> + * re-allocation when streaming to lower streaming latency.
> + */
> +#define CSS_QUEUE_IN_BUF_SIZE		0
> +#define CSS_QUEUE_PARAMS_BUF_SIZE	0
> +#define CSS_QUEUE_OUT_BUF_SIZE		(4160 * 3120 * 12 / 8)
> +#define CSS_QUEUE_VF_BUF_SIZE		(1920 * 1080 * 12 / 8)
> +#define CSS_QUEUE_STAT_3A_BUF_SIZE	sizeof(struct ipu3_uapi_stats_3a)
> +
> +static const size_t css_queue_buf_size_map[IPU3_CSS_QUEUES] = {
> +	[IPU3_CSS_QUEUE_IN] = CSS_QUEUE_IN_BUF_SIZE,
> +	[IPU3_CSS_QUEUE_PARAMS] = CSS_QUEUE_PARAMS_BUF_SIZE,
> +	[IPU3_CSS_QUEUE_OUT] = CSS_QUEUE_OUT_BUF_SIZE,
> +	[IPU3_CSS_QUEUE_VF] = CSS_QUEUE_VF_BUF_SIZE,
> +	[IPU3_CSS_QUEUE_STAT_3A] = CSS_QUEUE_STAT_3A_BUF_SIZE,
> +};
> +
> +static const struct imgu_node_mapping imgu_node_map[IMGU_NODE_NUM] = {
> +	[IMGU_NODE_IN] = {IPU3_CSS_QUEUE_IN, "input"},
> +	[IMGU_NODE_PARAMS] = {IPU3_CSS_QUEUE_PARAMS, "parameters"},
> +	[IMGU_NODE_OUT] = {IPU3_CSS_QUEUE_OUT, "output"},
> +	[IMGU_NODE_VF] = {IPU3_CSS_QUEUE_VF, "viewfinder"},
> +	[IMGU_NODE_PV] = {IPU3_CSS_QUEUE_VF, "postview"},
> +	[IMGU_NODE_STAT_3A] = {IPU3_CSS_QUEUE_STAT_3A, "3a stat"},
> +};
> +
> +unsigned int imgu_node_to_queue(unsigned int node)
> +{
> +	return imgu_node_map[node].css_queue;
> +}
> +
> +unsigned int imgu_map_node(struct imgu_device *imgu, unsigned int css_queue)
> +{
> +	unsigned int i;
> +
> +	if (css_queue == IPU3_CSS_QUEUE_VF)
> +		return imgu->nodes[IMGU_NODE_VF].enabled ?
> +			IMGU_NODE_VF : IMGU_NODE_PV;
> +
> +	for (i = 0; i < IMGU_NODE_NUM; i++)
> +		if (imgu_node_map[i].css_queue == css_queue)
> +			break;
> +
> +	return i;
> +}
> +
> +/**************** Dummy buffers ****************/
> +
> +static void imgu_dummybufs_cleanup(struct imgu_device *imgu)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < IPU3_CSS_QUEUES; i++)
> +		ipu3_dmamap_free(imgu, &imgu->queues[i].dmap);
> +}
> +
> +static int imgu_dummybufs_preallocate(struct imgu_device *imgu)
> +{
> +	unsigned int i;
> +	size_t size;
> +
> +	for (i = 0; i < IPU3_CSS_QUEUES; i++) {
> +		size = css_queue_buf_size_map[i];
> +		/*
> +		 * Do not enable dummy buffers for master queue,
> +		 * always require that real buffers from user are
> +		 * available.
> +		 */
> +		if (i == IMGU_QUEUE_MASTER || size == 0)
> +			continue;
> +
> +		if (!ipu3_dmamap_alloc(imgu, &imgu->queues[i].dmap, size)) {
> +			imgu_dummybufs_cleanup(imgu);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int imgu_dummybufs_init(struct imgu_device *imgu)
> +{
> +	const struct v4l2_pix_format_mplane *mpix;
> +	const struct v4l2_meta_format	*meta;
> +	unsigned int i, j, node;
> +	size_t size;
> +
> +	/* Allocate a dummy buffer for each queue where buffer is optional */
> +	for (i = 0; i < IPU3_CSS_QUEUES; i++) {
> +		node = imgu_map_node(imgu, i);
> +		if (!imgu->queue_enabled[node] || i == IMGU_QUEUE_MASTER)
> +			continue;
> +
> +		if (!imgu->nodes[IMGU_NODE_VF].enabled &&
> +		    !imgu->nodes[IMGU_NODE_PV].enabled &&
> +		    i == IPU3_CSS_QUEUE_VF)
> +			/*
> +			 * Do not enable dummy buffers for VF/PV if it is not
> +			 * requested by the user.
> +			 */
> +			continue;
> +
> +		meta = &imgu->nodes[node].vdev_fmt.fmt.meta;
> +		mpix = &imgu->nodes[node].vdev_fmt.fmt.pix_mp;
> +
> +		if (node == IMGU_NODE_STAT_3A || node == IMGU_NODE_PARAMS)
> +			size = meta->buffersize;
> +		else
> +			size = mpix->plane_fmt[0].sizeimage;
> +
> +		if (ipu3_css_dma_buffer_resize(imgu, &imgu->queues[i].dmap,
> +					       size)) {
> +			imgu_dummybufs_cleanup(imgu);
> +			return -ENOMEM;
> +		}
> +
> +		for (j = 0; j < IMGU_MAX_QUEUE_DEPTH; j++)
> +			ipu3_css_buf_init(&imgu->queues[i].dummybufs[j], i,
> +					  imgu->queues[i].dmap.daddr);
> +	}
> +
> +	return 0;
> +}
> +
> +/* May be called from atomic context */
> +static struct ipu3_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
> +						  int queue)
> +{
> +	unsigned int i;
> +
> +	/* dummybufs are not allocated for master q */
> +	if (queue == IPU3_CSS_QUEUE_IN)
> +		return NULL;
> +
> +	if (WARN_ON(!imgu->queues[queue].dmap.vaddr))
> +		/* Buffer should not be allocated here */
> +		return NULL;
> +
> +	for (i = 0; i < IMGU_MAX_QUEUE_DEPTH; i++)
> +		if (ipu3_css_buf_state(&imgu->queues[queue].dummybufs[i]) !=
> +			IPU3_CSS_BUFFER_QUEUED)
> +			break;
> +
> +	if (i == IMGU_MAX_QUEUE_DEPTH)
> +		return NULL;
> +
> +	ipu3_css_buf_init(&imgu->queues[queue].dummybufs[i], queue,
> +			  imgu->queues[queue].dmap.daddr);
> +
> +	return &imgu->queues[queue].dummybufs[i];
> +}
> +
> +/* Check if given buffer is a dummy buffer */
> +static bool imgu_dummybufs_check(struct imgu_device *imgu,
> +				 struct ipu3_css_buffer *buf)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < IMGU_MAX_QUEUE_DEPTH; i++)
> +		if (buf == &imgu->queues[buf->queue].dummybufs[i])
> +			break;
> +
> +	return i < IMGU_MAX_QUEUE_DEPTH;
> +}
> +
> +static void imgu_buffer_done(struct imgu_device *imgu, struct vb2_buffer *vb,
> +			     enum vb2_buffer_state state)
> +{
> +	mutex_lock(&imgu->lock);
> +	imgu_v4l2_buffer_done(vb, state);
> +	mutex_unlock(&imgu->lock);
> +}
> +
> +static struct ipu3_css_buffer *imgu_queue_getbuf(struct imgu_device *imgu,
> +						 unsigned int node)
> +{
> +	struct imgu_buffer *buf;
> +
> +	if (WARN_ON(node >= IMGU_NODE_NUM))
> +		return NULL;
> +
> +	/* Find first free buffer from the node */
> +	list_for_each_entry(buf, &imgu->nodes[node].buffers, vid_buf.list) {
> +		if (ipu3_css_buf_state(&buf->css_buf) == IPU3_CSS_BUFFER_NEW)
> +			return &buf->css_buf;
> +	}
> +
> +	/* There were no free buffers, try to return a dummy buffer */
> +	return imgu_dummybufs_get(imgu, imgu_node_map[node].css_queue);
> +}
> +
> +/*
> + * Queue as many buffers to CSS as possible. If all buffers don't fit into
> + * CSS buffer queues, they remain unqueued and will be queued later.
> + */
> +int imgu_queue_buffers(struct imgu_device *imgu, bool initial)
> +{
> +	unsigned int node;
> +	int r = 0;
> +	struct imgu_buffer *ibuf;
> +
> +	if (!ipu3_css_is_streaming(&imgu->css))
> +		return 0;
> +
> +	mutex_lock(&imgu->lock);
> +
> +	/* Buffer set is queued to FW only when input buffer is ready */
> +	for (node = IMGU_NODE_NUM - 1;
> +	     imgu_queue_getbuf(imgu, IMGU_NODE_IN);
> +	     node = node ? node - 1 : IMGU_NODE_NUM - 1) {
> +
> +		if (node == IMGU_NODE_VF &&
> +		    (imgu->css.pipe_id == IPU3_CSS_PIPE_ID_CAPTURE ||
> +		     !imgu->nodes[IMGU_NODE_VF].enabled)) {
> +			continue;
> +		} else if (node == IMGU_NODE_PV &&
> +			   (imgu->css.pipe_id == IPU3_CSS_PIPE_ID_VIDEO ||
> +			    !imgu->nodes[IMGU_NODE_PV].enabled)) {
> +			continue;
> +		} else if (imgu->queue_enabled[node]) {
> +			struct ipu3_css_buffer *buf =
> +					imgu_queue_getbuf(imgu, node);
> +			int dummy;
> +
> +			if (!buf)
> +				break;
> +
> +			r = ipu3_css_buf_queue(&imgu->css, buf);
> +			if (r)
> +				break;
> +			dummy = imgu_dummybufs_check(imgu, buf);
> +			if (!dummy)
> +				ibuf = container_of(buf, struct imgu_buffer,
> +						    css_buf);
> +			dev_dbg(&imgu->pci_dev->dev,
> +				"queue %s %s buffer %d to css da: 0x%08x\n",
> +				dummy ? "dummy" : "user",
> +				imgu_node_map[node].name,
> +				dummy ? 0 : ibuf->vid_buf.vbb.vb2_buf.index,
> +				(u32)buf->daddr);
> +		}
> +	}
> +	mutex_unlock(&imgu->lock);
> +
> +	if (r && r != -EBUSY)
> +		goto failed;
> +
> +	return 0;
> +
> +failed:
> +	/*
> +	 * On error, mark all buffers as failed which are not
> +	 * yet queued to CSS
> +	 */
> +	dev_err(&imgu->pci_dev->dev,
> +		"failed to queue buffer to CSS on queue %i (%d)\n",
> +		node, r);
> +
> +	if (initial)
> +		/* If we were called from streamon(), no need to finish bufs */
> +		return r;
> +
> +	for (node = 0; node < IMGU_NODE_NUM; node++) {
> +		struct imgu_buffer *buf, *buf0;
> +
> +		if (!imgu->queue_enabled[node])
> +			continue;	/* Skip disabled queues */
> +
> +		mutex_lock(&imgu->lock);
> +		list_for_each_entry_safe(buf, buf0, &imgu->nodes[node].buffers,
> +					 vid_buf.list) {
> +			if (ipu3_css_buf_state(&buf->css_buf) ==
> +					IPU3_CSS_BUFFER_QUEUED)
> +				continue;	/* Was already queued, skip */
> +
> +			imgu_v4l2_buffer_done(&buf->vid_buf.vbb.vb2_buf,
> +					      VB2_BUF_STATE_ERROR);
> +		}
> +		mutex_unlock(&imgu->lock);
> +	}
> +
> +	return r;
> +}
> +
> +static int imgu_powerup(struct imgu_device *imgu)
> +{
> +	int r;
> +
> +	r = ipu3_css_set_powerup(&imgu->pci_dev->dev, imgu->base);
> +	if (r)
> +		return r;
> +
> +	ipu3_mmu_resume(imgu->mmu);
> +	return 0;
> +}
> +
> +static void imgu_powerdown(struct imgu_device *imgu)
> +{
> +	ipu3_mmu_suspend(imgu->mmu);
> +	ipu3_css_set_powerdown(&imgu->pci_dev->dev, imgu->base);
> +}
> +
> +int imgu_s_stream(struct imgu_device *imgu, int enable)
> +{
> +	struct device *dev = &imgu->pci_dev->dev;
> +	struct v4l2_pix_format_mplane *fmts[IPU3_CSS_QUEUES] = { NULL };
> +	struct v4l2_rect *rects[IPU3_CSS_RECTS] = { NULL };
> +	unsigned int i, node;
> +	int r;
> +
> +	if (!enable) {
> +		/* Stop streaming */
> +		dev_dbg(dev, "stream off\n");
> +		/* Block new buffers to be queued to CSS. */
> +		atomic_set(&imgu->qbuf_barrier, 1);
> +		ipu3_css_stop_streaming(&imgu->css);
> +		synchronize_irq(imgu->pci_dev->irq);
> +		atomic_set(&imgu->qbuf_barrier, 0);
> +		imgu_powerdown(imgu);
> +		pm_runtime_put(&imgu->pci_dev->dev);
> +
> +		return 0;
> +	}
> +
> +	/* Start streaming */
> +
> +	dev_dbg(dev, "stream on\n");
> +	for (i = 0; i < IMGU_NODE_NUM; i++)
> +		imgu->queue_enabled[i] = imgu->nodes[i].enabled;
> +
> +	/*
> +	 * CSS library expects that the following queues are
> +	 * always enabled; if buffers are not provided to some of the
> +	 * queues, it stalls due to lack of buffers.
> +	 * Force the queues to be enabled and if the user really hasn't
> +	 * enabled them, use dummy buffers.
> +	 */
> +	imgu->queue_enabled[IMGU_NODE_OUT] = true;
> +	imgu->queue_enabled[IMGU_NODE_VF] = true;
> +	imgu->queue_enabled[IMGU_NODE_PV] = true;
> +	imgu->queue_enabled[IMGU_NODE_STAT_3A] = true;
> +
> +	/* This is handled specially */
> +	imgu->queue_enabled[IPU3_CSS_QUEUE_PARAMS] = false;
> +
> +	/* Initialize CSS formats */
> +	for (i = 0; i < IPU3_CSS_QUEUES; i++) {
> +		node = imgu_map_node(imgu, i);
> +		/* No need to reconfig meta nodes */
> +		if (node == IMGU_NODE_STAT_3A || node == IMGU_NODE_PARAMS)
> +			continue;
> +		fmts[i] = imgu->queue_enabled[node] ?
> +			&imgu->nodes[node].vdev_fmt.fmt.pix_mp : NULL;
> +	}
> +
> +	/* Enable VF output only when VF or PV queue requested by user */
> +	imgu->css.vf_output_en = IPU3_NODE_VF_DISABLED;
> +	if (imgu->nodes[IMGU_NODE_VF].enabled)
> +		imgu->css.vf_output_en = IPU3_NODE_VF_ENABLED;
> +	else if (imgu->nodes[IMGU_NODE_PV].enabled)
> +		imgu->css.vf_output_en = IPU3_NODE_PV_ENABLED;
> +
> +	rects[IPU3_CSS_RECT_EFFECTIVE] = &imgu->rect.eff;
> +	rects[IPU3_CSS_RECT_BDS] = &imgu->rect.bds;
> +	rects[IPU3_CSS_RECT_GDC] = &imgu->rect.gdc;
> +
> +	r = ipu3_css_fmt_set(&imgu->css, fmts, rects);
> +	if (r) {
> +		dev_err(dev, "failed to set initial formats (%d)", r);
> +		return r;
> +	}
> +
> +	/* Set Power */
> +	r = pm_runtime_get_sync(dev);
> +	if (r < 0) {
> +		dev_err(dev, "failed to set imgu power\n");
> +		pm_runtime_put(dev);
> +		return r;
> +	}
> +
> +	r = imgu_powerup(imgu);
> +	if (r) {
> +		dev_err(dev, "failed to power up imgu\n");
> +		pm_runtime_put(dev);
> +		return r;
> +	}
> +
> +	/* Start CSS streaming */
> +	r = ipu3_css_start_streaming(&imgu->css);
> +	if (r) {
> +		dev_err(dev, "failed to start css streaming (%d)", r);
> +		goto fail_start_streaming;
> +	}
> +
> +	/* Initialize dummy buffers */
> +	r = imgu_dummybufs_init(imgu);
> +	if (r) {
> +		dev_err(dev, "failed to initialize dummy buffers (%d)", r);
> +		goto fail_dummybufs;
> +	}
> +
> +	/* Queue as many buffers from queue as possible */
> +	r = imgu_queue_buffers(imgu, true);
> +	if (r) {
> +		dev_err(dev, "failed to queue initial buffers (%d)", r);
> +		goto fail_queueing;
> +	}
> +
> +	return 0;
> +
> +fail_queueing:
> +	imgu_dummybufs_cleanup(imgu);
> +fail_dummybufs:
> +	ipu3_css_stop_streaming(&imgu->css);
> +fail_start_streaming:
> +	pm_runtime_put(dev);
> +
> +	return r;
> +}
> +
> +static int imgu_video_nodes_init(struct imgu_device *imgu)
> +{
> +	struct v4l2_pix_format_mplane *fmts[IPU3_CSS_QUEUES] = { NULL };
> +	struct v4l2_rect *rects[IPU3_CSS_RECTS] = { NULL };
> +	unsigned int i;
> +	int r;
> +
> +	imgu->buf_struct_size = sizeof(struct imgu_buffer);
> +
> +	for (i = 0; i < IMGU_NODE_NUM; i++) {
> +		imgu->nodes[i].name = imgu_node_map[i].name;
> +		imgu->nodes[i].output = i < IMGU_QUEUE_FIRST_INPUT;
> +		imgu->nodes[i].immutable = false;
> +		imgu->nodes[i].enabled = false;
> +
> +		if (i != IMGU_NODE_PARAMS && i != IMGU_NODE_STAT_3A)
> +			fmts[imgu_node_map[i].css_queue] =
> +				&imgu->nodes[i].vdev_fmt.fmt.pix_mp;
> +		atomic_set(&imgu->nodes[i].sequence, 0);
> +	}
> +
> +	/* Master queue is always enabled */
> +	imgu->nodes[IMGU_QUEUE_MASTER].immutable = true;
> +	imgu->nodes[IMGU_QUEUE_MASTER].enabled = true;
> +
> +	r = imgu_v4l2_register(imgu);
> +	if (r)
> +		return r;
> +
> +	/* Set initial formats and initialize formats of video nodes */
> +	rects[IPU3_CSS_RECT_EFFECTIVE] = &imgu->rect.eff;
> +	rects[IPU3_CSS_RECT_BDS] = &imgu->rect.bds;
> +	ipu3_css_fmt_set(&imgu->css, fmts, rects);
> +
> +	/* Pre-allocate dummy buffers */
> +	r = imgu_dummybufs_preallocate(imgu);
> +	if (r) {
> +		dev_err(&imgu->pci_dev->dev,
> +			"failed to pre-allocate dummy buffers (%d)", r);
> +		imgu_dummybufs_cleanup(imgu);
> +		imgu_v4l2_unregister(imgu);
> +	}
> +
> +	return 0;
> +}
> +
> +static void imgu_video_nodes_exit(struct imgu_device *imgu)
> +{
> +	imgu_dummybufs_cleanup(imgu);
> +	imgu_v4l2_unregister(imgu);
> +}
> +
> +/**************** PCI interface ****************/
> +
> +static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
> +{
> +	struct imgu_device *imgu = imgu_ptr;
> +
> +	/* Dequeue / queue buffers */
> +	do {
> +		u64 ns = ktime_get_ns();
> +		struct ipu3_css_buffer *b;
> +		struct imgu_buffer *buf;
> +		unsigned int node;
> +		bool dummy;
> +
> +		do {
> +			mutex_lock(&imgu->lock);
> +			b = ipu3_css_buf_dequeue(&imgu->css);
> +			mutex_unlock(&imgu->lock);
> +		} while (PTR_ERR(b) == -EAGAIN);
> +
> +		if (IS_ERR_OR_NULL(b)) {
> +			if (!b || PTR_ERR(b) == -EBUSY)	/* All done */
> +				break;
> +			dev_err(&imgu->pci_dev->dev,
> +				"failed to dequeue buffers (%ld)\n",
> +				PTR_ERR(b));
> +			break;
> +		}
> +
> +		node = imgu_map_node(imgu, b->queue);
> +		dummy = imgu_dummybufs_check(imgu, b);
> +		if (!dummy)
> +			buf = container_of(b, struct imgu_buffer, css_buf);
> +		dev_dbg(&imgu->pci_dev->dev,
> +			"dequeue %s %s buffer %d from css\n",
> +			dummy ? "dummy" : "user",
> +			imgu_node_map[node].name,
> +			dummy ? 0 : buf->vid_buf.vbb.vb2_buf.index);
> +
> +		if (dummy)
> +			/* It was a dummy buffer, skip it */
> +			continue;
> +
> +		/* Fill vb2 buffer entries and tell it's ready */
> +		if (!imgu->nodes[node].output) {
> +			buf->vid_buf.vbb.vb2_buf.timestamp = ns;
> +			buf->vid_buf.vbb.field = V4L2_FIELD_NONE;
> +			buf->vid_buf.vbb.sequence =
> +				atomic_inc_return(&imgu->nodes[node].sequence);
> +		}
> +		imgu_buffer_done(imgu, &buf->vid_buf.vbb.vb2_buf,
> +				 ipu3_css_buf_state(&buf->css_buf) ==
> +						    IPU3_CSS_BUFFER_DONE ?
> +						    VB2_BUF_STATE_DONE :
> +						    VB2_BUF_STATE_ERROR);
> +		mutex_lock(&imgu->lock);
> +		if (ipu3_css_queue_empty(&imgu->css))
> +			wake_up_all(&imgu->buf_drain_wq);
> +		mutex_unlock(&imgu->lock);
> +	} while (1);
> +
> +	/*
> +	 * Try to queue more buffers for CSS.
> +	 * qbuf_barrier is used to disable new buffers
> +	 * to be queued to CSS.
> +	 */
> +	if (!atomic_read(&imgu->qbuf_barrier))
> +		imgu_queue_buffers(imgu, false);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t imgu_isr(int irq, void *imgu_ptr)
> +{
> +	struct imgu_device *imgu = imgu_ptr;
> +
> +	/* acknowledge interruption */
> +	if (ipu3_css_irq_ack(&imgu->css) < 0)
> +		return IRQ_NONE;
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static int imgu_pci_config_setup(struct pci_dev *dev)
> +{
> +	u16 pci_command;
> +	int r = pci_enable_msi(dev);
> +
> +	if (r) {
> +		dev_err(&dev->dev, "failed to enable MSI (%d)\n", r);
> +		return r;
> +	}
> +
> +	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
> +	pci_command |= PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
> +			PCI_COMMAND_INTX_DISABLE;
> +	pci_write_config_word(dev, PCI_COMMAND, pci_command);
> +
> +	return 0;
> +}
> +
> +static int imgu_pci_probe(struct pci_dev *pci_dev,
> +			  const struct pci_device_id *id)
> +{
> +	struct imgu_device *imgu;
> +	phys_addr_t phys;
> +	unsigned long phys_len;
> +	void __iomem *const *iomap;
> +	int r;
> +
> +	imgu = devm_kzalloc(&pci_dev->dev, sizeof(*imgu), GFP_KERNEL);
> +	if (!imgu)
> +		return -ENOMEM;
> +
> +	imgu->pci_dev = pci_dev;
> +
> +	r = pcim_enable_device(pci_dev);
> +	if (r) {
> +		dev_err(&pci_dev->dev, "failed to enable device (%d)\n", r);
> +		return r;
> +	}
> +
> +	dev_info(&pci_dev->dev, "device 0x%x (rev: 0x%x)\n",
> +		 pci_dev->device, pci_dev->revision);
> +
> +	phys = pci_resource_start(pci_dev, IMGU_PCI_BAR);
> +	phys_len = pci_resource_len(pci_dev, IMGU_PCI_BAR);
> +
> +	r = pcim_iomap_regions(pci_dev, 1 << IMGU_PCI_BAR, pci_name(pci_dev));
> +	if (r) {
> +		dev_err(&pci_dev->dev, "failed to remap I/O memory (%d)\n", r);
> +		return r;
> +	}
> +	dev_info(&pci_dev->dev, "physical base address %pap, %lu bytes\n",
> +		 &phys, phys_len);
> +
> +	iomap = pcim_iomap_table(pci_dev);
> +	if (!iomap) {
> +		dev_err(&pci_dev->dev, "failed to iomap table\n");
> +		return -ENODEV;
> +	}
> +
> +	imgu->base = iomap[IMGU_PCI_BAR];
> +
> +	pci_set_drvdata(pci_dev, imgu);
> +
> +	pci_set_master(pci_dev);
> +
> +	r = dma_coerce_mask_and_coherent(&pci_dev->dev, IMGU_DMA_MASK);
> +	if (r) {
> +		dev_err(&pci_dev->dev, "failed to set DMA mask (%d)\n", r);
> +		return -ENODEV;
> +	}
> +
> +	r = imgu_pci_config_setup(pci_dev);
> +	if (r)
> +		return r;
> +
> +	mutex_init(&imgu->lock);
> +	atomic_set(&imgu->qbuf_barrier, 0);
> +	init_waitqueue_head(&imgu->buf_drain_wq);
> +
> +	r = ipu3_css_set_powerup(&pci_dev->dev, imgu->base);
> +	if (r) {
> +		dev_err(&pci_dev->dev,
> +			"failed to power up CSS (%d)\n", r);
> +		goto out_mutex_destroy;
> +	}
> +
> +	imgu->mmu = ipu3_mmu_init(&pci_dev->dev, imgu->base);
> +	if (IS_ERR(imgu->mmu)) {
> +		r = PTR_ERR(imgu->mmu);
> +		dev_err(&pci_dev->dev, "failed to initialize MMU (%d)\n", r);
> +		goto out_css_powerdown;
> +	}
> +
> +	r = ipu3_dmamap_init(imgu);
> +	if (r) {
> +		dev_err(&pci_dev->dev,
> +			"failed to initialize DMA mapping (%d)\n", r);
> +		goto out_mmu_exit;
> +	}
> +
> +	/* ISP programming */
> +	r = ipu3_css_init(&pci_dev->dev, &imgu->css, imgu->base, phys_len);
> +	if (r) {
> +		dev_err(&pci_dev->dev, "failed to initialize CSS (%d)\n", r);
> +		goto out_dmamap_exit;
> +	}
> +
> +	/* v4l2 sub-device registration */
> +	r = imgu_video_nodes_init(imgu);
> +	if (r) {
> +		dev_err(&pci_dev->dev, "failed to create V4L2 devices (%d)\n",
> +			r);
> +		goto out_css_cleanup;
> +	}
> +
> +	r = devm_request_threaded_irq(&pci_dev->dev, pci_dev->irq,
> +				      imgu_isr, imgu_isr_threaded,
> +				      IRQF_SHARED, IMGU_NAME, imgu);
> +	if (r) {
> +		dev_err(&pci_dev->dev, "failed to request IRQ (%d)\n", r);
> +		goto out_video_exit;
> +	}
> +
> +	pm_runtime_put_noidle(&pci_dev->dev);
> +	pm_runtime_allow(&pci_dev->dev);
> +
> +	return 0;
> +
> +out_video_exit:
> +	imgu_video_nodes_exit(imgu);
> +out_css_cleanup:
> +	ipu3_css_cleanup(&imgu->css);
> +out_dmamap_exit:
> +	ipu3_dmamap_exit(imgu);
> +out_mmu_exit:
> +	ipu3_mmu_exit(imgu->mmu);
> +out_css_powerdown:
> +	ipu3_css_set_powerdown(&pci_dev->dev, imgu->base);
> +out_mutex_destroy:
> +	mutex_destroy(&imgu->lock);
> +
> +	return r;
> +}
> +
> +static void imgu_pci_remove(struct pci_dev *pci_dev)
> +{
> +	struct imgu_device *imgu = pci_get_drvdata(pci_dev);
> +
> +	pm_runtime_forbid(&pci_dev->dev);
> +	pm_runtime_get_noresume(&pci_dev->dev);
> +
> +	imgu_video_nodes_exit(imgu);
> +	ipu3_css_cleanup(&imgu->css);
> +	ipu3_css_set_powerdown(&pci_dev->dev, imgu->base);
> +	ipu3_dmamap_exit(imgu);
> +	ipu3_mmu_exit(imgu->mmu);
> +	mutex_destroy(&imgu->lock);
> +}
> +
> +static int __maybe_unused imgu_suspend(struct device *dev)
> +{
> +	struct pci_dev *pci_dev = to_pci_dev(dev);
> +	struct imgu_device *imgu = pci_get_drvdata(pci_dev);
> +
> +	dev_dbg(dev, "enter %s\n", __func__);
> +	imgu->suspend_in_stream = ipu3_css_is_streaming(&imgu->css);
> +	if (!imgu->suspend_in_stream)
> +		goto out;
> +	/* Block new buffers to be queued to CSS. */
> +	atomic_set(&imgu->qbuf_barrier, 1);
> +	/*
> +	 * Wait for currently running irq handler to be done so that
> +	 * no new buffers will be queued to fw later.
> +	 */
> +	synchronize_irq(pci_dev->irq);
> +	/* Wait until all buffers in CSS are done. */
> +	if (!wait_event_timeout(imgu->buf_drain_wq,
> +	    ipu3_css_queue_empty(&imgu->css), msecs_to_jiffies(1000)))
> +		dev_err(dev, "wait buffer drain timeout.\n");
> +
> +	ipu3_css_stop_streaming(&imgu->css);
> +	atomic_set(&imgu->qbuf_barrier, 0);
> +	imgu_powerdown(imgu);
> +	pm_runtime_force_suspend(dev);
> +out:
> +	dev_dbg(dev, "leave %s\n", __func__);
> +	return 0;
> +}
> +
> +static int __maybe_unused imgu_resume(struct device *dev)
> +{
> +	struct pci_dev *pci_dev = to_pci_dev(dev);
> +	struct imgu_device *imgu = pci_get_drvdata(pci_dev);
> +	int r = 0;
> +
> +	dev_dbg(dev, "enter %s\n", __func__);
> +
> +	if (!imgu->suspend_in_stream)
> +		goto out;
> +
> +	pm_runtime_force_resume(dev);
> +
> +	r = imgu_powerup(imgu);
> +	if (r) {
> +		dev_err(dev, "failed to power up imgu\n");
> +		goto out;
> +	}
> +
> +	/* Start CSS streaming */
> +	r = ipu3_css_start_streaming(&imgu->css);
> +	if (r) {
> +		dev_err(dev, "failed to resume css streaming (%d)", r);
> +		goto out;
> +	}
> +
> +	r = imgu_queue_buffers(imgu, true);
> +	if (r)
> +		dev_err(dev, "failed to queue buffers (%d)", r);
> +out:
> +	dev_dbg(dev, "leave %s\n", __func__);
> +
> +	return r;
> +}
> +
> +/*
> + * PCI rpm framework checks the existence of driver rpm callbacks.
> + * Place a dummy callback here to avoid rpm going into error state.
> + */
> +static int imgu_rpm_dummy_cb(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops imgu_pm_ops = {
> +	SET_RUNTIME_PM_OPS(&imgu_rpm_dummy_cb, &imgu_rpm_dummy_cb, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(&imgu_suspend, &imgu_resume)
> +};
> +
> +static const struct pci_device_id imgu_pci_tbl[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, IMGU_PCI_ID) },
> +	{ 0, }
> +};
> +
> +MODULE_DEVICE_TABLE(pci, imgu_pci_tbl);
> +
> +static struct pci_driver imgu_pci_driver = {
> +	.name = IMGU_NAME,
> +	.id_table = imgu_pci_tbl,
> +	.probe = imgu_pci_probe,
> +	.remove = imgu_pci_remove,
> +	.driver = {
> +		.pm = &imgu_pm_ops,
> +	},
> +};
> +
> +module_pci_driver(imgu_pci_driver);
> +
> +MODULE_AUTHOR("Tuukka Toivonen <tuukka.toivonen@intel.com>");
> +MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
> +MODULE_AUTHOR("Jian Xu Zheng <jian.xu.zheng@intel.com>");
> +MODULE_AUTHOR("Yuning Pu <yuning.pu@intel.com>");
> +MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Intel ipu3_imgu PCI driver");
> diff --git a/drivers/staging/media/ipu3/ipu3.h b/drivers/staging/media/ipu3/ipu3.h
> new file mode 100644
> index 0000000000000..2e0c756a9e650
> --- /dev/null
> +++ b/drivers/staging/media/ipu3/ipu3.h
> @@ -0,0 +1,152 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2018 Intel Corporation */
> +
> +#ifndef __IPU3_H
> +#define __IPU3_H
> +
> +#include <linux/iova.h>
> +#include <linux/pci.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-dma-sg.h>
> +
> +#include "ipu3-css.h"
> +
> +#define IMGU_NAME			"ipu3-imgu"
> +
> +/*
> + * The semantics of the driver is that whenever there is a buffer available in
> + * master queue, the driver queues a buffer also to all other active nodes.
> + * If user space hasn't provided a buffer to all other video nodes first,
> + * the driver gets an internal dummy buffer and queues it.
> + */
> +#define IMGU_QUEUE_MASTER		IPU3_CSS_QUEUE_IN
> +#define IMGU_QUEUE_FIRST_INPUT		IPU3_CSS_QUEUE_OUT
> +#define IMGU_MAX_QUEUE_DEPTH		(2 + 2)
> +
> +#define IMGU_NODE_IN			0 /* Input RAW image */
> +#define IMGU_NODE_PARAMS		1 /* Input parameters */
> +#define IMGU_NODE_OUT			2 /* Main output for still or video */
> +#define IMGU_NODE_VF			3 /* Preview */
> +#define IMGU_NODE_PV			4 /* Postview for still capture */
> +#define IMGU_NODE_STAT_3A		5 /* 3A statistics */
> +#define IMGU_NODE_NUM			6
> +
> +#define file_to_intel_ipu3_node(__file) \
> +	container_of(video_devdata(__file), struct imgu_video_device, vdev)
> +
> +#define IPU3_INPUT_MIN_WIDTH		0U
> +#define IPU3_INPUT_MIN_HEIGHT		0U
> +#define IPU3_INPUT_MAX_WIDTH		5120U
> +#define IPU3_INPUT_MAX_HEIGHT		38404U
> +#define IPU3_OUTPUT_MIN_WIDTH		2U
> +#define IPU3_OUTPUT_MIN_HEIGHT		2U
> +#define IPU3_OUTPUT_MAX_WIDTH		4480U
> +#define IPU3_OUTPUT_MAX_HEIGHT		34004U
> +
> +struct ipu3_vb2_buffer {
> +	/* Public fields */
> +	struct vb2_v4l2_buffer vbb;	/* Must be the first field */
> +
> +	/* Private fields */
> +	struct list_head list;
> +};
> +
> +struct imgu_buffer {
> +	struct ipu3_vb2_buffer vid_buf;	/* Must be the first field */
> +	struct ipu3_css_buffer css_buf;
> +	struct ipu3_css_map map;
> +};
> +
> +struct imgu_node_mapping {
> +	unsigned int css_queue;
> +	const char *name;
> +};
> +
> +/**
> + * struct imgu_video_device
> + * each node registers as video device and maintains its
> + * own vb2_queue.
> + */
> +struct imgu_video_device {
> +	const char *name;
> +	bool output;
> +	bool immutable;		/* Can not be enabled/disabled */
> +	bool enabled;
> +	struct v4l2_format vdev_fmt;	/* Currently set format */
> +
> +	/* Private fields */
> +	struct video_device vdev;
> +	struct media_pad vdev_pad;
> +	struct v4l2_mbus_framefmt pad_fmt;
> +	struct vb2_queue vbq;
> +	struct list_head buffers;
> +	/* Protect vb2_queue and vdev structs*/
> +	struct mutex lock;
> +	atomic_t sequence;
> +};
> +
> +/*
> + * imgu_device -- ImgU (Imaging Unit) driver
> + */
> +struct imgu_device {
> +	struct pci_dev *pci_dev;
> +	void __iomem *base;
> +
> +	/* Internally enabled queues */
> +	struct {
> +		struct ipu3_css_map dmap;
> +		struct ipu3_css_buffer dummybufs[IMGU_MAX_QUEUE_DEPTH];
> +	} queues[IPU3_CSS_QUEUES];
> +	struct imgu_video_device nodes[IMGU_NODE_NUM];
> +	bool queue_enabled[IMGU_NODE_NUM];
> +
> +	/* Public fields, fill before registering */
> +	unsigned int buf_struct_size;
> +	bool streaming;		/* Public read only */
> +	struct v4l2_ctrl_handler *ctrl_handler;
> +
> +	/* Private fields */
> +	struct v4l2_device v4l2_dev;
> +	struct media_device media_dev;
> +	struct media_pipeline pipeline;
> +	struct v4l2_subdev subdev;
> +	struct media_pad subdev_pads[IMGU_NODE_NUM];
> +	struct v4l2_file_operations v4l2_file_ops;
> +
> +	/* MMU driver for css */
> +	struct ipu3_mmu_info *mmu;
> +	struct iova_domain iova_domain;
> +
> +	/* css - Camera Sub-System */
> +	struct ipu3_css css;
> +
> +	/*
> +	 * Coarse-grained lock to protect
> +	 * vid_buf.list and css->queue
> +	 */
> +	struct mutex lock;
> +	/* Forbit streaming and buffer queuing during system suspend. */
> +	atomic_t qbuf_barrier;
> +	struct {
> +		struct v4l2_rect eff; /* effective resolution */
> +		struct v4l2_rect bds; /* bayer-domain scaled resolution*/
> +		struct v4l2_rect gdc; /* gdc output resolution */
> +	} rect;
> +	/* Indicate if system suspend take place while imgu is streaming. */
> +	bool suspend_in_stream;
> +	/* Used to wait for FW buffer queue drain. */
> +	wait_queue_head_t buf_drain_wq;
> +};
> +
> +unsigned int imgu_node_to_queue(unsigned int node);
> +unsigned int imgu_map_node(struct imgu_device *imgu, unsigned int css_queue);
> +int imgu_queue_buffers(struct imgu_device *imgu, bool initial);
> +
> +int imgu_v4l2_register(struct imgu_device *dev);
> +int imgu_v4l2_unregister(struct imgu_device *dev);
> +void imgu_v4l2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state);
> +
> +int imgu_s_stream(struct imgu_device *imgu, int enable);
> +
> +#endif
> 
