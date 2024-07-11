Return-Path: <linux-media+bounces-14909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2292E4FC
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C74FEB22001
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 10:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB77C159565;
	Thu, 11 Jul 2024 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l55EC+AS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165C158A3D;
	Thu, 11 Jul 2024 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720694622; cv=none; b=FpFyxkmWQF1lPCPICTIUnfsbhmzS1I47bV8jieYqGvnewR/Gp68Bo5zHEG/+K6Y3lXKjWO6/YItFYvGnD/Z6cVCpWm4T4joU/OA13dQiaRkHEXSc5od4coS62Q3IJiLvobIIG+WugKla47/fv1900BOtDiumkNrOHP2ljBR2Ipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720694622; c=relaxed/simple;
	bh=NJxJTR3P+kiU0nip4zpBJaqku1203eXHp0uBD73pSHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pmBqVuuS9WI3HQ7zUKuAbiY3BIoU7ZnjV9tyruizYeHFLZXOD7o7eSTqO0p0Vs9gJ8Ksf+KU76V6I+hJVJnfWPwhwmAqXitan39OZ/2hxmE7xxLVwmDqkcMJRTWmpBHuswG03eySYY2YlgIj/4frozQi9cLyxq2hOFaqFWy9Cls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l55EC+AS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B8YB1L032219;
	Thu, 11 Jul 2024 10:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7xGDNvFtiAJ7YW48F6fhgbTlE8DaCfBxvKUrrGMqB4=; b=l55EC+AS1ndX0D3W
	9ZGTe4rU2x9+63rRFw1zTtkDEV7I/WgHaBYWLuf/DPJ8M73wn969c/wxWq2LGBy0
	mzoWEenKWkurlajuyk/LcYIwSuGBg8zCDQsDuabX6NGwMw212+iZnrE7/sHjb3L2
	RQZmVQgJ6xcqqCy0dZ7MhHr2alCCsV7BvFa1HQbiGku1m+tCw0dgpxM1gtIG7zJv
	Lx8ksCHRKnUoWDAWT3UkF1/YX7wXAIhI0Hvs7Hd9BbgiSVTRbsgxHGzsvB0YljNd
	45GKfVCUc34WXPuac65Yg2PMB41amhbUcu8s/8ROOD+y4MeP1FTpp10SfbGmt5uS
	1kgfmA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ac0ggb4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 10:43:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BAhY7H023136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 10:43:34 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 03:43:28 -0700
Message-ID: <512c17fa-cd1c-4123-9128-efb0b00f55a5@quicinc.com>
Date: Thu, 11 Jul 2024 18:43:25 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-8-quic_depengs@quicinc.com>
 <0a3105c5-7cb4-411a-9779-d89600925dfe@kernel.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <0a3105c5-7cb4-411a-9779-d89600925dfe@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ze6c49hjW20gMjblh0C3qr5sa3fO7tBl
X-Proofpoint-GUID: ze6c49hjW20gMjblh0C3qr5sa3fO7tBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_06,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxlogscore=882
 mlxscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110076

Hi Krzysztof,

On 7/10/2024 7:07 PM, Krzysztof Kozlowski wrote:

>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
> This wasn't tested so I am not going to perform full review.
> 
> Look at "Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
> qcom,sc7280-camss binding" - all comments apply.
> 
> ...
> 


Sure, I will follow the comments in 
https://lore.kernel.org/linux-arm-msm/087e7f29-1fa8-4bc2-bb3d-acb941432381@kernel.org/

>> +
>> +required:
>> +  - clock-names
>> +  - clocks
>> +  - compatible
> 
> Keep the same order as in "properties:'.
> 
Sure, I will update it.


>> +
>> +            reg = <0 0x0ace4000 0 0x2000>,
>> +                  <0 0x0ace6000 0 0x2000>,
>> +                  <0 0x0ace8000 0 0x2000>,
>> +                  <0 0x0acea000 0 0x2000>,
>> +                  <0 0x0acec000 0 0x2000>,
>> +                  <0 0x0acee000 0 0x2000>,
>> +                  <0 0x0acf0000 0 0x2000>,
>> +                  <0 0x0acf2000 0 0x2000>,
>> +                  <0 0x0acb7000 0 0xd00>,
>> +                  <0 0x0acb9000 0 0xd00>,
>> +                  <0 0x0acbb000 0 0xd00>,
>> +                  <0 0x0acca000 0 0xa00>,
>> +                  <0 0x0acce000 0 0xa00>,
>> +                  <0 0x0acb6000 0 0x1000>,
>> +                  <0 0x0ac62000 0 0xf000>,
>> +                  <0 0x0ac71000 0 0xf000>,
>> +                  <0 0x0ac80000 0 0xf000>,
>> +                  <0 0x0acca000 0 0x2800>,
>> +                  <0 0x0acce000 0 0x2800>;
>> +            reg-names = "csiphy0",
>> +                    "csiphy1",
>> +                    "csiphy2",
>> +                    "csiphy3",
> 
> These (and many others further) looks misaligned.
> 
Thanks for pointing out this, will fix this.

> Best regards,
> Krzysztof
> 

Thanks,
Depeng

