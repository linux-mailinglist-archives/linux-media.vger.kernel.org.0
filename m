Return-Path: <linux-media+bounces-64757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K/b1DsQhLWqycAQAu9opvQ
	(envelope-from <linux-media+bounces-64757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 11:24:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62A67E388
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 11:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XXseLHuH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MFPX4uLp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64757-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64757-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 618A730117D0
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 09:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D3B370AF3;
	Sat, 13 Jun 2026 09:24:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9581310651
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 09:24:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781342652; cv=none; b=qHrELaLUinZAM18OAhRF8jx/thYr6cilYH3I2WuzvXfu5QaTClDaCNoY1c1w2ip19QpKNOlDFRjGs/sYRcyyugQVUaZxj/6U/RqqaLpB9aTJpMirZV+XULKsdKkxywOMOCuirskujcPEuG2da9IP9xYZ5hoqW6r4K3UMkwXPfxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781342652; c=relaxed/simple;
	bh=8cBHyxhK3M1DiH0ERPP2rDyVMsOU2ZvsmDqgPW5FrxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELUG+oYfcEbPSSKnVD9LMmxE2/IygU3X7TlhTm3n31G0P/NoZ4C6Or6iuRyltuG8h3fdVYiRrDwEGR+/Pjtb+hig/j8fVC0v24i3fjoq9pguMODHiR2EjjE78/Z9ndSGKTa3oBEZD16sxSBV5UT+2fGb9ct7LDojaqmpWF87818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXseLHuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFPX4uLp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6fD2Z1727357
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 09:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4S/HL/NoFo2ZHKsSRY4P5EPW0iAMj/MKdhO3xQ8vG90=; b=XXseLHuHd5l61azv
	uiiExBTObCduDSU8Sxvqz3MZwx1rLS34gSFrsJFXlMOy1kvg02/jMgiqfo77TSFR
	rheZ7sjCvjxAms7H+LedobecItRjAY/dEiHN5rLUVMmfo4Autxh9MBkqzRhAkSnk
	NKpGq65HnnOLoZU2GByWNRa7WBQ9ptXm2xA1bsf4RXuZ6FowVaPTIMrWMIZauSgZ
	TMky8B1AUm5fYi0OB4qQ2eA+5HeRHVzRGpczrCQhHLc9h3E0zMDN73qMgSKuYq2p
	YDUnEsYcXLv3XvInqBTKo/QEHr7kGXIMhLjekJJgp60K2CEmSfHuqqCb/h+F6aq6
	siw5UA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f8p2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 09:24:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d1d4fc5aso297941585a.3
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781342650; x=1781947450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4S/HL/NoFo2ZHKsSRY4P5EPW0iAMj/MKdhO3xQ8vG90=;
        b=MFPX4uLppbkMVpUdTfukZ3Pk2dkilfZ2zlWHFGsahvJ2iq3SKaS3+j1uY0FGByOW0J
         5QJnY5wPlzo+PT+Jqmw88LB2su5mFTPAJMxZPgVGuLpcgAW4lgFPAeEMdh0g/S+6uhag
         QBBqei08+e2DycMAXKGwsxnfIRvdYVfD9xiNvc5qNNPH3RplDF2OB+YskR5ME6awqgTS
         AYuNvS1GiPYv7uzW1rNiw+GjOgYfXhtLeT7mpHNvrdR8SHbXocnkpegyBBVqg3ahB/Zf
         mZxag89/+uIxdRqAIzx24ZFmDHG/UFabUT1nhwRPtXyoEciPfzeZ4feDRyo+CCD75W0Q
         d9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781342650; x=1781947450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4S/HL/NoFo2ZHKsSRY4P5EPW0iAMj/MKdhO3xQ8vG90=;
        b=rer4DkABKUxd5EJPnbpmt4rsAQJ3CApVwvaNZxKJ27LdGh/XM0Hmq4IPC7SXJKKz8v
         zw6FbEt9+tShonS+HkPDarCrlfdQFyEss+weEHgw6ZrEq/xBweW/V/m2wEYXL+KsmelC
         1M/rwWm0W+I+cd+wKlgsgPVYjikk8NiixmS/90HPXCa2eUisqZFsDF4a85tfOLg3Qq3M
         +fmVXjBfkRuPOV1dUb9dGdr5bNZ7zZXvY6FCjKw8u8KF44H+ASzd6Hl/aQFnGBmXRktV
         0sPkjoo36vMiQYNeGV1H1ho/MPx8Sqs89k65w2ZRhQc5y6mg2roZoR7nprB0f1U7pBQR
         MyDw==
X-Forwarded-Encrypted: i=1; AFNElJ9YR4sM/h/vCj6rF3EIGtk0MrjFp3br/goJu8pQwyNf55DSz4/nWDjdMcDdY8hc1xuiO7ulP+00NtH80Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTOfTYQwIYGtNSzMin8/sk73O8ABnoZWg0Uq87ITuFr8ulMpMo
	lim9/gQzZgXb+flHv6tHzqXkcBy1RdTn0MuBwEPZ8nLIeh7IRarKfKNRB0cUPQiwvrYL17i7vTD
	CnR4U7vdFi+aUR6aa7bXYbUZURmYOt9pwAEBHQfX+7GDRAp3Mn6OLog9jhiwNgkPF/g==
X-Gm-Gg: Acq92OEEi7jvu4j/kyWn++vi1VHV1sd3FOqn88WYpbRKVX6y1lsEVDPz7ztUMGezXiw
	IXhPwsu7CLhuocPkoS2WwdAID/CESthpwGTgTYjtYl+/0qSIrqHP5XmDLONybXjzS+c6lhi9jsH
	4TFF16oaX6wljdssNVLWgaDsF/AIvym1DGCQCeNUsaTJKXZlFNUdlwipildYtkxvAD0ny/CuPen
	GZtwOQR6ko5xSdVCSbmbTuwV6ssfu/RG+2oMwTIWdQJd485p8isFx1vnKC4pd5beFz+VSR5eyTo
	6/A25hF4IabJRb84zkKimg6n/l0KHjfl1DZJkWtEcP+TYpexmlsrLIBmVtro3yMyHjyRklPCbXH
	H9D7GN+Y0BxdIC5L0L/w2n3s+HM/6LiPTZiMsLK56H+89Pq9EAWT4eg==
X-Received: by 2002:a05:620a:1b99:b0:915:9e84:85ee with SMTP id af79cd13be357-9161bc214a6mr962483685a.15.1781342649967;
        Sat, 13 Jun 2026 02:24:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:915:9e84:85ee with SMTP id af79cd13be357-9161bc214a6mr962481285a.15.1781342649407;
        Sat, 13 Jun 2026 02:24:09 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341840sm201048166b.43.2026.06.13.02.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 02:24:07 -0700 (PDT)
Message-ID: <3d4e0147-8e62-4872-b881-1452f5e09e85@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 12:24:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
To: Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <n0iPW9ltP_HyfKgagM8MIvaGg_NF7KvUV834b6MPuE3llz9v6B1jdn6wEvXMkIHS_zLRsjnb7pXY3dURUOSs9g==@protonmail.internalid>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
 <8d230cca-2023-4a13-876f-d5db8eb200a1@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <8d230cca-2023-4a13-876f-d5db8eb200a1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA5NCBTYWx0ZWRfX/PL5MEJF6EWA
 acb4dzFEwRPZCTsnCV1oEIUFykOw36CDB+f8T3pyz2b+CMvDnK14EakdXfFOFV15MG9PYwi2lF5
 G2uH1FT4XqW7Z6SoeL/kqNmFksYfby9w7jbfddRJS7ibpnv76ltu4bELES7QrJM/1O9umEs3BsV
 jE9eJs1+JH+SahqcLX5ZI/JTGw+gy3u3VU1hSZc52X/EhofqqiKVZHknt5pEqdbEvGooGVowfmi
 gmbtUOu6ogVTOuRkb9NIKvL6s5tPVJJXK3ztXmvCciWrDFm5pLdFD9lDxWWzLhwxyFln5Z8+ftL
 6tGkqVgs+eLNzH7+nkoz4elo4oZ2f/DhjFFZQCs14G4N9+qD7N6PbeBZ7fi/rWuhQahclzQLsPx
 6MatfcwgNMP6Pppl0Xl0meHTK3Yqptrb550Fai9xY2Ia2/fhb2C+Yc2c2zIxR/OUPBRBr6Ns4xs
 6cwA0f5pgyYJxziPvfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA5NCBTYWx0ZWRfX+fZbpfSkNi15
 Ed31kmgmj1+NpI2/2Lcxw0LdzvxLiIsl6Bp55+2F60gIXSLB/9+gUNVgK5J4TgDEhL/HyEAk6nB
 LU6KBqF/9RLWhnLDVWy5u5AEZajcHAE=
X-Proofpoint-GUID: pm68bMGcIQUR1WsoCvoN_0apf596QYd6
X-Proofpoint-ORIG-GUID: pm68bMGcIQUR1WsoCvoN_0apf596QYd6
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2d21ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bWlYEoAHg9xnmN_O1lcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64757-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA62A67E388

Thank you for the feedback. I understand the reasoning, but I 
respectfully disagree with this approach for the following reasons.

While it is true that the JPEG encoder shares the same camera NOC and 
power domain infrastructure as CAMSS, that is a hardware topology detail 
— not a sufficient justification for imposing a software dependency. The 
driver is a fully
self-contained V4L2 mem2mem encoder, implemented like every other JPEG 
encoder driver currently in the kernel (imx-jpeg, s5p-jpeg, mtk-jpeg, 
nxp-jpeg). None of those are sub-nodes of a parent ISP or camera 
subsystem driver.

Making the JPEG encoder a sub-node of camss would introduce an 
unnecessary and artificial coupling: the JPEG encoder cannot be probed, 
built, or used independently of the CAMSS driver, even on platforms 
where CAMSS is disabled. This directly contradicts the kernel's 
principle of independent, single-purpose drivers.

The shared hardware resources (clocks, interconnects, IOMMU stream IDs, 
power domain) are already fully described in the device tree node and 
handled by the standard kernel frameworks — there is no functional 
reason to nest the node under camss.

For these reasons I would prefer to keep the JPEG encoder as a 
standalone platform device with its own DT node, consistent with how all 
comparable JPEG encoder drivers are structured in the kernel today.

afilipov

On 6/13/2026 2:14 AM, Bryan O'Donoghue wrote:
> On 12/06/2026 20:44, Atanas Filipov wrote:
>> +        qcom_jpeg_enc: jpeg-encoder@ac4e000 {
> 
> One key bit of review feedback I gave in the previous leaked version of 
> this driver is that since the jpeg-encoder is part of the CAMSS block it 
> should be a sub-node of camss as OPE, CSIPHY and other blocks will be.
> 
> Please take that feedback onboard in your v2.
> 
> ---
> bod


