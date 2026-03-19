Return-Path: <linux-media+bounces-56321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDaLIx/Ou2mXogIAu9opvQ
	(envelope-from <linux-media+bounces-56321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:21:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1502C964B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E61923017FB2
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A433C276B;
	Thu, 19 Mar 2026 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pL/WoztI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewpiowIk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B53368AE
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915638; cv=none; b=gdIJvtDKsU4krkrfbXVdljDRTGcDrtMiI0zLB1KW1FIaf1XT6kAEEsYxDLNuy23IRyW4GHFtji7xmtHx9kw/Hst1necQv1EtDHYARpaj0mjdDXjTNSYFPHnqRx9D+AhiHurUHbEiUxwBOtD2v8cAK7yEYkhdhn64f/AVSpw96gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915638; c=relaxed/simple;
	bh=wXrgYmmBOOLY+uN7MnvVeB22AOEm7KnmaCtsSI6mCu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quWYxucqE4eMTq53h5e4sPgrpP/+hv4U4DKAiUpnewPTjIBbYCMAwtxMmZtRvehv/8Wa/uhZ9lUMTcu+JGn2AgM/djnRt6N1tgBca3QCpi0OkFymwn8pvxmB0VyFZthRDYeeb0Fhs3nlrOYezt1WLPiYe8ZyoL8lFUWWjjRI+/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pL/WoztI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewpiowIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J741Tr2883747
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F14dYmtwhWNDhnCsov2s0WNK
	ZiUjjbCXBkIPyd2HLL0=; b=pL/WoztIQJeL374qJ9fx4yztaFXlaCFYhg2PxPtu
	8DJx3CcSuIGnpjmHNmTEaqmZhG9f/pWo4XZOPofPguiO5ztlrjaDECP0qOJHvNEy
	YtyGV8Ayk8xgVadB4RCPe2tYkbBz6ta7w7PPtRsXFo2u4LYtu3ph4BI4ouU/fVGV
	QbKP8rPfgJWwJTg1Lwr3DL2dx6hWMeeXKblryHAObEWHrSaMZ7DjqnYNmlCzGyYF
	coJoGhLf3WukWOCBI94Jg/F1UTjMLOqhw45WHkEURZ+Sd9LzvZ7BUlyk19KOnood
	MIbK+jxBAlJqiGfFA4dS2l5q9lfKpNs0ouNuR6beLz2VUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyv31m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:20:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b220c72bbso85611591cf.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773915631; x=1774520431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F14dYmtwhWNDhnCsov2s0WNKZiUjjbCXBkIPyd2HLL0=;
        b=ewpiowIk5h798emm/szxjIta96YKrzCVjlMtdQBL23I2OoUheUayYc6TrfGOK6P9ot
         LTDmZQNHIeU4/SvBcHr9nNxwNnCTXwDElKhQ+doIsDNL16sZnd4Qr5VcWPm0QKCEYl/i
         l78CnrgbhH4T+gobvQ4fJXHLz1tnXnczT3L/VL2mK4/zwyvqP6xa03Ud5j/ulO05vbWt
         m9rHEa3oiEwmNeizy/LYxbGWag/bxWXltCU4k2ZjWnywyOK8vFI8L4gaWxc1Pv6i2T/V
         ptnB7K/YbMU7xJpkqWNFEvuxruMaIy6YJ2TBVQ5wgK3B61FxZV+0xkIECzwHx6/EqkeM
         VVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915631; x=1774520431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F14dYmtwhWNDhnCsov2s0WNKZiUjjbCXBkIPyd2HLL0=;
        b=al6Ik5GYipUd0B45Fn0Hgel2/+K7OwEc1fp3sWNEH8S+GYOgMPtF+gVPmMoVsrBrP2
         QrevD7pd/g9qnQp6Ht8krOqCh/rbzDCbYIIW8YGEkmnPLQGSKFXGeqU/UJRns/2ScOJe
         RRVFYDwDf2ksjidquBxayN5FelMP5eFB5DCZmlxnRqEqdArkGCNKCH8n/5b+JjKEddxW
         B+bYUcFsxwsoFhcOonY6B3UA9pb9MU+1o9nGs7GvGylZMQJnzSzMT2h6rPG/LTxRVilV
         pH277o2I0v08jDEpRQtlOBOo+3rpfQwmJp25/giFmT2XnhOOpWpMpRBwhb0dWo5q/bQ1
         QfTw==
X-Forwarded-Encrypted: i=1; AJvYcCXybRHz26dDVamZ0/sl4Yn4+hSe9//dEcgz68P8vz9nUUqeMf5khYkwuKRv2KEUX9e29McSrj+RPZfyhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRhYzQGw6NlzTluTkWxNZoSWJtG0BHo8yIcwxxe67xJzz3pil
	rallaBhesWI29w3J6PEWEDIAK1TtpP2DqAI2B8BkHLIqms7QmplWwsmEYWluY3cJJZ5b1jIRrN9
	rb7nhq9vBt85hSe6qmB14x4pSY9MwiPPveiz7XBLmj1scaBF77Mn/Q2e+dhdWziWlHw==
X-Gm-Gg: ATEYQzzglwWZk4FG/G9nCSMsOpelnR5oDeuKWbXOY9q8gDgc1eabNh35sFBLi2y190g
	fFzoGWmIFkH61LRQLa5QI9HGJ+ugj2/uUqHOgAoKwY/Z2WMKrpK7DYLBYXLK7BtPsmE/eDTTPc3
	kpKeVLvMdlhfPUiFvw6n/Wpdln6f8vd0Dbj0NBi8Xi1V0LHBapRLZnpV4eIT2jN3kVAdDYWK7B4
	7oVDAaOLeFxV1wuoJDE/50ilAZA8mECPZm4BKILEWnIrerapWA7YZmgb9/E8u9XdaTA7nkVbhC7
	m/GNBk3uvxdz7iFW+yf/jXHK2CnfhQrrkTlrYIQGFahWxLjxcBtUlToSKrCWwTBp6cbWweg2/vB
	Vl3B5s6DRGfaxpMw53JnaQavDlg26JKjkaxKKLiCinVb/QQ9mFeM5hvMTs+cW6TKk0IzXeDnDZJ
	qkG949SdAGzUFugSurwa18Opwm/6zJ2KOWHw4=
X-Received: by 2002:a05:622a:154:b0:509:37b0:7b06 with SMTP id d75a77b69052e-50b14745065mr87141971cf.11.1773915631489;
        Thu, 19 Mar 2026 03:20:31 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:509:37b0:7b06 with SMTP id d75a77b69052e-50b14745065mr87141621cf.11.1773915631057;
        Thu, 19 Mar 2026 03:20:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e4c0sm1118102e87.39.2026.03.19.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 03:20:29 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:20:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Message-ID: <cp4ge2f3cocjkk4dj473jggs3wto6gjuxgeorthup3kse26eaf@y66beakv36qe>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
 <20260319-enable_iris_on_purwa-v3-5-bf8f3e9a8c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-enable_iris_on_purwa-v3-5-bf8f3e9a8c9c@oss.qualcomm.com>
X-Proofpoint-GUID: pY6XSZiAAbZe5DvTTafkU7Jlq5GyIx_L
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbcdf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SiDv6NLMiRjB6r0vW5IA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MiBTYWx0ZWRfX2uA2sJ2oQmTO
 pFEEz0p157csPg+1WHoRNv54hrWohrsPvPfJWa2JhwSHn1fd7TPSyp6XEpyFFahM0YkmrKiRZDH
 SDrITk8WG1Nmw81ksA/9aLfFFtNExjEGkb+AviNXPLJNAlL4r8GszQb2l2IcqfcXXzxzWWSus4F
 MLAAS5VPec8YF4wRiV1xFvsF9CMEMa/qEL5t1+OwHd+jKK9MEm3nuJ4y9WlPsDxHfWjfuU10Jf9
 N/yAqR/+qw1EOViYQEUFhhLMoAfKxXmi5jLKvEmnOJSKbrj1aukoyuYl6B+U2zChbk6oyrgPxvO
 MNYj8pw5881anTdpShpGvsC85Otk/k80UMIAH/bVC3Yo4yO3syxXEGFHftngJJluWdtkHCF8j1V
 xkVr/I9vWVoHWKfYzvp48eD2g4X/Ca3HDUMdhYV2iitHKU4ROsEBkCQDyaIYU8AUIHAW26hc3/t
 m/hCirxn0E6g/3/LdJA==
X-Proofpoint-ORIG-GUID: pY6XSZiAAbZe5DvTTafkU7Jlq5GyIx_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56321-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B1502C964B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:23:57PM +0800, Wangao Wang wrote:
> Enable video nodes on the purwa-iot-som board.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

