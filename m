Return-Path: <linux-media+bounces-64337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 25jSLq6TKGrjGQMAu9opvQ
	(envelope-from <linux-media+bounces-64337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:29:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 384C7664935
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:29:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H2LdL2ZE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QrmGqjqN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64337-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64337-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76AB1309FFE9
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 22:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076BD4BC02C;
	Tue,  9 Jun 2026 22:28:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B037D133
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 22:28:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044129; cv=none; b=cSnBtyM+c01PSqxUr+8/SpQScITNAl/PSnIXD7dw4rSo4gouw9aiSAQqlbDA/8vA5QYprRG1gTYfgYMua8VlVY9nNlQqvmyQRKtW6qIjbHy9rdijMP850mQ1Oka5LtW53TE7h+D9nbDKr2rUEfVd0YSMeZuCHakl+QVA46yPTyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044129; c=relaxed/simple;
	bh=PdWPXvVpu3sR7/V83pxTB3l/ajc8fSi5X/uX9gnVoG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l93bNoa6vSTtbEHPKcfPXxTA92wFqpjxu4h0lvDJ+dLNJVVwj5CFZslaBPeZtVAcLi1HQjzrINVZFuNeg9rVJOG6mcpePC+k7305bLz+dHsQf4S9zzugRb/qI8uFYTW5BsKY/thn1r4jsHp+MmDa1+bad5rYJiIeBzMV3RaNwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2LdL2ZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrmGqjqN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ME3n03502517
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 22:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pMV9sIsCMro0CR/kIgUPICoo
	AQ0tUVgnwlz3eG3t/+k=; b=H2LdL2ZEzREmtRRrgWCWX0ru7fKaXBIo2WQpNBhS
	y6F4Qo0A0vd9XzXXfPuzGR7xIGIsQXMMx6FUq/N5HaodKLJXZdR2MXoNCxUWhmDa
	brFh65gQxHIGOr8RvxOV7JxZojRNUEJGcPeuK2flIUSWFd9qOqpE1vpOf3nS/Qa6
	JhiRKOxIkTzEiocST0L5J2DfahmkfHzDOAHzZEbeY7OO7jg+KZFt7QCMqh85jhhM
	x7dYeN0yupyzlC0M9L5se1CCayqll+Ws7cN2VzRREtiILbiDur6cSFeHmhN6pKp8
	PMjX0hpbryEnOEFJHIaXkOSxwaiwm9hERVlQDbQL0RTq5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkmj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 22:28:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51776d4355cso167593461cf.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781044125; x=1781648925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMV9sIsCMro0CR/kIgUPICooAQ0tUVgnwlz3eG3t/+k=;
        b=QrmGqjqN0oF8hiD7CDBAKT9tUClvJ9CzfeIokU4a3uLlOdLTDYQ6D6QAvtvMrdYHup
         hOTHtpu3JHs8K1hZV04/UY/UZ/5NyojbpJc6j++oqjq53QSS9Q/YkoIL91sQvOCMLX7a
         wCR7rqPASaD/JEiPqlHl0DhoprFW23gT4YYW5PyKEApszE4isoEMnZOaSOvEcIkfwtWY
         +ZT82Tp7m72UsDVVgHHhYMkjje9dNs3RmAVXupEflcg3vrBMhHFTsHhQuNrf4r8CvU38
         i9uzl79bHg03FfKlRRaXebC0V1fX+YKKhdXrT4EFupPlHkVEtWAz6f4LNsmbCoFPseGg
         Fllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044125; x=1781648925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMV9sIsCMro0CR/kIgUPICooAQ0tUVgnwlz3eG3t/+k=;
        b=mI30aiG7TOHO7hQG+hlYiijZanMOinPmDysG8DD0De3uSr3llHql6itN0BeRFyMHjW
         JUtjKpAyoB/VZaDEXzBCWTEBZJW/S0oywMhxRHOuR90nGtPEvzuhlO3KFTHxSsg1mwna
         QtUF8v1df6s57ihktr4Ti42uUAMTZIf+qlY/lwkOzNyMLc+6hiWVQy30qXmSmtxiiACn
         qMVOXYUowKDJnVWFl7XfYBd4dbkZeKUtV31Wadv1GH9LcU4KG0WbOKKRDYYa3W4NYWXm
         wZwONdPwnTuYsie8beGVdrtOnYPlAeAUj7sj9hvCqMvvg0/rkv6UlF8JM7NU0wqG2dxl
         JAvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FUr1ApD38Pvjetk9WzpMuMO/OpIfjICJidsMcGYXtelT6CteGwa7xor2KCPLXczikKXLLgHWNUyY67A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbX/tONsAMnQBT5GbS+UmHiN4PT70SixNjROuG8+j44XPF6QHo
	38j2HmWGOOKWYvEgkK5z0607guixGNFbqi2emPAna3/GIOMftcR97BFXgziDY4+5fQzNLyc2mrW
	IORNVI7Ru/ITi3Pejjr07Kh3A0loTwFX5tKvTm8+zV6dCwSzyRTdX2I7EDgW4HoKKDg==
X-Gm-Gg: Acq92OE1b7HdWhx4WXqMYyHsA2hGaVVim9aJKOusjxy6o5JKjMRSfePErL3ZzyQX8p/
	G4hl3fDIQkjxIa+XBH2xOhXB/HtUqiqScQPKaATd9i2FoxHywhADUlK0yK3uMqvSLi36eGZJbfH
	Xx9/ERkUxN/ih1SKIJxdsF4zJ7HMR/oT7T0sOFgMBdW4AQjLORc/p41OmUqY5Id1etTZx2A6icY
	14Ztb1nik3URI3uqgsNWi1WFZYdFxX+x6os4F1TGWMyrJYSJF1EIR//WS/RZO4J9un9ZiH1eysf
	vFnAiv5rrSFcL/8c8lejs3TQHpxySKcCr3JYaqlN3g32IFGtqGJdRoJ7zEltSjovvnpRmEcxiZm
	5Ix2/lXQnPh3COlaTansE+cfUqu5IoNykWupExq4hAvoyCEzMRX6bDCnUxmHA1Hfg6LPjuH2sD9
	QX2vVWaavQcpbTGyfHKcVUH97eAdoWuiF5At6kr//lt95HrA==
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr238426611cf.39.1781044125370;
        Tue, 09 Jun 2026 15:28:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr238426371cf.39.1781044124971;
        Tue, 09 Jun 2026 15:28:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fdc6bsm4879966e87.29.2026.06.09.15.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:28:43 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:28:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Message-ID: <o3zjmtmordfzeimgowakpsz7jit7q4wsxb3j64gmvgkvre5y37@ztafjbpwqavd>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxMiBTYWx0ZWRfXxgIcPZBkAoUz
 A6RLklY59uO76H6fV/LrdTpLkRgUdGWRd5S1ByUYZmdSLwstfNtski8t8U/ViCW83WzIh7smcKZ
 VMVgs+phf5vii3GVklgsS4LChYlkagd4/xhYfZeUtQyqo4IncFRKByYOQdhS1su/mJyGhUHgyas
 X0z3eG/wuPw7VnLDCghNLgvKk5LV3iJBGHHvdtZDVEg2c8mjAEUm+FRWWnDYD0Cz9jK1XELB32X
 hoYyHMaKx2lercblg5CoVsLtzZ0wetcdsc5fQmPq1Sm6H7IqoGfX19HlfpfJIKejtY0AI3Xv3si
 tYYwodyQsuGLortOCV29VgFUnimqz3wZE41VPn9Wmv2se8SYq3Hb5LIM1l1Z23tdC8Jscf1NZj3
 y5lM6RZk2Du8AIiKOKzKonpKwCI5PuvMbftmHdvA2hU4/I1NXFZLIml0DMvNFH5FYaGBIbskkcZ
 xspf+3PAILCeJmj+hFQ==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a28939e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gZ9Hao4PvtIMPGLi9fIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hXo-bYyvkriE932iIlH1KhtZVamUE9x6
X-Proofpoint-ORIG-GUID: hXo-bYyvkriE932iIlH1KhtZVamUE9x6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64337-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,ztafjbpwqavd:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 384C7664935

On Tue, Jun 09, 2026 at 09:45:41PM +0530, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
> 
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

