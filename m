Return-Path: <linux-media+bounces-25396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71FDA21A6F
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 10:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAA143A06E2
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 09:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0BB1B0406;
	Wed, 29 Jan 2025 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o6Sx/Rrh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C501ADFFB;
	Wed, 29 Jan 2025 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738144449; cv=none; b=ASxaVTouRY9DzThpSHwNFITfMqm9hL40OIdom6bpP7Q0dJJfqnTEfCnuLEjThjtHa31z9hSXPKeMw7i5Psl4VJYuu7kUGthL1FP2PkSR+ppMgDHPntvxbqPgMlCPdny2mOc/qBlsWKGivN5NxUrKFruT1fYSqFWalZ8gPUX0jDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738144449; c=relaxed/simple;
	bh=BgTN7qxz2qFIpjID3jYigzaGHpUiLrISwspFAg3E3L4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tSNPQ40+FOy2HxGqNslFY1S41HcI9soMdnkkzHePddOKjD3AHA3Akfk9V5aV6EXmkvuNeAPPlJAZB79B1C8ba5/q2dPy7DXfa0mvYzWIlP/TI8lGk1lxVZlqOMnmc2NKxCeR/nET85yQCBIZ4qI2ZRdtM4aPA6G9O6ug4lVHBCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o6Sx/Rrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gxxk020862;
	Wed, 29 Jan 2025 09:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOddlnfAJR+6/qnsXse4j7jW+dDq8/iiERtouCUAD0g=; b=o6Sx/Rrhlmp5UJQr
	sq/9XxLEyxqE4TuwjJ6YatzgsCCRVIW2ZM/h+6qu77TWInD4M78ZJsiXzkmp/G3Y
	tkGxMeTQfCdFE0jO/lsLs9193Raq3lSqNz8b8LBoRRPNvSUDz5LOeaTzrHHkeVBJ
	teMvWxGkB/leC4ALut8ep/xBWQpqfrrT4S+hiEt2RbinZwi8BNwO1CaTWP85ZZ0O
	M66k8/ee/RnHfZ2FQ9fODeQV+aBfag5XnU3sR4ZMZbhI6TOyAAHtTWjogse6RqGB
	s5hhSTZaEyviuOhDpj+x4hodpyFQIF1/5luO7YVlyGh2TRJYlttR5OoDrCUgdDzf
	pNC0Kg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f7xfh0fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 09:53:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T9rlUe002427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 09:53:47 GMT
Received: from [10.50.59.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 Jan
 2025 01:53:31 -0800
Message-ID: <45c3676a-aafe-59e8-910d-af82031c24a6@quicinc.com>
Date: Wed, 29 Jan 2025 15:23:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <hverkuil@xs4all.nl>,
        <sebastian.fricke@collabora.com>, <bryan.odonoghue@linaro.org>,
        <neil.armstrong@linaro.org>, <nicolas@ndufresne.ca>,
        <u.kleine-koenig@baylibre.com>, <stefan.schmidt@linaro.org>,
        <lujianhua000@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <johan@kernel.org>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <sb3beoyhnlcdfjbm37ogpdoph7m4fecpbuu3myglnpzblpnqhw@wdyskeps3uuh>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <sb3beoyhnlcdfjbm37ogpdoph7m4fecpbuu3myglnpzblpnqhw@wdyskeps3uuh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JMRudwU-uVJYECc4UmDh8K2dsyJxZ_Wc
X-Proofpoint-GUID: JMRudwU-uVJYECc4UmDh8K2dsyJxZ_Wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501290080



On 1/28/2025 9:44 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 28, 2025 at 01:34:28PM +0530, Dikshita Agarwal wrote:
>> Introduce a helper module with a kernel param to select between
>> venus and iris drivers for platforms supported by both drivers.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/Makefile          |  1 +
>>  drivers/media/platform/qcom/iris/iris_core.h  |  1 +
>>  drivers/media/platform/qcom/iris/iris_probe.c |  3 +
>>  drivers/media/platform/qcom/venus/core.c      |  5 ++
>>  .../platform/qcom/video_drv_helper/Makefile   |  4 ++
>>  .../qcom/video_drv_helper/video_drv_helper.c  | 70 +++++++++++++++++++
>>  .../qcom/video_drv_helper/video_drv_helper.h  | 11 +++
>>  7 files changed, 95 insertions(+)
>>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/Makefile
>>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
>>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
>>
>> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
>> index ea2221a202c0..15accde3bd67 100644
>> --- a/drivers/media/platform/qcom/Makefile
>> +++ b/drivers/media/platform/qcom/Makefile
>> @@ -2,3 +2,4 @@
>>  obj-y += camss/
>>  obj-y += iris/
>>  obj-y += venus/
>> +obj-y += video_drv_helper/
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>> index 37fb4919fecc..7108e751ff88 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -107,5 +107,6 @@ struct iris_core {
>>  
>>  int iris_core_init(struct iris_core *core);
>>  void iris_core_deinit(struct iris_core *core);
>> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
> 
> s/extern //g
> 
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 954cc7c0cc97..276461ade811 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
>>  	u64 dma_mask;
>>  	int ret;
>>  
>> +	if (!video_drv_should_bind(&pdev->dev, true))
>> +		return -ENODEV;
>> +
>>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>>  	if (!core)
>>  		return -ENOMEM;
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 77d48578ecd2..b38be7812efe 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -369,12 +369,17 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
>>  static void venus_remove_dynamic_nodes(struct venus_core *core) {}
>>  #endif
>>  
>> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
> 
> Use #include instead.
> 
>> +
>>  static int venus_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>>  	struct venus_core *core;
>>  	int ret;
>>  
>> +	if (!video_drv_should_bind(&pdev->dev, false))
>> +		return -ENODEV;
>> +
>>  	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>>  	if (!core)
>>  		return -ENOMEM;
>> diff --git a/drivers/media/platform/qcom/video_drv_helper/Makefile b/drivers/media/platform/qcom/video_drv_helper/Makefile
>> new file mode 100644
>> index 000000000000..82567e0392fb
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/video_drv_helper/Makefile
>> @@ -0,0 +1,4 @@
>> +# Makefile for Video driver helper
>> +
>> +obj-m := video_drv_helper.o
> 
> Always built as a module? And what if iris or venus are built into the
> kernel?
iris and venus are always built as module, and if we are adding the
dependency of this module on IRIS && VENUS then this can't be Y I think.
> Add a normal Kconfig symbol, tristate, no Kconfig string. Use depends on
> IRIS && VENUS (and maybe default y) to let it be built only if both
> drivers are enabled.
> 
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
> 
> Move the stub funtion to header.
> 
>> +static bool prefer_venus = true;
>> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
>> +module_param(prefer_venus, bool, 0444);
>> +
>> +/* list all platforms supported by both venus and iris drivers */
>> +static const char *const venus_to_iris_migration[] = {
>> +	"qcom,sm8250-venus",
>> +	NULL,
>> +};
>> +
>> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
> 
> The prefix is too broad, but maybe its fine.
> 
>> +{
>> +	if (of_device_compatible_match(dev->of_node, venus_to_iris_migration))
>> +		return prefer_venus ? !is_iris_driver : is_iris_driver;
>> +
>> +	return true;
>> +}
>> +EXPORT_SYMBOL_GPL(video_drv_should_bind);
>> +#endif
>> +
>> +static int __init video_drv_helper_init(void)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void __exit video_drv_helper_exit(void)
>> +{
>> +}
>> +
>> +module_init(video_drv_helper_init);
>> +module_exit(video_drv_helper_exit);
> 
> No need for this, please drop.
> 
>> +
>> +MODULE_DESCRIPTION("A video driver helper module");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
>> new file mode 100644
>> index 000000000000..6d835227fec2
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __VIDEO_DRV_HELPER_H__
>> +#define __VIDEO_DRV_HELPER_H__
>> +
>> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
>> +
>> +#endif
>> -- 
>> 2.34.1
>>
> 

