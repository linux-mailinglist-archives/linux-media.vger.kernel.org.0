Return-Path: <linux-media+bounces-34246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B5AD0256
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 014383ADFED
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BE8288C15;
	Fri,  6 Jun 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S0EKknag"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509462356B9;
	Fri,  6 Jun 2025 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213476; cv=none; b=g5V39bnOhFlZwwanGoERZxJ5VMxfTQR9eQ9+Qy6FNwQcNzhaztyexgPmkfgTvjNbM82WHZ/ff5Lfs7fqC3JP5FC/5ieYd7t40sJuFNcwu0QTxxzsQohCDaPe0AeDbuN1G09fBOi9WxSzrYH28ZnYm3jSDrBu3zXngkyeiAIDvCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213476; c=relaxed/simple;
	bh=8BFKlrQ68QjCmbx5xh4/w0cPsnqeWqA5EfLScv6WkrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JSQ5UJBmEIiVoSsuTP8dzHUEiScy5daZ9NmpPNawLf6NS/X6rXMm8p6/oOj3Zi2e1gGc7GL4dne4xv1xJw1D1nEGaZH1gOvbIk16ScPAr6Ju/mTfIj4ToHiIC9RCGSEcddFIzmj6MNtogZgz6FaSUDVvfg17+6h7aFlGNj4U3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S0EKknag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55663pHt000708;
	Fri, 6 Jun 2025 12:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1oODGAliAr0P1Y/Ntrn/PvuZ7jpTdNekDsWec4XKAP8=; b=S0EKknagQ6PJY13L
	1Dblb5hcsqx0Y0zinF0lLNDlVzglwIOrAFdqoOkZE/dJAu3+xEjEmJf0vHbigkhP
	dOG0Xo5F4MwngHeBnEV+J4rzo9DbNl3Fdh27aNblB0/y/aJRftc/T8FiAuw3trKQ
	1qZfAd6GxNoV8b36QtZyk+xzlbYc6f3s53qROSKRIx8NMyIVuSOmZS3kt/uW5HfX
	WDlZ5XHdUVHQJxmf4VPaqV2zJEQGIR+qqUpQLOEucrBfjPzFuRNVsK4b0Q/sU2aJ
	VosKVxVvRQc0Zsd1b4YnDy9frmBPIvmH8NBGJjCjJvog1tiRkJ9ocd6GKXATaaAr
	IJxsfg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qcmek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 12:37:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556Cbnue000632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 12:37:49 GMT
Received: from [10.253.79.143] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 05:37:45 -0700
Message-ID: <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
Date: Fri, 6 Jun 2025 20:37:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MJCRs-B1rtwWlJNjGneRRIOua0tJXyig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExMyBTYWx0ZWRfXx/9a70jTHg0Q
 iKpMhz+m7Or5xEi5C4FX7Q81Qh484u9YwJ2YiM/z3qBTKAlRqlespbvR/LfvPZOipkjlADsJ7mk
 q/Rq/K1lxxs1lQTdc779GnV8zdmBtD471Gwg9qnaw+IBIt+sWTZlgQzNFvVVlIO9dT7KRqTGxkh
 00rlvFNvdriHYd8mbHd5v10pG2Pbld5LcH0dg7jjKX/+3G/B+8ZwDNGuCJ7X/YldlIyx3/jxQ2L
 xzd26xcxV7OzOW6jS6wVOGy/wBv2J1RP2XeMnl0pJqEOrN2cSkV7PHrFine5agUlZFw52sZD0/m
 3sKYR7vEMHNx1yppPEKt9sRuqdiN8GcJDlumuiUzgsPyQXAa2UKcx/V6hwArb12ubGM6tVRxO1u
 cqEOZmAgRCF7gqBZxHXwTTg+OhQw7V0ZgNdRPE4/ATgXfIV1CDCGkt/n2WpCJeU4sBDde3Hf
X-Proofpoint-ORIG-GUID: MJCRs-B1rtwWlJNjGneRRIOua0tJXyig
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=6842e11e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=OeXMNpvLbdQpr1KLWfoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=530 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060113


On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>
>>>> Note:
>>>> This series consist of DT patches and a venus driver patch. The patch
>>>> 1/3, which is venus driver patch, can be picked independently without
>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>> DT patches, still depend on [1].
>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video 
>>> core
>>> on QCS615 over(?)clocked.
>> Agree, so we need to make sure that the driver patch is not picked 
>> after the DT patch.
>
> This statement is confusing.
>
> 1/3 states that there will be a fallback if there is no OPP table 
> present.
>
> Giving the code a glance, I believe that is so, freq_table should be 
> used if there is no OPP specified in the DT.
>
> I think we are having a hard time here understanding what you are saying.
>
> My understanding:
>
> - venus modification is standalone 1/3
>   Qcs615 will fallback if no OPP is present
>
> - dt modification 2/3 3/3 is therefore also independent of driver
>
> ---
> bod
yes, let me re-spin this with driver patch alone. Once that gets in, 
will bring in the DT patches.

-- 
Best Regards,
Renjiang


