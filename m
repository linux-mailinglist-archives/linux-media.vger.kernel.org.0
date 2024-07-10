Return-Path: <linux-media+bounces-14841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128D192D0AC
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA421C21539
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D3F19047E;
	Wed, 10 Jul 2024 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f3QQZFCn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7988C190461
	for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720610934; cv=none; b=IlemwCLJ2c/zc6e18Y3RRDv+Y7U8xvo93aWFqhM61aFyKZotoni7Psz3k+G6O6NfOKhBAVBMV/GqDuVc8M3HXFG9WWeDHdRWiQ2hvJHsBRPyKV7nh94+GxtU8CXajRG2CsqMNCj+Jev+2picwF5zRZTq10MxVpq9YMPF4bhzUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720610934; c=relaxed/simple;
	bh=jC8sFFxh2HZP4GpwkHA70JHUlZk7lwqmcxdFCLYspSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujYzXJRabNtodAROWENe1FzUi+ien2/cCWqB0B3pp1G2tTQ9oQ+Dos0GXu5yS1mbmEw3JPL49HaY8U19WTiKtFlQTaUHAAP9KetfcEF6OSuEHMyQ/3j5+150zMS632iAne4eKOMAU8UCB09PNXGy8lB0uq5L61HRvEdCaa6Jyeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f3QQZFCn; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e98087e32so6945388e87.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720610930; x=1721215730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8X7ZnHVe8aqgJa5xXFsKUduHjXaBCjoQplSoNcumXZ8=;
        b=f3QQZFCnAksuUsVluWKGGU5/1fRg+VuOZAhFNnBldGduGLvKRbDytzzhGjb1JxL8ws
         OouYL0rZ2YH8jMN743f7LSiCt0WGtkB+BW5mBwmcJuxBHvraCs7m10NOOJcUGb6BY/LB
         JbQzrufAD2AQHG009hV2RtRxlf0EQnnwMXwJAe0P/AWSwiHx1cGDgQGTQkGhmkYlWFIS
         Dh9uNIU21SIrnHLdSwrSysPC8tHzjtcN3CXvPManmPiWC0fD6qkb/YvZWjmLJcuTMYov
         ndYhkL3vsF2Jo9kY66MNfzfsSU+oNT5ImmGFF7DItjWtihxmyfa7XaYAqFD8SntLqrNk
         7LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720610930; x=1721215730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X7ZnHVe8aqgJa5xXFsKUduHjXaBCjoQplSoNcumXZ8=;
        b=Ygm94kZptfpNA/Omr+fqgPIu+ejGGQKdHhDo1FjtywX+35Yb+dmkPHpg1GjdqOUg+8
         hczF6iZ1Y2IFbt1q/NwAqGkEeQF+VTAJ+klY2M7/0Xhmyoy4oMqPYH5jRbbfmiwAtsdL
         1aNF3j+Fxodl+YX5kBMHidJV5nm/sHBg9PyWgj6MaPONEiDMyCjhNbo30pI5Q4FUaVIo
         JV/RIKHVETOMj89OqoP/mhNLjdndoeVshfKMkIrMV6eklkn+fW6wKwwNTuL81sjpp9Ta
         jOwq25Kd3rl8koBuFwvRCoVwHaUNfJvwAxDj0teu5toCpTUFGs0tM0PpT2G3xAMMKg/k
         ER1g==
X-Forwarded-Encrypted: i=1; AJvYcCVoVHuE54fZOEuNvekB9X2VZc3+sjgMnJ4yAwcb+zVa7T8cmthe/8C6/nNn81Aksq0tD4SquRbTVstOJkWdopypfHUZgp80WU29/AM=
X-Gm-Message-State: AOJu0Yz2RZFou/c1U1uXx24QgsCzpwwCYQ8M6goA6vmJvMPhfIgb9AJ9
	5qMw4cwy6CT/F93gSb4OrLkFMGlkaa2cAudAP+lo2ilvvAqOnWBJNo7ITwAKNpk=
X-Google-Smtp-Source: AGHT+IHSxjJwTJfe3HezVlJgcMYSgiups3hGQZuDRqvidbhhkCQ1OpPMsAlt397udvYySuCMSPSb5A==
X-Received: by 2002:a05:6512:39c7:b0:52c:d8c7:49ce with SMTP id 2adb3069b0e04-52eb9991682mr3960976e87.22.1720610929618;
        Wed, 10 Jul 2024 04:28:49 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e0b6bsm77946875e9.3.2024.07.10.04.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 04:28:49 -0700 (PDT)
Message-ID: <e118f980-e10f-450c-8270-76602cc50b27@linaro.org>
Date: Wed, 10 Jul 2024 12:28:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240709160656.31146-10-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2024 17:06, Depeng Shao wrote:
> The CSID in SM8550 is gen3, it has new register offset and new
> functionality. The buf done irq,register update and reset are
> moved to CSID gen3. And CSID gen3 has a new register block which
> is named as CSID top, it controls the output of CSID, since the
> CSID can connect to Sensor Front End (SFE) or original VFE, the
> register in top block is used to control the HW connection.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../platform/qcom/camss/camss-csid-gen3.c     | 445 ++++++++++++++++++
>   .../platform/qcom/camss/camss-csid-gen3.h     |  26 +
>   .../media/platform/qcom/camss/camss-csid.h    |   2 +
>   4 files changed, 474 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.h
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index e636968a1126..c336e4c1a399 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -7,6 +7,7 @@ qcom-camss-objs += \
>   		camss-csid-4-1.o \
>   		camss-csid-4-7.o \
>   		camss-csid-gen2.o \
> +		camss-csid-gen3.o \
>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
>   		camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> new file mode 100644
> index 000000000000..17fd7c5499de
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -0,0 +1,445 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csid-gen3.c
> + *
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
> +#include "camss-csid-gen3.h"
> +
> +
> +#define CSID_TOP_IO_PATH_CFG0(csid)	(0x4 * (csid))
> +#define		OUTPUT_IFE_EN 0x100
> +#define		INTERNAL_CSID 1
> +
> +#define CSID_HW_VERSION		0x0
> +#define		HW_VERSION_STEPPING	0
> +#define		HW_VERSION_REVISION	16
> +#define		HW_VERSION_GENERATION	28
> +
> +#define CSID_RST_CFG	0xC
> +#define		RST_MODE		0
> +#define		RST_LOCATION	4
> +
> +#define CSID_RST_CMD	0x10
> +#define		SELECT_HW_RST	0
> +#define		SELECT_SW_RST	1
> +#define		SELECT_IRQ_RST	2
> +
> +#define CSID_CSI2_RX_IRQ_STATUS	0x9C
> +#define	CSID_CSI2_RX_IRQ_MASK	0xA0
> +#define CSID_CSI2_RX_IRQ_CLEAR	0xA4
> +#define CSID_CSI2_RX_IRQ_SET	0xA8
> +
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		(0xEC + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		(0xF0 + 0x10 * (rdi))
> +#define   CSID_CSI2_RDIN_INFO_FIFO_FULL 2
> +#define   CSID_CSI2_RDIN_INFO_CAMIF_EOF 3
> +#define   CSID_CSI2_RDIN_INFO_CAMIF_SOF 4
> +#define   CSID_CSI2_RDIN_INFO_INPUT_EOF 9
> +#define   CSID_CSI2_RDIN_INFO_INPUT_SOF 12
> +#define   CSID_CSI2_RDIN_ERROR_REC_FRAME_DROP 18
> +#define   CSID_CSI2_RDIN_ERROR_REC_OVERFLOW_IRQ 19
> +#define   CSID_CSI2_RDIN_ERROR_REC_CCIF_VIOLATION 20
> +#define   CSID_CSI2_RDIN_EPOCH0 21
> +#define   CSID_CSI2_RDIN_EPOCH1 22
> +#define   CSID_CSI2_RDIN_RUP_DONE 23
> +#define   CSID_CSI2_RDIN_CCIF_VIOLATION 29
> +
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)		(0xF4 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_SET(rdi)			(0xF8 + 0x10 * (rdi))
> +
> +#define CSID_TOP_IRQ_STATUS	0x7C
> +#define		TOP_IRQ_STATUS_RESET_DONE 0
> +#define CSID_TOP_IRQ_MASK	0x80
> +#define CSID_TOP_IRQ_CLEAR	0x84
> +#define CSID_TOP_IRQ_SET	0x88
> +#define CSID_IRQ_CMD		0x14
> +#define		IRQ_CMD_CLEAR	0
> +#define		IRQ_CMD_SET	4
> +
> +#define CSID_BUF_DONE_IRQ_STATUS	0x8C
> +#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET (csid_is_lite(csid) ? 0x1 : 0xE)
> +#define CSID_BUF_DONE_IRQ_MASK	0x90
> +#define CSID_BUF_DONE_IRQ_CLEAR	0x94
> +#define CSID_BUF_DONE_IRQ_SET	0x98
> +
> +#define CSID_CSI2_RX_CFG0	0x200
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
> +#define		CSI2_RX_CFG0_DL1_INPUT_SEL	8
> +#define		CSI2_RX_CFG0_DL2_INPUT_SEL	12
> +#define		CSI2_RX_CFG0_DL3_INPUT_SEL	16
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
> +#define			CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
> +#define		CSI2_RX_CFG0_PHY_TYPE_SEL	24
> +#define		CSI2_RX_CFG0_TPG_MUX_EN		27
> +#define		CSI2_RX_CFG0_TPG_NUM_SEL	28
> +
> +#define CSID_CSI2_RX_CFG1	0x204
> +#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		0
> +#define		CSI2_RX_CFG1_DE_SCRAMBLE_EN			1
> +#define		CSI2_RX_CFG1_VC_MODE				2
> +#define		CSI2_RX_CFG1_COMPLETE_STREAM_EN			4
> +#define		CSI2_RX_CFG1_COMPLETE_STREAM_FRAME_TIMING	5
> +#define		CSI2_RX_CFG1_MISR_EN				6
> +#define		CSI2_RX_CFG1_PHY_BIST_EN			7
> +#define		CSI2_RX_CFG1_EPD_MODE				8
> +#define		CSI2_RX_CFG1_EOTP_EN				9
> +#define		CSI2_RX_CFG1_DYN_SWITCH_EN			10
> +#define		CSI2_RX_CFG1_RUP_AUP_LATCH_DIS		11
> +
> +#define CSID_CSI2_RX_CAPTURE_CTRL	0x208
> +#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_CAPTURE_EN	0
> +#define		CSI2_RX_CAPTURE_CTRL_SHORT_PKT_CAPTURE_EN	1
> +#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_CAPTURE_EN	3
> +#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_CAPTURE_DT		4
> +#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_CAPTURE_VC		10
> +#define		CSI2_RX_CAPTURE_CTRL_SHORT_PKT_CAPTURE_VC	15
> +#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_CAPTURE_DT		20
> +#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_CAPTURE_VC		26
> +
> +#define CSID_RDI_CFG0(rdi)			(0x500 + 0x100 * (rdi))
> +#define		RDI_CFG0_VFR_EN				0
> +#define		RDI_CFG0_FRAME_ID_DEC_EN	1
> +#define		RDI_CFG0_RETIME_DIS			5
> +#define		RDI_CFG0_TIMESTAMP_EN		6
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL	8
> +#define		RDI_CFG0_DECODE_FORMAT		12
> +#define		RDI_CFG0_DT					16
> +#define		RDI_CFG0_VC					22
> +#define		RDI_CFG0_DT_ID				27
> +#define		RDI_CFG0_EN					31
> +
> +#define CSID_RDI_CFG1(rdi)			(0x510 + 0x100 * (rdi))
> +#define		RDI_CFG1_BYTE_CNTR_EN	2
> +#define		RDI_CFG1_DROP_H_EN	5
> +#define		RDI_CFG1_DROP_V_EN	6
> +#define		RDI_CFG1_CROP_H_EN	7
> +#define		RDI_CFG1_CROP_V_EN	8
> +#define		RDI_CFG1_MISR_EN	9
> +#define		RDI_CFG1_PIX_STORE  10
> +#define		RDI_CFG1_PLAIN_ALIGNMENT	11
> +#define		RDI_CFG1_PLAIN_FORMAT	12
> +#define		RDI_CFG1_EARLY_EOF_EN	14
> +#define		RDI_CFG1_PACKING_FORMAT	15
> +
> +#define CSID_RDI_CTRL(rdi)			(0x504 + 0x100 * (rdi))
> +#define		RDI_CTRL_START_CMD		0
> +#define		RDI_CTRL_START_MODE		2
> +
> +#define CSID_RDI_EPOCH_IRQ_CFG(rdi) (0x52C + 0x100 * (rdi))
> +
> +#define CSID_RDI_FRM_DROP_PATTERN(rdi)			(0x540 + 0x100 * (rdi))
> +#define CSID_RDI_FRM_DROP_PERIOD(rdi)			(0x544 + 0x100 * (rdi))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)		(0x548 + 0x100 * (rdi))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)		(0x54C + 0x100 * (rdi))
> +#define CSID_RDI_RPP_PIX_DROP_PATTERN(rdi)		(0x558 + 0x100 * (rdi))
> +#define CSID_RDI_RPP_PIX_DROP_PERIOD(rdi)		(0x55C + 0x100 * (rdi))
> +#define CSID_RDI_RPP_LINE_DROP_PATTERN(rdi)		(0x560 + 0x100 * (rdi))
> +#define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		(0x564 + 0x100 * (rdi))
> +
> +#define CSID_RDI_RPP_HCROP(rdi)                 (0x550 + 0x100 * (rdi))
> +#define CSID_RDI_RPP_VCROP(rdi)                 (0x554 + 0x100 * (rdi))
> +
> +#define CSID_RDI_ERROR_RECOVERY_CFG0(rdi)       (0x514 + 0x100 * (rdi))
> +
> +#define CSID_REG_UPDATE_CMD		0x18
> +static inline int reg_update_rdi(struct csid_device *csid, int n)
> +{
> +	return BIT(n + 4) + BIT(20 + n);
> +}
> +
> +#define	    REG_UPDATE_RDI		reg_update_rdi
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy, int vc)
> +{
> +	int val;
> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
> +
> +	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> +	if (vc > 3)
> +		val |= 1 << CSI2_RX_CFG1_VC_MODE;

I realise downstream does these shifts but, I think in upstream we 
should just define a BIT(x)

#define CSI2_RX_CFG1_VC_MODE BIT(2)

val |= CSI2_RX_CFG1_VC_MODE;

> +	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> +{
> +	int val;
> +
> +	if (enable)
> +		val = 1 << RDI_CTRL_START_CMD;
> +	else
> +		val = 0 << RDI_CTRL_START_CMD;

Here is an example of how the bit shifting is weird

(0 << anything) is still zero

> +	writel_relaxed(val, csid->base + CSID_RDI_CTRL(rdi));
> +}
> +
> +static void __csid_configure_top(struct csid_device *csid)
> +{
> +	u32 val;
> +
> +	/* CSID "top" is a new function in Titan780.
> +	 * CSID can connect to VFE & SFE(Sensor Front End).
> +	 * This connection is ontrolled by CSID "top".
> +	 * Only enable VFE path in current driver.
> +	 */
> +	if (csid->top_base) {

When is csid->top_base NULL ?

Its required in your yaml.

> +		val = OUTPUT_IFE_EN | INTERNAL_CSID;
> +		writel_relaxed(val, csid->top_base + CSID_TOP_IO_PATH_CFG0(csid->id));
> +	}
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
> +	val = 1 << RDI_CFG0_TIMESTAMP_EN;
> +	val |= 2 << RDI_CFG0_TIMESTAMP_STB_SEL;
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= vc << RDI_CFG0_VC;
> +	val |= format->data_type << RDI_CFG0_DT;
> +	val |= dt_id << RDI_CFG0_DT_ID;
> +
> +	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +
> +	val = 1 << RDI_CFG1_PACKING_FORMAT;
> +	val |= 1 << RDI_CFG1_PIX_STORE;
> +	val |= 1 << RDI_CFG1_DROP_H_EN;
> +	val |= 1 << RDI_CFG1_DROP_V_EN;
> +	val |= 1 << RDI_CFG1_CROP_H_EN;
> +	val |= 1 << RDI_CFG1_CROP_V_EN;
> +	val |= RDI_CFG1_EARLY_EOF_EN;
> +
> +	writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
> +
> +	val = 0;
> +	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +
> +	val = 1;
> +	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +
> +	val = 0;
> +	writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
> +
> +	val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
> +	val |=  enable << RDI_CFG0_EN;
> +	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i;
> +
> +	/* Loop through all enabled VCs and configure stream for each */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			/* Configure CSID "top" */
> +			__csid_configure_top(csid);
> +			__csid_configure_rdi_stream(csid, enable, i);
> +			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +}

I really like this breakdown
> +
> +static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
> +{
> +	if (val > 0 && val <= csid->testgen.nmodes)
> +		csid->testgen.mode = val;

Surely you should just set the val parameter directly ?

Also why is this a signed integer and how does it get assigned a 
negative value which we need to mitigate against here ?

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
> +	dev_info(csid->camss->dev, "CSID HW Version = %u.%u.%u\n",
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
> +	u32 val, buf_done_val;
> +	u8 reset_done;
> +	int i;
> +
> +	val = readl_relaxed(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel_relaxed(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	reset_done = val & BIT(TOP_IRQ_STATUS_RESET_DONE);
> +
> +	val = readl_relaxed(csid->base + CSID_CSI2_RX_IRQ_STATUS);
> +	writel_relaxed(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
> +
> +	buf_done_val = readl_relaxed(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel_relaxed(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	/* Read and clear IRQ status for each enabled RDI channel */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +		}
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
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +						csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +			writel_relaxed(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> +			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +						csid->base + CSID_BUF_DONE_IRQ_MASK);
> +		}
> +
> +	/* preserve registers */
> +	val = (0x1 << RST_LOCATION) | (0x1 << RST_MODE);
> +	writel_relaxed(val, csid->base + CSID_RST_CFG);
> +
> +	val = (0x1 << SELECT_HW_RST) | (0x1 << SELECT_IRQ_RST);
> +	writel_relaxed(val, csid->base + CSID_RST_CMD);
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

Same code as in gen2.

You could move the gen2 version of this into camss-csid.c and just reuse 
in both.

---
bod

