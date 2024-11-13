Return-Path: <linux-media+bounces-21353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DD79C696B
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 07:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A922283CD4
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 06:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB7517DFF5;
	Wed, 13 Nov 2024 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O78RDty5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8DF14F9FD;
	Wed, 13 Nov 2024 06:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731480074; cv=none; b=pDBflM3mJu0kVArnnKnJjPjG+yCjtQ4dHhczwwqKDDc4tzij2I+svDDNDv0VG4JVHZ6Js1Nb0srCsJEcZsLOuDJnqxnNnEdZuwfsSG674rjr1PtXpolPWTkp69muVS6x5NghXPFCuaxG/+R6yAVCRC7eD3WHOjbYxSfE99cxlqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731480074; c=relaxed/simple;
	bh=6jGzoZSTrqpxWOHffw4hjBmrzX5oJaoEQw/zhe8qKR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=INkG8OuyUQjnH99j3CzufslrrC6zbKONFg4k3RBVGFpmtCnZIr3fxmZSE+bL8irgymMNKHTCMMDJBUKMjqH320P0EAlHLZP8aqwxvpPSawL2ZxpD45pxR35PYf2los1fTVjRDoS0DawAzmOHQeupjjniDLXwkPWKJhqVqwDIq8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O78RDty5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMSE1q016853;
	Wed, 13 Nov 2024 06:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjd0x4+aMePTPEPWOQbSIQ9vkSn/w8TthPteJF+RMPI=; b=O78RDty5pnVD+TgB
	Bmj8dl2Z2A+Kx+iwlo1gjqRCE8Mntit+FJPBBqZjgF/JkO6UYrkbz5MnjaoxtUxS
	hmp3TaqQhLdl7QCqtEXsFqjjGPzDXs7VHN9P0XiLTGtl688VPse7GNGewjfk4HjW
	uNn8GXVE18vLdFsAaabr5ITQa9L/q3s66pf+nEyUi5H5LmS9taIgKa1hMYhHwRg+
	qRqsyG0WeSnJxYxsBQ3egPAVe8iydVS5cO9qXroshGkjDsa3XiNjIEnWz42lEd4h
	5+xQG9lJRYMwDu3qmlGbRlh8TH9H5+w5VQslscQYj0pfj4+g3+MbJB/hLhYVPx2r
	vphcXQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y33ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 06:41:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD6f1Ux005034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 06:41:01 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 22:40:55 -0800
Message-ID: <e068e3bf-cec3-13d0-8166-6e51f43f31df@quicinc.com>
Date: Wed, 13 Nov 2024 12:10:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>
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
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-27-a88e7c220f78@quicinc.com>
 <ZyoqGaSMc2z9xsr1@localhost.localdomain>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <ZyoqGaSMc2z9xsr1@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qOo9vppuYAzJm_Z_d0pOolJRdKMD0F1H
X-Proofpoint-GUID: qOo9vppuYAzJm_Z_d0pOolJRdKMD0F1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130057



On 11/5/2024 7:52 PM, Jianhua Lu wrote:
> On Tue, Nov 05, 2024 at 12:25:47PM +0530, Dikshita Agarwal wrote:
>> Initialize the platform data and enable video driver probe of SM8250
>> SoC. Add a kernel param to select between venus and iris drivers for
>> platforms supported by both drivers, for ex: SM8250.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
> [..]
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> [..]
>> +struct iris_platform_data sm8250_data = {
> 
> You should qualitfy it with static too.
> 
>> +	.get_instance = iris_hfi_gen1_get_instance,
>> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> [..]
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 7b7378b7abb3..4cbaa889322e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> [..]
>> +static bool video_drv_should_bind(struct device *dev, bool iris_driver)
> 
> Variable name iris_driver isn't good enough, rename it to
> is_iris_driver please.
Noted.

Thanks,
Dikshita
> 
>> +{
>> +	if (of_device_compatible_match(dev->of_node, iris_only_platforms))
>> +		return iris_driver;
>> +
>> +	/* If it is not in the migration list, use venus */
>> +	if (!of_device_compatible_match(dev->of_node, venus_to_iris_migration))
>> +		return !iris_driver;
>> +
>> +	return prefer_venus ? !iris_driver : iris_driver;
>> +}
>> +
>> -- 
>> 2.34.1
>>

