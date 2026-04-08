Return-Path: <linux-media+bounces-58215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEtSG08e1mluBAgAu9opvQ
	(envelope-from <linux-media+bounces-58215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:22:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1630D3B9CD7
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2560E3011BD9
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 09:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9C738D01F;
	Wed,  8 Apr 2026 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9mm7gNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pq9N7UCb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8CC2ED154
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640131; cv=none; b=aAbkwUP+g8QoGG5vwhTJYb8JgQxcomJTkiQ4oH3tuH3pSz8JCH1d5yzJzB0fW/45E3luGPtedUUeklERzf6hz8FspCvm9fb9jFAr8ZOPSFy7ihAaLyPuV92kTFGX02lqrzhtx2KZ/jawM2rdp2vYA6voEFPxau0vjq0zFOmPF+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640131; c=relaxed/simple;
	bh=CaCOw+FOn/9ibHf/CcV3DwaYq1XmV5omHNJnbQgrU80=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eyeOubnDyPGO1yuhxWg4jd0Wp/rAhibR2RIN3DTpTDnPuqXv1TfMYTaZQ+7nDwk8JBficxt4uB3YTUbIovbJAbedKCnvlX4qjf1pGFksU7ASk9pdCl2q8aO6qUx5D+kkCF4TA2fE5FxkxcyMMZk1V0G8z6j9nc/73ob6IJJwe4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9mm7gNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pq9N7UCb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63878EEB2450585
	for <linux-media@vger.kernel.org>; Wed, 8 Apr 2026 09:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZwcBaToOf/8n161Gf40G4dnCQ4ssxnv1Gh/fTyACVg=; b=Q9mm7gNNj8ngkGb4
	EH+ZCMbnuSOO7SxNsgeP42WOpVNYjhXe0T2Gk9s5jW0hHBBuN9TlKM/hoUp0K9jG
	hh09rXHoOMbcAJYPqSOQO8acA9g41JClqqYYtI4aR+j5YGZ4QAqEcQSObKb9Qldr
	DqHOtsqAyLRrlzuDxJxNLPIdGVCkuvM8UJWga4JX42Pzj4ibFog7wWTpO+58f8ca
	q+IVUNSFfjLbiOEF1lbVssGQYOBaq/fDnml4fLhomdfxnz42H/p2yllSMq84qdyS
	Y7ejAmWgWlNKjmrY4QPFRvm4SiQQjgg5glpSlAOdbHbXc1tohUQBkOupZM7xBiRf
	3ky9lg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae6a1b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:22:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso13673128a91.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 02:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640128; x=1776244928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZwcBaToOf/8n161Gf40G4dnCQ4ssxnv1Gh/fTyACVg=;
        b=Pq9N7UCbAHnSNAN3V9x3wwMXB6ycUvr6YzAlzD/IaQWrLVL1xroQnBmIvhDjDQoHfv
         8c52kd67LHcIImLUpJES4kGtjJJoQiu5mafpGvj8BXIoMk/VcIiYCKDt3k/ngC8UYvcS
         fTfgunQpw1r0HNV4tB0I7oiubSD3Xb0kKmmxJHOPyRJROOA0WbI6Fo/KjJtAJ89teJSP
         7xJmODNv3CFvWyPTqYM0HgnpZXlGi7iojgT7VSjpO82Xhd7k4q/WkkvsuFWn3kqlFkOn
         3lcK7objgrzlcMFhP99gBuxorG6z9HaqneXIF0vp9PEDF7EX7e5lQw1MQ8hmMaew3vYZ
         g12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640128; x=1776244928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZwcBaToOf/8n161Gf40G4dnCQ4ssxnv1Gh/fTyACVg=;
        b=lE53BcddwTSBaV2LbsK76s9+3D0Jn6xP8jsOZO4MR5K8z7eYZNWbVCxzYPJXsz6L/Q
         5BnucGWdqWcKJ7DxMU1mJKEcqGrnctrh2wo4bPzJ7jo/WiRqifkXqxj8DtSwRvjHyKNJ
         bRs0ENPHqpHk140jNqIYX+89a1EJgUF3cPs7nM3JyocKl/IMvZ2f9/ziAkDSF2U2OWGs
         oPwuuXkEgRsN6MeMay46E/RNdkoIOiaLDrwullcCN/mLPk4rFWxnZ/95Hyp7QNMMlvJg
         nx7E6Z9bpwuxpuO92LZzw9z2h2muImniZRp2z7yCDXji6nH05ZNv+4J8a0fs4dpA9H2h
         jCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQC1Mo+6DQUAE4YKtklcz2vDQy3qMaOt0MU66iZfxXz3Md9X6i9r4ExDzWLpchNI6BiVicgs6JPsHZ9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxs5VeS7etEqLCpcebN2a2R5PAI041LP7p07fnVjAwiozqpbmh
	8QId7XB3H5CSO2VG+KfQIEBZ4hzLZrM5oy5lDGN+3hLyt1Zff85NVeFkYg5mW+uc0xQzOivdnzl
	d3BkwdDPH0RCxb4DAWx9OAT644xqi2uJ3j12T5WV82GmryflF79LqxhSkPGDmBmdyJg==
X-Gm-Gg: AeBDievidGTzdBzJyYzKbtddhAByjHoiBNtiX6BftQCWVjD4YDWZvE0gUtT9JECCCMf
	fqFhCgA5yX1mJgXmerwGV8NzzHtTcO+y8gCiho2WwywGmaRYBeewcLCDSymBmOHNbEULMO7CveH
	q0wICjHABAAf1jbTtGh13VdZCzuVqZUfzPz1yYkY+X/CxsiLn+bzDjNThn/0aGxscZxixekzspM
	XVX21Z/JsO86a8wo2mUdth30arpy1KD5RcY8q+9LzWc26WYLGE3zkmutIMhzVI90kyvOczE6/NH
	A9oS9fZXPdW6PE+UYdp9Qo0U16DpsFAw1Xe6EGTWxk6IgJpo74C7JZBy242tine+uo+7GWfryl5
	zlGzwBKogESs/VRpnpCet7I/FOCSybZ6L7SKAxs9IoT2ggDMDliA/ufBXGAOlllnO8+emMeHCaU
	YHnI8JaB0EJy+oq3w+
X-Received: by 2002:a17:90a:d403:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35de67da841mr18575721a91.4.1775640128277;
        Wed, 08 Apr 2026 02:22:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d403:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35de67da841mr18575693a91.4.1775640127862;
        Wed, 08 Apr 2026 02:22:07 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e2893b3a5sm904472a91.7.2026.04.08.02.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:22:07 -0700 (PDT)
Message-ID: <eff7d213-bf02-4971-8f15-0091e9d1c1be@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:22:02 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
 <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
 <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
 <fe1379a5-57f2-e618-dbeb-32d1c3c7536a@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <fe1379a5-57f2-e618-dbeb-32d1c3c7536a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX3oELo4v+lowD
 YHk73QwtcavOshXYieWywL4cjT3L3EjT/HYoM+SGQ0G7VOnUbF1OzwcT+YaooinoKxOGMOVnkmc
 4cquWxohr2ax0WHZctfK/+uA22YHmpmXSv4rOLLFxU4Z3BnNGMUSVJ+Z3eVedpl40+JYw5YOvP0
 C/bppgfT5FJFnthJzpWw83dL/MVimafHfFhyjNOCT+J0ivWhMv0NWfAnEDjLAMDE2qbAPqPQw8L
 R5V7BV9PjxWx0gR/OlPk2L6EonbZSc2O0JSPPD6s/GJUBoDDOSiwtLY8FvlxHLe1mZsitNr8mDq
 Vvce69XSoW2IRDxkanyTNGYL1WhkKlcPy18EEGYnA0b7C8PsilT4nNv2oJ1nUc2qCu/uFxtB+2w
 HSyAfnRohEc5ugAhldGzeqUrv5jZ6vnPOem3x1r4BCVfPWigu9ufRvSfDiW4LFMNmNSWE8Ed5kV
 L8ggtAhAwEwsmwH/LKA==
X-Proofpoint-GUID: 4aNEjzDm9S0H6qIABExxlCFMOPO3ZyjS
X-Proofpoint-ORIG-GUID: 4aNEjzDm9S0H6qIABExxlCFMOPO3ZyjS
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d61e41 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PSu0XLzfcwXA4wXBFNMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-58215-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1630D3B9CD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/8 17:20, Dikshita Agarwal wrote:
> 
> 
> On 4/8/2026 2:47 PM, Wangao Wang wrote:
>>
>>
>> On 2026/4/1 20:40, Dikshita Agarwal wrote:
>>
>>>> +const struct iris_platform_data x1p42100_data = {
>>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>>> +    .get_vpu_buffer_size = iris_vpu_buf_size,
>>>
>>> this needs a rebase on latest platform rework series.
>>>
>>> Thanks,
>>> Dikshita
>>>
>>
>> Will fix in next version.
> 
> The rework series was expected to land in 7.1, which may no longer be the
> case. Please hold off on any rebasing until it is clear what the correct
> base for this series should be.
> 
> Thanks,
> Dikshita
>>

Got it.

-- 
Best Regards,
Wangao


