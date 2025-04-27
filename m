Return-Path: <linux-media+bounces-31127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D81A9E3A6
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 16:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91CDD16E907
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 14:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01511D5AA7;
	Sun, 27 Apr 2025 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hiwHYoDm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337781AF0C1;
	Sun, 27 Apr 2025 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745765467; cv=none; b=JH7DOPDUjjkcbLZqDxVEJOnsiCrQeTyOEKQSgIg0/UqTJ9e4uDODgOp/Da6/21Ih0scFi+2NVcsE+i6+q7//cKddNJZfhoaZPQVMElebxCDqlGnO4xgYONOqHJXk82UFU5hkvaGSUwNFP2QNITuhDSxZSaumWaYksSpAOZuEUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745765467; c=relaxed/simple;
	bh=PSW6eKpnQiCo+Dqh5Ru08bRcv3EVINA4jU+R6ro+u0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bvE4M0M/dspzXU1oaKCZ07+TGQcafo17gZoPmLjx3z8ig3HCPN0vDKMa3sYsWhSPqSnRB8nRwXj9S7JbxjNJWbzpptNWVyHCi2AffOc0kCqFQqHJxktKPxnZIb7JZ0EQsluz2hgu7US6Pk1h/8jjoqv5twf5jOsCCrbkePf/P5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hiwHYoDm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RBcIqI012256;
	Sun, 27 Apr 2025 14:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8hjdWhLqMNyFeutdU+8Ms8H4vRn5ysHiHN3KJQ2Zw4=; b=hiwHYoDmJ1V0gn2Z
	oTfjbPw1LzR9dyK5lM7Ywt2ABmYNqhbPtqIJffqZ/y5D5FMLVUqmVdBFk2caaUmF
	F57Dwktgm9ZCouQFuusXbyOmGME2n/8mclxxBDRj5V9NJqkRQadCC/IqL1Ij+khs
	X78gt5qX4T9JN0oBtuVjrNCY6E+LUC2WBFmIc0XbGiSh7nyx5RoE0HzFqHOHXiXx
	+I6fVvqrLqi+YCjOEZ9Mtv5zVUiD3pAQEqXfTfoFuEulLAAK5f7BwUW42GKXVtpk
	jQ5aGzDk2owzDMmsvzBhImlNBUFqRr8hRXFhhbDxqYk+1PV4PSyUODUzD7nqD9kV
	+hbjsQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hm2e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 14:51:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53REoxGg007589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 14:50:59 GMT
Received: from [10.50.44.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Apr
 2025 07:50:54 -0700
Message-ID: <5f886cb2-79ae-4107-99d7-928e572fc3df@quicinc.com>
Date: Sun, 27 Apr 2025 20:20:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/5] media: iris: add qcs8300 platform data
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-3-f118f505c300@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v5-3-f118f505c300@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r2qKB8HmNyO2pvwD5CfRz9vpsFlbNXLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDEyMiBTYWx0ZWRfX4f20lQYxqhVg biuZS37jbgxJNWp5Xhyq2SRGCd74UjepYKWpU4tXPwaolo7cXV1yWbdK62ooHGsMJDsaR3vzUNF RpMlO+xYsYkA8/RkJbWWVyH61w+ZV8v8MQxUTprjvsBOnwVpsrei1aEr3SzBQFCFBazaUYEwLge
 oTN30dlIajA+is0DMzJfkhBnbjxmwpRLJ6P681KsVVv7PCS406fX0MwUZUQU14+m/ysMKQdDBdl dgOsROfYQf0nlvBJWTm5X+NgGVQz+iElUI/v3P2UdUQu/yAHq1AZroIB4hkwC+nwLjz8/bhKxxl 9l5R+AWf84A1k+Hzl/ZZurLvSXAc+oGddyvMVtEQK3MCsD/ghPUVr60DwR1yMWx/iCnjZWxnX68
 +XruaOuzR0f59lh3VtSe6SrCRPJT2LX1sMtWRrJw6wu8ESlogvZObx35dnsN0z2FwtGCavAg
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680e4454 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=YHD-5dQh9aMLgIK99ioA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: r2qKB8HmNyO2pvwD5CfRz9vpsFlbNXLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270122



On 4/24/2025 2:20 PM, Vikash Garodia wrote:
> Add platform data for QCS8300, which has different capabilities compared
> to SM8550. Introduce a QCS8300 header that defines these capabilities.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  4 files changed, 186 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 6bc3a7975b04d612f6c89206eae95dac678695fc..ac76d9e1ef9c14dd132f306fae55cccbfa141092 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -33,6 +33,7 @@ enum pipe_type {
>  	PIPE_4 = 4,
>  };
>  
> +extern struct iris_platform_data qcs8300_data;
>  extern struct iris_platform_data sm8250_data;
>  extern struct iris_platform_data sm8550_data;
>  extern struct iris_platform_data sm8650_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ff82296ee8ea5ad3954bd2254594048adcb8404..1e69ba15db0fd99a83fd5f9bccc0ba7d4ffe5a48 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -10,6 +10,7 @@
>  #include "iris_platform_common.h"
>  #include "iris_vpu_common.h"
>  
> +#include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  
>  #define VIDEO_ARCH_LX 1
> @@ -326,3 +327,59 @@ struct iris_platform_data sm8650_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  };
> +
> +/*
> + * Shares most of SM8550 data except:
> + * - inst_caps to platform_inst_cap_qcs8300
> + * - inst_fw_caps to inst_fw_cap_qcs8300
> + */
> +struct iris_platform_data qcs8300_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_qcs8300,
> +	.inst_fw_caps = inst_fw_cap_qcs8300,
> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_qcs8300),
> +	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 2,
> +	.max_session_count = 16,
> +	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> +	.input_config_params =
> +		sm8550_vdec_input_config_params,
> +	.input_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params),
> +	.output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
> +	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f82355d72fcffe7e361bd30877cccb83fe9b549f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
> +	{
> +		.cap_id = PROFILE,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B)  |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROP_STAGE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = PIPE,
> +		.min = PIPE_1,
> +		.max = PIPE_2,
> +		.step_or_mask = 1,
> +		.value = PIPE_2,
> +		.hfi_id = HFI_PROP_PIPE,
> +		.set = iris_set_pipe,
> +	},
> +	{
> +		.cap_id = POC,
> +		.min = 0,
> +		.max = 2,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
> +	},
> +	{
> +		.cap_id = CODED_FRAMES,
> +		.min = CODED_FRAMES_PROGRESSIVE,
> +		.max = CODED_FRAMES_PROGRESSIVE,
> +		.step_or_mask = 0,
> +		.value = CODED_FRAMES_PROGRESSIVE,
> +		.hfi_id = HFI_PROP_CODED_FRAMES,
> +	},
> +	{
> +		.cap_id = BIT_DEPTH,
> +		.min = BIT_DEPTH_8,
> +		.max = BIT_DEPTH_8,
> +		.step_or_mask = 1,
> +		.value = BIT_DEPTH_8,
> +		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	},
> +	{
> +		.cap_id = RAP_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 4096,
> +	.min_frame_height = 96,
> +	.max_frame_height = 4096,
> +	.max_mbpf = (4096 * 2176) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 326389,
> +	.mb_cycles_fw_vpp = 44156,
> +	.num_comv = 0,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index fa3b9c9b1493e4165f8c6d9c1cc0b76d3dfa9b7b..9a7ce142f7007ffcda0bd422c1983f2374bb0d92 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -335,6 +335,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>  };
>  
>  static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,qcs8300-iris",
> +		.data = &qcs8300_data,
> +	},
>  #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
>  	{
>  		.compatible = "qcom,sm8250-venus",
> 
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

