Return-Path: <linux-media+bounces-39186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92CB1F339
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 10:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABA1B626C07
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 08:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B43B27E1B1;
	Sat,  9 Aug 2025 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKqp4e5K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C43223DF5
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754727508; cv=none; b=qMVlJS0RhHC4UbmkKjZAGDHTmIUXswfV4aaCb40hVrNghz0s84A/bm5UB9F2+Uvh65fec/BOn3EXKImrGJqz0pFYWFHK/1sCOl+azfa+gzFFGpKb6qV0IFd/U0u5wQHZfFB4nYSk6mN4JkSN53lkhBnVOfeOcdXA7v8kPxmKDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754727508; c=relaxed/simple;
	bh=shwEQ8cryFUWL0UFeuLAJhf/97dqnkWgW2nUhwyC+ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzUGNvNNSCz6eetIUvPhPbXk/6Nm9GEa4onDQT88PObUsYDCHeEydD/hKEV5Ao1xcSdWdTKMcqtMkDzdY0pI5DaYTMUsPA9geMKP1ceNe2T4F8IFXR9YQG7j2whwoc40VrAq3I5IIgHV2PxRBi6p+OYonxu5HYloLOJ8YLF+VCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKqp4e5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794CRYn030314
	for <linux-media@vger.kernel.org>; Sat, 9 Aug 2025 08:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ny0ExIjmg6qzhNtxQ2+NGDBI
	d6ex3O2Y+9L9qqEXCZA=; b=lKqp4e5KibukTe+TfdXl1Jn8kHMjawSUZYlTwpQT
	sna12QTbLZYCVB+/dGFgjcZP6JJRbF1VIghOCW9SAsqgPfBzux0zeSU8A8wOyTcs
	zWwE5PTIA/ljxpmtWmEIZF5iefyj0vAmNzV/Evgk17RafpMGpRz8bKd5t+n4XCEe
	KAvjbKITY7uIgiEQdl6DpoeUH/gCtz0TvcSL6IaHs6/k4OxcOe+Lit4rlp4qNC9n
	bgm5Li/Jv9nv02R8QvZEkH1TnIY7N0UV7z1fieDbdXJO4DoiMfhFAActGGjg7HXY
	uIhM1SeZ1TdY9i+Z6rkxkGZJ/6r9N3Ec0W7slSZAlfnSVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g095k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 08:18:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af2237e4beso70375671cf.0
        for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 01:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754727505; x=1755332305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny0ExIjmg6qzhNtxQ2+NGDBId6ex3O2Y+9L9qqEXCZA=;
        b=IRHw2tWQdvoA2tVubohHIsdovzUdWgLaZ/XocHjL26kWAIGXeBqifyjfdXOxUZC0E1
         Wt3Fdbjs6rO1Tl0h+jT6Qhqv5MDQ7l952H1kmZxrVo+Ym8xDvpBhcTzQfjBYKwePyK0z
         lHbTeau1cofvpYeChNshyMX4LVqGE5PkG5gShY77RI4n+Oh9lH2377XO1KOsDfaTudfw
         wwlSzXrr0jZcD6oAvmWT3v+A5aDgTasWJGOgUzwpd/Bi4In8jnjBQ4FfsW+VQ0xRQXTh
         5KzPeFNDKaKl5xlgEkvj1Z/53U7EdHuAxXLYEgaDwsYEsvUQzDtR5R/zGTszMZFSL6mi
         fZcw==
X-Forwarded-Encrypted: i=1; AJvYcCVSeR1O7wzuZu0ryBk3D3c8tU319M5srsn37Nhz+TQRmLOmvYlGC+owQzzlW+oHnxaXsDsAuOAVlb5aZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfZtN83GX3W4LyK5qTOri1Kjs2SB6p9d0yOT4UC6cY3Q9QECIq
	xd4HsDNHpIo4jxlYXrd9OQZHw1eT3FhVvLzh6+T1K22f/M5BFiFAvghmskGw/WmoGHUDma9o/YA
	7aiAVDCqCTSuiTwHjK5WyiYU6UB85yQSQCuLl2QHE/hEYUdk2wl1HGDNMYzP6f3LPWg==
X-Gm-Gg: ASbGncvilF2OFqOlUEWdejVuKXMcSfKJ8HE6hsg7m6mg7OW50SeA9yCxFQW5uJzfd0f
	DEuIBELS6K/ErSmQXn5uN+B6Kc1q9FTkMwa4nBJ0ZjFrYNdyVph26aWFfJEFy0E/gctogYz7I5g
	lzs4HyOjmOXdvVumxqmnkTFabqDbcZ9JXm0TAmQvQ29UYjRaWjJpkBfGyog18Gv6Gp1X2Dag6B2
	tGRC8vY3wP6IbZOjQOJQuUdAtHsOgUZ/h8OcD5EcUQfJpqMQWX19cBYkhu6qI3RK12c5jqO04T8
	JuncnCnHOR2aId/9HOKVl7uZbnqs5DToVpqA82B7eukF1j+TfH5RxY2922O+ZYt8Guj5BDYirxH
	6tSRhjO4PLpMkW58Z8Np3GLSI5RyTEmaLhx6pmk65tk1xxEc2NDVd
X-Received: by 2002:a05:622a:251:b0:4ab:958a:6003 with SMTP id d75a77b69052e-4b0a086e388mr127655271cf.27.1754727505206;
        Sat, 09 Aug 2025 01:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSNNSwL+bCDNYNcUfGi9ivlMMSKYd4DhhWVIoEL/gBQIOysZIci5grnnKj6yg9ZFWbXw3i2A==
X-Received: by 2002:a05:622a:251:b0:4ab:958a:6003 with SMTP id d75a77b69052e-4b0a086e388mr127655041cf.27.1754727504698;
        Sat, 09 Aug 2025 01:18:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ac575sm3298027e87.69.2025.08.09.01.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:18:23 -0700 (PDT)
Date: Sat, 9 Aug 2025 11:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <2yj3er5j72yoa2ltboopx5gvquur7jl3viqnq5qsci2fxjf4ix@7t63vgizfknb>
References: <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
 <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
 <aJSvjqfQw3kNrVVH@trex>
 <447caa6d-13d2-2e75-5f33-6df9b2fd6d69@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <447caa6d-13d2-2e75-5f33-6df9b2fd6d69@quicinc.com>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=68970452 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1p08hUWWfcFRm61_9koA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX2BYE8f/qVsjr
 p4wctyojNcwxAECQu0BzDTCBFYGp0HDtvAFoDyxCB+lyevHSQ9Y7qalJMLAcrRpQCX8l52ZQOh/
 I6KgcNZ0MOB3xopkzb54GuJPHPe19cJ3+PIFtdf1CeNBWO4ZDNTIFFrLRaKKP9cxyxNU2fNGXTZ
 +WTlUag23SsFY0eduWPSdyGMRAWjwEW3VS7Xn4twbj1jlbhRLiDMpk1TwbqG6jIU9hOAe9AqkTf
 ZTL73rTra25lSQ7eS0SJXMRyAFl6gvFYACrib2qP3bbF5wkg6IazZGt7xLi0R9YNW8LVQBoibo7
 IBFR+ESfrra778JBZgLXX30I4V95uOaaoHYc9N30TqFFSjjASbx5yE91FHX0e/mRQMEiGTXinKE
 flBGa76W
X-Proofpoint-GUID: njIJk7t3rJctweU_XoG9sVNTxDugAkSP
X-Proofpoint-ORIG-GUID: njIJk7t3rJctweU_XoG9sVNTxDugAkSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On Thu, Aug 07, 2025 at 10:05:10PM +0530, Vikash Garodia wrote:
> 
> 
> On 8/7/2025 7:22 PM, Jorge Ramirez wrote:
> > On 07/08/25 16:36:41, Vikash Garodia wrote:
> >>
> >>> It was agreed that this complexity was not necessary and that we should
> >>> just drop <6.0.55 firmware support (which would in any case only include
> >>> video decode).
> >>>
> >>> And so on v8, I removed the above.
> >>>
> >>> Now I have v9 ready to post it, but Dmitry is asking why cant we have
> >>> the v7 functionality so I am waiting for direction.
> >>
> >> the issue is in firmware for both encoder and decoder. Didn't like the idea of
> >> driver carrying the hack for a firmware issue. Just because, for encoder, we are
> >> unable to hack it in driver, we are ok to have it enabled in a newer version of
> >> the firmware, we can follow the same for decoders as well.
> > 
> > if that is the only reason please do explain what do you mean by hack.
> 
> I meant that the EOS handling was not needed in driver after fixing it in
> firmware, isn't it ? Was trying to avoid carrying this in driver.
> 
> I tend to agree with the comment made by Dmitry in another thread to have decode
> enabled with existing firmware, no option but to support the *already* published
> bins.
> 
> Having said that, these limitation of having a separate EOS dummy buffer is well
> sorted out in gen2 HFI which have an explicit DRAIN cmd for it. Hope this
> motivates you to migrate to iris soon for AR50LITE variants :)

Migrating to Iris won't bring gen2 HFI. Think about users which have
OEM-fused hardware. For them it's not possible to switch firmware from
gen1 to gen2. Thus, if the SoC has been released using gen1 HFI, we
should think twice before upgrading it to gen2.

-- 
With best wishes
Dmitry

