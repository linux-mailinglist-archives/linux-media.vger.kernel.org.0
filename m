Return-Path: <linux-media+bounces-14854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9492D28A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 15:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AC8B1F22FDB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2590D192B82;
	Wed, 10 Jul 2024 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GVIEhoPs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9DF192492;
	Wed, 10 Jul 2024 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617305; cv=none; b=dk0yyHP7jNkfxN4T1vpmT2NiheC3krKmzoMVI9pza3bCq1XSUxopEma3lovuwEs9BjZRuKBr5QNYG/w3pvr95IJDI8UAgYzdDHW5ZVx5hyZd02tN1tL6pT3zVLfmlZ5aZXpYySCB+5ZBudyo27yWSSTRoIfBN4uGUAeEPi33VIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617305; c=relaxed/simple;
	bh=DGfVoZNfPdaJiCC+VkpyJKmwJ+ljufKF/kBN7p8Ex/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mSFKr1oE4v96AIcWXhDfbTJpbl7uYFo07RYni5lV/WlaujJ0J1EOy0tQPRhVg+6G8ln4QnZNgcbBlBQ6T8amVEVa++Pv1r8dp2fMxoWvbiFRawPiBaxMlkOi+mavjexBubaazTqnkj5WhS62/j5oPCF1nfMnpcEfhfc1aMF6c3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GVIEhoPs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46ACU7SX009474;
	Wed, 10 Jul 2024 13:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIzS/n1i16QTfubuhek/ODHZ/H5HNuwuEmZGlaTudYc=; b=GVIEhoPsp9qnIMcj
	p4h8bWoKha/n6pE7F1veaDVm9eV5/2uLnPXuRMnZkEzkHkznJubOo6+Z+nvHWzG/
	Gndp+elVQJ5S9UXBkXSel58DiZ0eVgWNJbnXouaVLST/lfYdrKCH3qOmvyJhhj8+
	K5AKNlWENCA0x09nd2HKb091TPhdGjB/YBUQErxGlT2ZPCCJA1oXUTLlJcbNL4Nr
	Nq7SRPPSts9s303NaAvD9FQ0FUILtr6p+WZReoKVBcjy0Yg2nKNda00zozux0kHL
	iqmzKD1kEP9rXOKFFpqlJeF/bfwPgR1jnJ8pwi7ntf/FP04TM5/UGiFoTocSGZSv
	ermIjA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 408w0rc8jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 13:14:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46ADEvhF020617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 13:14:57 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 06:14:51 -0700
Message-ID: <2ab60446-7187-43c9-893b-68cac8c9b96f@quicinc.com>
Date: Wed, 10 Jul 2024 21:14:49 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2
 two-phase MIPI CSI-2 DPHY init
To: Krzysztof Kozlowski <krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-9-quic_depengs@quicinc.com>
 <e1b298df-05da-4881-a628-149a8a625544@kernel.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <e1b298df-05da-4881-a628-149a8a625544@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gvrLUFD4Czg5RT3Ve2NcwOzvn-dSwMuv
X-Proofpoint-GUID: gvrLUFD4Czg5RT3Ve2NcwOzvn-dSwMuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_08,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100092



On 7/10/2024 7:09 PM, Krzysztof Kozlowski wrote:
> On 09/07/2024 18:06, Depeng Shao wrote:
>> Add a PHY configuration sequence for the SM8550 which uses a Qualcomm
>> Gen 2 version 1.2 CSI-2 PHY.
>>
>> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
>> mode. This configuration supports two-phase D-PHY mode.
>>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
>>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 105 ++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index 1219a25ec55b..b6d5a27b94a6 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -324,6 +324,111 @@ csiphy_lane_regs lane_regs_sm8250[] = {
>>   	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   };
>>   
>> +/* GEN2 1.2 2PH */
>> +static const struct
>> +csiphy_lane_regs lane_regs_sm8550[] = {
> 
> This should sparkle warnings.
> 
> There is no user of it. You must organize your patches in logical junks.
> Adding piece of structure without users is not a logical chunk.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Sure, will move this patch to "media: qcom: camss: Add sm8550 support",
It is used in below code.

> +	case CAMSS_8550:
> +		regs->lane_regs = &lane_regs_sm8550[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> +		regs->offset = 0x1000;
> +		break;
>  	default:

Thanks,
Depeng


