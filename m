Return-Path: <linux-media+bounces-57433-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNwRLLO9x2lxbgUAu9opvQ
	(envelope-from <linux-media+bounces-57433-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:38:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A334E321
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C012302EECC
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 11:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85CC3890F7;
	Sat, 28 Mar 2026 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDrGyPgh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQ+GQ1hj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89A537F746
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774697876; cv=none; b=bixR7C+voBTJcmu1IPZtd9PNqhqt445d94omAcbHjD2Sh0KV15X8BJyVAP/nK6kegZQ3Cq8lNML48rIGX8OH39yIzvfTogq83tIC6ahK2DcCVnWWgpR64Xgiw3+gwS65BCquN+hzPy21JgpjJfJpYxS7CA9U3K+p3DaaqDxL3gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774697876; c=relaxed/simple;
	bh=OjgkSIO2ad2NibMyUFh+sgUj3CG69zp0K+DcVr3S4Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mC4dIyo8EQmAmGnNOWbIfcwM0/cdFPnR3CNLRS/vXU4dX4/VLglDAk8knOtfiQSRmNFmRZUxG0bJXBBV/naa3yNdQvuY0+TrO2kr7SFQYjITkdNj7L0MD4tqmSC8L8lr7y8G27MzvZgs0vblHoy+SYmfW5zzUzFJSLTLCrXJeuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDrGyPgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ+GQ1hj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S4dlDS1453476
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pFKLV1uuPMHuCXFEpJEzKwAbPMuwARFQ2NoKMHcpKbM=; b=eDrGyPghCbNIvNWD
	OqIVjLta3TwepWb8VuiM/5uj0WSxSyxci7QALthAEW6iO/k4n4YGOBbRJn+VssNM
	VjdHt7RdNlg4KGNVqFu8CKmrUfz56KQdiHFwOZk8YE55fiE8MGfjLrzCdwXgdTmS
	K+7gJbl07JuWoet3a9kmR5pUkHcmYsdRXBWlLy+JecaQtmJp3HocK++GLtOZPEe+
	s5OOVm1xMzMaC9yvbwUHMJlZC/hNnCodNFyYWKYL3aoVjMH+8QCDdmBDgoaWmmsE
	HoQLFjHPOXlZKhpBLtmAysjaipwv0yzSJEfomanTX1BzZ79LdzEXyqigR+hBoOho
	5ZoDcg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685h8kar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:37:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242b9359aso5467535ad.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774697873; x=1775302673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pFKLV1uuPMHuCXFEpJEzKwAbPMuwARFQ2NoKMHcpKbM=;
        b=hQ+GQ1hjCSb8AH+SWiwjn95QUvv7MAF7s5fK295q5tfH0RTQoE1JsB1ogxsII52ybJ
         cI9DzwwnxHWHDpdZAaSfPQJfhVWEYe1peJh/mWctoP4nUkDF1W86lEpBFbCBb316nJ5f
         mtLBNMJ1z+p44G5uBrXjUn3A4BnJHS/0NLZWRSczqy2/L/H1havk9/DvsD0tAuqzVQlR
         iSGnm587fHiyFwRRPQWr+WhFKmVRxtTwmVaWOV1fvkThvaGCAmAfH0eAh/yQ9iO/Ge/O
         bh3UtNJUmCe3Zou0/s+qZQYc/aobA3Ro/IX34TYieaAYQvYb0wvIuhezSJhkXuRFMECZ
         j1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774697873; x=1775302673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFKLV1uuPMHuCXFEpJEzKwAbPMuwARFQ2NoKMHcpKbM=;
        b=kfVUnBisp8taRB6k1iub6fbSFlNsEy2XhBSJBoAJSHIYqAqjfpZae7exjs65p/RCT5
         Q1I869k0tPXh0rVV0b2HrZfDSvPa6PcCpk9bih6pra0C8wkzD3jiWD5QbQhL/B+RBv0c
         eMqGaFp6dQJM6HgLgP2AbliIRTMfPDOyfPRSTxZ0aksnwfxGGZtwUmVjhx89JL5RET2c
         C8gtnZENGUdW3mT7AIQQTVb8vxD8j9E7hcTlVp6ldRs3fqB0/mHGkLbF3M4OB0wgi2Yw
         d1xh/Z5cm/aEp5alx2ow2Ps2zfwSFzJRXL9fzJB86ZePzcg4jdLWutr365x4qNQtmHgs
         jSxA==
X-Forwarded-Encrypted: i=1; AJvYcCWrO6RB2vGBukVhSsW6ltKGau79qzqpkuVCFOQ7l/haGxzZhCauXNmBZZfNPvxXPc4JMBIbOmqqiCuAsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyfwhyNFI6Jx+0WWBwof42lBd6ql7J5WlIVcCnNL56jRmOkHnb
	oDs83Mmv/EewmQAWk/ypUPZ4BSH2j26nLxkOpHcKKYUqwelgDo/U8DDYFG6J+IQRVe4nG+IqkYi
	MVa437Q39NfuczLND3CiGhmsuO6GLDRkf6HexGLxqwjB8rPR3FDUoAjrckYUrxChhZQ==
X-Gm-Gg: ATEYQzwvEpMImL4j7YhFiMqBzuNlaVvnkF1OoKnsYjPOM0oojKyOwFtvn9tTQtB8Qph
	uRwOLT5nIqkT6hGukV3K8P1H9ND1Co4e5vdMR2vfBRL2/Wr0gxlRzeceAYp73+nLlfSLYBwTlL4
	ShQAYBZGPHp/VQsKjaHNCsGZGjQBwNUP4N3x8qz6tnk44gIQ1LVS3+52CIX8Ny14QbbEm6SEzFA
	TXb23X+UEyBjeNnBliHn695aAleqE0c0k/46pxHanl7fLnvBFYGp/guLh0+dUTpiYUX479RBt/b
	vL6wVDV4Q8VW2v3CAIrUS+S78lW+OHQAaupJYoubzJixdUxasHoYGoHBpNzl2uryXZllgOUwF/b
	xUN5ima2VcF1Xtis4KAVWSRfzRmE3VrXK1OjTXlVMIM5DnYHVn02MZN8=
X-Received: by 2002:a17:903:3d0f:b0:2b0:7e4d:f390 with SMTP id d9443c01a7336-2b0cdcf14d2mr63227335ad.41.1774697872982;
        Sat, 28 Mar 2026 04:37:52 -0700 (PDT)
X-Received: by 2002:a17:903:3d0f:b0:2b0:7e4d:f390 with SMTP id d9443c01a7336-2b0cdcf14d2mr63226925ad.41.1774697872472;
        Sat, 28 Mar 2026 04:37:52 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427b3bfdsm26195065ad.75.2026.03.28.04.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 04:37:51 -0700 (PDT)
Message-ID: <aa78d904-1c46-4fa4-b06f-f130aae145aa@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 17:07:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] media: iris: add platform data for kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-7-9c0d1a67af4b@oss.qualcomm.com>
 <5t3bke2sjkxahn4pjhdpyznbrdmu67u7cfgdfwqgjcgo7cbg2e@4wr2jadk6b7i>
 <cb50d35f-840d-4732-bf86-4e96f69fef35@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <cb50d35f-840d-4732-bf86-4e96f69fef35@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c7bd91 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=yLWmkx75ThOYqhw51wEqsw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WznVFTgscVg43mOb2l8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4NCBTYWx0ZWRfX9oDoaBM84n6g
 egQRmJ9s33hSOhYO5jUJ7emfA0ySF1gFZ7w1aB6HuPS2PBnwEOJpW/Taqb6Xa9O+4F+u7jjT1CS
 Z1axxVzg5kDLfqCPKjpW+ejtEFzrkBEfRK7w3v+2z2DJJkp+Bl1cQJe+h5H3Hshhw+m9YcALwoC
 pQN2k63B3f714saK4K6hNAjdpYSluKEhUNG97Xft3UyKNzlT9Nl5VPGUfuVaa1JschsGPJJi1Jf
 jGAX02jSh26EPTGj4T5fDgmQXAQ6Td9we3AUvy/n1MhlUR3y65gX9gXYtoS9zgFzcXitc1PHy9Y
 NPzj/E4FJN6vi3lOE4nOGyExavy0EF2b+/wZTauSSLj5Ijq2sJrpCr3MPFGzY7llcWBG5n01KW4
 ry/3nF9257K5cJwC9GLqb4yxTs+Ys7zPdiWRsa2SIz2gi/tyWXNNc1JEnsGT2zRaN0ydDz1ntmL
 OXzgCGjPkQemf2vT3hA==
X-Proofpoint-ORIG-GUID: R6pB4z8bmXZHdAmbI_78yJIEAcv-8mZC
X-Proofpoint-GUID: R6pB4z8bmXZHdAmbI_78yJIEAcv-8mZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57433-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 101A334E321
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 9:25 PM, Krzysztof Kozlowski wrote:
> On 13/03/2026 16:46, Dmitry Baryshkov wrote:
>> On Fri, Mar 13, 2026 at 06:49:41PM +0530, Vikash Garodia wrote:
>>> Add support for the kaanapali platform by re-using the SM8550
>>> definitions and using the vpu4 ops.
>>> Move the configurations that differs in a per-SoC platform header, that
>>> will contain SoC specific data.
>>>
>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 90 ++++++++++++++++++++++
>>>   .../platform/qcom/iris/iris_platform_kaanapali.h   | 83 ++++++++++++++++++++
>>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>>   4 files changed, 178 insertions(+)
>>>
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..bdca1e5bf673353862c1554fb0420f73b3f519cb
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
>>> @@ -0,0 +1,83 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#ifndef __IRIS_PLATFORM_KAANAPALI_H__
>>> +#define __IRIS_PLATFORM_KAANAPALI_H__
>>> +
>>> +#include <dt-bindings/media/qcom,kaanapali-iris.h>
>>
>> So, you are including the bindings here, from the header, which gets
>> included from the C source file including headers for all the platforms.
>> What if Kaanapali+1 (or +3) defines different sets of regions?
> 
> Different problem - header file MUST NOT have data definitions.
> 
> That's basic of C, we don't write such code. First because it leads to
> multiplied, redundant data. Second, that's not C coding style.

Ack, will define in c and extern in header approach

> 
> This pattern in Qualcomm Iris is terrible and I could accept variations
> of existing data like below:
> 
>>
>>> +
>>> +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
>>> +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
>>> +
>>> +static const char *const kaanapali_clk_reset_table[] = {
>>> +	"bus0",
>>> +	"bus1",
>>> +	"core",
>>> +	"vcodec0_core",
>>> +};
>>> +
>>> +static const char *const kaanapali_pmdomain_table[] = {
>>> +	"venus",
>>> +	"vcodec0",
>>> +	"vpp0",
>>> +	"vpp1",
>>> +	"apv",
>>> +};
>>> +
>>> +static const struct platform_clk_data kaanapali_clk_table[] = {
>>> +	{ IRIS_AXI_CLK, "iface" },
>>> +	{ IRIS_CTRL_CLK, "core" },
>>> +	{ IRIS_HW_CLK, "vcodec0_core" },
>>> +	{ IRIS_AXI1_CLK, "iface1" },
>>> +	{ IRIS_CTRL_FREERUN_CLK, "core_freerun" },
>>> +	{ IRIS_HW_FREERUN_CLK, "vcodec0_core_freerun" },
>>> +	{ IRIS_BSE_HW_CLK, "vcodec_bse" },
>>> +	{ IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
>>> +	{ IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
>>> +	{ IRIS_APV_HW_CLK, "vcodec_apv" },
>>> +};
>>> +
>>> +static const char *const kaanapali_opp_clk_table[] = {
>>> +	"vcodec0_core",
>>> +	"vcodec_apv",
>>> +	"vcodec_bse",
>>> +	"core",
>>> +	NULL,
>>> +};
>>> +
>>> +static struct tz_cp_config tz_cp_config_kaanapali[] = {
> 
> But this is new thus NAK.
> 
> Don't grow this broken pattern. There is no single reason data
> definition should be placed in a header. No single one.
> 
> Best regards,
> Krzysztof


