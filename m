Return-Path: <linux-media+bounces-35804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90814AE6C28
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105C21891EE5
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D782E1749;
	Tue, 24 Jun 2025 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hia1HWjF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4C2770E2;
	Tue, 24 Jun 2025 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781516; cv=none; b=pWMjvRYIYXA4IJjHuvTwN4jiruzu4q5uZ6ijMqyvJu8WIsUy5/f/q7hLZ872Xf9xsOE2Ek3g8qbx0vdaB8qyZh5tQqJl2DZgIafhQ6w9gz/mm6G6eFyixdYYUn+Do9F+9IaWCucjOxYA1oXg81X1Dd9FhDLquyLgSOjX5OqqqaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781516; c=relaxed/simple;
	bh=fVkmw8Fs3qcBPYOvpF6h1H2AvM0Q5BNDPPY4D3k+am4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SeSeNvrcH0i/FFg2aBtR9QxeG/8i/I+ezniDqJCIeGuxUzwFBvE0SlQKUQI5X1uMyVB82UpFwxP4DbuThZn16ob+CbTlXW83Z7A4Njkf1PyovtfbvXlgYmuqAC9iMxJMz6LQUr2gwP1jok7G08h/75z/W1ynm+R4sbOVCywzi90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hia1HWjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8htC3014586;
	Tue, 24 Jun 2025 16:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq5tdfdXQ92ZNGX1ZGeJkfBuXvFYi/00rz1OwotkW6M=; b=Hia1HWjFOQUwf2tK
	NhpmwCLQSL76SBKVZlFSKedYVvJFkJ4OYnc+jTGIq5r5z1Bz3xAae5FJerhO/atR
	3H6mvi+8/UamZyXv7VJTM7Fjhu67hzWuqdt8YW3zUCv1eAgYJ0k7O6Ttjz+GRkBL
	ig9VU+GYAJDzynQQdRSB3JhJxfNdHz/0fO4hPxiwQztYphe35RntLMb1B1z+7L+V
	7ZtOeox26TPAcz/GmF8KeuP9c0T6RNlvweENbpqMkh2dbQeSgRksygx/jFqyE748
	QINI6szZoTQTISbkYoTOW0jW1gdQ7aoxHdMS16q1Mz3GQibVLGNFt0fTF5anTt3V
	MkQhow==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpw0mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 16:11:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55OGBfKb026366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 16:11:41 GMT
Received: from [10.50.56.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Jun
 2025 09:11:38 -0700
Message-ID: <85137a8e-45be-3bb2-d094-79754fa2a8be@quicinc.com>
Date: Tue, 24 Jun 2025 21:41:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: add non_pixel
 and resv_region properties
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
 <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
 <x7xskkv6nviz3j7sr5qgs7yt7z6txqwdemfammufwdf6ji3sla@gi2a4aadt6wc>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <x7xskkv6nviz3j7sr5qgs7yt7z6txqwdemfammufwdf6ji3sla@gi2a4aadt6wc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685ace3e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=jL3G2h9b1PvCzNpYu-UA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzNSBTYWx0ZWRfXw2Q6T2Cq/zSi
 xzNFh7wP9iitFjtnknc1VvzavBGZaRi+va7DbOOOTgo5oRTVpxLYfFmAcMH3jC3CDgI3/sQnISY
 5pAc66xzI3oH4M06qYsm0DsYuT79zUHB7b2vuyraiu7ihA34WCKtrsaZciBl4/vEeCe/M6JFRlh
 TpkSV9tkkXGGugcBphurYQTIpfscHQcVlvZZ/EKhhvIgTAON0pT6+x8x69JSlVbgZWHS6Lfy6JX
 ZZaKMiQvlX51jRAjSwKgCpU4cXTH3jleDL1N0/9EtBhKeNnzmUTotAegooEvIquBdhgdWJlZuJL
 BqkS6bn/eiW92V99UrSUk7QOqm640xyaC4oNsaeAsyVMPzWm8tkslnxHEUgN8A8tOx8GhIrw7Yr
 MUlHBObaU2TfCi6xRLR5gqfMmroEDCJzkrvtUAAHBr0xxCC6XNkVrtaxugq95F1Wjrm48kD6
X-Proofpoint-ORIG-GUID: dr1aNnrTRTsCdJ-ir-BW0e_zAtusX9U5
X-Proofpoint-GUID: dr1aNnrTRTsCdJ-ir-BW0e_zAtusX9U5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=823 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240135


On 6/21/2025 3:09 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 20, 2025 at 11:50:51AM +0530, Vikash Garodia wrote:
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
>>      maxItems: 2
>>  
>>    dma-coherent: true
>>  
>> +  resv_region:
> 
> Ugh. Underscores...
ACK
> 
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    description:
>> +      Reserve region specifies regions which should be excluded from IOVA.
>> +
>> +    properties:
>> +      iommu-addresses:
> 
> Missing type / ref. Also they are only described for reserved memory
> regions.
yes, looks like we can drop them from iris schema and rather reference it from
reserved-memory schema. Awaiting comments on the ongoing discussion here [1]

[1] https://lore.kernel.org/all/4c6233d9-be7b-baf3-fb05-3ea007e35330@quicinc.com/
> 
>> +        minItems: 1
>> +        maxItems: 4
>> +
>> +    required:
>> +      - iommu-addresses
>> +
>> +  non_pixel:
>> +    type: object
>> +    additionalProperties: false
> 
> 
> I still think that these usecases should be described with iommu-maps
> rather than subnodes. You have a limited set of usecases: "non-pixel",
> secure buffers, etc. Define an ID for each of those and then allocate a
> subdevice internally, mapping it to a corresponding set of IOMMUs.
In secure buffers category, there would be 3 categories -
pixel/non-pixel/internal. Adding it up with non secure, we would be having 4 sub
nodes eventually.
Reading about the usage of iommu-maps, I see there are below limitations. If you
could suggest a way to handle these,
1. let say there are 4 stream-ids, iommu-maps does not provide a way to tell
which stream-id is for which sub hardware block(device) within video, so that
driver can use it for mapping the corresponding buffers.
2. defining the masks for different stream-ids.
3. IOVA address regions - Different stream-ids have non-mappable range, which i
am specifying via iommu-addresses in sub nodes.

Again, iommu-maps was invented for PCIe case where different stream-id can be
routed to different iommus. In this case, all stream-id would be managed by same
iommu.

Regards,
Vikash
> 
>> +
>> +    description:
>> +      Non pixel context bank is needed when video hardware have distinct iommus
>> +      for non pixel buffers.
> 
> What does non-pixel mean? Compressed data?
> 
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
>>
>> -- 
>> 2.34.1
>>
> 

