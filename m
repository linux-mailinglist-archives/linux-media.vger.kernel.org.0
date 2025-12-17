Return-Path: <linux-media+bounces-48993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C2CC8601
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 16:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 460A230DA446
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 15:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E09936C0AC;
	Wed, 17 Dec 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I+Kp8n3x"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48623366DD2;
	Wed, 17 Dec 2025 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981136; cv=none; b=U7usdaFExDolwRNkn1hhT9QDTcpphZlR3AT52AxkDAhWU3667QZLy+eOSvVOcyHitfso7V0jtn42Ei6Pv3EaRlFIEZWYwce6mpBkK0vGkcl98k2q5sjdrvdIuhu4xjoulOi7AVZeI+oY+ig52lCGd5UVcfE15jcImPP7boOadWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981136; c=relaxed/simple;
	bh=nug95VBEuouuoZSFAoR1GSeUxAZLidVlMxuEvGqtND4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=BJQC6Txc/z/CFwa136ciahb98b5fjQR6Ef9iLCsIDAJl7gXBoPjFCQICKGdIY8uHK7fUtpn1vGElBlff/6l0d+ml/N2eIxpFpeNP6jPE8Wi5MFqhLIg6MexgziW/L/oyWD0kgiG6bWe1qgoFY00ixuOPxNWukSQ0n28y1piiZjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I+Kp8n3x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKqEc2390544;
	Wed, 17 Dec 2025 14:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXkjmaeJXhi313Y9q+FKwmvBFYzW11FHKjbzhm/D7OU=; b=I+Kp8n3xtrgX6eht
	6vVsAF3YTjZ0RfPav+zJ81DoTojpKWItH8zM0c8T2zjP/lEklF4+R/guB+CAdvs8
	LEefTsR3T7l2J3oivi1OROO2s+SZKd5+d/CuSnFYiCOEb47UdKdOlT8U2PwEnntq
	A+Tft+tAJy0fuu0H6IjHgOQcT70tLEkWctXAwSSdTlbtDD+jvW7y1ZzmloMdCHcm
	FwLA8PKor/E8NrBkxBbqPJMIunuJu1B9ffPeaUBT7INeSTk+o/D9hXd1ZrGxtGHP
	xf93sOktsDZA6ddqcjhBEgYHfR7IQ4nEw5EcPmeXeVDGxiDBDqkAd2KXAVt/xSct
	QXBNQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g3ht5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 14:18:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BHEIfOP011359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 14:18:41 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 06:18:36 -0800
Message-ID: <2e14bc60-8cfb-4710-bcfb-d2cef8f370b6@quicinc.com>
Date: Wed, 17 Dec 2025 19:48:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD
 regulators
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-5-quic_nihalkum@quicinc.com>
 <19bf8b37-4b40-4825-a8be-a94139389c69@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <19bf8b37-4b40-4825-a8be-a94139389c69@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8Ktjcy-lhBAmmHEQw9iDdF62WUaCmsOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMSBTYWx0ZWRfXz1QIF5DyeCpT
 LXa8n09uF922YM3lCDy52vewDoE6hhfAtJaH/fglPc81TprIm8cp6o2CXyR8CVvRgZcz25NVKgn
 TbIjhKkY/QbrzOMWmauP9DL8CmN1f2WcBBc2dDLAwNma+fbklLtxPlM4wwQmN5wqm2Mheb4yiO6
 ylu5T/aUdV15e2atpqlZAY2eXETbrSIPuPMOXr1dM81kmXtMGeYwfu357/xLBCBB9dvdsHzx7Wm
 N2LBhVbSEN0dAWsWzoKBHCJCE54L4b32NwYuTiHGj51Gp+7ScutIdHpm/mjWe9w37O/+ho+m+oz
 fB/q2MveplKDe8k2Sd3VrJqvYDZ3FPXXtClWqjzldlqlh+5eqJ01E2to0zTVzkEauYkuhC0n61p
 L5TO+tVq+KqNq7x1taHDku4BlqD+Tg==
X-Proofpoint-GUID: 8Ktjcy-lhBAmmHEQw9iDdF62WUaCmsOU
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=6942bbc3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fuV65yvZV9PlKjkSEkoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170111



On 17-12-2025 16:44, Konrad Dybcio wrote:
>> +		bias-disable;
>> +	};
> All other entries in this scope are sorted wrt the pin index..
> Please take care of that and add my
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
>> +
ACK, Will address this in the next version.

-- 
Regards,
Nihal Kumar Gupta


