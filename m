Return-Path: <linux-media+bounces-47837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20DC8F9D7
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 18:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A3E4C341F37
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 17:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9746E2DF3DA;
	Thu, 27 Nov 2025 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHb6n4hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELwfcKrc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AFE2DECB0
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 17:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263513; cv=none; b=Z4xqzAKMGANNigeH/OVkLfG4k0TcQgAzKDTPwtxW0FsDRixCrZlp4GBGK2YoKJIOrbaoS8hu3t3ZbEpc76PVx8mvqKVHvAuqVAE/g1IUW2rYXQX8fm7ltfQkQaFZhLmNtGH8BEai5sJbCxNo2JHsLhSR1vTnlUC1eYczkBhSCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263513; c=relaxed/simple;
	bh=KAFi5JbbBJfMFxgA8bsf741JU3gXq9avIww5xxobFJ4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tqo9mmWqs5QNm/uC9G+9UCM+g9bm9M9EbvyBmf2x5V9bb1ZYNV5xvmRL0bzL4gDSv6cF6l82NsLOx9mjOVwlK1pcemhc8Y0tLzNv+UIF+Dynclh/qv8KxQnDg2ETfyzFK7QLaIzEuu40DjY9l9Kqfh3nTRFoZ7u/U+8WaWBUzrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHb6n4hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELwfcKrc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3vue849004
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 17:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xKHFHglieq9DwIX1qAy2GVma
	f6AAWGcJzGzYJuOOIfk=; b=kHb6n4hyXpqMAwEHC6U2Ch2vpGT+Kk9tBdywzAuA
	THPg83epjy3L9qRG/ScCtYF4CIpBlp2PoD+sES9EgubgVCgUY+2h0IFMNpcFasIG
	pjgy2ygOOH/7p/R7E6EqiuZIgXcUhYhlkjc/G9YGHoqFTRvybQS6r0xCg9paePuR
	f/sfBqFEoVUXDFxYQT+m3czbDhqaztyrOFqdedm6Vz1LU3/Lzunn+ticrSBt5nvn
	SXKC1B6zGxWUmkNfLHK+Yp7fzYMdJ1uIIxZJTZ9XvPMFqdKDP7EOUlt2mk5G8qcP
	fFPze7WxwOcRHDpdVQ3YKttMey1pEsOZHVhpAEcSc+Jsbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd91ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 17:11:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24a25cff5so176074485a.2
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 09:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764263509; x=1764868309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xKHFHglieq9DwIX1qAy2GVmaf6AAWGcJzGzYJuOOIfk=;
        b=ELwfcKrc2HZAH2ZTRWsnWoWwwOcu7KJr0JXNEHeDPheOuPqCREresUwu1UQAS4/b04
         VqHwjj9CwqfbcRnKELmrCsoNFVRqX3xs/tVbf4vgPw8fx1ScmLHj5lGwMTT2nl3sMrZa
         4afEeA+aYP699Zfhoqx6tgxVzt/d/OEBns1ePveA0n/zpbD6rGZuvYLCNHFOIZoj+nO/
         fwv4c9jfbYxH0lEuCbOTxo2k1Q7rcTuF/BY9/G6S8mPGolbmUlpdndhpQXezcx9jzfld
         LwFcft17uOZCqR/cYk1bFhrQg5bKIBx+TZWVyMVxaP+fW7UXOauDqjjQzA0Owg3hKl+s
         lhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764263509; x=1764868309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKHFHglieq9DwIX1qAy2GVmaf6AAWGcJzGzYJuOOIfk=;
        b=gnjDG01A1wlU3A05m5nQygBAxCUc4wp/CfvQ3J9BcDb0do6xG1RbokJr9a6Y82JGOc
         J/xbEfDfo5KRQb69Pd1YE9QhiuUmzCtVcg51L64PVyq5tOr1/aAjJ0a7jonaRzQYC/Ui
         nlrVA0XYz6lwCqwhIXiyqrCNDs4E4xjiEmS3O9RlV2263HF8hg005MWMF2nQqAZzhLN5
         gjgOd8xyBFCRvSD1I3YXQ1PvOVT4TNTVyrUru1Lx2JvJvxmkGEwe8FILvTBHrDvznQ3G
         Fidvn96PWMCXKklJ4q98nV2zW1e0bQWMzMzAxKbsxUTOkhFzK6qhWJuIgfqMFl/F6pYp
         z5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVY/UbL0iJtpoIGOPuJBqYeCOC5E5/wWUDFGjVvDDYydjfDQAsxzmMZbZUZ4IC7zmLZkhprJ2c3VccgQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL+Ddo/941XSRRiyvyqp4uXR04heSTbd7b4O4sGouyBAokFiRM
	AKhCArlh7IySu+WjJCqdx8yK5IeJMFHXSfpL4LJhnOf6HYQlKS9dLIQXFxvuP5vrYG/dFO6XrHk
	9qa7RHdndZu8KywsYYt4IzL8PMA/8ilVS7c7nO26dceFd96C6bu6X/N74CPpHRhzAGA==
X-Gm-Gg: ASbGncsLtXCDrNxdHnFdqgRUvWock1sG2MxfWW2GE3Ozamtxusnn3l1dwk2sq5uMMWh
	9x/uoXqEL6LD8NOahCXlt2OmgfX6ogR4xkIhNvPtPruYskkBd5WjQxqFd2slHj4ImONrpGfrzW2
	jyUY9V29c2ILpsquTiRASw8kc5NRcxX/p+oIT+jogaakPOGQwI1kjc6v3tuoXPbRsrfywAKHYKs
	CeuLlIkuyRQhrKcqcjFWflpfr6b5rNtB3TYtNDH8aIHzvIkSQVcIpJzbXMgA+fUHssuEl0wkz1m
	vt6mCZTsJVZxenqgrJUHalFRSTkTEZwDuIzPeZKX0q1HCJL3nDmE+pTGKfhR0gxWupon3HAL4Il
	r/Xw81ynbIocCi4ogi+M5Q1hSuX8/9EW39Y6xczg5xsso
X-Received: by 2002:a05:620a:a353:b0:8b2:7777:f662 with SMTP id af79cd13be357-8b33d5e2e03mr2298070385a.64.1764263509397;
        Thu, 27 Nov 2025 09:11:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpbOHyRvcPoUEWgG7Jdmg9KFeghmtaK3CTBFjNtdulf4SLw19xogWdCEXCZtwlEim3SF4yCA==
X-Received: by 2002:a05:620a:a353:b0:8b2:7777:f662 with SMTP id af79cd13be357-8b33d5e2e03mr2298066385a.64.1764263508933;
        Thu, 27 Nov 2025 09:11:48 -0800 (PST)
Received: from trex (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm4699399f8f.26.2025.11.27.09.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:11:48 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 27 Nov 2025 18:11:47 +0100
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Message-ID: <aSiGU4Z81Lr0twpj@trex>
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
 <aSWnTE-jeHEg12N3@trex>
 <6eb8681d-d82e-457f-907d-3ba5b94267f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eb8681d-d82e-457f-907d-3ba5b94267f2@oss.qualcomm.com>
X-Proofpoint-GUID: 5r1yfHoxRyDImVsYB-5yABDOY55J950T
X-Proofpoint-ORIG-GUID: 5r1yfHoxRyDImVsYB-5yABDOY55J950T
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=69288656 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fs9YcllxGVdyLQezLusA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyOSBTYWx0ZWRfX6BM6ym3rBrhG
 ZnEWdxDhf5vzg1G5tlU/+red9jmNgYsGeYSaUnUXO3KYLt69ljiiI8z6gDl68Izpte/lb2fC69k
 2DLArErQvcPj//TVmEc2P5GxTOnhBZ/pHes3/duLRgCOXifPPcSnr6z33vfdpuIv6C8+E+bKM93
 MW9ApSd6/9KYRbJRlgBKaXKENW1yT5gPsKnx7Grj9CMDvgTmHXa/u6gbkl274W9HM2xpbu2HeCm
 xNnTYJ3N+7K/2M7XLIkdEKE0MXubiUexNVtQeY/dntvKZszp1AM4wqNxinUs5EHYoD8+vF8ew5R
 c0P1mFgzXvXpSTKIkhxAGLW27mBhhJPlTNXl/qLpTwTah622s/IPNKRogv40gtNXfW+NgddnHgw
 0v6rk/6QspdR+yIaAcd35CTzadhF0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270129

On 27/11/25 12:47:19, Konrad Dybcio wrote:
> On 11/25/25 1:55 PM, Jorge Ramirez wrote:
> > On 21/11/25 20:22:13, Konrad Dybcio wrote:
> >> On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
> >>> The Venus encoder and decoder video devices currently report the same
> >>> bus_info string ("platform:qcom-venus").
> >>>
> >>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> >>> parent device name. With this change v4l2-ctl will display two separate
> >>> logical devices
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>
> >> Perhaps that's a stupid question, but is there a reason they're
> >> separate at all?
> > 
> > not sure I understand, enc/dec support different APIs, v4l2 controls..is
> > that what you mean?
> 
> Perhaps that shows my lack of knowledge about V4L2. I had imagined that
> a single video device could implement (non-colliding) enc_xyz and dec_xyz
> operations and was wondering why we need two.
>

I think the main issue is that the pipelines have very different
flows/states and semantics so even if the IP block serves both, the
v4l2 abstraction needs to have them separate (plus we want concurrency).

