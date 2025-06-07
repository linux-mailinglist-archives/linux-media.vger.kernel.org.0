Return-Path: <linux-media+bounces-34288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987FAD0C35
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 11:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60C813A0101
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 09:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD59520C47B;
	Sat,  7 Jun 2025 09:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvjGFQ8I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC9204598
	for <linux-media@vger.kernel.org>; Sat,  7 Jun 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288993; cv=none; b=EESBarAPIaW/LaypZwSFuC9TW3flr+VCeKr/RI8UT9laKmE2/EPaXoOYGTI5MyFSI026b4QGe+PypGEHfnpxQZ94UwtlQwo3IYTrbTpgWPyepEDnkhVX8PSGaGpOKyrAzgjIo8MFaWWSXN+Iavz6aAHrFgoDAmKNzm0uk9NXGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288993; c=relaxed/simple;
	bh=tIQYr/Ordh7OK5YzdnX/mG43lQYgIZRGZaOsLsEmcy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzDWeJAIgvpNjPSkEGUnR7fX16/h6mbzBKtlq2UGTZsVDqCi/HGNQ8fEKxfUGRptugsxO4/x2Qrgznir1hsbGmCwY2gvJI/eRhn46+vruJIB1oliXU5fpI7et8N6Fm04aQuDBBJo8AuOQOEEFaG4NNTI8/tB5zKkj34yiSAdYF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvjGFQ8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55743srb018289
	for <linux-media@vger.kernel.org>; Sat, 7 Jun 2025 09:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuDm4+B4e3Dd8MAQolF7UDe8UurtkEq/T3uR5DRTEX4=; b=HvjGFQ8I98ZKsNV5
	W36QjSAKncaitr9eNDRj7mmTTplUaAr76BoYacACfs3jc0XqV69YXwTgj4QyVenr
	C+SvCGx0XyKMBaHnJEh9FZFvn4ngm+b6qEfFn0TqEU/8v+3bs3l+JSrZxpOBXrx4
	FYTzX5WDTkgKJ+c2IUPV5khZt5Lmsxi/7RcvZpL6O/uY8Dc740ziXlnBQjPM0FVp
	q/WXwU694M3+ufYsERl6PH5yESLDW1b5dRUYI9TU5cazihXgphRRmpAoQijQsR0M
	t2iy+DUDBZFUZUuM2lgsAzgCpdhgy3f3TSA1A70YcnP8/d811/rj/Gud7t5dDD/t
	KLZ7/A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrgk9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 07 Jun 2025 09:36:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f539358795so5661256d6.3
        for <linux-media@vger.kernel.org>; Sat, 07 Jun 2025 02:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288983; x=1749893783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuDm4+B4e3Dd8MAQolF7UDe8UurtkEq/T3uR5DRTEX4=;
        b=MNejH7PcYW9bQqHH0uu5mqLuVrD9fVxRxsQbQ+gXHmXQPjEMfHrecxPjrnYBMQfBlQ
         rw1C5fX8aFPS/Us4bnuPPIsrFuG6ivsIHRwcVlHoAewTtQW2G8T5PBpp4DPUAn+RxLKI
         MSz1m4ho+HCDPn0NwMIz3l4VThHDgGgWvv+3hhqaDaxGOAblBIskut1wY99sut0vTsJT
         A0S+8zK1Ju3sgjvysYI4Hzf88uGFGHrjvlYCXNYWfET6coq1a+eB2P/zYKYjLjRrGb9b
         2lqU9UuhJyZq7JDN3bA03nn3CBDkfWVysb7UU2wlckN7D16+iQbwzMqTymrfF7effL2s
         IdaA==
X-Forwarded-Encrypted: i=1; AJvYcCW6T033mdYgBAu3mrp69P9gV3IHxPZP2JUZxcjDctYAglM+IcqAdJsGil+wAxWnCUbPKnk7Bzvq21k3Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydJowZSzcYsL9zODf1befb/AkZKFXdWnnrFUpumiY/tuQ2/zW1
	XVbxAKv8XfNbNVCiuBCfWrneeZVLdEBOlb4ORlVWrEdvgbDaNa4P/lVAjD645G1JjItWOxDpUE7
	TzSbtvG8JwRme1vaHCxxMofe9v21dUkZAhbYvhVon3e+CDkg9+Za51uHu0kk/SVf0Xw==
X-Gm-Gg: ASbGncvzIDig3dEJv/WJSetw7+ytAirHiDwWKdw9I6YODW9wEZ0KYKIufR0BsWn3Ovu
	biB+1kuWYTUVTndrlhSjvdu8F1Ma6HIRyFgPUiVpZfhBMTnjJAgX5+sOF3BwHFfJK86Icx8QaDk
	Ig40IFK3F7wOU/g2NglFjCA0AnYzlLNcFaDuRachWSVpeH++K8nu5U+CBrjg9iHzOXeONiLcoZJ
	Qqdkyf4wJQPzHBXS2o+X9OsIQ85QLylxW2yhEIxBsBxROny/22dqRtVKZiDqszMV2iNwMCD/Vxm
	+IpWMO4QahTAqpDDLymYRm3SNEfplUFoANCThJFrPa5rLmrogMH85IAPVQt1UVm5rA==
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr34528421cf.8.1749288982936;
        Sat, 07 Jun 2025 02:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYvbjyQGYgwZ56zsisRNOil/dKyTDCJmJe5RoUiP1hR4vrYDOMOtfIuvUy4SKey0WEsD0+kA==
X-Received: by 2002:ac8:59cf:0:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a669071b67mr34528211cf.8.1749288982538;
        Sat, 07 Jun 2025 02:36:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754235sm248538366b.5.2025.06.07.02.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:36:21 -0700 (PDT)
Message-ID: <c98ebb32-7207-40b4-90d1-8bac62d54c8f@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 11:36:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Arnaud Vrac
 <rawoul@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil
 <hverkuil@xs4all.nl>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
 <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
 <CAN5H-g7WLsowjW6CMee5T=W4Lmia9mLWGgX17-mOMjtBo2SwvQ@mail.gmail.com>
 <b9b456bc-beb8-769d-5f9f-e13b8860e659@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b9b456bc-beb8-769d-5f9f-e13b8860e659@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Jqxm_JV9LM3px2iK2SwPeRPcv5ePn6Du
X-Proofpoint-GUID: Jqxm_JV9LM3px2iK2SwPeRPcv5ePn6Du
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=68440817 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=7X0xE_O9oehTbdelYikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA2OCBTYWx0ZWRfXxBYjV06l1GJQ
 98w4rexTuZG5NJVV4D7wEYK7HESIIjdAgIt682o06Y+gQbh2A/DNtbwDKr9QvbzvsryaD5HMAPS
 zi14MGIjAPOHXENxAqHKDIpZZl2Jqcs9neQHD4+SdCvHzgxe6WTOtYP2I2e1JhsJ54EtpxkZL0r
 NWtRyP+pY/VfvCVYLx2i4Yj66wt7tRjGFJJomcfQa2We3y71h4xAm2Gct7o5qLpCsNpQEQFYWB3
 xAbD/9ClJZcA0WJV5ElG9AOakG+XpV7xts5rDI1XvvxR6HgunsknfYeNF9eIkyuJ01utwMXERWa
 X9ZygRleACnmVBDkUD3IiUJ6E/eE99J0mthDZOhuuISfwiFJBrDCTtw4A9Quv3s2hLsVtbU2mAc
 eBzwhFb6bkvarikfbc0VVU5Bl4uJijIM7YbSUesHXNLDLB+FQ6loVEYUazWlr6M56AgxWoLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070068

On 6/6/25 2:14 PM, Vikash Garodia wrote:
> Hi,
> 
> On 6/6/2025 5:29 PM, Arnaud Vrac wrote:
>> Le dim. 1 juin 2025 à 09:46, Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> a écrit :
>>>
>>> On Sat, May 31, 2025 at 02:22:00PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Fill in the correct data for the production SKU.
>>>>
>>>> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>
>>> Verified against msm-4.4
>>
>> Hello,
>>
>> The current values are based on
>> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
>> which we've been using in production for many years.
> 
> I see -v2 updates these to 533/444/.. MHz [1]. If the value changes based on
> board variants, these need to be picked from board DT instead of driver then.

I believe they don't (although there exist some SoCs where fuses determine
maximum frequency for a given target). We really want to move off of in-driver
freq tables but that is still in progress.

> 
> [1]
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-v2.dtsi#L1140

Arnaud, as Vikash mentioned, dvfs tables and some other magic values may
get overriden in socname-v2/-v2.1/v3 etc. I'm not a fan that downstream
leaves irrelevant information for old revisions in place, instead of
simply replacing them, but what can I do..

Unless you somehow came into posession of v1 SoCs (which I believe were
totally internal), your hw has not been stretching its legs fully for
all this time.

Konrad

