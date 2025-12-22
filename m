Return-Path: <linux-media+bounces-49323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C20ECD5589
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B03130181B7
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D4331196C;
	Mon, 22 Dec 2025 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6HldR77"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277920DD48;
	Mon, 22 Dec 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396231; cv=none; b=TPGpd/qlNcPF22f+fxj6sv+7P+ydc0Cq1UZokDLo/e0i0jCMTOTiLI3Psn1gv24J28D9J12aUYOKgdRbwJMuPh/KkUHZhGm/0yyQ4AwUnC3RxsE2lKjLDzt9DnwOKGKgdR3PDt73+xZnwJ7RgxBhVus7oREWcGga7kZ2WaWPHSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396231; c=relaxed/simple;
	bh=gqxib882UaZ4zQvTYZpit3UtELR4ivp8MGrF00EAHng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xuj9NhIYCbxDavip95kI9LfoHx9O4Ci4ErXMFGhf0KZvsEQazCCh8W4d0SD6USfNaGZwVjSyWqpSrcr7N9uj5psMYyULhTo5sIcs4iaCQ9TqdulSdD9jyPeaAe3ueiBe40yvVASaiXPPpa0W+lWGugew7n8Dwu6Q75cft4ns158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6HldR77; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766396229; x=1797932229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gqxib882UaZ4zQvTYZpit3UtELR4ivp8MGrF00EAHng=;
  b=O6HldR77zfmws3gFfJksUGfzUBP2rmNzvCNjLj/wt3pP3IPc/FwP9uZH
   DTAlcgKKCDiPcQkOz3oFgDtkjN8J711gN+0K98kOImzgz71rDcTN8xuCO
   XNyzeHbYEcHHBOd9QjcmN5SBcSPKORHO9ssSXY6CRqYSiJy8yRRPv3fMz
   B7a6YdSSwBdwKDlGoyzSnSUc8oibpmUbXVPa78maFxe7t5eIs9QkwD8z2
   OIjGqICQ1+BytMq9BRu5ScBksKmWQVcMlHq6HshmvbPtxZdku0pAt1HU8
   lE6rVzy0SwsHcFN+cKdXMX4pDeWC/+wsoy12qtabZyPscLr5VR2bnv/Fn
   A==;
X-CSE-ConnectionGUID: R9xwO6R0Sna9ddmbgIhkNg==
X-CSE-MsgGUID: 01uYNwqDTfS667Z5ZJAgWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79702497"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="79702497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:37:08 -0800
X-CSE-ConnectionGUID: paj8LuLiQbmJPdHBUHb/LQ==
X-CSE-MsgGUID: mCaGK95cQaqcqIEO/kHphQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199125073"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:37:04 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AFE7412063F;
	Mon, 22 Dec 2025 11:37:04 +0200 (EET)
Date: Mon, 22 Dec 2025 11:37:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v7 3/7] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <aUkRQEeAWDeQknP6@kekkonen.localdomain>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-4-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216091326.111977-4-Bin.Du@amd.com>

Hi Bin,

On Tue, Dec 16, 2025 at 05:13:22PM +0800, Bin Du wrote:
> ISP firmware controls ISP HW pipeline using dedicated embedded processor
> called ccpu. The communication between ISP FW and driver is using commands
> and response messages sent through the ring buffer. Command buffers support
> either global setting that is not specific to the steam and support stream
> specific parameters. Response buffers contain ISP FW notification
> information such as frame buffer done and command done. IRQ is used for
> receiving response buffer from ISP firmware, which is handled in the main
> isp4 media device. ISP ccpu is booted up through the firmware loading
> helper function prior to stream start. Memory used for command buffer and
> response buffer needs to be allocated from amdgpu buffer manager because
> isp4 is a child device of amdgpu.
> 
> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
> ---
>  MAINTAINERS                                   |   3 +
>  drivers/media/platform/amd/isp4/Makefile      |   3 +-
>  .../platform/amd/isp4/isp4_fw_cmd_resp.h      | 314 +++++++
>  .../media/platform/amd/isp4/isp4_interface.c  | 786 ++++++++++++++++++
>  .../media/platform/amd/isp4/isp4_interface.h  | 141 ++++
>  5 files changed, 1246 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7aa17c7e71d6..cccae369c876 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1145,7 +1145,10 @@ F:	drivers/media/platform/amd/isp4/Kconfig
>  F:	drivers/media/platform/amd/isp4/Makefile
>  F:	drivers/media/platform/amd/isp4/isp4.c
>  F:	drivers/media/platform/amd/isp4/isp4.h
> +F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>  F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
> +F:	drivers/media/platform/amd/isp4/isp4_interface.c
> +F:	drivers/media/platform/amd/isp4/isp4_interface.h
>  
>  AMD KFD
>  M:	Felix Kuehling <Felix.Kuehling@amd.com>
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index de0092dad26f..a2a5bf98e912 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -3,4 +3,5 @@
>  # Copyright (C) 2025 Advanced Micro Devices, Inc.
>  
>  obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> -amd_capture-objs := isp4.o
> +amd_capture-objs := isp4.o \
> +		    isp4_interface.o
> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> new file mode 100644
> index 000000000000..d571b3873edb
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> @@ -0,0 +1,314 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_CMD_RESP_H_
> +#define _ISP4_CMD_RESP_H_
> +
> +/*
> + * @brief Host and Firmware command & response channel.
> + *        Two types of command/response channel.
> + *          Type Global Command has one command/response channel.
> + *          Type Stream Command has one command/response channel.
> + *-----------                                        ------------
> + *|         |       ---------------------------      |          |
> + *|         |  ---->|  Global Command         |----> |          |
> + *|         |       ---------------------------      |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|         |       ---------------------------      |          |
> + *|         |  ---->|   Stream Command        |----> |          |
> + *|         |       ---------------------------      |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|  HOST   |                                        | Firmware |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|         |       --------------------------       |          |
> + *|         |  <----|  Global Response       |<----  |          |
> + *|         |       --------------------------       |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|         |       --------------------------       |          |
> + *|         |  <----|  Stream Response       |<----  |          |
> + *|         |       --------------------------       |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *-----------                                        ------------
> + */
> +
> +/*
> + * @brief command ID format
> + *        cmd_id is in the format of following type:
> + *        type: indicate command type, global/stream commands.
> + *        group: indicate the command group.
> + *        id: A unique command identification in one type and group.
> + *        |<-Bit31 ~ Bit24->|<-Bit23 ~ Bit16->|<-Bit15 ~ Bit0->|
> + *        |      type       |      group      |       id       |
> + */
> +
> +#define CMD_TYPE_SHIFT                  24
> +#define CMD_GROUP_SHIFT                 16
> +#define CMD_TYPE_STREAM_CTRL            (0x2U << CMD_TYPE_SHIFT)
> +
> +#define CMD_GROUP_STREAM_CTRL           (0x1U << CMD_GROUP_SHIFT)
> +#define CMD_GROUP_STREAM_BUFFER         (0x4U << CMD_GROUP_SHIFT)
> +
> +/* Stream  Command */
> +#define CMD_ID_SET_STREAM_CONFIG        (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x1)
> +#define CMD_ID_SET_OUT_CHAN_PROP        (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x3)
> +#define CMD_ID_ENABLE_OUT_CHAN          (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x5)
> +#define CMD_ID_START_STREAM             (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x7)
> +#define CMD_ID_STOP_STREAM              (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x8)
> +
> +/* Stream Buffer Command */
> +#define CMD_ID_SEND_BUFFER              (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_BUFFER | 0x1)
> +
> +/*
> + * @brief response ID format
> + *        resp_id is in the format of following type:
> + *        type: indicate command type, global/stream commands.
> + *        group: indicate the command group.
> + *        id: A unique command identification in one type and group.
> + *        |<-Bit31 ~ Bit24->|<-Bit23 ~ Bit16->|<-Bit15 ~ Bit0->|
> + *        |      type       |      group      |       id       |
> + */
> +
> +#define RESP_GROUP_SHIFT                16
> +#define RESP_GROUP_MASK                 (0xff << RESP_GROUP_SHIFT)
> +
> +#define GET_RESP_GROUP_VALUE(resp_id)   (((resp_id) & RESP_GROUP_MASK) >> RESP_GROUP_SHIFT)
> +#define GET_RESP_ID_VALUE(resp_id)      ((resp_id) & 0xffff)
> +
> +#define RESP_GROUP_GENERAL              (0x1 << RESP_GROUP_SHIFT)
> +#define RESP_GROUP_NOTIFICATION         (0x3 << RESP_GROUP_SHIFT)
> +
> +/* General Response */
> +#define RESP_ID_CMD_DONE                (RESP_GROUP_GENERAL | 0x1)
> +
> +/* Notification */
> +#define RESP_ID_NOTI_FRAME_DONE         (RESP_GROUP_NOTIFICATION | 0x1)
> +
> +#define CMD_STATUS_SUCCESS              0
> +#define CMD_STATUS_FAIL                 1
> +#define CMD_STATUS_SKIPPED              2
> +
> +#define ADDR_SPACE_TYPE_GPU_VA          4
> +
> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
> +
> +/*
> + * standard ISP mipicsi=>isp
> + */
> +#define MIPI0_ISP_PIPELINE_ID           0x5f91
> +
> +enum isp4fw_sensor_id {
> +	SENSOR_ID_ON_MIPI0  = 0,  /* Sensor id for ISP input from MIPI port 0 */
> +};
> +
> +enum isp4fw_stream_id {
> +	STREAM_ID_INVALID = -1, /* STREAM_ID_INVALID. */
> +	STREAM_ID_1 = 0,        /* STREAM_ID_1. */
> +	STREAM_ID_2 = 1,        /* STREAM_ID_2. */
> +	STREAM_ID_3 = 2,        /* STREAM_ID_3. */
> +	STREAM_ID_MAXIMUM       /* STREAM_ID_MAXIMUM. */
> +};
> +
> +enum isp4fw_image_format {
> +	IMAGE_FORMAT_NV12 = 1,              /* 4:2:0,semi-planar, 8-bit */
> +	IMAGE_FORMAT_YUV422INTERLEAVED = 7, /* interleave, 4:2:2, 8-bit */
> +};
> +
> +enum isp4fw_pipe_out_ch {
> +	ISP_PIPE_OUT_CH_PREVIEW = 0,
> +};
> +
> +enum isp4fw_yuv_range {
> +	ISP_YUV_RANGE_FULL = 0,     /* YUV value range in 0~255 */
> +	ISP_YUV_RANGE_NARROW = 1,   /* YUV value range in 16~235 */
> +	ISP_YUV_RANGE_MAX
> +};
> +
> +enum isp4fw_buffer_type {
> +	BUFFER_TYPE_PREVIEW = 8,
> +	BUFFER_TYPE_META_INFO = 10,
> +	BUFFER_TYPE_MEM_POOL = 15,
> +};
> +
> +enum isp4fw_buffer_status {
> +	BUFFER_STATUS_INVALID,  /* The buffer is INVALID */
> +	BUFFER_STATUS_SKIPPED,  /* The buffer is not filled with image data */
> +	BUFFER_STATUS_EXIST,    /* The buffer is exist and waiting for filled */
> +	BUFFER_STATUS_DONE,     /* The buffer is filled with image data */
> +	BUFFER_STATUS_LACK,     /* The buffer is unavailable */
> +	BUFFER_STATUS_DIRTY,    /* The buffer is dirty, probably caused by
> +				 * LMI leakage
> +				 */
> +	BUFFER_STATUS_MAX       /* The buffer STATUS_MAX */
> +};
> +
> +enum isp4fw_buffer_source {
> +	/* The buffer is from the stream buffer queue */
> +	BUFFER_SOURCE_STREAM,
> +};

Could you also use the ISP4 (or ISP4IF) prefix for these, please? Many look
rather generic.

...

> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
> new file mode 100644
> index 000000000000..01d5268f7d4c
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.h
> @@ -0,0 +1,141 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_INTERFACE_H_
> +#define _ISP4_INTERFACE_H_
> +
> +#include <drm/amd/isp.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +struct isp4fw_resp;
> +
> +#define ISP4IF_RB_MAX 25
> +#define ISP4IF_RESP_CHAN_TO_RB_OFFSET 9
> +#define ISP4IF_RB_PMBMAP_MEM_SIZE (SZ_16M - 1)
> +#define ISP4IF_RB_PMBMAP_MEM_CHUNK \
> +	(ISP4IF_RB_PMBMAP_MEM_SIZE / (ISP4IF_RB_MAX - 1))
> +#define ISP4IF_HOST2FW_COMMAND_SIZE sizeof(struct isp4fw_cmd)
> +#define ISP4IF_MAX_NUM_HOST2FW_COMMAND 40
> +#define ISP4IF_FW_CMD_BUF_SIZE \
> +	(ISP4IF_MAX_NUM_HOST2FW_COMMAND * ISP4IF_HOST2FW_COMMAND_SIZE)
> +#define ISP4IF_RB_FULL_SLEEP_US (33 * USEC_PER_MSEC)
> +#define ISP4IF_RB_FULL_TIMEOUT_US (10 * ISP4IF_RB_FULL_SLEEP_US)
> +
> +#define ISP4IF_META_INFO_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
> +#define ISP4IF_MAX_STREAM_BUF_COUNT 8
> +
> +#define ISP4IF_FW_LOG_RINGBUF_SIZE SZ_2M
> +
> +enum isp4if_stream_id {
> +	ISP4IF_STREAM_ID_GLOBAL = 0,
> +	ISP4IF_STREAM_ID_1 = 1,
> +	ISP4IF_STREAM_ID_MAX = 4
> +};
> +
> +enum isp4if_status {
> +	ISP4IF_STATUS_PWR_OFF,
> +	ISP4IF_STATUS_PWR_ON,
> +	ISP4IF_STATUS_FW_RUNNING,
> +	ISP4IF_FSM_STATUS_MAX
> +};
> +
> +struct isp4if_gpu_mem_info {
> +	u64 mem_size;
> +	u64 gpu_mc_addr;
> +	void *sys_addr;
> +	void *mem_handle;
> +};
> +
> +struct isp4if_img_buf_info {
> +	struct {
> +		void *sys_addr;
> +		u64 mc_addr;
> +		u32 len;
> +	} planes[3];
> +};
> +
> +struct isp4if_img_buf_node {
> +	struct list_head node;
> +	struct isp4if_img_buf_info buf_info;
> +};
> +
> +struct isp4if_cmd_element {
> +	struct list_head list;
> +	u32 seq_num;
> +	u32 cmd_id;
> +	struct completion cmd_done;
> +	atomic_t refcnt;
> +};
> +
> +struct isp4_interface {

How about just "isp4if"? Up to you.

> +	struct device *dev;
> +	void __iomem *mmio;
> +
> +	spinlock_t cmdq_lock; /* used for cmdq access */
> +	spinlock_t bufq_lock; /* used for bufq access */
> +	struct mutex isp4if_mutex; /* used to send fw cmd and read fw log */
> +
> +	struct list_head cmdq; /* commands sent to fw */
> +	struct list_head bufq; /* buffers sent to fw */
> +
> +	enum isp4if_status status;
> +	u32 host2fw_seq_num;
> +
> +	/* ISP fw buffers */
> +	struct isp4if_gpu_mem_info *fw_log_buf;
> +	struct isp4if_gpu_mem_info *fw_cmd_resp_buf;
> +	struct isp4if_gpu_mem_info *fw_mem_pool;
> +	struct isp4if_gpu_mem_info *meta_info_buf[ISP4IF_MAX_STREAM_BUF_COUNT];
> +};
> +
> +static inline void isp4if_split_addr64(u64 addr, u32 *lo, u32 *hi)
> +{
> +	if (lo)
> +		*lo = addr & 0xffffffff;
> +
> +	if (hi)
> +		*hi = addr >> 32;
> +}
> +
> +static inline u64 isp4if_join_addr64(u32 lo, u32 hi)
> +{
> +	return (((u64)hi) << 32) | (u64)lo;
> +}
> +
> +int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
> +		    struct isp4fw_resp *resp);
> +
> +int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, const void *package,
> +			u32 package_size);
> +
> +int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, const void *package,
> +			     u32 package_size);
> +
> +struct isp4if_cmd_element *isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif, u32 seq_num,
> +						   u32 cmd_id);
> +
> +void isp4if_clear_cmdq(struct isp4_interface *ispif);
> +
> +void isp4if_clear_bufq(struct isp4_interface *ispif);
> +
> +void isp4if_dealloc_buffer_node(struct isp4if_img_buf_node *buf_node);
> +
> +struct isp4if_img_buf_node *isp4if_alloc_buffer_node(struct isp4if_img_buf_info *buf_info);
> +
> +struct isp4if_img_buf_node *isp4if_dequeue_buffer(struct isp4_interface *ispif);
> +
> +int isp4if_queue_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_node *buf_node);
> +
> +int isp4if_stop(struct isp4_interface *ispif);
> +
> +int isp4if_start(struct isp4_interface *ispif);
> +
> +int isp4if_deinit(struct isp4_interface *ispif);
> +
> +int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmio);

Could you run

	$ ./scripts/checkpatch.pl --strict --max-line-length=80

on the set, please?

> +
> +#endif /* _ISP4_INTERFACE_H_ */

-- 
Kind regards,

Sakari Ailus

