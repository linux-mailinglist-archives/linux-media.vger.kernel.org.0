Return-Path: <linux-media+bounces-66732-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 28TqBMKUS2q1VwEAu9opvQ
	(envelope-from <linux-media+bounces-66732-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:42:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD4710005
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bdeFYYjN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="MWHsE/rd";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66732-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66732-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A34E731575C6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 11:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F293FDBE2;
	Mon,  6 Jul 2026 11:14:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A606F34B1A3
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 11:14:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336447; cv=none; b=olMd6cTGPb+zaNuJCh/ExIW3G/YeK15fiTiDguvAh7mFkr4J1VkwM4/cigahSiTegBB0yOMl8PfM3ujlLTjn4ENEEMvp2ZX3eY9VdvgZwGOnwgE3CQbf0Y66m4xqBvvNEPaCYTvAMe6rSRDpQA5JVy8dW7IZsJn/1FtT7ZsSAfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336447; c=relaxed/simple;
	bh=ZFGYDqdwTn4whiSyb0leAOdYQvwfKavHI9G+GMWcLMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MITiBORPry9EmUyxyBjX1FNaiHqNxkUrAibPpg7Jb8or/gSQJ3ddGrU+UQttC8ujjh9CCz8KDfrgna0Laqsqit1AyWhcwxV4h8fFu0Ag6eXAngzePrp794hYTWNqFfQRG2/qwt0ZKOrUb5M/TiH4gos8tr1yWy+JeGrE4S8w+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdeFYYjN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWHsE/rd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7w9245532
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 11:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVkGkwi+UP+7Nv5UJsgDmMLy2YeuLuDLIlV+Ect1Ssw=; b=bdeFYYjN9er90lPT
	w8eCkbrDUTuxnhk564VAj9dNeSfVkNo3skvBlZ2oZPs7CSelz905uqVJXT2wSztJ
	qYZNC/C9ZH4PWjKSnLg1K+5Ke6IP3KEXBs1ZDymdjPm8B3Mt29jm6zTpoW/EC2W5
	y7hSC6GquCSmt+/908UdN2Ey3CHvc6O5mfJEYlhFOvti741qFNRYnfS7IbPt0J5s
	QvYJ9mP+tW20eUAd3E1IjLfeNesaGYQACKQ40Ncyn3fo5mdvw/uakP77rhzqyjwI
	bkiJzlM3EeTC/oLnhyRR2UXKy6FFvfjjTncFM8vZaMAjLKt8ZxCdQfR/KAFKi/yh
	WNU8aA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98g8c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 11:14:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so9151146d6.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336445; x=1783941245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVkGkwi+UP+7Nv5UJsgDmMLy2YeuLuDLIlV+Ect1Ssw=;
        b=MWHsE/rd2Y/lWbngXGHXRyVA9wZOBySf72rTwoBveIVGHSOZQOhorc/QYufwGTHSDc
         Oss20a5MCYUobl1E2QFOiJmOua7vXS2RfHNntaaHmahpFcOIBoLiIGXsDKIsoeljECRP
         b0enTKt/3i4Udc336ZNW9x/13VkFwNbRJIHoi3T4iRQfTOSa6rsCXQSu34Wxz8y1pOE/
         ISqGJ76XN4rQRsa9Eyv2QD59FcYzn4l3o2dyRQESZXwv5tDPukoDRy6VoQmOPQDQNmtw
         vrQBCRmlEl3+TTQ/i7jiqSRwF2Q7gmEFXLUFP+oCK5b3XEAk1kNhJnxXmV0KOHxPkhHU
         Ctlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336445; x=1783941245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVkGkwi+UP+7Nv5UJsgDmMLy2YeuLuDLIlV+Ect1Ssw=;
        b=dHW0Ca/3yW9rPcu20ZeaX9WGeo3eQc8JxaeGNwac4Vo3NcM0aF5nA64p6adNdfKcmP
         Rd06O3VE/TYBIeR+fZADWbkZNKM60daJzQmps8Xu9mmGDDGNmuanKuZ7r+lVUJ3kGAL1
         rYNtuzvxIvKaCbpPK7JHE0amlVeAZs9gm3AfUz+mi55jA8Lg+bbtG0jyUzYoLQa7PUSU
         TkOukotzX1AH9B+0wPcyIjvTblYc8W1LsIrJ1wUTXIriYH/YELciq+VuiGzhyKVZV59N
         78qG6Bwxm/eX+P9qKn+5j3HEgMFrCOfXLHSyhHvTiHkK6tp1BQHYJ8lshlwtzQ3Y2V7y
         Y8Uw==
X-Gm-Message-State: AOJu0Ywmrmat2Lkt6zHWTYewH8mup7agA8FM7tuRWql3gAVlEdZQJ2De
	JMG3Z3IzcFFMqz6OHWEqL0VXsgRAblqVBZaaLGLYtReT0r8SOp0dLLPX+eXAQG0UOURXp0NBFyX
	94UaOlR1rGU+LkRwzB27HVWbv+4BT3o66f2LwZZrb4HSgeguHOUSbahV8KkWPKH3GgA==
X-Gm-Gg: AfdE7ckAK1rmIdVDSnFs1dLy3i20Te67or/yKw9n6bqj50oc9jodS2nO8Lf/74ajTjb
	ULa2qoRiBcAS61w1dH4hZu7JYjC8IDyEqJc6A1l7o4AGwXYdhGgGvuo4rdfgG9ELFDTqrUSZwK/
	vYW/+Ur6bb4itZq2zGMi4oePUVWBYTeAU9hcQCFvAADluUnsLRrkLi7nFYP2YbaHlrZAzKFagtz
	jAlOLmxdXGeL1xwb+UY6HsDN6aIflR0dC47BzB6pm2L0pK0T3GTFVcLPneaIEZ8t8ETCNEX02rF
	AQRLzi1xhvANYCDOHXw7N7lvB6LD3OWDhRJzemUFGUBXHlObzHz7EVFEK5PJkzNmW6uOwhwMRoe
	dTyJWPnmr4obfdsYEPTDHex+UMVGPAVsdj3A=
X-Received: by 2002:ad4:5f86:0:b0:8db:edd0:98d4 with SMTP id 6a1803df08f44-8f748eb326cmr98558286d6.1.1783336445085;
        Mon, 06 Jul 2026 04:14:05 -0700 (PDT)
X-Received: by 2002:ad4:5f86:0:b0:8db:edd0:98d4 with SMTP id 6a1803df08f44-8f748eb326cmr98557926d6.1.1783336444581;
        Mon, 06 Jul 2026 04:14:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cf68f5sm4014154a12.13.2026.07.06.04.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:14:03 -0700 (PDT)
Message-ID: <6c9aa456-edf3-4b85-b210-9bc9f0c48fcf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:13:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
To: Alexander Koskovich <akoskovich@pm.me>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b8dfe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NAQr9XkY1tkMq4hUmZwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX0GDjubL0+i7T
 J/MaJaNp0Ka7VgCTCjubhY1Enkp5040IfJunGgLys2yEbtvhM2AjCnwf8BFwTAJE3VGFWDvpTIA
 L8rAM0SbaLvNXBpt6WalKZ+96msjNwDoJVWT69lMfe0CF7ukIYLcuxSDnr6yZZJkv/ZBt1POWjF
 BDd5LI8cR4Xo2SSDAj7SAZbeAO9u+L+ReSKJa+yezpRFtmZ2XitKJW39g+LnhGRye2KXu0Qag3b
 pFl1/ZqrDS3afcBnEMBoKOEfswFbskUCeiKN3Fl1z/zKSyU078r/gzj6TKeGs8WbXxlL/vgfLV5
 7VXzTuQsGhT3rAeSTm/Orp6xBRC/fkJJ1WmOGWQZNqNeGikSoip/96AoE+LtJKthSAUyjUInqd0
 LWm+tBT6C6l/T1ugvagIpEOLdydbFZOzXn0lM4E2QnU6mAL+6Y14YgdjyTA/9+XloWJTYqqjnfx
 FcwW7dlnkDBBIvyL/mQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfXzvgY5QuPncjG
 BeYdias0rASKgyVWU46b87Sj6lvn8r80wsirJHHxTTgwY9pwVvSqT/I9xZwWIn0pfvXGh/X8pGk
 pWRR9vp43ivmuzrBq2koKNTphoBFyLA=
X-Proofpoint-GUID: Ng_F8hEDljhG6Db0OYRyW7n_cmyMB7FG
X-Proofpoint-ORIG-GUID: Ng_F8hEDljhG6Db0OYRyW7n_cmyMB7FG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66732-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,pm.me:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CAD4710005

On 7/5/26 12:10 PM, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +			iommus = <&apps_smmu 0x1960 0>,
> +				 <&apps_smmu 0x1967 0>;

in case you resend, 0 -> 0x0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

