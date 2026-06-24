Return-Path: <linux-media+bounces-65565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OCFkIQnqO2oofQgAu9opvQ
	(envelope-from <linux-media+bounces-65565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:30:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D408C6BF20A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:30:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S7do+JOE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GhhXnoDs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65565-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65565-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82CC1312A6FC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8482B3C10BB;
	Wed, 24 Jun 2026 14:24:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0CF1F192E
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:24:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311062; cv=none; b=s2jq5saul9DQfXfI5X6BG3twhegS36I4UKsNtlPScPrCJO2uVNroGdl7zG+9lj5QxuCaoTc9RBeYKMCZRT0xGa6iRaIlMQSBK674O6Yoxzy0zEK6AhhbG7L4uiuKebJf58eTCNkRixZ9fMQzz5ZqrNShHezCQDuq4I4UT6OCjJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311062; c=relaxed/simple;
	bh=sUH4mhOJLeZVGxgqP/fn1DEaZud1uq+TQEi69PSdzQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eSpv83ZL03Jyxj7yO9vK8PL/DjpqaGs9u+116lLbv9SusNQeQ8qtL/XE0A+TxuFx8LI0SeqwjyiPbcnPPdWmZaIzKRJ0TUwQxz5zsq+56Ol7xPe22+ri1uQaWp/INnln1cpMy/Yql12YVaEjo5cOpe2KCDWQLPvW6pVgPNS8Hpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7do+JOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhhXnoDs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANsoj3135680
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=; b=S7do+JOEZtLF251v
	kZ8G7PLpc/Jl0VwEErglZbMtl83QtidpQZ3YkR63hScXqeAsGCcVZZOYN7j8UiJP
	Xyf3Hi628woSSAnLCc1aFfpAfSiKTBGWsN+3s8AZ2zG6RF64j0KGa/nDM+f6s9eE
	6NYWD4jHtoK98HFwUA/stx7gEK96fLh9biXI/I8zgstSQ+WwwxyqJIXOe0zRoaJu
	zCXAWshwu0OjpjjZrBK+ICJ7GQp9xl6+GL8rf5stDGKVygwhoWt8Q7lEX9wfmtQe
	TNMFyCtqDMN/cvIXAL+Mxg0HTX7cvJG13tW7m+b47pf4KvMran3+EvgC/Qko8k/8
	8ijxog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajjqb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 14:24:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8454912a507so1970197b3a.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782311058; x=1782915858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=;
        b=GhhXnoDs61wWbUkdBEEJ6PwavlRDebFms1KetHckHbGrGrDnKsyK+EqD0VSSilxjmz
         BB1we9SJOCVw2Sya4okuTkx4BU6lFrjGoqoYhHLUHcoIh4T6bzlcx3hmpUEh51JH0SLs
         Qk9d3zgYG+MQO66d5tA55zRhBJTGSlfE9d8KRAoTCIfTSRyD0ClkuG5L/S9e9/V7O5ll
         67werX9yckKfNIFq0+FYDnO16gEo8NoJAoyWbBam//DeYCAQXSLX82Fx5jsU0JMhd9Ta
         XoDJWN6tmxRSxyfevKnN+fmKkTmcEHx7p1nBOCJ6NafLp7PBKcXCA0R76m1FDK7cHF84
         29OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311058; x=1782915858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhyvRm9Lp1QnYYnxI2wzA4jksOyMuuNxgM0BM8s+1VA=;
        b=UtgMxzULe2aKAEKut8f0zEc6Llt60qi3x/TsheWRSk1ouiE1Dz7f31BkFd7ZDhEOlC
         DJ/gekQPEbQPhwWxh99pBO5b9KscnRz4kLlVh7zwvYTh/A/Jxpu/UaX+hrntWGB1rZYY
         t8nVUkirPl+4SpyIi32eNDBFrRXkHMEx5N5tZ8vH3xXxF+3En2WadqOPtz4nsH04Ro2Y
         algZnpC35+zuGdXCse08iOOtC47B0Gqfky+4JpDsKndCNYU9kvn9x0ZQa/lzPmrsPrm1
         MxSmPoj5VlOXg50lHKE5+Zmi7D7eBUiLybUkLfOX5MY7kufrPLequJOndSa5d6VPfUws
         NfTQ==
X-Gm-Message-State: AOJu0Yx4/xDCeBQTNa2uhATEem8jIyJ6PQBRQLYd9xcRJXkaHTBMqQc8
	3MqiCr+Mp1OGy132Tdyx52TD8AeJefZpPJUv55msCFYqsAwfAXiOXEInzgJFcPTh/vxtsavQlh3
	CS4HEDBmLelk11Tt+NPHpOkxJPNHJqir+pEJ73sppuqQelUF9vkGnM4n9bCj/ZHNNXw==
X-Gm-Gg: AfdE7clfb2UQULYU2f5WuhcTxKFmbEIdh+DUFNh8WPwGgCC4gJezmkKmy/LlTl+8Vzj
	WUA/ZZ6/hwbAcqCtQguKhpvZMyt0qINOV9yuFeJDJzXvqCdTEL++KU0Jz6OxxLwCCjKyI41XwG3
	lGXeFwMqxnIdD1JZVbkndM8alWDL6aEnFLnQDhDE7DSWfxHp2W3jVaefZgzsFQKpsri2+9xBjWn
	QiRZwAosWQ657SfNeyjxoWI8Mofa+fDPmAesnkm4447L2kC3nAe7jKc1pRCPvEpjI9X2arAIPHV
	tcx7p0ezKcxOXiZtjgCZtF9UMz29yhjiVxHmWPzZLtj9iX53FRROH6I1AaUm78RESNPvos+kCFB
	yjd/mzPGAtGRUN+/NQR9AFjfSbJ49Cernf/g1GxG6cZh5
X-Received: by 2002:a05:6a00:12e0:b0:845:3c47:9159 with SMTP id d2e1a72fcca58-845a2cca4a9mr4360613b3a.45.1782311057772;
        Wed, 24 Jun 2026 07:24:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e0:b0:845:3c47:9159 with SMTP id d2e1a72fcca58-845a2cca4a9mr4360575b3a.45.1782311057370;
        Wed, 24 Jun 2026 07:24:17 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm2464066b3a.30.2026.06.24.07.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:24:16 -0700 (PDT)
Message-ID: <bf048b4e-e6a2-407d-82d7-05fd360f8276@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:54:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
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
 <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfXybAdyiHhFFY5
 352P5doZwoJ6nSaoTQEhVV2l+yvFLV6zPQqSoGF0DObE7tVFD3sfgFaCdCEfSOcGrJBfer/Xh5R
 H+x45Dtc1tXxY1XHXqDRpFlFZ51ed3o=
X-Proofpoint-GUID: jnmS3ZqT85v6RKMzJH5KsbCYR-lCiuVc
X-Proofpoint-ORIG-GUID: jnmS3ZqT85v6RKMzJH5KsbCYR-lCiuVc
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3be892 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jQEFaFJIMzOOsnW5sskA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfX83T3AS0avjOX
 W8KbqaQXGLOoT0lPQOLlR2gHyeIcv34/HteLO2L63zyd6fJk683S4r5zKq2vXLXLoTZb6BN8Irz
 Zbqr9/4T+uqigeWl77g2hjuGHEIOlj1iWah3NgqaSEXzc66jovqoNui2hRkwQyoaipzMrmebxYc
 6mNmb0VnOvMLPw1AHKIkMN8ayWG+Dx5F+oiHfrnjAYqtdUtRc1va2DkjCSbflRrWPUZCYDnXLSF
 briC7FspxcvFydc2xg5SgL2oILXItv40pfUXHsx184LWJ4Tnti1nC14gIFohyn7/SrNGZ9xfRWZ
 yvPkH7y2Hufzs2y87dDz8gnEgcwT0zk/kGh6HxkxHPCzjP0O3+I50Df152IfmeWo3uAjgdcnDdE
 Pqc53oDpMqHSGYfr9ORn9s9m4jGbKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65565-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: D408C6BF20A


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> As the Iris driver now supports the QCM2290 hardware too, there is a
> race between Venus and Iris drivers on binding to the corresponding
> device. Follow the approach used by other platforms and skip QCM2290 in
> the Venus driver if Iris is enabled.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

