Return-Path: <linux-media+bounces-67401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rytkAzaFU2pFbgMAu9opvQ
	(envelope-from <linux-media+bounces-67401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:14:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565F744994
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:14:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DD0kkFjt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ucykpd78;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67401-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67401-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64A163019079
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C0B3ABD9F;
	Sun, 12 Jul 2026 12:14:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDFA3AA4EA
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:14:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858468; cv=none; b=hqhkjGL/soHA5PdVw9+j8FnHFNKYnFs/f9h3vSoMS/xarZxX9TblCL8FSQcWdpj651eQZJb5HrNMsHQZCtKSc3PtG7jj1n06nIwa0Kp/Xn4pmBm24r6g3lwHEL0cB45cObPSO0YIThfZCu+CwMvYYux8ezWcTOqRKZcspSCi/ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858468; c=relaxed/simple;
	bh=/InVEEvL2BDFOHfqag5PBcB5YAbkZtlMQjkqKfb3u/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZXrCl5JVqSU7FR8pTF/Ux3gE8Xcq4MlEGFNihTiYxQ4BhK4te/WQ39ANsjOcTM3PCxEt5pS/tnbi+bMAP5AZJDFU37TEvJQcqM2es3065ossWB6GmBykBY0O81sHCwdRSoUrobLwvG4oZNzMEqS1rgYZ1xQluMcLvMTckx6QfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DD0kkFjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ucykpd78; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAemm32391997
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HfwZ/Ch0hmCLwy9ZofNn28jc
	v2cqQx6opUokqQoHzlQ=; b=DD0kkFjtoZArhuSik/sHzOWP+iDteAm1clFv6Ujj
	VtvFP6OGrPIEVz/pCMHrCQdeSwCIN1w8tNSjDYiQucU2Q8wvdxdinhU6rQVbNlP3
	Xq2YYTrrJOXmUJgTM7yQQYqRnucX9dN/m1ZqKrbZ2myX7aFZ6hJvHDyJFOTEyl+n
	JWiSyV20zzt+KqmSQnixiTNpEHCZH+DIVU8Z287m3jrfqqLPERygvcR1yPAI778o
	fc41bngUh/jQQ0y4Q/wzW3CzwfrOvzPbgHm8PqFP8DS2K1j/YxAscFFsJE7hFC8Y
	FqVZeLRthBxB238HvrWWbR643TDQNVh6Yw6Up9qZCiEMwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vapq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 12:14:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso32873056d6.3
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783858458; x=1784463258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HfwZ/Ch0hmCLwy9ZofNn28jcv2cqQx6opUokqQoHzlQ=;
        b=Ucykpd78EJlthrRuMHUPadUzfIdXCjE1occ0J5XxkM9mzoH7dtbHAkH0QWN6UGD5mA
         /bQTcqcFry+St/Gf4WveF8VIjGlgW/lwXJePikAcLukRDPSqxv23vFgP7ZnKtFbL2X7o
         qciQxhlBpEODH+g+9qzv/koKTUopKmyNhRVlYOg6wmfzwmOMSfT4+hvxtdtYT6qT7XY/
         xw+4YVjg9ZIyb6Ex4/rqAX7rDd7FSYUII53CZulywa7N4SBvZNTpJQqXzXsHKg2vxocL
         4RedpihJarwlgCa6xpeBUjvs5LhWgq5pSuAG6b5ENe2PxaCUXK6luAFhCzTBVdXcCl6I
         +m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783858458; x=1784463258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfwZ/Ch0hmCLwy9ZofNn28jcv2cqQx6opUokqQoHzlQ=;
        b=X7IdugAtzer4uJwuvctxTaCsIMKV5oCMYEimrdJXQ9+mLBwpY+64r14tUnpi0qBS85
         v9I50M7nx3Dc45zHhCP06qDPC/MRGKuzcQbqqU0/bW+rnLfLf2gUXseczGG+DaKG1URR
         8Lxe15Iuh8AelfLq/wTddPo594dxLUTUkBKXBpru67K7AfeKSyj+hoEAAjUsUznJMwEh
         Z2JmeZi79RyRWGrEccKXvjE0nFuKnnzyJs3XWTL7WPdKjlIT8jrFS5pRhKHkrbtEeMcg
         1xbNKPh3zyPmS4AVGtEqmcgq0u5t6ltMiKZ/Nk4ua9getDEPy74xY3pyTbAvY1MCiRNI
         HKyA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9ekMAX+R3c6iHIQ/U89csz0nHW1M98U+bjyqhasigO7Xq6wZJ7N8zA+BMgNEfP22wQoB8DlsvcFZ3fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuXlwN3NPsbHnUKrkvdnnDRL+GdOQqNZbH7N+uELDtna9Lhmst
	CxUY8i0GyTGz7IGL31lvvRYHcLDIKZw1zWscX69BRtCwpUws47zxleiH8IK6DwvfRV5+6z3wUnK
	LYlE7XhO1Xgqncs5RQX5hOK1YTmeKwgkHdod6hMOf+3w6MHAAppO6MpcU8TLTQlBroQ==
X-Gm-Gg: AfdE7ckvQT00M0u5lqf4Wt1ZZqmAN6sZcw8T+bFwWVsfyQW8j7TB8mqWUoJlsus8Qd7
	LiMotlk+mi0yhefw95i0F23MfxFXVu/ms4XzgaA+Pq7F2Np/h6wI09ws0XqMyDd8lVU3NKwN6Kf
	PF8mvi7OBZDPThwFnXB2JcfUn8fGTrhogm84hHmAt2ni7ZI0mDv6DbCWE7iMkiyccvuZ8Xo8hSp
	CZXIfieJGGALN9QcBylNIPw+RSTAwKxlX2TbUBze6M64veaT5VTu6lOG0qsydDVE9QUbEgC9GM5
	WEHNT4m7Db8dgPQcYayusHAm2nXTEeKkJ8QFWDUQ+WYV7SveP364PGQy+ekL5OHUfnctUKXZ8wl
	Qa9wmGuT2hfMd8fdK1dcTWrIgFvoz3xCl2Nk+snpblwWflYbiIb0fr0Pj4NU0uxkOKMiOPWIaTq
	LZB9UqJKX8BQuLeHuXjyTQLCzp
X-Received: by 2002:a05:6214:468a:b0:8f0:a2c5:9d59 with SMTP id 6a1803df08f44-90402369c1fmr71343816d6.21.1783858457529;
        Sun, 12 Jul 2026 05:14:17 -0700 (PDT)
X-Received: by 2002:a05:6214:468a:b0:8f0:a2c5:9d59 with SMTP id 6a1803df08f44-90402369c1fmr71343576d6.21.1783858457034;
        Sun, 12 Jul 2026 05:14:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4f901sm2091705e87.23.2026.07.12.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:14:15 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:14:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Val Packett <val@packett.cool>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
Message-ID: <zaigjwjpldnsrzsfbyolnlvblteav5esfstoib4m3eusc67a26@jotedakvvo7m>
References: <20260601041336.9497-1-daniel@quora.org>
 <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org>
 <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
 <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
 <ff3748ef-cf75-42b3-850c-b8742a814920@packett.cool>
 <519CAAC5BE344EB7+e6d7f90a-e481-468c-a987-dac3c69d7362@radxa.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <519CAAC5BE344EB7+e6d7f90a-e481-468c-a987-dac3c69d7362@radxa.com>
X-Proofpoint-ORIG-GUID: 8IOAjBV36jsUjDcjtPZsePSYB44uOkCs
X-Proofpoint-GUID: 8IOAjBV36jsUjDcjtPZsePSYB44uOkCs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEyNyBTYWx0ZWRfX+pBlfdsePREy
 ZS7nhYY/qavDTO5cU8qLte1RSRu/QLZ/Vv/jJ+LaDjSl2pDaRXPtAd90YV1nGN1mwtVMLM4SIVR
 gQqpCO15wFwzxAKBO1V2FQmOLIWJTVM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEyNyBTYWx0ZWRfX/euxrWPzWf8p
 cx9rPBcQd2VodrL0wX4LkivIZMQqvsgQpndPgAHazeQqZAQ9BK3Pe2I5GVu8jEPFPlfoLxiAn3U
 xZClyMx2vOLQ0PMTMJ1TjO5MOO8cjXfOXwdDLh7NiaaGZ+rUrBufjmMFcY6l6YRN/3nx5IdQG3L
 uYb7kSHO5PYXx8GS6pVsZLQOytd4vg7DV0MoJlwTLxldzNpyUMdLRxe67om1MbQCuUGHu4TFSAa
 hSzgjiI6yRm0RP8xMJva+6sYs2pVRbswlsiN5SPUFAg6bJ1wRRQ/dmGzmljWt014xambDKqCtnm
 0s5xbM3cn2JvxpV9fa6YHaCNGuBCGoEZYO5hQqngLSUXqmXQ7Nz2WQ/cNp1DAA7uQO6XE28Nprw
 SUM0HEKvwQNJhsJpowqcjwL+0Vrq/Iwr1d2q5h3kXPBjT309pAbjGRbexhMx4S+gaX5EzUi/6ue
 hUgBHK0a2qlLwfWGorw==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a53851a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=nl5WK0wFAAAA:20 a=VwQbUJbxAAAA:8 a=pLiI7BJ3y60Ur7kopoMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67401-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:val@packett.cool,m:vikash.garodia@oss.qualcomm.com,m:daniel@quora.org,m:quic_vgarodia@quicinc.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6565F744994

On Mon, Jun 08, 2026 at 12:17:57PM +0800, Xilin Wu wrote:
> On 6/8/2026 11:48 AM, Val Packett wrote:
> > 
> > On 6/4/26 3:38 AM, Vikash Garodia wrote:
> > > 
> > > 
> > > On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
> > > > On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
> > > > > 
> > > > > On 01/06/2026 05:13, Daniel J Blueman wrote:
> > > > > > On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
> > > > > > triggers unhandled SMMU page faults
> > > > > 
> > > > > How do we know that is a correct address - does it come from qcom
> > > > > documentation or trial and error ?
> > > > 
> > > > @Vikash, beyond your comment I linked in the patch [1] kindly cite a
> > > > source for the different stream-ID <600MB behaviour, and share
> > > > specifics, eg if silicon, firmware, or driver and constraint, defect
> > > > or otherwise, so I can include a definitive description.
> > > > 
> > > > Also good to know if my workaround is good for long-term, or on the
> > > > other hand handling streams <600MB is important/useful.
> > > > 
> > > 
> > > Thanks Daniel for raising this patch. Did you also try the memory
> > > fix i mentioned in the bug [1] discussion ?
> > > 
> > > Coming to 600MB, this have been the VPU hardware restriction all the
> > > while since venus days, and since address could not go deeper all
> > > the way lower than 600MB, the issue never popped up earlier.
> > > 
> > > Consider the memory layout split as below (Iris device range is
> > > capped to 0xe0000000)
> > > 
> > > |-----600MB-----|-----(0xe0000000 - 600MB)-----|----IO reg--|
> > > 
> > > 0-600MB range, VPU hardware would reserve this to generate different
> > > stream-IDs primarily for internal (non-pixel) buffers.
> > > 
> > > 0-600 --> VPU would generate *secure* stream ID for non-pixel buffers
> > > 601 - 0xe0000000 --> VPU would generate non-secure stream ID for
> > > non- pixel buffers.
> > > 
> > > When many concurrent sessions were tried, non-pixel buffers were
> > > mapped into 0-600MB range, and VPU generated secure ID for those.
> > > Since those were not associated with the iommus configured for iris
> > > node, it led to USF (un-identified stream fault) and device would
> > > crash.
> > 
> > Umm.. is anything *actually* preventing us from adding the "secure" SID
> > to the iommu node?
> > 
> > I just saw a patch for sc8280xp that did just add an "extra" SID for iris:
> > 
> > https://github.com/strongtz/linux-radxa-qcom/commit/
> > e92850f792498c3a72d72d667503a29bf6bb0a31
> > 
> > and I'm wondering if that's about the same exact issue.. (Adding sophon@
> > to Cc: here)
> > 
> 
> I'm not sure if we're having the same issue. Without adding that SID on
> sc8280xp (HFI Gen2 FW), it fails to decode anything and crashes instantly.
> From the trustzone log inside the crashdump, I can see that the buffer isn't
> actually in the 0-600MB range.

Hmm. The decoding is working on Lenovo X13s ([1]). It says 6.18, but it
was the Iris driver patched to support SM8350 / SC8280XP, which I posted
some time ago. For the reference, the firmware reports the version to
be: video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565.

[1] https://github.com/lumag/fluster-tests/blob/trunk/iris-sc8280xp.md

-- 
With best wishes
Dmitry

