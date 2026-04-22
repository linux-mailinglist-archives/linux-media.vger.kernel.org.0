Return-Path: <linux-media+bounces-59325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPhbAwm/6GluPwIAu9opvQ
	(envelope-from <linux-media+bounces-59325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:28:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 632FD445E7F
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BEB0305AA83
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD0E3D34A2;
	Wed, 22 Apr 2026 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyKNJZnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtLFN3tt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F9B3D331E
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860444; cv=none; b=pex6LyRgDEv7Sk3ZlUPqIcfpEj9i7PWOdTyvFa9H2fZKzv9YUqhYFT19n0xS1JT1YA3R1mLPKSwGp97EnbVH93GuGkSZQgxkw3Oz3lfJR+SZduVwcHqKCvr9oIDe18lmiDCS6Eu8BM6kBpiu5EVpw4Kx4ocId9JgBxAN+TdThN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860444; c=relaxed/simple;
	bh=OvXI+HDA1Dp49/adXJMTdbdphaPTr8WY9JhjFactW4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvGpuOYdVfPo19eXJvUmQMlwI6KGa+BpdvOUtfZ5eml97rXbaQPQNBIbrZxXgsBBwQwdIHW5ccim26RJqCbELbHFDBB0f54OprZkAonCSsjpTkPxpq5vYvC2VDl0PhqFzaBSZcUCtQM1qQ0Iz+Z7u1Gpcaqt05DYFAcx+ZJrmR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyKNJZnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtLFN3tt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MBLfpG727986
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dx+fo7SZ7LP6SxYmEnIte8ECjGbhzyTGN2xgQ+oIBFU=; b=lyKNJZndfWsjAiy/
	Vdo4XuxpBMjaf8MyhqS8DEf+jViGKcOUyIFluoKqtfDgUgwS3hBYc8D8l4D4Ai6G
	d0NbwrDEfg3dzzLxmVxM1Uhb3IGhQW4LbcxkEpOZNkdsvVYGQm7+EPV0op1g/q9L
	vzbpyOvhvKJ9cL6lfWKQT30Xsdd0YDo21ue72tukj5bAHMnQLmMW94lVyWsc0Ffv
	udpahAqA76zAq8y9zug0WwRAGWdcX5v1ebqdxVmcBJt38k7H04cbgT1sUDmmXU0X
	ORnn17Op2+XFoOoIDEZO0IkQ1vJBSBJwLYclH8OMJZF4AADmwpKztRKHHr3+wh5A
	EGDRJg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhb95d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:20:39 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9569074317dso256317241.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860439; x=1777465239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dx+fo7SZ7LP6SxYmEnIte8ECjGbhzyTGN2xgQ+oIBFU=;
        b=EtLFN3tt/vP2uZ83Wjj3Ty0ebj52CYTRqo7zk3nIPVHu785p8rNL8cojgLXhMjMtXT
         P3LdbhWoQ9SWKEj1GCSV/d6Yi6f5ISp4Csh1neXDu8x8T5jvo2TlYHp+WZV2NgnUMGOM
         CTUGwSAHs2pit0M0hUZh5VS7q1+p9L8APcDaPNKn3j9h4Ju5Le9Sf2TabTmyec5503x1
         ArubX0NaevzvqS252NlrNan8xsZthdEN7KmDu9LBUxXIn4Wia3BIJz43TMogMmq5PEnA
         hSqiPaj1BDmIpdi8qAMNYXGOBb69GPOz6R0Cro+Hs3lk2cG1jge1e2/aEK1bT23Bmyj+
         GO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860439; x=1777465239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx+fo7SZ7LP6SxYmEnIte8ECjGbhzyTGN2xgQ+oIBFU=;
        b=Kois6DEMPgbar7zgDuFhTV8Iurxn8u5M3vGYXUsMUan2JGf1iO0Uxc0mK1Ta/QSmsW
         PztF2gwTvfh3Uo5YJHuS/MaIkdRa45rtHL5Y2eyb8UJr+2hGrdQqKG9CDe2S9MvEDYvD
         5ScIH6I01GapZLdNVjTy/s+Qk7wbC9168OVjHbCC1QTYcaiOC7kxhR2SofkUoyYZku1l
         DYe4ELZDIEtxFTxfMrE1qoj+MAsgxeg4mcPvqtQOBJGaNE9c4YVeAI4bPIu6TpNnDtEq
         GOh0PuPE00tbJc07TeYfQV92ZbZSzFjbLXkIT8DSGsPrOOozFXhMdobGSgj7zUJkzK1G
         Cq5w==
X-Gm-Message-State: AOJu0Yya3PGAtlZU+ZIQtDvunYwioEy1IyNEFrlCfBt+ZG6HvJZP3Yz3
	7IzTzQa4MHt9xnPxVpwlZd5hxdZ9i8cDmfxRne69pm//S8Yjvds4KJhFYanvSpCTDarrbSwpoTj
	hnzn69jOJHqY01ck4ye3Me/LI8zZsusLpzZAUzIbE8OPXGhc//PaFpf14eW37CZgVaw==
X-Gm-Gg: AeBDiet8+MhxshmIXHEHjD45+nMo4nt/JQ3dz8G9/JoTyA9awj1vHmLaMJjdaDbeOzE
	WzmRkuRk0+1teBW+DCLjvmg0dFq/hHeUzItZaQ3EJ4axwNTrXKiGH4THJYULwbO9MZFRfLWKO4u
	pvJuyCzJaN2xXrTAmioFUkmaTWtO9qL9ZlwZ/ZwRraqT/k0GaJn41ujkUJQQUW9klHxYdHVkPXV
	IPFHctjTHMQHloZyH29hXs5jVSxoKE5sfPkzQE+bBg+5t79EocgM7iyLeS1NYS+k8e36ni94plD
	btmHwbvg9ZXAA0r5xc4xLxFa1Y/Zs/Bquci6V/sUU3ojZHw+IMafAylU0+7W2vJMu2LkDKWwrWZ
	xMQnjBhQAa94pUhehbuTlAkbEQX71riD0LdIFTQUbrMQsToz2/E2XK4NB+iYhj1JN+ML6VjpVB+
	3Qr0K32OV77o9kBA==
X-Received: by 2002:a05:6102:f06:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-616f88a28d9mr4163581137.6.1776860438806;
        Wed, 22 Apr 2026 05:20:38 -0700 (PDT)
X-Received: by 2002:a05:6102:f06:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-616f88a28d9mr4163560137.6.1776860438330;
        Wed, 22 Apr 2026 05:20:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6744dcdf29fsm2688364a12.30.2026.04.22.05.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:20:36 -0700 (PDT)
Message-ID: <f2e8c758-2b3b-4425-a387-6b4171ec374d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:20:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e8bd17 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=X6cb7EJwOZpD8-w0EOYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExOSBTYWx0ZWRfX7eeo1J50jnZo
 9MVunCya1B5YxNcMKqRHlM41UigYMBB6vg5eLnuQaXcBR5HKnC6c5/Q4kG2n+dxEXY38VjTms1z
 tX1aSnm1pWchXBzvGa0bScOl1Gf8vV1vTJjN4PhAWDAPf2wUYhsMNIwb35NFiPDSlPFPZi8pCn3
 gLlVQ/8jezuoNY+MmADzgy8nJE8s2JlMerDUKGJtUv3yqs5euKcofzSNEWAKkk9MLxaKWm04wFQ
 z7PYZGzNxeKK+nB3RPFW1mg54ZTh3OT2ckIlsPuqoeLchfgxah6fJjiX33OlEYNOuCd3vB7Ssmk
 pNA1NNELJMFgpUXHCDK5BF00evGh6MtiAX9+JCXa5hYNKr/Xuma7jC2tbNZAuogrkBIncO6EvqU
 KjKF+s4obJAY8yDXEn9lVLYbzFs7lBcrAqz1TS4pKz6WVhPczceAVZ0K0woN3XFfcNpv1TYr8ZP
 VTAZwfUTDyKlTRwPQzQ==
X-Proofpoint-ORIG-GUID: VcnQ3K2ciNHGfDeb6UN87o16CAhJKdFZ
X-Proofpoint-GUID: VcnQ3K2ciNHGfDeb6UN87o16CAhJKdFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59325-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 632FD445E7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> The state‑change debug log in iris_inst_change_state() always prints the
> same value for the old and new state, rendering it useless for
> debugging. This happens because the state is updated before the log is
> emitted.
> 
> Log the transition before updating the state so the previous value is
> preserved, consistent with the existing sub‑state handling.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

I'd argue it prints the opposite of stale, but the fix is good!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

