Return-Path: <linux-media+bounces-34060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B64FACDE6C
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 15:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D0C171F14
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 13:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C3A28F937;
	Wed,  4 Jun 2025 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRCsfPn2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179FA28F939
	for <linux-media@vger.kernel.org>; Wed,  4 Jun 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042011; cv=none; b=YP4sS+Vf5qxA/xn9s1gaYFp7aO+b8OT/jf6o7CBDQTrM6dnTBfOpA9vJ3vyYfD6z6O/bK8fLmwTi2+gtpVpYjd/sweEGwEoO3lEO6yy1PP/moRsWK1wAIAdh1cK2DqmRFHJG/6CC1N0wWWFnI9DkcMUssFpy8c6qV/OXzKmPvRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042011; c=relaxed/simple;
	bh=8XVhguz1+Ed3YcXtVsOgIGoJBaQuam99SMuhMvkOoBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKLc+4W8xuJwYA1urk1wJ1mYH3UsMyBALWDlgbhFvXMYg81YGTa9sQR3yFDDaEHMpDU73R5kIewqlpV50is9Aq76dc+nOA8MUWBhnr0XRvCDd9M+anVF2IftJcUysw0HD0kj0JINvFgSpwWPR62UUesXqDuaItp3fTwRL9FUxp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRCsfPn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548kAkq013495
	for <linux-media@vger.kernel.org>; Wed, 4 Jun 2025 13:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yULVZvEmG9t/23IJG8ShwjnKhSSSSZCNlyggUkvwyY=; b=MRCsfPn2CoGwnkir
	1jg+wgvLYQIX+E5BbJ2vWKbYgwI8Pht+dg9r7oCoajhFwawI0OZLZETd5UfJWhSw
	Y8dqZUa7egZgknY0YPGyLK59vJHQaEGuewv7+b+xO+dj0jzLwh9U+k+oKowz1nhg
	kWESiOHHBv1sLh8vYynXyumbrfnQj+vriomqFb9IBjV8FPZyddN6Cud4RpfFv/5y
	Nn5gsVXg1n6Ttq7xasYEyYMQxxWcw27pcUL3s5qEomxD9LAHXGQZscElxovZYcy1
	EL8m0oDyLMfGJpmHl7v/1j0vdjPzgi7bWDCxtYoGwF9IbTMVZrF6WsSYRFSw8Wpg
	fTA4NA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8np2qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 13:00:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c76062c513so165016285a.3
        for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 06:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042007; x=1749646807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yULVZvEmG9t/23IJG8ShwjnKhSSSSZCNlyggUkvwyY=;
        b=PngxFz0yoDWxzjt2PsFZ5CfzX8FkWvthDsThaCU8nHgCHtUkKUJyeF/+QrO+1cdFT2
         D55UUsOZy1LgKMdakJFyo9b9BZLGNlNGyd4V4likYGceamG7+uGkIO/oQWqtMw0HavRZ
         h0xLZF8Z/V5XXq5tvjWPV15psRe0IjiQJ1pITxTM0B69yGbRZ2KD2Uu5pmGj0mHJMc72
         cGjVPv9Tw2dMTVX0vur9XSSXvcSMpxGDn/15YaeH4xOKBjCbeuUE5e+7Hi2nrSXA6ZrA
         PUOiBYmHtoqEJ9tyJ3ktwkirkjWQrdVF+na+hN7WwhxotU4zmO7P82orz5VjdsHQI3/m
         Lr8g==
X-Forwarded-Encrypted: i=1; AJvYcCWEPxPdGB4X8DvOaT1vjQo0YfI7dN0EbKi2hIEQm1jT2TEknfeDFBJoLlI5pBowZcyf27ycqrrn+yCxDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydIqWK9r9YuPY039TAVXRzIAmSdjUuFrA2yml5dg0xcw1CPi4g
	pnw59cMYLjpV/1IJX+ukXwfsf2ZH5Yv87NpeNWJGEH/cEBehYjIH/eceH/tDzFmBwt6LwI+4Ctm
	7gDmTIfNP5wQcPJFHZ81qKp1Ww9N8Nd05vELelofWsBM6ZoCnHb1DozbEsdmIHvjCcg==
X-Gm-Gg: ASbGncsE0NFrT/rnlNwRT/nWW6N8HypL+AjlBTGe26ApY5eAHXj6BnZB3ZShdRlJnvL
	7+JVKJkZuKdiDdwZPxc+8eC+tBtc+ZJWoLHDDsZbsBesHAdPCz3rTwzSotnefoQGOzD0L/6YKls
	XSjNwOXg9jT4El31bsxoiQSKsPCsGXEOKzO29PnWFRYaBavSXT6Aeagqpg4jphAK1jEYqcrxsWV
	pgYVpTGiW4BUisckvMJq20eAkCUzCveKHyfQtmI7h5ciFkatSKrU9M/5y8bRmRFIg5wMLiQ1YHw
	2uy2bxS3xRZW8zCbDdbea4VXf8dErA8bSIgvkvSiwN2Nate7e8ENNnf0XdduTuKm8g==
X-Received: by 2002:a05:620a:191b:b0:7c9:23d7:6dd6 with SMTP id af79cd13be357-7d2199090a7mr174140685a.13.1749042006678;
        Wed, 04 Jun 2025 06:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn4xJuvGOLTe7ZTBVF2ik8xPdkhjFGFOvWwDjwbyfQtIsf2eqrG3bthpaWtCLfw7+RR9Tkxg==
X-Received: by 2002:a05:620a:191b:b0:7c9:23d7:6dd6 with SMTP id af79cd13be357-7d2199090a7mr174136985a.13.1749042006140;
        Wed, 04 Jun 2025 06:00:06 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39565sm1094145666b.134.2025.06.04.06.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:00:05 -0700 (PDT)
Message-ID: <aeda0cf4-fd8a-4f3f-a3ea-922d5b0ceec0@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 15:00:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
 <4504e16a-f4c4-1f68-fa91-d3641a3decbe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4504e16a-f4c4-1f68-fa91-d3641a3decbe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dzFceKDJoJvY8bolpq9JWy-28wGkOU1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA5OCBTYWx0ZWRfX9ZcEL1IcjxSL
 FIJ5KMWEYc++CFj8H3HSuovQTkk3+w/Ljz1P1MWGrD+YbibIqyVJAa2dKyPJM/lsKtl2we0vJlv
 rAx3eWbBc/qHtz7RVflxEV3kY/gPcpt4WrVvmIHy8ZuRDV6JIS3NqyO45eyvzA9l2JOfFRXeWjW
 L24rpxLXa1S5aLt7woSPMpAZtD5zN5nuCVguhsfMn636Ix7GSbcYnigNJ5cOrF7VGTEeoghAiP7
 0/rpX40GPVT49HXMZ03USOMh7LETyU4ImjT1AySVLoEuaoG6BjIqHIiZys47MRgIANjbU62TWMI
 LjU8xsDXEkfXzGamkdfO2c7gbA7A+5yvB0PnBwbLTzAsMVLfMcDZZlPqcBv02e0D4ngSdmpGCQu
 mXJ+ZCW8B4QJrMLkijiGR2Zx59Lhrv7bMA7/rWQRTarKgsc6DjQb5gDsKB7Wae48rIUvTYRP
X-Proofpoint-ORIG-GUID: dzFceKDJoJvY8bolpq9JWy-28wGkOU1_
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=68404358 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=beIa89I-peMrsPrHJCYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040098

On 6/4/25 2:35 PM, Vikash Garodia wrote:
> 
> On 5/31/2025 5:52 PM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Fill in the correct data for the production SKU.
>>
>> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index d305d74bb152d21133c4dfa23805b17274426a5c..2bb514c322692475ed58198e17f906f894d81cf4 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -709,11 +709,11 @@ static const struct venus_resources msm8996_res = {
>>  };
>>  
>>  static const struct freq_tbl msm8998_freq_table[] = {
>> -	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
>> -	{  972000, 465000000 },	/* 4k UHD @ 30 */
>> -	{  489600, 360000000 },	/* 1080p @ 60 */
>> -	{  244800, 186000000 },	/* 1080p @ 30 */
>> -	{  108000, 100000000 },	/* 720p @ 30 */
>> +	{ 1728000, 533000000 },	/* 4k UHD @ 60 (decode only) */
>> +	{ 1036800, 444000000 },	/* 2k @ 120 */
>> +	{  829440, 355200000 },	/* 4k @ 44 */
>> +	{  489600, 269330000 },/* 4k @ 30 */
>> +	{  108000, 200000000 },	/* 1080p @ 60 */
> What has ideally changed in production SKU which led to this change. Pls add
> this info.

I have no clue what's the root reason for the clock plan change, probably
some hw bugs were ironed out and higher clocks were deemed stable

Konrad

