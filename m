Return-Path: <linux-media+bounces-67438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UnriKWWgVGquoQMAu9opvQ
	(envelope-from <linux-media+bounces-67438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:23:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA023748A08
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:23:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AzHn2qcV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Grun18DN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67438-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67438-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6056307A321
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4383A8727;
	Mon, 13 Jul 2026 08:15:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21383A6F04
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:15:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930546; cv=none; b=bPrm2bfR1bttNy8r7+agtpI9s69v4Fp4DBH8BMZxYwFTxIbVqc4KZOsjXtgcDT0Bx5p3NGXhq5SHrM3KzjK7Fwq7qeRKo0cSDJHiO7VAqfM48SguZpxZzvEFSFgprP/3v20nm4H9wii9ghA13Rseqi9xiF2AnMtm9DezeCNd2ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930546; c=relaxed/simple;
	bh=EdjLsq9M6e7OqSkAmpQ+Nqs0l3gk1yzZXSScIFmIbhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct4rAQnsmkmCIrFjUZlWupwezpi51Kj7mWceG8L6CW9NJ+IAuVX5qwOLSxM+H0ybKRWAQGDw8JdnZDHmj4TzV9rmb3FRzVygA1kXVUfKJdK43LLWlci1MwWBHNhHUahTC2hiw/7kmTFDRJ3W9ktjCfsSsVEOa6fNc+6zYeZvuEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzHn2qcV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Grun18DN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nnan668802
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=; b=AzHn2qcVkagJU5OR
	t6cv1tarXsnmnbbeHdvg9mMxYIfyJYmsD7EZTyS6TsRjmPvNqr/UadaC8kUPurf3
	2ooWfwx0l6C8JMx6VlDVbjz2Bp2MERbPVuF9gs52QwOWW7HXEGFuvy1Bv/77FoKi
	320vlf2PG+BYtGvMdahwCoLSrhzwGMmRFA9mjxDlYrli3p2yQTGVJdp4K0VpDDIR
	F4H2GKqVyxRrNJ52oVijhppdFaBWddttDA48+z2jPoUAUZyUaiopbNBQQI4o+ohR
	hgqNXE69A4g/36Z80sDlJCXMP4OWyurCqH/MeiMvwTx0ejQdd1X35qdnCtpBex+B
	V58RtA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1krb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:15:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a87ef9713so40215901cf.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 01:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930543; x=1784535343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=;
        b=Grun18DN6JUCs53A1KK+3OCJKTVWnewdu9Vr4HkBg4X5h386sw/pyZNVZCe0Ehg7lS
         8Oz28N4SfGd7ded2jEbtvv5h5SAP8ukXh4CUj4wNM5K41zXsK0TP+TfnqTEo11xlp+IZ
         pcxNkzNz0S7JwzwfDjM0zREf4ZSO7j+PGoY+3LbEhfS9+QIjgu5dstxhu9fJe+BmdgEl
         UNkO8Zt0WV36ACUH4QMD0EqDatzM1eJim/a3Tzc09KVd+IUCkvFs/7tgsVMOs3EJ1fLf
         Ydqb4Px9MCFTtkGA5hC8P+PGocOzS+oyxO30xYIrG7MK8lWjzYPzm+Ukdbn8fuE9zZtq
         B3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930543; x=1784535343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYHFbZGRRNFT4amkHvvjb5FMBYFszZHEW6vn0bAyOM8=;
        b=a8u1OqUWyKZyvSAp6/EgDU3gKERgoOjkwgyXkWhrhgzESC6/66oSVt6+IhRnyahK4C
         dXO4ptrYPg0+NiZYCMpI9l77s1S1DJJ3fLDHtl4L54VgepzWhJOy72FosWbAfBfcCHo2
         3ubb+x6UgVmbQyg022ydOiXfLiPV95i01LHPxhmWhkInev4TeTWWhsbgxBjSTH4iqOLO
         cGZ/iIYA0kVrOQPO5D73Xz4rXcPSyH4hpF2GI1zgVPvEdGVvq4KjfNE41xKib1AYUW8Y
         dtVjl7WuSHPkA1+P6OhqR7AZsnUvQ/dbTv9SE7StL2S4TRH9GRnVa8Z/SxuDMLffZu+1
         B8hw==
X-Forwarded-Encrypted: i=1; AHgh+RpeJj7J0S6HvVFjthrvmeN3kjcZ34OMJ052BQ44yTkFh8R1gQ2OpvBEp98T4oKXL0NzQjAjOrgSaoFZOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+htcXZgSYjdSS7o7TpQDLCT6SunIt2gLmxuarF6hgtgdmyhg
	CHLz9NCD2vO4H1PPlJGeb321FIWbqnIEL7HsI8PnpjJBQ6ALmD5nRyEaKpqbJdh0i/JOazMTyb1
	8789kI97j5T2sYLRAndOdJefXeqRkx2ZwTBtKoSeBG802zAdNJDZwNF/DY87qtSjO5Q==
X-Gm-Gg: AfdE7cl9jNSo3kv5I6urgo4AfPBCaX/wcBx4v/cIintvUQaY80k6dEdXfGy12Y61w/t
	ELpO197r2VMm6Yh4juD4vsOF1s/bEoICigq618Qf2aZ0dbgwk/a3JxIzbwBSJSz3xWn6+Oezdui
	IJgqwH7PuI5oMFYLRf6QinDEGEDvEXftObId9w6Yb1TlVNVTU9XBAS8zKZwF8ekBVfzSdsAo+C0
	WIcU5n6P1rqvB9A7VPCI4nPcuZy6Ce2zVMqsyVLJfOINzquuqZo4hX4oxyBoJ1D72iceiOw5Bba
	ZZDbm6Tle8nAqmZ4S+voI9jh/fvxXLVbC+Zirqj6kDTgTBxGVkO/q+coQB0f60BprLAGetaB+sf
	EUtkKcV6SR78u/T4/6kR8CASkVZuJiUU2mvPDo1B4/qQ=
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr129267381cf.0.1783930541760;
        Mon, 13 Jul 2026 01:15:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr129266901cf.0.1783930540269;
        Mon, 13 Jul 2026 01:15:40 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e19cb6c0sm606414466b.26.2026.07.13.01.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:15:39 -0700 (PDT)
Message-ID: <388c8f3c-ad60-46aa-9ade-042bcd148dac@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:15:38 +0300
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
X-Proofpoint-ORIG-GUID: pj4yPmZESlZL6m3ijPxclYYdd_o-2aRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX4AmvtMU9mqTs
 pzF8JjFIRnzpjUcU2uAc+9ACZntxlzrsJJBJWg7flFTj0shOR9qccKf9LlC945waRLDoZVuZjIj
 iKk0JDGTEXyMfMejwgN8HC4FnzJmO8Z2h8qlYSE6RsSvD5l7A+7B3GyAKSmpmGg5DYh9b/K+IEK
 x0/15LCgxpxgNz+RAP+QbmF4SmoO0XccQRKLidPGXm3oabPRsKQwFaR9GCz25rVzdsZYNUS8kc1
 IvKR9HVJzMESJ+DPXtfdRREuvotJfpqszPAlTu+aHfj7KStpCexr+3shb3QM/vUxn9rUBVSFTnY
 3KM09QYp+df7/9PatmowpgizkDeDE58dvBAI/+7kfeKKOtT78g7WdKQt/w0nWMfQG7cOhBxTkPf
 2p0ALu/fkWE7FIRXYl3l8gA+vsWK4Zuj+zLrh26RUAVO65vhs/0sXjIK0oWn0hrnKdBVnhxfk8P
 gza83kKaBkesiQRHq9Q==
X-Proofpoint-GUID: pj4yPmZESlZL6m3ijPxclYYdd_o-2aRr
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a549eaf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zbDFh1kpPF1_w5UJdLoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX400ZF6kdwRHP
 YsG9fd41CKlhUkxoqaRd4mgiiY4xl633bnPAKIXW7XjMBAB7S6DisS9niiE/9SFdMavF4j9LS3t
 0h2JlxaPy1hZM/xFEyTj2VKr4eDDL+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67438-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: BA023748A08

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

Acknowledged. v5 addresses all binding comments:
- "Properties documented:" section dropped
- clocks minItems dropped
- interconnect-names renamed
- power-domains added
- binding renamed to qcom,sm8250-jpeg-enc.yaml
- JPEG modelled as standalone peer node

Best regards,
Atanas

