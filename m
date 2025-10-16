Return-Path: <linux-media+bounces-44719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6DBE317C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48065587C68
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21EA31A7E2;
	Thu, 16 Oct 2025 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxQ/3mQo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B1322A3F
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760614262; cv=none; b=lLiIJ0Rmm4W1ZIee42JS1HAGav1hcmAIw/eMsxgjULeVUe+cXtQ79v3RU9mPFuqbU64YhPsyNRf9at574ZZ8YaepWvSOT5rqagGoPw1G3TKrylws43d0Jl7PzT8MIs+SrDW8Ohxj/PFQ6mW1QNyOcrla307bIvz/6ExXjgnsHEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760614262; c=relaxed/simple;
	bh=MQYL3NqvOxkDXPW1F/Y50YQmsakcGgmXXf7C3SN+7uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2mRqzQwpSdCPmsQZKMXf5tcC3/XCNLi7LjRVSf/6SgpagitIXqZNcQ7wxf/5BVSUQMDEWg96vaLIFWuWw0TZVV+uwb96ve7ksRGkCmuAtCz2cWK9OTCSbtg04rKYZWJIhImBVtRdB464VLGcH4OfRm7t7urivkYGG7MJqJ66IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxQ/3mQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G8K0Hj002584
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3r81d4YusFHYu/ym3wjxA+mceYkkZtl0xDn0GBFN3Ls=; b=JxQ/3mQoBcIzo8mK
	p6Ok8qLnoc1XZ9YE5BT4jmfoSVq6re4PEShhVnRr4Ju/s8wpf7EYtBhqKpIrOban
	AaM2xnO6OwV/mDdZ8/FdzQ5lwkYihps/Ojb3YO19LPWVTsaDokPgjr7+UB1JuXuB
	xMTWcaGeA5dOzfUsrk2qBw1oF74r4oCGF6gO+T4+HBUDrPLFdx5Hg5Es54q3eKky
	b46iRn4mVru0IOO3OLc6qvhFuu14Iyrj4Fb8VKkmYP2YW+GRVK5SynFHt3hD4Pfj
	av8+ZOC5qAPTzFCsr5Fx8wurffVysXWvlmHlFXvcYwmS13+BTi8rXSZ/1p2nmfES
	sIqBSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8g560-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:30:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87bbee3b92cso2377396d6.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 04:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760614258; x=1761219058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3r81d4YusFHYu/ym3wjxA+mceYkkZtl0xDn0GBFN3Ls=;
        b=YfPdH0+YJgSB7DTVoLUxPcCr/gUe1VTIadw6yghS6tiq0Zu6sm7EgVuHmtvBeIp/xf
         zH+CJcJKph/mlWGNKC+DqZKJTXZryMWikT2PO6Wra0AumLCG7gLw3xLtlZdganecZ4nk
         e+a5c4qiX2g4Xhh4gmfqVWBMqj1PRY8uAGPeK2jVOyd7RtzrcGBZfWRa9kl5Eh5LeI3O
         z2hAANFmsAI5vbTGktbmK3v34hNoJq0wvG946uiZshK11wLt3qYWArPx0zNm7twBAokh
         qT6mcNV+5TpGcaeiRU20suQ/QlFa/7F+mnAf8vgBeZcnLK1hPi3mSPIjyVMIcW27+G6L
         R99w==
X-Forwarded-Encrypted: i=1; AJvYcCWjd0fw5oOce5zPam+JAFsglDKtnIftYD1qpoLU2SviEdiWmKEKKMIsFOgt3UajoaU2T3nqyUZ0h+Uu8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1HD0CuXzNwVRH3hFzMLQhkY4B2cO22faRF1G1w/aka/Wt5ogo
	zP9vzlPlUaRSHTtyh6AZH/+NmxQn7xMqEiBFzxd5Wb/ru8ej1IrJ6u+EYxQzp7V2fSNKX2UoIZT
	VXSjXxddKj1qXjW/isO+B0fyO7T63cwHtOxgK5xnNrasQvH3qgWh16sZ1Hi1/QOo2Ig==
X-Gm-Gg: ASbGncuNFlpY0Hm7DfPT9lGgJQC9VU0PHFb5Jp8pdXGOy+wKjEPBYHlnnERKqWa2Ful
	+yk0qyVUPFF7ewuy+841OXjvKi6ZqJa7udU8fMCPJlaF8P3UL9ulxat2uOPmQPG8fxqiN/fSlWc
	DXnk0GQzwAwQi3Mjs+zQvgnfpf6F5Euv0Pbda+Eez2hVLDh+BZl6CTeTQORSNKbnYWrjQy6pzqK
	3GfhZuXnbS/AHpzdwItNVOiJKuzsGrWOHckBUBrDGR5V/aniEIAvJ0S2iMYV7cq/kHRGa+TuSCC
	+OQ1fNACDAA1+4v+AuDqGr1LRtRb1d2PrNnl+92zY20SEcMleV+6V3+j0o+cKR4BRaYG0IzCVg5
	QyjsMTwrlHNr5wH/MTvbOViYR/iv/ninLK0yxN9Q9+o0VYR0c0HsshAD/
X-Received: by 2002:a05:622a:14ce:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4e6ead2c674mr300272801cf.9.1760614258043;
        Thu, 16 Oct 2025 04:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQWo8LtrsilfoDkj8zqUn2LLSGLFdpY5oWuNZtrX6Xq2eIwSXcZU7XpjJTwnWEYu+0reTT4g==
X-Received: by 2002:a05:622a:14ce:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4e6ead2c674mr300272231cf.9.1760614257381;
        Thu, 16 Oct 2025 04:30:57 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd39f1fbsm487237966b.70.2025.10.16.04.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 04:30:56 -0700 (PDT)
Message-ID: <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 13:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nnib2hsymRtWC-gYeGDzLd5nFsYtusnK
X-Proofpoint-ORIG-GUID: Nnib2hsymRtWC-gYeGDzLd5nFsYtusnK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXzd2SoHrcc66T
 X17+EwKplB84sOgbJ0cx/JcY1YCHxqIm5RE1JQn54rVkZp2Vwa2g+310pOaosCi51XrUS94ZxNK
 RReRdek7xkUfBPp2hTESmlyzO8WlUhqz25ehlEhs2HHzTFjEcGL/N2z1PpR6zQJMuoPryQ3OgDX
 1ASH5FynvIdR71DT6a6HZL6oXLdbW93nVU0BdH9I5Z1ydPsaIg8iS4TbMIAK00hZiOrJvGlzpKi
 jZ0I+bCAW+0v6rO/oqyRnihdLGK5kGuS/XYVXoTe4yrkZ5H+hCF414oF4KTtHQZ3xMAv3cTG/7n
 SODhRWrq7slcPc4fXvOMa3eCKNgfRwIgUXSQDSwbEq/y9zCJNqK/cZl4EQoflGmwu3p8KH/IUIE
 yaGJ4v+1d6WNrfvmp1IHPAq4GTQWjA==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f0d773 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_kPKrX3CkssKu2g54qAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/16/25 7:54 AM, Krzysztof Kozlowski wrote:
> On 15/10/2025 04:43, Hangxiang Ma wrote:
>> On hardware architectures where a single CAMNOC module is split into
>> two, one for each of the real time (RT) and non real time (NRT) modules
>> within camera sub system, processing VFE output over the AXI bus
>> requires enabling and setting the appropriate clock rate for the RT
>> CAMNOC. This change lays the groundwork for supporting such
>> configurations.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>> This change lays the groundwork for supporting configurations for
>> hardware architectures that split a single CAMNOC module into real time
>> (RT) and non real time (NRT).
>> ---
>>  drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index ee08dbbddf88..09b29ba383f1 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>>  	return (!strcmp(clock->name, vfe_name) ||
>>  		!strcmp(clock->name, vfe_lite_name) ||
>>  		!strcmp(clock->name, "vfe_lite") ||
>> -		!strcmp(clock->name, "camnoc_axi"));
>> +		!strcmp(clock->name, "camnoc_axi") ||
>> +		!strcmp(clock->name, "camnoc_rt_axi"));
> 
> Just use camnoc_axi for both. Look at your bindings - why do you keep
> different names for same signal?

I think the correct question to ask is:

Is camnoc_axi going to represent the other (NRT) clock in this
setting?

Konrad

