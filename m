Return-Path: <linux-media+bounces-24376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E01A054C9
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 08:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4006F188795F
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 07:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4001DF255;
	Wed,  8 Jan 2025 07:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zng4Fyc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8BB1ACEB5;
	Wed,  8 Jan 2025 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736322234; cv=none; b=NxEMgBDhGjyJZxzhsTZ1nnTUIM+iAjWM+08YdOnzykNLm/VdaU36N7N/EhjqJ+EvBpy1cuEvkHzCRlL/h+OMSH9UmSm7HQmIQpYoEOBd/cSSsZ/Hw7IkQ9oeMZh/zSqZ3IWm9PJOO9InU8E69xMJkcPA2A8yxC3OsF/CGhxY+a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736322234; c=relaxed/simple;
	bh=roTKW0qw5bh/ciC5rq0FEILHh2JYr3z2j9E+iBwFb8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RQyNFjaiXzeWixVf9YlemTPy8pSagecSMXxOUHThR+FAp2vyG5xrz79CbS4mzWJ05VAebr6nKTXR4MAKTFJrru2bTPHHE0rv4ajPA1zS9KJ1nrBPdhcWa+WvXDnPMX+mtu7XzK6IMyRDG7R8Tm07+Wb6UoQDq5g5bNV2YvGkTzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zng4Fyc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5087DZFj004786;
	Wed, 8 Jan 2025 07:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ILEy8wtGyT2XiIzpO9wj2LuRuMBOHb574f8rabKaOA=; b=Zng4Fyc6Rk6lcg2+
	hTVMFmGKL5cf4fHhabFdniTi3C776pAjUtnKCF4+FkSIBVzNjmqeNijI8g7JZFOk
	VOBvKkEjPlouPLNO8yv2lEBw4lbE71ZB55oEzUoGCGKjSnxuLhMQM3/CvVVqTIjz
	1eQg+Nntxxw57X7GZlE+WA/Tt8ZPWT/vs3NfbVIpZaZu+v/xzKDDWYHZZX3O/J7J
	QTij3IUyJpr4yn5MO3kNcYeaGzFPItwbLmGMLGu9pTkxzsh0on8QT8iy5pgQJ2ON
	eSAU1u/bk1egZ9gNtcEuMgHrZvlbsC1k/zrSxqL380CsU5ephie13pMqbG600h4J
	bkebaA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441msq02dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 07:43:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5087hgcm031941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 07:43:42 GMT
Received: from [10.50.21.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 23:43:34 -0800
Message-ID: <c0f59149-713b-45e4-3755-4a52cfaa93f6@quicinc.com>
Date: Wed, 8 Jan 2025 13:13:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <20241223113027.21b8f7ab@foz.lan>
 <fbe0d935-a3cf-dfa0-aad8-56834a0a002c@quicinc.com>
 <635ce4ed82aaca422b869f467300b0eccf9c8703.camel@ndufresne.ca>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <635ce4ed82aaca422b869f467300b0eccf9c8703.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2OkR7CBqKcZJX_9RyGE8SysjUZwyDmG0
X-Proofpoint-GUID: 2OkR7CBqKcZJX_9RyGE8SysjUZwyDmG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080061



On 1/7/2025 7:27 PM, Nicolas Dufresne wrote:
> Le lundi 23 décembre 2024 à 16:21 +0530, Dikshita Agarwal a écrit :
>>
>> On 12/23/2024 4:00 PM, Mauro Carvalho Chehab wrote:
>>> Em Thu, 12 Dec 2024 17:21:49 +0530
>>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
>>>
>>>> +	.dma_mask = GENMASK(31, 29) - 1,
>>>
>>> Setting a mask to GENMASK() - 1 sounds weird. Is it really what you want?
>>> I so, why?
>>>
>> Hi Mauro,
>>
>> the value of this dma mask should be 0xe0000000 -1.
>>
>> The background for the same is, 0xe0000000 onward memory space is allocated
>> for IO register space so we are restricting the driver buffer allocations
>> to 0xe0000000 - 1.
>>
>> Based on the comments received in the past, we are using GENMASK to
>> generate 0xe0000000.
>>
>> Does this answer your query or I missed something?
> 
> I'm not sure it will do what you want. (0xe0000000 -1) matches ~BIT(29). Perhaps
> you wanted to use ~0xe0000000. 
> 
value of dma mask is coming as expected with GENMASK(31, 29) - 1

qcom-iris aa00000.video-codec: dma_mask DFFFFFFF (0xe0000000 -1)

Thanks,
Dikshita
> Nicolas
> 
>>
>> Thanks,
>> Dikshita
>>> Thanks,
>>> Mauro
> 

