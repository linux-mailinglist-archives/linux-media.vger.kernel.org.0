Return-Path: <linux-media+bounces-30478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F76A92147
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 17:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1326A174407
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 15:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A89E253B43;
	Thu, 17 Apr 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TP0M3c4R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9122522A1;
	Thu, 17 Apr 2025 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903259; cv=none; b=jCRfkAy6XysUeTWnuG5Kkv6tDt0g0/IYHuMMXjhoZa5G9ZHWVbYd1LMj+0gJlYP8Fp5t+9EM06A5pew41ybFSSXhD/4/jZ1zqldD/EU2d4M51zBdmCAnV6TIuTBYj71+xX9ivjczWBZ+WgiKnCK8cwjcrbHUKRO9anpMOTD36t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903259; c=relaxed/simple;
	bh=e7cXBTErrq2J4kSBkZnnfxuXc4rmzxot06dFMdLOifc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gBJUfvPIMujlIsGmAiWE3TA6jS+q+fuXqJ8v4cPYuoQTPDCPhGapbdYNXs3aXAUbVJ32w7Zx6EJozYoYqZ2UwkOPJeDlzPqi3vt5fTUHsI297tuZRz6cCRuFRz1D6REAKAXU6kaOnL2QwXoCgy1M5G+9PrquOCY4euQQqoCj2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TP0M3c4R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCluw2013691;
	Thu, 17 Apr 2025 15:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPJBJByy8KLeZ8Fb9RLRZJ5X6hjU5/AjesFKikGfV94=; b=TP0M3c4REvg459Vq
	xn3sQT1SK0aMH1EkBaKEazyQ0XkWIHm/VGjWZIBDAzmMRPNHGI/eFobQlRHAydBB
	opiHAJvD6797ikbcWYqK8UJaujh0BjLjY3U28XEz+6kEIlHfUzsl+x0aMMWfQ+ei
	qxxUmqdqYi9Ro6M9QMuZFewoQmMao9AjOs0QEDDNmSmXw/pVv32zqphRaCkXKzlg
	dqD6Br/HQPAjY1oRlK9cLI5SrSfx1N56YKTCYfhiH3euBZWIjWVaZJAYzH7soQkq
	WSsyQkXQgf33aM8L56W9D+ODckEl3agCqhE3J7PgO7gDPf4wK8EQXdLy0gM5xYqo
	iRPiIQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjqa7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:20:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HFKnlW031334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:20:49 GMT
Received: from [10.216.1.40] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 08:20:44 -0700
Message-ID: <c7cf5599-8ecb-c676-f7bc-b505681f5510@quicinc.com>
Date: Thu, 17 Apr 2025 20:50:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 3/7] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
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
 <20250417-topic-sm8x50-iris-v10-v7-3-f020cb1d0e98@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250417-topic-sm8x50-iris-v10-v7-3-f020cb1d0e98@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E2oNfx0QSt1xkk59nJkaRazdQQqlMPyE
X-Proofpoint-ORIG-GUID: E2oNfx0QSt1xkk59nJkaRazdQQqlMPyE
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=68011c52 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=1Y22SnrsS0-b5OIS1qAA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170115


On 4/17/2025 8:29 PM, Neil Armstrong wrote:
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
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
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
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

