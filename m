Return-Path: <linux-media+bounces-30481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E32A921A4
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 17:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C40F3B42A4
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 15:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A84253B6C;
	Thu, 17 Apr 2025 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QniYFnzs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18225335B;
	Thu, 17 Apr 2025 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903862; cv=none; b=tR96tufq3bYmSnm/4V/tEQ+Sq0Ct5MkoQiZVvB8UINLudZ1SRdJHBwSFY6U/ZubuLUs5XR7lFffDS0/N6JJyDUq2t7bGmC2WDLwJhHIvnxwh3Ea7kb/Q5Rq5Id1woW6jTl6kFgIgms4Ru+FWsWLPakMG2d8UPwwMu2eWgUfPkZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903862; c=relaxed/simple;
	bh=Kmys8SSH5kmbquel9jpMM2l574LuDV5zjTeaZyyURL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BeLUZtCpeqGavJ95qKPZGM6VFbGOFbqTtzqQxeA0sSIsJv8AL4qVxd5msiImd6kfOVO4xi6x5tVZFiFcVC0CNqaoeRZp6bltgnxDZe2N5IAVYJJgZsNThUbqgNrtK2RSIkL/M3BzZUSYrRwypFAKILYWm+7lhAziDOvd2rKdb1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QniYFnzs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClSVV015956;
	Thu, 17 Apr 2025 15:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoAUXkcWfUCFyDJ1tTdVeqoOUSh2RKKgBU7cTtK4Os0=; b=QniYFnzsIwte1Ovu
	x681dDJBjwuhjfuOO8U7TSr1XBLvnqpFxPAhaJ8QFCcQEHjTy5CpkmgkebSy7E0v
	GFf4Ob/OwlxsNKgeJH8BhU2mOO2+WLD8AJnzYw49iZpEhaYqt9RRiaMjnXJssi+x
	G9jwLlADrForCOpEQOVXZEQ41VRbYUr03DqoWF4OQJx9JN+FZSlVEABELrdClQj5
	QBiu/He7FsCAi4mpi7B1dajupOxM25/W0ncIQXtal509kJ1HXz1Z+3sFC3SQeSVf
	5/PTQ+2Sg2cYN+WbQiYL1CvJiJ+g1GzvOnHlUbTVuLMPxYygEj9U7xuA7rpoDr5h
	MmM5hg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqfmxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:30:52 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HFUphh000372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:30:51 GMT
Received: from [10.216.1.40] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 08:30:46 -0700
Message-ID: <300a2861-8602-e7fd-dc12-2e94cc65e0c3@quicinc.com>
Date: Thu, 17 Apr 2025 21:00:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 5/7] media: platform: qcom/iris: add support for vpu33
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
 <20250417-topic-sm8x50-iris-v10-v7-5-f020cb1d0e98@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250417-topic-sm8x50-iris-v10-v7-5-f020cb1d0e98@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u7reqMd5zQDQ4XhOgAj1W1VGVaxR0O0o
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=68011eac cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=locApedIml024nHU32MA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: u7reqMd5zQDQ4XhOgAj1W1VGVaxR0O0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170115



On 4/17/2025 8:29 PM, Neil Armstrong wrote:
> The IRIS acceleration found in the SM8650 platforms uses the vpu33
> hardware version, and requires a slighly different reset and power off
> sequences in order to properly get out of runtime suspend.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 160 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  2 files changed, 157 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 13dab61427b8bd0491b69a9bc5f5144d27d17362..9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -4,20 +4,39 @@
>   */
>  
>  #include <linux/iopoll.h>
> +#include <linux/reset.h>
>  
>  #include "iris_instance.h"
>  #include "iris_vpu_common.h"
>  #include "iris_vpu_register_defines.h"
>  
> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> +#define AON_BASE_OFFS				0x000E0000
>  #define AON_MVP_NOC_RESET			0x0001F000
>  
> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> +#define REQ_POWER_DOWN_PREP			BIT(0)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>  #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>  #define CORE_CLK_RUN				0x0
>  
> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> +#define CTL_AXI_CLK_HALT			BIT(0)
> +#define CTL_CLK_HALT				BIT(1)
> +
> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> +#define RESET_HIGH				BIT(0)
> +
>  #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>  #define CORE_BRIDGE_SW_RESET			BIT(0)
>  #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
>  
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> +#define MSK_CORE_POWER_ON			BIT(1)
> +
>  #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>  #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>  
> @@ -25,7 +44,16 @@
>  
>  #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>  
> -static bool iris_vpu3_hw_power_collapsed(struct iris_core *core)
> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> +
> +#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
> +#define SW_RESET				BIT(0)
> +#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
> +#define NOC_HALT				BIT(0)
> +#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
> +
> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>  {
>  	u32 value, pwr_status;
>  
> @@ -40,7 +68,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	u32 reg_val = 0, value, i;
>  	int ret;
>  
> -	if (iris_vpu3_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core))
>  		goto disable_power;
>  
>  	dev_err(core->dev, "video hw is power on\n");
> @@ -79,7 +107,125 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	iris_vpu_power_off_hw(core);
>  }
>  
> -static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
> +static void iris_vpu33_power_off_hardware(struct iris_core *core)
> +{
> +	u32 reg_val = 0, value, i;
> +	int ret;
> +
> +	if (iris_vpu3x_hw_power_collapsed(core))
> +		goto disable_power;
> +
> +	dev_err(core->dev, "video hw is power on\n");
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +	if (value)
> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
> +					 reg_val, reg_val & 0x400000, 2000, 20000);
> +		if (ret)
> +			goto disable_power;
> +	}
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +				 reg_val, reg_val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> +	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
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
> +	u32 xo_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
> +	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
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
> +	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
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
> +	reset_control_bulk_assert(xo_rst_tbl_size, core->controller_resets);
> +
> +	/* De-assert MVP NoC reset */
> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
> +	val &= ~SW_RESET;
> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
> +
> +	usleep_range(80, 100);
> +
> +	reset_control_bulk_deassert(xo_rst_tbl_size, core->controller_resets);
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
> +static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
>  {
>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>  	struct v4l2_format *inp_f = inst->fmt_src;
> @@ -119,5 +265,11 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
>  const struct vpu_ops iris_vpu3_ops = {
>  	.power_off_hw = iris_vpu3_power_off_hardware,
>  	.power_off_controller = iris_vpu_power_off_controller,
> -	.calc_freq = iris_vpu3_calculate_frequency,
> +	.calc_freq = iris_vpu3x_calculate_frequency,
> +};
> +
> +const struct vpu_ops iris_vpu33_ops = {
> +	.power_off_hw = iris_vpu33_power_off_hardware,
> +	.power_off_controller = iris_vpu33_power_off_controller,
> +	.calc_freq = iris_vpu3x_calculate_frequency,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index f8965661c602f990d5a7057565f79df4112d097e..93b7fa27be3bfa1cf6a3e83cc192cdb89d63575f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -10,6 +10,7 @@ struct iris_core;
>  
>  extern const struct vpu_ops iris_vpu2_ops;
>  extern const struct vpu_ops iris_vpu3_ops;
> +extern const struct vpu_ops iris_vpu33_ops;
>  
>  struct vpu_ops {
>  	void (*power_off_hw)(struct iris_core *core);
> 
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

