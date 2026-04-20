Return-Path: <linux-media+bounces-59161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG8rAnJL5mkgugEAu9opvQ
	(envelope-from <linux-media+bounces-59161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:51:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 777ED42EA6C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0762D31058F4
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F9B35DA75;
	Mon, 20 Apr 2026 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNSCQwRK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoRnXbjT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93F735BDA0
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693797; cv=none; b=nouAECYgLtECyexhATSoHtB9B5z8HZD8LQu5RMkp8MwaeGnfQ0ymJk8xpJ8szD+SzXkFPuFL/IQDICD30heoUP3IYsXRT8F4j1k69bnmkx8F17TqxJ8s5Jf1mBj+6eqscVcTda2w2GBNJ5vNMYXB/kEfIBuqHIoJYOja+E2EXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693797; c=relaxed/simple;
	bh=MFjbkJTZcf0W5RN6m5rEwf61YAjBi4ZAenyKuAV8xLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVAGx5tT/qmTZse5keD36HOF5RjRzIbDT68fDAGsX1tJVl/SJYhaNPlKP1Mg/PH+xAGahhJzqHBd2qB+4q7ziSi/09zjY25IYDiafuDzLddyGgn+NFCt01fC90r5faATrwQUonpZnrHCKjw6d5X5xuGD5TKDF2w6vuZhLmDIJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNSCQwRK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoRnXbjT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97F4m2755827
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 14:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmwoyEYOD3qeVLU9J7onMjI6vup1YjLazMtiXioAv4k=; b=KNSCQwRKLR5tCprq
	ji6xxEgwvaDWbMmkITYQ0Z5gQnvVxx90rqTjCn18qoU9e7DRFbDTmd9XBoUAq99m
	rjOfGuzBT1ikoHlFJLpLPcxpx2rbcPPEI6g5vk2PMxSEO4i5lzN0NyFwKewvaTcH
	kcWZMVrKtWfL8atNIobs8ePKv9ddL74B78TyWkPyw8R67RPuIfKgaiGg1LI8LitW
	t453K+AiHNr5s3wPBACAVmUsj1F4jz4hanEb9kEw+NzB/9K4Z+CO0Ll+nNOkGoVX
	m1SXQKkW9lajC2AABAIir2LvQ2K6+jUSoCuCTIRYtqVN3VjLBk4lKJPpUpOG5DK0
	OxGqNg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xh139-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 14:03:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adc527eaf5so24199755ad.0
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776693794; x=1777298594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmwoyEYOD3qeVLU9J7onMjI6vup1YjLazMtiXioAv4k=;
        b=WoRnXbjTO4Y1/xlj0tfIiOldWVh1PfeH9ETDoeKqCHFBLSsL9bpd+w0QxRtCh5elMw
         QQflJIfRSKkAUfbPL0GhkIpBVDZnH0/gXmY5SdY1JaTIinu52+4YFdcVQiq+ASI4KYOU
         essX+jFFbSSwuFrOMNdplpq1GXzNWvxOVGu0XFrDDWUsR8BY85cwXg5HM2djfTtELMdI
         PYbi5RlEzPtJsGNJnQ4zXoFgxpreBRaiSXW7cWPAB/hrUEpsSzinLeY032iepJJccOLD
         EDVVeYXBUcqZGhiiYgb7wLFWPwRhcqPgCvFFIuKMovmoRnRuustT4UnU8/I8bePJYbph
         NPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693794; x=1777298594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmwoyEYOD3qeVLU9J7onMjI6vup1YjLazMtiXioAv4k=;
        b=rWHb5l2RhMtdUQdFtdIuJmF3JsXCaum/KEtsz3MmaunnTj8kStLOd+owtESHhsqhop
         lWQJZSFS/bbajRFmz4kG+h//EdMaG1uFx3/TjMY8ztq8oZGR5872KjY6BhvJVZCDTJvz
         fKWB7WTQyxqOeNiS5TKaHKdFZdKUKRyoFIImzOYVZsv9imfkjB1s76NuoAuGw6uANCZe
         aaCVRw0z5JTbMGbMmsklN3ZkAXr3J9dWJO5jr4O6tjH8VrMZ8iABJC7zbLIzSwVVBB19
         720qlag1BLQgjjPIvfu0Y0bFNaQ4U1YXfNImlb99XxGxxw919azcC5LzHV2IaPbUy84G
         brXg==
X-Forwarded-Encrypted: i=1; AFNElJ+2hNqxSUflmPSFRTWmsxH6syT/IO0C9UydPLI9x09y6GobBDr9U4f0v2YIUhSjNCaiMRpL3ZwrtTOFyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKU/R0kGexyek3UEYe5N7UsHlZzPJpWq7N8zsi/3cKVNMp79B
	Fj3QAouKI+fc+X6g5lxBXhaAYeVmdwPSUollo/8WmcdbuhAAHdxg3uZ27SmXkJ6HA056LayPQDw
	qHf43dCQ/aSDxg/3TFmQle0nyO5q/Pvh/IAocpVevZXr4YjNo7WmmnVgoB8WlL5pRqA==
X-Gm-Gg: AeBDietl6X7uOU38+I4NJEtZMn79JJld65xUs3DxOjqEpeSy8A45Y4TUWp+D+2x4YBs
	YBY+VKMv4QTH6FH+Qvr3VOUtVwiEgOrIOVcI5ZWKrNwc5lntdpuRAgyWTZ8bR+qZW9gLjgqo9r+
	PUCmRPoLxdvYDnrLSoIqNlH5vVHIAuMTcosfZhoGsAD080j/qlXNnlTR2T7DGTU8+5/Dpz3BNGf
	fg5/LTROeCF/Kd7DnFq/GAxZ+PUdfd7KQzooOaLdvFiRqWTrn58OXRmbyZiRwEJiNM+R58Ncaan
	KoD4Q8ys9ik711JsSebd0OGvmIEMhuHJUyxOEkzE/XzHTCrTaUqV7Wau1NLn1Fhd1MjSe2FbjAN
	nTZ7jX4vAG1Z1VH8wrGCvyZTKB99pi9GTShbfFhYdIUF4nIYujrLKdFdZn4pkSNpH
X-Received: by 2002:a17:902:ef11:b0:2b0:67cc:adc3 with SMTP id d9443c01a7336-2b5f9ec6e37mr132050845ad.14.1776693793887;
        Mon, 20 Apr 2026 07:03:13 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2b0:67cc:adc3 with SMTP id d9443c01a7336-2b5f9ec6e37mr132049645ad.14.1776693793075;
        Mon, 20 Apr 2026 07:03:13 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa34ea7sm105061225ad.34.2026.04.20.07.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:03:10 -0700 (PDT)
Message-ID: <bab7f899-dc05-7c9d-aed5-fed1910aa32b@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 19:33:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
 <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
 <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
 <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzNyBTYWx0ZWRfXycsakSNB3juH
 3vTm3fghgHAmFzeKQbNFERqkSp17DxcKiXebrxV3nQc6Af/oV0PG072rjjkBlwaJEs0ZcyWXIEm
 0OwOyPS88mn1FyXjsDW2mNtDrlJfxHw0vDrA81xgXRxvGd1EJTenG/Y7Ppko/XnSiwrdmPwIKzx
 0KUR3rTewiF5rlkY4z0ZNkNBaeTakiuv5PjmCrkYRdfzOF4YVBtE/V3oKpANe3rY26XSD6RCImD
 aS8PAHOxTsBm6VbnSsTZNCnBXah0476y6Xow9mDcq8aaOVBDMscBi0KVgxCAOH6w1QwXQDz+bNO
 +mbNpaDQ/9butVD42/IiW84Tu9BNIV6g5LWD7tTkeJVPWGnRwXK+mUUmv0nKrPB3GTQwloLvdkM
 EqZ1Z5eRdg+OW7NxmoFVEqCp1OV5nd39CIElcD+X9qiPN1vYf4vdVoRAzR0RAjpNRyzzk722ev9
 etqxhmABTH/NQOkSijg==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e63222 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=N0hD6JmQrVrYO7jJexcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 6g2NJ9BtwFhvLyNnKMQIO6wt8RnHmhA-
X-Proofpoint-GUID: 6g2NJ9BtwFhvLyNnKMQIO6wt8RnHmhA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59161-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 777ED42EA6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/17/2026 11:53 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 17, 2026 at 08:49:44PM +0530, Vishnu Reddy wrote:
>> On 4/14/2026 8:48 PM, Dmitry Baryshkov wrote:
>>> On Tue, Apr 14, 2026 at 10:30:00AM +0530, Vishnu Reddy wrote:
>>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>
>>>> Add a helper function to allocate and register context bank (CB) device
>>>> on the iris vpu bus. The function ID associated with the CB is specified
>>>> from the platform data, allowing the bus dma_configure callback to apply
>>>> correct stream ID mapping when device is registered.
>>>>
>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>   drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
>>>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>>>>   2 files changed, 34 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>>>> index 773f6548370a..a25e0f2e9d26 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>>>> @@ -6,6 +6,7 @@
>>>>   #include <linux/clk.h>
>>>>   #include <linux/devfreq.h>
>>>>   #include <linux/interconnect.h>
>>>> +#include <linux/iris_vpu_bus.h>
>>>>   #include <linux/pm_domain.h>
>>>>   #include <linux/pm_opp.h>
>>>>   #include <linux/pm_runtime.h>
>>>> @@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>>>>   	return 0;
>>>>   }
>>>> +
>>>> +static void iris_release_cb_dev(struct device *dev)
>>>> +{
>>>> +	kfree(dev);
>>>> +}
>>>> +
>>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
>>> Please move into the bus code and make it generic enough.
>> Do you suggest to add a wrapper to pass the varying inputs to the generic
>> bus, something like this
>> struct device* create_and_register_device(dma_mask, parent_dev, *release,
>> dev_name,...)
> Definitely not the release function. The devname is also not that
> important. The rest, yes, you are correct.
>
>>>> +{
>>>> +	struct device *dev;
>>>> +	int ret;
>>>> +
>>>> +	dev = kzalloc_obj(*dev);
>>>> +	if (!dev)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	dev->release = iris_release_cb_dev;
>>>> +	dev->bus = &iris_vpu_bus_type;
>>>> +	dev->parent = core->dev;
>>>> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
>>>> +	dev->dma_mask = &dev->coherent_dma_mask;
>>> Would you also need to set the of_node? See
>>> device_set_of_node_from_dev()
>> It might be needed for FastRPC as they are following sub node approach, Iris
>> does not need.
> Wouldn't it save you from passing it to of_dma_configure_id()?
Iris will pass parent device of_node, setting parent device is enough.
>>>> +
>>>> +	dev_set_name(dev, "%s", name);
>>>> +	dev_set_drvdata(dev, (void *)f_id);
>>>> +
>>>> +	ret = device_register(dev);
>>>> +	if (ret) {
>>>> +		put_device(dev);
>>>> +		return ERR_PTR(ret);
>>>> +	}
>>>> +
>>>> +	return dev;
>>>> +}
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
>>>> index 6bfbd2dc6db0..4a494627ff23 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>>>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>>>>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>>>   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>>   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
>>>>   #endif
>>>>
>>>> -- 
>>>> 2.34.1
>>>>

