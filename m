Return-Path: <linux-media+bounces-29732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D561A822BD
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95E4F4C3F0E
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF4F25DAF4;
	Wed,  9 Apr 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ewq/fSU6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427BE25D8EC;
	Wed,  9 Apr 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195810; cv=none; b=Hw5hCIkXwk8vDQYeeyJWDQ+mgtDX3fF+rItxEfPzW4KZvmKF0xIoXePYxjDO/7Tm76a4ngDX1Envwg3o4kK0bHe8LUhqxWk0zFZDBtMPdHpOaFEuCzmgTwZG5AvpnJKKamb9uYE4W5YhZHf+l5Qz7iwLjhO6Mwu7EJixvF5g+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195810; c=relaxed/simple;
	bh=/rNLSrEQSOpvZ7nwsDMuYt/FkXNNEdQSkznhwYn37SM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DfTtuu/s0SYyET5NCNMojacfqpU/FBPUwSwAV7UqnSPIoOuAE16lpAydTx/QcdWbH40DLVmgQXKQOurZLZRpngSX7y003DDTEEHRZkKFK2bTV/UrQHM74tKkpxz6eZXtFc9q6iAQGCw2C+K5PgqtnzrKFHUrcqbwB7Bd65ki7Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ewq/fSU6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398a5HG015866;
	Wed, 9 Apr 2025 10:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvRoGFR35f/h0ADIFFSeWQTQxxC1ta+JOprFdLBdxzk=; b=ewq/fSU6KxPW2mzc
	7obQnygvwuSWqjl8RKUkiIYjn76vhVremuc+/8tkTYW71CykNNyecgrepd0Xcxle
	wwc/GC5+1Xi6xMNaHeOvjmPHgUpYo/N9qO7jhlAstk778Blu5ldYNgUyb97wkhOQ
	hVjyK72Gmkh1vm/wdVX6EiHff6jIsu7ZI2/zJ9ItZ0xI59+7FK9ousmPqJQQMJ+u
	tkwUIZzXWjVwTKmGTRzF3bnSNXHW0Hh/vigWZeLpZuGsSoMyivPaDNTEnokFlfd/
	fLia35tlDwxq4zzI4CLvSMses/T4FSUTW+3x4AxmKXEKCQ8nwrafIFabUbKe3e4+
	1FZa2w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2u1g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 10:49:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539Anw5C008784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 10:49:58 GMT
Received: from [10.50.45.73] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 03:49:54 -0700
Message-ID: <808f48f4-ad4d-1afe-bf15-a8e57288f9d3@quicinc.com>
Date: Wed, 9 Apr 2025 16:19:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/5] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
 <20250407-topic-sm8x50-iris-v10-v3-4-63569f6d04aa@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-4-63569f6d04aa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CusLhOIKW2XGLqse1G2R7PYYIBSw-oNT
X-Proofpoint-GUID: CusLhOIKW2XGLqse1G2R7PYYIBSw-oNT
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f650d7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=rVHiDwQOYXtOlGk_woMA:9
 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_04,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090061



On 4/7/2025 8:54 PM, Neil Armstrong wrote:
> The vpu33 HW is very close to vpu3, and shares most of the
> operations, so rename file to vpu3x since we'll handle all vpu3
> variants in it.
> 
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   2 +-
>  drivers/media/platform/qcom/iris/iris_vpu3.c       | 123 ---------
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 277 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>  4 files changed, 281 insertions(+), 124 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -20,7 +20,7 @@ qcom-iris-objs += \
>               iris_vb2.o \
>               iris_vdec.o \
>               iris_vpu2.o \
> -             iris_vpu3.o \
> +             iris_vpu3x.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
> deleted file mode 100644
> index 13dab61427b8bd0491b69a9bc5f5144d27d17362..0000000000000000000000000000000000000000
> --- a/drivers/media/platform/qcom/iris/iris_vpu3.c
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> - */
> -
> -#include <linux/iopoll.h>
> -
> -#include "iris_instance.h"
> -#include "iris_vpu_common.h"
> -#include "iris_vpu_register_defines.h"
> -
> -#define AON_MVP_NOC_RESET			0x0001F000
> -
> -#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> -#define CORE_CLK_RUN				0x0
> -
> -#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> -#define CORE_BRIDGE_SW_RESET			BIT(0)
> -#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> -
> -#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
> -#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
> -
> -#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> -
> -#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> -
> -static bool iris_vpu3_hw_power_collapsed(struct iris_core *core)
> -{
> -	u32 value, pwr_status;
> -
> -	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> -	pwr_status = value & BIT(1);
> -
> -	return pwr_status ? false : true;
> -}
> -
> -static void iris_vpu3_power_off_hardware(struct iris_core *core)
> -{
> -	u32 reg_val = 0, value, i;
> -	int ret;
> -
> -	if (iris_vpu3_hw_power_collapsed(core))
> -		goto disable_power;
> -
> -	dev_err(core->dev, "video hw is power on\n");
> -
> -	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> -	if (value)
> -		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> -
> -	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
> -		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
> -					 reg_val, reg_val & 0x400000, 2000, 20000);
> -		if (ret)
> -			goto disable_power;
> -	}
> -
> -	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
> -
> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> -				 reg_val, reg_val & 0x3, 200, 2000);
> -	if (ret)
> -		goto disable_power;
> -
> -	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
> -
> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> -				 reg_val, !(reg_val & 0x3), 200, 2000);
> -	if (ret)
> -		goto disable_power;
> -
> -	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
> -	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> -	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> -	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> -
> -disable_power:
> -	iris_vpu_power_off_hw(core);
> -}
> -
> -static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
> -{
> -	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> -	struct v4l2_format *inp_f = inst->fmt_src;
> -	u32 height, width, mbs_per_second, mbpf;
> -	u64 fw_cycles, fw_vpp_cycles;
> -	u64 vsp_cycles, vpp_cycles;
> -	u32 fps = DEFAULT_FPS;
> -
> -	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
> -	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> -
> -	mbpf = NUM_MBS_PER_FRAME(height, width);
> -	mbs_per_second = mbpf * fps;
> -
> -	fw_cycles = fps * caps->mb_cycles_fw;
> -	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
> -
> -	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
> -	/* 21 / 20 is minimum overhead factor */
> -	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
> -
> -	/* 1.059 is multi-pipe overhead */
> -	if (inst->fw_caps[PIPE].value > 1)
> -		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
> -
> -	vsp_cycles = fps * data_size * 8;
> -	vsp_cycles = div_u64(vsp_cycles, 2);
> -	/* VSP FW overhead 1.05 */
> -	vsp_cycles = div_u64(vsp_cycles * 21, 20);
> -
> -	if (inst->fw_caps[STAGE].value == STAGE_1)
> -		vsp_cycles = vsp_cycles * 3;
> -
> -	return max3(vpp_cycles, vsp_cycles, fw_cycles);
> -}
> -
> -const struct vpu_ops iris_vpu3_ops = {
> -	.power_off_hw = iris_vpu3_power_off_hardware,
> -	.power_off_controller = iris_vpu_power_off_controller,
> -	.calc_freq = iris_vpu3_calculate_frequency,
> -};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ea7be2e0a3a255f61e236740e1082e7c9207250d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -0,0 +1,277 @@
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
> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> +{
> +	u32 value, pwr_status;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +	pwr_status = value & BIT(1);
> +
> +	return pwr_status ? false : true;
> +}
> +
> +static int iris_vpu3x_power_off_hardware_begin(struct iris_core *core)
> +{
> +	u32 reg_val = 0, value, i;
> +	int ret;
> +
> +	if (iris_vpu3x_hw_power_collapsed(core))
> +		return 1;
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
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void iris_vpu3x_power_off_hardware_end(struct iris_core *core)
> +{
> +	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +}
> +
I'm not a big fan of splitting the API into begin/middle/end just for the
sake of de-duplication of small part of code. It ends up introducing a lot
of jumps in the code, which makes it harder to follow.
Keeping it as a single flow, even with some duplication, would be more
readable and maintainable.
> +static void iris_vpu3_power_off_hardware(struct iris_core *core)
> +{
> +	u32 reg_val = 0;
> +	int ret;
> +
> +	ret = iris_vpu3x_power_off_hardware_begin(core);
> +	if (ret)
> +		goto disable_power;
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
> +
> +	iris_vpu3x_power_off_hardware_end(core);
> +
> +disable_power:
> +	iris_vpu_power_off_hw(core);
> +}
> +
> +static void iris_vpu33_power_off_hardware(struct iris_core *core)
> +{
> +	u32 reg_val = 0;
> +	int ret;
> +
> +	ret = iris_vpu3x_power_off_hardware_begin(core);
> +	if (ret)
> +		goto disable_power;
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +			reg_val, reg_val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> +	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	iris_vpu3x_power_off_hardware_end(core);
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
> +const struct vpu_ops iris_vpu3_ops = {
> +	.power_off_hw = iris_vpu3_power_off_hardware,
> +	.power_off_controller = iris_vpu_power_off_controller,
> +	.calc_freq = iris_vpu3x_calculate_frequency,
> +};
> +
> +const struct vpu_ops iris_vpu33_ops = {
> +	.power_off_hw = iris_vpu33_power_off_hardware,
> +	.power_off_controller = iris_vpu33_power_off_controller,
> +	.calc_freq = iris_vpu3x_calculate_frequency,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index f8965661c602f990d5a7057565f79df4112d097e..4af3cb0d44e00be498fc7ba648c68f1ef2cb0f20 100644
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
> @@ -23,6 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
>  int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>  int iris_vpu_prepare_pc(struct iris_core *core);
>  int iris_vpu_power_on(struct iris_core *core);
> +void iris_vpu_power_off_controller_begin(struct iris_core *core);
> +int iris_vpu_power_off_controller_end(struct iris_core *core);
These are unused, pls remove.
>  int iris_vpu_power_off_controller(struct iris_core *core);
>  void iris_vpu_power_off_hw(struct iris_core *core);
>  void iris_vpu_power_off(struct iris_core *core);
> 

Thanks,
Dikshita

