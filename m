Return-Path: <linux-media+bounces-66862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sBb+M+wYTWpBvAEAu9opvQ
	(envelope-from <linux-media+bounces-66862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:19:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0E71D2D9
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:19:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PlLhrtPo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ReuQfIiu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66862-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66862-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A08443141801
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB7A36E47F;
	Tue,  7 Jul 2026 14:51:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391E34D911
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 14:51:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435875; cv=none; b=nJmwyfSf6H+p63Jfk979OvMA+a6wxvy4kSStAvJuJoPCpkNNUwZu/qJBTFT/skIXLBIt2jH7KOGnooKCoLd6goMSDFbGVPRvxgx9L2/8CMW5pHQpofK9TLlv+5TCuy7ICWYloUZU8GtBkNs04cqXW+oSBN0SuT0L2AKkkiCNl8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435875; c=relaxed/simple;
	bh=RuEaLadIoZsuJyS6ZmkPuRWYcQxb5NYbj/XZuDX8dGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEXApxzp99SQtEjagxSFfdCa66LVWkJycByT+iVJp0+moVKlahe0DgueMljN6T5Dl4s8hi3gScX2eSsOnAAWY2WBDwAJ9rJwE0+mfvbLgXRiiFNGoXdl4ZoABMSd1flpCsDFOgIk9rfPvAzIyj6gXCWy+6/o/cnYVo/VMmgvQns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlLhrtPo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReuQfIiu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9L8G3740877
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 14:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=; b=PlLhrtPoG2XGfQwL
	4rgO+c1M5c+royndMjQkIioTQdMavHjNcypq+vUq47rfP+FlmO+bEW92DRQ/6/h+
	peu+r4mZroQNbvESHdytzd1uDAjopmuxY/VhQ86ericWxHiCfH/qvVDGm4TR5DiI
	FyQOCvHWQnPyvIwdYFF0rPgbx6/NO0/MD/KuCg77Yxpy1aEKrkkSR2nI6wXgnl/y
	VpXwQiJJdJXLNsr3fVbbUxnGcsPjYmuggY+wFekr/9si8wc8W9NSVPaLkuR8AASk
	mW5dBZsrHR66C/dZc3vaMGrq1DvbgvHINJHqr89lluvdjNT30tGmUhiJbtdiSFAh
	PORlpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9aa1ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 14:51:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso56101761cf.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783435870; x=1784040670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=;
        b=ReuQfIiu2lE3HtAHjX6DLaAw3HorkfEJfkwDxBLoBB74jbJ+XdfGTdcucikZE7fOag
         4ZDFE0+b065Q6MbHnxXi/atqBzd+e2b1taysngfjCWCyWgnWlQdVzhiJDt8KeWRVTsKT
         xo15sYgV3x18HB9I2ex9iZLu26ndHsFvaBMiGrFgo+eeDMWEsmfkuBlInm6jyxuqFMcf
         uBe8JSj0si7dLveeNwVYNLM4iVqga0pnYtVZI3MMk51oed62r+uFKsVSv9/7XHbJkhi3
         O0kVzDW28ISv9M0sYtD3MnQG9U6e5J3rz7uCkh61mPWOPUQ41AjynHBdyeGKf1MXDJMU
         Uj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435870; x=1784040670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVQCOXxDOJYdfBM0wH+7s2f+TFisB5ucH9qGVZf6tTY=;
        b=a0jOJAHA6XsU///8W/GCvhp8G1yMj7Ha56ag0CAGKyZfjhoV2uAFHsE1ssq1KegFHc
         YBBcIm0AbGLRa+hBDSHIOADuFK7LcVkUzkT7T6eb9LJlzUeASrJxNwTdAin2inxtZaCh
         l9q7dsfAmruV54QSTLO/fAPFdI9975kWV9e+guHtCeoVK17v7CXsTSERBA6KkMhJbEb8
         +JWuo92kLSw4xuy0mH/R716W/W3/Cn5h+r7vyCiJS3/98i7NUo9W/1+g2us+O7VrUzeJ
         HdvO+etbbliTNUTfqZkksebRJPVrP0G7hs0stzCe0Vsa9m4L3uulGU7hA2QCQhjLSwgX
         lW2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp9JaOHNCQ3gBf+owHj5EXsmCkoPH2vk6fQdKaXdpEx7evfI9JtYhL+xT8sePyopB//vYdCZMDg+PcZTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfJzsvm8Sif8OmPnnUGibeEnVxYUDBrggDPV/GsFyyJzGG+jU3
	DhXcePoi1NYya7UkWA8M4O7/MBHw3Y1vbhldcEGiLlpd1nrDdnnzMsl8m/5Hhv9h3BGT9h0R9HO
	Todw3uYez0y80+yZ/y1kJd+aDkGIYkrcCuGNJrNVPKvWD8jyoM8ywIYiubxadbBmg+w==
X-Gm-Gg: AfdE7ckSB3NhHGBzg2uDFcbjRMM4ppjLG0M0sqSK5RoEBLpWm4bolu8Fu7PNtmvOLN2
	pkZiRUaWQrywELtZsA3qC0RLqWzeb5t5wDG6pnTqmmVsImG9zUYjmWZH9mTtFnct7yFXT0thZMv
	qiLbUTOx3pStdTruAHv88FEJqtzUjfzzxEhY80Dev3hZCtEPcSCTgOhpnup6pZJJbwvKHpv07mD
	sp8R+VgOG/pt6yuwJHGvcUbdVQjN0lOjebGS1J2ZkFwO4kjWAlN+v+xT1DpG2D+iSdGnpq9K1uz
	UyQ362Ux4T+rYsTB0ckSIYd7xmTg3rrLTDy/FYx5pA/oAjdTmD2cvLHxe/YGl+fKWP3nD7Oruc/
	hLRS2gDXPTonXaYVRCBqamWvm9HdmeoOjQY4tU8e1bQnHxzelQBzTmrhFgpcETFGpLXvJ7aOTIK
	ci5mJoGfk=
X-Received: by 2002:ac8:7d51:0:b0:51a:8c9c:7f51 with SMTP id d75a77b69052e-51c748df6e7mr57992611cf.68.1783435869246;
        Tue, 07 Jul 2026 07:51:09 -0700 (PDT)
X-Received: by 2002:ac8:7d51:0:b0:51a:8c9c:7f51 with SMTP id d75a77b69052e-51c748df6e7mr57991801cf.68.1783435868305;
        Tue, 07 Jul 2026 07:51:08 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada05d4dsm156219366b.49.2026.07.07.07.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 07:51:07 -0700 (PDT)
Message-ID: <84f593f8-eb28-435f-9458-55aff899dc1a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 17:51:04 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
 <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
 <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wtt3e40HGvty2DiY4oZ3kmp4EXptFcSi
X-Proofpoint-ORIG-GUID: wtt3e40HGvty2DiY4oZ3kmp4EXptFcSi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0NSBTYWx0ZWRfX+sr4VfEJic54
 tuanHZCTg1u4O+9w6WcECTpCRpaNWetmYz2Mp+gzx2ztk8dzG89QHjpmh9bLLv1AIQRaTa3mvPP
 AKAirOrtJTmOQLG2iwI/31hTNfLoxHw=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d125e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=MVBuJk07v-XTMpK2hJIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0NSBTYWx0ZWRfX8udxhJIm2bTU
 QuMkqAyxS1/bjOfN9pklgePP20/31lVmyXXRyr7HX4yniP6bk9C9lMQ6f4lxwgI4bBbcP+pkSsU
 7OldXJiUFrpKKc3jnl3Z8FyR3GB9gk1GZRUIgPa9Eb0L902PiKOAR22vSNt+Zb17ERqh5M8L//s
 F0Wah07bNDGfGRwFKDM10J2M5PdXaTo96YJUNYsCOiUfIM5pe0us9kErzO7jt75U1g+i7qKPzSN
 BY4A00gncH41uUW5gp6f2MrgwDaMIQTpGl/BftM67vqY+vxGxTpmES0Md/VTSW4HgSRJzdajEJ+
 xVr9F/WfYHhoGIrP+jSBUptV7JvMKbHVKRlPayNJku4+cd5zCnQh9YAfpcFm/KeN/Kye69M50P8
 FFNPBeG/nOf9JmZdV8PPvADg3JHcVSsHsLvi9ZkLPEQYZlD1HdJczoN6oVZeh92gd+Xq5HkZMEH
 jmL7JkAImkNwKS4bbnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66862-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BF0E71D2D9



On 7/7/2026 5:47 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 04:47:07PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Dmitry,
>>
>> On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>>>> Hi Vlad,
>>>>
>>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>>> <snip>
>>>>>>
>>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>>> +            interconnect-names = "cpu-cfg",
>>>>>> +                                 "hf-mnoc",
>>>>>> +                                 "sf-mnoc";
>>>>>
>>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>>> the device node, they are found and should be allocated on parent's side.
>>>>
>>>> The interconnect has functionality to handle bw requests from different
>>>> clients.
>>>>
>>>> Yes the best will be to have camss interconnect, so jpeg and other hw's to
>>>> vote
>>>>
>>>> on that (actually it is possible in icc framework) but what is the benefit
>>>> of moving
>>>>
>>>> those to camss? Is it not better to create camss icc. I understand
>>>
>>> Please fix your email client and stop inserting extra empty lines.
>> Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
>>>>
>>>> you want them to be on parent side. But how to vote on bw? Most of the time
>>>> it
>>>
>>> If the driver actually votes on those, I think, it should be fine. This
>>> patchset seemed to add bandwidth voting, but then it dropped all the
>>> votes in the last commit.
>>>
>>>>
>>>> depends on the jpeg encoder configuration based on resolution format etc. to
>>>> set properly average bw.
>>>>
>>>> So i dont see how that can be done with not explicit dependency on jpeg with
>>>> camss and some exported
>>>>
>>>> API's which we discussed with Bryan they are preferable.
>>>
>>> Interconnects should be fine to be referenced here. Especially, if JPEG
>>> has its own port to those busses (hint, commit message).
>>>
>>> As I wrote, I see a bigger issue with the clocks. You need to have some
>>> API to vote on them (and then let camss driver aggregate those votes in
>>> a platform-specific manner).
>> Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
>> for the clock voting.
> 
> Please discuss it with the Camera team, working on the camss
> improvements.
Thanks we will discuss this topic.> 


