Return-Path: <linux-media+bounces-43214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A26BA12C2
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90492178996
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F5631C57B;
	Thu, 25 Sep 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oamREFjB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BEA1F4625
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828429; cv=none; b=Wf7uKnpn5w3wg42oclrr4LfvwP026lTKV6B8e23L+0Cw56V26q4Pmcd45X9evlTBCxCzzb+O6ogBC5EFdwWo2pGxZx1fKlp/vJ9+M1aZGJ0TqVFD+bpc/QHnTkYu2BDb7gYMfgiuvuPYOVj9/Qf5ErBvWq0rup/eIbSuSIIeVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828429; c=relaxed/simple;
	bh=Mqlcs0XkCOfvSQoESxCxYhyIHsmY6fFwTw3IEUOGwhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntAIM3qxLC/Q2sg49zftq2cCr5ei4XLg37xae+Q1PTjBN5DaKkxH7NGI3YNPu4QhMoO6vSqQOwQ04QciszjbjnWptzFsFMINGpf4fysMkHhZo71bkbOQn0IWjYcx00n7I9UYKi+U/1JRMNkmv9myNJwPkrgd1FPHaKC6P+/0N4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oamREFjB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPqKn024171
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gSKcPFjG9aPsKgb4wf4U5eNuAXJv6M7J93dBweMw8L0=; b=oamREFjBK3cJ5tVV
	FPktCA1M5mED3N/nioTAeQ39/G+G7zLiD6XBw5iPkRrF8lBZQTFeDjBsXNUEcbvi
	Z9Yr1U9NNx/GGH4+xyh0zPdbGLrfs3j0AYts8TkJta+BjWgCelUY4zCRANgFkb/S
	efTRcYXlgZ2ykmdowUWjgIjXoRiww/ePyTzgkH5j9a6CIQLxUO2K3Y2ZVzNdWYBq
	fJsaV006a+oLvzDl6Tc9sRFnyajxQv0lkMzMYMQTz0B9t7qnLuRy0sDoUDtY1/9U
	rBTYcJ8dFpX2DewfC080B69GI1pB6h/JH4nTcQg4JzVbjH7S40XyHuvXRZ1+UCMG
	0K3L1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qr4pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:27:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso2471666b3a.0
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 12:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828427; x=1759433227;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSKcPFjG9aPsKgb4wf4U5eNuAXJv6M7J93dBweMw8L0=;
        b=l4gg/G8nzi0AG48ZnOVJ6MhHCSL9fbQdV+FGXwU5sD0f9mG2SIZDASjEAUL1DyBKIU
         F9HjY+GHkfJUuB6CUy/uoYOWouz2By6Xfn0r/OxRyGCq4lP/axOy8k/aAI3L2AOHwz9N
         TbH8x/3jEW5CTyWQvw4xf/c8g/2pqM6dymN9vDAhB/tt2+0OKyVIVg/47H8sr6hMgy5I
         MYDhNG0Bu1XGd8KQ7HwAGsGfDSLQyNyjFEMQdPLImoRbN9a39rUmL4aQk3cwicVCiyLd
         SUFBoDfg4D+YCbjFUDPOA7MV9OmNyx0Hj/am0lxD7XRHT2GyDoKu9KUERHX7U3QLHcSs
         K48A==
X-Forwarded-Encrypted: i=1; AJvYcCXLtYl0afcX2xKTZsR8dpss3WrBOGqnWz48HnGF7ndlnfHSJc/F0+v67Yw7v24WVx/EQwc1TeGxkTDv0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1J5Bts0tkJe+WzTPxVdPZ6pL8+zpVGsx4X4X6f9b32+eS8iLO
	Paef3tGFd0nVAihwc8K/UF58iIVJy5go5480GdFt/FArJN94BEakSzkdhX9FDuO3r7uXcqif3hE
	BDZ4p1qf5jnx9MNUuFXy6t33onyJKweTRqx4Fl7AGjahLBRgUI0+3XbXN1y06GFMxCw==
X-Gm-Gg: ASbGncvnu2gZkP+Vl3JCOl+TnECNtGZSASn6g3kw++3Y0RUT74I3f1Ujjs4zps04rgL
	Eh8Sw3lm7STyZqI3v1qni8hE9nXIQs8VvikFsPFcflgqZItW0qmtwPc61Cx4tuleBUcUn8Ugy3w
	4EaAqeH0AwXu7r+x36dPBKmcTPWIJSsFJ7EPEtkWz3GHVJUFEWKbvFM4RD8n1M4YvaiYZuT1Q0s
	npBmOOJjDUQS0Z6JXeFnM7r/uBtdy8Im1PtCSigtaC51sANxfL3CghcavcnwEm2VZedsFa2VrlM
	+Q3KGEzidJQv2W4bDBNF/LB10A2qxtjgvBbqQzmM1lOKhMblNX90bWN8LajJWxhBhC1Ol16Diyo
	=
X-Received: by 2002:a05:6a00:1acf:b0:77e:81fb:709d with SMTP id d2e1a72fcca58-780fce9ed1emr4640141b3a.16.1758828426882;
        Thu, 25 Sep 2025 12:27:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMy6eOxzY8ypIS9vHQ/FKu9NN99OQ7DEYuKzsYPJuPA6rk37cVeqMdF6/e7OryjKzhbyy9Zg==
X-Received: by 2002:a05:6a00:1acf:b0:77e:81fb:709d with SMTP id d2e1a72fcca58-780fce9ed1emr4640112b3a.16.1758828426419;
        Thu, 25 Sep 2025 12:27:06 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06ff4sm2500386b3a.86.2025.09.25.12.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:27:05 -0700 (PDT)
Message-ID: <94f6754f-cc56-09c5-3730-3f36c22e4786@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 00:57:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/8] media: iris: Add support for multiple TZ CP configs
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
 <050b2cc8-ddbd-4a79-879e-4a2c9e7d95f0@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <050b2cc8-ddbd-4a79-879e-4a2c9e7d95f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uVV5D6L_2VyvU3aPjYS3wK908MxKG8VF
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d5978b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=i9OEk1DdV-OKGsAmNacA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+GYsFG7+tMoW
 CggvPfHOaj/1qn6WdzqXn9KyrKaweI89pFcslLi0E1B7UfRN3AMhnMUWFD4tFjA0j7ru2OC6VFo
 s/71vYI9zD8n0vb7Q8bQ5QMlSTBZ8NAQ18R/f6pvK7nT3gsTZD2RJcY2IDNG5U1zGupdZ1+yzO9
 8WVVPXWmlTDFVEzoirw3W8jhEfIvAQFAkn6RMcyp/r0jiYwRA4BPHdkR8ncoXJPceFUSigEOtf2
 PuXQoh7qqno0x9mXCWTlIiqnr80JlKZAhBnp15MC6y1okC4j/7KGpzrUyAeEr2mQmP8QOrkgGCo
 GyVfG47NeAu5QB6+943lagEIp82TWiCnMJr+xmasuFEfEK1G+zB5LUkhPewM4rstRxYsXgSKGt7
 PQttsxEZwpfyN5FEgrgrAsvPkDcdUA==
X-Proofpoint-GUID: uVV5D6L_2VyvU3aPjYS3wK908MxKG8VF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/25/2025 2:31 PM, Konrad Dybcio wrote:
> On 9/25/25 1:14 AM, Vikash Garodia wrote:
>> vpu4 needs an additional configuration w.r.t CP regions. Make the CP
>> configuration as array such that the multiple configuration can be
>> managed per platform.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>> -					     cp_config->cp_size,
>> -					     cp_config->cp_nonpixel_start,
>> -					     cp_config->cp_nonpixel_size);
>> -	if (ret) {
>> -		dev_err(core->dev, "protect memory failed\n");
>> -		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> -		return ret;
>> +	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
>> +		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
>> +		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>> +						     cp_config->cp_size,
>> +						     cp_config->cp_nonpixel_start,
>> +						     cp_config->cp_nonpixel_size);
>> +		if (ret) {
>> +			dev_err(core->dev, "protect memory failed\n");
>> +			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> +			return ret;
>> +		}
>>  	}
> 
> Do we need to do any "un-protecting" when unrolling from an error?

Not needed for unwinding part.

Regards,
Vikash

