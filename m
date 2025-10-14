Return-Path: <linux-media+bounces-44475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D07ECBDAF57
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 20:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE263B697B
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 18:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2492BEC27;
	Tue, 14 Oct 2025 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0mpjO1K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D782A2BD59C
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760466945; cv=none; b=ZA4VCzfqJ7mTWu4ISuoeIUEyfScuc/BAbidwoadLLkqA9+F7K0CQ3PdtGJcZS7lzwA5q91TpIbJqGxwLocxfooAFFy8TK1qz1jCKCRYCG5ecybkHEh4W2ySzGw0zxB03WCC0KdCmew0PX2JeKX+RzOwR8L8jlk+MG/rxUNjiS2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760466945; c=relaxed/simple;
	bh=88MwhoLBLl0h6gGQJ/l9piaAckp8mCR95svQBZRY0AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0MLesxXj20ws5KIMIJEvcdiEmSnvo9psa3wbt/FZwUG5mQaqxKGnocOfIGxecMIrGxJYL7dlFhC6T3ecT7TypHP7tCtRa5Bz4KyUWGPNwrPESQ/oBQvTfg9bqKtX9lOBELVkLJbnOtcqtkYnE/Q0KSNgbz2gJO3shw9qtqIcOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0mpjO1K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EG7fFw016377
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 18:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JgyeBCAKXfxEVl9M5RNSJ9fG
	fb4hvj/8SPvA2yhEbrU=; b=n0mpjO1KKHOTDOS4Yf8/cnKMs4fBvLpkCuZ56ZrV
	pnrP8HuX3pN0YpoyWTbK4EdcU3IVziN5RT41XeBY9FlEtA5Hdk+RnnnRJJOacPr8
	eUY9aZupFsvNphTb6P9PpLkysRcRj4oFI10/+EE/0zQ5eMhqH356NqeoRNr5ZA3S
	1gdoDKjNSQeMGfM0YsE/1bKAljIECX32IvWbjMl1W+3ecgCYsaIEXEjJ2GLnl3Y5
	cgynbeiiNYeKw7KqyQgAux79yzbD0zgfc4vHY+jx8elR3/s9WbdELeIUnVsNINka
	VjsQNDV+6IAAuVD3TjesPQnomw41/IeJ9auKisQl+zw9Dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd91r21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 18:35:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8635d47553dso2292209785a.0
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 11:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760466942; x=1761071742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgyeBCAKXfxEVl9M5RNSJ9fGfb4hvj/8SPvA2yhEbrU=;
        b=f/oOX61YqiN9SHveE21bGWw7qf+u9hVjBNI1xCaaLoFsWtlu6xeBYiFokHCpvftH6m
         HMs9t7uDx8sza0IIYsUXk/LKf7/C2p0AGV0v6k0Ne0uLOLaQayUVRmeIULOLak/ta+LU
         4aN4kR09IkefS+gDL4/eAfcPY/WOJCM/55owyMyNGlyz9lpppCi9D+Ux0Wq8LdHSaj9w
         Sog/jTdFYm2RiL9BY2/tP3R/VJALKPjOIbB7sLCFfHYlvAbr3qGJcgQrXh+8zs9ZAlx1
         2lr0ntQOeQc9UEA6XjBkTTLE2q0j1p/G/q4XxIUJ7wGphGBMLpqAc/7Ow8sR+Iw5Rf1l
         6Cag==
X-Forwarded-Encrypted: i=1; AJvYcCXhkCl8TUTPZCzlRNCTdIg840ZawP3Z0fIuBKrkISAxpLoUv+vUkRIuP/UoywYU6vHTdf5sbLik4XSHkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxLXiXojMO/oTKZFSNB6mwO6eSXcWiaeP368jQmsWOamzvPjA
	8aU0WaAAr1Kolt+E+1PA9KwaCbO0HDEUbSaaEl6Xwc6tgTIwLnCUBuz/JWLCOf+38cK1Gi7zSxh
	w2+nSnrTJ7R12ZHfd+Hcb5qdNcc7B+OYveL2fMZrqcjOXejQgUoasMSzkSGfhIWTNbg==
X-Gm-Gg: ASbGnct8WCOhvxGN/XWDdDZGJcmu3Tba6M3Utut1gXC02F+H1ufL9QBpevOEdaaq3Zs
	pkng4Jb9wWSmRA7PjlPWLy7j9oLURT51SbHneJ1X4C6KuMWH3Gnk0HNtAAzsmmsDD5FfpE2aBID
	wIDMg928P1mMs/u382CwRNPyQkf+yJHKSGWl8E82BqgdAymGXNEuXGtLuYXX+ooP6y02Q3GW1qS
	nsUYNchxfXwuf44ppjiHLftLLLQ5g+0NchsHEsNQo4irxbGGArq+XYzOVj2+l7qvik0S1WWIFjQ
	tJNLVfNPaM5bXi435DmSiK01TSd00HzyK/zwQXRTsJ7fJoarAjLL4OTiq8JODEkJYhhwrCvMzc9
	Gpfa/3b9WixeMZa3lO9feM9biSxJMA9aDc/5mjmqTBLjDZ51nRDa/
X-Received: by 2002:ac8:5754:0:b0:4b5:f369:8e30 with SMTP id d75a77b69052e-4e71bd45691mr167116381cf.71.1760466941747;
        Tue, 14 Oct 2025 11:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHofj8LwYDeK6yXRXtAUxitNSZSVVk6QKkZX8yZloH/rMjOd5sZzIPxOGDAxCmCCVgx9cAzbw==
X-Received: by 2002:ac8:5754:0:b0:4b5:f369:8e30 with SMTP id d75a77b69052e-4e71bd45691mr167116061cf.71.1760466941284;
        Tue, 14 Oct 2025 11:35:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e2csm5477278e87.14.2025.10.14.11.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 11:35:40 -0700 (PDT)
Date: Tue, 14 Oct 2025 21:35:38 +0300
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
Message-ID: <6gx74wxie4wcabq27wo5y7v36uuurez4jxlzanroepqazdlgtw@sdtv2ld47d3q>
References: <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
 <hOs24ZavnUyKYyNwBWwRpYnrsefzBfp95yuy9zyp1ByxR9_3VacGX1Yntt8pCE4w3gllPwvevs1AZqghmwKoFg==@protonmail.internalid>
 <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
 <fb767586-a376-48eb-97b4-bf33061642b9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb767586-a376-48eb-97b4-bf33061642b9@kernel.org>
X-Proofpoint-ORIG-GUID: rYW7hYL7aBbw7IE2DI_9FiEz_-9xomg-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1vV+o9vRmjzU
 Kd2pT2/pQAoKBHBc0m6sezipZVfGc1rxcdCtFhonzhFiom3DFxUTWyv/npwwIxrfzSR144p/EAN
 DXz73sCq3rGHten7hsTFl51pIaMHzbxlYukwjroeOoeyP5eDERO0Zbr1fdGYO+tiwVQl5n01+Lb
 X0/tLsrp6ZK2dOhwtqCzqZtSymPEe7BRlz2jVCLpi2NIlvgJ+jjy7sTG8KoYEKn/CaOLXI+znJN
 s+plajRqw1UjUZNkCvO1LdiHDXSUEUAoYXgE2UOp49LJz8G9NCCJdjyMVfn8EPqoU5WUSn0a0nq
 zj6WT6S49ocv3D9/0y910QDoAcXhvhtO3PJqDDd/UiD6ft0RRbfAimn+TM/VWqqVt2lVdVKj3Qa
 gN8zifXZ1hQUnEYUADVae9+rsaGGag==
X-Proofpoint-GUID: rYW7hYL7aBbw7IE2DI_9FiEz_-9xomg-
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee97ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=hQP1gfvqEBNhzPyMEHAA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
> On 13/10/2025 13:31, Dmitry Baryshkov wrote:
> > 
> > And from DT perspective compare:
> > 
> > 		fastrpc {
> > 			compatible = "qcom,fastrpc";
> > 			#address-cells = <1>;
> > 			#size-cells = <0>;
> > 
> > 			compute-cb@3 {
> > 				compatible = "qcom,fastrpc-compute-cb";
> > 				reg = <3>;
> > 				iommus = <&apps_smmu 0x1803 0x0>;
> > 			};
> > 
> > 			compute-cb@4 {
> > 				compatible = "qcom,fastrpc-compute-cb";
> > 				reg = <4>;
> > 				iommus = <&apps_smmu 0x1804 0x0>;
> > 			};
> > 
> > 			compute-cb@5 {
> > 				compatible = "qcom,fastrpc-compute-cb";
> > 				reg = <5>;
> > 				iommus = <&apps_smmu 0x1805 0x0>;
> > 			};
> > 		};
> 
> Sorry this is perfect.
> 
> Each function id can be associated with a device and a compat string
> associated with it.

So, which part of the hardware is described by the -cb device? What does
it mean _here_?

> There's no weirdness with iommu-map, you get a struct device for your SID
> and you associate the SID with the FUNCTION_ID you want.
> 
> In fact the FUNCTION_ID could conceivably be the reg. It could be stored in
> platform code.

-- 
With best wishes
Dmitry

