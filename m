Return-Path: <linux-media+bounces-47840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA64C8FECB
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 19:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2842E4E19B3
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 18:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51882D9485;
	Thu, 27 Nov 2025 18:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMs+FfiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZbcpLr3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA12D97AC
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764268493; cv=none; b=PHDWKtN+WxzKrNL4c/3WLo4VQ0fWIuObnvSbBbFPzQclEd2ti8rbeV/DjuwR8dQWx5wURMBAkwUjw7urdsRNZdPyprn4N/nLmvDEfngvm8X15Sx61cdgNS5j5JcqWkToNOcCd5S745kqjY4VZltf0Qwuo+3BZKRu7vqzFrMsYKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764268493; c=relaxed/simple;
	bh=CyqAt8eyHK/sR9OuQQqTRXOD5oCRUVXplse9uxEzUww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8CojqcTOrUScqTP5CK5Iz0wzIz6UmG01ReAky51D07rUHYv44BrA9kP9uTKs2iy1mDBI0lNWxE5+JQEivmRnLO+WnsG7aJfq2j6MGeXrxinu65rHPjnT7ZN34aRNlS41Zj1IYaMkvtHRT0MYemqFMEi4vYrHvIqNUg//lnDHGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMs+FfiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZbcpLr3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARH2jdm1592190
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 18:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdXRaByfg6g6aJmackd7z8wHbCYRNUZLHSta2o+aHQc=; b=UMs+FfiMgCb9oBmk
	1Xs/gFOWqXgXhf//5DdFunv0vvfgCUO4EOcQIPeC9G90HRoZSmrW1w3qZtNUhv0o
	GyNf0fWwYa0PcBmVgmQ71gy5u4AO7iMTjLcoUE0TG4hILGT6iXeElu+lw9Scmewd
	IPZo4AXxjqmueldmoEfNYUzQFogmny3tLCTjKXjzaP6COG4VLHl8s2suo+ptUKUb
	PvBEIELL/lQR8ZwmKLRyM37LaN/UOaodlRDfLNSohVBbBpOODFn4CWkeCYH5hQCq
	lNVfZoZAIIbHIICWte2VSYcjqaHQV11Yfpbn1Yuhhy9JtGQX05WAq5xlLUnpjywW
	DSX3Vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpu85qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 18:34:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso4605241cf.3
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 10:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764268490; x=1764873290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdXRaByfg6g6aJmackd7z8wHbCYRNUZLHSta2o+aHQc=;
        b=gZbcpLr35yTpS009S0pxb2uMl4k/Ced3o2eWZ9aNuHuJJC2g5RWy9MM25h42jMLmjG
         iR4GDQ368GuPBQ67kLpSpgEbTBJDEB+vTlXhLgmgwrkFvz56gQ8Fd4Tgmw0rLRQKbMAZ
         1u7R9JtMZjqvsKC7F4pxamb2F2mia/jTYgpqZl9s45IE9douVZL5n0LtGhUF5hdlowD1
         3rBRe0NZZiTEpcuNJ4AgZQf7bq4pWMHEkDj0hhZK3s4TxV18v9WqIFr3oijVh18MLdMK
         OOpXoto3YRvmLZr4tF81jUVh5S3V/5dSxKJcVs/YWo/Iw+Fz8QrVL8GXUOxKdDduL1xQ
         DpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764268490; x=1764873290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdXRaByfg6g6aJmackd7z8wHbCYRNUZLHSta2o+aHQc=;
        b=GVTW9ZKrSLWLPug9sz8mK9QrU8uu06yZTKtSa355ZKe0+ezZhXJI04KaHhU1xqGBUF
         MuUTnfGXzd0aNCSGzY/YcLeEdHVt1hF7xWqMRF/G4K44dgCXbyeT5S/Idf/WcbH6j9Zh
         2z2qfxQKzkMqe1Glxi21O1GRRA+grVsAJlKv8oYyfF4pI3+7YU0vfhfGckGhokXY878T
         6LQUspBFNHnLBfFfQZX+BW2xtB38tcUdyxAMZ55a2GhVgM8snUbWzN728loIU+NJiDc7
         1PeY3GxtRSJEGomZHLm0KYe60cH/5cqVPUax2JDNMo1PCbD1Ixb8XEUb7FklTAIEdrPx
         tRfA==
X-Forwarded-Encrypted: i=1; AJvYcCUwFpcbUFin9oEam34YatIK3N0hEIzh2XlNy/4FR78o3ev8Po7HK3xXwrqjMW9Bl+odJSp2yfE4wULxWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC11fOxVVNg+8W+50zg/XXLRPC/39cLS/MRsiAhiJJq36Adj9C
	CwAjy3oh+F4Kiv1+R1y/OBjFHsRJG3ONS9OInQV9cirvUiF6fttvoWw0U9AOSx9272GHWU/IbOH
	KOPPVmjf3RJyftNroHGkykpbkoHkZHRq1l+zT84eX/pQFfgtOzRwj3Vigh39RT11aDw==
X-Gm-Gg: ASbGncurcco7BCwci+rSxaTgp5AS7tqnJnQsHuyInjbnRoQuDaXcr7jcbk3A+IMbBiI
	2w469R8ZEU4HjgMfd4fAOwTyd/W3BR8ZL3nwLeOCuRZ74muJrnMxRgPtMdN616pKQAsUviZdgmu
	t95tpPhJNLiRXnBtLJRQ2+BzdgCE3IMGilEdFY5M5hQN0cFD8LrNJEBvgvEdxP4U+Q8X9XNTGxb
	Puhbs18Ajb4wROpcWRvhM0/zWc3VbOJfyjn6UA7ZjbmwNA3XG1hguRls+7sz1JFZ6vAMbSNywm9
	yIn0HxmHyGMLrQBJkd4AcQUb/grG52ewqg3lPZ0XRVaQuO9l01ikV7pGbXHIffudEGmI2VkPDgt
	4yir8j/clfMUS1KK/3saDjlknCLvxHrvi3pjzqNqYDCUoJ/nYE7wau3sUSWfExanz1Qs=
X-Received: by 2002:a05:622a:1a9b:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ee5887286amr271533621cf.5.1764268489804;
        Thu, 27 Nov 2025 10:34:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZG3UQ/f/J/2CXIPraZWvUkXW8+fbMv65eK//ZWApgcMmgaOemOv+yiLDqVMqmhCALXLXUSw==
X-Received: by 2002:a05:622a:1a9b:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4ee5887286amr271533341cf.5.1764268489394;
        Thu, 27 Nov 2025 10:34:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a6a74sm229597766b.45.2025.11.27.10.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 10:34:48 -0800 (PST)
Message-ID: <edbb4ed5-dada-4451-b883-2e3cf535fb52@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 19:34:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
 <aSWnTE-jeHEg12N3@trex>
 <6eb8681d-d82e-457f-907d-3ba5b94267f2@oss.qualcomm.com>
 <aSiGU4Z81Lr0twpj@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aSiGU4Z81Lr0twpj@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QJ-nhiw3ZbvLLo5fIwMKAXr1_l7h_flm
X-Proofpoint-ORIG-GUID: QJ-nhiw3ZbvLLo5fIwMKAXr1_l7h_flm
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=692899cb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bB1j1K4SiuvE0lrpVroA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzOSBTYWx0ZWRfX8ChE5s7+M0X9
 fNOKk+RKF8RiSvQz9vovFbo2RNsV4sY0QAs/JlguynOsHUfxlC9hFdZS41Sv/ymEkucHZtWhDEi
 3hJ7P/Gs3OustXsHWvhPVr8krsb1nGi3CXmzHdE6RUufPvQXwX72dCT+YKQ5584UAvfWLnwdYKZ
 Qtzzr2zOTDTeMEVRDb4yFgy3KqaG6IuO7vHEg0lMgTHLRGS9ghkhuVuHnbWq1AkvHLBJKMekt0e
 G2pGxHoh5ixJhbYaRbmJBa470PQbsjTFj9hJGYAJ6o1B3RqxfIX6JKi34QuW3i62BivBP5EIaKq
 +Ehy7T80UBwIk91/BpLWX4lHu7RK+5WOZlHNIl+J3JZ1aMQ0tJ72vf6QDogKeo/71kRkcpSvd8k
 B8u/68pfCuc/6C//npkLH1QsDpJ7pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270139

On 11/27/25 6:11 PM, Jorge Ramirez wrote:
> On 27/11/25 12:47:19, Konrad Dybcio wrote:
>> On 11/25/25 1:55 PM, Jorge Ramirez wrote:
>>> On 21/11/25 20:22:13, Konrad Dybcio wrote:
>>>> On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
>>>>> The Venus encoder and decoder video devices currently report the same
>>>>> bus_info string ("platform:qcom-venus").
>>>>>
>>>>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
>>>>> parent device name. With this change v4l2-ctl will display two separate
>>>>> logical devices
>>>>>
>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Perhaps that's a stupid question, but is there a reason they're
>>>> separate at all?
>>>
>>> not sure I understand, enc/dec support different APIs, v4l2 controls..is
>>> that what you mean?
>>
>> Perhaps that shows my lack of knowledge about V4L2. I had imagined that
>> a single video device could implement (non-colliding) enc_xyz and dec_xyz
>> operations and was wondering why we need two.
>>
> 
> I think the main issue is that the pipelines have very different
> flows/states and semantics so even if the IP block serves both, the
> v4l2 abstraction needs to have them separate (plus we want concurrency).

Ah right, that makes sense

Thanks!

Konrad

