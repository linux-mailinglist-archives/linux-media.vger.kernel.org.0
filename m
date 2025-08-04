Return-Path: <linux-media+bounces-38832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C50AB1A048
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 13:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A622A1889851
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 11:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C65253B47;
	Mon,  4 Aug 2025 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="earNJcF8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E32475CF
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754305688; cv=none; b=tdBVZ5FO4VsjaUBK8K22kALVsS1R51DfCLdWuqIhML6z9jAeYbdqyOyHBTF4YtwziOvIBEm7aMWmQXr6QqUjnkeYGJhKIyJ5mQFM912g5MMuFjUGHC1g1eG46U21RijYNP895FNgYZwoJ6e8mkkgic6ReeQDjy5GRta/Q6m2kPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754305688; c=relaxed/simple;
	bh=7qhyH/PU8NTXMb07r6bgr29blza+kLWRP/cKMCl7M4w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ln/SCzD012rtPfWwmZtMrniqXKPab1FpdPjmHILNdcCryFsR5HMpXu8VRbL7b7rANR+UA71eHmHPvHrf3fOBahXKK0KSRDVXNrHp+XLah3A3niDForgHI+JL+w2q+3Q1vbTLk1CtlCT7oE3imio87WbBLGwJoFJBSRzb8RVvSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=earNJcF8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748m6Em003942
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 11:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/quFVpXGaSR9+jFTg65KdPNzkiQfbcpVWaZyCBq0GDY=; b=earNJcF87v6maYZ+
	3Edr7gGXrDDQC/tXRPm7w/MLWf/UlPLNThSm/WS8FImrvWFo8hVgvlJKxermNpvk
	IUjnA/fbiFT4xPl1t3UeRHhgNHnAI5BoXjxWcstXu/0KULfA4eztREzvqL7F8FoR
	p5d2v6IcRk63oouvsICt0UhHjuRw2/da2tlCP3bAgvmcwyOMcqCBEwXw/1m4Olp/
	mXWdDBCr/+K1k81yBqcaI6L+2IqA4JR+aS2vQBsy3Qdju2S++Ql51gh4PwUY12Bb
	7XoUQsNdxA8y0GJyqOSZoiHPQeCeONirBNcR5JCvhOCTYKnz0Ei19T8GKTS3s2AO
	gxV4Tg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke2rym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 11:08:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab758aaaf3so125162351cf.2
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 04:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754305684; x=1754910484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/quFVpXGaSR9+jFTg65KdPNzkiQfbcpVWaZyCBq0GDY=;
        b=Q6lff731J8wwRyDUFYcgEPbl/BuY6qq5UTUquP06zY6ivdndCBGfaGN8Qx0cee/LXa
         7oGajdYnF4lFaXNhDMqTtKNAYWKOqRTwIsE2dmGccFVwpPg7X5s1Nt/aUfOiZ/eCzKsB
         +knKhnzPkXC+TTL2x5jmZPCTc3PgdNlDwvP+C3BzD1pM6Ky9S1BKM4SjZXDsHQbXkdrB
         vD1n+rDJa8P2Ep8Grpb31w3xf7pkyrNSvnCZkrdYO6WyW+sbFAqncSm6vTtGSvqmRCi7
         KyiOZlckwT4su1Rfpu1ZBYdWceMSwQgMwTV4USCmAzeAHnhcqtoFE1HQQfmeevdmhzhl
         upmw==
X-Forwarded-Encrypted: i=1; AJvYcCWnix/ejGB9B9Hf2GwIhuWslqhr600qWbtHO9qpmArA7E1uUqHylDME2GmEG+bDADGb7rNwgmKHMLen0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9w+llI3Gm9jmJN9zuSzfTJH4FDt6AeZEomFFENnjZN7Xm1irz
	4VWwrklF/sn4ppdI4MwhGxe/hM6VehbkAD9CuBMWnlHDgz2hVo3imlZjOUeJlUPCPfO8F2gStI0
	GHm+ZZpVUhu2T8/qXeGVGL7XXnib9K+mnfTceIso0IZ5dtIt7qW4dQ5GDUu7HCz3o4w==
X-Gm-Gg: ASbGncuDenkf5s1edw3670wP4zYFj3lfgHNSe2/LjJaylR+8z7DdZ1xp/TozLUJBCdd
	qmkxfOLenba0a3yF7cN5HnRgnyZZiZmtKAtgcOBHuae4uvjnd5hmMwUNOBftjYK1BxBCPCjW+OX
	cSH4hP+GMNXce1bMfLdq+jDgUiSRQ0LeZTHgzAHhI2ZrzoKTgZYP3F8kOPJPNw7pe3Zx9gOgPfk
	MfJzPxnC9YR0CSm0W8IoGWdK6x4RC2Fpy6X5xA42rkrMKhVb78ops/IFwHV/Oa3nGzA3WEV3in+
	Zdpz6wraQQToEGSZw7YL7xkKNQhPbHhmIhBH/dRi9iZlcH9Xz0Ur4xYD0I7X+WUGvhL3Ow==
X-Received: by 2002:ac8:7dc6:0:b0:4ab:1a4a:1cfc with SMTP id d75a77b69052e-4af109e1692mr120452181cf.22.1754305684137;
        Mon, 04 Aug 2025 04:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGbFNrQOAHiSqeoYZPfVBZx5TLgseXs8R9ww0pxzX0zAUXdnmmDqsXaerx5Ls2XGk0BTwzwQ==
X-Received: by 2002:ac8:7dc6:0:b0:4ab:1a4a:1cfc with SMTP id d75a77b69052e-4af109e1692mr120451671cf.22.1754305683506;
        Mon, 04 Aug 2025 04:08:03 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459ded356b9sm11743785e9.12.2025.08.04.04.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 04:08:02 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 4 Aug 2025 13:08:01 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aJCUke55NXN7nN53@trex>
References: <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org>
 <aHiZpnFhhR5O0h97@trex>
 <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org>
 <aHjbjw8Z79Xcd/ZJ@trex>
 <aHksJum91s4ZmI56@trex>
 <5afbaf46-bbb1-47d8-84aa-29b18987564f@kernel.org>
 <18d013e5-352e-457b-ba96-3dd19f1cbaed@oss.qualcomm.com>
 <56d4e911-5bec-458e-acd1-3594a6d8b91d@kernel.org>
 <1402a52f-639c-4872-a153-b549603c13a7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1402a52f-639c-4872-a153-b549603c13a7@linaro.org>
X-Proofpoint-ORIG-GUID: JnlrKFezcZphEFPOF5WYaYsfnfQUq1bC
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=68909495 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=CUqL58EqNT68S6E0SegA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2MCBTYWx0ZWRfX0i8FfNCWZNBd
 9ma+kRCAyGx18LXyLwtjGTYn4ukrNZqx31/cQWGL0ASgBM8JE54Ya23yEpA3Fb3h+GE4UToSR8l
 5/21IzB8H3kiSZYkJSn1xIAKLo4z5GSduqsUq2eMB8Qi+GfQ9OiHvsdfLK1JeyOrg3aucaaHgLT
 WrtWLpvT5yTu2mTbNX6RXxmVgKxX1Bei2RBgOFdycDT1AL0x/X6cZf3b+yaxITxkcECL1VGso8L
 dnhctBNwrEqzuuw6kTeWtRhjEiLiEMMnndMS+fshZeLyN5zSrQ75p0+Ccoy/icjzWGpbqgzK9R4
 lH5nHosMJm2mRUxUQ1xWyL/LX1ZRKQzDb6s8zMV/gS9ITzPxfcUpd/102X9un7d17IJvFXEbZSG
 lF+30Ri9I+OjOxvUbglidCrtlHOqclrrvd8DeLIj1lD0i2ytKqQt4fWzTTPGodFhGxM7JJrw
X-Proofpoint-GUID: JnlrKFezcZphEFPOF5WYaYsfnfQUq1bC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=761 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040060

On 18/07/25 11:21:07, Bryan O'Donoghue wrote:
> On 18/07/2025 11:04, Krzysztof Kozlowski wrote:
> > On 18/07/2025 12:02, Konrad Dybcio wrote:
> > > On 7/18/25 8:27 AM, Krzysztof Kozlowski wrote:
> > > > On 17/07/2025 19:00, Jorge Ramirez wrote:
> > > > > On 17/07/25 13:16:31, Jorge Ramirez wrote:
> 
> > > > > Not sure if I’ve shared this before, but following an internal
> > > > > discussion, I think it’s worth highlighting a functional dependency in
> > > > > the current kernel:
> > > > > 
> > > > >   - the driver only works if the first two IOMMUs in the list — the
> > > > > non-secure ones — are placed at the beginning. Reordering them breaks
> > > > > functionality, which introduces unexpected fragility.
> > > > > 
> > > > > Regardless, this seems like a valid concern to me — a driver shouldn't
> > > > > rely on the order of phandles — and I just wanted to make sure you're
> > > > > aware of it before I post a v8 (likely sometime next week or the
> > > > > following, as I’ll be taking a short break soon).
> > > > 
> > > > 
> > > > Hm? Order of lists is strictly defined. That's actually an overlook that
> > > > we never do it for iommus, but the core rule stays.
> > > 
> > > (FWIW "items:" is an ordered list, "enum:" is unordered)
> > 
> > enum is not a list, but enumeration, meaning one item of multiple values.
> > 
> > Best regards,
> > Krzysztof
> 
> As Krzysztof says the ordering is strict.
> 
> I think the right-thing-to-do is to document in the commit log the
> dependency.
> 
> The final three entries are secure entries and the ordering is important.

sure, will do that

> 
> ---
> bod

