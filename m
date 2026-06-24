Return-Path: <linux-media+bounces-65570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QBuVLh74O2qqgwgAu9opvQ
	(envelope-from <linux-media+bounces-65570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:30:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F0B6BFAA2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:30:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fTBfZGje;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="B0NN/bEy";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65570-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65570-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64CC9313EB72
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 15:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537EC3DA5C3;
	Wed, 24 Jun 2026 15:24:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415C3D9DD9
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 15:24:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314672; cv=none; b=j8mLtysSeYwvo7+O4Y1h5HNHWBLlj4Cx7kDapBfqvaMyeP8IFoOgmkdKrvhD6T+BXeiZzMf5rDcz+e1aurU6lvsF/iGxbmskNkp2tnHgBcEvVzQPgYU1FWw1wY+2huZaK62ZW4FWY+p9oU0Sa1f99pE2bRi+Khm9vXdy1krJWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314672; c=relaxed/simple;
	bh=NIFqQ5VLQEybFPbf8kx/MQ9a3MhIR+vN3+q09x1MJnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFumokU+CiBnB5AEqGzHj9OjMegnRPJpaRlKP9utAbbeTcYhQh5l7XE8XIYSQkkzYLEqMgQRO/GO4lH0JkRvqvOKGEVNj/F7FKlPdfRhaRRc7Ifv+cSzkbK2rKrrKUCXf/hC7omiO5J6pOmd3Pmi4BNZj9ET5joPc8kitdnPouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTBfZGje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0NN/bEy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfOun1725273
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 15:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=; b=fTBfZGjeHvyz8W4j
	WDD6AK+h7jOGUQOaAAdxWSgm5Bfo2somcrA5WOUtzVa4BGUsInTmQtn5NrLivw6w
	QMZbGX6p+DuqZxOtOQ0XdeJLSlk/cKC2xZOojkZMvKMBihmMG/vCFnQvZqxiD3bt
	YobFQ0qvkqMddb2cykgo8ZnxoPFJcxI7UCITEd2EdFT2Kez0avO0yX7du2gDRurf
	uUCPRVUNrIHUq7ZddeHJCIL80zQP48STnmRoG9pl32GMEo+3rEDZcrv1qS/bOajV
	9a/bCKIouG6/JLOeu/HsJvYpmvfYpXLkMUA5o/aJrdd+l2dSdtg6mK108Lu5jj7n
	ekeVug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r32r9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 15:24:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a48fb4d5so10500365ad.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782314670; x=1782919470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=;
        b=B0NN/bEyPQixr/q1I119djo0iGzmkYgW7QyGjOTtEa98RCNyzg8WeM0en8c3pEQmKV
         XGRHG15kicGkyVAdZajLaO2FgDnYMpZpqZxI1VHogORX2KXz7bGA2nFHwwtGthX8Z/Ya
         1gbHg/AnprBc8XVzjC0bgmg5I4wTT/d6sGuJ5+d3J5oqIpzjVDnOeAvGhbhdVRHM5+wR
         9s8vGtvJP+W5132aS3ugUxEYR5g1a+NTExqRGQj7veuxoYNHVOuDWc9sLXKUfNSflHea
         ts96nF4gXrxMwXNtN3gxCZD8An3Oi3Msi9bKEglqkItPAXbNijwkXzg+rDinJkNnhOCX
         Yg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314670; x=1782919470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=;
        b=ZS7nnEVgZhy4PpVxTfyTrCymdcJum+uDDkE1c/0FUEjJwC3lqKTXxuCG64mhvtPMC8
         09Ep2HnpnofcX32DYqRasNnAam5La3WG1xrvhq8ucocFxVAel60BLiA8VxkuJtcNz5Rc
         +a+y7+wZB+m6Ao6kcXk0ps1E4Y+fpgnocPVMkTMX2Q3EjuqbiKYTpC/QhwMs+a+la6mu
         TKJ42/t06LyyjfqPpaWYSQUz4p2CYHJ/5gHozbUj76zuj1INvkN1QJFX35f605fspUZG
         hNXrXdFbmu5beM0on5IrG0Ge++tDHBI4c6Lj0wsk+GlzOUePO9jYgi+JGw9zBBYIBjUp
         L9mg==
X-Gm-Message-State: AOJu0YyKPgFa4fhv/x6k4IWeTCMjAbitzdaOr0svUYYv2pmA+7ZnGMvl
	IkpQVbsNlJZ0WgjUxGXm0ukJfDA/QKbA0XyJIhiQZaLseHsiwNYbMeeBO4yfHTOMEEY3mPAHMFp
	+A3VoNcgRxM/WksVcYOyk5RekrNueEj6sBxDV4DgkP1Vdl9mAAY1we/D0Kiw4sVsOuw==
X-Gm-Gg: AfdE7clr/5Oob+xXrdQ1reab8rv6QKSLKKY9GKmEiaaI3673AVCESDc1xMe8A4qjpWJ
	AK50lvj53dAqUmNJ7Gb8Gjfh0ETAviKCQSwy2yYQkGb95Xk83Q242d5CsP3fVRoj42U5KjScFDq
	qMC7BFfv37JEErAW5MbJawJE3PM18Nb6BPD4fT2Y7R0ruJ3CK4oPtoSK2fQgIvHGtMjPNfEXk8J
	dMq5DqWvMVW1pCs9aYaAAr9YK9dyPhb2WItTPrWvvfjq0rBc0/nmik3OYqVGxBhFWkerkoptObb
	kF2PhYhaMWlbOBua4R20WaTJIzEaDIaB1GOdYz4hPLLRiy3gBlJnScXVoPxer9yEmDPEaWeRLPm
	U2Z/Dq3n6AL1wGbdf4tuTzXpcKa3M3KpnwfJYHqZFT4gu
X-Received: by 2002:a17:902:f68f:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c7c769409amr78275125ad.19.1782314669403;
        Wed, 24 Jun 2026 08:24:29 -0700 (PDT)
X-Received: by 2002:a17:902:f68f:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c7c769409amr78274685ad.19.1782314668780;
        Wed, 24 Jun 2026 08:24:28 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac9285sm774625ad.11.2026.06.24.08.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:24:28 -0700 (PDT)
Message-ID: <8e49dffc-f525-494b-9489-8451aea6c7dd@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:54:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] media: iris: add Gen2 firmware support on the
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyOSBTYWx0ZWRfX2pNNLgB8KdlI
 R3qG+GE2SlxlckTohZu1/XIERWqGIlpa70Z5VYrNG6gmblUK573jxTY77qxlIdLOpyIooYSS5xU
 sdcdSgS0tJK8Mi/Fg81NR3ILnAv3Gi1XAHGfHqd2YhLB6CoQ79RkteFB0IDLXv6PYhuwgZjfMHN
 OjguxcMiFE7dYIxNIZPwniizzl8XLVx67sQh40gTPPl0P8zcM2ypIC5De0J1dcInfFjLStQhG3Z
 katk4Vm5p8tHXQdisfZsVQNDfa0q1f+n4ogaoq0tEKX5Z6C1JLL+DQ879AuFWYfnj0flGTyFDyc
 39ceEsTl0xgHMpLolfmlSF6nLKzdd/tLF2k1MBYlKNLKPgV4yrQJDPNAJwFFCCvoJfpZQcpy1Nd
 1w/JpM4gl2KHNgq08JD6xLdz08WdxQ==
X-Proofpoint-ORIG-GUID: Wgh-ULf-Iw3q7YwSpSyrcHTmA5XZMxDj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyOSBTYWx0ZWRfXy6RriotUJ1gM
 KWqAD4/y2pie+heTmV5NNpkmwU+/DZtzqBqRDFGhC4jPm1hvBWb3d6qzcmuxjZcT0OZuEyWrV9s
 xvgbEXSgX10H+CxXYwZ5Aus1fhSfRAg=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3bf6ae cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PGH3J_xsYvR7KH8m7zgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Wgh-ULf-Iw3q7YwSpSyrcHTmA5XZMxDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65570-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07F0B6BFAA2


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Agatti platform is using HFI Gen1 firmware, which is considered to be
> legacy firmware branch. Follow the example of the SC7280 platform and
> extend the driver with supporting both HFI Gen1 and Gen2 firmwares for
> this platform. Like HFI Gen1 this firmware doesn't have PIPE property
> (but unlike Gen1 buffer sizes are calculated on the driver side).
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  11 +-
>   3 files changed, 623 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

