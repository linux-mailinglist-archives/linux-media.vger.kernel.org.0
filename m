Return-Path: <linux-media+bounces-38522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B1B134CE
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 08:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF0321896BC3
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 06:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33410221FA1;
	Mon, 28 Jul 2025 06:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n+yLNASi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EE886344;
	Mon, 28 Jul 2025 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753683417; cv=none; b=c8y+hEvwkN9JtpDNtbnk1x5VnTZ6tx2+RCaSVQqLbdAFmGxxeUyhAf4Lxwd/C98fBy14BQhtehL43rHj0cNbW2TuNkPkcy9bigB1ir/1ZN9eBCbD5TPJf37mVPnojWFXs5YQSPggOTJoUArYnuFOyUVt2HL5F/aSZ2GqQ/+9MZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753683417; c=relaxed/simple;
	bh=mw/XPlPKMDno6G8YIqCwyPXZ88qFJ4U3/hr6QCOL0eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D6rzvOmrFueokFHMPQZfJNdlexxBAzfGzprOnXfy/s3VE0v/jd/BsfIImpBcAioqHTRuolqPqVvNPcv4/408G88UVZsjIyskNQIw7Ly4Vh2Qci0bU2QxUTUIcFPRGTnCsBbAWzhXw/MPIpgNWqLRroSQZWCQ1+1qA4EIn3FvwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n+yLNASi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rVH4019654;
	Mon, 28 Jul 2025 06:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XuAZsK0BtOoqFUMaBkh4WaTxus9sHxVIny3hqpjTFr8=; b=n+yLNASiQ8BrhoFM
	UuV3+r3tQDdx67X7VEJM1OnfQEteUuLks8TIxKk5u85Dr8rE0zPdbmdbKJWkOP+x
	bxP1gUyxoiiijgQuL1+80mrEBBoZaVhHPanDy8jNFlyuGwkbw9V3EodRSdMm/80f
	QqjlHezEe7atTsMd2kkiHz/v0cB9Mxk26ZI7ecEiMVa+myBCF6s+MZ53Sy4exJtk
	dTMa5JyzwyWKn8AhciQ0NMkCI8PKvfE63GgIwtUa1dvGXNbI4UXYiDWutjy0/jlO
	6OU3iCRIIJVsg9pSHfjvWcJlvRbaVNtAoPsSnrKr0wkdugRi9Nl8CaetxIJdCKOV
	OPqKPg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qkaqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 06:16:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56S6GpAf014949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 06:16:51 GMT
Received: from [10.204.101.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 27 Jul
 2025 23:16:47 -0700
Message-ID: <7fb5256e-630c-3040-ca6d-4e9dee52162c@quicinc.com>
Date: Mon, 28 Jul 2025 11:46:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <mchehab@kernel.org>,
        <andersson@kernel.org>, <conor+dt@kernel.org>,
        <amit.kucheria@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-6-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250715204749.2189875-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA0MSBTYWx0ZWRfX3FM+GhfM+Dxv
 sjthqkVmTAu6dOjtNsSIevD/Z0IsZdG3Vt0185d/URdPH8/E/VYxvll6ClEIG8ESWmLs/3mMD+/
 2RE7gP4K1b2aZoW6YR+SnxfAjBERExYQeksnKg3NVxyDC5cD4cwLGYFf5HOW/+uYKUpMrODdgt3
 4BMZojmYhJkKWuTqHabb/bKwA5RQiousDNQkH8/re/4bvPDPeQjiZAdym1o9m91OinIgIpcfcx+
 LeZ0AjmKChG3i85mvRAS665AFN/Icj6TIfZtmyPRjSRxO+HpNWC04l0IBPtLRdpZHk8uE82EUL/
 4XO1uM4iC0MPTavwlK+/4bXxZOS6PHWaVKtlPquihEFuGnkan74vzQ/f+4rjJ8iI+0HabIAsWaP
 vM3i1PwxCNdP5wf/T9224lb287zWlBM0tl8sGNGswJjec9C3nZGqC7x/B5qmL1S4aLtEhiv5
X-Proofpoint-ORIG-GUID: AMNBmPYI8gIppHYbmYn2QR5072qhAqk9
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688715d4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=-h2BoODB7oHphHcttcwA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AMNBmPYI8gIppHYbmYn2QR5072qhAqk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280041



On 7/16/2025 2:17 AM, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the Cenus core.
> 
> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> encode at 1280x720 (HD).
> 
> The encoder is not available to firmware versions below 6.0.54 due to an
> internal requirement for secure buffers.
> 
> The bandwidth tables incorporate a conservative safety margin to ensure
> stability under peak DDR and interconnect load conditions.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 51 ++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index bad49f0b4a77..2c9e2e0f95f5 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1088,6 +1088,56 @@ static const struct venus_resources sc7280_res = {
>  	.enc_nodename = "video-encoder",
>  };
>  
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> +};
> +
> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> +};
> +
> +static const struct venus_min_fw min_fw_encode = {
> +	.major = 6, .minor = 0, .rev = 54  /* encode min fw version */
> +};
> +
> +static const struct venus_resources qcm2290_res = {
> +	.bw_tbl_dec = qcm2290_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> +	.bw_tbl_enc = qcm2290_bw_table_enc,
> +	.bw_tbl_enc_size = ARRAY_SIZE(qcm2290_bw_table_enc),
> +	.clks = { "core", "iface", "bus", "throttle" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx" },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_4XX,
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
> +	.dec_minfw = NULL,
> +	.enc_nodename = "video-encoder",
> +	.enc_minfw = &min_fw_encode,
> +};
> +
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> @@ -1098,6 +1148,7 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

