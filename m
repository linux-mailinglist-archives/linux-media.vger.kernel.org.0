Return-Path: <linux-media+bounces-59354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCZQFG2q6WkxgwIAu9opvQ
	(envelope-from <linux-media+bounces-59354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:13:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB844D313
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1538E30A0A96
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 05:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915343CD8B2;
	Thu, 23 Apr 2026 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2LLQ8M7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRCP2so5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8813CCFDC
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776921001; cv=none; b=XN16BscpwzfQwmLYtNCvbdXOSk79kuVXUaPpKdeKHgsEZ/VGit07lqyET1GD2bFQHrLaazR2uh/feLkgwGbc+LzIWj7t1RRUC1mqnbUUfQwn1G+9y8EagvLUPrPVYFWPsEuRuK0H5Vyb9MQQ0fyjMioPgwacSrZHv3V1b0mXnlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776921001; c=relaxed/simple;
	bh=76QCo+6/JvgMSDb7PrmhrgP0AqJvDZIeibrFQtF8aIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0asV9MLscw3Agv2xVxv/vjwebA032DfS2gJEaFxnte0UtubHUwop8zdppSOwtxpAqRGi6VzPWrvZWrmK3A2HLcoy5zXkX4ionYRGoli0VHvebST0XT9OeNH+NuKyWUvhPC6VHf86sKjI/AgrVOaQNcs0XKKTkT+C+t85tv76Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h2LLQ8M7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRCP2so5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3AaBT2956039
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SBveMMLWog6QoBB1g2EvDz+tsssePwWyF0/slSmGPVU=; b=h2LLQ8M7ur0TETZl
	c05LMSQxfk1VKTSEELjalR+0BHVskqWSgRnlHJiFw8t+fpOgVQGhTlu/mSyZhHBQ
	QuhWegWCaVNqioNSCyyWQdzFWmWju/TfL+2IcHz/w0VnoQ/CZSudshEu+KjTSWDY
	U4HBxwU8TNDCjEymILxVqUObigVyKMzIZLcp1C7L0H1hNzVFAMUzL9iFQSweieuO
	sERXgg4HzMdmT3RtQQoWanciUCX09gyPhWh2wWvi2fd9K9J+HNwaKsumi23cONod
	w4cnrnitcSirFuuZ/w/5IHkjUep7LdqGxK7saEoIHHosNTE/B65qUTgYPmGYgark
	hqLE4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q2ads-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:09:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so7045562a91.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 22:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776920998; x=1777525798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBveMMLWog6QoBB1g2EvDz+tsssePwWyF0/slSmGPVU=;
        b=SRCP2so50ufUUt8GWVDSCVKu01ZSyuYitNZKL9D7W8euwE9CJ9o51rL4uOXBQ6LLUb
         I4pNSzT2bwC/dGTickHn/ir44x9vxnv0L48C0tiZm/VYX1wfCUEoqKCIa7K/oEEzoXug
         zVJS6d3VMeC5vi17Id7zefvdmDkLw9NRmDZDG+qlwkgbSG6JbceaGpjVpz1Qqs0slwCb
         TIYW5ew4M92JBpGh9nBt/sXlgLCCu4xsUGb24+Sf5By7WkG5FXqclsG5FCG0ewlCJNb3
         WVqKfZyvMs5hUViqnV3+mH4sZV68eBps8v7R1STpJb0HOXs024pgk6MDblPinM0aOI6B
         msJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776920998; x=1777525798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBveMMLWog6QoBB1g2EvDz+tsssePwWyF0/slSmGPVU=;
        b=py+ZHLj3ja509KBK98Pn/1i8A/y8z2cIdBwrNAu0BdkLOtOqiPRtsizAhRTM0/D0Q7
         jRGeYtCWwpyTn2Vr0VGTpNM6lIULCKD7gfsqQyRjMXex7Xg+GXSZS1pb+K9hEBscvIJz
         wh8NbmW3K5CO/60iIKjrFJNC8zjGnYzXzqoq/xXVWO87/LrwfepF1R0Bnqp/3Fk28svS
         Ud+eOlqXaJAr46mxL9wEXs+UVZuoMaqlVm/uFtCJ9aif1OIm4mG2lrRfNtjNqbYdi8dM
         6lTpVQ+5xBeIw+4IL+64dWvBpPjphnRJFn/+80tu3v6otBAh+xYT2v6ToDwqVY4hLMCZ
         owJw==
X-Gm-Message-State: AOJu0Yzzfy8K6T4loC8hHi9ZZbNrG7XDdv27oedfDExurR57h+/bwdc9
	xLrrhss79AmlAFUN+gzaklFzro9Zz0UjFKsqRRkd1u7f6o9jUyW5oypj2fLqEpiMfA3kULaFAx7
	33XghkARVP1L9UJqoCp+X7PmYE7ud0u3l8U/fPZKIL1q7/gL9iuVICd+6gGclI1kInQ==
X-Gm-Gg: AeBDietAQ0sYkZW/aw89P5uadJHQoZ+nzXycg2jVBCc+2qtPJ21sRawjorHhJO2XQ5o
	E4afh0J6Jlk8KQHhPkID2uu9LPRayLpWszNFW9AQmPjdqNj+3yl5K4nKeB5Bez8qyKTH+rlgudQ
	515AM2w3ShOVkHqHp1Q8lxeuCwRr4kbohTL8+WCNiuRNlhipjTHCnUJANO2nvNDqeMkSscQWz0v
	j5JaISHueX3n2aKZzmAHSXA0hevqaJOyzPkjjOXO8pQ0y4k9jHONHgE+H6ggCPDvOuOaZOp6HK4
	stMWTzYXJ9Xfc0wXFfG61vQRjKj88uJ3Hf7hpfJZx95qRjb3CkDGXqnK6TEQhrQVXBiZDPc0DOs
	RwVHPI/ApQx+i/A5D+8l1yTV2oKseOOGnDop77QVQZRzPcJchdWjYQYVoTB31rJ9p
X-Received: by 2002:a17:902:cf01:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2b7aa203da7mr12610095ad.33.1776920998198;
        Wed, 22 Apr 2026 22:09:58 -0700 (PDT)
X-Received: by 2002:a17:902:cf01:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2b7aa203da7mr12609795ad.33.1776920997717;
        Wed, 22 Apr 2026 22:09:57 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3b4sm233006835ad.2.2026.04.22.22.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 22:09:57 -0700 (PDT)
Message-ID: <87a4a14b-e20a-ef0d-d39a-be11e11d0b74@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 10:39:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20260422-iris-code-improvement-v1-4-8e150482212d@oss.qualcomm.com>
 <5b740daa-132b-4719-baeb-c029bb82f5d0@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <5b740daa-132b-4719-baeb-c029bb82f5d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9a9a7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2LjT4Uf67EepSy-P5WgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VIONSZ1m6t0Fk0uFpHCrJN8kTQCk8Yn5
X-Proofpoint-ORIG-GUID: VIONSZ1m6t0Fk0uFpHCrJN8kTQCk8Yn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0NSBTYWx0ZWRfX4CQ/3V3vedqT
 RI8c/UBim7ZVfQjeFcYvz//xM7mWmZwD9jFujd+k+RmDqaBRldPGM+CjYbT0+H3lrvh8p9Pz4KK
 s2zgFQPvrYdeW7Qb9qFAjPUWjeOpiVIw8y6uCG2zowl47qRVoei1ViIk8hNSw28GgHek/WfAIf9
 rK0xy2zY3S/MwByRAZhaUXw+DLxJkP91ehQXb2HexQKE0iTLLJ1Qsr4rI6TvvMg+HUnPghOsY0J
 OjBg7jQSPUB6opAg/aOoK7z944tDOW18Hu9FP0WG6pzXDOGZg5d726cy9YXQh5LHvWEGJ4DAx2+
 z2GZC80jxcejF001Oof/QGV1TQiuowXs6TuEaIJ0ogDsa5gbFIfPKtgCOcjwwsVhXhTdjNuykCD
 dymeu0FataPaznzGViLPktIVOAH4yDhmadcVXWeumFdjs9qqB/jLUefKlGypNcfaPpw1Yp5jexb
 gah6JX6k6XGjTCXzuDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230045
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
	TAGGED_FROM(0.00)[bounces-59354-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACDB844D313
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/2026 5:53 PM, Konrad Dybcio wrote:
> On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
>> Fold the ternary initialiser directly into the variable declaration,
>> removing the dead store that was immediately overwritten.
>>
>> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 30bfd90d423ba024caf6ececc827f7102e8f3324..06698fde639ec654ff9ec78a178271ab2284f5f0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>>  {
>>  	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> -	u32 tier = inst->fw_caps[TIER].value;
>> -
>> -	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
>> +	u32 tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
>>  							inst->fw_caps[TIER].value;
>> +
> 
> Since you're touching this already, I think the cleanest way to handle
> it would be to do 'tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER`
> and then use that index 

Ack.

> 
> Also, the namespacing here is mediocre - "TIER" doesn't indicate it's an index
> of the fw caps array

For now, I’d prefer to keep the existing TIER / TIER_AV1 naming, as many
other fw caps follow the same pattern and renaming them would cause
unrelated churn. Happy to revisit naming consistency as a separate cleanup.

Thanks,
Dikshita
> 
> Konrad

