Return-Path: <linux-media+bounces-48448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF7CAE68B
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 00:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 447AB30439E7
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 23:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2002EA749;
	Mon,  8 Dec 2025 23:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wex0DhY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2apzA/U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205EF1E1A3B
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 23:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765236070; cv=none; b=eR//MuixAICVEBONQwxoTqGM6kyq/pwYNB0q3vGA7O4bZh80tXohHDDVczjkVDVnJNE+EBbsKC/VA81K9QcwcXCEKfIqd8zmkWjr95SqBnUCx1z8UUfXlzRY4dSEVybMPkq7ZT4vTjL4wssybXSbbQSLH8s0vgPSHV0/F6m7Eh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765236070; c=relaxed/simple;
	bh=z+1BP2o6D5ux58wI/mymIWdZSiIjknbAkuepBjtaxcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gF5j5qu4zDvDJaw1PfXNTRMRV1L8WGn3wxysaQEI9Pb7qPGZiSBj+tLz29Ad/m5Nj3YPNirZoQTpKWCKblTxOvezr3I67SHuY7uXV9HTus9B9lY4qPJEhgW3NPz22lQdAec+s1TyH8d+TnM/vq4n6ID7wyCTYwAGd2Q6Dxwr16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wex0DhY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2apzA/U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8KrO8q1528363
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 23:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s54iwWQ2D262BEm8Yo0yZdRsrv0wOO9OjRCAHMq8e3A=; b=Wex0DhY3hemnQtjl
	9fBoSJkI69hOBWiFeTCnz9i8dmohvwfKUvIhs599tvKezS/AMnl6wISC0iE1ogu2
	GcU6o8meouYJylg5JeBAFJurup2HDbgIEEdOEDj3z77wHerOExd9sDvGedy+TlQF
	YNpQINCh9ppPGK5wJOMNopoUoSKX9V+oB49iSzFhFYBazHzYHcoIkE2RRn+svgJQ
	9rKthaB3ooH5k28tVG+dEAxtMkihBEh80WJoLXKULeB4mftsuOE0QpzxYz+w99cG
	cA4ah6JOSI+FCHx+9L8uKvmA1d2cnp4S13IWwxAp/wfQDfe+DTavmTPz2iJVnOdP
	ip1tig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax63v89sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 23:21:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34a43e96860so793330a91.3
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 15:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765236066; x=1765840866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s54iwWQ2D262BEm8Yo0yZdRsrv0wOO9OjRCAHMq8e3A=;
        b=F2apzA/UaGfaUVrvEDCwnUK0W5T4yOVZZ+4UNaXTqYiAlvu+Tg0NZKSTflwvoMA39G
         zWI5Rsu/JZsMj9+A/Xc4H07siaYxD3vbpganCgrRdvFAbx5Cim27dQzMbGz6041/R/3W
         UR0gD0WNR7WcoXtfk5ZyXEbRpf9vSJl3cnWUX6NufqHuKjoV5U5Cn63xkMzmx2eGWgYw
         2Ch8y9I2XaAefc7BzKQssUYKPKKSK5sWVZxTYP6GqoyfPNo5fiTxK8XlimI4NCSQ+wkD
         rqsrBcXfB2yhKVub4M5011ZBhXyXEjSbJUUzXoIQruL5xdv4H/LFzhD0A9QjLbK99XLm
         nX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765236066; x=1765840866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s54iwWQ2D262BEm8Yo0yZdRsrv0wOO9OjRCAHMq8e3A=;
        b=nD+StZ+o6I0U2EmDZ04FzIQVoaVTWG5iFGzOrxfmDn0qTZkzos4fauDKJhv+AOcp2d
         xJrpmV3XLUqfjKU8wls4vB58r4aL6smX6APn4bB4wxsaTTfyOc8r0JfPfu7yWyJetpLt
         dXm+X/Tz7gjcmNJjna7eO98LAhVKqsVxfgN00KQK3ubZSHZtS1/11BhMWZRTnQ+ZR3vw
         OFCfQFOw1ps3VZ87N+tbkfZdPF2P4If0xUJWQiFQPMZkF2poZ1q/usw6a/DSLf67fxqB
         aCwwek15NTqEO/mxetl9V7P9B+z2A4CjMyTvmUcu1Y3YJT/1wIJPhoGI7/zc5dM4x31l
         6tnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbFMf8hda1qYlyr6kYNB4gjaWHnBVtTJsp2G4auO7LxMjmCDJn2QL9fZQ/RYGxPa8IbsTNVgkgSZuklQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbjz4qmuLNSuQKZvIDjYyEHf9fPsXqIAAojpivqpG7mdHUBjyQ
	n63sIIBDtLRWtHZQ7GTQpT4MMqE51OMDsF7irNm2VbIsLzUpqlLiPpc5787JKj/SxX9BO+ib/wc
	iex/Lw0BEfeIMEXoKe0sJTCwWIRozUmm+/92tSfeiDLSCcmDnUVJVZ/Hb7qHl/htzVA==
X-Gm-Gg: ASbGncsscyws0Hha56ZAqbfpxIFHTws1JCu80sqowmDaGBNhYbXyl5iN02xNN60h/JZ
	v8vZGBrKDPK+n6PB2JvKiTcd3y+aiMmoipN9PBZy7+cDNeXCFOuEciNUDiYYxDuiJ50LwyF1Cny
	5WYU9qyY24wgFDHdQa/A7qieZtqa0G18fBNANQKpUxa0t2X/zoCwzrSHejqTFgVWWnIlR7O8FWq
	fTjYNQaV2riPoTc7w5X5hU77LG6TozV9ojYuIKwnLCJ1M3Y5WvDZBmPozUyiV6myll/ARo6H7a7
	rNXiHBMlDIbgXf1Itw3p4Fp4RTC+xkNB1+pJSzuQJigPuQVfrip/Z5ivkaXQIBZgKn2xUd45sMe
	frwdQkAgEDsXbQzw3kr1YiWt35jSUFDgFZ9Q/M6nlNTm9utNFTkGvWqjmKwppeQCHng==
X-Received: by 2002:a17:90b:1646:b0:349:5b1b:78bf with SMTP id 98e67ed59e1d1-349a2591a5cmr8246369a91.23.1765236066316;
        Mon, 08 Dec 2025 15:21:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXBfA9auDIrWvNNYpCfwjDlhxkvU0OBrPBOzzgvV7RMrNxu3JQcoTnRqafulGBwto4OfFrxA==
X-Received: by 2002:a17:90b:1646:b0:349:5b1b:78bf with SMTP id 98e67ed59e1d1-349a2591a5cmr8246346a91.23.1765236065721;
        Mon, 08 Dec 2025 15:21:05 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a499f22fcsm313603a91.10.2025.12.08.15.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 15:21:05 -0800 (PST)
Message-ID: <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 15:21:02 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
 <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
 <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKarWeZb c=1 sm=1 tr=0 ts=69375d63 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Jg0mZSudMD12GhbkjmMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eAJyYRqryQrjYcyIu1OUCicxAoTbUgvs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE5OCBTYWx0ZWRfX5XCy/ATtSthX
 3XK1Qy95h11QhjgvFz2v1ccY2FGNc6x0VHjYzdcN1mJb/qF09xpcq8Ey9vnuAU4MebQF2ZsX1DZ
 DjGdIDxDPLTV1XV1Z18oBOy1dPeVVgVKAQ9UrXaMhdlK9po+iAqPzOaSSA79ZUAiUw5Cd8kJDm6
 EYPOFpIrqK5gbeuNWLCRTS+TJnSrKIRaXixvVwbDsN8dAS0ZxpFB7yEaHc6yPpfsCdFWUrqgH9O
 Tae6HAsOVr9cB7eyatW8aglcAV1kjlh+HsNfQs8OWujwIOHHu0pDbEBn96/AzLF9u4XPIQ4i1UB
 6qLjiXp/yTEakqUZuPt/kVab883dzP9r3La04BjlnxgMbWjF6pIa8Tug1y7O9/V+s9iynre6as9
 hOKe3f9U1PcJILLMtn3AzTp7++XI2Q==
X-Proofpoint-GUID: eAJyYRqryQrjYcyIu1OUCicxAoTbUgvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080198


On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
>> On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 08, 2025 at 04:39:47AM -0800, Hangxiang Ma wrote:
>>>> Add bindings for qcom,kaanapali-camss to support the Camera Subsystem
>>>> (CAMSS) on the Qualcomm Kaanapali platform.
>>>>
>>>> The Kaanapali platform provides:
>>>>
>>>> - 3 x VFE, 5 RDI per VFE
>>>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>>> - 3 x CSID
>>>> - 2 x CSID Lite
>>>> - 6 x CSIPHY
>>>> - 2 x ICP
>>>> - 1 x IPE
>>>> - 2 x JPEG DMA & Downscaler
>>>> - 2 x JPEG Encoder
>>>> - 1 x OFE
>>>> - 5 x RT CDM
>>>> - 3 x TPG
>>> Please describe the acronyms.
>> Ack.
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,kaanapali-camss.yaml       | 646 +++++++++++++++++++++
>>>>    1 file changed, 646 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>> new file mode 100644
>>>> index 000000000000..3b54620e14c6
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>> @@ -0,0 +1,646 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>>> +
>>>> +maintainers:
>>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>> +
>>>> +description:
>>>> +  Kaanapali camera subsystem includes submodules such as CSIPHY (CSI Physical layer)
>>>> +  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
>>>> +
>>>> +  The subsystem also integrates a set of real-time image processing engines and their
>>>> +  associated configuration modules, as well as non-real-time engines.
>>>> +
>>>> +  Additionally, it encompasses a test pattern generator (TPG) submodule.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,kaanapali-camss
>>>> +
>>>> +  reg:
>>>> +    items:
>>>> +      - description: Registers for CSID 0
>>>> +      - description: Registers for CSID 1
>>>> +      - description: Registers for CSID 2
>>>> +      - description: Registers for CSID Lite 0
>>>> +      - description: Registers for CSID Lite 1
>>>> +      - description: Registers for CSIPHY 0
>>>> +      - description: Registers for CSIPHY 1
>>>> +      - description: Registers for CSIPHY 2
>>>> +      - description: Registers for CSIPHY 3
>>>> +      - description: Registers for CSIPHY 4
>>>> +      - description: Registers for CSIPHY 5
>>>> +      - description: Registers for VFE (Video Front End) 0
>>>> +      - description: Registers for VFE 1
>>>> +      - description: Registers for VFE 2
>>>> +      - description: Registers for VFE Lite 0
>>>> +      - description: Registers for VFE Lite 1
>>>> +      - description: Registers for ICP (Imaging Control Processor) 0
>>>> +      - description: Registers for ICP 0 SYS
>>>> +      - description: Registers for ICP 1
>>>> +      - description: Registers for ICP 1 SYS
>>>> +      - description: Registers for IPE (Image Processing Engine)
>>>> +      - description: Registers for JPEG DMA & Downscaler
>>>> +      - description: Registers for JPEG Encoder
>>>> +      - description: Registers for OFE (Offline Front End)
>>>> +      - description: Registers for RT CDM (Camera Data Mover) 0
>>>> +      - description: Registers for RT CDM 1
>>>> +      - description: Registers for RT CDM 2
>>>> +      - description: Registers for RT CDM 3
>>>> +      - description: Registers for RT CDM 4
>>>> +      - description: Registers for TPG 0
>>>> +      - description: Registers for TPG 1
>>>> +      - description: Registers for TPG 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: csid0
>>>> +      - const: csid1
>>>> +      - const: csid2
>>>> +      - const: csid_lite0
>>>> +      - const: csid_lite1
>>>> +      - const: csiphy0
>>>> +      - const: csiphy1
>>>> +      - const: csiphy2
>>>> +      - const: csiphy3
>>>> +      - const: csiphy4
>>>> +      - const: csiphy5
>>>> +      - const: vfe0
>>>> +      - const: vfe1
>>>> +      - const: vfe2
>>>> +      - const: vfe_lite0
>>>> +      - const: vfe_lite1
>>>> +      - const: icp0
>>>> +      - const: icp0_sys
>>>> +      - const: icp1
>>>> +      - const: icp1_sys
>>>> +      - const: ipe
>>>> +      - const: jpeg_dma
>>>> +      - const: jpeg_enc
>>>> +      - const: ofe
>>>> +      - const: rt_cdm0
>>>> +      - const: rt_cdm1
>>>> +      - const: rt_cdm2
>>>> +      - const: rt_cdm3
>>>> +      - const: rt_cdm4
>>>> +      - const: tpg0
>>>> +      - const: tpg1
>>>> +      - const: tpg2
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 60
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: camnoc_nrt_axi
>>>> +      - const: camnoc_rt_axi
>>>> +      - const: camnoc_rt_vfe0
>>>> +      - const: camnoc_rt_vfe1
>>>> +      - const: camnoc_rt_vfe2
>>>> +      - const: camnoc_rt_vfe_lite
>>>> +      - const: cpas_ahb
>>>> +      - const: cpas_fast_ahb
>>>> +      - const: csid
>>>> +      - const: csid_csiphy_rx
>>>> +      - const: csiphy0
>>>> +      - const: csiphy0_timer
>>>> +      - const: csiphy1
>>>> +      - const: csiphy1_timer
>>>> +      - const: csiphy2
>>>> +      - const: csiphy2_timer
>>>> +      - const: csiphy3
>>>> +      - const: csiphy3_timer
>>>> +      - const: csiphy4
>>>> +      - const: csiphy4_timer
>>>> +      - const: csiphy5
>>>> +      - const: csiphy5_timer
>>>> +      - const: gcc_axi_hf
>>> This clock (and gcc_axi_sf below) still have the gcc_ prefix and GCC name. Why?
>>> It was pointed out in the previous review: clock names should be
>>> describing their purpose, not their source.
>> Hi Dmitry, let me add a bit more detail on this clock. As confirmed by the
>> HW team, the logic that runs based on this clock is still inside the
>> CAMNOC_PDX, just that it is on the CX / MMNOC domain side. Do you think
>> "axi_hf_cx" and "axi_sf_cx" makes sense?
> Why? You are again describing the source. What is the function of?
> bus_hf / bus_sf?

In what I proposed,

axi - represents that we are talking about the axi bus from camera 
(against ahb bus).

hf - hf wrapper

cx - logic on the CX side of the bus in CAMNOC.

If you think that 'bus' (even looking from camera client side) by 
default means AXI bus and 'hf' and 'sf' implicitly represent the CX side 
(which, kind of, in the current design), then yes, "bus_hf" and "bus_sf" 
makes sense. Do you advise us to go ahead with these?

>>>> +      - const: vfe0
>>>> +      - const: vfe0_fast_ahb
>>>> +      - const: vfe1
>>>> +      - const: vfe1_fast_ahb
>>>> +      - const: vfe2
>>>> +      - const: vfe2_fast_ahb
>>>> +      - const: vfe_lite
>>>> +      - const: vfe_lite_ahb
>>>> +      - const: vfe_lite_cphy_rx
>>>> +      - const: vfe_lite_csid
>>>> +      - const: qdss_debug_xo
>>>> +      - const: camnoc_ipe_nps
>>>> +      - const: camnoc_ofe
>>>> +      - const: gcc_axi_sf
>>>> +      - const: icp0
>>>> +      - const: icp0_ahb
>>>> +      - const: icp1
>>>> +      - const: icp1_ahb
>>>> +      - const: ipe_nps
>>>> +      - const: ipe_nps_ahb
>>>> +      - const: ipe_nps_fast_ahb
>>>> +      - const: ipe_pps
>>>> +      - const: ipe_pps_fast_ahb
>>>> +      - const: jpeg
>>>> +      - const: ofe_ahb
>>>> +      - const: ofe_anchor
>>>> +      - const: ofe_anchor_fast_ahb
>>>> +      - const: ofe_hdr
>>>> +      - const: ofe_hdr_fast_ahb
>>>> +      - const: ofe_main
>>>> +      - const: ofe_main_fast_ahb
>>>> +      - const: vfe0_bayer
>>>> +      - const: vfe0_bayer_fast_ahb
>>>> +      - const: vfe1_bayer
>>>> +      - const: vfe1_bayer_fast_ahb
>>>> +      - const: vfe2_bayer
>>>> +      - const: vfe2_bayer_fast_ahb
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 30
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: csid0
>>>> +      - const: csid1
>>>> +      - const: csid2
>>>> +      - const: csid_lite0
>>>> +      - const: csid_lite1
>>>> +      - const: csiphy0
>>>> +      - const: csiphy1
>>>> +      - const: csiphy2
>>>> +      - const: csiphy3
>>>> +      - const: csiphy4
>>>> +      - const: csiphy5
>>>> +      - const: vfe0
>>>> +      - const: vfe1
>>>> +      - const: vfe2
>>>> +      - const: vfe_lite0
>>>> +      - const: vfe_lite1
>>>> +      - const: camnoc_nrt
>>>> +      - const: camnoc_rt
>>>> +      - const: icp0
>>>> +      - const: icp1
>>>> +      - const: jpeg_dma
>>>> +      - const: jpeg_enc
>>>> +      - const: rt_cdm0
>>>> +      - const: rt_cdm1
>>>> +      - const: rt_cdm2
>>>> +      - const: rt_cdm3
>>>> +      - const: rt_cdm4
>>>> +      - const: tpg0
>>>> +      - const: tpg1
>>>> +      - const: tpg2
>>>> +
>>>> +  interconnects:
>>>> +    maxItems: 4
>>>> +
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: ahb
>>>> +      - const: hf_mnoc
>>>> +      - const: sf_icp_mnoc
>>>> +      - const: sf_mnoc
>>> You know... Failure to look around is a sin. What are the names of
>>> interconnects used by other devices? What do they actually describe?
>>>
>>> This is an absolute NAK.
>> Please feel free to correct me here but, a couple things.
>>
>> 1. This is consistent with
>> Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?
> I see that nobody noticed an issue with Agatti, Lemans and Monaco
> bindings (Krzysztof?)
>
> Usually interconnect names describe the blocks that are connected. Here
> are the top results of a quick git grep of interconnect names through
> arch/arm64/dts/qcom:
>
>      729 "qup-core",
>      717 "qup-config",
>      457 "qup-memory",
>       41 "usb-ddr",
>       41 "apps-usb",
>       39 "pcie-mem",
>       39 "cpu-pcie",
>       28 "sdhc-ddr",
>       28 "cpu-sdhc",
>       28 "cpu-cfg",
>       24 "mdp0-mem",
>       17 "memory",
>       14 "ufs-ddr",
>       14 "mdp1-mem",
>       14 "cpu-ufs",
>       13 "video-mem",
>       13 "gfx-mem",
>
> I hope this gives you a pointer on how to name the interconnects.
>
>> 2. If you are referring to some other targets that use, "cam_" prefix, we
>> may not need that , isn't it? If we look at these interconnects from camera
>> side, as you advised for other things like this?
> See above.

I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem 
should be ok?

Or the other option, go exactly like 
Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.

What would you advise?

>
>>>> +
>>>> +  iommus:
>>>> +    items:
>>>> +      - description: VFE non-protected stream
>>>> +      - description: ICP0 shared stream
>>>> +      - description: ICP1 shared stream
>>>> +      - description: IPE CDM non-protected stream
>>>> +      - description: IPE non-protected stream
>>>> +      - description: JPEG non-protected stream
>>>> +      - description: OFE CDM non-protected stream
>>>> +      - description: OFE non-protected stream
>>>> +      - description: VFE / VFE Lite CDM non-protected stream
>>> This will map all IOMMUs to the same domain. Are you sure that this is
>>> what we want? Or do we wait for iommu-maps to be fixed?

Thanks,

Vijay.


