Return-Path: <linux-media+bounces-54460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PBgN7QUqGnUngAAu9opvQ
	(envelope-from <linux-media+bounces-54460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 12:17:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D53E1FED67
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 12:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 988FA304AAE9
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 11:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9F33AE199;
	Wed,  4 Mar 2026 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAg+OC+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxaJRc6G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71913ACA77
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622984; cv=none; b=SedLRZr5J6ygSpYzkl6jD/Zi2GMpDaizOwN1VaEdG/a+ThflvYx4mgHwk1r/w6BJ4yO5bpXlNKCta0s1EBjAKAh2pC5xb5rzNl3YsVueeaysn4uV/fHgMMYjCXCYAarkdqWho5xW6C6Mtymu1ZYrqdKuHySnkpsx+Lkf5LE19MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622984; c=relaxed/simple;
	bh=mIXmh6ePqgAY+9cwQ9GnatKCHykTJANip+0Y0nahi8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeRX5No6eXwC7FJZtPtPBuTbsAr3u/XLhl2tRpCLnBN7d+dcYW9xWBMdM/JOp12MTYDQd6akg/xmunOuReJjBkNfEy4evoPOEEF1EfLUAVJhFBoFHG9+QWAOCoea9x2RUYvtYAvSyE3cV0u3RnyVEqXksZr/DVb99O2Dq1VdpdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAg+OC+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxaJRc6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245UANf3114139
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 11:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xUGmd6c3yyk6d6lBHz7pcDkmJu6HnFa6rJyLjczVZ8=; b=oAg+OC+ZQSGQ9xt3
	RjXXfrko40o/yyVYEEi8EqbAiDmarQmW3z7VEu1HxYQhzmQtaYAlhbO9oXtx3CxB
	hzQrYJnl4Ah0NPk41RSgQNQXtz8AO8JsLZmb0ntP7p50L4yfsXH64/c/hMIBVL4D
	unfLU4R9QoycygmRA8bIfF9s4oVADPct4S1QtjsGpBcWxu0S5M5+zloe1yivL5Qk
	2RLJU7eA8lq/5SsEcTh9HvrgnHlSL/HZeJShGF5TfSzphHhZQ2CGoe4nzPSmjbSd
	10bTYSFcfYMdCxe9zs5Vv0kmQBtaJKLXx7w3TjdYP7+OR4EnFgiGEd3Qf21V3OSM
	CXDk7Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2ax10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 11:16:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8272abdecafso3886065b3a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 03:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772622970; x=1773227770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xUGmd6c3yyk6d6lBHz7pcDkmJu6HnFa6rJyLjczVZ8=;
        b=NxaJRc6GgnO1rqPz73fIzecWKAsdhfbpzobHyvmSm2RRriiMjLmtcIlN7hHxyq5RLF
         OKX/sgS4yVwZzGrFpoGgJlvumMcP74kAoew2hydbPNwTa+1qzZynej7QQGe+vin9wZz4
         nCQEk9D3zBV0wsH9a6DVnI4iMy+ASr221DzCicmAZ6cfXmPa3TxEwoNfdB3vImb8I/42
         kA/7tmlJWPm9E/u1INrPQ714+CZMU8bglTQB8ljjbXyTqgqqbvjiM4JGCnfuieirFKdW
         X/iZz28Vwoa0jMMK9K2cFJBovQZ0DcqcS2Css4Q2MvnOIUqCBp/bfV6khqh7YHpCsm3L
         +qmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622970; x=1773227770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xUGmd6c3yyk6d6lBHz7pcDkmJu6HnFa6rJyLjczVZ8=;
        b=vmUYc/eUkood7peHLRFBqqVgLbX8RmzrgybZXZEw/HoX5tOwTLMLQygn7zLaKLxMBZ
         75AwwX9UH4bhu/qojiF7fvwaywx2FZ5NvmPPqq3jAjY96acLtVh/UittJpxpB+z0NkE1
         XnTfYyTLrfEVoPoDgwu2XMpPk/CVtK5J+Zz3V/jBaKMI9r/QjO9W33DLi5vV6st/GUyZ
         RqBQ1454EN64jZ3qH87zWEx9CUYvwS1wmhkYw5VI6FJcoEDQKc36iozgkL6c4oadPPzJ
         xl6A/G3NEHa+OpM79K/8gAuNkZnP7o2qu0V2ELPTb+b9fT6S2DCVNNsfCkZBWv1B3Ih2
         GIyg==
X-Gm-Message-State: AOJu0YzAKuP9hNCWAzSK4/QAs27pQCT3uvLE8YePKZ1mmKc2JJhnsugB
	/dQbg89h3dog2W6509VNLha2MxWjjuH9xMGZH9umrGzzHb2WCbuGIE8CRTBlqpy73j3R6q8RA/p
	iY0Qg31/bIbHPcn5UDfhL4dLXSQX+oi1QpeTwgFtvwllSUMvvXO4TxWlYT7wl8P8xew==
X-Gm-Gg: ATEYQzw9lixXGGaG1qphq9f5osrr0Ro9T5pLx95lKVw8+CeOnJNv7olKlwehSDi69MT
	PvSdtsANrPsWK3mMjCroO49K271juKBGRAh7T6ZZokeCyDEnnIyVA4htLr9Ws28AhGC9rEG3LXj
	G/xL0QZ71Fg76kUBQDY9wa/nuw/hi7Y7J28jaNsMVKykK5b1vbftxtIw/7///jYTHSlSm12kxkD
	bVEPhWadC1KVqYBcwVd9GPjfGhZJ+4R0/OM2N9N1aC+bJ4AOLKxCItmezEwuy6DJ9eW0BrCEnlK
	wv74vWIrIuFiOsfGwyB5SjIEmPD0jnDFqxB0P82UISikoAyEWDNsbaSEj8dGmVpPcOoYjF2VqZq
	EkWTDrKbYPE1UmmrProDeRDxg4/iHcUG9Ps/ad5/wbDJHjTPIKNaE9A==
X-Received: by 2002:aa7:9a87:0:b0:81e:7734:9e85 with SMTP id d2e1a72fcca58-8295d95957fmr3947671b3a.20.1772622970288;
        Wed, 04 Mar 2026 03:16:10 -0800 (PST)
X-Received: by 2002:aa7:9a87:0:b0:81e:7734:9e85 with SMTP id d2e1a72fcca58-8295d95957fmr3947655b3a.20.1772622969809;
        Wed, 04 Mar 2026 03:16:09 -0800 (PST)
Received: from [10.206.105.120] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d544ffsm18625480b3a.12.2026.03.04.03.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:16:09 -0800 (PST)
Message-ID: <f4569240-dcb1-0d74-e1a5-8a87ae570d1f@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 16:46:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com>
 <a09b3e50-1967-486d-9489-351fa04ee8da@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <a09b3e50-1967-486d-9489-351fa04ee8da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a81486 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yWDKly2dQxHXO_9xnGsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 3JanOqH62yaDO6qHba1fAGLWQrZSTtHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4OCBTYWx0ZWRfX+gKR1E0+0xhU
 Q4ckG+WxPZF9G5+x2a8FlmWmaVpQ+O5mv2pxyfn0GDLqZscqc9KMMyChiY6gSOuG1VcLQbXqVqv
 sSTRpd/6gcqNK5RuBYYQ6SUja+1MqswRLtF8Mga0OnXSriB2gP4iz0pWGlE+5nxPg3DtCfX+xqG
 bLbY0iOkPg/k5wc4DWmLXeHiEqiwO1bx7avEtv1WMcprjKaEJKHxeiHMTVGrqXBCKwfHj9G6lkl
 Z1QVlXc4TXQmekgznIap6B8bG8ljLxeqHwIEmj2V2uLevWbCu11+50fFuyg/E+m4oEYLDu8AEW7
 wepv6KiVQqCSZw/r2Wy47yFS6nhHRnaNXVEAyKJkrTUfyaSmKl/NQq3gwJKw3Tfjoz6SBneOZTD
 rY03wvMfWDqRSi6bI+vuqTqTF/zklsTpcEkbbcCfqSqvH9VIlXeGzqM/wirNjRb70hnAV9u7aCv
 HtBbkJEvuXJTqWBK7Uw==
X-Proofpoint-GUID: 3JanOqH62yaDO6qHba1fAGLWQrZSTtHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040088
X-Rspamd-Queue-Id: 8D53E1FED67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54460-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/4/2026 3:04 PM, Konrad Dybcio wrote:
> On 3/4/26 10:18 AM, Vishnu Reddy wrote:
>> The driver was using a fixed default FPS value when calculating the VPU
>> frequency. This caused wrong frequency requests for high‑frame‑rate
>> streams, for example 4K at 240 FPS. Because of this, the hardware was
>> running at a lower frequency than needed.
>>
>> Add the FPS measurement based on the decoder input buffer arrival rate.
>> The measured FPS is stored per instance and used in frequency calculation
>> instead of the fixed default FPS. The value is clamped so that it does
>> not exceed platform limits. Add a VPP firmware overhead when running in
>> STAGE_2.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
> [...]
>
>> +	/* 1.050 is VPP FW overhead */
>> +	if (inst->fw_caps[STAGE].value == STAGE_2)
>> +		vpp_cycles += div_u64(vpp_cycles * 50, 1000);
> let's use mult_frac() and trim the trailing zero

ACK

Regards,
Vishnu Reddy

>
> Konrad

