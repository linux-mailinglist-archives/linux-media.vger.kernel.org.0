Return-Path: <linux-media+bounces-29795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27995A83040
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 21:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E06E01B64BE9
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 19:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44F21E3DED;
	Wed,  9 Apr 2025 19:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1ZaGMYu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499231E0489
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 19:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226264; cv=none; b=mKHqf5gHT6FkWY7HkEamPTHywdTTynGmo8Fbrj3lCNkzbXu2ymP2jZX/R41DVXSYNDgly6Z85qhk+cf620wnqZfQBbZdv2rLRQdfaXCSqt3VSH27F0uHXbQ5m2sIREwJ5q2Q6Gr+MaIVpLYIEicNLCzEyrM0LbpMvky18Kx6844=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226264; c=relaxed/simple;
	bh=9AOGJ16kRt3tVGIANi9OM2YSv2giRzrvMBRJunLNMic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fD8vTNYZSBBOyIhtYOT/SYYHT5jLgC5U2CFzEfR7tJ9jVU6Pl51WCMbXIttEZhZG31Ax055i7vsn8JwX/4C+daUTq2giba9mPr4gEnCxPU6SXMew7WRVg93XCXYo6c6zmYr9k+iGJVqhjnit8yavyAx36jNBU7gecOes7zNceJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1ZaGMYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539IKLgp029024
	for <linux-media@vger.kernel.org>; Wed, 9 Apr 2025 19:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lqcvEHgtU6uy6Jy9R3xfK2JQeeSFv9Thsxw6q2/X9Mc=; b=P1ZaGMYuZPrZL5KR
	XZiKtavnC4AyIYCh6dOxImZoZXu0m7BNx7H4elJ23PoihUL+Yuv1xQghUfUqO2yf
	EKskcXY3S1OMlYHl4wwRuTX7zoGuXZzmGgDflk31KBTTRY+Vof/kGRj3+dduSnIe
	VsUIZ+BbUoLuDCKXJ1OSj3p7XnoOaBPUgA+l6bsI5ihatCLcgzebo8Mqv7RYeBuS
	vEshVJZfQa/qOQXvTmQTuD9U5qNFhJcfIneHe4AjsA7GH+LKOpjUiNlznAqXqLAB
	w+rAT4Hsg5XGv7T0ykTAkm0d2S5jDG9F7IzVICI/v8yzG400QvZcxRBCWTIfUv6C
	0MK32A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmcf34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 19:17:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5530c2e01so941285a.0
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 12:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226259; x=1744831059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqcvEHgtU6uy6Jy9R3xfK2JQeeSFv9Thsxw6q2/X9Mc=;
        b=e7njuz9UNavg4niMTdIEnHLWu7W43QpggcrdDDOPBwyoFM5SHRJmPUoDszSUy+vTdl
         uUSebMeADkPlgd1M39f6y+ks+gtSDFgOThvHvgJhI2nNOBip0d0ngWgJ7aRqAG3Ioy/A
         LhJ0D5Lz1MiAIo2Rt/wNg9mGy697NWhBKsz+7VetGw3CZFlGqq0h2W6Vi71bpNGNRkif
         80HH9yzmKtGHDEpIp4H9H6zQ88F5H9h+9pSVECpFo6jzkXECMOeH5wQXfLHOwj8DOA4h
         YynxUuD36jLwbcGfeMpgvmHN8nfDZayWzluL+PeSf8O/Hgtmzo3JGqkedaCnZDYRiCZv
         kFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKA0lLQGD+Hy1tnDHaXGrmOfn7WRWoZV0UoSNGJxNNJm0GqSKQYrFbLsn1dID8reBPubPBlpmahJtROA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrVs2HS811v09O08E/tqlUHethj18ERQhqzp1gymPIY0cjR8jg
	R0BvTzXgEXjZxbGouUL89xKufoXhLjaLHfd2d589z02Z2UgrFZ7nlTFWYYtFVqAFHjAAVTIcwSe
	J4h2DdjqZ4iecLKNBCLgFL9QIONpjwGPplZK1LvcrOFvhN03D6Xnh1rREMBZahQ==
X-Gm-Gg: ASbGncuBdTqXz/EkCGZRZd+o6jTUGMdaB+PIkry3gtxVjvwwVoVyIZx33eWdq418zik
	bWbf2skQJtQM30R87gJBnWkbkWfXw10PgjbmogQwoGuuqoZoVXpPX9WcpTN5hbqDwR5WHQBtSQf
	uSWFwYQuRjqj42DxH3/wnrTcKlcn4XFnIYITcJSJM6v/QnqbnE0jr3b9evoFiloY+r0+8YbanL1
	qQ5CICfQIJDZSPdX6E7xhP3fDHdsPttQZP6KOW8fAe0F8FN3A40+bEMUIB61vud95UFGbQcIfKY
	ZOUCGxw6UsEiXZQrvoKvlugKKTeNm0gczZVMTXaex1MZ+I4/VUUvRsQ2qLdD9PBGGA==
X-Received: by 2002:a05:620a:d93:b0:7c5:606d:dccd with SMTP id af79cd13be357-7c79cbbe2bbmr258668785a.1.1744226258820;
        Wed, 09 Apr 2025 12:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNs/f/dMR7v4+f3J7T8RQuT+APxl+MlHJ8DyM2bYtuDetjuAYExfOKY3Pr7QtPXMMvnZoJgQ==
X-Received: by 2002:a05:620a:d93:b0:7c5:606d:dccd with SMTP id af79cd13be357-7c79cbbe2bbmr258665385a.1.1744226258315;
        Wed, 09 Apr 2025 12:17:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3553sm140768266b.29.2025.04.09.12.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:17:37 -0700 (PDT)
Message-ID: <e3faf128-6a36-428e-8e34-55d87d4686ac@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 21:17:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] media: venus: pm_helpers: use opp-table for the
 frequency
To: Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
 <20241219-add-venus-for-qcs615-v6-2-e9a74d3b003d@quicinc.com>
 <fde279ad-27ed-4947-a408-23139bcd270a@oss.qualcomm.com>
 <351a9654-ffa1-4727-b772-95d4ed113c81@quicinc.com>
 <ac145c57-1db3-4747-88e2-02825f958d5a@oss.qualcomm.com>
 <6f11921a-4ee8-4f40-9131-529f548f681a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6f11921a-4ee8-4f40-9131-529f548f681a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: olvnOzJ2L58CBdqD82XvKH0ojqcU9w5R
X-Proofpoint-ORIG-GUID: olvnOzJ2L58CBdqD82XvKH0ojqcU9w5R
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f6c7d4 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=6lrxKQdraE29tqtzjYYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090127

On 4/7/25 5:39 PM, Bryan O'Donoghue wrote:
> On 09/01/2025 13:05, Konrad Dybcio wrote:
>> On 2.01.2025 6:38 AM, Renjiang Han wrote:
>>>
>>> On 12/23/2024 10:17 PM, Konrad Dybcio wrote:
>>>> On 19.12.2024 6:41 AM, Renjiang Han wrote:
>>>>> The frequency value in the opp-table in the device tree and the freq_tbl
>>>>> in the driver are the same.
>>>>>
>>>>> Therefore, update pm_helpers.c to use the opp-table for frequency values
>>>>> for the v4 core.
>>>>> If getting data from the opp table fails, fall back to using the frequency
>>>>> table.
>>>>>
>>>>> Signed-off-by: Renjiang Han<quic_renjiang@quicinc.com>
>>>>> ---
>>>>>    drivers/media/platform/qcom/venus/pm_helpers.c | 53 +++++++++++++++++++-------
>>>>>    1 file changed, 39 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..b61c0ad152878870b7223efa274e137d3636433b 100644
>>>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>>> @@ -43,14 +43,20 @@ static int core_clks_enable(struct venus_core *core)
>>>>>        const struct venus_resources *res = core->res;
>>>>>        const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>>>>>        unsigned int freq_tbl_size = core->res->freq_tbl_size;
>>>>> +    struct device *dev = core->dev;
>>>>> +    struct dev_pm_opp *opp;
>>>>>        unsigned long freq;
>>>>>        unsigned int i;
>>>>>        int ret;
>>>>>    -    if (!freq_tbl)
>>>>> -        return -EINVAL;
>>>>> -
>>>>> -    freq = freq_tbl[freq_tbl_size - 1].freq;
>>>>> +    opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>>>>> +    if (IS_ERR(opp)) {
>>>>> +        if (!freq_tbl)
>>>>> +            return -EINVAL;
>>>>> +        freq = freq_tbl[freq_tbl_size - 1].freq;
>>>>> +    } else {
>>>>> +        dev_pm_opp_put(opp);
>>>>> +    }
>>>> I'm not super convinced how this could have ever worked without
>>>> scaling voltage levels, by the way. Perhaps this will squash some
>>>> random bugs :|
>>>>
>>>> Konrad
>>>   Thanks for your comment.
>>>   The default value of freq is 0, and then dev_pm_opp_find_freq_ceil is
>>>   used to match freq to the maximum value in opp-table that is close to
>>>   0. The frequency values ​​in opp-table and freq_tbl are the same, and
>>>   dev_pm_opp_find_freq_ceil is used to assign the minimum value in
>>>   opp-table to freq. So the logic is the same as before. I'm not sure if
>>>   I've answered your concern.
>>
>> We talked offline, but for the record: my concern here was about
>> clk_set_rate() not scaling RPM/h voltage corners, which this patch
>> fixes
>>
>> Konrad
> 
> Konrad is this an RB from you, do you have any other concerns with this code ?

OK the comment above was misleading - back then I must have thought this patch
changed clk_set_rate to dev_pm_opp_set_rate - which is not what it does

I won't be blocking this, but I'm not super keen on thoroughly reviewing it
either - there are a lot of raw clk_ calls that are hard to keep track of.. 

Konrad

