Return-Path: <linux-media+bounces-35598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C5EAE3BA4
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFAA01881CDD
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EC023D2A4;
	Mon, 23 Jun 2025 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YsG/17AX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065522DA08;
	Mon, 23 Jun 2025 10:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672900; cv=none; b=Chprc1uFdVNIDG6HAHFfr0kI5R71JGEM7JoxPMvZ/i7mgnfTGcuu64LVVdf4MsMrq8Q+fLaHWCzPvwG49f9/AHze3uP8BwoyhpsT7zhYG5MXwsyhhYD0EmS+zYMA9+B+PtA9tdnwsWxwiv0hS5eVjcUDTPmnlKBMccc/KjIOqCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672900; c=relaxed/simple;
	bh=SgNeia3H+0VcjQ6HinXX3VxhOS9V7XWHDlEraNdjHnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SbLUQNqZg/QVHQ0Wx7YKbJpnAPmwanBjcahJ/cMxx3zGNN5h3FhTQ50UulPIndR+nQ22gZr1t0ZTHrT59xyWKiO5atR2CjTgXbIuKu5jRkFdgUMUT2ZLf73N8/cANk69aXOG9E7LnWiqr4NpsHZKqNovxRRs+4LfOXqB+SBFHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YsG/17AX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9Lr7s031318;
	Mon, 23 Jun 2025 10:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZSulzGMrw1cW1ZyI/6VghDi+msnE3LArRKTWwk1to4A=; b=YsG/17AXAP9yNufH
	fVbSZCcGJBI17s+/dJsZ4tGUAkiVfvGBzawmksqLTOYrWzNKhBIsDSHUkyuewN7U
	RgW3ddfZ7H+0z3mjXgTAv1tyzmJglYp5cskIvTa0O3Aji1X2GlYQNrqmolqYmQM4
	2bRr0n7tyo0Fy6v5vl465AdCk8bK+kyybNQBzYUY3pADTX14rrfXDKiqtECKuqql
	1mkj8ilp9XfjVg03m4qe8RwbOr+pGBlhFqWRYjow4rdF7gtoR2h0AUjl7Tn/brVY
	KYsbwOe+Rja8EJyvnDoz+qsn4giLB5i7R2Mua7Nxa/4OoCaPttWj4LV6YHwFUKeY
	lDpj2Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7tfj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 10:01:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55NA1PKh003361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 10:01:25 GMT
Received: from [10.50.56.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Jun
 2025 03:01:22 -0700
Message-ID: <4c6233d9-be7b-baf3-fb05-3ea007e35330@quicinc.com>
Date: Mon, 23 Jun 2025 15:31:19 +0530
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
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
 <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
 <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oHVSi0oKkn_f3D6oS9hCl81Z7u1aY8bM
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=685925f6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8
 a=COk6AnOGAAAA:8 a=3XNgEy_mAsLfjLAtyEgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1OSBTYWx0ZWRfX0neDx93EnXn1
 Ayjq8I/W1wiNC8vQwg+rsiPMj+0ezYxpGEL7BS2VQ5N4EqgoO/a8yOe2hpV9BlkwOLAEMk9MWns
 lm+hcdPKYYcc096U6c0JZizSFMu+DhnjQH+Yu9egVSRdKiP3FHsYqFS6Vu8x2i6yotl86sdSRjj
 llc0BinWjyyQ31fl684m0jVOLGGP1ZkIZWpJltBouaMtKX1I4+HvaRwTN0lmCqgnVcwZ7MN9YXe
 93DU13uigaKnnH6bQfvBueRbtiuDmfDSesT2TI1VwSLOWhBF0zZgCEGALppvAlzPHHjj77SCFjw
 A9FJrsbKkoK3pxZW9U7G7d0XWEBjHfYqQnhF94JzVbI93MkfFco2/+/ZP0Yx4BfZXrIgHT4uxBX
 IzjVeN8TFqjbL+bw0zPGSoyafjYxe+ItUYmjMrIwpDuYVabYFT/36jZTBRGNOH2fxjjQuaym
X-Proofpoint-GUID: oHVSi0oKkn_f3D6oS9hCl81Z7u1aY8bM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230059


On 6/20/2025 12:09 PM, Krzysztof Kozlowski wrote:
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
ACK.
> 
>>      maxItems: 2
>>  
>>    dma-coherent: true
>>  
>> +  resv_region:
> 
> DTS coding style. Anyway, regions go with memory-region bindings. Use that.
Sorry for a basic query here - I was reading through memory-region bindings in
[1]. My requirement is exactly same as the schema defined in [2] ex. adsp_resv.
Would it be more appropriate to extend reserved-memory.yaml, something like
below in iris yaml
allOf:
  - $ref: reserved-memory.yaml

Or any other approach to reference to [2] in iris yaml ?

[1]https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/memory-region.yaml

[2]https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/reserved-memory.yaml

Regards,
Vikash
> 
> Best regards,
> Krzysztof

