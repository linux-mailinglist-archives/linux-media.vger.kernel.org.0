Return-Path: <linux-media+bounces-59056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C0iIxHF4mnN+AAAu9opvQ
	(envelope-from <linux-media+bounces-59056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 01:41:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF941F36C
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 01:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF310305C8E8
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 23:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF2037F8DC;
	Fri, 17 Apr 2026 23:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IR8r4Cnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EG2x6Wxm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E6D34B1B0
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469247; cv=none; b=TpsikBB4eTQzC75Fs8U1+bOV20Z57U6pGXBbwYbbuAmXnhV3S1SA8hlTxg7xT29EDvD7C2aQkNcaOz8zc04WCAsoVvcb1eB/OU1jlLRH776PnzWZ4w/hwY9MdTgnyeDcnZsM7lJ+g5/Q6CCfnbHGdflft/8Y+wzLFtSxxUyJOlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469247; c=relaxed/simple;
	bh=QLwLIyybGbuhb41Lgyr1BzNXP2BvhlqRdi9W1FpKYqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6gEbBDmFYGjbKPARcJieaubrPYA7XTEu0/9rwFRb+NZUg1FBc3y4H2hGog4y2wZsdiF1g39alPrOBnWQwf5a4U192ZWcKz7pdvhJQcWOmHVQhcvcmJcL2fP6zqLdBrg+N86Gf1liPI/ckY6NsN40vQf6xAYWt69xMfuTIFVs9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IR8r4Cnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EG2x6Wxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HIS0ll2434113
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 23:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vqsleupIiijc5MZBwUfkwuWc
	PF7CundACXwuw1EL1BU=; b=IR8r4Cnhs/pt4yc9JuNn9TtnARDPergZKPLO8E26
	zk5f6A8g0IkEw65cHK8KVBWDYsdXjtwqW5NUqu2xpeDXoCC31IriX6D3rSCxziXq
	/6zWA1Jiqm53KpxBSp6HXSOt75Ni5C5k5GUjB81WWydrtq153+Be7IOwibzm+edV
	K8gZgXjPnaCxN06hMv4CF4eBf43Pgwy3iAdjcZsvQ7r6zv9IiJEXK6UmUoTtbToU
	Z4sqT+09V9r7VS3CLUCX36k5M1WZvBEIdhxG+RlfiEJFb0JoiNEHrWEUqfz04iHl
	37x/FvYuP3uw4UERu+JATakFw6cxDxXn3mh1uupCAWM6AQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkt5mrp14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 23:40:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso35122581cf.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 16:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776469245; x=1777074045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqsleupIiijc5MZBwUfkwuWcPF7CundACXwuw1EL1BU=;
        b=EG2x6WxmY8+h1xq3/34/Igd6BhET1LB9A2JrlBei59S1377NOHky4oqUxX9olyYhB+
         eiFFSxnaPWoiTK+k6F3jwiT/6H1RHoZsxzTtxu0V1ImhtKRRJTHhPGjdpvdoLgfIS0x8
         EjgEKmss2ZqlSC749kdTV4/MuTv/z4nO//kkCt+HqzoYSKXNQbzdRPm5kJ3+I+WGPexp
         km+JrxW7Ym2cQV5f5wiHeitx362pyZFc+z4Ve911jMhnbI3fZTZM+J9MmLeLrFbfztLM
         lxPtfTZ0RosgUDYl0LEme8vdNprfwcRAIpE857WIMdhuNihA3+ch1DxE1n2P+4KrSMKD
         8A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776469245; x=1777074045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqsleupIiijc5MZBwUfkwuWcPF7CundACXwuw1EL1BU=;
        b=eXc92hZoa1pMryZkr6S8HjHx5WbXUPJm0JRi0OluK0vbxbeZv2y+wTwyd8HO2TiDc+
         GTi1LBz7XAkYwDS+GJTI6yhweYLB9ImY5fS4IBgQSuD6BSBRP1CM9TWhlIUnMP/MBFci
         HBEER06JxlY9QT8Pn7v296bixNw6bK/5ACwSzYga78YSCO/YIsjXc0aDo+5/iWFdyLeI
         qkBP2O+0LqVykSOu+Wf7JElILjQcrhlieTlffOuObx8dC0TkSZ3gLuOQccVjup7XGH4V
         0fgByR5LnF2xHyWwoz1coU3sAhx3tIhvG7JCJyef+fZr9U/FEG38RuIidpZ7b5hNZKCR
         W2ow==
X-Forwarded-Encrypted: i=1; AFNElJ9OiGE6cQktX5xbbi6/CUKeAm1GJEuKxRJ8nqWExKxob969rqsIGsLTCOc8mAwl4tJBhXmCJ18QWuPp7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXDeLNbj1cY+y3sSqd8nMWIEwTuiqvBnFxr4de5y4MpJBRa1A8
	qwByrID4ljqdIqb8yYK5Ga0VqIq4J/BB9l7IDlyzwfsUuXMDi+ZWvxSt7/+8zVs+UMajACcuyiU
	gv9i7LLnrdydimlrQJN4fDg6EGsp0r5Ci3+DROSx2CsKURGvE5HcBAMSCePIeZEk3mQ==
X-Gm-Gg: AeBDiesjVOo4u4nOYLtj8UNhfWihOojFyOTwLlrSaXDLDSoXsojxusSz0qnaJRkIfC4
	E3hjWF+qpGAjLxdr5v8KGRTLCKnXsRIvln5Cd2y53us3/FYHjp2yXB7SxF82r3jgXZ+JAH3+SA3
	WPrE/PrAKnfIkH2uz/TSutGmJHMaiSTRjRWnkanPwJ31EInd14TIfx0IU58or7dzxgANPZ58uan
	HuDVqNwNh3HGBr42BZnigDZwOHO//MeqT3YYweZzEAbg00pKQMYEK4CCTIpKdR2XgiMGg76yYPk
	fj+TSIjkCViFZS9ttJT6vtyl4yUOPoxkG3ynnrqEQRgiHQRjySGRdClgFKs8SrzFY0oJN+WuXdQ
	wPHjsz1qbv13wq2Pc5/yIYQncokv4MfNpUbfAlfbnTV1qCxB7FMnmUv6/VWMN1Q1OtrX0GIjnIV
	gTGi/WdUD7l8MVADGsfmDz7la7KLaW/lEunkLqa4eKoApOZw==
X-Received: by 2002:ac8:5f95:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50e36738d99mr63423621cf.25.1776469244638;
        Fri, 17 Apr 2026 16:40:44 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50e36738d99mr63423301cf.25.1776469244210;
        Fri, 17 Apr 2026 16:40:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e10e6sm816761e87.40.2026.04.17.16.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:40:43 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:40:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Message-ID: <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
X-Authority-Analysis: v=2.4 cv=AOj9hFqm c=1 sm=1 tr=0 ts=69e2c4fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=OHVz5xcZLeuoOJp_SuAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JktthJrDCI_vDUYJBQu0CBVCQE9g6z53
X-Proofpoint-ORIG-GUID: JktthJrDCI_vDUYJBQu0CBVCQE9g6z53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzOCBTYWx0ZWRfXz4G11ajmTajG
 Ndckm+IWwpiKQYQPZjcRAjtPglR3OfIK/SuVtJrB9Ml51FaKUCUeOgUvGBCumG4t4nOY49j7jEL
 yf+AYu2L9sVQvhn7tcxJRwZfTOUyqix/S5pzaNAclPdHNG1C5kMmmubFz5S+YfGTU1yWVnz7agA
 o6ApT7Hfr+ZtagPjqChOq78A3nddRJHyp0bNXd0UYElecIH8yck+1N8l6QrfDEbAXXTqXQhA6U1
 QMPgloeiLoTLtpLIUqv+dx2ZPVIiUNO49nsBIOMWpuRrC/o6xQINHew06toVSSdsFpqQIFUfan6
 6tOBF4wjDL9itO2ucYeFN3ZkscS2Oc0wyLtIo0vrS6IQWV2xRK/pqmldGh8eFIpY6Z4xFSrtn2y
 pLhPfY0XpZk+bT72L5H6cPEpN3lG3CtVqWsHqCsK8RZMe4S9JCdj7oTa8E0Wnn7uFryfpefU6Z1
 qRCyhVdy9t6YurRKCaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170238
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59056-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2CF941F36C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> 
> 
> On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> >> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
> >>
> >> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> index 90e966242720..231a3e9c1929 100644
> >> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> @@ -267,6 +267,14 @@ &usb_hs_phy {
> >>  	extcon = <&usb_id>;
> >>  };
> >>  
> >> +&venus {
> >> +	status = "okay";
> > 
> > You need a firmware path here
> 
> When I tested Venus on my device, it loaded without one specified -
> msm-firmware-loader creates a symbolic link from modem partition for
> firmware. Additionally, none of the MSM8916 devices seem to include a
> firmware name. Has something changed since then?

Us becoming more strict? Or more caring? The default file paths are
supposed to be used for unfused devices. So if they don't work with
yours (most likely they don't), please add firmware-name:

firmware-name = "qcom/msm8916/Asus/z00t/venus.mbn";

-- 
With best wishes
Dmitry

