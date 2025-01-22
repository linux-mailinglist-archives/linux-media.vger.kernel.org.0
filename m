Return-Path: <linux-media+bounces-25086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CEA188B5
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 01:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B5321698C7
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02F32563;
	Wed, 22 Jan 2025 00:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Di0+ibgX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D864F20EB
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 00:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737504323; cv=none; b=g9hnk8+xj5QxYsX6ZszIwlj1ehNJyBniw0hNUd7f7F5jECXbWsS6ZvLZQPsXKwoFGpOkU3xJsyNEzPAHdwXbofghfpyXmqWvSjdGAr+id2L/sHeN0t8k1/8lEy+cV4tH/FBUSxgC/uVJ0hZT23rrd6PPp65vitzOZ/wu+QOpxh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737504323; c=relaxed/simple;
	bh=T1b9N/8rACkT27C+rZ7HfOopanVJd2b37pSgjFzWGIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXd0WAI3y5DhMDyahwM7VLGfqBxxMYUb4VRsiEz96szrTIqmJTyqldl7CrGiv0HiuYjDxH/zt0UklvtaXIqNONW6Fg6wZLEXHzgVoz9/AQ3/HnlGF5LK41wr/eLfqb0lG9ZP4mi/X8Hagz4x/hau0LTwkLtEwQOGbBsXgF1ptVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Di0+ibgX; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3003a95a173so6151391fa.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 16:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737504318; x=1738109118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ys68UKoJ/W92IXXmlHLiWbQ8vT1NXnorQ3LN4XQZQA8=;
        b=Di0+ibgXjneBkEmuoi7JA1bpm+OPHJGp8lYwM0nzBAe4BfFMgTJL7wgAV0J4+Rs4Lt
         cxyylo0681cMFNBpuTCUfh9uLE6NqNTYc0yOAtQfiQCLQSTw6cHU/GtT/lE94PHzgAMM
         xKpDtjbIFRsMFinE9v5OimsltMYj0iTCB+l2Yaau2mHhKKHa7fFbkCMBpdfYs3fPWpzD
         rVYXZxzdem6Nx5kxZG147Q9H1FbBw6JqJWlTK9xjJp6CkeNKteY9RlUNfLS+lIcYHOiM
         89uLfy8iYwEcQF/o49BZ4l0HbJgGCTTWa7jO/Ziql+CBUzjq2gcnmtHwFawl5rWcjXUG
         OuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737504318; x=1738109118;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ys68UKoJ/W92IXXmlHLiWbQ8vT1NXnorQ3LN4XQZQA8=;
        b=NL4BFYCtjp+Zwor7/OYZCl/wgJcAv0aeAhPn+fxwysAqMA82wicYvlKsP/Oh6MINvC
         R0FntPA5fkkrsuwN3TkUzVVS9TulBzkzic3qiKsbrauaKZV+1AM2OPLcxlknmqo6pBXK
         Z7jGNC36WIXBoWAl02QrMSD6rJUcPnFwoYF0zRwU5NASXRqvtm49M6P24H1Y5JtVur23
         ulUULkmvEOpgPob1bdH1nuv02OpfAchxa5jATt0qNyEnVbTdHyT8DkjJ1FDSI9d2YqkM
         Nrwv2PYY/zyeswf1mGdede9vQqWTOIrK6QAWQcePrEqaas3QUbE4KRmQJ7ScFnAh0Hkz
         XosQ==
X-Gm-Message-State: AOJu0YxyUync5hoghEzyzDcCR1GjSpN0/pcvxBEfwDb2Rt+ltGGO1P28
	bKtLkDNKTWZ2nNq7srMYbex7ZMLXfpD5aAvDrJE3l+UXpStegsTbUGuCqQhH45M=
X-Gm-Gg: ASbGnctRwVMFuqglGG12pOvCaFuL/RYM+ryGUbytWLZu6P0rm2zTMFqTPhLSBuk/Lj/
	aHp2E4upm7gkj77S4naOfxvpO6NOoj42MNlwamE3RrVU+60ZYVUwwjbyqoTszEsuzX+FvM8eYUh
	Qsxmefhd6/6O16wth3f56gchuSiAkrbsVHqw3W+iXc/OhpC1WCdLcNnNVHwz4NoHzIIbkcKG98N
	0J7WniAvtkrAaL2U7okPOYuIgC6+jIjniD7fWKMZKrHig1/GS7Zt/cTC0HB8yASHKI180Dj2McK
	76BXx5JZ0Aqa615+IyNWgW707+G4QnY8YaMu8rmkzjfmgEYu
X-Google-Smtp-Source: AGHT+IHoGsspbCYzkIYp7tvt1hiraG0yIOLrVl8siHGsFIACN00JjgezwQaZs1j9vn6Cyo3SPVVQ/w==
X-Received: by 2002:a05:6512:32c3:b0:53e:3a77:ddf4 with SMTP id 2adb3069b0e04-5439c22a390mr2353730e87.2.1737504317582;
        Tue, 21 Jan 2025 16:05:17 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e8c9sm1995916e87.67.2025.01.21.16.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:05:16 -0800 (PST)
Message-ID: <62913113-e3de-48d1-9977-537d84ca8312@linaro.org>
Date: Wed, 22 Jan 2025 02:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] media: qcom: camss: Add CSID 680 support
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-3-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-3-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/20/25 17:47, Bryan O'Donoghue wrote:
> Add CSI Decoder (CSID) 680 support to CAMSS. This version of CSID has been
> shipped with SM8450 and x1e chips.
> 
> References previous work from Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-csid-680.c | 422 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
>   3 files changed, 424 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index f6db5b3b5ace3..71797745f2f71 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -6,6 +6,7 @@ qcom-camss-objs += \
>   		camss-csid.o \
>   		camss-csid-4-1.o \
>   		camss-csid-4-7.o \
> +		camss-csid-680.o \
>   		camss-csid-gen2.o \
>   		camss-csid-780.o \

Alphabetical sorting is lost, but it's due to SM8550 change by Depeng,
I'll report it separately.

>   		camss-csiphy-2ph-1-0.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> new file mode 100644
> index 0000000000000..2a989ce33c2a4
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -0,0 +1,422 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (C) 2020-2023 Linaro Ltd.

2025

> + */
> +#include <linux/completion.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-gen2.h"
> +
> +#define CSID_TOP_IO_PATH_CFG0(csid)				(0x4 * (csid))
> +#define		CSID_TOP_IO_PATH_CFG0_INTERNAL_CSID		BIT(0)
> +#define		CSID_TOP_IO_PATH_CFG0_SFE_0			BIT(1)
> +#define		CSID_TOP_IO_PATH_CFG0_SFE_1			GENMASK(1, 0)
> +#define		CSID_TOP_IO_PATH_CFG0_SBI_0			BIT(4)
> +#define		CSID_TOP_IO_PATH_CFG0_SBI_1			GENMASK(3, 0)
> +#define		CSID_TOP_IO_PATH_CFG0_SBI_2			GENMASK(3, 1)
> +#define		CSID_TOP_IO_PATH_CFG0_OUTPUT_IFE_EN		BIT(8)
> +#define		CSID_TOP_IO_PATH_CFG0_SFE_OFFLINE_EN		BIT(12)
> +
> +#define CSID_RESET_CFG						0xc
> +#define		CSID_RESET_CFG_MODE_IMMEDIATE			BIT(0)
> +#define		CSID_RESET_CFG_LOCATION_COMPLETE		BIT(4)
> +
> +#define CSID_RESET_CMD						0x10
> +#define		CSID_RESET_CMD_HW_RESET				BIT(0)
> +#define		CSID_RESET_CMD_SW_RESET				BIT(1)
> +#define		CSID_RESET_CMD_IRQ_CTRL				BIT(2)
> +
> +#define CSID_IRQ_CMD						0x14
> +#define		CSID_IRQ_CMD_CLEAR				BIT(0)
> +#define		CSID_IRQ_CMD_SET				BIT(4)
> +
> +#define CSID_REG_UPDATE_CMD					0x18
> +
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)					(0xec + 0x10 * (rdi))

This register value is out of numeric order, you should put it
after CSID_CSI2_RX_IRQ_CLEAR on the list, and then you should
discover a redefinition easily.

> +#define		CSID_CSI2_RDIN_CCIF_VIOLATION				BIT(29)
> +#define		CSID_CSI2_RDIN_SENSOR_SWITCH_OUT_OF_SYNC_FRAME_DROP	BIT(28)
> +#define		CSID_CSI2_RDIN_ERROR_REC_WIDTH_VIOLATION		BIT(27)
> +#define		CSID_CSI2_RDIN_ERROR_REC_HEIGHT_VIOLATION		BIT(26)
> +#define		CSID_CSI2_RDIN_BATCH_END_MISSING_VIOLATION		BIT(25)
> +#define		CSID_CSI2_RDIN_ILLEGAL_BATCH_ID_IRQ			BIT(24)
> +#define		CSID_CSI2_RDIN_RUP_DONE					BIT(23)
> +#define		CSID_CSI2_RDIN_CAMIF_EPOCH_1_IRQ			BIT(22)
> +#define		CSID_CSI2_RDIN_CAMIF_EPOCH_0_IRQ			BIT(21)
> +#define		CSID_CSI2_RDIN_ERROR_REC_OVERFLOW_IRQ			BIT(19)
> +#define		CSID_CSI2_RDIN_ERROR_REC_FRAME_DROP			BIT(18)
> +#define		CSID_CSI2_RDIN_VCDT_GRP_CHANG				BIT(17)
> +#define		CSID_CSI2_RDIN_VCDT_GRP_0_SEL				BIT(16)
> +#define		CSID_CSI2_RDIN_VCDT_GRP_1_SEL				BIT(15)
> +#define		CSID_CSI2_RDIN_ERROR_LINE_COUNT				BIT(14)
> +#define		CSID_CSI2_RDIN_ERROR_PIX_COUNT				BIT(13)
> +#define		CSID_CSI2_RDIN_INFO_INPUT_SOF				BIT(12)
> +#define		CSID_CSI2_RDIN_INFO_INPUT_SOL				BIT(11)
> +#define		CSID_CSI2_RDIN_INFO_INPUT_EOL				BIT(10)
> +#define		CSID_CSI2_RDIN_INFO_INPUT_EOF				BIT(9)
> +#define		CSID_CSI2_RDIN_INFO_FRAME_DROP_SOF			BIT(8)
> +#define		CSID_CSI2_RDIN_INFO_FRAME_DROP_SOL			BIT(7)
> +#define		CSID_CSI2_RDIN_INFO_FRAME_DROP_EOL			BIT(6)
> +#define		CSID_CSI2_RDIN_INFO_FRAME_DROP_EOF			BIT(5)
> +#define		CSID_CSI2_RDIN_INFO_CAMIF_SOF				BIT(4)
> +#define		CSID_CSI2_RDIN_INFO_CAMIF_EOF				BIT(3)
> +#define		CSID_CSI2_RDIN_INFO_FIFO_OVERFLOW			BIT(2)
> +#define		CSID_CSI2_RDIN_RES1					BIT(1)
> +#define		CSID_CSI2_RDIN_RES0					BIT(0)
> +
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)				(0xf0 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)				(0xf4 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_SET(rdi)				(0xf8 + 0x10 * (rdi))
> +
> +#define CSID_TOP_IRQ_STATUS					0x7c
> +#define CSID_TOP_IRQ_MASK					0x80
> +#define CSID_TOP_IRQ_CLEAR					0x84
> +#define		CSID_TOP_IRQ_RESET				BIT(0)
> +#define		CSID_TOP_IRQ_RX					BIT(2)
> +#define		CSID_TOP_IRQ_LONG_PKT(rdi)			(BIT(8) << (rdi))
> +#define		CSID_TOP_IRQ_BUF_DONE				BIT(13)
> +
> +#define CSID_BUF_DONE_IRQ_STATUS				0x8c
> +#define	BUF_DONE_IRQ_STATUS_RDI_OFFSET				(csid_is_lite(csid) ? 1 : 14)
> +#define CSID_BUF_DONE_IRQ_MASK					0x90
> +#define CSID_BUF_DONE_IRQ_CLEAR					0x94
> +
> +#define CSID_CSI2_RX_IRQ_STATUS					0x9c
> +#define CSID_CSI2_RX_IRQ_MASK					0xa0
> +#define CSID_CSI2_RX_IRQ_CLEAR					0xa4
> +
> +#define CSID_CSI2_RDI_IRQ_STATUS(rdi)				(0xec + 0x10 * (rdi))
> +#define CSID_CSI2_RDI_IRQ_MASK(rdi)				(0xf0 + 0x10 * (rdi))
> +#define CSID_CSI2_RDI_IRQ_CLEAR(rdi)				(0xf4 + 0x10 * (rdi))
> +
> +#define CSID_CSI2_RX_CFG0					0x200
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES			0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL			4
> +#define		CSI2_RX_CFG0_DL1_INPUT_SEL			8
> +#define		CSI2_RX_CFG0_DL2_INPUT_SEL			12
> +#define		CSI2_RX_CFG0_DL3_INPUT_SEL			16
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL			20
> +#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
> +#define		CSI2_RX_CFG0_PHY_TYPE_SEL			24
> +
> +#define CSID_CSI2_RX_CFG1					0x204
> +#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		BIT(0)
> +#define		CSI2_RX_CFG1_DE_SCRAMBLE_EN			BIT(1)
> +#define		CSI2_RX_CFG1_VC_MODE				BIT(2)
> +#define		CSI2_RX_CFG1_COMPLETE_STREAM_EN			BIT(4)
> +#define		CSI2_RX_CFG1_COMPLETE_STREAM_FRAME_TIMING	BIT(5)
> +#define		CSI2_RX_CFG1_MISR_EN				BIT(6)
> +#define		CSI2_RX_CFG1_CGC_MODE				BIT(7)
> +
> +#define CSID_CSI2_RX_CAPTURE_CTRL				0x208
> +#define		CSI2_RX_CAPTURE_LONG_PKT_EN			BIT(0)
> +#define		CSI2_RX_CAPTURE_SHORT_PKT_EN			BIT(1)
> +#define		CSI2_RX_CAPTURE_CPHY_PKT_EN			BIT(2)
> +#define		CSI2_RX_CAPTURE_LONG_PKT_DT			BIT(4)

To my knowledge it's not the bit value.

> +#define		CSI2_RX_CAPTURE_LONG_PKT_VC			BIT(10)

Same here.

> +#define		CSI2_RX_CAPTURE_SHORT_PKT_VC			BIT(15)
> +#define		CSI2_RX_CAPTURE_CPHY_PKT_DT			BIT(20)
> +#define		CSI2_RX_CAPTURE_CPHY_PKT_VC			BIT(26)

And apparently the same reasoning applies to the values above.

By the way I'm surprised that CSID_CSI2_RX_CAPTURE_CTRL is not written.

> +
> +#define CSID_CSI2_RX_TOTAL_PKTS_RCVD				0x240
> +#define CSID_CSI2_RX_STATS_ECC					0x244
> +#define CSID_CSI2_RX_CRC_ERRORS					0x248
> +
> +#define CSID_RDI_CFG0(rdi)					(0x500 + 0x100 * (rdi))
> +#define		RDI_CFG0_DECODE_FORMAT				12
> +#define		RDI_CFG0_DATA_TYPE				16
> +#define		RDI_CFG0_VIRTUAL_CHANNEL			22
> +#define		RDI_CFG0_DT_ID					27
> +#define		RDI_CFG0_ENABLE					BIT(31)
> +
> +#define CSID_RDI_CTRL(rdi)					(0x504 + 0x100 * (rdi))
> +#define		CSID_RDI_CTRL_HALT_CMD_HALT_AT_FRAME_BOUNDARY	0
> +#define		CSID_RDI_CTRL_HALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
> +
> +#define CSID_RDI_CFG1(rdi)					(0x510 + 0x100 * (rdi))
> +#define		RDI_CFG1_TIMESTAMP_STB_FRAME			BIT(0)
> +#define		RDI_CFG1_TIMESTAMP_STB_IRQ			BIT(1)
> +#define		RDI_CFG1_BYTE_CNTR_EN				BIT(2)
> +#define		RDI_CFG1_TIMESTAMP_EN				BIT(4)
> +#define		RDI_CFG1_DROP_H_EN				BIT(5)
> +#define		RDI_CFG1_DROP_V_EN				BIT(6)
> +#define		RDI_CFG1_CROP_H_EN				BIT(7)
> +#define		RDI_CFG1_CROP_V_EN				BIT(8)
> +#define		RDI_CFG1_MISR_EN				BIT(9)
> +#define		RDI_CFG1_PLAIN_ALIGN_MSB			BIT(11)
> +#define		RDI_CFG1_EARLY_EOF_EN				BIT(14)
> +#define		RDI_CFG1_PACKING_MIPI				BIT(15)
> +
> +#define CSID_RDI_ERR_RECOVERY_CFG0(rdi)				(0x514 + 0x100 * (rdi))
> +#define CSID_RDI_EPOCH_IRQ_CFG(rdi)				(0x52c + 0x100 * (rdi))
> +#define CSID_RDI_FRM_DROP_PATTERN(rdi)				(0x540 + 0x100 * (rdi))
> +#define CSID_RDI_FRM_DROP_PERIOD(rdi)				(0x544 + 0x100 * (rdi))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)			(0x548 + 0x100 * (rdi))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)			(0x54c + 0x100 * (rdi))
> +#define CSID_RDI_PIX_DROP_PATTERN(rdi)				(0x558 + 0x100 * (rdi))
> +#define CSID_RDI_PIX_DROP_PERIOD(rdi)				(0x55c + 0x100 * (rdi))
> +#define CSID_RDI_LINE_DROP_PATTERN(rdi)				(0x560 + 0x100 * (rdi))
> +#define CSID_RDI_LINE_DROP_PERIOD(rdi)				(0x564 + 0x100 * (rdi))
> +
> +static inline int reg_update_rdi(struct csid_device *csid, int n)
> +{
> +	return BIT(n + 4) + BIT(20 + n);

Please use (4 + n) and (20 + n) here.

> +}
> +
> +static void csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->reg_update |= reg_update_rdi(csid, port_id);
> +	writel(csid->reg_update, csid->base + CSID_REG_UPDATE_CMD);
> +}
> +
> +static inline void csid_reg_update_clear(struct csid_device *csid,
> +					 int port_id)
> +{
> +	csid->reg_update &= ~reg_update_rdi(csid, port_id);
> +	writel(csid->reg_update, csid->base + CSID_REG_UPDATE_CMD);
> +}
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy, int vc)
> +{
> +	int val;

u32 val

> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
> +
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> +	if (vc > 3)
> +		val |= CSI2_RX_CFG1_VC_MODE;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> +{
> +	int val;

u32 val

> +
> +	if (enable)
> +		val = CSID_RDI_CTRL_HALT_CMD_RESUME_AT_FRAME_BOUNDARY;
> +	else
> +		val = CSID_RDI_CTRL_HALT_CMD_HALT_AT_FRAME_BOUNDARY;
> +
> +	writel(val, csid->base + CSID_RDI_CTRL(rdi));
> +}
> +
> +static void __csid_configure_top(struct csid_device *csid)
> +{
> +	u32 val;
> +
> +	val = CSID_TOP_IO_PATH_CFG0_OUTPUT_IFE_EN | CSID_TOP_IO_PATH_CFG0_INTERNAL_CSID;
> +	writel(val, csid->camss->csid_wrapper_base +
> +	    CSID_TOP_IO_PATH_CFG0(csid->id));
> +}
> +
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +{
> +	u32 val;
> +	u8 lane_cnt = csid->phy.lane_cnt;
> +	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +
> +	if (!lane_cnt)
> +		lane_cnt = 4;
> +
> +	val = 0;
> +	writel(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
> +
> +	/*
> +	 * DT_ID is a two bit bitfield that is concatenated with
> +	 * the four least significant bits of the five bit VC
> +	 * bitfield to generate an internal CID value.
> +	 *
> +	 * CSID_RDI_CFG0(vc)
> +	 * DT_ID : 28:27
> +	 * VC    : 26:22
> +	 * DT    : 21:16
> +	 *
> +	 * CID   : VC 3:0 << 2 | DT_ID 1:0
> +	 */
> +	u8 dt_id = vc & 0x03;

It's a local variable declaration in the middle of the function.

> +
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= format->data_type << RDI_CFG0_DATA_TYPE;
> +	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
> +	val |= dt_id << RDI_CFG0_DT_ID;
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +
> +	val = RDI_CFG1_TIMESTAMP_STB_FRAME;
> +	val |= RDI_CFG1_BYTE_CNTR_EN;
> +	val |= RDI_CFG1_TIMESTAMP_EN;
> +	val |= RDI_CFG1_DROP_H_EN;
> +	val |= RDI_CFG1_DROP_V_EN;
> +	val |= RDI_CFG1_CROP_H_EN;
> +	val |= RDI_CFG1_CROP_V_EN;
> +	val |= RDI_CFG1_PACKING_MIPI;
> +
> +	writel(val, csid->base + CSID_RDI_CFG1(vc));
> +
> +	val = 0;
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +
> +	val = 1;
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +
> +	val = 0;
> +	writel(val, csid->base + CSID_RDI_CTRL(vc));
> +
> +	val = readl(csid->base + CSID_RDI_CFG0(vc));
> +	if (enable)
> +		val |= RDI_CFG0_ENABLE;
> +	else
> +		val &= ~RDI_CFG0_ENABLE;
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	int i;
> +
> +	__csid_configure_top(csid);
> +
> +       /* Loop through all enabled VCs and configure stream for each */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i);
> +			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +	}
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
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	writel(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> +
> +	/* preserve registers */
> +	val = CSID_RESET_CFG_MODE_IMMEDIATE | CSID_RESET_CFG_LOCATION_COMPLETE;
> +	writel(val, csid->base + CSID_RESET_CFG);
> +
> +	val = CSID_RESET_CMD_HW_RESET | CSID_RESET_CMD_SW_RESET;
> +	writel(val, csid->base + CSID_RESET_CMD);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
> +		return -EIO;
> +	}
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> +		/* Enable RUP done for the client port */
> +		writel(CSID_CSI2_RDIN_RUP_DONE, csid->base + CSID_CSI2_RDIN_IRQ_MASK(i));
> +	}
> +
> +	/* Clear RDI status */
> +	writel(~0u, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	/* Enable BUF_DONE bit for all write-master client ports */
> +	writel(~0u, csid->base + CSID_BUF_DONE_IRQ_MASK);
> +
> +	/* Unmask all TOP interrupts */
> +	writel(~0u, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	return 0;
> +}
> +
> +static void csid_rup_complete(struct csid_device *csid, int rdi)
> +{
> +	csid_reg_update_clear(csid, rdi);
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
> +	u32 buf_done_val, val, val_top;
> +	int i;
> +
> +	/* Latch and clear TOP status */
> +	val_top = readl(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel(val_top, csid->base + CSID_TOP_IRQ_CLEAR);
> +
> +	/* Latch and clear CSID_CSI2 status */
> +	val = readl(csid->base + CSID_CSI2_RX_IRQ_STATUS);
> +	writel(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
> +
> +	/* Latch and clear top level BUF_DONE status */
> +	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	/* Process state for each RDI channel */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> +		val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +		if (val)
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +		if (val & CSID_CSI2_RDIN_RUP_DONE)
> +			csid_rup_complete(csid, i);
> +
> +		if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
> +			camss_buf_done(csid->camss, csid->id, i);
> +	}
> +
> +	/* Issue clear command */
> +	writel(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> +
> +	/* Reset complete */
> +	if (val_top & CSID_TOP_IRQ_RESET)
> +		complete(&csid->reset_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear)
> +{
> +	if (is_clear)
> +		csid_reg_update_clear(csid, port_id);
> +	else
> +		csid_reg_update(csid, port_id);
> +}
> +
> +static void csid_subdev_init(struct csid_device *csid) {}
> +
> +const struct csid_hw_ops csid_ops_680 = {
> +	.configure_testgen_pattern = NULL,
> +	.configure_stream = csid_configure_stream,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr,
> +	.reset = csid_reset,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init,
> +	.reg_update = csid_subdev_reg_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 659ffb8bb7d58..6d1d4d78011bd 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -236,6 +236,7 @@ extern const struct csid_formats csid_formats_gen2;
>   
>   extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
> +extern const struct csid_hw_ops csid_ops_680;
>   extern const struct csid_hw_ops csid_ops_gen2;
>   extern const struct csid_hw_ops csid_ops_780;
>   

Sorting order is not preserved by a preceding changeset, unfortunately.

--
Best wishes,
Vladimir

