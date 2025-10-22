Return-Path: <linux-media+bounces-45272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B3DBFCEB0
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6A461352919
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 15:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CF534CFD7;
	Wed, 22 Oct 2025 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+mR72vB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F6343D7C
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147423; cv=none; b=UkJhbgjgbk+nBP9iWgRYZpwaDwIWzcMRUpv9RaGSoruScHIe5vktWvRmCwWklllAgxB/Ioj2fyhGQa0zGoaoDeXdkMnP7V5JwfwE9lmnGapICuXXZbxdKl8GQUi9LSzQ18x5S+rgw79RghMhBK6GSs845RR/EksMATKPONzBB+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147423; c=relaxed/simple;
	bh=yw7MYPuJwxskvEnV1slIcH19SvjfzztecTsuaNiUHWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppbdpMaR/3zJxeJ+GuNBake081T6tn/BLvl0Ye4M2dlrqJ6DnTWGvwBetLmCjyVQ1lQj5mNjRDNPVHcBibxSoAuPR2vCvBHvEhcIa9bj0yelgG3+tv4B0NkZVzEv4TH0MUT0C7dJzzVNXF8/8dAe8KEB/SWkkcfvpKnZqs83T94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+mR72vB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA0P7n018904
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 15:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+mhibcr3KvxpGvWKRaEQkH0yOEvTS11FzM0f/Yj4IM=; b=N+mR72vB8fZvYrOf
	Z7+8pw13DC6cpHEGOJaOqLWxI7uFt7PYW9q1skSuc8cvf10FTfjiqrT4FSKP8je6
	aKjJegJ1MZka/ym+FAv2gjmvhVzyGycQRz639NZrtjJybBbPl6YSjNXPL6mB9UWM
	NFFWPdtm1w6CcSqAF/WfNHh5+2oWQvWcT28fRsiCkOY/+loj76uMf12X32x1A56m
	GQN2kxHDm3tmOmDt5GCezopMY42p/Cesdntl9kCVMO4+zQax+3N8zAqtutq+FhEX
	p3ss9ylZeg6tvXC71TRCwQyNh1TQQzr+87D7i9kmMP0yuKmYiIwW+yRNoBVgif4L
	tdfm2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469n5nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 15:36:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d6c3d10716so2077511cf.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 08:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761147412; x=1761752212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+mhibcr3KvxpGvWKRaEQkH0yOEvTS11FzM0f/Yj4IM=;
        b=CdrEQel3bQjOS63UP9ej/ucyUUWUnCsj6E8kEtEQvF+U7CIHjqKahRrHLX/BEUlJbG
         2WkAry5wkvGf6a43LVdZjL6okbF+iHA474P+Bb6PIYqcrW/W4+kU/gWoCN7ybz36SkRM
         YCPXUjSvyhOQFWBbRFbLVpnvwfE2dTnOV3Kn97R28kLRVnjIRw3W3vqavypqY+h0pqyW
         bpRyWylvCDXHNHLGObciSyMdtswPRCGSSL4gKrBsC7F7Yd0XgSqNhM0l5vzNAkvDIzhd
         h0PNRtdsGTL90ROzNyoSJC1s0ERGw/ftQ+W9Y1v5ZUhaiNojcejAnUbynSQIhiOJH0rf
         Lz/g==
X-Forwarded-Encrypted: i=1; AJvYcCUfo4Jo2Sln77voITSVBbYjXN8yfj1UUwAQBdHMCwMykP9YOXKHrhuH/KxgxOVHHhgrH6WGDU/0mKJ9YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ5u+1ul+uW3gDfFi18VvXnFo2JNMxecL7ld5+glUN0gbhMq97
	e4o/l3p0540TpVsOgECb6crg5TUg+hi9JQMgQ/AABvd2AwbrF56vO58oMNWykBiJK8XDJTcaBXn
	SSrmemUlcXSU/7MdUyxuH7dOUu8BalMRPu9Q7ITg66qn8+PQxGQWIiFceFcRKLCvr7g==
X-Gm-Gg: ASbGnctth9po4vgBYYkeN302sNaZET/YHmWltaDVuDDZ3F+PAim7kedwRw+LXpWIS2g
	y6BH+iTA+GUHv8jQu5w991MTEn13+7bvrrWAjiC5yVtUFyf6/TDjECYDaJhKnTlxCOSVqoUmPJ8
	IfK8SwzkYeBxa+/+wkuw2PPBh4QTqYKV4/HOrNFGeTX1ZRJle5QsLfMre3zu4/bsLFygs9f8Jyn
	j46R6GOKMjEBqr4WA9dda02yzgtKpsJB5ZsHIUnYwQCIduXVwIpVF1RAd1JsxqY4k0dUw7PItvW
	+OrvzCvKQR/F22ltRz80G8BbjJUXsKnKM4DygTijDhiID53RihvydLFXJ45EwCAzZ0nBLKVMph7
	C/3pfmnJ8ecGxs9t9f1xbbj1J0q+Qs+hSU/+SEWIGOcBo/vjBJuMALxRT
X-Received: by 2002:ac8:5843:0:b0:4b7:94ee:4fb2 with SMTP id d75a77b69052e-4ea116b05d0mr59506811cf.5.1761147412350;
        Wed, 22 Oct 2025 08:36:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5FuP8hgpkFIa3uP3XvrbHL/HJQny7T4MX9pzM+xYE09ja+BdsOTDkZo9VZA53gUib6HSKPw==
X-Received: by 2002:ac8:5843:0:b0:4b7:94ee:4fb2 with SMTP id d75a77b69052e-4ea116b05d0mr59506401cf.5.1761147411728;
        Wed, 22 Oct 2025 08:36:51 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab54desm12600892a12.13.2025.10.22.08.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:36:51 -0700 (PDT)
Message-ID: <9c920cdf-1985-4656-bee2-8bfacc15bfa9@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:36:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
 <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UAbCnP6-F7uo2NZMm8DotWeUOgP_cX2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfXxnlPJVtkwTdp
 YMdEWCgO1sHP98YmUu9Iru3Sj+dxReKKAP4nUlVZD8gT1rUYG7VukRZycu7n3Dlv9rJOx9wCneQ
 rbocRBWdZ8W8l2kyxZ3mUMrjdnWooanl7q5TKWemu5G3z1M2xipsEpUaNA43iT568lU+eBBwp68
 ryZ8Ekz5Al2alJt98XL4WQr1v++YGl30CR3LMevnILpNSnAuyDu89j9EbOOiwUILCUV1gSR4+kj
 5AuGNhqCLr63UJClUSJPxxP3I1RrJKW+dgo3IxHoyGyc13xyzhCKgzbDFcjsKduG0sEY4BNnhFk
 LwyTBKD7i8dw1Z2/EEmN/oOd2n6frQM/hckhhTlQPR+V5Q4XExXGIef0pQIvv2gRLO0p0vLMd3M
 HDa3FuBzUSj8TdPsVJACWXKjsm/CsA==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f8fa15 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=MY7ZD1EjAs5gof5aNy0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UAbCnP6-F7uo2NZMm8DotWeUOgP_cX2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/21/25 8:55 PM, Vikash Garodia wrote:
> 
> On 10/18/2025 9:28 PM, Krzysztof Kozlowski wrote:
>> On 17/10/2025 16:16, Vikash Garodia wrote:
>>> +  clock-names:
>>> +    items:
>>> +      - const: iface
>>> +      - const: core
>>> +      - const: vcodec0_core
>>> +      - const: iface1
>>> +      - const: core_freerun
>>> +      - const: vcodec0_core_freerun
>>> +      - const: vcodec_bse
>>> +      - const: vcodec_vpp0
>>> +      - const: vcodec_vpp1
>>> +      - const: vcodec_apv
>>> +
>>> +  dma-coherent: true
>>> +
>>> +  firmware-name:
>>> +    maxItems: 1
>>> +
>>> +  interconnects:
>>> +    maxItems: 2
>>> +
>>> +  interconnect-names:
>>> +    items:
>>> +      - const: cpu-cfg
>>> +      - const: video-mem
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  iommus:
>>> +    minItems: 3
>>> +    maxItems: 8
>>
>> I don't understand why this is flexible. Make it fixed size and anyway -
>> list the items.
> 
> kaanapali vpu generates 8 different stream-ids. Now, boards running kernel in
> EL2 mode can list all of them, while boards running in EL1 can have only non
> secure stream IDs. Min have the list of stream ids which can be enabled for all
> type of boards, while max is for boards which can list all in HLOS given kernel
> is in EL2 mode.
> 
> Below crash would be seen if boards running kernel in EL1 mode lists the secure
> ones.
> 
> [    1.361157] pc : qcom_smmu_write_s2cr+0x64/0xa4
> [    1.361165] lr : arm_smmu_write_s2cr+0x2c/0xbc
> [    1.361168] sp : ffff80008005b8f0
> [    1.361169] x29: ffff80008005b8f0 x28: 0000000000000000 x27: ffffc7f252f45320
> ....
> [    1.361195] x2 : ffff800081200c48 x1 : 0000000000000048 x0 : ffff800081200000
> [    1.361198] Call trace:
> [    1.361199]  qcom_smmu_write_s2cr+0x64/0xa4 (P)
> [    1.361203]  arm_smmu_master_install_s2crs+0x7c/0xac
> [    1.361207]  arm_smmu_attach_dev+0xb0/0x1d4
> 
> Could you please suggest on listing the iommu items ? I did not find the
> relevant references in other bindings where flexible iommus is being listed.

Krzysztof would probably like to see what I believe someone else somewhere
sometime suggested in the iommus discussions (sorry it's not possible to
keep track of it all), where the DT can list every possible required iommu
sid, but the driver ensures only the ones that are necessary are utilized.

This will require big changes to the iommu framework though, I'm afraid

>> I already asked this.
>>
>>> +
>>> +  memory-region:
>>> +    minItems: 1
>>> +    maxItems: 2
>>
>> Same comment. I already asked this about iommus.
> 
> Same here, there aren't any bindings which lists for flexible memory-region.
> Please suggest if there are any such references.

Similarly, we can define the additional memory region that's necessary
for $reasons and leave it unused in the driver (actually I don't know
why there may be two, but let's assume it's a QTEE/noQTEE detail), because
for the hw to operate, it must be set up by some entity in the system
either way (i.e. the memory is reserved even if it's not done by Linux)

Konrad

