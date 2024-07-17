Return-Path: <linux-media+bounces-15085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6690933D7E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 15:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43BB3B20C0A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6271802CB;
	Wed, 17 Jul 2024 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOEcO3vh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E901802A7;
	Wed, 17 Jul 2024 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222224; cv=none; b=ctp9EoqgTfXMklr2ik9Ixe8ZNHiEO4AiFTYvZZeQdPRiJUHG5hs2V5VYj2iTaupkA8EWNy17B0jreddPmfGm7nk893O8m/Wm3BfJpCDPJdjJZj76XDcltAnY6kZbhnULcBy2GDKZktMN8AjbYRSRMIfzwoClLRL7evIFVYPD6ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222224; c=relaxed/simple;
	bh=FN/HvzXRRflhyLh1zQ+KbT8766ZJDlJ1lhh1ymth4aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsudHQCn6eQphXDVx8orR3oonySlkCIRKMiE60s6V4PfGpgp84me1n8g4uxMPh3q6BQ5KSC+BLhigDoe4q/J+Qb1n+v7IfBdSnZAaj13O1YmdRT17PRFLFaEE8YgjhKz3/ZkdS2QA4kS2CGTHs5TRGL1UIWSLLFWaaoGQ/y6P9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOEcO3vh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C35C32782;
	Wed, 17 Jul 2024 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721222224;
	bh=FN/HvzXRRflhyLh1zQ+KbT8766ZJDlJ1lhh1ymth4aQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MOEcO3vhwBMiHNri6x41DLO9ASmsaEsMjXLBREv+Ubq1Vu+ZzEzbAIy2Q4jtO3F1G
	 LJ3R0772CaAroXjvTyXK5jyh00PoLZJ6il4wm3r46j/yYIGSmofCM2/FgAhcuSHOPr
	 oNBlC9PuK2BbE6vLVofCm/a6WJI8OtOK3w0lGwncbLL4hckNeZkdK6CplaF9qW9SUL
	 NXF6obamD5Yz3wklV8egJpaO19URtw7F+/SxePp184HMbar/nCRypgeLS3LsortyZO
	 WqBFEKH8xu7Ospnu+2XAQY7b/7RiHxzXs0XOWfbsOk+5VgzJPvKhF1gWIYJXuZEjoz
	 WGmUHeedW1xSQ==
Message-ID: <7cfeeb34-6f5c-4c7c-9a60-dcb35cdd458b@kernel.org>
Date: Wed, 17 Jul 2024 15:16:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: mediatek: add MT8188 AIE driver
To: 20220614094956 created <yelian.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org
References: <20240717125426.32660-1-yelian.wang@mediatek.com>
 <20240717125426.32660-4-yelian.wang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240717125426.32660-4-yelian.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2024 14:41, 20220614094956 created wrote:
> From: Yelian Wang <yelian.wang@mediatek.com>
> 
> Add a V4L2 sub-device driver for MT8188 AIE.
> 
> Signed-off-by: Yelian Wang <yelian.wang@mediatek.com>
> ---
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    1 +
>  drivers/media/platform/mediatek/aie/Kconfig   |   13 +
>  drivers/media/platform/mediatek/aie/Makefile  |    5 +
>  drivers/media/platform/mediatek/aie/mtk_aie.h | 1012 +++++
>  .../media/platform/mediatek/aie/mtk_aie_53.c  | 2031 +++++++++
>  .../media/platform/mediatek/aie/mtk_aie_drv.c | 3613 +++++++++++++++++
>  7 files changed, 6676 insertions(+)
>  create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/aie/Makefile
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
> 
> diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
> index 84104e2cd024..987c754a76b7 100644
> --- a/drivers/media/platform/mediatek/Kconfig
> +++ b/drivers/media/platform/mediatek/Kconfig
> @@ -7,3 +7,4 @@ source "drivers/media/platform/mediatek/mdp/Kconfig"
>  source "drivers/media/platform/mediatek/vcodec/Kconfig"
>  source "drivers/media/platform/mediatek/vpu/Kconfig"
>  source "drivers/media/platform/mediatek/mdp3/Kconfig"
> +source "drivers/media/platform/mediatek/aie/Kconfig"
> diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
> index 38e6ba917fe5..db8e6d09de4e 100644
> --- a/drivers/media/platform/mediatek/Makefile
> +++ b/drivers/media/platform/mediatek/Makefile
> @@ -4,3 +4,4 @@ obj-y += mdp/
>  obj-y += vcodec/
>  obj-y += vpu/
>  obj-y += mdp3/
> +obj-y += aie/
> diff --git a/drivers/media/platform/mediatek/aie/Kconfig b/drivers/media/platform/mediatek/aie/Kconfig
> new file mode 100644
> index 000000000000..f2fe4bfcdd6a
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/Kconfig
> @@ -0,0 +1,13 @@
> +config VIDEO_MTK_AIE
> +	tristate "MediaTek AI engine function"
> +	depends on OF
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	select MEDIA_CONTROLLER_REQUEST_API
> +	help
> +		Support the AI engine (AIE) feature

Fix indentation. See every other file...

> +
> +		AIE driver is a V4L2 memory-to-memory device driver which
> +		provides hardware accelerated face detection function,
> +		it can detect different sizes of faces in a raw image.
> +
> diff --git a/drivers/media/platform/mediatek/aie/Makefile b/drivers/media/platform/mediatek/aie/Makefile
> new file mode 100644
> index 000000000000..615fb8de8f3e
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +mtk-aie-y += mtk_aie_53.o
> +mtk-aie-y += mtk_aie_drv.o
> +
> +obj-$(CONFIG_VIDEO_MTK_AIE) += mtk-aie.o
> diff --git a/drivers/media/platform/mediatek/aie/mtk_aie.h b/drivers/media/platform/mediatek/aie/mtk_aie.h
> new file mode 100644
> index 000000000000..0a2af547b56b
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/mtk_aie.h
> @@ -0,0 +1,1012 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Fish Wu <fish.wu@mediatek.com>
> + */
> +
> +#ifndef __MTK_AIE_H__
> +#define __MTK_AIE_H__
> +
> +#include <linux/completion.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +// AIE 3.X
> +
> +#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION

Nope, there is no such stuff.

> +#include "mtk-interconnect.h"
> +#endif
> +
> +// AIE 3.X
> +#define MTK_AIE_OPP_SET 1
> +#define MTK_AIE_CLK_LEVEL_CNT 4
> +
> +#define FD_VERSION 1946050
> +#define ATTR_VERSION 1929401

What do these mean? Document you magic constants.



...

> +
> +#define FLD_SH_IN_BASE_ADDR_0 0x760
> +#define FLD_SH_IN_BASE_ADDR_1 0x764
> +#define FLD_SH_IN_BASE_ADDR_2 0x768
> +#define FLD_SH_IN_BASE_ADDR_3 0x76C
> +#define FLD_SH_IN_BASE_ADDR_4 0x770
> +#define FLD_SH_IN_BASE_ADDR_5 0x774
> +#define FLD_SH_IN_BASE_ADDR_6 0x778
> +#define FLD_SH_IN_BASE_ADDR_7 0x77C
> +#define FLD_SH_IN_BASE_ADDR_8 0x780
> +#define FLD_SH_IN_BASE_ADDR_9 0x784
> +#define FLD_SH_IN_BASE_ADDR_10 0x788
> +#define FLD_SH_IN_BASE_ADDR_11 0x78C
> +#define FLD_SH_IN_BASE_ADDR_12 0x790
> +#define FLD_SH_IN_BASE_ADDR_13 0x794
> +#define FLD_SH_IN_BASE_ADDR_14 0x798
> +#define FLD_SH_IN_BASE_ADDR_15 0x79C
> +#define FLD_SH_IN_BASE_ADDR_16 0x7A0
> +#define FLD_SH_IN_BASE_ADDR_17 0x7A4
> +#define FLD_SH_IN_BASE_ADDR_18 0x7A8
> +#define FLD_SH_IN_BASE_ADDR_19 0x7AC
> +#define FLD_SH_IN_BASE_ADDR_20 0x7B0
> +#define FLD_SH_IN_BASE_ADDR_21 0x7B4
> +#define FLD_SH_IN_BASE_ADDR_22 0x7B8
> +#define FLD_SH_IN_BASE_ADDR_23 0x7BC
> +#define FLD_SH_IN_BASE_ADDR_24 0x7C0
> +#define FLD_SH_IN_BASE_ADDR_25 0x7C4
> +#define FLD_SH_IN_BASE_ADDR_26 0x7C8
> +#define FLD_SH_IN_BASE_ADDR_27 0x7CC
> +#define FLD_SH_IN_BASE_ADDR_28 0x7D0
> +#define FLD_SH_IN_BASE_ADDR_29 0x7D4
> +
> +#define FLD_SH_IN_SIZE_0 0x7D8
> +#define FLD_SH_IN_STRIDE_0 0x7DC
> +#define FLD_TR_OUT_BASE_ADDR_0 0x7E0
> +#define FLD_TR_OUT_SIZE_0 0x7E4
> +#define FLD_TR_OUT_STRIDE_0 0x7E8
> +#define FLD_PP_OUT_BASE_ADDR_0 0x7EC
> +#define FLD_PP_OUT_SIZE_0 0x7F0
> +#define FLD_PP_OUT_STRIDE_0 0x7F4
> +#define FLD_SPARE 0x7F8
> +
> +#define FLD_BASE_ADDR_FACE_0_7_MSB 0x7FC
> +#define FLD_BASE_ADDR_FACE_8_14_MSB 0x800
> +
> +#define FLD_PL_IN_BASE_ADDR_0_0_7_MSB 0x804
> +#define FLD_PL_IN_BASE_ADDR_0_8_15_MSB 0x808
> +#define FLD_PL_IN_BASE_ADDR_0_16_23_MSB 0x80C
> +#define FLD_PL_IN_BASE_ADDR_0_24_29_MSB 0x810
> +
> +#define FLD_PL_IN_BASE_ADDR_1_0_7_MSB 0x814
> +#define FLD_PL_IN_BASE_ADDR_1_8_15_MSB 0x818
> +#define FLD_PL_IN_BASE_ADDR_1_16_23_MSB 0x81C
> +#define FLD_PL_IN_BASE_ADDR_1_24_29_MSB 0x820
> +
> +#define FLD_PL_IN_BASE_ADDR_2_0_7_MSB 0x824
> +#define FLD_PL_IN_BASE_ADDR_2_8_15_MSB 0x828
> +#define FLD_PL_IN_BASE_ADDR_2_16_23_MSB 0x82C
> +#define FLD_PL_IN_BASE_ADDR_2_24_29_MSB 0x830
> +
> +#define FLD_PL_IN_BASE_ADDR_3_0_7_MSB 0x834
> +#define FLD_PL_IN_BASE_ADDR_3_8_15_MSB 0x838
> +#define FLD_PL_IN_BASE_ADDR_3_16_23_MSB 0x83C
> +#define FLD_PL_IN_BASE_ADDR_3_24_29_MSB 0x840
> +
> +#define FLD_SH_IN_BASE_ADDR_0_7_MSB 0x844
> +#define FLD_SH_IN_BASE_ADDR_8_15_MSB 0x848
> +#define FLD_SH_IN_BASE_ADDR_16_23_MSB 0x84C
> +#define FLD_SH_IN_BASE_ADDR_24_29_MSB 0x850
> +
> +#define FLD_BS_IN_BASE_ADDR_0_7_MSB 0x8d4
> +#define FLD_BS_IN_BASE_ADDR_8_15_MSB 0x8d8
> +
> +#define FLD_TR_OUT_BASE_ADDR_0_MSB 0x854
> +#define FLD_PP_OUT_BASE_ADDR_0_MSB 0x858


All this coding style is unreadable.

> +
> +#define FLD_BS_IN_BASE_ADDR_00 0x85C
> +#define FLD_BS_IN_BASE_ADDR_01 0x860
> +#define FLD_BS_IN_BASE_ADDR_02 0x864
> +#define FLD_BS_IN_BASE_ADDR_03 0x868
> +#define FLD_BS_IN_BASE_ADDR_04 0x86C
> +#define FLD_BS_IN_BASE_ADDR_05 0x870
> +#define FLD_BS_IN_BASE_ADDR_06 0x874
> +#define FLD_BS_IN_BASE_ADDR_07 0x878
> +#define FLD_BS_IN_BASE_ADDR_08 0x87C
> +#define FLD_BS_IN_BASE_ADDR_09 0x880
> +#define FLD_BS_IN_BASE_ADDR_10 0x884
> +#define FLD_BS_IN_BASE_ADDR_11 0x888
> +#define FLD_BS_IN_BASE_ADDR_12 0x88C
> +#define FLD_BS_IN_BASE_ADDR_13 0x890
> +#define FLD_BS_IN_BASE_ADDR_14 0x894
> +#define FLD_BS_BIAS 0x8E4
> +#define FLD_CV_FM_RANGE_0 0x8E8
> +#define FLD_CV_FM_RANGE_1 0x8EC
> +#define FLD_CV_PM_RANGE_0 0x8F0
> +#define FLD_CV_PM_RANGE_1 0x8F4
> +#define FLD_BS_RANGE_0 0x8F8
> +#define FLD_BS_RANGE_1 0x8FC
> +
> +#define MTK_FD_OUTPUT_MIN_WIDTH 16U
> +#define MTK_FD_OUTPUT_MIN_HEIGHT 16U
> +#define MTK_FD_OUTPUT_MAX_WIDTH 4096U
> +#define MTK_FD_OUTPUT_MAX_HEIGHT 4096U
> +
> +#define MTK_FD_HW_TIMEOUT_IN_MSEC 2000
> +#define MAX_FACE_NUM 1024
> +#define RLT_NUM 48
> +#define GENDER_OUT 32
> +
> +#define RACE_RST_X_NUM 4
> +#define RACE_RST_Y_NUM 64
> +#define GENDER_RST_X_NUM 2
> +#define GENDER_RST_Y_NUM 64
> +#define MRACE_RST_NUM 4
> +#define MGENDER_RST_NUM 2
> +#define MAGE_RST_NUM 2
> +#define MINDIAN_RST_NUM 2
> +
> +// AIE 3.X
> +#define FLD_FOREST 14
> +#define FLD_POINT 500
> +
> +#define FLD_STEP_NUM 6
> +#define FLD_MAX_FRAME 15
> +
> +#define FLD_STEP_BLINK 0
> +#define FLD_STEP_CV 1
> +#define FLD_STEP_FP 2
> +#define FLD_STEP_LEAF 3
> +#define FLD_STEP_KM02 4
> +#define FLD_STEP_KM13 5
> +
> +#define FLD_BLINK_WEIGHT_FOREST14_SIZE 6416
> +#define FLD_CV_SIZE 19392
> +#define FLD_FP_SIZE 80160
> +#define FLD_LEAFNODE_SIZE 4608000
> +#define FLD_TREE_KM02_SIZE 120000
> +#define FLD_TREE_KM13_SIZE 120000
> +#define FLD_OUTPUT_SIZE 112
> +
> +#define FLD_CUR_LANDMARK 11
> +
> +#define RESULT_SIZE (RLT_NUM * MAX_FACE_NUM)
> +
> +struct aie_static_info_element {
> +	unsigned int fd_wdma_size[OUTPUT_WDMA_WRA_NUM];
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
> +};
> +
> +struct aie_static_info {
> +	struct aie_static_info_element inf_elm[FD_LOOP_NUM];
> +};
> +
> +enum aie_state { STATE_NA = 0x0, STATE_INIT = 0x1, STATE_OPEN = 0x2 };

That's some odd wrapping. Please follow Linux Coding Style/.


> +
> +// AIE 3.1
> +enum aie_mode { FDMODE = 0, ATTRIBUTEMODE = 1, FLDMODE = 2};
> +
> +enum aie_format {
> +	FMT_NA = 0,
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
> +	DEGREE_0 = 0,
> +	DEGREE_90 = 1,
> +	DEGREE_270 = 2,
> +	DEGREE_180 = 3
> +};
> +
> +/* align v4l2 user space interface */
> +struct FDRESULT {
> +	u16 anchor_x0[MAX_FACE_NUM];
> +	u16 anchor_x1[MAX_FACE_NUM];
> +	u16 anchor_y0[MAX_FACE_NUM];
> +	u16 anchor_y1[MAX_FACE_NUM];
> +	signed short rop_landmark_score0[MAX_FACE_NUM];
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
> +	struct FDRESULT PYRAMID0_RESULT;


Nope. Drop all this downstream junk style.

This applies everywhere - there is no C type or member declaration
(except pre-processor) which is upper case. Nowhere.

The fact you send such code means you push downstream code, which is not
how you upstream stuff.

Drop entire driver and start from scratch from decent and recent driver
which has already fixed all this weirdness.


...

> +
> +struct mtk_aie_dev {
> +	struct device *dev;
> +	struct mtk_aie_ctx *ctx;
> +	struct v4l2_m2m_dev *m2m_dev;
> +	struct device *larb;
> +	struct aie_para *base_para;
> +	struct aie_attr_para *attr_para;
> +	struct aie_fd_dma_para *dma_para;
> +
> +	// AIE 3.X
> +	struct aie_fd_fld_para *fld_para;
> +#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION

WTF?

> +	struct mtk_aie_dvfs *dvfs_info;
> +	struct mtk_aie_qos *qos_info;
> +#endif
> +
> +	struct aie_enq_info *aie_cfg;
> +	struct workqueue_struct *frame_done_wq;
> +	void __iomem *fd_base;
> +	const struct mtk_aie_variant *variant;
> +
> +	/* Input Buffer Pointer */
> +	struct imem_buf_info rs_cfg_data;
> +	struct imem_buf_info fd_cfg_data;
> +	struct imem_buf_info yuv2rgb_cfg_data;
> +	/* HW Output Buffer Pointer */
> +	struct imem_buf_info rs_output_hw;
> +	struct imem_buf_info fd_dma_hw;
> +	struct imem_buf_info fd_dma_result_hw;
> +	struct imem_buf_info fd_kernel_hw;
> +	struct imem_buf_info fd_attr_dma_hw;
> +	struct aie_static_info st_info;
> +
> +	struct aie_reg_cfg reg_cfg;
> +
> +	// AIE 3.X
> +	/* fld fw buffer */
> +	struct media_device mdev;
> +	struct video_device vfd;
> +	struct aie_clocks aie_clk;
> +	struct v4l2_device v4l2_dev;
> +
> +	/* Lock for V4L2 operations */
> +	struct mutex vfd_lock;
> +	/* Lock for device operations */
> +	struct mutex dev_lock;
> +	/* Lock for performance optimization */
> +	struct mutex fd_lock;
> +	struct imem_buf_info fd_fld_step_data;
> +	struct imem_buf_info fd_fld_out_hw;
> +
> +	int irq;
> +	struct completion fd_job_finished;
> +	struct delayed_work job_timeout_work;
> +
> +	/* DRAM Buffer Size */
> +	unsigned int fd_rs_cfg_size;
> +	unsigned int fd_fd_cfg_size;
> +	unsigned int fd_yuv2rgb_cfg_size;
> +	unsigned int attr_fd_cfg_size;
> +	unsigned int attr_yuv2rgb_cfg_size;
> +
> +	/* HW Output Buffer Size */
> +	unsigned int rs_pym_out_size[PYM_NUM];
> +	unsigned int fd_dma_max_size;
> +	unsigned int fd_dma_rst_max_size;
> +	unsigned int fd_fd_kernel_size;
> +	unsigned int fd_attr_kernel_size;
> +	unsigned int fd_attr_dma_max_size;
> +	unsigned int fd_attr_dma_rst_max_size;
> +	// AIE 3.X
> +	/* fld size */
> +	unsigned int fld_step_size;
> +	unsigned int fld_out_size;
> +
> +	wait_queue_head_t flushing_waitq;
> +	atomic_t num_composing;
> +	struct mtk_aie_req_work req_work;
> +	unsigned int fd_state;
> +	unsigned int fd_mem_size;
> +	u32 fd_stream_count;


Amount of all these structures and their members is HUGE. Many look like
duplicated, but tricky to say.

Uptreaming this stuff will take many iterations, so start from dividing
your work into proper reasonable and logical chunks.

....


> +/**************************************************************************/
> +/*                   C L A S S    D E C L A R A T I O N                   */


What class?

> +/**************************************************************************/
> +
> +void aie_reset(struct mtk_aie_dev *fd);
> +int aie_init(struct mtk_aie_dev *fd, struct v4l2_ctrl_aie_init *user_init);
> +void aie_uninit(struct mtk_aie_dev *fd);
> +void aie_prepare(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
> +void aie_execute(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
> +void aie_irqhandle(struct mtk_aie_dev *fd);
> +void aie_get_fd_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
> +void aie_get_attr_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
> +void aie_get_fld_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
> +#endif /*__MTK_AIE_H__*/
> diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_53.c b/drivers/media/platform/mediatek/aie/mtk_aie_53.c
> new file mode 100644
> index 000000000000..a976b23c5576
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/aie/mtk_aie_53.c
> @@ -0,0 +1,2031 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Fish Wu <fish.wu@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/debugfs.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <linux/types.h>
> +#include <linux/version.h>
> +#include <linux/mtk_aie_v4l2_controls.h>
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include <soc/mediatek/smi.h>
> +
> +#include "mtk_aie.h"
> +
> +static const struct mtk_aie_variant *mtk_aie_get_variant(struct device *dev);
> +
> +static struct clk_bulk_data aie_clks[] = {

Why this is file-scope not device-scope?

> +	{ .id = "IMG_IPE" },
> +	{ .id = "IPE_FDVT" },
> +	{ .id = "IPE_TOP" },
> +	{ .id = "IPE_SMI_LARB12" },
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +#define AIE_DUMP_BUFFER_SIZE (1 * 1024 * 1024)
> +#define AIE_DEBUG_RAW_DATA_SIZE (1 * 640 * 480)
> +static unsigned char srcrawdata[AIE_DEBUG_RAW_DATA_SIZE];
> +static unsigned char dstrawdata[AIE_DEBUG_RAW_DATA_SIZE];
> +static struct debugfs_blob_wrapper srcdata, dstdata;

Oh my... No, drop all these.

> +#endif
> +
> +#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION

WTF?

> +#define AIE_QOS_MAX 4
> +#define AIE_QOS_RA_IDX 0
> +#define AIE_QOS_RB_IDX 1
> +#define AIE_QOS_WA_IDX 2
> +#define AIE_QOS_WB_IDX 3
> +#define AIE_READ_AVG_BW 213
> +#define AIE_WRITE_AVG_BW 145
> +#endif
> +
> +#define V4L2_CID_MTK_AIE_MAX 2


> +
> +	opp_num = regulator_count_voltages(fd->dvfs_info->reg);
> +	of_for_each_phandle(&it, ret, fd->dvfs_info->dev->of_node, "operating-points-v2", NULL, 0) {
> +		if (!it.node) {
> +			dev_err(fd->dvfs_info->dev, "of_node_get fail\n");
> +			return ret;
> +		}
> +		np = of_node_get(it.node);
> +
> +		do {
> +			child_np = of_get_next_available_child(np, child_np);
> +			if (child_np) {
> +				of_property_read_u64(child_np, "opp-hz", &freq);
> +				of_property_read_u32(child_np, "opp-microvolt", &volt);

Whaaaaat?

Sorry, that's not how you use OPP code.

> +				if (freq == 0 || volt == 0) {
> +					dev_err(fd->dvfs_info->dev,
> +						"%s: [ERROR] parsing zero freq/volt(%d/%d) at idx(%d)\n",
> +						__func__,
> +						freq,
> +						volt,
> +						idx
> +					);
> +					continue;
> +				}
> +				fd->dvfs_info->clklv[opp_idx][idx] = freq;
> +				fd->dvfs_info->voltlv[opp_idx][idx] = volt;
> +				dev_dbg(fd->dvfs_info->dev,
> +					"[%s] opp=%d, idx=%d, clk=%d volt=%d\n",
> +					__func__,
> +					opp_idx,
> +					idx,
> +					fd->dvfs_info->clklv[opp_idx][idx],
> +					fd->dvfs_info->voltlv[opp_idx][idx]
> +				);
> +				idx++;
> +			}
> +		} while (child_np);
> +		fd->dvfs_info->clklv_num[opp_idx] = idx;
> +		fd->dvfs_info->clklv_target[opp_idx] = fd->dvfs_info->clklv[opp_idx][0];
> +		fd->dvfs_info->clklv_idx[opp_idx] = 0;
> +		idx = 0;
> +		opp_idx++;
> +		of_node_put(np);
> +	}
> +	fd->dvfs_info->cur_volt = 0;
> +
> +	return 0;
> +}

...

to err_free_dev;
> +	}
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	ret = v4l2_m2m_register_media_controller(m2m_dev, vfd, MEDIA_ENT_F_PROC_VIDEO_STATISTICS);
> +	if (ret) {
> +		dev_err(dev, "Failed to init mem2mem media controller\n");
> +		goto err_unreg_video;
> +	}
> +#endif
> +	return 0;
> +#ifdef CONFIG_MEDIA_CONTROLLER

What? Ifdef in error path?

> +err_unreg_video:
> +	video_unregister_device(vfd);
> +#endif
> +err_free_dev:
> +	return ret;
> +}
> +
> +static int mtk_aie_dev_v4l2_init(struct mtk_aie_dev *fd)
> +{
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	struct media_device *mdev = &fd->mdev;
> +#endif
> +	struct device *dev = fd->dev;
> +	int ret = -EINVAL;
> +
> +	ret = v4l2_device_register(dev, &fd->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register v4l2 device\n");
> +		return ret;
> +	}
> +
> +	fd->m2m_dev = v4l2_m2m_init(&fd_m2m_ops);
> +	if (IS_ERR(fd->m2m_dev)) {
> +		dev_err(dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(fd->m2m_dev);
> +		goto err_unreg_v4l2_dev;
> +	}
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	mdev->dev = dev;
> +	strscpy(mdev->model, dev_driver_string(dev), sizeof(mdev->model));
> +	media_device_init(mdev);
> +	mdev->ops = &fd_m2m_media_ops;
> +	fd->v4l2_dev.mdev = mdev;
> +#endif
> +
> +	ret = mtk_aie_video_device_register(fd);
> +	if (ret)
> +		goto err_cleanup_mdev;
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER

Why do you have so many ifdefs?

> +	ret = media_device_register(mdev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register mem2mem media device\n");
> +		goto err_unreg_vdev;
> +	}
> +#endif
> +	return 0;
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER

No, that's unreadable code.

> +err_unreg_vdev:
> +	v4l2_m2m_unregister_media_controller(fd->m2m_dev);
> +	video_unregister_device(&fd->vfd);
> +#endif
> +err_cleanup_mdev:
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	media_device_cleanup(mdev);
> +#endif
> +	v4l2_m2m_release(fd->m2m_dev);
> +err_unreg_v4l2_dev:
> +	v4l2_device_unregister(&fd->v4l2_dev);
> +	return ret;
> +}
> +
> +static void mtk_aie_video_device_unregister(struct mtk_aie_dev *fd)
> +{
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	v4l2_m2m_unregister_media_controller(fd->m2m_dev);
> +#endif
> +	video_unregister_device(&fd->vfd);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	media_device_cleanup(&fd->mdev);
> +#endif
> +	v4l2_m2m_release(fd->m2m_dev);
> +	v4l2_device_unregister(&fd->v4l2_dev);
> +}
> +

...

> +
> +static int mtk_aie_probe(struct platform_device *pdev)
> +{
> +	struct mtk_aie_dev *fd = NULL;

Why do you assign it?

> +	struct device *dev = &pdev->dev;
> +

Drop

> +	int irq = -1;

What is this style?

> +	int ret = -EINVAL;

And here?

> +
> +	fd = devm_kzalloc(&pdev->dev, sizeof(struct mtk_aie_dev), GFP_KERNEL);

sizeof(*)

Don't send downstream junk code. There is no reason why reviewers have
to correct the same mistakes which were already corrected.

> +	if (!fd)
> +		return -ENOMEM;
> +
> +	fd->variant = mtk_aie_get_variant(dev);
> +	if (!fd->variant)
> +		return -ENODEV;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
> +	if (ret) {
> +		dev_err(dev, "%s: No suitable DMA available\n", __func__);
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(dev, fd);
> +	fd->dev = dev;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "Failed to get irq by platform: %d\n", irq);
> +		return irq;
> +	}
> +
> +	ret = devm_request_irq(dev,
> +			       irq,
> +			       mtk_aie_irq,
> +			       IRQF_SHARED,
> +			       dev_driver_string(dev),
> +			       fd
> +		);

That's an unreadable crap.

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
> +	ret = mtk_aie_debugfs_init(fd);
> +	if (ret)
> +		goto err_free;
> +
> +	ret = mtk_aie_resource_init(fd);
> +	if (ret)
> +		goto err_free;

Why do you disable runtime PM? This does not make sense.

> +	pm_runtime_enable(dev);
> +	ret = mtk_aie_dev_v4l2_init(fd);
> +	if (ret)
> +		goto err_free;
> +	dev_info(dev, "AIE : Success to %s\n", __func__);

No, drop. Srsly.

> +
> +	return 0;
> +
> +err_free:
> +	pm_runtime_disable(&pdev->dev);
> +	mtk_aie_resource_free(pdev);
> +
> +	return ret;
> +}
> +
> +static void mtk_aie_remove(struct platform_device *pdev)
> +{
> +	struct mtk_aie_dev *fd = dev_get_drvdata(&pdev->dev);
> +
> +	mtk_aie_video_device_unregister(fd);
> +	pm_runtime_disable(&pdev->dev);
> +	mtk_aie_debugfs_free(pdev);
> +	mtk_aie_resource_free(pdev);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	kfree(fd->tr_info.dump_buffer);
> +#endif
> +}
> +
> +static int mtk_aie_suspend(struct device *dev)
> +{
> +	struct mtk_aie_dev *fd = dev_get_drvdata(dev);
> +	int ret = -EINVAL, num = 0;
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	num = atomic_read(&fd->num_composing);
> +	dev_info(dev, "%s: suspend aie job start, num(%d)\n", __func__, num);

NAK, drop.

> +
> +	ret = wait_event_timeout(fd->flushing_waitq,
> +				 !(num = atomic_read(&fd->num_composing)),
> +				 msecs_to_jiffies(MTK_FD_HW_TIMEOUT_IN_MSEC)
> +		);
> +	if (!ret && num) {
> +		dev_dbg(dev,
> +			"%s: flushing aie job timeout num %d\n",
> +			__func__,
> +			num
> +		);
> +
> +		return -EBUSY;
> +	}
> +
> +	dev_info(dev, "%s: suspend aie job end num(%d)\n", __func__, num);

NAK

> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int mtk_aie_resume(struct device *dev)
> +{
> +	int ret = -EINVAL;
> +
> +	dev_info(dev, "%s: resume aie job start)\n", __func__);

Omg, you keep going...


> +
> +static struct platform_driver mtk_aie_driver = {
> +	.probe = mtk_aie_probe,
> +	.remove = mtk_aie_remove,
> +	.driver = {
> +			.name = "mtk-aie-5.3",

Messed indentation

> +			.of_match_table = of_match_ptr(mtk_aie_of_ids),

Test your code. You have warnings here - drop of_match_ptr.


I am not going to review the rest. Sorry, this code is very poor quality
and does not meet criteria of sending upstream.

Do not, really, do not throw downstream code at the community.

Best regards,
Krzysztof


