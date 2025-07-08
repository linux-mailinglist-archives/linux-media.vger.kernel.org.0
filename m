Return-Path: <linux-media+bounces-37071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D23CAFC6BB
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 11:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEA8818955C9
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 09:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E392BF00C;
	Tue,  8 Jul 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ycvWbITJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE0216E1B
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965742; cv=none; b=Zop5NQ/mXF4IH3mUn8nf2qyxcAw0GRqfIoMIaARY96T1ZCsqI4BOewCo8m7VWh/Cdp7q8HFWF2pBLUj+DHIrTeE9qWT0j5e+SHhLd2BSJ28UXS5OirLorp301XAOX75AfnT54OL0r1V6P5T4xzOdYexMgvIycuKoAnS2BCbLDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965742; c=relaxed/simple;
	bh=Jo1RhBKvlnldDLuILOpnjCjiNkC4SVuBJ0JGqZmH2X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fa18n6EwtysSMLDp1AE4r53qW/z0ddOTn/pTSg4sgOX7DX1uuPSu/7sLPWlRqiToskykWIjBdLYgxmmYXT4TB1M/lux9p5Luac0HG5HBu8YaAduHoJmDdInm6d8AtAO6h+q48iyaw1Q8BIF++qPblk75ci26GdtpWNNlur2aTH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ycvWbITJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso2386764f8f.2
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751965736; x=1752570536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOpMnOPGBurKned4i2lhAKJorxKo0Rv4+Jnm5nobJAA=;
        b=ycvWbITJDhyRzV1qkQszeXiZwkYgZP5YRRWhQaVQzOjJ4PJhj23mGg5ZjyKymb7ago
         MjGLbFcDf1p9yoaC5Ajbnr3AsKMBXMlFq0HdwWTXXBb+DUx+cSjmvo3laxtBJOGEF/Em
         0FWNlZgAVZwbjQ2JQY7RrYtjR5ABRCPL94rbXVzu+lpksj7erPRH7/MLArojw7YCW7ax
         RNRI9rh3bzlUl22V7vQvscv9gwrHCyHLgnQCGQzrRCnDGeDUH9e1CXiOJyjXd06SbFh2
         kuHFDSj0gVKeLMV35xE8JPLQ9OEemxA7by2fscFkpwwC2qgDyiD7no0IKFCWujlvsZ+X
         msbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751965736; x=1752570536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOpMnOPGBurKned4i2lhAKJorxKo0Rv4+Jnm5nobJAA=;
        b=mljp6E7oVhdWeM2++QWlQu7Fy2hYIHrbWkmmHxBuJQfiLapgyWN1zpFDiUrmdhGiEb
         vU+9j9A/leO226gywrN5UKTT1DiqJB1cpJlKlit0KM7D9+GlDR1pEZrH2XHCxDPLCc9p
         0lPqLjFQjKEls4qfr1vCNahqspqeKg59L1TiImspWNpRt7e3z335jK89H7U/dA1/xaWY
         KzRXxVox8WwSznGf7IYtQ1y8OLVh58WLVdpsJnEq73x8dBOhsCUv5LlJVJrXiVm4OnWJ
         mwjZTUxrysyrpI6ay18EouIC0LYjE/7JniQLIdCYf7S0E+IOxb3ksebFSMjU3eEKPDM5
         w2mg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6MaZ0JJ6ch24Lvd5H9ZLb++X/5h1a0TgUdxgNPWYIcvJ6YM6rSQLhn3OcfD7cmRVMOry7s3Qp0nllg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp8ivFBJuobia8URGF8bzVi7AGJwiJ2ZHvHb0oB5vntbxcxBr5
	VW8TfsrOGGl7B4fgJJpj9qii3jc6M2ibOer1O/nxkB5opdA1mxaLacYtarkbWZ3Czuw=
X-Gm-Gg: ASbGncuQAVZ5taSo8EwDyj/LGvqiyAUZnepGmi0oDZa6u2a08nf0u0AzpvJvUyWnfNb
	C9GJo41kJQr5Na0qGSysXYjqX4AufsSHGJTB++vpISCHn2wp71t4WBjsb5xdL25tbR+BCc7/ieE
	e5tvURIMJxrrFOAvFIK7FeuvCOQrk09nMi8LM7tndeOGN3RlP9lWJAh8iboPUibjsPiR8HjmAWI
	fX1udiFxru4rJrc5H2H/1oj0UIKrGqsJMSOiYPTpZfeyxOLZgp5oVhar3RgpJ7/2sRwrAnPsfsl
	KeeiKF2vUuhA+0ttW9CNL5yWze5Ue33EXIO0bzsaAmUVs8CKDkhgr5yVR16KoblPlE4IleIMS7K
	hU/EWqS+ltiLWjxUxYVI66C9qWoCx
X-Google-Smtp-Source: AGHT+IGvTL/GcwVO41AlekLodubFzqB1cL63OpGeifxbI2Eq/rm77n7oXxhL9sUJVQiFrDCDZKFekA==
X-Received: by 2002:a5d:5888:0:b0:3a4:eecf:b8cb with SMTP id ffacd0b85a97d-3b5dde8bc33mr1924717f8f.28.1751965736267;
        Tue, 08 Jul 2025 02:08:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c6c9sm12264025f8f.89.2025.07.08.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 02:08:55 -0700 (PDT)
Message-ID: <bf525f1b-4365-44e8-aaa2-ccb7fd563db1@linaro.org>
Date: Tue, 8 Jul 2025 10:08:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] media: qcom: camss: Add support for TFE (Spectra
 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
 <20250708083222.1020-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250708083222.1020-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2025 09:32, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../media/platform/qcom/camss/camss-vfe-340.c | 319 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>   3 files changed, 321 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index d26a9c24a430..719898f5d32b 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -17,6 +17,7 @@ qcom-camss-objs += \
>   		camss-vfe-4-7.o \
>   		camss-vfe-4-8.o \
>   		camss-vfe-17x.o \
> +		camss-vfe-340.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
>   		camss-vfe-780.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> new file mode 100644
> index 000000000000..ab91387b7894
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 340 (TFE)
> + *
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
> +#define TFE_GLOBAL_RESET_CMD				(0x014)
> +#define		TFE_GLOBAL_RESET_CMD_CORE	BIT(0)
> +
> +#define TFE_REG_UPDATE_CMD				(0x02c)
> +
> +#define TFE_IRQ_CMD					(0x030)
> +#define		TFE_IRQ_CMD_CLEAR		BIT(0)
> +#define TFE_IRQ_MASK_0					(0x034)
> +#define		TFE_IRQ_MASK_0_RST_DONE		BIT(0)
> +#define		TFE_IRQ_MASK_0_BUS_WR		BIT(1)
> +#define TFE_IRQ_MASK_1					(0x038)
> +#define TFE_IRQ_MASK_2					(0x03c)
> +#define TFE_IRQ_CLEAR_0					(0x040)
> +
> +#define TFE_IRQ_STATUS_0				(0x04c)
> +
> +#define BUS_REG(a)					(0xa00 + (a))
> +
> +#define TFE_BUS_IRQ_MASK_0				BUS_REG(0x18)
> +#define		TFE_BUS_IRQ_MASK_RUP_DONE_MASK	GENMASK(3, 0)
> +#define		TFE_BUS_IRQ_MASK_RUP_DONE(sc)	FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
> +#define		TFE_BUS_IRQ_MASK_BUF_DONE_MASK	GENMASK(15, 8)
> +#define		TFE_BUS_IRQ_MASK_BUF_DONE(sg)	FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
> +#define		TFE_BUS_IRQ_MASK_0_CONS_VIOL	BIT(28)
> +#define		TFE_BUS_IRQ_MASK_0_VIOL		BIT(30)
> +#define		TFE_BUS_IRQ_MASK_0_IMG_VIOL	BIT(31)
> +
> +#define TFE_BUS_IRQ_MASK_1				BUS_REG(0x1c)
> +#define TFE_BUS_IRQ_CLEAR_0				BUS_REG(0x20)
> +#define TFE_BUS_IRQ_STATUS_0				BUS_REG(0x28)
> +#define TFE_BUS_IRQ_CMD					BUS_REG(0x30)
> +#define		TFE_BUS_IRQ_CMD_CLEAR		BIT(0)
> +
> +#define TFE_BUS_STATUS_CLEAR				BUS_REG(0x60)
> +#define TFE_BUS_VIOLATION_STATUS			BUS_REG(0x64)
> +#define TFE_BUS_OVERFLOW_STATUS				BUS_REG(0x68)
> +#define TFE_BUS_IMAGE_SZ_VIOLATION_STATUS		BUS_REG(0x70)
> +
> +#define TFE_BUS_CLIENT_CFG(c)				BUS_REG(0x200 + (c) * 0x100)
> +#define		TFE_BUS_CLIENT_CFG_EN		BIT(0)
> +#define		TFE_BUS_CLIENT_CFG_MODE_FRAME	BIT(16)
> +#define TFE_BUS_IMAGE_ADDR(c)				BUS_REG(0x204 + (c) * 0x100)
> +#define TFE_BUS_FRAME_INCR(c)				BUS_REG(0x208 + (c) * 0x100)
> +#define TFE_BUS_IMAGE_CFG_0(c)				BUS_REG(0x20c + (c) * 0x100)
> +#define		TFE_BUS_IMAGE_CFG_0_DEFAULT	0xffff
> +#define TFE_BUS_IMAGE_CFG_1(c)				BUS_REG(0x210 + (c) * 0x100)
> +#define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
> +#define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
> +#define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
> +#define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
> +#define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
> +#define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
> +#define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
> +#define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
> +
> +/*
> + * TODO: differentiate the port id based on requested type of RDI, BHIST etc
> + *
> + * TFE write master IDs (clients)
> + *
> + * BAYER		0
> + * IDEAL_RAW		1
> + * STATS_TINTLESS_BG	2
> + * STATS_BHIST		3
> + * STATS_AWB_BG		4
> + * STATS_AEC_BG		5
> + * STATS_BAF		6
> + * RDI0			7
> + * RDI1			8
> + * RDI2			9
> + */
> +#define RDI_WM(n)		(7 + (n))
> +#define TFE_WM_NUM		10
> +
> +enum tfe_iface {
> +	TFE_IFACE_PIX,
> +	TFE_IFACE_RDI0,
> +	TFE_IFACE_RDI1,
> +	TFE_IFACE_RDI2,
> +	TFE_IFACE_NUM
> +};
> +
> +enum tfe_subgroups {
> +	TFE_SUBGROUP_BAYER,
> +	TFE_SUBGROUP_IDEAL_RAW,
> +	TFE_SUBGROUP_HDR,
> +	TFE_SUBGROUP_BG,
> +	TFE_SUBGROUP_BAF,
> +	TFE_SUBGROUP_RDI0,
> +	TFE_SUBGROUP_RDI1,
> +	TFE_SUBGROUP_RDI2,
> +	TFE_SUBGROUP_NUM
> +};
> +
> +enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
> +	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
> +	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
> +	[VFE_LINE_RDI2] = TFE_IFACE_RDI2,
> +	[VFE_LINE_PIX] = TFE_IFACE_PIX,
> +};
> +
> +enum vfe_line_id tfe_subgroup_line_map[TFE_SUBGROUP_NUM] = {
> +	[TFE_SUBGROUP_BAYER] = VFE_LINE_PIX,
> +	[TFE_SUBGROUP_IDEAL_RAW] = VFE_LINE_PIX,
> +	[TFE_SUBGROUP_HDR] = VFE_LINE_PIX,
> +	[TFE_SUBGROUP_BG] = VFE_LINE_PIX,
> +	[TFE_SUBGROUP_BAF] = VFE_LINE_PIX,
> +	[TFE_SUBGROUP_RDI0] = VFE_LINE_RDI0,
> +	[TFE_SUBGROUP_RDI1] = VFE_LINE_RDI1,
> +	[TFE_SUBGROUP_RDI2] = VFE_LINE_RDI2,
> +};
> +
> +static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_id)
> +{
> +	if (line_id <= VFE_LINE_NONE || line_id >= VFE_LINE_NUM_MAX) {
> +		pr_warn("VFE: Invalid line %d\n", line_id);
> +		return TFE_IFACE_RDI0;
> +	}
> +
> +	return tfe_line_iface_map[line_id];
> +}
> +
> +static inline enum vfe_line_id __iface_to_line(unsigned int iface)
> +{
> +	int i;
> +
> +	for (i = 0; i < VFE_LINE_NUM_MAX; i++) {
> +		if (tfe_line_iface_map[i] == iface)
> +			return i;
> +	}
> +
> +	return VFE_LINE_NONE;
> +}
> +
> +static inline enum vfe_line_id __subgroup_to_line(enum tfe_subgroups sg)
> +{
> +	if (sg >= TFE_SUBGROUP_NUM)
> +		return VFE_LINE_NONE;
> +
> +	return tfe_subgroup_line_map[sg];
> +}
> +
> +static void vfe_global_reset(struct vfe_device *vfe)
> +{
> +	writel(TFE_IRQ_MASK_0_RST_DONE, vfe->base + TFE_IRQ_MASK_0);
> +	writel(TFE_GLOBAL_RESET_CMD_CORE, vfe->base + TFE_GLOBAL_RESET_CMD);
> +}
> +
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +	struct vfe_device *vfe = dev;
> +	u32 status;
> +	int i;
> +
> +	status = readl_relaxed(vfe->base + TFE_IRQ_STATUS_0);
> +	writel_relaxed(status, vfe->base + TFE_IRQ_CLEAR_0);
> +	writel_relaxed(TFE_IRQ_CMD_CLEAR, vfe->base + TFE_IRQ_CMD);
> +
> +	if (status & TFE_IRQ_MASK_0_RST_DONE) {
> +		dev_dbg(vfe->camss->dev, "VFE%u: Reset done!", vfe->id);
> +		vfe_isr_reset_ack(vfe);
> +	}
> +
> +	if (status & TFE_IRQ_MASK_0_BUS_WR) {
> +		u32 bus_status = readl_relaxed(vfe->base + TFE_BUS_IRQ_STATUS_0);
> +
> +		writel_relaxed(bus_status, vfe->base + TFE_BUS_IRQ_CLEAR_0);
> +		writel_relaxed(TFE_BUS_IRQ_CMD_CLEAR, vfe->base + TFE_BUS_IRQ_CMD);
> +
> +		for (i = 0; i < TFE_IFACE_NUM; i++) {
> +			if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
> +				vfe->res->hw_ops->reg_update_clear(vfe, __iface_to_line(i));
> +		}
> +
> +		for (i = 0; i < TFE_SUBGROUP_NUM; i++) {
> +			if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
> +				vfe_buf_done(vfe, __subgroup_to_line(i));
> +		}
> +
> +		if (bus_status & TFE_BUS_IRQ_MASK_0_CONS_VIOL)
> +			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Bad config violation",
> +					    vfe->id);
> +
> +		if (bus_status & TFE_BUS_IRQ_MASK_0_VIOL)
> +			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Input data violation",
> +					    vfe->id);
> +
> +		if (bus_status & TFE_BUS_IRQ_MASK_0_IMG_VIOL)
> +			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Image size violation",
> +					    vfe->id);
> +	}
> +
> +	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
> +	if (status) {
> +		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
> +		for (i = 0; i < TFE_WM_NUM; i++) {
> +			if (status & BIT(i))
> +				dev_err_ratelimited(vfe->camss->dev,
> +						    "VFE%u: bus overflow for wm %u\n",
> +						    vfe->id, i);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int vfe_halt(struct vfe_device *vfe)
> +{
> +	/* rely on vfe_disable_output() to stop the VFE */
> +	return 0;
> +}
> +
> +static void vfe_enable_irq(struct vfe_device *vfe)
> +{
> +	writel(TFE_IRQ_MASK_0_RST_DONE | TFE_IRQ_MASK_0_BUS_WR,
> +	       vfe->base + TFE_IRQ_MASK_0);
> +	writel(TFE_BUS_IRQ_MASK_RUP_DONE_MASK | TFE_BUS_IRQ_MASK_BUF_DONE_MASK |
> +	       TFE_BUS_IRQ_MASK_0_CONS_VIOL | TFE_BUS_IRQ_MASK_0_VIOL |
> +	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
> +}
> +
> +static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
> +			  struct vfe_line *line)
> +{
> +	u8 wm = RDI_WM(rdi);
> +
> +	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
> +}
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
> +	u32 stride = pix->plane_fmt[0].bytesperline;
> +	u8 wm = RDI_WM(rdi);
> +
> +	/* Configuration for plain RDI frames */
> +	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
> +	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
> +	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
> +	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
> +	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
> +
> +	/* No dropped frames, one irq per frame */
> +	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
> +	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
> +	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
> +	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
> +
> +	vfe_enable_irq(vfe);
> +
> +	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> +	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
> +
> +	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
> +		vfe->id, rdi, pix->width, pix->height, stride);
> +}
> +
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
> +{
> +	u8 wm = RDI_WM(rdi);
> +
> +	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
> +
> +	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_520 = {
> +	.queue_buffer = vfe_queue_buffer_v2,
> +	.flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
> +{
> +	vfe->video_ops = vfe_video_ops_520;
> +}
> +
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	vfe->reg_update |= BIT(__line_to_iface(line_id));
> +	writel_relaxed(vfe->reg_update, vfe->base + TFE_REG_UPDATE_CMD);
> +}
> +
> +static void vfe_reg_update_clear(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	vfe->reg_update &= ~BIT(__line_to_iface(line_id));
> +}
> +
> +const struct vfe_hw_ops vfe_ops_340 = {
> +	.global_reset = vfe_global_reset,
> +	.hw_version = vfe_hw_version,
> +	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.subdev_init = vfe_subdev_init,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = vfe_halt,
> +	.vfe_wm_start = vfe_wm_start,
> +	.vfe_wm_stop = vfe_wm_stop,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update,
> +	.reg_update = vfe_reg_update,
> +	.reg_update_clear = vfe_reg_update_clear,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index a23f666be753..9b138849caca 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -242,6 +242,7 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
>   extern const struct vfe_hw_ops vfe_ops_4_7;
>   extern const struct vfe_hw_ops vfe_ops_4_8;
>   extern const struct vfe_hw_ops vfe_ops_170;
> +extern const struct vfe_hw_ops vfe_ops_340;
>   extern const struct vfe_hw_ops vfe_ops_480;
>   extern const struct vfe_hw_ops vfe_ops_680;
>   extern const struct vfe_hw_ops vfe_ops_780;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

