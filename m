Return-Path: <linux-media+bounces-36613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A527AF5EDF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 18:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DF9C4A7111
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 16:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7479A2F5087;
	Wed,  2 Jul 2025 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AfQnmP46"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2222FF49F;
	Wed,  2 Jul 2025 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474214; cv=none; b=FOMsv8UQ1LyvF42Gb47WTkV2mZix3GztGqmrde6qWAnfhplmm/yhG+GpodaRdQHWwaEVT7sDG1Q52HPy2RXrxoS7VoZf4VEvzd4o4Iv36ruvH5xvkeR+DthkA4cc2Uydaxvh6WdvmWhdDDimOA/zT7FhG/0zJv4Eayek3uPBNHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474214; c=relaxed/simple;
	bh=jK6F28fMUJndVeavUBEiSQSCcmbleSbOimj3TE++GBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BZT9Ma3gBmbfIG2fmlKQMYt5d3HI+OlBxYi6E92OJlO5LftK0cGBq9eaNd+9aPjUW/oT+OJel+3BxrYNv7l2+qMBJp/GQtR/sfL0dFpYagrtWWAoEcbiPzSrU2XmPCQvLa22KIqaYyISwpyMIAwoQzs+wWV+OZdPTSZX1r7Efzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AfQnmP46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562AlTUn020476;
	Wed, 2 Jul 2025 16:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNhKWoiWQ/m2i8SMB2stHf9AmyJI1uxJF2UdfKqD+js=; b=AfQnmP46DFYPy7K/
	MUh1BMuH1CH5+J/r60jc+A6aC8ucwYaH1ucwykC5jjQpNe6dnlrftiECCklZZvUr
	0zsLsn//hBXZvtUCzqxd+7O3dtJxD/3u7hLItExG+Q3NjWOyojTiNF5qAhufvJ24
	jywmOTObSJmXc1VL8R8naXuhjXzFz3ZGuFPap0xP0uRNrOQyp8P/B2WakmneTy8B
	4JPMQ7f36S87MNrz1flYYWMNG0wdRMOTvQAcjHr4rWQxXDJ3RyXRPpAeaZpSg7BH
	RNkdwRXpWb8UTuxM5YXmyofbXqUNf7YPQfZPipkHuQ8vCZhamWPoNnrzqi+Cmsm+
	eTk5GQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn40nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 16:36:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562GaX79017653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 16:36:33 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 09:36:30 -0700
Message-ID: <7aa47821-ed22-2602-f56d-a6d58195e75f@quicinc.com>
Date: Wed, 2 Jul 2025 22:06:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <19dd2e69-ad13-46f2-b99f-04a5e26f10d3@kernel.org>
 <08c8cdfd-099e-7b90-b163-23ecee3a5da4@quicinc.com>
 <118f2cbe-d8bd-4177-b0d5-91d9f1dbbef0@kernel.org>
 <9f5be122-302d-402f-91f2-675507612d32@oss.qualcomm.com>
 <023038d4-2258-4b2d-a3f9-b817ef0173bc@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <023038d4-2258-4b2d-a3f9-b817ef0173bc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEzNiBTYWx0ZWRfX2VlnT31Xl62X
 BtPnqIUeYFGusQ/lq/+aoAIV12Uuc210vOBLU75U2qKRl3w0N4G5xvgd7ABnbMrX5BB+dVSPvOA
 60RI5mi6J2jVxF2RDKMCvUMLpjttIOixZ1+fV1p80hpFsXi+rk7f+Cq6c6SH3Vdh3NdWtOWeC3x
 hD45U2M+JN7t7ZxkAsNSsRLMChd5pbgIDAdS4jLaXZHe0xgZl0LeR/x+vZfxUqBvWwxzlv6KWbY
 klus5SubbMuOxjndKNbEJCJ5qxkOp1gQ9+uJyBTkLJ9ETsz2/Q/3rbWbktIJmrJ2Sp082qQRe+C
 IWd5V+LoKwB6nzEIf7+PjTqbFL04Wck6jwjl1aOz5YkeCsYZt2S/sttRiCxbxTj7VwiJnZ6mx/4
 n/HAe2SaNWHZPKF+3nepPT97v2vPhq64pbN/LZSnWgTRR3RcgliKiowl7v7ZCWYm5VS6zg8k
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68656013 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8
 a=HNBVKBRzm7chqmqNzysA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: yPwUljbLtaJamIjb4y5GHOiJ1tQBaUfh
X-Proofpoint-GUID: yPwUljbLtaJamIjb4y5GHOiJ1tQBaUfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=938 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020136


On 7/2/2025 7:29 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 15:11, Konrad Dybcio wrote:
>> On 7/2/25 1:46 PM, Krzysztof Kozlowski wrote:
>>> On 02/07/2025 13:32, Vikash Garodia wrote:
>>>>
>>>> On 7/2/2025 4:43 PM, Krzysztof Kozlowski wrote:
>>>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>>>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>>>>>> even within that range, some of the space is used by IO registers,
>>>>>> thereby limiting the available IOVA to even lesser. Video hardware is
>>>>>> designed to emit different stream-ID for pixel and non-pixel buffers,
>>>>>> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
>>>>>>
>>>>>> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
>>>>>> individually. Certain video usecases like higher video concurrency needs
>>>>>> IOVA higher than 4GiB.
>>>>>>
>>>>>> Add reference to the reserve-memory schema, which defines reserved IOVA
>>
>> [...]
>>
>>>>>>    dma-coherent: true
>>>>>>  
>>>>>> +  non-pixel:
>>>>>
>>>>> Why EXISTING hardware grows?
>>>> Same here, the commit describes the limitation of existing design and also
>>>> explains the need for having the non-pixel device. Its not that the hardware is
>>>> growing here, rather the hardware stream-IDs are utilized differently to get
>>>> higher device addressable range.
>>>
>>> You are not doing this for a new device. There is no new device here at
>>> all. Nowhere here is a new device.
>>>
>>> Changes for a new device COME TOGETHER with the new device.
>>>
>>> What you are doing here is changing existing hardware without any
>>> explanation why.
>>
>> This is bindings getting a reality check.. this goes as far back as Venus
>> existed (msm8974/2012)
> 
> This won't fly. This is a new binding after long reviews and
> discussions, why Qualcomm does not want to extend existing Venus but
> needs completely new Iris. Well, if you get completely new Iris, you
> cannot use argument of "legacy". We insisted on growing existing
> solution, but choice of abandoning it and coming with a new one means
> you were supposed to do it right since there is no legacy.
> 
>>
>> We unfortunately have to expect a number of similar updates for all
>> multimedia peripherals (GPU/Camera/Display etc.), as certain mappings
>> must be done through certain SIDs (which are deemed 'secure') and some
>> hardware has general addressing limitations that may have been causing
>> silent issues all along
>>
> Isn't all this commit msg here about non-pixel stuff just not really
> describing the real problem at all? This commit msg is very vague and
> silent on actual use cases and actual firmware, so even multiple
> readings of commit msg did not help me. Stephan Gerhold now nicely
> summarized what was never told in commit msg - there is a gap in address
> space which is reserved for firmware and no allocations can be done from
> that?
Yes precisely that. Thanks to Stephan for clarifying.

An existing example which is defined in reserve-memory schema here
https://github.com/devicetree-org/dt-schema/blame/main/dtschema/schemas/reserved-memory/reserved-memory.yaml#L149

> 
> Also commit msg says "Existing definition limits the IOVA to an
> addressable range of 4GiB, and" but I do not see such definition in the
> binding at all. So what does it refer to?
Processors based out of 32 bit OS, can serve addresses in range 0-31, which
implies 4GiB (2pow31).
> 
> 
> 
> Best regards,
> Krzysztof

