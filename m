Return-Path: <linux-media+bounces-41250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD99B39F59
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 15:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7D723A64AF
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3948C21E0AF;
	Thu, 28 Aug 2025 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YT3IM3+f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAEF3A1D2;
	Thu, 28 Aug 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756388973; cv=none; b=SMf+GrQklt61LmFu4PTJ0OCa6jdZqqoSLHM5TTJqtQlPwBqo/MXPYywNQae5rKUK7IddEsdhBFPdiGQdzDq+mK+dPaYEqfB82A8l6PQPRcPy7/ruCy59oMkpsCQmMDt6+5o/ZahKeyP3cdhGn7N3Gy7SdWalGhGFHWhsXfFVfPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756388973; c=relaxed/simple;
	bh=ts3lX4sVajkpWMjKZR+jz9N6FmaajEQQONmx4tUzQbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VM5xZXYkKH6CtfUmJLOgYC+CZrKwvv4D8712XK0oggK7lF/GFlkv4aGA77u3A3ABWin7Z+TotY6zwJclJLuTmgPVbXrMS/UnbqFH8tmtW82f15x5tgij4zU4p3/+R6PEQ75EjSvxF/6si0FuKYbEvZWbqbPC1Al4OYFSRrF16UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YT3IM3+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S60nUu008186;
	Thu, 28 Aug 2025 13:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScOdmCeZxWFAml3E7y2GsOfgjlvOHFEckFHlTVSaPjU=; b=YT3IM3+fnaAhtCjS
	z55y5rsTKa49PrOwsQ24niBtkqkNLEcjCyEyqhk+2W5jjNrIC8sH2SkS3RMipaQY
	VUhjO5uPaQZy/eC1fV/99C75XNmCyGUMC/lyIFvt6twnB9Fzm2OFu7BaihsfhWdX
	CqKJL0ag+xhQQhrcMwokde8eIsnNo3KR0fUxfjs60K2RVeizAtrjgX95Hjsc3q2G
	PAiqVpghC1kMEYsaVlASlLMZ+nyLR0DWgALePyooZQ5HFZUWZqFmZqEZvVk+KbiO
	m4I4PagqvyhpFATTWd2eBrsfFZkQCI9Ww00BmS7G3VLPnTIzbgbKYOIu+++XrmUY
	10aNIg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8apnn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 13:49:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SDnP5f008699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 13:49:25 GMT
Received: from [10.216.32.160] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 28 Aug
 2025 06:49:21 -0700
Message-ID: <05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com>
Date: Thu, 28 Aug 2025 19:19:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mukesh Ojha
	<mukesh.ojha@oss.qualcomm.com>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
 <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
 <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68b05e66 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=A2wnt1OYZSGF17uXe9IA:9 a=QEXdDO2ut3YA:10 a=nI803oanCcYA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX0URI7wxdL1O2
 2JUx40tLVtIRBN8pbq5x/nBHzOU8DGCqFb4qNvi90Qso6z+y6Fw5nKM5XgO+ZjMaHACf50JIUwh
 3cATaJo0FAY9GycFqHI8qkQL5BB6t9QtuWzTSxx8IOBzlRIY/o0SS21HEz7nUVbrEI+HvI1i9Wj
 4WD4xjDKFm0mFPLQ73fRgu9Tpdc7lYYTAotbwqP4VtpTdL9ldWR1bdX543uqodJ432oCZZ6g+C8
 UlsyGoKDhkcqBQM9wYlEXYDZwoZtivEhUIhjbBLGya7iZWMSeui1Crug1Uuxpxh+9oX3dEb9evf
 yLNH5eTZxTXJH7+CUZwkrWJ629XmB20QRnWk7Yx2cH2idX7+SmHTBSR6hmOxbujlkn84wLGTrV0
 Dc8KgSjr
X-Proofpoint-GUID: M_iC15BxkkHxME8G0OIOxWBxYV_AP3K6
X-Proofpoint-ORIG-GUID: M_iC15BxkkHxME8G0OIOxWBxYV_AP3K6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153


On 8/25/2025 5:32 PM, Krzysztof Kozlowski wrote:
> On 25/08/2025 13:37, Mukesh Ojha wrote:
>> On Sat, Aug 23, 2025 at 05:53:50PM +0200, Krzysztof Kozlowski wrote:
>>> The Qualcomm SoC Iris video codec is an evolution of previous Venus and
>>> it comes with its own Iris Linux drivers.  These new drivers were
>>> accepted under condition they actually improve state of afairs, instead
>>> of duplicating old, legacy solutions.
>>>
>>> Unfortunately binding still references common parts of Venus without
>>> actual need and benefit.  For example Iris does not use fake
>>> "video-firmware" device node (fake because there is no actual device
>>> underlying it and it was added only to work around some Linux issues
>>> with IOMMU mappings).
>>>
>>> Stop referencing venus-common schema in the new Qualcomm Iris bindings
>>> and move all necessary properties, except unused "video-firmware" (no
>>> driver usage, no DTS).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
>>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>> index c79bf2101812..320227f437a1 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>> @@ -26,6 +26,9 @@ properties:
>>>            - qcom,sm8550-iris
>>>            - qcom,sm8650-iris
>>>  
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>>    power-domains:
>>>      maxItems: 4
>>>  
>>> @@ -45,6 +48,12 @@ properties:
>>>        - const: core
>>>        - const: vcodec0_core
>>>  
>>> +  firmware-name:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>>    interconnects:
>>>      maxItems: 2
>>>  
>>> @@ -69,6 +78,9 @@ properties:
>>>  
>>>    dma-coherent: true
>>>  
>>> +  memory-region:
>>> +    maxItems: 1
>>> +
>>>    operating-points-v2: true
>>>  
>>>    opp-table:
>>> @@ -85,7 +97,6 @@ required:
>>>    - dma-coherent
>>>  
>>>  allOf:
>>> -  - $ref: qcom,venus-common.yaml#
>>>    - if:
>>
>> Saw your reply on 
>> https://lore.kernel.org/lkml/59951c47-1015-4598-a885-25f8f1a27c64@kernel.org/
>>
>> Just trying to understand ABI here, how all of a sudden we remove a binding
>> for a hardware just because it did not get noticed until yet that as it is
>> not a real device and we always say device tree binding should not depend on
>> drivers but the device but we are saying Iris does not use fake "video-firmware"
>> device node for removal. I am a bit confused.
> 
> About what? What is unclear in standard DT ABI rules?
> 
>>
>> Whether removing will not break any ABI as initial binding enables the IRIS
>> related code to use video-firmware, now we are removing it.
>> I believe, removing binding always break ABI ? or is it depend on driver
>> code not using it ?
> 
> There is no single user of this, out of tree (I briefly checked) and
> in-tree, so there is no ABI impact. I am changing the documentation of
> the ABI, but there is no actual ABI break because impact is 0.
> 

My understanding here is that the interface "video-firmware" is already defined
in the binding. There could be possible out-of-tree users of it, might not be
possible for us to look into all of those out=of-tree users.
I support such cleanups, but also need to understand how this is not an ABI
break, just that there are no in-tree DTS user means no ABI break ?
Would appreciate if you could point to any guidelines if my understanding is not
correct, i am currently referring to [1]

[1]https://docs.kernel.org/devicetree/bindings/ABI.html

Regards,
Vikash

> I am really sorry but it seems you ask about basics of DT, so please
> first get into docs and other existing discussions.
> 
> Best regards,
> Krzysztof

