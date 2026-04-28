Return-Path: <linux-media+bounces-59829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIUuHXaJ8GloUgEAu9opvQ
	(envelope-from <linux-media+bounces-59829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:18:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF067482773
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90FEA306228E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD73E5ED7;
	Tue, 28 Apr 2026 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMPm6cXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPW1pYTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98543E5EE7
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371364; cv=none; b=ssFV5MCpp2dm52vH93y9eEZctKfy/uijFubPxXF3i8yOY7d2RhbJmaFqOv3RJujv/zrybhm1faV3hzs6t42+g1I8BjXSCLrul8nSISLOL2neiNwEP1D22RkiYUlN+gF1CvLyS9bbN9cHfSv48gzeTQwpCOgAAznC3barYXbP2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371364; c=relaxed/simple;
	bh=MvEi1EsRK25OVuV9Cq1QVbl75Tn+alqX625QMrIWFwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5DUhda6sUtGLaPFz/IVlY8J6b1F7cQvj43F4g7rsqyV5YD3/FQ9uPFVgII8EvbYbi4ZGA0TOQtG9mEfgvrinNIjhfslLd+kUS+IilT/oi5e4O7E+uWBJlsPwyjSv5ZXBW9/4KtP+Oo+t/Lg3cfT8uslcerKSduh1wqjfChbe8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMPm6cXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPW1pYTQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7UBpt440498
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 10:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DcuhAahfQK1r6Ves89P/ox+ku5EwRsjL3bpApW9Nzm8=; b=IMPm6cXvF7q/2tO1
	pdSAfsimIB6B1Xbd+JqIPJTE+OqA0Mo18HNHLzcV30C1WJn0P9/s2Qt4bCsRt8C3
	v6T7JRXNELV6z87MILDIGU71QTOFI7zFrTw/YsOJYt9y7aeP17KV3XEukTi9e2AN
	h6VW4f+azxqg4hJDchM3X4R69KhO0GTE3QJMsAIFt8QlYeQydAifr3IVsDCjwts9
	GCIAmuiVxn2Jkc0o3i0Dbt4bAtqRoyc9ULXz+6eZZkj6qRJqRt9RXACX50erP0rt
	qzZhEboZWcMw5xnPtMJf7JQpUu5CEwPGG2xY7bq24JNa7U5n1/BECB9nTEB8IqKx
	khAmcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac43w67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 10:16:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so26039971cf.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777371361; x=1777976161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcuhAahfQK1r6Ves89P/ox+ku5EwRsjL3bpApW9Nzm8=;
        b=EPW1pYTQmfTaOliETu3iqe0s1V7dPgZRSYE+p8Hp/1o+PRQH/EGj16X1+QOTPrIiCb
         1Jg6nmc08cQgcwhPybvOlCkRjforu+U/4c1F0a7F45IGyImoOcKMopkcZuU0zi6xcdwK
         2JoWUmF2Ty7IFfy7vEuRt3gqeYgxjqbdqIcpHJmnd9eRueYZZQkQmKYUUOwce/8PWQPF
         XW5wlrbsEwDSBdAkRR0VXKNxVpYI390gxVCgd0UBS84NscPmJJOciCBruQY7IfgOexYI
         uJcph3HT4Qklhm1sZaRp7/SfVFi9MkjTd/hsyJ3AxfsXEcle2jgNFzncAfonJiqT0WhW
         Bb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777371361; x=1777976161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcuhAahfQK1r6Ves89P/ox+ku5EwRsjL3bpApW9Nzm8=;
        b=rE4zfdcuzVDXJ1N4vS4aCdiAhF1ARUM2GzlhpunXosH343nJGeDG3mFTUtiFs1tK/p
         G2ki6Pgscv4lR34sOZ5y00tmduSPNh8OYGP/JJNF2par3dVWM2HN8UAujDmGZzpcOctk
         UwPDqmAFWUSmb5JphiAyV3jWLco9CRe8XAjaTvKGxMC1OKs/Ya9lBa/3YjRSvSs8Pb57
         xWwbA5bJtumx+uCyIisuXnHj6IBRUhUV3VNk67wdlIMCiHiVXr5g/ZxOF6X/bW6emp7D
         48KBXFf6o1+DnCPiIZr56IyCnDNrAJJPc+vAHBXj8cUPhGTo+FuE0jEzVFikNSQwpe5r
         zZTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hNOQuxiemUIxynOkv611H6TppTPPpACtFegMuTYvgWmj+NRHvOUtA67tr6lstCH4HbxcoL6myBm298w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxla2ZolbVwsgIcypW1/xmY8jMGTjagMkJZaohxtQ9pN8u/o1Zc
	7H7dy0yomt9TezXWNM3CpRkX8mylTc1VYP9Af3Cd3n951ymmpjy+Pw1HhYlFKr4qwjMWiWpmPI6
	1QG5xzv4DUdPVXB8hxv9pfu5D0KqMMXfaS5F3rz6JJ8cdf3XLTJztMf51q1H/1zGZjw==
X-Gm-Gg: AeBDiesMJN9Lk8NrWxvRd6GSM2r16SvVtCWxud61nYEWfbVMMNXlWnm4+2rBiu8XmG2
	D9Y8fADOCatT2Stc4swRyiuR1HCub9LKtYzgOPiG87Pmk6vGV4jsJ9cC8Ykp5Kjis0syKsN7R9d
	9TiJ/RRBjnhoe3ZtheQED11TdxXql9EWxckb0yYAy/Isii4XRT+GJP8s8ZWiuBrqz/8PGYgQ5Dl
	bXbGQ9NX4ALHKT6JpO4XKZGnpnjxDbTWJCWcPCzCeuwFiXQ/tAFUoiRxtGj092ZnHxhDYbUShOr
	EB7h9f3OD4vnBx8Cc+rtycHcbcjhmpz/rDksq+QfFO6rdxiOkfCJHg5eg/OlvFamCg/URIc4Oy9
	R3St74vPBTQvMPxdlGQ5+Kp2SNax7z4kt/fKgMPBX+9PRKkGSjwjnVEzO8GFxlQgSAy8PRZeMBk
	mAiWERaPqcVDwGTA==
X-Received: by 2002:a05:620a:1707:b0:8f2:1ccf:46d3 with SMTP id af79cd13be357-8f7b5ba3b11mr259664285a.7.1777371361194;
        Tue, 28 Apr 2026 03:16:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:8f2:1ccf:46d3 with SMTP id af79cd13be357-8f7b5ba3b11mr259661385a.7.1777371360659;
        Tue, 28 Apr 2026 03:16:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b68632fesm536532a12.28.2026.04.28.03.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 03:15:59 -0700 (PDT)
Message-ID: <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 12:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
 <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
 <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2IOVIqhD0EvxI3xiJCwrv3ZNMwiIijuM
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f088e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=V0AHvZjihEha2N7cGZoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 2IOVIqhD0EvxI3xiJCwrv3ZNMwiIijuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA5MSBTYWx0ZWRfX2wfU5Qglgr19
 lIPoCMS3lWy8AoGby00nkpG8ZniIIBPho7wrwwALqAUTq0RJ85wkuI2s3qmg0PoECIDkKXKkJmE
 hYc48iw+E4jWxDXt5zPz7NQSabh3iGM+G1te2XOsbDRPTVMkPrprWc2+XEeqOPnq7yL7OFyBDo7
 8oAum/Wj1pVD5Z3/ZK24EoHu9CCV1wXIgKiBa4XYgdkQNuM7g3ldFqLAo5ZmrbAO07+rZyUj5jl
 sBrJScnHyx9NR1mp24tLerYI4gWxhfqrAayZt8kIApyUvIiRffyWbRxeQw3XxSnmUD3SIzg7l4w
 NL1+rBV1qBOtxw7N2R2bqU+l79PYsH1JTgRWvLOs9CIwYMpWO492fn+saShGKSdnkVTOcVXq87H
 zSw8XZdw7RqWqHGJe5EY05xYwWqs4S0n81kTAtvHApJFif07i6zcEh2tfDMtiNV2/yh/2RA9Jvu
 mzg8LJHxKLEElncLs/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280091
X-Rspamd-Queue-Id: DF067482773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59829-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 10:33 PM, Loic Poulain wrote:
> On Mon, Apr 27, 2026 at 4:22 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/27/26 2:43 PM, Loic Poulain wrote:
>>> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
>>> Offline Processing Engine (OPE) found on platforms such as Agatti.
>>> The OPE is a memory-to-memory image processing block which operates
>>> on frames read from and written back to system memory.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
>>> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
>>> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
>>
>> Should the two AXI clocks be aggregated by camss-top instead?
>>
>> Otherwise we run the risk of the OPE driver setting a rate of A
>> and another sub-device setting a rate of B
> 
> On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
> while the capture path (VFE/TFE) relies on the RT AXI clock. That
> said, this may not always be the case and these clocks (AXI / NRT‑AXI
> / RT‑AXI) seem like they could reasonably be managed at the
> camss-bus/top level.
> 
> The open question is how the NRT AXI clock should be enabled when
> required? enabling them unconditionally (similar to other camss PM
> clocks), introducing a dedicated CAMSS top‑level interface for voting,
> or leveraging an existing framework to handle this?

So, interconnect, or some internal, smaller version of it?

Konrad

