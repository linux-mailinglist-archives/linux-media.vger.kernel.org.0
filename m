Return-Path: <linux-media+bounces-39117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2BDB1E66C
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8EE8561E86
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCCA274644;
	Fri,  8 Aug 2025 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d7xbH05o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02535156228;
	Fri,  8 Aug 2025 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754648800; cv=none; b=fHIyJVx3fiQ0CDHTQgbasEBrCAeWwG1IoCEIlUYCT/xoNjoNeGUyFFZxmM/lVHx1O9QlMkTdTOLTHJzNFZG8sx3bJ7uFlueSmZmB4ziXyfUjDTIv3MOY6wDmAYpUO69zPL3ZXVL61/hmfX8D0lkkuOUgdOJD1WU8ub9CLay2S8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754648800; c=relaxed/simple;
	bh=QXHrkJi5ywvG5YxsIghiv+6+SPOoA7TsBbjvjmzW/6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZTczVYRhcuhgwcOP3RUQzdFun8GNTB9p+UFxRuOHZ9MiPZ7YKKzVHwbMHT7b2vXAZrid/mGJWXvSOFGhOoBn+Eks6NU3DAozxJuVVJmsi2ODHQttvUm3qO+LxzNxbRSVRu3URmytwHH4+fLqIA44hLkxt9yHy18S5Ud5crSEJn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d7xbH05o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787JtMW003594;
	Fri, 8 Aug 2025 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+JyhFaFgFvJhra706eymzNSGfyeTujWQwu0k1qJ76I=; b=d7xbH05ojjHZfghT
	harxIH7WoX1h6lOrwuAnCwPzA5m/M5FRJeaWpQ9vgf1b769/cQmXSPIZcP6OBA+r
	aUz3tTEUjsX4FkAu3+gGqvgFJhJVG0w1jyO46uf52hmkJFelMiUM1aN170cJZl5P
	6irBan+0+jXCrd1erWZowLuIlZbFXRb8ZvdJbpLURt/tepuOKwQlPmIRED2LS21O
	XuW+AAd29F6ySjmtR8BRKgj2/bHYNafWk0pqjdOmSRFLygaqO/GL0Vh54B3JHEMC
	BBkVriWEsB+pINdW2VaPIx83gbe0bt6R9mT1m3NThtL8bnqFnKS2atr6U+Aki4+2
	mvdoQQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyahr4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 10:26:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 578AQZFk025642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Aug 2025 10:26:35 GMT
Received: from [10.50.49.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 8 Aug
 2025 03:26:31 -0700
Message-ID: <1c37f590-4f79-4128-b036-13510b9825c2@quicinc.com>
Date: Fri, 8 Aug 2025 15:56:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-9-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250808085300.1403570-9-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yOGuCasu4J4fn_nZDufSr58mAihq7Gv7
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=6895d0dc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=vDL6eqkURbsm9iho78EA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzNmDnORAUrYB
 SjDt+5xqx/vuNYmTjCqydkpQ/xoboQQ99f0qW0wd7gTAZhj9UmDOlI1ZC+O2FoIR9gET7NWE7T0
 +GBWdRzpteprj2NKb/9atfBi1+fIYVdHRAP1DiXQcfhORagsRA0vlpNOq2vzC9jfouxNVf2+1WP
 /Lr5iJLmQysT5HJEeQBpjDEFzUy668Nug6wFQvXEbMtE+9rx/YImBUHM5f0NuUDmnbsbpMhNGCJ
 r8mU2zTgHtxQIK6x05YtrvqlS7uNxwgByqgXU5By8MyN0sgXUxDi+a9i+jsM49KGQOxhOhs1aSN
 gJ5fNNHxcN8RLMHsCtEys43ziswDyP8SPPVz2b8NfegV1XbHs0gC4zluF4j12jKLfbWH3nKOH+L
 GgbP8rab
X-Proofpoint-GUID: yOGuCasu4J4fn_nZDufSr58mAihq7Gv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/8/2025 2:23 PM, Jorge Ramirez-Ortiz wrote:
> Enable Venus on the QRB2210 RB1 development board.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index b2e0fc5501c1..e92d0d6ad1b8 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -698,6 +698,10 @@ &usb_qmpphy_out {
>  	remote-endpoint = <&pm4125_ss_in>;
>  };
>  
> +&venus {
> +	status = "okay";
> +};
> +
>  &wifi {
>  	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>  	vdd-1.8-xo-supply = <&pm4125_l13>;

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

