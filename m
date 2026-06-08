Return-Path: <linux-media+bounces-64141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qCM/KohyJmqWWgIAu9opvQ
	(envelope-from <linux-media+bounces-64141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:43:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F5F653A6F
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:43:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XdD8+cDH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PUahO3Wf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64141-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64141-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7776A3059335
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 07:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B77C397682;
	Mon,  8 Jun 2026 07:38:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7722A391E55
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:38:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904293; cv=none; b=SCpwNn8Y8+t5pEVEdPNx4HMnmzXqFfkyGtwy7uA7xMpbClRue1Q+d5pXYKmUDX43RKaMtFsv96PApAJlECXzO9JQvJn0Sh1NBTAT3d6f6Q43jsx3wWukdr+ekxe2R7DlDW7gq2Jb73KMAwd5xb3l3az4hGgx5fq1Wkm/8mxCw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904293; c=relaxed/simple;
	bh=Gj9H4HhPXQjCkY7uCmkaxSlWLYW3kXULZyjF99Y5z+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odm6TD0E5viMzI4zXMe3D5EMWjgtQ2qr4Id+ljaRu6NRf7OZIAz5aWC7F2KL/FMrZYFzgknOZ9NcAuqORgX3h7tGwWdeRNvMQP9pNtFeGAS8UmGm5uTPJlxkanlVy5m/CPAdAFpHc1lcmSMOOWUhpDXHwXAsTncdAQaKhFu5iLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdD8+cDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUahO3Wf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Pa0O2808386
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 07:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kFyLb5NQMRlannRjdrU+C2uvM7tmZpLij7t0JT2ZFU4=; b=XdD8+cDHBmuNn/Ya
	7Fd83crWGYV3WPx8Ye/oPfWDcv8U1E3TxFIMyEOj4OH0w5HAVmJVRnZTxSHeQ0jI
	JSl6CqVO6Wo/oPHfv1EpzW+4agFq1BeLQHHHbB3nOUGj1fVPAnIWHnPpa6Uf9Pr/
	0QP2Cx4C0zresZJIAjRHG584JqHYNoqy6ABYflgUnumnqfcsYgFT2jxO/rXaVkpF
	2Gp+2ScLrMH3hGuwApopDedsrktEEUeEhGXg8tws8dmwYZ+iS8zNRbrDd3o1S08R
	ta9ZJFo1aAa/eaPs/Fd7oWYI7ZjyZAivQ0Nwt+goFIzACo4eIJ7TjKkCqALVpEbx
	G2Cz4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6kwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:38:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517bdeceb54so1040211cf.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 00:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780904290; x=1781509090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFyLb5NQMRlannRjdrU+C2uvM7tmZpLij7t0JT2ZFU4=;
        b=PUahO3Wf2IAQ9IDTM4AvLKGpOfhT/ZDAU6ed7RCOMFn8tWkdVORu3n5bysVqBbumwA
         R//jQ0oFhNvUgqYSVIUK3G8JuEok9nM3WPO93c+PM+ltTVxVfXpiIYusrKM62D6ERR9o
         nAHAIhl5PT8+i0xb+DFBlwbh7ylJb96/ImPV/0S9DtY/oZP6HlAnnKfVhG/NqDbe3Ox5
         o1xeBqkk5OVFfdktw6Vizk9ZkGsARzsvObo4HSIdSooBbHP8Fu2BaOVuGsJSNF9RJBHZ
         +QSdmND0XMlTCKKfAAdgedMdkmKIqDM1psAbuwRpx1YMXxxcvF1h7Wm7e2aHft/xt9NJ
         yMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904290; x=1781509090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFyLb5NQMRlannRjdrU+C2uvM7tmZpLij7t0JT2ZFU4=;
        b=iRn8Q+lAU6ChGFoYL1ou1M4ZQl/UitDnEfggGlcm8CF+a4oztiollCXw05ffKywgMH
         y5Jhqlh8Dr18B3F2VAhrWmno9ns3hi5/PXMTGt0lPcyxZUrGrtVAceSFMYOyA/JRcwi8
         BCHzctDgcVqKYKSOnyUTx6dvq0K2VWXNG5DfFK2020Lr9ZMVEeNj5qU1Bt1a6RhbmnR0
         wSHBfBN/LxqjDwGGzUDt+MeplKO67bnlsHOwvq37d1dGBWk8ZkRfVZvY2gmxrUfPhuz3
         YtVj0axche4cFYb5bvaSLrE8qp/XZPYHNY63f0w/ptlbgqs/XiKCnVjDVxMUtL3iyDX4
         eo8g==
X-Forwarded-Encrypted: i=1; AFNElJ8DgBJvHJkUI7/pADqr9aOMqp9nJI/QL/1pYjcQ2hcKKwHpMMWdJhTO0arLR9dewMLiDSvQwXzTyHiRJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvdVX8Yv+7TIitPSgHDIvMyJb7sFBzY5YWvnjnr66HS4aHL2T
	AeQdf0n+fQj34No+vwG1dYj8Edc2tW1TQaCl6dnm/zzoHJGHMSJrv3oho1dvSTPuzGeyc02HX6i
	RXuxtT6CzlclrFwuLQvpO3euFplX9/glraAdn7aj4Jf1VAB0ftqYg6vl+aiSpDztLOw==
X-Gm-Gg: Acq92OFnM+nIr3ekZxflvAz3DykRuSWcy/3bgeELf1VUD0d2JS+IPmdIIQDD44M55Ub
	UruGWkFKnmQ2pRdDu7PSiAZ6hyHxio2RMucQ5vffAi7RruyKDhc8ay41nlTOfUBvlZGnaIRsHzM
	/UBgapuKWftieqE1qFyfFCglrZBNQL3JEFbOjDYCAPLVw+VwOMRfX4n6nafjnSW1vvV0ZE3JwSa
	VknD7okJtgSdLW0WDuxD815QkOFjafWDXMeVnGUmCmS339WQ8at8xR1pibW8qdg5hbHZEIqYZvc
	e7PNSeOLrqx2e0iMzv3vmC6pCRQjNRhXryIJ1bjToQ1eDC4iQUa4hFUpe161eNWa01kpUR3+3GQ
	ssnfhU2p17FY4EFIeAVHbaguthNqduXT3khEAA+4JX38JgHJP4idwsTgQ
X-Received: by 2002:ac8:7f4d:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517959fed19mr127248011cf.1.1780904289767;
        Mon, 08 Jun 2026 00:38:09 -0700 (PDT)
X-Received: by 2002:ac8:7f4d:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517959fed19mr127247831cf.1.1780904289312;
        Mon, 08 Jun 2026 00:38:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055309368sm810757366b.49.2026.06.08.00.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:38:08 -0700 (PDT)
Message-ID: <d3be99d3-4677-4a39-b57a-d5a17b502ad5@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 09:38:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: qcom: iris: fix runtime PM reference leaks
To: Hungyu Lin <dennylin0707@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260607232841.79275-1-dennylin0707@gmail.com>
 <20260607232841.79275-2-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607232841.79275-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7eLyhPtG9rrFRxeD6EygadEs6uvkIf7M
X-Proofpoint-GUID: 7eLyhPtG9rrFRxeD6EygadEs6uvkIf7M
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a267162 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=C79_ONC1FbgHrQW08VoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2OCBTYWx0ZWRfX9UvDb4J3H4+T
 7ayWlrv/ckZ9zxqN/t3r0Vsrl6ZuESWfwuTu6VFumjGNlpe0qfIIAf/fLvH7XU/exrpHKG+9V0O
 x/b7z/wtPc6pZPidcMIYfdNYmPkl0sA5x3y4ZMvv2O2W5A0eGWAr4tLR8ZesgT/RSJNRwPJzD8S
 AsJA/5JghibJMcyIDum9IWdweNmlHk3zJcX6Ak//oWWReVFOvX2sxdt9+uuSDYCWxlWv7mAYL0T
 bCmV5rJTf2FqrWLSoOaDFkTrhuZn4jfYUF1sPg6CjjA7i2J6jK+jg0wc6HBHV36zqik6bHYezEj
 VcfjW9QHRqJWrKsmbK3+xprqr47RLONcCTd+4ikbqeqaKBAG98SpXnTN/em33AUWZtfeIilAodq
 QF0o8Z4YHO8y7ApmuH3q4SXnLgFYF5HePxofXco2jWrPtkMe4opgfwSeck8Z30/+PGr9HV13vK8
 ua7+CPyfLaUuKjAePZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64141-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41F5F653A6F

On 6/8/26 1:28 AM, Hungyu Lin wrote:
> Use pm_runtime_resume_and_get() in iris_enable_power_domains()
> to avoid leaking a runtime PM usage count on failure.
> 
> Also ensure pm_runtime_put_sync() is always called in
> iris_disable_power_domains(), even when iris_opp_set_rate()
> fails, so runtime PM references remain balanced.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v4:
> - Added Dmitry Baryshkov's Reviewed-by tag.
> 
>  drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..f5e3341e1430 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = pm_runtime_get_sync(pd_dev);
> -	if (ret < 0)
> +	ret = pm_runtime_resume_and_get(pd_dev);
> +	if (ret)
>  		return ret;
>  
> -	return ret;
> +	return 0;
>  }

"return pm_runtime_resume_and_get(pd_dev)"

>  
>  int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
> @@ -90,12 +90,10 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>  	int ret;
>  
>  	ret = iris_opp_set_rate(core->dev, 0);
> -	if (ret)
> -		return ret;
>  
>  	pm_runtime_put_sync(pd_dev);
>  
> -	return 0;
> +	return ret;

put_sync() can fail too

Konrad

