Return-Path: <linux-media+bounces-49239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4BDCD3310
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 17:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C26D3001623
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 16:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F69D2F5A25;
	Sat, 20 Dec 2025 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ge4mEeHu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiArPAT0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB752E6CD2
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246697; cv=none; b=rD8BOXvvy/4qZ/EiGtwETMYr85j7+D2f0JOgb4nRo7c4CB1U/fwKtnGZ4QChcYmZ5VYz/PV9JVhWGKUzbM601ooF/4h4CKyBe//ujaaOuHngibXaDNQ7bUKpcHZSyHJWvqdVFDy0TknOKOjTj/Lnq8TyQb2wUfz4RCb2Wz3dSfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246697; c=relaxed/simple;
	bh=Zj78uDHcvfBFj43qii8vSorB9e8lxLSy2WRM2Cwuzxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2zsUr9syRgrCuA35Bp6OUVespA4pbzNqiEav5+1bOpIbD9tXO3XQTzyfOEgm4jx5R0EhNoJ3cb3NfbJGOjvP14SMpUb0Pb1zq4GHlp8jNBlYdLzMSmn3d4IehkPt6eyrSLaDKXV4g1C35huU5C05n2hYzTcdteT8/EkJVjcHgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ge4mEeHu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiArPAT0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBRk773649844
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 16:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmcZhBjars4zjcHPa/pL2zw7kJTeYDk3S1p+LVr9T3k=; b=ge4mEeHupeeoyP7Q
	LPAd6T6is4KfbjK7PyBS6TNFZm02bmfbxEqTu+kkvLLENw3r/9+XOmHEhY33gsg+
	MAU7xdEJBvkW6KYvhww+ALTG4xIBDxb3tLrgCxPKxOBJ2hTuxvgo3FjU4aLIq8kF
	eP27XmNCurdVWZxZ9/t+0Z5MfRJUsjf3xGK1Mad58J6UzK6CrilJj272C0qfDcy+
	DAKPpyVzMy/GVwPXIheXovI3zepWc02yiY24J3cOWZvQlg6D84KBcUOpW1QL1haD
	T2GBNCypgsCxgQFjFA95SXpbUpSOygvrcTR4hYBqTJ7Xv9yho27qu7K4qKzCxNaC
	QTgTKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrwrx9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 16:04:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so4914258b3a.3
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 08:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766246695; x=1766851495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmcZhBjars4zjcHPa/pL2zw7kJTeYDk3S1p+LVr9T3k=;
        b=NiArPAT0arzYyn9N9LinBhxAORgJHbWPKkQie96AU4co5SR/6ByE3qpzIpiGIOOLDf
         LqeMJeNCOS+0CljizVPcM7WegQIEqqFCpiN68aud/VgC4hCKuxdQCTWAmqfdiEEiQ8/a
         Yf4Rnwq+b/DuW23Q/V+LTWLzNRQz7b2zVa8YqoiVo9mMOkP+x262jScnhoMrZDm9fOxg
         w4Op7n+ljUIT8e/Bv7mAEunAqZ+nEvG1wczlypsbEQgscId+tNUvalvjsTIngaPmhwYt
         tXtjmj50B3puTUU6++ETDl0CQ3aZl+WmmpzHC4K2p6IUeNdXHZAIhVPmCOMpQwLCooqa
         e6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766246695; x=1766851495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmcZhBjars4zjcHPa/pL2zw7kJTeYDk3S1p+LVr9T3k=;
        b=qo21wQydxNbCPgVT46S5R3yHL3jh815V1NrZx0ba0k3MYv3bEl9y850KzlmszFZGuB
         VowzCaFWRkPoOnj/o+fO5bYLWqC6mJkzrX846owVDuytLIPS3Q8KPbiVn6O4f+xe6V2m
         ozUm3fqhN+/2t0aM12cGPyrZRnGytnnZB6Sj75LWw06P4wn4n0jyt4IM+jurMFKtaKLc
         JlpD60znpwT5E/ztoxgiX9jsIvzPKdOHX2WT+M2cAsJztasbgaDj5t2sOoOMIwrnX/07
         zNEOBcwIZ2RxMSKWnAhxDIZUw4AfsaEeos0drk4DtOGnvdgiXcBnDP1BJAYz6ThQl2CW
         Ey0A==
X-Forwarded-Encrypted: i=1; AJvYcCWzKuxNSvOW7KAEuOVNKRD1Fv65LHgs0k/vDaJ2Q5cNfuAIchIX9hw4LfJcPMCUs51U0GEMtzi5ctxbZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pxOaM2bKKND9VzqvahS9f4YxxBNrDR3ODCejPwbiLREwQGAu
	SrotqxWYF+ZqfQs5umfLuXcmDnluj4ClIr6QEjlYFCJqo/1b9VEDWuCuda6okL4EffpjAD0RpnH
	HyT5ffIUc56kWLpADsvcoqnTtyNu35KGa8MkKSHLHdA9hXWlZLMmvhmJnu5+6gIPnqg==
X-Gm-Gg: AY/fxX52ITg7O2n7OAh/vbxKwz+YAFC6FGLGHRjt0fAE/WTlpOkUPJA+AQUUoZhXHGf
	CuvX+NB//MzK3hPW77QwwHnxW3bPMIe88bzdlcc0XhKXPUXcFgeXmlelRMXWulMyQDjXWHoa2cZ
	cF8Vx1GzIFvbrkcsaonFlJ3acrivd/loqNvE5bP32gkjuI7u9KqyQUkgtQiLSCRjpDEYyKiRYTZ
	lYxw6wOZUJ8GUbbALIuZUjV/XVPtiXBwHC2NjIsQkmf7hVnLb2ve0Vhrp8AAJ+ZeGiDZmnmgVhD
	XvubRs7uMKGq+pQZzRE0lPJdkozPxFDEj+pDiNmX7v00Ym+pwr+4/T3k839L+lhGdXu+FMPuzx1
	tnE6ej5Ze/PQjMavXahskiIZZ54iDMY7lYN6muVT9
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr8505019c88.25.1766246694627;
        Sat, 20 Dec 2025 08:04:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYoKASIiDh1XJqI3CeJmoab/jilojA4jpnJzSooOYAC3DFbkpG6RKX+gYwN338b4mcKlBF2g==
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr8504956c88.25.1766246693981;
        Sat, 20 Dec 2025 08:04:53 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm22486533c88.11.2025.12.20.08.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Dec 2025 08:04:52 -0800 (PST)
Message-ID: <d23623b6-5f65-4fe7-b0ca-635e068e7c4b@oss.qualcomm.com>
Date: Sat, 20 Dec 2025 08:04:51 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
 <d1fb4d8a-608e-44f5-834f-fa92d487c75b@oss.qualcomm.com>
 <eff759a7-06ee-42f5-a3a6-860956d7ae84@linaro.org>
 <c2125dbf-bbef-426e-adf9-7767ad822ae1@oss.qualcomm.com>
 <2ce4e296-701a-4354-8988-87525769ccac@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <2ce4e296-701a-4354-8988-87525769ccac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rhLaFdD9j6vujRvhtBRW5--w-dtSUgJR
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6946c927 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6gem9hBlJlRA9BxbBQ8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEzOSBTYWx0ZWRfX3OxbXnGi/gmS
 DWg6rze75zukR2/PeEMQmu2MOWVcZ4XRM/bSLApGnWyZyp87Gcv+nhKvcenX2SnJ3VI+mMLDWh8
 T+co6DNKUm3O2FV3iri35bvZwlwKM0XYkHijjpS6XEfywNlh6GjxaBIPc5flH0qG5S7tPgJqF0e
 /I4zgp1vhKs4pWAF6oJIuvzJNu0UHZs4uN9CkpHnQguohEakXBnWUnGoRfhcntPOOKgJ5NwJhUS
 W7qhEGHogwe9ul+C+XizAi+9lGQhUWxF1Fn5lYLGp2TNQZ2sgvUXWrzCNsGH+Pt2sxuBmKxmcFB
 NXyC/C4I/79bZQ/s1lxhUzG/JfquY70nBL7SM16/AmR3UCboSgPFjswqTCzyYmSqGN1y+lGmBfl
 rlu1CGD23IXRjvTK06IKlel5oZSgMbkvRWxr7th8VUQSrN6Euzhj94sccSOn2+UjTnEiX3YXYDC
 HGbNL7b73/QiuBbRGRw==
X-Proofpoint-ORIG-GUID: rhLaFdD9j6vujRvhtBRW5--w-dtSUgJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200139


On 12/16/2025 7:29 PM, Bryan O'Donoghue wrote:
> On 17/12/2025 00:46, Vijay Kumar Tumati wrote:
>>> I don't understand a reason why to do worse for the upstream, when 
>>> there is
>>> a clear and feasible alternative not to do worse, thus my 
>>> misunderstanding
>>> and my grief for upstream CAMSS are my concerns.
>>>
>> Thanks for the comments, Vladimir. Bryan's and Krzysztof's argument 
>> was that the bindings are required to describe the full hardware 
>> regardless of the driver support and either way not modifiable in the 
>> future, so they preferred having the HW properties of the key 
>> functional blocks in the bindings. And we were specifically asked to 
>> add the properties into this node in this patch series. Having said 
>> that, my knowledge on how the bindings are handled upstream in the 
>> long run as the requirements evolve, is limited. So I will look for 
>> some expert advise from Bryan here as he strongly advised for these. 
>> Thanks again.
>
> I see no technical reason why describing the whole hardware block 
> precludes any further work. How could it ?
>
> Anyway, I'll repeat my ask to describe:
>
> - The full register set
> - The interconnects
> - The clocks and resets
> - The SIDs
>
> ---
> bod

Yes, it is what's been done. Assuming this thread is closed then.

Thanks,

Vijay.


