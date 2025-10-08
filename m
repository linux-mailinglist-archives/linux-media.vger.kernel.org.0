Return-Path: <linux-media+bounces-43885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BDDBC32F1
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 05:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B3DAA4E23BB
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 03:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BB529BDB3;
	Wed,  8 Oct 2025 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRwVrHcQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF83514A60C
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 03:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759893036; cv=none; b=rBsJaxHogV02OSqLr4O/NEPTghhCZLzpeBcPg6lm/T0AKty8rldq6PVivflcICrwEac0tuzA89pklTjNc/0W3GmqQYvBt3fpPdKtvbmV3HbVlCQEkmkmnfxaRNWzrkaxe7z2yVq8cUKTsxmJSQlI4e+ed4MZbRN7iHTl4m8XMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759893036; c=relaxed/simple;
	bh=4muclmf33MtS4AlBZoz9CBH4AceFnb0g5E7CAF2N1pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQcM02u4VEtCsk/dMPjlA27CUXTAqywa+FJCc91l+apwQn5Ldewgu6DN/8BJhvYZEo+ZHk5RGXFrfnXDRF+FK/PDqwSR4fRPCquI7gvEuWl4nSr2PQ2A7U/SFKcjE85EFdA0s1SpnKtYxCWKzjgvVhoyQTMDjh/THbRA50EMUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRwVrHcQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803jF4018027
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 03:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SxZkK95rgRFP3g+7Ig7r6UsX
	822mKcsNGhZKQ3qi6e8=; b=nRwVrHcQBXpNFQ+PsUKYKnmMAqXuZ3C2/ry9LUzw
	/AeTdvjfrJmzwqOJAJe4rgGbUSs77MN6ScxxVYMGRT/6EnHO3Bjtm9ETYMaPSPxm
	tO5eWQswI78U+C7UxEPetmzaRcA6n99wqVZ01Xp3Y8WQyZjuvf7MVRJFkXsJUQ2f
	2bvPs22/LffFgHOMsIzQnN441Jh2NdVFDvDX7HsFOlITvm6ifw5gRhqLOMZvaJ3T
	z5xfTRWSuf0KtlpNvzJ6TRTWPXyTr6mSpq8DZJQB4Y0JCI6QASvSTVhpGVDX9Kmv
	Ff/VUvY+rU6xuHoeV8hHMaxaUTZbqdUUGS1rlPacx5H44A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpv1ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 03:10:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df60ea7a1bso149836721cf.2
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 20:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759893033; x=1760497833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxZkK95rgRFP3g+7Ig7r6UsX822mKcsNGhZKQ3qi6e8=;
        b=oLcmPnEjH3bJU7hKG+6k3kg9BvZx4Xz16hfep4u662lFxejVPIizNSYpXblvd2Uxpp
         um8G+QBKM99uP0yBv0uPDxgYYH6XJohypxSpfSBY3ZHb9XkSo8wDHtReLTViB+08S21o
         y6S/9BEF57oCorVKdqpcHm+0J5OB3LoQQvvuvAkhMH5Zw1Nuy33L+Tda1SHWnTcL2311
         /G3BlJv9WUClc7CaN4uFrGx8v8vkx5/OpYbPTbhWaoN3kwn2v8ta4iQx/4hL9SqHrEss
         pOqqNiqivS7n5xeEvT9ic3Ra68ofnwLfJtyCpbpnyclrzfBGTPMoHu9j9dlPmdC7uzsf
         Qmzg==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZqvLY8MKyOSHREJxJ2hG4jHm7vfW38T1tn1Mjnu8mpXdDnX9mUVO3pThSEHqwewASr6nePMiIsQ0dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2xYE+jlXRrFO1vA9+d4blDK9tiQSi26u2MYih4YE7Z4WL91cI
	NL+70OJu41dz0WHP69Gz8zdq2VUKGSZaqy809WmMbAHBjyGUy34gWXzLD56Ny4tZeFdKqr/5Mpo
	ZKT03IXOqMURZmO/sUXxi1o6xA93gQKAmM4/2bVaU4EqMtcrGt9qvt+OO9J1hk5gYMA==
X-Gm-Gg: ASbGncvpgUaSj8AdfCOWqO6+Uu0vDfiJzHETMvgNEV8K/R8xglHGF13vFG9fCx6Mlg7
	P0M39C6LJ7cDmqtCO9FHm1B8GtYapkG0p5YvuztGqx7olQHqYdxbkyaO+LEn1YNyCSqysOnKSFC
	xBRDq8MmeQ3As4rsdo0hwo7s63RZt793ihDIWLtlaLZg4CMm0Pg7qK4M6sLtRHdz+QPwI+UINKv
	PU2jpGQT6THHkh8Kc5SOGpVx+0I8UIabfLD40qrMh1V4GfkgYEadjGZkhlg7I1KcN9x9R53dR+T
	qp4LYKTJ08wThJH14zo8YdnsCOuR929ySF7CRo3hdVp9Keyygh0CTBaaEn9SMdvLY4I8v3qxRPy
	HWgwFhuXpU8Xq1GW3oLiA47HD8yNS4Y8RLYzTJRhpWvva4GO77NFsXzKVBA==
X-Received: by 2002:ac8:5ac1:0:b0:4d7:c9d3:cbb6 with SMTP id d75a77b69052e-4e6ead68fc6mr26101561cf.72.1759893032748;
        Tue, 07 Oct 2025 20:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoj4ng7GGzfA5zDBkMVpla3LmGHmJGSgDhU4QBNzBdW/FBB0hKuhqLbF+jp007cLnscPlm6Q==
X-Received: by 2002:ac8:5ac1:0:b0:4d7:c9d3:cbb6 with SMTP id d75a77b69052e-4e6ead68fc6mr26101421cf.72.1759893032299;
        Tue, 07 Oct 2025 20:10:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011aa617sm6736116e87.117.2025.10.07.20.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:10:29 -0700 (PDT)
Date: Wed, 8 Oct 2025 06:10:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Message-ID: <aocpjjk5zpdjdo33l3orq65r2q4t7v3lwbyl7rgkhzjceiseem@bfdk3t5dgwea>
References: <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
 <Ujyoj3HGLVFhS2b0XzcYAMjSiCAuO-lSJ8PMEQLOaaX83tk_0D5zjrL0VDyZAmD3i4zLB3ElKSZBltISb5jJHA==@protonmail.internalid>
 <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
 <SuwJuCIcLVJwN3YeN1il6tB9wO9OH6bYcnbRpxpuI9Dl7piYLN-hVdnyv0Mal6N-W5pi2aCZI8MxHZDEkoE63A==@protonmail.internalid>
 <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
 <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
 <I1DbPl0-zSS8tu3k8v0O-6DQdXnwza-Y3Os6GXsSDbOOhVbi3-F8jfL4q7QdkYo2zLv_s8Hy9v1PI3SiGCuDdQ==@protonmail.internalid>
 <CAO9ioeXqx4MoHNDiM4Pbp_evxEAACP0HhJ+8Fgqhhq60sCThdg@mail.gmail.com>
 <1481129e-3803-498b-bfe5-003c194f629c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481129e-3803-498b-bfe5-003c194f629c@kernel.org>
X-Proofpoint-GUID: JPL7oRg9EAEGaUCxP1vWpjPJxhn78sph
X-Proofpoint-ORIG-GUID: JPL7oRg9EAEGaUCxP1vWpjPJxhn78sph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX1fI05ICRq++h
 8GO0hYpaWbTpLr6zDxu+fJp00i5Ld1ElL+YE4tm9tHlNksymtukg7/a3FP17E3zbd8JfZv8m7C7
 QtvHmZFa7SHLRUyUpBvUch56BQmrie9vuookLA8qIWxMlHxc0xVzlbd3pOFon4pLa9wABGVfO+I
 XxzvNsRh16FmojTYEGtuV4XqiQMJHxoIjTB5a46yfhqB2squfkUikycgXftzd74ZcBOQ1tZxWef
 aVcgjyas0kqWWhr251GxL6Z7OyH2/D/X0e5/l7Ik6XmZ/tJSuDARo3XygPD+j0M0apKB0jZeMyt
 YpjozGBqCfz0Hv7s6+L6239vAkdra3UUkJHcJps8aKW5o9utjxZiHoNAeZTgfaeKhRdH7Ktw9YX
 kbzWE1i1HAEhtcOrRE8482w2x0FlBw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e5d62a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=84m7EtGkg5WlqkPtwCwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On Tue, Oct 07, 2025 at 11:10:28PM +0100, Bryan O'Donoghue wrote:
> On 07/10/2025 20:40, Dmitry Baryshkov wrote:
> > > Surely we could do
> > > 
> > >       #iommu-cells = <4>;
> > Because #iommu-cells is a part of the apps_smmu: device rather than a
> > part ofthe iris/venus/GPU/display/etc.
> 
> What's to stop us extending the definition for qcom platforms ?
> 
> Rather than jumping through hoops in drivers, we can just encode the data in
> the DT.

The IOMMU driver or a ARM SMMU device itself has nothing to do with the
way individual devices use it. As such, I don't think we should be
extending #iommu-cells in the SMMU device.

-- 
With best wishes
Dmitry

