Return-Path: <linux-media+bounces-64012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JInGBZ3+I2rq1AEAu9opvQ
	(envelope-from <linux-media+bounces-64012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 13:03:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 680D764D248
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 13:03:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LrVQW465;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cenPDrjv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64012-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64012-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13F4A3022941
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 11:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CD635AC12;
	Sat,  6 Jun 2026 11:02:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C5D4071DA
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 11:02:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780743771; cv=none; b=rlrpie9byyhWaDwOeoxuzzfJLDC99T1DpNZjx3mpa+RPU7VDGhVMnbkkidszZITAgOpP/8TmxNCNUUmQ//Mk4KfXW0k4tEnyWAT/VkGvxneiY9JOnV2nzaIeHHQ3KOwyuKHURH/fBmPSy2HY2VOzQS1v2g+E3K32/lR/lIYr1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780743771; c=relaxed/simple;
	bh=gyXPG6ELo0bmL+MqC1Mzp39K+l1S9rmcEaB7WJdATCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKJXGtBlipQD7qjduxhGaOB4a1Vo8NqnfmWCKjR6He7T0EtkZGo4h2A7lZ07a3NZerhVLN6H9yFiws9iHRJ9rHiUCFF8KV61AdjDydnXwEwjlZhC/t3FNRV0pMfCrb8RpHBSzMh/FT3Tw4rwpEf/PPN6cdk5qooMdf+qzmwUcjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrVQW465; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cenPDrjv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65660WBr621655
	for <linux-media@vger.kernel.org>; Sat, 6 Jun 2026 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0LAyodJZxP2JtWWuj8zBbIW
	zqB3tSZJxVWd9wh/CFc=; b=LrVQW465tK7okccwqCIxHHZWWMRu4xV1FLt17IhE
	dLxH2fhb2rsWAIrZRFdwrnTvwgt5CwSSFAEOVeHJlqLDM+hodJVNuccx8qsHgrPH
	++TAOeI9QWvLQ2XgmajkBMHS5SOc0iXQDG9Gxtckba2FQvHORkJ/onmrhspHQM5z
	9Iq5TNwiF0fuyTp5ozeJ+19Beyxa3HI6wCzkcuKog6MgO/5MNE41BflD0fGylslN
	A1SYy231lNLy7b9uMeh2PHXQs78lTJ+GacmUC8ypWEf0vrUAZzETwKbdNXN6qcgk
	qwmIyM1kUQ4EBAG6rhiSsgYhsaS94YHtAhSmxBGrBV/6QQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrqn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 11:02:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7002d6c3426so1818292137.1
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780743768; x=1781348568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z0LAyodJZxP2JtWWuj8zBbIWzqB3tSZJxVWd9wh/CFc=;
        b=cenPDrjveyOgojbcXBPwW7GN7PbsEGVPsoPr1SJvC02Cs72RaXzRgpOim/m2eg86Be
         5EJHt7J4F0yM55wxF9GRMShjGlzAZsLvgYm31vIp0QHDzrnP/eyWKbEThiGUV2otWHv7
         kZ0yPplMjNa/VybXeWnD2odjbuuNo32SyXye+otc2ps8vVgNRvGmUv9Xfl5PXXkO5w8F
         6t9b5HHjT2hubJVGF3U4+WTc/3X+P/prsQ7KOl1InA90PlLyaMFo7XnBO8zUmOFi5ns+
         V7/aGtJu0VZzLFPc/90mi1NX8hOiN0A2rcCAqkz78ex24aDPb/Gkcc2JFSbkA0ufQvbR
         I/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780743768; x=1781348568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0LAyodJZxP2JtWWuj8zBbIWzqB3tSZJxVWd9wh/CFc=;
        b=Qg6Lhu/JJtfxZHDCK88Gxr6i6rxK2ki1OYxBwtWnedq6cQOtE4XKj0FjNB37g/3DkL
         5maQ3Ujlc5ST/JhMM2Fuly5opY45YJOb4crQNmUhbV31+PcrJu0EgXvIzy1/f3k//gj8
         zphWmDfo970PplPA4yR84Il2SXmyrJhWpQ5EERC89X2f9DST6mHgsYz7oLVp0Ty0hkU+
         NqPYP9vhgJSeRWLopLdNmaYGPgGweI0SpTXnqqMxv2NSBHu0SxTEbs5gNooNdNf1hXgs
         T4wDIohyihQH2S+0nuY/wqURJ+ouASNkpU8SUL9IfaDLv2foEdnV94f8PczS4ZDzikGX
         4C1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/aGMw0UeBE1sSox4jimZnvc/j7goXlRmbTmOWipPafCz41O3OCReSEcCGg0Ht5nBZAsDSN3SHiiK3RIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/iL5Qs7sy8oXzQ2vHc0lJJ3J+57txPm2RnDgUa+TX/bg5W34
	CQPvradXG6+ft5chwIMyhVzsje0WTAjVMsJI8Q/iU8/eR6KgKy2pxZISpaJoDWoZ0acBIDgZ4Ts
	UHY0wHaxCXwgCSH0ebLddZ40OYgR3OTJYOg8Pe6I29aJggXlX5LKzzKN2Fs+NQfwUqw==
X-Gm-Gg: Acq92OHRBv29GOpt4vzsOb5bV1TCfOQ0lvKwGEpHb/5b4S5I9L5iy//EZtOGmfR4pPf
	X33TZ+JZTA7h0pXFNLBFlfeETuStXMAXmXI79QP5qeWhcPbm1ZjotDzDqbs7kAFgkmRHbs01xeJ
	3LyOkSTaDeiDiy5r3OmWa2BFphbirpw6l2S9s48P5Hx7qDDihBhZD0AUCW4PS/tzOh4LRaSKI07
	eDeJbATKJsO4QzGhUW+xvowvXDKlxzhW5q9tTlEW9lPYGPBSh6OTE3sD2uHIPLAL6YzAVg9KrNJ
	4xiK3PiGjiYOUK4sLcGy+jDhLf4dmwgWuwxPNW43L3lI7xHvDT9NeDVpQkT4DB/ULjieGswX3H2
	vJmRBknNHqbG4ZhdwB2TEI3YjzJC9yT3VPeuFTUaEbVqe4xisHfLlo3n6K2NZKOKX4aEI0H4oJW
	3aD2/8MELH5ZJ5TMJgkLMbhASkl/EZe0AEzA7sUp6TsyP1UA==
X-Received: by 2002:a05:6102:442c:b0:632:d8d5:2908 with SMTP id ada2fe7eead31-6ff0d489a97mr3582792137.26.1780743767708;
        Sat, 06 Jun 2026 04:02:47 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:632:d8d5:2908 with SMTP id ada2fe7eead31-6ff0d489a97mr3582768137.26.1780743767298;
        Sat, 06 Jun 2026 04:02:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed90csm2383114e87.7.2026.06.06.04.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:02:46 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:02:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: iris: check decoder format allocations
Message-ID: <kdnmoyguzvkaih2emd72ljlbwn5mzarupioxztkfyz3fb3lwxu@lbc4wkzzr7pv>
References: <20260606040736.13-1-ruoyuw560@gmail.com>
 <20260606081636.3-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606081636.3-1-ruoyuw560@gmail.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a23fe58 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=dsol5IgxmFJRDfbvXG8A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: lFYHoMlXr8LUQHIJH4PykdetHXoRhAQG
X-Proofpoint-ORIG-GUID: lFYHoMlXr8LUQHIJH4PykdetHXoRhAQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEwOSBTYWx0ZWRfX1dZTeQNlMH5O
 95EID0km2aEZlYki/Dj6+9R+AXjCg6rkNQUWTojVyM9TFDSl1vkLc3f6E/Nt5eACTes1v0iArFM
 +EuHt4Rx4kut6YTlpKxSm10tC+u+E0M/8Ra5a+ZXvNlQcS5+wjeGzonyWgX1Xgy6htYKgUqojLg
 B/mUP75Dabhj77JgiJMEDvpk9dhCWkz5pH3vFxoPz0b9yAZ8vVmHuZOh8I7YXxTztlbnNfr7lIK
 HR9qlSGLjK820p71GSHpfW1ZkKy7Vtb+BULw+LUDho3SnbiC8rA+a1Xj/xS54QelhFaP8Ex2fvx
 f5qZhlHiWx6InFjWNy9Uwqj3kM5+Wlx3abEq2xV1xznvIaZr7xX27/vREmJA3quItpEePQ6BUyd
 taio9u6qEUOee7DNDkvT6OHEXxlsUrSbf+znOdcHRAS8a/zls5eUoci9JEdVM5jXCXQ8QT0YtZR
 KAHpBjNbogso/PFNTiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64012-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lbc4wkzzr7pv:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 680D764D248

On Sat, Jun 06, 2026 at 04:16:36PM +0800, Ruoyu Wang wrote:
> iris_vdec_inst_init() allocates source and destination v4l2_format
> structures before initializing their fields. Allocation failures would
> leave the function dereferencing NULL pointers during instance
> initialization.
> 
> Allocate the formats into local variables and check each allocation before
> assigning them to the instance. If the second allocation fails, free the
> first allocation and return -ENOMEM. Store the pointers in the instance
> only after both allocations have succeeded so the open path can unwind
> cleanly.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> Changes in v2:
> - Allocate the formats into local variables and assign them to the
>   instance only after both allocations succeed, as requested in review.
> 
>  drivers/media/platform/qcom/iris/iris_vdec.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 99d544e2af4f9..837f29f403bb7 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -19,10 +19,21 @@
>  int iris_vdec_inst_init(struct iris_inst *inst)
>  {
>  	struct iris_core *core = inst->core;
> +	struct v4l2_format *fmt_src, *fmt_dst;
>  	struct v4l2_format *f;
>  
> -	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
> -	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
> +	fmt_src = kzalloc_obj(*fmt_src);
> +	if (!fmt_src)
> +		return -ENOMEM;
> +
> +	fmt_dst = kzalloc_obj(*fmt_dst);
> +	if (!fmt_dst) {
> +		kfree(fmt_src);
> +		return -ENOMEM;
> +	}

This is not the style of the rollback that is used in Linux kernel. Also
if iris_ctrls_init() fails, then the allocate memory will not be
unallocated. Further iris_open() will happily overwrite those
pointers, resulting in a memory leak.

Should we replace the pointers with the instances of v4l2_format
instead?


BTW: please don't send patch iterations as a reply to a previous thread.
Always start a new thread for the new iteration.

> +
> +	inst->fmt_src = fmt_src;
> +	inst->fmt_dst = fmt_dst;
>  
>  	inst->fw_min_count = MIN_BUFFERS;
>  
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

