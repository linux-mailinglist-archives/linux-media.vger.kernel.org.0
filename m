Return-Path: <linux-media+bounces-59031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD7aIelU4mnx4QAAu9opvQ
	(envelope-from <linux-media+bounces-59031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:42:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9B41CBC3
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D13093049E0B
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 15:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8CE33711D;
	Fri, 17 Apr 2026 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYcNLUAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5jkDefS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E3A26056C
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776440230; cv=none; b=pftVN6cdbarYlbNvG2tiTVjEN+gz8prqKSerklxObdmvFMiVA3jacMYtuw3I3xewM/SwvF4Fz4dKLViyawUNxVCj3ydLaLU+eQKXE79h49Rt9M5f/D1c3tGkpaVnlIkaTouLvEo/05vb0zmW1aqFRJ20Lk4wKQVqfSV7Ryt1Q/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776440230; c=relaxed/simple;
	bh=qJ6XgO+Z4q2nOaiJ/NRiGVTsW6eC14GjcLX2jUr7Ygo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nz+qcor7/6oGbHPwf8WcgG7FL9r4wjKSSlucSaBduAbWKInPvIMHOsfleuWfkbWrxISiPmd/1fYg/GbL5IRZuSr0bxHjxQWfyKDfNommdL2ew6pW/EPmDP4iOtYUR8zfDt6v8I+yaA6NC80ptbjx5NdpPqKKf6cPQEh6DINg1jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYcNLUAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5jkDefS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HADuSj1323237
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/kp6DxhkJC40rZeKpLXVuU3JvhzGifeqaHkyOv4r28=; b=PYcNLUAL58xTzjmZ
	6dq8x6LcZH+1TF+hilB3lsT8//NZYMLo7Kw11FWkGB/B2RLZvbhHQT+uw3y8FKlO
	UgSAbJJYQKld7kKAIbYwbZHd7AQmCJWXWDMMmZDQ1Y6G6L0ByDA9K0d2bzU4QclT
	PgcsiVpNukuEBLx5Rlr0sxNodY92yocCM7rxoDCP/WT8SdCRbVHoICh+YvXbKIB0
	lP86jCKc20Bf8LN1FX8yzfrQgN3R2l41JiLsoS6o64mnPZ+1BRDHR529gp/bmngI
	75zdxxmCurkua8Fh7NVNpeRZq0qnRmdilA4NmnTTQEKnn+3FrCSPki8tmbbM6apr
	2yK1uQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy2bjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:37:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so11295855ad.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776440228; x=1777045028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/kp6DxhkJC40rZeKpLXVuU3JvhzGifeqaHkyOv4r28=;
        b=d5jkDefSiL4t5K3oc91WRBI3e1fxNzEj1HVMg50jM0xelWnVxXRX4kiYo9kd0E+SVk
         iqpb2jip5hJ+uNkaTneNvlXroefzNbX41OXe3SZPYK5VIq3Wmz7DWAFHD7ra/NdR2gQ8
         y+nORwsFv/tHUxvSm2DyBnHaBpydT1vH0KCePjr0AAwjYh/y3APYtc0aYQJUyWrJNYMr
         OXLx++povc0EqQRLiLMlKTGcYuuz+IQEWJxmuC530I+9L0cDX9ExyODhCyipdrhTJ/6q
         rhheJVuFtFPPhbavenD1vpyy/hUHqrsOv4gZt+nMEwkwJT+RkPmwDjOkLpZcFiTt+kR8
         7S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776440228; x=1777045028;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/kp6DxhkJC40rZeKpLXVuU3JvhzGifeqaHkyOv4r28=;
        b=sgYIwTRxRAhdtlv6F+EYRyamkQa2wZTfB2oPJUl78N4gUjXt/vEo0fNvYAAOu+b/RY
         2Spcfguez+0VzirfyJnFKAnXzxVYtZ6RcdMQy78Hn32915NJyi+yXMPhTK3LjfNIPzcE
         7elAVZ4qzGuZWT7bqahCKXUXqhi7FncTVOzRxupFiZY0jYVUulotEHnlyX+7lr9Lz1VA
         snTcRXavkeOMrflqG4QTYJBCfsitqUcl9UxR2dAwRI+kKNa+BZUguAJrQWz3JIkngXnQ
         FJFimof0pF6xq7kTq/jPxxFyCW2H4QNef9HNj2YEaXyG52GlqKe13IEksKAIRfD+Ojz9
         uLUw==
X-Gm-Message-State: AOJu0YyIshHfrikMr3ZVlyL7L4xXUaBSj3hNWzrQ0riMdJAzugbM0Ady
	BhNVL2eERT0P9acDNRatWv52RrRCPTw2iAnUZuIW3MYV+NtEUcSGvBm58DKHNRluR8c90wlGywe
	0RH6/zg7KbxcHuak5b11EG+Vb5oGc8NjHxHScOtOY7rXMA4CJBdLuBcdqVVO1Liss0g==
X-Gm-Gg: AeBDietFgFPbnA/RbIhxAOvEqmMq+mVlXamCCvDCEBP9sfgELpFAnjEnsj5vkbUpzqU
	hXWl8WhKn66JjYKsdn2zYO3b0QOnXTf2r4u+u5Bp81I/0NzI0QpWBmkoa6kta5QAdGL4vNg2BAD
	optN7NZBbRCAiYh8k0x7IjW7MuxX0TA1hWQsWCqegV0I+5sc3jOcmHtRIP1509+ICr8iyvAsQ1L
	9q487uML83cbC2YU90NMbLaxAAkhRNrELyJuVQt8sLl24BZwKUN6hUey6++PF/FxvQayqmz2QK9
	hYIzH9gnaXrk/jCvfqvizcl3MrhsHDuk6Fm5dPKI5ebpJ29b6nae8BMyARh2eHB7nvteEF1mM+v
	7PZ20eo6CUUlo/xN7iWx5DKtQ6a1VbQtxyoRXkbmbUzIEXJZZmiaO4j4Uog+nXXU9
X-Received: by 2002:a17:902:f788:b0:2b2:d126:4e77 with SMTP id d9443c01a7336-2b5f9eaea76mr40171335ad.11.1776440227755;
        Fri, 17 Apr 2026 08:37:07 -0700 (PDT)
X-Received: by 2002:a17:902:f788:b0:2b2:d126:4e77 with SMTP id d9443c01a7336-2b5f9eaea76mr40170805ad.11.1776440227220;
        Fri, 17 Apr 2026 08:37:07 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm23819975ad.9.2026.04.17.08.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:37:06 -0700 (PDT)
Message-ID: <f811d6fc-bee5-bcf2-bbbc-408b777536d9@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 21:06:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 09/11] media: iris: Add support to select core for dual
 core platforms
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
 <d1834575-768e-4805-9e21-50a796690bda@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d1834575-768e-4805-9e21-50a796690bda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UVNIqVJGAplSu0QCzNM6nVMndwIs2OKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NyBTYWx0ZWRfX+i48v/G1LIjl
 tSDmx5SqBotiVmNsz0HKymLanCTykRyFxPbeVky8rAEn73dH9fgl9ySgdDHGUO3BRIt9+0BY5kJ
 3FhykvcWEsuvFEv2bk2P4e+0KW56/XlGUEi8h1G+mGf6rOmI0sf4HMi5wRqwJRpgXPaqBw+i4S6
 SCYFLepAuhKkNMWde+cVhCh3z3TkGeoHO+CdjHmevYp6ONsmCQdZVAYGK7CFg5MrybX7YF0QrWs
 bjEmDw1CjlKoQsaIudF3gZWuUxulhQr61rgPN2nUisJ7sBTm8xmUl4jYXJ8VSRzPj9IuzE/s1oP
 UcDFC2Wj6RzKp/99kTsSVG2Hyb/T1O0t1qEi3ivsmyNQYdlra+g+NF0O1hpTiej2wrZBTs7OkC1
 vY89yCNwDRLcZodWr+w5tkqB0JkcE7EaWFo4XIeVlyy+wmvEr9Qz8+nsL+8JhehQKKfq4KCoVZK
 w22guSg//vQq3dQiOIg==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e253a4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=039WMPxP2uN8QpXWscsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: UVNIqVJGAplSu0QCzNM6nVMndwIs2OKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170157
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59031-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7B9B41CBC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 3:21 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> Select the hardware core (vcodec) for a session, based on load when the
>> platform supports dual vcodec cores. Assign the session to vcodec if its
>> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
>> the selected vcodec core to firmware using new HFI_PROP_CORE_ID property.
>>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
> [...]
>
>> +	if (core_mbpf[0] + new_mbpf <= max_core_mbpf)
>> +		inst->core_id = BIT(0);
>> +	else if (dual_core && core_mbpf[1] + new_mbpf <= max_core_mbpf)
>> +		inst->core_id = BIT(1);
> Let's store the core ID as an index and only wrap it in BIT() where
> necessary to pass into the firmware

For the current instance, I'm marking the inst->core_id = 0 at initial 
to skip that current inst
for the calculation of current load. If we store index in core_id, then 
need to pass the current
inst to iris_get_core_load() and additional check required in that 
function for proper core load.

Thanks,
Vishnu Reddy.

> Konrad

