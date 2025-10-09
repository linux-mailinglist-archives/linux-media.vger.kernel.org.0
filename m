Return-Path: <linux-media+bounces-44042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A95BC76D6
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 07:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3551D19E5525
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 05:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979B3259CAB;
	Thu,  9 Oct 2025 05:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCYyPtY5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837E173
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 05:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759987421; cv=none; b=OGiEi21LBhWP5BF5McJS8WXi001lBZPKSDDkZJELGMguOdNujJ4bVxoioUsu4DHQgYbrcl7jwlIVpIKiyPCu6D+n0mfEbmKe8hNoJ5oyPDrv8GnH7ixfHINl9m5AqLbImFxhlL+RBdsHDeF1x6QdzSqd8WR2iLMb3xInxbcP2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759987421; c=relaxed/simple;
	bh=QlyxEsfXkhbrl16DZnPv708U/7TfNxCMN6rg1+bcFis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0EwUkyluKUL3ZLe32zRepqsBOKociv0jWVB1oElQVBVsBdzgCaUkIQauCy+MnyH9IUKYhaPkdUVpGRMjXWZnQdr2O1P5xApcWTNcmb7+EaMW86/Rgdwny0NUKVPnIXpSGvR4jHiOFmzgjOzt1XthfZNSClaW2oypb5hhQmHvFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCYyPtY5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5Oh0004544
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 05:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	akZLWiuVBZdWjm46LZFqg6S6C2WUS52lS0cYaephgKg=; b=YCYyPtY5XU7jd2TM
	nP1nbgL2lPhSjMTAqCYV8vtfvo7qf3GiY+70asOznAe6KiuwaXAE/r7xN9pLiceL
	kj9BvPs7etVa/C1MW5AZMhLcClvfQpBWAhv3TUks7igM46snnmz7h4eO8Gzd3rJz
	mwXspHyQJNx9bmx0mMepHOUYgvtBzc2tjxIfFYNIP723SGpHPcbnoTl90y5wofW2
	FJacArLE00tl/gupWesrPVbnILMGVMv52p8fziHVzM5IgPbnDEhyvE/+VHEPxnD7
	JldvFVoAJ8Z64aQUO4SeSQpaH2oxcG9sv0/4Jx0ujavy0WyMd4TevDa6Vig23SAh
	WjxZYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kshcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 05:23:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269939bfccbso11162995ad.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 22:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759987418; x=1760592218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akZLWiuVBZdWjm46LZFqg6S6C2WUS52lS0cYaephgKg=;
        b=rQwi9YOkCmGwxhybU2RT9uEuen5l7Q71SOCnf2yKNxj8pVeYuI4JlAAU/E9ka66pHV
         QF19Em84RWshj1p6PZZboL8RyoDejUtpGKxMbjxELQ2tD5vHTCb0ACQYup/96KByr62U
         PFaPm5COuVgCcTMAzqdFxeQJ1N/UblPx+HVcIsqS/IgD6uiOabjbbk+ejPQAgJbudVe6
         AF3H55nEM8ngHwOcYgGp3kH7XX8uDODcSyGF/U7NfRgeBvw4Jc9xqSy0iETgda2qUWzv
         SMiZYjWUx1/JLiFtHeBFHKIt0LZlOTpVJnUaa3R09ptYIdleSCJAEXYBCTEKivav8slF
         Xncw==
X-Forwarded-Encrypted: i=1; AJvYcCUubxbR1EKhrKFsQa3B/Wv3yu+vcook5gOjVFzFA7tiy8+iTQCBk+Rj7Wb2BGaGXEh7ncBjg5opQ7Lyrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVVSSSBRq9skGd9ApG8GEv16Iq19GNKT/3w3LXgwR+BiDSoft
	qxlIWdo+0aXpTsTdr4Xq0cqy1NdZgTZx0mMhnKIfvYj0k2zYLv6boBE1JbldnDoeBNNVLeM+FVg
	gR489sD5uOg4wYFLj3Sn9UD8SXIw4z/HvszI6Tbysm+9AahGdJWVc4hVzDnkdknbTfQ==
X-Gm-Gg: ASbGncvb+dqFlMSydw7FBh5LGRHPONXs4zc6cn6RZA02fpfcwgANDbBUeg5f6jLlZnR
	o9VOpeCuHX2oGbM/ck64xUEhtSLcvY4etTm1Mn5DLHXmtrNNjj+2ASFw8SyuOB8zmS6FnKLtwZZ
	ihdA1eAoG7I0w2dsHFnohe6tSgvtsuXRzF+ahpARB9TZAHy2fMgBLFzKqIPRLr7RjQRfmVQIsw5
	b0pYeIBDFia934A7Ai5hvbPXe5ZEvwBSiCY15giDNycpmY+Kj+oBzvsWzOYrhTcpNNEY6dBfBe+
	2G/z7T/AHigC6OjjhdwMDbIbtBImPjh8tgcnOGykjq7eF5KNOCqK9YuUKtwHlcE7dgOGQO1IfdZ
	y
X-Received: by 2002:a17:902:f64a:b0:275:8110:7a48 with SMTP id d9443c01a7336-290273eddb9mr74232685ad.39.1759987417774;
        Wed, 08 Oct 2025 22:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDg7iAaHqOJbCGEhRnwGpr8mzkkDt1BuPM1pConZNQaoF4SP+MQRXUQle4Yzd+hhSSIL/1Eg==
X-Received: by 2002:a17:902:f64a:b0:275:8110:7a48 with SMTP id d9443c01a7336-290273eddb9mr74232285ad.39.1759987417301;
        Wed, 08 Oct 2025 22:23:37 -0700 (PDT)
Received: from [192.168.1.3] ([122.181.197.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f56c0fsm15046985ad.104.2025.10.08.22.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:23:36 -0700 (PDT)
Message-ID: <6ead45a6-aac8-464d-9812-f5e0d1395709@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:53:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
 <Ujyoj3HGLVFhS2b0XzcYAMjSiCAuO-lSJ8PMEQLOaaX83tk_0D5zjrL0VDyZAmD3i4zLB3ElKSZBltISb5jJHA==@protonmail.internalid>
 <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
 <SuwJuCIcLVJwN3YeN1il6tB9wO9OH6bYcnbRpxpuI9Dl7piYLN-hVdnyv0Mal6N-W5pi2aCZI8MxHZDEkoE63A==@protonmail.internalid>
 <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
 <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
 <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
 <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
 <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX26ZVZu4g6pHD
 XDJ+g0hdtJpcTQIPby0yYUU9+XL1FELWeEwQHWRh6LwbPdNcJJMh5HFbLlgUuheqeDin3x7etsx
 HQLg9hfNbfxRkN0oqrCrLfqvCBs5dQgvDeTs4SCnZD6TE/6C7mUua67Ddv8p9NI/1AJdhoT5wRe
 npl6vLaUKTl2y+zU/3SJuvdcJOlhiVSLeAbDF89UAlihaAp2BRB+VE45dzMI1S3+76Twc55xKew
 MwoyEUHm6Av4u4Bsm4He0/AXniG6Q6liUdSnnOA0VVWeCjirKl+4BPDodyPLv5icU4YRyFIq0SD
 AAguP3QkrBNiX9i46UqAJlLzR7NVr9Lt8I1x5n2bGBhGQp2WAtt+2aq/LIgYVaoHZYWbnhC3eeX
 /rm2JzoNfvbbZHo4cfYXw9Nx/LtEYg==
X-Proofpoint-GUID: VB5fgraxczWB1z3dbn0hh8nZiXAYxd6Z
X-Proofpoint-ORIG-GUID: VB5fgraxczWB1z3dbn0hh8nZiXAYxd6Z
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e746da cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=2UNsNDcC2suIOuNS33efzA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=cU1SgpNRDqoFvKGT_TMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/9/2025 6:02 AM, Krzysztof Kozlowski wrote:
>> If it is legitimate meta-data for the SMMU setup then why _shouldn't_ it 
>> go into the DT ?
>>
> We talked about this two or three months ago. I don't understand why you
> just ignored that entire part and come with new binding just to not
> touch iommu code. List of entries in iommu must have strict order, just
> like for every other list, and you should rely on that.
Hi Krzysztof,

I want to understand a bit more about the statement -- "List of entries
in iommu must have strict order."

per my understanding:
iommus = <&apps_smmu sid1 mask1>, <&apps_smmu sid2 mask2>;

     and

iommus = <&apps_smmu sid2 mask2>, <&apps_smmu sid1 mask1>;

The end result is same with no breakage as they still end up in using
the same translation unit, i.e., ordering doesn't matter.

May be you imply something else(may be ABI[1]) here about the order,
which I am unable to catch...

[1]
https://lore.kernel.org/linux-media/8b88cea4-b9f2-4365-829c-2a255aed6c69@kernel.org/



