Return-Path: <linux-media+bounces-59329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OAfMvO/6GmEPwIAu9opvQ
	(envelope-from <linux-media+bounces-59329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:32:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7DD445FA7
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 066FD30B9B7A
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2273D47A1;
	Wed, 22 Apr 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fekSiEjd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5ngrgBP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D164D3D412C
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860793; cv=none; b=peRoP0XDNBznA9ABqxOu3WURhLuTKyWbi+2thvmJnkPO4afsCmQUQ9kfTJgq/DbXmL5UTY3MsbNjoVBp3Lz7RaDai6MwosTVQi757QvwKp7hwF6LkXee5FQzAsprX9Ulgnlnu15PneZjM+dRA/pEFUrJwbwvV0ELMkqwvaUqHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860793; c=relaxed/simple;
	bh=V27alqKNbHbQGFNKtKckSv2uL0QrcIKQxe8K/Ir0h7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBUmfTOnWpjuZoiXpl29PnPaIwYfDuWk/LVC/pfXOGROTUbrPBuW1MGGWx16mXUGynRG1dffhDwCPC4NQhK1Auwcx//HlIxskLcykHDA6gmOQr979wgJZRR95GucpsZv3xyf+pKyaAnjpVUlBf7VD+BUounDEocu0GCEoISYbeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fekSiEjd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5ngrgBP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96EGo664097
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIsoQnVXMnLOvbncyck/9zSJa+oCDzxGM2a/zvT0E+c=; b=fekSiEjd8SwNK6RH
	N/ZPV23PDUJPNrz9LdDyrD0FoTC7fjWIlMK94I3qKfV6Yyx465xX13/zLlnarNAG
	DqVqy9/TAEHcoMEBT8U0hAa397M5OMtbe6f2yVyA0v3XE1u9dM5UkWyWaOE4diJw
	BrefUg7V4+F8ign/83Rm+C1/EOVyEEfivKx0KXW3vS+TqmzgvB75ofVDdm8qfZPQ
	a16bUgmvRCd96K/d+2WRyJFy2qp6vM/Npcbpd9Ra/zf7kmXk8GMNLNMb1G6Gz6Cg
	FbuKrJ5jYR31ggwz4StgP3hXENRJ9JIKJfzvnD4eenBnHVfLFGt3zQHV+kZO35/+
	81l8kg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgrp95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:26:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so5911661cf.2
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860789; x=1777465589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIsoQnVXMnLOvbncyck/9zSJa+oCDzxGM2a/zvT0E+c=;
        b=a5ngrgBPLNEhNNmV0HujAz1J/y922hyvBzEZ7BLswP4L5s2VHRBM2AyzyBJOCojbYR
         CodFMmQgUG9NPhekrA5WkpYhETxiVKmHX1r1uoxIpQL2KgMGjiYQEOPa2CobHjfbGOSb
         3VyJudDLHg3j0YDEwPp4vmjCeCCxZFw5iLRwk143JyLnU6z0dVgZVqppRC4PxAOF43HE
         NdFxRTFl5dacLmykz5ZWSn6XFot+uOQNLzhbg3SVXPma8E19sm8OKSJ0tDEPSn5zy5q9
         QP81HHNOmIyosy7hO5ew3bIbdJhRRv0qPGaFVbqfc4kaMX0BYZ80PmhqMxaWhHtmJAQE
         mfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860789; x=1777465589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIsoQnVXMnLOvbncyck/9zSJa+oCDzxGM2a/zvT0E+c=;
        b=DNKUyAkLrNXWg2VDzrm6NdNe2LjTrYtRGpEJRxhCvI/2WXdON+6IU0nw0/Tc+SYroC
         x292Ri6naumjYjzOMvqQ8ysxx+apm4CdI/Uw/GI9y4YO8KqLu/Qm/A/yVDQPzwfTyDtZ
         fIWZnhFEij0+1hU4jmTDhY08vgAWzTfIVeGnCtV5GNQlQeLyNZ1FQFSKhEy49N8dm962
         o+bieQSEl9xcz50emDjNvx1J6S6A487zm6iYXkaf50aUSRIRGu6PaD1z3STFB0nrVg1c
         gb6TDjs+6IRhq0ZbnKbGtPJz9MlabQcC1NGk0btUUSO0kAPe7uuo7O0i/2hqeAw6x01l
         OoJw==
X-Gm-Message-State: AOJu0YxLGZU4xqcAuEn70vV1ZTaOVbYcRcHYF9RidsUrnlYJfqsyZNBY
	I1s505IrSU+xuTV+pyHrw5r0PPvilB/ypqd0+wDCvY8O4VUSdp3TmvKJwwaODGT256WXvqlrK5A
	A8wdoLfbGsmwSJE6pEw701ao34sm3eRtuGQaMU+iKV2tWiQY9MCUZ4WcyZjjJ0m6zVQ==
X-Gm-Gg: AeBDietjvVaStkpAreOUQ4+muQ+EwhHRavzDsY+1w3XyurHD/ZjZhlIrbb/NAvSRfxG
	LP8r7sS6971zsQYrrlVRE0Ok5op4zQYACnCuOhLASmYaoND0VWAfJPFgt5kD4fdjtsIT98MdNFK
	f8J4T2KJp7uS5vbIWzWuEAKUSH4LxZ+xAPSz3TlfyDlF7Sz/Frg7LY6V4WYOfdxDOd1XF8Hcxrq
	ws9hLes1o9AWdJJAXAgpas7+UuqVdHeSDXyWyXH654cteub7wAh541aL6pYu0SCLrLbv/M49gjt
	VSIPo+V0JQl78NxZjsBl4qpNvv5N54RA3iCjrTGcqReHzgncARQeUCfC2SkQSmzn+dejbk/abkZ
	hh0vklQ7PrWe8SWUlqf8+AnSG8wxp9icYF/gM5Zjx3M+ex+y2J/taxM32oLB2H8fFfsLOl8HMPX
	S0/TnJQ+Epf0tsTw==
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr130379781cf.7.1776860789168;
        Wed, 22 Apr 2026 05:26:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-50e5cc12306mr130379451cf.7.1776860788699;
        Wed, 22 Apr 2026 05:26:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553e9e4sm546474966b.60.2026.04.22.05.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:26:27 -0700 (PDT)
Message-ID: <d06a4b8e-6b29-450b-9e7a-270fcd0c3e2f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:26:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
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
 <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NeWeNgW49Rayuyh-1iboACWo3MBarPjk
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8be76 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=C_VYEJWI21jkAhOvB2sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: NeWeNgW49Rayuyh-1iboACWo3MBarPjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMCBTYWx0ZWRfX2fcEB9Ae7+O6
 dj/ef+rzy6DY8ip47ZXl915wyKUWXHKBKs9A3xjwdQ+FAUv+QJAjfKlEwELIpX8Z2uLfv41WfLd
 mZm+q2F/gHCn8nQRtXVaB+WlPzfDxNmNCxCBrjTlSCVx8LUfT79h0h/hXSiB1lmXR31ZkWtnmBK
 H2UQi4uA/WuIe7oXB/mVj8yxIR0TziuuLiPB3RK9zrxvGrMmWh3qSQ+VqvU30RN8nBt8ORTAV9X
 aWLrHbaDkyig6+9HcBd+e1uEZywDwia5MvCBjykFwvrhYkqX8IsuSEgzCU/Emzyh/cAQeOshFd7
 sOLyY3r8M9fkrrCo/LHHp2XVE0ajidIPnSpn1KXaJpYiIztJDhCrsm8iXDmTj68soLPG6iRnPed
 RIfpuiXGuJtvD4FKrAifagrpqnT123GKe+v26arGLkZq5PWWVXbX2VrI/5fdJaBNRCksQMllFGD
 nAkyxhXi5QZd9hZUo5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-59329-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F7DD445FA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> iris_destroy_internal_buffer() is guaranteed to succeed and never
> reports an error. Returning an int is misleading and forces callers to
> handle a meaningless status value. Convert it to return void to match
> its behavior and simplify callers.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

