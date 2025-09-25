Return-Path: <linux-media+bounces-43211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DE5BA125C
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240551681D5
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C9331B805;
	Thu, 25 Sep 2025 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqY7GMJd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073231B12D
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828024; cv=none; b=FzMmKlhxwFmpLnKOgypE0QAfqtL957XOdY+7WZi5E9suxQD+f6cjv4zIuVucCG79MHiLj1CIRxpIJaxg0kQdtsXm0U7pGeDKww1I/muRz6FsbMkb/A6+oei7uvalnTnsiEgh5Prwn8408fXFzmQZjzhSDzgABaL4fbd3LWqiL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828024; c=relaxed/simple;
	bh=noW53Wf5UMsuRxihTPOClr/O7tMQvTr8ecxLwXqIN2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U51zT9vUaDQ82x7mqntveIXVd/BJDnMMMZfr0UC1d1vcGULuIdzPwmts0mGpALkmsm4irLoiVfSBI7565O66B5u+evuLYSl3colUXkmhTItMQG8N2CV0c+mGARZc6UU7HIvRnCJtzxuV9Sqds9iRfQcMs8CWGs00hV+oQKvS+94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqY7GMJd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQO06008118
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aVX0yTkOhGHO//LwAnkNtuoY
	YVQTpFOBtRIrFzAKS80=; b=LqY7GMJdMK7VeHpJubbg1X3fVp9z6oO0XoR65PxA
	e3y9nowAr7pj+UX0eaY/WSRbxTy2BuMHVmN/DE9a91a0bazt4oZCtF0e1dpFBJzS
	/Gu4JWCQlMYjjnfZ7b0uboToEBNzSsyR6NdYqN1eo41E4/KHPBTEJa2lYEm4H8cM
	SQBUVVKxY5rTsNuHdj40yu037mZcMnYDLL++ax94W5DMEUFcH3HNjbRfZ3lgF+ga
	dhzIVApUKLV+Bl/spwk7RdZUsGGtGHLW450z0mPPhF6L6vQLoVg76CMF1Y9mcLjP
	az/RAsnYfxk7VmpuID5BpRrFnXjmOS+nxma5qLVY9mLMag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vr3ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:20:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d435215956so30267451cf.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 12:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828021; x=1759432821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVX0yTkOhGHO//LwAnkNtuoYYVQTpFOBtRIrFzAKS80=;
        b=ZmmyGbsXJMjzI+hnNMbODmMuzYipxegjPwNQ0tqyurvbsx62bfN4nND8p1MQb7AjXR
         0tVyjGTDbg4S+IAAO2UFSibKAqZK8H0WhtSCg1vTYo1nb/1o871mh2us3d3dLVY7cswr
         hetS2GyDnU+OJbupnNLN09MfEcNbpnR5k/XM9eAnCxnGl1kEdPPif4hDju9AhZ/gJ/xa
         s8ckMNMOhDPRFr2g9rcTppkie9ce1cY5tdU5ZK060CSPRlY7lD94u0Lfj6BEhiL9m9cq
         1Z+jsdeExu1Opsn0kCc+Si3ds8I3V77ZpMkBBEZEFEYMQG+6mEzw1C94nc4pqbmEfsLt
         eAGg==
X-Forwarded-Encrypted: i=1; AJvYcCWf5tKuI3iVCVB/dq53RWHjqAWyfl0F0Hm53MFEnO/eaVL10HxSENtKG6Qp9hhzc5vci64vfsPmwTI0cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPK7KomU1O8dL/ZzPb9Z42K0BRPVxiZrvMdB6XBRYiJpWHeXK
	JHPB80blCaDVhKoH+toqjrb6RQfIk0gKuvn1EHLfqSsbrTUz9kgH2ftuUBK5giKtyDJHY9PLChk
	ztHmGwDkWCUtXQGonQjzng8bn8vt7IUXG7QxlRvUCTe7jO68I0+ScAzpSBVyFb2CrlA==
X-Gm-Gg: ASbGncteKXXqUPlX2rOcQhSvMB7uwCh74N3eB0X+0GZEH3IBqxh24ZUMpsH38KC1h4T
	OU4Z4KEygiruMS6jXynfXYyibxU/Y92IqNAZlEjfjuD0MX5ucoq1uKuwomEcY1iMJGQjhert6PN
	md3jS5o/lamwPFlwmQgixp3WL+WcpWmN2T3Xm96NjFN2G2DJQoOtEBrLp5NifoKqZM/eoFA9bpf
	NOAt6KaqK5hXk+KKy6HMs6EK50diYm4sWQbv8RaW9JKSnGgfxAtAib5pFHXii41/6ftAwLZ0TmD
	U1yv4qjK6PgftS8ykS2ViwwNRWjVVXJRj28jB9FJiEseYIVEfNSZt+vuC3+34UdCBHVbqC81co4
	0oXCJqoBVLM5fHz+y1Sd/1WZXZJrsbJfT3JzdRyVvVKagx4yhitvR
X-Received: by 2002:a05:622a:11c8:b0:4d7:dc01:e007 with SMTP id d75a77b69052e-4da485b8ac3mr59098221cf.24.1758828020788;
        Thu, 25 Sep 2025 12:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEL8DUJGV4/DRSfIOimZuTn4Odn0UkGiNcvVKXr7ZTyuhqcFAJEskXyqrnPKAfJUZx5GcQdA==
X-Received: by 2002:a05:622a:11c8:b0:4d7:dc01:e007 with SMTP id d75a77b69052e-4da485b8ac3mr59097771cf.24.1758828020143;
        Thu, 25 Sep 2025 12:20:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4e394fcsm7414781fa.22.2025.09.25.12.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:20:19 -0700 (PDT)
Date: Thu, 25 Sep 2025 22:20:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <dyfkztpjrfcgi42vjriabogh362zzxp24eoolr5vkhno2zi2ny@t43qpjdv7nkl>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <vqzon3svfqvk3poz76jm5x5gf4rd6vkygegonafcprmkejt4aq@5kwlwytg3ulk>
 <1af0d19e-30e0-1260-877c-5d6027c3d297@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1af0d19e-30e0-1260-877c-5d6027c3d297@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uDUQMSnbdlnBjldbnLPS8WPsWga0fqy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX1GqqGElruAYn
 Qiv951MnxYmxPlWaftgafLWVNThUlhj8cGApb8QUW05hHlKBgjN0rZNzhnq+0GbCRboIo1Ymrxr
 dyKoKjkQZ8RFpN2gyMaJ7qNJE23MwCknkXHXAeJ8N7Ykyw0ehACWspcyr9nfyPmnRdkNxolMaCy
 k+HyPQjLthzpkAhbbA5sW8Wx2lRR7NSogCnAdEsOVBCD8HBL949rLaF+RyXSMVZPs/uARlEyG83
 8FFwXyYpkqFtaP4R+4eEWl+MLwtKCSkXvmUE5VoAyQPuX2qIWc+PCBg6bXGcy4lB4hDoYrtw/J+
 mFDI9ZArl25Oq8/WO8Nw5g0FcojCYRDR1ENwG0bE/ecD1zCXZCZHMHXGMBigiiU4FQmTf/kIlHQ
 DDc1VTS2g/LFFDYDYetgs3VCpmn3vw==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d595f5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7bwHjh3cNi8DZH5-rfEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uDUQMSnbdlnBjldbnLPS8WPsWga0fqy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171

On Thu, Sep 25, 2025 at 01:27:29PM +0530, Vikash Garodia wrote:
> 
> On 9/25/2025 8:36 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
> >> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> >> compared to previous generation, iris3x, it has,
> >> - separate power domains for stream and pixel processing hardware blocks
> >>   (bse and vpp).
> >> - additional power domain for apv codec.
> >> - power domains for individual pipes (VPPx).
> >> - different clocks and reset lines.
> >>
> >> There are variants of this hardware, where only a single VPP pipe would
> >> be functional (VPP0), and APV may not be present. In such case, the
> >> hardware can be enabled without those 2 related power doamins, and
> >> corresponding clocks. This explains the min entries for power domains
> >> and clocks.
> >> Iommus include all the different stream-ids which can be possibly
> >> generated by vpu4 video hardware in both secure and non secure
> >> execution mode.
> >>
> >> This patch depends on following patches
> >> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
> >> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
> > 
> > This doesn't belong to the commit message. But you also can drop this
> > dependency alltogether. Could you please do it?
> 
> Sure, i see below works good w.r.t schema and dtb checker. Please review and
> confirm.

Yes


-- 
With best wishes
Dmitry

