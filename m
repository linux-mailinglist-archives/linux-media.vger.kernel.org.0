Return-Path: <linux-media+bounces-16478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41971956BFA
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 15:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9CF81F22D2E
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244A1171E49;
	Mon, 19 Aug 2024 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NpwJSqVh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAAE16CD03;
	Mon, 19 Aug 2024 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724073820; cv=none; b=gNR7jhTkMVvapleEoV/7zPzdfP+UK+0HDsPizmtFAf8g9GupH4mZ3DQ3Gk49o/qSf1znUljX153HYZWSLgPnXl1S17YlQYS9U8VrzrcAydKYfNZcDhDd4Co6i3Mv4rKUYMKBOrAD0C0SJFdJESnilD33zsyDhFCTfn4gnjBBOWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724073820; c=relaxed/simple;
	bh=YSf+eW5u5NfoYnAFJvh9pqJp8WJuTlfbt1ypK+6t/7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MfdT8LFEvLMnKIgblMB2Bq8rcU2mCGydiqzE6QiW1mQxQs6V/WtpYYHn8Jv8dH+t8majiBkEkAOsP0vd+ct/6MyrYuibA5Z2jr6wT5I6Av8X8T8nLnCKsPPE87+jFpcRv8kz/g5bC+vod0xvVwLIAJgL/c1UKvMulnPGQXX8XwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NpwJSqVh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JB3K0Y014962;
	Mon, 19 Aug 2024 13:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oixwhcpEE5RE2QstJiPqH40hgbkJQqFojPY5xt4DxU0=; b=NpwJSqVhNjQFLuso
	AkYQZ5vnHq0/1YCQFzShGN76rnRxd+VQUSVFJEASU4mmj5c4+iAwlhuy7gBpSS/1
	t5eHS47yroBh2+xiWh91Ix9IKT4J+yWryRlTkmo0RhZ1pWgJx1UMLVVrLpchRz9K
	6Lj2ygd9tYH8SuGmeyoYBx/CCvYrZwb2wfN/PKSHCoNqRijWDTLrRAEnRlEqvULV
	DIVNY5mhLi6viggiRq+AGyQYKHVKkU935ooLResvOTTonshVKDC6XeLxOdt8+h9Q
	DTmSUFhqvxLk/+bR/HYZX2ki1+Htg01M/GcwJP8BVqeVNXFGqeBWrjFBaYZZhvB5
	Zg3WKQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412h7n4jcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 13:23:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JDNXbv014618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 13:23:33 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 Aug
 2024 06:23:27 -0700
Message-ID: <1633e348-5b81-4ca6-bdb1-04bd8f81c6b8@quicinc.com>
Date: Mon, 19 Aug 2024 21:23:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
 <a1aae525-4d38-4520-a6c0-0905f87922fc@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <a1aae525-4d38-4520-a6c0-0905f87922fc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ih8nEOd881MUtb46nLxO4ChYDFqQf_OP
X-Proofpoint-GUID: ih8nEOd881MUtb46nLxO4ChYDFqQf_OP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_11,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=901 mlxscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190089

Hi Bryan,

On 8/16/2024 10:21 PM, Bryan O'Donoghue wrote:
> On 12/08/2024 15:41, Depeng Shao wrote:
>> +#define CSID_RDI_CFG1(rdi)        (0x510 + 0x100 * (rdi))
>> +#define        RDI_CFG1_DROP_H_EN        5
>> +#define        RDI_CFG1_DROP_V_EN        6
>> +#define        RDI_CFG1_CROP_H_EN        7
>> +#define        RDI_CFG1_CROP_V_EN        8
>> +#define        RDI_CFG1_PIX_STORE        10
> 
> Hmm - is bit 10 valid ? I'm looking at a register set derived from 8550 
> and don't see it
> 

The bit10 is valid in sm8550, but it isn't there in sm8750.

>> +#define        RDI_CFG1_PACKING_FORMAT        15
> 
> Bit 15 selects either BIT(15) = 0 PACKING_FORMAT_PLAIN or BIT(15) = 1 
> PACKING_FORMAT_MIPI
> 
> Please give this bit a more descriptive name =>
> 
> #define        RDI_CFG1_PACKING_FORMAT_MIPI        15
> 

Sure. I will update it.

Thanks,
Depeng

