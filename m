Return-Path: <linux-media+bounces-29777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FA5A82CF6
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 18:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D605B1791FC
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 16:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506D426FD9E;
	Wed,  9 Apr 2025 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QxYOljP1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CA75D477;
	Wed,  9 Apr 2025 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217888; cv=none; b=nC8yzZoL9yt9NnrQWoR63eBMgO+ZPiCbgBzRFz/chRKdudgC72dbu2Zb7vSeqtyf52EM0KIHzsJK2X2SqI0MEvf0fjv2P78XiPWcLzlflV2ahcEPjWWryYZJI3PUH3C/K3K8P2R2u3oiU9do68nLjR+PQ0+0l8/PkGrVV4O480g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217888; c=relaxed/simple;
	bh=BqbS+xTeBjeFzSWyNexB8paeBTUjxOKDq0qqYZX7Hjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RDMe55h00dMAsTvI4yrkF+ebWRMOawNC9Fx/hCYN6ZVeh2JIkl/936QHpkrNUpbRrtvN0lbNtRNKhZNePZHwn+rYwAzIC65FE1nJk717/ll3jAEMCcfDyEhborJ274LokHkKhf2geO9xW+Z2aMz3b1c2EUtQei/OJFB1extlrqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QxYOljP1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53982hC8014995;
	Wed, 9 Apr 2025 16:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKdjsHHFQg585qFdm8cKTxAZdpJT0lSymvy+Pztxax4=; b=QxYOljP1+jYk8jn6
	R7xJklEEZYbP01rIs2CQ6k/JDk7b9wx8bM1I9BvXvk18c0tXc2he3F4+WImoTF6L
	cBONuXe5UEQWzm9Y/eu1s41YRG3Dd9JdKi7Ymcrjf9f7CfRCOcgaJYq4Mt3HUEpZ
	jtBDBXGgZ0QmEmug6yZY8pRhLQ1ZiLbHS4jcEWwrUDA5AJpC/UvSyQU0ed0nCJ6M
	QP1VP5LrljIWlxYt8ItdhviRqZCv3oxNkVAmoXcarm0G2HphGbarDjIDgV6riz82
	azdEPJR9NOB7EvaqH6Tdd9u0WdpzwVIWNOwRlDd9nU/qszDiy4O/UqiM/h5R7VOT
	yTzjGA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbum3rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 16:57:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539Gvuwo017951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 16:57:56 GMT
Received: from [10.216.18.165] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 09:57:52 -0700
Message-ID: <36e25d6e-36de-fec6-e54d-0683503c7a09@quicinc.com>
Date: Wed, 9 Apr 2025 22:27:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 6/6] media: platform: qcom/iris: add sm8650 support
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
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
 <20250409-topic-sm8x50-iris-v10-v4-6-40e411594285@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-6-40e411594285@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lURXReXnOLDQwFVMN2frD2VBUkgMZ3H_
X-Proofpoint-ORIG-GUID: lURXReXnOLDQwFVMN2frD2VBUkgMZ3H_
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f6a714 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=L6TRgVCy50KPOmexG9wA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090109

Hi Neil,

On 4/9/2025 8:08 PM, Neil Armstrong wrote:
> Add support for the SM8650 platform by re-using the SM8550
> definitions and using the vpu33 ops.
> 
> The SM8650/vpu33 requires more reset lines, but the H.264
> decoder capabilities are identical.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../platform/qcom/iris/iris_platform_sm8550.c      | 64 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>  3 files changed, 69 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -35,6 +35,7 @@ enum pipe_type {
>  
>  extern struct iris_platform_data sm8250_data;
>  extern struct iris_platform_data sm8550_data;
> +extern struct iris_platform_data sm8650_data;
>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -144,6 +144,10 @@ static const struct icc_info sm8550_icc_table[] = {
>  
>  static const char * const sm8550_clk_reset_table[] = { "bus" };
>  
> +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
> +
> +static const char * const sm8650_controller_reset_table[] = { "xo" };
> +
>  static const struct bw_info sm8550_bw_table_dec[] = {
>  	{ ((4096 * 2160) / 256) * 60, 1608000 },
>  	{ ((4096 * 2160) / 256) * 30,  826000 },
> @@ -264,3 +268,63 @@ struct iris_platform_data sm8550_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  };
> +
> +/*
> + * Shares most of SM8550 data except:
> + * - vpu_ops to iris_vpu33_ops
> + * - clk_rst_tbl to sm8650_clk_reset_table
> + * - controller_rst_tbl to sm8650_controller_reset_table
> + * - fwname to "qcom/vpu/vpu33_p4.mbn"
> + */
> +struct iris_platform_data sm8650_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.vpu_ops = &iris_vpu33_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8650_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
> +	.controller_rst_tbl = sm8650_controller_reset_table,
> +	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
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
> +	.fwname = "qcom/vpu/vpu33_p4.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps = inst_fw_cap_sm8550,
> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
> +	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
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
While i was extending the data for QCS8300 (one another iris-v3 variant), i
realize that this file iris_platform_sm8550.c is getting dumped with all SOC
platform data. It would be a good idea at this point to split it into something
like this
1. Introduce SOC specific c file and move the respective SOC platform data to
it, for ex, in this case sm8650_data
2. Move the common structs from iris_platform_sm8550.c to
iris_platform_common.h. This way more SOCs getting added in future, can include
the common header to reuse them, otherwise it would end up using 8550.c for all
future SOC.

Share your comments if you have any better approach to manage/re-use these
platform data considering more SOCs getting added.

Regards,
Vikash

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
>  			.data = &sm8250_data,
>  		},
>  #endif
> +	{
> +		.compatible = "qcom,sm8650-iris",
> +		.data = &sm8650_data,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> 

