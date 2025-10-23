Return-Path: <linux-media+bounces-45334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B774ABFF2D7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 06:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637C83A5B31
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 04:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073DB25A35E;
	Thu, 23 Oct 2025 04:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVe3TA/A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B31D6AA
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195135; cv=none; b=c1wKDKsP0KCTYvJGHYwcGQUyu8/HCY63NcvWUnBMPAd9oTDRhsJ6/wG/M6ewLWB1nU7mKALNOke1h0evIhthJLEp7r69oUdeXotkx+lCqRdHXgoph16LDipai+wC4QirbqQHQTAyMMetbkteXK2UmDhWbxkAes4niHy5lqG+iO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195135; c=relaxed/simple;
	bh=fuznH2zWBFCQ/nXksrUJyWitjM0pBdwRhP+IXjYccGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeeG3F+LpCQNphFXtVoU9wj/SX3byXYVj/SWKEYztQX3bDwMPWUDuV8aoB0FadMoIt/bGNnRMCBS7O95LTpNxI5r4XbNjd145v94WWgwPaI3Oq+KIimrtzrqv/4tVlZSpqYiGJXvCUeKVfYBLfOEdncV7S0EX57lx67xaUOnft8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVe3TA/A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIeo0q028826
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 04:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44r1bl4Bha0tv0uPs/L15b2JDfXrJhQLdId2kUncqjc=; b=lVe3TA/AELQXgX2I
	ZvnRNdYtWHslDYCuZIDaZOCQsic0n5Y562EfOGoj+GeaPZkIVdiHySonwsiWeHZ9
	CWU2BAet/YbD+XZBFZjQnCPvLYfYuXTPfNpnCkbdIHMhBVIjNa/j5msuFIXZFRJd
	p2N6Ol3WqA6Wk81wPFsSBLp4taQ6REOE7MAOHK0o5rG8QCkQDRkBHynW3ISL6YL6
	fWSXTbuSjbihlGQGkvr1jWHSoyh8oJJD64CwqCEM/SubZJ5YsgrzNhCRqSyx5NdV
	9ikoiEFirVHmtuhl/em14K9DBAG367i1ED/XMqnqy2LBUAgMvEww2r0LnaPRol4j
	nA05MQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wcpha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 04:52:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so286153a12.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 21:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761195130; x=1761799930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44r1bl4Bha0tv0uPs/L15b2JDfXrJhQLdId2kUncqjc=;
        b=ElfLhsyj1ZkVXvBoERAJS0pPNqnazSvO2DeRsbROqZCRu+8Udt9sp3w99/LE1T05B9
         KzuH89KxumQ7UcB7GPMKKk+KrabOw+pkK4UudP2e+F/TBD3+9aCoZudpfJqh/CCQ5v/9
         ODjK73ecR9xkNFCOYYPa5YDbwuAnFpxZTPXzEiSlMv/G8IitQ+w6U26Cgbt04zK0p2z+
         oDkgsc+ASM1zMvqirizo51I5TRxdOAwJ+3qRpNBbzFz8L6vdwvp7ijWeJ3Sg4n5ccCg7
         b6zHfoYXxEnhYv3nLhKAI2lw9iJbppBf9wSlLh6/+cQrhhD1tm/Or9ZEAmzBAyJ0CCiy
         UcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwIuZVlgoQQxMwyPAGH+jev1JX9C0y5yMCXPr/bTk5CFYczHqth9eKqwakPdVzveDcfzV6WWOGimWPAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+fijA9+F4XpF43kMqTIS+eyj+bVGhXbTIU0js3SypI7LJ8zCc
	mwvsK1l3P7Fa9dTzpbEjzxo0W+4/jgnhTZ6RvtYLWHsHovcD9F7x7NYib98ca2mFOsqaFRf4t4O
	PtKAryFu7YzNM+nSPtYULs4QpvqJBYUnBdp6ModEBESv+KPppluM5obZH3mH4nCIh8g==
X-Gm-Gg: ASbGncsUwryHBqo7kPYaDeFJPAUNiRJ/MRHzzPIWhF3A/3T9YHtg32HieIaym13FiK1
	10luwAnVvrfl/JGn6HfdVzt43jzhCPAOtRP95n7clwHXoLAn47ruEs+Qk49CDj6tR9ZOj7IXhg+
	bE4I5CzWnw2jTwKic2RMwD8PJ4eiFRjbp8FxiReB3mrU2wd43fTIrE8+OMGPjEwfl+o9aCX1pZO
	KjoGCjuw42taRCtXi0EmTd3q7x1hpr3j77d5DP4Tr1UPIc2vFsQwqfKhDPTqmjgIhX/un8znks0
	I2h7tYHpOD+9t9LNigacLhss9BP6lBvfSFrjiysMKWORsAD6PYK2t9lDChIfAOKVrT5Ga55UpKW
	P9zMQF1nxTHz99aVRyVXKt4a8cVeK1w==
X-Received: by 2002:a17:902:d60d:b0:24a:a6c8:d6c4 with SMTP id d9443c01a7336-290c9cf0f1amr286382325ad.26.1761195129622;
        Wed, 22 Oct 2025 21:52:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf+v+wMPthTdUqK0OmDXOcgI9WsjK0//yYkh6I74WoMUZR4qHiOirpwfvCoeQ/+ohMqH0prw==
X-Received: by 2002:a17:902:d60d:b0:24a:a6c8:d6c4 with SMTP id d9443c01a7336-290c9cf0f1amr286381985ad.26.1761195129065;
        Wed, 22 Oct 2025 21:52:09 -0700 (PDT)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f37a3sm9223315ad.83.2025.10.22.21.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:52:08 -0700 (PDT)
Message-ID: <d4b8cd74-0b0a-4fc8-8ed0-a9023a516b58@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 21:52:06 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
 <1d6a20d8-b011-4608-a722-a1996b366a56@oss.qualcomm.com>
 <b18fc946-a249-481a-b727-7d3e49d47f8e@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <b18fc946-a249-481a-b727-7d3e49d47f8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aau0CXrNbdyXNpBGYmx_xUWbWJPioKT7
X-Proofpoint-GUID: aau0CXrNbdyXNpBGYmx_xUWbWJPioKT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX4VvF26E3vHXS
 ucxudLZT1uwqODNu8tqbpSLI9vjDliuVUxRBh6VlQSmGleUKp6o7Ta+TDuaHHXCxrPcAd0e/yax
 241u92mNV9e6ra8m8MhnuVPj31H5e5h/KajwC7gR59INOlHEs2Q+OFF/bEeXqvEUC+f6asTkD8S
 eJRB/O8lVONIUt79A9A0IrDV7FTmWYDSGxJ4E6AmWp/B3nLftmJzHpn2DWblpxasNVoaUrc6ahb
 NIinGDFeRbXRBn1F/lOPlivvnZedyjEFBox/U5DGA4dqMYarD5QD+eO3DjlhBdtoxKCyzVjbc+6
 WftlBqjB1tQyozVmWuZXhRB8K/5eVmDoszLHbs7JTiPbNiOVYUiFpM6fwW4XDw74k06RiI6oGw1
 f3/TMuDxMfOVnuSLWCKfsOGZtKcXMw==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9b47a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=q19RU6WnuFYYO1jwFo4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090


On 10/16/2025 5:27 PM, Vladimir Zapolskiy wrote:
> On 10/17/25 02:53, Vijay Kumar Tumati wrote:
>>
>> On 10/15/2025 12:45 PM, Vladimir Zapolskiy wrote:
>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>> Add bindings for qcom,kaanapali-camss in order to support the camera
>>>> subsystem for Kaanapali.
>>>>
>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,kaanapali-camss.yaml       | 494
>>>> +++++++++++++++++++++
>>>>    1 file changed, 494 insertions(+)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>> new file mode 100644
>>>> index 000000000000..d04c21103cfd
>>>> --- /dev/null
>>>> +++ 
>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>> @@ -0,0 +1,494 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>>> +
>>>> +maintainers:
>>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>> +
>>>> +description:
>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm 
>>>> platforms.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,kaanapali-camss
>>>> +
>>>> +  reg:
>>>> +    maxItems: 16
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: csid0
>>>> +      - const: csid1
>>>> +      - const: csid2
>>>> +      - const: csid_lite0
>>>> +      - const: csid_lite1
>>>> +      - const: csiphy0
>>>> +      - const: csiphy1
>>>> +      - const: csiphy2
>>>> +      - const: csiphy3
>>>> +      - const: csiphy4
>>>> +      - const: csiphy5
>>>> +      - const: vfe0
>>>> +      - const: vfe1
>>>> +      - const: vfe2
>>>> +      - const: vfe_lite0
>>>> +      - const: vfe_lite1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 34
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: camnoc_nrt_axi
>>>> +      - const: camnoc_rt_axi
>>>> +      - const: camnoc_rt_vfe0
>>>> +      - const: camnoc_rt_vfe1
>>>> +      - const: camnoc_rt_vfe2
>>>> +      - const: camnoc_rt_vfe_lite
>>>> +      - const: cam_top_ahb
>>>> +      - const: cam_top_fast_ahb
>>>> +      - const: csid
>>>> +      - const: csid_csiphy_rx
>>>> +      - const: csiphy0
>>>> +      - const: csiphy0_timer
>>>> +      - const: csiphy1
>>>> +      - const: csiphy1_timer
>>>> +      - const: csiphy2
>>>> +      - const: csiphy2_timer
>>>> +      - const: csiphy3
>>>> +      - const: csiphy3_timer
>>>> +      - const: csiphy4
>>>> +      - const: csiphy4_timer
>>>> +      - const: csiphy5
>>>> +      - const: csiphy5_timer
>>>> +      - const: gcc_hf_axi
>>>> +      - const: qdss_debug_xo
>>>> +      - const: vfe0
>>>> +      - const: vfe0_fast_ahb
>>>> +      - const: vfe1
>>>> +      - const: vfe1_fast_ahb
>>>> +      - const: vfe2
>>>> +      - const: vfe2_fast_ahb
>>>> +      - const: vfe_lite
>>>> +      - const: vfe_lite_ahb
>>>> +      - const: vfe_lite_cphy_rx
>>>> +      - const: vfe_lite_csid
>>>
>>> The list of 'clock-names' values is not alphanumerically sorted.
>>>
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 16
>>>> +  interrupt-names:
>>>
>>> Missing empty line to separate properties.
>>>
>>>> +    items:
>>>> +      - const: csid0
>>>> +      - const: csid1
>>>> +      - const: csid2
>>>> +      - const: csid_lite0
>>>> +      - const: csid_lite1
>>>> +      - const: csiphy0
>>>> +      - const: csiphy1
>>>> +      - const: csiphy2
>>>> +      - const: csiphy3
>>>> +      - const: csiphy4
>>>> +      - const: csiphy5
>>>> +      - const: vfe0
>>>> +      - const: vfe1
>>>> +      - const: vfe2
>>>> +      - const: vfe_lite0
>>>> +      - const: vfe_lite1
>>>> +
>>>> +  interconnects:
>>>> +    maxItems: 2
>>>> +
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: ahb
>>>> +      - const: hf_0_mnoc
>>>
>>> Please rename "hf_0_mnoc" to "hf_mnoc", see qcom,qcm2290-camss.yaml 
>>> etc.
>>>
>>>> +
>>>> +  iommus:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    items:
>>>> +      - description:
>>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>>> Controller.
>>>> +      - description:
>>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>>> Controller.
>>>> +      - description:
>>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>>> Controller.
>>>> +      - description:
>>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>>> Controller.
>>>> +
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: tfe0
>>>> +      - const: tfe1
>>>> +      - const: tfe2
>>>
>>> Please remove all 'tfeX' power domains, they are not going to be 
>>> utilized
>>> any time soon.
>>>
>>> When 'power-domains' list is just a single Titan GDSC,
>>> 'power-domain-names'
>>> property is not needed.
>>>
>>>> +      - const: top
>>>> +
>>>> +  vdda-pll-supply:
>>>> +    description:
>>>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>>>> +
>>>> +  vdda-phy0-supply:
>>>> +    description:
>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>> +
>>>> +  vdda-phy1-supply:
>>>> +    description:
>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>> +
>>>> +  vdda-phy2-supply:
>>>> +    description:
>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>> +
>>>> +  vdda-phy3-supply:
>>>> +    description:
>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>> +
>>>> +  vdda-phy4-supply:
>>>> +    description:
>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>> +
>>>> +  vdda-phy5-supply:
>>>> +    description:
>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>
>>> What is the difference between vdda-phyX-supply properties, why do you
>>> need so many of them, when their descriptions say they are all the 
>>> same?
>> Each of these supply power to a specific CSIPHY and could be different
>> based on the board architecture. But I agree that the description should
>> probably capture that than just relying on the name.
>>>
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    description:
>>>> +      CSI input ports.
>>>> +
>>>> +    properties:
>>>> +      port@0:
>>>
>>> Please use
>>>
>>>      patternProperties:
>>>        "^port@[0-3]$":
>>>
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description:
>>>> +          Input port for receiving CSI data on CSI0.
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              clock-lanes:
>>>> +                maxItems: 1
>>>
>>> Please remove 'clock-lanes' property, it is non-configurable, redundant
>>> and tends to store some irrelevant value.
>>>
>>>> +
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>> +            required:
>>>> +              - clock-lanes
>>>
>>> The 'clock-lanes' property is expected to be removed.
>>>
>>>> +              - data-lanes
>>>> +
>>>> +      port@1:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description:
>>>> +          Input port for receiving CSI data on CSI1.
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              clock-lanes:
>>>> +                maxItems: 1
>>>> +
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>> +            required:
>>>> +              - clock-lanes
>>>> +              - data-lanes
>>>> +
>>>> +      port@2:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description:
>>>> +          Input port for receiving CSI data on CSI2.
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              clock-lanes:
>>>> +                maxItems: 1
>>>> +
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>> +            required:
>>>> +              - clock-lanes
>>>> +              - data-lanes
>>>> +
>>>> +      port@3:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description:
>>>> +          Input port for receiving CSI data on CSI3.
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              clock-lanes:
>>>> +                maxItems: 1
>>>> +
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>> +            required:
>>>> +              - clock-lanes
>>>> +              - data-lanes
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - reg-names
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - interrupt-names
>>>> +  - interconnects
>>>> +  - interconnect-names
>>>> +  - iommus
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +  - vdda-pll-supply
>>>> +  - vdda-phy0-supply
>>>> +  - vdda-phy1-supply
>>>> +  - vdda-phy2-supply
>>>> +  - vdda-phy3-supply
>>>> +  - vdda-phy4-supply
>>>> +  - vdda-phy5-supply
>>>
>>> Please exclude supplies from the list of required properties.
>> One of these supplies is required based which PHY the use case is being
>> run. Can you please advise how to handle that? Thanks.
>
> 1. Please rename all of them, reference to qcom,x1e80100-camss.yaml,
> qcom,qcm2290-camss.yaml or published on linux-media 
> qcom,sm8650-camss.yaml
>
> 2. Remove all of them from the list of required properties, and in a 
> board
> specific dts file add only the neccesary ones, that's it.
>
Thanks. We will try to follow the same for rev3. Just a caveat though. 
If, for instance, two CSIPHYs have different 1.2 supplies and they are 
required to be operated concurrently, it may be is a problem? as we can 
put only one of those in the board specific DTS for the 1.2 supply node 
(ex: vdd-csiphy-1p2 in SM2290). Is it not? However, if we don't have 
such a use case requirement on the upstream may be it's OK. Thank you.

