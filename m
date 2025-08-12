Return-Path: <linux-media+bounces-39525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C065FB22007
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 615F6188D8BA
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD66F2E0B55;
	Tue, 12 Aug 2025 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kli0Bg4i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89D82D838F;
	Tue, 12 Aug 2025 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985291; cv=none; b=jDM07rnATqJc+k1pwBccxhnV7sx95RjUtNw5r6WkRgOFiC1Qyf03238muNVVuIE3s68NkFqndaCW3Q/pQJhHXGaNrD7l+seLdVZQYeWUW3AusrhpwASvNDcUJFHGiJ5Nfse+sXKc6R154nikiJq4NyukS2qHfUwxghfzCbaKDhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985291; c=relaxed/simple;
	bh=EWPWYnWnHYNW1g5JfQN/w40C+sjy6Y24SNdmuDQ0iic=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=u7Bj+Ea5RMwktYxvq6qk/F8Kt/TW0ccAXMeGzLEfh681Fiqmul3E8yR5sicCgfHJRug3BlEhkdnUvHploPYH8Nv69XJK1BErf9Qif1yfUCTsRp+ailLMB6wQWjiLZPdT0OaOF5riWLVZoPMDkqd8j9nJiiIk8EBvp6015m3I574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kli0Bg4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4siQK013175;
	Tue, 12 Aug 2025 07:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BImLLIYXXRXdi8dtPDwTFksWlfP73Z4KuiGBXSwH71w=; b=kli0Bg4iuk+ncJJn
	zsInfJidnM4B6tbpDDD8osV7CnoI6ZU2cOTzJrt/Puu2r8+NmuwOld9IZd7SeYc1
	tJ0aWCng73qwBbB80iACMTgRcd+soj0UC4PxgGwchbCP4mTyiYCU214mDjitqPCL
	gYnbmrETBQQpz31uavtrOI+1QsbdT/sS3krEc8ORYR+UDEMKYyMJovgdHUKb21fV
	ePQofWGGZFVb3xuMFCQ5MkkWF3gIfi0vdLrPnSKY2ehDewtdBIRMCFQ31isgwlfV
	MLYp7hrFqoed4xkVNKngam/otIE+D1U93Ctw7l6ZX14Ka9J2U7XA5aeg+T0c83MO
	w+WMjQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmqe21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 07:54:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C7sebb008998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 07:54:40 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 00:54:36 -0700
Message-ID: <683024c7-3740-cb9a-6924-33816edd63f3@quicinc.com>
Date: Tue, 12 Aug 2025 13:24:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689af341 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=ueHH_9SqZEcs-A8xbiIA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: chaJrTlKVHfHcWcPQ_sIa7aBv7myAUVJ
X-Proofpoint-ORIG-GUID: chaJrTlKVHfHcWcPQ_sIa7aBv7myAUVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfXyv09ztrw/mP6
 zT6N3HPupRvrmbvcx+5UlcDYTfAZBysTNu1NTw6Tj90PLvzdkXkQWVgrU+zUm35B8bjjwQnCLKd
 h+uUfo4uzpSZ9H9zQpU9OLT38t+u5dRbMYSjV2haQWi4wiOPO8ZZBxzU41QAM20TukZaP4uLoHw
 86D5QB7Ce3/SDwRplJYdYabWoYGXQJX3cpZiEKJa7YNQ0rDj8QLV4GLaWofhrsAI4p3LNRALS4v
 gxFS3etjl6jmTlkFgxpV8k5EsLVw1ZlDXI86SdDubv39KucM4zGqi7FoD9y36TwKGglu01FTugq
 qV+eY+trlFfN6FVNqTdINzZCtFZ6LOzRGpFcqZxwh8tYmTaiWNv6nZULwM0aAkxu96d3c4lRwsX
 UXNvB3qb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000



On 8/4/2025 7:07 PM, Krzysztof Kozlowski wrote:
> Add binding for Qualcom SM8750 Iris video codec, which comes with
> significantly different powering up sequence than previous SM8650, thus
> different clocks and resets.  For consistency keep existing clock and
> clock-names naming, so the list shares common part.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++++
>  1 file changed, 186 insertions(+)
> 

Query:
Can the additional reset and clocks be accommodated in existing 8550-iris
binding by extending it conditionally for SM8750 similar to what was done
for SM8650 [1].

[1]:
https://lore.kernel.org/linux-media/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/

Thanks,
Dikshita

