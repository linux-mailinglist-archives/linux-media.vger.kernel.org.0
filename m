Return-Path: <linux-media+bounces-30962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A1A9B8CB
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 22:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB0299A38A0
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 20:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF761FE46D;
	Thu, 24 Apr 2025 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMsspUme"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFF1F4631
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525323; cv=none; b=kNc9vVkpC6tL8MGBGlQ9Q1CQrXfhHMH8vOlBS82scMzeqqS7rV0q2Noe9kJ8nuI3tAfyUlaFAtDwyQ3JSZ+do52aOsdhqu2NpZafLNyeZoSh8JZwhUsPQBSgiI05f2juT9RTmhSBJcQX+2Smew6OoSpqsmO0ZgeOYggss7vx3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525323; c=relaxed/simple;
	bh=V3f6aXPJbQijd6ipBPnSJT6DHy2KjZMx3Pjb2cb1lhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLBteDoBlnDF5xKXK7mVfxjr2VE9/hwlScjMC460Y2dtaoRxiGQr6CRRLE5QOKCdmrPPZFJVVxxiM6xzb6Ia/X02nLQsWkTJuLex74ahPpzqgbKJlp0BzpoWdH5//UG/hfEldyEelaYaTv4NHBEpsDNj7CgcJPOtUiQGoQjS9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMsspUme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmiWG025479
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 20:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9NkZBB78ocYZoBuxIUW+E3P4tAq4xlMh9aXpLYJZmU=; b=AMsspUmeDDTr6fVs
	Zjc0G+CMRC0lqCwsh5MYoS3ndPg/wnpPgW/yQ6tV+H1CNUnOE6gzirWDXz0FSgoz
	fz/AChZ8VmFt5vqzIbNi5QGeLIEp9TBsnHNT9KnDKhxXd+ERhVTRcgSEhpnAkaCZ
	l3JIOVdpdGqZZssYB9IX6NuqWT6pfBKA6b4hNlaBHZnXODmIcEFSmCY1GYbFIccP
	i4VWrbvJhY/GU+K5Go0sA1Wpso9MOdkJyUaFgzTV9NXpV4nB5Y/AFKym9O50tygz
	VouZvcBUoITRLWpgWZUGkqed3vY6g7BKgOqGm98mYss+KpPqYYIvTjblpPgZVTnL
	F3mt3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy6sjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 20:08:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54be4b03aso29158685a.3
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 13:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745525319; x=1746130119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9NkZBB78ocYZoBuxIUW+E3P4tAq4xlMh9aXpLYJZmU=;
        b=VJed4ewKLCH/O6XEUX4vf9T4j5Cy59WrFZJv22R4DWNmeYkQFZsn3wNYBiN7BhIkIp
         OlmmsC1tV4lb75T4W6s1F3l3wjodUUniE6oZNtUXhXdUFqMPRl59E21vxeVw0PjoDPxM
         mKFbCFbZ6S3g7pcGIKasGjJb2qX71WL/1NXKoAnzpA+E/oPrbtE50cB+mKDvepzelKWH
         cisJ0f7bby7Vyy1BT+PnYvPjiQwgee5hxDhjHFH4Xws4xThAX7PdFFuPsUdExiuVpXxL
         vufFCPH2olCvXu14xIu5XM9OHzlKV9DH/hXE0AZOXsItw6+uAY8m2xT+TmWaBrQiMtFT
         wRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsY+mwyrePpkG8Mw3GJz0V62YjXyfPCWqP87zghKsEXEKCchoCW+cMko1lPzR+l1vSA74I4Q5WWJuEMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoIfDopszHG9Xyx7ZhCO2T81v5kS+jepH3/D2XHTkY0c7fXacl
	QpXUwYdTjDzF+Eih6YSUz6qJRxgMQjBldQqJk2HxKwalhp5MHoJjyoCAN2FJFNqkIbGWI6wYqXA
	RpQ2JH2XGyi2o0RAOM3I2AAi9TMpNDGrokMzs+qLiCtaO4viZNXiaedy6nBmiOA==
X-Gm-Gg: ASbGncufi+Hc/6l8AQCbo991X3UfEIB972lRsqzlT0PeA2pR3ROhPk6eQ0gelK1Iim3
	2jrZSOaVzjwXzFZqsU9tZAdHVE7bP0+WqRIYYah5UXHu+4CudyLcX7ggFaIkkJlu/HP1rgcnWdL
	YHd4AOZ3+XY0ab8WPQH/drvT1HWVnSuztzhmzJM4Q1fUKdljjIAbWrc5q7Oa6JzLPdI08VRusAE
	QFu8EWu+AxPL5gtwoQrA0oVJERxPvOARdfHVFRy51T0hTzpuBOMxISwvm16XZoHdZO+1I/kzZcV
	YGqJ2XRWIecycUwuehmvBOlgen2qIiIP98+xLlUtdtTZ99QpvQp8xI8yGQ3C/nnLMbw=
X-Received: by 2002:a05:620a:2952:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7c958375c68mr215663485a.9.1745525319585;
        Thu, 24 Apr 2025 13:08:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMmWKDcjybgaESS6WVurym3NYqKuP+fE4ZJpZgER8xsvh0anBTaORqzLN+6oFTx6wsgHq8Uw==
X-Received: by 2002:a05:620a:2952:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7c958375c68mr215660285a.9.1745525319127;
        Thu, 24 Apr 2025 13:08:39 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c71csm15120766b.4.2025.04.24.13.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:08:38 -0700 (PDT)
Message-ID: <d0958f7e-db81-4e4f-93e5-24ba0cd853fd@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 22:08:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
 <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEzOSBTYWx0ZWRfX1gZqL26jBeTd jse4/4bUMvoI982/i/mOmM+xu35zCJAtMNWALXIsZjeQzhEKNYr1WFO9PplZrf4uMzL0m30pDNZ Fe8XZUgt9i4DAbAKWnMdLe+7OZ6UoufRlPlv3iE9qvtVNHj1OmaG905T2CCjo2K7921LBP+30L7
 Z9qu5ZO0tPATm3cAnSU6K7NIVBRLlG21hP15Kt6wsp6LQpSWOT1V73NcfyI6gfJIqH5nEM+0rE6 VHS4stWbB6tE13xegwXsEeF1Rf+QJQL9UJJTv8XwGy3WSLNoczgDPi3TGG7F8Q4Ds2+dQQWFGg+ oB+U2RqeccqkxiEGFctdGy/K79f76HYEpE6ZHgcvjt6t9ADtUepLK8VUJENopqZMrPOEw48kPqz
 +HbOl6vcTIspw5ZaCBqBEO5SKY072+kYlwZ+tcnKtjjcSZcbfLFa3qugPDOPPJizO9GL6JZi
X-Proofpoint-GUID: C9vLabdrEkVU3tdNlyI8nDKt7KRHBjvo
X-Proofpoint-ORIG-GUID: C9vLabdrEkVU3tdNlyI8nDKt7KRHBjvo
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a9a48 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Wno-CeEu7Fx5tZoO0NsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240139

On 4/24/25 6:13 PM, Bryan O'Donoghue wrote:
> On 24/04/2025 16:54, Krzysztof Kozlowski wrote:
>> On 24/04/2025 12:17, Bryan O'Donoghue wrote:
>>> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
>>>> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>>>>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>>>>> +  vdd-csiphy-0p8-supply:
>>>>>> Same comment as other series on the lists - this is wrong name. There
>>>>>> are no pins named like this and all existing bindings use different name.
>>>>>
>>>>> The existing bindings are unfortunately not granular enough.
>>>>>
>>>>> I'll post s series to capture pin-names per the SoC pinout shortly.
>>>> How are the pins/supplies actually called?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> I don't think strictly algning to pin-names is what we want.
>>>
>>> Here are the input pins
>>>
>>> VDD_A_CSI_0_1_1P2
>>> VDD_A_CSI_2_4_1P2
>>> VDD_A_CSI_0_1_0P9
>>> VDD_A_CSI_2_4_0P9
>>>
>>> I think the right way to represent this
>>>
>>> yaml:
>>> csiphy0-1p2-supply
>>> csiphy1-1p2-supply
>>
>> But there is no separate supply for csiphy0 and csiphy1. Such split
>> feels fine if you have separate CSI phy device nodes, which now I wonder
>> - where are they?
>>
>> Best regards,
>> Krzysztof
> 
> The main hardware argument for it is probably these PHYs do live inside of the TITAN_TOP_GDSC power-domain, which is the same collapsible power-domain that all of the other CAMSS components live inside of.
> 
> As I recall we had a four way - albeit long discussion on this in Dublin, you, me, Vlad and Neil and my memory was we would implement multiple rails in the existing CAMSS PHY structure and then look at how to model the PHYs differently in DTS.
> 
> The Test Pattern Generators - TPGs would then also fit into this new model for the PHYs.

Maybe we could consider modeling various camss subdevices as separate DT nodes,
perhaps on some sort of a `camss` simple-pm-bus or something alike

Konrad

