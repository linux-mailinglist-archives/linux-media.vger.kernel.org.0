Return-Path: <linux-media+bounces-63717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yH9uOojcIGpe8gAAu9opvQ
	(envelope-from <linux-media+bounces-63717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:01:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CAA63C55C
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:01:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eGpmcRjt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TfuchAKy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63717-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63717-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 430B0303B4E5
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3304F2D0C8F;
	Thu,  4 Jun 2026 02:00:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340D82DB79C
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 02:00:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538437; cv=none; b=AptkbsWRX7JeaFjPekm/fwOv7h0bMWhTbjQrt35lZ0BYF2RjvjyNReQHps1VsUtXbvlmx/OnzuErzQ/ZcQn5bXHVi4d+jDZMcwp9zelRf5Vhl+GIvYif6U4sBPp2RVTYApw9QxlGuCiL7R7E4i6jgGcVP+qsuo3Ll0Bcb6RsXd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538437; c=relaxed/simple;
	bh=dALv+GeRhOhibiyeNuGoTvi6I8lIZkQ6w/Pu9kYjP30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiEs5JV2W2xfxHRPqk917FvvaJ7CPn8FZGDreRgaQecCBj9D8JBXQkSauGw8xP7JtepzUYBwZMcscei6ynplt8TJg0qag0lyqqQURYIHG0uoegwUUUv27cBWAdIRCX9NdtoJ9a9f59yqkOmpl3E+eIj48Qzcx9lwEbsrW9S99AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGpmcRjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfuchAKy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653HACuA3552370
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 02:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPHZ6wKMWABJqg0xN4h85xPsb4s35aG+DXhckI5kGo0=; b=eGpmcRjtaKnKNsJJ
	i8tZW/0ayMiJSaar3Y4Vg+A5A5F2K2nws2HjllBemobpDmy9SSYsRoPEr+8v65QS
	qu5W6wlG/zQZ/+J3QOutlUJQWPrDkvhk+AkJAkQTqMwRxGgQABNMnP2rrmEeb9iV
	2JJeaKs3XHfDSwfqvFvCajOCQckrTc3+1OjXIUzgPiyPkgTGZLY56YeDbOdbtYLV
	QjDx5P9ooJn2WXcsWfcAX+Yz0PZyCQwd3Dy/rZyK6QH573VNrUAz6/JMacRS/JbK
	R3lkCZLpGjkiOOXAU1mzPXdqCCa4rFJnbfv6T8+c6QxfTaRWqPlBxB9+vZ4nJ1GV
	A9zvOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9muj6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 02:00:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf004bf8beso2215505ad.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 19:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780538435; x=1781143235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPHZ6wKMWABJqg0xN4h85xPsb4s35aG+DXhckI5kGo0=;
        b=TfuchAKy+Blg+DPITumxfA/WSSUhLUEEAnAzHh+CaqC2H6qnl5Sj8FeNjZEl8EiQlu
         AURAjoiDzg9Rn6N1KNVD5RjkObVOOU1Tz0LSvzY9CPmMFlQqfb2dRulCMHYyCAi8RMS8
         7lz4N2AH3iTiKyhW0rsd3tQL7DavQAbN2tsRZqlFnjyBnUAq0ZeX12C2CanZ8lfCDa1C
         2BHuhUzZ9WcSwpt/ejNvV3YPuf0UfDaW7QbcBCSm81+/CqRhcYrs874ZL36zc2/w9QeD
         fTUJFAxEm/02AJEGf+dVbDDuKm2soXCS+wCB4v5dTkg9J/eMuh98NQScd0WrV8c+e2Y+
         gL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780538435; x=1781143235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPHZ6wKMWABJqg0xN4h85xPsb4s35aG+DXhckI5kGo0=;
        b=qQlrdDKwQG12ANvrS5l0LdDt2p9S/uuFGVhAnkUz7DjGhbKM9V+OO7t/dK6Vt4xwv2
         fwnMBs7H9xnV1wt7d5eNqvBzSCAJgEwV36jTsnuoC69B+Z3x7U1iY2B2KrX97ezsDsx8
         77flV4lXTXaXF3lQQB/5c3t+Yxx75u4SmtHxEgahaqnDWaivYBEyZ6dt98nC9EEJFFk6
         P3jvUfMOpBkXpx1q2C3YvRfsmxrNRWuCCh2chQm/nDpjVJAcofLN4fM6DOIstYIRLDOm
         AdhhrMkupW+t+fF7Zkx/r/BEiE0b8LDo2LF5EJBym0MQ9yFGnNJu5dqNnUHGrWYciKbo
         7abg==
X-Gm-Message-State: AOJu0Yz29NrFhLGe4r20HSVK6dIeDWQUVDEu2HOQwAaI7gY+LjYHuXNM
	pAxXtoT/eAVJ9/FnouXXjP4EEgmQUteNb2GsXwwhegIYGWBzhpLbjLkYA5Si8vypVR3o2El2kH/
	YqKj401B7BKxujF3pT4O12AUJ6vz9oedmQiVJToHH/iYw8Cm5+4/Nf3om03ENWfIoEA==
X-Gm-Gg: Acq92OGMn3Q0xMOFSI4b61tGfLTfnPLdO5oTAWS931qZ2BW/HjyZ6cf7bV5XV9ObgQm
	BuHq6SQUGN8SWNtd8XgKiY4sx52vXVcR1jVRNc1N9Wb/5Bz0aSUUvi8G9bQi1EGQB07rGf6rZRf
	t//TD8TmZJdGnZXlchcGFA2S3GxTyDolYC3QCJMcN1hA1MCrdAqMARhU/mbz+MyWSBJUulhZnwZ
	KwEUthU4oW9WBvfSr4qk/OLiTB3Jym4pVztHB+EyBMJaASmb6EaYsrzLnRIV9MUUJosxx7VbAA7
	FUVqQCViEew83V7mNoEYAKwztStaQe2rUWbetuLySVM6MxP5RXYeHpA29WDBC8I/pqeXvStL389
	tP2XiiAtWoyaCZttPCg0HI/jLpDWp+2fd/hAyqGDp7oPAImd6Z3gKBDKnfKj17lbXDw4JnMXwK/
	+t4USw6k5OaZiOP1RsfOkk
X-Received: by 2002:a17:903:3810:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2c1644add2fmr66963845ad.33.1780538434772;
        Wed, 03 Jun 2026 19:00:34 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2c1644add2fmr66963345ad.33.1780538434322;
        Wed, 03 Jun 2026 19:00:34 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6cea3sm37901735ad.7.2026.06.03.19.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 19:00:33 -0700 (PDT)
Message-ID: <36a64e47-9d61-4641-94fd-2568d86fd067@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 10:00:29 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: iris: fix runtime PM reference leaks
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260604004404.34797-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260604004404.34797-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sitK23HM4cDTKykGeQcXFfINzcBBH9hq
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a20dc43 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=0rn2apig9_SYVe37ewgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAxNyBTYWx0ZWRfX2pkfiBrhK53p
 eGCNVKDcl3sj/cym2RKJFiifv1ISwKU7Pzm0/R6brhfu451hEQ041fanX+4ZEfRwJ5+GMzFIPwO
 aiwUBwzFokJlXE7k+hDt3/iFFlfusAGG38p6/76MLoNla7Ycswcu8B4fXjQtKl7sjgzCkQArC7n
 LkARcVTlAyDWiTECSYQ3Md4viVqNrHLuUZQcq4763FRrzY75LQU97DQ5H3jYfUzj5+aIOApVf3k
 LQ++Aj/Xf84wG51Gmk9+EWqQ+pA0Mt0/HvQgVqlm8E17O9xh6DTBBkTqF6RzR6uwCVYb29dxB37
 ZF3nmLfZJVTpNA9nnPZQgAfXmEH8gRShOPbfr4iB0NJR9G/4PSKwjTA3aGHobiqh1Mm+s85A47g
 zSXQl34QuUfeftr9NKNv0rCqdlcs4lIazZXVeSD0qCgpRuwgQeqkNBNIpTs65PGmMp+lZ+nrqfN
 M2ppPAgtN20R37PjLOQ==
X-Proofpoint-ORIG-GUID: sitK23HM4cDTKykGeQcXFfINzcBBH9hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040017
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63717-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,linux.dev,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87CAA63C55C



On 6/4/2026 8:44 AM, Hungyu Lin wrote:
> Use pm_runtime_resume_and_get() in iris_enable_power_domains()
> to avoid leaking a runtime PM usage count on failure.
> 
> Also ensure pm_runtime_put_sync() is always called in
> iris_disable_power_domains(), even when iris_opp_set_rate()
> fails, so runtime PM references remain balanced.
> 

Please add a fix tag for the fix patch.

Fixes: bb8a95aa038e ("media: iris: implement power management")

Thanks,
Jie

> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>   drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..f5e3341e1430 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>   	if (ret)
>   		return ret;
>   
> -	ret = pm_runtime_get_sync(pd_dev);
> -	if (ret < 0)
> +	ret = pm_runtime_resume_and_get(pd_dev);
> +	if (ret)
>   		return ret;
>   
> -	return ret;
> +	return 0;
>   }
>   
>   int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
> @@ -90,12 +90,10 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>   	int ret;
>   
>   	ret = iris_opp_set_rate(core->dev, 0);
> -	if (ret)
> -		return ret;
>   
>   	pm_runtime_put_sync(pd_dev);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)


