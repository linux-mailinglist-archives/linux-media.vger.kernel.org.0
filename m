Return-Path: <linux-media+bounces-49339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59983CD5B4C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 12:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65384300EA25
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B92A314D1F;
	Mon, 22 Dec 2025 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjRHVZd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2rmSqUz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15D313E26
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401383; cv=none; b=ZtnHjh9J73JiUr0E+2IdSNlea3aUPltYrpL21vQ+fsU8jKt3NoD8BLdP6067NThCAVTPnwxM4XKzEG5zVSn9cV75TreViMNp7ip2xRwaFCfM5ZpC/RuImbc8uHO9ctWWrqAxdZO1GMcTDoz0pRfSeDRBCju2puxJl2SsVhgcROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401383; c=relaxed/simple;
	bh=V58aHeBvB4nTNxTrIGwrE3WLIbUB4XyGJoqOW2PqIao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOUSJtNyNuBF5yGVq5vOmfPo/31ZE2LGfDrb8UfZqtphFEgoUniC4TEspfYLbq1cawUaYLA43UOgO4BoY7x9rxuJTOIyMLiqdQORfkfsYp765ogJ4xqvr9hGBKVU4grZO0IJlMqe+qElC1iCgz1JJ5slPf9ESvs18Wc8HHBtyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjRHVZd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2rmSqUz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM6Zv1o4117894
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 11:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=; b=BjRHVZd/3nQ8hnOP
	NhIrhAjKw1Rchi4jS6RJYfv8P26N+OWl/TJesrk2oj4rP6MzGOMx347Xif+vDwgn
	dNZpcn7vpGEGGPSR9T58rFDm/1bYT1CnJ9M5u9CfJwGIBDZvhHrmztxrDZLBZu9m
	wQcwa0cWqlBZqC0kbCKxfyCiwSEYrj+UlZwpIAsCEl85fUz4ETuVSiyVuEQ4ZPsS
	Z1K0pdg1AffVMgjID1hIhv4NFTwDZsJxidqRPzgIFV6efH6bJEMopSFIglJWff50
	grzhbuL/q+3wOpKIn7cXKfMPGmXSaL29WJLKH7TfydIzU95CkEmqrCTHNQXdtwAA
	TC6rjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b70v28s5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 11:03:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so1052158185a.2
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 03:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766401380; x=1767006180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=;
        b=P2rmSqUzE0J6OnIPeBtU4HEl3kGo1txYNCRSogRUsHMDZhQDhnxFGvnBsX342tV266
         Tiv5Ogzz0H3t+aSzm7UfI5un+/YeV/GZvxJbjT7z32Vz1iUJZkUmucR3zExdoWrfjVvF
         IiVlwoe/Hd9OoGWgGfC23p1B8Idg+sP5TnWb8LLrCgylYVmS2YQdaWJvc1XK7Prnb/ag
         Og6VMjU0vHoD2r5uRlJcXhNhfWGGdVGPpNEzrmA5itdRzmBB3LHS15ZseQTzzddyYi6Z
         SIi7x68QGV+0aywZSFf3hQYiW42R7NgcE+sLz/+cLPqf8huftfKox2BDIyhytynKqpuC
         8Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401380; x=1767006180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aZ6s36kqSpgkeg3q72AMD6l8/vhyS1oDG7MzlNzu+U=;
        b=YOxe4H93pfJ5efhPVKHHqNax0s43TPA1q2owPHMTb0l8HS8td0L3yefGXXujOtpNcf
         TTl3eM+F2DG5pEc4m/Kj/LuDdEQojNoisvRQS7Gue77IORyUgz9VctgebD/5nZAEevww
         +kRJi9j1CK0xwoWAq98uQhukLFWA81Y+MEaM10sK3FqHfqH+AnGTBuk4nio3+mo/Ezly
         xbMUvEa7nLPeoNoAX4cBdNrKITRFIrzqWJ+r/aVJsBI5BrwlOGemhzNsBlj3XHtOnzVO
         EuQlXhedqkJbgSKdzXBiUU2W22gucOfRUgUImB/VDiy56QbFcaHK1xf9+S+OTRp+MZaZ
         CDZw==
X-Forwarded-Encrypted: i=1; AJvYcCVOraWvkhafdOpDvVMBg7XwmaaqDJ6qeJJ8em6G4srXTkBp3VbiY5SS0agujb8kCG33Wj9KNMsqLh1E1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwDiPQAi9ZE3BZESJMANYTqEta825OpflwD0Ad9+OoVSNphJAy
	aK7UFEERjyrUKbhcgm8R2SIuCs+UGNyXX4sHfsrS9Vn56olrepc1PGTJpFm+cO+mhhCw15ebmfb
	sZY/Gjq3QJrOHEe3+G25Nck39umRDXDJihTcqinn7UgzsaTIs5JKDU3aYwXx81B0sFg==
X-Gm-Gg: AY/fxX5+iSgCDLV5Cg7nMmYBKCym0WNPO45Zyr7sCCdp+AXKWPw+S5tn/7XCjJe9g84
	CkJxE48tYuIrlswiEk9dBRumUXnaq2deuwo5uiBpI5jaBGJ0REhHcmZwmW4j6UzZ3UBDptTV10N
	fg2c+lgT88TUM0TzMl/hvyAM9O89ShOBE67hZk4uSZMk1jwcNdU87zq9pceCHy7D/FmlYvv3rdf
	D7SsTF7jFCdW+19fkzG9K1eOjuMEnv/vyzfrgNWz0Hg1Ojlyq7/iZwiHJ+8Oi/177JsNthhjg82
	5BQZreHWTo9I1rdIAq2MilRX58yHh2lUobSVENb9Z9ljx1Mcn06CxztY2wBAufUGGQ1Uwv+9b7T
	Zq2uihRIUrQ4Rht0vJWkm+leXHZw6fnkonGxgXd2pHLFLbvIpI9+qaWcgjPxpUAQIP9+dBh2+
X-Received: by 2002:a05:620a:2697:b0:88f:c0e1:ec2 with SMTP id af79cd13be357-8c08fd32cebmr1637527285a.60.1766401379473;
        Mon, 22 Dec 2025 03:02:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFgc4/mbxP1v0Y6Y+66GXLM/In3vvQag3zr/Bzdv0DzMO4r//tvzBx5y45NhOvo3FD7nI95Q==
X-Received: by 2002:a05:620a:2697:b0:88f:c0e1:ec2 with SMTP id af79cd13be357-8c08fd32cebmr1637522485a.60.1766401378889;
        Mon, 22 Dec 2025 03:02:58 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ef6a7sm777484085a.55.2025.12.22.03.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:02:58 -0800 (PST)
Message-ID: <a371b7d4-4a6e-4d9c-b86d-14b4cfe7a6eb@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 19:02:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-1-4d260a31c00d@oss.qualcomm.com>
 <43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org>
 <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
 <b96c10a5-942d-446e-b67e-a566a7d09274@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <b96c10a5-942d-446e-b67e-a566a7d09274@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KQZ-KdbHQNKIHw4JsbXrVSigDs6nxrI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwMCBTYWx0ZWRfX2niM091gax8L
 zOJ6nN4bzFRC07E/iMWbNxno7gSwMMDFAnUbZ0KUzBffBgPlgH4ouZwjcYZBZUwOT5fQH2NBNEv
 vds1/FYb+hvLIGSZ9TcEgYRj2TrMQ3YKGQgAK/hXy8S/BdZvzOivetuTgm9tvauMWAEDdaO3q1M
 VP0d9UbH81n/1HQChTshiFQFkkBn9oZYgbcXpvpVSege6Dd5gXIFsJXwCqj/VZknamGFsPx1rNp
 4XtzME6aEYqrNvoAiIXMj0iOmttxRo/fAZ3cu7SNWo5K7u8WJR1kGG/nmU3cFy/m0LW171ZBNv0
 bEnDMYEUSjIcV5Cs2gkbakqkAudMUoyI/3Y3NksQLJZPK2LjvXiLvVvrWvjFXMY+SyzXGpEH2x+
 zBh6nlCPSv8cZ8Fyhyv1nME/ATkd0boh2LZupSUfSC/oI0XNcUYGHk45ch+zW5QrkuUx+tMQjGM
 Bw9fyUD5rA5nXoBB9EA==
X-Authority-Analysis: v=2.4 cv=YOKSCBGx c=1 sm=1 tr=0 ts=69492564 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jtnMdLYT_4TzbHYvX8gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: KQZ-KdbHQNKIHw4JsbXrVSigDs6nxrI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220100



On 12/22/2025 5:49 PM, Konrad Dybcio wrote:
> On 12/22/25 10:13 AM, Wenmeng Liu wrote:
>>
>>
>> On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
>>> On 22/12/2025 09:44, Wenmeng Liu wrote:
>>>> Add the sm6150 CCI device string compatible.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> @@ -33,6 +33,7 @@ properties:
>>>>                  - qcom,sc8280xp-cci
>>>>                  - qcom,sdm670-cci
>>>>                  - qcom,sdm845-cci
>>>> +              - qcom,sm6150-cci
>>>>                  - qcom,sm6350-cci
>>>>                  - qcom,sm8250-cci
>>>>                  - qcom,sm8450-cci
>>>> @@ -263,6 +264,23 @@ allOf:
>>>>                - const: cpas_ahb
>>>>                - const: cci
>>>>    +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sm6150-cci
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +          maxItems: 3
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: soc_ahb
>>>
>>>
>>> Isn't this just camnoc_axi for this device (pay attention: to this device)?
>>>
>>
>> On this SOC, both soc_ahb and camnoc_axi exist.
>> Is it suggested that I use the existing ones below?
>>   - if:
>>        properties:
>>          compatible:
>>            contains:
>>              enum:
>>                - qcom,sdm670-cci
>>      then:
>>        properties:
>>          clocks:
>>            minItems: 4
>>            maxItems: 4
>>          clock-names:
>>            items:
>>              - const: camnoc_axi
>>              - const: soc_ahb
>>              - const: cpas_ahb
>>              - const: cci
> 
> Are both AXI and the two AHB clocks necessary for the CCI to operate?
> It wasn't the case on other similarly-aged platforms
> 
> Konrad

The test conclusion indicates that all three clocks are necessary.
all of them are necessary.

Thanks,
Wenmeng



