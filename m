Return-Path: <linux-media+bounces-61239-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJPtCqf6AmokzQEAu9opvQ
	(envelope-from <linux-media+bounces-61239-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:02:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C9651E371
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AB953021B9E
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442C24C77BC;
	Tue, 12 May 2026 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kR7zxMTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PstFF62Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EA34C6EED
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580110; cv=none; b=c8DcdW0tWHNNgOV81tqc0E3Sp5F+VbLQKWGZeN9NTg2eqBWyR7OxgybBeVS2VrGP3yz99bUQtFt+OCCAO+quawD+FfGDhe5i3RP24cm74Umt03i/ZKvCOs4EvAuDf70vffUU2kVGiYt0dKvgMynYQ5BtFjAE2jd+1lhwWVkDGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580110; c=relaxed/simple;
	bh=M4MGfksm2KJNKz2SopLwjPKXAvHbsbcD2AS/jpfC2rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feQZmc9lrH5AI8frvBecXeB91Oz94oxMa2iRBjNrYb0Sq7/8IwJuQYbq937rA55dzObSQUbNIznzRBlPRcBcqIiVrh8u9Ie+H10OmD+sZv5K1cMmlPWWLPdTMXKmTOuXsP5q6J3InBS/CJDD72y4oMPF78sHbY7AKSdIk4hJTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kR7zxMTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PstFF62Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5C4cJ2519063
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=; b=kR7zxMTPFYJQouA3
	p4DGnZeq2/EBw6uokAjZBrAa5nUZ6Mi3Kv3DQrbc59yc7W7qZ4HZ+xZTVUMxsk1B
	oEoyy+azEPCOx78k/Yp2Nmoq30gk4JODkltXyltyrjUBQc1KYMvX1Jn0vcIj0dBu
	YG0FcxAIskVG4+AFcERwbuBaHJquZZZHCjBy00e001lhkdi8S2Exg+fDXqsG4mOu
	NdI5ySOTUP8Y5lImAiYmg950I/HDfab+vSkp7YeTe987hItDG5goSgJ59DrHM04k
	sKW/eiufLRj1UKFwNsXbpVUt2hG76jfY2FZSPgCKA15m9NI9/MZh4UHzQvI8dv3Q
	QrriaA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1jmf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 10:01:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9568c79b893so245696241.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778580105; x=1779184905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=;
        b=PstFF62ZIbK1WxtzqxKyhv3Ko2fv+XiamDF9kMwoLuV2ff8ptZ3zY4zMFfR6SNskBV
         VNqWaZaPDRUnRKgCiDC5W7YnJEJQquxRKh0hjpKS+1DAockEDzL/fU3g4MrEnCKipOgr
         l7MA4o9aJk3N+NUeiQhSJo0q9LJS1PKRcfOIXkZTgC5OOds1TmTDHTW8Bvuipl7BqvUi
         zEhlWgHtfCQbtHBQWamQt7Wa9+E2fKOh+bIyWTt4LpaGlSMHie7LQuTDHS+WGP0FLsFu
         0G8zfs3MG41Jbw98sLW8UjTrnXrUjLLC1sABeANAKdXvn65gLAT0LU60bk3bMWfRbiva
         cfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580105; x=1779184905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=;
        b=PZY4wX5RrcapNpfKczvENThjdo5JwlpB+LQIHJnY482HN5BjTW2LQb6CC+LQI83Oem
         Pjrv29Q1v+9L9g4UIO+12SBIttVvPBtMoLHL4Tp/0uuxq6ZQpP5+rstpszK/AxI+7+Ii
         0FqktU/wOKt772fAqtswF4svqxEusM1vUj8BLGn0l7N1uVsjr7wSw9Sqjf3DRZvLZz01
         Oc8G35QPaYhUXda9lSbQRHlECh99rdJ78EVMUED52SVKNNVv0+5nXrlTtKOQ6F1l9JDK
         VC3x1eq0chQSdVz5ZENy2yF6PrffiDN9hnV+U8P3CL3MEHkxSbCgWiO7JjU8GDPGCNfC
         h2Yw==
X-Gm-Message-State: AOJu0YwfnaZNZ1P9FsN5nW2VIGYSMktIbxP9eUSny3GeC2+IixLJn2De
	6rmRC/p9+J+0tFVEULgFRe4RQKINelN5ul55hP37p9HD/IQJ8avmZoo6cuII1pVfn4EUMgHygFN
	VfFFihlMw0AL5M5O94UT54EiDHCAU86Zy/dwKWrAhAERuHrNVEt7ejdG9n/DxsOM5QA==
X-Gm-Gg: Acq92OETSj0MzOQAZMIOlG4sdfj+MAsb2sPtcrsderSJc5kfBI1qgLiP/JUpqySDzEB
	6vh5LnTagKb7ChWWLur1YnEdjEC3a0D7+9Nnklt5qhvfOwHQ/LVG+Q8NWSd7+zk1OOSuCBPFZ3+
	IXO1pGQxqQOSb8JiE/tkevJwn/OrSJNBvx+vDQ/VOZ87id7pldsGqzgtje9XwltADJGpAG4KUA/
	fRK6cSmEie3HYqR74+vsxAsJXyQq/fO9v2nBXPHntA0rQ0i7b9mGDJ+dNkOpsvgF6jheJY1ABNN
	hxY5futzh3mZdsKTSIZfI7aTLcfLjlCVXiQ9MCsK809DB0KMa9JdoXG7nCn8dMdUOJFPcbOAYlP
	x/N5ibTQ7RHh35D+Ac2/rNtlwn/zaMqizmAcsOUC4esqVl2DZ9fDRNVQWD2PgeoNeF9CXH21Vj2
	cuq+w=
X-Received: by 2002:ac5:c807:0:b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-57599d9db41mr1781349e0c.1.1778580105609;
        Tue, 12 May 2026 03:01:45 -0700 (PDT)
X-Received: by 2002:ac5:c807:0:b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-57599d9db41mr1781318e0c.1.1778580105090;
        Tue, 12 May 2026 03:01:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcc57c12799sm492515666b.47.2026.05.12.03.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:01:44 -0700 (PDT)
Message-ID: <08d1fd7a-c782-4d8b-85ee-1b46868db343@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
 <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: itIHFebAdmEMr5aXd46Vi1WTnvFSd79T
X-Proofpoint-ORIG-GUID: itIHFebAdmEMr5aXd46Vi1WTnvFSd79T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwMSBTYWx0ZWRfX1Ll9Bi5vN5fN
 gZ4CMcpadO+izuQ5BhPQoIxxD6CZJewwET6IYWJ2jm5eAUyEWfytYmr8P9krOSRJGPcaSvoGkWd
 mVLIbxcFNKkFU63t/hbiG8D7UYzzn+RWXhG9fuoCqynAM6NcIcn1sYnQaiVOTLrWWdruCIiqXYF
 H0q3vqc1I6MLF7Q3KUCS3j8d/W1AL4uoDda583ejwl3hmqkCvpLa9uNcjyF6ikc4/Hu9QFNpQyH
 vwCVd9x4L0umLjTlL5Ek0JgS+oo0ObJmQqEfXX1a9Bs6v5Mf+NjIMrsDTIqnLe77/UOSB8F4VDQ
 FX85i95jUrRoAvQjKEBMZ5sWq9Z06xDsOteQlZfbpKOpiCSdp3lMC0dyKvt4gX3hI4xJurLOYhV
 IkgeMmN70SdgdqCcUpS1r3T9eu73BFGGwlTwR7yTjMT5TY6WAbQHvltfcmqa985F0+THPwa19+d
 p60k00oLjvvCwWM3UKw==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02fa8a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=alOFDL0nBBd-F9mXlB8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120101
X-Rspamd-Queue-Id: 87C9651E371
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61239-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/10/26 11:47 AM, Erikas Bitovtas wrote:
> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
> to these GDSCs to pass their control to hardware.
> 
> Venus core clock cannot be enabled if Venus core GDSCs are switched off.

The downstream device tree suggests the reverse - the venus_coreN GDSCs
refer to venus0_coreN_vcodec0_clk (and venus_gdsc lists
clk_gcc_venus0_axi_clk and clk_gcc_venus0_vcodec0_clk)

> But since they are set to be hardware controlled, they can be switched
> off at any moment. Vote for the Venus core clock to enable it later when
> GDSCs get turned on.

I understand these words but I can't see how they reflect the change

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 45193b3d714b..420997b00ae0 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>  
>  static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>  	.halt_reg = 0x4c02c,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x4c02c,
>  		.enable_mask = BIT(0),
> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>  
>  static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>  	.halt_reg = 0x4c034,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x4c034,
>  		.enable_mask = BIT(0),
> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>  	.pd = {
>  		.name = "venus_core0",
>  	},
> +	.flags = HW_CTRL,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>  	.pd = {
>  		.name = "venus_core1",
>  	},
> +	.flags = HW_CTRL,

This should be HW_CTRL_TRIGGER, paired with a change to call
dev_pm_genpd_set_hwmode() in the driver - this currently only happens
in vcodec_control_v4().

Konrad

