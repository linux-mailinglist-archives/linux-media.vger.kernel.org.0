Return-Path: <linux-media+bounces-35113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE8FADDC22
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 21:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA59402414
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 19:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7449728AAEE;
	Tue, 17 Jun 2025 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJidAwEP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360752571DD
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188036; cv=none; b=FV7vaRXayXB6q85OAvd1Rtzw+rFCxMV6tNXBQdqxZKslY3vp5HryWY3nXG0iqzB7SCY22n9PCBkrHdyZFbzBxZVxNsUVo5kos+NHsmjIjoeqv/JQpDPjIfMth+7W8gPZsiTHfF7iIjHNANb3lA/6tfpi9lFbfuK2z///WybpMgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188036; c=relaxed/simple;
	bh=7ZxuX5qNH/g7aYt9vwHTYrn1wT+rYHgFlMjsAb+VBQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhyJpkVMgE94/SJJm7kHUAiXjFAOngyGXU5k4/GCF4ec6UaLBuCwB4DZVORJUk3Y1KWBt/O/fl+7GroI0P2y6ug1f9a7/PsH8GBtR2JGy2fIva7sRzI9VH0+ifB2/AmqLLqfRJTmwK7ncHxmbXvojSKdAdNuY+ERotKUKXG0RFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJidAwEP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEddF2030300
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 19:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+uy4aSZAA+0y4I7Dl8zbOucbgS77E3xujWHGvUgk7Q=; b=TJidAwEPidk0NAbU
	DFCYPDHsTpExJf0tdyyFN8Ys6W5xErXtJtwP0GdXla7aLRmsJ+VKE0ozUruyYHjb
	aGbyu5eSXFZTpSotQxp370XyHPKqf6Um4DNaI0QaypIyuDD/IsJMss53wGstcoE9
	z2WKmwPWWH/4ZVZ0r3uouTBCzhvZjrD3vbbOIbNjLbWI4VgNM8pZjJ2/hx/pzWuo
	75CHcj+ZfZ74NpeAGjMdbaoMUWsHEk/e98kr+CAccRs28T2EPw4mSSNAVCqpfjLX
	39/m3ousyfVBX7N/xYqdaUwTfS1rvl+r4XvEh5iFRn3tIvbPxD6KoCaF3SXtCrRq
	gRqWXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enhf0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 19:20:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0976a24ceso203439485a.2
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 12:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188033; x=1750792833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+uy4aSZAA+0y4I7Dl8zbOucbgS77E3xujWHGvUgk7Q=;
        b=FHSXpRaHHvnO2olj5DdqgTqd0lg2C+FQ4OeB9yEky7ZTQftXKB7k8Vjt4uecOPBfH2
         U12L8Y+BTQlvTXSzBfwEl0QI8p5HFmigrAGEO6qJxb+S33ZaLYCRp2mKfNrVMbQiP0nB
         lAzQAWQ1rkATwhPgiVdpUIEVH3ZsB4COBXhdfOPxY1zeTQeoazJDQ7BrPvQoZux0Q8WB
         5aYvkP0u756d3fF7DI02FPM5iKGxxqe89XsBPtUHMbFH5VFTdhKGxwnMh/cgSisiK5RZ
         IFDrvoP1JAWshY39kbjS/EBo6naRI7SBTdpNU5iPcYgcXYqmOkZ5RF8tMYzDSYiJWIGW
         BNKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnmqWTX9dMDIgsGlBTd3e6xY6Wt676hXIbGXOBa2tbCP1UQVTqms3t65it814c3ELSOVt8HSWEZwXthw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqOOFMm5daerXtpLbAOMqKEa6/3Jda3nsZgqW1dKw0N0n0GtPo
	KdYvdegpo+dWrv3fyGFdna/FU++HMx5w6M9KVmy9aVBqb4OCvP+CgXc+8J+ff7gObwD/zZFkzgg
	VfnG+ujmDw3OTkWtsO4nsPwxuSyTx3H/sHa+LwZ8A//1HL0/Smyj6cTwpL45xvEEo5Q==
X-Gm-Gg: ASbGncu8FFK5MDGtjSYDej5ll0AtvBdxFBbsxPxKqGAjQ1WKFjhKfpbeSTfHTOIBb3I
	BAufGkiHz9NMr1ER07yVbd37u7ZHTDstG0AmKLiNdstV/FQATkeoQ9mR78Tb3ns1qgAfQOlU3dV
	6a12/ks50mdV37dRmUdbXg6JelKqaodrI7PwYCfD15PwQJ7CiV4AGLWN6V8Bqufgfs+H788ouRY
	rcG2j5Yq8cRHENkfhcREuwmQ+VTTO8bL9xlVMmgItuY+xmrKDsBnSuZ72/Vm0Pr3HC6brCJmhTT
	FJ3EKYfxnqT6v1BlBbiQCJWOK8iGExlaJajo3dy6egMhUwQBNPTs/vP3QnmRXrpvA5dHea0kW/7
	ivyw=
X-Received: by 2002:a05:622a:1991:b0:475:820:9f6f with SMTP id d75a77b69052e-4a73c5f40c7mr83359291cf.9.1750188032852;
        Tue, 17 Jun 2025 12:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE56rx7QKGhve9dr+onwzo1W0p7twcfmKBnjkPfzZsI/+eXaqjKebmbfZD6IJVOwX8voyrpbA==
X-Received: by 2002:a05:622a:1991:b0:475:820:9f6f with SMTP id d75a77b69052e-4a73c5f40c7mr83359051cf.9.1750188032339;
        Tue, 17 Jun 2025 12:20:32 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae01623f2a7sm36025666b.170.2025.06.17.12.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:20:31 -0700 (PDT)
Message-ID: <1fba505c-bd01-4d36-9efe-17172e11fb1a@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 21:20:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e9afdd0f-7842-4780-9044-d5afa6a09d7f@linaro.org>
 <b96f9cca-cdd4-4456-8ced-f4a8fd810ff1@kernel.org>
 <9e383935-a10c-40ec-a63a-243cd028374e@oss.qualcomm.com>
 <4f7225ee-fbb4-472e-8e14-a98f4cef9fc3@kernel.org>
 <83769dc1-9000-4074-bba2-d1bd465b77a2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <83769dc1-9000-4074-bba2-d1bd465b77a2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xoKVOFsGN0AMaBugLF6l7Wx-FXiLsW14
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=6851c001 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=wbO4eoeOqdvOmasGwY4A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xoKVOFsGN0AMaBugLF6l7Wx-FXiLsW14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1NSBTYWx0ZWRfX64NlSz7jQCCK
 ZAcx1uX9pC0JWmsXvTvhIXsdm0/zGg671o40/dG2PxCgxvnViPIb5yf+L6A7BryRhhwWf5cGlwR
 4JWojHeAPSpEIiyjHfu1wi5S7gRZU/XgTBF2uOUVcsGbyig5lN+7LbbRBvZWNFF3dZfOtaUrv6x
 zfnC0fbeM9rrU9YLdp1a5Jn1Ks3M4d54VjRzyGClsyBsXkpmHWVsoVV6yH3WEJlEW7ax14b49+W
 GtA7vu6UtYbhLk0wAzlCdFNQmXdX96n2FYebKsJPCR+05GiONzK/s9TcbW9TvR14IRAvS/aJSk5
 9r6QTWUnCMumS7hUPlPRk0CU3jbywQZwfD/BrA62Blrm/I93hZ/mQtXAz62bN/HIrC07jCFKKxu
 uMJ0JHb5/A+mRQPVoBzOJw2c6lQKJtmukAHdrMhmpqzJdgcnD0kfpL+0VTDt/5py5P0bKjzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=889 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170155

On 6/17/25 11:51 AM, Vladimir Zapolskiy wrote:
> On 6/17/25 09:32, Krzysztof Kozlowski wrote:
>> On 14/06/2025 21:31, Konrad Dybcio wrote:
>>> On 6/13/25 8:28 AM, Krzysztof Kozlowski wrote:
>>>> On 12/06/2025 19:13, Vladimir Zapolskiy wrote:
>>>>> On 6/12/25 10:38, Krzysztof Kozlowski wrote:
>>>>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>>>>
>>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>>> ---

[...]


>>> I don't have the docs before my eyes right now, but I would not be
>>> surprised if it's also called "csiphy" in there..
>>
>> Let's check that first.
> 
> Here only someone with the access to the specs can help, when I rely
> on downstream code, and it says the right clock name here is 'csiphy'.

Unfortunately, I can't find anything more descriptive than that.

Konrad

