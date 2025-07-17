Return-Path: <linux-media+bounces-38032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F9B092D5
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 19:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CA507BC379
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 17:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BE42FE320;
	Thu, 17 Jul 2025 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZK6KhFC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D62FD89C
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752772142; cv=none; b=dNwTDlXDUx0PBVfCLcTNfCfKZiDUy8dum0+kVsznml3ha7rsJx2iulGQ/dLlatzMr1V6keodHdbc8H45VRxLjIKOuSizEcjH3m+2/Zh1I4sTUmvizVml5+A5tjMvfcg8RcqgMPDSTduuNu8y4L2/Q+9hA0lSToWXrhaE4YvWhUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752772142; c=relaxed/simple;
	bh=0Tma1iz8eUmqn+0ITGTty9g+3dbDSlSnl255hcwZ1/c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rt6h/hygUvMa4eNmDfpKexrvvQQz7IjnQCIZ7xkbv4m41Q/9U2uPAbJUMD3JNHM8TnTLBJnuRWi/wE9u1WKRS9mF7tXCCdbqXwB2T0sFHhbFjNZUa7nJNI/NWJ8oAHtITRr7gl9X4NWEXyzWOuQRTWQtjBfewoiB+ISyNi7ZaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZK6KhFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HD7Ht2022149
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 17:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFXP0IrFoohUtJ59zS1dRcGAPyOKdx8dfTa98AL4DN8=; b=AZK6KhFC9FwAJw8E
	FqSlM1NlBdkhoCn/eSNrIP4zRoPQRIGoC454mhCqjt/nleCAOy+CQayjp74kKSlw
	CqHxoaJxrGZwO6OVjR+3KDO/An4eePjOCosKCiQls5TJKued8UwSEa6PM+onNvs2
	1TVhTU6W7Vv9/bdF2/2+/MUMiO2EUji6kPZpeajmtBbzUM/ttdoalVwETTHTaEmt
	txXz2wQb5DCMiv3CYUi1JagqoKJNp9viErDalNE1iP2W+8cA7URLA+HMdZB7R9Rt
	zehIdEA0l6s3X2DsULfwrqHNEu+ww/wgKjMYfDw409SyRCFULku6rbSQzx09sCC1
	JhCkaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8gd85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 17:08:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab4211ca00so24407191cf.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 10:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752772137; x=1753376937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFXP0IrFoohUtJ59zS1dRcGAPyOKdx8dfTa98AL4DN8=;
        b=DNxNA5quhSzSKBpDVr/hJFm8zMl/xpbT/tsvoQ+XOPLTtngOMPfoniZ2/fbih7D+F4
         MdTv6YS4WLPGa6clnn/bwewDheC66h/EEDoF01MFHpbKPvMMJwN7Q36NH1irzOlAZ8hn
         bgRvFwedaTUswot76nHgNMTEWUw84/llT6bjnVVI4fXEEX0zVABNyg/OjQeDYXe/eMpi
         uZTKzvA8dPKU+zk7KHi5aNi0Fbx7zgQgMN4l3KxOIyPTZBY216OJydLOBx57VtMPRydR
         TDYt6DiRE8wnvEB10sHAsZOLuPWV9UM0xqG15zBbpQZEJC/pRN0I8d2C4NrbqXtsJ5p9
         NfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzzBUtyLUKg+nDZjzmFvt4Nx2pdPPbcLGFpR3dcN1h/UrmnnBqy0mLEoKswTyO3cTcetwepB4p4lik3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9knlzdKYKVNzk3YKin5RFOS5fsc5H+PN2fA9lYxCZK5q/aUmC
	oT4PAHeZPjptcgh2RWyVLJIQ6zQhwJXeCmnrVFSb+nUHQm4E1+1IMJhaQxp7cRx66fjlMnwQNrf
	K788ytuROrzRfysM2LBu3rRWZeD7V9Ou1BcRP7TYMe/uKYdKby5gpDU/U3E/5mQv3AEiX9INSzw
	==
X-Gm-Gg: ASbGncvUWgknWNYx5F9RS2bJ8ENnHydSFWOpw+xv++l6lJVm5dESsAjuDAjuoz3O7D7
	yRqbwv9xgvYPqGfM48U2qawb+0oCnUElDkUOOsIAJYRlfXVNTQ5tpYlnpVKCkgQUnrN3xSsfdkD
	3Up7oSJBbaBC/dd53TMFMAUQ6CcmSF8BU8zLhPMfK8AaXyqOWcl4TZbffLMNFlt1uOpFZpL930i
	UIoxVC46BKkcmZBEB1qRpXKFDj8ClvYsROjD8Pxo0g2y9OgZ9e+c0TFNOk8LheHNd9pO+k6ReWQ
	C0jhrFBM+9tG10Njz5HrXL5OqVVf2nPaEqFHb+T5UVhQhelrfoioQBf2A/a2MJjtBChQUgcG3NY
	=
X-Received: by 2002:ac8:5f0a:0:b0:4ab:5c2d:fb25 with SMTP id d75a77b69052e-4ab93c8bf96mr124297781cf.19.1752772137053;
        Thu, 17 Jul 2025 10:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEITysj2tJkRLvAb9+p0VY+EGEbopgJQYbTjJgWoH9NN/hppB3HlOgLIRM1vSCE6/5DgrGMIQ==
X-Received: by 2002:ac8:5f0a:0:b0:4ab:5c2d:fb25 with SMTP id d75a77b69052e-4ab93c8bf96mr124296971cf.19.1752772136330;
        Thu, 17 Jul 2025 10:08:56 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2025sm21560881f8f.31.2025.07.17.10.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 10:08:55 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 17 Jul 2025 19:08:54 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aHkuJmgeIUXvxOyr@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org>
 <aHiZpnFhhR5O0h97@trex>
 <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org>
 <aHjbjw8Z79Xcd/ZJ@trex>
 <aHksJum91s4ZmI56@trex>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHksJum91s4ZmI56@trex>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE1MSBTYWx0ZWRfX1FDr/xwTzmQG
 N8wNs/zDF1TuEg2taKiaC4B5vD8mYAqCQMJOetXtU8XwOfuEIRic3yKg0iPepncwMtgvqn9Z2kZ
 CGLrG+7gpvqQZQyHJTotpaTr1XfppsgRNZ93rOCRL4Jy813RU68rTtuZ6zS7Uo+4ytCD/+VQhel
 BJEqsOCP7UNzSIKVJjnQ9i6tLlwEF5jUWhI4VAOc2OctsqW5rLOD76urPw3SatKzxNROuBRjIuV
 DMu5hTf7OuxeqLjbMYkDXhUjBSiDeLPopXLJpFe2Epgsknk/DQ6evP4bIgb4up0KDPZ48Soj4jQ
 R9cQ47wzY9hxKeDAa208m4Of0O7SWvbK0lyOaxYyOnRiwam88Yw8PT6nKYaUs146f9b3+Z1tyWX
 +TCnli8Vd9AdN9SS2m1QXs2AELaqGjAog5qg74NZBJ6Es01Ao1lHdxWlREh14yYAaefH3Brr
X-Proofpoint-ORIG-GUID: D3JHpFKphkM6Ez3zhZjlTIcEta_tD7eI
X-Proofpoint-GUID: D3JHpFKphkM6Ez3zhZjlTIcEta_tD7eI
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68792e2a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=chJ0svP5d_1F8NzP0EgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170151

On 17/07/25 19:00:22, Jorge Ramirez wrote:
> On 17/07/25 13:16:31, Jorge Ramirez wrote:
> > On 17/07/25 08:45:17, Krzysztof Kozlowski wrote:
> > > On 17/07/2025 08:35, Jorge Ramirez wrote:
> > > > On 17/07/25 00:22:53, Bryan O'Donoghue wrote:
> > > >> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> > > >>> Add a schema for the venus video encoder/decoder on the qcm2290.
> > > >>>
> > > >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > >>> ---
> > > >>>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
> > > >>>   1 file changed, 127 insertions(+)
> > > >>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > >>>
> > > >>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > >>> new file mode 100644
> > > >>> index 000000000000..0371f8dd91a3
> > > >>> --- /dev/null
> > > >>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > >>> @@ -0,0 +1,127 @@
> > > >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > >>> +%YAML 1.2
> > > >>> +---
> > > >>> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > > >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >>> +
> > > >>> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > > >>> +
> > > >>> +maintainers:
> > > >>> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> > > >>
> > > >> Shouldn't you be on this list ? If you upstream a file I think you should
> > > >> list yourself as responsible for its glory or its mess.
> > > > 
> > > > happy to do it. The MAINTAINER's file covered all the files named
> > > 
> > > This should be the person(s) interested and caring about this hardware,
> > > which means:
> > > 1. Subsystem maintainers: no
> > > 2. Driver maintainers: usually yes
> > > 3. Author(s) of new hardware support: usually yes
> > 
> > perfect, will do 
> > 
> > > 
> > > > schemas/media/*venus* so my understanding was that I shouldn't.
> > > 
> > > I cannot comment why people decided to go one way or another in other
> > > code, but it as well could be just incorrect choice thinking only people
> > > in MAINTAINERS care about hardware.
> > > 
> > > ...
> > > 
> > > >>> +
> > > >>> +        memory-region = <&pil_video_mem>;
> > > >>> +        iommus = <&apps_smmu 0x860 0x0>,
> > > >>> +                 <&apps_smmu 0x880 0x0>,
> > > >>> +                 <&apps_smmu 0x861 0x04>,
> > > >>> +                 <&apps_smmu 0x863 0x0>,
> > > >>> +                 <&apps_smmu 0x804 0xe0>;
> > > >>
> > > >> You're listing five iommus.
> > > >>
> > > >> I understand there's some disagreement about whether or not to list all of
> > > >> the potential use-cases but, TBH I don't think those are good arguments.
> > > >>
> > > >> Unless there's some technical prohibition I can't think of listing all five
> > > >> maxItems:5 .. let's just do that.
> > > > 
> > > > since the device tree should describe hardware and not policy, and the
> > > > driver seems to be able to ignore the unused SIDs I think this is the
> > > > right thing to do.
> > > 
> > > 
> > > It was never about the driver but about whether you should describe in
> > > DTS for non-secure world the entries which are secure world. The answer
> > > in general is that you can and there will be benefits (e.g. sharing DTS
> > > with secure world implementations).
> > 
> > all right, sounds good then, thanks
> 
> Not sure if I’ve shared this before, but following an internal
> discussion, I think it’s worth highlighting a functional dependency in
> the current kernel:
> 
>  - the driver only works if the first two IOMMUs in the list — the
> non-secure ones — are placed at the beginning. Reordering them breaks
> functionality, which introduces unexpected fragility.

by "the driver only works" I mean the firmware will fail to load
otherwise (should have been clear about the failure mode).

> 
> Regardless, this seems like a valid concern to me — a driver shouldn't
> rely on the order of phandles — and I just wanted to make sure you're
> aware of it before I post a v8 (likely sometime next week or the
> following, as I’ll be taking a short break soon).
> 
> Do you consider this serious enough to be called out in the commit
> message, or is this kind of behavior accepted as-is - ie, do you know if
> the DT binding for iommus rely on the order?
> 

