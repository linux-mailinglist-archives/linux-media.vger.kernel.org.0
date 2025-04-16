Return-Path: <linux-media+bounces-30312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22177A8B28A
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 09:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28D4117CBC8
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 07:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A8822DFBA;
	Wed, 16 Apr 2025 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n1xHoGKT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C047518C03F;
	Wed, 16 Apr 2025 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789611; cv=none; b=rtSXknhVuslFa98VocHuf0Hj7/F/L+W4WA2F/tE0swAOHx2JL9xOogAjdAQ2Uke2O11hKfAQC+R31Bl+bw3URlkopslvcoCKGIavw7ezat+RkC1zkG5ldwkO4atFwpENIckvX5wawiZM6Wz2yVXrJeWrxRatcnjfi7mjld5lbPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789611; c=relaxed/simple;
	bh=9iuxd23c4Azq3pgqab6ru8KCpyx/Ar+y1vYOjgF74fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jVyCFE26QiDaaLyGxX8JUYUCgAo6tWQ3l3TlGuGbSu6zoR8mimxePMqV257KhcmWjsRwmcbBXE22tmW35y27V5N3uv7zChwYezlloztxdvue/IJtswGRWhqi23CuFVgEIoGaqQRp1S8tvYHzWdpUleqFPsr4hQ35xvwXflqEmVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n1xHoGKT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7JMwQ002562;
	Wed, 16 Apr 2025 07:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmLSFpd1t81sYP0HOtR0SOPScwxuSgEHxikwpDuOc38=; b=n1xHoGKTnwHqE90k
	8R1lTDdUyXBJzt/BxDd/N89qIlOcPdoP3OD03ghqosgTtriU/ZLkXvLYxHoYBTsr
	lQ5h0ikAuhq5VAADhSH1S0Dla7gJ3o1kyRgQ+9jZ4fQ4ssvTQlXFycvUKz4KeUpf
	2nNhtSqtGxwJ6/6gXizEeqUO0gzBO2lm3iItzvKNFq0lQNOszmUSB8AVF6Sce5qj
	upFnP0t5BeGocGcmV9LyzzyrXOfHfWsJvgvLcS1dKZgG9H7oeENQKJjfv7dt4Ef2
	lknvAEcH3GntwScd730dhFWqoRTMUJDcvg7aKvcrDC3QI+B/y5t2Oiru36cIUrjn
	qGRdJg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9aq3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:46:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53G7kek5008991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:46:40 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 00:46:37 -0700
Message-ID: <35ffb534-fb8d-4023-1ac0-cb1f37d0448a@quicinc.com>
Date: Wed, 16 Apr 2025 13:16:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/7] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
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
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
 <20250415-topic-sm8x50-iris-v10-v6-3-8ad319094055@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-3-8ad319094055@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -feYHIRc5FD7k4q5k1yK9IPvfm94OyJe
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ff6062 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=1Y22SnrsS0-b5OIS1qAA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -feYHIRc5FD7k4q5k1yK9IPvfm94OyJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160063



On 4/15/2025 7:17 PM, Neil Armstrong wrote:
> Introduce an optional controller_rst_tbl use to store reset lines
> used to reset part of the controller.
> 
> This is necessary for the vpu3 support, when the xo reset line
> must be asserted separately from the other reset line
> on power off operation.
> 
> Factor the iris_init_resets() logic to allow requesting
> multiple reset tables.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 39 +++++++++++++++-------
>  3 files changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 37fb4919fecc62182784b4dca90fcab47dd38a80..aeeac32a1f6d9a9fa7027e8e3db4d95f021c552e 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -43,6 +43,7 @@ struct icc_info {
>   * @clock_tbl: table of iris clocks
>   * @clk_count: count of iris clocks
>   * @resets: table of iris reset clocks
> + * @controller_resets: table of controller reset clocks
>   * @iris_platform_data: a structure for platform data
>   * @state: current state of core
>   * @iface_q_table_daddr: device address for interface queue table memory
> @@ -82,6 +83,7 @@ struct iris_core {
>  	struct clk_bulk_data			*clock_tbl;
>  	u32					clk_count;
>  	struct reset_control_bulk_data		*resets;
> +	struct reset_control_bulk_data		*controller_resets;
>  	const struct iris_platform_data		*iris_platform_data;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f6b15d2805fb2004699709bb12cd7ce9b052180c..fdd40fd80178c4c66b37e392d07a0a62f492f108 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -156,6 +156,8 @@ struct iris_platform_data {
>  	unsigned int clk_tbl_size;
>  	const char * const *clk_rst_tbl;
>  	unsigned int clk_rst_tbl_size;
> +	const char * const *controller_rst_tbl;
> +	unsigned int controller_rst_tbl_size;
>  	u64 dma_mask;
>  	const char *fwname;
>  	u32 pas_id;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index aca442dcc153830e6252d1dca87afb38c0b9eb8f..4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -91,25 +91,40 @@ static int iris_init_clocks(struct iris_core *core)
>  	return 0;
>  }
>  
> -static int iris_init_resets(struct iris_core *core)
> +static int iris_init_reset_table(struct iris_core *core,
> +				 struct reset_control_bulk_data **resets,
> +				 const char * const *rst_tbl, u32 rst_tbl_size)
>  {
> -	const char * const *rst_tbl;
> -	u32 rst_tbl_size;
>  	u32 i = 0;
>  
> -	rst_tbl = core->iris_platform_data->clk_rst_tbl;
> -	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> -
> -	core->resets = devm_kzalloc(core->dev,
> -				    sizeof(*core->resets) * rst_tbl_size,
> -				    GFP_KERNEL);
> -	if (!core->resets)
> +	*resets = devm_kzalloc(core->dev,
> +			       sizeof(struct reset_control_bulk_data) * rst_tbl_size,
> +			       GFP_KERNEL);
> +	if (!*resets)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < rst_tbl_size; i++)
> -		core->resets[i].id = rst_tbl[i];
> +		(*resets)[i].id = rst_tbl[i];
> +
> +	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, *resets);
> +}
> +
> +static int iris_init_resets(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_init_reset_table(core, &core->resets,
> +				    core->iris_platform_data->clk_rst_tbl,
> +				    core->iris_platform_data->clk_rst_tbl_size);
> +	if (ret)
> +		return ret;
> +
> +	if (!core->iris_platform_data->controller_rst_tbl_size)
> +		return 0;
>  
> -	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
> +	return iris_init_reset_table(core, &core->controller_resets,
> +				     core->iris_platform_data->controller_rst_tbl,
> +				     core->iris_platform_data->controller_rst_tbl_size);
>  }
>  
>  static int iris_init_resources(struct iris_core *core)
> 
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

