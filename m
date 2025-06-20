Return-Path: <linux-media+bounces-35504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857EEAE20EC
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 19:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C11464A7465
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 17:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7581D2E9EB4;
	Fri, 20 Jun 2025 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5SQ1nhE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E82E6135
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440430; cv=none; b=FAeRUbjvpZhYorTdIOstiBGOJZDXHvob45lSRuv6kwncVZ1430WVK5ppwa7IkjyWGPkagg836lNU0V+psPcHL6bBLRjvUYEshp62MZEZ4hwLgHmWOL+GmktduzL+lSl1bj3kOkaVlrmrJjFTBymMpo06nB40ohuHrDdOrmzwfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440430; c=relaxed/simple;
	bh=afDg9nn91haB9rfUtxnbz99YfZDDgCPP+SbrAya2c8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCjTcfuwgUBHlDXcc9NcQxGY2dBmp1XtBJNJDA3oNtXKq46NbBmQjZgdcDr2+mALG6WVvcKF9NwHkWM2AsoFvDPOrpGY02l8dvffHcby156RBcXQmA+DSOgQWVq7W2ivM6ZOLO9yqJYSfYCiUIohoSeJGBDORnpb++6YnSd+tbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5SQ1nhE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFcMYp015470
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 17:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHVZwsBe2mPFE2r8rOIceTU1YN7PAHuBHgv7EehUdXs=; b=n5SQ1nhEBTEMloFm
	VecGOa3kVZ/WwP3+oNFMvLCmFalNvpv05iJSsytBi6wSVHHwNF4fuzS3ytdRbhyW
	7vmGCzMgq/51HDaAXUhLWh+uocTC0ETVCOVzHRZ+ELqIOHM2y+KoUiobMtH60SLL
	Y+9jD9mVsC3wjaSDzZbVRz5AhNkpS3BGRIy4BiGhq1RQaiSgFXTF6pxRP5rk5CQu
	TD0XUGaqRUBdOPPHCBhhhFk3x1ufbeovG/P1gj7Uy8N/6kDWJ/b1F8lhnVXSgqZA
	cRbbqUJwDo3VSFIq+swZmUcyUunuOz0rDm1IVHFg0YnZLpa+2xR69ye3jRDdyG3x
	JczjGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daf3890n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 17:27:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so62389785a.0
        for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 10:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440426; x=1751045226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHVZwsBe2mPFE2r8rOIceTU1YN7PAHuBHgv7EehUdXs=;
        b=H9YLprplefIjPSCGa40DeHBrFFdtkbM90ZX8Ul+rf4oQj/hxmCJeRxwQMB0tnwn6RH
         8fh9Y/z5W7AAwhLgjfyh9hs7Dk93IKuGZcWIscMmia/j4Ql5l/I1AmVzqLKUGFuHxinM
         29MjnTRWcheNVlvTkA504C1glMhYyG4L0prnMd7eMm+ABPT4b+wg6pNyRWjt3oAkCZuI
         xD/p6DKfOTM3PQlcjOL1FCPCya/zKAkS52q202EzqqG/kafxzxpaPr0HeCYFh06zMfo8
         2vOxbtsRrdq7eI/BVyJFrgYJXx8iQEVuT6b6HKZskWuGypwUXroQiopl86PfKbM5maeb
         DApg==
X-Gm-Message-State: AOJu0YyJ9IkmK3Uo9g3bidNLzK0KutJ9uR2+W7cs/M3G6eLc0rKzYsrO
	5jhh5+Wo/EUS4aznIXVUISlsEcfqToR/PRZk55ZiGf1BrVNG12U1G23BbQ0dI+k8dyO9FbIY6a2
	ahm010EC3M0bNsGWZvGeSKFzmN3O3nP9yjnmqBZ//VsFaBbgMCdUMgq0V+JoLxitTUg==
X-Gm-Gg: ASbGncsFeO8iCCTLqmF9HyVlapnwRu/bxYBPIkeHPg9q4asmiNboNUp5rxlvwJvvZHP
	/s2tWH7l+HLYesGW04TZ67LFrE46x5mbeBUnhGdZFO6i340tYv63QNQq1EJOSnAgcVI86kh8Rs2
	muq+lL+eqIRTDKZuCIK5EkFczipbBVkqTlytJcA6b8Aal/ESbg7ppkEltGiudlRrr5nV0ooJH56
	va7nw4ZeT15Duu37ktDowSXQ7oAyCJMZNd9cj3Qr0l4U4aoCtf4uzWrppD/kT/Fe0ePK1BnCIK9
	RIKNh9c2KYUf5Fk6/XDZWVz64djGIXL+BheqKStnwp7tUXrGPKwJ34wKIV+7i2tTPT+hj7cRfbX
	hFOI=
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr201593985a.6.1750440426285;
        Fri, 20 Jun 2025 10:27:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoHeoLi6ocQ6ShmQtPpO5w/YjYEMIJLujZ0mwcIBnaXy139EfNwGSJUB+wxzBmDAUpuuwnGQ==
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr201591985a.6.1750440425818;
        Fri, 20 Jun 2025 10:27:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18c996aasm1664679a12.39.2025.06.20.10.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:27:04 -0700 (PDT)
Message-ID: <2bd17ab5-950c-4260-ae7c-9ba9a6441496@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 19:27:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: add non_pixel
 and resv_region properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
 <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
 <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+XsHGRA c=1 sm=1 tr=0 ts=685599eb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=qbq4ObjMTheV2eX5J3QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMyBTYWx0ZWRfX7x11xo8HipMG
 qKfTLCoi1KubfLqUOF0MmI1zYx1YC6efyviRHIXPg1VaPTfcn+Q5Zsm9bpK7Pa8SIJTODI1iQF+
 WwGzddf+i1h9nDBSw9LNcuH2OKSB8joFd2Vz86n97Wl+btaVRUYyRDKcpdtKXBwYhnoaPdL9lns
 qszsNgLhhabdq9c1zlXDOvIrqwuQ5vopbk40wjMekEdFHHeJ5N1CDDShZOTeJK424w/VG1S0EBU
 HYDlxRJ7Xdea3Zj4bp0+HidsmTBZzw25nQfulNNUEOxMDfHNKX8bXPMfInZwVSxHhg9zQ6PDC93
 JXbLaPc4TwPr+R6u/JVd8TIn1VEtoXYJ8HMuqhx7rHED8N7joTI0fQHHDHzosRvlEXTIsGKlhzh
 VubZguR95L69SLPVbAkCXArT8NuutecbRNddGhhgDnrEJPvfkSkasRMguvXlERyDpvUZP23E
X-Proofpoint-ORIG-GUID: ZCLhHMM_tk3HV4RHu3yqSfurb4G4l4os
X-Proofpoint-GUID: ZCLhHMM_tk3HV4RHu3yqSfurb4G4l4os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=904 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200123

On 6/20/25 8:39 AM, Krzysztof Kozlowski wrote:
> On 20/06/2025 08:20, Vikash Garodia wrote:
>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>> even within that range, some of the space is used by IO registers,
>> thereby limiting the available IOVA to even lesser. Video hardware is
>> designed to emit different stream-ID for pixel and non_pixel buffers,
>> thereby introduce a non_pixel sub node to handle non_pixel stream-ID.
>>
>> With this, both iris and non_pixel device can have IOVA range of 0-4GiB
>> individually. Certain video usecases like higher video concurrency needs
>> IOVA higher than 4GiB.
>>
>> Add the "resv_region" property, which defines reserved IOVA regions that
>> are *excluded* from addressable range. Video hardware generates
>> different stream IDs based on the range of IOVA addresses. Thereby IOVA
>> addresses for firmware and data buffers need to be non overlapping. For
>> ex. 0x0-0x25800000 address range is reserved for firmware stream-ID,
>> while non_pixel (bitstream ) stream-ID can be generated by hardware only
>> when bitstream buffers IOVA address is from 0x25800000-0xe0000000.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  .../bindings/media/qcom,sm8550-iris.yaml           | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index c79bf2101812d83b99704f38b7348a9f728dff44..a1e83bae3c36f3a4c58b212ef457905e38091b97 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -65,10 +65,45 @@ properties:
>>        - const: core
>>  
>>    iommus:
>> +    minItems: 1
> 
> As discussed in other patchset, this needs clear explanation, so
> imperfect patch won't be used in future discussions as argument to take
> more of such things.
> 
>>      maxItems: 2
>>  
>>    dma-coherent: true
>>  
>> +  resv_region:
> 
> DTS coding style. Anyway, regions go with memory-region bindings. Use that.

On a tangent, FWIW this is a discussion related to this patchset that
never got much attention:

https://lore.kernel.org/linux-devicetree/9439182e-3338-4d57-aa02-b621bc9498a3@oss.qualcomm.com/

Konrad

