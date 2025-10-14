Return-Path: <linux-media+bounces-44483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B6BDB9B2
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 00:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F169424A9B
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 22:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07ACD257AD3;
	Tue, 14 Oct 2025 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3CZsYbl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B081E3DED
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 22:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760480342; cv=none; b=VwL3IOHDJeXzUAELfrZy5Ggjawq/6Xif6XwxO5EgUXyUgasYF1bsKXhKvt/pWoAlIAYqDkK5hwa+sgqUelaDqlz5xydLJ1/tU7sou7iBtCx46p/P+Gw13p4fefgAvwHuUV3LHLUHkzPNzpW8N/bgJg3kNAzLDs9cipnLIuuPawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760480342; c=relaxed/simple;
	bh=BgOEdwjIa0sGaBXDZWeP/zbioOzpk1ibfhXUvrGElG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kx8vtxuQpPsiUyNu+xfUljvSXC3ursnfi+e1bcOSRWgNPtlbNkajCL2iNHBRzXJ3tL4gdOq5g344cWcit88LHTv48Pi6Wj4AiQ57y62oSuZHwF31yYnUlDP1yNqDirbT/5NrDZ6poI+GjnHkxhWKQm58JrwZu4KPrjHjq8T5Q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3CZsYbl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKQxo5032681
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 22:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OkOpBf2jHdOpnY2dKRzZfr8A
	V66mGASDdTGyX8Gj1ZE=; b=k3CZsYbl6IVyzJiYvjp8IMg6+AloVJA7TyNccJR2
	QXNEHf1jD8GjHqD1oVkHRGP0GRO5oSGwFxDnXsev31VOsqRzUd/CN9CzFu8A5dor
	ViykUK8LI+t0cFXFKC/sDl3nertJ7Jj0NwFT1VmnohUoInfTxP5X4ipTnD9jGHme
	Rh9bALdkV0OO4SU426F9KVXeAUuy2peF74Z1yloAdoGufSkYWorDo4GN1b5ojhy3
	iOG2OdCDXSLn3vypuHgM1UvTeKRI2x9xxzNmgNi3Lnep+d+O1XciETJF0P5lQV8K
	nnzRmAsED9vCAfGp2EVIYFTIvPXZEQAaIPTnXedTZoXWgQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0t6fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 22:19:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78efb3e2738so276979646d6.3
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 15:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760480339; x=1761085139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkOpBf2jHdOpnY2dKRzZfr8AV66mGASDdTGyX8Gj1ZE=;
        b=UBjkGS7wOtVxsmLkJO1/MgukA6oD1rqiOm6HsgCcUy889z6CNqWlxh94aUzZILbOXM
         OcFgPAu4ssCfhMJ3Mj4IDt0A7FLwuX245wzDXmUNCyBe1MqCrXk9Vbc/QDKt1VCTP1fL
         XzkfmwjrSkM8wSkoVoxWo6tdmHlQYgvPypDju1mJPu0xVkG/dB9JesXb9toncM8W/NQL
         GWMzYS/A+zap8ZWfKYNwfjBkDHf5AYmuiBgbzoMTYaVqoKQ7USfRgLffeKru+xC3lFYI
         MQ8Hqmyh7XyzF3x7hzOZSSU27+gPkhiU70rHwpMjPpJSJKaYXGlLVlY1bTRLecqrzDlW
         PcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCULWAr10xumP4GyST80Vr/rkS38akc6YD/PSkrGWOwIhg27vIAATZAJiPpbE4rWPFiSqBI9OhpjYCV3vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0fV8F1EX3ADjRJltNCw6IkCSOBsmf3qh4yTItRs84XJWkoOXX
	+H9OWsb3r05uZX5uo5hkpmqJJfcjF1cPMBkq5jKJ/XkagkVYWu+yImWvCX1ql4/9mBd1FMo3knO
	OyprVWJ4xhjYys2XDZLFFEXfcpmyaRNZQ5Orz/Ew2Pj+eVxZ0KA//55gaikBdoWJc9g==
X-Gm-Gg: ASbGncuMBdr8dXHYZTbVYIHhJ3WcWfeAuwTtI2GEoJaKN03UxoGhh/SIl5k0e8QyaTJ
	s+cuhbcMLdGmfowd4NQgcRTZdPq+/7B1MG9fgvArKhxILB8sA21FmAiQcip7SDttnrEc+FG7RPx
	rGCq3vbmZp6UN9srDYgG4GbPDsHJMD6KacgpqGNT/yGDN982R1kpex6PF83Aw3nh+5RWQNFVsKq
	Tus/F8NMyd+SiZ1YrqOxtzG5JuUTZ1bUW3w3FwVrg9M5vCzH9+GwACa3t9/tEuKioHHr1xSeXy6
	h+kXTP1zAjrXTpTpnQK9GbUj6MIs/MPXmVbLKYZ3VZXwejjTVGe9GONyVC/DDAqGRmcyjkQovhW
	D4MS0r9gn8ETviZLXuU2KRRKv+2EnErfPAXl68bMt/l5+C1FiLrXB
X-Received: by 2002:ac8:5dd4:0:b0:4c9:65c0:7e46 with SMTP id d75a77b69052e-4e6eacbbd09mr386007961cf.2.1760480338910;
        Tue, 14 Oct 2025 15:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoofHc3p3XoPw0ntgLmVxwJwo1t56LJFp9p6rCx/UWs550Z24zInc1mT131SYTrfrcnEeFLA==
X-Received: by 2002:ac8:5dd4:0:b0:4c9:65c0:7e46 with SMTP id d75a77b69052e-4e6eacbbd09mr386007491cf.2.1760480338443;
        Tue, 14 Oct 2025 15:18:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088212380sm5592069e87.58.2025.10.14.15.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:18:57 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:18:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
        will@kernel.org, saravanak@google.com, conor+dt@kernel.org,
        robh@kernel.org, mchehab@kernel.org, krzk+dt@kernel.org,
        abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Message-ID: <mwthowuei7pcqp2b4hg5c45n47iakclkioumc6diyznhnldfv5@wloeoys224bg>
References: <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
 <hOs24ZavnUyKYyNwBWwRpYnrsefzBfp95yuy9zyp1ByxR9_3VacGX1Yntt8pCE4w3gllPwvevs1AZqghmwKoFg==@protonmail.internalid>
 <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
 <fb767586-a376-48eb-97b4-bf33061642b9@kernel.org>
 <a4WDx80rJP1GnGNEK0OOD5lh-m-MiAvireXdpiM9ETLKZ084sBJ2UthU_QqRbU_nwD4XtsdiyEqQ0AhxguzJ6g==@protonmail.internalid>
 <6gx74wxie4wcabq27wo5y7v36uuurez4jxlzanroepqazdlgtw@sdtv2ld47d3q>
 <fa3c1732-328d-46a2-8514-2e7f9ca6c63f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa3c1732-328d-46a2-8514-2e7f9ca6c63f@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2BWakJBcI+ge
 7DHBZBj1+9YrEVYxYRd1JGS8CWI0O37c96OalJ+pdOhYjITPgPEQNPcyOoKc4Bt02bRwLOY7zwx
 btgFfTnqWcmbtfXPKGBzOiVT51euhmCoF5gvkNRN+dCAKAAVsxt9wC0j4oZMZMWq/ILN8H1vpWx
 joeTwjx3mxwD6xWGJBVeoclLFj3JtRlFjDcfwjTYwikOBv0K0P1jiwx61syd7K4EgAOelRA7vTF
 /9kAYlwh1S2ZtX8N7IHCfEHwMz1MYQzm/4u1UJjbEs4ORkJW3xyZAGLjitHki+Wf1//IYte7V4A
 BKVQKjSImiD9zn60ViN9ljhpME1XLm/SIiSsVBtWA==
X-Proofpoint-GUID: 1QW2HcAP7ZSTLjbN_pMTZEBPyv7wamiM
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68eecc54 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GN0BuYHDo_BzztcbwqwA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 1QW2HcAP7ZSTLjbN_pMTZEBPyv7wamiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 09:49:17PM +0100, Bryan O'Donoghue wrote:
> On 14/10/2025 19:35, Dmitry Baryshkov wrote:
> > > Each function id can be associated with a device and a compat string
> > > associated with it.
> > So, which part of the hardware is described by the -cb device? What does
> > it mean_here_?
> 
> The non-pixel path video encoder, the tz video encoder...
> 
> What's not clear about that ?

Where do you have pixel encoders in the fastrpc device node?

-- 
With best wishes
Dmitry

