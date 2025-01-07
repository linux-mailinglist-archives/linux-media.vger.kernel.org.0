Return-Path: <linux-media+bounces-24348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C841A044C3
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDFB33A7A3D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 15:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA2D1F4264;
	Tue,  7 Jan 2025 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PjZZLnQv"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2091F4E3F;
	Tue,  7 Jan 2025 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736263986; cv=none; b=OZL6uT8Su28LJUdpk4SpoGw2ABRbDdM67nRrQuP8l1x3gnCWcVSCvi9TUJi6rez0+jUErRo5iYx3KEhHb30bUzPuIN1vQG7GlijDrBYA0PM2aaUHXJLIhK/c+WhBZF72GnLEJcq6kMpPft1cejUY4wBGE3iw5NSTbQXzflbE92g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736263986; c=relaxed/simple;
	bh=k2DT1XqHQAki5tJZHESC+VMu88V1B9lcCx5HpPihdL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSXz6uhVdJ8RqynhTCk61VbjqY9raexbRwX374GLhheUAeqpoHcG9mJ3s+vLNVmgPX8VZ0yke8LcobdoT/CQY27XOBN+s1kfUzks+5s6xglyporHUpz2xVmsZEAXU+4qk/zS/QyI8k/+n1q3ySZvisJ3gisnNyurg3smPdr4UM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PjZZLnQv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736263968;
	bh=k2DT1XqHQAki5tJZHESC+VMu88V1B9lcCx5HpPihdL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PjZZLnQv8qZC8c2y4MnKUIQ9a8LREFLGb9XLx3DXdSmq1m1ovlthykJ7wJ+v9HLvn
	 TNnJcVyM0DKFYT+tPxwcyUU4FltOCcBS/N2MraAsdSJC1DmkC1A6u1iXhZ6GDG8tQ7
	 hDvopGKEbB3lW8dlxQW5eWsL+KwJ+1UhCCVglOw7Lj6OeBPav40COg+CcXQ6r+vCMG
	 NASW9qgR/okul5s/P6q1DKka1aCYxnFnjTaSuW2x/2hiVrpWV1jnZ/4luIn7oRjnDL
	 rBODtcRvYPGFv2hFC+/KCPx/d2/y/MHaRFA/Jc6ds21jr9cUyZPU2n54lP34HHbBdG
	 SvPBsCBsslXkA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 990E917E1599;
	Tue,  7 Jan 2025 16:32:47 +0100 (CET)
Message-ID: <96df068d-603e-49a9-973e-3374eb4d9be4@collabora.com>
Date: Tue, 7 Jan 2025 16:32:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
To: "bo.kong" <bo.kong@mediatek.com>, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org
Cc: conor+dt@kernel.org, matthias.bgg@gmail.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241225090113.17027-1-bo.kong@mediatek.com>
 <20241225090113.17027-4-bo.kong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/12/24 10:00, bo.kong ha scritto:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> Add a V4L2 sub-device driver for MT8188 AIE.
> 
> Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
> ---
> 
> Changes in v3:
> 1. Remove not used include file, include only headers which AIE use
> 2. Remove Makefile some private driver headers
> 
> Changes in v2:
> 1. Fix coding style
> ---
>   drivers/media/platform/mediatek/Kconfig       |    1 +
>   drivers/media/platform/mediatek/Makefile      |    1 +
>   drivers/media/platform/mediatek/aie/Kconfig   |   41 +
>   drivers/media/platform/mediatek/aie/Makefile  |    8 +
>   drivers/media/platform/mediatek/aie/mtk_aie.h |  950 +++++
>   .../media/platform/mediatek/aie/mtk_aie_53.c  | 1398 +++++++
>   .../media/platform/mediatek/aie/mtk_aie_drv.c | 3545 +++++++++++++++++
>   7 files changed, 5944 insertions(+)
>   create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
>   create mode 100644 drivers/media/platform/mediatek/aie/Makefile
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> 
> diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
> index 84104e2cd024..cd161272666b 100644
> --- a/drivers/media/platform/mediatek/Kconfig
> +++ b/drivers/media/platform/mediatek/Kconfig
> @@ -2,6 +2,7 @@
>   
>   comment "Mediatek media platform drivers"
>   
> +source "drivers/media/platform/mediatek/aie/Kconfig"
>   source "drivers/media/platform/mediatek/jpeg/Kconfig"
>   source "drivers/media/platform/mediatek/mdp/Kconfig"
>   source "drivers/media/platform/mediatek/vcodec/Kconfig"
> diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
> index 38e6ba917fe5..23a096fdf21c 100644
> --- a/drivers/media/platform/mediatek/Makefile
> +++ b/drivers/media/platform/mediatek/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +obj-y += aie/
>   obj-y += jpeg/
>   obj-y += mdp/
>   obj-y += vcodec/
> diff --git a/drivers/media/platform/mediatek/aie/Kconfig b/drivers/media/platform/mediatek/aie/Kconfig
> new file mode 100644
> index 000000000000..b7925cd69309
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/Kconfig
> @@ -0,0 +1,41 @@
> +config VIDEO_MTK_AIE
> +	tristate "MediaTek AI engine function"
> +	depends on OF
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	select MEDIA_CONTROLLER_REQUEST_API
> +	help
> +	  Support the AI engine (AIE) feature
> +
> +	  AIE driver is a V4L2 memory-to-memory device driver which
> +	  provides hardware accelerated face detection function,
> +	  it can detect different sizes of faces in a raw image.
> +
> +config VIDEO_MTK_AIE_RESULT_IN_KERNEL
> +	bool "Operate AIE in kernel mode"
> +	depends on VIDEO_MTK_AIE
> +	default y
> +	help
> +	  When this option is enabled, the MediaTek (MTK) AIE driver operates in
> +	  kernel mode, which is the default mode.
> +
> +	  In kernel mode, the AIE driver's results are processed directly within
> +	  the kernel space, enhancing performance and reliability.
> +
> +	  Disabling this option might compromise the AIE driver performance and stability.
> +
> +	  Unless you have specific needs for operating the driver in user mode,
> +	  for example: unit test (UT), this option should remain enabled.
> +
> +config VIDEO_MTK_AIE_RESULT_IN_USER
> +	bool "Operate AIE in user mode"
> +	depends on VIDEO_MTK_AIE
> +	help
> +	  Enabling this option sets the MediaTek (MTK) AIE driver to operate in
> +	  user mode.
> +
> +	  In this mode, AIE driver result values are handled at user level, providing an
> +	  organized manner to store multiple result values.
> +
> +	  Unless you understand the implications of operating in user mode,
> +	  this option is usually recommended to be disabled.
> \ No newline at end of file
> diff --git a/drivers/media/platform/mediatek/aie/Makefile b/drivers/media/platform/mediatek/aie/Makefile
> new file mode 100644
> index 000000000000..15c1638a5064
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +mtk-aie-$(CONFIG_VIDEO_MTK_AIE) += mtk_aie_53.o
> +mtk-aie-$(CONFIG_VIDEO_MTK_AIE) += mtk_aie_drv.o
> +
> +obj-$(CONFIG_VIDEO_MTK_AIE) += mtk-aie.o
> +
> +ccflags-$(CONFIG_VIDEO_MTK_AIE) += -I$(srctree)/drivers/misc/mediatek/mtk-interconnect/
> +ccflags-$(CONFIG_VIDEO_MTK_AIE) += -I$(srctree)/drivers/media/platform/mtk-isp/mtk-vmm/
> \ No newline at end of file
> diff --git a/drivers/media/platform/mediatek/aie/mtk_aie.h b/drivers/media/platform/mediatek/aie/mtk_aie.h
> new file mode 100644
> index 000000000000..92cb167c9ec1
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/mtk_aie.h
> @@ -0,0 +1,950 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Fish Wu <fish.wu@mediatek.com>
> + */
> +
> +#ifndef __MTK_AIE_H__
> +#define __MTK_AIE_H__
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +

..snip..

> +
> +struct aie_static_info_element {
> +	unsigned int fd_wdma_size[OUTPUT_WDMA_WRA_NUM];

I foresee that other MediaTek SoCs will have a different fd wdma size...
Please check how the per-soc structs are done in mtk-mdp3 for reference.

> +	unsigned int out_xsize_plus_1;
> +	unsigned int out_height;
> +	unsigned int out_ysize_plus_1_stride2;
> +	unsigned int out_stride;
> +	unsigned int out_stride_stride2;
> +	unsigned int out_width;
> +	unsigned int img_width;
> +	unsigned int img_height;
> +	unsigned int stride2_out_width;
> +	unsigned int stride2_out_height;
> +	unsigned int out_xsize_plus_1_stride2;
> +	unsigned int input_xsize_plus_1;

Is this used against data coming from the AIE HW?

Please use fixed size types; this should be u32.

> +};
> +
> +struct aie_static_info {
> +	struct aie_static_info_element inf_elm[FD_LOOP_NUM];
> +};
> +
> +enum aie_state {
> +	STATE_NA = 0x0,
> +	STATE_INIT = 0x1,
> +	STATE_OPEN = 0x2
> +};
> +
> +// AIE 3.1

/* AIE 3.1 */

> +enum aie_mode {

AIE_MODE_FD,
AIE_MODE_ATTRIBUTE,
AIE_MODE_FIELD,
AIE_MODE_MAX

P.S.: The first entry of an enumeration is always zero.

> +	FDMODE = 0,
> +	ATTRIBUTEMODE = 1,
> +	FLDMODE = 2
> +};
> +
> +enum aie_format {
> +	FMT_NA = 0,

AIE_FMT_NA,
AIE_FMT_YUV_2P,
AIE......

/* AIE 3.x */
AIE_FMT_YUV......

> +	FMT_YUV_2P = 1,
> +	FMT_YVU_2P = 2,
> +	FMT_YUYV = 3,
> +	FMT_YVYU = 4,
> +	FMT_UYVY = 5,
> +	FMT_VYUY = 6,
> +	FMT_MONO = 7,
> +	// AIE 3.X
> +	FMT_YUV420_2P = 8,
> +	FMT_YUV420_1P = 9
> +};
> +
> +enum aie_input_degree {

AIE_INPUT_ROT_DEGREE_0,
AIE_INPUT_ROT_DEGREE_90 ......

> +	DEGREE_0 = 0,
> +	DEGREE_90 = 1,
> +	DEGREE_270 = 2,
> +	DEGREE_180 = 3
> +};
> +
> +/* align v4l2 user space interface */
> +struct fd_ret {
> +	u16 anchor_x0[MAX_FACE_NUM];
> +	u16 anchor_x1[MAX_FACE_NUM];
> +	u16 anchor_y0[MAX_FACE_NUM];
> +	u16 anchor_y1[MAX_FACE_NUM];
> +	signed short rop_landmark_score0[MAX_FACE_NUM];

s8 rop_landmark_score0[MAX_FACE_NUM]

> +	signed short rop_landmark_score1[MAX_FACE_NUM];
> +	signed short rop_landmark_score2[MAX_FACE_NUM];
> +	signed short anchor_score[MAX_FACE_NUM];
> +	signed short rip_landmark_score0[MAX_FACE_NUM];
> +	signed short rip_landmark_score1[MAX_FACE_NUM];
> +	signed short rip_landmark_score2[MAX_FACE_NUM];
> +	signed short rip_landmark_score3[MAX_FACE_NUM];
> +	signed short rip_landmark_score4[MAX_FACE_NUM];
> +	signed short rip_landmark_score5[MAX_FACE_NUM];
> +	signed short rip_landmark_score6[MAX_FACE_NUM];
> +	u16 face_result_index[MAX_FACE_NUM];
> +	u16 anchor_index[MAX_FACE_NUM];
> +	u32 fd_partial_result;
> +};
> +
> +struct fd_result {
> +	u16 fd_pyramid0_num;
> +	u16 fd_pyramid1_num;
> +	u16 fd_pyramid2_num;
> +	u16 fd_total_num;

struct fd_ret result_pyramid[NUM_PYRAMID_RESULTS]

> +	struct fd_ret pyramid0_result;
> +	struct fd_ret pyramid1_result;
> +	struct fd_ret pyramid2_result;
> +};
> +

#define RACE_NUM_CHANNELS	4
#define RACE_NUM_FEATURE	64

#define GENDER_NUM_CHANNELS ...... etc

> +struct race_result {
> +	signed short result[4][64]; // RESULT[Channel][Feature]
> +};
> +
> +struct gender_result {
> +	signed short result[2][64]; // RESULT[Channel][Feature]
> +};
> +
> +struct merged_race_result {
> +	signed short result[4]; // RESULT[Feature]
> +};
> +
> +struct merged_gender_result {
> +	signed short result[2]; // RESULT[Feature]
> +};
> +
> +struct merged_age_result {
> +	signed short result[2]; // RESULT[Feature]
> +};
> +
> +struct merged_is_indian_result {
> +	signed short result[2]; // RESULT[Feature]
> +};
> +
> +struct attr_result {

s8 race_result[RACE_NUM_CHANNELS][RACE_NUM_FEATURE];
s8 ......

> +	struct gender_result gender_ret;
> +	struct race_result race_ret;
> +	struct merged_age_result merged_age_ret;
> +	struct merged_gender_result merged_gender_ret;
> +	struct merged_is_indian_result merged_is_indian_ret;
> +	struct merged_race_result merged_race_ret;
> +};
> +
> +// AIE 3.X

Please fix comment style, here and everywhere else.

> +struct fld_landmark {
> +	u16 x;
> +	u16 y;
> +};
> +
> +struct fld_result {
> +	struct fld_landmark fld_landmark[FLD_CUR_LANDMARK];
> +	u16 fld_out_rip;
> +	u16 fld_out_rop;
> +	u16 confidence;
> +	signed short blinkscore;

signed short is s8

> +};
> +
> +struct aie_roi {
> +	u32 x1;
> +	u32 y1;
> +	u32 x2;
> +	u32 y2;
> +};
> +
> +struct aie_padding {
> +	u32 left;
> +	u32 right;
> +	u32 down;
> +	u32 up;
> +};
> +
> +// AIE 3.X
> +struct fld_crop_rip_rop {
> +	unsigned int fld_in_crop_x1;
> +	unsigned int fld_in_crop_y1;
> +	unsigned int fld_in_crop_x2;
> +	unsigned int fld_in_crop_y2;
> +	unsigned int fld_in_rip;
> +	unsigned int fld_in_rop;

Same comments apply here: if this is dealing with data received from HW, please use
fixed size types, otherwise if this is for driver internal consumption only, with
data that already got interpreted from structures coming from the HW, it's ok to
keep unsigned int here.

> +};
> +
> +/* align v4l2 user space interface */
> +struct aie_enq_info {
> +	unsigned int sel_mode;
> +	unsigned int src_img_fmt;
> +	unsigned int src_img_width;
> +	unsigned int src_img_height;
> +	unsigned int src_img_stride;
> +	unsigned int pyramid_base_width;
> +	unsigned int pyramid_base_height;
> +	unsigned int number_of_pyramid;
> +	unsigned int rotate_degree;
> +	int en_roi;
> +	struct aie_roi src_roi;
> +	int en_padding;
> +	struct aie_padding src_padding;
> +	unsigned int freq_level;
> +	// AIE 3.X
> +	unsigned int fld_face_num;
> +	struct fld_crop_rip_rop fld_input[FLD_MAX_FRAME];
> +	u32 src_img_addr;
> +	u32 src_img_addr_uv;
> +	u32 fd_version;
> +	u32 attr_version;
> +	u32 pose_version;
> +	struct fd_result fd_out;
> +	struct attr_result attr_out;
> +	// AIE 3.X
> +	struct fld_result fld_out[FLD_MAX_FRAME];
> +	u32 irq_status;
> +};
> +
> +struct aie_reg_cfg {
> +	u32 rs_adr;
> +	u32 yuv2rgb_adr;
> +	u32 fd_adr;
> +	u32 fd_pose_adr;
> +	u32 fd_mode;
> +	u32 hw_result;
> +	u32 hw_result1;
> +	u32 reserved;
> +};

struct aie_hw_rect {
	u16 width;
	u16 height;
};

> +
> +struct aie_para {
> +	void *fd_fd_cfg_va;
> +	void *fd_rs_cfg_va;
> +	void *fd_yuv2rgb_cfg_va;
> +
> +	void *attr_fd_cfg_va[MAX_ENQUE_FRAME_NUM];
> +	void *attr_yuv2rgb_cfg_va[MAX_ENQUE_FRAME_NUM];
> +
> +	void *rs_pym_rst_va[PYM_NUM][COLOR_NUM];
> +
> +	dma_addr_t fd_fd_cfg_pa;
> +	dma_addr_t fd_rs_cfg_pa;
> +	dma_addr_t fd_yuv2rgb_cfg_pa;
> +
> +	dma_addr_t attr_fd_cfg_pa[MAX_ENQUE_FRAME_NUM];
> +	dma_addr_t attr_yuv2rgb_cfg_pa[MAX_ENQUE_FRAME_NUM];
> +
> +	dma_addr_t rs_pym_rst_pa[PYM_NUM][COLOR_NUM];
> +
> +	u32 sel_mode;

	struct aie_hw_rect max_img_rect;
	struct aie_hw_rect img_rect;
	struct aie_hw_rect crop_rect;

...etc

> +	u16 max_img_width;
> +	u16 max_img_height;
> +	u16 img_width;
> +	u16 img_height;
> +	u16 crop_width;
> +	u16 crop_height;
> +	u32 src_img_fmt;
> +	u32 rotate_degree;
> +	s16 rpn_anchor_thrd;
> +	u16 pyramid_width;
> +	u16 pyramid_height;
> +	u16 max_pyramid_width;
> +	u16 max_pyramid_height;
> +	u16 number_of_pyramid;
> +	u32 src_img_addr;
> +	u32 src_img_addr_uv;
> +};
> +

..snip..

> diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_53.c b/drivers/media/platform/mediatek/aie/mtk_aie_53.c
> new file mode 100644
> index 000000000000..eaf52c3bcf0d
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/mtk_aie_53.c
> @@ -0,0 +1,1398 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Fish Wu <fish.wu@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/mtk_aie_v4l2_controls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include "mtk_aie.h"
> +

..snip..

> +
> +static int mtk_aie_hw_enable(struct mtk_aie_dev *fd)
> +{
> +	struct mtk_aie_ctx *ctx = fd->ctx;
> +
> +	/* initial value */
> +	dev_dbg(fd->dev, "init param : max w:%d, max h:%d",

init param img: max_w ....

> +		ctx->user_init.max_img_width, ctx->user_init.max_img_height);
> +
> +	dev_dbg(fd->dev, "init param : p_w:%d, p_h:%d, f thread:%d",

init param pyramid: w: ....

> +		ctx->user_init.pyramid_width,
> +		ctx->user_init.pyramid_height,
> +		ctx->user_init.feature_threshold);
> +
> +	return aie_init(fd, &ctx->user_init);
> +}
> +

..snip..

> +
> +static int mtk_aie_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct device *dev = ctx->dev;
> +	struct v4l2_pix_format_mplane *pixfmt;
> +	int ret = 0;

int ret;

> +
> +	switch (vq->type) {
> +	case V4L2_BUF_TYPE_META_CAPTURE:
> +		if (vb2_plane_size(vb, 0) < ctx->dst_fmt.buffersize) {
> +			dev_err(dev, "meta size %lu is too small\n", vb2_plane_size(vb, 0));
> +			ret = -EINVAL;

return -EINVAL;

> +		} else {
> +			vb2_set_plane_payload(vb, 0, ctx->dst_fmt.buffersize);
> +		}
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		pixfmt = &ctx->src_fmt;
> +
> +		if (vbuf->field == V4L2_FIELD_ANY)
> +			vbuf->field = V4L2_FIELD_NONE;
> +
> +		if (vb->num_planes > 2 || vbuf->field != V4L2_FIELD_NONE) {
> +			dev_dbg(dev, "plane %d or field %d not supported\n",
> +				vb->num_planes, vbuf->field);
> +			ret = -EINVAL;
> +		}
> +
> +		if (vb2_plane_size(vb, 0) < pixfmt->plane_fmt[0].sizeimage) {
> +			dev_dbg(dev, "plane 0 %lu is too small than %x\n",
> +				vb2_plane_size(vb, 0),
> +				pixfmt->plane_fmt[0].sizeimage);
> +			ret = -EINVAL;
> +		} else {
> +			vb2_set_plane_payload(vb, 0, pixfmt->plane_fmt[0].sizeimage);
> +		}
> +
> +		if (pixfmt->num_planes == 2 &&
> +		    vb2_plane_size(vb, 1) < pixfmt->plane_fmt[1].sizeimage) {
> +			dev_dbg(dev, "plane 1 %lu is too small than %x\n",
> +				vb2_plane_size(vb, 1),
> +				pixfmt->plane_fmt[1].sizeimage);
> +			ret = -EINVAL;
> +		} else {
> +			vb2_set_plane_payload(vb, 1, pixfmt->plane_fmt[1].sizeimage);
> +		}
> +		break;
> +	}

if (ret)
	return ret;

return 0;

> +
> +	return ret;
> +}
> +
> +static void mtk_aie_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int mtk_aie_vb2_queue_setup(struct vb2_queue *vq,
> +				   unsigned int *num_buffers,
> +				   unsigned int *num_planes,
> +				   unsigned int sizes[],
> +				   struct device *alloc_devs[])
> +{
> +	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct device *dev = ctx->dev;
> +	unsigned int size[2] = {0, 0};

unsigned int size[2];

> +	unsigned int plane = 0;

unsigned int plane;

> +
> +	switch (vq->type) {
> +	case V4L2_BUF_TYPE_META_CAPTURE:
> +		size[0] = ctx->dst_fmt.buffersize;

size[1] = 0;

> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> +		size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> +		break;

default:
size[0] = 0;
size[1] = 0;

> +	}
> +
> +	dev_dbg(dev, "vq type =%d, size[0]=%d, size[1]=%d\n", vq->type, size[0], size[1]);
> +
> +	if (*num_planes > 2)
> +		return -EINVAL;
> +
> +	*num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
> +
> +	if (*num_planes == 0) {
> +		if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
> +			sizes[0] = ctx->dst_fmt.buffersize;
> +			*num_planes = 1;
> +			return 0;
> +		}
> +
> +		*num_planes = ctx->src_fmt.num_planes;
> +		if (*num_planes > 2)
> +			return -EINVAL;
> +		for (plane = 0; plane < *num_planes; plane++)
> +			sizes[plane] = ctx->src_fmt.plane_fmt[plane].sizeimage;
> +
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_aie_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct mtk_aie_dev *fd;
> +
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	fd = ctx->fd_dev;
> +
> +	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {

if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && ++fd->fd_stream_count == 1)
	return mtk_aie_hw_connect(..)

return 0;

> +		fd->fd_stream_count++;
> +		if (fd->fd_stream_count == 1)
> +			return mtk_aie_hw_connect(ctx->fd_dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_aie_job_timeout_work(struct work_struct *work)
> +{
> +	struct mtk_aie_dev *fd =
> +		container_of(work, struct mtk_aie_dev, job_timeout_work.work);
> +
> +	dev_err(fd->dev, "FD Job timeout!");
> +
> +	dev_dbg(fd->dev, "%s result result1: %x, %x, %x", __func__,
> +		readl(fd->fd_base + AIE_RESULT_0_REG),
> +		readl(fd->fd_base + AIE_RESULT_1_REG),
> +		readl(fd->fd_base + AIE_DMA_CTL_REG));
> +
> +	fd->aie_cfg->irq_status = readl(fd->fd_base + AIE_INT_EN_REG);
> +
> +	if (fd->aie_cfg->sel_mode == ATTRIBUTEMODE)

When you use a branch with only a debug print inside please add braces!
Debug print calls may become a noop and then bad things will happen :-)

if (fd->aie_cfg->sel_mode == ...) {
	dev_dbg ...
}

> +		dev_dbg(fd->dev, "[ATTRMODE] w_idx = %d, r_idx = %d\n",
> +			fd->attr_para->w_idx, fd->attr_para->r_idx);
> +
> +	aie_irqhandle(fd);
> +	aie_reset(fd);
> +	atomic_dec(&fd->num_composing);
> +	mtk_aie_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
> +	wake_up(&fd->flushing_waitq);
> +}
> +
> +static int mtk_aie_job_wait_finish(struct mtk_aie_dev *fd)
> +{
> +	return wait_for_completion_timeout(&fd->fd_job_finished, msecs_to_jiffies(1000));
> +}
> +
> +static void mtk_aie_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct mtk_aie_dev *fd = ctx->fd_dev;
> +	struct vb2_v4l2_buffer *vb = NULL;
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	struct v4l2_m2m_queue_ctx *queue_ctx;
> +
> +	if (!mtk_aie_job_wait_finish(fd))
> +		dev_info(fd->dev, "wait job finish timeout\n");

Isn't this an error? If not, that's a dev_dbg.

Also...

ret = mtk_aie_job_wait_finish(fd);
if (ret) ....

> +
> +	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		fd->fd_stream_count--;
> +		if (fd->fd_stream_count > 0)
> +			dev_dbg(fd->dev, "stop: fd_stream_count = %d\n", fd->fd_stream_count);
> +		else
> +			mtk_aie_hw_disconnect(fd);
> +	}
> +
> +	queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ? &m2m_ctx->out_q_ctx :
> +						    &m2m_ctx->cap_q_ctx;
> +	while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> +}
> +

..snip..

> +
> +static void mtk_aie_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> +				   const struct v4l2_pix_format_mplane *sfmt)
> +{
> +	dfmt->field = V4L2_FIELD_NONE;
> +	dfmt->colorspace = V4L2_COLORSPACE_BT2020;
> +	dfmt->num_planes = sfmt->num_planes;
> +	dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	dfmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> +	dfmt->pixelformat = sfmt->pixelformat;
> +
> +	/* Keep user setting as possible */
> +	dfmt->width = clamp(dfmt->width, MTK_FD_OUTPUT_MIN_WIDTH,
> +			    MTK_FD_OUTPUT_MAX_WIDTH);
> +	dfmt->height = clamp(dfmt->height, MTK_FD_OUTPUT_MIN_HEIGHT,
> +			     MTK_FD_OUTPUT_MAX_HEIGHT);
> +
> +	dfmt->plane_fmt[0].bytesperline = ALIGN(dfmt->width, 16);
> +	dfmt->plane_fmt[1].bytesperline = ALIGN(dfmt->width, 16);
> +

dfmt->plane_fmt[0].sizeimage = dfmt->height * dfmt->plane_fmt[0].bytesperline;
dfmt->plane_fmt[1].sizeimage = dfmt->height * dfmt->plane_fmt[1].bytesperline;

if (sfmt->num_planes == 2 && sfmt->pixelformat == V4L2_PIX_FMT_NV12M) {
	dfmt->plane_fmt[1].sizeimage /= 2;
} else if (sfmt->pixelformat == V4L2_PIX_FMT_NV12) {
	dfmt->plane_fmt[1].sizeimage *= 3;
	dfmt->plane_fmt[1].sizeimage /= 2;
}

that's way shorter.

> +	if (sfmt->num_planes == 2) {
> +		dfmt->plane_fmt[0].sizeimage =
> +			dfmt->height * dfmt->plane_fmt[0].bytesperline;
> +		if (sfmt->pixelformat == V4L2_PIX_FMT_NV12M)
> +			dfmt->plane_fmt[1].sizeimage =
> +				dfmt->height * dfmt->plane_fmt[1].bytesperline /
> +				2;
> +		else
> +			dfmt->plane_fmt[1].sizeimage =
> +				dfmt->height * dfmt->plane_fmt[1].bytesperline;
> +	} else {
> +		if (sfmt->pixelformat == V4L2_PIX_FMT_NV12)
> +			dfmt->plane_fmt[0].sizeimage =
> +				dfmt->height * dfmt->plane_fmt[0].bytesperline *
> +				3 / 2;
> +		else
> +			dfmt->plane_fmt[0].sizeimage =
> +				dfmt->height * dfmt->plane_fmt[0].bytesperline;
> +	}
> +}
> +
> +static const struct v4l2_pix_format_mplane *mtk_aie_find_fmt(u32 format)
> +{
> +	unsigned int i = 0;

unsigned int i;

> +
> +	for (i = 0; i < NUM_FORMATS; i++) {
> +		if (mtk_aie_img_fmts[i].pixelformat == format)
> +			return &mtk_aie_img_fmts[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int mtk_aie_try_fmt_out_mp(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	const struct v4l2_pix_format_mplane *fmt;
> +
> +	fmt = mtk_aie_find_fmt(pix_mp->pixelformat);
> +	if (!fmt)
> +		fmt = &mtk_aie_img_fmts[0]; /* Get default img fmt */
> +
> +	mtk_aie_fill_pixfmt_mp(pix_mp, fmt);
> +	return 0;
> +}
> +
> +static int mtk_aie_g_fmt_out_mp(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct mtk_aie_ctx *ctx = fh_to_ctx(fh);
> +
> +	f->fmt.pix_mp = ctx->src_fmt;
> +
> +	return 0;
> +}
> +
> +static int mtk_aie_s_fmt_out_mp(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct mtk_aie_ctx *ctx = fh_to_ctx(fh);
> +	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	struct mtk_aie_dev *fd = ctx->fd_dev;
> +	const struct v4l2_pix_format_mplane *fmt;
> +
> +	if (!vq) {
> +		dev_err(fd->dev, "%s vq is NULL!\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	/* Change not allowed if queue is streaming. */
> +	if (vb2_is_streaming(vq))
> +		return -EBUSY;
> +
> +	fmt = mtk_aie_find_fmt(f->fmt.pix_mp.pixelformat);
> +	if (!fmt)
> +		fmt = &mtk_aie_img_fmts[0]; /* Get default img fmt */
> +	else if (&fd->ctx->fh != file->private_data)
> +		return -EBUSY;
> +	if (fd->ctx != ctx)

If you always want fd->ctx to point to ctx, just assign it without that check...

> +		fd->ctx = ctx;
> +
> +	mtk_aie_fill_pixfmt_mp(&f->fmt.pix_mp, fmt);
> +	ctx->src_fmt = f->fmt.pix_mp;
> +
> +	return 0;
> +}
> +
> +static int mtk_aie_enum_fmt_meta_cap(struct file *file, void *fh,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	if (f->index)
> +		return -EINVAL;
> +
> +	strscpy(f->description, "Face detection result",
> +		sizeof(f->description));

82 columns is okay, this fits in one line.

> +
> +	f->pixelformat = V4L2_META_FMT_MTFD_RESULT;
> +	f->flags = 0;
> +
> +	return 0;
> +}
> +
..snip..

> +
> +static int mtk_aie_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
> +					 union v4l2_ctrl_ptr ptr)
> +{
> +	struct mtk_aie_ctx *ctx = ctrl_to_ctx(ctrl);
> +	struct mtk_aie_dev *fd;
> +	struct v4l2_ctrl_aie_init *p_aie_init;
> +	struct v4l2_ctrl_aie_param *p_aie_param;
> +
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	fd = ctx->fd_dev;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_MTK_AIE_PARAM:
> +		p_aie_param = ptr.p;
> +
> +		switch (p_aie_param->fd_mode) {
> +		case FDMODE:
> +		case ATTRIBUTEMODE:
> +		case FLDMODE:
> +			break;
> +		default:
> +			dev_err(ctx->dev, "AIE err:  mode: %d\n", p_aie_param->fd_mode);

"AIE err" is redundant: being this a dev_err, it's already an error; also, the
print coming from the AIE driver, means that it's an AIE error.

Same here and everywhere else.

dev_err(ctx->dev, "Requested invalid mode %u\n", ....)

> +				return -EINVAL;
> +		}
> +
> +		switch (p_aie_param->src_img_fmt) {
> +		case FMT_YUV_2P:
> +		case FMT_YVU_2P:
> +		case FMT_YUYV:
> +		case FMT_YVYU:
> +		case FMT_UYVY:
> +		case FMT_VYUY:
> +		case FMT_MONO:
> +		case FMT_YUV420_2P:
> +		case FMT_YUV420_1P:
> +			break;
> +		default:
> +			dev_err(ctx->dev, "AIE err:  fmt: %d\n", p_aie_param->src_img_fmt);
> +			return -EINVAL;
> +		}
> +
> +		if (p_aie_param->src_img_width >
> +				fd->base_para->max_img_width ||
> +			p_aie_param->src_img_height >
> +				fd->base_para->max_img_height ||
> +			p_aie_param->src_img_width == 0 ||
> +			p_aie_param->src_img_height == 0) {

The indentation is messed up, and that makes it hard to read.
Besides, that's reaching a maximum of 91 columns if you do the last two in one
line, or a max of 83 otherwise - so that can be compressed in less lines.

		if (p_aie_param->src_img_width > fd->base_para->max_img_width ||
		    p_aie_param->src_img_height > fd->base_para->max_img_height ||
		    p_aie_param->src_img_width == 0 ||
		    p_aie_param->src_img_height == 0) {
			dev_err( .....)

> +			dev_err(fd->dev, "AIE err: Src_WD: %d Src_HT: %d\n",
> +				p_aie_param->src_img_width,
> +				p_aie_param->src_img_height);
> +
> +			dev_err(fd->dev,
> +				"AIE err: MAX_Src_WD: %d MAX_Src_HT: %d\n",
> +				fd->base_para->max_img_width,
> +				fd->base_para->max_img_height);
> +
> +			return -EINVAL;
> +		}
> +
> +		if (p_aie_param->pyramid_base_width
> +				> fd->base_para->max_pyramid_width ||
> +			p_aie_param->pyramid_base_height
> +				> fd->base_para->max_pyramid_height ||

92 cols, it's okay....

if (p_aie_param->pyramid_base_width > fd->base_para->max_pyramid_width ||
     p_aie_param->pyramid_base_height > fd->base_para->max_pyramid_height ||
     p_aie_param->number_of_pyramid > 3 ||
     p_aie_param->number_of_pyramid <= 0) {

> +			p_aie_param->number_of_pyramid > 3 ||
> +			p_aie_param->number_of_pyramid <= 0) {
> +			dev_err(fd->dev, "AIE err: base w: %d h: %d num: %d\n",
> +				p_aie_param->pyramid_base_width,
> +				p_aie_param->pyramid_base_height,
> +				p_aie_param->number_of_pyramid);
> +
> +			dev_err(fd->dev, "AIE err: max w: %d h: %d\n",
> +				fd->base_para->max_pyramid_width,
> +				fd->base_para->max_pyramid_height);
> +
> +			return -EINVAL;
> +		}
> +
> +		break;
> +
> +	case V4L2_CID_MTK_AIE_INIT:
> +		p_aie_init = ptr.p;
> +		if (!p_aie_init->max_img_width || !p_aie_init->max_img_height ||
> +		    !p_aie_init->pyramid_width || !p_aie_init->pyramid_height) {
> +			dev_err(fd->dev,
> +				"AIE INIT err: max_w: %d max_h: %d, p_w: %d p_h: %d\n",
> +				p_aie_init->max_img_width, p_aie_init->max_img_height,
> +				p_aie_init->pyramid_width, p_aie_init->pyramid_height);
> +
> +			return -EINVAL;
> +		}
> +
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_type_ops aie_ctrl_type_ops = {
> +	.equal = v4l2_ctrl_type_op_equal,
> +	.init = mtk_aie_ctrl_type_op_init,
> +	.log = v4l2_ctrl_type_op_log,
> +	.validate = mtk_aie_ctrl_type_op_validate,
> +};
> +
> +static struct v4l2_ctrl_config mtk_aie_controls[] = {
> +	{
> +		.ops = &aie_ctrl_ops,
> +		.type_ops = &aie_ctrl_type_ops,
> +		.id = V4L2_CID_MTK_AIE_INIT,
> +		.name = "FD detection init",
> +		.type = V4L2_CTRL_TYPE_AIE_INIT,
> +		.elem_size = sizeof(struct v4l2_ctrl_aie_init),

	}, {
		.ops ....

> +	},
> +	{
> +		.ops = &aie_ctrl_ops,
> +		.type_ops = &aie_ctrl_type_ops,
> +		.id = V4L2_CID_MTK_AIE_PARAM,
> +		.name = "FD detection param",
> +		.type = V4L2_CTRL_TYPE_AIE_PARAM,
> +		.elem_size = sizeof(struct v4l2_ctrl_aie_param),
> +	},
> +};
> +
> +static int mtk_aie_ctrls_setup(struct mtk_aie_ctx *ctx)
> +{
> +	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
> +	int i;
> +
> +	v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_AIE_MAX);
> +	if (hdl->error)
> +		return hdl->error;
> +
> +	for (i = 0; i < ARRAY_SIZE(mtk_aie_controls); i++) {
> +		v4l2_ctrl_new_custom(hdl, &mtk_aie_controls[i], ctx);
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
> +static void init_ctx_fmt(struct mtk_aie_ctx *ctx)
> +{
> +	struct v4l2_pix_format_mplane *src_fmt = &ctx->src_fmt;
> +	struct v4l2_meta_format *dst_fmt = &ctx->dst_fmt;
> +
> +	/* Initialize M2M source fmt */
> +	src_fmt->width = MTK_FD_OUTPUT_MAX_WIDTH;
> +	src_fmt->height = MTK_FD_OUTPUT_MAX_HEIGHT;
> +	mtk_aie_fill_pixfmt_mp(src_fmt, &mtk_aie_img_fmts[0]);
> +
> +	/* Initialize M2M destination fmt */
> +	dst_fmt->buffersize = sizeof(struct aie_enq_info);
> +	dst_fmt->dataformat = V4L2_META_FMT_MTFD_RESULT;
> +}
> +
> +/*
> + * V4L2 file operations.
> + */
> +static int mtk_vfd_open(struct file *filp)
> +{
> +	struct mtk_aie_dev *fd = video_drvdata(filp);
> +	struct video_device *vdev = video_devdata(filp);
> +	struct mtk_aie_ctx *ctx;
> +	int ret;
> +
> +	mutex_lock(&fd->dev_lock);
> +
> +	if (fd->fd_state & STATE_OPEN) {
> +		dev_err(fd->dev, "vfd_open again");

Something like that is more readable instead:

"VFD is already open. Only one instance is supported."

...the message might be wrong, reiterate as needed, but just make it meaningful.

> +		ret =  -EBUSY;
> +		goto err_unlock;
> +	}
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx) {
> +		ret =  -ENOMEM;
> +		goto err_unlock;
> +	}
> +
> +	ctx->fd_dev = fd;
> +	ctx->dev = fd->dev;
> +	fd->ctx = ctx;
> +
> +	v4l2_fh_init(&ctx->fh, vdev);
> +	filp->private_data = &ctx->fh;
> +
> +	init_ctx_fmt(ctx);
> +
> +	ret = mtk_aie_ctrls_setup(ctx);
> +	if (ret) {
> +		dev_err(ctx->dev, "Failed to set up controls:%d\n", ret);

missing space....

controls:<space>%d

> +		goto err_fh_exit;
> +	}
> +	ctx->fh.m2m_ctx =
> +		v4l2_m2m_ctx_init(fd->m2m_dev, ctx, &mtk_aie_queue_init);

one line is ok

> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto err_free_ctrl_handler;
> +	}
> +	v4l2_fh_add(&ctx->fh);
> +	fd->fd_state |= STATE_OPEN;
> +
> +	mutex_unlock(&fd->dev_lock);
> +
> +	return 0;
> +err_free_ctrl_handler:
> +	v4l2_ctrl_handler_free(&ctx->hdl);
> +err_fh_exit:
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +err_unlock:
> +	mutex_unlock(&fd->dev_lock);
> +
> +	return ret;
> +}
> +
> +static int mtk_vfd_release(struct file *filp)
> +{
> +	struct mtk_aie_ctx *ctx =
> +		container_of(filp->private_data, struct mtk_aie_ctx, fh);
> +	struct mtk_aie_dev *fd = video_drvdata(filp);
> +
> +	mutex_lock(&fd->dev_lock);
> +
> +	fd->fd_state &= ~STATE_OPEN;
> +
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->hdl);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +
> +	kfree(ctx);
> +
> +	mutex_unlock(&fd->dev_lock);
> +
> +	return 0;
> +}
> +
> +static __poll_t mtk_vfd_fop_poll(struct file *file, poll_table *wait)
> +{
> +	struct mtk_aie_ctx *ctx =
> +		container_of(file->private_data, struct mtk_aie_ctx, fh);
> +
> +	struct mtk_aie_dev *fd = ctx->fd_dev;
> +
> +	if (fd->fd_state & STATE_INIT) {
> +		if (!mtk_aie_job_wait_finish(ctx->fd_dev)) {
> +			dev_info(ctx->dev, "wait job finish timeout from poll\n");

That's an error, not an info

> +			return EPOLLERR;
> +		}
> +	}
> +
> +	return v4l2_m2m_fop_poll(file, wait);
> +}
> +
> +static const struct v4l2_file_operations fd_video_fops = {
> +	.owner = THIS_MODULE,
> +	.open = mtk_vfd_open,
> +	.release = mtk_vfd_release,
> +	.poll = mtk_vfd_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = v4l2_m2m_fop_mmap,
> +};
> +
> +static int mtk_aie_job_ready(void *priv)
> +{
> +	struct mtk_aie_ctx *ctx = priv;
> +	struct mtk_aie_dev *fd = ctx->fd_dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct fd_buffer src_img[2] = {};
> +	void *plane_vaddr;
> +	int ret = 1;

Don't initialize ret, you are rewriting it in this function.

> +
> +	if (!ctx->fh.m2m_ctx) {
> +		dev_err(fd->dev, "Memory-to-memory context is NULL\n");
> +		return 0;

Please follow what everyone does in the kernel in the vast majority of the cases.

Return a negative number for error, or zero for success.

> +	}
> +
> +	if (!(fd->fd_state & STATE_OPEN)) {
> +		dev_err(fd->dev, "%s fd state fail: %d\n", __func__, fd->fd_state);

Say something about "job ready with device closed", as that is what the error is
about. Just be descriptive in your error messages, otherwise debugging is going to
become an even-more-tedious process.

> +		return 0;
> +	}
> +
> +	mutex_lock(&fd->fd_lock);
> +
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	if (!src_buf || !dst_buf) {
> +		dev_err(fd->dev, "src or dst buf is NULL\n");
> +		ret = 0;
> +		goto err_unlock;
> +	}
> +
> +	if (!(fd->fd_state & STATE_INIT)) {
> +		dev_err(fd->dev, "%s fd state fail: %d\n", __func__, fd->fd_state);
> +		ret = 0;
> +		goto err_unlock;
> +	}
> +
> +	plane_vaddr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> +	if (!plane_vaddr) {
> +		dev_err(fd->dev, "Failed to get plane virtual address\n");
> +		ret = 0;
> +		goto err_unlock;
> +	}
> +
> +	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
> +
> +	fd->aie_cfg = (struct aie_enq_info *)plane_vaddr;
> +
> +	memset(fd->aie_cfg, 0, sizeof(struct aie_enq_info));
> +
> +	memcpy(fd->aie_cfg, &ctx->user_param, sizeof(struct v4l2_ctrl_aie_param));
> +
> +	if (fd->variant->fld_enable) {
> +		fd->aie_cfg->fld_face_num = ctx->user_param.fld_face_num;
> +		memcpy(fd->aie_cfg->fld_input,
> +		       ctx->user_param.fld_input,
> +		       FLD_MAX_FRAME * sizeof(struct fld_crop_rip_rop)
> +		);
> +	}
> +
> +	src_img[0].dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +
> +	if (ctx->src_fmt.num_planes == 2) {
> +		src_img[1].dma_addr =
> +			vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);
> +	}
> +
> +	if ((fd->aie_cfg->sel_mode == FDMODE || fd->aie_cfg->sel_mode == ATTRIBUTEMODE) &&
> +	    fd->aie_cfg->src_img_fmt == FMT_YUV420_1P) {
> +		src_img[1].dma_addr =
> +			src_img[0].dma_addr +
> +			ctx->user_param.src_img_stride *
> +			ctx->user_param.src_img_height;
> +	}
> +
> +	fd->aie_cfg->src_img_addr = src_img[0].dma_addr;
> +	fd->aie_cfg->src_img_addr_uv = src_img[1].dma_addr;
> +
> +	aie_prepare(fd, fd->aie_cfg);
> +
> +err_unlock:
> +	mutex_unlock(&fd->fd_lock);
> +
> +	if (src_buf) {
> +		/* Complete request controls if any */
> +		v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
> +	}
> +

if (ret)
	return ret;

return 0;

> +	return ret;
> +}
> +
> +static void mtk_aie_device_run(void *priv)
> +{
> +	struct mtk_aie_ctx *ctx = priv;
> +	struct mtk_aie_dev *fd = ctx->fd_dev;
> +	int ret;
> +
> +	ret = mtk_aie_job_ready(priv);
> +	if (ret != 1) {

If you used normal return convention, this would be just

	if (ret) {
		dev_err ...
		return;
	}

> +		dev_err(fd->dev, "Failed to run job ready\n");
> +		return;
> +	}
> +
> +	atomic_inc(&fd->num_composing);
> +	mtk_aie_hw_job_exec(fd);
> +	aie_execute(fd, fd->aie_cfg);
> +}
> +
> +static struct v4l2_m2m_ops fd_m2m_ops = {
> +	.device_run = mtk_aie_device_run,
> +};
> +
> +static const struct media_device_ops fd_m2m_media_ops = {
> +	.req_validate = vb2_request_validate,
> +	.req_queue = v4l2_m2m_request_queue,
> +};
> +
> +static int mtk_aie_video_device_register(struct mtk_aie_dev *fd)
> +{
> +	struct video_device *vfd = &fd->vfd;
> +	struct v4l2_m2m_dev *m2m_dev = fd->m2m_dev;
> +	struct device *dev = fd->dev;
> +	int ret;
> +
> +	vfd->fops = &fd_video_fops;
> +	vfd->release = video_device_release_empty;
> +	vfd->lock = &fd->vfd_lock;
> +	vfd->v4l2_dev = &fd->v4l2_dev;
> +	vfd->vfl_dir = VFL_DIR_M2M;
> +	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +			   V4L2_CAP_META_CAPTURE;
> +	vfd->ioctl_ops = &mtk_aie_v4l2_video_out_ioctl_ops;
> +
> +	strscpy(vfd->name, dev_driver_string(dev), sizeof(vfd->name));
> +
> +	video_set_drvdata(vfd, fd);
> +
> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to register video device\n");
> +		goto err_free_dev;

you're not freeing anything for real, so you can just "return ret" here.

> +	}
> +
> +	ret = v4l2_m2m_register_media_controller(m2m_dev, vfd, MEDIA_ENT_F_PROC_VIDEO_STATISTICS);
> +	if (ret) {
> +		dev_err(dev, "Failed to init mem2mem media controller\n");

You don't need this goto.

		video_unregister_device(fd);
		return ret;

> +		goto err_unreg_video;
> +	}
> +
> +	return 0;
> +
> +err_unreg_video:
> +	video_unregister_device(vfd);
> +err_free_dev:
> +	return ret;
> +}
> +


..snip..

> +
> +static int mtk_aie_resource_init(struct mtk_aie_dev *fd)
> +{
> +	int ret = 0;

int ret;

> +
> +	mutex_init(&fd->vfd_lock);
> +	mutex_init(&fd->dev_lock);
> +	mutex_init(&fd->fd_lock);
> +
> +	init_completion(&fd->fd_job_finished);
> +	complete_all(&fd->fd_job_finished);
> +	INIT_DELAYED_WORK(&fd->job_timeout_work, mtk_aie_job_timeout_work);
> +	init_waitqueue_head(&fd->flushing_waitq);
> +	atomic_set(&fd->num_composing, 0);
> +	fd->fd_stream_count = 0;
> +
> +	fd->frame_done_wq = alloc_ordered_workqueue(dev_name(fd->dev),
> +						    WQ_HIGHPRI | WQ_FREEZABLE);
> +	if (!fd->frame_done_wq) {
> +		dev_err(fd->dev, "failed to alloc frame_done workqueue\n");
> +		mutex_destroy(&fd->vfd_lock);
> +		mutex_destroy(&fd->dev_lock);
> +		mutex_destroy(&fd->fd_lock);
> +		return -ENOMEM;
> +	}
> +
> +	INIT_WORK(&fd->req_work.work, mtk_aie_frame_done_worker);
> +	fd->req_work.fd_dev = fd;
> +

	return 0;

> +	return ret;
> +}
> +
> +static void mtk_aie_resource_free(struct platform_device *pdev)
> +{
> +	struct mtk_aie_dev *fd = dev_get_drvdata(&pdev->dev);
> +
> +	if (fd->frame_done_wq)
> +		destroy_workqueue(fd->frame_done_wq);
> +	fd->frame_done_wq = NULL;
> +	mutex_destroy(&fd->vfd_lock);
> +	mutex_destroy(&fd->dev_lock);
> +	mutex_destroy(&fd->fd_lock);
> +}
> +
> +static irqreturn_t mtk_aie_irq(int irq, void *data)
> +{
> +	struct mtk_aie_dev *fd = (struct mtk_aie_dev *)data;
> +
> +	aie_irqhandle(fd);
> +
> +	queue_work(fd->frame_done_wq, &fd->req_work.work);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_aie_probe(struct platform_device *pdev)
> +{
> +	struct mtk_aie_dev *fd;
> +	struct device *dev = &pdev->dev;
> +	int irq;
> +	int ret;
> +
> +	static struct clk_bulk_data aie_clks[] = {
> +		{ .id = "img_ipe" },
> +		{ .id = "ipe_fdvt" },
> +		{ .id = "ipe_top" },
> +		{ .id = "ipe_smi_larb12" },
> +	};
> +
> +	fd = devm_kzalloc(&pdev->dev, sizeof(*fd), GFP_KERNEL);
> +	if (!fd)
> +		return -ENOMEM;
> +
> +	fd->variant = mtk_aie_get_variant(dev);
> +	if (!fd->variant)
> +		return -ENODEV;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));

	if (ret)
		return dev_err_probe(dev, ret, "Cannot set Coherent DMA mask\n");

> +	if (ret) {
> +		dev_err(dev, "%s: No suitable DMA available\n", __func__);
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(dev, fd);
> +	fd->dev = dev;
> +
> +	irq = platform_get_irq(pdev, 0);

if (irq < 0)
	return dev_err_probe(dev, irq, "Failed to get IRQ\n");

> +	if (irq < 0) {
> +		dev_err(dev, "Failed to get irq by platform: %d\n", irq);
> +		return irq;
> +	}
> +
> +	ret = devm_request_irq(dev, irq, mtk_aie_irq, IRQF_SHARED,
> +			       dev_driver_string(dev), fd);

	if (ret)
		return dev_err_probe(dev, ret, "Failed to request IRQ\n");

....The other two dev_err_probe conversions are an exercise for the reader :-)

> +	if (ret) {
> +		dev_err(dev, "Failed to request irq\n");
> +		return ret;
> +	}
> +	fd->irq = irq;
> +
> +	fd->fd_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(fd->fd_base)) {
> +		dev_err(dev, "Failed to get fd reg base\n");
> +		return PTR_ERR(fd->fd_base);
> +	}
> +
> +	fd->aie_clk.clk_num = ARRAY_SIZE(aie_clks);
> +	fd->aie_clk.clks = aie_clks;
> +	ret = devm_clk_bulk_get(&pdev->dev, fd->aie_clk.clk_num, fd->aie_clk.clks);
> +	if (ret) {
> +		dev_err(dev, "failed to get raw clock:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mtk_aie_resource_init(fd);
> +	if (ret)
> +		goto err_free;
> +	pm_runtime_enable(dev);
> +	ret = mtk_aie_dev_v4l2_init(fd);
> +	if (ret)
> +		goto err_pm;
> +
> +	return 0;
> +
> +err_pm:
> +	pm_runtime_disable(&pdev->dev);
> +err_free:
> +	mtk_aie_resource_free(pdev);
> +
> +	return ret;
> +}
> +
> +

..snip..

> +static const struct mtk_aie_variant *mtk_aie_get_variant(struct device *dev)
> +{
> +	const struct mtk_aie_variant *driver_data = NULL;
> +	const struct of_device_id *match = NULL;
> +

You can just write the exact same in mtk_aie_probe(), you don't need this function.

> +	match = of_match_node(mtk_aie_of_ids, dev->of_node);
> +
> +	if (match)
> +		driver_data = (const struct mtk_aie_variant *)match->data;
> +
> +	return driver_data;
> +}
> +
> +static struct platform_driver mtk_aie_driver = {
> +	.probe = mtk_aie_probe,
> +	.remove = mtk_aie_remove,
> +	.driver = {
> +		.name = "mtk-aie-5.3",
> +		.of_match_table = mtk_aie_of_ids,
> +		.pm = pm_ptr(&mtk_aie_pm_ops),
> +	}
> +};
> +
> +module_platform_driver(mtk_aie_driver);
> +MODULE_AUTHOR("Fish Wu <fish.wu@mediatek.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("MediaTek AIE driver");
> diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_drv.c b/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> new file mode 100644
> index 000000000000..8b167ff6f439
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> @@ -0,0 +1,3545 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Fish Wu <fish.wu@mediatek.com>
> + */
> +
> +#include <linux/firmware.h>
> +#include <linux/mtk_aie_v4l2_controls.h>
> +
> +#include "mtk_aie.h"
> +
> +static const unsigned int fd_wdma_en[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {

Are those not HW version agnostic?

I'd move those in a mt8196-aie.h (or choose another name, it's fine) header
instead, so that this driver gets setup for flexibility.

> +	{ 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 0, 1, 0 }, { 1, 0, 0, 0 },
> +	{ 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 },
> +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 },
> +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
> +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 },
> +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
> +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 0, 1, 0 },
> +	{ 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 0, 0, 0 },
> +	{ 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 },
> +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 },
> +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 },
> +	{ 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
> +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 },
> +	{ 1, 0, 1, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 },
> +	{ 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
> +	{ 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> +	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
> +	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
> +	{ 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
> +	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }
> +};
> +

..snip..

> +
> +static int aie_imem_alloc(struct mtk_aie_dev *fd, u32 size,
> +			  struct imem_buf_info *bufinfo)
> +{
> +	struct device *dev = fd->dev;
> +	void *va;
> +	dma_addr_t dma_handle = 0;
> +
> +	if (size == 0) {
> +		dev_dbg(fd->dev, "%s: size(%d)\n", __func__, size);
> +		return -EINVAL;
> +	}
> +
> +	fd->fd_mem_size += size;
> +
> +	va = dma_alloc_coherent(dev, size, &dma_handle, GFP_KERNEL);
> +	if (!va || dma_handle == 0)
> +		return -ENOMEM;
> +
> +	bufinfo->va = va;
> +	bufinfo->pa = dma_handle;
> +	bufinfo->size = size;
> +
> +	dev_dbg(fd->dev, "%s: vAddr(0x%p) pAddr(0x%pad) size(%d)\n",

Please avoid printing physical addresses unless that is **extremely** necessary.

> +		__func__, va, &dma_handle, size);
> +
> +	return 0;
> +}
> +
> +static void aie_imem_free(struct mtk_aie_dev *fd, struct imem_buf_info *bufinfo)
> +{
> +	dev_dbg(fd->dev,
> +		"%s: vAddr(0x%p) pAddr(0x%pad) size(%d)\n",

Same here.

> +		__func__, bufinfo->va, &bufinfo->pa, bufinfo->size);
> +
> +	if (bufinfo->va)
> +		dma_free_coherent(fd->dev, bufinfo->size,
> +				  bufinfo->va, bufinfo->pa);
> +}
> +
> +static void aie_init_table(struct mtk_aie_dev *fd, u16 pym_width,
> +			   u16 pym_height)

aie_update_table() seems to be doing the same thing as this function.

Please don't add duplicate functions.

> +{
> +	int i = 0;
> +	struct aie_static_info *pstv = &fd->st_info;
> +
> +	pstv->inf_elm[PYM2_START_LOOP].img_width = pym_width / 4;
> +	pstv->inf_elm[PYM2_START_LOOP].img_height = pym_height / 4;
> +
> +	pstv->inf_elm[PYM1_START_LOOP].img_width = pym_width / 2;
> +	pstv->inf_elm[PYM1_START_LOOP].img_height = pym_height / 2;
> +
> +	pstv->inf_elm[PYM0_START_LOOP].img_width = pym_width;
> +	pstv->inf_elm[PYM0_START_LOOP].img_height = pym_height;
> +
> +	for (i = 0; i < FD_LOOP_NUM; i++) {
> +		if (i != PYM2_START_LOOP && i != PYM1_START_LOOP && i != PYM0_START_LOOP) {
> +			if (fd_out_stride2_in[i] == 1) {
> +				pstv->inf_elm[i].img_width =
> +					pstv->inf_elm[i - 1].stride2_out_width;
> +				pstv->inf_elm[i].img_height =
> +					pstv->inf_elm[i - 1].stride2_out_height;
> +			} else {
> +				pstv->inf_elm[i].img_width =
> +					pstv->inf_elm[i - 1].out_width;
> +				pstv->inf_elm[i].img_height =
> +					pstv->inf_elm[i - 1].out_height;
> +			}
> +		}
> +
> +		if (fd_maxpool[i] == 1 && fd_stride[i] == 1) {
> +			pstv->inf_elm[i].out_width =
> +				(pstv->inf_elm[i].img_width - 1) / (2 * fd_maxpool[i]) + 1;
> +			pstv->inf_elm[i].out_height =
> +				(pstv->inf_elm[i].img_height - 1) / (2 * fd_maxpool[i]) + 1;
> +		} else {
> +			pstv->inf_elm[i].out_width =
> +				(pstv->inf_elm[i].img_width - 1) /
> +					(fd_stride[i] + 2 * fd_maxpool[i]) + 1;
> +			pstv->inf_elm[i].out_height =
> +				(pstv->inf_elm[i].img_height - 1) /
> +					(fd_stride[i] + 2 * fd_maxpool[i]) + 1;
> +		}
> +
> +		pstv->inf_elm[i].stride2_out_width =
> +			((pstv->inf_elm[i].out_width - 1) / 2 + 1) * out_2size[i];
> +		pstv->inf_elm[i].stride2_out_height =
> +			((pstv->inf_elm[i].out_height - 1) / 2 + 1) * out_2size[i];
> +
> +		if (outlayer[i] == 1) {
> +			pstv->inf_elm[i].out_xsize_plus_1 =
> +				pstv->inf_elm[i].out_width * out_ch_pack[i] * 2;
> +			pstv->inf_elm[i].out_stride =
> +				round_up(pstv->inf_elm[i].out_xsize_plus_1 * anchor_en_num[i], 16);
> +			pstv->inf_elm[i].out_xsize_plus_1_stride2 =
> +				((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
> +				out_ch_pack[i] * 2 * out_2size[i];
> +		} else {
> +			pstv->inf_elm[i].out_xsize_plus_1 =
> +				pstv->inf_elm[i].out_width * out_ch_pack[i];
> +			pstv->inf_elm[i].out_stride =
> +				round_up(pstv->inf_elm[i].out_xsize_plus_1, 16);
> +			pstv->inf_elm[i].out_xsize_plus_1_stride2 =
> +				((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
> +				out_ch_pack[i] * out_2size[i];
> +		}
> +
> +		pstv->inf_elm[i].out_stride_stride2 =
> +				round_up(pstv->inf_elm[i].out_xsize_plus_1_stride2, 16);
> +
> +		if (out_2size[i] == 1)
> +			pstv->inf_elm[i].out_ysize_plus_1_stride2 =
> +				(pstv->inf_elm[i].out_height - 1) / 2 + 1;
> +		else
> +			pstv->inf_elm[i].out_ysize_plus_1_stride2 =
> +				pstv->inf_elm[i].out_height;
> +
> +		if (fd_wdma_en[i][0]) {
> +			if (i == RPN2_LOOP_NUM || i == RPN1_LOOP_NUM || i == RPN0_LOOP_NUM)
> +				pstv->inf_elm[i].fd_wdma_size[0] = RESULT_SIZE;
> +			else
> +				pstv->inf_elm[i].fd_wdma_size[0] =
> +					pstv->inf_elm[i].out_height *
> +					pstv->inf_elm[i].out_stride;
> +		}
> +
> +		if (outlayer[i] == 1) {
> +			if (fd_wdma_en[i][1])
> +				pstv->inf_elm[i].fd_wdma_size[1] =
> +					pstv->inf_elm[i].fd_wdma_size[0];
> +			if (fd_wdma_en[i][2])
> +				pstv->inf_elm[i].fd_wdma_size[2] =
> +					pstv->inf_elm[i].fd_wdma_size[0];
> +			if (fd_wdma_en[i][3])
> +				pstv->inf_elm[i].fd_wdma_size[3] =
> +					pstv->inf_elm[i].fd_wdma_size[0];
> +		} else if (i == RPN2_LOOP_NUM || i == RPN1_LOOP_NUM || i == RPN0_LOOP_NUM) {
> +			pstv->inf_elm[i].fd_wdma_size[0] = RESULT_SIZE;
> +		} else {
> +			if (fd_wdma_en[i][1])
> +				pstv->inf_elm[i].fd_wdma_size[1] =
> +					pstv->inf_elm[i].out_height *
> +					pstv->inf_elm[i].out_stride;
> +			if (fd_wdma_en[i][2])
> +				pstv->inf_elm[i].fd_wdma_size[2] =
> +					pstv->inf_elm[i].out_ysize_plus_1_stride2 *
> +					pstv->inf_elm[i].out_stride_stride2;
> +			if (fd_wdma_en[i][3])
> +				pstv->inf_elm[i].fd_wdma_size[3] =
> +					pstv->inf_elm[i].out_ysize_plus_1_stride2 *
> +					pstv->inf_elm[i].out_stride_stride2;
> +		}
> +
> +		if (in_ch_pack[i] == 1)
> +			pstv->inf_elm[i].input_xsize_plus_1 =
> +				round_up(pstv->inf_elm[i].img_width, 8);
> +		else
> +			pstv->inf_elm[i].input_xsize_plus_1 =
> +				pstv->inf_elm[i].img_width * in_ch_pack[i];
> +	}
> +}
> +
> +static void aie_update_table(struct mtk_aie_dev *fd, u16 pym_width,
> +			     u16 pym_height)
> +{
> +	int i = 0;
> +	struct aie_static_info *pstv = &fd->st_info;
> +
> +	pstv->inf_elm[PYM2_START_LOOP].img_width = pym_width / 4;
> +	pstv->inf_elm[PYM2_START_LOOP].img_height = pym_height / 4;
> +
> +	pstv->inf_elm[PYM1_START_LOOP].img_width = pym_width / 2;
> +	pstv->inf_elm[PYM1_START_LOOP].img_height = pym_height / 2;
> +
> +	pstv->inf_elm[PYM0_START_LOOP].img_width = pym_width;
> +	pstv->inf_elm[PYM0_START_LOOP].img_height = pym_height;
> +
> +	for (i = 0; i < FD_LOOP_NUM; i++) {
> +		if (i != PYM2_START_LOOP && i != PYM1_START_LOOP &&
> +		    i != PYM0_START_LOOP) {
> +			if (fd_out_stride2_in[i] == 1) {
> +				pstv->inf_elm[i].img_width =
> +					pstv->inf_elm[i - 1].stride2_out_width;
> +				pstv->inf_elm[i].img_height =
> +					pstv->inf_elm[i - 1].stride2_out_height;
> +			} else {
> +				pstv->inf_elm[i].img_width =
> +					pstv->inf_elm[i - 1].out_width;
> +				pstv->inf_elm[i].img_height =
> +					pstv->inf_elm[i - 1].out_height;
> +			}
> +		}
> +
> +		if (fd_maxpool[i] == 1 && fd_stride[i] == 1) {
> +			pstv->inf_elm[i].out_width =
> +				(pstv->inf_elm[i].img_width - 1) /
> +					(2 * fd_maxpool[i]) + 1;
> +			pstv->inf_elm[i].out_height =
> +				(pstv->inf_elm[i].img_height - 1) /
> +					(2 * fd_maxpool[i]) + 1;
> +		} else {
> +			pstv->inf_elm[i].out_width =
> +				(pstv->inf_elm[i].img_width - 1) /
> +					(fd_stride[i] + 2 * fd_maxpool[i]) + 1;
> +			pstv->inf_elm[i].out_height =
> +				(pstv->inf_elm[i].img_height - 1) /
> +					(fd_stride[i] + 2 * fd_maxpool[i]) + 1;
> +		}
> +
> +		pstv->inf_elm[i].stride2_out_width =
> +			((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
> +			out_2size[i];
> +		pstv->inf_elm[i].stride2_out_height =
> +			((pstv->inf_elm[i].out_height - 1) / 2 + 1) *
> +			out_2size[i];
> +
> +		if (outlayer[i] == 1) {
> +			pstv->inf_elm[i].out_xsize_plus_1 =
> +				pstv->inf_elm[i].out_width *
> +				out_ch_pack[i] * 2;
> +			pstv->inf_elm[i].out_stride =
> +				round_up(pstv->inf_elm[i].out_xsize_plus_1 * anchor_en_num[i], 16);
> +			pstv->inf_elm[i].out_xsize_plus_1_stride2 =
> +				((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
> +				out_ch_pack[i] * 2 * out_2size[i];
> +		} else {
> +			pstv->inf_elm[i].out_xsize_plus_1 =
> +				pstv->inf_elm[i].out_width *
> +				out_ch_pack[i];
> +			pstv->inf_elm[i].out_stride =
> +				round_up(pstv->inf_elm[i].out_xsize_plus_1, 16);
> +			pstv->inf_elm[i].out_xsize_plus_1_stride2 =
> +				((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
> +				out_ch_pack[i] * out_2size[i];
> +		}
> +
> +		pstv->inf_elm[i].out_stride_stride2 =
> +			round_up(pstv->inf_elm[i].out_xsize_plus_1_stride2, 16);
> +
> +		if (out_2size[i] == 1)
> +			pstv->inf_elm[i].out_ysize_plus_1_stride2 =
> +				(pstv->inf_elm[i].out_height - 1) / 2 + 1;
> +		else
> +			pstv->inf_elm[i].out_ysize_plus_1_stride2 =
> +				pstv->inf_elm[i].out_height;
> +
> +		if (in_ch_pack[i] == 1)
> +			pstv->inf_elm[i].input_xsize_plus_1 =
> +				round_up(pstv->inf_elm[i].img_width, 8);
> +		else
> +			pstv->inf_elm[i].input_xsize_plus_1 =
> +				pstv->inf_elm[i].img_width * in_ch_pack[i];
> +	}
> +}


> +
> +static void aie_update_buf_params(struct mtk_aie_dev *fd, u16 max_img_width,
> +				  u16 max_img_height)
> +{
> +	u8 i, j;
> +	struct aie_static_info *pstv = &fd->st_info;

struct aie_static_info *pstv = &fd->st_info;
u8 i, j;

> +
> +	fd->base_para->max_img_width = max_img_width;
> +	fd->base_para->max_img_height = max_img_height;
> +	fd->fd_dma_max_size = 0;
> +	fd->fd_dma_rst_max_size = 0;
> +	fd->fd_fd_kernel_size = 0;
> +	fd->fd_attr_kernel_size = 0;
> +	fd->fd_attr_dma_max_size = 0;
> +	fd->fd_attr_dma_rst_max_size = 0;
> +

..snip..

> +static int aie_alloc_dram_buf(struct mtk_aie_dev *fd)
> +{

u32 alloc_size;
int ret;
u8 i;

> +	int ret;
> +	u8 i;
> +	u32 alloc_size;
> +
> +	/* RS DRAM */
> +	alloc_size = fd->fd_rs_cfg_size;
> +	dev_dbg(fd->dev, "RS CFG:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->rs_cfg_data);
> +	if (ret)
> +		goto dma_alloc_fail;
> +	/* FD MODE */
> +	fd->base_para->fd_rs_cfg_pa = fd->rs_cfg_data.pa;
> +	fd->base_para->fd_rs_cfg_va = fd->rs_cfg_data.va;
> +
> +	/* FD DRAM */
> +	alloc_size =
> +		fd->fd_fd_cfg_size + fd->attr_fd_cfg_size * MAX_ENQUE_FRAME_NUM;
> +	dev_dbg(fd->dev, "FD CFG:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_cfg_data);
> +	if (ret)
> +		goto dma_alloc_fail;
> +	/* FD MODE */
> +	fd->base_para->fd_fd_cfg_pa = fd->fd_cfg_data.pa;
> +	fd->base_para->fd_fd_cfg_va = fd->fd_cfg_data.va;
> +	/* ATTR MODE */
> +	fd->base_para->attr_fd_cfg_pa[0] =
> +		fd->base_para->fd_fd_cfg_pa + fd->fd_fd_cfg_size;
> +	fd->base_para->attr_fd_cfg_va[0] =
> +		fd->base_para->fd_fd_cfg_va + fd->fd_fd_cfg_size;
> +
> +	for (i = 1; i < MAX_ENQUE_FRAME_NUM; i++) {
> +		fd->base_para->attr_fd_cfg_pa[i] =
> +			fd->base_para->attr_fd_cfg_pa[i - 1] +
> +			fd->attr_fd_cfg_size;
> +		fd->base_para->attr_fd_cfg_va[i] =
> +			fd->base_para->attr_fd_cfg_va[i - 1] +
> +			fd->attr_fd_cfg_size;
> +	}
> +
> +	/* YUV2RGB DRAM */
> +	alloc_size = fd->fd_yuv2rgb_cfg_size +
> +		     fd->attr_yuv2rgb_cfg_size * MAX_ENQUE_FRAME_NUM;
> +	dev_dbg(fd->dev, "YUV2RGB CFG:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->yuv2rgb_cfg_data);
> +	if (ret)
> +		goto dma_alloc_fail;
> +	/* FD MODE */
> +	fd->base_para->fd_yuv2rgb_cfg_pa = fd->yuv2rgb_cfg_data.pa;
> +	fd->base_para->fd_yuv2rgb_cfg_va = fd->yuv2rgb_cfg_data.va;
> +
> +	/* ATTR MODE */
> +	fd->base_para->attr_yuv2rgb_cfg_pa[0] =
> +		fd->base_para->fd_yuv2rgb_cfg_pa + fd->fd_yuv2rgb_cfg_size;
> +	fd->base_para->attr_yuv2rgb_cfg_va[0] =
> +		fd->base_para->fd_yuv2rgb_cfg_va + fd->fd_yuv2rgb_cfg_size;
> +
> +	for (i = 1; i < MAX_ENQUE_FRAME_NUM; i++) {
> +		fd->base_para->attr_yuv2rgb_cfg_pa[i] =
> +			fd->base_para->attr_yuv2rgb_cfg_pa[i - 1] +
> +			fd->attr_yuv2rgb_cfg_size;
> +		fd->base_para->attr_yuv2rgb_cfg_va[i] =
> +			fd->base_para->attr_yuv2rgb_cfg_va[i - 1] +
> +			fd->attr_yuv2rgb_cfg_size;
> +	}
> +

return 0;

> +	return ret;


> +dma_alloc_fail:
> +	aie_imem_free(fd, &fd->fd_cfg_data);
> +	aie_imem_free(fd, &fd->rs_cfg_data);
> +
> +	return ret;
> +}
> +
> +static int aie_alloc_output_buf(struct mtk_aie_dev *fd)
> +{
	int i, j, pa_off = 0, va_off = 0;

...but are you sure that the pa_off and va_off can be negative? - 'cause otherwise:

	u32 alloc_size = 0, pa_off = 0, va_off = 0;
	int ret;

> +	int ret;
> +	u32 alloc_size = 0;
> +	int i, j, pa_off = 0, va_off = 0;
> +
> +	for (i = 0; i < PYM_NUM; i++)
> +		alloc_size += fd->rs_pym_out_size[i] * 3;
> +	dev_dbg(fd->dev, "RS OUT:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->rs_output_hw);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < PYM_NUM; i++) {
> +		for (j = 0; j < COLOR_NUM; j++) {
> +			fd->base_para->rs_pym_rst_pa[i][j] =
> +				fd->rs_output_hw.pa + pa_off;
> +			pa_off += fd->rs_pym_out_size[i];
> +
> +			fd->base_para->rs_pym_rst_va[i][j] =
> +				fd->rs_output_hw.va + va_off;
> +			va_off += fd->rs_pym_out_size[i];
> +		}
> +	}
> +

return 0;

> +	return ret;
> +}
> +
> +static void aie_alloc_normal(struct mtk_aie_dev *fd, int start, int end)
> +{

struct aie_static_info *pstv = &fd->st_info;
int i, j, pi, pj;

> +	int i, j;
> +	int pi, pj;
> +	struct aie_static_info *pstv = &fd->st_info;
> +
> +	if (start <= 0 || end <= start || end >= FD_LOOP_NUM) {
> +		dev_err(fd->dev, "%s: start = %d, end = %d\n", __func__, start, end);
> +		return;
> +	}
> +
> +	pi = start - 1;
> +	pj = 0;
> +	for (i = start; i < end + 1; i++) {
> +		for (j = 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
> +			if (fd_wdma_en[i][j]) {
> +				fd->dma_para->fd_out_hw_pa[i][j] =
> +					fd->dma_para->fd_out_hw_pa[pi][pj] +
> +					pstv->inf_elm[pi].fd_wdma_size[pj];
> +				pi = i;
> +				pj = j;
> +			}
> +		}
> +	}
> +}
> +
> +static int aie_alloc_fddma_buf(struct mtk_aie_dev *fd)
> +{
> +	int ret;
> +	u32 alloc_size;
> +
> +	alloc_size = fd->fd_dma_max_size;
> +	dev_dbg(fd->dev, "FD DMA:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_dma_hw);
> +	if (ret)
> +		goto dma_alloc_fail;

leave a blank line here please

> +	alloc_size = fd->fd_fd_kernel_size + fd->fd_attr_kernel_size;
> +	dev_dbg(fd->dev, "FD KERNEL:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_kernel_hw);
> +	if (ret)
> +		goto dma_alloc_fail;

does it really make sense to free memory that was never allocated?! :-)

> +
> +	alloc_size = fd->fd_attr_dma_max_size;
> +	dev_dbg(fd->dev, "ATTR DMA:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_attr_dma_hw);
> +	if (ret)
> +		goto dma_alloc_fail;
> +
> +	alloc_size = fd->fd_dma_rst_max_size + fd->fd_attr_dma_rst_max_size;
> +	dev_dbg(fd->dev, "RESULT DMA:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_dma_result_hw);
> +	if (ret)
> +		goto dma_alloc_fail;
> +
> +	return 0;
> +
> +dma_alloc_fail:
> +	aie_imem_free(fd, &fd->fd_attr_dma_hw);
> +	aie_imem_free(fd, &fd->fd_kernel_hw);
> +	aie_imem_free(fd, &fd->fd_dma_hw);
> +
> +	return ret;
> +}
> +
> +static int aie_alloc_fld_buf(struct mtk_aie_dev *fd)
> +{
> +	int ret;
> +	u32 alloc_size;
> +
> +	alloc_size = fd->fld_step_size;
> +	dev_dbg(fd->dev, "FLD STEP:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_fld_step_data);
> +	if (ret)
> +		return ret;
> +
> +	alloc_size = fd->fld_out_size;
> +	dev_dbg(fd->dev, "FLD OUT:");
> +	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_fld_out_hw);
> +	if (ret)
> +		goto fld_step;
> +
> +	return 0;
> +fld_step:
> +	aie_imem_free(fd, &fd->fd_fld_step_data);
> +
> +	return ret;
> +}
> +
> +static void aie_arrange_fddma_buf(struct mtk_aie_dev *fd)
> +{
> +	void *current_va;
> +	dma_addr_t current_pa;
> +	struct aie_static_info *pstv = &fd->st_info;
> +	u8 i = 0, j = 0;
> +

Wow, that's a *really* unreadable function.

Can you find any way to make it at least barely readable?

> +	/* 0~18 */
> +	fd->dma_para->fd_out_hw_pa[0][0] = fd->fd_dma_hw.pa;
> +	aie_alloc_normal(fd, 1, 18);
> +
> +	/* 19~27 */
> +	fd->dma_para->fd_out_hw_pa[19][0] =
> +		fd->dma_para->fd_out_hw_pa[18][1] +
> +		pstv->inf_elm[18].fd_wdma_size[1];
> +	fd->dma_para->fd_out_hw_pa[19][1] =
> +		fd->dma_para->fd_out_hw_pa[19][0] +
> +		pstv->inf_elm[19].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[20][0] =
> +		fd->dma_para->fd_out_hw_pa[19][0] +
> +		2 * pstv->inf_elm[20].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[20][1] =
> +		fd->dma_para->fd_out_hw_pa[19][0] +
> +		3 * pstv->inf_elm[20].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[21][0] =
> +		fd->dma_para->fd_out_hw_pa[19][0] +
> +		4 * pstv->inf_elm[21].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[22][0] =
> +		fd->dma_para->fd_out_hw_pa[19][0] +
> +		pstv->inf_elm[19].fd_wdma_size[0] +
> +		pstv->inf_elm[19].fd_wdma_size[1] +
> +		pstv->inf_elm[20].fd_wdma_size[0] +
> +		pstv->inf_elm[20].fd_wdma_size[1] +
> +		pstv->inf_elm[21].fd_wdma_size[0];
> +	fd->dma_para->fd_out_hw_pa[22][1] =
> +		fd->dma_para->fd_out_hw_pa[22][0] +
> +		pstv->inf_elm[22].fd_wdma_size[0] +
> +		pstv->inf_elm[22].fd_wdma_size[2] +
> +		pstv->inf_elm[23].fd_wdma_size[0];
> +	fd->dma_para->fd_out_hw_pa[22][2] =
> +		fd->dma_para->fd_out_hw_pa[22][0] +
> +		pstv->inf_elm[22].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[22][3] =
> +		fd->dma_para->fd_out_hw_pa[22][1] +
> +		pstv->inf_elm[22].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[23][0] =
> +		fd->dma_para->fd_out_hw_pa[22][0] +
> +		2 * pstv->inf_elm[23].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[23][1] =
> +		fd->dma_para->fd_out_hw_pa[22][1] +
> +		2 * pstv->inf_elm[23].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[23][2] =
> +		fd->dma_para->fd_out_hw_pa[22][0] +
> +		3 * pstv->inf_elm[23].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[23][3] =
> +		fd->dma_para->fd_out_hw_pa[22][1] +
> +		3 * pstv->inf_elm[23].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[24][0] =
> +		fd->dma_para->fd_out_hw_pa[22][0] +
> +		4 * pstv->inf_elm[24].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[24][1] =
> +		fd->dma_para->fd_out_hw_pa[22][1] +
> +		4 * pstv->inf_elm[24].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[25][0] =
> +		fd->dma_para->fd_out_hw_pa[22][1] +
> +		pstv->inf_elm[22].fd_wdma_size[1] +
> +		pstv->inf_elm[22].fd_wdma_size[3] +
> +		pstv->inf_elm[23].fd_wdma_size[1] +
> +		pstv->inf_elm[23].fd_wdma_size[3] +
> +		pstv->inf_elm[24].fd_wdma_size[1];
> +	fd->dma_para->fd_out_hw_pa[25][1] =
> +		fd->dma_para->fd_out_hw_pa[25][0] +
> +		pstv->inf_elm[25].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[26][0] =
> +		fd->dma_para->fd_out_hw_pa[25][0] +
> +		2 * pstv->inf_elm[26].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[26][1] =
> +		fd->dma_para->fd_out_hw_pa[25][0] +
> +		3 * pstv->inf_elm[26].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[27][0] =
> +		fd->dma_para->fd_out_hw_pa[25][0] +
> +		4 * pstv->inf_elm[27].out_xsize_plus_1;
> +
> +	/* 29~47 */
> +	fd->dma_para->fd_out_hw_pa[29][0] =
> +		fd->dma_para->fd_out_hw_pa[25][0] +
> +		pstv->inf_elm[25].fd_wdma_size[0] +
> +		pstv->inf_elm[25].fd_wdma_size[1] +
> +		pstv->inf_elm[26].fd_wdma_size[0] +
> +		pstv->inf_elm[26].fd_wdma_size[1] +
> +		pstv->inf_elm[27].fd_wdma_size[0];
> +	aie_alloc_normal(fd, 30, 47);
> +
> +	/* 48~56 */
> +	fd->dma_para->fd_out_hw_pa[48][0] =
> +		fd->dma_para->fd_out_hw_pa[47][1] +
> +		pstv->inf_elm[47].fd_wdma_size[1];
> +	fd->dma_para->fd_out_hw_pa[48][1] =
> +		fd->dma_para->fd_out_hw_pa[48][0] +
> +		pstv->inf_elm[48].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[49][0] =
> +		fd->dma_para->fd_out_hw_pa[48][0] +
> +		2 * pstv->inf_elm[49].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[49][1] =
> +		fd->dma_para->fd_out_hw_pa[48][0] +
> +		3 * pstv->inf_elm[49].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[50][0] =
> +		fd->dma_para->fd_out_hw_pa[48][0] +
> +		4 * pstv->inf_elm[50].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[51][0] =
> +		fd->dma_para->fd_out_hw_pa[48][0] +
> +		pstv->inf_elm[48].fd_wdma_size[0] +
> +		pstv->inf_elm[48].fd_wdma_size[1] +
> +		pstv->inf_elm[49].fd_wdma_size[0] +
> +		pstv->inf_elm[49].fd_wdma_size[1] +
> +		pstv->inf_elm[50].fd_wdma_size[0];
> +	fd->dma_para->fd_out_hw_pa[51][1] =
> +		fd->dma_para->fd_out_hw_pa[51][0] +
> +		pstv->inf_elm[51].fd_wdma_size[0] +
> +		pstv->inf_elm[51].fd_wdma_size[2] +
> +		pstv->inf_elm[52].fd_wdma_size[0] +
> +		pstv->inf_elm[52].fd_wdma_size[2] +
> +		pstv->inf_elm[53].fd_wdma_size[0];
> +	fd->dma_para->fd_out_hw_pa[51][2] =
> +		fd->dma_para->fd_out_hw_pa[51][0] +
> +		pstv->inf_elm[51].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[51][3] =
> +		fd->dma_para->fd_out_hw_pa[51][1] +
> +		pstv->inf_elm[51].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[52][0] =
> +		fd->dma_para->fd_out_hw_pa[51][0] +
> +		2 * pstv->inf_elm[52].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[52][1] =
> +		fd->dma_para->fd_out_hw_pa[51][1] +
> +		2 * pstv->inf_elm[52].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[52][2] =
> +		fd->dma_para->fd_out_hw_pa[51][0] +
> +		3 * pstv->inf_elm[52].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[52][3] =
> +		fd->dma_para->fd_out_hw_pa[51][1] +
> +		3 * pstv->inf_elm[52].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[53][0] =
> +		fd->dma_para->fd_out_hw_pa[51][0] +
> +		4 * pstv->inf_elm[53].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[53][1] =
> +		fd->dma_para->fd_out_hw_pa[51][1] +
> +		4 * pstv->inf_elm[53].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[54][0] =
> +		fd->dma_para->fd_out_hw_pa[51][1] +
> +		pstv->inf_elm[51].fd_wdma_size[1] +
> +		pstv->inf_elm[51].fd_wdma_size[3] +
> +		pstv->inf_elm[52].fd_wdma_size[1] +
> +		pstv->inf_elm[52].fd_wdma_size[3] +
> +		pstv->inf_elm[53].fd_wdma_size[1];
> +	fd->dma_para->fd_out_hw_pa[54][1] =
> +		fd->dma_para->fd_out_hw_pa[54][0] +
> +		pstv->inf_elm[54].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[55][0] =
> +		fd->dma_para->fd_out_hw_pa[54][0] +
> +		2 * pstv->inf_elm[55].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[55][1] =
> +		fd->dma_para->fd_out_hw_pa[54][0] +
> +		3 * pstv->inf_elm[55].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[56][0] =
> +		fd->dma_para->fd_out_hw_pa[54][0] +
> +		4 * pstv->inf_elm[56].out_xsize_plus_1;
> +
> +	/* 58~76 */
> +	fd->dma_para->fd_out_hw_pa[58][0] =
> +		fd->dma_para->fd_out_hw_pa[54][0] +
> +		pstv->inf_elm[54].fd_wdma_size[0] +
> +		pstv->inf_elm[54].fd_wdma_size[1] +
> +		pstv->inf_elm[55].fd_wdma_size[0] +
> +		pstv->inf_elm[55].fd_wdma_size[1] +
> +		pstv->inf_elm[56].fd_wdma_size[0];
> +	aie_alloc_normal(fd, 59, 76);
> +
> +	/* 77~85 */
> +	fd->dma_para->fd_out_hw_pa[77][0] =
> +		fd->dma_para->fd_out_hw_pa[76][1] +
> +		pstv->inf_elm[76].fd_wdma_size[1];
> +	fd->dma_para->fd_out_hw_pa[77][1] =
> +		fd->dma_para->fd_out_hw_pa[77][0] +
> +		pstv->inf_elm[77].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[78][0] =
> +		fd->dma_para->fd_out_hw_pa[77][0] +
> +		2 * pstv->inf_elm[78].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[78][1] =
> +		fd->dma_para->fd_out_hw_pa[77][0] +
> +		3 * pstv->inf_elm[78].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[79][0] =
> +		fd->dma_para->fd_out_hw_pa[77][0] +
> +		4 * pstv->inf_elm[79].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[80][0] =
> +		fd->dma_para->fd_out_hw_pa[77][0] +
> +		pstv->inf_elm[77].fd_wdma_size[0] +
> +		pstv->inf_elm[77].fd_wdma_size[1] +
> +		pstv->inf_elm[78].fd_wdma_size[0] +
> +		pstv->inf_elm[78].fd_wdma_size[1] +
> +		pstv->inf_elm[79].fd_wdma_size[0];
> +	fd->dma_para->fd_out_hw_pa[80][1] =
> +		fd->dma_para->fd_out_hw_pa[80][0] +
> +		pstv->inf_elm[80].fd_wdma_size[0] +
> +		pstv->inf_elm[80].fd_wdma_size[2] +
> +		pstv->inf_elm[81].fd_wdma_size[0] +
> +		pstv->inf_elm[81].fd_wdma_size[2] +
> +		pstv->inf_elm[82].fd_wdma_size[0];
> +	fd->dma_para->fd_out_hw_pa[80][2] =
> +		fd->dma_para->fd_out_hw_pa[80][0] +
> +		pstv->inf_elm[80].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[80][3] =
> +		fd->dma_para->fd_out_hw_pa[80][1] +
> +		pstv->inf_elm[80].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[81][0] =
> +		fd->dma_para->fd_out_hw_pa[80][0] +
> +		2 * pstv->inf_elm[81].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[81][1] =
> +		fd->dma_para->fd_out_hw_pa[80][1] +
> +		2 * pstv->inf_elm[81].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[81][2] =
> +		fd->dma_para->fd_out_hw_pa[80][0] +
> +		3 * pstv->inf_elm[81].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[81][3] =
> +		fd->dma_para->fd_out_hw_pa[80][1] +
> +		3 * pstv->inf_elm[81].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[82][0] =
> +		fd->dma_para->fd_out_hw_pa[80][0] +
> +		4 * pstv->inf_elm[82].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[82][1] =
> +		fd->dma_para->fd_out_hw_pa[80][1] +
> +		4 * pstv->inf_elm[82].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[83][0] =
> +		fd->dma_para->fd_out_hw_pa[80][1] +
> +		pstv->inf_elm[80].fd_wdma_size[1] +
> +		pstv->inf_elm[80].fd_wdma_size[3] +
> +		pstv->inf_elm[81].fd_wdma_size[1] +
> +		pstv->inf_elm[81].fd_wdma_size[3] +
> +		pstv->inf_elm[82].fd_wdma_size[1];
> +	fd->dma_para->fd_out_hw_pa[83][1] =
> +		fd->dma_para->fd_out_hw_pa[83][0] +
> +		pstv->inf_elm[83].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[84][0] =
> +		fd->dma_para->fd_out_hw_pa[83][0] +
> +		2 * pstv->inf_elm[84].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[84][1] =
> +		fd->dma_para->fd_out_hw_pa[83][0] +
> +		3 * pstv->inf_elm[84].out_xsize_plus_1;
> +	fd->dma_para->fd_out_hw_pa[85][0] =
> +		fd->dma_para->fd_out_hw_pa[83][0] +
> +		4 * pstv->inf_elm[85].out_xsize_plus_1;
> +
> +	/* VA : except 28, 57, 86 */
> +	/* 0~86 */
> +	fd->dma_para->fd_out_hw_va[0][0] = fd->fd_dma_hw.va;
> +	for (i = 1; i < FD_LOOP_NUM; i++) {
> +		if (i == RPN2_LOOP_NUM || i == RPN1_LOOP_NUM ||
> +		    i == RPN0_LOOP_NUM)
> +			continue;
> +		for (j = 0; j < 4; j++) {
> +			if (fd_wdma_en[i][j]) {
> +				fd->dma_para->fd_out_hw_va[i][j] =
> +					fd->fd_dma_hw.va +
> +					fd->dma_para->fd_out_hw_pa[i][j] -
> +					fd->fd_dma_hw.pa;
> +			}
> +		}
> +	}
> +
> +	current_pa = fd->dma_para->fd_out_hw_pa[83][0] +
> +		    pstv->inf_elm[83].fd_wdma_size[0] +
> +		    pstv->inf_elm[83].fd_wdma_size[1] +
> +		    pstv->inf_elm[84].fd_wdma_size[0] +
> +		    pstv->inf_elm[84].fd_wdma_size[1] +
> +		    pstv->inf_elm[85].fd_wdma_size[0];
> +	current_va = fd->dma_para->fd_out_hw_va[83][0] +
> +		    pstv->inf_elm[83].fd_wdma_size[0] +
> +		    pstv->inf_elm[83].fd_wdma_size[1] +
> +		    pstv->inf_elm[84].fd_wdma_size[0] +
> +		    pstv->inf_elm[84].fd_wdma_size[1] +
> +		    pstv->inf_elm[85].fd_wdma_size[0];
> +
> +	dev_dbg(fd->dev, "%s: current VA = %p PA = 0x%pad\n",
> +		__func__, current_va, &current_pa);
> +}
> +

..snip..


> +static void aie_arrange_result_dma_buf(struct mtk_aie_dev *fd)
> +{
> +	void *currentresult_va;
> +	dma_addr_t currentresult_pa;
> +	u8 i;
> +	struct aie_static_info *pstv = &fd->st_info;
> +

This is more readable, but still not really readable... I'm sure you can work
out some helper functions to stop the duplication and increase readability.


> +	currentresult_pa = fd->fd_dma_result_hw.pa;
> +	currentresult_va = fd->fd_dma_result_hw.va;
> +
> +	fd->dma_para->fd_out_hw_pa[RPN2_LOOP_NUM][0] = currentresult_pa;
> +	fd->dma_para->fd_out_hw_va[RPN2_LOOP_NUM][0] = currentresult_va;


..snip..

> +
> +static void aie_update_fddma_buf(struct mtk_aie_dev *fd)
> +{
> +	struct aie_static_info *pstv = &fd->st_info;
> +	u8 i, j;

....and this is also impossible to read....

> +
> +	/* 19~27 */
> +	fd->dma_para->fd_out_hw_pa[19][0] =
> +		fd->dma_para->fd_out_hw_pa[18][1] +
> +		pstv->inf_elm[18].fd_wdma_size[1];

...snip...


> +}
> +

..snip..


> +
> +static int aie_load_fw(struct mtk_aie_dev *fd)
> +{
> +	u8 i, j;
> +	int ret;
> +	char name[128] = {};
> +	char *sel_folder;
> +	char *mp_fw30_folder = "aie_mp_fw";
> +	char *mp_fw31_folder = "aie_mp_fw31";
> +
> +	if (fd->variant->hw_version == 30)
> +		sel_folder = mp_fw30_folder;

Just format the folder name dynamically at this point... otherwise we're getting
a branch for each number ... which will grow uncontrollably :-)

char aie_fw_folder[13]

aie_fw_folder = snprintf( .... )

> +	else if (fd->variant->hw_version == 31)
> +		sel_folder = mp_fw31_folder;
> +	else
> +		return -EINVAL;
> +

Anyway, if you enclose this

       vvvvvvvv

> +	ret = sprintf(name, "%s/config/aie_fd_fd_config.bin", sel_folder);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aie_copy_fw(fd,
> +			  name,
> +			  fd->base_para->fd_fd_cfg_va,
> +			  fd->fd_fd_cfg_size
> +		);
> +	if (ret)
> +		return ret;

  ^^^^^^^^^^^^^^^^^^^^^^^^^^^

in a separate function... or move to aie_copy_fw()...
here you can just do something like:

ret = aie_copy_fw(fd, "config", "aie_fd_fd_config.bin",
		  fd->base_para->fd_fd_cfg_va, fd->fd->fd_cfg_size);
if (ret)
	return ret;

ret = aie_copy_fw( ..... etc etc

> +
> +	ret = sprintf(name, "%s/config/aie_fd_rs_config.bin", sel_folder);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aie_copy_fw(fd,
> +			  name,
> +			  fd->base_para->fd_rs_cfg_va,
> +			  fd->fd_rs_cfg_size
> +		);
> +	if (ret)
> +		return ret;
> +
> +	ret = sprintf(name, "%s/config/aie_fd_yuv2rgb_config.bin", sel_folder);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aie_copy_fw(fd,
> +			  name,
> +			  fd->base_para->fd_yuv2rgb_cfg_va,
> +			  fd->fd_yuv2rgb_cfg_size
> +		);
> +	if (ret)
> +		return ret;
> +
> +	ret = sprintf(name, "%s/config/aie_attr_fd_config.bin", sel_folder);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aie_copy_fw(fd,
> +			  name,
> +			  fd->base_para->attr_fd_cfg_va[0],
> +			  fd->attr_fd_cfg_size
> +		);
> +	if (ret)
> +		return ret;
> +
> +	ret = sprintf(name, "%s/config/aie_attr_yuv2rgb_config.bin", sel_folder);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = aie_copy_fw(fd,
> +			  name,
> +			  fd->base_para->attr_yuv2rgb_cfg_va[0],
> +			  fd->attr_yuv2rgb_cfg_size
> +		);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 1; i < MAX_ENQUE_FRAME_NUM; i++) {
> +		memcpy(fd->base_para->attr_fd_cfg_va[i],
> +		       fd->base_para->attr_fd_cfg_va[0], fd->attr_fd_cfg_size);

Please validate that attr_fd_cfg_size actually fits in the size of each entry....

> +		memcpy(fd->base_para->attr_yuv2rgb_cfg_va[i],
> +		       fd->base_para->attr_yuv2rgb_cfg_va[0],
> +		       fd->attr_yuv2rgb_cfg_size);
> +	}
> +
> +	for (i = 0; i < FD_LOOP_NUM; i++) {
> +		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
> +			if (fd_ker_rdma_size[i][j]) {

ret = sprintf(name, "aie_fd_kernel_bias_loop%02d_%d.bin", i, j);
if (ret < 0)
	return ret;

ret = aie_copy_fw(fd, "kernel", name, fd->dma_ .... etc)

> +				ret = sprintf(name,
> +					      "%s/kernel/aie_fd_kernel_bias_loop%02d_%d.bin",
> +					      sel_folder, i, j);
> +				if (ret < 0)
> +					return ret;
> +
> +				ret = aie_copy_fw(fd, name,
> +						  fd->dma_para->fd_kernel_va[i][j],
> +						  fd_ker_rdma_size[i][j]);
> +				if (ret)
> +					return ret;
> +			}
> +		}
> +	}
> +
> +	for (i = 0; i < ATTR_LOOP_NUM; i++) {
> +		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
> +			ret = sprintf(name,
> +				      "%s/kernel/aie_attr_kernel_bias_loop%02d_%d.bin",
> +				      sel_folder, i, j);
> +			if (ret < 0)
> +				return ret;
> +
> +			ret = aie_copy_fw(fd, name,
> +					  fd->dma_para->attr_kernel_va[i][j],
> +					  attr_ker_rdma_size[i][j]);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	if (fd->variant->fld_enable) {
> +		ret = sprintf(name, "%s/config/aie_fld_blink_weight_forest14.bin", sel_folder);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = aie_copy_fw(fd, name,
> +				  fd->fld_para->fld_step_va[FLD_STEP_BLINK][14],
> +				  fld_step_align_size[FLD_STEP_BLINK][14]);
> +		if (ret)
> +			return ret;
> +
> +		for (j = 0; j < FLD_MAX_FRAME; j++) {
> +			ret = sprintf(name,
> +				      "%s/config/aie_fld_cv_forest%02d_iom3.bin",
> +				      sel_folder, j);
> +			if (ret < 0)
> +				return ret;
> +
> +			ret = aie_copy_fw(fd, name,
> +					  fd->fld_para->fld_step_va[FLD_STEP_CV][j],
> +					  fld_step_align_size[FLD_STEP_CV][j]);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		for (j = 0; j < FLD_MAX_FRAME; j++) {
> +			ret = sprintf(name,
> +				      "%s/config/aie_fld_fp_forest%02d_om45.bin",
> +				      sel_folder, j);
> +			if (ret < 0)
> +				return ret;
> +
> +			ret = aie_copy_fw(fd, name,
> +					  fd->fld_para->fld_step_va[FLD_STEP_FP][j],
> +					  fld_step_align_size[FLD_STEP_FP][j]);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		for (j = 0; j < FLD_MAX_FRAME; j++) {
> +			ret = sprintf(name,
> +				      "%s/config/aie_fld_leafnode_forest%02d.bin",
> +				      sel_folder, j);
> +			if (ret < 0)
> +				return ret;
> +
> +			ret = aie_copy_fw(fd, name,
> +					  fd->fld_para->fld_step_va[FLD_STEP_LEAF][j],
> +					  fld_step_align_size[FLD_STEP_LEAF][j]);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		for (j = 0; j < FLD_MAX_FRAME; j++) {
> +			ret = sprintf(name,
> +				      "%s/config/aie_fld_tree_forest%02d_km02.bin",
> +				      sel_folder, j);
> +			if (ret < 0)
> +				return ret;
> +			ret = aie_copy_fw(fd, name,
> +					  fd->fld_para->fld_step_va[FLD_STEP_KM02][j],
> +					  fld_step_align_size[FLD_STEP_KM02][j]);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		for (j = 0; j < FLD_MAX_FRAME; j++) {
> +			ret = sprintf(name,
> +				      "%s/config/aie_fld_tree_forest%02d_km13.bin",
> +				      sel_folder, j);
> +			if (ret < 0)
> +				return ret;
> +			ret = aie_copy_fw(fd, name,
> +					  fd->fld_para->fld_step_va[FLD_STEP_KM13][j],
> +					  fld_step_align_size[FLD_STEP_KM13][j]);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +

return 0;

> +	return ret;
> +}
> +
> +static void aie_reset_output_buf(struct mtk_aie_dev *fd,
> +				 struct aie_enq_info *aie_cfg)
> +{

switch (aie_cfg->sel_mode) {
case  ...
case ...
case ....
default:
	break;
};

> +	if (aie_cfg->sel_mode == FDMODE) {
> +		memset(fd->rs_output_hw.va, 0, fd->rs_output_hw.size);
> +		memset(fd->dma_para->fd_out_hw_va[RPN0_LOOP_NUM][0], 0,
> +		       RESULT_SIZE);
> +		memset(fd->dma_para->fd_out_hw_va[RPN1_LOOP_NUM][0], 0,
> +		       RESULT_SIZE);
> +		memset(fd->dma_para->fd_out_hw_va[RPN2_LOOP_NUM][0], 0,
> +		       RESULT_SIZE);
> +	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
> +		memset(fd->base_para->rs_pym_rst_va[0][0], 0,
> +		       fd->rs_pym_out_size[0]);
> +		memset(fd->base_para->rs_pym_rst_va[0][1], 0,
> +		       fd->rs_pym_out_size[0]);
> +		memset(fd->base_para->rs_pym_rst_va[0][2], 0,
> +		       fd->rs_pym_out_size[0]);
> +	} else if (aie_cfg->sel_mode == FLDMODE) {
> +		if (fd->variant->fld_enable)
> +			memset(fd->fld_para->fld_output_va[0], 0,
> +			       FLD_MAX_FRAME * FLD_OUTPUT_SIZE);
> +	}
> +}
> +
> +static int aie_update_cfg(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
> +{
> +	int crop_width;
> +	int crop_height;
> +
> +	crop_width = aie_cfg->src_img_width;
> +	crop_height = aie_cfg->src_img_height;

No double init please.

> +
> +	if (aie_cfg->en_roi) {
> +		crop_width = dif_x(aie_cfg) + 1;
> +		crop_height = dif_y(aie_cfg) + 1;
> +	}

} else {
	crop_width = aie_cfg->src_img_width;
	crop_height = ...
}

> +
> +	if (crop_width == 0 || crop_height == 0) {
> +		dev_err(fd->dev, "AIE error:crop size is wrong");

dev_err(fd->dev, "Invalid crop size 0x0\n");

> +		return -EINVAL;
> +	}
> +
> +	if (aie_cfg->en_padding) {

crop_width += aie_cfg->src_padding.right + aie_cfg->src_padding.left;
crop_height += ....

...and even fits in one line, as it's something like 86 columns and it's fine.

> +		crop_width = crop_width + aie_cfg->src_padding.right +
> +			     aie_cfg->src_padding.left;
> +		crop_height = crop_height + aie_cfg->src_padding.up +
> +			      aie_cfg->src_padding.down;
> +	}
> +
> +	if (aie_cfg->sel_mode == FDMODE) {
> +		fd->base_para->sel_mode = aie_cfg->sel_mode;
> +		fd->base_para->crop_width = crop_width;
> +		fd->base_para->crop_height = crop_height;
> +		fd->base_para->src_img_addr = aie_cfg->src_img_addr;
> +		fd->base_para->src_img_addr_uv = aie_cfg->src_img_addr_uv;
> +		fd->base_para->img_width = aie_cfg->src_img_width;
> +		fd->base_para->img_height = aie_cfg->src_img_height;
> +		fd->base_para->src_img_fmt = aie_cfg->src_img_fmt;
> +		fd->base_para->rotate_degree = aie_cfg->rotate_degree;
> +	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
> +		fd->attr_para->sel_mode[fd->attr_para->w_idx] =
> +			aie_cfg->sel_mode;
> +		fd->attr_para->crop_width[fd->attr_para->w_idx] = crop_width;
> +		fd->attr_para->crop_height[fd->attr_para->w_idx] = crop_height;
> +		fd->attr_para->src_img_addr[fd->attr_para->w_idx] =
> +			aie_cfg->src_img_addr;
> +		fd->attr_para->src_img_addr_uv[fd->attr_para->w_idx] =
> +			aie_cfg->src_img_addr_uv;
> +		fd->attr_para->img_width[fd->attr_para->w_idx] =
> +			aie_cfg->src_img_width;
> +		fd->attr_para->img_height[fd->attr_para->w_idx] =
> +			aie_cfg->src_img_height;
> +		fd->attr_para->src_img_fmt[fd->attr_para->w_idx] =
> +			aie_cfg->src_img_fmt;
> +		fd->attr_para->rotate_degree[fd->attr_para->w_idx] =
> +			aie_cfg->rotate_degree;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aie_config_y2r(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg,
> +			  int mode)
> +{
> +	u32 img_addr = 0;
> +	u32 img_addr_UV = 0;
> +	u32 img_off = 0;
> +	u32 img_off_uv = 0;
> +	u32 *yuv2rgb_cfg = NULL;
> +	u32 srcbuf, srcbuf_UV = 0;
> +	u16 xmag_0 = 0, ymag_0 = 0;
> +	u16 pym0_out_w = 0;
> +	u16 pym0_out_h = 0;
> +	u16 stride_pym0_out_w = 0;
> +	u16 sr_crp_w = 0;
> +	u16 sr_crp_h = 0;
> +	u16 y1_stride = 0;

Some of those variables are double-initialized. Please don't initialize them twice.

> +
> +	if (!aie_cfg->en_roi) {
> +		img_off = 0;
> +		img_off_uv = 0;
> +	} else {
> +		if (aie_cfg->src_img_fmt == FMT_MONO ||
> +		    aie_cfg->src_img_fmt == FMT_YUV_2P ||
> +		    aie_cfg->src_img_fmt == FMT_YVU_2P) {
> +			y1_stride = aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
> +			img_off = y1_stride + aie_cfg->src_roi.x1;
> +			img_off_uv = y1_stride + aie_cfg->src_roi.x1;
> +		} else if (aie_cfg->src_img_fmt == FMT_YUV420_2P ||
> +			   aie_cfg->src_img_fmt == FMT_YUV420_1P) {
> +			y1_stride = aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
> +			img_off = y1_stride + aie_cfg->src_roi.x1;
> +			img_off_uv = y1_stride / 2 + aie_cfg->src_roi.x1;
> +		} else if (aie_cfg->src_img_fmt == FMT_YUYV ||
> +			   aie_cfg->src_img_fmt == FMT_YVYU ||
> +			   aie_cfg->src_img_fmt == FMT_UYVY ||
> +			   aie_cfg->src_img_fmt == FMT_VYUY) {
> +			y1_stride = aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
> +			img_off = y1_stride + aie_cfg->src_roi.x1 * 2;
> +			img_off_uv = y1_stride + aie_cfg->src_roi.x1 * 2;
> +		} else {
> +			dev_err(fd->dev,
> +				"AIE error: Unsupport input format %d",
> +				aie_cfg->src_img_fmt
> +				);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	img_addr = aie_cfg->src_img_addr + img_off;
> +	img_addr_UV = aie_cfg->src_img_addr_uv + img_off_uv;
> +
> +	srcbuf = img_addr;
> +	if (aie_cfg->src_img_fmt == FMT_YUV420_2P ||
> +	    aie_cfg->src_img_fmt == FMT_YUV420_1P ||
> +	    aie_cfg->src_img_fmt == FMT_YUV_2P ||
> +	    aie_cfg->src_img_fmt == FMT_YVU_2P)
> +		srcbuf_UV = img_addr_UV;

lower case please.

> +	else
> +		srcbuf_UV = 0;
> +
> +	if (mode == FDMODE) {
> +		sr_crp_w = fd->base_para->crop_width;
> +		sr_crp_h = fd->base_para->crop_height;
> +		yuv2rgb_cfg = (u32 *)fd->base_para->fd_yuv2rgb_cfg_va;
> +		pym0_out_w = fd->base_para->pyramid_width;
> +	} else {/* for ATTRIBUTEMODE mode */

Is that invalid for other modes?! If so, please add a check!

> +		sr_crp_w = fd->attr_para->crop_width[fd->attr_para->w_idx];
> +		sr_crp_h = fd->attr_para->crop_height[fd->attr_para->w_idx];
> +		yuv2rgb_cfg =
> +			(u32 *)fd->base_para
> +				->attr_yuv2rgb_cfg_va[fd->attr_para->w_idx];
> +		pym0_out_w = ATTR_MODE_PYRAMID_WIDTH;
> +	}
> +
> +	pym0_out_h = pym0_out_w * sr_crp_h / sr_crp_w;
> +
> +	if (pym0_out_w != 0) {
> +		xmag_0 = 512 * sr_crp_w / pym0_out_w;
> +		ymag_0 = xmag_0;
> +	} else {
> +		xmag_0 = 0;
> +		ymag_0 = 0;
> +	}
> +

..snip..

> +	return 0;
> +}
> +

..snip..

> +
> +static int aie_config_network(struct mtk_aie_dev *fd,
> +			      struct aie_enq_info *aie_cfg)
> +{
> +	u16 conv_width = 0;
> +	u16 conv_height = 0;
> +	u8 i = 0;
> +	u8 j = 0;
> +	u8 uch = 0;
> +	u8 uloop = 0;
> +	u16 fd_xsize[4] = { 0, 0, 0, 0 };
> +	void *fd_cfg = NULL;
> +	u32 *fd_cur_cfg = NULL;
> +	u32 *fd_cur_set = NULL;
> +	u16 pyramid0_out_w = 0;
> +	u16 pyramid0_out_h = 0;
> +	u16 pyramid1_out_h = 0;
> +	u16 pyramid2_out_h = 0;
> +	u16 input_height = 0;
> +	u16 out_height = 0;
> +	u16 out_ysize_plus_1 = 0;
> +	u16 out_ysize_plus_1_stride2 = 0;
> +	u32 sr_crp_w = 0;
> +	u32 sr_crp_h = 0;
> +	struct aie_static_info *pstv = &fd->st_info;
> +	u32 cal_x = 0;
> +	u32 cal_y = 0;
> +

Please don't double-init vars.

> +	sr_crp_w = fd->base_para->crop_width;
> +	sr_crp_h = fd->base_para->crop_height;
> +
> +	pyramid0_out_w = fd->base_para->pyramid_width;
> +	pyramid0_out_h = pyramid0_out_w * sr_crp_h / sr_crp_w;
> +
> +	pyramid1_out_h = pyramid0_out_h / 2;
> +	pyramid2_out_h = pyramid1_out_h / 2;
> +
> +	fd_cfg = fd->base_para->fd_fd_cfg_va;
> +
> +	for (i = 0; i < FD_LOOP_NUM; i++) {
> +		fd_cur_cfg = (u32 *)fd_cfg + fd->variant->fd_cfg_size * i;
> +		fd_cur_cfg[FD_INPUT_ROTATE] =
> +			(fd_cur_cfg[FD_INPUT_ROTATE] & 0xFFFF0FFF) |
> +			((aie_cfg->rotate_degree << 12) & 0x3000);
> +
> +		if (i == 0)
> +			input_height = pyramid2_out_h;

if you organize the pyramid outputs in an array, you may be able to optimize
this piece of code and to also enhance its readability.

> +		else if (i == (RPN2_LOOP_NUM + 1))
> +			input_height = pyramid1_out_h;
> +		else if (i == (RPN1_LOOP_NUM + 1))
> +			input_height = pyramid0_out_h;
> +		else
> +			if (fd_out_stride2_in[i] == 0)
> +				input_height = out_height;
> +			else
> +				input_height = (out_height + 1) / 2;
> +
> +		if (fd_maxpool[i] == 1 && fd_stride[i] == 1)
> +			out_height =
> +				DIV_ROUND_UP(input_height, 2 * fd_maxpool[i]);
> +		else
> +			out_height = DIV_ROUND_UP(input_height, fd_stride[i] + 2 * fd_maxpool[i]);
> +
> +		if (i == RPN0_LOOP_NUM || i == RPN1_LOOP_NUM ||
> +		    i == RPN2_LOOP_NUM) {
> +			conv_width = fd->base_para->img_width;
> +			conv_height = fd->base_para->img_height;
> +			fd_xsize[0] = pstv->inf_elm[i].img_width * 2 * 16 *
> +					      anchor_en_num[i] -
> +				      1;
> +			fd_xsize[3] = pstv->inf_elm[i].img_width * 2 * 32 *
> +					      anchor_en_num[i] - 1;
> +			fd_xsize[2] = fd_xsize[3];
> +			fd_xsize[1] = fd_xsize[2];
> +		} else {
> +			conv_width = DIV_ROUND_UP(pstv->inf_elm[i].img_width, fd_stride[i]);
> +			conv_height = DIV_ROUND_UP(input_height, fd_stride[i]);
> +
> +			fd_xsize[3] = pstv->inf_elm[i].input_xsize_plus_1 - 1;
> +			fd_xsize[2] = fd_xsize[3];
> +			fd_xsize[1] = fd_xsize[2];
> +			fd_xsize[0] = fd_xsize[1];
> +		}
> +

..snip..

> +
> +static int aie_config_dram(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
> +{
> +	int ret = -EINVAL;

int ret;

> +
> +	if (aie_cfg->sel_mode == FDMODE) {
> +		ret = aie_config_y2r(fd, aie_cfg, aie_cfg->sel_mode);
> +		if (ret)
> +			return ret;
> +
> +		ret = aie_config_rs(fd, aie_cfg);
> +		if (ret)
> +			return ret;
> +
> +		ret = aie_config_network(fd, aie_cfg);
> +		if (ret)
> +			return ret;
> +
> +	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
> +		ret = aie_config_y2r(fd, aie_cfg, aie_cfg->sel_mode);
> +		if (ret)
> +			return ret;
> +
> +		ret = aie_config_attr_network(fd, aie_cfg);
> +		if (ret)
> +			return ret;
> +	}
> +
	} else {
		return -EINVAL;
	}

return 0;

> +	return ret;
> +}
> +
> +void aie_reset(struct mtk_aie_dev *fd)
> +{

#define SOMETHING	BIT(16)
#define SOMETHING_ELSE	BIT(17)

#define THAT_VALUE	(SOMETHING | SOMETHING_ELSE)

writel(THAT_VALUE, fd->fd_base + AIE_START_REG);

> +	writel(0x30000, fd->fd_base + AIE_START_REG);
> +	writel(0x0, fd->fd_base + AIE_START_REG);
> +}
> +
> +int aie_init(struct mtk_aie_dev *fd, struct v4l2_ctrl_aie_init *user_init)
> +{
> +	int ret = -ENOMEM;
> +	int i = 0, j = 0;

int i, j, ret;

> +
> +	if (fd->fd_state & STATE_INIT) {
> +		dev_err(fd->dev, "%s fd state: %d\n", __func__, fd->fd_state);
> +		return -EINVAL;
> +	}
> +
> +	fd->fd_state &= ~STATE_INIT;
> +	fd->fd_mem_size = 0;
> +
> +	fd->base_para = kmalloc(sizeof(*fd->base_para), GFP_KERNEL);
> +	if (!fd->base_para)

if (!fd->base_para)
	return -ENOMEM;


> +		goto kmalloc_fail;
> +
> +	fd->attr_para = kmalloc(sizeof(*fd->attr_para), GFP_KERNEL);

if (!fd->attr_para) {
	ret = -ENOMEM;
	goto attr_alloc_fail;
}

... etc etc

> +	if (!fd->attr_para)
> +		goto kmalloc_fail;
> +
> +	fd->dma_para = kmalloc(sizeof(*fd->dma_para), GFP_KERNEL);
> +	if (!fd->dma_para)
> +		goto kmalloc_fail;
> +
> +	if (fd->variant->fld_enable) {
> +		fd->fld_para =
> +			kmalloc(sizeof(*fd->fld_para), GFP_KERNEL);
> +		if (!fd->fld_para)
> +			goto kmalloc_fail;
> +	}
> +
> +	fd->base_para->rpn_anchor_thrd =
> +		(signed short)(user_init->feature_threshold & 0x0000FFFF);
> +	fd->base_para->pyramid_width = user_init->pyramid_width;
> +	fd->base_para->pyramid_height = user_init->pyramid_height;
> +	fd->base_para->max_pyramid_width = user_init->pyramid_width;
> +	fd->base_para->max_pyramid_height = user_init->pyramid_height;
> +
> +	fd->base_para->fd_fd_cfg_va = NULL;
> +	fd->base_para->fd_rs_cfg_va = NULL;
> +	fd->base_para->fd_yuv2rgb_cfg_va = NULL;
> +	for (i = 0; i < MAX_ENQUE_FRAME_NUM; i++)
> +		fd->base_para->attr_fd_cfg_va[i] = NULL;
> +	for (i = 0; i < MAX_ENQUE_FRAME_NUM; i++)
> +		fd->base_para->attr_yuv2rgb_cfg_va[i] = NULL;
> +	for (i = 0; i < PYM_NUM; i++)
> +		for (j = 0; j < COLOR_NUM; j++)
> +			fd->base_para->rs_pym_rst_va[i][j] = NULL;
> +
> +	memset(&fd->st_info, 0, sizeof(struct aie_static_info));
> +	aie_init_table(fd, fd->base_para->max_pyramid_width,
> +		       fd->base_para->max_pyramid_height);
> +	aie_update_buf_params(fd, user_init->max_img_width,
> +			      user_init->max_img_height);
> +	ret = aie_alloc_dram_buf(fd);
> +	if (ret)
> +		goto free_all;

You really have to free only what you previously allocated.

Don't free stuff that was never allocated, even if it may be fine.

> +
> +	ret = aie_alloc_output_buf(fd);
> +	if (ret)
> +		goto free_all;
> +
> +	ret = aie_alloc_fddma_buf(fd);
> +	if (ret)
> +		goto free_all;
> +
> +	if (fd->variant->fld_enable) {
> +		ret = aie_alloc_fld_buf(fd);
> +		if (ret)
> +			goto free_all;
> +	}
> +
> +	aie_arrange_fddma_buf(fd);
> +	aie_arrange_kernel_buf(fd);
> +	aie_arrange_attrdma_buf(fd);
> +	aie_arrange_result_dma_buf(fd);
> +
> +	if (fd->variant->fld_enable)
> +		aie_arrange_fld_buf(fd);
> +
> +	ret = aie_load_fw(fd);
> +	if (ret) {
> +		dev_err(fd->dev, "Failed to load aie fw\n");
> +		goto free_all;
> +	}
> +
> +	fd->attr_para->r_idx = 0;
> +	fd->attr_para->w_idx = 0;
> +
> +	fd->fd_state |= STATE_INIT;
> +
> +	dev_dbg(fd->dev, "%s: fd_mem_size(%d)\n", __func__, fd->fd_mem_size);
> +

return 0;

> +	return ret;
> +
> +free_all:
> +	aie_free_dram_buf(fd);
> +	aie_free_output_buf(fd);
> +	aie_free_fddma_buf(fd);
> +	if (fd->variant->fld_enable)
> +		aie_free_fld_buf(fd);
> +
> +kmalloc_fail:
> +	kfree(fd->base_para);
> +	kfree(fd->attr_para);
> +	kfree(fd->dma_para);
> +	kfree(fd->fld_para);
> +
> +	dev_err(fd->dev, "Failed to init aie\n");
> +
> +	return ret;
> +}
> +
> +void aie_uninit(struct mtk_aie_dev *fd)
> +{
> +	fd->fd_state &= ~STATE_INIT;
> +
> +	aie_free_dram_buf(fd);
> +	aie_free_output_buf(fd);
> +	aie_free_fddma_buf(fd);
> +
> +	if (fd->variant->fld_enable)
> +		aie_free_fld_buf(fd);
> +
> +	kfree(fd->base_para);
> +	kfree(fd->attr_para);
> +	kfree(fd->dma_para);
> +	kfree(fd->fld_para);
> +}
> +
> +void aie_prepare(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
> +{
> +	if (fd->variant->fld_enable) {
> +		if (aie_cfg->sel_mode == FLDMODE) { /* FLD don't need to prepare buf */
> +			dev_dbg(fd->dev, "FLD, Mode: %d", aie_cfg->sel_mode);
> +			return;
> +		}
> +	}

Can sel_mode ever be FLDMODE if fld_enable is false?
Because if it can't, you can just avoid checking fld_enable.

Otherwise, this still should be a one-line check

if (fd->variant->fld_enable && aie_cfg->sel_mode == FLDMODE)
	return;

> +
> +	memset(&fd->reg_cfg, 0, sizeof(struct aie_reg_cfg));
> +
> +	if (aie_cfg->pyramid_base_width == 0) {
> +		fd->base_para->pyramid_width = fd->base_para->max_pyramid_width;
> +		fd->base_para->pyramid_height =
> +			fd->base_para->max_pyramid_height;
> +		fd->base_para->number_of_pyramid = 3;
> +	} else {
> +		fd->base_para->pyramid_height =
> +			fd->base_para->max_pyramid_height;
> +		fd->base_para->number_of_pyramid = aie_cfg->number_of_pyramid;
> +		if (aie_cfg->pyramid_base_width !=
> +		    fd->base_para->pyramid_width) {
> +			dev_dbg(fd->dev,
> +				"pre: %d cur: %d num: %d\n",
> +				fd->base_para->pyramid_width,
> +				aie_cfg->pyramid_base_width,
> +				fd->base_para->number_of_pyramid
> +			);
> +			fd->base_para->pyramid_width =
> +				aie_cfg->pyramid_base_width;
> +			aie_update_table(fd, fd->base_para->pyramid_width,
> +					 fd->base_para->pyramid_height);
> +			aie_update_fddma_buf(fd);
> +		}
> +	}
> +
> +	aie_reset_output_buf(fd, aie_cfg);
> +
> +	fd->reg_cfg.fd_mode = aie_cfg->sel_mode;
> +	if (aie_cfg->sel_mode == FDMODE) {
> +		fd->reg_cfg.rs_adr = (u32)fd->base_para->fd_rs_cfg_pa;
> +		fd->reg_cfg.yuv2rgb_adr = (u32)fd->base_para->fd_yuv2rgb_cfg_pa;
> +		fd->reg_cfg.fd_adr = (u32)fd->base_para->fd_fd_cfg_pa +
> +							 fd->variant->fd_cfg_size * 4 *
> +							 FD_LOOP_NUM / 3 *
> +							 (3 - aie_cfg->number_of_pyramid);
> +
> +	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
> +		fd->reg_cfg.yuv2rgb_adr =
> +			(u32)fd->base_para->attr_yuv2rgb_cfg_pa[fd->attr_para->w_idx];
> +		fd->reg_cfg.fd_adr =
> +			(u32)fd->base_para->attr_fd_cfg_pa[fd->attr_para->w_idx];
> +	} else {
> +		dev_err(fd->dev, "AIE error, Mode: %d", aie_cfg->sel_mode);

Drop "AIE error" from all prints. They all come from the AIE device, so ALL of them
are obviously AIE errors.

> +	}
> +
> +	aie_update_cfg(fd, aie_cfg);
> +
> +	aie_config_dram(fd, aie_cfg);
> +
> +	if (aie_cfg->sel_mode == ATTRIBUTEMODE)
> +		fd->attr_para->w_idx =
> +			(fd->attr_para->w_idx + 1) % MAX_ENQUE_FRAME_NUM;
> +}
> +
> +void aie_execute(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
> +{
> +	unsigned int loop_num = 0;
> +	unsigned int loop_reg_val = 0;
> +	unsigned int i = 0;

Again, no double init of variables.

> +
> +	if (aie_cfg->sel_mode == FDMODE) {

Just use a switch here, and move the contents to other functions.

static void aie_execute_face_detection(...)
{
	fdmode flow
}

static void aie_execute_attribute_detection(....)
{
	attributemode flow
}

etc etc.


There's surely something more to fix, and I expect to have missed something since
this submission is rather huge. Hopefully the other reviewers catched stuff that
I didn't catch, so that you can get this done with less iterations...

Cheers,
Angelo

