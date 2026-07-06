Return-Path: <linux-media+bounces-66713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M0dfIhprS2pfRAEAu9opvQ
	(envelope-from <linux-media+bounces-66713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:45:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80F70E415
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:45:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HhXwqs2Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JghVCCE9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66713-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66713-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B14CB30348BD
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 08:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252B63ECBFD;
	Mon,  6 Jul 2026 08:22:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582293E5A0F
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 08:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326161; cv=none; b=a8WEe24o5sUVAXQM+gttLEDayAiSj57Ly4PkAMejpQ9nwlLojzkXUVEDPQUxqiowQ4MbuqD0uO1SRWJ2K3jakj68r6l8oW5txMXhcGhBI33mcH2cNY4Mm+jociYm32ZZGQ9W8W4Gyxt+IMrYxZD6Fp47Knzb1JiLKfNC73/ujEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326161; c=relaxed/simple;
	bh=NlLZ81o1w9dv0DLwq3X7CQmJrz4mrvnag1JZDa93YYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hi/fsuLRjm+H+PvahbvYb7np0DXqXQAR0lAT0Qplm6TweGMACGQciHm87OL2Y9SY8UoWu447+aJieXKzk93nYDpQNbz+1Q/4FxHc7adJeguCDZIohnpM7du0LhM2pmy/vE7wPHtS3GHUF1NtsvAaKIb4g/h6POY3PzOj1O4GhTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhXwqs2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JghVCCE9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641S1S3593989
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 08:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7kgDUzxypUi9Hv5ERYiztltz8pc1iThxnESL38uqQ0=; b=HhXwqs2Y0ZsHrIij
	AaX2/c5hNOoJABzdK+vgCCvIRziXAvqlKp+HfEApATvvzOlO9sVSrJzcIZ0gLubE
	xqBeUJ0Ot4r44/oeqRtbFiGUFOsXcI+24UltpPC8iakeix4jwSEjHg8KAnEkv6q0
	ozKG0icp+Jc/2I2XUZE/dzB6e16ku1SYwiAYd0gXoUToBKhts5fkNiuRxdirmiz/
	QNZRC3Kl0sJ3Flfz8XAYdQzqc7irlqPYhDO69z5CHlRaOpMjJSVOtugLSl1SguJC
	JU+WCl1umXijhDcuJFyUpO3C8cubO1nyzL1Mk/Ng7Vsc/y6irFVChjR2wthlmyKx
	O74cjA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwk3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 08:22:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847ac21582cso2937790b3a.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 01:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326149; x=1783930949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7kgDUzxypUi9Hv5ERYiztltz8pc1iThxnESL38uqQ0=;
        b=JghVCCE9N/ATOHtIbMd8y1txt2HhnrEL/J5xoZfF6u2fSONTkzncuGkh9Z+KvCf0Bz
         aToriIJvVnUjls5guGcmRi0N/e4BmNiIZAKHnPET9PKotxGoyu9dBAjFlalN9gmIRAsY
         C9borFbEjyrhfDNaYcEKdTa40j+Ey3pzNQhictbMVxZIjskIcThxfC9gfhK6nXjYwc79
         /mM8xVTQub9wAEOBz9kAlQy8+oPNo4ETt3txgf82cJp/BgKeJUYiubhpbtWkMcArn0M4
         HtgMGTQU2i6uVUo0YFBkkxMFqHJv6t6qwqCop37E3AFWwhuKuJZCWhK6CF2PyBUvVbps
         kZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326149; x=1783930949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7kgDUzxypUi9Hv5ERYiztltz8pc1iThxnESL38uqQ0=;
        b=Da68EGoXYSE3jDpOkEs1LptVVROlrynlxIOlfURkkUjSFC0fHO+IC3NMpXu1PmiGZd
         9TZZ0w2tL1NavhlQI3XirODEGq1zpeYYKqsqWQ45kOqnTerIsYzXR9d6YK9EjEdwwY8I
         Tzfpff6zL73hLFpms1peAB4VWegHHhshyBCZCq6mznlGIcexdhjtVFTRpNImZuVyqC7o
         SaKeuaJAkF/2eIIXM0nqGEQGrqjbOA/fCJg3PEWbmQ2HMHeNsAFau0+ypFpPdij9hCtL
         cJEs9ALr9wlFoiWFj6BZs0QtbmWAvc/84YcYRTcXcxKkPKb/LPU1gewm3Jf7t2oYbnvG
         rjPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Om19fb1tfz72N2YDMpzh72PdvV5gJ6eU+eJpjSdU9Tnc0abEJceUJYO335wMC464Bb8q7FRN4K+axA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRkTDE227klp0yrUq4DEKpqIzZTNmT0B9w8TyiiG6fwRgCfFwC
	cWxCMI3zQ3BU4yPBncPQNolZTqURr3ezI+0omoODhrkxxmUZBKoa8nG38ZZ0pVji+c60AGXewks
	u8bmEbVz/l2ObOHlmw4xJX61Og5J3YthbuyjjgnnQj0zwPGE5YV/HJrQVSR9F0vz9P7VNpFWIog
	==
X-Gm-Gg: AfdE7ckdppntJ7oC7rW5rcAXgJvto1QtqRP+2kWTRxsY+AsWFk/2GCzxEVdBtlC0k75
	CkokuO96Dj6IYnIpKrmj7wRnN68Bq+VCFd1xfutNWEg41UxRaQBApe/Ldh6HPNE4gMG9z6uD/ly
	SBWlNVz7h9e631AZg7DTWM6xZ0xFplEqCr2h2BWFUGKDzgCVeFb768jUzLPNLE+dBQ6DXPhw+Ky
	QtApfA05eXpyj0kAi0TZ6wJDLM5C8zBTsZAmFGFlsMGNL/w7RWn+KHSIgk1SfDieCOpRJjJKoDr
	15oAmZQ9ont9h6m9/kfxAPoyu5cT3NMgk7Vg/ZUGTk74qZH+GgqbOC72FsXVpSeKof/QcMvo8NK
	mmox6K2Rb8/8/5oURCRCpzlHvAxzklj5B51sjrlxlYxsoCztFFQ==
X-Received: by 2002:a05:6a00:1254:b0:847:833c:6451 with SMTP id d2e1a72fcca58-847f6fda4f9mr8656672b3a.57.1783326149430;
        Mon, 06 Jul 2026 01:22:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1254:b0:847:833c:6451 with SMTP id d2e1a72fcca58-847f6fda4f9mr8656641b3a.57.1783326148965;
        Mon, 06 Jul 2026 01:22:28 -0700 (PDT)
Received: from [192.168.31.103] ([152.56.16.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4986bsm3304973b3a.29.2026.07.06.01.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:22:28 -0700 (PDT)
Message-ID: <b1299875-9fda-4477-b533-f491f19e8a2a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:52:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Krzysztof Kozlowski <krzk@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705134619.4030745-1-aniket.randive@oss.qualcomm.com>
 <1edb643c-1d09-4ad8-97df-66c86e6123c5@kernel.org>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <1edb643c-1d09-4ad8-97df-66c86e6123c5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b65c6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=hhhz2GjkF5S+8y/bMxhNDA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CKx7tiaC2mrULMmJUrMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: I2IwNngJYxvCcL09TB6r1dR0cGJ3KElj
X-Proofpoint-GUID: I2IwNngJYxvCcL09TB6r1dR0cGJ3KElj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfXynHc4TNxTMnl
 SXZDSKNm9rnHLEss6RjAOtFW5tjAWRBm7088cJhNWBurImEppemhohOEUWjkhZXLLKYc6K278nK
 UeAlHSEY8imhVYvW8G9oBjFetG/eweQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX/KBq5hRFgs8v
 XFJE/Dyqwbirqx/RWX+gT3cgY1dIjRGMxD6ITh9ARMSIaJnF1VwJiZTjjxrpf09qorRPkj7UIWJ
 zxhq1wyp9W9KK15LrFq33Fym7EHAVUtbLazX9I4fQ0ilEgp82sFMWrrSz7kLYsgCYIBeba2IOQu
 am1fHJw4IBLE73fKEQtI4gHIXYMxStcpjanK90AKqqD3yXfxf0e9J9DrOSWgMW94wQutBM/LqVX
 EzEf6Sba9zWr7VbXlP0pHY8dE9nTW8tZazMkEbu5ac/tHXeGM76L5AWDokf+sDgnCYWmtnXFm8l
 xX+U6zlmvcb+EPf7TOMmlbjLQ7Cp8c9MJUCOPyZqDSVRxHVn77lyaBmcfINKh7DPm8t/Q6Z3xhh
 4LwhznvFK2E/zqDS2uqWCI3gZEXsDW6de3Byu9f60M/Sae6Jiy9K9qdqt7945zPmdoDiVuCVRsM
 1TI/u4H0GOJ9+TNoF2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66713-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D80F70E415



On 7/6/2026 11:28 AM, Krzysztof Kozlowski wrote:
> On 05/07/2026 15:46, Aniket Randive wrote:
>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>> regardless of message length or bus frequency, causing unnecessary
>> delays on error paths.
>>
>> Compute the timeout dynamically from message length and bus frequency
>> with a 10x safety margin over the theoretical wire time and a 300ms
>> floor. For GPI multi-descriptor transfers, use the maximum message
>> length across all queued messages as the per-completion timeout.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   arch/arm64/configs/defconfig       | 54 +++---------------------------
>>   drivers/i2c/busses/i2c-qcom-geni.c | 37 +++++++++++++++-----
>>   2 files changed, 33 insertions(+), 58 deletions(-)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index faf146441f97..841108ae2d01 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -32,7 +32,6 @@ CONFIG_KALLSYMS_ALL=y
>>   CONFIG_PROFILING=y
>>   CONFIG_KEXEC=y
>>   CONFIG_KEXEC_FILE=y
>> -CONFIG_CRASH_DUMP=y
> 
> 
> Irrelevant patch change. And not really correct - you base this on some
> old tree.
> 
> Best regards,
> Krzysztof

Please check latest [PATCH v2] i2c: qcom-geni: Add dynamic transfer 
timeout based on transfer length and frequency.
- Aniket


