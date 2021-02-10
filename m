Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9300D317056
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 20:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhBJTiE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 14:38:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbhBJThA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 14:37:00 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1029C061756
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 11:36:18 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u25so4631178lfc.2
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 11:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hp2dUa8cH83tZtlTFAjgHjS/61+xLMRZ6W1MFUnHIyY=;
        b=AkHBFQq/QXMp+vSnOaLrRkW9UL5OlE9CKktda09eYkHMUznU8mFFKQdwKXIQt51uBk
         J6EtqPkq0M55oYG3LUVfsLbxhTjoOtdiu9g/sTOvDJBpS6ybuz8R8Ko6wtmI/syNB2JS
         6rzpaF/eCuSQIVdXdqe4wuwYHpGe7MnWJWKHwFmTgdEDH60PBe3CI37XbtF42ObgWBdq
         i6hZRreABQzTxtlCCUH7b7kHchHOqLtaYryzva24rnPmEdoDnmIqjhRY/FIA5mc0PQbH
         yD2H9BdbMEhJbGUh4ftxU+S7tRDMQx5RRMkn4DaKxzGkkjBn2oHCaDc2MIORfCli2ZNH
         Uisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hp2dUa8cH83tZtlTFAjgHjS/61+xLMRZ6W1MFUnHIyY=;
        b=tsOYzQLsJqM1FlqGBlRAv8tABkgmNzZm0Y/0Owid9CEJvru5/Bge+yInRbiynpyn3G
         IIG0eeNnX2ZKWMjpS0Ju8bFzMy6YqlNoomm8g2LJbBe3w2EyqA0O2jnpJnk2tRpdZlQS
         rf4byTu9Km1Xi/NUKehP9NbE8K6A9cT2lxXVUU+KGycfVlQVH8D6YRy9bK2lNuR+y1gu
         wWvJVEeh+R7Z42C7/4laidrVw7J3C5Vgjo7xZvX+3Ya7mwZMgZCzdbR6XKQSqhfCF5Bq
         jqp97YSwEYN69ryeLUZSxZ9xdpUgmvjeUqX3PL7wbuvC0tOPzo2dxwzFa/Cw1+RLfEVL
         RgQw==
X-Gm-Message-State: AOAM530PwSydfB+zRx992evZXk8LVnHeKnOuBG1kAOzSc/kwrPzlne7A
        UmizrBrHMoowD6GWijXfLDY45w==
X-Google-Smtp-Source: ABdhPJyqBNkYB7ARRZc+bHjGssbW0fPdvnj667wtSwnQ0QxmlNWnXuYxL1KwqYv4GpmfuZarTaesvg==
X-Received: by 2002:a05:6512:3042:: with SMTP id b2mr2509923lfb.498.1612985777299;
        Wed, 10 Feb 2021 11:36:17 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id k18sm433851lfg.167.2021.02.10.11.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 11:36:16 -0800 (PST)
Subject: Re: [PATCH v4 07/22] media: camss: Add support for VFE hardware
 version Titan 170
To:     Robert Foss <robert.foss@linaro.org>, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210205104414.299732-1-robert.foss@linaro.org>
 <20210205104414.299732-8-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <e815d577-74de-ce45-848b-5baba8f5267c@linaro.org>
Date:   Wed, 10 Feb 2021 22:36:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205104414.299732-8-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thank you for your patch!

In the patchset summary email you are saying that camss does not support
the PIX interface for this generation of ISPs. But this patch still
carries quite a lot of code handling the PIX interface. Like:

-----8<-----
#define		REG_UPDATE_line_n(n)		\
			((n) == VFE_LINE_PIX ? 1 : REG_UPDATE_RDIn(n))
-----8<-----
	for (i = VFE_LINE_RDI0; i <= VFE_LINE_PIX; i++)
		if (status0 & STATUS_0_line_n_REG_UPDATE(i))
			vfe->isr_ops.reg_update(vfe, i);
-----8<-----
	switch (f->fmt.pix_mp.pixelformat) {
	case V4L2_PIX_FMT_NV12:
	case V4L2_PIX_FMT_NV21:
	case V4L2_PIX_FMT_NV16:
	case V4L2_PIX_FMT_NV61:
-----8<-----
- the NV pixel formats are only supported for PIX

-----8<-----
			if (i == VFE_LINE_PIX) {
				l->formats = formats_pix_845;
				l->nformats = ARRAY_SIZE(formats_pix_845);
			} else {
-----8<-----
static const struct camss_format_info formats_pix_845[] = {
	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
	{ MEDIA_BUS_FMT_YVYU8_1_5X8, V4L2_PIX_FMT_NV12, 1,
	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
...
-----8<-----

Guess clearing the PIX related interrupt status bits is correct (provided that
the driver doesn't try to really process them, and just clears these bits if
they happen to be set for some reason). But the rest should be removed.

One more comment inline below.

On 05.02.2021 13:43, Robert Foss wrote:
> Add register definitions for version 170 of the Titan architecture
> and implement support for the RDI output mode.
> 
> The RDI mode as opposed to the PIX output mode for the VFE unit does
> not support any ISP functionality. This means essentially only
> supporting dumping the output of the whatever the CSI decoder receives
> from the sensor.
> 
> For example will a sensor outputting YUV pixel format frames, only
> allow the VFE to dump those frames as they are received by the ISP
> to memory through the RDI interface.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1:
>   - Andrey: Removed commented out chunk
>   - Remove left over WIP comments
> 
> 
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../media/platform/qcom/camss/camss-vfe-170.c | 805 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c |  59 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h |  25 +-
>   .../media/platform/qcom/camss/camss-video.c   | 100 +++
>   drivers/media/platform/qcom/camss/camss.c     |  61 ++
>   6 files changed, 1031 insertions(+), 20 deletions(-)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 940c0ae3e003..052c4f405fa3 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -11,6 +11,7 @@ qcom-camss-objs += \
>   		camss-vfe-4-1.o \
>   		camss-vfe-4-7.o \
>   		camss-vfe-4-8.o \
> +		camss-vfe-170.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
>   		camss-video.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> new file mode 100644
> index 000000000000..b8ac3a137c8a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> @@ -0,0 +1,805 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-4-7.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v4.7
> + *
> + * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2015-2018 Linaro Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +#define VFE_HW_VERSION				(0x000)
> +
> +#define VFE_GLOBAL_RESET_CMD			(0x018)
> +#define		GLOBAL_RESET_CMD_CORE		BIT(0)
> +#define		GLOBAL_RESET_CMD_CAMIF		BIT(1)
> +#define		GLOBAL_RESET_CMD_BUS		BIT(2)
> +#define		GLOBAL_RESET_CMD_BUS_BDG	BIT(3)
> +#define		GLOBAL_RESET_CMD_REGISTER	BIT(4)
> +#define		GLOBAL_RESET_CMD_PM		BIT(5)
> +#define		GLOBAL_RESET_CMD_BUS_MISR	BIT(6)
> +#define		GLOBAL_RESET_CMD_TESTGEN	BIT(7)
> +#define		GLOBAL_RESET_CMD_DSP		BIT(8)
> +#define		GLOBAL_RESET_CMD_IDLE_CGC	BIT(9)
> +
> +#define VFE_CORE_CFG				(0x050)
> +#define		CFG_PIXEL_PATTERN_YCBYCR	(0x4)
> +#define		CFG_PIXEL_PATTERN_YCRYCB	(0x5)
> +#define		CFG_PIXEL_PATTERN_CBYCRY	(0x6)
> +#define		CFG_PIXEL_PATTERN_CRYCBY	(0x7)
> +#define		CFG_COMPOSITE_REG_UPDATE_EN	BIT(4)
> +
> +#define VFE_IRQ_CMD				(0x058)
> +#define		CMD_GLOBAL_CLEAR		BIT(0)
> +
> +#define VFE_IRQ_MASK_0					(0x05c)
> +#define		MASK_0_CAMIF_SOF			BIT(0)
> +#define		MASK_0_CAMIF_EOF			BIT(1)
> +#define		MASK_0_RDIn_REG_UPDATE(n)		BIT((n) + 5)
> +#define		MASK_0_line_n_REG_UPDATE(n)		\
> +			((n) == VFE_LINE_PIX ? \
> +				BIT(4) : MASK_0_RDIn_REG_UPDATE(n))
> +#define		MASK_0_IMAGE_MASTER_n_PING_PONG(n)	BIT((n) + 8)
> +#define		MASK_0_IMAGE_COMPOSITE_DONE_n(n)	BIT((n) + 25)
> +#define		MASK_0_RESET_ACK			BIT(31)
> +
> +#define VFE_IRQ_MASK_1					(0x060)
> +#define		MASK_1_CAMIF_ERROR			BIT(0)
> +#define		MASK_1_VIOLATION			BIT(7)
> +#define		MASK_1_BUS_BDG_HALT_ACK			BIT(8)
> +#define		MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(n)	BIT((n) + 9)
> +#define		MASK_1_RDIn_SOF(n)			BIT((n) + 29)
> +
> +#define VFE_IRQ_CLEAR_0					(0x064)
> +#define VFE_IRQ_CLEAR_1					(0x068)
> +
> +#define VFE_IRQ_STATUS_0				(0x06c)
> +#define		STATUS_0_CAMIF_SOF			BIT(0)
> +#define		STATUS_0_RDIn_REG_UPDATE(n)		BIT((n) + 5)
> +#define		STATUS_0_line_n_REG_UPDATE(n)		\
> +			((n) == VFE_LINE_PIX ? \
> +				BIT(4) : STATUS_0_RDIn_REG_UPDATE(n))
> +#define		STATUS_0_IMAGE_MASTER_n_PING_PONG(n)	BIT((n) + 8)
> +#define		STATUS_0_IMAGE_COMPOSITE_DONE_n(n)	BIT((n) + 25)
> +#define		STATUS_0_RESET_ACK			BIT(31)
> +
> +#define VFE_IRQ_STATUS_1				(0x070)
> +#define		STATUS_1_VIOLATION			BIT(7)
> +#define		STATUS_1_BUS_BDG_HALT_ACK		BIT(8)
> +#define		STATUS_1_RDIn_SOF(n)			BIT((n) + 27)
> +
> +#define VFE_VIOLATION_STATUS			(0x07c)
> +
> +#define VFE_CAMIF_CMD				(0x478)
> +#define		CMD_CLEAR_CAMIF_STATUS		BIT(2)
> +
> +#define VFE_CAMIF_CFG				(0x47c)
> +#define		CFG_VSYNC_SYNC_EDGE		(0)
> +#define			VSYNC_ACTIVE_HIGH	(0)
> +#define			VSYNC_ACTIVE_LOW	(1)
> +#define		CFG_HSYNC_SYNC_EDGE		(1)
> +#define			HSYNC_ACTIVE_HIGH	(0)
> +#define			HSYNC_ACTIVE_LOW	(1)
> +#define		CFG_VFE_SUBSAMPLE_ENABLE	BIT(4)
> +#define		CFG_BUS_SUBSAMPLE_ENABLE	BIT(5)
> +#define		CFG_VFE_OUTPUT_EN		BIT(6)
> +#define		CFG_BUS_OUTPUT_EN		BIT(7)
> +#define		CFG_BINNING_EN			BIT(9)
> +#define		CFG_FRAME_BASED_EN		BIT(10)
> +#define		CFG_RAW_CROP_EN			BIT(22)
> +
> +// XXX different, don't exist in TITAN register docs
> +#define VFE_0_CAMIF_FRAME_CFG			0x484
> +#define VFE_0_CAMIF_WINDOW_WIDTH_CFG		0x488
> +#define VFE_0_CAMIF_WINDOW_HEIGHT_CFG		0x48c
> +#define VFE_0_CAMIF_SUBSAMPLE_CFG		0x490
> +#define VFE_0_CAMIF_IRQ_FRAMEDROP_PATTERN	0x498
> +#define VFE_0_CAMIF_IRQ_SUBSAMPLE_PATTERN	0x49c
> +#define VFE_0_CAMIF_STATUS			0x4a4
> +#define VFE_0_CAMIF_STATUS_HALT			BIT(31)
> +#define CAMIF_TIMEOUT_SLEEP_US 1000
> +#define CAMIF_TIMEOUT_ALL_US 1000000
> +
> +#define VFE_REG_UPDATE_CMD			(0x4ac)
> +#define		REG_UPDATE_RDIn(n)		BIT(1 + (n))
> +#define		REG_UPDATE_line_n(n)		\
> +			((n) == VFE_LINE_PIX ? 1 : REG_UPDATE_RDIn(n))
> +
> +
> +#define VFE_BUS_IRQ_MASK(n)		(0x2044 + (n) * 4)
> +#define VFE_BUS_IRQ_CLEAR(n)		(0x2050 + (n) * 4)
> +
> +#define VFE_BUS_IRQ_STATUS(n)		(0x205c + (n) * 4)
> +#define		STATUS0_COMP_RESET_DONE		BIT(0)
> +#define		STATUS0_COMP_REG_UPDATE0_DONE	BIT(1)
> +#define		STATUS0_COMP_REG_UPDATE1_DONE	BIT(2)
> +#define		STATUS0_COMP_REG_UPDATE2_DONE	BIT(3)
> +#define		STATUS0_COMP_REG_UPDATE3_DONE	BIT(4)
> +#define		STATUS0_COMP_REG_UPDATE_DONE(n)	BIT(n + 1)
> +#define		STATUS0_COMP0_BUF_DONE		BIT(5)
> +#define		STATUS0_COMP1_BUF_DONE		BIT(6)
> +#define		STATUS0_COMP2_BUF_DONE		BIT(7)
> +#define		STATUS0_COMP3_BUF_DONE		BIT(8)
> +#define		STATUS0_COMP4_BUF_DONE		BIT(9)
> +#define		STATUS0_COMP5_BUF_DONE		BIT(10)
> +#define		STATUS0_COMP_BUF_DONE(n)	BIT(n + 5)
> +#define		STATUS0_COMP_ERROR		BIT(11)
> +#define		STATUS0_COMP_OVERWRITE		BIT(12)
> +#define		STATUS0_OVERFLOW		BIT(13)
> +#define		STATUS0_VIOLATION		BIT(14)
> +/* WM_CLIENT_BUF_DONE defined for buffers 0:19 */
> +#define		STATUS1_WM_CLIENT_BUF_DONE(n)		BIT(n)
> +#define		STATUS1_EARLY_DONE			BIT(24)
> +#define		STATUS2_DUAL_COMP0_BUF_DONE		BIT(0)
> +#define		STATUS2_DUAL_COMP1_BUF_DONE		BIT(1)
> +#define		STATUS2_DUAL_COMP2_BUF_DONE		BIT(2)
> +#define		STATUS2_DUAL_COMP3_BUF_DONE		BIT(3)
> +#define		STATUS2_DUAL_COMP4_BUF_DONE		BIT(4)
> +#define		STATUS2_DUAL_COMP5_BUF_DONE		BIT(5)
> +#define		STATUS2_DUAL_COMP_BUF_DONE(n)		BIT(n)
> +#define		STATUS2_DUAL_COMP_ERROR			BIT(6)
> +#define		STATUS2_DUAL_COMP_OVERWRITE		BIT(7)
> +
> +#define VFE_BUS_IRQ_CLEAR_GLOBAL		(0x2068)
> +
> +#define VFE_BUS_WM_DEBUG_STATUS_CFG		(0x226c)
> +#define		DEBUG_STATUS_CFG_STATUS0(n)	BIT(n)
> +#define		DEBUG_STATUS_CFG_STATUS1(n)	BIT(8+n)
> +
> +#define VFE_BUS_WM_ADDR_SYNC_FRAME_HEADER	(0x2080)
> +
> +#define VFE_BUS_WM_ADDR_SYNC_NO_SYNC		(0x2084)
> +#define		BUS_VER2_MAX_CLIENTS (24)
> +#define		WM_ADDR_NO_SYNC_DEFAULT_VAL \
> +				((1 << BUS_VER2_MAX_CLIENTS) - 1)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE			(0x200c)
> +#define		WM_CGC_OVERRIDE_ALL		(0xFFFFF)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL		(0x211c)
> +
> +#define VFE_BUS_WM_STATUS0(n)			(0x2200 + (n) * 0x100)
> +#define VFE_BUS_WM_STATUS1(n)			(0x2204 + (n) * 0x100)
> +#define VFE_BUS_WM_CFG(n)			(0x2208 + (n) * 0x100)
> +#define		WM_CFG_EN			(0)
> +#define		WM_CFG_MODE			(1)
> +#define			MODE_QCOM_PLAIN	(0)
> +#define			MODE_MIPI_RAW	(1)
> +#define		WM_CFG_VIRTUALFRAME		(2)
> +#define VFE_BUS_WM_HEADER_ADDR(n)		(0x220c + (n) * 0x100)
> +#define VFE_BUS_WM_HEADER_CFG(n)		(0x2210 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)		(0x2214 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_ADDR_OFFSET(n)		(0x2218 + (n) * 0x100)
> +#define VFE_BUS_WM_BUFFER_WIDTH_CFG(n)		(0x221c + (n) * 0x100)
> +#define		WM_BUFFER_DEFAULT_WIDTH		(0xFF01)
> +
> +#define VFE_BUS_WM_BUFFER_HEIGHT_CFG(n)		(0x2220 + (n) * 0x100)
> +#define VFE_BUS_WM_PACKER_CFG(n)		(0x2224 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_STRIDE(n)			(0x2228 + (n) * 0x100)
> +#define		WM_STRIDE_DEFAULT_STRIDE	(0xFF01)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(0x2248 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(0x224c + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(0x2250 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(0x2254 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INC(n)			(0x2258 + (n) * 0x100)
> +#define VFE_BUS_WM_BURST_LIMIT(n)		(0x225c + (n) * 0x100)
> +
> +
> +static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
> +{
> +	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
> +
> +	u32 gen = (hw_version >> 28) & 0xF;
> +	u32 rev = (hw_version >> 16) & 0xFFF;
> +	u32 step = hw_version & 0xFFFF;
> +
> +	dev_err(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
> +}
> +
> +static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
> +{
> +	u32 bits = readl_relaxed(vfe->base + reg);
> +
> +	writel_relaxed(bits & ~clr_bits, vfe->base + reg);
> +}
> +
> +static inline void vfe_reg_set(struct vfe_device *vfe, u32 reg, u32 set_bits)
> +{
> +	u32 bits = readl_relaxed(vfe->base + reg);
> +
> +	writel_relaxed(bits | set_bits, vfe->base + reg);
> +}
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{

reset_bits are written to twice, the second write overwriting the first written value:

> +	u32 reset_bits = GLOBAL_RESET_CMD_IDLE_CGC	|
> +			 GLOBAL_RESET_CMD_DSP		|
> +			 GLOBAL_RESET_CMD_TESTGEN	|
> +			 GLOBAL_RESET_CMD_BUS_MISR	|
> +			 GLOBAL_RESET_CMD_PM		|
> +			 GLOBAL_RESET_CMD_REGISTER	|
> +			 GLOBAL_RESET_CMD_BUS_BDG	|
> +			 GLOBAL_RESET_CMD_BUS		|
> +			 GLOBAL_RESET_CMD_CAMIF		|
> +			 GLOBAL_RESET_CMD_CORE;

- 1st write

> +	reset_bits = 0x00003F9F;

- 2nd write

Thanks,
Andrey

<snip>
