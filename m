Return-Path: <linux-media+bounces-27459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD19A4DB62
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2216D16FDBF
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5462C20126C;
	Tue,  4 Mar 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iAPMWVyg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF01FCFD2;
	Tue,  4 Mar 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085408; cv=none; b=KRgaLcqbnun+TSpQ0QXtAdOHmMM+7rjeS7ltacRPpEtybcbchCS74dYSU/gKtwkYypIGFsjt8mzO1E1kShmtoqU5s8X2bDNfiJpvXX/W5fn/WKulPkcchOVCMCgvt8Ldh5sge82wZlmkncryIJxF8ECwhWFGjxPdVIi1YmwkVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085408; c=relaxed/simple;
	bh=mGXlpz3CiqcPQnbKPytAQ5hYUOnpdwSqUuiF+lDuTT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C+WTPNFYsx/qH0V+H2TUkhGdILRDtk/fSGmzqj9v2VD1k1yDGeAhgUGGU4NqHzlZIpnQyDnx0kjKqvhOG475vyQsNmx5Yv4Ar68BPp6oxMFv43XBQzmBdtcv497Qyh92XKX1Ilj/6jyghKqoFb0et4/1YPie45enoDb/cq2TB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iAPMWVyg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524A8DVx025579;
	Tue, 4 Mar 2025 10:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GP+yLfOMUx0b3MSlMgsVk4hK4+Tg3fbuyX5/ertOoLQ=; b=iAPMWVygLve/YdWE
	nK8b3aiTrxKRY57boqU+yQpEoKKmLPno9j4gjh9oV5kL5F/Ozcoub8VKaVjuin4q
	Kl4nhLNXW1XZwk76+1wzNLu8mQqsdIrjx30uCQlxx0ahMrOt5dYiadgfknVO/RsY
	QjE5DJKAA5eECpdk7oljT6AFxX6Z1/0IqEIoFWKYDwgdFDKTm9viRVB22brvmBQi
	WKy8rr3E+1vwevd/RtAad95pSTFPGYESN3jPgtHeL0dkdSJHjjKEn1N/XMk0r2KR
	Z0f+hdhheeCKCJit6rsR4XKF0RYKqsPARVMqX0hSqc3tmQvUjPTsjafXMWV2o8kl
	+qnCpQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p931jn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 10:50:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524AnxW3012288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 10:49:59 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 02:49:55 -0800
Message-ID: <47b362a2-116c-4260-84dc-0e0dc0ab7cc7@quicinc.com>
Date: Tue, 4 Mar 2025 18:49:53 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Use APIs in gdsc genpd to switch gdsc mode for
 venus v4 core
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c6dad8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=8t6D1CfDI0I1gW2ExC4A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2v-jueHv1U93dJp3dOnZnl3XKH7wkkJ7
X-Proofpoint-ORIG-GUID: 2v-jueHv1U93dJp3dOnZnl3XKH7wkkJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=808 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040091


On 2/18/2025 6:33 PM, Renjiang Han wrote:
> The Venus driver requires vcodec GDSC to be ON in SW mode for clock
> operations and move it back to HW mode to gain power benefits. Earlier,
> as there is no interface to switch the GDSC mode from GenPD framework,
> the GDSC is moved to HW control mode as part of GDSC enable callback and
> venus driver is writing to its POWER_CONTROL register to keep the GDSC ON
> from SW whereever required. But the POWER_CONTROL register addresses are
> not constant and can vary across the variants.
>
> Also as per the HW recommendation, the GDSC mode switching needs to be
> controlled from respective GDSC register and this is a uniform approach
> across all the targets. Hence use dev_pm_genpd_set_hwmode() API which
> controls GDSC mode switching using its respective GDSC register.
>
> Make venus driver to use dev_pm_genpd_set_hwmode() to switch GDSC mode on
> v4.
> - 1. the venus driver adds compatibility with the new way to switch GDSC
> mode.
> - 2. the clock driver uses the HW_CTRL_TRIGGER flag, which means the venus
> driver needs to use the dev_pm_genpd_set_hwmode() API to switch GDSC mode.
>
> Validated this series on QCS615 and SC7180.
>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Changes in v4:
> - 1. Update the order of patches.
> - 2. Update vcodec_control_v4 to try dev_pm_genpd_set_hwmode first.
> - 3. Add hwmode_dev to indicate whether to use HW_CTRL_TRIGGER flag.
> - 4. Update commit message and cover letter message.
> - 5. Remove the patch that cleaned up dead code and will submit this patch
> with next patch series.
> - Link to v3: https://lore.kernel.org/r/20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com
>
> Changes in v3:
> - 1. Update commit message.
> - 2. Add a patch to clean up the dead code for the venus driver.
> - 3. Remove vcodec_control_v4() function.
> - 4. Directly call dev_pm_genpd_set_hwmode() without vcodec_control_v4().
> - Link to v2: https://lore.kernel.org/r/20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com
>
> Changes in v2:
> - 1. Add the HW_CTRL_TRIGGER flag for the targets SM7150/SM8150 and SM8450
> video GDSCs supporting movement between HW and SW mode of the GDSC.
> (Suggested by Dmitry Baryshkov)
> - 2. There is a dependency of the clock driver introducing the new flag
> and the video driver adapting to this new API. Missing either the clock
> and video driver could potentially break the video driver.
> - Link to v1: https://lore.kernel.org/r/20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com
>
> ---
> Renjiang Han (1):
>        venus: pm_helpers: add compatibility for dev_pm_genpd_set_hwmode on V4
>
> Taniya Das (1):
>        clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's
>
>   drivers/clk/qcom/videocc-sc7180.c              |  2 +-
>   drivers/clk/qcom/videocc-sdm845.c              |  4 +--
>   drivers/clk/qcom/videocc-sm7150.c              |  4 +--
>   drivers/clk/qcom/videocc-sm8150.c              |  4 +--
>   drivers/clk/qcom/videocc-sm8450.c              |  4 +--
>   drivers/media/platform/qcom/venus/core.h       |  2 ++
>   drivers/media/platform/qcom/venus/pm_helpers.c | 38 ++++++++++++++------------
>   7 files changed, 32 insertions(+), 26 deletions(-)
> ---
> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> change-id: 20250115-switch_gdsc_mode-a9c14fad9a36
Gentle ping on this patch series.
>
> Best regards,

-- 
Best Regards,
Renjiang


