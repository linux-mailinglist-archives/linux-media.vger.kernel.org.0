Return-Path: <linux-media+bounces-27722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF8A54BE0
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A60E53AB41B
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510B6212D6B;
	Thu,  6 Mar 2025 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CVOa4SZ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86617210F5B;
	Thu,  6 Mar 2025 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266984; cv=none; b=FJakL4p89rMFy1fs890wS8Z+vkhEfTYtLtakDUyeDHcahrsELKyRnVq+x32NUWCo2SlOF9PiqABrUl40/E5v0CK214yohykljRHlnwsvBTE/z47s3lx/oaFqdTJJusKQTzqKISytaOOpygewU6bymq1lB2g0Qqo3glVGP9SdKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266984; c=relaxed/simple;
	bh=DH84FFsst4rTl71ErFsSV5nN9QN9azV2zCDNHg/9Zzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h7WHbEYD361OKrWbUcjtaggELZ8+GZhlNVPdBaWDBqKaW0zSWdbNUwZ1HTv0q4n2cgNow95qrqSwbnuIEvIy+yEEWE7L8b2j1TVN29TrAO9y7X1NJETbnyFoDtOQpn6yfXwOQU4qFNsFrhLe3X/Gv3ytsBHQF6joR9rUZbVMrv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CVOa4SZ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267Mfh7017954;
	Thu, 6 Mar 2025 13:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMs9v8KjOG4v5v0BJmhTd3qeTYh7hV+U8VJ1PN1W6C8=; b=CVOa4SZ6Dgk6P3C9
	/j1vKEN9YJ8jc/9aCvMS5R9iZrntZbrMFLwQ7Pf2L4Cb4gM468ZdLZA7w12ZiQBq
	ALXWcrPuZwWaxYfyWNMTLzxhbFo12/IYMKADQw1mM1N+p+JGLXbJU/avw9w2Bicp
	5lnbs9ZgDjEtkqXVngxOs/uLCgvow29hAuU/jxRc20oSED1nfBinVVc/RLHXfdVG
	ijcjglo9LySoCEtiVnEf76N1Zvgvkl95YT9VRW6tzA32LpTtNN9+tHajSk7TG8HS
	IWoBlj19GknA+f14YhCFLjbOkfG5MVkpnHIl0aekE+Gfk9NmHmp6MjnFKf2j5PwJ
	Dgzpbw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45778t9242-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 13:16:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526DGDCP030013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 13:16:13 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 05:16:09 -0800
Message-ID: <feea4c41-d3cf-4dc7-d197-6d91313d90ff@quicinc.com>
Date: Thu, 6 Mar 2025 18:46:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 7/7] media: platform: qcom/iris: add sm8650 support
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
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <20250305-topic-sm8x50-iris-v10-v2-7-bd65a3fc099e@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-7-bd65a3fc099e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J6r7M2itE_A9dJvmYZaDh6AxpB8eRTlp
X-Authority-Analysis: v=2.4 cv=U5poDfru c=1 sm=1 tr=0 ts=67c9a01e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=1rntOs83oLOrlNc53msA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: J6r7M2itE_A9dJvmYZaDh6AxpB8eRTlp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060100



On 3/6/2025 12:35 AM, Neil Armstrong wrote:
> Add support for the SM8650 platform by re-using the SM8550
> definitions and using the vpu33 ops.
> 
> The SM8650/vpu33 requires more reset lines, but the H.284
> decoder capabilities are identical.
> 
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
This approach looks good to me, reusing the platform data like this keeps
the code cleaner and avoids duplication. I think this is a good way to
handle the differences while sharing the common parts.

Thanks,
Dikshita
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

