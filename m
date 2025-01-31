Return-Path: <linux-media+bounces-25497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF1A242E7
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 19:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8035F3A896B
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 18:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA617081F;
	Fri, 31 Jan 2025 18:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e4QjTOBv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F4A1F2369;
	Fri, 31 Jan 2025 18:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738349085; cv=none; b=puR278EfusnL0WK77JQN5Enk9By4HaSd0/dnGDp9+2bq+aKSV8V8RDhX4FP9BNi40mxeWq9VKr8oMB0PP5y+uPrL6vlSs8o25huc1sLcyxJSY6KrIoDf0t/NV21KrYxHO8sMHXHna1aYw2ixzPLEET0Cd2dMxCC+rH5T+cYYBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738349085; c=relaxed/simple;
	bh=QT6yDDpY3Aww1TZHRbkusavKjiT2Q9VMyx4Q74lPHuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CS6fQ02f2Py2u6nmQIEZMRpKUUw9+t908uB6vJmqeBT3Dw2XQc+jWQ95pub/K4Fv3l2wEflZaI7GIbnaQtYbBkEZF0ZfQOiooobOPTwuy7Ys7BFJVlT86bRWIRV4ZEd+saZfg6GTsaFA5cLJuzzzYfKKMiQBykTDbd/8M1hSBrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e4QjTOBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDKtfP005587;
	Fri, 31 Jan 2025 18:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0twvhun7z2cIKk/n1CtvBtho/njMeo2PoMa8LvH8kYQ=; b=e4QjTOBv/4sr3TPC
	4nqtzTexrgEuUSE+xHxGSmftHpeU4zn4ekk1v+DJNIBejxVzoKVJTkiJfzOCki3F
	T7kYzXy2VwV9SIga4EP+eCpBIOrLqMZYByw6SKo1IS6q35LBLfNzPSaZrjlHdlfl
	813jK9QJkAP0NpZTpJJpR0o1sJI3D2aiVrADymbyMYuJq3NPZYYc8t5NFSZjiRLt
	u0f5LP+Pv2FQX41XdQNM4doSU+kFUcqFkUTNDu424EuTSmPkW9fbrWAWRmSJ/SRf
	Scz02zeGwFiz+2cmNefz/c4t+QaGWJnVBSgPafLmxx4pcYbM2s7Qxp9VfJct84/z
	7F0DdQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gyasrra3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 18:44:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50VIiV4j024830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 18:44:31 GMT
Received: from [10.110.122.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 Jan
 2025 10:44:29 -0800
Message-ID: <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
Date: Fri, 31 Jan 2025 10:44:28 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        <quic_vgarodia@quicinc.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <p.zabel@pengutronix.de>
CC: <hverkuil@xs4all.nl>, <sebastian.fricke@collabora.com>,
        <bryan.odonoghue@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <nicolas@ndufresne.ca>,
        <u.kleine-koenig@baylibre.com>, <stefan.schmidt@linaro.org>,
        <lujianhua000@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <johan@kernel.org>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tEc-4Nmb_kDLf9XNfuZYvKLBfWuV2sH-
X-Proofpoint-ORIG-GUID: tEc-4Nmb_kDLf9XNfuZYvKLBfWuV2sH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310141



On 1/29/2025 2:44 AM, Krzysztof Kozlowski wrote:
> On 28/01/2025 09:04, Dikshita Agarwal wrote:
>> Introduce a helper module with a kernel param to select between
>> venus and iris drivers for platforms supported by both drivers.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/Makefile          |  1 +
>>   drivers/media/platform/qcom/iris/iris_core.h  |  1 +
>>   drivers/media/platform/qcom/iris/iris_probe.c |  3 +
>>   drivers/media/platform/qcom/venus/core.c      |  5 ++
>>   .../platform/qcom/video_drv_helper/Makefile   |  4 ++
>>   .../qcom/video_drv_helper/video_drv_helper.c  | 70 +++++++++++++++++++
>>   .../qcom/video_drv_helper/video_drv_helper.h  | 11 +++
>>   7 files changed, 95 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/video_drv_helper/Makefile
>>   create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
>>   create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
>>
>> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
>> index ea2221a202c0..15accde3bd67 100644
>> --- a/drivers/media/platform/qcom/Makefile
>> +++ b/drivers/media/platform/qcom/Makefile
>> @@ -2,3 +2,4 @@
>>   obj-y += camss/
>>   obj-y += iris/
>>   obj-y += venus/
>> +obj-y += video_drv_helper/
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>> index 37fb4919fecc..7108e751ff88 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -107,5 +107,6 @@ struct iris_core {
>>   
>>   int iris_core_init(struct iris_core *core);
>>   void iris_core_deinit(struct iris_core *core);
>> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
>>   
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 954cc7c0cc97..276461ade811 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
>>   	u64 dma_mask;
>>   	int ret;
>>   
>> +	if (!video_drv_should_bind(&pdev->dev, true))
>> +		return -ENODEV;
> 
> Wouldn't it mark the probe as failed and cause dmesg regressions?
> 
>> +
>>   	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>>   	if (!core)
>>   		return -ENOMEM;
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 77d48578ecd2..b38be7812efe 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -369,12 +369,17 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
>>   static void venus_remove_dynamic_nodes(struct venus_core *core) {}
>>   #endif
>>   
>> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
> 
> You just defined it in the header. Why is this here?
> 
>> +
>>   static int venus_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct venus_core *core;
>>   	int ret;
>>   
>> +	if (!video_drv_should_bind(&pdev->dev, false))
>> +		return -ENODEV;
> 
> Same problems - d,esg regression.
> 
>> +
>>   	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>>   	if (!core)
>>   		return -ENOMEM;
>> diff --git a/drivers/media/platform/qcom/video_drv_helper/Makefile b/drivers/media/platform/qcom/video_drv_helper/Makefile
>> new file mode 100644
>> index 000000000000..82567e0392fb
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/video_drv_helper/Makefile
>> @@ -0,0 +1,4 @@
> 
> Missing SPDX
> 
>> +# Makefile for Video driver helper
>> +
>> +obj-m := video_drv_helper.o
>> +
>> diff --git a/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
>> new file mode 100644
>> index 000000000000..9009c2906e54
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
>> @@ -0,0 +1,70 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +
>> +#include "video_drv_helper.h"
>> +
>> +/* The venus driver supports only hfi gen1 to communicate with the firmware while
> 
> Use Linux generic coding style comment, not netdev.
> 
>> + * the iris driver supports both hfi gen1 and hfi gen2.
>> + * The support of hfi gen1 is added to the iris driver with the intention that
>> + * it can support old gen1 interface based firmware, while enabling gen2 based future SOCs.
>> + * With this, the plan is to migrate older SOCs from venus to iris.
>> + * As of now, since the iris driver supports only entry level features and doesn't have
>> + * feature parity with the venus driver, a runtime-selection is provided to user via
>> + * module parameter 'prefer_venus' to select the driver.
>> + * This selection is available only for the SoCs which are supported by both venus
>> + * and iris eg: SM8250.
>> + * When the feature parity is achieved, the plan is to switch the default to point to
>> + * the iris driver, then gradually start removing platforms from venus.
>> + * Hardware supported by only venus - 8916, 8996, SDM660, SDM845, SC7180, SC7280
>> + * Hardware supported by only iris - SM8550
>> + * Hardware supported by both venus and iris - SM8250
>> + */
>> +
>> +#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS) || !IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
>> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
>> +{
>> +	/* If just a single driver is enabled, use it no matter what */
>> +	return true;
>> +}
>> +
>> +#else
>> +static bool prefer_venus = true;
>> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
>> +module_param(prefer_venus, bool, 0444);
> 
> 
> The choice of driver is by module blacklisting, not by failing probes.
> 
> I don't understand why this patchset is needed and neither commit msg
> nor above longer code comment explain me that. Just blacklist the module.
> 
> Best regards,
> Krzysztof

Summarizing the discussion with myself, Krzysztof and Dmitry:

1) module blacklisting solution will not be ideal if users want to have 
both venus and iris or either of them built-in

2) with current approach, one of the probes (either venus or iris) will 
certainly fail as video_drv_should_bind() will fail for one of them. 
This can be considered as a regression and should not happen.

Solution: If the user prefers iris driver and iris driver has not probed 
yet, and if venus tries to probe ahead of iris we keep -EDEFERing till 
iris probes and succeeds. Vice-versa when the preference is venus as well.

