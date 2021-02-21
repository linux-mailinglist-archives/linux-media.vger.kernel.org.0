Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C056320BFE
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 18:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhBURPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 12:15:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhBURPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 12:15:16 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099FCC061574
        for <linux-media@vger.kernel.org>; Sun, 21 Feb 2021 09:14:35 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u4so5913963lja.3
        for <linux-media@vger.kernel.org>; Sun, 21 Feb 2021 09:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mJbNzQ1++ygcqTBiBISf70R0q2Zt/pkDdRuihAuauFs=;
        b=Io7SeJFfw83eTiYYMeQUivJ14bAPK3sBDbay5o0ysc8aOUFx6xgxaIDS5aSmvqllfa
         dRLImERzrcz+XAES1Qbx3G/L2FGPQymzDOerAec5BdLoX6NQ1TdXXFN9VluE6ZRo1ZJz
         G0RiAUOXlwOdP9RTgOcRueoCp4gZrXD7/jrgYXH2j9QjhpHxQHSwGUIJ0/yDc5LlWHm3
         Zi1GWRb9H1eBh+zasoRaeDBvVxxwy/U4CN4gBtQN7XItqp8zIehBh+WfS8k8MZPZfGAi
         pDtFBoIAhQ1JEi6DK2CCr7U434nl7+UO8++j2u6YflHzFM1y1qxsnp2kRvRQhsS+lF9m
         SjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mJbNzQ1++ygcqTBiBISf70R0q2Zt/pkDdRuihAuauFs=;
        b=S/tTpzRvJzcvLylh+OBbzFPciDud8UTBgCkE9FiYrOEua0tHRIoVZ0INt/VL1O6yJ4
         VIWSq0Q1PlJzkqXoHOQBTEDH0jfpitFBmQB34okOl6UhFBbf0XM0ZAqSJ7ngvSMcqtL4
         wvaj38np2pbd0Kw9Y9j+wyQNFFIgHQKEHQaS0q1A+hHA2C9E5fqDjFgfK2WULYgh+0Iq
         7VRg0tSl8LRYLQW0zZ5f8rZOHEEgby6ERL0pROybrZ3KMYsCrJhEgCqDBPqGqkbk8W2t
         BMdnmrPijYzLsknQymYmLOfNnRaDdDcm5GC7kP0OdBjoJqNC6h67dDJLT+Uez9HhOf4E
         DrBA==
X-Gm-Message-State: AOAM532pNMgKQivsU2eW3l0+6i6DgRG/UGqtTuFwVRQ5x6my1Hs5SmH+
        FrokgaOo5ARmwmSrFlqd/K8tFw==
X-Google-Smtp-Source: ABdhPJwWn4Q5cOpUV5As4uGMoPTjhpoKFu0swg40ixTa08peSmT1+sDpwY1JZTD5Bnk9y6EzE5ur7A==
X-Received: by 2002:a2e:7202:: with SMTP id n2mr2033036ljc.17.1613927673392;
        Sun, 21 Feb 2021 09:14:33 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id y9sm1772691ljm.88.2021.02.21.09.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 09:14:32 -0800 (PST)
Subject: Re: [PATCH v5 10/22] media: camss: Add support for CSID hardware
 version Titan 170
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-11-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <fc2b25e0-3032-5d0d-58c6-f919e25c624d@linaro.org>
Date:   Sun, 21 Feb 2021 20:14:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217112122.424236-11-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thank you for your patch!

On 17.02.2021 14:21, Robert Foss wrote:
> Add register definitions for version 170 of the Titan architecture
> and implement support for the CSID subdevice.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../platform/qcom/camss/camss-csid-170.c      | 602 ++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csid.c    |   4 +
>   .../media/platform/qcom/camss/camss-csid.h    |   2 +
>   .../media/platform/qcom/camss/camss-vfe-170.c |   1 -
>   drivers/media/platform/qcom/camss/camss.c     |  62 ++
>   6 files changed, 671 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index cff388b653ba..0752c46ea37b 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -6,6 +6,7 @@ qcom-camss-objs += \
>   		camss-csid.o \
>   		camss-csid-4-1.o \
>   		camss-csid-4-7.o \
> +		camss-csid-170.o \
>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
>   		camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> new file mode 100644
> index 000000000000..0e9b08ed38c2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -0,0 +1,602 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csid-4-7.c
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (C) 2020 Linaro Ltd.
> + */
> +#include <linux/completion.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +
> +#include "camss-csid.h"
> +#include "camss.h"
> +
> +/* The CSID 2 IP-block is different from the others,
> + * and is of a bare-bones Lite version, with no PIX
> + * interface support. As a result of that it has an
> + * alternate register layout.
> + */
> +#define IS_LITE		(csid->id == 2 ? 1 : 0)
> +
> +#define CSID_HW_VERSION		0x0
> +#define		HW_VERSION_STEPPING	0
> +#define		HW_VERSION_REVISION	16
> +#define		HW_VERSION_GENERATION	28
> +
> +#define CSID_RST_STROBES	0x10
> +#define		RST_STROBES	0
> +
> +#define CSID_CSI2_RX_IRQ_STATUS	0x20
> +#define	CSID_CSI2_RX_IRQ_MASK	0x24
> +#define CSID_CSI2_RX_IRQ_CLEAR	0x28
> +
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		((IS_LITE ? 0x30 : 0x40) \
> +						 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		((IS_LITE ? 0x34 : 0x44) \
> +						 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)		((IS_LITE ? 0x38 : 0x48) \
> +						 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_SET(rdi)		((IS_LITE ? 0x3C : 0x4C) \
> +						 + 0x10 * (rdi))
> +
> +#define CSID_TOP_IRQ_STATUS	0x70
> +#define		TOP_IRQ_STATUS_RESET_DONE 0
> +#define CSID_TOP_IRQ_MASK	0x74
> +#define CSID_TOP_IRQ_CLEAR	0x78
> +#define CSID_TOP_IRQ_SET	0x7C
> +#define CSID_IRQ_CMD		0x80
> +#define		IRQ_CMD_CLEAR	0
> +#define		IRQ_CMD_SET	4
> +
> +#define CSID_CSI2_RX_CFG0	0x100
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
> +#define		CSI2_RX_CFG0_DL1_INPUT_SEL	8
> +#define		CSI2_RX_CFG0_DL2_INPUT_SEL	12
> +#define		CSI2_RX_CFG0_DL3_INPUT_SEL	16
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
> +#define		CSI2_RX_CFG0_PHY_TYPE_SEL	24
> +
> +#define CSID_CSI2_RX_CFG1	0x104
> +#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		0
> +#define		CSI2_RX_CFG1_DE_SCRAMBLE_EN			1
> +#define		CSI2_RX_CFG1_VC_MODE				2
> +#define		CSI2_RX_CFG1_COMPLETE_STREAM_EN			4
> +#define		CSI2_RX_CFG1_COMPLETE_STREAM_FRAME_TIMING	5
> +#define		CSI2_RX_CFG1_MISR_EN				6
> +#define		CSI2_RX_CFG1_CGC_MODE				7
> +#define			CGC_MODE_DYNAMIC_GATING		0
> +#define			CGC_MODE_ALWAYS_ON		1
> +
> +#define CSID_RDI_CFG0(rdi)			((IS_LITE ? 0x200 : 0x300) \
> +						 + 0x100 * (rdi))
> +#define		RDI_CFG0_BYTE_CNTR_EN		0
> +#define		RDI_CFG0_FORMAT_MEASURE_EN	1
> +#define		RDI_CFG0_TIMESTAMP_EN		2
> +#define		RDI_CFG0_DROP_H_EN		3
> +#define		RDI_CFG0_DROP_V_EN		4
> +#define		RDI_CFG0_CROP_H_EN		5
> +#define		RDI_CFG0_CROP_V_EN		6
> +#define		RDI_CFG0_MISR_EN		7
> +#define		RDI_CFG0_CGC_MODE		8
> +#define			CGC_MODE_DYNAMIC	0
> +#define			CGC_MODE_ALWAYS_ON	1
> +#define		RDI_CFG0_PLAIN_ALIGNMENT	9
> +#define			PLAIN_ALIGNMENT_LSB	0
> +#define			PLAIN_ALIGNMENT_MSB	1
> +#define		RDI_CFG0_PLAIN_FORMAT		10
> +#define		RDI_CFG0_DECODE_FORMAT		12
> +#define		RDI_CFG0_DATA_TYPE		16
> +#define		RDI_CFG0_VIRTUAL_CHANNEL	22
> +#define		RDI_CFG0_DT_ID			27
> +#define		RDI_CFG0_EARLY_EOF_EN		29
> +#define		RDI_CFG0_PACKING_FORMAT		30
> +#define		RDI_CFG0_ENABLE			31
> +
> +#define CSID_RDI_CFG1(rdi)			((IS_LITE ? 0x204 : 0x304)\
> +						+ 0x100 * (rdi))
> +#define		RDI_CFG1_TIMESTAMP_STB_SEL	0
> +
> +#define CSID_RDI_CTRL(rdi)			((IS_LITE ? 0x208 : 0x308)\
> +						+ 0x100 * (rdi))
> +#define		RDI_CTRL_HALT_CMD		0
> +#define			ALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
> +#define		RDI_CTRL_HALT_MODE		2
> +
> +#define CSID_RDI_FRM_DROP_PATTERN(rdi)			((IS_LITE ? 0x20C : 0x30C)\
> +							+ 0x100 * (rdi))
> +#define CSID_RDI_FRM_DROP_PERIOD(rdi)			((IS_LITE ? 0x210 : 0x310)\
> +							+ 0x100 * (rdi))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)		((IS_LITE ? 0x214 : 0x314)\
> +							+ 0x100 * (rdi))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)		((IS_LITE ? 0x218 : 0x318)\
> +							+ 0x100 * (rdi))
> +#define CSID_RDI_RPP_PIX_DROP_PATTERN(rdi)		((IS_LITE ? 0x224 : 0x324)\
> +							+ 0x100 * (rdi))
> +#define CSID_RDI_RPP_PIX_DROP_PERIOD(rdi)		((IS_LITE ? 0x228 : 0x328)\
> +							+ 0x100 * (rdi))
> +#define CSID_RDI_RPP_LINE_DROP_PATTERN(rdi)		((IS_LITE ? 0x22C : 0x32C)\
> +							+ 0x100 * (rdi))
> +#define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((IS_LITE ? 0x230 : 0x330)\
> +							+ 0x100 * (rdi))
> +
> +#define CSID_TPG_CTRL		0x600
> +#define		TPG_CTRL_TEST_EN		0
> +#define		TPG_CTRL_FS_PKT_EN		1
> +#define		TPG_CTRL_FE_PKT_EN		2
> +#define		TPG_CTRL_NUM_ACTIVE_LANES	4
> +#define		TPG_CTRL_CYCLES_BETWEEN_PKTS	8
> +#define		TPG_CTRL_NUM_TRAIL_BYTES	20
> +
> +#define CSID_TPG_VC_CFG0	0x604
> +#define		TPG_VC_CFG0_VC_NUM			0
> +#define		TPG_VC_CFG0_NUM_ACTIVE_SLOTS		8
> +#define			NUM_ACTIVE_SLOTS_0_ENABLED	0
> +#define			NUM_ACTIVE_SLOTS_0_1_ENABLED	1
> +#define			NUM_ACTIVE_SLOTS_0_1_2_ENABLED	2
> +#define			NUM_ACTIVE_SLOTS_0_1_3_ENABLED	3
> +#define		TPG_VC_CFG0_LINE_INTERLEAVING_MODE	10
> +#define			INTELEAVING_MODE_INTERLEAVED	0
> +#define			INTELEAVING_MODE_ONE_SHOT	1
> +#define		TPG_VC_CFG0_NUM_FRAMES			16
> +
> +#define CSID_TPG_VC_CFG1	0x608
> +#define		TPG_VC_CFG1_H_BLANKING_COUNT		0
> +#define		TPG_VC_CFG1_V_BLANKING_COUNT		12
> +#define		TPG_VC_CFG1_V_BLANK_FRAME_WIDTH_SEL	24
> +
> +#define CSID_TPG_LFSR_SEED	0x60C
> +
> +#define CSID_TPG_DT_n_CFG_0(n)	(0x610 + (n) * 0xC)
> +#define		TPG_DT_n_CFG_0_FRAME_HEIGHT	0
> +#define		TPG_DT_n_CFG_0_FRAME_WIDTH	16
> +
> +#define CSID_TPG_DT_n_CFG_1(n)	(0x614 + (n) * 0xC)
> +#define		TPG_DT_n_CFG_1_DATA_TYPE	0
> +#define		TPG_DT_n_CFG_1_ECC_XOR_MASK	8
> +#define		TPG_DT_n_CFG_1_CRC_XOR_MASK	16
> +
> +#define CSID_TPG_DT_n_CFG_2(n)	(0x618 + (n) * 0xC)
> +#define		TPG_DT_n_CFG_2_PAYLOAD_MODE		0
> +#define		TPG_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD	4
> +#define		TPG_DT_n_CFG_2_ENCODE_FORMAT		16
> +
> +#define CSID_TPG_COLOR_BARS_CFG	0x640
> +#define		TPG_COLOR_BARS_CFG_UNICOLOR_BAR_EN	0
> +#define		TPG_COLOR_BARS_CFG_UNICOLOR_BAR_SEL	4
> +#define		TPG_COLOR_BARS_CFG_SPLIT_EN		5
> +#define		TPG_COLOR_BARS_CFG_ROTATE_PERIOD	8
> +
> +#define CSID_TPG_COLOR_BOX_CFG	0x644
> +#define		TPG_COLOR_BOX_CFG_MODE		0
> +#define		TPG_COLOR_BOX_PATTERN_SEL	2
> +
> +
> +static const struct csid_format csid_formats[] = {
> +	{
> +		MEDIA_BUS_FMT_UYVY8_2X8,
> +		DATA_TYPE_YUV422_8BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +		2,
> +	},
> +	{
> +		MEDIA_BUS_FMT_VYUY8_2X8,
> +		DATA_TYPE_YUV422_8BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +		2,
> +	},
> +	{
> +		MEDIA_BUS_FMT_YUYV8_2X8,
> +		DATA_TYPE_YUV422_8BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +		2,
> +	},
> +	{
> +		MEDIA_BUS_FMT_YVYU8_2X8,
> +		DATA_TYPE_YUV422_8BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +		2,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SBGGR8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB8_1X8,
> +		DATA_TYPE_RAW_8BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +		8,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SBGGR10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_Y10_1X10,
> +		DATA_TYPE_RAW_10BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +		10,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SBGGR12_1X12,
> +		DATA_TYPE_RAW_12BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +		12,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG12_1X12,
> +		DATA_TYPE_RAW_12BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +		12,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG12_1X12,
> +		DATA_TYPE_RAW_12BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +		12,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB12_1X12,
> +		DATA_TYPE_RAW_12BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +		12,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SBGGR14_1X14,
> +		DATA_TYPE_RAW_14BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +		14,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGBRG14_1X14,
> +		DATA_TYPE_RAW_14BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +		14,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SGRBG14_1X14,
> +		DATA_TYPE_RAW_14BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +		14,
> +		1,
> +	},
> +	{
> +		MEDIA_BUS_FMT_SRGGB14_1X14,
> +		DATA_TYPE_RAW_14BIT,
> +		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +		14,
> +		1,
> +	},
> +};
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	struct csid_testgen_config *tg = &csid->testgen;
> +	u32 val;
> +	u32 phy_sel = 0;
> +	u8 lane_cnt = csid->phy.lane_cnt;
> +	struct v4l2_mbus_framefmt *input_format =
> +			&csid->fmt[MSM_CSID_PAD_SRC];
> +	const struct csid_format *format = csid_get_fmt_entry(
> +			csid->formats, csid->nformats, input_format->code);
> +	if (!lane_cnt)
> +		lane_cnt = 4;
> +
> +	if (!tg->enabled)
> +		phy_sel = csid->phy.csiphy_id;
> +
> +	if (enable) {
> +		u8 vc = 0; /* Virtual Channel 0 */
> +		u8 dt_id = vc * 4;
> +
> +		if (tg->enabled) {
> +			/* Config Test Generator */
> +			vc = 0xa;
> +
> +			/* configure one DT, infinite frames */
> +			val = vc << TPG_VC_CFG0_VC_NUM;
> +			val |= INTELEAVING_MODE_ONE_SHOT << TPG_VC_CFG0_LINE_INTERLEAVING_MODE;
> +			val |= 0 << TPG_VC_CFG0_NUM_FRAMES;
> +			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG0);
> +
> +			val = 0x740 << TPG_VC_CFG1_H_BLANKING_COUNT;
> +			val |= 0x3ff << TPG_VC_CFG1_V_BLANKING_COUNT;
> +			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG1);
> +
> +			writel_relaxed(0x12345678, csid->base + CSID_TPG_LFSR_SEED);
> +
> +			val = input_format->height & 0x1fff << TPG_DT_n_CFG_0_FRAME_HEIGHT;
> +			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
> +			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
> +
> +			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
> +			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
> +
> +			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
> +			val |= 0xBE << TPG_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD;
> +			val |= format->decode_format << TPG_DT_n_CFG_2_ENCODE_FORMAT;
> +			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_2(0));
> +
> +			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BARS_CFG);
> +
> +			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BOX_CFG);
> +		}
> +
> +		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
> +		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
> +		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
> +		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
> +		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
> +		val |= dt_id << RDI_CFG0_DT_ID;
> +		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
> +
> +		/* CSID_TIMESTAMP_STB_POST_IRQ */
> +		val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
> +		writel_relaxed(val, csid->base + CSID_RDI_CFG1(0));
> +
> +		val = 1;
> +		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(0));
> +
> +		val = 0;
> +		writel_relaxed(0, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
> +
> +		val = 1;
> +		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
> +
> +		val = 0;
> +		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(0));
> +
> +		val = 1;
> +		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(0));
> +
> +		val = 0;
> +		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(0));
> +
> +		val = 1;
> +		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(0));
> +
> +		val = 0;
> +		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(0));
> +
> +		val = 0;
> +		writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
> +
> +		val = readl_relaxed(csid->base + CSID_RDI_CFG0(0));
> +		val |=  1 << RDI_CFG0_ENABLE;
> +		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
> +	}
> +
> +	if (tg->enabled) {
> +		val = enable << TPG_CTRL_TEST_EN;
> +		val |= 1 << TPG_CTRL_FS_PKT_EN;
> +		val |= 1 << TPG_CTRL_FE_PKT_EN;
> +		val |= (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LANES;
> +		val |= 0x64 << TPG_CTRL_CYCLES_BETWEEN_PKTS;
> +		val |= 0xA << TPG_CTRL_NUM_TRAIL_BYTES;
> +		writel_relaxed(val, csid->base + CSID_TPG_CTRL);
> +	}
> +
> +	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= csid->phy.lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= phy_sel << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +
> +	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> +	val |= 1 << CSI2_RX_CFG1_MISR_EN;
> +	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
> +
> +	/* error irqs start at BIT(11) */
> +	writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
> +
> +	/* RDI irq */
> +	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	val = 1 << RDI_CTRL_HALT_CMD;
> +	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
> +}
> +
> +static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)

Here (val == 0) means "testgen disabled", and (val >= 1) selects the test
pattern: (val == 1) corresponds to CSID_PAYLOAD_MODE_INCREMENTING etc.

> +{
> +	s32 regval = val - 1;

- now regval contains the zero-based test pattern mode number

> +	if (regval > 0 || regval <= CSID_PAYLOAD_MODE_MAX_SUPPORTED_170)

- by excluding regval of zero you made it impossible to select
   CSID_PAYLOAD_MODE_INCREMENTING, didn't you?
   It looks like the above line of code should be:

	if (regval >= 0 || regval <= CSID_PAYLOAD_MODE_MAX_SUPPORTED_170)

With this sorted out,

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

> +		csid->testgen.mode = regval;
> +
> +	return 0;
> +}
> +
> +/*
> + * csid_hw_version - CSID hardware version query
> + * @csid: CSID device
> + *
> + * Return HW version or error
> + */
> +static u32 csid_hw_version(struct csid_device *csid)
> +{
> +	u32 hw_version;
> +	u32 hw_gen;
> +	u32 hw_rev;
> +	u32 hw_step;
> +
> +	hw_version = readl_relaxed(csid->base + CSID_HW_VERSION);
> +	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
> +	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
> +	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
> +	dev_dbg(csid->camss->dev, "CSID HW Version = %u.%u.%u\n",
> +		hw_gen, hw_rev, hw_step);
> +
> +	return hw_version;
> +}
> +
> +/*
> + * csid_isr - CSID module interrupt service routine
> + * @irq: Interrupt line
> + * @dev: CSID device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t csid_isr(int irq, void *dev)
> +{
> +	struct csid_device *csid = dev;
> +	u32 val;
> +	u8 reset_done;
> +
> +	val = readl_relaxed(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel_relaxed(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	reset_done = val & BIT(TOP_IRQ_STATUS_RESET_DONE);
> +
> +	val = readl_relaxed(csid->base + CSID_CSI2_RX_IRQ_STATUS);
> +	writel_relaxed(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
> +
> +	val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(0));
> +	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(0));
> +
> +	val = 1 << IRQ_CMD_CLEAR;
> +	writel_relaxed(val, csid->base + CSID_IRQ_CMD);
> +
> +	if (reset_done)
> +		complete(&csid->reset_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * csid_reset - Trigger reset on CSID module and wait to complete
> + * @csid: CSID device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csid_reset(struct csid_device *csid)
> +{
> +	unsigned long time;
> +	u32 val;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_MASK);
> +	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
> +
> +	/* preserve registers */
> +	val = 0x1e << RST_STROBES;
> +	writel_relaxed(val, csid->base + CSID_RST_STROBES);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +		msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
> +			     unsigned int match_format_idx, u32 match_code)
> +{
> +	switch (sink_code) {
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	{
> +		u32 src_code[] = {
> +			MEDIA_BUS_FMT_SBGGR10_1X10,
> +			MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
> +		};
> +
> +		return csid_find_code(src_code, ARRAY_SIZE(src_code),
> +				      match_format_idx, match_code);
> +	}
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +	{
> +		u32 src_code[] = {
> +			MEDIA_BUS_FMT_Y10_1X10,
> +			MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
> +		};
> +
> +		return csid_find_code(src_code, ARRAY_SIZE(src_code),
> +				      match_format_idx, match_code);
> +	}
> +	default:
> +		if (match_format_idx > 0)
> +			return 0;
> +
> +		return sink_code;
> +	}
> +}
> +
> +static void csid_subdev_init(struct csid_device *csid)
> +{
> +	csid->formats = csid_formats;
> +	csid->nformats = ARRAY_SIZE(csid_formats);
> +	csid->testgen.modes = csid_testgen_modes;
> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_MAX_SUPPORTED_170;
> +}
> +
> +const struct csid_hw_ops csid_ops_170 = {
> +	.configure_stream = csid_configure_stream,
> +	.configure_testgen_pattern = csid_configure_testgen_pattern,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr,
> +	.reset = csid_reset,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 601bd810f2b0..294a0a9e4dfa 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -123,6 +123,8 @@ static int csid_set_clock_rates(struct csid_device *csid)
>   				dev_err(dev, "clk set rate failed: %d\n", ret);
>   				return ret;
>   			}
> +		} else if (clock->nfreqs) {
> +			clk_set_rate(clock->clk, clock->freq[0]);
>   		}
>   	}
>   
> @@ -544,6 +546,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   	} else if (camss->version == CAMSS_8x96 ||
>   		   camss->version == CAMSS_660) {
>   		csid->ops = &csid_ops_4_7;
> +	} else if (camss->version == CAMSS_845) {
> +		csid->ops = &csid_ops_170;
>   	} else {
>   		return -EINVAL;
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index d40194e2bed3..49a6b5492403 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -245,5 +245,7 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id);
>   
>   extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
> +extern const struct csid_hw_ops csid_ops_170;
> +
>   
>   #endif /* QC_MSM_CAMSS_CSID_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> index c4991b1f22f8..9ddc30a73868 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> @@ -274,7 +274,6 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   	writel_relaxed(val, vfe->base + VFE_BUS_WM_PACKER_CFG(wm)); // XXX 1 for PLAIN8?
>   
>   	/* Configure stride for RDIs */
> -	//val = pix->plane_fmt[0].bytesperline;
>   	val = WM_STRIDE_DEFAULT_STRIDE;
>   	writel_relaxed(val, vfe->base + VFE_BUS_WM_STRIDE(wm));
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0e006def1996..0b1693c34fbc 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -465,6 +465,68 @@ static const struct resources vfe_res_660[] = {
>   	}
>   };
>   
> +static const struct resources csid_res_845[] = {
> +	/* CSID0 */
> +	{
> +		.regulator = { "vdda-csi0" },
> +		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
> +				"soc_ahb", "vfe0", "vfe0_src",
> +				"vfe0_cphy_rx", "csi0",
> +				"csi0_src" },
> +		.clock_rate = { { 0 },
> +				{ 384000000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
> +				{ 320000000 },
> +				{ 0 },
> +				{ 19200000, 75000000, 384000000, 538666667 },
> +				{ 384000000 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" }
> +	},
> +
> +	/* CSID1 */
> +	{
> +		.regulator = { "vdda-csi1" },
> +		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
> +				"soc_ahb", "vfe1", "vfe1_src",
> +				"vfe1_cphy_rx", "csi1",
> +				"csi1_src" },
> +		.clock_rate = { { 0 },
> +				{ 384000000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
> +				{ 320000000 },
> +				{ 0 },
> +				{ 19200000, 75000000, 384000000, 538666667 },
> +				{ 384000000 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" }
> +	},
> +
> +	/* CSID2 */
> +	{
> +		.regulator = { "vdda-csi2" },
> +		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
> +				"soc_ahb", "vfe_lite", "vfe_lite_src",
> +				"vfe_lite_cphy_rx", "csi2",
> +				"csi2_src" },
> +		.clock_rate = { { 0 },
> +				{ 384000000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
> +				{ 320000000 },
> +				{ 0 },
> +				{ 19200000, 75000000, 384000000, 538666667 },
> +				{ 384000000 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" }
> +	}
> +};
> +
>   static const struct resources vfe_res_845[] = {
>   	/* VFE0 */
>   	{
> 
