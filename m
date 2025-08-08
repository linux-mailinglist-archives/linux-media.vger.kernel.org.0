Return-Path: <linux-media+bounces-39114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70B2B1E654
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0DC17E1C3
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A25E2749CD;
	Fri,  8 Aug 2025 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WegujM5X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16246270EC5;
	Fri,  8 Aug 2025 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754648170; cv=none; b=suPgojJWZIn2q9/lOr6SwJHTm45gzHIn3yLsXq6prjPx5KqOhBK4R+C1Y0NBMW7JZJHe3aSd3m/HNahvWNZLz4r+xXHSg+C+BV5Yd8DpSo78kp77elqznr8+z7fKQdHwqxqcDwPWwvKI29l4ugtlKFJRUf5TfpLnif61fusGDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754648170; c=relaxed/simple;
	bh=+3UaWvU2BGz/hl4hHb4AxqDZ1rQyLw2/MvZi9fEWiSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rEntDs5BYZ9OQSoLfi/m5bHZxIbUr+4Uo4sGj/H/2gqiEcqB4FFBjkCzfi7j6kcL8llCHMuYQnrt/krfcNOJw4catgfq4fXeQY4MTrFwM5fHGlfRKKcHvHjCJN/K9waE1I4P5r2pHJzKcju+Iarmf9FGfO5EZrVy4AyMqJkBpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WegujM5X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5789loBS021217;
	Fri, 8 Aug 2025 10:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzYAPKI63Op20LMgE1r6/zpeP3CStXU3bGd/YLyFxJk=; b=WegujM5XgYkyZo8S
	sl4Ga8GPpGJE7p8mWJtdqfskeGXCqB9AsmURZNcOyUfiN8CbOxOPWUcmav5zyI+L
	0t++IULmwkXqiytVCvCUern90iDFzauqXttVhtnJa3JxrBQR3jk0lZzJvKjSBO4W
	Yrc7nu05ctZK9wG0IsXEU7PF03zmFY4d4/YKn1ubvtNYBhPtLnGt9v7c7pxGKtzV
	j/eDs50If9DcRyr+wWi9TUimgh6aWo8KJZh/72iR8PoXCPnNZNEFXkXlYJtkH+oe
	egKSdmQlh+Ed7lZUiPTNB4opaYLJ6zx07OgzZtmYe5pmRnAt0uaxGTTAopA9Q58P
	FT2H4A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dewq835r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 10:16:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 578AG4PG006525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Aug 2025 10:16:04 GMT
Received: from [10.50.49.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 8 Aug
 2025 03:16:00 -0700
Message-ID: <7565cdd1-4bb6-11be-0601-c5e97d1edf73@quicinc.com>
Date: Fri, 8 Aug 2025 15:45:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 6/8] media: venus: core: Add qcm2290 DT compatible and
 resource data
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-7-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250808085300.1403570-7-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NyMBubt0o1ocQgqwpV0RndE9Ky163AnM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA3OCBTYWx0ZWRfX6VBpGR/IuhbD
 A4pMU52B9Pi/hc9BAtfpUmcj3oHCtPKHt/zzWYM2wKyA0bAG30zR6Hk/DV1U1O8pc2iQ2DopKLw
 gNcn01usTgCjIkS9tzpBL5SWl1kINwtR5T1eUDIKzy4oSSnmlTg5FpMgz/cphKdCkXkGAMMAJ0D
 ZWh7npn1knyYFST00wG1HtBWNoXx2TvLeaCQwhY9cnxlyQYugan73qZOUI5dP8DFu1CMPggLXrg
 7/iaQDl3Eb+Jnn4ADdKIBtBLNjFS+R2QbMHJhKgf+LveKnfFCO9SJJFDrNXGugimdxM3bMuAE75
 CfWX6d2vWed1mGxe4JzME4/DhxIdEpfE1CduIl65SGAZ9DWey7Nvp7p4dWk1U8TFBMWmmlTmkwQ
 eCE3D8Im
X-Authority-Analysis: v=2.4 cv=JbG8rVKV c=1 sm=1 tr=0 ts=6895ce65 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=suXULfkTiBreAXPO9NEA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NyMBubt0o1ocQgqwpV0RndE9Ky163AnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508080078



On 8/8/2025 2:22 PM, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the Venus core.
> 
> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> encode at 1280x720 (HD).
> 
> The driver is not available to firmware versions below 6.0.55 due to an
> internal requirement for secure buffers.
> 
> The bandwidth tables incorporate a conservative safety margin to ensure
> stability under peak DDR and interconnect load conditions.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 9604a7eed49d..a7c960d1d818 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1070,10 +1070,60 @@ static const struct venus_resources sc7280_res = {
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
> +static const struct firmware_version min_fw = {
> +	.major = 6, .minor = 0, .rev = 55,
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
> +	.enc_nodename = "video-encoder",
> +	.min_fw = &min_fw,
> +};
> +
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>  	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

