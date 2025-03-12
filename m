Return-Path: <linux-media+bounces-28087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DBA5DD28
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 13:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BACA189B14F
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 12:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50C9244E8C;
	Wed, 12 Mar 2025 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I2k8J8Dr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3F27083C;
	Wed, 12 Mar 2025 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741784161; cv=none; b=c8qa8z0uIdOCU09AlRylCZwj8+1sikHaEBuOOfQb9PKnguoOm48kH/ZRy1PzCkd+pw6OZQWXmBNNu9tnmw4Do+NpHaOmm/3SvGhC4OjsefzaJvDdU72z+vh5QDdBEam+YQNGqV3pWFrT4YcLfG6L/qQd65knW6uqMKinyplgdOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741784161; c=relaxed/simple;
	bh=cXKHm/RurkmSioL7RFlQcp51mjKyU/pOdfMXfLFR+ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qDcRSKnnBcDITw0foje3b2e6Xghj0dQ4qTK8TdTV/sDA8Ci7vrNdM8bh3Kaj8GCDQf2VKBtrvo76mTGk1LOpOQ6cyhoxRLGiw+P0a+t+Un+e7GUwfKLcTnRgvZUUrhsagZpFBQiBc3cArc3eYlQd2jPkwPn1F6/tQv0Mssrwh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I2k8J8Dr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CBDE05003523;
	Wed, 12 Mar 2025 12:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wx1Oq22ysa/s2ub9FhQ5ef7c03DnunFXLTLLRls0YU8=; b=I2k8J8DrzpljLjV9
	/+p0KFsiWgFpDeI/4WLv04KF7MxpFBznZORi91+jjKSZGbrlWTcy9mKcqFNA7o/7
	2Vdngkg6KU8wdK9wb6RYBJO+Y5yxD4LYQH/QhqRzKJaueoSqc/AipLWNu1H2L+L1
	LvnSm0e9TQRI02htxGsN2V+JWUjhK/CvH3+Q8IY+N+8FfZUW6s777UGiSNNO5v0l
	09yu/mIcpv5NpZq6qgSQldFdix+kbmj5lh817Ga/gNzAUNgrfGqLMtL4J+ZAazWq
	eNrGOMR/LUTMM+FjwnO7yTNl0exBX/pbrcWvW9s8n30yBu1qrm3qy8OMcd8l8+MC
	OuM+jA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96y88sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 12:55:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52CCtu0n021430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 12:55:56 GMT
Received: from [10.216.38.182] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 05:55:51 -0700
Message-ID: <c6e601d1-28ff-2a24-0b98-e79006bd7a8e@quicinc.com>
Date: Wed, 12 Mar 2025 18:25:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
 <607f842d-07b5-4c1f-ad26-0fd34e6e605b@kernel.org>
 <40d1a27e-aee9-bd68-a82b-a51ef8ccde05@quicinc.com>
 <85bd865b-71e7-40e1-9303-e970d338cb59@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <85bd865b-71e7-40e1-9303-e970d338cb59@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zeJWEIDs-dwcmYmAOJQehBnhTFz7VNsd
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d1845c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=QJSAq4TcFel--fmAFxcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zeJWEIDs-dwcmYmAOJQehBnhTFz7VNsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=752
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120090


On 3/12/2025 2:14 PM, Krzysztof Kozlowski wrote:
> On 11/03/2025 18:47, Vikash Garodia wrote:
>>
>> On 3/11/2025 11:03 PM, Krzysztof Kozlowski wrote:
>>> On 11/03/2025 13:03, Vikash Garodia wrote:
>>>> Not all platforms has a collapsible mx, so use the more generic naming
>>>> of mx in the binding.
>>>>
>>>
>>> No, neither tested, nor justified. Read the file. How many platforms do
>>> you have there? One. Out of this one platform you claim not all of them
>>> have MX collapsible, so you want MX?
>> Let say we have one which is non-collapsible, what should be the way in that
>> case to use the bindings which differ only in the MX/MXC part ?
> 
> 
> I don't care about imaginary things. Send patches for real hardware. How
> does collapsibility of the domain change the real hardware interface?
It does not. I am now thinking to drop this patch altogether, and continue to
use MXC as defined in bindings, irrespective of connection to hardware as MX or
MXC. For ex SM8550/SA8775P have MXC, while QCS8300 have MX, but again, as you
mentioned, these difference just alters some property in DT, binding can remain
same.
Regards,
Vikash

