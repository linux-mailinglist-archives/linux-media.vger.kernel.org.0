Return-Path: <linux-media+bounces-64504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pyxxFGmoKWoybgMAu9opvQ
	(envelope-from <linux-media+bounces-64504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:09:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C168166C2CA
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:09:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QEg4XyDm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PMqrTb7B;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64504-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64504-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEE34315CC00
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F2433689E;
	Wed, 10 Jun 2026 18:08:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF97349CD2
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 18:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114930; cv=none; b=fnR+6vIYR2NtsfTcZ6tAZpXVCn8EspzOy8NWEUuUXRONOTvJ+nhvgjRpaWiCILduZNBrCNdchPzW+Cw9C/QgPeVg53pwBKGAMFJ5vzOdHo6nEO8hkoupWAiImmdvp3qUfM2XczVS6brIiGXNO2mOUXpD2b2oQ+kCASWW49JsnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114930; c=relaxed/simple;
	bh=TzdZ74lGIi/K4VLWAJkI9NGpFSw7kZd2nzjV7/0g0YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZN+5oXTGBHvL8ok7C8vz7U7+tnB/O3cqCv16kpPTkogOwP9S+ljCWODT454wWYeaLJf7xZ3NhrCeiHnzfki6IMWGaUcYS+PpPwf9I9D9DfjZtuemXvcRFGNDj6/yqqp2UAd52Q+d9Cka1FSRkjmv/m0MpTkyjcldsYLxVkca0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEg4XyDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMqrTb7B; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwijO2142063
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 18:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pU7x77a+8qRNZg86QYZx6zWKXSydK7ZBnV/K7oIcSUE=; b=QEg4XyDmpI4ju+vP
	MPoo7HCH6aSWRQbIvwupXeFI+Iy3YUWTZ3MelkBn0z9JB7DI3ZMkZ4I9Uapfz3FU
	xei8PaUkf86825RNTqFnscSAFRSlhM2dCHF6ClDQPauMTT1c4RFRORBXabIGLr0D
	zPpLU9wVOKzsBiGwjHt2r3SbUEqjVZmqH8PRjA+VYNrmVswH5xPUF7uPb1+u4fNZ
	xtywKTJXj4NkYo5958lN3J1/hTKDa/3MOFD4G45MpXioqf/Ss8g1h5E6s2rgOwlu
	19VFGVRS9axNe8G9MJMTj427yri1afNKHRLsk+nBD5yOS7es/sF7+LM39OXklKsq
	FyDD9Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10abayq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 18:08:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963a95e1250so2201501241.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781114928; x=1781719728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pU7x77a+8qRNZg86QYZx6zWKXSydK7ZBnV/K7oIcSUE=;
        b=PMqrTb7BISBpbsBNL4aNgdGrNsGMH5yQ9p6Xtchzysfje08es50y9HBStPvvHLu7Kz
         zNGTPCD4PiXhtl1lhjunEZ42HH3jOZ8Qy5TMEJxEecWiwGi/urgPJ+TRWW3sJNIT5pCM
         VrUc/ldXOoSByexnHqmA5t8RuT+8mmBBTKEZqgMjFd3jCRFi4Un2wmeWLCsyCDeC024M
         FIFHBzo+isUwbRJqYAzUC6GZPXrYFCSq+z6LbpR5AKejK9f0y6ebypamCTudJ7RYvHPk
         NdOAaLCVG5QbT7M7m67uUZ2Gph+50RFfd1Q9SqGwKxtgZLdqG/yNe2A4o2CjrfUd5Pau
         NSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114928; x=1781719728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pU7x77a+8qRNZg86QYZx6zWKXSydK7ZBnV/K7oIcSUE=;
        b=Hfo42rOou24cHLpIt0jjFdwcnrl1vv/IdF3JGX4YrvBSsjMaa5nahA7R6lfQnVfUSt
         tZpJQBaBLM3asACubicNzjDlCzNlfvgItP701nhnMoVTGkPabqZvPQKTCvs8OIUSfyrK
         M2KopB3zvx6nepSN0GmX1BJJuECQwFRlGX/oyTZ2wvBivJlO8RUJrg23KdL1/x9V6Fft
         lfgD0DRNezU0A8fskwVIYyW5+9CUOjSY2EnVg+2UbHTJo1m3mvID71AIky5vOEIOx7yb
         tc3mvfRUyO5fHh6020bQIKKLrz0Icta6WF6Z/uMZGRDjWg3WcKq+q5a/UT/hbAAvMvXS
         RPPA==
X-Forwarded-Encrypted: i=1; AFNElJ9aMO1IBKd70y4pG+rvMUvE4bcAxegR56h1WPvXNHKLHWHSk5lYXI1LLN1TzLVa/AJpie9WjB6bzm6L9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmDjwYPjyzMjGS9hhBbk+YWr3KJtTY02/e76SbTFwp0jtH02R
	tvm+4pd9/XwU4WseywEC17zw9lvl3d7JdWoT/6b6TbdduBMNz7k3mgcadRFT6806QxF85VtazZs
	D6448HCK7iKnHYBfJx4cmAUACr7g0qBgg+DTnS4u7t5d9s0iE9nngiuR+bim56Rzj2g==
X-Gm-Gg: Acq92OH7GDnTGQM6DR5djFCWclemXuaMfs6jVyy+wPeXbWiQ0kZM/RC0qqj2rkcOccM
	ggKLUPGbjmEkIdLAQ/vnpKwobS13Y/Q5T7+rqN43sWbgSCKPolo+m0ECSf/yBzhAJukotqCPs5f
	INmaJa77GXvbvD+kIbXuH8ZPZqb44lFINIKO7uH2CWhnXAEtQAuo7m41zBTv7VAz+Gj2pAna8Z5
	MqZmzb7KvUzLb3/Fw8kusy/uTXB1/4W9WqCUM3MhuStpAmD09hLGGEfH8jRcVlylBOMl8NFYlX8
	WvpppCuQDvW9ADvsM4YZiF2dERkMRjNmii5fqPmnLxu7p3XHbJDyTh+B42DdX2yakUt/cwSj0b1
	bhrFkEVN/depYO2dXaqUgsg3JwDDz1rrYG7xisc90ekkJjPbDmo1vw06KPpQb3lr+vpE=
X-Received: by 2002:a05:6102:5e82:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-71d1ffa545bmr70889137.12.1781114927794;
        Wed, 10 Jun 2026 11:08:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5e82:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-71d1ffa545bmr70859137.12.1781114927376;
        Wed, 10 Jun 2026 11:08:47 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055303fc6sm1229897066b.42.2026.06.10.11.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 11:08:46 -0700 (PDT)
Message-ID: <5e1be8c3-3e41-4a4f-bb70-3bc6bad7f26d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 23:38:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <20260610-flexible-badger-of-dignity-bbaea0@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260610-flexible-badger-of-dignity-bbaea0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a29a830 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=tTcoO59C9ckK9alVnXkiOA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YZymR2wwIn4Cfu7efxMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: PMZFEGqoCqq_NshaMah52aQX0NTToC5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE3MCBTYWx0ZWRfX8EzgmXoweMLs
 JFoWUF2FnklW1KsbkblZ0+/aFYibk/DZHpDWswvagNQT+mxSKrjBBg8Arm8wKt9ldh0TzIouDRk
 w7ZbhWoRQ0RN1UFhvl0l/EPLoYUd1loBS3Z5NDAfW8ITGX2v1hJlwx4VqTZlBo6MhopEY/ysezH
 fwYpeqK8azmi7iawFHJsZGLX4JDXqJ7SNdx+6ykXarsKPkE47/vXYLtqfwn7wSFNBltntIxab+h
 iWZ6gC3hlM1VDDBBAvAE4uUJHe8coiFYPh9TGckuB+hlgwigrBsEnVQMEAbpwsxzjjVSNb3Yvh4
 Vw3xwV4Cfa5RTpsvJkAGgPQwAGqVNg4Ke76pvptuaBIi2yAuLUw6HQWPc2u7cQs/RFcK7hl4yni
 4xJNoUR54JZjW/Zgga68IaGgiBVrFQGAGa81Zk3PFEpcpNg/zO3kJAJENVxb4lz8Lo6bKrDeoRD
 jfm33V7dbxO5vJdCpYA==
X-Proofpoint-GUID: PMZFEGqoCqq_NshaMah52aQX0NTToC5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64504-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C168166C2CA



On 6/10/2026 2:47 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 09:45:40PM +0530, Vikash Garodia wrote:
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
>>   .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>> @@ -15,12 +15,27 @@ description:
>>   
>>   allOf:
>>     - $ref: qcom,venus-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-iris
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        iommus:
>> +          maxItems: 2
> 
> allOf goes to the end, after required: block. See example-schema.
> 

Ack

> 
>>   
>>   properties:
>>     compatible:
>>       oneOf:
>>         - items:
>> -          - const: qcom,sm6115-venus
>> +          - enum:
>> +              - qcom,sm6115-venus
>> +              - qcom,shikra-iris
> 
> Messed order.
> 

Ack

>>             - const: qcom,qcm2290-venus
>>         - const: qcom,qcm2290-venus
> 
> Best regards,
> Krzysztof
> 


