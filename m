Return-Path: <linux-media+bounces-36543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C078AF13F3
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE120486CA8
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F12265CD4;
	Wed,  2 Jul 2025 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ojf4MJjI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB40246781;
	Wed,  2 Jul 2025 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455997; cv=none; b=pUmKh8Fcf1ih+rfL6fndr62SSccwL6CaPQhReLt9Cmge/feUae9bjUx2yAW/ZNw2Zfo8BfUHI4ljFpMin5OSeG3AvgPZg0AvK5fmL0F64ebC2puvDXJ9FXegwhVXP+8+VE/ilghd8HAStldoYKOjRs0xQF8Y/16nNMzpmNqd60c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455997; c=relaxed/simple;
	bh=wZy0evcmmM3RCZYZjBEoN0YpldElg3xqVsYlgFOrza8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SmpH58K7qQaRDzrNpSKfsGHpctGTIM+wVQVtlw2kuf3JC52rF+l+0qCEO1j3Rs4oAgTSNopEql1h2FHcY5Ns/h1WOyvSGs3h2vjNnJxFwoPu9Odf5h5owBuWRuF7GxfKXH0fJUreIGb79jqoRii5ePkAMnlkB9eDfFRDrFHNxB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ojf4MJjI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625PjKM024651;
	Wed, 2 Jul 2025 11:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TwXJCVc8lURQCSZEzO6IqQmFcyfhHGZB1644MJ+bs8=; b=ojf4MJjIWvvC8cwC
	zmG8dDDU98Mhc9uU57DxO8VpjiOeYLplxq94es3hDpsWFeSh7ltcMMWxZDuOjwAr
	08EXQ7ODPICFdSKM0lpwL6s6DHVIUEwhnkhg/dhGzjUGPLwrkZDrU5YSBq7XjonD
	Bj7uypaKaZS/LnXrH6hY2TvgQ5+o8tMp0zaEMVwqrNzwzHLt7Ptd0TKyW/WpyNPv
	x+X2pPW0G3WEVtfNG4l9VRctfsDui6Ypmu6hlOqOd6Z8rLjKxXieZrdhjNXYhMvy
	b9BtPsnbHEHyVwUptRLL/NdrDQW4j4Rpz3wsgG8v1alnFoHqVDi5qAoFJ2+2ruLD
	Qsro5w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9mfd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 11:33:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562BX8Pl001498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 11:33:08 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 04:33:04 -0700
Message-ID: <08c8cdfd-099e-7b90-b163-23ecee3a5da4@quicinc.com>
Date: Wed, 2 Jul 2025 17:02:50 +0530
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
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <19dd2e69-ad13-46f2-b99f-04a5e26f10d3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686518f5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8
 a=COk6AnOGAAAA:8 a=TnWEnolcAduC8S_e0_gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BDNTWFOn8hKfvmC4qIq2BRnXa_1IvfND
X-Proofpoint-GUID: BDNTWFOn8hKfvmC4qIq2BRnXa_1IvfND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5MyBTYWx0ZWRfXyfElA/YLB9HM
 wPAKVCjaAAEYHumSAQEIg+QqzX6KFsXprhncLzMhaJZDz+krFjCxuQ3sGutnXEOmM3NKBDGuqt+
 HM7TQCFU3o+zTewtBjf3u706kYfDqwOc+9yQmWg0PI4zWS2wY5l7dF/bAoZ2leIxjm+oElhQ9P/
 g3Jq7YIHneMfz1t1SIjetjU03X09uXwZq6UFOi/U+jN9dPaSqvmZLwkUgc8igzg+HlWZFalwF/x
 qoh7Zu0FXIqj2PYwcthS4Qwc5O/6juSz8mY32AliZWqG7TsFZiDESawIP9SyaNkltQZV8bEA42A
 iiax+EpZqdP/GAWbPUX92v4iXrpF64sxVRtcht31yBXfUbPocCIEW8igoPk7xiLzMyG/4heZAfn
 BOZTz4CnjNlZQqIltAARRT9r/nb3fpoHVFhI3yCkqmfZsVO1hWoLp/8qrlqw/z0Nw2FqBumR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020093


On 7/2/2025 4:43 PM, Krzysztof Kozlowski wrote:
> On 27/06/2025 17:48, Vikash Garodia wrote:
>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>> even within that range, some of the space is used by IO registers,
>> thereby limiting the available IOVA to even lesser. Video hardware is
>> designed to emit different stream-ID for pixel and non-pixel buffers,
>> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
>>
>> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
>> individually. Certain video usecases like higher video concurrency needs
>> IOVA higher than 4GiB.
>>
>> Add reference to the reserve-memory schema, which defines reserved IOVA
> 
> No. That schema is always selected. This makes no sense at all.
I could not get this, are you suggesting to drop this reference ?
> 
>> regions that are *excluded* from addressable range. Video hardware
>> generates different stream IDs based on the predefined range of IOVA
>> addresses. Thereby IOVA addresses for firmware and data buffers need to
>> be non overlapping. For ex. 0x0-0x25800000 address range is reserved for
>> firmware stream-ID, while non-pixel (bitstream) stream-ID can be
>> generated by hardware only when bitstream buffers IOVA address is from
>> 0x25800000-0xe0000000.
>> Non-pixel stream-ID can now be part of the new sub-node, hence iommus in
>> iris node can have either 1 entry for pixel stream-id or 2 entries for
>> pixel and non-pixel stream-ids.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++++++--
>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index c79bf2101812d83b99704f38b7348a9f728dff44..4dda2c9ca1293baa7aee3b9ee10aff38d280fe05 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -65,10 +65,31 @@ properties:
>>        - const: core
>>  
>>    iommus:
>> +    minItems: 1
>>      maxItems: 2
> 
> No, why hardware suddenly has different amount?
Its not about hardware started to have a new stream-ID. You can look for the
description in the commit which explains the need for a new device and hence the
split of stream-IDs in iris device OR non-pixel device.
> 
>>  
>>    dma-coherent: true
>>  
>> +  non-pixel:
> 
> Why EXISTING hardware grows?
Same here, the commit describes the limitation of existing design and also
explains the need for having the non-pixel device. Its not that the hardware is
growing here, rather the hardware stream-IDs are utilized differently to get
higher device addressable range.
> 
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    description:
>> +      Non pixel context bank is needed when video hardware have distinct iommus
>> +      for non pixel buffers. Non pixel buffers are mainly compressed and
>> +      internal buffers.
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +
>> +      memory-region:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - iommus
>> +      - memory-region
>> +
>>    operating-points-v2: true
>>  
>>    opp-table:
>> @@ -86,6 +107,7 @@ required:
>>  
>>  allOf:
>>    - $ref: qcom,venus-common.yaml#
>> +  - $ref: /schemas/reserved-memory/reserved-memory.yaml
> 
> This makes no sense. how is this device a reserved memory?
Again, explained the "excluded" portion from IOVA part in commit description.
For such excluded region, reserved memory would be needed. I have followed the
adsp example in the reserved-memory schema[1], its same for iris.

[1]
https://github.com/devicetree-org/dt-schema/blame/main/dtschema/schemas/reserved-memory/reserved-memory.yaml
> 
>>    - if:
>>        properties:
>>          compatible:
>> @@ -117,6 +139,16 @@ examples:
>>      #include <dt-bindings/power/qcom-rpmpd.h>
>>      #include <dt-bindings/power/qcom,rpmhpd.h>
>>  
>> +    reserved-memory {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
> 
> Why do you need this?
Was planning to drop this, as the reserved-memory region have it defined.
> 
>> +
>> +      iris_resv: reservation-iris {
> 
> Mixing MMIO and non-MMIO is not the way to go. This is also not relevant
> here. Don't embed other things into your binding example.
> 
> 
>> +        iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>,
>> +                          <&iris_non_pixel 0x0 0xe0000000 0x0 0x20000000>;
>> +      };
>> +    };
>> +
>>      video-codec@aa00000 {
>>          compatible = "qcom,sm8550-iris";
>>          reg = <0x0aa00000 0xf0000>;
>> @@ -144,12 +176,16 @@ examples:
>>          resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>          reset-names = "bus";
>>  
>> -        iommus = <&apps_smmu 0x1940 0x0000>,
>> -                 <&apps_smmu 0x1947 0x0000>;
>> +        iommus = <&apps_smmu 0x1947 0x0000>;
> 
> Why did the device or hardware change? Nothing explains in commit msg
> what is wrong with existing device and existing binding.
Same query here, the commit well explains the limitation with existing device
and how adding a new sub node mitigates the situation.

Regards,
Vikash
> 
>>          dma-coherent;
>>  
>>          operating-points-v2 = <&iris_opp_table>;
>>  
>> +        iris_non_pixel: non-pixel {
>> +            iommus = <&apps_smmu 0x1940 0x0000>;
>> +            memory-region = <&iris_resv>;
>> +        };
>> +
>>          iris_opp_table: opp-table {
>>              compatible = "operating-points-v2";
>>  
>>
> 
> 
> Best regards,
> Krzysztof

