Return-Path: <linux-media+bounces-59160-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PWqLtJW5mlQvAEAu9opvQ
	(envelope-from <linux-media+bounces-59160-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 18:39:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79042FCC6
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 18:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8904A322F79C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E61359A9A;
	Mon, 20 Apr 2026 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sd9Al1z2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxnoR6Ic"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D7F3590A9
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693759; cv=none; b=c8T2ApY4/yiGd7NOnWFY2dkMHtRTqSZCO/UdzJile4cgd9hHaRHSqRzqfb760k4zaqsPmFTMn7YcdbHKitvm1edKQ2R2tnGhTCIrXvewJ3EXUwWHNbG8YI9r/MeU+z7NsTTPdc4fjfrz+UV3xrKN8lXfE5dDKruHd13rzJjHmuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693759; c=relaxed/simple;
	bh=lGmqSKRT6CM/TxRcqxDkVJvKI4sTpx9Qlqby2pYKzIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FqDBgvWhZbVds8rdkTbd/YGQX0XgXwlKGxOAOhghXoN6G/WNonA6lSpol2t39AdGCXLlq0aCEO0B3ZMbXb9OWWfdHMsXcrqoMmiBVptprSmVM0V2yEVuyP/R1RV+DsBDzM1en7Y3yxnXLaR0BkuAp+z5NZ4eBYkEv1SpE+auTK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sd9Al1z2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxnoR6Ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCBkOp1532168
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 14:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzOPLkbup/xZQgzFN0xvKjJCRL775HS/q+EXgkWm92w=; b=Sd9Al1z2o0RljW9X
	gdXXQHjsnb3eduC3tOnsYEAI4Eae4XCFSS8Q4+hIr1FGuhKx1xiQavvugLpFHI2G
	hE3jdCyu6dCDDJckL1tImFbnrR37mQf/SWuvz+HeKWwJMelbZnoj8x7pJ9gJw7Bs
	g0lBCic/2MPo8XetUritDWxONQbTP5OB5/EJyX9AVILU2czuEM3A72KoxCRa2H94
	DzH8Smi8PWyd7t3QguT16pNE2lyd+wfPqBwviZnsglcUKJxbvsUU4BUeAiebJp2Y
	HfPuNjF0R+rlOK4MkBDu6WH58SYe7MYWhEJfdZOTCpTVV/PvcJaRtzKz+6SiuPq8
	wOLeLg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus1pmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 14:02:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f07078eaaso2407530b3a.0
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776693756; x=1777298556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzOPLkbup/xZQgzFN0xvKjJCRL775HS/q+EXgkWm92w=;
        b=dxnoR6IcDWtnFuwISX4+u2a1VD9u1QzFuct1fAutOKeXgUAbBvPyfcFXiaQic+tqja
         qDHk/T+Q4HDpVkzwoDymM3a6UEH8BA4VYcOMg/CSNno9GKtB/1uyKCK/WDLmmpBVVS/B
         FVEdMczHzxJOWPmD5HyYHhWH0oWASMppiYBF9NeX2QjNkVgwhHGJLfSaOS6gBQgxcluZ
         VQtqkbCEXcfqmRJIlcZFlK9kbnhmm7TfA8MtPdn3TeUXnWs+njh5KkW8XEEpRUlGBkeE
         ZZIMbL4CrJCc43SLRT18FshYYKQ+yRMZmVi3GV3gMo08+QM1k82l6Aijg56T/fywcLzE
         qhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693756; x=1777298556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzOPLkbup/xZQgzFN0xvKjJCRL775HS/q+EXgkWm92w=;
        b=WNsuW8F1jkdgsc/S8KdU9dTeo1f4OmunQiQc5G1o7KJpH/vYm+oVDjBpBEN1pLcMyQ
         BRk8JzrwDcl194VSSC7GEtlbgU5vKE2v91/aU/nwj3fftfuYMw7+znzdDhJUSGgWo8Nt
         RXvJh2Rg24r+EZBtJI7ukxVp5xHrNj7KDejPwDRhs3GinbDZDv6LeMXg6fw6C4r5a4xB
         rLIyvHyhuLY5Sm/kYeWNrQ5HDYqcLamDSEP5vlFYAL8HfSxDa+9wBzy74yjpbaUYsV6d
         lV8+c61Y8/mlUS6G5xF7c7RAu2AEqA46rSPx2DBTQ7IRgNhhGh9oNwOl7RzRLaogQKip
         xHjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+G9q8PHyAXZeOhgi5D85lZ+2vPH5tsno9NPb/tPwI+ufqrYNhWDwJ0CSgMbq2X7YMTBrAKJHkR17qQ7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTA0q9FGzdWKieErVFG+8WlmVtl5i1NP30GZpPrau1gSUs+YHp
	U36xlZrvSwwHDC9ehZFnTM8fGdWVKRxaKtsZ4vHNmwu5uhYBAzpm+n297LXYY01WuRvbEN9Csm1
	b7hT92Y7WtJjaV/Vkjo+A2dS1Lz7GtzOWR7cMiudj6i7FtP9DMiWv5JREz3vN4A48yQ==
X-Gm-Gg: AeBDievndz17T2sCnhO1Jbaqzs58/tjGZ5M3qbO5k0V41Kg3mQiWWrKo5sHmoRGfLz/
	yB1jm7xoZebEqbYsiGRXqGP+cWchEKc8+RdEeJyKDHFW9nq/KvIrYv+OhTtiPR4PL+GBppeVxiL
	N22XcuuxbBE6hZZBnREUYy5InvtrTHg5aa5FDTvy1BNVWS67UtZAQyVryYyuKj5ha8dSS6rtRye
	5gay2HCHy3MZ9dS/hPaKOi8/YhjV1TKPon+IxyOvSYgPwlfZZrkekeqjTZMRXtG4TxvlDuSNNnv
	vqvDiBGk/O+uY2l1YVNmfA/lKqK5nPPUcFopSb+NBmrDI5Y1Xo8gBAQ/suugsRHItpUi9c6qxJi
	dou+KqmfDJCkC8VHRdN9w3hUnyWG1tfCEAFR9mZ67g1ym0jgXvLvwV93zJfWhWoV0
X-Received: by 2002:a05:6a00:391c:b0:781:2291:1045 with SMTP id d2e1a72fcca58-82f8c7d1002mr13029211b3a.8.1776693756109;
        Mon, 20 Apr 2026 07:02:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:391c:b0:781:2291:1045 with SMTP id d2e1a72fcca58-82f8c7d1002mr13028935b3a.8.1776693753924;
        Mon, 20 Apr 2026 07:02:33 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec037e1sm13078240b3a.54.2026.04.20.07.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:02:32 -0700 (PDT)
Message-ID: <1f73fad2-1d53-dd35-2668-750eaf3fe00e@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 19:32:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
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
 <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
 <eqxeib5ci42ox4o7l45yjwgsjwjyhekojiigpxj6s5npjw5cwq@ggbtohqh3pip>
 <5dee6da0-9170-d9e0-5ff7-f8436331c6a9@oss.qualcomm.com>
 <26b71f52-3355-d4e9-f640-007123e3aba2@oss.qualcomm.com>
 <7bnl34zyexz4z54fmz6ymax7izfey6nyp7lenhvfp3hkfmhdia@lssovgsnas72>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <7bnl34zyexz4z54fmz6ymax7izfey6nyp7lenhvfp3hkfmhdia@lssovgsnas72>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzNyBTYWx0ZWRfX87fM2v4O3p2F
 AEJeQ8cgFM0BrSccAm2LErOHXD0q2SWdZyRz/JCpt+IwM68v1G2tzOsboWWyHbzoI6I39cftlVa
 nWh7nVXXpoXnQXEnpB2zOIaBhra0k/V9KZokyFWTdVV+BvCmi1M1gTKwLEqhd4nHVGqPgSEWrcf
 jt2wcORMFD8SKHVHzS4ww1FLKs+YFG2f8dRujeTMlupJz0BARlyyHEyuaLrbbl6lruCFlD+ApZ+
 Wt8aN9rddktn00sMEW3spLvPGnAZYZVNcCECFGhm6YCZLOtKH6v74xMXTEdjOIdLMfSNvGdopjB
 T+nprYHjWnoCJGTmGbrWmcOTST9HsMhUbeaRLsUj3OeNZT41Rj/mF+Qmibn+1A9kVocmXR4Z4nC
 xzdQFStKTKJRsVP7h+t1c/skgmApBAyCgtj1ClRlhosfzBy1Cy7uCNX9EnXXGyJ1gjKjPzZ9yqD
 NLolHMN7ILjXgt6fu0w==
X-Proofpoint-GUID: H0pzphHCDhbQymloZ8tgY9cJLmgAWLrD
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e631fc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yYSL5V0MIfFtLobc5GMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: H0pzphHCDhbQymloZ8tgY9cJLmgAWLrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59160-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A79042FCC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/17/2026 11:49 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 17, 2026 at 08:29:21PM +0530, Vishnu Reddy wrote:
>> apologies for re-sending (earlier responses was rejected due to HTML format)
> Ugh.
>
>> On 4/17/2026 8:22 PM, Vishnu Reddy wrote:
>>> On 4/14/2026 8:44 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Apr 14, 2026 at 10:29:58AM +0530, Vishnu Reddy wrote:
>>>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>>
>>>>> Add a dedicated iris VPU bus type and register it into the iommu_buses
>>>>> list. Iris devices require their own bus so that each device can run its
>>>>> own dma_configure() logic.
>>>> This really tells nothing, unless one has full context about the Iris
>>>> needs. Start by describing the issue (that the device needs to have
>>>> multiple devices talking to describe IOMMUs / VAs for several hardware
>>>> functions), then continue by describing what is needed from the IOMMU
>>>> subsys.
>>> This series handles firmware device which do not require multiple
>>> devices part.
>>> given this device need for specific IOMMU configuration, I'll update the
>>> description
>>> accordingly.
>>>
>>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/iommu/iommu.c                           |  4 ++++
>>>>>   drivers/media/platform/qcom/iris/Makefile       |  4 ++++
>>>>>   drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
>>>>>   include/linux/iris_vpu_bus.h                    | 13 ++++++++++
>>>> How are you supposed to merge this? Through IOMMU tree? Through venus
>>>> tree? Can we add one single bus to the IOMMU code and use it for Iris,
>>>> Venus, FastRPC, host1x and all other device drivers which require
>>>> per-device DMA configuration?
>>> Separating out the bus definition and the Iris driver handling would
>>> provide a
>>> cleaner merge path.
> Then why wasn't it done from the ground up?
>
>>>> Your colleagues from the FastRPC team posted a very similar code few
>>>> weeks ago and got exactly the same feedback. Is there a reason why your
>>>> teams don't sync on the IOMMU parts at all?
>>> I would admit that I missed to review that, thank you for bringing that
>>> discussion.
>>> FastRPC patches generalizes the handling for host1x, FastRPC and the
>>> same can be
>>> extended for Iris. I have left few comments there.
>>>
>>>>>   4 files changed, 53 insertions(+)
>>>>>
>>>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>>>> index 61c12ba78206..d8ed6ef70ecd 100644
>>>>> --- a/drivers/iommu/iommu.c
>>>>> +++ b/drivers/iommu/iommu.c
>>>>> @@ -13,6 +13,7 @@
>>>>>   #include <linux/bug.h>
>>>>>   #include <linux/types.h>
>>>>>   #include <linux/init.h>
>>>>> +#include <linux/iris_vpu_bus.h>
>>>>>   #include <linux/export.h>
>>>>>   #include <linux/slab.h>
>>>>>   #include <linux/errno.h>
>>>>> @@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
>>>>>   #ifdef CONFIG_CDX_BUS
>>>>>   	&cdx_bus_type,
>>>>>   #endif
>>>>> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
>>>>> +	&iris_vpu_bus_type,
>>>>> +#endif
>>>>>   };
>>>>>   /*
>>>>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>>>>> index 2abbd3aeb4af..6f4052b98491 100644
>>>>> --- a/drivers/media/platform/qcom/iris/Makefile
>>>>> +++ b/drivers/media/platform/qcom/iris/Makefile
>>>>> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
>>>>>   endif
>>>>>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
>>>>> +
>>>>> +ifdef CONFIG_VIDEO_QCOM_IRIS
>>>>> +obj-y += iris_vpu_bus.o
>>>>> +endif
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>>>>> new file mode 100644
>>>>> index 000000000000..b51bb4b82b0e
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>>>>> @@ -0,0 +1,32 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +/*
>>>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>>>>> + */
>>>>> +
>>>>> +#include <linux/device.h>
>>>>> +#include <linux/of_device.h>
>>>>> +
>>>>> +#include "iris_platform_common.h"
>>>>> +
>>>>> +static int iris_vpu_bus_dma_configure(struct device *dev)
>>>>> +{
>>>>> +	const u32 *f_id = dev_get_drvdata(dev);
>>>>> +
>>>>> +	if (!f_id)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);
>>>> I think it was discussed that this is not enough. Some of devices need
>>>> multiple function IDs.
>>> In this glymur series we are following the legacy way of handling IOMMUs
>>> and does not
>>> require multi map.
> Why can't we land the version that has multiple entries? It's as if the
> teams are totally not in sync. The corresponding version is in works, it
> has been implemented, etc.
The main idea is to introduce firmware stream ID with iommu-map, while keeping the
other stream IDs described in legacy iommus way.
or, are you suggesting that, going forward, we should have VPU stream IDs described
_only_ with iommu-map for any new dts/bindings?

Thanks,
Vishnu Reddy.


