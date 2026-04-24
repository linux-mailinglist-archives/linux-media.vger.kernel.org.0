Return-Path: <linux-media+bounces-59526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHhSJoBl62mtMAAAu9opvQ
	(envelope-from <linux-media+bounces-59526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:43:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C3445E984
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8830303265D
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B436E35F5ED;
	Fri, 24 Apr 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3e478bO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnS7jzt1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEDF3BAD87
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034548; cv=none; b=EuB4SbmOAXpkevIc9K1BzTPvBPxmmDOY5Thmb7BRg/AeLtE9vJOYmK89MZ810IQZ8MyFrG2oTkl5Nq1++bpz5VonAOZtHLY7sR+ZJ6coVxEUaNtO9MzueHeXtSurvmlcfM/j2aIm8qZkbhpBRBkjTCzpYbXo3ZuK9Cn/BFdm/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034548; c=relaxed/simple;
	bh=IRTghGNuWjWk+3xT8oRjoZ6vfBCZ1AHElgjUbPw/r6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwcwialZBBkpzbQpDJL0r38eZUtvijXSgt0Ei7EW3S8F/kqG7xvShnL+eEAoTufQMX1+ohF4P3uteZ6jQ+pzAU61U7M/xKNtZ3cUYt7BCOn4MpIdoL5nDcI6N6DoDCQIXFHvlVJ2cIofpJv11j53AJZ8lx/Wo7poQHKO92nd78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3e478bO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnS7jzt1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7YuNj4167365
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 12:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jUS4BVvtxQ4TlCKv27nqabFS5yyU+r3C8dzKt76/V0=; b=D3e478bOH4/C9Hs/
	7YNC7YynmUR3IOUxKYiQNOhjxmU2kEg/Y05Cvi23HXY3Hde/0KhOOvgdTU0BKIML
	9BmKynKnk0Fp8K8kDUCENN3sTMAXwyhP10WIXcIBE/iaiId0f89zp8d8L2cp5OUs
	d6xL2hxVU332SWAOwTxy0o/uqgzh3qahZ4H2gdoKsRv+TcyV/TnqIH8WYg6x18YU
	QdffqgDmPuwFFR2uHcnTqtYJg/ZjGRH+f0v8nUCEG1T3ByDTi5eEk492urWPMAzJ
	u6QkRkYfO56smaSauV8bAxpMejKEHOlRIEZlyImceOsP3xt7M+ajmRSygrrSRuB4
	yrL02Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n1eha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 12:42:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-362eb03240bso711019a91.3
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 05:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777034545; x=1777639345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jUS4BVvtxQ4TlCKv27nqabFS5yyU+r3C8dzKt76/V0=;
        b=BnS7jzt1qVZqP5HXgmUixl8yXmSj3EXuU8vHamIV6LWzF+/qKLuNlzbUQOaK4TR2DQ
         AFoJikhYVbNeoYCYzs2v/4rXrhInb383gzFSHnHQ4+XPiCR/LXIwx65WClofXXwbR0Sg
         Cma8gdsNLHXFulfiiX2MQcoqafZKWsCHzHjiBG8GublAkPZCaLuSbESubC6Yo3x3HZq7
         uvV/xpJdFGWcdLB9UXMh/Ul54Uk1TqPSoOOBXDsRZHXQBabLVfRANp/KrBhsI/YynfQ+
         vku8ViozJ3u3nbhg7B8RseVzw3JdfcKBgjgPUgBWIHwZfF2OHTuTbkKabEqXYw9hu9Fb
         7iVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777034545; x=1777639345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jUS4BVvtxQ4TlCKv27nqabFS5yyU+r3C8dzKt76/V0=;
        b=Vm062GacUm6LyVYVcDwY2uPsvV/PmI+d0F3NO/VHXyI01djIB8qaxugxJDJiORpCWp
         hD1e9DKrp9H/6ZtC+fjESZYnZViv/ldvI2PimBizdz8/nn/tD/zemmngaMvB2gIreSEp
         FQK4vHgrxdMrecWvi1n+vgbgdEmn0vX0pRNmDCFSObNIf8e6EGxpcIoIDC1tSvv4xIHc
         afA+XgoClporqZ0r+CPG/AglR1g7/v+h5gSBufO2ziPEbEVKZCwx370rGhi5YtCtVu1X
         GBtqgSmdIn4ZnDeGlnydpyYn+SR8d95k8xvW75FiVUH/B+V6EholMk4v9Gm9kM6ispph
         YHVg==
X-Forwarded-Encrypted: i=1; AFNElJ8YsK7JdH6Rdcj00i4ZbGWDnVlMXqbU0HWcA//dyqIgCppQuSachXHgB8Fve2bpW0DlZb/C8ouqpFQyBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsOF/lnsbrfhIviYUQDIci44MjF/Mtc453Ius7VJTefhD7p/69
	E6ej6zJ/9N/ggON92+9h/i2WvmWcRmu+t7+Gci7tLG/9iyxCTs4gZO0CmhHPpFa1Nv3C4weer5O
	XzIiYODHGKgO92oA0L13MuwGkjAqdJqwb9Jx2UGshKmKnX8BPg6puFaDgGD0potWI0Q==
X-Gm-Gg: AeBDiesCmVkx8vDtDOqMMZ6wVoPDzMblmsM5T3OhWk/HuGHL9r8hwhv2uKFZ3FwwNJy
	X5i/LjKedQ/K/5KlDyfHqa1daum59jvMYTn+vVgoOv76UhAxroAw+pNDIqcJIFKzmMjYsKw33q8
	4W5VcaMfdX1qQ2FYUEVuCWBMaTLmlc45yb3dOdFe02p4pLfpSLLNUIjP2wxrh32DgPH1FgDJZbG
	Zm7WKD3YcuMhhseZqcI0fAv1gTSMv5nm0HY6OcblyfN6pixz2cq2Y3hr8I5jWNLiw/lj+aQ8xiu
	r8z9A8SVwKagw3rYCWgfTnpJJbrAjKImdYLm+pJfUbkyDpTU+kHq/vIUUB1L2ZH6IsqAYMBY7eN
	fuaAapjaS09W8s02mkYY6etuNYjnzI/9lc/huEFcQD1H/t1fiSnrFCVwAIdQmeUAA
X-Received: by 2002:a17:90a:da8f:b0:35e:594a:5b75 with SMTP id 98e67ed59e1d1-361404c1034mr32348906a91.25.1777034545194;
        Fri, 24 Apr 2026 05:42:25 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:35e:594a:5b75 with SMTP id 98e67ed59e1d1-361404c1034mr32348850a91.25.1777034544617;
        Fri, 24 Apr 2026 05:42:24 -0700 (PDT)
Received: from [10.239.60.18] ([106.192.26.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410b998fsm23315385a91.13.2026.04.24.05.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:42:24 -0700 (PDT)
Message-ID: <1e039dd5-da3f-19b2-ef98-29e64fdd925d@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 18:12:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
 <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
 <2026042422-deem-chemist-8d0f@gregkh>
 <4c3fa710-f61a-4aad-622d-54909190cb9e@oss.qualcomm.com>
 <2026042428-blemish-helpline-7d8d@gregkh>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <2026042428-blemish-helpline-7d8d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZN1eOxXakz_In4M76HmNm35T4nNTYA2R
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb6532 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=K3jt3zD9TrcZs+Uyli2v9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=fZobZ8Dl1N5RqnsFfjAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: ZN1eOxXakz_In4M76HmNm35T4nNTYA2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfX9+9u17PQYltI
 uullT2Cs9l5ES3CytdLw7cyLicoRPaQO4gc149zGmetr73oWbUMbrHYTWE8uT/qAwpwEZ6xdF48
 75DIw3FFXrBpgjvS9ZFYpHHtxQVxhXEcVGcPI2fCOODj8FRJ1z+Rt9v4+eJJABT0AYAbM8PoUPs
 NbxzxxfvG8WjLBI6T3NOv0Gz060ng1VCwUAuclaY7wLkTTX/sVgV4O2BpaAVJYWoow1khg1xHMP
 PgHBPzpWxF60+5bc/5g1A66uXJVIw3DSk70O4T1Ldtxt0qJjJDAeNU+1Lf1ICVBx6PfOf426yZn
 xVeyORe/TnWmPEnyx1MRNssMOkgJkfyQwIL2uSrQ/TQmDJFCkCx1Ql7EEZKbFVp3O+sMgiYl+ig
 8w586+AdDeXvZnEyYpfuc9NWY8YWo8wVT1t8JmLvDHg/8E5MsEYPhi2EBFQJ2rLTskdNsiSFqni
 VTtdWIyRFD7qiR284Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240117
X-Rspamd-Queue-Id: D1C3445E984
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59526-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/24/2026 5:25 PM, Greg Kroah-Hartman wrote:
> On Fri, Apr 24, 2026 at 05:15:02PM +0530, Vishnu Reddy wrote:
>> On 4/24/2026 4:43 PM, Greg Kroah-Hartman wrote:
>>> On Fri, Apr 24, 2026 at 04:01:13PM +0530, Vishnu Reddy wrote:
>>>> On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
>>>>> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
>>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>>>
>>>>>> When a driver needs to create virtual device at runtime and map it to
>>>>>> an IOMMU context for memory isolation, there is no common bus available
>>>>>> for this purpose. Each driver ends up implementing its own bus type,
>>>>>> leading to duplicated logic across multiple drivers.
>>>>>>
>>>>>> host1x driver implemented its own bus type to attach an IOMMU context to
>>>>>> a dynamically created device. The Iris VPU driver now has the same
>>>>>> requirement. Rather than duplicating the same bus logic again, a shared
>>>>>> bus type is introduced under drivers/base that multiple drivers can use
>>>>>> directly.
>>>>>>
>>>>>> The bus takes care of creating a device and attaching the IOMMU context
>>>>>> to it based on the client inputs.
>>>>>>
>>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/base/Kconfig            |  3 ++
>>>>>>  drivers/base/Makefile           |  1 +
>>>>>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>>>>>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>>>>>>  4 files changed, 107 insertions(+)
>>>>> as you can not have a device on multiple busses at the same time, this
>>>>> makes no sense to me at all.  "dma context" is a bus-specific thing, so
>>>>> please add it to the bus that you are wanting it for.  It can't be a
>>>>> generic bus as that just doesn't work.
>>>>>
>>>>> Or what am I missing here?
>>>>>
>>>>> And why is DMA somehow "special" here from any other hardware attribute?
>>>> Let me give brief information which was discussed, in the initial series,
>>>> the iris VPU used platform bus for dynamically created devices and we got
>>>> the comment/suggestion from Robin to implement a proper bus_type with a
>>>> .dma_configure callback.
>>>>
>>>> https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/
>>>>
>>>> based on the discussion, implemented the dma_context_bus and used for iris
>>>> VPU devices instead of platform bus.
>>> Why not make a irus_vpu_bus where you can do what you want?
>> Initially iris_vpu_bus was introduced, and it was made generic based on the
>> discussion,
>>
>> https://lore.kernel.org/all/20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com/
> I don't really see that request here, I see a "make this better and more
> generic for other busses" but that does not mean "dump it into
> drivers/bus/ for someone else to maintain" :)
>
>>>> Here, the device have only one bus (dma_context_bus), not multiple buses.
>>>>
>>>> Regarding the "DMA" naming, the core operation of this bus is its
>>>> .dma_configure callback, which calls of_dma_configure_id() to map the device
>>>> to a corresponding IOMMU stream ID. The name "dma_context" reflects this
>>>> purpose.
>>>>
>>>> I am open to suggestions from you or Robin or anyone else, if there is a
>>>> better or preferred way to achieve this, I am happy to consider it and
>>>> rework the implementation accordingly.
>>> As there is only one user, just make this your own bus please and do all
>>> of the needed bus operations for your devices there (i.e. don't hang an
>>> "empty" device off of it.)
>> The reasoning behind to make it generic was to have more users - host1x,
>> Iris VPU, QDA on the generic context bus, instead of each of them having
>> their own. Let me know if you suggest to have the iris_vpu_bus.
> But you did not add such users here, so how would we know this?
>
> And still, I have no idea what this bus really is doing.  Is it dynamic?
> Is it self-describing?  Why not just use aux-bus?  What is it supposed
> to be doing and used for?

This bus will allow users to create a dynamic device and map to IOMMU stream
ID via .dma_configure callback which calls the of_dma_confgure_id() based on
the user inputs. This bus is under the iommu_buses list to register for bus
notifier callbacks for iommu_probe_device() and iommu_release_device() during
add and remove.

auxilary bus don't have the .dma_callback and bus notifier callbacks where it
can do iommu_probe_device() and iommu_release_device(). iommu_release_device(),
being a static api, need to be called from bus notifier callbacks which should
be under the list of iommu_buses.

>
> still totally confused,
>
> greg k-h

