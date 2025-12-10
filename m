Return-Path: <linux-media+bounces-48571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E5CB3B2F
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 18:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A58F3093CD5
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 17:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB0528B3E7;
	Wed, 10 Dec 2025 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVSXWHq5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo3pX7Za"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1D81FE45D
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765389059; cv=none; b=BnY8W3bUSI2amIsXBO1qMVsOXWrTEHDE76DU5DrXd63Bm06tTErc9GDek353+5hUVubC7U3B/XibpFD7iby/orE+1pdKr5mxBRAihF/6o/ZbbgDvAUfA35jTQuytGW2F4DXirKKX5D0Qp3RlFBTNsAHYu3kI90up7MfU9wZF5W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765389059; c=relaxed/simple;
	bh=yxzev8EM5E0T7lxaL9VjsGhEPZMDoh38zloToSzWu4Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LS+Yb3d+wesXAUYP93TNDZIr0nXlJ1GjFIG2psBcpeidAlH1FIP1dqb0LamtsADR8UEZIAAuAObolnp52GOUA6iOqu8VxbQLSQH0LCblAZOzxrfVxKwhdZ7vLSi87z7KcwrtLPsKNndU8vk+5vvgXStKG9bCwaTJNaE2cd28Tok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVSXWHq5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo3pX7Za; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAAU2s21604368
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 17:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0xdAhyjVRQ3P4u6QZOwEX+3rAEIjfeC+exH9qNW2JE=; b=MVSXWHq5n5kfKrXZ
	vDZTsPsRM+RFKz7hALKBjIexiPF2vLkXa2e9XhQ70smN0vJ2x12S3QcBAVvXHPCS
	nXdsvZ8KMpm7m28vjIN77bg/FVxswBrE3ZoopdDrCy9h4d7LTvuMXZ/6RIzWrTkS
	cXy6Elmy17UnLI+11fFUr+qoxoaXeunoGsjHrIbIt5v3md1I8Ef91cCx8bRqLqKl
	w3t3tlpY7JUl8Ltdj/D9sMr+OeRgsPJSeJZfRMJ4nkhVNa4gPlRJOzZuzZIOEufW
	5J1NKdzunM70aGpoQw/t0l1sNbKYUM9pEb1RZt0NVFYPCAP4P5hl+djFKTRDzGJm
	04y4Aw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay75q9dsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 17:50:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so131077a12.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 09:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765389055; x=1765993855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0xdAhyjVRQ3P4u6QZOwEX+3rAEIjfeC+exH9qNW2JE=;
        b=Fo3pX7Zaf32dzelnVU9smipTRu4zhFDQu2RYOaQAWuqSuS27Ma+xzc7xPSgJ9pdlD5
         fZ+W7ccGNFKG4VioTOmWxgUUm/5JxnhylSckRABOLsSJkNehNflYzSb6ojIOIrhg/sYh
         foI5S+Sq2LtEAj2BKQjpyYLhTYt+UK9Y12Yeyx1LCSkD7q+F7cfDZNZYe3s4hLg5o1Bx
         McG9NDfGb+mEobBnO42/tHGzHwWbkLyIGhnGy+Jx7R+L8IPyQ9r0GVLePyBjxoJXrT3R
         uA/6iPgqgdiT8pgvUijNro1b8/FnZ3R4zgsUwbFb6dq5gQVviW8VYghNTtfJFRuYQARE
         mVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389055; x=1765993855;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0xdAhyjVRQ3P4u6QZOwEX+3rAEIjfeC+exH9qNW2JE=;
        b=NPQPfNhQ5jKGeRfSHpkPQJJZ+2d8S3zIqu0jaRQu4anfNrE0jcoBbvwWyGoUpbH65f
         IR3GjWRxuvWW7N+pBa1El/THuDsy0D8D8czPy7rZfccvI1up2aIv6VosPOiyZJAENxEM
         EbAMhKxW3NG2UDflJz4UJLYxmeMfiWjYL7SWQQCMJ419x80rWhIMOoXW8UpSZ/4I98qQ
         nzu/gIogu3UznPWfakKsB8PTBN8wG4o7/acIBcd4gUrryApPJNAzfGDv3DtD4Zmzd4oB
         V2bP6AApkUY5JmR0o7zkX5rr979YHJ2Bygtpljrs8YVLgpGzFDtakWA/Nr7I4mKnc1oR
         hv9g==
X-Forwarded-Encrypted: i=1; AJvYcCUYtsIoIlyszLc3FDyZkw2+DnMhgW/A+DBRNiGd0DJT8rmo0bzEgUD1vMaPOqFurtfOBb15LXdodarNAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsnp10l9iZXhZM6NybXtA9LCiqoyi53hv2Nt7X1EfsskwVf32B
	4ibYIixg1oKSH1ovD7sW/ng7xOhZ7Ac1w1kMOo/Ne43te59shKxvv4o1sDXD6BkUdCnlVzQhqkW
	gk3isuDVQ5AxouN8UYweiIazkMNarBDIqaLaMLHAVLgdmK9HHMguLFbGo0l84x1lTgg==
X-Gm-Gg: AY/fxX4vTpRsuqTZMrfdRrWhiUMrTrOVlfKYnWA4ZMo5u4Tr4reCA5cVzcdXsrm+zo+
	NZXYEyWlkCJsAF12JpCGLNhXSOAGg37Pi+GOIQf611F0GrygTWPU0XZzwElL8dfTH8A0Y6+wROw
	zka9mL2hs6fhh1zVspeYTiCnfIa4RB+FRf2rVVbBGWcODnrDRsvwV85n4Xg+KjXvDrET79GL+m0
	ulX5lsbRXo4+V5JqJrPHKmkQk+F0FcOvsID6zzch7gp4KzCUQEpYVOZGB0iy09uz0kAeDfTqM6H
	q9CmiCAvNIjVPWmaH2NMSSy8zYTUr5pP2Xa3MiLaGSzW5U72Cg8TcOxAoBCPEB9UzuwjyvlPUiw
	tEJQzTEsRn2ldxiSBVqBVYHSMFVOprfV4c+yBWdgY
X-Received: by 2002:a05:7300:de0a:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2ac052c7943mr2211554eec.0.1765389054942;
        Wed, 10 Dec 2025 09:50:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM+srJkTEntkf5wFVDdJ5uIFXsbpgJvPlw74PFWmuI3Xu2nHDQTmVRvuO3BSPGSD3pCtsN8g==
X-Received: by 2002:a05:7300:de0a:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2ac052c7943mr2211516eec.0.1765389054294;
        Wed, 10 Dec 2025 09:50:54 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm348793c88.1.2025.12.10.09.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 09:50:53 -0800 (PST)
Message-ID: <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 09:50:51 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
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
 <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3vOoddkQgMNKSuIzLvMunLLP9ILeInoX
X-Proofpoint-ORIG-GUID: 3vOoddkQgMNKSuIzLvMunLLP9ILeInoX
X-Authority-Analysis: v=2.4 cv=NtrcssdJ c=1 sm=1 tr=0 ts=6939b2ff cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gcM7WY6xUhQuHh4SBcoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NiBTYWx0ZWRfX9AWTW6lOLhCd
 cm69G/trGTovqqQvV2M7ACsIF5IiIkZhzB1kEXwYZidJ1pskggX8Bx0kfI0QqBox47OQkT9HuqV
 muWTve+pLUGCFgBJlUYCoohDR9/CqvzQjFmDG78YJRFlO+ntVrHH8tDfmaEA1TqF/YgbHa37LdK
 IWViEMS55vZYw8MpBe/AFS9MQ5It9SSiTDSIYNj9N0k+7Drz3Su+BnAifwEDTHaovaAUwTYOgVk
 yINDwq2oIcmfVEnGDl/4P1spxf9pk8qum/bKeqa/uxX2ORoNIryV58xdy8zaTJQIUIwleeXYXOd
 9ATlmXL5UAcQFRaOxll1/XU976jwqHutagFs+yGHNvawf/1GSx0u4tt/n9sxo8JXtmxXJbBhVpY
 VsWgVMYLPZOYxkiZbOPhojDNS9y61Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100146


On 12/8/2025 3:21 PM, Vijay Kumar Tumati wrote:
>
> On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
>> On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
>>> On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Dec 08, 2025 at 04:39:47AM -0800, Hangxiang Ma wrote:
>>>>> Add bindings for qcom,kaanapali-camss to support the Camera Subsystem
>>>>> (CAMSS) on the Qualcomm Kaanapali platform.
>>>>>
>>>>> The Kaanapali platform provides:
>>>>>
>>>>> - 3 x VFE, 5 RDI per VFE
>>>>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>>>> - 3 x CSID
>>>>> - 2 x CSID Lite
>>>>> - 6 x CSIPHY
>>>>> - 2 x ICP
>>>>> - 1 x IPE
>>>>> - 2 x JPEG DMA & Downscaler
>>>>> - 2 x JPEG Encoder
>>>>> - 1 x OFE
>>>>> - 5 x RT CDM
>>>>> - 3 x TPG
>>>> Please describe the acronyms.
>>> Ack.
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> ---
>>>>>    .../bindings/media/qcom,kaanapali-camss.yaml       | 646 
>>>>> +++++++++++++++++++++
>>>>>    1 file changed, 646 insertions(+)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml 
>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..3b54620e14c6
>>>>> --- /dev/null
>>>>> +++ 
>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> @@ -0,0 +1,646 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> +
>>>>> +description:
>>>>> +  Kaanapali camera subsystem includes submodules such as CSIPHY 
>>>>> (CSI Physical layer)
>>>>> +  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
>>>>> +
>>>>> +  The subsystem also integrates a set of real-time image 
>>>>> processing engines and their
>>>>> +  associated configuration modules, as well as non-real-time 
>>>>> engines.
>>>>> +
>>>>> +  Additionally, it encompasses a test pattern generator (TPG) 
>>>>> submodule.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,kaanapali-camss
>>>>> +
>>>>> +  reg:
>>>>> +    items:
>>>>> +      - description: Registers for CSID 0
>>>>> +      - description: Registers for CSID 1
>>>>> +      - description: Registers for CSID 2
>>>>> +      - description: Registers for CSID Lite 0
>>>>> +      - description: Registers for CSID Lite 1
>>>>> +      - description: Registers for CSIPHY 0
>>>>> +      - description: Registers for CSIPHY 1
>>>>> +      - description: Registers for CSIPHY 2
>>>>> +      - description: Registers for CSIPHY 3
>>>>> +      - description: Registers for CSIPHY 4
>>>>> +      - description: Registers for CSIPHY 5
>>>>> +      - description: Registers for VFE (Video Front End) 0
>>>>> +      - description: Registers for VFE 1
>>>>> +      - description: Registers for VFE 2
>>>>> +      - description: Registers for VFE Lite 0
>>>>> +      - description: Registers for VFE Lite 1
>>>>> +      - description: Registers for ICP (Imaging Control Processor) 0
>>>>> +      - description: Registers for ICP 0 SYS
>>>>> +      - description: Registers for ICP 1
>>>>> +      - description: Registers for ICP 1 SYS
>>>>> +      - description: Registers for IPE (Image Processing Engine)
>>>>> +      - description: Registers for JPEG DMA & Downscaler
>>>>> +      - description: Registers for JPEG Encoder
>>>>> +      - description: Registers for OFE (Offline Front End)
>>>>> +      - description: Registers for RT CDM (Camera Data Mover) 0
>>>>> +      - description: Registers for RT CDM 1
>>>>> +      - description: Registers for RT CDM 2
>>>>> +      - description: Registers for RT CDM 3
>>>>> +      - description: Registers for RT CDM 4
>>>>> +      - description: Registers for TPG 0
>>>>> +      - description: Registers for TPG 1
>>>>> +      - description: Registers for TPG 2
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite0
>>>>> +      - const: csid_lite1
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy5
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite0
>>>>> +      - const: vfe_lite1
>>>>> +      - const: icp0
>>>>> +      - const: icp0_sys
>>>>> +      - const: icp1
>>>>> +      - const: icp1_sys
>>>>> +      - const: ipe
>>>>> +      - const: jpeg_dma
>>>>> +      - const: jpeg_enc
>>>>> +      - const: ofe
>>>>> +      - const: rt_cdm0
>>>>> +      - const: rt_cdm1
>>>>> +      - const: rt_cdm2
>>>>> +      - const: rt_cdm3
>>>>> +      - const: rt_cdm4
>>>>> +      - const: tpg0
>>>>> +      - const: tpg1
>>>>> +      - const: tpg2
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 60
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: camnoc_nrt_axi
>>>>> +      - const: camnoc_rt_axi
>>>>> +      - const: camnoc_rt_vfe0
>>>>> +      - const: camnoc_rt_vfe1
>>>>> +      - const: camnoc_rt_vfe2
>>>>> +      - const: camnoc_rt_vfe_lite
>>>>> +      - const: cpas_ahb
>>>>> +      - const: cpas_fast_ahb
>>>>> +      - const: csid
>>>>> +      - const: csid_csiphy_rx
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy0_timer
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy1_timer
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy2_timer
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy3_timer
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy4_timer
>>>>> +      - const: csiphy5
>>>>> +      - const: csiphy5_timer
>>>>> +      - const: gcc_axi_hf
>>>> This clock (and gcc_axi_sf below) still have the gcc_ prefix and 
>>>> GCC name. Why?
>>>> It was pointed out in the previous review: clock names should be
>>>> describing their purpose, not their source.
>>> Hi Dmitry, let me add a bit more detail on this clock. As confirmed 
>>> by the
>>> HW team, the logic that runs based on this clock is still inside the
>>> CAMNOC_PDX, just that it is on the CX / MMNOC domain side. Do you think
>>> "axi_hf_cx" and "axi_sf_cx" makes sense?
>> Why? You are again describing the source. What is the function of?
>> bus_hf / bus_sf?
>
> In what I proposed,
>
> axi - represents that we are talking about the axi bus from camera 
> (against ahb bus).
>
> hf - hf wrapper
>
> cx - logic on the CX side of the bus in CAMNOC.
>
> If you think that 'bus' (even looking from camera client side) by 
> default means AXI bus and 'hf' and 'sf' implicitly represent the CX 
> side (which, kind of, in the current design), then yes, "bus_hf" and 
> "bus_sf" makes sense. Do you advise us to go ahead with these?
>
Ok, we will go ahead with "bus_hf" and "bus_sf". Hi @Bryan and others, 
please let us know if you have any concerns with this.
>>>>> +      - const: vfe0
>>>>> +      - const: vfe0_fast_ahb
>>>>> +      - const: vfe1
>>>>> +      - const: vfe1_fast_ahb
>>>>> +      - const: vfe2
>>>>> +      - const: vfe2_fast_ahb
>>>>> +      - const: vfe_lite
>>>>> +      - const: vfe_lite_ahb
>>>>> +      - const: vfe_lite_cphy_rx
>>>>> +      - const: vfe_lite_csid
>>>>> +      - const: qdss_debug_xo
>>>>> +      - const: camnoc_ipe_nps
>>>>> +      - const: camnoc_ofe
>>>>> +      - const: gcc_axi_sf
>>>>> +      - const: icp0
>>>>> +      - const: icp0_ahb
>>>>> +      - const: icp1
>>>>> +      - const: icp1_ahb
>>>>> +      - const: ipe_nps
>>>>> +      - const: ipe_nps_ahb
>>>>> +      - const: ipe_nps_fast_ahb
>>>>> +      - const: ipe_pps
>>>>> +      - const: ipe_pps_fast_ahb
>>>>> +      - const: jpeg
>>>>> +      - const: ofe_ahb
>>>>> +      - const: ofe_anchor
>>>>> +      - const: ofe_anchor_fast_ahb
>>>>> +      - const: ofe_hdr
>>>>> +      - const: ofe_hdr_fast_ahb
>>>>> +      - const: ofe_main
>>>>> +      - const: ofe_main_fast_ahb
>>>>> +      - const: vfe0_bayer
>>>>> +      - const: vfe0_bayer_fast_ahb
>>>>> +      - const: vfe1_bayer
>>>>> +      - const: vfe1_bayer_fast_ahb
>>>>> +      - const: vfe2_bayer
>>>>> +      - const: vfe2_bayer_fast_ahb
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 30
>>>>> +
>>>>> +  interrupt-names:
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite0
>>>>> +      - const: csid_lite1
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy5
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite0
>>>>> +      - const: vfe_lite1
>>>>> +      - const: camnoc_nrt
>>>>> +      - const: camnoc_rt
>>>>> +      - const: icp0
>>>>> +      - const: icp1
>>>>> +      - const: jpeg_dma
>>>>> +      - const: jpeg_enc
>>>>> +      - const: rt_cdm0
>>>>> +      - const: rt_cdm1
>>>>> +      - const: rt_cdm2
>>>>> +      - const: rt_cdm3
>>>>> +      - const: rt_cdm4
>>>>> +      - const: tpg0
>>>>> +      - const: tpg1
>>>>> +      - const: tpg2
>>>>> +
>>>>> +  interconnects:
>>>>> +    maxItems: 4
>>>>> +
>>>>> +  interconnect-names:
>>>>> +    items:
>>>>> +      - const: ahb
>>>>> +      - const: hf_mnoc
>>>>> +      - const: sf_icp_mnoc
>>>>> +      - const: sf_mnoc
>>>> You know... Failure to look around is a sin. What are the names of
>>>> interconnects used by other devices? What do they actually describe?
>>>>
>>>> This is an absolute NAK.
>>> Please feel free to correct me here but, a couple things.
>>>
>>> 1. This is consistent with
>>> Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?
>> I see that nobody noticed an issue with Agatti, Lemans and Monaco
>> bindings (Krzysztof?)
>>
>> Usually interconnect names describe the blocks that are connected. Here
>> are the top results of a quick git grep of interconnect names through
>> arch/arm64/dts/qcom:
>>
>>      729 "qup-core",
>>      717 "qup-config",
>>      457 "qup-memory",
>>       41 "usb-ddr",
>>       41 "apps-usb",
>>       39 "pcie-mem",
>>       39 "cpu-pcie",
>>       28 "sdhc-ddr",
>>       28 "cpu-sdhc",
>>       28 "cpu-cfg",
>>       24 "mdp0-mem",
>>       17 "memory",
>>       14 "ufs-ddr",
>>       14 "mdp1-mem",
>>       14 "cpu-ufs",
>>       13 "video-mem",
>>       13 "gfx-mem",
>>
>> I hope this gives you a pointer on how to name the interconnects.
>>
>>> 2. If you are referring to some other targets that use, "cam_" 
>>> prefix, we
>>> may not need that , isn't it? If we look at these interconnects from 
>>> camera
>>> side, as you advised for other things like this?
>> See above.
>
> I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem 
> should be ok?
>
> Or the other option, go exactly like 
> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.
>
> What would you advise?
>
To keep it consistent with the previous generations and still represent 
the block name, we will go ahead with the style in 
qcom,sc8280xp-camss.yaml. If anyone has any concerns, please do let us 
know.
>>
>>>>> +
>>>>> +  iommus:
>>>>> +    items:
>>>>> +      - description: VFE non-protected stream
>>>>> +      - description: ICP0 shared stream
>>>>> +      - description: ICP1 shared stream
>>>>> +      - description: IPE CDM non-protected stream
>>>>> +      - description: IPE non-protected stream
>>>>> +      - description: JPEG non-protected stream
>>>>> +      - description: OFE CDM non-protected stream
>>>>> +      - description: OFE non-protected stream
>>>>> +      - description: VFE / VFE Lite CDM non-protected stream
>>>> This will map all IOMMUs to the same domain. Are you sure that this is
>>>> what we want? Or do we wait for iommu-maps to be fixed?
>
Yes, when it is available, we can start using iommu-maps to create 
separate context banks.
> Thanks,
>
> Vijay.
>

