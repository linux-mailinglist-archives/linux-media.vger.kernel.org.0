Return-Path: <linux-media+bounces-47697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB980C85092
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 13:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10EBC3B2400
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 12:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3CE321F48;
	Tue, 25 Nov 2025 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9Tw7SCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKWU0HVB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96127467D
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075346; cv=none; b=r06xR9Z7/eKuKVVWVB0STjy9EOtfzXvoqcq+m1Z8tUMu6LS49p6CHGLY0MKQ0kYf0JdokkC8/VOtkYUFWytOyTUCAZkL24Njc36PmqWfXAyvbltpwJ/2NqMDtFzUC+5WDLl47zO24Oda0gN1+IAhOYMJCaB0aEK3ogyiEqfmD/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075346; c=relaxed/simple;
	bh=zhcAgWB5CX2/QnNT4MicRl5DG34M9QVoVsUjPTRGATY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hpx1Jo+9Ugc+0D3OcOttqRNTFsSQCZjYa5w9zNO3kavqIiZy8P4+lrsv/ylSyC1uZy7Ndfp2eU9oCG8cbUP5brXc8rJryjxXngF1OQpXCRTEENFpDvCaVMnZ+FlmpM0IbugpChmYpmtk7xtB8E6iUR6nL19dut6k4jD2wrS6wck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9Tw7SCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKWU0HVB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APA9jlH1979400
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVtV14gixDkSmKxTGoprqNQc
	CthEDn+SsOiyCKBoR5I=; b=f9Tw7SCb0lEeRo2Foepu5ROoPEnMnDYCrOfDMxhM
	mleaeDRNziY3hZuyyDBhFcq0Okze5UMiVrJBoQuOVbsdr1PXEYmFENn22MI3ee2H
	ZI+xNtBYw/jQDYQMDLM7ULg7qbEGQYd918IpCCSkVMj5+A9zJnGiRsqCF7Y5TioP
	fYvqX8BdX+dX97CkZ2ues9YSXXQpOwEmOxfEd/cJcBWOnG/s7u6I826IJpsh+eb6
	GNJ7K8TdEYa9f/Tc+QPsDfkfsnLl4vxqDtN0x9V7Hay8Cr8shkfZeeAdnjao1A9X
	qF1/PK10YNWqo07TOTFSEnfNhGVJP/8BIVfC7E/Vf8zbZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gtpc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:55:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74ab4172so137313901cf.1
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 04:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764075343; x=1764680143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVtV14gixDkSmKxTGoprqNQcCthEDn+SsOiyCKBoR5I=;
        b=AKWU0HVBGDoeYOOoZQSJ4rRtOehpd0i0d5/Q6tS66NyuUMyDEnu7kcYJsfQV/SU0Dx
         66BP6ba7Iw8MKXzWCFe1YJHmM68UWJE3V3uechKC861dr4fTmevug8fQomN9QSJpazab
         uUJbl9iF8s0jcQ3FZIwZ0VE5+lV3tYwaOTKp04jwQqsYNd2G4iYv0NFVNhewldEOCXvn
         Jod8pPTdd9SMZasmnk8uKnXqN4cxRZi6Yqv0/sr6QILlh3rrbp87WjruxB86LikBwgrv
         qFDyyyciw3fdybhuLJITmQAtfmSBwnevZu9MVzQEQ8DF/O2ErJetsxM40BR6BfzD8eP7
         Tzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075343; x=1764680143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVtV14gixDkSmKxTGoprqNQcCthEDn+SsOiyCKBoR5I=;
        b=Z3mFI2Dre+hzW+rckmG7A982M91IP3WwVGfSDx8kT02lOtkAmblqrwef2XtEKoLyqp
         6Ly59XbtF83gE+s5kM0mBYK9aCWE5VNcG6i3TZ9+gbJFgakD8ufQlWjtxetNRnttJKqZ
         rPQdH0SqkvSsSpCrwWdPaOCH1UDDtFGeis9kJJZt4hmty3+8OANoJ1VIwWuuOIDtBlSv
         t9AbPVQedEEZ7B9QwylgbmvOeYYUxNIfCyRHeRm4FmXvL+nsQ8MmZoq/FEOqp7zYnt34
         OxseFYtgLmJacL9RCpqgDMclfIUf8VtN4Lr+ujWE//PRB74bT6HoLiXn1YvRQeutZW6X
         VsAw==
X-Forwarded-Encrypted: i=1; AJvYcCUi5aQaH56E3uNW6LC6aCVMV1ploXIzdnkG2pv65+ex3Pivd6qbSqJWs1blxq4x+eNGUMlwlwANHnsfOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0CEaVTPu9AfCdYlgwavtlO3GJhxlwf58xwWSTHM4Lzk9IGQhZ
	IZwIZVnXGoobkDflwEVNtxmtOCCkqFxug8idgPHui1crBpZggH23TfykQ+nBNpYeDLzpJuvf/1+
	tsOsTebSwzwz/TSqJOcvg0SIgiGWTKjeo4OXqWreW+BUE7QUdhTimHHO7ZxEqZEseoA==
X-Gm-Gg: ASbGncsP0kRaemq+9rnhkeNR7nt4+r/3S6v/Npxv3KPdnGFx6n6SIWYkTOtbJdzAdFx
	SLFpFdrnxvhl/XAZ6onym9Dovl2tpPCa2ACHWyck0MWBc1fVrWlKX2DzMM7Yh6Goli6oTup+PGe
	tH00Uz3EvqV5dwrcDAvvZ1E0reuY+tcwBcEz5L59Y62ZEl6wCTlbw76MNCHPd0U9XdhSL7W6NSU
	kmhLUT/rMvu/hU3Hje1/+X8WivZu+3RuWHFWeZ3AJWl7yXJ1vlV6SVIzAHmTTWUfXvcgL8Nsav1
	TCpx/SHvQqEbdu0jVEcJxtfdS0KQJxr8JIt37fnXE7asT5ELJlL5zPYgFUWq0SlmfY/5703AiJX
	VrtLPJrep3IkeQQaF1SO+3sLW+jwpYw==
X-Received: by 2002:a05:622a:50:b0:4ee:2a31:6795 with SMTP id d75a77b69052e-4ee5883f9a9mr223197851cf.12.1764075343076;
        Tue, 25 Nov 2025 04:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhNIasYVLMVZdZZWp5HXuFZ0sg0htr55tVL+zFjCMV5phbOBMGl7fmFN6bY2cHbu+X3CShog==
X-Received: by 2002:a05:622a:50:b0:4ee:2a31:6795 with SMTP id d75a77b69052e-4ee5883f9a9mr223197481cf.12.1764075342641;
        Tue, 25 Nov 2025 04:55:42 -0800 (PST)
Received: from trex (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052cfe70sm14979385e9.10.2025.11.25.04.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:55:41 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 25 Nov 2025 13:55:40 +0100
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Message-ID: <aSWnTE-jeHEg12N3@trex>
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwNyBTYWx0ZWRfX/WK/5aPRZfLK
 mQ/LndTujfsQUemMfrYE/kzaTJkBZs8jZj1U22JiTAleWVb/7x7P7xVpz6Q70b7o5oCr2ROCMi5
 luPXBJfN8FfqOLgeldRjAEOS9rPqv0cStJCPQQltZx4iGz3ZjcKqKghC5JGo9/ivB9WxnWEnpmt
 oXF40PjZLdiX8+ANczq5RM0Fw+NgusW0pVHmHB1rkzW7mVc3ufnSEIETRqKFHb+VhxNkW1+GyGv
 9e6Tk+2isXKMtWoM4R0Uitm3u3qg5111Nna0inP4XyNtVVOIfIkO88lC5OampQV8JHjrh5t2UTj
 UVxEoOKRo2M7ye21y+IGYChSMbKh18P6fXGf4BPlnJ0DXN9h/MdO87fGJCPPcajl1vnw50G/C8s
 ojFbddyxs2lsXt1qrNk+hVuopHitsg==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=6925a74f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VotzM4syS8sqhLSgdhkA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jXyJukrh7MVC2_ansACiLsGKEjH_6-Ha
X-Proofpoint-GUID: jXyJukrh7MVC2_ansACiLsGKEjH_6-Ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250107

On 21/11/25 20:22:13, Konrad Dybcio wrote:
> On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
> > The Venus encoder and decoder video devices currently report the same
> > bus_info string ("platform:qcom-venus").
> > 
> > Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> > parent device name. With this change v4l2-ctl will display two separate
> > logical devices
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> 
> Perhaps that's a stupid question, but is there a reason they're
> separate at all?

not sure I understand, enc/dec support different APIs, v4l2 controls..is
that what you mean?


> 
> Konrad
> 

