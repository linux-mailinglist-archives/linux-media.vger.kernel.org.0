Return-Path: <linux-media+bounces-34147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EE2ACF515
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 19:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB7F93AD68C
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 17:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A3E4315A;
	Thu,  5 Jun 2025 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdGdIcTf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827A61F4701
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 17:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143637; cv=none; b=qohV4wJawgSvQFKJ9nT+Y7POmCmlEVvGvVD1m/ps4r5bXc3K+BnVVkNaQzYGgvkucSc/2diP52wfthc9m+SS8j6snVOTQt8Qxf7RwD3j44uaUHDULuslAaIMk0hgUbY381lT/+s9ouhqZh2YfYF0MMrZjcImco+hWCxJbHIi0ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143637; c=relaxed/simple;
	bh=G1uMwlSRuCegDgrVIhbc8dLP3y0ky6QBmu4NxfkUt5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6WDy/f1mq9NNa/puAC/qIjCQaY56a9R7xMQR8wZtHELiq47Nm0riBT9Ms8cKs8Wmam+2GaYCzdNfQIf5WYwGFZt61Bps56QBMMxrB8jLW/vvgIPE427B0MXQgwcadR8M9Ok8gGYyLbwF5/6NAyThBM29JTtbVKkzGAd/GRXdJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdGdIcTf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AVfaJ024682
	for <linux-media@vger.kernel.org>; Thu, 5 Jun 2025 17:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiSKdaHMeCVD8oaJKkvTJRlJ3qNDdfdL1Sy3uWHXIrQ=; b=RdGdIcTfvYm7C6K9
	N9ep8x4kyX35n9cuG2Id7gMOYNhIi16ubJmJXMnFijmleiafbpHctsk8w9uRtrP7
	rm9QYFbOfEhcsqCZNKNUutPpCGt5wtnGHJ3LIt5qlyGHmoZz4Ymx2atBZF5r//zS
	nPW8T4iezTgUVonXGu41YJEIyZBqCZR2ds6fuqpsVdNVOFMCtw5fTsuk/kc/zkMh
	MfyZPWGhX12odEM86qbtuypV5ZZLjCEQrBgvswBYL1YA8aJUhO2gPgo0if94gxXf
	VPxEn8eUQxNS+0pbWNY5bHxQMrnWBu1jZg5hG8Vx2phq/W3sNCSm7qJsuszh4KI1
	lAHAkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn04c70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 17:13:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so202005885a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 10:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143633; x=1749748433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiSKdaHMeCVD8oaJKkvTJRlJ3qNDdfdL1Sy3uWHXIrQ=;
        b=nD6a30JLGbup7N79dUcnIJkxo0S898pg/tw1Zd8UoPlNUGAtBcM6EqCf+h25UMRcHi
         s6OxyVk/p59rNRB7Tc4lyIVnRs31U62NmnttWTYsRHs8/6aDEh4ZTh2EGZdHWSU1pNLN
         sI2eRin4S0EHZHkmGArbXOgZyWv5I9IrAuRktPqQ0ziYoqixw1L4fJwDipfiSReFjz8Y
         hGG+p2GHkDdLeM8GusMoHEwtyZ7/M+Ibst5VHDsGjO1p6FQE8nCZo6E5wxQr8X5+wf6p
         xNFmc6SvDyVw5DtZA4FUq8HvXtnOZ8kLn1yyPsq25jSSgZwpJ0B7EPwDqrShhSRXfc5q
         tWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYoMfHQ34tI0X7D7RWZWlXMizTjRyi9tL3sAgOPMdySAJH3Roj3PvSfk3AQ73NkJNXvofz6DNVAZU5vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt2X8Nsr4snqVvz6VM70vgasNWA1iIOXnWYecw9ytBZpZPmiKK
	ZBP+M6/6EPVoUdJsdp+uNPm7BKDKnFEQsceFyuuyzMo1FLAAWfhvR5ONf7Vp/CtlhEECkEQ5KKi
	77TuQb5wcK/eLjj/KhIMsY6VcjMJwMD65KbhHwMlm5n6Jb2G0Jhl/Tw54okSSdk/5Ng==
X-Gm-Gg: ASbGncvlL9E3bb0YKXwCX7zq3ldcgVFGeD9EkaxGL0qRkRccCjNqBPLO3TkaiO7hsrS
	zmfjdBsHFeJPIVU5fwN6SkijfrKiOsk0jedbj7KgSGGW9c0dlCyc7lR3CXH6jXId2Bqn2h+7nxr
	tzmnTgcG6pU9daciIiBzjqgc7Fv1EsVrsR9dgoa/VlV9o83a6wFDZl2HFAZwMAuVHqvZPGMDiYl
	Z2+0jupZq4vEGG+K4Ug/8eihR8R+Jg9fuDm7I9lVxnrWT+8r397F6j0narjxWNyRjyvtUMaNOK4
	czX/qz1LwBXw+DT4kdn20cw/Acvgior7VQ==
X-Received: by 2002:a05:620a:800c:b0:7c5:431f:f5e6 with SMTP id af79cd13be357-7d229887bf5mr53232285a.33.1749143633403;
        Thu, 05 Jun 2025 10:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA+PZVxU0KcpFWRWk2T4rCgPUtQLXzoDQwsIZvyrADwGhZQ0pSI//nevDF45+TMmeSQHR2lg==
X-Received: by 2002:a05:620a:800c:b0:7c5:431f:f5e6 with SMTP id af79cd13be357-7d229887bf5mr53228885a.33.1749143633020;
        Thu, 05 Jun 2025 10:13:53 -0700 (PDT)
Received: from [192.168.23.80] ([87.224.39.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f982a5e5sm31482925e9.18.2025.06.05.10.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:13:52 -0700 (PDT)
Message-ID: <73d9fa9e-823f-41ef-bdf3-76cef3591e1f@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 18:13:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@foundries.io>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
 <nr2je5ssn22npl2dqu5aj2xcwinnjmhvl3tvuz5smr4dd2rxaj@dfkk6aktkafy>
 <0a17dc61-a8eb-443c-9f4a-4f7851e07c5a@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <0a17dc61-a8eb-443c-9f4a-4f7851e07c5a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1VuZpSR7JeMxs_K2SDmafY0XWQSNg04S
X-Proofpoint-GUID: 1VuZpSR7JeMxs_K2SDmafY0XWQSNg04S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1MiBTYWx0ZWRfX0dxNpZypBqdU
 U7grfUWHz/LoD87VqvBNpyZZBydedOmwAYTbE1cLQrAe1oHBgBFA/OCaJhlAbg7lsopwliSQQV9
 2p6rCJGJyFv6F+6NJuzTgMu/lbWEpctbYSJHn1yglhiGHW1yjk/W6QX2wEQFl1rB7SSdyKjGT7u
 0WhlaIKOIhHrpJopc8EJhxYokxERcKGLCDkHpmdlB9itKSwQtXZHDGy3jGHU6DsHBZntqALDFU+
 DAh8B3jBUGTq/Lw8qWE8MLHDrvBAoijkok30s8TPQUEyq/UZZWCLAAUBDSfURNhQPdXEVklHhQo
 7K6rfAaoKsNdNNtXjtWpQ0TO1qXCx1WoIHVpuW6pfj2oe8iBqYnRoVfp9Y3svraYGjgw+7+yxfB
 sFAiB1dctyP5tuJc/Idf3Zq+XIp9iyOcW23FZF1P8lgkKq5WguExapXedsDdj467egAl38W9
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=6841d052 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=UMobGI8h2IAScYPZOeRE3Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=v7yF-7gVPNHQD8MQQjQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=520 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050152

On 05/06/2025 18:12, Krzysztof Kozlowski wrote:
> On 05/06/2025 18:02, Dmitry Baryshkov wrote:
>> On Thu, Jun 05, 2025 at 01:40:03PM +0100, Bryan O'Donoghue wrote:
>>> On 05/06/2025 13:33, Krzysztof Kozlowski wrote:
>>>> On 05/06/2025 14:30, Dmitry Baryshkov wrote:
>>>>> On Thu, 5 Jun 2025 at 13:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>
>>>>>> On 02/06/2025 08:16, Dmitry Baryshkov wrote:
>>>>>>> On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
>>>>>>>>
>>>>>>>> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
>>>>>>>>> On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
>>>>>>>>>> QCS615 uses the same video core as SC7180, so reuse the same resource
>>>>>>>>>> data of SC7180 for QCS615 to enable video functionality.
>>>>>>>>>>
>>>>>>>>>> There are no resources for the video-decoder and video-encoder nodes
>>>>>>>>>> in the device tree, so remove these two nodes from the device tree. In
>>>>>>>>>> addition, to ensure that the video codec functions properly, use [3]
>>>>>>>>>> to add encoder and decoder node entries in the venus driver.
>>>>>>>>>>
>>>>>>>>>> Validated this series on QCS615 and SC7180.
>>>>>>>>>>
>>>>>>>>>> Note:
>>>>>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>>>>>> DT patches, still depend on [1].
>>>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
>>>>>>>>> on QCS615 over(?)clocked.
>>>>>>>> Agree, so we need to make sure that the driver patch is not picked after the
>>>>>>>> DT patch.
>>>>>>>
>>>>>>> Worse: we need to make sure that the driver patch is present in the
>>>>>>> branch which picks up DT patches. Otherwise building & testing that
>>>>>>
>>>>>>
>>>>>> Well, that's a NAK then (although depends what you mean by DT).
>>>>>
>>>>> I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
>>>>
>>>> Sorry, but no, DTS cannot depend on drivers. You CANNOT merge them into
>>>> one branch.
>>
>> Surely it can... Like any other cross-subsystem dependency.
> 
> Sure it cannot, because this breaks the basic rule of not mixing drivers
> into DTS. Arm soc maintainers are not merging drivers back to DTS and
> the DTS must not go via drivers tree. These are basic assumptions around
> DTS, see subsystem profile for more explanations.

Ack, so v6.N+1, which is also fine.

-- 
With best wishes
Dmitry

