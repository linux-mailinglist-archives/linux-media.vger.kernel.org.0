Return-Path: <linux-media+bounces-27226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0585FA498C8
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D141A3B71F3
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486C226A1DD;
	Fri, 28 Feb 2025 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YZFvzejY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4E33E1;
	Fri, 28 Feb 2025 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740744593; cv=none; b=jT3bIP8gPCahvzPHV/DyRmfzZzpIfIRUofW3BnGxkO8tDfnCwHAUX82/q9ggo29hl44lRjsbSjJLCY8tQ9pCY8MQZ3+RbIkw5QvzlfNmW9XACBUX+grDH0FN85e/50nBAeRoRDFQe7+7iVhHMCqEOM8oMK9pAqeXgJ/AmpiPR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740744593; c=relaxed/simple;
	bh=t2PDUAB0xRme5ZRaPFI9u0vJmjh2T1vW+CrvrFpxXFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ORjUjFBqzU2RuJNqkKimJP/ODYq9t+wD0YTP461O8QkuzJc7z8kCfflwgvBrL3L/TtxGO8bXAlrIF45jybxht9dhUcuv0soSXi/eoCqCp5JT/3wxCpdwhKgU8iiKxGq9iDdSSqIzm+8B26mYjK+wpyKj3CfcHy2X7ly/WAXlVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YZFvzejY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXDl3001799;
	Fri, 28 Feb 2025 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RE/ZpVaQZ6gM9BjEVo8eLoE0ox8V3y1bF7wtyS5IeRY=; b=YZFvzejYD1QPPDwj
	laWt4w3v42Vak6Akuitz/jCgculi6viPx+GCx3DIuJsqHoytgtd/u1x47tAI3TEg
	OF3zKOl6aialWja/7fFnnIjI0SEDwYyY6tTqJSlV5eFr97liyCAwwc834BVqpada
	q3+odh0zPOj/GPj5WMWewZpXTbZsD4pzXDZZLtT/rjSH2k37WUIfG0c4rhoYfk3u
	nyLI0kOfWRQtRLVPeRjNNAjAwttX3pZJMMveqJgp2rOBV1hjxPL/LVARSwFJ5yA4
	Q657m1BRoOA3/AmkVDuRdFJG7xpgGH7gmclce+VAuxXYa8MLBxBvYPDSb5IGxkKg
	fSK13w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452ynwt4s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 12:09:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SC9ehM011177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 12:09:40 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 04:09:36 -0800
Message-ID: <81ddeed3-0fa3-076a-8f73-f41aa9f24b88@quicinc.com>
Date: Fri, 28 Feb 2025 17:39:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] media: platform: qcom/iris: add support for vpu33
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-3-128ef05d9665@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250225-topic-sm8x50-iris-v10-v1-3-128ef05d9665@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Knn2xyFLhz9VoGSrFKmTEj81yvnLp1Om
X-Proofpoint-GUID: Knn2xyFLhz9VoGSrFKmTEj81yvnLp1Om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_02,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280088

Hello Neil,

On 2/25/2025 2:35 PM, Neil Armstrong wrote:
> The IRIS acceleration found in the SM8650 platforms uses the vpu33
> hardware version, and requires a slighly different reset and power off
> sequences in order to properly get out of runtime suspend.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  drivers/media/platform/qcom/iris/iris_vpu33.c      | 315 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  3 files changed, 317 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 35390534534e93f4617c1036a05ca0921567ba1d..6b64c9988505afd9707c704449d60bb53209229f 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -21,6 +21,7 @@ qcom-iris-objs += \
>               iris_vdec.o \
>               iris_vpu2.o \
>               iris_vpu3.o \
> +             iris_vpu33.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu33.c b/drivers/media/platform/qcom/iris/iris_vpu33.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..128a050f206f99ec0d43b97ff995fa50d5684150
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu33.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +
> +#include "iris_instance.h"
> +#include "iris_vpu_common.h"
> +#include "iris_vpu_register_defines.h"
> +
> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> +#define AON_BASE_OFFS				0x000E0000
> +#define AON_MVP_NOC_RESET			0x0001F000
> +
> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> +#define REQ_POWER_DOWN_PREP			BIT(0)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> +#define CORE_CLK_RUN				0x0
> +
> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> +#define CTL_AXI_CLK_HALT			BIT(0)
> +#define CTL_CLK_HALT				BIT(1)
> +
> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> +#define RESET_HIGH				BIT(0)
> +
> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> +#define CORE_BRIDGE_SW_RESET			BIT(0)
> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> +#define MSK_CORE_POWER_ON			BIT(1)
> +
> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
> +#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
> +
> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> +
> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> +
> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> +
> +#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
> +#define SW_RESET				BIT(0)
> +#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
> +#define NOC_HALT				BIT(0)
> +#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
> +
> +#define VCODEC_DMA_SPARE_3 0x87B8
> +
> +static int reset_control_bulk_assert_id(int num_rstcs,
> +					struct reset_control_bulk_data *rstcs,
> +					char *id)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_rstcs; ++i) {
> +		if (!strcmp(rstcs[i].id, id))
> +			return reset_control_assert(rstcs[i].rstc);
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static int reset_control_bulk_deassert_id(int num_rstcs,
> +					  struct reset_control_bulk_data *rstcs,
> +					  char *id)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_rstcs; ++i) {
> +		if (!strcmp(rstcs[i].id, id))
> +			return reset_control_deassert(rstcs[i].rstc);
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static bool iris_vpu33_hw_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & BIT(1);
> +
> +	return pwr_status ? false : true;
> +}
> +
> +static void iris_vpu33_power_off_hardware(struct iris_core *core)
> +{
> +	u32 reg_val = 0, value, i;
> +	int ret;
> +	int count = 0;
> +
> +	if (iris_vpu33_hw_power_collapsed(core))
> +		goto disable_power;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +	if (value)
> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	value = readl(core->reg_base + VCODEC_DMA_SPARE_3);
> +	value |= BIT(0);
> +	writel(value, core->reg_base + VCODEC_DMA_SPARE_3);
DMA_SPARE_3 register programming here can be skipped. This register is about
halting the DMA trasaction during power off, but did not yield desired result
during our internal trials.
> +
> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
> +					 reg_val, reg_val & 0x400000, 2000, 20000);
> +		if (ret)
> +			goto disable_power;
> +	}
> +
> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> +	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	value |= BIT(0);
> +	writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +	while ((!(value & BIT(0))) && (value & BIT(1) || value & BIT(2))) {
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		value &= ~BIT(0);
> +		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		usleep_range(10, 20);
> +
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		value |= BIT(0);
> +		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		usleep_range(10, 20);
> +
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		++count;
> +		if (count >= 1000)
> +			break;
> +	}
> +
> +	if (count < 1000) {
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		value &= ~BIT(0);
> +		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	}
Again, above programming of LPI registers can be limited to below

readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, reg_val,
reg_val & 0x1, 200, 2000);

writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
	
> +
> +	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> +				 reg_val, reg_val & 0x3, 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> +				 reg_val, !(reg_val & 0x3), 200, 2000);
> +	if (ret)
> +		goto disable_power;
Above NOC_RESET handling does not look applicable to SM8650, could you recheck ?

Regards,
Vikash
> +
> +	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
> +disable_power:
> +	iris_vpu_power_off_hw(core);
> +}
> +
> +static int iris_vpu33_power_off_controller(struct iris_core *core)
> +{
> +	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +	u32 val = 0;
> +	int ret;
> +
> +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
> +				 val, val == 0, 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> +
> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "bus");
> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "core");
> +	usleep_range(1000, 1100);
> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "bus");
> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "core");
> +
> +	/* Disable MVP NoC clock */
> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
> +	val |= NOC_HALT;
> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
> +
> +	/* enable MVP NoC reset */
> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
> +	val |= SW_RESET;
> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
> +
> +	/* poll AON spare register bit0 to become zero with 50ms timeout */
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_SPARE,
> +				 val, (val & BIT(0)) == 0, 1000, 50000);
> +	if (ret)
> +		goto disable_power;
> +
> +	/* enable bit(1) to avoid cvp noc xo reset */
> +	val = readl(core->reg_base + AON_WRAPPER_SPARE);
> +	val |= BIT(1);
> +	writel(val, core->reg_base + AON_WRAPPER_SPARE);
> +
> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "xo");
> +
> +	/* De-assert MVP NoC reset */
> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
> +	val &= ~SW_RESET;
> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
> +
> +	usleep_range(80, 100);
> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "xo");
> +
> +	/* reset AON spare register */
> +	writel(0, core->reg_base + AON_WRAPPER_SPARE);
> +
> +	/* Enable MVP NoC clock */
> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
> +	val &= ~NOC_HALT;
> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
> +
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +
> +disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +
> +	return 0;
> +}
> +
> +static u64 iris_vpu33_calculate_frequency(struct iris_inst *inst, size_t data_size)
> +{
> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	struct v4l2_format *inp_f = inst->fmt_src;
> +	u32 height, width, mbs_per_second, mbpf;
> +	u64 fw_cycles, fw_vpp_cycles;
> +	u64 vsp_cycles, vpp_cycles;
> +	u32 fps = DEFAULT_FPS;
> +
> +	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
> +	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> +
> +	mbpf = NUM_MBS_PER_FRAME(height, width);
> +	mbs_per_second = mbpf * fps;
> +
> +	fw_cycles = fps * caps->mb_cycles_fw;
> +	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
> +
> +	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
> +	/* 21 / 20 is minimum overhead factor */
> +	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
> +
> +	/* 1.059 is multi-pipe overhead */
> +	if (inst->fw_caps[PIPE].value > 1)
> +		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
> +
> +	vsp_cycles = fps * data_size * 8;
> +	vsp_cycles = div_u64(vsp_cycles, 2);
> +	/* VSP FW overhead 1.05 */
> +	vsp_cycles = div_u64(vsp_cycles * 21, 20);
> +
> +	if (inst->fw_caps[STAGE].value == STAGE_1)
> +		vsp_cycles = vsp_cycles * 3;
> +
> +	return max3(vpp_cycles, vsp_cycles, fw_cycles);
> +}
> +
> +static int iris_vpu33_reset_controller(struct iris_core *core)
> +{
> +	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +
> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "bus");
> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "core");
> +
> +	usleep_range(1000, 1100);
> +
> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "bus");
> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "core");
> +
> +	return 0;
> +}
> +
> +const struct vpu_ops iris_vpu33_ops = {
> +	.reset_controller = iris_vpu33_reset_controller,
> +	.power_off_hw = iris_vpu33_power_off_hardware,
> +	.power_off_controller = iris_vpu33_power_off_controller,
> +	.calc_freq = iris_vpu33_calculate_frequency,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index c948d8b5aee87ccf1fd53c5518a27294232d8fb8..c4d02a3b884881eb033dc0342f948848adae2819 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -10,6 +10,7 @@ struct iris_core;
>  
>  extern const struct vpu_ops iris_vpu2_ops;
>  extern const struct vpu_ops iris_vpu3_ops;
> +extern const struct vpu_ops iris_vpu33_ops;
>  
>  struct vpu_ops {
>  	int (*reset_controller)(struct iris_core *core);
>

