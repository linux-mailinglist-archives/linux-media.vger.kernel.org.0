Return-Path: <linux-media+bounces-23526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A679F4167
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 04:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CA9B188A078
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 03:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A67145B2E;
	Tue, 17 Dec 2024 03:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cjxth1a8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50861459FD;
	Tue, 17 Dec 2024 03:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734407871; cv=none; b=icWMK0RXKiPHwD/SSEepPUBhILIbKb/dcLfuKE9G28oOTBmdyVKaiwpn/YqtgiRWZYndIYqqhr4VrV668YIzOm9r4+7SWf15UCPCAGDTEnrSLdqu9uGnAGA/g+OKHs1VYEvy/zPu/KHPkGHpOX6cbiIhQUgKDIERXT2ND+5I8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734407871; c=relaxed/simple;
	bh=kfS5d+YjRa+GpXwxvHuyz5VdYtDL6nCSWTPY+ZsU1Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DxvjuGKTeej05VLZXcEXisWK4xcKwdiQ7M/QXhzOJnv54a4w9Irck/vHNev5eE2SBdCUJZ+H9xTqbpF0YDv3X16RjSLVOE3TXacMUhjj0eS5h1z00umxNYNkgvdj/nKkrTTFRNuF4NXV6V4pcEZAB0SIxPOd7XK9O5TFGr0MZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cjxth1a8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIx7kd010841;
	Tue, 17 Dec 2024 03:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23N5wbmg89kmLl5F+mm3ElpkBd5Fu2Q4ftAfKKMgiNs=; b=Cjxth1a8ByIp7DGL
	0UmMlBVBU5XKSkzFErstphwcmoHcpRYNGGx5Ro9sJX5aFgnGsOefnFWMpm1tIX95
	pdomW3iqm4zluQXOgeK8rSOP64oIi+MpRa3mWg0pyyo33lbC6mNgCLFX6X+zlv+s
	Iplzw90x2i7BYCoDeCvKjf3qN5wU504wfFO+LqDZ5aIIANwQMfs1stRm9B27vSTT
	Un/1AH0dDiETe2h7tYQA4xAQ/zEb1LUJ58Qvc9hQklIm6KpJW39zLnvmd29Jdben
	dgG9s5NMxdDyYFFMGzjmqZghd0OZ8KDwXeNW4vNj+3cDYGusFRQnh4zymdgkAva2
	/5oRWw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsy71196-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:57:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH3vXLh007858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:57:33 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 19:57:29 -0800
Message-ID: <488e3bfa-c66f-4523-a74f-e39ad67f5145@quicinc.com>
Date: Tue, 17 Dec 2024 11:57:26 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: add support for video hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
 <20241213-add-venus-for-qcs615-v4-1-7e2c9a72d309@quicinc.com>
 <avsiopdobpukz4ngqfakvghvswwrwopr4cn764mnuc76q4m3wh@axpup5fypxsu>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <avsiopdobpukz4ngqfakvghvswwrwopr4cn764mnuc76q4m3wh@axpup5fypxsu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E6OSO1LYFE-_bbczgUMlsqubMCkW8sa3
X-Proofpoint-GUID: E6OSO1LYFE-_bbczgUMlsqubMCkW8sa3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170030


On 12/16/2024 3:52 PM, Krzysztof Kozlowski wrote:
> On Fri, Dec 13, 2024 at 03:26:46PM +0530, Renjiang Han wrote:
>> Add qcom,qcs615-venus compatible into qcom,sc7180-venus.yaml for the
>> video, and let qcom,qcs615-venus fallback to qcom,sc7180-venus on
>> QCS615 platform.
>>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> index 5cec1d077cda77817f6d876109defcb0abbfeb2c..6dee45b7366578e51319b575e5dd2587dc84baeb 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> @@ -18,7 +18,13 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sc7180-venus
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs615-venus
>> +          - const: qcom,sc7180-venus
>> +
> Drop blank line.
OK, thanks for pointing it out.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>
-- 
Best Regards,
Renjiang


