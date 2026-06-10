Return-Path: <linux-media+bounces-64391-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Nu2Hg8rKWqTRwMAu9opvQ
	(envelope-from <linux-media+bounces-64391-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:14:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12761667B73
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:14:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PcF0+Ijg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KH+rrrr1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64391-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64391-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10DC930DBCB1
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2AD3B8120;
	Wed, 10 Jun 2026 09:05:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460713B47D7
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:05:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082349; cv=none; b=cF5IIJhZh8JoFuT2AcHPNCj46tO44aRnGMplaZnpw0EO4LHfqwfe0IjRO8alprUzR8zOzcbj+6qQJ8Zphb1ICsbscp11RNb+Gw0tFqyejqUC1k/YzuN893mEhyB1k1YfkfDfB0KpLly28XhMwaAcJnph1oqk0CX6tqmSIXetGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082349; c=relaxed/simple;
	bh=SjbeGkZ14nH3FHoo2Fp8ZC9T+ZmoLwgWWghUJiFESRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXcHQJ7SeVlyXGHikgftgNGENWHW6KTYEnJMKvdVkprQUPWJJFYyrK9mqpxRmpUCeaiqWyBWIhiv81jh6xJOB4dJy27cYCQPVciayFaOYzH1VxfA4ePXnghu7/q1kojptNLQyzNbz1GDXrdN9wcbnw3bZ1NuUnt48lmFQjhlZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PcF0+Ijg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KH+rrrr1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hwku469705
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2LeGRSc392ydFD5fvgT6QlW6NVIB2YHULelRqvgneF0=; b=PcF0+IjgrhwmQDrM
	HXnNpZ8BlAhTAQc5XQ5X3tRGcEiywVlp/tZ7xrZzlrhMlQb7VWnVZjH/2ntwOXRk
	+QQAxVRGnUVDvp8klb0wGS1RKeaJmerXEHt6QF0dVYIC4EYPNehVeIp2kvst+74a
	tej5La713HR/FvEQIgVVWFjlU2L9ExMtWhSFiGgn5GR2rlyh2WFzwfkF9FcNffmP
	L8ZH7wXY7IOEyWbdO8S0o9mY748pD8RSZ+4V+N0qQPn6/Jx3uD3rE7ndTCmZtOrL
	eFRYO7bRqLAoGJNxerH9KuMOYGwvPZnhYKKOVc7oZ5c+4uLBM1NMWAPiFelPlqRg
	gfYmZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvhd4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:05:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5179e5ba14cso74610311cf.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082346; x=1781687146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2LeGRSc392ydFD5fvgT6QlW6NVIB2YHULelRqvgneF0=;
        b=KH+rrrr1/hI7DAkp8N3Wzd8pHqbc0bWs1h84oYX99tb9uRe94Rm2UJDHyFxCMHC/T4
         ZodudPAKlJZfXkXrRHV0GbuBDGp7W0y6c9IzAhtMf7VkDQY5Q56HNtNVUyDXC2jOHlgY
         MahKllYu0wu6cIlWc77f0xXrrJu8TvJ+7hLKIzsVJAY9s5S4TwecEdBsx6anFHe2sJoA
         FTPiBhUugwtKAlZiBW/3QxRTGL15d8Bx+ImeJw73KZh69+JCy5w+wDKAwTvtatHj1IRt
         X8yuIr0LnIdz41FzQr9AVvpplUSUZUVgDPmsFvkEdIdaBxb6o+jWJoNN7hJ7Xp6Ht2vR
         lJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082346; x=1781687146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LeGRSc392ydFD5fvgT6QlW6NVIB2YHULelRqvgneF0=;
        b=iUljxGJFGvhza+R4w6X+VD3FEjioQi08ZuzgnZ3pblMVfZXSAkx2sXwMw7pMFaTmIH
         S87CZIZCLsBUSFc+2bXHJRyK4qUd4ERWpjSDUvmOSAQKVdO0HvSMmeQNuJVNnYb8HQZQ
         vxy0gzU0A4rNVMxbchNWGqHlR/EcjydZUWwGyg9qEhUXtwprLySqLCPoj0ii30HrEYS5
         /Tr/k23SJX6L3xEXBZpm+04tWGpTtuawZjbismdMhYadHw9D9VFWiD2M1x8MK0Z+o3Pl
         WLO2es7PO5lbwUD2hHwQN8xth7kRmXZQhDmcPmhIlilWqH8LF4DTxtTMXjvhly0vF//r
         aALQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jYlKJLdtsARiMWbcSn8naQ00nm21dNl/O5y31sIozq7/+kzNL9cX6ShJXIeoTIXNOoe4pGtsAtr0TCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxQJEm+YgsFvYweiLanjGThLFlEEfE4zv2Hizl8Sd67c4FX5oG
	UZIsXezNepkep/SZJGWrzKJBAHLoXpwfNnNweX7iXycU54FITNGFqkxlWawah1vns6I8rk2fshB
	bVmHEhMzOe4HL/lvi1eDv2KiQ33dAftcQLT6g51/luADijaksAPFRERdOSr3UGybM9w==
X-Gm-Gg: Acq92OEyiSS1xSzmMfAJPNOwK+cOWDJVXbkuDtXb65xenobltEt4cXJhUHKlWm9LVRG
	1hD2/YKecrVL1pipa1lEdRFdWzyuv04vzS2t1ysFy/vB8gAnFIFV88jHSaJNTS/9QcBSzLswfVX
	hGFiTrA8HYBHq4vYrVEWVe4CFpst2bUsURDvMRD8pxWaTOzOCXLHyZL8L9ub9HsN/46dJajPTUW
	K0ICjcB1vc+oEa/C1hvImPvj2jStYYjE7QmyPCjVUwtaNoauu4f5c4GgnsK+SVT8QQ28C8ZqKbm
	BeklJjbFswzD03XdHd6uLhU3P+sUWKZ1g2L5L0vEl6+AQRg+e4R+dDscxHD6158CEKl0AqoiT3Z
	LhSKNUjG1SsHxKqrIKOPyqnx7BJCZAYcWYdQZYm3nmSFjdQkbo61/xSKi1lb96lzkK3Y=
X-Received: by 2002:a05:622a:30d:b0:516:de71:e21b with SMTP id d75a77b69052e-51795b0a1a7mr339248371cf.9.1781082346512;
        Wed, 10 Jun 2026 02:05:46 -0700 (PDT)
X-Received: by 2002:a05:622a:30d:b0:516:de71:e21b with SMTP id d75a77b69052e-51795b0a1a7mr339247831cf.9.1781082346016;
        Wed, 10 Jun 2026 02:05:46 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553fd86csm1166004366b.46.2026.06.10.02.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:05:44 -0700 (PDT)
Message-ID: <e4f1752c-f4f5-42e3-a2c3-e1f37ea24fc7@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:35:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <BMTIFxHuDURlDmZzZJTVeFB6LmfKxZHPKz3t2FEVk2jHRMdO-2_435jcKspeb-fET7XxgnFnsKMBfijBplRx4w==@protonmail.internalid>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
 <3d53b646-d5f2-4ca9-9d69-dc0899165c3d@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3d53b646-d5f2-4ca9-9d69-dc0899165c3d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zFf_nu-pN0ZL2TIjwV-duM2dufm0MdII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfXyoLcAQU4jS0X
 EyxtqmkgGBOb6+0B9RWHfa/GkTwwzUxcjAShubDMbMn7npWiqc9tyMo+XOMypmTyLKIAPyIcxBI
 +V2CfvEdko2lbsAolf3ydQXKudqoyJGsSsQK2D00TBg+RkWSLjojM9cJpe1K8jlz6vqs57tM0Pi
 u9QNCNbFMFBJspj9FrTWjJ/tlICukcslCtXghpfJMFF6paW/3ltwRJscuTETZhmuswRxnjiv6tH
 XQptjBROa/P/XtbRDJoTuEgMEgRQCDsbdmjvTQlGDWlm6o7PrnR1L8N/jy1rINJdV4Ml/kMXySo
 gLLhhafuwCwjKuuNKuZRXyMGwIJaTBGcVcOnN2+/9RAmnT5aPzz4D4H3giJs96r6ffnTBZd88rb
 cMYiCPT5WHp55QRqQvy/GQqRWh3njyKOe3jO0A6k6QSefUMknZ5kOcdo7lbJRymk2Lp5wvyki2O
 MVudUORFCstPsEoakAA==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a2928eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=tTcoO59C9ckK9alVnXkiOA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Lgbjf1kSNvCM8hKjzQ4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: zFf_nu-pN0ZL2TIjwV-duM2dufm0MdII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64391-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12761667B73



On 6/10/2026 2:24 PM, Bryan O'Donoghue wrote:
> On 10/06/2026 08:50, Vikash Garodia wrote:
>>
>> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
>>> On 09/06/2026 17:15, Vikash Garodia wrote:
>>>> Document the iris video accelerator used on shikra platforms by adding
>>>> the qcom,shikra-iris compatible.
>>>>
>>>> Although QCM2290 and shikra share the same video hardware and overall
>>>> integration, their SMMU programming differs. QCM2290 exposes separate
>>>> stream IDs for the video hardware and the Xtensa path, requiring two
>>>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>>>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID 
>>>> layout
>>>> and Xtensa isolation requirements, such SMR masking is not 
>>>> applicable on
>>>> QCM2290 platforms.
>>>> Since shikra uses the same video hardware as QCM2290 and shares the 
>>>> same
>>>> programming model and capabilities, it is added as a fallback 
>>>> compatible
>>>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>>>> two IOMMU entries.
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++
>>>> ++++++----
>>>>    1 file changed, 16 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml
>>>> index
>>>> 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> @@ -15,12 +15,27 @@ description:
>>>>
>>>>    allOf:
>>>>      - $ref: qcom,venus-common.yaml#
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,shikra-iris
>>>
>>> Should this be "iris" in a venus yaml ?
>>
>> given the vpu core was first enabled on venus and now it same core on a
>> different SOC being enabled on iris. There are 2 ways to do this
>> 1. Add the compat to existing schema which defines the binding for that
>> core i.e existing patch
>> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml,
>> but again, the shikra compat would fallback to "qcom,qcm2290-venus"
>> compat. hence even iris yaml would then need to carry the venus *string*.
>>
>> I followed the first option.
>>
> 
> I'm confused here. Your fallback is qcm2290-venus.
> 
> grep qcm2290-venus drivers/* -r
> 
> drivers/media/platform/qcom/venus/core.c:    { .compatible = 
> "qcom,qcm2290-venus", .data = &qcm2290_res, },

As part of migrating soc support from venus to iris [1], the compat 
would be added to iris and shikra would fallback to it.

[1] 
https://lore.kernel.org/linux-media/20260515-iris-ar50lt-v3-12-df3846e74347@oss.qualcomm.com/

> 
> So shouldn't it be shikra-venus ?
> 
> ---
> bod


