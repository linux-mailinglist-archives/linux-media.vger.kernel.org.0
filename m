Return-Path: <linux-media+bounces-58927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO6hFkH/4Gk7oQAAu9opvQ
	(envelope-from <linux-media+bounces-58927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 17:24:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9D410AB3
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 17:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD28430D2CBF
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE653E3C4B;
	Thu, 16 Apr 2026 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYCbXC2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgshXezz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630BC3DFC75
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352896; cv=none; b=HHKfO32kNmyHJ6C139kw3LFxIvnXRmgdaBoZVRr+Tpng/FZY/7Ki1pGdF2nBeWjavhzO+nE3IzrD3kk0lytsaCVv3xOZEqFL29Cn5sclHSOq/yPQ4C/VYUFVZTVsRTakw+5uJ4cq5vg44RDOOa/6gYBHzg4onUGi8FTr6xUjlIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352896; c=relaxed/simple;
	bh=YICVe7onyRZm1cIU0ABm6cP0eaJuEsK/X3wiAhTzNoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtrW4jcklj7M+AAn2/DYHdg5ovt1ysoqfg9aEanTXcXaMbQ7iJ0qKXN8b11+wcgCJ88zttcO0t0uJ3yKia8ptC7iy3Xc2IVdRacjrdDjenpW9PdC9W2lnhd06ScNBNgmYllEf4/CafCy+UK7zB+34wcsR1BBjN9r/8ypXe4DAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYCbXC2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgshXezz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GDkoMJ2575995
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=; b=AYCbXC2mXQiuahsX
	Q7/stFtLHZjHs59or3bQVxEohitjkd6L1fjnTGb7RM4NLrTLiJzk3kW7TwUtP05h
	spk3InPE9WM/BqSV4IptViyyykNpVrdHrQHU0v5epM52rwMfPZjQZkBUF/k5hS7W
	/EyCEW12JRckofJtjT7W5uUSoAAU7jGlrKx/HO3qmmPjBm5PXatz/kvdBG0d0pYH
	6iPEDDghVrb7A5Pp46Ftrhk0Bn7PSYXRg1vhEi5rCRHLd7BWPYqcQkyrtFmUhLRl
	QlrZPOpbLiFe20gR52gaGbF8HXniSJSsEJU4YeQl1ohoJITdwUNVWGFRJJHvjBcJ
	V79Ziw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27hj5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:21:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so178547e0c.2
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 08:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776352893; x=1776957693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=;
        b=fgshXezzmGPVyTyW4PE2kfYFg7Ua/iXV/1Ux8sN9tH+2eqlXzSoUV4SRhSMk5UPpIP
         XEccPHWftZYLoRitqYDlsELFo38f1cAJ8K5iqxMn/7V2fp0ov7RswinJ061+Q6xWuYyP
         zn8ndcio/AgUovF5COuymu0T5K+fNt0nckDTOTlbVTnwp7lizTRUjmsdnwKTkNiyTQ18
         R1C+5KrQbgdgeAIW9iRD3KqdfGWHkQS5U074G/5t+XjvQ+iaPC5lQVAwyVkn8xg8mqkW
         bxZ8C+siF7wLhToSuLyr/MZHNSYcXrQJ72Pv+sR5vPobUdF4qj6uExCxt4jdlulHkTX1
         5Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352893; x=1776957693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyovkIqLQf554SqJTIyBdWxmLdxJG0+TibFnTWEbPws=;
        b=WtRWyPCieYpGW7Ko0NK/3X6pADMvuwgkWH4FG9Xm/NUfyzAgRmXdkf/QupnJN4FQ/I
         FNr6raqByRCS21L36cBAZTsmx+Mm4iDQzsCabuL7DerMmN5BXqF8bAp5sAc2SII1M6mE
         BoKNnRLxmJU4+d/krZPkVc0RvcTm6A+BND7erTh2CbmI23ijfOTjFB9/KctvH1Ps0t62
         wSuYUDm/biv1FSXSjMn59VSLdx93kD13hECJQu8Q4jsCPQ+NnsWMyNxswoV3ZY1EBGN2
         M5cYn2NbNwgwxM0XDYdSP2z7+qOOoR3R+xPlIN/iYZrU7I1KVqZ8b1OTVNt2lEoXgBqK
         dUhQ==
X-Gm-Message-State: AOJu0YzsNmwLIwOkgofsg2WU9SOUSuRNeNKUSFtkQieTQo+eI+G79hDZ
	tCSaOM3o44yvGUzm1WKp6RulVy/wsHu9X6S3UuxZkSm905DGQYPgqBKvxHt3LJNeymUedfZx1Q2
	eMQL8PrRvsRN6epaTrpb5Dbm0pyYy5yMhzFicKU0NebsAWO6Q19AuNltKq/yw+tnpDQ==
X-Gm-Gg: AeBDievm3lEOqigCXA8htStR6h6BeQ6GjoZJzFSAN40ETX1LwZGPsXWQfMaWDCTrmY2
	SO9OlUBYGGjiYYWmOqXFZnCUdSf0/bdEUWmnvTyCEw4HpBBWq7t3ii3qRBjNf/SQ4XQGJI2gx61
	ffcIiplVI7hQbeyESkvDZoNObmIrcxL89kLNn1CBiQKEZt2Jrs63aAW5Y2bBY22yE0zRp2r4Yl/
	Mfd7j0meYRk8qeUSQF0d4pC5um/seH0iO0JRUFqdzt2nEVNPeUo5ksfPgnwNjJPjdqSrbhc8XmX
	B/8Z01aohvAAwoLe4OKQIz7XFGLlnY6ZRcXr9lsNYCzW6KoRyttH+7yfpqmJulYW953YBCGk3UI
	hLVWZ4J5zbMTbRZvdWvKLe9LT/QZuXWefbm6Z+FXEOWqSNK6Z+ffMiCWw+gHEsY342I/AuqRPEr
	H9Cq9vKIhBV0ev/A==
X-Received: by 2002:a05:6102:116a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-6141e262470mr490409137.8.1776352893527;
        Thu, 16 Apr 2026 08:21:33 -0700 (PDT)
X-Received: by 2002:a05:6102:116a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-6141e262470mr490377137.8.1776352893012;
        Thu, 16 Apr 2026 08:21:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173d57fecsm181221066b.22.2026.04.16.08.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:21:31 -0700 (PDT)
Message-ID: <23574203-187e-4fd4-b143-e53ae17a7a00@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:21:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/10] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0fe7e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=d5ByKtP1W7CnrCxYHJUA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Y7WfFdsriCeVWnTGN1cLlCjPKfRhOdxE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NCBTYWx0ZWRfX5wyqJC7+XjWw
 kYIhk4mCullXYkD1eaDyTYqKFBhbDLRPrgcMykQDOM8dth/K5J0RvFoWo88239rnkpIWsMyITGI
 Nr834QQ2i4IhTzLhV+yG3EonS6tCwD+MEwzILOCqrwEJUIEMlQbH5e6E2say/ugBcX5fjT5NTaL
 D8wcyV4pkjk6jXngvCMLFY30sLU8uFIEbs8XXJhGRp4mrwp/VihSJ8JR11EuxbxWJbsOPWeZMai
 gYgMSeocKgpYMnJF2SMHnApFjpKVL2wzZdR8E99CVsAMHzO3nwINl2hkrqbeI/9MO/5dI2qBQL7
 gPNrE/cVSwu+qm+dsem46jVPfoHxsU4AS0FqaPPmaGBMTYrOnHMKutZjpKvEsu1HmnRIj02EPB0
 BZLq4SXGe4XKThGDZUNi/OiXvkfadcEAQcVFFf5jRtL6UdSX03Bnws079Mrp483mwDQvOH934L0
 yRZCwRlyxh+KEep1EYg==
X-Proofpoint-ORIG-GUID: Y7WfFdsriCeVWnTGN1cLlCjPKfRhOdxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58927-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F0B9D410AB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
> to these GDSCs to indicate that they are hardware controlled.
> 
> Because they can be switched off at any moment, also skip voting for
> it so it can be enabled later.

The second paragraph bears no connection with what the effect of
the changes you made is, whatsoever

Konrad

