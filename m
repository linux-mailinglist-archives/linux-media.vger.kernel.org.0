Return-Path: <linux-media+bounces-65645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HMSpE3A1PWpQzAgAu9opvQ
	(envelope-from <linux-media+bounces-65645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:04:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A17316C65D6
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:04:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YN+cOeXn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QY+5fWFo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65645-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65645-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D97F6304398C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCE03033F5;
	Thu, 25 Jun 2026 14:04:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9BE30C15C
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 14:04:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782396242; cv=none; b=kf2ZXXS+XDkhU9qk+BPFDwDTYXH6tdvVReHEd5Sf2OT7lNUVRS8U+ojiYemh9hi4bn4bEqTQdtAsOygVjWJYZ11QyRgbwGKf/1ACF+cbgAsDv9ejAfDNmKrtd6+cAQcGqxl2DiScQPd3nb1JN3eOI0ruxx6D/UkUcxkFcqznuqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782396242; c=relaxed/simple;
	bh=02smTb6fZgfg9URvseMu8KamWiY9JYyKfTM6E7OMgUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsD4Iam75CpsyTKLpS1K2gw/eE9h1kYRvjXwI46os+sJ5LzAkaEf4DaUT6vyBxmTeSpFzy1ix+jql2GBzjUSHAm0J0s+eKJ7YD4sfb0sK6Mefhhw4uG2cGt2nCxOW/Svx2berbLg+3FBMfI7+xJ36WxSOzJmMtL05w4yr2qI/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YN+cOeXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QY+5fWFo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9juTE1470490
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 14:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPPUb6wNGYobJTWRleQaNEMOvAdQK5WbWVrze9AWYus=; b=YN+cOeXnnU5YeHl7
	yWBeo181jiyYqiq+bO3YBLSU/i0jQmbG99HndiWzVRYpzVOqQDZOk+Uq9DjW10I9
	UhRHIiXgPv522YDByVNQvy3cMzs0699FVQyxRbKu2dul3FFx0x27een/5p8MxXel
	vDQAo37ooTp34PwWu17H8ZqhYRrO/pARV+dUh4m1tbkFY/HQO+dBNMpf5AFtiXxC
	oPsxIUDRlDlpnc/dBvlhO+BKTU2dXeLdQAbg99vM4AVX0AkvPPxNZB2xWlBZFg/0
	QIjcmYNArTTxmsYgB0XWv+/H4BmDkNV/9Y9HOBBym+IJco8GqAyiIHNExUfQjiOC
	5tc6yg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7km8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 14:04:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7e921550fso20530885ad.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782396240; x=1783001040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPPUb6wNGYobJTWRleQaNEMOvAdQK5WbWVrze9AWYus=;
        b=QY+5fWFoK5TfiwN2jdLO1SGw9roQSXAsATcNvZj+SQNAFVL0vhMgSUqO/HoqEHNs/H
         Li1Iq4tht/TCPXDNwIcTmNw4LRba12wObOjOw0Thl3BbOl5knKyMiCY75EJiOTvqjAyu
         i35Btu2Cvesy5leqjDMui+R0AIqfpg29xR8gYkfQlbC0sR7D1xC7t7tW2N5Sb6qzzDEk
         zdDuj/WumC9eopJRN6wj5cAHN8j4Frsn614TkBBrILU3WkP7OSJvtYeb2UbR6dnko6+c
         jiiO1iQR8sh08c53ebp2dtQcZG9z9cvoL8nACq4Z6t/E6XcBuMlxyyhM82a0/1qdCgWD
         3Xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782396240; x=1783001040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPPUb6wNGYobJTWRleQaNEMOvAdQK5WbWVrze9AWYus=;
        b=hbcSP4TpZd3X74eTUkBtKAsTGBmcdpHOdEOjvLwsZYaDChabEAsg5wL62klkOX2Tdi
         jmSLPGOE96O9GkwLzwpU18GkUU/5tvNZVs0dI1fGGjqNQ3OddAeL2MWVWr40gfo9t7Lw
         rGK+XHo6Aw3p+TZk8BMon9+Y01b6XNJX87WP2BYqGKgjzsH3857+h72RIo1dPxTRz04t
         NV76wxYecgmWH3SSOjA8sIqFn/HskGtOCj5Ty7P8SDA85PpfRVPDRlfXPGrlsnJMjmgp
         mHEe58xlQGrXx4Z5YX92KnvOzGHPwZXweoZnLHe0mcSqZb9wGs/8GBHu9AXD1QlthoTc
         c+Lg==
X-Forwarded-Encrypted: i=1; AHgh+RokCa+N5GvYpfa37WvppRDF6rAE7ItxuxXIcApK3m1oyKtXps9kUB4NQvdlwUqAIi3xwtkiey2ktB+5Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxiJe+9yyPB3okYTekohQK2OA+lx/xjB4fnTO737ABhlZsslwn
	EpCdlry/nPQsI8ZbT2z3fNGl3w5Rv4ZVj3N6gTJQIRqeRvgcbswJLUpF3QlIdtfP9H4hHJ3dQc7
	TCSJhWUEEr245OUpxigTKmF/5J8EYwzQ5TRh6Gt7uNzX034UqjoZ1r4Cc2Sw0TDyY6w==
X-Gm-Gg: AfdE7ckpRt/5MjN6Nib9dEzoJrcrQnDN3OFozyjsTErl7D31nSiC0HZaR/LFOzqK5Rx
	IQ+99FBTML6nsS4RPt0GIvLuni/VEHn2GFN0gapblmkMJwaAhHgawzBf4kAu9oA6SlMMyEDV90Y
	9NRIeqlN2UrQUJdGppy1HPAT0YzwMm5Xgj9Xr2zdEUTDGqYE9yFQxCIQgR2tJm2lfDsBWcZI8Ir
	b2X0eILtX2KYAZe0NlR1fV1c1LNBX/zrgowRzzKjmqcN3OkgQ+avaXOY8Eot8D4ygfKg7euRfP9
	eLBK1UUt2qrvkQ/Xvf4mHnZ60oHJGYt9aoM3x9/xG4qQR9psbjoGW1fzsTWD9G3UfjiXT/QywEt
	gHgxrrAq9p/9gsoRABAFpbFFPxhKUIeL0VZ63EZuv/Mg=
X-Received: by 2002:a17:902:ce82:b0:2c6:cf81:74a8 with SMTP id d9443c01a7336-2c7fc8ab639mr29959815ad.30.1782396239708;
        Thu, 25 Jun 2026 07:03:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce82:b0:2c6:cf81:74a8 with SMTP id d9443c01a7336-2c7fc8ab639mr29958985ad.30.1782396239136;
        Thu, 25 Jun 2026 07:03:59 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba862asm208137866b.9.2026.06.25.07.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 07:03:56 -0700 (PDT)
Message-ID: <560888a5-fc36-4495-b8c3-66edc3f126f2@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 17:03:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
 <e65358b0-b978-4672-9691-705897bcf209@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <e65358b0-b978-4672-9691-705897bcf209@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEyMSBTYWx0ZWRfX6YcxLLAmL2Z3
 FRbS3B/1iYMjL2EZyjegONsNnvAJOIg3SqojLIgTL2Ad9VoapkLPcaYnnoOEqxc3zPow5hdOoCP
 37JF1b2Z3FeC1puI4hp/CRojRYDn45I=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3d3550 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TRDuFWLCCM6zB3E9pkUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: vLJxsmrQZKPinxiVahuzQQ65I8QMxijg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEyMSBTYWx0ZWRfX/VKVY04YkL6N
 nD1WuIjQOb4aq92JJ6FELd2fL+FtZx+uSYwLfTVIjzfZmkMxepRL3Q7Xp48P3GIm7yaA7gFruh1
 AJXk3xn1npRjQBQAxC1rtLuJGulA7FQqlXb3h7JU0AOrqcyUiHKr8ukScEjy21B/JXeXoPBDwrU
 Yr/C/mlczaci4jDG4zGXm1I3WtI1xpJ7ggjdXjfcFZxwHYBlTF5lhy+u6I5c1iSBA7ISk+ush8j
 FL8P1NIhcc6Llbm8YbmmHXgWpRBA36rU98nF1viFo5DgRiBPLanSPHYrAkq03zHI4hW7IcCbtSJ
 Hz6wYC2ErmJOcjMjMGKWTwX0inYQogNsqKwVyHR9Vh3oAyu4r/mrrgaPKd0RVfBrrrMndrLQZJs
 25JJG0xRPjtEpLhudElQ+H/dePjM+ceZFWAcqY4s8YvsmJI+PCDhwcMD4aSDms9nFURwQ1m/2GO
 zN4J2CnWy/ciVsDeVHw==
X-Proofpoint-GUID: vLJxsmrQZKPinxiVahuzQQ65I8QMxijg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65645-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A17316C65D6

On 6/25/2026 4:55 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 15:38, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>> that performs JPEG compression in memory-to-memory fashion.  It is
>> separate from the CAMSS ISP pipeline and has its own register space,
>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>
>> Properties documented:
>> - compatible: qcom,sm8250-jenc
>> - reg / reg-names: single MMIO region named "jpeg"
>> - interrupts: single edge-triggered interrupt
>> - clocks / clock-names: Common clocks and JPEG core clock
>> - power-domains: TITAN_TOP_GDSC common domain
>> - iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
>> - interconnects / interconnect-names
>> - OPP table mapping performance levels to clock frequencies
> 
> Drop, since when commits have such text? Why are you describing diff?
> 
> 
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 135 ++++++++++++++++++
>>   1 file changed, 135 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> new file mode 100644
>> index 000000000000..ab8d8951d21f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> Nothing improved.
> 
> You actually ignored all the comments from me and at least one more
> comment from other emails provided to you.
> 
> This is not acceptable.
> 
> NAK
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

You are right, I apologize. I missed several comments.

I will address them properly in v3.

Regards,
Atanas

