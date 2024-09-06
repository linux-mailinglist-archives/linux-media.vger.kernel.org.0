Return-Path: <linux-media+bounces-17765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6C96F2DB
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 13:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5A191F237AD
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 11:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B831CB324;
	Fri,  6 Sep 2024 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="izoomxaF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516DA1A2C39;
	Fri,  6 Sep 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725621731; cv=none; b=TVLMfjSaf0Y8yliKvcF7cIXH/liHXjd0imXK82ANpWS1LB231BTmV9x85LpbjKmV9abZr4Rls4/aZBVQA0TXTAnf3SznGAXtM5vf/ZQec6jSjjFNOsBXGvKx9VWX3fNjowpmXz3B83Bfp6Y0uFc25eOrBxNPWkDv1TC1LNvLUrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725621731; c=relaxed/simple;
	bh=DIxBGDSeqBdcFrUZdpfXvroU3VRN/KMjEXH0aBe0Qus=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FGIpKQAEKZGRjuCCbrMDnUxqxWgrA2EmlrHFN8vxGkbXVYRP+Q0gbejCxaVYWZgAr1vyWsugWfQckEpCSgui+QlNIIR5cmGvRwbp3KAw6avmnDJMorCEwCCl3Uz+AhYcBEKIjOhO1UBd4WI+ANEgFW6Nk6QZNyyQrX6S7q1ISGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=izoomxaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868d8f5021851;
	Fri, 6 Sep 2024 11:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFyTPzSSSpYuSPbFJVK8p1zZuvXN7Rw7OI0AWDshio4=; b=izoomxaFfxENicYY
	szgh+D+/RQNwpQq8LMAzINSrUBRiT6pXQzbEDmnt8RCHB+amICKDV7XLiDuHfjRq
	f56Ln+/ODdLPqYn08VwsyQv0+RLYbU0aEcTYBunun6hwE/vNioJiE6/Pfofyo1mI
	WAIiU/uNwlN2/YQx3XQwMYS8hR1oFqSL4a3qVFPXL9DT2i2Khrhc+trgqRFjTgkw
	VOx2jGgepXrhW1QGSLDiAa3JpUXo0ObMP/Gp02M4H20OQ7v8ULcEm2ypCB9qd3nd
	bipHv8plAOZfwXlD9pa51uzczYjc7r+ri/IIaZFL/FMBLleEy7IOGIsXggeUE1F9
	7tFhFg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu23q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 11:22:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486BM2Ij006467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 11:22:02 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 04:21:59 -0700
Message-ID: <f88d8596-c6a0-356e-060e-81d68f038995@quicinc.com>
Date: Fri, 6 Sep 2024 16:51:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 04/29] media: iris: initialize power resources
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
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
 <ba747923-38de-5c05-9220-762c5272ec74@quicinc.com>
 <76ffb882-10f9-4737-afa2-9bb60248835d@kernel.org>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <76ffb882-10f9-4737-afa2-9bb60248835d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 56HZryFSPw8cdcJnK8OVKgT3VpHgvXY4
X-Proofpoint-ORIG-GUID: 56HZryFSPw8cdcJnK8OVKgT3VpHgvXY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060083

Hi Krzysztof,

On 9/5/2024 5:27 PM, Krzysztof Kozlowski wrote:
> On 05/09/2024 13:53, Dikshita Agarwal wrote:
>>
>>
>> On 8/27/2024 4:21 PM, Krzysztof Kozlowski wrote:
>>> On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
>>>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>
>>>> Add support for initializing Iris "resources", which are clocks,
>>>> interconnects, power domains, reset clocks, and clock frequencies
>>>> used for iris hardware.
>>>>
>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>> ---
>>>
>>> ...
>>>
>>>> +struct iris_platform_data sm8550_data = {
>>>> +	.icc_tbl = sm8550_icc_table,
>>>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>>> +	.clk_rst_tbl = sm8550_clk_reset_table,
>>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>>>> +	.pmdomain_tbl = sm8550_pmdomain_table,
>>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>>> +	.opp_pd_tbl = sm8550_opp_pd_table,
>>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>>> +	.clk_tbl = sm8550_clk_table,
>>>> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>>>> +};
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>>> index 0a54fdaa1ab5..2616a31224f9 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>> @@ -69,6 +69,19 @@ static int iris_probe(struct platform_device *pdev)
>>>>  	if (core->irq < 0)
>>>>  		return core->irq;
>>>>  
>>>> +	core->iris_platform_data = of_device_get_match_data(core->dev);
>>>> +	if (!core->iris_platform_data) {
>>>> +		ret = -ENODEV;
>>>> +		dev_err_probe(core->dev, ret, "init platform failed\n");
>>>
>>> That's not even possible. I would suggest dropping entire if. But if yoi
>>> insist, then without this weird redundant code. return -EINVAL.
>>>
>> Its possible if platform data is not initialized and this is only place we
>> check it, there is no further NULL check for the same.
> 
> It is possible? Then point me to the code line. Or present some code
> flow leading to it.
Lets go with return -EINVAL in this if block.

> 
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = iris_init_resources(core);
>>>> +	if (ret) {
>>>> +		dev_err_probe(core->dev, ret, "init resource failed\n");
>>>> +		return ret;
>>>
>>> How many same errors are you printing? Not mentioning that syntax of
>>> dev_errp_rpboe is different...
>> We have these errors at multiple points to know at what point the probe
>> failed which is useful while debugging probe failures.
> 
> Duplicating is not helpful.
> 
>> But Sure we will revisit this code and fix the syntax of dev_err_probe.
> 
>>>
>>>
>>>> +	}
>>>> +
>>>>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>>>>  	if (ret)
>>>>  		return ret;
>>>> @@ -88,8 +101,14 @@ static int iris_probe(struct platform_device *pdev)
>>>>  }
>>>>  
>>>>  static const struct of_device_id iris_dt_match[] = {
>>>> -	{ .compatible = "qcom,sm8550-iris", },
>>>> -	{ .compatible = "qcom,sm8250-venus", },
>>>> +	{
>>>> +		.compatible = "qcom,sm8550-iris",
>>>> +		.data = &sm8550_data,
>>>> +	},
>>>> +	{
>>>> +		.compatible = "qcom,sm8250-venus",
>>>> +		.data = &sm8250_data,
>>>
>>> You just added this. No, please do not add code which is immediatly
>>> incorrect.
>> It's not incorrect, in earlier patch we only added the compatible strings
>> and with this patch introducing the platform data and APIs to get it.
> 
> It is incorrect to immediately remove it. You keep arguing on basic
> stuff. Sorry, but that is not how it works. If you add code and
> IMMEDIATELY remove it, then it means the code was not needed. Or was not
> correct. Choose one.
I think it is not removing it. It is adding platform data to compatibles
introduced in previous patch. Maybe it appears as if it is removing it.
> 
> ...
> 
>>>
>>> This should be just part of of main unit file, next to probe. It is
>>> unusual to see probe parts not next to probe. Sorry, that's wrong.
>>>
>> All the APIs handling(init/enable/disable) the different resources (PM
>> domains, OPP, clocks, buses) are kept in this iris_resource.c file hence
>> this API to init all those resources is kept here to not load iris_probe.c
>> file.
> 
> You introduce your own coding style and as an argument you use just "I
> do this".
> 
> The expected is to see resource initialization next to probe. Repeating
> what your code does, is not helping me to understand your design choice.
I see your point and it would be good to have the resources initialized as part
of probe.

> Best regards,
> Krzysztof

Regards,
Vikash


