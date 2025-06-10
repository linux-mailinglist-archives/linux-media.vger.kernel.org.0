Return-Path: <linux-media+bounces-34484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D1AD45D1
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 00:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B58113A2BD0
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 22:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FCA28B7FD;
	Tue, 10 Jun 2025 22:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX7VdYmo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C2028AAF8
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 22:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594102; cv=none; b=Ca3BhpknKsnv9FIZ9YEy27KF77q8cNy5IAdoDO0+wEcvv5KaFaY+JTgKAGnivyOPMeCYn8BxM4CjFCwE1VdHAC1jgopa1tuzb7ILTEucjGX7BLX7ovdF3YhfX7ABUAurTNrqKYfEPT3t0GyYdBnO8TRurSiQYlpkZ6pjS09D5KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594102; c=relaxed/simple;
	bh=YvdzXJMQSdK/2qt8MvMMQWgunI4DcAdj3g+QL5Ek9oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGPcMshy7EgbLz/v+IiBtCW7ibdZak6XYT+xpsHbvU4IpRX3/KqPibpTNe2KLttgNQ7V7Z7dBJIxt09U0dhl70JXKreoTvdmkiBPXBiq29nzdavFFWCkPld3Zl58BEMs2qDAACDANznepJdG6hcl4+yI1SRVKiprFZUy+5po0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XX7VdYmo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQ1Zj022371
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 22:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RV1FvH/Z3KH4jd5rDx93/TSY
	2YFYDygQCaUG4Knudc8=; b=XX7VdYmoYX7cozWQtTQRknuFrZXvGvvFWi5qAfAp
	PR0tOwPUR0Aiv3ZrloGKJSaAmqhsVlQ/gWGXSkz2GiflXyeUFyJkvC0RmUdQ0wLP
	WzmVAltHcHQWxvbLgsvQGZA4KP/OigVcHmyVJdZMmi6omMoVmvmd/jEWP54u/bCU
	9k+gYYcAXxaD0UHWPKREq/zpDdq4tNUut3qFoVv5xGHq1jtYK5Ivr5ymJJo/iJwu
	znaNIc+PELGU2h0Ic8lsc8GfmTJ+6GxNt5kjyXw80UV7DRTQA/31w4NuJ5Hhu20m
	dvi87IXMXncUA1AGc+TjuWTDeYG8vWu+7vxE5JrPPAtF2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekptnc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 22:21:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a6f89098cfso68534231cf.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 15:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594099; x=1750198899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RV1FvH/Z3KH4jd5rDx93/TSY2YFYDygQCaUG4Knudc8=;
        b=nkpvIQqawO8h4qNgJ2g++rVEc//ISs3kCoyTJHchnPEmnQwaLMcuzmWXwwJAzMfIPV
         lOPhvSly4OAP3nx/s5iuWQNQgoU664DSU2bfCDFCWw6YMX58vYrylDkxibf5aoZJWOS+
         PnZMgsf+AfJMcPz2WYnfgYKpoV6JERpIbxFl24zy6anRF/10IhR3NI8mPuTv1PuCyXDp
         mawJnNG8erNRlUmL2QKnM0SdCiOBLbui7UmryCmJBWZnaJOjMwfx8HZa6eC9JNI/Ss9z
         DdfflkmPpspCxa9FT+kGKoHKub+0t/45f60QiVPLGiIXg8LyAxTs18Dijm4eHTGGZn5I
         m9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWASV/Co7T+PCwjQwYyesUxCYuvE9kA4hCAJ911JnBeUdRd4zc1H7LZHA+GTpKlnNtUr05lkKWFYbnCwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhejeWKIdBieUM4nXyE83Fg5gYdM7kAosOTO24aOMusrjhNu8+
	FU/ZCqrNcvP8uzZZc7FehXKpvj2WJLm4wBVK++6i68NQDrGoOF7qR7qGRG43ZaIND9wfbuqSx5e
	MgpagfdHsBXsbZIvVRob2wUGnjBu7RTvocKHMg3fIOgtpO1PTXYO6X+6siBeIcdVZoQ==
X-Gm-Gg: ASbGncuO2w+XN7Egn2K52E1yI+Tzl7zOH//4yRiWCf7dcQ6aHA/vykkElgMYt6e30hp
	zm3+q+qMUggCT3Dnqba9lOP2bEzjSKOI2s2nR6Iesb+42AsIIJ1A8cz7lxBvxjeKjYGHS3b4aK7
	jsGuRH/ZTUwY1c244EzGXilp5lTg/McWg38+bLIqe1phGoAuWV32FC4eFctRmkEs2tX5//afiL1
	2Wqq4QW506fap8xR7znwxEYTLSb55xsS4EXoYKQqG9LTKADLeTeDZH5+0y8eo9SYCbab/MIHwWS
	GefVWXUDQNVWWAXKIjeqUwACuoZpQPtdLdndGU208oq9kjm8toYCyWwHN0Wx8iMyQYsJreDm/OT
	kwy5XOTOh9D57uRSU84fpmjWLY4+ROcf1ieU=
X-Received: by 2002:a05:620a:170c:b0:7d2:1199:ac89 with SMTP id af79cd13be357-7d3a883f33dmr208488985a.36.1749594098715;
        Tue, 10 Jun 2025 15:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHRRQuijtNJMUaKmxwgA6z/qlHR9MTcJ875zwNfzdSYx+nk7dE/YEFyR8j7QpjOr1/vQvrRg==
X-Received: by 2002:a05:620a:170c:b0:7d2:1199:ac89 with SMTP id af79cd13be357-7d3a883f33dmr208484785a.36.1749594098350;
        Tue, 10 Jun 2025 15:21:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d01dc9sm16225641fa.108.2025.06.10.15.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:21:37 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:21:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Message-ID: <35muvo7h7ynfvzjt6jomasr54xaomfgt5etjc3uuczhfxww2ds@u5xsayanthx7>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
 <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
 <ae364f1c-5d64-4178-b26c-e58e352feee0@linaro.org>
 <97e51ab0-737b-496e-81df-b73c9f598bb0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97e51ab0-737b-496e-81df-b73c9f598bb0@linaro.org>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6848aff4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=yfBDPXAuP_RVhw_2PxYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NCBTYWx0ZWRfX9N95v4AY7R9v
 +duyYK9pcdzEWGCo7N56seW/2noPWpEtKuG7lTU2Kn+B7MlRc8lG8Al65Lq1ordatWKE8iwcf2l
 9R4Z3NLZKS9C450ZSWj137rlVo0+gVJWZ75SPCHUzyRe1Y+eEWZCvtNX6QzC2axEWiM5Qz4M0PK
 6ZoAsYaG+eBpG5aQ9+bvW0YzYq168TgTy7lVnzzivIFm3RWZfzUMIn4ZA9Ma9atXz4K5SB333AR
 7HwJlwU0HCn8BEH7uZOeDJ8xCM9Fb30ymJri7Doo2SwIvFVUmkx//batfL26iOkmVB7v76FynRf
 4fqPHlxBO2cd5G6YKxbCK7ea3g4i/v0UvNox8eR7aALDDDDTP07FtR3fAKzZF6eX4dVkhRYCY8W
 CNV3e1/j9gubJv2HinqUJfEJjSfpvYy7Hc53cJINsig7rY5AxG2bNdemZYnC6SutDpdHKxH0
X-Proofpoint-GUID: EjNdTwzggbtVyQmeG6oK79gRcv401gfQ
X-Proofpoint-ORIG-GUID: EjNdTwzggbtVyQmeG6oK79gRcv401gfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100184

On Tue, Jun 10, 2025 at 06:10:33PM +0300, Vladimir Zapolskiy wrote:
> On 6/10/25 18:02, Bryan O'Donoghue wrote:
> > On 10/06/2025 13:45, Vladimir Zapolskiy wrote:
> > > > 
> > > > How is this a Fixes: ?
> > > 
> > > I call it the fix to the dt-bindings documentation, then what is this
> > > change, if it's not a fix?..
> > > 
> > > Anyway, if there is a strong disagreement about if it's a fix or not,
> > > the Fixes tag can be dropped from the change, since it's so secondary.
> > 
> > Since we don't have a committed upstream user I don't think this is an
> > ABI break.
> 
> Well, Dmitry says it's an ABI break... It would be beneficial to come to
> a common understanding here.
> 
> > But I also don't think it warrants a Fixes: tag either, there's no bug.
> 
> There is no bug, but there are Documentation/ changes with Fixes tags,
> it's okay.

Fixes means that there was a bug / issue that needs to be fixed. For
example, if there was a user for the bindings and the user had these
values in a different order, then changing schema to follow established
order would have been a fix.

> 
> I will resend the changes with whatever updates requested by both of you,
> if they do not contradict to each other.
> 
> --
> Best wishes,
> Vladimir

-- 
With best wishes
Dmitry

