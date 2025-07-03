Return-Path: <linux-media+bounces-36684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F35AF7BDC
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 17:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 328BB7B104D
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 15:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DB71DDA0C;
	Thu,  3 Jul 2025 15:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VE0KPHD4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638419CC3D
	for <linux-media@vger.kernel.org>; Thu,  3 Jul 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556527; cv=none; b=tNfs3qUhhtMOAUIjH3zShVihkKQ1Eg+fbJq1sWK+qq7W2whlMsUcXUTHEYrsXuhpkIFKaRMTCLJb23uUf0F1AUFzSDTn2ep4arQd1PMh3a1zZ1MqNLxurFtKjedSJGbLD42KIGGKzaOYvKe4z36FoHTd1sHdSN/uDKwrD1jzV4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556527; c=relaxed/simple;
	bh=8CzUJQpMWoh2iCytXS+C8OvozoPZGZ3UARwoY554gH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WY4TZAwhkirtjTkiuhuL5frGmRV8ZTogdBRkNLH0aqR7ml+bvqMzwbbvPMewtXc7XmDl9GqlqYfCgZY4DN44sPrEgs/+5SfCaddXaWarKEhd2A1LcTTgpGRkn+N9Psi06QkB+xfx3S2Tr2mka1G4afaSElJFGi28B9A/zvpubzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VE0KPHD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563BhfcB020529
	for <linux-media@vger.kernel.org>; Thu, 3 Jul 2025 15:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lB3GyQgbImWw0wJtLFROwCUwuZIRVk6wsudtXt6O2WY=; b=VE0KPHD4lxSt/UMe
	U57ikihOWP3zDwVydsLozE4e8z/gNcvLkWQcryjj2C8iKia7UFSF2o7XAwFTVugR
	RtNBfHLu4jEddjRHQGg7TMD9Y4NQIwKNmnl9Ff1I2RnCq0nWX/m0eqlciL5J8vTr
	iQQ+u8N70tqWVyQ0MeTrnuEANVrASRw/Iqf8Yr/JdDiUfYJy7o2TEexI8EwZH1bj
	EgTmgkze3pkLJ8fKUhcdA29wzRxmu49xtjno87Uy69X+blZYdT4+UDyZBb74qRUm
	6VjCqAFCLIjd7mQw40dPFeHIVAnXOP50FCv+GUceZyx/+nRPRsxYLEPSvtd7htmo
	0ifDfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn7mj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 03 Jul 2025 15:28:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d440beeb17so87664585a.0
        for <linux-media@vger.kernel.org>; Thu, 03 Jul 2025 08:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751556523; x=1752161323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lB3GyQgbImWw0wJtLFROwCUwuZIRVk6wsudtXt6O2WY=;
        b=i1cRLX5/UGlA7IBFKK6eq9nt0fCYt6hfavNQfxCxgFPC6ujES7m0/GNvhw80bKcdBL
         TLGvfv4kgpLVq0fOI3aldsvgR1vD0JAkt/iQr+9JGvKst5tWeYo6ObqZze/65/FqEgRy
         rxZHNku42fVjyN6PiXi46o7YYATl7azIqQ6HgQhrYHsWBdAWmBu0W3AbOgDWLy1NzECG
         r33OFjKSxHpK6NghTI8Hk9E90Qg+mJBWgaZmCkc8m62hFZcoxXMBZtHal4qqMiYuO4i5
         +WedMYGw1/C8Pcg2XbxeLpkZKZWYj7t1A28YAUeg5Zj99bJNYcD7n62ffFbH7oM0FRQE
         FjLA==
X-Forwarded-Encrypted: i=1; AJvYcCVHU+79k7kW4TAwLM+bTy4dRjOX9EcZf+W6EW/vdlopPvBl5u9Xf8yXzYfZLWMrjCNqt13clIAZFpvrIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVPstanNn6sWpSaEVxnkl6NvPQKdx1Z0ZYRyZ2itvRjVxF+Jsz
	skC+tERF67boEvbd9gzRee41+13w3NfMRuOKQyFFmlX5uOzDiY7INht7WSP9fUTf/XxjS8GIv0l
	p7MRvnhh9GW2IZyiUvbM89M1K3FLkily+zX0IlAFwnMBftYSDv+w1guW/OXCDcHDHDw==
X-Gm-Gg: ASbGncvse2DWbwHpRhvmHSTDGGTypsszlshTB3hw9Uc+G16cou1anz+4Cc2APv2j8PV
	jHIAYFUiLAxjeBiPKAEktwyN4Qbmdjg6PGp1rDvMG1JN0A2GlrVdndCsfuYPl1XMVaTsoSPSnPH
	lx48nEsaY0V1uSKzj1nu58hn65nxC70F+LsO5whz3t4ZMbNA7RVsDQnZbTmfc4DXQ9qOTNO9E22
	P/lMoQ15v8VWWTFA/zc8K9hCCCApUq3XveWBquEMzdZFJ+2jqjNQ/tBfjk4DBCL+MBhGmPQEzsK
	6lXkxAepcc/0RHkMSLApLuX7DsYZk+/WnloF1H4kO519nkaW4Q7vBUXSb5PCFvT4s1wbeW+vHYW
	Km02kyA==
X-Received: by 2002:a05:620a:408a:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7d5c476ce96mr338195085a.11.1751556523387;
        Thu, 03 Jul 2025 08:28:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYROatQiIdSRndOVo9BLkkhoc+SWGXG6ITnZGJxgqN8bVXUZzt8u+b3n1+LTxv13qnf9jpMQ==
X-Received: by 2002:a05:620a:408a:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7d5c476ce96mr338192585a.11.1751556522666;
        Thu, 03 Jul 2025 08:28:42 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae37e7508fdsm939819166b.106.2025.07.03.08.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:28:41 -0700 (PDT)
Message-ID: <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 17:28:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyOSBTYWx0ZWRfX35r0umr5AnW5
 +eR4Kq/1RHfGuwnvavhcxkSLX2xwH9ADHGobc8rITbRKmOeEoCVfZdTyDI3ZdeDHZvYzCUAuhVx
 VmppEQSuxFMFvsomR5vp5ns1dYGGpTfIFjSrewhYCT+QWNmhdNIisCkUO4EhcnRDH7J/FCouJBD
 oNx0MG/LZuNjOfRLN0MG4BxXaC0ZT3S8DAJ0xYgtZHMnPJB5PDo4rWQVMp57e74pmGEiZgJ2qnU
 MFZ9g9jFISA6kUszjKQLXjebD/cQMBHkLiHDfiufvkVv1ikAM0ADsJpDN2T3yjV0yagKDmxmIla
 e8WOPCUp73Ab52uUF3hG8DEjHV7wxGHvBzTzTOk8ZEs78NUNP7YWoOcUWExpOgyMs6YgcP8mdpw
 JOWqzRb6tctKTnFt7W46y/xbKoX1i8nqJduawgiF0boY/tZhZwO8ndX0So6GupukZrSno2nf
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6866a1ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gHlHN3BjToyBUNvogygA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: xUjGei8M7crkDjeaqgkYDYKvsNPS_kVg
X-Proofpoint-GUID: xUjGei8M7crkDjeaqgkYDYKvsNPS_kVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030129



On 03-Jul-25 14:54, Krzysztof Kozlowski wrote:
> On 03/07/2025 14:38, Konrad Dybcio wrote:
>>
>>
>> On 03-Jul-25 09:27, Krzysztof Kozlowski wrote:
>>> On 03/07/2025 00:26, Dmitry Baryshkov wrote:
>>>> On Wed, Jul 02, 2025 at 01:06:17PM +0100, Bryan O'Donoghue wrote:
>>>>> On 02/07/2025 13:01, Vikash Garodia wrote:
>>>>>>> Anyway, in other messages I explained what is missing. You are changing
>>>>>>> existing hardware and you clearly must explain how existing hardware is
>>>>>>> affected, how can we reproduce it, how users are affected.
>>>>>> Exactly all of these i have explained in the commit message. The limitation with
>>>>>> existing hardware binding usage and how my new approach mitigates that limition.
>>>>>>
>>>>>> Coming to usecase, i made a generic comment saying usecases which needs higher
>>>>>> IOVA, i can add the explicit detail about usecase like 8k or higher
>>>>>> concurrencies like 32 or higher concurrent sessions.
>>>>>
>>>>> Why not make this change for a new SoC, instead of an existing ?
>>>>
>>>> Because we definitely want to improve support for older SoCs too.
>>>
>>> Older SoCs came with completely new drivers and bindings, instead of
>>> evolving existing Venus, so they for sure came with correct code and
>>> correct binding.
>>
>> No, this is a terrible assumption to make, and we've been
>> through this time and time again - a huge portion of the code
>> submitted in the early days of linux-arm-msm did the bare minimum
> 
> We do not talk about early days of linux-arm-msm, but latest where they
> rejected existing venus drivers and instead insisted on completely new
> driver iris. This is a new code, so how early days are applicable?
> 
>> to present a feature, without giving much thought to the sanity of
>> hw description, be it on a block or platform level.
> 
> You are saying that iris driver was again shoved without any sanity? It
> should have never been merged then. Better to grow existing insanity
> than allow to have two insanities - old venus and new iris.

Iris was created with the hard requirement of being compatible with the
bindings previously consumed by Venus. I think the logical consequences
of that are rather clear.


Perhaps you're saying that the binding for "newer" ("not previously
supported by venus") platforms should have included that from the start,
and I agree, that would have been better, but hindsight's always 20/20.

On a flip side, any additional requirements we talk about here, also
apply (in reality/hw, not talking about current bindings/driver state) to
every single "older" platform as well, and skipping them is pushing your
luck every time you access the hardware.


I also don't think it's fair to leave them in a permanently-suboptimal
state just because the initial submission wasn't forward-looking to
these previously-unimplemented requirements. I'd even say that if we
want to fix it, we should do it sooner than later, before the bindings
age and get more users that would care about breakage.

Comparing against downstream, I only really see IOMMU specifics (binding
SIDs to a PA range, which this series touches upon plus ensuring secure
buffers are associated with a specific SID, which is done basically the
same way) and (on some targets) an nvmem-cell for speedbinning.
Everything else (PDs, clks, icc, irq, etc.), we've already covered.

>> That's why we're still adding clocks to mdss, regulators to camera
>> etc. etc. to this day. And it's only going to get worse when there
>> will be a need or will to add S2disk support with register
> 
> We speak about iris here only.

Sure, I'm using the other ones as an example to show you the actual
root cause of the problem. It's the same "the initial bindings
submission was not perfect and to make better use of the hardware, we
need to describe more resources / describe them more precisely"
problem that pops up every now and then and is actually difficult
to prevent.

Maybe we can have some sort of a broader conversation about whether
bindings from before SOME_DATE or e.g. not older than N kernel releases
back should be deemed volatile, but that is a story for another day.

Back to the point, I actually think what this patchset does is
resonable, especially given the address range and SMMU SID requirements
that the OS *must* be aware of (or the device will crash after a
translation fault / security violation).

Konrad

