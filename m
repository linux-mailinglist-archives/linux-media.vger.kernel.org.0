Return-Path: <linux-media+bounces-39190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D9B1F467
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 13:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D7934E05D3
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 11:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B5927FB12;
	Sat,  9 Aug 2025 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShIujPF1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C551553AA
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754739836; cv=none; b=PbaKU7pKEM42Dm+xg8kI7ZKMAAm7y2FnP2comFALC5EpzNm4Ld5KINJfO/oC9Wkdf/9VDsry1qTkfHibu9aCWUn5x7SvvFrmV2xGi8+bzHI/18gf+jwFLg7Z6rFtU+ECpt8elE1XaAAw1DXdlWyGE7iZFZoIXQNqfzQeP3N7gx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754739836; c=relaxed/simple;
	bh=SwO5nELXRLBtJc5KwDzdoxO3kOP3CyZAe2nh9etB1hI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZkkJQtLmoN8nIm3ZCI7r9ZQS+K425AHI2eRpAXcB1T3VixYXK2AbrdGGxFeigVc7LtqGiK1RNlZeORk4QlPMnQJ62FbbNXu8fHLpLUalQXaTS3fVcPRbcUv023SvTxcc50qnrfIEVDwAAzCJGOLNglXAo28yAAAAu9LJhpUbaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShIujPF1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 579BfvMe012544
	for <linux-media@vger.kernel.org>; Sat, 9 Aug 2025 11:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dhq7QtFTNob/e68BFvCh2tCGaBjvEnXwpiBGxxMlG8A=; b=ShIujPF1qx23DOVC
	snJMx5DvsRwluCSvPpoXpdLOJGvKZL6pIwCEtcsO7J6QR5Khg9tqnL5oTAxsS5vJ
	WFxjBrXDL7mG9tYg+MvTwd7/Wunz3SA2qQrdTH6Fbn+DltMlwsJDMmoucgCs42Gs
	a+sboUBPdvz+PFVyJvaRY3jkaCm32lYI4CscIG+1U9jT6KUu++Yc97jb7/x8vTvC
	y9dfLJh3z/ZPOnsy8L8fsBBMMzHI634jOlo1qluY+QiQ70IIJc7WzBCYaQ65dOQ8
	l2cdWYxynsyRe+DmsTd+zKFFiDkjYylPMezfL1ihXq39ptyL7a5y52vTdoXH31QW
	S8jF4A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9gf8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 11:43:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b092c12825so82946341cf.1
        for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 04:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754739832; x=1755344632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhq7QtFTNob/e68BFvCh2tCGaBjvEnXwpiBGxxMlG8A=;
        b=n2jSRnMqOPk4ZPwqo9Sf6UrOhfOupPtn+VTcW7uqf/te3TjWb1juMk9XSItc2FqNR1
         K86AxWcPq4hUZI6HSZ5qfn5RvME7z+BgEydkgWTpY0U4Iyg/mlssLx4dJ7jThgFd9tKO
         xdZw+Wf1+KSy+r8TXz6ec5KGRPiDWUlkqZy+nvW7ls1YsuhFPt6fYeblMaf34lKZQUjG
         3gPUqCqP4HWe6Xm4k1LnpjhX914PaCh15gnWVD+bBSVkLwtCVpyOhxMF6g37633Rvh0R
         +3a+Ldo3cbLpcObLLkno+rySSGX3kucmJNxZWWupL2BN/TNIBNl+cqaxfreDHPW/owkn
         Dtcg==
X-Forwarded-Encrypted: i=1; AJvYcCXN896xRF4tiYEHhlQFelsS7uuQi1c3qtz0NTP+IwtNLU3y2AqPVNqrbLmhhe7QQ9VBvqmcIgDdF1+cng==@vger.kernel.org
X-Gm-Message-State: AOJu0YycynmmU1e+os4YP9s1Bu9r5eTHOnJWluDMuWVOs2fvdkIMl3CG
	akwyoBZJcuLVBERyGTPDDSYDUGZXuJT4dw8HbBQCtu6EElhDAKRWM6dLtzgE6KK0h+Ej2fzbYjG
	o8qco7Eew8UOsxIR6qxzJM5Ts+jdfV0/J9w+aG1FEtCwbjV0y/yDX/6y5zotYLYsEUw==
X-Gm-Gg: ASbGncvYEBKs7u6/e0ENmiVhTJ65ws71t40TqLInFhukaBl8DaUvkJEL4A+YMle1zSd
	oBA7Aga+theFL74sbmGPKD24KRH3D6IN3SGUGkN7gwh+Uy4GIov8Vvdt8If/tGP/+xtYxyUAMwF
	cA3pVAWteAmRd1BOVEvZBnjjhtzg7RRnpDGGftd6LXEJE18xhGt+Qocqa4GqY6EqVRq6BaVXmuB
	tOx3EaZsbfKwWowu3peRu7kIZSotwYvaGjm7+jowX8LTL55yy47rhJzia+U8bTG59KA4DOmnDLp
	/pylSMeSamPmkBSTRDuywAJUnu183qDWLIbRSJoo55LUL9f182Vfp0htzvSS825GImYoJg==
X-Received: by 2002:a05:622a:4a10:b0:4af:1a43:6a52 with SMTP id d75a77b69052e-4b0aec78545mr96034781cf.16.1754739832330;
        Sat, 09 Aug 2025 04:43:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzqs1ndblPPDaYRCzYH6G5/RMWdae2a1I3H1jVxQ9aCs494h/N6aUaTOA+9QAqxW5zPf/3sA==
X-Received: by 2002:a05:622a:4a10:b0:4af:1a43:6a52 with SMTP id d75a77b69052e-4b0aec78545mr96034361cf.16.1754739831696;
        Sat, 09 Aug 2025 04:43:51 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bc12csm34291769f8f.28.2025.08.09.04.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 04:43:50 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Sat, 9 Aug 2025 13:43:49 +0200
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJc0dRkNQLJvF4z1@trex>
References: <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
 <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
 <aJSvjqfQw3kNrVVH@trex>
 <447caa6d-13d2-2e75-5f33-6df9b2fd6d69@quicinc.com>
 <2yj3er5j72yoa2ltboopx5gvquur7jl3viqnq5qsci2fxjf4ix@7t63vgizfknb>
 <aJcQRLDplbNetNKN@trex>
 <oi7juewvfcgvjm6tedcq246rzyqvx4eambqo36w6byynmbl7sm@i2nztugnzxo5>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oi7juewvfcgvjm6tedcq246rzyqvx4eambqo36w6byynmbl7sm@i2nztugnzxo5>
X-Proofpoint-GUID: 1IhQBdamtoKMW8-6duWFRjpi82qsumUv
X-Proofpoint-ORIG-GUID: 1IhQBdamtoKMW8-6duWFRjpi82qsumUv
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=68973479 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=MGQ6gT6oETv9xCBFa_IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX5ZoCFL5yhx53
 7AO7f3/Kp0suXHFrVtzdEtIltVaLxBZu4Wm4dYtCJsv+HUYYOzQtMTi/2equKzo4oHUKhC6XyQD
 MOfmeuEUYnMiYFncASA14H5so9vWcjdxaeOydxyBLH/m3UM486Phj4hVbirQVRj1gKknWfyjtmu
 RzTWVOnYCumZstcEnhVe56luaUckAoZBDim53wzAP+jzg1f5zP3ZECzJSm7Ib0hHPuHb9EiyNAg
 b8AcFsSC54+wpgr+VZFHCqYSPjeeJt1Nb/2FZUQDn/nyJhN2ZYLzdlTAHWyfVDEsaH5KQyl5+Dj
 ZcF4D7KESBxQvOX/8cDFCudd1QgtOk7ndPKvp2/YYFwqcmf8U+rL9NKha4GV0mUhwGGjtRwCn6n
 9eJFSHuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On 09/08/25 12:22:39, Dmitry Baryshkov wrote:
> On Sat, Aug 09, 2025 at 11:09:24AM +0200, Jorge Ramirez wrote:
> > On 09/08/25 11:18:21, Dmitry Baryshkov wrote:
> > > On Thu, Aug 07, 2025 at 10:05:10PM +0530, Vikash Garodia wrote:
> > > > 
> > > > 
> > > > On 8/7/2025 7:22 PM, Jorge Ramirez wrote:
> > > > > On 07/08/25 16:36:41, Vikash Garodia wrote:
> > > > >>
> > > > >>> It was agreed that this complexity was not necessary and that we should
> > > > >>> just drop <6.0.55 firmware support (which would in any case only include
> > > > >>> video decode).
> > > > >>>
> > > > >>> And so on v8, I removed the above.
> > > > >>>
> > > > >>> Now I have v9 ready to post it, but Dmitry is asking why cant we have
> > > > >>> the v7 functionality so I am waiting for direction.
> > > > >>
> > > > >> the issue is in firmware for both encoder and decoder. Didn't like the idea of
> > > > >> driver carrying the hack for a firmware issue. Just because, for encoder, we are
> > > > >> unable to hack it in driver, we are ok to have it enabled in a newer version of
> > > > >> the firmware, we can follow the same for decoders as well.
> > > > > 
> > > > > if that is the only reason please do explain what do you mean by hack.
> > > > 
> > > > I meant that the EOS handling was not needed in driver after fixing it in
> > > > firmware, isn't it ? Was trying to avoid carrying this in driver.
> > > > 
> > > > I tend to agree with the comment made by Dmitry in another thread to have decode
> > > > enabled with existing firmware, no option but to support the *already* published
> > > > bins.
> > > > 
> > > > Having said that, these limitation of having a separate EOS dummy buffer is well
> > > > sorted out in gen2 HFI which have an explicit DRAIN cmd for it. Hope this
> > > > motivates you to migrate to iris soon for AR50LITE variants :)
> > > 
> > > Migrating to Iris won't bring gen2 HFI. Think about users which have
> > > OEM-fused hardware. For them it's not possible to switch firmware from
> > > gen1 to gen2. Thus, if the SoC has been released using gen1 HFI, we
> > > should think twice before upgrading it to gen2.
> > >
> > 
> > As I understand it now after the thread, any driver developer working on
> > new features should not be constrained by users with OEM-fused hardware.
> > 
> > Since only the OEM can provide signed firmware updates, it is their
> > responsibility—not ours—to figure out how to deliver those updates if
> > they want their users to benefit from new features (or new fixes).
> 
> The OEMs might go bankrupt, might stop supporting hardware, might not be
> bound by EU laws, etc. If the platform was shipped with gen1 HFI and we
> suddently provide gen2 HFI, the driver must support both firmware
> interfaces for that platform.

sure, that is backwards compatibility

> 
> > The EU Cyber Resilience Act supports this view by placing the update
> > obligation on manufacturers (at least that is what I understand it, let
> > me know if you understand it differently)
> > 
> > Breaking backward compatibility is something we must avoid of
> > course. However, guaranteeing compatibility between old firmwares
> > (whether signed or not) and _new_ features is a separate matter...
> 
> Anyway, the kernel is provided separately from the firmware. If we
> supported a particular firmware set, we can not break that.
> 
> AR50_LITE is a corner case, as we have been shipping the firmware, but
> there was no corresponding open-source driver for that platform.

right

> 
> -- 
> With best wishes
> Dmitry

