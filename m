Return-Path: <linux-media+bounces-48325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A083CA77E5
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 13:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 410223084A87
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 12:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2BA32F76C;
	Fri,  5 Dec 2025 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9VjNx5d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3Qx2Wzn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E53259C80
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936055; cv=none; b=gVAkVjm/T3eTL0LKmprDIvufrtHH5EUWZjlrHobE6L4g8aVz7q3Sv6UfY8MWK9uFdsN+1AK+fNjsLJgiNala1OJrLVWuRTG8dclsXpdZF/3csRkozxTcFo3PLm1dsNtP3GJN9Bu5//ydy+sr3iBMxNl4tgVdOzprjCOyNCi4m8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936055; c=relaxed/simple;
	bh=5GJYnPeEXYloCmknrlsTIN+1ez280CnAJeaeZAgoVMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkxfAmRm7ml2di4U+h3IAb2P8Ju5S05XLGAYZWyBpK7x8YiktmcrGNiRRzuwekRhLP57Tv/52XFsBHKWIc312KFqdlaDvhQWN01KLSptfIo14gwVnt3uFV6A/F3QB2sDBVHC2k0vPDZGrwCkFiKUegDdfSiUyHPCHkRN1Oo3AwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9VjNx5d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3Qx2Wzn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B57ueU92408066
	for <linux-media@vger.kernel.org>; Fri, 5 Dec 2025 12:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+9AN/HxdHG5JU3qIa6IofBm9MTQMtmCFXG7ehrSIBg=; b=I9VjNx5dktPJBIbH
	SGP4LpsRexqizAUcMPmmDNz10KZg5qRv9xGwWoQXC4N1kXrKcaeT4HaqT9Mu79my
	fHGi/Mox9vu1t34j1EZcnwN/9ZgutyeDJZlyTmPCsvp8kO69fkmgmerFkCrWd4nP
	XHsX9TLflro50QaLUtw4kFLKHxWAzmQR1xlFfxlB/45+scf4eoatbhcSZgkBsvxo
	42eGE7jn2l9ePivBF3WMUAenGHCG5rAjvLbl+WohVton3y03SXXD8/HOcAESQBBn
	ULQpvpnAgKlvSwvE0IFdJIfQjci5FybWfMjRqZgMlTwlme9tlasC87T/NLbPzdRF
	+DTLlA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auhtya53e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 12:00:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so5154831cf.0
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 04:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764936048; x=1765540848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+9AN/HxdHG5JU3qIa6IofBm9MTQMtmCFXG7ehrSIBg=;
        b=g3Qx2WznfENg+IIMcznVoF3Xspnp4nw8A3ZkDslj9Y75ALE+CbjoWQ7rqACJcNBi+s
         UtHdviv9hv5mQUUDTEiYuRULj1N7g+HlczaSRw+vMaAQlo346pv+usYxeQ89it2Vk/Ie
         jzJ3sbEuxdl+5QQntLVe7dPuSD//Ks2XLM5hq/ETXBdDqIPqYxxt+QQKW+Nx/gDcuJLS
         gcrUI2+m7MeD1dbE6H8iPuQZMKjjIoCicxe5wxbHCYDIbcY4v9hYf3i7lE8PVnA3WGgt
         KeCCJpUCX3YfFEy3OF5xbbAGDlePnL7XV+Hf4NqthpgVDmsBaKKq2YbTbly9Mxq5USDP
         vy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764936048; x=1765540848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+9AN/HxdHG5JU3qIa6IofBm9MTQMtmCFXG7ehrSIBg=;
        b=mxoZRE2lyRkwOJlCtFWoEFzO3t/zVpuACUI6XJygVUsNTIkrdxHNksdTQVYTD4OQ0x
         YWPeELr60AM+jBPnF/ZIraRKVZM5UJ7miYvPk/y9RkLK3Je0mSTN95YI4tDMt+aIP7yp
         hX5cOAUQY35LFIpjvu19WnyZtIG2/KOPTLNNoQbMrFEZl62ei0qjdhX90LzjkufWAtDV
         hpcGUbTyZgPb/Lo8134XV9AjooURrettNDEKXoKKV8vC3/OwAvs4NZCX+GWeIMixq6To
         g9qUXnNcQzyhdxmN2Wh6j+czRFw6k3LSB8iEcURa3fdPIXCepJzgtuALDwYNvyHcE6lY
         Qk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiqJdEAXwICIzuFFuzFfuNIJC/gocAIxchLmtw0HCt9Y7UO06e6z9agEGeU5lTwpkprhRwWtJlA5TUDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfluzKrqd8WRGSyjxYu/eQstiIRuA4JRYgvWoTFPQ4Z0pLMt83
	/5HHhq6FmR9ufijxk1uVom4BKUsxqiA3edt9hpEgLGIgIOhIv8+esHMtfWRaBWgJO3wO9Fb7Lx6
	gq5inPe9MiE9mMxS4zvVT4DXdhgPxr+CiMC5jVR4AhRBbuwc+4/LYw6QD5S46gV7RQw==
X-Gm-Gg: ASbGncsbEZMMLMi7DlKDAuzc1ux7yZ3zG1aBZwxWzYMG4E2FHWXVful8+Aq90qB6S0+
	R/FLuWMuusmyDR3Z9Jh6uZ60BYZJEt/o1QsMzu4TYhFft7LggL5lEQWAjWYYHQ5o/+TekrRsndH
	Wfa7SHeMO95qonXi2hoqx69oBXVly2JNVwY3kOfrsRATQFxn9FkelwrCkGNWElGiKSroGEGdr/0
	wBwQpWzvo5MX4PFPc3TPJ92YD7NMxEa4f2IhUhJWMQW/UhXx+Jczht5V/lmWaxFCoF1+zIQqZju
	a3OvcgSkGjaPAI5/AnAtO9WXfTsnSTE/cnlwoeS93sLFnrAN89ro1iEhTXsl7t5lXsWbnkYSpUs
	g59ZLLCnUyHXNiQDasZJwo5NCY24wM1u+MQaAmZD0Lv7xEpFAi+XhxAmgydnEbC43Qg==
X-Received: by 2002:a05:620a:448e:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8b5f94f51d0mr796612485a.7.1764936047307;
        Fri, 05 Dec 2025 04:00:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4YCoMEsE/aEBJ2TvQLIePmhNsDzgggaoMgJ7OsQXvHMsZAMZDO44pmTESXMg5rtykjNpNsA==
X-Received: by 2002:a05:620a:448e:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8b5f94f51d0mr796600285a.7.1764936045678;
        Fri, 05 Dec 2025 04:00:45 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2c5575fsm3700985a12.0.2025.12.05.04.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 04:00:44 -0800 (PST)
Message-ID: <f04d27a2-88c9-44ac-b4fa-33059a9806b2@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 13:00:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-5-6b35ef8b071e@ixit.cz>
 <b7fac86c-15fd-400b-955a-c331c8bc681d@oss.qualcomm.com>
 <03c137aa-bd31-43d7-aea8-489ec0102ab3@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03c137aa-bd31-43d7-aea8-489ec0102ab3@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NiBTYWx0ZWRfX2qmY2r187G+D
 DR28GzCm0ILipLhwDHLbj0YJITLmgH++x0FnPloGIrslZklv2otv+if9qzZYywJKby1ntgxWd4h
 733mrpf6JrOhdDWAwlvPKeQ+2XReuJuUaQ6sNuulGMqkgfcyCnTjhQ6y76Bgb2EQ0iK2ilWliGU
 TdIXbY24eznFC56/7FnPO/tqsgSGVxqcLA+Tz6BxJwL/+zu52Dju09g3eAHqCX5XKSv4pYOBl+R
 jAYXzXbU3Q17qw/WWUCRooBo91V0oMCVpgEf3Z8RKdYzHdxIZ+VRo1+LLIYISTAe++QcmC/mIBi
 g4p0FvHQxESjWSKt1XhPVE1IlW9d5dUPu4eE2aorjNKA07iNaf7SgkVxPDsOuoZdsdXKBsHqOlm
 eW//WpAEhRqbxm7KkR0D4fputhsq4Q==
X-Proofpoint-ORIG-GUID: 6cOv-Ay0SsTXWMfSLf0aoe_Ha4_OsjIG
X-Authority-Analysis: v=2.4 cv=DplbOW/+ c=1 sm=1 tr=0 ts=6932c971 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=LQYBDm9UNitWhpxzWCUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6cOv-Ay0SsTXWMfSLf0aoe_Ha4_OsjIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050086

On 12/5/25 12:56 PM, David Heidelberg wrote:
> On 05/12/2025 10:54, Konrad Dybcio wrote:
>> On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>
>>> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
>>> Gen 2 version 1.1 CSI-2 PHY.
>>>
>>> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
>>> mode. This configuration supports three-phase C-PHY mode.
>>>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Co-developed-by: David Heidelberg <david@ixit.cz>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 74 +++++++++++++++++++++-
>>>   1 file changed, 72 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index 3d30cdce33f96..7121aa97a19c4 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -145,6 +145,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>>>   };
>>>     /* GEN2 1.0 2PH */
>>> +/* 5 entries: clock + 4 lanes */
>>>   static const struct
>>>   csiphy_lane_regs lane_regs_sdm845[] = {
>>>       {0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> @@ -219,6 +220,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>>>       {0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>   };
>>>   +/* GEN2 1.0 3PH */
>>> +/* 3 entries: 3 lanes (C-PHY) */
>>> +static const struct
>>> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>
>> Here's a downstream snippet which seems to have more up-to-date settings
>> (checked against a doc and it seems to have changes made at the time of
>> the last edit of the doc)
>>
>> You'll notice it's split into 3 arrays of register sets - that's because
>> it applies setting for each lane.. something to keep in mind we could
>> optimize upstream data storage for (they are identical per lane in this
>> instance) one day
> 
> see 87c2c2716523 ("media: qcom: camss: csiphy-3ph: Remove redundant PHY init sequence control loop")
> 
> for the reason to flatten the regs array (thou outside the scope of this patchset).
> 
> Regarding to the different value, I can test them, can you point to docs regarding why these regs has been changed and what the values means?
> 
> I thought it's some default seq, but as you show there is multiple versions, it make sense to properly document what these regs do.

I'll make that point to the relevant folks when they get around to refreshing
this driver, I'm not sure I can just tell you what all the magic sequences do..

The high-level description for all post-release PHY sequence updates is pretty
much always improves robustness as a result of "more better" electrical tuning.
It's also the case this time around.

Konrad

