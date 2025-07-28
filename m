Return-Path: <linux-media+bounces-38554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6FBB138F0
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 12:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C513B6B2D
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 10:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD82A256C9B;
	Mon, 28 Jul 2025 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6oqX5cH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB8D2253A0;
	Mon, 28 Jul 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753698490; cv=none; b=HmCMwYTzb+1kCQq2I1vMLfOytC8CYVAn3M5zpidPVIjiO95wePR85ZUTNGYgt9s22jy1TkrQuShJ/DQlORs6Qn+j+UGlkR0tnZsU8ppv0ZreTXJ5ZG7bbXiWhbZLTADt9h4aMuasnxUOrS7N2if82r2tN8UbpcIJvqSzTOzrvkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753698490; c=relaxed/simple;
	bh=PUfyJrNM2dhS2Lnv6COeGqhgpNO1zwDPMkD/AUDplQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kN8KMk/w2e0uXK9MlG15/lsNSzfnAbjlMIRJtQENTndcBNK6wcN3eO3XO1xYSgJW2bgWmCWq8emd95u7gHp/ZRWHidRz9EPY25Pk3OsHJ3ILhBKDR+M+N7DDl1YfMNLWmN8oGgzhAW8tQnil9+5rQssEnidwv8KCQU5yScQYvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6oqX5cH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753698488; x=1785234488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUfyJrNM2dhS2Lnv6COeGqhgpNO1zwDPMkD/AUDplQc=;
  b=a6oqX5cHJKdG/1xyVykV8+ndLrsUbH+YMSfAEr/5cHLXwyXFYvFP/mDO
   LJcOuFFVDY4AE1kgmY/vJlunA3MVz/iCRFSMNdrYwqJdkrAYrcYShSBCV
   CrBI8ql+NDA0Qy7Bv76G9W4v34qTxRdKMnmVczTcAxa2g/jBMZXx8Kuy4
   zHS6FQ80csXhDaI0mLXW9TLlxGj09aET2mF27+mh99N7G1PcD7rmGDBvu
   wJqbNtc47PAKaiPTtFAzjISAVzAbAxm8QEJ/V8blZBND7EEclfC4XZI/6
   cN6YKQG3UCJ6v6kWlcPfPekhKdvBHggKoX1btyizyY/yjloFwcNbx1yjn
   Q==;
X-CSE-ConnectionGUID: KG1kCDcwSzWv2wwAGnlq6A==
X-CSE-MsgGUID: 6eeclSCXTnqG0f9csj3V3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55826522"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55826522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 03:28:05 -0700
X-CSE-ConnectionGUID: TORfGh0eTFi5iSia+WfIfQ==
X-CSE-MsgGUID: C6XD/LsLTuCGbzvG7EGcYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193345807"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.254])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 03:28:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E936B11F82A;
	Mon, 28 Jul 2025 10:23:31 +0300 (EEST)
Date: Mon, 28 Jul 2025 07:23:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <aIclcwRep3F_z7PF@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618091959.68293-5-Bin.Du@amd.com>

Hi Bin,

On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
> ISP firmware controls ISP HW pipeline using dedicated embedded processor
> called ccpu.
> The communication between ISP FW and driver is using commands and
> response messages sent through the ring buffer. Command buffers support
> either global setting that is not specific to the steam and support stream
> specific parameters. Response buffers contains ISP FW notification
> information such as frame buffer done and command done. IRQ is used for
> receiving response buffer from ISP firmware, which is handled in the main
> isp4 media device. ISP ccpu is booted up through the firmware loading
> helper function prior to stream start.
> Memory used for command buffer and response buffer needs to be allocated
> from amdgpu buffer manager because isp4 is a child device of amdgpu.

Please rewrap this, some lines above are quite short.

> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> ---
>  drivers/media/platform/amd/isp4/Makefile      |   12 +
>  .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  318 +++++
>  .../media/platform/amd/isp4/isp4_interface.c  | 1052 +++++++++++++++++
>  .../media/platform/amd/isp4/isp4_interface.h  |  164 +++
>  4 files changed, 1546 insertions(+)
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
> 
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index 0e36201fbb30..c0166f954516 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -5,10 +5,22 @@
>  obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>  amd_capture-objs := isp4.o	\
>  			isp4_phy.o \
> +			isp4_interface.o \
>  			isp4_hw.o	\
>  
>  ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/include
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/amdgpu
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/pm/inc
> +ccflags-y += -I$(srctree)/include/drm
>  ccflags-y += -I$(srctree)/include
> +ccflags-y += -I$(srctree)/include/uapi/drm
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/acp/include
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/include
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/modules/inc
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/dc
> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/amdgpu_dm
>  
>  ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
>  	cc_stack_align := -mpreferred-stack-boundary=4
> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> new file mode 100644
> index 000000000000..437d89469af2
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> @@ -0,0 +1,318 @@
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
> +#define CMD_TYPE_SHIFT (24)
> +#define CMD_GROUP_SHIFT (16)

Redundant parentheses. Please remove all of them.

> +#define CMD_TYPE_STREAM_CTRL ((u32)0x2 << CMD_TYPE_SHIFT)

Maybe 0x2U << CMD_TYPE_SHIFT instead?

> +
> +#define CMD_GROUP_STREAM_CTRL ((u32)0x1 << CMD_GROUP_SHIFT)
> +#define CMD_GROUP_STREAM_BUFFER ((u32)0x4 << CMD_GROUP_SHIFT)
> +
> +/* Stream  Command */
> +#define CMD_ID_SET_STREAM_CONFIG                        \
> +	(CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x1)
> +#define CMD_ID_SET_OUT_CHAN_PROP                        \
> +	(CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x3)
> +#define CMD_ID_ENABLE_OUT_CHAN                          \
> +	(CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x5)
> +#define CMD_ID_START_STREAM                             \
> +	(CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x7)
> +#define CMD_ID_STOP_STREAM                              \
> +	(CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x8)
> +
> +/* Stream Buffer Command */
> +#define CMD_ID_SEND_BUFFER                                \
> +	(CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_BUFFER | 0x1)
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
> +#define RESP_GROUP_SHIFT (16)
> +#define RESP_GROUP_MASK  (0xff << RESP_GROUP_SHIFT)
> +
> +#define GET_RESP_GROUP_VALUE(resp_id)   \
> +	(((resp_id) & RESP_GROUP_MASK) >> \
> +	 RESP_GROUP_SHIFT)
> +#define GET_RESP_ID_VALUE(resp_id) ((resp_id) & 0xffff)
> +
> +#define RESP_GROUP_GENERAL (0x1 << RESP_GROUP_SHIFT)
> +#define RESP_GROUP_NOTIFICATION (0x3 << RESP_GROUP_SHIFT)
> +
> +/* General  Response */
> +#define RESP_ID_CMD_DONE (RESP_GROUP_GENERAL | 0x1)
> +
> +/* Notification */
> +#define RESP_ID_NOTI_FRAME_DONE (RESP_GROUP_NOTIFICATION | 0x1)
> +
> +#define CMD_STATUS_SUCCESS (0)
> +#define CMD_STATUS_FAIL (1)
> +#define CMD_STATUS_SKIPPED (2)

Again, please align macro bodies.

> +
> +#define ADDR_SPACE_TYPE_GPU_VA 4
> +
> +#define FW_MEMORY_POOL_SIZE (200 * 1024 * 1024)
> +
> +/*
> + * standard ISP mipicsi=>isp
> + */
> +#define MIPI0_ISP_PIPELINE_ID 0x5f91
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
> +
> +struct isp4fw_error_code {
> +	u32 code1;
> +	u32 code2;
> +	u32 code3;
> +	u32 code4;
> +	u32 code5;
> +};
> +
> +/*
> + * Command Structure for FW
> + */
> +
> +struct isp4fw_cmd {
> +	u32 cmd_seq_num;
> +	u32 cmd_id;
> +	u32 cmd_param[12];
> +	u16 cmd_stream_id;
> +	u8 cmd_silent_resp;
> +	u8 reserved;
> +	u32 cmd_check_sum;
> +};
> +
> +struct isp4fw_resp_cmd_done {
> +	/* The host2fw command seqNum.
> +	 * To indicate which command this response refer to.
> +	 */
> +	u32 cmd_seq_num;
> +	/* The host2fw command id for host double check. */
> +	u32 cmd_id;
> +	/* Indicate the command process status.
> +	 * 0 means success. 1 means fail. 2 means skipped
> +	 */
> +	u16 cmd_status;
> +	/* If the cmd_status is 1, that means the command is processed fail, */
> +	/* host can check the isp4fw_error_code to get the detail
> +	 * error information
> +	 */
> +	u16 isp4fw_error_code;
> +	/* The response payload will be in different struct type */
> +	/* according to different cmd done response. */
> +	u8 payload[36];
> +};
> +
> +struct isp4fw_resp_param_package {
> +	u32 package_addr_lo;	/* The low 32 bit addr of the pkg address. */
> +	u32 package_addr_hi;	/* The high 32 bit addr of the pkg address. */
> +	u32 package_size;	/* The total pkg size in bytes. */
> +	u32 package_check_sum;	/* The byte sum of the pkg. */
> +};
> +
> +struct isp4fw_resp {
> +	u32 resp_seq_num;
> +	u32 resp_id;
> +	union {
> +		struct isp4fw_resp_cmd_done cmd_done;
> +		struct isp4fw_resp_param_package frame_done;
> +		u32 resp_param[12];
> +	} param;
> +	u8  reserved[4];
> +	u32 resp_check_sum;
> +};
> +
> +struct isp4fw_mipi_pipe_path_cfg {
> +	u32 b_enable;
> +	enum isp4fw_sensor_id isp4fw_sensor_id;
> +};
> +
> +struct isp4fw_isp_pipe_path_cfg {
> +	u32  isp_pipe_id;	/* pipe ids for pipeline construction */
> +};
> +
> +struct isp4fw_isp_stream_cfg {
> +	/* Isp mipi path */
> +	struct isp4fw_mipi_pipe_path_cfg mipi_pipe_path_cfg;
> +	/* Isp pipe path */
> +	struct isp4fw_isp_pipe_path_cfg  isp_pipe_path_cfg;
> +	/* enable TNR */
> +	u32 b_enable_tnr;
> +	/* number of frame rta per-processing,
> +	 * set to 0 to use fw default value
> +	 */
> +	u32 rta_frames_per_proc;
> +};
> +
> +struct isp4fw_image_prop {
> +	enum isp4fw_image_format image_format;	/* Image format */
> +	u32 width;				/* Width */
> +	u32 height;				/* Height */
> +	u32 luma_pitch;				/* Luma pitch */
> +	u32 chroma_pitch;			/* Chrom pitch */
> +	enum isp4fw_yuv_range yuv_range;		/* YUV value range */
> +};
> +
> +struct isp4fw_buffer {
> +	/* A check num for debug usage, host need to */
> +	/* set the buf_tags to different number */
> +	u32 buf_tags;
> +	union {
> +		u32 value;
> +		struct {
> +			u32 space : 16;
> +			u32 vmid  : 16;
> +		} bit;
> +	} vmid_space;
> +	u32 buf_base_a_lo;		/* Low address of buffer A */
> +	u32 buf_base_a_hi;		/* High address of buffer A */
> +	u32 buf_size_a;			/* Buffer size of buffer A */
> +
> +	u32 buf_base_b_lo;		/* Low address of buffer B */
> +	u32 buf_base_b_hi;		/* High address of buffer B */
> +	u32 buf_size_b;			/* Buffer size of buffer B */
> +
> +	u32 buf_base_c_lo;		/* Low address of buffer C */
> +	u32 buf_base_c_hi;		/* High address of buffer C */
> +	u32 buf_size_c;			/* Buffer size of buffer C */
> +};
> +
> +struct isp4fw_buffer_meta_info {
> +	u32 enabled;					/* enabled flag */
> +	enum isp4fw_buffer_status status;		/* BufferStatus */
> +	struct isp4fw_error_code err;			/* err code */
> +	enum isp4fw_buffer_source source;		/* BufferSource */
> +	struct isp4fw_image_prop image_prop;		/* image_prop */
> +	struct isp4fw_buffer buffer;			/* buffer */
> +};
> +
> +struct isp4fw_meta_info {
> +	u32 poc;				/* frame id */
> +	u32 fc_id;				/* frame ctl id */
> +	u32 time_stamp_lo;			/* time_stamp_lo */
> +	u32 time_stamp_hi;			/* time_stamp_hi */
> +	struct isp4fw_buffer_meta_info preview;	/* preview BufferMetaInfo */
> +};
> +
> +struct isp4fw_cmd_send_buffer {
> +	enum isp4fw_buffer_type buffer_type;	/* buffer Type */
> +	struct isp4fw_buffer buffer;		/* buffer info */
> +};
> +
> +struct isp4fw_cmd_set_out_ch_prop {
> +	enum isp4fw_pipe_out_ch ch;	/* ISP pipe out channel */
> +	struct isp4fw_image_prop image_prop;	/* image property */
> +};
> +
> +struct isp4fw_cmd_enable_out_ch {
> +	enum isp4fw_pipe_out_ch ch;	/* ISP pipe out channel */
> +	u32 is_enable;			/* If enable channel or not */
> +};
> +
> +struct isp4fw_cmd_set_stream_cfg {
> +	struct isp4fw_isp_stream_cfg stream_cfg; /* stream path config */
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
> new file mode 100644
> index 000000000000..0e1eb22a0de5
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.c
> @@ -0,0 +1,1052 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/mutex.h>
> +
> +#include "amdgpu_object.h"
> +
> +#include "isp4_fw_cmd_resp.h"
> +#include "isp4_hw.h"
> +#include "isp4_hw_reg.h"
> +#include "isp4_interface.h"
> +
> +#define ISP4IF_FW_RESP_RB_IRQ_EN_MASK \
> +	(ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK |  \
> +	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK | \
> +	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK | \
> +	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK)
> +
> +struct isp4if_rb_config {
> +	const char *name;
> +	u32 index;
> +	u32 reg_rptr;
> +	u32 reg_wptr;
> +	u32 reg_base_lo;
> +	u32 reg_base_hi;
> +	u32 reg_size;
> +	u32 val_size;
> +	u64 base_mc_addr;
> +	void *base_sys_addr;
> +};
> +
> +/* FW cmd ring buffer configuration */
> +static struct isp4if_rb_config
> +	isp4if_cmd_rb_config[ISP4IF_STREAM_ID_MAX] = {
> +	{
> +		.name = "CMD_RB_GBL0",
> +		.index = 3,
> +		.reg_rptr = ISP_RB_RPTR4,
> +		.reg_wptr = ISP_RB_WPTR4,
> +		.reg_base_lo = ISP_RB_BASE_LO4,
> +		.reg_base_hi = ISP_RB_BASE_HI4,
> +		.reg_size = ISP_RB_SIZE4,
> +	},
> +	{
> +		.name = "CMD_RB_STR1",
> +		.index = 0,
> +		.reg_rptr = ISP_RB_RPTR1,
> +		.reg_wptr = ISP_RB_WPTR1,
> +		.reg_base_lo = ISP_RB_BASE_LO1,
> +		.reg_base_hi = ISP_RB_BASE_HI1,
> +		.reg_size = ISP_RB_SIZE1,
> +	},
> +	{
> +		.name = "CMD_RB_STR2",
> +		.index = 1,
> +		.reg_rptr = ISP_RB_RPTR2,
> +		.reg_wptr = ISP_RB_WPTR2,
> +		.reg_base_lo = ISP_RB_BASE_LO2,
> +		.reg_base_hi = ISP_RB_BASE_HI2,
> +		.reg_size = ISP_RB_SIZE2,
> +	},
> +	{
> +		.name = "CMD_RB_STR3",
> +		.index = 2,
> +		.reg_rptr = ISP_RB_RPTR3,
> +		.reg_wptr = ISP_RB_WPTR3,
> +		.reg_base_lo = ISP_RB_BASE_LO3,
> +		.reg_base_hi = ISP_RB_BASE_HI3,
> +		.reg_size = ISP_RB_SIZE3,
> +	},
> +};
> +
> +/* FW resp ring buffer configuration */
> +static struct isp4if_rb_config
> +	isp4if_resp_rb_config[ISP4IF_STREAM_ID_MAX] = {
> +	{
> +		.name = "RES_RB_GBL0",
> +		.index = 3,
> +		.reg_rptr = ISP_RB_RPTR12,
> +		.reg_wptr = ISP_RB_WPTR12,
> +		.reg_base_lo = ISP_RB_BASE_LO12,
> +		.reg_base_hi = ISP_RB_BASE_HI12,
> +		.reg_size = ISP_RB_SIZE12,
> +	},
> +	{
> +		.name = "RES_RB_STR1",
> +		.index = 0,
> +		.reg_rptr = ISP_RB_RPTR9,
> +		.reg_wptr = ISP_RB_WPTR9,
> +		.reg_base_lo = ISP_RB_BASE_LO9,
> +		.reg_base_hi = ISP_RB_BASE_HI9,
> +		.reg_size = ISP_RB_SIZE9,
> +	},
> +	{
> +		.name = "RES_RB_STR2",
> +		.index = 1,
> +		.reg_rptr = ISP_RB_RPTR10,
> +		.reg_wptr = ISP_RB_WPTR10,
> +		.reg_base_lo = ISP_RB_BASE_LO10,
> +		.reg_base_hi = ISP_RB_BASE_HI10,
> +		.reg_size = ISP_RB_SIZE10,
> +	},
> +	{
> +		.name = "RES_RB_STR3",
> +		.index = 2,
> +		.reg_rptr = ISP_RB_RPTR11,
> +		.reg_wptr = ISP_RB_WPTR11,
> +		.reg_base_lo = ISP_RB_BASE_LO11,
> +		.reg_base_hi = ISP_RB_BASE_HI11,
> +		.reg_size = ISP_RB_SIZE11,
> +	},
> +};
> +
> +/* FW log ring buffer configuration */
> +static struct isp4if_rb_config isp4if_log_rb_config = {
> +	.name = "LOG_RB",
> +	.index = 0,
> +	.reg_rptr = ISP_LOG_RB_RPTR0,
> +	.reg_wptr = ISP_LOG_RB_WPTR0,
> +	.reg_base_lo = ISP_LOG_RB_BASE_LO0,
> +	.reg_base_hi = ISP_LOG_RB_BASE_HI0,
> +	.reg_size = ISP_LOG_RB_SIZE0,
> +};
> +
> +static struct isp4if_gpu_mem_info *isp4if_gpu_mem_alloc(struct isp4_interface
> +							*ispif,
> +							u32 mem_size)
> +{
> +	struct isp4if_gpu_mem_info *mem_info;
> +	struct amdgpu_bo *bo = NULL;
> +	struct amdgpu_device *adev;
> +	struct device *dev;
> +

Extra newline.

> +	void *cpu_ptr;
> +	u64 gpu_addr;
> +	u32 ret;
> +
> +	dev = ispif->dev;
> +
> +	if (!mem_size)
> +		return NULL;
> +
> +	mem_info = kzalloc(sizeof(*mem_info), GFP_KERNEL);
> +	if (!mem_info)
> +		return NULL;
> +
> +	adev = (struct amdgpu_device *)ispif->adev;

Why the cast?

adev isn't a great name here as it's usually used for struct acpi_devices.

> +	mem_info->mem_size = mem_size;
> +	mem_info->mem_align = ISP4IF_ISP_MC_ADDR_ALIGN;
> +	mem_info->mem_domain = AMDGPU_GEM_DOMAIN_GTT;
> +
> +	ret = amdgpu_bo_create_kernel(adev,
> +				      mem_info->mem_size,
> +				      mem_info->mem_align,
> +				      mem_info->mem_domain,
> +				      &bo,
> +				      &gpu_addr,
> +				      &cpu_ptr);

This fits on fewer lines.

> +

Extra newline.

> +	if (!cpu_ptr || ret) {
> +		dev_err(dev, "gpuvm buffer alloc fail, size %u\n", mem_size);
> +		kfree(mem_info);
> +		return NULL;
> +	}
> +
> +	mem_info->sys_addr = cpu_ptr;
> +	mem_info->gpu_mc_addr = gpu_addr;
> +	mem_info->mem_handle = (void *)bo;
> +
> +	return mem_info;
> +}
> +
> +static int isp4if_gpu_mem_free(struct isp4_interface *ispif,
> +			       struct isp4if_gpu_mem_info *mem_info)
> +{
> +	struct device *dev = ispif->dev;
> +	struct amdgpu_bo *bo;
> +
> +	if (!mem_info) {
> +		dev_err(dev, "invalid mem_info\n");
> +		return -EINVAL;
> +	}
> +
> +	bo = (struct amdgpu_bo *)mem_info->mem_handle;

Why do you need to cast here?

> +
> +	amdgpu_bo_free_kernel(&bo, &mem_info->gpu_mc_addr, &mem_info->sys_addr);
> +
> +	kfree(mem_info);
> +
> +	return 0;
> +}
> +
> +static int isp4if_dealloc_fw_gpumem(struct isp4_interface *ispif)
> +{
> +	int i;
> +
> +	if (ispif->fw_mem_pool) {
> +		isp4if_gpu_mem_free(ispif, ispif->fw_mem_pool);
> +		ispif->fw_mem_pool = NULL;
> +	}
> +
> +	if (ispif->fw_cmd_resp_buf) {
> +		isp4if_gpu_mem_free(ispif, ispif->fw_cmd_resp_buf);
> +		ispif->fw_cmd_resp_buf = NULL;
> +	}
> +
> +	if (ispif->fw_log_buf) {
> +		isp4if_gpu_mem_free(ispif, ispif->fw_log_buf);
> +		ispif->fw_log_buf = NULL;
> +	}
> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++) {
> +		if (ispif->metainfo_buf_pool[i]) {
> +			isp4if_gpu_mem_free(ispif, ispif->metainfo_buf_pool[i]);
> +			ispif->metainfo_buf_pool[i] = NULL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
> +{
> +	struct device *dev = ispif->dev;
> +	int i;

Unsigned int, please.

> +
> +	ispif->fw_mem_pool = isp4if_gpu_mem_alloc(ispif, FW_MEMORY_POOL_SIZE);
> +	if (!ispif->fw_mem_pool)
> +		goto error_no_memory;
> +
> +	ispif->fw_cmd_resp_buf =
> +		isp4if_gpu_mem_alloc(ispif, ISP4IF_RB_PMBMAP_MEM_SIZE);
> +	if (!ispif->fw_cmd_resp_buf)
> +		goto error_no_memory;
> +
> +	ispif->fw_log_buf =
> +		isp4if_gpu_mem_alloc(ispif, ISP4IF_FW_LOG_RINGBUF_SIZE);
> +	if (!ispif->fw_log_buf)
> +		goto error_no_memory;
> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++) {
> +		ispif->metainfo_buf_pool[i] =
> +			isp4if_gpu_mem_alloc(ispif,
> +					     ISP4IF_META_INFO_BUF_SIZE);
> +		if (!ispif->metainfo_buf_pool[i])
> +			goto error_no_memory;
> +	}
> +
> +	return 0;
> +
> +error_no_memory:
> +	dev_err(dev, "failed to allocate gpu memory");
> +	return -ENOMEM;
> +}
> +
> +static u32 isp4if_compute_check_sum(u8 *buf, u32 buf_size)
> +{
> +	u32 checksum = 0;
> +	u8 *surplus_ptr;
> +	u32 *buffer;
> +	u32 i;
> +
> +	buffer = (u32 *)buf;
> +	for (i = 0; i < buf_size / sizeof(u32); i++)
> +		checksum += buffer[i];
> +
> +	surplus_ptr = (u8 *)&buffer[i];
> +	/* add surplus data crc checksum */
> +	for (i = 0; i < buf_size % sizeof(u32); i++)
> +		checksum += surplus_ptr[i];
> +
> +	return checksum;
> +}
> +
> +void isp4if_clear_cmdq(struct isp4_interface *ispif)
> +{
> +	struct isp4if_cmd_element *buf_node = NULL;
> +	struct isp4if_cmd_element *tmp_node = NULL;
> +
> +	guard(mutex)(&ispif->cmdq_mutex);
> +
> +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list) {
> +		list_del(&buf_node->list);
> +		kfree(buf_node);
> +	}
> +}
> +
> +static bool isp4if_is_cmdq_rb_full(struct isp4_interface *ispif,
> +				   enum isp4if_stream_id cmd_buf_idx)
> +{
> +	struct isp4if_rb_config *rb_config;
> +	u32 rd_ptr, wr_ptr;
> +	u32 new_wr_ptr;
> +	u32 rreg;
> +	u32 wreg;
> +	u32 len;
> +
> +	rb_config = &isp4if_cmd_rb_config[cmd_buf_idx];
> +	rreg = rb_config->reg_rptr;
> +	wreg = rb_config->reg_wptr;
> +	len = rb_config->val_size;
> +
> +	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
> +	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
> +
> +	new_wr_ptr = wr_ptr + sizeof(struct isp4fw_cmd);
> +
> +	if (wr_ptr >= rd_ptr) {
> +		if (new_wr_ptr < len) {
> +			return false;
> +		} else if (new_wr_ptr == len) {
> +			if (rd_ptr == 0)
> +				return true;
> +
> +			return false;
> +		}
> +
> +		new_wr_ptr -= len;
> +		if (new_wr_ptr < rd_ptr)
> +			return false;
> +
> +		return true;
> +	}
> +
> +	if (new_wr_ptr < rd_ptr)
> +		return false;
> +
> +	return true;
> +}
> +
> +static struct isp4if_cmd_element *
> +isp4if_append_cmd_2_cmdq(struct isp4_interface *ispif,
> +			 struct isp4if_cmd_element *cmd_ele)
> +{
> +	struct isp4if_cmd_element *copy_command = NULL;
> +
> +	copy_command = kmalloc(sizeof(*copy_command), GFP_KERNEL);
> +	if (!copy_command)
> +		return NULL;
> +
> +	memcpy(copy_command, cmd_ele, sizeof(*copy_command));

kmemdup()?

> +
> +	guard(mutex)(&ispif->cmdq_mutex);
> +
> +	list_add_tail(&copy_command->list, &ispif->cmdq);
> +
> +	return copy_command;
> +}
> +
> +struct isp4if_cmd_element *
> +isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif,
> +			u32 seq_num,
> +			u32 cmd_id)
> +{
> +	struct isp4if_cmd_element *buf_node = NULL;
> +	struct isp4if_cmd_element *tmp_node = NULL;
> +
> +	guard(mutex)(&ispif->cmdq_mutex);
> +
> +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list) {
> +		if (buf_node->seq_num == seq_num &&
> +		    buf_node->cmd_id == cmd_id) {
> +			list_del(&buf_node->list);
> +			return buf_node;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif,
> +				    enum isp4if_stream_id stream,
> +				    struct isp4fw_cmd *cmd)
> +{
> +	struct isp4if_rb_config *rb_config;
> +	struct device *dev = ispif->dev;
> +	u64 mem_addr;
> +	u64 mem_sys;
> +	u32 wr_ptr;
> +	u32 rd_ptr;
> +	u32 rreg;
> +	u32 wreg;
> +	u32 len;
> +
> +	rb_config = &isp4if_cmd_rb_config[stream];
> +	rreg = rb_config->reg_rptr;
> +	wreg = rb_config->reg_wptr;
> +	mem_sys = (u64)rb_config->base_sys_addr;
> +	mem_addr = rb_config->base_mc_addr;
> +	len = rb_config->val_size;
> +
> +	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
> +		dev_err(dev, "fail no cmdslot (%d)\n", stream);
> +		return -EINVAL;
> +	}
> +
> +	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
> +	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
> +
> +	if (rd_ptr > len) {
> +		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
> +			stream, rd_ptr, len, wr_ptr);
> +		return -EINVAL;
> +	}
> +
> +	if (wr_ptr > len) {
> +		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
> +			stream, wr_ptr, len, rd_ptr);
> +		return -EINVAL;
> +	}
> +
> +	if (wr_ptr < rd_ptr) {
> +		mem_addr += wr_ptr;
> +
> +		memcpy((u8 *)(mem_sys + wr_ptr),
> +		       (u8 *)cmd, sizeof(struct isp4fw_cmd));
> +	} else {
> +		if ((len - wr_ptr) >= (sizeof(struct isp4fw_cmd))) {
> +			mem_addr += wr_ptr;
> +
> +			memcpy((u8 *)(mem_sys + wr_ptr),
> +			       (u8 *)cmd, sizeof(struct isp4fw_cmd));
> +		} else {
> +			u32 size;
> +			u8 *src;
> +
> +			src = (u8 *)cmd;
> +			size = len - wr_ptr;
> +
> +			memcpy((u8 *)(mem_sys + wr_ptr), src, size);
> +
> +			src += size;
> +			size = sizeof(struct isp4fw_cmd) - size;
> +			memcpy((u8 *)(mem_sys), src, size);
> +		}
> +	}
> +
> +	wr_ptr += sizeof(struct isp4fw_cmd);
> +	if (wr_ptr >= len)
> +		wr_ptr -= len;
> +
> +	isp4hw_wreg(ispif->mmio, wreg, wr_ptr);
> +
> +	return 0;
> +}
> +
> +static inline enum isp4if_stream_id isp4if_get_fw_stream(u32 cmd_id)
> +{
> +	return ISP4IF_STREAM_ID_1;
> +}
> +
> +static int isp4if_send_fw_cmd(struct isp4_interface *ispif,
> +			      u32 cmd_id,
> +			      void *package,
> +			      u32 package_size,
> +			      wait_queue_head_t *wq,
> +			      u32 *wq_cond,
> +			      u32 *seq)
> +{
> +	enum isp4if_stream_id stream = isp4if_get_fw_stream(cmd_id);
> +	struct isp4if_cmd_element command_element = { 0 };
> +	struct isp4if_gpu_mem_info *gpu_mem = NULL;
> +	struct isp4if_cmd_element *cmd_ele = NULL;
> +	struct isp4if_rb_config *rb_config;
> +	struct device *dev = ispif->dev;
> +	struct isp4fw_cmd cmd = {0};
> +	u64 package_base = 0;
> +	u32 sleep_count;
> +	u32 seq_num;
> +	u32 rreg;
> +	u32 wreg;
> +	int ret;
> +
> +	if (package_size > sizeof(cmd.cmd_param)) {
> +		dev_err(dev, "fail pkgsize(%u)>%lu cmd:0x%x,stream %d\n",
> +			package_size, sizeof(cmd.cmd_param), cmd_id, stream);
> +		return -EINVAL;
> +	}
> +
> +	sleep_count = 0;
> +
> +	rb_config = &isp4if_resp_rb_config[stream];
> +	rreg = rb_config->reg_rptr;
> +	wreg = rb_config->reg_wptr;
> +
> +	guard(mutex)(&ispif->isp4if_mutex);
> +
> +	while (1) {
> +		if (isp4if_is_cmdq_rb_full(ispif, stream)) {
> +			u32 rd_ptr, wr_ptr;
> +
> +			if (sleep_count < ISP4IF_MAX_SLEEP_COUNT) {
> +				msleep(ISP4IF_MAX_SLEEP_TIME);
> +				sleep_count++;
> +				continue;
> +			}
> +			rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
> +			wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
> +			dev_err(dev, "fail to get cmdq slot,stream (%d), rd %u, wr %u\n",
> +				stream, rd_ptr, wr_ptr);
> +			return -ETIMEDOUT;
> +		}
> +		break;
> +	}

read_poll_timeout()?

> +
> +	cmd.cmd_id = cmd_id;
> +	switch (stream) {
> +	case ISP4IF_STREAM_ID_GLOBAL:
> +		cmd.cmd_stream_id = (u16)STREAM_ID_INVALID;

Is there a need to cast here?

> +		break;
> +	case ISP4IF_STREAM_ID_1:
> +		cmd.cmd_stream_id = STREAM_ID_1;
> +		break;
> +	default:
> +		dev_err(dev, "fail bad stream id %d\n", stream);
> +		return -EINVAL;
> +	}
> +
> +	if (package && package_size)
> +		memcpy(cmd.cmd_param, package, package_size);
> +
> +	seq_num = ispif->host2fw_seq_num++;
> +	cmd.cmd_seq_num = seq_num;
> +	cmd.cmd_check_sum =
> +		isp4if_compute_check_sum((u8 *)&cmd, sizeof(cmd) - 4);
> +
> +	if (seq)
> +		*seq = seq_num;
> +	command_element.seq_num = seq_num;
> +	command_element.cmd_id = cmd_id;
> +	command_element.mc_addr = package_base;
> +	command_element.wq = wq;
> +	command_element.wq_cond = wq_cond;
> +	command_element.gpu_pkg = gpu_mem;
> +	command_element.stream = stream;
> +	/* only append the fw cmd to queue when its response needs to be
> +	 * waited for, currently there are only two such commands,
> +	 * disable channel and stop stream which are only sent after close
> +	 * camera
> +	 */
> +	if (wq && wq_cond) {
> +		cmd_ele = isp4if_append_cmd_2_cmdq(ispif, &command_element);
> +		if (!cmd_ele) {
> +			dev_err(dev, "fail for isp_append_cmd_2_cmdq\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
> +	if (ret) {
> +		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n",
> +			cmd_id);
> +		if (cmd_ele) {
> +			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num,
> +						cmd_ele->cmd_id);
> +			kfree(cmd_ele);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int isp4if_send_buffer(struct isp4_interface *ispif,
> +			      struct isp4if_img_buf_info *buf_info)
> +{
> +	struct isp4fw_cmd_send_buffer cmd;

= { };

And you can remove the memset.

> +
> +	memset(&cmd, 0, sizeof(cmd));
> +	cmd.buffer_type = BUFFER_TYPE_PREVIEW;
> +	cmd.buffer.vmid_space.bit.vmid = 0;
> +	cmd.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> +	isp4if_split_addr64(buf_info->planes[0].mc_addr,
> +			    &cmd.buffer.buf_base_a_lo,
> +			    &cmd.buffer.buf_base_a_hi);
> +	cmd.buffer.buf_size_a = buf_info->planes[0].len;
> +
> +	isp4if_split_addr64(buf_info->planes[1].mc_addr,
> +			    &cmd.buffer.buf_base_b_lo,
> +			    &cmd.buffer.buf_base_b_hi);
> +	cmd.buffer.buf_size_b = buf_info->planes[1].len;
> +
> +	isp4if_split_addr64(buf_info->planes[2].mc_addr,
> +			    &cmd.buffer.buf_base_c_lo,
> +			    &cmd.buffer.buf_base_c_hi);
> +	cmd.buffer.buf_size_c = buf_info->planes[2].len;
> +
> +	return isp4if_send_fw_cmd(ispif, CMD_ID_SEND_BUFFER, &cmd,
> +				  sizeof(cmd), NULL, NULL, NULL);
> +}
> +
> +static void isp4if_init_rb_config(struct isp4_interface *ispif,
> +				  struct isp4if_rb_config *rb_config)
> +{
> +	u32 lo;
> +	u32 hi;
> +
> +	isp4if_split_addr64(rb_config->base_mc_addr, &lo, &hi);
> +
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_rptr, 0x0);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_wptr, 0x0);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_base_lo, lo);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_base_hi, hi);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_size, rb_config->val_size);
> +}
> +
> +static int isp4if_fw_init(struct isp4_interface *ispif)
> +{
> +	struct isp4if_rb_config *rb_config;
> +	u32 offset;
> +	int i;
> +
> +	/* initialize CMD_RB streams */
> +	for (i = 0; i < ISP4IF_STREAM_ID_MAX; i++) {
> +		rb_config = (isp4if_cmd_rb_config + i);
> +		offset = ispif->aligned_rb_chunk_size *
> +			 (rb_config->index + ispif->cmd_rb_base_index);
> +
> +		rb_config->val_size = ISP4IF_FW_CMD_BUF_SIZE;
> +		rb_config->base_sys_addr =
> +			(u8 *)ispif->fw_cmd_resp_buf->sys_addr + offset;
> +		rb_config->base_mc_addr =
> +			ispif->fw_cmd_resp_buf->gpu_mc_addr + offset;
> +
> +		isp4if_init_rb_config(ispif, rb_config);
> +	}
> +
> +	/* initialize RESP_RB streams */
> +	for (i = 0; i < ISP4IF_STREAM_ID_MAX; i++) {
> +		rb_config = (isp4if_resp_rb_config + i);
> +		offset = ispif->aligned_rb_chunk_size *
> +			 (rb_config->index + ispif->resp_rb_base_index);
> +
> +		rb_config->val_size = ISP4IF_FW_CMD_BUF_SIZE;
> +		rb_config->base_sys_addr =
> +			(u8 *)ispif->fw_cmd_resp_buf->sys_addr + offset;
> +		rb_config->base_mc_addr =
> +			ispif->fw_cmd_resp_buf->gpu_mc_addr + offset;
> +
> +		isp4if_init_rb_config(ispif, rb_config);
> +	}
> +
> +	/* initialize LOG_RB stream */
> +	rb_config = &isp4if_log_rb_config;
> +	rb_config->val_size = ISP4IF_FW_LOG_RINGBUF_SIZE;
> +	rb_config->base_mc_addr = ispif->fw_log_buf->gpu_mc_addr;
> +	rb_config->base_sys_addr = ispif->fw_log_buf->sys_addr;
> +
> +	isp4if_init_rb_config(ispif, rb_config);
> +
> +	return 0;
> +}
> +
> +static int isp4if_wait_fw_ready(struct isp4_interface *ispif,
> +				u32 isp_status_addr)
> +{
> +	struct device *dev = ispif->dev;
> +	u32 fw_ready_timeout;
> +	u32 timeout_ms = 100;
> +	u32 interval_ms = 1;
> +	u32 timeout = 0;
> +	u32 reg_val;
> +
> +	fw_ready_timeout = timeout_ms / interval_ms;
> +
> +	/* wait for FW initialize done! */
> +	while (timeout < fw_ready_timeout) {
> +		reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif),
> +				      isp_status_addr);
> +		if (reg_val & ISP_STATUS__CCPU_REPORT_MASK)
> +			return 0;
> +
> +		msleep(interval_ms);
> +		timeout++;
> +	}

read_poll_timeout()?

> +
> +	dev_err(dev, "ISP CCPU FW boot failed\n");
> +
> +	return -ETIME;
> +}
> +
> +static void isp4if_enable_ccpu(struct isp4_interface *ispif)
> +{
> +	u32 reg_val;
> +
> +	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET);
> +	reg_val &= (~ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET, reg_val);
> +
> +	usleep_range(100, 150);
> +
> +	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL);
> +	reg_val &= (~ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL, reg_val);
> +}
> +
> +static void isp4if_disable_ccpu(struct isp4_interface *ispif)
> +{
> +	u32 reg_val;
> +
> +	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL);
> +	reg_val |= ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK;
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL, reg_val);
> +
> +	usleep_range(100, 150);
> +
> +	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET);
> +	reg_val |= ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK;
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET, reg_val);
> +}
> +
> +static int isp4if_fw_boot(struct isp4_interface *ispif)
> +{
> +	struct device *dev = ispif->dev;
> +
> +	if (ispif->status != ISP4IF_STATUS_PWR_ON) {
> +		dev_err(dev, "invalid isp power status %d\n", ispif->status);
> +		return -EINVAL;
> +	}
> +
> +	isp4if_disable_ccpu(ispif);
> +
> +	isp4if_fw_init(ispif);
> +
> +	/* clear ccpu status */
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_STATUS, 0x0);
> +
> +	isp4if_enable_ccpu(ispif);
> +
> +	if (isp4if_wait_fw_ready(ispif, ISP_STATUS)) {
> +		isp4if_disable_ccpu(ispif);
> +		return -EINVAL;
> +	}
> +
> +	/* enable interrupts */
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SYS_INT0_EN,
> +		    ISP4IF_FW_RESP_RB_IRQ_EN_MASK);
> +
> +	ispif->status = ISP4IF_STATUS_FW_RUNNING;
> +
> +	dev_dbg(dev, "ISP CCPU FW boot success\n");
> +
> +	return 0;
> +}
> +
> +int isp4if_f2h_resp(struct isp4_interface *ispif,
> +		    enum isp4if_stream_id stream,
> +		    void *resp)
> +{
> +	struct isp4fw_resp *response = resp;
> +	struct isp4if_rb_config *rb_config;
> +	struct device *dev = ispif->dev;
> +	u32 rd_ptr_dbg;
> +	u32 wr_ptr_dbg;
> +	void *mem_sys;
> +	u64 mem_addr;
> +	u32 checksum;
> +	u32 rd_ptr;
> +	u32 wr_ptr;
> +	u32 rreg;
> +	u32 wreg;
> +	u32 len;
> +
> +	rb_config = &isp4if_resp_rb_config[stream];
> +	rreg = rb_config->reg_rptr;
> +	wreg = rb_config->reg_wptr;
> +	mem_sys = rb_config->base_sys_addr;
> +	mem_addr = rb_config->base_mc_addr;
> +	len = rb_config->val_size;
> +
> +	rd_ptr = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), rreg);
> +	wr_ptr = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), wreg);
> +	rd_ptr_dbg = rd_ptr;
> +	wr_ptr_dbg = wr_ptr;
> +
> +	if (rd_ptr > len) {
> +		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
> +			stream, rd_ptr, len, wr_ptr);
> +		return -EINVAL;
> +	}
> +
> +	if (wr_ptr > len) {
> +		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
> +			stream, wr_ptr, len, rd_ptr);
> +		return -EINVAL;
> +	}
> +
> +	if (rd_ptr < wr_ptr) {
> +		if ((wr_ptr - rd_ptr) >= (sizeof(struct isp4fw_resp))) {
> +			memcpy((u8 *)response, (u8 *)mem_sys + rd_ptr,
> +			       sizeof(struct isp4fw_resp));
> +
> +			rd_ptr += sizeof(struct isp4fw_resp);
> +			if (rd_ptr < len) {
> +				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +					    rreg, rd_ptr);
> +			} else {
> +				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +					stream, rd_ptr, len, wr_ptr);
> +				return -EINVAL;
> +			}
> +
> +		} else {
> +			dev_err(dev, "sth wrong with wptr and rptr\n");
> +			return -EINVAL;
> +		}
> +	} else if (rd_ptr > wr_ptr) {
> +		u32 size;
> +		u8 *dst;
> +
> +		dst = (u8 *)response;
> +
> +		size = len - rd_ptr;
> +		if (size > sizeof(struct isp4fw_resp)) {
> +			mem_addr += rd_ptr;
> +			memcpy((u8 *)response,
> +			       (u8 *)(mem_sys) + rd_ptr,
> +			       sizeof(struct isp4fw_resp));
> +			rd_ptr += sizeof(struct isp4fw_resp);
> +			if (rd_ptr < len) {
> +				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +					    rreg, rd_ptr);
> +			} else {
> +				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +					stream, rd_ptr, len, wr_ptr);
> +				return -EINVAL;
> +			}
> +
> +		} else {
> +			if ((size + wr_ptr) < (sizeof(struct isp4fw_resp))) {
> +				dev_err(dev, "sth wrong with wptr and rptr1\n");
> +				return -EINVAL;
> +			}
> +
> +			memcpy(dst, (u8 *)(mem_sys) + rd_ptr, size);
> +
> +			dst += size;
> +			size = sizeof(struct isp4fw_resp) - size;
> +			if (size)
> +				memcpy(dst, (u8 *)(mem_sys), size);
> +			rd_ptr = size;
> +			if (rd_ptr < len) {
> +				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +					    rreg, rd_ptr);
> +			} else {
> +				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +					stream, rd_ptr, len, wr_ptr);
> +				return -EINVAL;
> +			}
> +		}
> +	} else {
> +		return -ETIME;
> +	}
> +
> +	checksum = isp4if_compute_check_sum((u8 *)response,
> +					    (sizeof(struct isp4fw_resp) - 4));

Redundant parentheses again.

> +
> +	if (checksum != response->resp_check_sum) {
> +		dev_err(dev, "resp checksum 0x%x,should 0x%x,rptr %u,wptr %u\n",
> +			checksum, response->resp_check_sum,
> +			rd_ptr_dbg, wr_ptr_dbg);
> +
> +		dev_err(dev, "(%u), seqNo %u, resp_id (0x%x)\n",
> +			stream,
> +			response->resp_seq_num,
> +			response->resp_id);

Fits on fewer lines.

> +
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int isp4if_send_command(struct isp4_interface *ispif,
> +			u32 cmd_id,
> +			void *package,
> +			u32 package_size)

Ditto.

> +{
> +	return isp4if_send_fw_cmd(ispif,
> +				  cmd_id, package,
> +				  package_size, NULL, NULL, NULL);

Ditto.

> +}
> +
> +int isp4if_send_command_sync(struct isp4_interface *ispif,
> +			     u32 cmd_id,
> +			     void *package,
> +			     u32 package_size,
> +			     u32 timeout)

Ditto.

> +{
> +	struct device *dev = ispif->dev;
> +	DECLARE_WAIT_QUEUE_HEAD(cmd_wq);
> +	u32 wq_cond = 0;
> +	int ret;
> +	u32 seq;
> +
> +	ret = isp4if_send_fw_cmd(ispif,
> +				 cmd_id, package,

Ditto.

> +				 package_size, &cmd_wq, &wq_cond, &seq);
> +
> +	if (ret) {
> +		dev_err(dev, "send fw cmd fail %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = wait_event_timeout(cmd_wq, wq_cond != 0,
> +				 msecs_to_jiffies(timeout));
> +

Extra newline.

> +	/* timeout occurred */

Redundant comment.

> +	if (ret == 0) {
> +		struct isp4if_cmd_element *ele;
> +
> +		ele = isp4if_rm_cmd_from_cmdq(ispif, seq, cmd_id);
> +		kfree(ele);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +void isp4if_clear_bufq(struct isp4_interface *ispif)
> +{
> +	struct isp4if_img_buf_node *buf_node = NULL;
> +	struct isp4if_img_buf_node *tmp_node = NULL;
> +
> +	guard(mutex)(&ispif->bufq_mutex);
> +
> +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->bufq,
> +				 node) {

Please rewrap.

> +		list_del(&buf_node->node);
> +		kfree(buf_node);
> +	}
> +}
> +
> +void isp4if_dealloc_buffer_node(struct isp4if_img_buf_node *buf_node)
> +{
> +	kfree(buf_node);
> +}
> +
> +struct isp4if_img_buf_node *
> +isp4if_alloc_buffer_node(struct isp4if_img_buf_info *buf_info)
> +{
> +	struct isp4if_img_buf_node *node = NULL;
> +
> +	node = kmalloc(sizeof(*node), GFP_KERNEL);
> +	if (node)
> +		node->buf_info = *buf_info;
> +
> +	return node;
> +};
> +
> +struct isp4if_img_buf_node *
> +isp4if_dequeue_buffer(struct isp4_interface *ispif)
> +{
> +	struct isp4if_img_buf_node *buf_node = NULL;
> +
> +	guard(mutex)(&ispif->bufq_mutex);
> +
> +	buf_node = list_first_entry_or_null(&ispif->bufq,
> +					    typeof(*buf_node),
> +					    node);

Ditto.

> +	if (buf_node)
> +		list_del(&buf_node->node);
> +
> +	return buf_node;
> +}
> +
> +int isp4if_queue_buffer(struct isp4_interface *ispif,
> +			struct isp4if_img_buf_node *buf_node)
> +{
> +	int ret;
> +
> +	ret = isp4if_send_buffer(ispif, &buf_node->buf_info);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&ispif->bufq_mutex);
> +
> +	list_add_tail(&buf_node->node, &ispif->bufq);
> +
> +	return 0;
> +}
> +
> +int isp4if_stop(struct isp4_interface *ispif)
> +{
> +	isp4if_disable_ccpu(ispif);
> +
> +	isp4if_dealloc_fw_gpumem(ispif);
> +
> +	return 0;
> +}
> +
> +int isp4if_start(struct isp4_interface *ispif)
> +{
> +	int ret;
> +
> +	ret = isp4if_alloc_fw_gpumem(ispif);
> +	if (ret)
> +		goto failed_gpumem_alloc;
> +
> +	ret = isp4if_fw_boot(ispif);
> +	if (ret)
> +		goto failed_fw_boot;
> +
> +	return 0;
> +
> +failed_gpumem_alloc:
> +	return -ENOMEM;

No label needed for this.

> +
> +failed_fw_boot:
> +	isp4if_dealloc_fw_gpumem(ispif);
> +	return ret;
> +}
> +
> +int isp4if_deinit(struct isp4_interface *ispif)
> +{
> +	isp4if_clear_cmdq(ispif);
> +
> +	isp4if_clear_bufq(ispif);
> +
> +	mutex_destroy(&ispif->cmdq_mutex);
> +	mutex_destroy(&ispif->bufq_mutex);
> +	mutex_destroy(&ispif->isp4if_mutex);
> +
> +	return 0;
> +}
> +
> +int isp4if_init(struct isp4_interface *ispif, struct device *dev,
> +		void *amdgpu_dev, void __iomem *isp_mmip)
> +{
> +	ispif->dev = dev;
> +	ispif->adev = amdgpu_dev;
> +	ispif->mmio = isp_mmip;
> +
> +	ispif->cmd_rb_base_index = 0;
> +	ispif->resp_rb_base_index = ISP4IF_RESP_CHAN_TO_RB_OFFSET - 1;
> +	ispif->aligned_rb_chunk_size = ISP4IF_RB_PMBMAP_MEM_CHUNK & 0xffffffc0;
> +
> +	mutex_init(&ispif->cmdq_mutex); /* used for cmdq access */
> +	mutex_init(&ispif->bufq_mutex); /* used for bufq access */
> +	mutex_init(&ispif->isp4if_mutex); /* used for commands sent to ispfw */
> +
> +	INIT_LIST_HEAD(&ispif->cmdq);
> +	INIT_LIST_HEAD(&ispif->bufq);
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
> new file mode 100644
> index 000000000000..b2ca147b78b6
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.h
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_INTERFACE_
> +#define _ISP4_INTERFACE_
> +
> +#define ISP4IF_RB_MAX (25)
> +#define ISP4IF_RESP_CHAN_TO_RB_OFFSET (9)
> +#define ISP4IF_RB_PMBMAP_MEM_SIZE (16 * 1024 * 1024 - 1)
> +#define ISP4IF_RB_PMBMAP_MEM_CHUNK (ISP4IF_RB_PMBMAP_MEM_SIZE \
> +	/ (ISP4IF_RB_MAX - 1))
> +#define ISP4IF_ISP_MC_ADDR_ALIGN (1024 * 32)
> +#define ISP4IF_HOST2FW_COMMAND_SIZE (sizeof(struct isp4fw_cmd))
> +#define ISP4IF_FW_CMD_BUF_COUNT 4
> +#define ISP4IF_FW_RESP_BUF_COUNT 4
> +#define ISP4IF_MAX_NUM_HOST2FW_COMMAND (40)
> +#define ISP4IF_FW_CMD_BUF_SIZE (ISP4IF_MAX_NUM_HOST2FW_COMMAND \
> +	* ISP4IF_HOST2FW_COMMAND_SIZE)
> +#define ISP4IF_MAX_SLEEP_COUNT (10)
> +#define ISP4IF_MAX_SLEEP_TIME (33)
> +
> +#define ISP4IF_META_INFO_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
> +#define ISP4IF_MAX_STREAM_META_BUF_COUNT 6
> +
> +#define ISP4IF_FW_LOG_RINGBUF_SIZE (2 * 1024 * 1024)
> +
> +#define ISP4IF_MAX_CMD_RESPONSE_BUF_SIZE (4 * 1024)
> +
> +#define GET_ISP4IF_REG_BASE(ispif) (((ispif))->mmio)
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
> +	u32	mem_domain;
> +	u64	mem_size;
> +	u32	mem_align;
> +	u64	gpu_mc_addr;
> +	void	*sys_addr;
> +	void	*mem_handle;
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
> +	enum isp4if_stream_id stream;
> +	u64 mc_addr;
> +	wait_queue_head_t *wq;
> +	u32 *wq_cond;
> +	struct isp4if_gpu_mem_info *gpu_pkg;
> +};
> +
> +struct isp4_interface {
> +	struct amdgpu_device *adev;
> +
> +	struct device *dev;
> +	void __iomem *mmio;
> +
> +	struct mutex cmdq_mutex; /* used for cmdq access */
> +	struct mutex bufq_mutex; /* used for bufq access */
> +	struct mutex isp4if_mutex; /* used to send fw cmd and read fw log */
> +
> +	struct list_head cmdq; /* commands sent to fw */
> +	struct list_head bufq; /* buffers sent to fw */
> +
> +	enum isp4if_status status;
> +	u32 host2fw_seq_num;
> +
> +	/* FW ring buffer configs */
> +	u32 cmd_rb_base_index;
> +	u32 resp_rb_base_index;
> +	u32 aligned_rb_chunk_size;
> +
> +	/* ISP fw buffers */
> +	struct isp4if_gpu_mem_info *fw_log_buf;
> +	struct isp4if_gpu_mem_info *fw_cmd_resp_buf;
> +	struct isp4if_gpu_mem_info *fw_mem_pool;
> +	struct isp4if_gpu_mem_info *
> +		metainfo_buf_pool[ISP4IF_MAX_STREAM_META_BUF_COUNT];
> +};
> +
> +static inline void isp4if_split_addr64(u64 addr, u32 *lo, u32 *hi)
> +{
> +	if (lo)
> +		*lo = (u32)(addr & 0xffffffff);

Redundant and and cast, too.

> +	if (hi)
> +		*hi = (u32)(addr >> 32);

Redundant cast.

> +}
> +
> +static inline u64 isp4if_join_addr64(u32 lo, u32 hi)
> +{
> +	return (((u64)hi) << 32) | (u64)lo;
> +}
> +
> +int isp4if_f2h_resp(struct isp4_interface *ispif,
> +		    enum isp4if_stream_id stream,
> +		    void *response);
> +
> +int isp4if_send_command(struct isp4_interface *ispif,
> +			u32 cmd_id,
> +			void *package,
> +			u32 package_size);
> +
> +int isp4if_send_command_sync(struct isp4_interface *ispif,
> +			     u32 cmd_id,
> +			     void *package,
> +			     u32 package_size,
> +			     u32 timeout);
> +
> +struct isp4if_cmd_element *
> +isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif,
> +			u32 seq_num,
> +			u32 cmd_id);
> +
> +void isp4if_clear_cmdq(struct isp4_interface *ispif);
> +
> +void isp4if_clear_bufq(struct isp4_interface *ispif);
> +
> +void isp4if_dealloc_buffer_node(struct isp4if_img_buf_node *buf_node);
> +
> +struct isp4if_img_buf_node *
> +isp4if_alloc_buffer_node(struct isp4if_img_buf_info *buf_info);
> +
> +struct isp4if_img_buf_node *isp4if_dequeue_buffer(struct isp4_interface *ispif);
> +
> +int isp4if_queue_buffer(struct isp4_interface *ispif,
> +			struct isp4if_img_buf_node *buf_node);
> +
> +int isp4if_stop(struct isp4_interface *ispif);
> +
> +int isp4if_start(struct isp4_interface *ispif);
> +
> +int isp4if_deinit(struct isp4_interface *ispif);
> +
> +int isp4if_init(struct isp4_interface *ispif, struct device *dev,
> +		void *amdgpu_dev, void __iomem *isp_mmip);
> +
> +#endif

-- 
Kind regards,

Sakari Ailus

