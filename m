Return-Path: <linux-media+bounces-64376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UiqnLj8YKWolQgMAu9opvQ
	(envelope-from <linux-media+bounces-64376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:54:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ECE666CFE
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:54:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b+Pb0pXi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qh5kdsiQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64376-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64376-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D8203077C9A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 07:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC589374A09;
	Wed, 10 Jun 2026 07:51:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3D35FF6E
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:51:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077874; cv=none; b=QJgLSi4aTPMHtLh0FczYh/wIFmBdHc6RGC240kNEnWLl72UAeldh2oLEdK09q89vQHgLXA7P9x8cmxPUnuRZKkDscl1S1z/PAItaNnyg5bL4Re+I4HnvUHQHcGsHfwhXcAV95MflREl08dFfXkHKpZOzSzNYJjt04JCy+1aZBZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077874; c=relaxed/simple;
	bh=s3LvsG7dqZtXg8YMDIyxXyAHsoMeRXF9W+hw1548QZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bey1RVLg6jJOoyUtDzTpQN5zYDUagk4RXUxhkCUmdiSLNARWszI4CHB7644qO6b21neWPykdAmIXOoXOZ0ROoVAWDyrn3Ql84Cgzr/TmBwxGY158iwE6Rw7wQwhdO1MMK5ODa29P9BcOBUgp/IFB8ZVyEweG3xXmih1TNQsYfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+Pb0pXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qh5kdsiQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnFX530859
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZ2TbxNINDfUbarOe96uj/eig+iAWkoAY3INvn7LE1o=; b=b+Pb0pXimZUw0xfo
	G4YkE9E75w7NqBp+ro7eSV8UBARFgC4RGLy8lTBA/YQ6xPMKWUMd0sVTlqVIrSkT
	itQbjpiCH9/8pwITZqDaksVgkzDypZ41y7DA5SXRcnnv5rfcPeCmHAhJhuXRXD8z
	IiheO4cmU4XUar5wtCPR7p1mScos871SqGID7SBOB++GITZc9enxVVaZjyNXIRKT
	L7Ugtd4O4SYAXF56skquAd/V1xSUXh1OBzisxd8I4+Rzm3HLVmE4rlGLRBSbpWCy
	7QL9MyGqHnlXwRgqmY3VdAVqmBYALqFl35AJdorPA8Dsm+SLzOiVPVAdYkiAbK8u
	xeCk8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1cvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:51:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517ac42d958so73281591cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781077871; x=1781682671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZ2TbxNINDfUbarOe96uj/eig+iAWkoAY3INvn7LE1o=;
        b=Qh5kdsiQhNH2BsPmnbscM6+VYp3iHSKLduOdCYAI+VJ4O1LUFpkWPLKMfsVO0uPinh
         BBiVxRtewY1rzq9IoGIZ252bx3TcIwITB5PfjlxC2s074viNMCK0VfUkXMiCJ5YcHVi7
         2UqAcgp7tKaIHxZ2/LCgTakUOzBxX9LFs3DtldXvP6NN6BLIeaN1JpqIZ5jmO9X0KoaP
         qaSxNM9DyLJdlm3qzp/FDgmJhjWjKgZLxbiUFI3YQVmM1YlG31NgAjRlcHSZsGyyjgdm
         JpLADVbCnGTkZkVQ9zi4MQIFrRgNi1HyGNdZb5BBlfaa9h2ovvgs55+21YMcEjc0Eyel
         eKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077871; x=1781682671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZ2TbxNINDfUbarOe96uj/eig+iAWkoAY3INvn7LE1o=;
        b=T5UidJsJzqhFod4t7NODXUbcGVCJQqLm02nd+rAjzxTIF32zOQ/F4CCboDZP3i9/VU
         0ZrPFxfvPNIKstkgf0mT4Buh6GuG11N+IT/WNXhFjsiod23F33iVPcjWLbD3Gate5D/a
         K+z9sFJAHVeU35roWrtpK7R7Ej+7KS0Ji0Th10DO/UXxj+r3Sj7fhGiATw4iXOJnMzOe
         lEEWpHt1xK/Q+FBxtlgwWf2xBXy3UkiVH0HL+5Cn9Dl5M/eGub6mlPttwXTAxYXqz9Yz
         aOaHCMuzmX3k0oE1RhKgcrG/XA/wXK3MlGagBG06OVdm/1p52zs4bETzLNC7q1rw9cDu
         wmcA==
X-Forwarded-Encrypted: i=1; AFNElJ/VQpmsMx+0de86TGCMgL4WZjvq9F7p7I+eyA/1KAXkVirTaTOW5Bjd3EI6L0tMLBuvcZVzBqc8RAFVzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9jGymIPDPAoScWzDF/Vgr1c3SJUs054paptTuLTRpt+7LmfB
	+9SEagxhHlMRVah6HGbaFjDFXEIKUpofAYXW7+VG6wa4sDQ6xOCG+EnUC2taY4azYCtY5rARB79
	PnRuJ827yfII9oQ48cxZWH5J8NZj1+3LvcgqGGkMAy6v9fuNLBxYfRGwHrkkH2XBXqg==
X-Gm-Gg: Acq92OH2A15wMaGyWylZce8jcMii8rmlpQTdLFg3wO8Kx6natoD/oLrH5fZJijGINPf
	Boux6BaP5AxE0KjtHb/z0Z9fGw/WDl8tPZelPmswUDZAJeMFR2Hcm9reQBLGB0lcy98qD+CqFyA
	KIMSyvqLsWqul+S//s+hgoaQxbGSDnj2Ma5eVhvBUhEO7gIo/CffDuTRx8UyjRWyWjh5ZbSKBW+
	jjXz2qgynmqUk/JslLsWMhvTJo5ldMrZArWnJPVoRRzreWXjhrcn2x8377KnlzZ9ZFIk1dXuAvR
	n5I/7QC9/zo9l06r4sbTwpFqytkjoEflLYUjnY4ypNO963eK8fCKKO0+DSQJ54D8ag6cDLVPRAw
	bJ2zuzzB1dA/AoL2cPrjcnujbKLE87ToOMPUEG60EEo5hW8vexW7O5c99UFZa+Hq1Cx8=
X-Received: by 2002:a05:622a:514:b0:517:6b9c:58e4 with SMTP id d75a77b69052e-51795bbf26bmr339153991cf.51.1781077871415;
        Wed, 10 Jun 2026 00:51:11 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:517:6b9c:58e4 with SMTP id d75a77b69052e-51795bbf26bmr339153541cf.51.1781077870842;
        Wed, 10 Jun 2026 00:51:10 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.156])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm9496504a12.0.2026.06.10.00.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 00:51:09 -0700 (PDT)
Message-ID: <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:20:59 +0530
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
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3MSBTYWx0ZWRfX9Kn0l3dd+2oj
 lsJgrqlkmC9Mr6RjErxU5rBX/Z8NalFpwT5vibBZzZZ2O9YXqdUnGzF1mjgRfiZD/4aTydj/a6F
 L/eJ8J/I2IhqguLfENljqISuGLqduY1XQbHMxHKynlC5BbI38HhBqBI4gbbHozYwhvzYCeCbPBr
 eAQgvfkAMu58qWWj5rT6JbEJtDlf2FGqZGd6LhTYbXdeDfaHmLv4RVRR4uxTra5ckCYop7DCYbC
 mwriTttrODJ3ujWps7k4gZDrx8iRqJ1p9h90wE4ddeW9aRGpY+B/s6Oq0CIBJvXt7NamOkLQkaf
 2d6soxkDVwIjxVVCTtPmXlGJNqNq3CW4JlKC4z15UsKG+kenW0+b7PQ6xKQx7H/wfCaKmrJB73Q
 0CqThgEDLMEewedA0g/2HkbzkyL5Y7rm7RIzbHrzybv3+14LKVlTqx/Ax/mH+EIW3lAw9rw5w8C
 Hj3n1ADyYuOZq75JSwg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a291770 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=tTcoO59C9ckK9alVnXkiOA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gdZobvEme04k_sSWYcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FDe4XbX1cvrpzBQw4cQh9TwYXyZAA_Jt
X-Proofpoint-GUID: FDe4XbX1cvrpzBQw4cQh9TwYXyZAA_Jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64376-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31ECE666CFE


On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
> On 09/06/2026 17:15, Vikash Garodia wrote:
>> Document the iris video accelerator used on shikra platforms by adding
>> the qcom,shikra-iris compatible.
>>
>> Although QCM2290 and shikra share the same video hardware and overall
>> integration, their SMMU programming differs. QCM2290 exposes separate
>> stream IDs for the video hardware and the Xtensa path, requiring two
>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>> and Xtensa isolation requirements, such SMR masking is not applicable on
>> QCM2290 platforms.
>> Since shikra uses the same video hardware as QCM2290 and shares the same
>> programming model and capabilities, it is added as a fallback compatible
>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>> two IOMMU entries.
>>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++ 
>> ++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290- 
>> venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290- 
>> venus.yaml
>> index 
>> 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> @@ -15,12 +15,27 @@ description:
>>
>>   allOf:
>>     - $ref: qcom,venus-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-iris
> 
> Should this be "iris" in a venus yaml ?

given the vpu core was first enabled on venus and now it same core on a 
different SOC being enabled on iris. There are 2 ways to do this
1. Add the compat to existing schema which defines the binding for that 
core i.e existing patch
2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml, 
but again, the shikra compat would fallback to "qcom,qcm2290-venus" 
compat. hence even iris yaml would then need to carry the venus *string*.

I followed the first option.

Regards,
Vikash

> 
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        iommus:
>> +          maxItems: 2
>>
>>   properties:
>>     compatible:
>>       oneOf:
>>         - items:
>> -          - const: qcom,sm6115-venus
>> +          - enum:
>> +              - qcom,sm6115-venus
>> +              - qcom,shikra-iris
>>             - const: qcom,qcm2290-venus
>>         - const: qcom,qcm2290-venus
>>
>> @@ -45,9 +60,6 @@ properties:
>>         - const: vcodec0_core
>>         - const: vcodec0_bus
>>
>> -  iommus:
>> -    maxItems: 2
>> -
>>     interconnects:
>>       maxItems: 2
>>
>>
>> -- 
>> 2.34.1
>>
> 
> ---
> bod


