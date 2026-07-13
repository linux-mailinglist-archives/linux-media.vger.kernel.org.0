Return-Path: <linux-media+bounces-67440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxXKGPagVGrToQMAu9opvQ
	(envelope-from <linux-media+bounces-67440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:25:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FDA748A5C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:25:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V5QtdjtX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EmbBDW04;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67440-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67440-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EBE53023A45
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3903AF674;
	Mon, 13 Jul 2026 08:24:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EDE3ACEE0
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:24:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931079; cv=none; b=bluJ1N3CWBmWUBNo4Lpqb15BVRbLQsMtDv80VaWNFjTW2Prb/uSP8YZYBcma3kQes3EFS70bDOzsTtPaxNwYVIjZEoWiVdzLSkiulY7MrxZFMkdZeQ85vpANN9CM3pMM9Tkk6KFlcFLfvliRwaaCbuqWDCPW6sopJw+WVwuT6gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931079; c=relaxed/simple;
	bh=sAcLEJrrx4v8nuf0z28rIvu0BNNVc+kU+REaphTJnnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhQhM4gBdReEtlVnM7BIiaQMGDjYc4jEi/skNV+IhnsR8L5vwedjFQJEU50m4bld7Qo7PyhjD+Tk3gg4kqGc23v7W0PW+As5C1/f6ynoERdeUEyuPdA4WlALqPGC2AQiUEq+0hGVGuuwsao7xaLmpE0L0QEQFXf1G8udO86Yi0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5QtdjtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmbBDW04; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nxg9674494
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AtYfxbeH2oeMrlG9JnAbkDQDcuirWg4SXSYHEeZMRKQ=; b=V5QtdjtXRBo/SA1F
	grlAc3p+1+FbseoCfYzj57+/CDn1tiHY2i1p7/whzNAx8L+4r+Tbd8YZE+EfU5yP
	FPbFGajWf7RxkhUFxiRG3X60s/zI9VDYVCwoUO3aza0M2HpY36CKLvjcdNyoOVxG
	Hua8S9qBBrNJSvSwIG7vJy9npLv4DtMC/iWYEu/EnPg8J4eOTH3ECf1ZwHej7wa+
	1b9pazgZLDURmDFtGzysEcjj6dfZfY7e1N8xLxvvtMAK7eijkd2AD3RB0NGkU3Cb
	z9a8waaPKEMezCNlp3wCLHV9nKwQZnCs5vg/ao1tcMvGqU4Jevyl91DlTNNtIq1U
	0SAA1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgn6jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:24:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso47471281cf.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931076; x=1784535876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AtYfxbeH2oeMrlG9JnAbkDQDcuirWg4SXSYHEeZMRKQ=;
        b=EmbBDW04YevW9sFTTUjRlLM1YNdUcRQQmma5kffdbPKLi848i+4WyGQ/X7e9fvdl/g
         vTPWh2XZeoi+GvqZOmRlWMEKjeTJ8AtkCQJb/6ZP/fkYncIZngITh11TOHzyOFkuyeQe
         7dZ3flKNIrocP0rkz1/R0cQcBUBCVOQZ9YqNI0w6dfJT0PeT7vPE5l+9z6FUK0T+tswG
         ClZGNXdnbeMNXQSMxE3ELHLSyEpw6jQhbinfwydLYdAFkvxQgqXiMBqEtnltIwStvvq3
         jomurNeoONPAckk/f8MFOG/7g792eEbXIIWnI+yQBJiz+YPU+qD3dsWuMS1i3MoE0LkN
         M4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931076; x=1784535876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtYfxbeH2oeMrlG9JnAbkDQDcuirWg4SXSYHEeZMRKQ=;
        b=HKogxQUa5FeRv/q6opoT/XC3wQP55SiRL/PNNQUph4f+Zqs8q7/nygxvzFRAi7PYSE
         AJlwgeJv7z/Hg1gh6pC7aFkEIPPF5iuwL3sPHZ72tE1gnguzFG+imd5OaTHnYCMbHBry
         UDZ0TB7TpLJ+mXQC+RUuufV01t0n7EU3QwKuDsAvo9adoRJ8Ehb06b40yputv5unU1WI
         ZbFCWNPovTOHYfi/9tjcVnjcKBZ9iJh53rxkcYAwDlcInfuEJL6Nrx/zPS6DpgWN2Fq2
         75k21y++D096ubuRR1ptRuz8Iwfd/bjdL03UcqB6xllVZ0C00Umr8H34egP29ifXbLfh
         E7gw==
X-Forwarded-Encrypted: i=1; AHgh+RrQDPbZEofKRGlTvbsqHO8O2uemdtG7PJLsCk7H5e1KM1YPq35aIbMKEGJwGsknUKj/lR9WtDWv050IBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxphtMmsiSw0X4RpJXGKK5fugUjVsH80ohg8A+HM7IlKoDfaBJ4
	lGKQyKVRiH9t1YjhjYUSA/W67mYCFH8M+TklQpZM8DQrIUgKy9g5i2MrKb0ViKqNNcCxx9omsmc
	TVpzZJPC2q5BDVYd4K8v+hrCDIHoksvlD3Yadd1ycBXuMLgdRAMzBw9Mux088TYA7SA==
X-Gm-Gg: AfdE7cnNxyfUh7jbP1+SeXPq87P2Q1MBjfl6rdDzMIlKSG/3ZaV0BHa1HMr5mGBeXCx
	+XEOhnymv5XcX7ShGNZxFLC3INLAZ1EocjAYiBE9k3tPlZ9XXrjbz2Icbkf0bG6+H+4mH/Xv2b8
	QhlNEFdkALAUzTJ9p1uc5tp9RQuuxfXrqevstEsFWNE4x3tnZusQEF6cfMRumKSvChKgg2XRRnz
	Q/Z0J3W1g4D1Vf2FpjrogeJcylowEsAIfGvnGxHDoVXuHx0HDHlnkLPXc4v0jdJl0it3phhe6Cs
	QHVrbysrh6JzALMl9qzr6guOl7T/ZbtPMW6uqFk0KcGCbLYQNm56BPg6ZfGNBGvJkKn/fl5yM29
	dfFdW79Yz2vmJMHVRE7UrUtiN72JZQK2CmcWFmUtzvBU=
X-Received: by 2002:a05:622a:2487:b0:51c:7b11:41b7 with SMTP id d75a77b69052e-51cbf2eeb1cmr84915081cf.83.1783931076608;
        Mon, 13 Jul 2026 01:24:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2487:b0:51c:7b11:41b7 with SMTP id d75a77b69052e-51cbf2eeb1cmr84914871cf.83.1783931076170;
        Mon, 13 Jul 2026 01:24:36 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15df03dccfsm633450966b.62.2026.07.13.01.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:24:35 -0700 (PDT)
Message-ID: <88de7531-e93e-4972-8e24-b83cc9011167@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:24:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: media: qcom,sm8250-camss: allow JPEG
 encoder child node
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
 <c233b312-9077-4d1b-bdcf-75561690d181@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <c233b312-9077-4d1b-bdcf-75561690d181@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX/X6FiixExCi+
 Y/wpgRzfXHAqDFS/Rg/ZdX8OTNBDpGykHl9W8Gj+45j9heZZ5SZqLtRQvHdBV0RDLoDGTdjg2o9
 dEBBxv2Dgiuh7dJ/EgI7l/Nu7OKJQZ8=
X-Proofpoint-ORIG-GUID: ecafb0QdEO0daKFWT2LXVJK-31xwXWu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX6xpbGRe2IZpo
 3d5Wjnxb+xNM4oi931NxgCgwl5dNJVSZOG0b/Lg0efecASxCnK0JcgOvgJ1J6VTYK9q9zITmXuX
 nAe+bewMw4Pb4Myc6XYKzf/g6eQGJjsKPgYawe6o/CKFyKFnKcyG95sde6rJe9kHlK0PJgtolcO
 CvygA892Ga/6EPU5uc3xHrhwN5M8AK66HUUYiMeoEIb2Bu6UJPlGY0a+7ztUHDFZzPC2sOv7u1q
 C7hDKaTr5cBoGK3X0VwalWjTJJRwq2TAjtEbzrzhwwzLYg0Exh4TkOGMbs+LK3CCL2NCBhN8+jt
 6bmhGOnCTakqPPvetkO460XNV87lDLVbmRwBAsrO49iczTXmzkx+ZHsON/1/veQVXBe3gnCg0co
 mt+wWQaWsgZ1X9gZCAxJfa6hVkC2ldmIr7UVleq9F1foZGIWFibs6OC/SycH8KcGEf4/yVCTcT1
 VdHq+2BGrD0EGBgaByg==
X-Proofpoint-GUID: ecafb0QdEO0daKFWT2LXVJK-31xwXWu2
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a54a0c5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F2T7rKbpvuPzS9wY3l8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67440-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3FDA748A5C

On 7/6/2026 3:11 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> The CAMSS node uses #address-cells = <2>, #size-cells = <2> and ranges
>> to act as a bus for child IP blocks such as the JPEG encoder. Add these
>> properties to the binding so that dtbs_check does not reject them.
> 
> There are no children, so above are not valid.
> 
>>
>> Use unevaluatedProperties: false instead of additionalProperties: false
>> so that child nodes are validated against their own schema (matched by
> 
> This is not the purpose of unevaluatedProperties and it is not even true.
> 
> 
>> compatible) without requiring the parent binding to enumerate each child
>> type explicitly. This is the correct approach for a bus-like container
>> node and avoids updating the camss binding for every new child device
>> added in the future.
>>
>> No functional change.
> 
> I see significant functional changes - you switched to unevaluatedProperties
> 
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml   | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> index a509d4bbcb4a..6008938ee369 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> @@ -102,6 +102,14 @@ properties:
>>         - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>>         - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>   
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>   
>> @@ -317,7 +325,7 @@ required:
>>     - vdda-phy-supply
>>     - vdda-pll-supply
>>   
>> -additionalProperties: false
>> +unevaluatedProperties: false
> 
> No, NAK. I do not see how this patch makes any sense.
> 
>>   
>>   examples:
>>     - |
> 
> 
> Best regards,
> Krzysztof

Acknowledged. This patch is dropped in v5. JPEG is modelled as a
standalone peer node — no changes to the camss binding are needed.

Best regards,
Atanas

