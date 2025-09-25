Return-Path: <linux-media+bounces-43134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71C9B9E036
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 10:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58170323D2C
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 08:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3339D270545;
	Thu, 25 Sep 2025 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbYmaUXC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D93C01
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758788256; cv=none; b=CgcT3fa86TChFaBJpW1SGJ+kDs0326nUGGytvA4VwXDY+tkYKO34CJoCD2n/dpRhCjp7r6iQym7XFMePOspAeWVdEYT+MzyZRjBloA9inVHuj2gcLTGQLmjyQQzPLBewjYfnlUJbouBOI8BCDFRuH99X7EMx4m9M7hDBt+1mGrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758788256; c=relaxed/simple;
	bh=ju12c3zjPCtwHhJY5tJSfmtZsr1XQWEIbv3qoFgD6pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7GST+qIcVVUslOjHwNiq4vlgcqZ9iYXFM6zany3UnByIdz0CoGUQYUDBZh/Vs6t84va2uO8tXQ5ip6xvr7gB1LRUX1riS+zcOrrt+OZm/LJJOWQuikL6Ca91ID0NElHqmXOFu6NDxMzYsfQBHSUCP+1j5563qeCKYsdSq+4+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbYmaUXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONKYv3002710
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/fLKQEQMFjt1N2xpVRrqiWeNYSDottJz1+F03bmyEkI=; b=kbYmaUXCQi8bHp+K
	wd35uNqqFInk6kWa3kLXOQS1zizK9CcAdrSjRGpv6Zj4Tb8pG/0YReliECEbIF27
	UAfCEt09lYfdLOEHgK57vXFMnfuKNEC+C+OKXyLPQQ0onC92EJcZd66pXnxnMyaw
	m+1KGpg0zJ9I2fQ/rorZuwvZ0TXAGD5fxtoXVj1ym+zijcceZOmZhvKN5skmp+QG
	tsHiE+ucLlgEgivDGs2VehN1tWJ03Qm4A9ESsgV5PK6feim0HEpiocZClnV/xuWN
	ewQMA8xHVJ4+KtqN1qM0oL/0bvglsC62S2v4OrRlVDyRs+zXIAZ6aXi2rVDonMkA
	S2u6/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf1vd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:17:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ea7fcddd8so1251601a91.3
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 01:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758788253; x=1759393053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fLKQEQMFjt1N2xpVRrqiWeNYSDottJz1+F03bmyEkI=;
        b=WSSZGUgywJzRuUBKDeq01AGXwjCHBPqjiuqkw0+aMLDw4t8x5J3d2Nmgvy6eYOL8Hh
         NMpBmooIHV9pvHt1eMGISqxUgk+XvEZJHlCe4JZDlkDlVdEtdM+YQ3V+beINX53NF3cz
         pEU0oRk4WlJ6rKyKb1Iqz7zllOfXJf3ey9iUl46ZP/971nrmmP+BtK3YphGZ4yJ135nQ
         y0BUtEddBD/26DkVhxd0zm1WKiC6u5vXnVELKyG7RMF7nVguEkz7pYLMXx9MAKv3vcs8
         7K6v3IxrHKcudQOeWCvD0UWiKn5w2N4PMXPm/ZqfWJBqdreRPM5VBgcx/wdBnf0D576p
         2hUA==
X-Forwarded-Encrypted: i=1; AJvYcCXRrNDjRNPDz2QgHoEObTPxz6NyhRq9DOMODOQ2vF/g2KzX+r1tuiwxw31GTb1C8gQPlBu2VIFGhEthFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX2j9waP3SspGcd/sCymEC/XRdGvQd0gE+EuMw2COkxWrUPNFb
	7Sz18jRZw99Nvuu4L16Fc8p1SPDDs4b9H+burHihlBjhtUfzX4brXI3FQ2JCi1Rfh/gWruyoqhN
	4YZliISXV8YEFoU6JWTLn6ycpU9ASoW6WwpNKNyioY8ihJAPCYU3pW1ex75jhd2qbCw==
X-Gm-Gg: ASbGncupI3KFwtg8ruN3fR4CyDRpGbM+bkoFK3jiZZdeP9gQa4GRQNwKeqkr2uZZMXE
	iUYos2S19gYMzL/QNFRNWvb0zxVDeynLfGcv/elxZtTnhkTT9cz2TTH+uH2ShXY2o8GOhvM5FQm
	r5X8bRj6ZeBKBRtjwf0ESmhaqLp79r1sDPTHpJ4RcsCd8t8+ewr11wUlQSDeIWoomRJK2/jQRng
	P8Nx390AP+fpAM1WRmHYvhhMxByPM4PcqYzyH39xWFQHanrV1H8IhvhMDRVbtMUzG9uy8by7VjO
	xC5WjP7WeHUTB+JSYxr55ePQqTe5fpKT96nRBuDTLBAg8PRblJR4YoMvoMPLb0Te/RklYaRht6w
	=
X-Received: by 2002:a17:90b:4aca:b0:32e:36f4:6fdc with SMTP id 98e67ed59e1d1-3342a22bf5amr2775628a91.4.1758788253369;
        Thu, 25 Sep 2025 01:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3TdWftX0GIOeoRo8a4WJF4ISLW7hj+j1rgOCz2Hj1YzXysTp2Kbgg5cqycEtg6gU4pGGGlA==
X-Received: by 2002:a17:90b:4aca:b0:32e:36f4:6fdc with SMTP id 98e67ed59e1d1-3342a22bf5amr2775587a91.4.1758788252754;
        Thu, 25 Sep 2025 01:17:32 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be45620sm4866509a91.29.2025.09.25.01.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:17:32 -0700 (PDT)
Message-ID: <4c6f1216-9047-22ae-837d-992a47189018@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:47:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 8/8] media: iris: Add platform data for kaanapali
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
 <23b56m4xjblk27rgpuu5pn5zecv25laoo2yijk7r7ns4kkvfh5@4s2ijgt4qq22>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <23b56m4xjblk27rgpuu5pn5zecv25laoo2yijk7r7ns4kkvfh5@4s2ijgt4qq22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ejxKU-jaVRCCYgFqoZPWUQoQTEIRI5Xu
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4fa9e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rsDqbdP52k_1ZPLE-y0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXx7q7h73PdTHu
 ppFNrcm6497MDiKBCoaEWhoGHEvvxUa4TU/7LFED/4VhljUBY3Jhl6Dxy7l+nqoljrdRoZjkn9n
 +mQvHySOGGsMpf2rdlrI1Tbp1GuF+xEhNG/he181CaJTivGYWewms85fG+S+Vfg/S9XgvmpV7zv
 ZvD3PMg6ohwt95pBLuM9YkLX1NULeYdNOWMvnMVy7eXfAIo8TqqO+930M4kKO20BqpTS70KUC6f
 R4DGxTzayQEhzS0GpPv0ANgtNBfT6tYCcwDGOUtyOkpqx53k1H2rOkrx4oauUO72/nU9SsM3Vu1
 aCXTf7gwP86++m+/hZyvS+DDjGZHiHZqe60qzvcKk+2dwBs974KQQoyoeG1FHpQZWWUX3U1RkJ6
 CGPGbeEK
X-Proofpoint-ORIG-GUID: ejxKU-jaVRCCYgFqoZPWUQoQTEIRI5Xu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168


On 9/25/2025 8:14 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 04:44:46AM +0530, Vikash Garodia wrote:
>> Add support for the kaanapali platform by re-using the SM8550
>> definitions and using the vpu4 ops.
>> Move the configurations that differs in a per-SoC platform
>> header, that will contain SoC specific data.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
>>  .../platform/qcom/iris/iris_platform_kaanapali.h   | 63 ++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>  4 files changed, 154 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index d6d4a9fdfc189797f903dfeb56d931741b405ee2..465943db0c6671e9b564b40e31ce6ba2d645a84c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -46,6 +46,7 @@ extern struct iris_platform_data sm8250_data;
>>  extern struct iris_platform_data sm8550_data;
>>  extern struct iris_platform_data sm8650_data;
>>  extern struct iris_platform_data sm8750_data;
>> +extern struct iris_platform_data kaanapali_data;
> 
> Please keep it sorted

ACK. Started the development as sm8850 hence was kept at the end, and was missed
when the name was changed to kaanapali.

> 
>>  
>>  enum platform_clk_type {
>>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 00c6b9021b98aac80612b1bb9734c8dac8146bd9..142b7d84ee00a9b65420158ac1f168515b56f4a3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -15,6 +15,7 @@
>>  #include "iris_platform_qcs8300.h"
>>  #include "iris_platform_sm8650.h"
>>  #include "iris_platform_sm8750.h"
>> +#include "iris_platform_kaanapali.h"
> 
> And this

ACK

> 
>>  
>>  #define VIDEO_ARCH_LX 1
>>  #define BITRATE_MAX				245000000
>> @@ -1095,3 +1096,88 @@ struct iris_platform_data qcs8300_data = {
>>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>>  };
>> +
>> +struct iris_platform_data kaanapali_data = {
> 
> Hopefully can also be sorted.

Yes, this can be as well.

> 
>> +	.get_instance = iris_hfi_gen2_get_instance,
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index ad82a62f8b923d818ffe77c131d7eb6da8c34002..9a0db65dbdb2eedf3974bcb8a2327e664b556ccd 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -370,6 +370,10 @@ static const struct of_device_id iris_dt_match[] = {
>>  		.compatible = "qcom,sm8750-iris",
>>  		.data = &sm8750_data,
>>  	},
>> +	{
>> +		.compatible = "qcom,kaanapali-iris",
>> +		.data = &kaanapali_data,
>> +	},
> 
> And this one.

ACK.

Regards,
Vikash

