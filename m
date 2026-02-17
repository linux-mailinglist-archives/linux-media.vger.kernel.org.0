Return-Path: <linux-media+bounces-52989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHYrGlyvlGkPGgIAu9opvQ
	(envelope-from <linux-media+bounces-52989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 19:11:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D090E14EF38
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 19:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B422305556C
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 18:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCDD36F41C;
	Tue, 17 Feb 2026 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rv97gS6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3g0IeA6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95972BD031
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771351808; cv=none; b=Z+Ow04tAmaD4iPpcS5JFTT9dMFe/s5koBBG0FrIVVI25eAv8QM/xTVl5SFr0mmmcV4hnvbsgXCy/dnpBnrvjjMDLG+eN6SuBNhBa7htKIMiXtBVFYk8yCcK8qBNhBK1ktB+JeXQPPVZ+v6PN8JTc6fyOCMdjiaVpZea2XDpReiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771351808; c=relaxed/simple;
	bh=twduH7+XI/JCNr4DbEoc3oFf6uD4Fk68CE4dpH6GPwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TorGsdN1CAtWiILyWGgP+sgc56m6jxqFNC+lmTiqhFISJYTs7shvmLvU0b4K+kx+ui1Bw9F0mYT2joctTidpUpEQRYB70ChtG9fe6A2SKBNX/3MDDnYS9GOq8gG2MiAyYAU8ph2VBBjLzd9tjQv0Zevfan3i5SqCH1PgzTt1pkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rv97gS6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3g0IeA6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGuvDx1545248
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 18:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wk6kq7pf8sOUgb4FnoFQG0q0zp4jil34CrE6zW4xlH8=; b=Rv97gS6v3Wa8Xo/E
	S5DQsIuW6q4ozsMvpzh7WUmG20GECXnNIBujZhsSP8ObUWmutDdibJg12QZuwD8R
	LnyGZIdh1a6p+YF6d11IfcbzT7WFFLZ4PsNhENbxHBPrXp9ZyMOYooVcx1ZRgDdF
	o+9GpcHJlyZYalzyDsZww/4gB236v4USl5NaNIAGD1rFMnoSNKrdOiJYJXIDoDU0
	51tIzeMddkqmTB2dn9DBCKtWSkC7yfGjZeyfkPYXRuKpQh0fKNfyiAs5pIIvCmzY
	ar4PjK1pD7oLSQ6ezVD8/2Xg+nhj1NFqMExhlZOIYUprULSQgoj+/XSOeAGWIb7K
	k7/OBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7aju9et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 18:10:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab0b2e804cso55180805ad.3
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771351804; x=1771956604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wk6kq7pf8sOUgb4FnoFQG0q0zp4jil34CrE6zW4xlH8=;
        b=b3g0IeA6vAHF6wX2t7Qh4DCbxMOBDu8cavNsoIzdp3Qk4q5++J8qg5OwOGIgWY4gNg
         +u8XHyyBqCJiO68e0HTSm/FD75DKR/CpB0bVUrfYCi5B9LTJC2Zy9ype9Ig5xzHpEhsa
         ke51wLql2Yn7YLOG7vGpPl6EUepSSjS2frQvmiaIFaz7coHl3D20mU3/hMyYtpgrZC4i
         acuova9S4IWJEfebSt79gBrBdy5YtlTiQjDGRrFFR1Qh2rWxaLZtPckfdiTP1odI2Eux
         CW0+dLmXJ4h88R4jo8i9h7IKPhee3vsG7NC+V91UEl2fb2u/LUmtrbIY+45DI0YSXekc
         +LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771351804; x=1771956604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk6kq7pf8sOUgb4FnoFQG0q0zp4jil34CrE6zW4xlH8=;
        b=ZdZyXHWbX3zpH1vYB2EJ3XBhVtMzWg6RVxL0F0Lv404AFVm3PwZG3uQDWytb5ZsruK
         glzgy5sRjKFylTheriCePBuQWwK0At10C0Kp/Ci9lrbft4u6KucBr4Zp/5wJuPsq32gh
         GA/nNg6+DbMSKITvoxm+4eaWUSRpJeCSfmfOp9r6zeNZ8YiZhuePJ1gMjQBKzAr5x1Ps
         wArMxOgiRMnL1DtvsZbTUGYZKL093JvLRn3oS4BxI/y1TIua4wmVQ6YStFEezB6bxnc2
         HLNjiym/0Dfr9tb2VVcRObZs2/RnjxebtNEt1+5cO8ZQAgeb8VMoztDEjw09auNux7n5
         k0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEWdDpfbamMnWRCCp7voynLcO9NIYimDYQSI/o41rYPowS6fU4Fhse8BuQaSqirsG0Pi0G2pOTn75jaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeQcy6peDj8snXlbq+jFalOVx11m8zr+rCFnSKOQG/G9yWxVo/
	FlPeFXZM16+dE5jN87plRLmV2i7jgzS2njhf8gqnv9oKYvWeuHkuJB58DFUjioLAAi2a9LeIv0R
	O6QDesJGe+KJLeCwLLIEt1+hEBQXZzgRItSSUK1boOB9tV8YW2M6aA4GjjhCeCQDxtQ==
X-Gm-Gg: AZuq6aKYP3EO4ceFIhuZsMsnSyu82l30Ukq53/EjoEmrbdX4InOhLHoQmdFzuG6re3+
	Gl2/5qkK/eCzFPOtSaBg7JL4Q8tIKh7eAhWdFrgvo2NXw5miOr+sQ69vCQ9WnyqA/cqg1KgLXL/
	zWn4fZT+LI1LdAeMWHtLtRau3hhk4ARJIUscji2P+Lky5TBNRkQT0LDH2WG8NEaeBLsj/MAxmHu
	8OHg46qTtZG/wjJK4ZQvS/eLO+YeeGAGf9A0FsqB1/xePBznppRoWlyxN0b/PnGOYwN3CiAr4l5
	lMubQJt7pF5E7FXQWE+0F3TXDqbpppOOhHkNkinXpuBUj8Eoiu3ah6hH7yUE+eYke5tEtmTcH03
	CKGalk4JBhXZ4aXZHOLVgo+oC49loPcEAKbAYDEqV5KMZo9s4/5InncgN
X-Received: by 2002:a05:6a20:6a10:b0:38d:efca:1be3 with SMTP id adf61e73a8af0-3946c8bfed4mr12901150637.37.1771351804127;
        Tue, 17 Feb 2026 10:10:04 -0800 (PST)
X-Received: by 2002:a05:6a20:6a10:b0:38d:efca:1be3 with SMTP id adf61e73a8af0-3946c8bfed4mr12901116637.37.1771351803400;
        Tue, 17 Feb 2026 10:10:03 -0800 (PST)
Received: from [192.168.0.172] ([49.205.251.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e79efc83asm4004434a12.5.2026.02.17.10.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 10:10:03 -0800 (PST)
Message-ID: <ff6c4a6e-9478-46fe-b17c-5b4221f04b52@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 23:39:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
 <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
 <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
 <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
 <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
 <logrdwafmqpfjoxyk7aqs3ahb2qhgqrtcxjkvtclxopkxqvrbh@q5zq46wxyrsq>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <logrdwafmqpfjoxyk7aqs3ahb2qhgqrtcxjkvtclxopkxqvrbh@q5zq46wxyrsq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE0OCBTYWx0ZWRfX8pbm/q79FTt+
 f5NtCv15Es9km4KKWmm5ctL23KRfN/ROk19qsrHKCDGOFzzlJnpU/9DIJ7I1nmII+MPvePiFexq
 snyqkdwLyT5W6on4wPy6jOhY7d0KgCXVH+L8spyLC5c9vbTku58jY67RkP11msei63qwRjdlkfo
 Zv+68qxNvvDPeTNEUH0foE9in669wDbKsB40y1eMF4gAOs5vL/Mpj05EMfMWtTP/LJsPBfwfACw
 DIx90qIwaKDww7ZYGXFu2R3Wc7eAC+UuxnHarKeRTy+W81e1J3BmC4iBepSAfDsolmiwyDn2LZY
 5RsORttXQXcJins0YJwBquFdDc1tP9hc4rV5Zvl5kcN0MaEdd1P6qRbCniz8f/1AMMM5aG7eI8R
 fWFJwSbbmJosF3o77IR/7FO/GyUFxxES2EMfz+cQSbRVHlteLuGgUZmLNZxCusGBctVNWP5iq8t
 2ky04DnlYgGPfNzFp3Q==
X-Proofpoint-ORIG-GUID: HLHddjZyJaYYQUA3eEm71vdzdRugDDzI
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=6994aefc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ExRUKzOVRX24zF/T6h5B5A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=CVEAFZvZQY1BmYoe21sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: HLHddjZyJaYYQUA3eEm71vdzdRugDDzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52989-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D090E14EF38
X-Rspamd-Action: no action


On 2/17/2026 9:45 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 09:04:52PM +0530, Vikash Garodia wrote:
>>
>> On 2/17/2026 8:06 PM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 17, 2026 at 07:13:39PM +0530, Vikash Garodia wrote:
>>>>
>>>> On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
>>>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>>>> compared to previous generation, iris3x, it has,
>>>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>>>      (bse and vpp).
>>>>>> - additional power domain for apv codec.
>>>>>> - power domains for individual pipes (VPPx).
>>>>>> - different clocks and reset lines.
>>>>>>
>>>>>> iommu-map include all the different stream-ids which can be possibly
>>>>>> generated by vpu4 hardware.
>>>>>
>>>>> It's not how it can be defined.
>>>>
>>>> Do you mean to elaborate the different entries within iommu-map or to
>>>> elaborate the different stream ids and how they are grouped into different
>>>> functions ?
>>>
>>> The comment was sent three weeks ago.
>>
>> yeah, if you could still recollect, you can comment.
> 
> I think it was more about 'stream IDs for pixel, secure, no-pixel,
> firmware, buffers, non-buffers and direct insight into the VPU memory'
> (pure example, as you can guess).
> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
>>>>>>     1 file changed, 234 insertions(+)
>>>>>>
>>>>>> +
>>>>>> +  iommu-map: true
>>>>>
>>>>> This is totally underspecifified.
>>>>
>>>> oneof would be a better approach describing the possible stream-ids.
>>>
>>> oneOf of what? It is items with the definition of each item.
>>
>> something like below,
>>
>> properties:
>>    iommu-map:
>>      description: |
>>        List of IOMMU stream IDs corresponding to hardware function IDs.
>>        The number of entries depends on the SoC variant.
> 
> Do we again have a story of variable number of entries for the single
> Kaanapali platform?

its for firmware stream-ID, which can be managed by kernel or Gunyah. 
Handling for it now would ensure we do not have to change the binding 
later when there is a need.

> 
>>      type: array
>>      oneOf:
>>        - minItems: 8
>>          maxItems: 8
>>          items:
>>            type: integer
>>            description: IOMMU stream IDs
>>
>>        - minItems: 9
>>          maxItems: 9
>>          items:
>>            type: integer
>>            description: IOMMU stream IDs
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +  memory-region:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>
>>>>>> +
>>>>>> +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
>>>>>> +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
>>>>>> +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
>>>>>> +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
>>>>>> +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
>>>>>> +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
>>>>>> +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
>>>>>> +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
>>>>>> +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
>>>>>
>>>>> #define the functions in the ABI, provide them in the bindings.
>>>>
>>>> Ack. will introduce a new header at [1] and define these functions
>>>>
>>>> [1] https://github.com/torvalds/linux/tree/master/include/dt-bindings/media
>>>>
>>>> Regards,
>>>> Vikash
>>>>
>>>>>
>>>>>> +
>>>>>
>>>>
>>>
>>
> 


