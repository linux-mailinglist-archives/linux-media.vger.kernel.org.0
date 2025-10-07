Return-Path: <linux-media+bounces-43839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5087EBC17C7
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 15:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D0319A2EE1
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 13:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1027C2E0B6A;
	Tue,  7 Oct 2025 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXScP99z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15382DC32A
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843405; cv=none; b=GQ/46OW3kpmfbHEhE2lLmZYK4G8onb5TQ8soxbL4etIgp8WlVdAuPWxaul/pmYTgSWQaNQ8QiASIF5QuDFNTSSaQGmiK05D4m/pSu1q6g7ML+qmvGo3xlID+oq1L5owTps1G4IiWj6nLroLpOk6c99xi/SJRivvAVeS03IC2eTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843405; c=relaxed/simple;
	bh=GWcm9Iqd1K8dGk4aFdnzUCo8n2a9wVNXOCYDYImxl9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pz7KwjqYLrrX6Ol+bz+4j1sYWiL549Wq5mzgTLY+u+PCPeZXj4w+A34Pwxi4bWOkg+d8DVbI41oueNWH41H1bfeXk9rlAb4NQ50dp76wkyD4Kh27OZZ4CWG7ur2cjfFxzIce6W99qZjIFDi5L6C7zrkfOy29uIjYVBHBZXcbAjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXScP99z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597CrUEO029083
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 13:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtlgJP9r9/bTws0jjX0nVpJJdg3+TInrVP7KgIbG6I8=; b=nXScP99zq8qZwbvr
	dbc5ltlz6CUM25y+DyA74YfJ5euZxlmUVvWnshuPhIaGYV3MPWfTzSHVdYhIM4bX
	l/8FC3+lPWPZyZYRH5+enTNDLy/4uSHhHqb5S3ziTzUlbdYGGFbnMRkMG8Q/PDss
	3zb889N348HxPQvxsbOpvUB0zkaCoIAHnxxWwBEYxtdUDKCwrXXzz/v4chP9MGYQ
	TREx3BSTzjOluuRKZe7+ObtkJBO03fqIAsCpMTlnJhcIu2QhW2JJGLRshUY6s5Sa
	1CBaF6XczS1vZrCfF7Dc2etzQfj7puIWFoWxecxMdwfHJlFcGtJWyQbTk9u1IvBU
	rYCIPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0k1kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 13:23:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d8c35f814eso14117551cf.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 06:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843402; x=1760448202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtlgJP9r9/bTws0jjX0nVpJJdg3+TInrVP7KgIbG6I8=;
        b=Oc/83QO2XAvxZv22bDBE99ainKSe0eew70xuwpYbDBYJ7u/G5ZC9I1DIJyypALgZla
         Wa5vr2isjZBbLtomB+hpjF8Ro2lkZb9Js/uFmSEnYUnB+lY5yUSIHwJEWcg29P+emhC6
         3RHzJPX9zPtfDaZQZ8imJ0UJU/a5+jIpWjRbsldGdClwbdZbRt7NMvnS/UdscC6m2il8
         D7YvTJnZDY99oOwQEfldIDSlG+gH9YF9PJbXduYwWEOowtckFHXFm1FFTJm+PqXaqXxM
         AAq4ZHiJUrgTX8uG5A3pKtYxym9vJFhI6ZSDCQXnA47RA0gTBuFeLiSAKu+uSNvxjNaf
         X3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtAATY0GUCsmBiAk8fPHcsLp6UjrDupOUhIsAp/FZqKDRzveJJcW41FQdzgWKREh5bJDYD9dRe4y9mLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPyQDYcAYUg2HALxrHZ4dwTncV53MeXRdzOe79G/CyKwMQulVr
	XkwNLx7ZIX1uMXZJ4BXvm7PpT8lpH4i2UZOKvY1lhSqa0h/54eKBOGe4uSyUykPKiaD9puVRUJQ
	sW03A7EQNW32unyZJTrbSyVo9xQL6sy7WLbHBf11vl777xLtMYbqIlDpgXTdQYI5ySQ==
X-Gm-Gg: ASbGncujFckleE+iLXZTgZKh61IzqJJQ2CIzePVE6sX33IFZH51nRLihvTdk7LSuq0j
	IPJt8B2oXPdE9FVmSjEJ8k7A6vMXBpdBzMMi3LwDbQb49fp/phtBApV8ZvZOyHMPWr94gcc06Cc
	+MrnIkRVZ7/HbsARz7aJdom47glUv69yHr/KL8tbeyX1WVT7gzJKos4+FH3dpNLenjGBQoNZy5L
	Dswo39/Roo6/ohJf3fIT+BeH4RX1BljQvmTeJ/RKx/caSK64iJLOYWx8JGa5tc5Zk5ndrc0luO0
	i1RX10jsN3UckzS9fLel8Z/TfYpIixwlcwQpeLHPyEPaljAe5xC3DsA9sY+zvlh/JPJ05tKCjcK
	0wF/IKSy7ffDP1djvf/L5qwKR1OM=
X-Received: by 2002:ac8:5804:0:b0:4b7:7dbf:9a81 with SMTP id d75a77b69052e-4e576a56640mr146622811cf.1.1759843401816;
        Tue, 07 Oct 2025 06:23:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTwiKTWukkgKgK9q3K+cBcWv/GpZF9R0dOxSaKX2tCOpUBq88Hnq8CqHgEnzs0FKmcoRdOig==
X-Received: by 2002:ac8:5804:0:b0:4b7:7dbf:9a81 with SMTP id d75a77b69052e-4e576a56640mr146622271cf.1.1759843401154;
        Tue, 07 Oct 2025 06:23:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9e66sm1369754066b.14.2025.10.07.06.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:23:20 -0700 (PDT)
Message-ID: <80036e24-fb91-4bef-82e0-55b83799765a@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:23:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
To: Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
 <ab28a715-6b5e-4adc-8889-f47ee2e18d5c@oss.qualcomm.com>
 <96aca644-8fdc-8076-c94b-ed655ac526d2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <96aca644-8fdc-8076-c94b-ed655ac526d2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: djG-7Amxl_lkChJAtZ5Mq6tAN3zk1yiV
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5144a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=YqhKWhOh7Lw7mRpZfF0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: djG-7Amxl_lkChJAtZ5Mq6tAN3zk1yiV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX2i5TiFQndKWF
 ySsXpQVf1mhZz8vQuxQa6FLkc7QOgsl6ziMz4CRUYDoB3rI98Bkqt3Te3xmwLYYgcciP8SXNNAb
 M9E2IcMU3AU3FL4Hl+89u1GnFivSIVsEW0qm1c1ysMxxKS87C/vSIkekA+wAX2uhHj5t/SIGhxQ
 2lXkGMCJt7XX926Uez5BaREQBgQWfijTsRyJdbseBu58pH8Zf6g1Vl/1G8sT2RKa7VLh16WNEnd
 EBCyhARQIxypGhwPIOyQyY+Eia3f9ql0gV1ZZSGb6z9lUg13zYzblJQIYJxc9WE6uzcETHcLNYS
 DDLx3CnPCEDKDI6ejRUNce4/BFQZYKzjQQvbgNXhH87ZLU6MCBWMJ2FuJeHo7HjdxDkFE6C2XPM
 pgy//G1Vdtx7SrrFC7IkzWbtWQqe4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 9/29/25 7:44 AM, Vishnu Reddy wrote:
> 
> 
> On 9/25/2025 2:40 PM, Konrad Dybcio wrote:
>> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>>> Some of vpu4 register defines are common with vpu3x. Move those into the
>>> common register defines header. This is done to reuse the defines for
>>> vpu4 in subsequent patch which enables the power sequence for vpu4.
>>>
>>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 36 ----------------------
>>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 --------------
>>>   .../platform/qcom/iris/iris_vpu_register_defines.h | 29 +++++++++++++++++
>>
>> This is a slippery slope. I think it's better if you explicitly say
>> the header file contains the register map of VPU3 instead, as let's say
>> VPU5 may add a random register in the middle (pushing some existing ones
>> +0x4 down). Such changes are annoying to debug, and we've unfortunately
>> been there on Adreno..
>>
>> Because you're using this for a single common function that is both acting
>> upon the same registers and performing the same operations on them across
>> VPU35 and VPU4, it's okay to de-static-ize the function from iris_vpu3.c and
>> refer to it from vpu4 ops, keeping the register map private to the former
>> file which I think will end up less error-prone for the future.
>>
>> Konrad
> 
>  Just to confirm
>  1. You’re saying it’s better to keep the register definitions for each
>  VPU generation in their own source files, instead of keeping them all
>  in a shared header. Is that right?
> 
>  2. The vpu functions (power on controller, power off controller and
>  etc.) which are common for vpu3x and vpu4x are moved to
>  iris_vpu_common.c and de-static-ize to use for both vpu3x and vpu4x.
>  (This code changes are there in [PATCH 6/8] media: iris: Move vpu35
>  specific api to common to use for vpu4)
> 
>  Will this 2nd point is fine or Do I need the keep the functions also
>  in the platform specific file and reuse for vpu4x by de-static-ize the
>  function in iris_vpu3x.c?

I think we can drop this since Vikash said it's not going to change
much for the forseeable future

Konrad

