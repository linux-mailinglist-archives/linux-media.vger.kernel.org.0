Return-Path: <linux-media+bounces-15650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21994334D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 17:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03B991F26288
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 15:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7B81BB6B2;
	Wed, 31 Jul 2024 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XapxsSmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE21175AD;
	Wed, 31 Jul 2024 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439622; cv=none; b=VnMRseJz9mj2Qh4hk039ATXPOw77J311S3oaZLswCIsitZ+mozrvf4AHMOc9KiU2jfyKluHgve2BVvSzas108n4lfDk+tplZiTgdoYdo9+ErtPNISbbDyW71Hn5Nwef7cM+fGkO4AVFHNl7s2aIW3LHDYtI3UJHDS57P0R0nUDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439622; c=relaxed/simple;
	bh=xlVXJTltyvwIM/w9oLuPNA1w8gzTyzCODLdz1A29V9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fLvnhg9iB+rd0+HQ1NrAGYjJTHSSL4z9EC2osowshZMiMhSTmxAbU4iGWrsUba8ckjAcrDB5D045Ch1a6QKR8U5AJdUa+b1E37hd/XUF8Szrwq48dIxhtJQPY4n5ACYoY9HIHe1rSqH6P511zm4KIG7fX0UibjIKaFfc6jA/1gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XapxsSmt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VEw0Pg024584;
	Wed, 31 Jul 2024 15:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/xOc1hUJllJuChrY3GqwokQnmrZa8UujGSupwupXxQ4=; b=XapxsSmtpMBpYo1L
	KI7vp2mogvV9bgdUVauwYt0V0NHM6m1xl5Sd795ms0I/h2JjiD3Uhi0WgUARspBk
	zSg7dk9ujq0SAromf4jInvqZfClwuX0DpvuWqoJb8JNmWslPUoV7cYIapYbGZEfu
	6Pz309jG9uxPOuywJQiypbWcRKGwfZJkDZaSNnC8+6un0THQRD508TLBmOZ0+bCh
	kCtCbfEPHpuZWYy3VCMh2EaVUKWfhzHKmY9d1iceE79SyFVxC+QxbrmCGPIT6ZSW
	WtIqzyBRU9GyJBQig7liAyUZVOMd5UUiBy/WSOGBqJ4LHi+weTlOPywFWZUZoHBH
	1bSCrg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms43bjrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 15:26:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VFQtVK003067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 15:26:55 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 08:26:49 -0700
Message-ID: <3011c561-d39e-4ce5-a544-33f24ca7a67c@quicinc.com>
Date: Wed, 31 Jul 2024 23:26:47 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
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
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Lt6iVAIEdB-EMP0r-atWRj_ExhUm7xBh
X-Proofpoint-ORIG-GUID: Lt6iVAIEdB-EMP0r-atWRj_ExhUm7xBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310108



On 7/11/2024 7:12 PM, Krzysztof Kozlowski wrote:
> On 11/07/2024 13:08, Depeng Shao wrote:

>>>
>>>> +
>>>> +static void csid_subdev_init(struct csid_device *csid)
>>>> +{
>>>> +	csid->testgen.modes = csid_testgen_modes;
>>>> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
>>>> +}
>>>> +
>>>> +const struct csid_hw_ops csid_ops_gen3 = {
>>>
>>> Isn't there a warning here?
>>>
>>>> +	.configure_stream = csid_configure_stream,
>>>> +	.configure_testgen_pattern = csid_configure_testgen_pattern,
>>>> +	.hw_version = csid_hw_version,
>>>> +	.isr = csid_isr,
>>>> +	.reset = csid_reset,
>>>> +	.src_pad_code = csid_src_pad_code,
>>>> +	.subdev_init = csid_subdev_init,
>>>> +};
>>>
>>> Your patchset does not apply at all. Tried v6.9, v6.10, next. I see some
>>> dependency above, but that means no one can test it and no one can apply it.
>>>
>>> Fix the warnings, I cannot verify it but I am sure you have them.
>>>
>>
>> My code base is next master branch, do you mean the 'declared and not
>> used' warning? I don't see this warning with below two version compiler
>> even though I just pick this patch and pull the code the latest version.
>> But it indeed have this issue, these structures are declared and will be
>> used later in "media: qcom: camss: Add sm8550 resources" patch, will
>> think about how to avoid this.
>>
>> aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
>> aarch64-linux-gnu-gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
> 
> That's some old compilers... I am talking about recent GCC, recent clang
> and of course W=1.
> 

Hi Krzysztof,

I'm preparing the next version patches, then I find it is hard to avoid 
such warning if only apply current patch, since this will be used in the 
below patch, it will be in structures csid_res_8550 -> sm8550_resources 
-> camss_dt_match, so I need to add all csid_res_8550, sm8550_resources, 
camss_dt_match into this patch if I want to avoid the compile warning,
then I also need to add compatible info for it to avoid sm8550_resources 
has unused variable warning, but the sm8550_resources structure also 
need to add other items to make it complete, then the driver will be 
incomplete but can be probed with this patch.

{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },

https://lore.kernel.org/all/20240709160656.31146-14-quic_depengs@quicinc.com/

Could you please share some suggestions?


> 
> 
> Best regards,
> Krzysztof
> 

Thanks,
Depeng

