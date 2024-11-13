Return-Path: <linux-media+bounces-21345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF59C6882
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 06:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52231F23DC8
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 05:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67795173357;
	Wed, 13 Nov 2024 05:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YgaIEyB3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A74482EB;
	Wed, 13 Nov 2024 05:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731474687; cv=none; b=uD2W66fkw9kC/97FYhd9vik6IDOBYPiRIflAIGre3IsRQU2dhyywa9uPlfs66F5zKthJye+JKuczaxqE++DhlJoEymUxq9piQZ7t2NikXK3nRp7ZqUxiJX3qMMceRQJv/F0m2P6HGuEkTbA7qERbJRCClSFSLdA6kOJuOnX9cV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731474687; c=relaxed/simple;
	bh=W97w2EhpXBYqYDdQ1VgM8J6Kxg2Y19x6m56CpON5biQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iRSwawYOfGIqCwRQlLaQBVmM2SW45m+LycVu3//Q+hrx9UGns4Zs3VqefsNDU86r/Ybgh9NaZHVbylKm6tU2zkhXfmyUTC6Jd4TMG8ng2tsPv9Nc5pLWfoFHm5EFIXJkJoIndEQ6b54UZ14xunVDo3+deALYVMP+Y52T970XEFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YgaIEyB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRbQX019664;
	Wed, 13 Nov 2024 05:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keh2Jn4OXq7zFKPaufb6xmS/upvzZeUfKJ+YDmAeECI=; b=YgaIEyB3GxolkKxP
	jIteKshl49DZxZIUhguhYyIdC8yl8bjgaDkOcHgANPQm8d8iRLbdLn8DU98IF9G0
	PraIe8NeVeN2KR8EnT7UqE0wus26jiK6DsgJKMiOWy6Tr4oqO5nZg/Z3OysH2iNv
	hcREbJFIxw3zbn64OMtdAf8XNv2Jmn0W6KFa2tZVWny7GBFsKwQpR29xNONCd76B
	yRlTkov+6Agt1Nh5koWUZ+o7huL5c6hrrQ6v6bRoFHgMVCqrcHMhwmpxJVGkv9Ka
	orcUeDL3zEncDTmW31MEvJQeFoBwJ/6dF+oQcEcKGjyF4zgx1XDT9uWMBZ7s3KvS
	itIzqA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1h6kawh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:07:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD57Wjd006308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:07:33 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 21:07:26 -0800
Message-ID: <0b6fea6c-4144-09e3-bf83-3844f00138d4@quicinc.com>
Date: Wed, 13 Nov 2024 10:37:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 02/28] media: iris: add platform driver for iris video
 device
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-2-a88e7c220f78@quicinc.com>
 <ab4b80fa-6321-462a-ba1d-151424d1c94f@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <ab4b80fa-6321-462a-ba1d-151424d1c94f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fFRbq6MzMRPRoMC_R5nlYy7SuQbEFCS1
X-Proofpoint-GUID: fFRbq6MzMRPRoMC_R5nlYy7SuQbEFCS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130044



On 11/9/2024 11:02 PM, Bryan O'Donoghue wrote:
> On 05/11/2024 06:55, Dikshita Agarwal wrote:
>> In preparation of adding H264 decode functionality, add probe and remove
>> functions and platform data to initialize iris resources, which are
>> clocks, interconnects, power domains, reset clocks, and clock
>> frequencies used for iris hardware.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/Kconfig                |   1 +
>>   drivers/media/platform/qcom/Makefile               |   1 +
>>   drivers/media/platform/qcom/iris/Kconfig           |   9 +
>>   drivers/media/platform/qcom/iris/Makefile          |   4 +
>>   drivers/media/platform/qcom/iris/iris_core.h       |  54 +++++
>>   .../platform/qcom/iris/iris_platform_common.h      |  35 +++
>>   .../platform/qcom/iris/iris_platform_sm8550.c      |  37 ++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      | 237
>> +++++++++++++++++++++
>>   8 files changed, 378 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/Kconfig
>> b/drivers/media/platform/qcom/Kconfig
>> index cc5799b9ea00..4f4d3a68e6e5 100644
>> --- a/drivers/media/platform/qcom/Kconfig
>> +++ b/drivers/media/platform/qcom/Kconfig
>> @@ -3,4 +3,5 @@
>>   comment "Qualcomm media platform drivers"
>>     source "drivers/media/platform/qcom/camss/Kconfig"
>> +source "drivers/media/platform/qcom/iris/Kconfig"
>>   source "drivers/media/platform/qcom/venus/Kconfig"
>> diff --git a/drivers/media/platform/qcom/Makefile
>> b/drivers/media/platform/qcom/Makefile
>> index 4f055c396e04..ea2221a202c0 100644
>> --- a/drivers/media/platform/qcom/Makefile
>> +++ b/drivers/media/platform/qcom/Makefile
>> @@ -1,3 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   obj-y += camss/
>> +obj-y += iris/
>>   obj-y += venus/
>> diff --git a/drivers/media/platform/qcom/iris/Kconfig
>> b/drivers/media/platform/qcom/iris/Kconfig
>> new file mode 100644
>> index 000000000000..34a2f81c5db3
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/Kconfig
>> @@ -0,0 +1,9 @@
>> +config VIDEO_QCOM_IRIS
>> +        tristate "Qualcomm iris V4L2 decoder driver"
>> +        depends on VIDEO_DEV
>> +        depends on ARCH_QCOM || COMPILE_TEST
>> +        help
>> +          This is a V4L2 driver for Qualcomm iris video accelerator
>> +          hardware. It accelerates decoding operations on various
>> +          Qualcomm SoCs.
>> +          To compile this driver as a module choose m here.
>> diff --git a/drivers/media/platform/qcom/iris/Makefile
>> b/drivers/media/platform/qcom/iris/Makefile
>> new file mode 100644
>> index 000000000000..7e701361492e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -0,0 +1,4 @@
>> +iris-objs += iris_platform_sm8550.o \
>> +             iris_probe.o \
>> +
>> +obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h
>> b/drivers/media/platform/qcom/iris/iris_core.h
>> new file mode 100644
>> index 000000000000..dd0e2650641a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#ifndef _IRIS_CORE_H_
>> +#define _IRIS_CORE_H_
> 
> Its more usual to do two underscores __LIKE_SO__
> 
Noted.

Thanks,
Dikshita
> Once amended.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Please remember to similarly update other headers in your series.
> 
> ---
> bod

