Return-Path: <linux-media+bounces-57604-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCoTFxdhymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57604-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:40:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3B935A652
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D41F6301AA9E
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADAB3C5531;
	Mon, 30 Mar 2026 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh4gJrX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnkE8sIW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434FC3BED06
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870506; cv=none; b=V36iv25qJlNOKwAydcqGwnxvIhW3u6/2WjbyW7SqWTydvuFZa1tVrV83axgATBL9vfFhlRt0+XBOSgFx8w+K0Pm0povoWm9DwC9S7dxOc5I1w/4D076upAMTx22pmA2mUf31illhUMnMunhEBZ4QU1txIlMQnT0uHywGof8Fufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870506; c=relaxed/simple;
	bh=ycV6YQeXVa5eh8mTB9MAC+9vMFbJHtlkRF2/yOgzqts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6XHwEHqsng1NFQF2FKyQf/Fjfss6RtgRJ7yembBxfyf+pYPBSGPwIUwPwJfuGmOtOiJI+t9O53V0FtosJLjq/cpZXjrgUiqnC7bu4MxIUqAGt+nXpMn5Ht8FG0smVqiD2KmJfmEkGxVbYTiiw9UU1tM7yNtcdr16DY6D82z5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh4gJrX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnkE8sIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7Gw33117364
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AD7yhFYem1/46F4xjVAzjcyJmROsEd9YlW0HID3CP4s=; b=Xh4gJrX7unDovN1t
	Hcy1hvQ4Gq9QsLeJrbRnJjY32V2o5ftIJ1Au/UM/hTaV0pp96z+1bRtxxsjLYvex
	p3fPltEsM/a2BVDIh58ydwl0hDIygLKuWicbEMV2vILPGnODSgHuJm8P+XjLBjT8
	DXOsgGY73L0CJejC1Do+u3d2caqecj236nyIm/sjnYNS3m0OIhaKcxGsZ/KQ1vh8
	gUMvUAPPK8KrvD96DqmejVlwQr/kKDgGUuklAf+9NczWiEga8S/zXVZc80VEncdd
	Z7djOQ+gFZv2q0d9D8RZqWYxTkecT/fO9iLm1SYad+1VsgT7CwCPxbU/QXi57wY8
	UapRGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqektss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:35:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2d5e61f6so12727791cf.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870503; x=1775475303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AD7yhFYem1/46F4xjVAzjcyJmROsEd9YlW0HID3CP4s=;
        b=bnkE8sIWs3mw9k1wnROrX+0+xOXPB1ubsDE97ZlhM7aYEGJ5UG0b6Bxu+Y+jZuBNPN
         5Tmn71aGxAkbHZz5TiQlTikcU9jBHAgRyaN3HLEBG0/A0cJ3VOAPGZ+eFMFNXXVLHkza
         ufXbsDjnIs67xFZQZdSOfSAP80gSwFMCJeVqwV2Ij0TTvBkiw+aTLdgQajPSJJRoHUTX
         +KkOSQ+9tJSm0JWVKnRmt6cObHlOfnTxjeVVDydyRwnUgxiQtdjuaye6eArmB007/Vhx
         PdL292s/KzS6KJhSWmZQqrJCsKD7kyzvgtPGxdGDDxgC8xiya6fXnXRQXuNu3/xxK2er
         C1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870503; x=1775475303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AD7yhFYem1/46F4xjVAzjcyJmROsEd9YlW0HID3CP4s=;
        b=oak1cBGpyRi4myr+RW9HV0N0oe+anqhHm8jDu4mjMQUTjPba5rodphYJug5NRy96gw
         7vnyppgBPGNgM5JZ/xvhUP4QpSExPo9hxF9tMr+vyEDThtABv+9crdVZBIfjEOeOZtkR
         wg1awkkcfDWY9OoTQH6zZH2AHPuR6ZY8rBnWuglEy+Bkqn1gDUfYrOrdRn8pPE8XJ0rE
         La2IOWrqjqKiciTJ8oZiqfugRKaV5G6IteXRlnIvXCVDtP7TrJA8ROkZG+bSAGfEzGaJ
         LgoUPy6rAlSTb4SJC+iftThaexDYmRvgPVxKatZCDBPmb1QEw26FSyb2guJDcm7lyj/H
         3QJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJAgRksUkzg2ICBht8kc2toKC2XywhQyqzMscf7sCGrTXRfMYIx8D/Rmx8BatCvV8ziSfN1YRJy4ldXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rvFLxIdL27AFNBjMhck25ViMe7ARWboHS7yxYHkqmS0wogvt
	nADEmVr67kvjqKuOERVD6k/7sLmffoTlBUA+A6IVsf24Ew29fWEViBW7fT5UA0jJocS4JJMsqbf
	rBHw7Zg9uIIS5v9/I3SxpfPY1q+/muHZbZ++skzjQ15HE8OMlmR5XJdMb+5Ww06RXww==
X-Gm-Gg: ATEYQzz3+GP2bvc7LyjG8hfm26UHZPoyTwvJ6Yun6WDYeFxi6mdOY1kMx9zUY1Hl6dG
	r6DVxLpKBeomu0N6+a57Alyl3cwV0el/71nrRQHQUagfr4wgcAvaBtoqCnIWZc60hIk/Qsz9mzK
	OaN4d2zPWiFspUle20sZiWGgjVjG/xsSdEWMTfjx3TVa6CNZm77DwfCGbM85YcNvWEl1llQHlFa
	cq4b9u4Bwd52We+b6+9kxiBMFBAWvi3WJtuO87jzKFtBhIxkhijBMaaPls0MeGN8rGvY6PK0kMC
	PntSFJP0Ky20VQNKUemekMneP5vyGh8WNjWkaas+x30cJgTFyYc+XvR/OEkrskhA1ZXKjtSXyG3
	o4yiFnm6VFI4GXZBdaPhUIF4OONSJp47UAn47kwMHsaCHbVBqN4VFjdbUAf+7ePQU8vM9g8PHDV
	3MQA4=
X-Received: by 2002:ac8:7d41:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50ba36c2754mr120405631cf.0.1774870503115;
        Mon, 30 Mar 2026 04:35:03 -0700 (PDT)
X-Received: by 2002:ac8:7d41:0:b0:509:219f:8e34 with SMTP id d75a77b69052e-50ba36c2754mr120405191cf.0.1774870502547;
        Mon, 30 Mar 2026 04:35:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm275868366b.18.2026.03.30.04.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:35:01 -0700 (PDT)
Message-ID: <6d5ebab6-3c4e-4a1c-9578-6e926cbd96de@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
 <RAPaPhpxA39W0ykm-Cr1KaDiJKpRqdQTXUeEmt5mQn4lJBHEGaIS010ejjmhUYEBsHjzrTX41Ek9zLU2bae_YA==@protonmail.internalid>
 <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
 <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca5fe8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=mneW2Sup4nk-zTkRaDIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YRdmpGDFlCKWnI2YqtZ8u4QZvlcu_HfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MCBTYWx0ZWRfX08bC95Vn6cfy
 jhRDy5SkOcJBDQMybEM0vabdhjcNQdbnowYDunIns0HHNQ7g95bsHP8gUrNJqxNx+YP9P3p1/uH
 iZBhXCXcU1pyduafXOw5HmHmEghYDWTHpOKIhIfixv5EOOx012pIFpK4KuixXzsWPrvl3r4Zkxf
 uK0iYUeygSQujvybPKC5kTgtdYyZcxkhfoAD7SUSSMLY4XfexgQTfyewZRYFvoB/7NTAF4ujd6x
 9Jgzg3FcXyyjNNeewzL4PHl9+G+u31n/D4WvahLzxwFXgZVvuVSAZo5EqyaKezho8EOqaR6X0XM
 V+FX0V4SfubJ4rmZuAPwj+iNbvOYHRyWZQATJ23gS85X51Byp0p/AWOt6zwcQB1HAOHXdcMh3SI
 My+8NuWZSyExjPualGerct6skhW1DWYRuCZlGJcy0+d97QQFNXjjVjeDBhrcSUieTQLgIYhpydZ
 t8Ga5AjQlBb4q6C6a5g==
X-Proofpoint-ORIG-GUID: YRdmpGDFlCKWnI2YqtZ8u4QZvlcu_HfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-57604-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,0.152.150.128:email,0.0.3.232:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.15.66.64:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E3B935A652
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 11:25 AM, Bryan O'Donoghue wrote:
> On 30/03/2026 10:17, Neil Armstrong wrote:
>> On 3/30/26 11:02, Bryan O'Donoghue wrote:
>>> On 30/03/2026 08:49, Neil Armstrong wrote:
>>>> On 3/27/26 18:42, Bryan O'Donoghue wrote:
>>>>> On 27/03/2026 15:28, Neil Armstrong wrote:
>>>>>>> To be frankly honest you can make an argument for it either way. However my honestly held position is analysing other upstream implementations connecting to the PHY means we can't make the PHY device a drivers/phy device - it would have to be a V4L2 device and then for me the question is why is that even required ?
>>>>>>
>>>>>> This is plain wrong, DT definition is different from software implementation, you can do whatever you want if you describe HW accurately.
>>>>>
>>>>> I'm not sure what point it is you are trying to make here. Are you trying to say drivers/phy is OK with you but you want an endpoint ? If so, please just say so.
>>>>
>>>> I'm against using the "phys = <>" property in the CAMSS to reference the PHYs, a "PHY" in the classic terminology is tied to a single consumer, and if it can be shared to multiple consumer you must model a mux or whatever in the middle.
>>>
>>> The CSIPHY-to-CSID routing is runtime-configurable and is already managed by the media controller framework.
>>
>> This is not compatible with the PHY bindings if you don't have a defined MUX device in the middle, it's wrong. You're hiding the muxing details in the CAMSS blob node.
>>
>>>
>>> DT describes static hardware connections. The dynamic mux is a software concern, not a hardware description concern.
>>
>> DT must describe the possible interconnections between the nodes, if a PHY can be used by multiple hardware components, it must be described.
> 
> But right now the CAMSS block is described as a single block. There is no CSID device in the kernel _yet_.
> 
> When we break CSID into its own block then fine, lets have a debate about a mux then but right now the "nodes" are CAMSS[MONOLITH] <=> CSIPHY there is no DT CSID device to model this to.

Let's take a step back - since any CSIPHY can feed into any CSID (at runtime),
the resulting nodes would either look like:

// hardcoded, m may != n
csid_n: csid@1000000 {
	phys = <&csiphy_m>;
};

or

// determined at runtime
csid_n: csid@1000000 {
	phys = <&csiphy_0>,
	       [...]
	       <&csiphy_n-1>;
};

or we could store them once, centrally, in the "CAMSS_TOP" node and
pass handles around as necessary:

// camss "catalog/manager" driver/library provides CSIDn with PHYm
camss: camss@10000000 {
	phys = <&csiphy_0>,
	       [...]
	       <&csiphy_n-1>;

	csid_n: csid@1000 {
		// no PHY references
	};
};

Konrad

