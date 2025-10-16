Return-Path: <linux-media+bounces-44645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B0BE1350
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 03:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5377219A429F
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 01:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520721F03FB;
	Thu, 16 Oct 2025 01:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hd8BpW63"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1856D13C8EA
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 01:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760579867; cv=none; b=tuvHS3KAQHqioVNxn9X1HiexI4tVpsbq+U1mvAa9lOalCWtFzTCkOGvYE96We9N1hyH8aZr2BDgwhlWYPFPrkZ8Uw5wsrbn4ivPMg2Glf54rFRTrNf3MShNXSXy8TZBMaRr7L5AlED11gu6/j06x1PodtxJaEM5HFhpeKRhDtYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760579867; c=relaxed/simple;
	bh=IlqfZYOkclJozio66DYG7OYgRXYQlBuKL8VU6g3WR5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPr3CWrroUxVnmN+YNSmdktevv9BUOMkRbfGMFJ2P8rHF0NddwuN/SZNnSiklJX8UHVNYsGyvOSuMVEtgdu6v3wFLcblY/eaQHJnthVI8iavsOKhhbkMeknna5K0ZzIqQbQSqVVNXHxJ7wlIEabKWuXQZTLjF9pk7g2nEJOAuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hd8BpW63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FIaL6U005001
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 01:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFKFkzfdP4tXFi/0ymgZNK4f9HBW4SXK15XqkMQS4eg=; b=Hd8BpW63ejTcRndk
	ioLHaXxOS69bC50fLat0MRB4ixQS80B43f6oTy2U43UJD4G/Vu1+gKLNRe4qzteP
	zu9sp8LdFQlVH/2PddvqoIbLD12IphHiLeZsB81fXDSNNyS1sN+OGRwbz8k6gD8W
	gQP/VnOsmH3IUdvOLXT4AxDgFoFnERYJqWgf4B/vN9+fBgk8ikzCD4lCiSf5uK2A
	TG70lVtpBoBNjtSJJgY0l7JwRbO40/DvSKLyEA2faBv4bsx/NeKYavAP/US+jr2z
	UyA4mE98TZUXKD0Qp6j1TBCMFBK+si1WjVAAWTy+gvQ7plOWGwTt+tnQy8rw2tg0
	4lulvw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwrv7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 01:57:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6a2459e80dso159548a12.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 18:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760579864; x=1761184664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFKFkzfdP4tXFi/0ymgZNK4f9HBW4SXK15XqkMQS4eg=;
        b=I+Y+Un1EP1FEEcn5zXqgKwVcyHE80kfTYujYyfogrTlCRAd0skPk+42fOFJj697TIY
         R5XjFc8t5yQXyEHD5ZtPXw7aXCYKhkiqJbZiXM6zi88g499AFlU0vJ2t7OsNvzUiH/gN
         b4SEu4TGobhjkGhOhgA1zonNFkrPqO+rcXtmHqFtTs4ypymniFXaX5xAeCAz5dSE5vh5
         9vlrDPFvcfqDOF8kMCJiceyMO6ozw/nF/9CPQTy8uFfZsZA2oyei74DtynII4+gRhK4O
         tZCWCpV+nXv7SGGDNRvLl0FJFRtpUJYdOygsrDuBstGdRFWah/1K2Va/kmTNLnWSXJcH
         S4LA==
X-Forwarded-Encrypted: i=1; AJvYcCVxRbS0m2Fkb6lxl6I8Hu4tFtAr6a+HcVqq2m7hve+HRxKNcLziYsB1K0KaqWqK3spVC/Rw7v62oJbM/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/CfGxDEzst86tS3lJf0gArb9TOdHCXnPI0nnEsqbWqKJeKJ1
	nfxcbbFAEvNer+RU/OUoBmkxL38aWfRJkjiJ1+WkXS3jEMJLYE4haH5tfow1m1OLNhBBGIjsxcX
	tshjhC0PFQ0rgRGhoHaLjXyvWacqSuJ27cIMB8ZLjs6cULeJuQayGnHF7uS4QjHUTkg2fDmSDyk
	jtmO0=
X-Gm-Gg: ASbGncv7BEE0a17t8o4Tdx0raBZunBZiJtsxThasflj5+QYwoNW8+G95Bp6Q3iE0+Vx
	vQrEameN87fVjX+F0YCDfxQHVWGioia5O1nqgxyvGna2Zl+8VMz05fm5Pry5B/O7o++LEJ1fYji
	DI5PC81ESW3u/7OWD9E4way7Hn7SF0qcRQbBXktRTHLT94YFfr7B9F3EoRqANcgbYTs06cUwjTi
	barO+n8A2h79p04jp4dKE9GZaxU1CLNk6adcidsFfOX7Tq1k2msw1bLQjFyUUkdE6dWAzYi2KN2
	oThsqbKmtZWOX4E7xHp0BeECmDeBuFhxh+eNxai81XtB2WJ7pnYjXorhnG7G6ALfbkq+aPMy9cR
	KpV3bHfi+FT98MvaRqOExTv5CYF32Fx85Tik15rXxXhevMOGctI1qBMwrjd1P7B1NlqcNKg==
X-Received: by 2002:a17:903:24f:b0:279:373b:407f with SMTP id d9443c01a7336-290918cbe15mr26360905ad.5.1760579864409;
        Wed, 15 Oct 2025 18:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnvLDZlV6wBkfvT/qOi99EG5lDHNY9fLIFApqLJJBI0OqJ12Q8JQrRLN+J+RuPFy68M+KAyg==
X-Received: by 2002:a17:903:24f:b0:279:373b:407f with SMTP id d9443c01a7336-290918cbe15mr26360465ad.5.1760579863918;
        Wed, 15 Oct 2025 18:57:43 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aa32c4sm10285605ad.79.2025.10.15.18.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 18:57:43 -0700 (PDT)
Message-ID: <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 09:56:05 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
 <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXyfuqwfdf33+c
 IinyYpHZ5zIfGdt0UvICJO4kxzgMRZN2VAt93MTpMEKRaUc89NEGwWB48/vas0DVJNSQI8G88q8
 bndBQ/Pl2ScYGP81K4d5QMiDiekyJgiW+j5mD4ineSLuPAWc4jze9mUvOtnDzOEdfAe19NqzjHG
 2H+6TZq3PWf+SUmF6hElHsNcY+xexkDVgPQuj0oJSIexvD2nX05YRzZd+WRgVSKhF4o7jlu4dXy
 +L41x/LQ6sPPC8pWk+GKvHQq/cLTOWgct8ZeLSYUdMUDI0KNWQLHR0zAOoQBDyQIlM2oCtvgssD
 n5+s2JG6S11XrBp/90nYl4FqqGY/OhHbiLCODJX32EEORm4gdUW26Eg8k1H2VXEDpcOhNfwjs3c
 HOrcrbUxxLngLHjpr3ZGbkgKy57YrA==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f05119 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QmC_9Nfu3_VqyKKViBAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: H3vJTKvqBh8ZGPFFfmHbhw5NlkNf96Ga
X-Proofpoint-ORIG-GUID: H3vJTKvqBh8ZGPFFfmHbhw5NlkNf96Ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:

> On 10/15/25 05:56, Hangxiang Ma wrote:
>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>> aggregated into 'qcom,qcm2290-cci' node.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml 
>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index 9bc99d736343..0140c423f6f4 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -25,6 +25,7 @@ properties:
>>         - items:
>>             - enum:
>> +              - qcom,kaanapali-cci
>>                 - qcom,qcm2290-cci
>>                 - qcom,sa8775p-cci
>>                 - qcom,sc7280-cci
>> @@ -128,6 +129,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,kaanapali-cci
>>                 - qcom,qcm2290-cci
>>       then:
>>         properties:
>> @@ -136,7 +138,9 @@ allOf:
>>             maxItems: 2
>>           clock-names:
>>             items:
>> -            - const: ahb
>> +            - enum:
>> +                - ahb
>> +                - cam_top_ahb
> 
> Why is not to give the clock "ahb" name like on QCM2290?
> 
> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
> and name "ahb" is good for both, I believe.
> 
>>               - const: cci
>>     - if:
>>
> 

On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC 
clock domain doesn't manage the AHB clock but CAMCC does. I think it's 
better to create a new and more complete clock name to denote the 
differences between them.

---
Hangxiang

