Return-Path: <linux-media+bounces-47819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E8DC8DB47
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D11543AFDB5
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18BD328B61;
	Thu, 27 Nov 2025 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYE7hlWD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47B31A571
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238445; cv=none; b=YPnvt9L2vRyWUv0tSU4ZIVYPOHK5b8cs6s1VrnfSkQ6aAY1/X+R7ZH1UWfoq3DjrRaPzi6rSMw3kamE9Z/ova1WcPr+PVo4e6ipZ/ss1zkn70tv/fTX//XAUwfnSqbta5XrZjd1Mx17rrukcSpri521QVkmdZghfDDEPrHxYDyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238445; c=relaxed/simple;
	bh=X2V2uu+ZeBz25iNI8tCe8vaund7qhr7i+kdhdtNJStY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsPJTG/2pJFgppiJVzAmHThPGCw0PjZafuVyv3cZdeEG2ny9vzoR3W+D6GpkLGm8WbMXdwb2jTPrSq7KFYFCQWHRBpK+MfTrg1YoqB4c0EIQbwKXbpXfjNZme0EhyuQLCiLFXAZXDfK48e67TDTC8Jer9UiaMqb4yPPNk4bGbDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYE7hlWD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779a637712so3875375e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 02:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764238441; x=1764843241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orPijynuM24sk+uefychOu91wqOnAKJOLeM7UTEv4PA=;
        b=ZYE7hlWDdqcO8p23h2QFT6gC/+IdLK3I9QSWlBxf66DxXoxtaeLsv3xJRaBJfvwaIP
         QW5ArStfkRHdY7uNHiPXA2jXqju3nFfEAWxQIdAL0jEeJnILfGwMUmjtBcvamsmJJBUl
         WbYsVJx9VKK8vc+DFborTPLtl0qB3a7mSlNvyt7v626nF5Hgy9+MNnjjuN/dmBHwLKWu
         qOrDb+5S2MZwIrGxwp4o4um+oveYjVRBdiL3gKGLedHKJ1XF69rVW06KJy6HWGobjC2i
         cez7LLZIEHXVoJDqW6oToe38avHBibtCfoGHM9diqIw5i/TIH7SB4x3BvPYF3SEK1TQ6
         V97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238441; x=1764843241;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orPijynuM24sk+uefychOu91wqOnAKJOLeM7UTEv4PA=;
        b=Cat5/VV/jWt+F4Oge7Yt5o/V2kNUqZDp0zNwSNImPsbU67cD+aIJgXOFWeR22ht4nr
         FZuALZ2NcvYirLPB8QJhiYWUP2tdkOPpHgbRQ+s9yZ5fdiSCOgBf4Y+3665LaRb0Ixc1
         WYmIAIu/cqpk4H0MZ6W/rPBRlUamegZ9wbHjmKfjje3s0KhRqlT+eNTya3IKYJ0r/fuH
         aO7uEnEm9Y8Ji6vJGRLx+3QWPKINeJhvwygbTeFV4TW4PDjUnfxw9ouz+TWyIvYwf4TA
         MQFW46Fnl7KS31sRZZzbwTBei0ON8cg68M3cXY/pTAuIyBDdMtQwsdc4koVnML4nF5rB
         zivQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxHOKPrUo138GVopWvnpOM1D8+IT1gjrrYQ3oQ/UWeQaPnBzM7jkyyC8y2UVT0fNNvpK0wFfMJUNn1rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPftg7TLDCkRYD49vHbbimb57OVw/15VDzkvnEfZm+jnIF2uya
	0dBW45AYYRYpcnWA6KM0Ywi6YyTTDOcVihf3LMzD5tL98MPghYEWKuWTvpJW9f1YcF8=
X-Gm-Gg: ASbGncvq610cFeREfpRmxW6iLG/lcMgTaHeV+XhizK3XDcgCs8XBdtP34S2stH+zHcY
	Xnt1pJ/QMH5OYzs+3J6SdcJYUORR5QxSiNbFpJEP7IXoie+P+9RFNQIDu6GtnOCisbIV/3U3JjQ
	f7pPSxaaoCGlFcXlkeXxxFcZ46o3mxq/xIaLetb/cGmq3H1CKC6bwA7wS4c2/ljhf73G6I8wnZK
	MyAD0pX+tP4hzjEl5rfT6bpCdziV6tgy87Xi4Btu4CguYE2wgadkhCsu6COpGrL4cVQVCgw/xzb
	hvVjjQM7WHig2tevnOMHFpdXFUQdMocPRkWO1mmtQIW3tSE/sbWm1Cw6l4h12T1bQRMJr6IhgD2
	36CsK1omkl6Dy/Ro7TYuOCxlMZNL3D9SL1wNGT1qp92Z+19/hHT5+66G0iqkgkscWEDgQPrBiNH
	2XgtyZNS/8/aBiKlVgMKBin619UwPexXIY0X1uJf/+ThRHtTdIW8v7
X-Google-Smtp-Source: AGHT+IFxZGT0j44K+S/bj1Q2HUEW6TyfdkLQ/BG/TLMXCnotjiwqpQ2IAPidgPOSXFIRPvQ33OVfuA==
X-Received: by 2002:a05:600c:1f0f:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-477c0165bb8mr218091195e9.3.1764238440835;
        Thu, 27 Nov 2025 02:14:00 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca40945sm2601502f8f.30.2025.11.27.02.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:14:00 -0800 (PST)
Message-ID: <e4069c09-2344-4ffb-a81a-baebc3ba847d@linaro.org>
Date: Thu, 27 Nov 2025 10:13:58 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] media: qcom: camss: csid: Add support for CSID
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
 <20251120-add-support-for-camss-on-kaanapali-v7-4-de27f9a67ce6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251120-add-support-for-camss-on-kaanapali-v7-4-de27f9a67ce6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2025 04:43, Hangxiang Ma wrote:
> Add more detailed resource information for CSID devices along with the
> driver for CSID 1080 that is responsible for CSID register
> configuration, module reset and IRQ handling for BUF_DONE events. And
> aggregate a common definition 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' into csid
> header file.
> 
> In this CSID version, RUP and AUP update values are split into two
> registers along with a SET register. Accordingly, enhance the CSID
> interface to accommodate both the legacy combined reg_update and the
> split RUP and AUP updates.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   .../media/platform/qcom/camss/camss-csid-1080.c    | 377 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
>   drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
>   drivers/media/platform/qcom/camss/camss.c          |  80 +++++
>   6 files changed, 468 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 23960d02877d..3a7ed4f5a004 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -8,6 +8,7 @@ qcom-camss-objs += \
>   		camss-csid-4-7.o \
>   		camss-csid-340.o \
>   		camss-csid-680.o \
> +		camss-csid-1080.o \
>   		camss-csid-gen2.o \
>   		camss-csid-gen3.o \
>   		camss-csiphy-2ph-1-0.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 000000000000..c5a866f25d5b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> @@ -0,0 +1,377 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csid-1080.c
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-gen3.h"
> +
> +/* Reset and Command Registers */
> +#define CSID_RST_CFG				0x108
> +#define		RST_MODE				BIT(0)
> +#define		RST_LOCATION				BIT(4)
> +
> +/* Reset and Command Registers */
> +#define CSID_RST_CMD				0x10C
> +#define		SELECT_HW_RST				BIT(0)
> +#define		SELECT_IRQ_RST				BIT(2)
> +#define CSID_IRQ_CMD				0x110
> +#define		IRQ_CMD_CLEAR				BIT(0)
> +
> +/* Register Update Commands, RUP/AUP */
> +#define CSID_RUP_CMD				0x114
> +#define CSID_AUP_CMD				0x118
> +#define		CSID_RUP_AUP_RDI(rdi)			(BIT(8) << (rdi))
> +#define CSID_RUP_AUP_CMD			0x11C
> +#define		RUP_SET					BIT(0)
> +#define		MUP					BIT(4)
> +
> +/* Top level interrupt registers */
> +#define CSID_TOP_IRQ_STATUS			0x180
> +#define CSID_TOP_IRQ_MASK			0x184
> +#define CSID_TOP_IRQ_CLEAR			0x188
> +#define		INFO_RST_DONE				BIT(0)
> +#define		CSI2_RX_IRQ_STATUS			BIT(2)
> +#define		BUF_DONE_IRQ_STATUS			BIT(3)
> +
> +/* Buffer done interrupt registers */
> +#define CSID_BUF_DONE_IRQ_STATUS		0x1A0
> +#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		16
> +#define CSID_BUF_DONE_IRQ_MASK			0x1A4
> +#define CSID_BUF_DONE_IRQ_CLEAR			0x1A8
> +#define CSID_BUF_DONE_IRQ_SET			0x1AC
> +
> +/* CSI2 RX interrupt registers */
> +#define CSID_CSI2_RX_IRQ_STATUS			0x1B0
> +#define CSID_CSI2_RX_IRQ_MASK			0x1B4
> +#define CSID_CSI2_RX_IRQ_CLEAR			0x1B8
> +#define CSID_CSI2_RX_IRQ_SET			0x1BC
> +
> +/* CSI2 RX Configuration */
> +#define CSID_CSI2_RX_CFG0			0x880
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
> +#define CSID_CSI2_RX_CFG1			0x884
> +#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
> +#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
> +
> +#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)
> +
> +/* RDI Configuration */
> +#define CSID_RDI_CFG0(rdi) \
> +	((csid_is_lite(csid) ? 0x3080 : 0x5480) + 0x200 * (rdi))
> +#define		RDI_CFG0_RETIME_BS			BIT(5)
> +#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
> +#define		RDI_CFG0_DECODE_FORMAT			12
> +#define		RDI_CFG0_DT				16
> +#define		RDI_CFG0_VC				22
> +#define		RDI_CFG0_EN				BIT(31)
> +
> +/* RDI Control and Configuration */
> +#define CSID_RDI_CTRL(rdi) \
> +	((csid_is_lite(csid) ? 0x3088 : 0x5488) + 0x200 * (rdi))
> +#define		RDI_CTRL_START_CMD			BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi) \
> +	((csid_is_lite(csid) ? 0x3094 : 0x5494) + 0x200 * (rdi))
> +#define		RDI_CFG1_DROP_H_EN			BIT(5)
> +#define		RDI_CFG1_DROP_V_EN			BIT(6)
> +#define		RDI_CFG1_CROP_H_EN			BIT(7)
> +#define		RDI_CFG1_CROP_V_EN			BIT(8)
> +#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
> +
> +/* RDI Pixel Store Configuration */
> +#define CSID_RDI_PIX_STORE_CFG0(rdi)		(0x5498 + 0x200 * (rdi))
> +#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
> +#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
> +
> +/* RDI IRQ Status in wrapper */
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		(0x224 + (0x10 * (rdi)))
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)			(0x228 + (0x10 * (rdi)))
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)		(0x22C + (0x10 * (rdi)))
> +#define		INFO_RUP_DONE				BIT(23)
> +
> +static void __csid_aup_rup_trigger(struct csid_device *csid)
> +{
> +	/* trigger SET in combined register */
> +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	int val;
> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +	       << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
> +{
> +	int val;
> +
> +	if (vc > 3) {
> +		val = readl(csid->base + CSID_CSI2_RX_CFG1);
> +		val |= CSI2_RX_CFG1_VC_MODE;
> +		writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +	}
> +}
> +
> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> +{
> +	int val = 0;
> +
> +	if (enable)
> +		val = RDI_CTRL_START_CMD;
> +
> +	writel(val, csid->base + CSID_RDI_CTRL(rdi));
> +}
> +
> +static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 rdi)
> +{
> +	u32 val;
> +
> +	/* Configure pixel store to allow absorption of hblanking or idle time.
> +	 * This helps with horizontal crop and prevents line buffer conflicts.
> +	 * Reset state is 0x8 which has MIN_HBI=4, we keep the default MIN_HBI
> +	 * and just enable the pixel store functionality.
> +	 */
> +	val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
> +	writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
> +}
> +
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +{
> +	u32 val;
> +	u8 lane_cnt = csid->phy.lane_cnt;
> +
> +	/* Source pads matching RDI channels on hardware.
> +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> +	 */
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +
> +	if (!lane_cnt)
> +		lane_cnt = 4;
> +
> +	val = RDI_CFG0_TIMESTAMP_EN;
> +	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> +	val |= RDI_CFG0_RETIME_BS;
> +
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= vc << RDI_CFG0_VC;
> +	val |= format->data_type << RDI_CFG0_DT;
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +
> +	val = RDI_CFG1_PACKING_FORMAT_MIPI;
> +	writel(val, csid->base + CSID_RDI_CFG1(vc));
> +
> +	/* Configure pixel store using dedicated register in 1080 */
> +	if (!csid_is_lite(csid))
> +		__csid_configure_rdi_pix_store(csid, vc);
> +
> +	val = 0;
> +	writel(val, csid->base + CSID_RDI_CTRL(vc));
> +
> +	val = readl(csid->base + CSID_RDI_CFG0(vc));
> +
> +	if (enable)
> +		val |= RDI_CFG0_EN;
> +
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +}
> +
> +static void csid_configure_stream_1080(struct csid_device *csid, u8 enable)
> +{
> +	u8 i;
> +	u8 vc;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (vc = 0; vc < MSM_CSID_MAX_SRC_STREAMS_1080; vc++) {
> +		if (csid->phy.en_vc & BIT(vc)) {
> +			__csid_configure_rdi_stream(csid, enable, vc);
> +			__csid_configure_rx_vc(csid, vc);
> +
> +			for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++)
> +				__csid_aup_update(csid, vc);
> +
> +			__csid_reg_update(csid, vc);
> +
> +			__csid_ctrl_rdi(csid, enable, vc);
> +		}
> +	}
> +}
> +
> +static int csid_configure_testgen_pattern_1080(struct csid_device *csid,
> +					       s32 val)
> +{
> +	return 0;
> +}
> +
> +static void csid_subdev_reg_update_1080(struct csid_device *csid, int port_id,
> +					bool clear)
> +{
> +	if (clear)
> +		__csid_aup_rup_clear(csid, port_id);
> +	else
> +		__csid_aup_update(csid, port_id);
> +}
> +
> +/**
> + * csid_isr - CSID module interrupt service routine
> + * @irq: Interrupt line
> + * @dev: CSID device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t csid_isr_1080(int irq, void *dev)
> +{
> +	struct csid_device *csid = dev;
> +	u32 val, buf_done_val;
> +	u8 reset_done;
> +	int i;
> +
> +	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +
> +	reset_done = val & INFO_RST_DONE;
> +
> +	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & INFO_RUP_DONE)
> +				csid_subdev_reg_update_1080(csid, i, true);
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
> +				camss_buf_done(csid->camss, csid->id, i);
> +		}
> +	}
> +
> +	val = IRQ_CMD_CLEAR;
> +	writel(val, csid->base + CSID_IRQ_CMD);
> +
> +	if (reset_done)
> +		complete(&csid->reset_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/**
> + * csid_reset - Trigger reset on CSID module and wait to complete
> + * @csid: CSID device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csid_reset_1080(struct csid_device *csid)
> +{
> +	unsigned long time;
> +	u32 val;
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	val = 0;
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			/*
> +			 * Only need to clear buf done IRQ status here,
> +			 * RUP done IRQ status will be cleared once isr
> +			 * strobe generated by CSID_RST_CMD
> +			 */
> +			val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
> +		}
> +	}
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
> +
> +	/* Clear all IRQ status with CLEAR bits set */
> +	val = IRQ_CMD_CLEAR;
> +	writel(val, csid->base + CSID_IRQ_CMD);
> +
> +	val = RST_LOCATION | RST_MODE;
> +	writel(val, csid->base + CSID_RST_CFG);
> +
> +	val = SELECT_HW_RST | SELECT_IRQ_RST;
> +	writel(val, csid->base + CSID_RST_CMD);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void csid_subdev_init_1080(struct csid_device *csid)
> +{
> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
> +}
> +
> +const struct csid_hw_ops csid_ops_1080 = {
> +	.configure_stream = csid_configure_stream_1080,
> +	.configure_testgen_pattern = csid_configure_testgen_pattern_1080,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr_1080,
> +	.reset = csid_reset_1080,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init_1080,
> +	.reg_update = csid_subdev_reg_update_1080,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> index 3ad3a174bcfb..86134a23cd4e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -101,7 +101,6 @@
>   #define		CSI2_RX_CFG0_DL2_INPUT_SEL			12
>   #define		CSI2_RX_CFG0_DL3_INPUT_SEL			16
>   #define		CSI2_RX_CFG0_PHY_NUM_SEL			20
> -#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
>   #define		CSI2_RX_CFG0_PHY_TYPE_SEL			24
>   
>   #define CSID_CSI2_RX_CFG1					0x204
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 664245cf6eb0..f09b5575572a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -103,7 +103,6 @@
>   #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
>   							(0x34C + 0x100 * (rdi)) :\
>   							(0x54C + 0x100 * (rdi)))
> -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
>   
>   static void __csid_configure_rx(struct csid_device *csid,
>   				struct csid_phy_config *phy, int vc)
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index aedc96ed84b2..6c214b487003 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -27,6 +27,8 @@
>   /* CSID hardware can demultiplex up to 4 outputs */
>   #define MSM_CSID_MAX_SRC_STREAMS	4
>   
> +/* CSIPHY to hardware PHY selector mapping */
> +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
>   #define CSID_RESET_TIMEOUT_MS 500
>   
>   enum csid_testgen_mode {
> @@ -154,7 +156,13 @@ struct csid_device {
>   	void __iomem *base;
>   	u32 irq;
>   	char irq_name[30];
> -	u32 reg_update;
> +	union {
> +		u32 reg_update;
> +		struct {
> +			u32 rup_update;
> +			u32 aup_update;
> +		};
> +	};
>   	struct camss_clock *clock;
>   	int nclocks;
>   	struct regulator_bulk_data *supplies;
> @@ -215,6 +223,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
>   extern const struct csid_hw_ops csid_ops_340;
>   extern const struct csid_hw_ops csid_ops_680;
> +extern const struct csid_hw_ops csid_ops_1080;
>   extern const struct csid_hw_ops csid_ops_gen2;
>   extern const struct csid_hw_ops csid_ops_gen3;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index b12e79e40e97..30e58aeea310 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -139,6 +139,84 @@ static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csid_res_kaanapali[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_1080,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_1080,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_1080,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID_LITE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_1080,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID_LITE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_1080,
> +			.formats = &csid_formats_gen2
> +		}
> +	}
> +};
> +
>   static const struct resources_icc icc_res_kaanapali[] = {
>   	{
>   		.name = "ahb",
> @@ -4414,9 +4492,11 @@ static const struct camss_resources kaanapali_resources = {
>   	.version = CAMSS_KAANAPALI,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_kaanapali,
> +	.csid_res = csid_res_kaanapali,
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
> +	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
>   };
>   
>   static const struct camss_resources msm8916_resources = {
> 

Should this be "gen4" instead of 1080 also ?

---
bod

