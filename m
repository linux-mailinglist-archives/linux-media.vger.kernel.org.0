Return-Path: <linux-media+bounces-25970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29589A2FB72
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63318188294E
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344241F4611;
	Mon, 10 Feb 2025 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DH0NIB/d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F6E236431
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 21:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221789; cv=none; b=r0/QhymmwVqri6lETGnDhXOj8pEwm0TYkl/JSb8tM/b9tkFEb7ayiUlKlEMf6QrPhKatbsHKP1sqmhXTCk+GNCmVopHM2ceSfhp6srsQkQIghyqhqeJuhKR49Tq3T+Y8BGvQDxWyo3JB7SDnhYeKrBzQxNpSrOCydOHNcpy43LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221789; c=relaxed/simple;
	bh=fsSSVlJk0j5IW+qy0TjMTq+Ro4SOe2dprTeuojri1Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPcU0Tcf2kLTzrBRDcv3ddcOBOELNFXgtUxG0T8OWRwYXSmcBvJC4z7VbfN/0JMNdQdeMBLwtHWZAdZjJAnQs7HhBv5Nu6PzJvlpqxC9mnqMN5okrR2/5iWjBM94Mfqj7i3H4FsHhm9AWN6kEA/NLZ+ab3a6H5mko1O76NtEyyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DH0NIB/d; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4393f6a2c1bso10168195e9.1
        for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 13:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739221785; x=1739826585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqGtL1OMW1nybZyi+frdCR7bYKza1oEgupSRCSEBI5s=;
        b=DH0NIB/dVTollgBQ5JeFFXScemMnJEGCba4PJYbRoA23d/WW8tFLzVh8ld8cK0WNbL
         kDeuI02JppincWNCmyjUAa5z1BHZoutUv5i6fhCiSTDZwkG2QBHZwYvhT1TOdnRCwWvO
         jm53Mg4d9pvMZ0XlpH8XFGDovCsc69D4X7eiVnsgYCCZqKs5D4mCnUmiNMs0h3mb3eEX
         CuJSgw3gez5HTpG8BLlVHrqQ6zkDpOykgmp1xBZXjLGIJWLitZqrfPbNuu28bSB3jULL
         mAj+/laabeqAt8jZitxuNEdvUSmAKIOw6Cqduz8kF5CmPM+HTJRhyHy67piCW5CrL5MX
         Ao4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739221785; x=1739826585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqGtL1OMW1nybZyi+frdCR7bYKza1oEgupSRCSEBI5s=;
        b=tWjUV5skKQxhEl4wA6Wuq2HWIsDLwUwS2mqAU7FXNb+RPBDpZgumWV2dvfGjY/j6jG
         0K5E8fbTNfbVvSA1mLWF72dpSGAx90s9tLM1gitUEfiqFi/ScRK3zir6JJYJta9mL9HY
         52N41UpDqpCD1NcvFDy48BgvVbe7akKKCqhRvAm9UDU+ztEirAuK1AaJEof8ibpF2Oif
         QrvUkOg0u1pdGUjJS+ZGOrcY2ZIeCLkIkDoJlJ4lEaftsP7BFNu4CzBwovb0TI0zQdk/
         LNeBvXk2HCzCkfOQGaYz9PfXPB1YTiNWFGghIhsUPnO2MYTnhNoI2alvrBjVFn/ySNA6
         DaYg==
X-Gm-Message-State: AOJu0YzS5RAWjcDVZIXMPlm84MoUXdfZI6kioJT0j/5Wwzx/bTAoDwPh
	iZbztd45BejsJ2rGAvtxLwwt2jkee6aoZ3s3sN2a3Pbv6/40dh3M1Bf5F6IjLYQ=
X-Gm-Gg: ASbGncvTA8LhIMpPR9rSbR3WqUXXSExYFn6WkM6jJdSB6XrMers0fZ+g8Vvfgx2Mot1
	N7H/Nv6GOz6qTMglViY1zJ302m4OkgGql1CGtLxHQ46UJWtMDJF3DWo2JxwqPARc30fb7VDfYFH
	fS9M4cjRShWuXTcVxEH/4DEfRjquD/D9apdhTtLOhrq6EDS1kHCL6N23hCv6vLnnT65H0JMBsjZ
	jOfGRhZCOn0crEuY87hQdCUNeKyhNhLPqbfUfq0BcO7BOMg6EAChprJsqjbP81jQTQMViDjU6v/
	Daa6hIsy3xM7BEse/JusEUhf+xIiqqmgECdoST4LHewEURmuYH3F+knnZw==
X-Google-Smtp-Source: AGHT+IHvqUq3ySK6ZNXlDplviwiq0tjh9RWlAMsQwqqnhcPLe9mUeK0I8HEQ+vzBFTJWbj8PhTxWVw==
X-Received: by 2002:a05:6000:2a3:b0:38d:d533:d9a2 with SMTP id ffacd0b85a97d-38de43a5bd3mr623500f8f.13.1739221784873;
        Mon, 10 Feb 2025 13:09:44 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae80dsm153675415e9.22.2025.02.10.13.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 13:09:44 -0800 (PST)
Message-ID: <afea84cd-9ef4-47e5-aa08-0a3d494ac36e@linaro.org>
Date: Mon, 10 Feb 2025 21:09:42 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] media: qcom: camss: Add support for CSID 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210162843.609337-1-quic_vikramsa@quicinc.com>
 <20250210162843.609337-4-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250210162843.609337-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2025 16:28, Vikram Sharma wrote:
> The CSID in sa8775p is version 690, This csid is different from
> csid 780 w.r.t few bit-fields example:
> BUF_DONE_IRQ_STATUS_RDI_OFFSET
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../platform/qcom/camss/camss-csid-690.c      | 353 ++++++++++++++++++
>   .../platform/qcom/camss/camss-csid-690.h      |  27 ++
>   .../media/platform/qcom/camss/camss-csid.h    |   1 +
>   drivers/media/platform/qcom/camss/camss.c     | 154 ++++++++
>   5 files changed, 536 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-690.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-690.h
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index f6db5b3b5ace..f1d0e9a00220 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -7,6 +7,7 @@ qcom-camss-objs += \
>   		camss-csid-4-1.o \
>   		camss-csid-4-7.o \
>   		camss-csid-gen2.o \
> +		camss-csid-690.o \
>   		camss-csid-780.o \
>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-690.c b/drivers/media/platform/qcom/camss/camss-csid-690.c
> new file mode 100644
> index 000000000000..a05ee7630117
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-690.c
> @@ -0,0 +1,353 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (c) 2025 Qualcomm Technologies, Inc.
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
> +#include "camss-csid-690.h"
> +
> +#define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
> +#define		OUTPUT_IFE_EN			0x100
> +#define		INTERNAL_CSID			1
> +
> +#define CSID_RST_CFG			0xC
> +#define		RST_MODE			BIT(0)
> +#define		RST_LOCATION			BIT(4)
> +
> +#define CSID_RST_CMD			0x10
> +#define		SELECT_HW_RST			BIT(0)
> +#define		SELECT_SW_RST			BIT(1)
> +#define		SELECT_IRQ_RST			BIT(2)
> +
> +#define CSID_IRQ_CMD			0x14
> +#define		IRQ_CMD_CLEAR			BIT(0)
> +
> +#define CSID_RUP_AUP_CMD		0x18
> +#define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
> +
> +#define CSID_TOP_IRQ_STATUS		0x7C
> +#define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
> +
> +#define CSID_TOP_IRQ_MASK		0x80
> +#define CSID_TOP_IRQ_CLEAR		0x84
> +#define CSID_TOP_IRQ_SET		0x88
> +
> +#define CSID_CSI2_RX_IRQ_STATUS		0x9C
> +#define CSID_CSI2_RX_IRQ_MASK		0xA0
> +#define CSID_CSI2_RX_IRQ_CLEAR		0xA4
> +#define CSID_CSI2_RX_IRQ_SET		0xA8
> +
> +#define CSID_BUF_DONE_IRQ_STATUS	0x8C
> +#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 13)
> +#define CSID_BUF_DONE_IRQ_MASK		0x90
> +#define CSID_BUF_DONE_IRQ_CLEAR		0x94
> +#define CSID_BUF_DONE_IRQ_SET		0x98
> +
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
> +#define		RUP_DONE_IRQ_STATUS		BIT(23)
> +
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
> +
> +#define CSID_CSI2_RX_CFG0		0x200
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
> +#define		CSI2_RX_CFG0_VC_MODE		3
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
> +#define		CSI2_RX_CFG0_TPG_NUM_EN		27
> +#define		CSI2_RX_CFG0_TPG_NUM_SEL	28
> +
> +#define CSID_CSI2_RX_CFG1		0x204
> +#define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
> +#define		CSI2_RX_CFG1_VC_MODE		BIT(2)
> +
> +#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) ?\
> +					(0x300 + 0x100 * (rdi)) :\
> +					(0x500 + 0x100 * (rdi)))
> +#define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
> +#define		RDI_CFG0_DECODE_FORMAT		12
> +#define		RDI_CFG0_DT			16
> +#define		RDI_CFG0_VC			22
> +#define		RDI_CFG0_DT_ID			27
> +#define		RDI_CFG0_EN			BIT(31)
> +
> +#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) ? \
> +					(0x304 + 0x100 * (rdi)) :\
> +					(0x504 + 0x100 * (rdi)))
> +#define		RDI_CTRL_START_CMD		BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) ? \
> +					(0x310 + 0x100 * (rdi)) :\
> +					(0x510 + 0x100 * (rdi)))
> +#define		RDI_CFG1_DROP_H_EN		BIT(5)
> +#define		RDI_CFG1_DROP_V_EN		BIT(6)
> +#define		RDI_CFG1_CROP_H_EN		BIT(7)
> +#define		RDI_CFG1_CROP_V_EN		BIT(8)
> +#define		RDI_CFG1_PIX_STORE		BIT(10)
> +#define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
> +
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) ?\
> +							(0x348 + 0x100 * (rdi)) :\
> +							(0x548 + 0x100 * (rdi)))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) ?\
> +							(0x34C + 0x100 * (rdi)) :\
> +							(0x54C + 0x100 * (rdi)))
> +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy, int vc)
> +{
> +	int val;
> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	if (vc > 3)
> +		val |= 1 << CSI2_RX_CFG0_VC_MODE;
> +
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
> +	if (vc > 3)
> +		val |= CSI2_RX_CFG1_VC_MODE;
> +
> +	writel(val, csid->base + CSID_CSI2_RX_CFG1);
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
> +static void __csid_configure_wrapper(struct csid_device *csid)
> +{
> +	u32 val;
> +
> +	/* csid lite doesn't need to configure top register */
> +	if (csid->res->is_lite)
> +		return;
> +
> +	val = OUTPUT_IFE_EN | INTERNAL_CSID;
> +	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
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
> +
> +	val = RDI_CFG0_TIMESTAMP_EN;
> +	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= vc << RDI_CFG0_VC;
> +	val |= format->data_type << RDI_CFG0_DT;
> +	val |= dt_id << RDI_CFG0_DT_ID;
> +
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +
> +	val = readl(csid->base + CSID_RDI_CFG1(vc));
> +	val |= RDI_CFG1_PACKING_FORMAT_MIPI;
> +	val |= RDI_CFG1_PIX_STORE;
> +	val |= RDI_CFG1_DROP_H_EN;
> +	val |= RDI_CFG1_DROP_V_EN;
> +	val |= RDI_CFG1_CROP_H_EN;
> +	val |= RDI_CFG1_CROP_V_EN;
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
> +
> +	if (enable)
> +		val |= RDI_CFG0_EN;
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i;
> +
> +	__csid_configure_wrapper(csid);
> +
> +	/* Loop through all enabled VCs and configure stream for each */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i);
> +			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +}
> +
> +static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
> +{
> +	return 0;
> +}
> +
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool clear)
> +{
> +	if (clear) {
> +		csid->reg_update &= ~CSID_RUP_AUP_RDI(port_id);
> +	} else {
> +		csid->reg_update |= CSID_RUP_AUP_RDI(port_id);
> +		writel(csid->reg_update, csid->base + CSID_RUP_AUP_CMD);
> +	}
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
> +	u32 val, buf_done_val;
> +	u8 reset_done;
> +	int i;
> +
> +	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	reset_done = val & TOP_IRQ_STATUS_RESET_DONE;
> +
> +	val = readl(csid->base + CSID_CSI2_RX_IRQ_STATUS);
> +	writel(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
> +
> +	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	/* Read and clear IRQ status for each enabled RDI channel */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & RUP_DONE_IRQ_STATUS)
> +				/* clear the reg update bit */
> +				csid_subdev_reg_update(csid, i, true);
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
> +				/*
> +				 * For Titan 690, bus done and RUP IRQ have been moved to
> +				 * CSID from VFE. Once CSID received bus done, need notify
> +				 * VFE of this event. Trigger VFE to handle bus done process.
> +				 */
> +				camss_buf_done(csid->camss, csid->id, i);
> +			}
> +		}
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
> +	writel(1, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel(1, csid->base + CSID_IRQ_CMD);
> +	writel(1, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> +			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +			       csid->base + CSID_BUF_DONE_IRQ_MASK);
> +		}
> +
> +	/* preserve registers */
> +	val = RST_LOCATION | RST_MODE;
> +	writel(val, csid->base + CSID_RST_CFG);
> +
> +	val = SELECT_HW_RST | SELECT_IRQ_RST;
> +	writel(val, csid->base + CSID_RST_CMD);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void csid_subdev_init(struct csid_device *csid)
> +{
> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
> +}
> +
> +const struct csid_hw_ops csid_ops_690 = {
> +	.configure_stream = csid_configure_stream,
> +	.configure_testgen_pattern = csid_configure_testgen_pattern,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr,
> +	.reset = csid_reset,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init,
> +	.reg_update = csid_subdev_reg_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-690.h b/drivers/media/platform/qcom/camss/camss-csid-690.h
> new file mode 100644
> index 000000000000..c61db783d629
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-690.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * camss-csid-690.h
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
> + *
> + * Copyright (C) 2021 Linaro Ltd.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#ifndef QC_MSM_CAMSS_CSID_690_H
> +#define QC_MSM_CAMSS_CSID_690_H
> +
> +#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
> +#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
> +#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
> +#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
> +#define DECODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
> +#define DECODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
> +#define DECODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
> +#define DECODE_FORMAT_PAYLOAD_ONLY		0xf
> +
> +
> +#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
> +#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
> +#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
> +
> +#endif /* QC_MSM_CAMSS_CSID_690_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 659ffb8bb7d5..ce216de3041f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -237,6 +237,7 @@ extern const struct csid_formats csid_formats_gen2;
>   extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
>   extern const struct csid_hw_ops csid_ops_gen2;
> +extern const struct csid_hw_ops csid_ops_690;
>   extern const struct csid_hw_ops csid_ops_780;
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index c839b99fabd7..9458cba1b50f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2050,6 +2050,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	}
>   };
>   
> +static const struct resources_wrapper csid_wrapper_res_sa8775p = {
> +	.reg = "csid_wrapper",
> +};
> +
>   static const struct resources_wrapper csid_wrapper_res_sm8550 = {
>   	.reg = "csid_wrapper",
>   };
> @@ -2327,6 +2331,153 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csid_res_8775p[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
> +
> +		.reg = { "csid0", "csid_top" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_690,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}
> +		},
> +
> +		.reg = { "csid1", "csid_top" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_690,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +
> +	/* CSID2 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid-lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_690,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid-lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_690,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID4 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite2" },
> +		.interrupt = { "csid-lite2" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_690,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID5 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite3" },
> +		.interrupt = { "csid-lite3" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_690,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID6 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 400000000, 400000000, 0},
> +			{ 0, 0, 400000000, 480000000, 0}
> +		},
> +
> +		.reg = { "csid_lite4" },
> +		.interrupt = { "csid-lite4" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_690,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
> @@ -3316,8 +3467,11 @@ static const struct camss_resources sa8775p_resources = {
>   	.version = CAMSS_8775P,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_8775p,
> +	.csid_res = csid_res_8775p,
> +	.csid_wrapper_res = &csid_wrapper_res_sa8775p,
>   	.icc_res = icc_res_sa8775p,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
> +	.csid_num = ARRAY_SIZE(csid_res_8775p),
>   	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
>   	.link_entities = camss_link_entities
>   };

Virtually no difference between

780 and 690 here - could you again please move shared code into 
camss-csid-gen3.c and differentiate with wrapper functions in camss-csid

diff drivers/media/platform/qcom/camss/camss-csid-780.c 
drivers/media/platform/qcom/camss/camss-csid-690.c 
  
                  linux-media-qcom-camss/master?
5c5
<  * Copyright (c) 2024 Qualcomm Technologies, Inc.
---
 >  * Copyright (c) 2025 Qualcomm Technologies, Inc.
16c16
< #include "camss-csid-780.h"
---
 > #include "camss-csid-690.h"
27a28
 > #define		SELECT_SW_RST			BIT(1)
49c50
< #define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
---
 > #define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 13)
61a63
 > #define		CSI2_RX_CFG0_VC_MODE		3
63a66,67
 > #define		CSI2_RX_CFG0_TPG_NUM_EN		27
 > #define		CSI2_RX_CFG0_TPG_NUM_SEL	28
69c73,75
< #define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
---
 > #define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) ?\
 > 					(0x300 + 0x100 * (rdi)) :\
 > 					(0x500 + 0x100 * (rdi)))
78c84,86
< #define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
---
 > #define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) ? \
 > 					(0x304 + 0x100 * (rdi)) :\
 > 					(0x504 + 0x100 * (rdi)))
81c89,91
< #define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
---
 > #define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) ? \
 > 					(0x310 + 0x100 * (rdi)) :\
 > 					(0x510 + 0x100 * (rdi)))
89,91c99,104
< #define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
< #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
<
---
 > #define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) ?\
 > 							(0x348 + 0x100 * (rdi)) :\
 > 							(0x548 + 0x100 * (rdi)))
 > #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) ?\
 > 							(0x34C + 0x100 * (rdi)) :\
 > 							(0x54C + 0x100 * (rdi)))
101a115,116
 > 	if (vc > 3)
 > 		val |= 1 << CSI2_RX_CFG0_VC_MODE;
171c186,187
< 	val = RDI_CFG1_PACKING_FORMAT_MIPI;
---
 > 	val = readl(csid->base + CSID_RDI_CFG1(vc));
 > 	val |= RDI_CFG1_PACKING_FORMAT_MIPI;
262c278
< 				* For Titan 780, bus done and RUP IRQ have been moved to
---
 > 				* For Titan 690, bus done and RUP IRQ have been moved to
328c344
< const struct csid_hw_ops csid_ops_780 = {
---
 > const struct csid_hw_ops csid_ops_690 = {

Now yes, resisted the name camss-csid-gen3.c when it was 690 or 780 
specific but, given the level of convergence with what we are doing 
upstream @ simple bayer only, I think we should make the effort to share 
code and resuse.

---
bod

