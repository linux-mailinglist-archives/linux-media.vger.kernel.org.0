Return-Path: <linux-media+bounces-14919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8B92E73F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 13:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D62E1C2218D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 11:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C9837169;
	Thu, 11 Jul 2024 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ejeXEwNg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B615E1494B9;
	Thu, 11 Jul 2024 11:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698128; cv=none; b=MlskncyPbgDv+aQbh8HhOS+/ql8InXxMFdsBfZkDJ6FNZ2NlJu+wJ5yUJX/E/2HtiwfLUxissXwwJgsWw9bRwA8LOVWnaJJRQ2c9wTZMi1hcUq3XyC40HC3Sjfg7ob1pg3r2tNafrTOWCIaS46r1zR/xidgPLMVHNaj22x0+W8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698128; c=relaxed/simple;
	bh=e0cazWYdfzz02xk0wTrFktv9zUTp+D7e1iDGQONVLyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TjBzq66//oSBSzytwFUpxIJrCRKpKWo+kmlI5Kz++gNK57+2PBb+4tevizGE/kAHRe712GJG/d5BfATTVLEJxPvOAoDtP6g6pQxAnL7TfwuikgoMMGqVw6L6ENwCmtyigxl+3WDC7qe1Wt/qn8IZ7BBHQQOxOxV6lBYVbaBOBZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ejeXEwNg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B8YDqd032231;
	Thu, 11 Jul 2024 11:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kwhn+bHrbOxjCMUoj+nhy/hbAd2eoAFhsInH5vRK9uM=; b=ejeXEwNgdBgtyEf0
	HqHqKuATrLRqJwg5KLmHcI3yE95JmAbZl0LfnS55jct+uJ7Quk/TZ9D/5LW99flb
	TiMWR/8FmslggGjWw4VjiVGa49TUajN20H3u+yGkv/tbUCnhHW618knnuegFoyQD
	hCiA+F1jx2LK8b1Z4M87WAUMtKyPTP/Kyj/Ji5d6UbkYICBZGGxnByolMw+Qmibc
	qPnudsgYJ508yHEZU/mK9UZe6JzcyubUmF+yMu0+vQVNf3AgIktyApYZ6q5Zw0ha
	EKt7NpUwQ7I0ccT5mUt7AHfv6yKWWZNWVXnrfZm0zucxkiy+HOZuFZ1LtH03Ff+K
	pCexkg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ac0ggg3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 11:42:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BBg1aB024993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 11:42:01 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 04:41:54 -0700
Message-ID: <064baf66-eecd-4982-864f-50b86b104ff6@quicinc.com>
Date: Thu, 11 Jul 2024 19:41:52 +0800
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
X-Proofpoint-ORIG-GUID: 3preGwDa5SchP-XdwOI1fNkZTyRM-M0X
X-Proofpoint-GUID: 3preGwDa5SchP-XdwOI1fNkZTyRM-M0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_08,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110083

Hi Krzysztof,

On 7/11/2024 7:12 PM, Krzysztof Kozlowski wrote:
> On 11/07/2024 13:08, Depeng Shao wrote:
> 
> 
>>>
>>>> + */
>>>> +static int csid_reset(struct csid_device *csid)
>>>> +{
>>>> +	unsigned long time;
>>>> +	u32 val;
>>>> +	int i;
>>>> +
>>>> +	reinit_completion(&csid->reset_complete);
>>>> +
>>>> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_CLEAR);
>>>> +	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
>>>> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_MASK);
>>>> +
>>>> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>>> +		if (csid->phy.en_vc & BIT(i)) {
>>>> +			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>>>> +						csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>>>> +			writel_relaxed(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
>>>> +			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>>>> +						csid->base + CSID_BUF_DONE_IRQ_MASK);
>>>> +		}
>>>> +
>>>> +	/* preserve registers */
>>>> +	val = (0x1 << RST_LOCATION) | (0x1 << RST_MODE);
>>>> +	writel_relaxed(val, csid->base + CSID_RST_CFG);
>>>
>>> ... here - using everywhere relaxed here is odd and looks racy. These
>>> looks like some strict sequences.
>>>
>> Yes, these are some sequences to initialize the HW.
> 
> Hm? It's like you ignore the problem and just answer with whatever to
> shut up the reviewer. Instead of replying with the same, address the
> problem. Why ordering is not a problem here?
> 

Sorry, I didn't mean that, was trying to understand the problem, then 
just sent out the mail by mistake.
Do you mean we should use writel to ensure the strict sequences?
Thanks for catching this problem, this problem is also in the the 
existing camss driver. I will check all of them in this series, but the 
problem in some existing camss drivers, maybe Bryan from Linaro can help 
to fix them, since I don't have these devices to verify the modifications.

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

Thanks for the sharing, I will try to upgrade to latest compiler to 
avoid other potential issues.


Thanks,
Depeng

