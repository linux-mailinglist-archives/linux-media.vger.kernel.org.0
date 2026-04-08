Return-Path: <linux-media+bounces-58231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOWHG3JY1mlJEAgAu9opvQ
	(envelope-from <linux-media+bounces-58231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 15:30:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD83BCF05
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 15:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ABB33054F6C
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 13:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3736B38E5E8;
	Wed,  8 Apr 2026 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+KzvTfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iffV7E25"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA3F3890EA
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654706; cv=none; b=A3Ngi6XibSOeqGvoEp8Yz+Uh188RSS+fVQLe8OCLB3K1kgNCfTaxBEEWGt6lmsGvG2f+/yjAkKtNhJeGcDTbs88V8vUHfzBghLEUVjxUYsddrQSt/qO0cPl/ztHTbxOtgBCQ0FoDykobTgtU/5Y+dFX+Uc3RMcMLZZpYh5DUr9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654706; c=relaxed/simple;
	bh=anUdhZsu/oWXPDt2FK230/Qz6pxZIc77bUnmthLzFMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2eJUzyfdjV99Z5s+WT85rSFYQoYhfPY6N/qHfjYpH+Ow950NHOn8MFxdBzDPf80xqHjpr3IUtyOQ7YchqgjJXN80mchDlD6j3ey7SgiJmxzJEyuR9ELg2pcrpGwtfOs0ALgJ10jBEEJYTx/lrXtOTIul8XV/Rxno84fvH9mvHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+KzvTfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iffV7E25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638C27wI2450585
	for <linux-media@vger.kernel.org>; Wed, 8 Apr 2026 13:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inIahzzi5Obr1DFc58em4nmclXOv9qDL7pCV6j6QphU=; b=c+KzvTfh1rOSkiRU
	rQ5oJkWkRlDb5Qnv31H7Laa+XpgExUU17kk7a6us4LuaORg3scobrAhZ5z4ZaXIT
	qAWnV7YHY9lE9R/BKnnzaImP7JIX96yBmzRfUIGXq5MEI1VYCKXzxlC4I2JpdeiR
	OJLLC6xmIXnMuOYLz/EuqKL9kYt+tyF7A3zdPd/nyi4jp3JS1tZ4FSB5/vHk78Og
	6gGMG4/RlawgFsvCANEYmBbV0M2BQ4kVpCC5uAZ7K1/yxg+1UWUG78oVP4meim/U
	VcJVu6Lm6LcXV6K2VfeE1BvmRBIfUroJaPbu4KtvOD+caVPdHOvlt6AbE5ySs5Q+
	BHyejg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae6awtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 13:25:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b9074bd42so19507321cf.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654702; x=1776259502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=inIahzzi5Obr1DFc58em4nmclXOv9qDL7pCV6j6QphU=;
        b=iffV7E25+CmCL5wxLpodQG3p3Je7ZAI1EM+aF6bDKb6S31H56M6aajYtZHTQPRhRYM
         fiOMb0eJXp+D+0ZA5LIhPG+bvEaz+FMzVB4Qgc22hRB+ndePeYQNdp5Z5ieLYqRd2ldW
         tGx7f44B/txYKADoFTaAKq9IrkxWk202svNJfpREXGbUo4W623vlqUBgKbP8aCnSyqCj
         LiUphuG3BrZL2wbNPTMgiMgyQWawNnVKdQDp65zz8tFU5Uh6eD890ab8RZUJ2cq+6t4Q
         C7nvMLOsrxD0PMiWxg2PAFvkzEIWX3urB4b4J2C3nm9AwmHFu4phlKT3cCWRUU6qlNcC
         JC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654702; x=1776259502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inIahzzi5Obr1DFc58em4nmclXOv9qDL7pCV6j6QphU=;
        b=X5RYjyXpxk0e83eLoQaYN2oJAokKfNr3tSoQmlCGer8ZiCBofLQ9YzkTkHNyQ/ApK8
         V2BRUgmtOitU5+bpv4jh0Jc7ZcCHEeTbQz03fTx/Ry0VTNenI9/fIAXU6mOQvqhHIcyt
         nGxFAFQUyCdve84modAdb2MfxluKAqDMXjoz6A9DM91f6mVnYUdysW4xDkJhASzy6LE5
         CLCuJZXINulr3eDE1wntrtqy9RW2DkYwUmm5oT8RcLyMQ01ydrkTPqzMxgcKd0puO0Dx
         Rkgaw4K8wYbsfm8ONLlJt3Lxx380JqO9T4yxkM159lFgPICs2ydek2pvzhH6PzkTy4Z+
         VmnA==
X-Gm-Message-State: AOJu0YwmwcV9ScN2ifcH1JG99Crc2flRqd8FA1uT6/zwSTRv0/pc0tL9
	pRDZ4mf/YEbtE67iTFq5egc8RKxagZ4002Rh+hIR8wgU2A3cCS6KtPvRLxFbw4TcCg6HRi2Cyf8
	WLQBgYkggUtLzYpvEvqEm5/kr9SnsNTDRNL2NcwkoXcf3xk+nbGtKg1okHpGx5PuUmg==
X-Gm-Gg: AeBDiesLjOgVmmEtiSAJ2eKWE4oa7UdaRy/FVy4bN2kAI4ch5lvJ3p8y5yJMQ2aJ6jd
	um2egUpdtCky76J2+odaPmKOxYd1mlo45FOB9XvIgAePez0ea0neyehB2D9dc0mUW3bz/5tcQMs
	yLhPqyOwXY6WqT64z+O5Fhy05mnbOggqX3yUPQZqTTRrEFeCizvwES1p8e2hX+kuoOdlHS8ly4g
	1qOAUHe5KBzGee07iAOYjkoNLW+Jaz9IPgx612fgC6GAvQGNRWoR1Fp0fEeyXcAXpXTB/9tDI/r
	9WkORltlhS3uGNDHqs39qVO+1jHJwY6XMxjcC89OApOqgQpRAL0tAUJ0t/Kf+2HL4nTahQnRRrR
	AOG/urVzHWIZg6nRYuKPXygoZmVmYRkReaEd+/TXb5Fr57cvGFbkZbhEby043F6hnmRNHyxkXF8
	u1s0Y=
X-Received: by 2002:ac8:5807:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50daa1f6bedmr58643251cf.4.1775654701641;
        Wed, 08 Apr 2026 06:25:01 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50daa1f6bedmr58642721cf.4.1775654701010;
        Wed, 08 Apr 2026 06:25:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff131csm650359266b.52.2026.04.08.06.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:25:00 -0700 (PDT)
Message-ID: <fe166753-a491-4b1c-9b46-c1c8c3441cb7@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:24:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: use IRQF_NO_AUTOEN when requesting the IRQ
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMyBTYWx0ZWRfX1Snxg33R89jt
 c4ZkLTAG1Fz6D243hMVoUpMwt40TgBfq+JiLGPFHOAJLLFjR6iAk7PYbPPoJQG3A6VHba4Bdmsb
 +GzIZlH2bBXaXpTNDQ5dfZyUKdJ+2vOxA3E2nUaHPb9J+cjMC+8l8Cu3ieiuzoGFWOPryW6T22s
 giEXK6XPnhFKQGFo5IYRUQMOVrl5TNqawGXHEFBaN4koY508EkEshe9h+0VeA97gjyfDujpqz5d
 vvaoBtv9k0jCUh1X72NAkPSj3ugfh622NfoEKQLzrw9SDC+dTt5xCnCiPNh8Na/SttLHRKyFh5o
 YpxNCXv+yVzmb5Rkyoi+SWi6FRZeqpddt7kT08L2m2dzBS4/j7aHdI29vjokpf/t6RdqjGlWI9c
 2XOILdewtDgcevjUz8NRXdg67xH1SJhEUHECBxG/Qz+vO9FNtgI8Ux3MPbzZ3HqnFnwkCCEhxj3
 4hGv2NVBenqQ2nW1H7Q==
X-Proofpoint-GUID: 49lAeFVFtBUIKPhfxlHsD-vyG_dhEVM6
X-Proofpoint-ORIG-GUID: 49lAeFVFtBUIKPhfxlHsD-vyG_dhEVM6
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d6572e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UcOOtBqsNXsv2hi3nloA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58231-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4DD83BCF05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 3:13 PM, Dmitry Baryshkov wrote:
> Requesting the IRQ and then immediately disabling it is fragile as it
> leaves a window when the IRQ is still enabled although the underlying
> device might be not completely setup for IRQ handling. Pass
> IRQF_NO_AUTOEN instead of calling disable_irq_nosync().
> 
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I assume this was found the hard way..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

