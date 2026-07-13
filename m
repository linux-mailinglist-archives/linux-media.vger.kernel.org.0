Return-Path: <linux-media+bounces-67442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CrA/MW6jVGp8ogMAu9opvQ
	(envelope-from <linux-media+bounces-67442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:35:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C5748C40
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:35:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kHVr6hFX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BUX4wX4t;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67442-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67442-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B9763057759
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D7D3A6F00;
	Mon, 13 Jul 2026 08:27:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B3139479C
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:27:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931240; cv=none; b=pZvbKZ+W1IT/QIUFeTeQ7yf+jaPXRpULcV2b5uDWDfidhLhq5xYk7r1qaRdFo/RACUo9gruXenM/riQoXK2r4IKb8sYW8WT8ptd0uACEA4WHrkvrjnI9U//rLd5dL6PAsCyW7iVWipZ2h+IroyItmqnvlgskpaF5gV5C5wdOA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931240; c=relaxed/simple;
	bh=rTqT5pIKCF31nrq4i98eOmJtbI40y4p67HTEO4XR8CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaJF6tpsF0ccVzLz8Cca1UDhAVCRHyfA8INViJtp83AMawaz5YawfZ0mcg7gBc7ABN5S3sWEBVZ8ykHPaoKx+RGFKtMBfmMC8u9/4oyQ0/1JQUeXMm9Fp72S/s52R78cbfMzUymtH1Wyh9GK14/UHpQcmpI0BZxPE8mwG5Vjgtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHVr6hFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUX4wX4t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Ka5o774638
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbF+Pq7Vc6cfmQhQ+gA9qh1Ng0Me279r/rgd3g/6AuQ=; b=kHVr6hFX8abqGXCZ
	/inwf/a/KyYRhq4nj2z5rFiJ27ePbFi3BiLZl+NNlUhdePQD3bFzTXkxlibw2EfP
	vHSzsWVULO4ob/TF+jLLIVkdSHNRW+CY4YMrX9/rfkNWKg4tBkTCx/MmhCTpJQgb
	vFxu/50YUMiMZwRuoEiUjHm4cwqfioS5m9uK7rz0a3m+nijd4jzQOLv0MJhEwV8g
	9w0bk9jOp8usRJjinpv70HBCZAR3wMU+B3VUaylxP+PYQQOkaID3Cru5zMSYgZ4V
	+AQC0+tqgk0lODOz/jhw3ODmGIu8Ef6D/l1PENrJU3SD8kxrpeqgZ7qnLfoxcShA
	ZoiOrw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj0085t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:27:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f08560ea44so44189586d6.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931237; x=1784536037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbF+Pq7Vc6cfmQhQ+gA9qh1Ng0Me279r/rgd3g/6AuQ=;
        b=BUX4wX4t3RwhRc03gntAgstAxvuPgJ+T9nOagTZ5aPi3oJK9vFpYXKlqhks7czebzh
         o/Y6gYueLqOWTYQ7EuKapVzoiKRasS2HO+1nz6qjru+neXas80dkCfNH/H6o4ekg8u0n
         gFzS1Vn/vrUV/loDiM9pxwO+jiJA0Lht+JlfE1ErNPWYc/Q7v3wSh0M5kqO+t7YGgNfq
         3tbKGssGfQ40O37v9a3qTEQmLBRNX4h7ZQDQa0atGeT7eHA3bmsAdrQ1KTfdtbVHUmDl
         bbmyJhHAqUo0ajpQnPR2k3DOr3LUWfGBaFI7nTHRP2L9qG6Ww2PCzWZNGPm16I5Tn7to
         q33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931237; x=1784536037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbF+Pq7Vc6cfmQhQ+gA9qh1Ng0Me279r/rgd3g/6AuQ=;
        b=HgtPQIEEWgQ3zfhXmg8YIu2Nu3ryG9qGkEZrNx72qQ/19vInqiph/sJgKR+ea0evz3
         iHVD9aPQxMQD3OFhyf71jB2G8Qfygd8Nbbk0tC1tH2QkBAqcYuVejtraBV/0Rjp4bRMx
         ZgcKN6o8vm4tAbnoDlbxfmwANt10c8mu8o57dP8kln4qLW5Qsm5POLz+CZdeJwEv1X5q
         0wk9ao7Dho6dMHfMmAAW8u4673FeR8eL4usgUx2FDj7jegT3UBd1Pr+Q9v5jJ6gZ1HNx
         G+xpRi/4yAHbved7r3bWyFHqofr4fmso/MQya5aMOx5Zmx258NTt98CQY3nLyZ6VLO2U
         gSmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTRQ5qR+kpgjCAldrImlSHONn5440eaGuX2Cs8Y0sZuLfxDK3elPdDirpcBAod1bHsFAIC2baVQdkEOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFCK4bKH4sR+D+7qNKub0EaNaEN+K8UlP/pRbqG9XQzO03hg8e
	dTaGx4PPuxf9adwECAc4lmCTJUB7O+Noa5N/UomY7ENPNbz4IAxaU1g/c0C0QG8+X+rnJiQgYpx
	RRCjmAUgE6CgBHczxh9YW+IgNEfpJnujxKeI5MZzcQtKZxhLr3d4d96gn03t3Dxj02A==
X-Gm-Gg: AfdE7cmZiJ6FZaiPLGcBI1eKJtyoQyU9+i3DJ09GufzYyWEAGalGm+VG4clqga4sPF2
	jmF3A7eR2/8xjE5EMTJOdDd++rTzcB+++so3i9uzI2kGTsBeR7I4FSJO8kFxRcXk/5vfC4Ih1hm
	XJ24aCih0lNLoRrxhrWQ7Dwdh8RDxFtzTMoIXUwPJjdwxg21w83N/t5dq2f4+ozMqHQ2cW1VaLa
	P7IOKdKuc4E8efq/PGijExPpgzqmE8J2UZq3K6KD5Z6FdSMhgKX7swo09O+kvuilPISTnE9qqNH
	q49196dCFTURkX6xmJNBL7Bu6JrPXHz6mcbomgzsdEqfD2XK9s7U3rwVogeg/Kj8df61Eqg+yea
	8uEoz9vTHF8B3iY+jXSiVABz5vfiJ5+AbatzU2oxEflU=
X-Received: by 2002:a05:6214:2387:b0:8ef:e3c9:533e with SMTP id 6a1803df08f44-903ff761684mr91705546d6.9.1783931237472;
        Mon, 13 Jul 2026 01:27:17 -0700 (PDT)
X-Received: by 2002:a05:6214:2387:b0:8ef:e3c9:533e with SMTP id 6a1803df08f44-903ff761684mr91705326d6.9.1783931237070;
        Mon, 13 Jul 2026 01:27:17 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cf68f5sm15008388a12.13.2026.07.13.01.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:27:16 -0700 (PDT)
Message-ID: <e9399868-a6a1-4bec-b067-c1bed8e83ab0@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:27:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
 <95207310-12ad-4c2b-9ebb-b0a7bd27dac1@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <95207310-12ad-4c2b-9ebb-b0a7bd27dac1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX10e9tB/aKQcl
 U1474NjAb3MVW+KDr0RIkzevTmhzdO9I5mtffE+986g5v4049XUd0e60KN7ZtjSJkdIaXCMWHs/
 9I9jH6sNmw5bAAxjKd4ATTl4tVLzNAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX6IRbK0UarKO1
 VZTdnLJZr7qVebRMp6uZrq8Pq5vUgFh/KX7/1HekYOyr2ZTKvy5xDwYOurO36iyfz/5l7kbMxaI
 +Y7rXTI/8D8VVLWrXX2bfbGNmVL3bSLFExQNjIKZRK3DFNZmWnsEYIjf438tEPYI+6Acw/HLRtL
 OWWWX6YU/BYXxIzLBvRF0xUGZY7dy5qgcfdK/LM4suqW5LRJlMd3qnAm1zXL4Q4AufxRy7fx1gh
 eVv5OBHUMsD+kffGAkvYcz1/7u3GPEvmGmAv5T8MBJYKk5JtxUrwIpjqyxwkaKcWLu+if/AnE0D
 GTo5k7sgklPA8ae36B4g/8NUMLEdqygbjzdQfN8lxPTGlGesN8V+LKd/Q1BzH1Ys3WaDNv14YFh
 Isr3Ad9QbUruxklOcTYNlfChgTZIFQlxAjAtGrnZP9AIlXtS7tonGeOAQhX5eHbdku9cQkRYG0g
 UWASRZ6Q9sLrJMGOt2g==
X-Proofpoint-ORIG-GUID: P9XcNW3U3UGWvsA2EK3MHhp9m33Yz2pM
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54a166 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=2tE1FNNbuGYNqW7gzRAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: P9XcNW3U3UGWvsA2EK3MHhp9m33Yz2pM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67442-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A1C5748C40

On 7/6/2026 3:17 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
> 
> You still ignored my comments from v1. You never responded to them,
> never implemented. This is fifth version and you still ignore them.
> 
> Please go to the v1 and respond to EACH COMMENT that you acknowledge it
> and going to implement it.
> 
> Otherwise I do not see how can we accept this, if you keep ignoring
> maintainer's feedback, even if that feedback is about trivial things.
> 
> NAK
> 
> Best regards,
> Krzysztof

Apologies. Inline replies to your v1 and v2 comments have been sent
in the respective threads. v5 will address all of them.

Best regards,
Atanas

