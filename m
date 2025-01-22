Return-Path: <linux-media+bounces-25091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87735A18958
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 02:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D57A188AFE0
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 01:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B864437C;
	Wed, 22 Jan 2025 01:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIng3HEm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147391CA81
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 01:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737507889; cv=none; b=PJoDGOUN2WAm1dDpg8pdesH38phKBpPFLyfLpxwty3SI7NN0lIUW58PuZPlRxvi/d8Dn+gCwyI5LOlq8nAFwwBrbeG4MLEWkN9j2UZpbBmyX16qwhjWDhLhMS625g3pdf24UQtpwhPgBmivIMPn5fSFNLXGywYMnlqlg+4Fj4Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737507889; c=relaxed/simple;
	bh=22jZ5sHuHK74xjEqJCZr6eSRiuGZ/c+I0GyR94uKMys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlABZfPstqZQS0cBFVEaKgOGd1nT851u3MxsgQLvyQL9Qw9cYcEgVIUIe/nKnfSimlDEci4fQexMn5VcWE7DcBa6X3vVYvusBKumMU5VdH7OLkCBtFb6xns/LRs4n8mzbYY8i8YWuNPwXMlIW7rs5mPBQZpNHNZI0bYT4vUswWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIng3HEm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30156c52c25so4139081fa.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 17:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737507884; x=1738112684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RpEFWBRdtwVQbKZDfZ05m+xQX525EAmL5nS2hXXQx9g=;
        b=aIng3HEm3rUI0hQX8tuYX7dYjxbSNnvp1dZAgRnMtm+dJF1DpwPtY0obfZfgS96nEF
         oZ+UrggoBRUbF0KQHc5CcM6ySlEvPkVBsdnNSzioUMFMvbT0SiW/8Eeiwn2xrrKu22o+
         wyT+KqV97Q3jcIaXb2MAXe0zJwY4nwilqwOm5noB9HAOtnhyd+qz9QNe311Mf8SxeJCR
         s//+650wlEeBBhNhq7ONYU0NSHQSF19wcKjwjADO/EvcvJbBNMwWL9eo1pH9PSmB8mAR
         VKP5GtxF/oV9c1z8lMi2vIpPpbMuiu4pUMIxSZ+9m6nQhTa5ywWsRY9or/O4tFnqXOl3
         GD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737507884; x=1738112684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpEFWBRdtwVQbKZDfZ05m+xQX525EAmL5nS2hXXQx9g=;
        b=pt9PYLBZA8+S/Bst3vckUTSmRPHqaGeDK2ItET1s2K0orHUn55s4olu3XTt4fyk/aE
         U0hfed0J/9qxJhvGwsmovuFd893SUkQVnfnLwmR2CVqptxs4F6WprAdLdWirQdKtxr49
         aMAmVHEIJnqtDvAJq1TS1t/fpK23bDb5K3ujnDQtIZuFfI8mHWTg4EiG3/RaOi6UgX7o
         LaArFYxXp2rvvutyy/PyplH8e7wMXb6LgZwbZfQxZg21kR5+7XJKC5hYmeBcYOu4oU2Q
         +dfQT+TO0/UraZxXQm9hWO0mukm0P3HErnG2/zyDKmqccyR8zlVkKjLxUGh4wnfJuL90
         skIA==
X-Forwarded-Encrypted: i=1; AJvYcCWsALINpdWzK8GVAoOR4PBJfZIbzMwbIHjFUbutNxvR4zGyYEaCk/KlafHWL1NMJrqoa7g1BNplork2kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNFpL737chpU8ar9J3a+6+34hX9SKGed3tD33i8qTAzQYYI+G
	Gy7gIFFzmxVaO3A4z+72keGCezhhrPiO0VzDeweCSW1PEzoHKmGmQdrAnRAeNBk=
X-Gm-Gg: ASbGncs+vPJ75Fvw7p4WejXsS3Mm6L8/9iTmUpjL//RTGBWmuJashO0g7a3qfUq9Fok
	BCLhjqi0N+l8MUvmF/gHbyNn92yteQIvpnV1FXSxL5i3Q7XgcX/rC6SB+CbwnbLY5vodCR3Ye1w
	2bOcypNsTDk3mw442Th9lPm8S39dWn4ZIDKCK5IYYL1/sy0Y8N6XTbQv3TZDBLJ2xOanNFmN3I5
	pli6J+dSNQxcs5RT0naLBrxDQdw7P7bTlibWV9nZeDzYbRuUHq5YEf20H2lE9jxn5KvWgaquzhX
	ifuo+z+d8wlRzxlxeYst73Thk25zN+rdaxSAYr04qSw3t4kf
X-Google-Smtp-Source: AGHT+IEosX38U3R1kto4YOF1iFBGu3ucjvdMmYuKnp1fgVIjmAZBF2y04gu4SN48pi37rlqxsypHTA==
X-Received: by 2002:a05:6512:32c9:b0:542:9807:97b3 with SMTP id 2adb3069b0e04-543bb342b23mr242172e87.4.1737507883964;
        Tue, 21 Jan 2025 17:04:43 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af72972sm2015606e87.175.2025.01.21.17.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 17:04:42 -0800 (PST)
Message-ID: <b9c51303-9f7d-409f-b052-640bc7bbf01b@linaro.org>
Date: Wed, 22 Jan 2025 03:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/16] media: qcom: camss: Add CSID 780 support
Content-Language: ru-RU
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20250113043133.1387162-1-quic_depengs@quicinc.com>
 <20250113043133.1387162-16-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250113043133.1387162-16-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/25 06:31, Depeng Shao wrote:
> The CSID in sm8550 is version 780, it has new register offset
> and new functionality. The buf done irq, register update and
> reset are moved to CSID 780.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../platform/qcom/camss/camss-csid-780.c      | 337 ++++++++++++++++++
>   .../platform/qcom/camss/camss-csid-780.h      |  25 ++
>   .../media/platform/qcom/camss/camss-csid.h    |   1 +
>   drivers/media/platform/qcom/camss/camss.c     |  85 +++++
>   5 files changed, 449 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.h
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index e636968a1126..9a723e8712a2 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -7,6 +7,7 @@ qcom-camss-objs += \
>   		camss-csid-4-1.o \
>   		camss-csid-4-7.o \
>   		camss-csid-gen2.o \
> +		camss-csid-780.o \

Please keep the list sorted alphanumerically.

>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
>   		camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.c b/drivers/media/platform/qcom/camss/camss-csid-780.c
> new file mode 100644
> index 000000000000..4c720d177731
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-780.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
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
> +#include "camss-csid-780.h"
> +
> +#define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
> +#define		OUTPUT_IFE_EN			0x100

BIT(8)

> +#define		INTERNAL_CSID			1

BIT(0)

> +
> +#define CSID_RST_CFG			0xC
> +#define		RST_MODE			BIT(0)
> +#define		RST_LOCATION			BIT(4)
> +
> +#define CSID_RST_CMD			0x10
> +#define		SELECT_HW_RST			BIT(0)
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
> +#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
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
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
> +
> +#define CSID_CSI2_RX_CFG1		0x204
> +#define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
> +#define		CSI2_RX_CFG1_VC_MODE		BIT(2)
> +
> +#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
> +#define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
> +#define		RDI_CFG0_DECODE_FORMAT		12
> +#define		RDI_CFG0_DT			16
> +#define		RDI_CFG0_VC			22
> +#define		RDI_CFG0_DT_ID			27
> +#define		RDI_CFG0_EN			BIT(31)
> +
> +#define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
> +#define		RDI_CTRL_START_CMD		BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
> +#define		RDI_CFG1_DROP_H_EN		BIT(5)
> +#define		RDI_CFG1_DROP_V_EN		BIT(6)
> +#define		RDI_CFG1_CROP_H_EN		BIT(7)
> +#define		RDI_CFG1_CROP_V_EN		BIT(8)
> +#define		RDI_CFG1_PIX_STORE		BIT(10)
> +#define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
> +
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
> +
> +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy, int vc)
> +{
> +	int val;

u32 val;

> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
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

u32 val = enable ? RDI_CTRL_START_CMD : 0;

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

Here is a misplaced local variable declaration.

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
> +	val = RDI_CFG1_PACKING_FORMAT_MIPI;
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
> +				 * For Titan 780, bus done and RUP IRQ have been moved to
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
> +const struct csid_hw_ops csid_ops_780 = {
> +	.configure_stream = csid_configure_stream,
> +	.configure_testgen_pattern = csid_configure_testgen_pattern,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr,
> +	.reset = csid_reset,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init,
> +	.reg_update = csid_subdev_reg_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.h b/drivers/media/platform/qcom/camss/camss-csid-780.h
> new file mode 100644
> index 000000000000..a990c66a60ff
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-780.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * camss-csid-780.h
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
> + *
> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
> + */
> +#ifndef __QC_MSM_CAMSS_CSID_780_H__
> +#define __QC_MSM_CAMSS_CSID_780_H__
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
> +#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
> +#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
> +#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
> +
> +#endif /* __QC_MSM_CAMSS_CSID_780_H__ */
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 4f8765c251bc..659ffb8bb7d5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -237,6 +237,7 @@ extern const struct csid_formats csid_formats_gen2;
>   extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
>   extern const struct csid_hw_ops csid_ops_gen2;
> +extern const struct csid_hw_ops csid_ops_780;

Please keep the list sorted alphanumerically.

>   
>   /*
>    * csid_is_lite - Check if CSID is CSID lite.
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 80f8b77547a1..e9519fb99f06 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2045,6 +2045,88 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	}
>   };
>   
> +static const struct resources_wrapper csid_wrapper_res_sm8550 = {
> +	.reg = "csid_wrapper",
> +};
> +
> +static const struct camss_subdev_resources csid_res_8550[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_780,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_780,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.is_lite = false,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_780,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 */
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
> +			.hw_ops = &csid_ops_780,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID4 */
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
> +			.hw_ops = &csid_ops_780,
> +			.formats = &csid_formats_gen2
> +		}
> +	}
> +};
> +
>   static const struct resources_icc icc_res_sm8550[] = {
>   	{
>   		.name = "ahb",
> @@ -3098,9 +3180,12 @@ static const struct camss_resources sm8550_resources = {
>   	.version = CAMSS_8550,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_8550,
> +	.csid_res = csid_res_8550,
> +	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.icc_res = icc_res_sm8550,
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
> +	.csid_num = ARRAY_SIZE(csid_res_8550),
>   	.link_entities = camss_link_entities
>   };
>   

--
Best wishes,
Vladimir

