Return-Path: <linux-media+bounces-36135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCEEAEBE48
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 19:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C8C8563404
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34452EA757;
	Fri, 27 Jun 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dXTiUyQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A723EEC0;
	Fri, 27 Jun 2025 17:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044581; cv=none; b=Dw/aej9/i36D/TP7bN/WlLt/lkeQa7VM/m2hps63zwSW6FCtl//Vld7VkWCKhsxul7mzfY12C+CTJfk4FE3RJ39UY9WtJIE8BliBOKLFDNYAQhp19SpPx1ajfken8VI55tZTTZf+nHI+xO00Qw50Kl3+tN2tCduzm0X2axFDTFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044581; c=relaxed/simple;
	bh=v6JluZYp6VrxvTUa9qzzZiYMsC1h8CrowPu2zgkGDeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uNmGffhpjMcZJZnH/vbLFsrB4iKttmet/P4w+AuLOR++B94ljzf11d1nMcZZ1YxMKNwIUpDMyWXI4XgXLGdBORFqfuBCQ9xzXQHqWoAmVhRRcgXw6txkoDF2sqggGh6Ptj8QxJM011A5smBW3BBliBrS8mhyyQwjjTzJWYUdMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dXTiUyQ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBdliC000970;
	Fri, 27 Jun 2025 17:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZFIra0UXLLaPOj2dq0ls6Rbfnvbp1TpqI67B6fogKc=; b=dXTiUyQ3PEG69Yo2
	hm8BLBCN3tdF1dT2IAbZFRo+4hlQFwfA6vWPoopJ1MmEIuNlLoFEBgKJKO5L/DaU
	d3X2Ikul2cCuIYDIh776aJjFAWVh0A/oDmDqpek8/J7yLuXTWexwXO/KogcbxGbo
	OIeRP+pEArtbpQOkHhg5JFmaUcyhziObchSHOs384CL4KH/iZAn/Cjo5TDEwjUSk
	akMlU5VN6fA6ng7AK9T/0LGXaRDLQxWl5VKsS7UvjI5T6EL9G03GQsh4ISDzcSM4
	EcPDYBjaFi4P9U9q9Rgp4nGjmmIB8i/497Xo4n1+DmQfyiY2X1acACY6cpxuIGbC
	EWW3NQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdhk6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 17:16:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RHGA4m017382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 17:16:10 GMT
Received: from [10.50.11.187] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 10:16:06 -0700
Message-ID: <e80d04cf-d125-1b56-de93-dea93cac4cfb@quicinc.com>
Date: Fri, 27 Jun 2025 22:46:04 +0530
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <5dcc3dc3-ba12-4d66-88e9-5e06bb707135@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <5dcc3dc3-ba12-4d66-88e9-5e06bb707135@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685ed1da cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=zg6EfX5OJRNpQRXqwCgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzOSBTYWx0ZWRfX3/wGtU3mTEJC
 rXfagC2U/yYKBosAiTLFgzROO9O6UKKCL3xd0VQpauYTKIM+f27pAwZKp5MfWkpD+vP5T3slseI
 ZFfo9ZVJgqKbY1HgAyVX35BB/Wy922LOLMMe87gjLpwWl3Nilt3hBV7sLYzOeED/C3XRNxJFvu9
 OOBaXX5nkYT3adfVYpq+MQxN9qd7Lf8OawVH2iBTTrPgWuAJdRXO4gEx8+FZpYWPc2hXjIGJL8o
 FqySTAOrXOeeLu3xkmv3P55jUINOCQn2JM+DEDL0froCckxE9fBG53T4Rtzo+S51Yo236OEiS4S
 w+PVlCTzshcfmXmqjPuzoYsnaY1SV5A2Iamu7ca9cGcFan07vSPwAPTZDJTpeyecmoXSu+5JdKJ
 HVBsDl0Q2APLxBLtRjGti4U9wyEDB0pdQit5iT6csfb/VF3YkQ05vRMy3v/JYhsesDF9Ahyi
X-Proofpoint-GUID: qUlLS1drIa4EuFNCyrfy7MVdHHnOKa6J
X-Proofpoint-ORIG-GUID: qUlLS1drIa4EuFNCyrfy7MVdHHnOKa6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270139



On 6/27/2025 10:01 PM, Bryan O'Donoghue wrote:
> On 27/06/2025 16:48, Vikash Garodia wrote:
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
>>   .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++++++--
>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index
>> c79bf2101812d83b99704f38b7348a9f728dff44..4dda2c9ca1293baa7aee3b9ee10aff38d280fe05 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -65,10 +65,31 @@ properties:
>>         - const: core
>>       iommus:
>> +    minItems: 1
>>       maxItems: 2
>>       dma-coherent: true
>>   +  non-pixel:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    description:
>> +      Non pixel context bank is needed when video hardware have distinct iommus
>> +      for non pixel buffers. Non pixel buffers are mainly compressed and
>> +      internal buffers.
> 
> You do a better job in the cover letter of describing what this is, why its
> needed etc.
> 
> Not asking for this verbatim but its clearer:
> 
> "All non pixel buffers, i.e bitstream, HFI queues
> and internal buffers related to bitstream processing, would be managed
> by this non_pixel device."
> 
> Where does the term "non-pixel" come from if its a meaningful name wrt to the
> firmware then non-pixel is fine but, consider a name such as "out-of-band" or "oob"
It is in-sync with firmware and we would be seeing it more when we extend it for
secure usecases.

Regards,
Vikash
> out-of-band is a common term as is "sideband" but sideband I think has a
> different meaning, really this non-data/non-pixel data stuff is out-of-band.
> 
> At least for the way the language pack I have installed in my brain right now,
> "oob" or "out-of-band" is a more intuitive name. Its really up to you though the
> main point would be to enumerate the description here with some of the detail
> you've put into the cover letter.
> 
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +
>> +      memory-region:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - iommus
>> +      - memory-region
>> +
>>     operating-points-v2: true
> 
>>     opp-table:
>> @@ -86,6 +107,7 @@ required:
>>     allOf:
>>     - $ref: qcom,venus-common.yaml#
>> +  - $ref: /schemas/reserved-memory/reserved-memory.yaml
>>     - if:
>>         properties:
>>           compatible:
>> @@ -117,6 +139,16 @@ examples:
>>       #include <dt-bindings/power/qcom-rpmpd.h>
>>       #include <dt-bindings/power/qcom,rpmhpd.h>
>>   +    reserved-memory {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      iris_resv: reservation-iris {
>> +        iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>,
>> +                          <&iris_non_pixel 0x0 0xe0000000 0x0 0x20000000>;
>> +      };
>> +    };
> 
> iris_oob would be less text in the end.
> 
>> +
>>       video-codec@aa00000 {
>>           compatible = "qcom,sm8550-iris";
>>           reg = <0x0aa00000 0xf0000>;
>> @@ -144,12 +176,16 @@ examples:
>>           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>           reset-names = "bus";
>>   -        iommus = <&apps_smmu 0x1940 0x0000>,
>> -                 <&apps_smmu 0x1947 0x0000>;
>> +        iommus = <&apps_smmu 0x1947 0x0000>;
>>           dma-coherent;
>>             operating-points-v2 = <&iris_opp_table>;
>>   +        iris_non_pixel: non-pixel {
>> +            iommus = <&apps_smmu 0x1940 0x0000>;
>> +            memory-region = <&iris_resv>;
>> +        };
>> +
>>           iris_opp_table: opp-table {
>>               compatible = "operating-points-v2";
>>  
> 
> So I was trying to think of a way to catch you out with an ABI break but, I
> don't see how you add minItems: 1 to the iommus declaration above so dts prior
> to this change should still be valid.
> 
> I think this adds up but, consider oob instead of non-pixel.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

