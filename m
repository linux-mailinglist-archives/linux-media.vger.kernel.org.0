Return-Path: <linux-media+bounces-39188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF62B1F3B2
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 11:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778FD18C1D5D
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 09:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB09427FB37;
	Sat,  9 Aug 2025 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7GwdrZY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB1246BA7
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754731367; cv=none; b=jWJWQH+A0/lsJoF86UBu2gXj7UvN/+QqiR0uLjsQoeSuRsjJ2yvZ2Ly+gBLZNMC2/LnG+Ka+dJJSyHwIJ0/2mnE9QrdxRUiaRLaxVCIXzrUUlCB12HM7E31QEmZlhxP7rMRAGe64+k2RgKDGwfYOphTr69kLS7I577oMh2RPjRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754731367; c=relaxed/simple;
	bh=+iR4Qzm8VhTag2wLp4ZZpYzp+johAi7TUwlgAo6HlSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7xPUicQHTJjmHZUcnZfWN2MOkObZefd+4PhCH37rDE4VFnsQLHf/0w7G5GlC5415lKp2Au28coj7Qe+tn1v3PJkm0AhgHxXT/zTMsDEh2BX2ZeFSDYaLjdrflVWRm7HiaH/CtNh4Z70eh9wFzDn5otsL9TFPTeWV21T7OcVwDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7GwdrZY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794ftt3013556
	for <linux-media@vger.kernel.org>; Sat, 9 Aug 2025 09:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VC8WdL3EkgZlibNeh7o/Uwc2e3yv5Oc/8tZ6sMo7sM=; b=V7GwdrZYlbnqlf+n
	TH71bhCrgXbQ8Lc48XWiJMUcbNvJrttzEW0wTKTgBuIfztGFlwpmQLcYzfOg6BsU
	68B0l+oDTsmCM908ZYPDo/AWvB+khWOakSYgs8vqGjkvGSUNrB/+tDrcJ/TG/Ima
	acltIivn2xwSxHBvMHWoz+kZyX4j5vroI7y0dTCc0l7aV+sV0ECr9Z7ti6yISHq+
	zz3qwnCfFOKjXmL3h5lzC7byq+Y9CSK1FfrwQoRO2s0FnETkSo9yjKOMGXZy7yxg
	YZzR+B4LQeC87Twi9dWjfG9oseZX6ryOajmnkna5YxN7SlbZM/So0WGDZoJBFzI5
	+ZGSqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm8ava-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 09:22:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b096d8fc3bso65591091cf.2
        for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 02:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754731363; x=1755336163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VC8WdL3EkgZlibNeh7o/Uwc2e3yv5Oc/8tZ6sMo7sM=;
        b=NBGIxyAxE1tjmjDD46iVBB58n9sDREWIyRTvgYDRXeUxnCrbg1f2jzyCbAib3geUR4
         E1WWLueNkFmIFUcnvsiB16g3tuvzGusIcPwsScdgP4cw58Dcr5n5HJIp3yEFs+tapJjk
         s99pzplTG2byLYQGJsEcrU8sroTlSrNc7oP8fOZu78VXoHM+seLggrUOdF7Ln/AgaDjp
         +ePqVMVfcH1FNKUKZQkg72ffiA7ARgFcPmpN9NyEDxo0I3d1G2xslt24vdQCBjUfyuu5
         Zo8OR+dKlDuBrnrewIpmQf66XIJFG6PxdmhI7Q/gGiKMf85VD73loZtkX3SZDCJJDkfi
         Q+vg==
X-Forwarded-Encrypted: i=1; AJvYcCWZUSFuqFE+v0ZGB3W4j+mYGnLxAVMqzyMrxrPLVG98dDRm1rrlnEJhcRGKR4v/OoahtpWlZcZgBi4yZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmVERFN2yaxnbRrx9SLa1NU5Wwh2J9ebRwvZF60mMmXyO5/E/J
	gAXNgxhbHfHYXyX9tbxpNT+YqTYxMFQ98MKS5JOvYQ9fWrlDG7LRUcjQaHDkhG2m/qb+3IOZlW3
	42LCoEyTK0u4birxhUv0weZxY0U9mhXl1OnUyxArGF+JN1YagnPRv4kUV2cTiWdyzNw==
X-Gm-Gg: ASbGncuVcTeXdVSEQUd1gAD83O+NBtLGXgYvzvbbTFim8cYx9PsemfyapkcdW1F3Cm5
	CXhG21ZYcFitZw9HBeggeXKoZzKzVdxbInts8/GBtV6XX9WO7ZL9P2rUn9Oi94owo3t321xYKK+
	S446PAk9B5kwE4uPzQZnCCDcSrZr4uW9jO0g7TRxYZOJTwZ1nhWk7onZeIXoNM6ERyUOFUca56X
	R7VkkBapl+yK5NLzYaDCOCg3A3SfmmwJz8lZ5FYlIQmR1f0GwIc9WTbkul4LfIlR+kfCuuyRZId
	pLYAG27mc4BIiOpi/dS0i2nUDAYs0esjUWwPHhoaMr0avoRYzPhN4N1FCMkeYOfV13nzf4Mz/E5
	Y668GZfGB6LT9L7q11hD6Tau7XawT+apNSOVYwwyVP9NUxCNcw53d
X-Received: by 2002:ac8:5aca:0:b0:4af:1cd4:d782 with SMTP id d75a77b69052e-4b0af5a59c9mr87113751cf.45.1754731363479;
        Sat, 09 Aug 2025 02:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaC20jNNico3lwPaOTB4qbI0l9miz/bw/eaCTEEwyrLmYlgVspYoLZ4RN+B8k8cZIgV9fS+g==
X-Received: by 2002:ac8:5aca:0:b0:4af:1cd4:d782 with SMTP id d75a77b69052e-4b0af5a59c9mr87113491cf.45.1754731362987;
        Sat, 09 Aug 2025 02:22:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9881dsm3300159e87.99.2025.08.09.02.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:22:40 -0700 (PDT)
Date: Sat, 9 Aug 2025 12:22:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <oi7juewvfcgvjm6tedcq246rzyqvx4eambqo36w6byynmbl7sm@i2nztugnzxo5>
References: <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
 <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
 <aJSvjqfQw3kNrVVH@trex>
 <447caa6d-13d2-2e75-5f33-6df9b2fd6d69@quicinc.com>
 <2yj3er5j72yoa2ltboopx5gvquur7jl3viqnq5qsci2fxjf4ix@7t63vgizfknb>
 <aJcQRLDplbNetNKN@trex>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJcQRLDplbNetNKN@trex>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXxRB0Xut/2ZzE
 L/R9H+68CsCh0GjztTjU3oeB1Z9JkSAwvkHOT9gq/V6eMod64dWw+UHpEEEl6gqxQTFEudCFIuo
 SF0KGI51raZus3oAWfil2Wm+HNc8wKPrfgf/wUOijE21fPQiA4l6/GrYSmukFDeyDmAMZHdUvcc
 NeKk0Zw/pTzA/r0e88u+zpzomlsxMHkUlankFz5sSC+PLMC81eGydE2HlBhS1toliXT0M0qfw+r
 Sw8Ow0rYsrK62d25qk36X7xsprZ7p3ffd0i8htXXKIYlnHgDpF9HrrMIHTIcWU2v3Tk5ekxZlIo
 BKu3JlkWcKiTB0HE1WxC2UJruhhpgd41d1XJiTYWX/qCaM+v2RsejkVmkrfnRTUd/SNpKZ6/hq1
 QAXuIdjH
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=68971365 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=OgxN5lonxENXMM4B3VMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Ky7fBeAJo4s1ID0g66N2Phn2vrWlUvqP
X-Proofpoint-ORIG-GUID: Ky7fBeAJo4s1ID0g66N2Phn2vrWlUvqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Sat, Aug 09, 2025 at 11:09:24AM +0200, Jorge Ramirez wrote:
> On 09/08/25 11:18:21, Dmitry Baryshkov wrote:
> > On Thu, Aug 07, 2025 at 10:05:10PM +0530, Vikash Garodia wrote:
> > > 
> > > 
> > > On 8/7/2025 7:22 PM, Jorge Ramirez wrote:
> > > > On 07/08/25 16:36:41, Vikash Garodia wrote:
> > > >>
> > > >>> It was agreed that this complexity was not necessary and that we should
> > > >>> just drop <6.0.55 firmware support (which would in any case only include
> > > >>> video decode).
> > > >>>
> > > >>> And so on v8, I removed the above.
> > > >>>
> > > >>> Now I have v9 ready to post it, but Dmitry is asking why cant we have
> > > >>> the v7 functionality so I am waiting for direction.
> > > >>
> > > >> the issue is in firmware for both encoder and decoder. Didn't like the idea of
> > > >> driver carrying the hack for a firmware issue. Just because, for encoder, we are
> > > >> unable to hack it in driver, we are ok to have it enabled in a newer version of
> > > >> the firmware, we can follow the same for decoders as well.
> > > > 
> > > > if that is the only reason please do explain what do you mean by hack.
> > > 
> > > I meant that the EOS handling was not needed in driver after fixing it in
> > > firmware, isn't it ? Was trying to avoid carrying this in driver.
> > > 
> > > I tend to agree with the comment made by Dmitry in another thread to have decode
> > > enabled with existing firmware, no option but to support the *already* published
> > > bins.
> > > 
> > > Having said that, these limitation of having a separate EOS dummy buffer is well
> > > sorted out in gen2 HFI which have an explicit DRAIN cmd for it. Hope this
> > > motivates you to migrate to iris soon for AR50LITE variants :)
> > 
> > Migrating to Iris won't bring gen2 HFI. Think about users which have
> > OEM-fused hardware. For them it's not possible to switch firmware from
> > gen1 to gen2. Thus, if the SoC has been released using gen1 HFI, we
> > should think twice before upgrading it to gen2.
> >
> 
> As I understand it now after the thread, any driver developer working on
> new features should not be constrained by users with OEM-fused hardware.
> 
> Since only the OEM can provide signed firmware updates, it is their
> responsibility—not ours—to figure out how to deliver those updates if
> they want their users to benefit from new features (or new fixes).

The OEMs might go bankrupt, might stop supporting hardware, might not be
bound by EU laws, etc. If the platform was shipped with gen1 HFI and we
suddently provide gen2 HFI, the driver must support both firmware
interfaces for that platform.

> The EU Cyber Resilience Act supports this view by placing the update
> obligation on manufacturers (at least that is what I understand it, let
> me know if you understand it differently)
> 
> Breaking backward compatibility is something we must avoid of
> course. However, guaranteeing compatibility between old firmwares
> (whether signed or not) and _new_ features is a separate matter...

Anyway, the kernel is provided separately from the firmware. If we
supported a particular firmware set, we can not break that.

AR50_LITE is a corner case, as we have been shipping the firmware, but
there was no corresponding open-source driver for that platform.

-- 
With best wishes
Dmitry

