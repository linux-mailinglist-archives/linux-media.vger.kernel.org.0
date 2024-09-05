Return-Path: <linux-media+bounces-17677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BF296D7AE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EDC287005
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EAF19AA58;
	Thu,  5 Sep 2024 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bvTbuDuy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385DA1991B0;
	Thu,  5 Sep 2024 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537209; cv=none; b=BJ9/TRBjQxlRNkENnqLbcpasLRStDyPXD3GIDuB69zPTo9aBSmdRXbKeCHi/dbFxJ4XSCvHpleY5+Qhhh+o2WuK0NEs0C1YbxbsPWnbFIFWZwvFINACMGUPEPHmVSyi3wq05g8gJu0g+CUMzzXPMXAeV8t1FsMF8dsPDclTyg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537209; c=relaxed/simple;
	bh=zasnop78snXtxa/COHzbDHGYMjvFYHJkNC81/+s1GsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a5VbX12qd1lKQIfNyagXsreOCVNBx6mIJO7lkl/YS0p7FhWXEKW6dfhVaB8wG5ARAJSQT4Qqz0Zz7r8ZaZUz+X3aemCL1r3Dgsqn0FUxoUI2P3ptb6uTjsn0/lNGRbhSGy0D6GwxEruR8PfTwBPHFRryyM2BUF+6qaB+sWHDGRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bvTbuDuy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485976AK017538;
	Thu, 5 Sep 2024 11:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLg0c48ZpNTIrXMkLO0SfdyOcyuchZIMS3HUEystNm4=; b=bvTbuDuyY9H7KcoE
	vfRFXWDDO24TW5Yn++sqCh7HJ3uPD3WZ+ZgxoWup38sCCqkWZnMqe8yhcsK+D9V/
	fEW+7VysW/AvSOHkA38qHJMHMUQNcyhLpsiEANZOL4m70saAXeCyResjCccI0Ekf
	gBmbhKZc2a8aLjD0t+9kaCeIJ99VwNxM1OQ3a7W1WP0WKZRTMs4QQfVux7jDMDWE
	0GJPAaW8ZlTB1z+eSsj1nTOgowvs20DoLOvVLN7xrddrn+DV9qRl6i4e3NYFaFlx
	MfY92GEW+WFmHM0jVok/G2UENDNcCO9J13wHHSZkilDe0aaK3lzZLkszO/WUEUGi
	v1y2xw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41enbwkk8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 11:53:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485BrJnA015280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 11:53:19 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 04:53:14 -0700
Message-ID: <ba747923-38de-5c05-9220-762c5272ec74@quicinc.com>
Date: Thu, 5 Sep 2024 17:23:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 04/29] media: iris: initialize power resources
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-4-c5fdbbe65e70@quicinc.com>
 <81fd218f-aa0f-4710-b832-cab927bfab9d@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <81fd218f-aa0f-4710-b832-cab927bfab9d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gkAwceX_U4DFCKYWt3S7rgYjJbar45Mm
X-Proofpoint-GUID: gkAwceX_U4DFCKYWt3S7rgYjJbar45Mm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_07,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050087



On 8/27/2024 4:21 PM, Krzysztof Kozlowski wrote:
> On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> Add support for initializing Iris "resources", which are clocks,
>> interconnects, power domains, reset clocks, and clock frequencies
>> used for iris hardware.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
> 
> ...
> 
>> +struct iris_platform_data sm8550_data = {
>> +	.icc_tbl = sm8550_icc_table,
>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>> +	.clk_rst_tbl = sm8550_clk_reset_table,
>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>> +	.pmdomain_tbl = sm8550_pmdomain_table,
>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +	.opp_pd_tbl = sm8550_opp_pd_table,
>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>> +	.clk_tbl = sm8550_clk_table,
>> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 0a54fdaa1ab5..2616a31224f9 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -69,6 +69,19 @@ static int iris_probe(struct platform_device *pdev)
>>  	if (core->irq < 0)
>>  		return core->irq;
>>  
>> +	core->iris_platform_data = of_device_get_match_data(core->dev);
>> +	if (!core->iris_platform_data) {
>> +		ret = -ENODEV;
>> +		dev_err_probe(core->dev, ret, "init platform failed\n");
> 
> That's not even possible. I would suggest dropping entire if. But if yoi
> insist, then without this weird redundant code. return -EINVAL.
> 
Its possible if platform data is not initialized and this is only place we
check it, there is no further NULL check for the same.
>> +		return ret;
>> +	}
>> +
>> +	ret = iris_init_resources(core);
>> +	if (ret) {
>> +		dev_err_probe(core->dev, ret, "init resource failed\n");
>> +		return ret;
> 
> How many same errors are you printing? Not mentioning that syntax of
> dev_errp_rpboe is different...
We have these errors at multiple points to know at what point the probe
failed which is useful while debugging probe failures.
But Sure we will revisit this code and fix the syntax of dev_err_probe.
> 
> 
>> +	}
>> +
>>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>>  	if (ret)
>>  		return ret;
>> @@ -88,8 +101,14 @@ static int iris_probe(struct platform_device *pdev)
>>  }
>>  
>>  static const struct of_device_id iris_dt_match[] = {
>> -	{ .compatible = "qcom,sm8550-iris", },
>> -	{ .compatible = "qcom,sm8250-venus", },
>> +	{
>> +		.compatible = "qcom,sm8550-iris",
>> +		.data = &sm8550_data,
>> +	},
>> +	{
>> +		.compatible = "qcom,sm8250-venus",
>> +		.data = &sm8250_data,
> 
> You just added this. No, please do not add code which is immediatly
> incorrect.
It's not incorrect, in earlier patch we only added the compatible strings
and with this patch introducing the platform data and APIs to get it.
> 
>> +	},
>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(of, iris_dt_match);
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> new file mode 100644
>> index 000000000000..57c6f9f3449b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>> @@ -0,0 +1,171 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/interconnect.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_opp.h>
>> +#include <linux/reset.h>
>> +
>> +#include "iris_core.h"
>> +#include "iris_resources.h"
>> +
>> +static int iris_init_icc(struct iris_core *core)
>> +{
>> +	const struct icc_info *icc_tbl;
>> +	u32 ret, i = 0;
>> +
>> +	icc_tbl = core->iris_platform_data->icc_tbl;
>> +
>> +	core->icc_count = core->iris_platform_data->icc_tbl_size;
>> +	core->icc_tbl = devm_kzalloc(core->dev,
>> +				     sizeof(struct icc_bulk_data) * core->icc_count,
>> +				     GFP_KERNEL);
>> +	if (!core->icc_tbl)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < core->icc_count; i++) {
>> +		core->icc_tbl[i].name = icc_tbl[i].name;
>> +		core->icc_tbl[i].avg_bw = icc_tbl[i].bw_min_kbps;
>> +		core->icc_tbl[i].peak_bw = 0;
>> +	}
>> +
>> +	ret = devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
>> +	if (ret)
>> +		dev_err(core->dev, "failed to get interconnect paths, NoC will stay unconfigured!\n");
>> +
>> +	return ret;
>> +}
>> +
>> +static int iris_pd_get(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	struct dev_pm_domain_attach_data iris_pd_data = {
>> +		.pd_names = core->iris_platform_data->pmdomain_tbl,
>> +		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
>> +		.pd_flags = PD_FLAG_NO_DEV_LINK,
>> +	};
>> +
>> +	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int iris_opp_pd_get(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	struct dev_pm_domain_attach_data iris_opp_pd_data = {
>> +		.pd_names = core->iris_platform_data->opp_pd_tbl,
>> +		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
>> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
>> +	};
>> +
>> +	ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int iris_init_power_domains(struct iris_core *core)
>> +{
>> +	const struct platform_clk_data *clk_tbl;
>> +	u32 clk_cnt, i;
>> +	int ret;
>> +
>> +	ret = iris_pd_get(core);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_opp_pd_get(core);
>> +	if (ret)
>> +		return ret;
>> +
>> +	clk_tbl = core->iris_platform_data->clk_tbl;
>> +	clk_cnt = core->iris_platform_data->clk_tbl_size;
>> +
>> +	for (i = 0; i < clk_cnt; i++) {
>> +		if (clk_tbl[i].clk_type == IRIS_HW_CLK) {
>> +			ret = devm_pm_opp_set_clkname(core->dev, clk_tbl[i].clk_name);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	}
>> +
>> +	ret = devm_pm_opp_of_add_table(core->dev);
>> +	if (ret) {
>> +		dev_err(core->dev, "failed to add opp table\n");
>> +		return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int iris_init_clocks(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
>> +	if (ret < 0) {
>> +		dev_err(core->dev, "failed to get bulk clock\n");
> 
> Syntax is:
> return dev_err_probe(). If this is probe path. Is it?
> 
Sure will fix.
>> +		return ret;
>> +	}
>> +
>> +	core->clk_count = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int iris_init_resets(struct iris_core *core)
>> +{
>> +	const char * const *rst_tbl;
>> +	u32 rst_tbl_size;
>> +	u32 i = 0, ret;
>> +
>> +	rst_tbl = core->iris_platform_data->clk_rst_tbl;
>> +	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>> +
>> +	core->resets = devm_kzalloc(core->dev,
>> +				    sizeof(*core->resets) * rst_tbl_size,
>> +				    GFP_KERNEL);
>> +	if (rst_tbl_size && !core->resets)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < rst_tbl_size; i++)
>> +		core->resets[i].id = rst_tbl[i];
>> +
>> +	ret = devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
>> +	if (ret) {
>> +		dev_err(core->dev, "failed to get resets\n");
> 
> Syntax is:
> return dev_err_probe(). If this is probe path. Is it?
> 
Sure, will fix
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int iris_init_resources(struct iris_core *core)
>> +{
>> +	int ret;
>> +
>> +	ret = iris_init_icc(core);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_init_power_domains(core);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_init_clocks(core);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = iris_init_resets(core);
>> +
>> +	return ret;
>> +}
> 
> This should be just part of of main unit file, next to probe. It is
> unusual to see probe parts not next to probe. Sorry, that's wrong.
> 
All the APIs handling(init/enable/disable) the different resources (PM
domains, OPP, clocks, buses) are kept in this iris_resource.c file hence
this API to init all those resources is kept here to not load iris_probe.c
file.

> Best regards,
> Krzysztof
> 

