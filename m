Return-Path: <linux-media+bounces-36098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97205AEB8A3
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DEF63A4883
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 13:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E445C2D9EC2;
	Fri, 27 Jun 2025 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U7akdXvG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56882F1FDF;
	Fri, 27 Jun 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030186; cv=none; b=rq0cGcAu2VgIaUlvbhGwv2geCYZAtTqhpKhOqlNIishVvgxIP24k3t5y3w/6EfqrqcF7qYw9Y9tjJyyAJmkg1aFmFe19DNDFpdEO26zGMpm5BtzQtECqAhe+j7nsTtxMj7B01jSrsVScT7fYiZetD4D11YwfzYZo2c0CPEYE6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030186; c=relaxed/simple;
	bh=nIgU4NGYuTnZ5LbxOnqwD0vwz9c/ecnhJlEt9oZqUTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sKepCt9UJSNSv7AP/EiIMm26So5i+yOE1VND0QSMl9jaRjwCK5beGyfINrvmy+TgTtrA/YCL3b+P10Rq8fKNCiwOj1SqdFrEm9owkx2loUVepmrxBVA0rY+N1VQDqGruDh+MxfmErCNwOsQxbWU2BpAEtiQKTFraDd+to08wSw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U7akdXvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBxm9o001166;
	Fri, 27 Jun 2025 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zowl7jJ5W5Eft2Bn1TOHqB8kr4HxwMEgnOI78SpdSqE=; b=U7akdXvGBldYFkir
	fxtGKsdRnju1JxUuULRFBu6TocFtiRgUkU09aqxvhWaMeqY6ORJTxRD1ivBYnrlR
	mv3f1rcsCONL1X+ExNNZAnQlAA93Y+WkVk9uhvidGT34evKy8im6O0DDqPB/G7WP
	p9QT0e1xqRBMesCpZH2i//L7JrFBsSTC+ShP3JVbJmtHA/DEEamdCard262Ikf7k
	jSNqc7iUegEvyG4jWFvlCVX0NpRD1ZeyNXSmUV5vt1+FZHiHLjK5hGcE37VqnySD
	nBjC21GGlRTqWbp9ulFn6EDdRMdHQY6wj7fGXaP7xM0nosgwPaOX3pCXrI+kbX0h
	Gf0siw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdgxsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 13:16:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RDGKFC031071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 13:16:20 GMT
Received: from [10.50.47.15] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Jun
 2025 06:16:16 -0700
Message-ID: <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
Date: Fri, 27 Jun 2025 18:46:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, <krzk+dt@kernel.org>,
        <bryan.odonoghue@linaro.org>, <quic_vgarodia@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685e99a5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=g6kgWBQ9gOx-GhiQligA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExMCBTYWx0ZWRfX/GSCZ/StbmWL
 cLldthC6a9+U69XnAKTmEnZvyS7tLcCS+8N475zHcHBdR9YpVFgsSjYwUUrmK5lbCtls4pSBeqF
 nsCOeeAN/wCwRPrzzxlNmStintPlZvlOs0ccQK46xpG09iQHYPWzxXuwWmTYeyGJxvFAQJdf6ji
 etMfP8cHy0diHDle4mH3p0cC+LLlJUAXB4LphRhqU6ry9nJMvogkPGaPxpV39kV/p9jDVln+QxQ
 jjAcLyZSuIS2ILeGBlho+Y5q3i2rfRMW2CTl9bkBInTlbl0BZ8PfGXfclmgE0rhYKVEIN6JBCIi
 t4HTEz3xiaRe/aB36ROWj3rztiA2zTZCw4eSCpiXZdIYtMvF35KjHxHQM/IWmqam5aqLJ4veaAX
 4qkVu5bs2LoVNGEw8meYmEvLyABAkVSiASlb2CWcUs3FUqMfosBR/wgczHqZys20lsvagJ9o
X-Proofpoint-GUID: 2gUoiJ5Xk0sBwPzLeg5xBw6LjRlnl6Xv
X-Proofpoint-ORIG-GUID: 2gUoiJ5Xk0sBwPzLeg5xBw6LjRlnl6Xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270110



On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the venus core.
> 
> Video encoding support is not exposed until the relevant hardware
> capabilities are enabled.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 736ef53d988d..f1f211ca1ce2 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
>  	.enc_nodename = "video-encoder",
>  };
>  
> +static const struct freq_tbl qcm2290_freq_table[] = {
> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> +};
> +
fix this corner.
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
> +};
> +
what is the reference for this?
> +static const struct venus_resources qcm2290_res = {
> +	.freq_tbl = qcm2290_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
> +	.bw_tbl_dec = qcm2290_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> +	.clks = { "core", "iface", "bus", "throttle" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx" },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_6XX_LITE,
s/HFI_VERSION_6XX_LITE/HFI_VERSION_4XX_LITE

Thanks,
Dikshita
> +	.vpu_version = VPU_VERSION_AR50_LITE,
> +	.max_load = 352800,
> +	.num_vpp_pipes = 1,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/venus-6.0/venus.mbn",
> +	.dec_nodename = "video-decoder",
> +};
> +
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> @@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);

