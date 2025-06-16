Return-Path: <linux-media+bounces-34993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546DADB775
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3486D1726D6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89FB28851B;
	Mon, 16 Jun 2025 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkMqISkQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D6287513
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750093148; cv=none; b=PwKoUXQysqkfIwI+vEzvS28y7vzCqGE+KaWgc0/gWNX//oDPu05Fc5OjGmna76k3dhtRFOr/yaWewjCuzNR3wJYX+xYLvkbQek0TEB+ADQM75FRgvc77l5+bpOS9vog5ZGoLVRSsspWHV6CO46hmwdhy25tZio/7jfo8PQCEy2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750093148; c=relaxed/simple;
	bh=MIOBf3dEjXwXgUhVNb7gUlmJhcwXvYUtCQF6Yhi/5k0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZnyOcEew5L5NCMjqOtSQwrgd77hhzFJF5OyAKdFH3ngg8By1ZP5p1qmGoqsGLmgso6FrNSevwEvIYdaz9QvIr4C4ZRonRgamrb/dg4f+10PHChKa8bC8kuoR2c3O8uwmVBmR7uwF7ccXzoI72k1G7SjK6kuv6D39y4QxK/1aO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkMqISkQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GGoW9Q011453
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 16:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FJdkMaQ1ReNpm3CpJp7RD0NH
	vTLNJiLODdXF3EvzYqk=; b=bkMqISkQHPs6Qy2/EoBlx/hNdGSps472kLNnzYL2
	Jbrhzvk0jefTxbNq/R1CFeUMXeqIJwAdn/Kpo/wqTOtjvW7tW1jIJDH/RpvFe1gt
	GkUNBT6mMUEksFy07eN8vzrl1PxJ3+3/Hynr9U1jRpl3blv45/Cqyp5f4253IsIq
	Tqd1vZ6lBilYRSe6yMI7If/Aw2Bbyra4Z91nQm/UP7/PdSXNjl3HiY1HUtYS/9Ee
	hDvfe9916LeIIH4EGA6/eno/ytTnh2s0zEHBSkUqt+MAOiU0HmD4mLjzmkAaHyaU
	vft6OhHvNZyD9BeWNIMw64IHdvTmZXeGnd7gHjTz39W2oQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5kwhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 16:59:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb520a74c8so27239766d6.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 09:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750093144; x=1750697944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJdkMaQ1ReNpm3CpJp7RD0NHvTLNJiLODdXF3EvzYqk=;
        b=eeYYvj4/SDNXZBic9qdblHSVsA8Mi/vOZu3dxmvUIPOQuRfh8LUqQ1GkgM23a6oDJ9
         dkh8yr5mhv20m62rypPZbYkrR+b68d5FjjZwYl27i8olWQo10ErcGw0AZ6uhXi4a5LQ4
         NefIQ9yfy7YOgYiqLZrrNQstXlw+T9vYePNxuc22LoFGP4LKJNYoLDLwbEfYR0uZ/lcv
         Ajg8eZSQsB7SDlWaUzKyx6vL1yrA5aHX6GPyhHelo0z9a4tlSvsP1U8BoYFFuHPFhrNG
         i7Dq4QUqUHNFomVjzdikg4lgzrCl3LYBPnyqP2RVmcrR8A20pTMEynPonCRjAU/g7iai
         3nfw==
X-Forwarded-Encrypted: i=1; AJvYcCWf59KHJZjHsqzfh+Li/MffCAxe6xv6qwWpmqucSwhkCt1aRU+rgpvfov4kfxD6KVg9lvTCHkOGRkiGZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPujmp3waqf8GGq5EpMiSoWXC/Bt54jA1XoTUb+Co/8xrjZLVV
	Mz2VHzhzaImYJUgztp3vph3P5pRJGiGRUgtMGrMCRsv1F8xEW8RarZONrkQX8JX/dhH92e3A6z/
	SWVO55Uv8L5xlNnwBuvlUyXMiFgxgRyv6npC0QvYb1ZlyHTTO79JAHOjAsqIw0feFUg==
X-Gm-Gg: ASbGncuHj7Bas2jj8Y8BQuWI4CUOjOCIYgLN0lf5RXAckpezZULkvHCyTD80pQ5gstu
	ci6cbV5LPMpeF1G+esLNbOwU/v0BlwaFb8Jc+zycQfG2EaXZl8p4Oe0GGIM0PXs4DhJuKGv1qPK
	0SMBvkbIriM4DPjsya3m408yal1/8ca/YEUrrsFcOcEOO135NZjincggaS+tyBSv8C2Qhgcrmee
	4/4ymBgjrd0j4upDYFlgqNpiq8lBfk+K7aWULKrxsi7gokp9lSPVsovEqgvEl7lhs4MVpOBqgZ3
	kn4HzKTG4c8mG7JS1uKXBZv7P4UjWFyZ2iekSiMZMPBgeL3lzVZi7TaJYA==
X-Received: by 2002:a05:6214:27c5:b0:6fa:c6c0:47da with SMTP id 6a1803df08f44-6fb477a727bmr178575986d6.42.1750093144378;
        Mon, 16 Jun 2025 09:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8U5C8QhpEC4KdiGlgGaaVVFIxxyTSoWxHWPCgyJSirN8Hl1LiLepE8Okozp2BZa+B3WqlBg==
X-Received: by 2002:a05:6214:27c5:b0:6fa:c6c0:47da with SMTP id 6a1803df08f44-6fb477a727bmr178575296d6.42.1750093143917;
        Mon, 16 Jun 2025 09:59:03 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2324c6sm147831535e9.12.2025.06.16.09.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:59:03 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 18:59:02 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFBNVjl4n7I+OkO5@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
 <aFATp3zoSgkrj3YX@trex>
 <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
 <aFBDzWLkKC9MWGoC@trex>
 <48e6cc62-ffb0-4ca7-80c8-9e510db505db@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48e6cc62-ffb0-4ca7-80c8-9e510db505db@kernel.org>
X-Proofpoint-GUID: b_9mHyv5-YcIY9JQO0IUJqGgxecA14zu
X-Proofpoint-ORIG-GUID: b_9mHyv5-YcIY9JQO0IUJqGgxecA14zu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDExMSBTYWx0ZWRfXwCf3McvJRj4/
 Ls+g1/zFIXZtPQ9gRJ6g8VbYBIez9glTfj2ckoDAxaUBtwFCp8XSmjBEBXpfbuHxE9drc+6eo5h
 VHIf/rAg1h56DEgQQ3+jZubd2YQ+YAvJCHPtcvqkVN2nYerSxwfUczL/tesloiTvzQGXKPCBhOF
 owQdx2rZPd262ljeTW5jiQ+D1rH7qmNmR4BiE8WdBr0geYVLIdPYFvpR2F+IK5uSV8/d3eqObQl
 i7raROdAH1XHqeckZ21WBqGpsb1sps0BcrHqXQfmrcaJLHy0yT8IUIw1Kkwn5IeLqyp2J1bYpa0
 jLG0aQHRzor2JAuAKh3U1HyDTIIyGTzFvG8Nft9iHL6oE779rcWyttteJT/G0213SmuPlS11jjb
 QgK1YC4WYjse/3LB7q7Voyah/FyVrDIpdIUNegBajSBKkockBBudUT6ruT59q+sfzo3becoj
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68504d59 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=3XfI71V93UcfWaPxk40A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160111

On 16/06/25 18:23:18, Krzysztof Kozlowski wrote:
> On 16/06/2025 18:18, Jorge Ramirez wrote:
> > On 16/06/25 16:41:44, Krzysztof Kozlowski wrote:
> >> On 16/06/2025 14:52, Jorge Ramirez wrote:
> >>>>
> >>>>> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> >>>>> +  on Qualcomm platforms
> >>>>> +
> >>>>> +allOf:
> >>>>> +  - $ref: qcom,venus-common.yaml#
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: qcom,qcm2290-venus
> >>>>> +
> >>>>> +  power-domains:
> >>>>> +    minItems: 2
> >>>>> +    maxItems: 3
> >>>>> +
> >>>>> +  power-domain-names:
> >>>>> +    minItems: 2
> >>>>
> >>>> Why is this flexible? Either you have two or three. Not mixed.
> >>>
> >>> please check 5b380f242f360256c96e96adabeb7ce9ec784306
> >>
> >> This does not explain why this is optional HERE. You cannot use for a
> >> new platform an argument that some existing platform was changed in
> >> ABI-preserving way.
> > 
> > thanks for quick the follow up.
> > 
> > but bear with me please because I dont follow - why can the same logic
> > be used - it being applicable - and therefore result in a definition
> > similar to those other platforms?
> 
> Because this platform either has 2 or 3, not both. Unless that's not
> true, but then please share some arguments.

as with every other venus schema with more than 1 power domain, the
argument is the same one that I have shared with you a couple of
messages back (DVFS).

verbatim:
    Venus needs to vote for the performance state of a power domain (cx)
    to be able to support DVFS. This 'cx' power domain is controlled by
    rpm and is a common power domain (scalable) not specific to
    venus alone. This is optional in the sense that, leaving this power
    domain out does not really impact the functionality but just makes
    the platform a little less power efficient.

Seeing all these venus schemas follow the same pattern, it seems to me
that this is the correct way of implementing the above.

You seem to disagree. please could you explain?

> 
> Best regards,
> Krzysztof

