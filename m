Return-Path: <linux-media+bounces-57228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH7fOFt/xmlTLAUAu9opvQ
	(envelope-from <linux-media+bounces-57228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:00:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A814344A7A
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B028304E313
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2095F3BAD95;
	Fri, 27 Mar 2026 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTxLJmX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNG6qGZE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA92E8B81
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616014; cv=none; b=f4hz9q/LJZyaiyuncO0C2hXa7W/WUjWqdbc5XiWjTSqtcuBwIeCk3rXoMbROTaw1iK5EMjvhPhpjHG04ElIs04kUyXCpG6vyUSEr2ix+pIHy4DwDZIu/TVWkUgXbBw3kv2g8AZ98+/OD134HKGTstQ1sEF68Gk4aSwgBs1X+ObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616014; c=relaxed/simple;
	bh=82hBkgUQBRYsEeYM1Pt/3YAGZ95NIaM+aAvRhDaBC/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F590gE4d/dmjqW4Aql22XQnclOQ56+BR9IIl/KO0kCyJtzdQxQ8XRiVwlQZpdDWFuciwGV7JmIOF6DcthgDWM+z13lqSdGmvpjU/2A0NR2mauTmXaPNsEoIjWJl0gf8BHID3QNNWRiUu5jKF5JflNa8g9zw8jm9/KFiET5kf1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTxLJmX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNG6qGZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCEgEb731349
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=; b=QTxLJmX1xYvlflEM
	7OSRLyfE66HZq8dqabIU5HUK1AS5eKSTzyz8PLle3UkpqXOqMd7sd4NwzXwe2csL
	zTUjLkJBRLPSYs5XnNZ3giKZEcO8S+6X86yL5zglgq3QPRng33vJgIkQgaoVpfJw
	VpQ2Rire22tEXIyd263tPkOjpKBD4uYKHZSrr7KHNu/1vM6lJnTTtSUT+rr/9j1n
	6+7BwPpZx9n0eEJ7RmjUMP760lyzXTBwbrZfjKA3QNY7fazSVrVAkdk1hfAsc8w+
	IcgH6R5Hl37BGBmwAM0Cvz3iKqDySqrcmiDAdv8GdD0XZ8oEKr3JHHLMqVSKG3wN
	2IITsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q3d4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:53:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so6726361cf.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774616012; x=1775220812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=;
        b=eNG6qGZEP65LDmVMVQPmT5iM1HoHsg57gWwxyRfdTCLzUdSYIGzonPLMsosxQoYhhi
         lc7WZy29VHHpb/U1ZupsjsWs57xiBIsgcIGwdMGrXgOuLjUVxKPsEhiJ1EdSNZ2oaJ7V
         29rDHY7dqtuvHtWxATVX8a4E6x4eSUTMHAK5pCQTn75trTIz6cqMtNXor/kp+3xp0JAm
         WoukDmcuqp1lqvHnvo6zY9iyXYImoNOEMBV0PJ7ZjO58R2TF4Byf26/YvSJCUN2dH/nW
         dOsqwiVJ6Qwdv3/BAIEBVOHubABuEuRqp8oHmiBGOHPbUT99ESHsdZr7ldRyQHdz4t3F
         0FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616012; x=1775220812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=;
        b=ahJorui0OXdJyR/nim3fPPvBYWmGd7+Qdny9IKokpU3DIrKXBF87mMZinTst9TgeFb
         5mlhIrdMewTMtkTmwy8U2q27M/h79Yrx6aHA1yeiribuH732JFJsxTqu+p/PsYXK/H7i
         GlXRD/QPJS6bWzuurKjzlwgmRF8jl6JAEhjDu0V5/abnk+mtNMS7rFO3AaUaiPIiQfdr
         v/OL1WubVSJYEuvjMeWHloQExMlvEbxiaTNJOd0dV9Sfncbpp5SJ6QZzwzPRRwR/aPnH
         chzRjfhk4sHDN0uSDReRgvyrEyQvd7GGYt/hwTpaUBTX1muN6XFQYNlp7GGRmcNdKsV2
         cCNg==
X-Forwarded-Encrypted: i=1; AJvYcCUsNnmUy4ZRxBqUo1Wwj+XuYnh+q0hkRCoknorEOXMJUkOOcYuth2FbOrrkVv75Ohzq+B1y1jAzBoTsHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwm0Jp8Z3drBCWosZXCJhScdCjMZBnEKUvee41qGYjprDQU/xQ
	LSXCJGPiLwCfEnqBMVnQe00vroKHTOojikwPUTgsIliwuL2/apUwb/vQttiMZUQOZq1sDOLGN7N
	G/c2sDduRj0PVORcaa2ywqZuh2Z7GdRs4Jyik2R6jWUI8BIRo82mp+ac+C46jo0TNpQ==
X-Gm-Gg: ATEYQzy//yy089Upff/1RSp6xkRBaEBM7ycmQ05qYCCyYtmPeEjtS4+pwiZTp9zQEpE
	6i0sg3aGgu8/7w64941SoWKAOb1T+l63PFDcVtcFWXLYfxsZG10N7tFGCdr3THOXA77NRgtS76o
	87O7ZSf+TFH7D/CtxAC9FiDZcrtkfs08OabG5rhens7Vqc53VIZEJHY0rpThLUW7Dfaw7fFTSIw
	GXvR4PheS+EfKf0Zl1wCMw4HdMBrvfnDRigHNRLyvwqwaPjdb+gtgpk1ATsrFgM17cx8r2tinPn
	0AM45dmReWFV5tyVubCAvo2QtZh9pencNNhDkh+gTHDoNXToM5qYMvxu0Lq4CgbnU0RzkyIfqP3
	Dqb0DNLYLh0s/tKvY7BtZhN/P95py8CHKwMfiescr5JIfWoCuZcC+VAAlPC+ZTUP9ca8CgbX9yg
	uju84=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24443991cf.1.1774616011800;
        Fri, 27 Mar 2026 05:53:31 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24443631cf.1.1774616011338;
        Fri, 27 Mar 2026 05:53:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2029be87sm248918866b.28.2026.03.27.05.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:53:29 -0700 (PDT)
Message-ID: <66879526-15e3-42af-a2ed-153f9cfc66d5@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
 <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
 <471895f6-dc60-44d8-84ce-8ba0069110e4@kernel.org>
 <xSErLOaV_RuZ1DggWWH3WGK4mpUp_7CrvmjVU4ZZd33l60PWpjxiSGID27A9hHbdDYmghPXgZONyhiTJ_USPDg==@protonmail.internalid>
 <1671b8ce-cbf9-45ae-947b-f35d174be93e@kernel.org>
 <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: whkfQ47mYh5kR_LmUheWPsnVU3XalHn2
X-Proofpoint-ORIG-GUID: whkfQ47mYh5kR_LmUheWPsnVU3XalHn2
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c67dcc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=13ZpxKrbrQONVxPmPHwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OCBTYWx0ZWRfXwE008N5kHabW
 biDGq/kEm74ojFmX+oVtCqESFURD9socvHFtmhkn19Pc8RjpO9tBvVkwXLgqscCZW/lUz3gpBZP
 IcAAB66TwGNqLF01VbZsCI5vMJB9cwIbdY6gyDqlHmBPw1ADYtmTgD3B+vU4BQi3uRYD+40QIRu
 Az+GSDsm+46SA156DFcTLVKaqjyIVvvt+jwy80hYZgJvyFU4ewEvW5Q00JXNYTuQ24goOSM6gl0
 MFI2BLTzEfbRJ2lnfyL+lKxwKIuJhm9HFzrXFVyr72SwQOjyD+k7w+OvKPdydExWqnqgDoBtXrq
 63lGKfRMeIC4T0YqeSMoDAlMH7U+/DCHMW2VzJ7P+tuNXOS4P1PLB22qYv8G2vYmoMFPHzb4rDd
 Uvg3MFZBAOh10stXl07hnWk/L9Q7EvZumERtQgx6o//RW7B7AlTjqP8v+EawRXHlt/TmSGx+qdy
 o5xox6krTMa4gZ3OHUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57228-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A814344A7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 5:21 PM, Bryan O'Donoghue wrote:
> On 17/03/2026 16:00, Krzysztof Kozlowski wrote:
>>>> I actually got the idea from:
>>>>
>>>> commit fe6a952b567f6a771d087d2e969914f31574d6ab
>>>> Author: Krzysztof Kozlowski<krzk@kernel.org>
>>>> Date:   Fri Jan 27 20:40:50 2023 +0100
>>> If you refer to my commits, at least read them. Do you see children
>>> there? Yes. You have none.
>>>
>>> Plus trying to get 13 year old legacy device without dtbs_check warnings
>>> is different thing than correcting a recently introduced bindings.
>>> Terrible example to take... And if you find example from 20 years ago,
>>> it will be even worse.
>>>
>> One more thing, that commit was still correct because it fulfilled the
>> simple-mfd requirement of lack of dependency on the parent. I do not
>> believe your code fulfills it. I am pretty sure it does not.
> 
> Yeah I take the logic of that point:
> 
> CSIPHY here depends on the GDSC, power-domains and clocks we've listed, its not being supplied by any of the other blocks that live inside of the rest.
> 
> They don't require any resources from the parent and the parent consumes the child phys via phandles.
> 
> To my mind that fits the criteria you've set of !depends on parent.

FWIW the problem here seems to be the assumption that:

"needs to probe child devices" == "must have simple-mfd compatible"

You can just add a devm_of_platform_populate() somewhere in CAMSS probe
(or do component_device like in drm/msm)

Konrad

