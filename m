Return-Path: <linux-media+bounces-12334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D68328D600A
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 12:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF1511C239ED
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 10:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21D6157466;
	Fri, 31 May 2024 10:51:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF5E1420D0;
	Fri, 31 May 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717152670; cv=none; b=q/IE5kO4V3XEkPnBqs66CP17Ktpuhbam2XchSs14mHi3W7m55F2i1riLj9hqDIP47WG5QZTae19tBotnPNEj5gZc2QiE67u6ROHqUYOcUUQMZf8IBHW2UwkI27QQ1KkwrThx85kyMpuBOneFiOtn2AwNMHc1lm6Knt9V03SIu3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717152670; c=relaxed/simple;
	bh=WOHhcE2/uO66i+vWFu7D9FK6bePWoSV3J/vaxz7or3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7GgIv3o7h2MzvGirczMh7TIECWpRC8tlQPH6gsHn5eZiDO+123jYJYCfYQsa0Zu072zzE00WhEYJHFMIbML7GptBHmRQQWSAITurISzFjkMswkjmvw4XOGVU4Sehw3z9ZM/VVkrwYMqtoAZg0fxjtdyZ0LPDWYHR0RU1eOPWDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6737C32789;
	Fri, 31 May 2024 10:51:07 +0000 (UTC)
Message-ID: <77bb14be-cbd3-48a9-a974-9332f63c16f9@xs4all.nl>
Date: Fri, 31 May 2024 12:51:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240424024215.1624299-1-yuji2.ishikawa@toshiba.co.jp>
 <20240424024215.1624299-4-yuji2.ishikawa@toshiba.co.jp>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240424024215.1624299-4-yuji2.ishikawa@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yuji,

Some comments below:

On 24/04/2024 04:42, Yuji Ishikawa wrote:
> Add support to Video Input Interface on Toshiba Visconti ARM SoCs.
> The interface device includes CSI2 Receiver,
> frame grabber, video DMAC and image signal processor.
> 
> A driver instance provides three /dev/videoX device files;
> one for RGB image capture, another one for optional RGB capture
> with different parameters and the last one for RAW capture.
> 
> Through the device files, the driver provides streaming interface.
> Both DMABUF and MMAP operations are supported.
> A userland application should feed phisically continuous
> DMA-BUF instances as capture buffers.
> 
> The driver is based on media controller framework.
> Its operations are roughly mapped to three subdrivers;
> CSI2 receiver subdevice, ISP subdevice and capture devices.
> 
> The Video DMACs have 32bit address space
> and currently corresponding IOMMU driver is not provided.
> Therefore, memory-block address for captured image is 32bit IOVA
> which is equal to 32bit-truncated phisical address.
> When the Visconti IOMMU driver (currently under development) is accepted,
> the hardware layer will use 32bit IOVA mapped by the attached IOMMU.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---
> Changelog v2:
> - Resend v1 because a patch exceeds size limit.
> 
> Changelog v3:
> - Adapted to media control framework
> - Introduced ISP subdevice, capture device
> - Remove private IOCTLs and add vendor specific V4L2 controls
> - Change function name avoiding camelcase and uppercase letters
> 
> Changelog v4:
> - fix style problems at the v3 patch
> - remove "index" member
> - update example
> - Split patches because the v3 patch exceeds size limit
> - Stop using ID number to identify driver instance:
>   - Use dynamically allocated structure to hold driver's context,
>     instead of static one indexed by ID number.
>   - internal functions accept context structure instead of ID number.
> - Use pm_runtime to trigger initialization of HW
>   along with open/close of device files.
>   
> Changelog v5:
> - Fix coding style problems in viif.c
> 
> Changelog v6:
> - update dependency description of Kconfig
> - bugfix: usage of buffer pointed with dma_active
> - remove unused macros
> - add viif_common.c for commonly used register buffer control routine
> - add initialization of Bus Controller (HWAIF) and Memory Protection Unit
> - removed hwd_ and HWD_ prefix
> - update source code documentation
> - Suggestion from Hans Verkuil
>   - pointer to userland memory is removed from uAPI arguments
>     - style of structure is now "nested" instead of "chained by pointer";
>   - use div64_u64 for 64bit division
>   - define Visconti specific control IDs in v4l2-controls.h
>   - set proper initial size to v4l2_ctrl_handler_init()
>   - set all buffers to QUEUED state on an error at start_streaming
>   - use vb2_is_busy() instead of vb2_is_streaming()
>   - add parameter check for s->type and s->target in get_selection()
>   - remove ioctls related to DV format and EDID
>   - release v4l2 fh instance on and error at opening device file
>   - support VB2_MMAP mode for streaming operation 
>   - add initial value to each vendor specific control
>   - GET_LAST_CAPTURE_STATUS control is updated asyncnously from workqueue
>   - applied v4l2-compliance
> - Suggestion from Sakari Ailus
>   - use div64_u64 for 64bit division
>   - update copyright's year
>   - use common definition of MIPI CSI2 DataTypes
>   - remove redandunt cast
>   - use bool instead of HWD_VIIF_ENABLE/DISABLE
>   - simplify comparison to 0
>   - simplify statements with trigram operator
>   - remove redundant local variables
>   - simplify timeout loop
>   - use general integer types instead of u32/s32
> - Suggestion from Laurent Pinchart
>   - moved VIIF driver to driver/platform/toshiba/visconti
>   - add CSI2RX subdevice
>   - change register access: struct-style to macro-style
>   - use common definition of MIPI CSI2 DataTypes
>   - Kconfig: add SPDX header, add V4L2_ASYNC
>   - remove unused type definitions
>   - define enums instead of successive macro constants
>   - remove redundant parenthesis of macro constant
>   - embed struct hwd_res into struct viif_device
>   - turn switch-case into table lookup
>   - use xxx_dma instead of xxx_paddr for variable names of IOVA
>   - literal value: just 0 instead of 0x0
>   - use literal 1 or 0 instead of HWD_VIIF_ENABLE, DISABLE for register access
>   - use true or false instead of HWD_VIIF_ENABLE, DISABLE for function calls
>   - remove ioctl request handlers which refers subdevices
> 
> Changelog v7:
> - change compatible string to visconti5-viif
> - remove unused variables
> - set static to internal functions
> - Suggestion from kernel test robot <lkp@intel.com>
>   - update references to headers
> 
> Changelog v8:
> - bugfix: handling return value of visconti_viiif_parse_dt()
> - add visconti_viif_subdev_notifier_register() to gather
>   all operations around v4l2_async_notifier
> - update for v6.6-rc2
>   - use v4l2_async_connection instead of v4l2_async_subdev
>   - aid for devices using subdev active state
> - add __maybe_unused for runtime_pm callbacks
> - Suggestion from Krzysztof Kozlowski
>   - use static initialization of local variable
>   - use dev_err_probe()
>   - remove error message for DMA memory allocation failure
>   - remove unused comment messages
>   - add error handling at fail of workqueue_create()
>   - remove redundant mutex for pm_runtime callback routines
> - Suggestion from Hans Verkuil
>   - remove pr_info() calls
>   - build check with media_stage.git 
>   - some lacks for kerneldoc description
> 
> Changelog v9:
> - applied sparse checker
>   - add static qualifier to a file scoped local variable
>   - expand functions for acquiring/releasing locks
> - bugfix: use NULL (instead of 0) for pad::get_fmt subdevice API
> - fix warnings for cast between ptr and dma_addr_t
> - call div64_u64 for 64bit division
> - rebase to media_staging tree; update Visconti specific control IDs
> 
> Changelog v10:
> - remove vendor specific compound controls
> - remove "rawpack mode" flag
>   - RAW16, RAW18, RAW20 (to be implemented and tested) should be used instead
> - catch up to v6.9-rc4
> 

<snip>

> diff --git a/drivers/media/platform/toshiba/visconti/viif_capture.c b/drivers/media/platform/toshiba/visconti/viif_capture.c
> new file mode 100644
> index 0000000000..221b9a1ba3
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/visconti/viif_capture.c
> @@ -0,0 +1,1472 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +/* Toshiba Visconti Video Capture Support
> + *
> + * (C) Copyright 2023 TOSHIBA CORPORATION
> + * (C) Copyright 2023 Toshiba Electronic Devices & Storage Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/pm_runtime.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "viif.h"
> +#include "viif_capture.h"
> +#include "viif_common.h"
> +#include "viif_isp.h"
> +#include "viif_regs.h"
> +
> +/* single plane for RGB/Grayscale types, 3 planes for YUV types */
> +#define VIIF_MAX_PLANE_NUM 3
> +
> +/* maximum horizontal/vertical position/dimension of CROP with ISP */
> +#define VIIF_CROP_MAX_X_ISP 8062U
> +#define VIIF_CROP_MAX_Y_ISP 3966U
> +#define VIIF_CROP_MAX_W_ISP 8190U
> +#define VIIF_CROP_MAX_H_ISP 4094U
> +
> +/* minimum horizontal/vertical dimension of CROP */
> +#define VIIF_CROP_MIN_W 128U
> +#define VIIF_CROP_MIN_H 128U
> +
> +/* maximum output size with ISP */
> +#define VIIF_MAX_OUTPUT_IMG_WIDTH_ISP  5760U
> +#define VIIF_MAX_OUTPUT_IMG_HEIGHT_ISP 3240U
> +#define VIIF_MAX_PITCH_ISP	       32704U
> +
> +/* maximum output size for SUB path */
> +#define VIIF_MAX_OUTPUT_IMG_WIDTH_SUB  4096U
> +#define VIIF_MAX_OUTPUT_IMG_HEIGHT_SUB 2160U
> +#define VIIF_MAX_PITCH		       65536U
> +
> +/* minimum output size */
> +#define VIIF_MIN_OUTPUT_IMG_WIDTH  128U
> +#define VIIF_MIN_OUTPUT_IMG_HEIGHT 128U
> +
> +/* DMA settings for SUB path */
> +#define VDMAC_SRAM_BASE_ADDR_W03 0x440U
> +#define SRAM_SIZE_W_PORT	 0x200
> +
> +enum viif_color_format {
> +	VIIF_YCBCR422_8_PACKED = 0,
> +	VIIF_RGB888_PACKED = 1U,
> +	VIIF_ARGB8888_PACKED = 3U,
> +	VIIF_YCBCR422_8_PLANAR = 8U,
> +	VIIF_RGB888_YCBCR444_8_PLANAR = 9U,
> +	VIIF_ONE_COLOR_8 = 11U,
> +	VIIF_YCBCR422_16_PLANAR = 12U,
> +	VIIF_RGB161616_YCBCR444_16_PLANAR = 13U,
> +	VIIF_ONE_COLOR_16 = 15U
> +};
> +
> +/**
> + * struct viif_csc_param - color conversion information
> + * @r_cr_in_offset: input offset of R/Cr
> + * @g_y_in_offset: input offset of G/Y
> + * @b_cb_in_offset: input offset of B/Cb
> + * @coef: coefficient of matrix.
> + * @r_cr_out_offset: output offset of R/Cr
> + * @g_y_out_offset: output offset of G/Y
> + * @b_cb_out_offset: output offset of B/Cb
> + *
> + * Range of parameters is:
> + *
> + * - {r_cr,g_y,b_cb}_{in,out}_offset
> + *
> + *   - Range: [0x0..0x1FFFF]
> + *
> + * - coef
> + *
> + *   - Range: [0x0..0xFFFF]
> + *   - [0] : c00(YG_YG), [1] : c01(UB_YG), [2] : c02(VR_YG),
> + *   - [3] : c10(YG_UB), [4] : c11(UB_UB), [5] : c12(VR_UB),
> + *   - [6] : c20(YG_VR), [7] : c21(UB_VR), [8] : c22(VR_VR)
> + */
> +struct viif_csc_param {
> +	u32 r_cr_in_offset;
> +	u32 g_y_in_offset;
> +	u32 b_cb_in_offset;
> +	u32 coef[9];
> +	u32 r_cr_out_offset;
> +	u32 g_y_out_offset;
> +	u32 b_cb_out_offset;
> +};
> +
> +/**
> + * struct viif_pixelmap - pixelmap information
> + * @pmap_dma: start address of pixel data(DMA address). 4byte alignment.
> + * @pitch: pitch size of pixel map [unit: byte]
> + *
> + * Condition of pitch in case of L2ISP output is as below.
> + *
> + * * max: 32704
> + * * min: max (active width of image * k / r, 128)
> + * * alignment: 64
> + *
> + * Condition of pitch in the other cases is as below.
> + *
> + * * max: 65536
> + * * min: active width of image * k / r
> + * * alignment: 4
> + *
> + * k is the size of 1 pixel and the value is as below.
> + *
> + * * VIIF_YCBCR422_8_PACKED: 2
> + * * VIIF_RGB888_PACKED: 3
> + * * VIIF_ARGB8888_PACKED: 4
> + * * VIIF_YCBCR422_8_PLANAR: 1
> + * * VIIF_RGB888_YCBCR444_8_PLANAR: 1
> + * * VIIF_ONE_COLOR_8: 1
> + * * VIIF_YCBCR422_16_PLANAR: 2
> + * * VIIF_RGB161616_YCBCR444_16_PLANAR: 2
> + * * VIIF_ONE_COLOR_16: 2
> + *
> + * r is the correction factor for Cb or Cr of YCbCr422 planar and the value is as below.
> + *
> + * * YCbCr422 Cb-planar: 2
> + * * YCbCr422 Cr-planar: 2
> + * * others: 1
> + */
> +struct viif_pixelmap {
> +	dma_addr_t pmap_dma;
> +	u32 pitch;
> +};
> +
> +/**
> + * struct viif_img - image information
> + * @width: active width of image [unit: pixel]
> + * * Range: [128..5760](output from L2ISP)
> + * * Range: [128..4096](output from SUB unit)
> + * * The value should be even.
> + *
> + * @height: active height of image[line]
> + * * Range: [128..3240](output from L2ISP)
> + * * Range: [128..2160](output from SUB unit)
> + * * The value should be even.
> + *
> + * @format: viif_color_format "color format"
> + * * Below color formats are supported for input and output of MAIN unit
> + * * VIIF_YCBCR422_8_PACKED
> + * * VIIF_RGB888_PACKED
> + * * VIIF_ARGB8888_PACKED
> + * * VIIF_YCBCR422_8_PLANAR
> + * * VIIF_RGB888_YCBCR444_8_PLANAR
> + * * VIIF_ONE_COLOR_8
> + * * VIIF_YCBCR422_16_PLANAR
> + * * VIIF_RGB161616_YCBCR444_16_PLANAR
> + * * VIIF_ONE_COLOR_16
> + * * Below color formats are supported for output of SUB unit
> + * * VIIF_ONE_COLOR_8
> + * * VIIF_ONE_COLOR_16
> + *
> + * @pixelmap: pixelmap information
> + * * [0]: Y/G-planar, packed/Y/RAW
> + * * [1]: Cb/B-planar
> + * * [2]: Cr/R-planar
> + */
> +struct viif_img {
> +	u32 width;
> +	u32 height;
> +	enum viif_color_format format;
> +	struct viif_pixelmap pixelmap[VIIF_MAX_PLANE_NUM];
> +};
> +
> +/*=============================================*/
> +/* Low Layer Implementation */
> +/*=============================================*/
> +/**
> + * viif_l2_set_output_csc() - Set output CSC parameters of L2ISP
> + *
> + * @viif_dev: the VIIF device
> + * @post_id: POST ID. Range: [0..1]
> + * @param: Pointer to output csc parameters of L2ISP
> + */
> +static int viif_l2_set_output_csc(struct viif_device *viif_dev, u32 post_id,
> +				  const struct viif_csc_param *param)
> +{
> +	/* disable csc matrix when param is NULL */
> +	if (!param) {
> +		viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB(post_id), 0);
> +		return 0;
> +	}
> +
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_YG_OFFSETI(post_id),
> +			   param->g_y_in_offset);
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_YG1(post_id),
> +			   FIELD_CSC_MTB_LOWER(param->coef[0]));
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_YG2(post_id),
> +			   FIELD_CSC_MTB_UPPER(param->coef[1]) |
> +				   FIELD_CSC_MTB_LOWER(param->coef[2]));
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_YG_OFFSETO(post_id),
> +			   param->g_y_out_offset);
> +
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CB_OFFSETI(post_id),
> +			   param->b_cb_in_offset);
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CB1(post_id),
> +			   FIELD_CSC_MTB_LOWER(param->coef[3]));
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CB2(post_id),
> +			   FIELD_CSC_MTB_UPPER(param->coef[4]) |
> +				   FIELD_CSC_MTB_LOWER(param->coef[5]));
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CB_OFFSETO(post_id),
> +			   param->b_cb_out_offset);
> +
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CR_OFFSETI(post_id),
> +			   param->r_cr_in_offset);
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CR1(post_id),
> +			   FIELD_CSC_MTB_LOWER(param->coef[6]));
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CR2(post_id),
> +			   FIELD_CSC_MTB_UPPER(param->coef[7]) |
> +				   FIELD_CSC_MTB_LOWER(param->coef[8]));
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CR_OFFSETO(post_id),
> +			   param->r_cr_out_offset);
> +
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB(post_id), 1);
> +
> +	return 0;
> +}
> +
> +struct viif_out_format_spec {
> +	int num_planes;
> +	int bytes_per_px;
> +	int pitch_align;
> +	int skips_px[3];
> +};
> +
> +static struct viif_out_format_spec out_format_spec[] = {
> +	[VIIF_YCBCR422_8_PACKED] = {
> +		.num_planes = 1,
> +		.bytes_per_px = 2,
> +		.pitch_align = 256,
> +		.skips_px = {1},
> +	},
> +	[VIIF_RGB888_PACKED] = {
> +		.num_planes = 1,
> +		.bytes_per_px = 3,
> +		.pitch_align = 384,
> +		.skips_px = {1},
> +	},
> +	[VIIF_ARGB8888_PACKED] = {
> +		.num_planes = 1,
> +		.bytes_per_px = 4,
> +		.pitch_align = 512,
> +		.skips_px = {1},
> +	},
> +	[VIIF_ONE_COLOR_8] = {
> +		.num_planes = 1,
> +		.bytes_per_px = 1,
> +		.pitch_align = 128,
> +		.skips_px = {1},
> +	},
> +	[VIIF_ONE_COLOR_16] = {
> +		.num_planes = 1,
> +		.bytes_per_px = 2,
> +		.pitch_align = 128,
> +		.skips_px = {1},
> +	},
> +	[VIIF_YCBCR422_8_PLANAR] = {
> +		.num_planes = 3,
> +		.bytes_per_px = 1,
> +		.pitch_align = 128,
> +		.skips_px = {1, 2, 2},
> +	},
> +	[VIIF_RGB888_YCBCR444_8_PLANAR] = {
> +		.num_planes = 3,
> +		.bytes_per_px = 1,
> +		.pitch_align = 128,
> +		.skips_px = {1, 1, 1},
> +	},
> +	[VIIF_YCBCR422_16_PLANAR] = {
> +		.num_planes = 3,
> +		.bytes_per_px = 2,
> +		.pitch_align = 128,
> +		.skips_px = {1, 2, 2},
> +	},
> +	[VIIF_RGB161616_YCBCR444_16_PLANAR] = {
> +		.num_planes = 3,
> +		.bytes_per_px = 2,
> +		.pitch_align = 128,
> +		.skips_px = {1, 1, 1}
> +	}
> +};
> +
> +/**
> + * viif_l2_set_img_transmission() - Set image transfer condition of L2ISP
> + *
> + * @viif_dev: the VIIF device
> + * @post_id: POST ID. Range: [0..1]
> + * @enable: set True to enable image transfer of MAIN unit.
> + * @src: Pointer to crop area information
> + * @out_process: Pointer to output process information
> + * @img: Pointer to output image information
> + *
> + * see also: #viif_l2_set_roi_path
> + */
> +static int viif_l2_set_img_transmission(struct viif_device *viif_dev, u32 post_id, bool enable,
> +					const struct viif_img_area *src,
> +					const struct viif_out_process *out_process,
> +					const struct viif_img *img)
> +{
> +	dma_addr_t img_start_addr[VIIF_MAX_PLANE_NUM];
> +	u32 pitch[VIIF_MAX_PLANE_NUM];
> +	struct viif_out_format_spec *spec;
> +	unsigned int i;
> +
> +	/* pitch alignment for planar or one color format */
> +	if (post_id >= VIIF_MAX_POST_NUM || (enable && (!src || !out_process)) ||
> +	    (!enable && (src || out_process))) {
> +		return -EINVAL;
> +	}
> +
> +	/* DISABLE: no DMA transmission setup, set minimum crop rectangle */
> +	if (!enable) {
> +		viif_dev->l2_roi_path_info.post_enable_flag[post_id] = false;
> +		viif_dev->l2_roi_path_info.post_crop_x[post_id] = 0U;
> +		viif_dev->l2_roi_path_info.post_crop_y[post_id] = 0U;
> +		viif_dev->l2_roi_path_info.post_crop_w[post_id] = VIIF_CROP_MIN_W;
> +		viif_dev->l2_roi_path_info.post_crop_h[post_id] = VIIF_CROP_MIN_H;
> +		visconti_viif_l2_set_roi_path(viif_dev);
> +
> +		return 0;
> +	}
> +
> +	if (out_process->select_color != VIIF_COLOR_Y_G &&
> +	    out_process->select_color != VIIF_COLOR_U_B &&
> +	    out_process->select_color != VIIF_COLOR_V_R &&
> +	    out_process->select_color != VIIF_COLOR_YUV_RGB) {
> +		return -EINVAL;
> +	}
> +
> +	if (img->format != VIIF_ARGB8888_PACKED && out_process->alpha)
> +		return -EINVAL;
> +
> +	if ((img->width % 2U) || (img->height % 2U) || img->width < VIIF_MIN_OUTPUT_IMG_WIDTH ||
> +	    img->height < VIIF_MIN_OUTPUT_IMG_HEIGHT ||
> +	    img->width > VIIF_MAX_OUTPUT_IMG_WIDTH_ISP ||
> +	    img->height > VIIF_MAX_OUTPUT_IMG_HEIGHT_ISP) {
> +		return -EINVAL;
> +	}
> +
> +	if (src->x > VIIF_CROP_MAX_X_ISP || src->y > VIIF_CROP_MAX_Y_ISP ||
> +	    src->w < VIIF_CROP_MIN_W || src->w > VIIF_CROP_MAX_W_ISP || src->h < VIIF_CROP_MIN_H ||
> +	    src->h > VIIF_CROP_MAX_H_ISP) {
> +		return -EINVAL;
> +	}
> +
> +	if (out_process->half_scale) {
> +		if ((src->w != (img->width * 2U)) || (src->h != (img->height * 2U)))
> +			return -EINVAL;
> +	} else {
> +		if (src->w != img->width || src->h != img->height)
> +			return -EINVAL;
> +	}
> +
> +	if (out_process->select_color == VIIF_COLOR_Y_G ||
> +	    out_process->select_color == VIIF_COLOR_U_B ||
> +	    out_process->select_color == VIIF_COLOR_V_R) {
> +		if (img->format != VIIF_ONE_COLOR_8 && img->format != VIIF_ONE_COLOR_16)
> +			return -EINVAL;
> +	}
> +
> +	spec = &out_format_spec[img->format];
> +	if (!spec->num_planes)
> +		return -EINVAL;
> +
> +	for (i = 0; i < spec->num_planes; i++) {
> +		img_start_addr[i] = (u32)img->pixelmap[i].pmap_dma;
> +		pitch[i] = img->pixelmap[i].pitch;
> +	}
> +
> +	for (i = 0; i < spec->num_planes; i++) {
> +		u32 pitch_req = max(((img->width * spec->bytes_per_px) / spec->skips_px[i]), 128U);
> +
> +		if (pitch[i] < pitch_req || pitch[i] > VIIF_MAX_PITCH_ISP ||
> +		    (pitch[i] % spec->pitch_align) || (img_start_addr[i] % 4U)) {
> +			return -EINVAL;
> +		}
> +	}
> +
> +	viif_capture_write(viif_dev, REG_L2_POST_X_OUT_STADR_G(post_id), (u32)img_start_addr[0]);
> +	viif_capture_write(viif_dev, REG_L2_POST_X_OUT_PITCH_G(post_id), pitch[0]);
> +	if (spec->num_planes == 3) {
> +		viif_capture_write(viif_dev, REG_L2_POST_X_OUT_STADR_B(post_id),
> +				   (u32)img_start_addr[1]);
> +		viif_capture_write(viif_dev, REG_L2_POST_X_OUT_STADR_R(post_id),
> +				   (u32)img_start_addr[2]);
> +		viif_capture_write(viif_dev, REG_L2_POST_X_OUT_PITCH_B(post_id), pitch[1]);
> +		viif_capture_write(viif_dev, REG_L2_POST_X_OUT_PITCH_R(post_id), pitch[2]);
> +	}
> +
> +	/* Set CROP */
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CAP_OFFSET(post_id), (src->y << 16U) | src->x);
> +	viif_capture_write(viif_dev, REG_L2_POST_X_CAP_SIZE(post_id), (src->h << 16U) | src->w);
> +
> +	/* Set output process */
> +	viif_capture_write(viif_dev, REG_L2_POST_X_HALF_SCALE_EN(post_id),
> +			   out_process->half_scale ? 1 : 0);
> +	viif_capture_write(viif_dev, REG_L2_POST_X_C_SELECT(post_id), out_process->select_color);
> +	viif_capture_write(viif_dev, REG_L2_POST_X_OPORTALP(post_id), (u32)out_process->alpha);
> +	viif_capture_write(viif_dev, REG_L2_POST_X_OPORTFMT(post_id), img->format);
> +
> +	/* Update ROI area and input to each POST */
> +	viif_dev->l2_roi_path_info.post_enable_flag[post_id] = true;
> +	viif_dev->l2_roi_path_info.post_crop_x[post_id] = src->x;
> +	viif_dev->l2_roi_path_info.post_crop_y[post_id] = src->y;
> +	viif_dev->l2_roi_path_info.post_crop_w[post_id] = src->w;
> +	viif_dev->l2_roi_path_info.post_crop_h[post_id] = src->h;
> +	visconti_viif_l2_set_roi_path(viif_dev);
> +
> +	return 0;
> +}
> +
> +/**
> + * viif_sub_set_img_transmission() - Set image transfer condition of SUB unit
> + *
> + * @viif_dev: the VIIF device
> + * @img: Pointer to output image information
> + */
> +static int viif_sub_set_img_transmission(struct viif_device *viif_dev, const struct viif_img *img)
> +{
> +	dma_addr_t img_start_addr, img_end_addr;
> +	u32 data_width, pitch, height;
> +	u32 bytes_px, port_control;
> +
> +	/* disable VDMAC when img is NULL */
> +	if (!img) {
> +		viif_capture_write(viif_dev, REG_IPORTS_IMGEN, 0);
> +		port_control = ~((u32)1U << 3U) & viif_capture_read(viif_dev, REG_VDM_W_ENABLE);
> +		viif_capture_write(viif_dev, REG_VDM_W_ENABLE, port_control);
> +		return 0;
> +	}
> +
> +	if ((img->width % 2U) || (img->height % 2U))
> +		return -EINVAL;
> +
> +	if (img->width < VIIF_MIN_OUTPUT_IMG_WIDTH || img->height < VIIF_MIN_OUTPUT_IMG_HEIGHT ||
> +	    img->width > VIIF_MAX_OUTPUT_IMG_WIDTH_SUB ||
> +	    img->height > VIIF_MAX_OUTPUT_IMG_HEIGHT_SUB) {
> +		return -EINVAL;
> +	}
> +
> +	img_start_addr = (u32)img->pixelmap[0].pmap_dma;
> +	pitch = img->pixelmap[0].pitch;
> +	height = img->height;
> +
> +	switch (img->format) {
> +	case VIIF_ONE_COLOR_8:
> +		data_width = 0U;
> +		img_end_addr = img_start_addr + img->width - 1U;
> +		bytes_px = 1;
> +		break;
> +	case VIIF_ONE_COLOR_16:
> +		data_width = 1U;
> +		img_end_addr = img_start_addr + (img->width * 2U) - 1U;
> +		bytes_px = 2;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (img_start_addr % 4U)
> +		return -EINVAL;
> +
> +	if ((pitch < (img->width * bytes_px)) || pitch > VIIF_MAX_PITCH || (pitch % 4U))
> +		return -EINVAL;
> +
> +	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_SRAM_BASE(IDX_WPORT_SUB_IMG),
> +			   VDMAC_SRAM_BASE_ADDR_W03);
> +	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_SRAM_SIZE(IDX_WPORT_SUB_IMG),
> +			   SRAM_SIZE_W_PORT);
> +	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_STADR(IDX_WPORT_SUB_IMG),
> +			   (u32)img_start_addr);
> +	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_ENDADR(IDX_WPORT_SUB_IMG),
> +			   (u32)img_end_addr);
> +	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_HEIGHT(IDX_WPORT_SUB_IMG), height);
> +	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_PITCH(IDX_WPORT_SUB_IMG), pitch);
> +	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_CFG0(IDX_WPORT_SUB_IMG), data_width << 8U);
> +	port_control = BIT(3) | viif_capture_read(viif_dev, REG_VDM_W_ENABLE);
> +	viif_capture_write(viif_dev, REG_VDM_W_ENABLE, port_control);
> +	viif_capture_write(viif_dev, REG_IPORTS_IMGEN, 1);
> +
> +	return 0;
> +}
> +
> +/*=============================================*/
> +/* handling V4L2 framework */
> +/*=============================================*/
> +struct viif_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +};
> +
> +static inline struct viif_buffer *vb2_to_viif(struct vb2_v4l2_buffer *vbuf)
> +{
> +	return container_of(vbuf, struct viif_buffer, vb);
> +}
> +
> +static inline struct cap_dev *video_drvdata_to_capdev(struct file *file)
> +{
> +	return (struct cap_dev *)video_drvdata(file);
> +}
> +
> +static inline struct cap_dev *vb2queue_to_capdev(struct vb2_queue *vq)
> +{
> +	return (struct cap_dev *)vb2_get_drv_priv(vq);
> +}
> +
> +/* ----- ISRs and VB2 Operations ----- */
> +static int viif_set_img(struct cap_dev *cap_dev, struct vb2_buffer *vb)
> +{
> +	struct v4l2_pix_format_mplane *pix = &cap_dev->v4l2_pix;
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	struct viif_img next_out_img;
> +	int i, ret = 0;
> +
> +	next_out_img.width = pix->width;
> +	next_out_img.height = pix->height;
> +	next_out_img.format = cap_dev->out_format;
> +
> +	for (i = 0; i < pix->num_planes; i++) {
> +		next_out_img.pixelmap[i].pitch = pix->plane_fmt[i].bytesperline;
> +		next_out_img.pixelmap[i].pmap_dma = vb2_dma_contig_plane_dma_addr(vb, i);
> +	}
> +
> +	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0) {
> +		spin_lock(&viif_dev->regbuf_lock);
> +		hwd_viif_isp_guard_start(viif_dev);
> +		ret = viif_l2_set_img_transmission(viif_dev, VIIF_L2ISP_POST_0, true,
> +						   &cap_dev->img_area, &cap_dev->out_process,
> +						   &next_out_img);
> +		hwd_viif_isp_guard_end(viif_dev);
> +		spin_unlock(&viif_dev->regbuf_lock);
> +		if (ret)
> +			dev_err(viif_dev->dev, "set img error. %d\n", ret);
> +	} else if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST1) {
> +		spin_lock(&viif_dev->regbuf_lock);
> +		hwd_viif_isp_guard_start(viif_dev);
> +		ret = viif_l2_set_img_transmission(viif_dev, VIIF_L2ISP_POST_1, true,
> +						   &cap_dev->img_area, &cap_dev->out_process,
> +						   &next_out_img);
> +		hwd_viif_isp_guard_end(viif_dev);
> +		spin_unlock(&viif_dev->regbuf_lock);
> +		if (ret)
> +			dev_err(viif_dev->dev, "set img error. %d\n", ret);
> +	} else if (cap_dev->pathid == CAPTURE_PATH_SUB) {
> +		spin_lock(&viif_dev->regbuf_lock);
> +		hwd_viif_isp_guard_start(viif_dev);
> +		ret = viif_sub_set_img_transmission(viif_dev, &next_out_img);
> +		hwd_viif_isp_guard_end(viif_dev);
> +		spin_unlock(&viif_dev->regbuf_lock);
> +		if (ret)
> +			dev_err(viif_dev->dev, "set img error. %d\n", ret);
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * viif_capture_switch_buffer() is called from interrupt service routine
> + * triggered by VSync with some fixed delay.
> + * The function may switch DMA target buffer by calling viif_set_img().
> + * The VIIF DMA HW captures the destination address at next VSync
> + * and completes transfer at one more after.
> + * Therefore, filled buffer is available at the one after next ISR.
> + *
> + * To avoid DMA HW getting stucked, we always need to set valid destination address.
> + * If a prepared buffer is not available, we reuse the buffer currently being transferred to.
> + *
> + * The cap_dev structure has two pointers and a queue to handle video buffers;
> + + Description of each item at the entry of this function:
> + * * buf_queue:  holds prepared buffers, set by vb2_queue()
> + * * active:     pointing at address captured (and to be filled) by DMA HW
> + * * dma_active: pointing at buffer filled by DMA HW
> + *
> + * Rules to update items:
> + * * when buf_queue is not empty, "active" buffer goes "dma_active"
> + * * when buf_queue is empty:
> + *   * "active" buffer stays the same (DMA HW fills the same buffer for coming two frames)
> + *   * "dma_active" gets NULL (filled buffer will be reused; should not go "DONE" at next ISR)
> + *
> + * Simulation:
> + * | buf_queue   | active  | dma_active | note |
> + * | X           | NULL    | NULL       |      |
> + * <QBUF BUF0>
> + * | X           | BUF0    | NULL       | BUF0 stays |
> + * | X           | BUF0    | NULL       | BUF0 stays |
> + * <QBUF BUF1>
> + * <QBUF BUF2>
> + * | BUF2 BUF1   | BUF0    | NULL       |      |
> + * | BUF2        | BUF1    | BUF0       | BUF0 goes DONE |
> + * | X           | BUF2    | BUF1       | BUF1 goes DONE, BUF2 stays |
> + * | X           | BUF2    | NULL       | BUF2 stays |
> + */
> +void visconti_viif_capture_switch_buffer(struct cap_dev *cap_dev, u32 status_err,
> +					 u32 l2_transfer_status, u64 timestamp)
> +{
> +	spin_lock(&cap_dev->buf_lock);
> +
> +	if (cap_dev->dma_active) {
> +		/* DMA has completed and another framebuffer instance is set */
> +		struct vb2_v4l2_buffer *vbuf = cap_dev->dma_active;
> +		enum vb2_buffer_state state;
> +
> +		cap_dev->buf_cnt--;
> +		vbuf->vb2_buf.timestamp = timestamp;
> +		vbuf->sequence = cap_dev->sequence++;
> +		vbuf->field = V4L2_FIELD_NONE;
> +		if (status_err || l2_transfer_status)
> +			state = VB2_BUF_STATE_ERROR;
> +		else
> +			state = VB2_BUF_STATE_DONE;
> +
> +		vb2_buffer_done(&vbuf->vb2_buf, state);
> +	}
> +
> +	/* QUEUE pop to register an instance as next DMA target; if empty, reuse current instance */
> +	if (!list_empty(&cap_dev->buf_queue)) {
> +		struct viif_buffer *buf =
> +			list_entry(cap_dev->buf_queue.next, struct viif_buffer, queue);
> +		list_del_init(&buf->queue);
> +		viif_set_img(cap_dev, &buf->vb.vb2_buf);
> +		cap_dev->dma_active = cap_dev->active;
> +		cap_dev->active = &buf->vb;
> +	} else {
> +		cap_dev->dma_active = NULL;
> +	}
> +
> +	spin_unlock(&cap_dev->buf_lock);
> +}
> +
> +/* --- Capture buffer control --- */
> +static int viif_vb2_setup(struct vb2_queue *vq, unsigned int *count, unsigned int *num_planes,
> +			  unsigned int sizes[], struct device *alloc_devs[])
> +{
> +	struct cap_dev *cap_dev = vb2queue_to_capdev(vq);
> +	struct v4l2_pix_format_mplane *pix = &cap_dev->v4l2_pix;
> +	unsigned int i;
> +
> +	/* num_planes is set: just check plane sizes. */
> +	if (*num_planes) {
> +		for (i = 0; i < pix->num_planes; i++)
> +			if (sizes[i] < pix->plane_fmt[i].sizeimage)
> +				return -EINVAL;
> +
> +		return 0;
> +	}
> +
> +	/* num_planes not set: called from REQBUFS, just set plane sizes. */
> +	*num_planes = pix->num_planes;
> +	for (i = 0; i < pix->num_planes; i++)
> +		sizes[i] = pix->plane_fmt[i].sizeimage;
> +
> +	cap_dev->buf_cnt = 0;
> +
> +	return 0;
> +}
> +
> +static void viif_vb2_queue(struct vb2_buffer *vb)
> +{
> +	struct cap_dev *cap_dev = vb2queue_to_capdev(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct viif_buffer *buf = vb2_to_viif(vbuf);
> +	unsigned long irqflags;
> +
> +	spin_lock_irqsave(&cap_dev->buf_lock, irqflags);
> +
> +	list_add_tail(&buf->queue, &cap_dev->buf_queue);
> +	cap_dev->buf_cnt++;
> +
> +	spin_unlock_irqrestore(&cap_dev->buf_lock, irqflags);
> +}
> +
> +static int viif_vb2_prepare(struct vb2_buffer *vb)
> +{
> +	struct cap_dev *cap_dev = vb2queue_to_capdev(vb->vb2_queue);
> +	struct v4l2_pix_format_mplane *pix = &cap_dev->v4l2_pix;
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	unsigned int i;
> +
> +	for (i = 0; i < pix->num_planes; i++) {
> +		if (vb2_plane_size(vb, i) < pix->plane_fmt[i].sizeimage) {
> +			dev_err(viif_dev->dev, "Plane size too small (%lu < %u)\n",
> +				vb2_plane_size(vb, i), pix->plane_fmt[i].sizeimage);

Make this dev_info. It is a user-space problem, not a driver/hw error.

> +			return -EINVAL;
> +		}
> +
> +		vb2_set_plane_payload(vb, i, pix->plane_fmt[i].sizeimage);
> +	}
> +	return 0;
> +}
> +
> +static void viif_return_all_buffers(struct cap_dev *cap_dev, enum vb2_buffer_state state)
> +{
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	struct viif_buffer *buf;
> +	unsigned long irqflags;
> +
> +	spin_lock_irqsave(&cap_dev->buf_lock, irqflags);
> +
> +	/* buffer control */
> +	if (cap_dev->active) {
> +		vb2_buffer_done(&cap_dev->active->vb2_buf, state);
> +		cap_dev->buf_cnt--;
> +		cap_dev->active = NULL;
> +	}
> +	if (cap_dev->dma_active) {
> +		vb2_buffer_done(&cap_dev->dma_active->vb2_buf, state);
> +		cap_dev->buf_cnt--;
> +		cap_dev->dma_active = NULL;
> +	}
> +
> +	/* Release all queued buffers. */
> +	list_for_each_entry(buf, &cap_dev->buf_queue, queue) {
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		cap_dev->buf_cnt--;
> +	}
> +	INIT_LIST_HEAD(&cap_dev->buf_queue);
> +	if (cap_dev->buf_cnt)
> +		dev_err(viif_dev->dev, "Buffer count error %d\n", cap_dev->buf_cnt);
> +
> +	spin_unlock_irqrestore(&cap_dev->buf_lock, irqflags);
> +}
> +
> +static int viif_l2_set_format(struct cap_dev *cap_dev);
> +static int viif_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct cap_dev *cap_dev = vb2queue_to_capdev(vq);
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	int ret = 0;
> +
> +	mutex_lock(&viif_dev->stream_lock);
> +
> +	/* note that pipe is shared among paths; see pipe.streaming_count member variable */
> +	ret = video_device_pipeline_start(&cap_dev->vdev, &viif_dev->pipe);
> +	if (ret) {
> +		dev_err(viif_dev->dev, "start pipeline failed %d\n", ret);
> +		goto release_lock;
> +	}
> +
> +	/* buffer control */
> +	cap_dev->sequence = 0;
> +
> +	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0) {
> +		/* Currently, only path0 (MAIN POST0) initializes ISP and Camera */
> +		/* Possibly, initialization can be done when pipe.streaming_count==0 */
> +		ret = visconti_viif_isp_main_set_unit(viif_dev);
> +		if (ret) {
> +			dev_err(viif_dev->dev, "Setting up main path0 L1ISP failed %d\n", ret);
> +			goto config_path_end;
> +		}
> +		ret = viif_l2_set_format(cap_dev);
> +		if (ret) {
> +			dev_err(viif_dev->dev, "Setting up main path0 L2VDM failed %d\n", ret);
> +			goto config_path_end;
> +		}
> +		ret = v4l2_subdev_call(&viif_dev->isp_subdev.sd, video, s_stream, true);
> +		if (ret)
> +			dev_err(viif_dev->dev, "Start isp subdevice stream failed. %d\n", ret);
> +	} else if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST1) {
> +		ret = viif_l2_set_format(cap_dev);
> +		if (ret)
> +			dev_err(viif_dev->dev, "Setting up main path1 L2VDM failed %d\n", ret);
> +	} else {
> +		cap_dev->out_format = (cap_dev->v4l2_pix.pixelformat == V4L2_PIX_FMT_SRGGB8) ?
> +						    VIIF_ONE_COLOR_8 :
> +						    VIIF_ONE_COLOR_16;
> +		ret = visconti_viif_isp_sub_set_unit(viif_dev);
> +		if (ret)
> +			dev_err(viif_dev->dev, "Setting up sub path failed %d\n", ret);
> +	}
> +config_path_end:
> +	if (ret) {
> +		viif_return_all_buffers(cap_dev, VB2_BUF_STATE_QUEUED);
> +		video_device_pipeline_stop(&cap_dev->vdev);
> +		ret = -EPIPE;
> +	}
> +release_lock:
> +	mutex_unlock(&viif_dev->stream_lock);
> +	return ret;
> +}
> +
> +static void viif_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct cap_dev *cap_dev = vb2queue_to_capdev(vq);
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	int ret;
> +
> +	mutex_lock(&viif_dev->stream_lock);
> +
> +	/* Currently, only path0 (MAIN POST0) stops ISP and Camera */
> +	/* Possibly, teardown can be done when pipe.streaming_count==0 */
> +	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0) {
> +		ret = v4l2_subdev_call(&viif_dev->isp_subdev.sd, video, s_stream, false);
> +		if (ret)
> +			dev_err(viif_dev->dev, "Stop isp subdevice stream failed %d\n", ret);
> +	}
> +
> +	viif_return_all_buffers(cap_dev, VB2_BUF_STATE_ERROR);
> +	video_device_pipeline_stop(&cap_dev->vdev);
> +	mutex_unlock(&viif_dev->stream_lock);
> +}
> +
> +static const struct vb2_ops viif_vb2_ops = {
> +	.queue_setup = viif_vb2_setup,
> +	.buf_queue = viif_vb2_queue,
> +	.buf_prepare = viif_vb2_prepare,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.start_streaming = viif_start_streaming,
> +	.stop_streaming = viif_stop_streaming,
> +};
> +
> +/* --- VIIF hardware settings --- */
> +/* L2ISP output csc setting for YUV to RGB(ITU-R BT.709) */
> +static const struct viif_csc_param viif_csc_yuv2rgb = {
> +	.r_cr_in_offset = 0x18000,
> +	.g_y_in_offset = 0x1f000,
> +	.b_cb_in_offset = 0x18000,
> +	.coef = {
> +			[0] = 0x1000,
> +			[1] = 0xfd12,
> +			[2] = 0xf8ad,
> +			[3] = 0x1000,
> +			[4] = 0x1d07,
> +			[5] = 0x0000,
> +			[6] = 0x1000,
> +			[7] = 0x0000,
> +			[8] = 0x18a2,
> +		},
> +	.r_cr_out_offset = 0x1000,
> +	.g_y_out_offset = 0x1000,
> +	.b_cb_out_offset = 0x1000,
> +};
> +
> +/* L2ISP output csc setting for RGB to YUV(ITU-R BT.709) */
> +static const struct viif_csc_param viif_csc_rgb2yuv = {
> +	.r_cr_in_offset = 0x1f000,
> +	.g_y_in_offset = 0x1f000,
> +	.b_cb_in_offset = 0x1f000,
> +	.coef = {
> +			[0] = 0x0b71,
> +			[1] = 0x0128,
> +			[2] = 0x0367,
> +			[3] = 0xf9b1,
> +			[4] = 0x082f,
> +			[5] = 0xfe20,
> +			[6] = 0xf891,
> +			[7] = 0xff40,
> +			[8] = 0x082f,
> +		},
> +	.r_cr_out_offset = 0x8000,
> +	.g_y_out_offset = 0x1000,
> +	.b_cb_out_offset = 0x8000,
> +};
> +
> +static int viif_l2_set_format(struct cap_dev *cap_dev)
> +{
> +	struct v4l2_pix_format_mplane *pix = &cap_dev->v4l2_pix;
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	const struct viif_csc_param *csc_param = NULL;
> +	struct v4l2_subdev_selection sel = {
> +		.target = V4L2_SEL_TGT_CROP,
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	bool inp_is_rgb = false;
> +	bool out_is_rgb = false;
> +	u32 postid;
> +	int ret;
> +
> +	/* check path id */
> +	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0) {
> +		sel.pad = VIIF_ISP_PAD_SRC_PATH0;
> +		fmt.pad = VIIF_ISP_PAD_SRC_PATH0;
> +		postid = VIIF_L2ISP_POST_0;
> +	} else if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST1) {
> +		sel.pad = VIIF_ISP_PAD_SRC_PATH1;
> +		fmt.pad = VIIF_ISP_PAD_SRC_PATH1;
> +		postid = VIIF_L2ISP_POST_1;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	cap_dev->out_process.half_scale = false;
> +	cap_dev->out_process.select_color = VIIF_COLOR_YUV_RGB;
> +	cap_dev->out_process.alpha = 0;
> +
> +	ret = v4l2_subdev_call(&viif_dev->isp_subdev.sd, pad, get_selection, NULL, &sel);
> +	if (ret) {
> +		cap_dev->img_area.x = 0;
> +		cap_dev->img_area.y = 0;
> +		cap_dev->img_area.w = pix->width;
> +		cap_dev->img_area.h = pix->height;
> +	} else {
> +		cap_dev->img_area.x = sel.r.left;
> +		cap_dev->img_area.y = sel.r.top;
> +		cap_dev->img_area.w = sel.r.width;
> +		cap_dev->img_area.h = sel.r.height;
> +	}
> +
> +	ret = v4l2_subdev_call(&viif_dev->isp_subdev.sd, pad, get_fmt, NULL, &fmt);
> +	if (!ret)
> +		inp_is_rgb = (fmt.format.code == MEDIA_BUS_FMT_RGB888_1X24);
> +
> +	switch (pix->pixelformat) {
> +	case V4L2_PIX_FMT_RGB24:
> +		cap_dev->out_format = VIIF_RGB888_PACKED;
> +		out_is_rgb = true;
> +		break;
> +	case V4L2_PIX_FMT_ABGR32:
> +		cap_dev->out_format = VIIF_ARGB8888_PACKED;
> +		cap_dev->out_process.alpha = 0xff;
> +		out_is_rgb = true;
> +		break;
> +	case V4L2_PIX_FMT_YUV422M:
> +		cap_dev->out_format = VIIF_YCBCR422_8_PLANAR;
> +		break;
> +	case V4L2_PIX_FMT_YUV444M:
> +		cap_dev->out_format = VIIF_RGB888_YCBCR444_8_PLANAR;
> +		break;
> +	case V4L2_PIX_FMT_Y16:
> +		cap_dev->out_format = VIIF_ONE_COLOR_16;
> +		cap_dev->out_process.select_color = VIIF_COLOR_Y_G;
> +		break;
> +	}
> +
> +	if (!inp_is_rgb && out_is_rgb)
> +		csc_param = &viif_csc_yuv2rgb; /* YUV -> RGB */
> +	else if (inp_is_rgb && !out_is_rgb)
> +		csc_param = &viif_csc_rgb2yuv; /* RGB -> YUV */
> +
> +	return viif_l2_set_output_csc(viif_dev, postid, csc_param);
> +}
> +
> +/* --- IOCTL Operations --- */
> +static const struct viif_fmt viif_capture_fmt_list_mainpath[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_RGB24,
> +		.bpp = { 24, 0, 0 },
> +		.num_planes = 1,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.pitch_align = 384,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_ABGR32,
> +		.bpp = { 32, 0, 0 },
> +		.num_planes = 1,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.pitch_align = 512,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUV422M,
> +		.bpp = { 8, 4, 4 },
> +		.num_planes = 3,
> +		.colorspace = V4L2_COLORSPACE_REC709,
> +		.pitch_align = 128,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUV444M,
> +		.bpp = { 8, 8, 8 },
> +		.num_planes = 3,
> +		.colorspace = V4L2_COLORSPACE_REC709,
> +		.pitch_align = 128,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_Y16,
> +		.bpp = { 16, 0, 0 },
> +		.num_planes = 1,
> +		.colorspace = V4L2_COLORSPACE_REC709,
> +		.pitch_align = 128,
> +	},
> +};
> +
> +static const struct viif_fmt viif_capture_fmt_list_subpath[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB8,
> +		.bpp = { 8, 0, 0 },
> +		.num_planes = 1,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.pitch_align = 256,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB10,
> +		.bpp = { 16, 0, 0 },
> +		.num_planes = 1,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.pitch_align = 256,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB12,
> +		.bpp = { 16, 0, 0 },
> +		.num_planes = 1,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.pitch_align = 256,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB14,
> +		.bpp = { 16, 0, 0 },
> +		.num_planes = 1,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.pitch_align = 256,
> +	},
> +};
> +
> +static const struct viif_fmt *get_viif_fmt_from_fourcc(struct cap_dev *cap_dev, unsigned int fourcc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < cap_dev->fmt_size; i++) {
> +		const struct viif_fmt *fmt = &cap_dev->fmts[i];
> +
> +		if (fmt->fourcc == fourcc)
> +			return fmt;
> +	}
> +	return NULL;
> +}
> +
> +static u32 get_pixelformat_from_fourcc(struct cap_dev *cap_dev, unsigned int fourcc)
> +{
> +	const struct viif_fmt *fmt = get_viif_fmt_from_fourcc(cap_dev, fourcc);
> +
> +	return fmt ? fmt->fourcc : cap_dev->fmts[0].fourcc;
> +}
> +
> +static u32 get_pixelformat_from_mbus_code(struct cap_dev *cap_dev, unsigned int mbus_code)
> +{
> +	const struct viif_fmt *fmt;
> +	unsigned int fourcc;
> +
> +	switch (mbus_code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		fourcc = V4L2_PIX_FMT_SRGGB8;
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +		fourcc = V4L2_PIX_FMT_SRGGB10;
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +		fourcc = V4L2_PIX_FMT_SRGGB12;
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +		fourcc = V4L2_PIX_FMT_SRGGB14;
> +		break;
> +	default:
> +		return cap_dev->fmts[0].fourcc;
> +	}
> +
> +	fmt = get_viif_fmt_from_fourcc(cap_dev, fourcc);
> +	return fmt ? fmt->fourcc : cap_dev->fmts[0].fourcc;
> +}
> +
> +static void viif_calc_plane_sizes(struct cap_dev *cap_dev, struct v4l2_pix_format_mplane *pix)
> +{
> +	const struct viif_fmt *viif_fmt = get_viif_fmt_from_fourcc(cap_dev, pix->pixelformat);
> +	unsigned int i;
> +
> +	for (i = 0; i < viif_fmt->num_planes; i++) {
> +		struct v4l2_plane_pix_format *plane_i = &pix->plane_fmt[i];
> +		unsigned int bpl;
> +
> +		memset(plane_i, 0, sizeof(*plane_i));
> +		bpl = roundup(pix->width * viif_fmt->bpp[i] / 8, viif_fmt->pitch_align);
> +
> +		plane_i->bytesperline = bpl;
> +		plane_i->sizeimage = pix->height * bpl;
> +	}
> +	pix->num_planes = viif_fmt->num_planes;
> +}
> +
> +static int viif_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
> +{
> +	struct viif_device *viif_dev = video_drvdata_to_capdev(file)->viif_dev;
> +
> +	strscpy(cap->driver, VIIF_DRIVER_NAME, sizeof(cap->driver));
> +	snprintf(cap->card, sizeof(cap->card), "%s-%s", VIIF_DRIVER_NAME, dev_name(viif_dev->dev));
> +	/* TODO: platform:visconti-viif-0,1,2,3 for each VIIF driver instance */
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "%s-0", VIIF_BUS_INFO_BASE);
> +
> +	return 0;
> +}
> +
> +static int viif_enum_fmt_vid_cap(struct file *file, void *priv, struct v4l2_fmtdesc *f)
> +{
> +	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
> +
> +	if (f->index >= cap_dev->fmt_size)
> +		return -EINVAL;
> +
> +	f->pixelformat = cap_dev->fmts[f->index].fourcc;
> +	return 0;
> +}
> +
> +static void viif_try_fmt(struct cap_dev *cap_dev, struct v4l2_pix_format_mplane *pix)
> +{
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	struct v4l2_subdev_format format = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	int ret;
> +
> +	/* check path id */
> +	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0)
> +		format.pad = VIIF_ISP_PAD_SRC_PATH0;
> +	else if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST1)
> +		format.pad = VIIF_ISP_PAD_SRC_PATH1;
> +	else
> +		format.pad = VIIF_ISP_PAD_SRC_PATH2;
> +
> +	pix->field = V4L2_FIELD_NONE;
> +	pix->colorspace = V4L2_COLORSPACE_DEFAULT;
> +	pix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	pix->quantization = V4L2_QUANTIZATION_DEFAULT;
> +
> +	ret = v4l2_subdev_call(&viif_dev->isp_subdev.sd, pad, get_fmt, NULL, &format);
> +	if (ret) {
> +		/* minimal default format */
> +		pix->width = VIIF_MIN_OUTPUT_IMG_WIDTH;
> +		pix->height = VIIF_MIN_OUTPUT_IMG_HEIGHT;
> +		pix->pixelformat = (cap_dev->pathid == CAPTURE_PATH_SUB) ? V4L2_PIX_FMT_SRGGB8 :
> +										 V4L2_PIX_FMT_RGB24;
> +		viif_calc_plane_sizes(cap_dev, pix);
> +		return;
> +	}
> +
> +	pix->width = format.format.width;
> +	pix->height = format.format.height;
> +
> +	/* check output format */
> +	if (cap_dev->pathid == CAPTURE_PATH_SUB)
> +		pix->pixelformat = get_pixelformat_from_mbus_code(cap_dev, format.format.code);
> +	else
> +		pix->pixelformat = get_pixelformat_from_fourcc(cap_dev, pix->pixelformat);
> +
> +	/* update derived parameters, such as bpp */
> +	viif_calc_plane_sizes(cap_dev, pix);
> +}
> +
> +static int viif_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
> +
> +	viif_try_fmt(cap_dev, &f->fmt.pix_mp);
> +	return 0;
> +}
> +
> +static int viif_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
> +
> +	if (vb2_is_busy(&cap_dev->vb2_vq))
> +		return -EBUSY;
> +
> +	if (f->type != cap_dev->vb2_vq.type)
> +		return -EINVAL;

I don't believe this test is needed.

> +
> +	viif_try_fmt(cap_dev, &f->fmt.pix_mp);
> +	cap_dev->v4l2_pix = f->fmt.pix_mp;
> +
> +	return 0;
> +}
> +
> +static int viif_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
> +
> +	f->fmt.pix_mp = cap_dev->v4l2_pix;
> +
> +	return 0;
> +}
> +
> +static int viif_enum_framesizes(struct file *file, void *fh, struct v4l2_frmsizeenum *fsize)
> +{
> +	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
> +
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	if (!get_viif_fmt_from_fourcc(cap_dev, fsize->pixel_format))
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +	fsize->stepwise.min_width = VIIF_MIN_OUTPUT_IMG_WIDTH;
> +	fsize->stepwise.max_width = (cap_dev->pathid == CAPTURE_PATH_SUB) ?
> +						  VIIF_MAX_OUTPUT_IMG_WIDTH_SUB :
> +						  VIIF_MAX_OUTPUT_IMG_WIDTH_ISP;
> +	fsize->stepwise.min_height = VIIF_MIN_OUTPUT_IMG_HEIGHT;
> +	fsize->stepwise.max_height = (cap_dev->pathid == CAPTURE_PATH_SUB) ?
> +						   VIIF_MAX_OUTPUT_IMG_HEIGHT_SUB :
> +						   VIIF_MAX_OUTPUT_IMG_HEIGHT_ISP;
> +	fsize->stepwise.step_width = 1;
> +	fsize->stepwise.step_height = 1;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops viif_ioctl_ops = {
> +	.vidioc_querycap = viif_querycap,
> +
> +	.vidioc_enum_fmt_vid_cap = viif_enum_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap_mplane = viif_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap_mplane = viif_s_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap_mplane = viif_g_fmt_vid_cap,
> +
> +	.vidioc_enum_framesizes = viif_enum_framesizes,
> +
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +
> +	.vidioc_log_status = v4l2_ctrl_log_status,
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +/* --- File Operations --- */
> +static const struct v4l2_pix_format_mplane pixm_default[3] = {
> +	{
> +		.pixelformat = V4L2_PIX_FMT_RGB24,
> +		.width = 1920,
> +		.height = 1080,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +	},
> +	{
> +		.pixelformat = V4L2_PIX_FMT_RGB24,
> +		.width = 1920,
> +		.height = 1080,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +	},
> +	{
> +		.pixelformat = V4L2_PIX_FMT_SRGGB8,
> +		.width = 1920,
> +		.height = 1080,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +	}
> +};
> +
> +static int viif_capture_open(struct file *file)
> +{
> +	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	int ret;
> +
> +	ret = v4l2_fh_open(file);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(viif_dev->dev);
> +	if (ret) {
> +		v4l2_fh_release(file);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int viif_capture_release(struct file *file)
> +{
> +	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +
> +	vb2_fop_release(file);
> +	pm_runtime_put(viif_dev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations viif_fops = {
> +	.owner = THIS_MODULE,
> +	.open = viif_capture_open,
> +	.release = viif_capture_release,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = vb2_fop_mmap,
> +	.poll = vb2_fop_poll,
> +};
> +
> +/* ----- media control callbacks ----- */
> +static int viif_capture_link_validate(struct media_link *link)
> +{
> +	/* link validation at start-stream */
> +	return 0;
> +}
> +
> +static const struct media_entity_operations viif_media_ops = {
> +	.link_validate = viif_capture_link_validate,
> +};
> +
> +/* ----- attach ctrl callbacck handler ----- */

callbacck -> callback

> +int visconti_viif_capture_register_ctrl_handlers(struct viif_device *viif_dev)
> +{
> +	struct v4l2_subdev *sensor_sd = viif_dev->sensor_sd;
> +	int ret;
> +
> +	if (!sensor_sd)
> +		return -EINVAL;
> +
> +	/* MAIN POST0: merge controls of ISP and sensor */
> +	ret = v4l2_ctrl_add_handler(&viif_dev->cap_dev0.ctrl_handler, sensor_sd->ctrl_handler, NULL,
> +				    true);
> +	if (ret) {
> +		dev_err(viif_dev->dev, "Failed to add sensor ctrl_handler");
> +		return ret;
> +	}
> +
> +	/* MAIN POST1: merge controls of ISP and sensor */
> +	ret = v4l2_ctrl_add_handler(&viif_dev->cap_dev1.ctrl_handler, sensor_sd->ctrl_handler, NULL,
> +				    true);
> +	if (ret) {
> +		dev_err(viif_dev->dev, "Failed to add sensor ctrl_handler");
> +		return ret;
> +	}

For a Media Controller device you shouldn't merge the sensor controls into the
main driver. The application software (libcamera) will handle the sensor controls
directly through the v4l-subdevX device.

> +
> +	/* SUB: no control is exported */
> +
> +	return 0;
> +}
> +
> +/* ----- register/remove capture device node ----- */
> +static int visconti_viif_capture_register_node(struct cap_dev *cap_dev)
> +{
> +	struct viif_device *viif_dev = cap_dev->viif_dev;
> +	struct v4l2_device *v4l2_dev = &viif_dev->v4l2_dev;
> +	struct video_device *vdev = &cap_dev->vdev;
> +	struct vb2_queue *q = &cap_dev->vb2_vq;
> +	static const char *const node_name[] = {
> +		"viif_capture_post0",
> +		"viif_capture_post1",
> +		"viif_capture_sub",
> +	};
> +	struct v4l2_pix_format_mplane pixm;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&cap_dev->buf_queue);
> +
> +	mutex_init(&cap_dev->vlock);
> +	spin_lock_init(&cap_dev->buf_lock);
> +
> +	/* Initialize image format */
> +	pixm = pixm_default[cap_dev->pathid];
> +	viif_try_fmt(cap_dev, &pixm);
> +	cap_dev->v4l2_pix = pixm;
> +
> +	/* Initialize vb2 queue. */
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->min_queued_buffers = 3;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->ops = &viif_vb2_ops;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->drv_priv = cap_dev;
> +	q->buf_struct_size = sizeof(struct viif_buffer);
> +	q->lock = &cap_dev->vlock;
> +	q->dev = viif_dev->v4l2_dev.dev;
> +
> +	ret = vb2_queue_init(q);
> +	if (ret)
> +		return ret;
> +
> +	/* Register the video device. */
> +	strscpy(vdev->name, node_name[cap_dev->pathid], sizeof(vdev->name));
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->lock = &cap_dev->vlock;
> +	vdev->queue = &cap_dev->vb2_vq;
> +	vdev->ctrl_handler = NULL;
> +	vdev->fops = &viif_fops;
> +	vdev->ioctl_ops = &viif_ioctl_ops;
> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING;
> +	vdev->device_caps |= V4L2_CAP_IO_MC;
> +	vdev->entity.ops = &viif_media_ops;
> +	vdev->release = video_device_release_empty;
> +	video_set_drvdata(vdev, cap_dev);
> +	vdev->vfl_dir = VFL_DIR_RX;
> +	cap_dev->capture_pad.flags = MEDIA_PAD_FL_SINK;
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret < 0) {
> +		dev_err(v4l2_dev->dev, "video_register_device failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = media_entity_pads_init(&vdev->entity, 1, &cap_dev->capture_pad);
> +	if (ret) {
> +		video_unregister_device(vdev);
> +		return ret;
> +	}
> +
> +	ret = v4l2_ctrl_handler_init(&cap_dev->ctrl_handler, 30);
> +	if (ret)
> +		return -ENOMEM;
> +
> +	cap_dev->vdev.ctrl_handler = &cap_dev->ctrl_handler;
> +
> +	return 0;
> +}
> +
> +int visconti_viif_capture_register(struct viif_device *viif_dev)
> +{
> +	int ret;
> +
> +	/* register MAIN POST0 (primary RGB)*/
> +	viif_dev->cap_dev0.pathid = CAPTURE_PATH_MAIN_POST0;
> +	viif_dev->cap_dev0.viif_dev = viif_dev;
> +	viif_dev->cap_dev0.fmts = viif_capture_fmt_list_mainpath;
> +	viif_dev->cap_dev0.fmt_size = ARRAY_SIZE(viif_capture_fmt_list_mainpath);
> +	ret = visconti_viif_capture_register_node(&viif_dev->cap_dev0);
> +	if (ret)
> +		return ret;
> +
> +	/* register MAIN POST1 (additional RGB)*/
> +	viif_dev->cap_dev1.pathid = CAPTURE_PATH_MAIN_POST1;
> +	viif_dev->cap_dev1.viif_dev = viif_dev;
> +	viif_dev->cap_dev1.fmts = viif_capture_fmt_list_mainpath;
> +	viif_dev->cap_dev1.fmt_size = ARRAY_SIZE(viif_capture_fmt_list_mainpath);
> +	ret = visconti_viif_capture_register_node(&viif_dev->cap_dev1);
> +	if (ret)
> +		return ret;
> +
> +	/* register SUB (RAW) */
> +	viif_dev->cap_dev2.pathid = CAPTURE_PATH_SUB;
> +	viif_dev->cap_dev2.viif_dev = viif_dev;
> +	viif_dev->cap_dev2.fmts = viif_capture_fmt_list_subpath;
> +	viif_dev->cap_dev2.fmt_size = ARRAY_SIZE(viif_capture_fmt_list_subpath);
> +	ret = visconti_viif_capture_register_node(&viif_dev->cap_dev2);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void visconti_viif_capture_unregister_node(struct cap_dev *cap_dev)
> +{
> +	media_entity_cleanup(&cap_dev->vdev.entity);
> +	v4l2_ctrl_handler_free(&cap_dev->ctrl_handler);
> +	vb2_video_unregister_device(&cap_dev->vdev);
> +	mutex_destroy(&cap_dev->vlock);
> +}
> +
> +void visconti_viif_capture_unregister(struct viif_device *viif_dev)
> +{
> +	visconti_viif_capture_unregister_node(&viif_dev->cap_dev0);
> +	visconti_viif_capture_unregister_node(&viif_dev->cap_dev1);
> +	visconti_viif_capture_unregister_node(&viif_dev->cap_dev2);
> +}

<snip>

Regards,

	Hans


