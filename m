Return-Path: <linux-media+bounces-44385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944ABD8934
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 72F044FC54A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E3D2ED14B;
	Tue, 14 Oct 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUj+0nu5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A6825291B
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435509; cv=none; b=RBAfbS34gTmB/OTIlBpO2HTO4ZDOneANbYYdTEQeKzu/nlXG9l8Ez+BGTQf5SyMT1+KoKttSXpTFAeJqVdYQhDyGxXnRIy5szYDoR3/sas5nmuCiVC9YdkExX+vhYvyBv+oj5sfiSHal8bd2Sd1xrfz7KkZEy7X+aE3bLzdD3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435509; c=relaxed/simple;
	bh=HXt64+1Xvlydjl9pTmLXP6gz0dV1TLaywfmvV1SO+gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb2QKiIpuxIkGikwaaV94DSqDKChCxYJ0FRanlzhrhzFi1saHW2TNvfQ/w+VsJhplrDkOFEolQ3asP+SuZbuUvrCulwnMEe2AbuksafAJmgLSrqrtARAGAxLZqlHHPMKBrmL9Z2o1wvGgjumO/LZskgJQYwwBJ6g17LXqM7PI0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUj+0nu5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Nme021106
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 09:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PBxL3RtdJsu1S+FhleqKP4xR
	3hS6Z1oUg8unkEVuIQY=; b=EUj+0nu5lCKxxt4hAqAT2RuYpEFLOIsi2tQeavSU
	uoKZfx4PVnqmTjcWgrTaX//TP92ZQbc8Nw9kJAMG2GomrysvU+CGiLXPwm5DE4pg
	7QrivPWpL6oQmrCLxH+wAzVNhuhfsa0BCwTXQyxS5HknlYymVLTzCs4MuITA4Jvm
	+G7XAsRie+FZp1VyvFSNUHxdKC9cZMt2fPUr4pteQIcnhSAIKK9A9U+X11IK2cy9
	qNJaPvAlwjOLJb4jdtfOYk7eC4W7lr+M6KbRkL8degOzoN4w2t3pF2AvwthoYKpX
	NqAqhgYWjQxlvwcMhxKkX131cgKH1rPL+cbJtpn56EKIhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwj9cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 09:51:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-870d82c566fso2391809385a.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 02:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435506; x=1761040306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBxL3RtdJsu1S+FhleqKP4xR3hS6Z1oUg8unkEVuIQY=;
        b=r+hICxcvPQS65AviAEpUr6frlWSQi2HjjD9oVb7cTOjgEm7Cde3TGIw+/gQO5/Ybup
         yefzEd2vLThYCo2yodmoMljinat9sC51Q4QwXAoefQWelY9VGRV1jBYneIy/9UQa43Ok
         Rve7mUsnZlErCJMX8HIDa25xj0ZboeZcm6KP/vjeJbUsm9TEjPFVNFhB7zkCt7BKIhCG
         uqLaW5wvWprde2gqxOMkHFqBtYHMGaNFXKtquLQlRiW0csV6rHCrM8FqnbfAD5wZwf7M
         KigXOZS5WOu2SDeEXI3TlciZ7C8nRXdKFv4YTKvv8m4CfWGVwmnPCU8kd4MhgVDIhtOD
         1RNw==
X-Forwarded-Encrypted: i=1; AJvYcCXHarFGFIMKkhD1yGNfT+876JPb0T3m+/gnGOiNJTw4umxQx9jSfofqorah27FTecZdDSjeJi8aySouEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY9DxpKcyLTdFy+/lJsMI+x11EbMLvepdmbOWfBrRU39nXwuYM
	DtTMMCJso0GuzplgGCyKE49YK16+xKwGGW89Cro74GQIbDeEWnTgkkHDKGyd5ONM5N1Db0WRaVr
	KbbTUMknqm8amV0F8/7dsq+xKmNXME1BEhkC5cpEK2FmzFVindKCGTFxDogsEdRIWPQ==
X-Gm-Gg: ASbGnctbD+IuhXfsFCs6z2UuWE4juxP7+GVx83yFvPLr15Bxiosgm1aPnh81gdzhg8m
	nBjVyf4g9N7KM8r57TJyJZ110G230oqufIJndkBsceLUB3aO4iZ6hKfL8zbX4pEwGtt5j6AhT6v
	tBpP4jXhYYEUxAOsqVJBGDh1KgKLcBY64iVy2GtB1CQ+YUl3EwyRNHB+l6D8hqybgNoXuAzVF6R
	67m+TK7mib4Locv376sZjpYwv1j8GIF3MzPalKKeKSCfuvbCp/VHKMo3kWjRstvxvfhSD7Je3X6
	WDv6z2B6D4WIV72fFzvAOa60xdrbOYfx6N5qbnKuMVlv+VhRNH1WPEFva1kpvK2NGSNAvMXdSJE
	hKs1TrS3kSCVQpNGFjztyWVvkEF3iHc4tY4MGiKC1g8Ru+bPIK17T
X-Received: by 2002:a05:620a:4548:b0:855:4f0f:d782 with SMTP id af79cd13be357-8820d18e2d3mr3743664885a.34.1760435506176;
        Tue, 14 Oct 2025 02:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxVvkud5xjmzY3lu09oqjenWjIPO+wBq4K6gyqhY2hcAj1kfJyz99dhsusENH986ON+4ZCmg==
X-Received: by 2002:a05:620a:4548:b0:855:4f0f:d782 with SMTP id af79cd13be357-8820d18e2d3mr3743662385a.34.1760435505707;
        Tue, 14 Oct 2025 02:51:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e577asm5106216e87.11.2025.10.14.02.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 02:51:45 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:51:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] media: iris: move common register definitions to the
 header
Message-ID: <t5obao7tm34uilnzoa24shknvdtzqkc5uwek4cxwbof3tgqylb@jehfugyxvups>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
 <b7eba4b5-1189-7506-4767-0ef3234fc6f2@oss.qualcomm.com>
 <dzorzudzpjipvlkwik3uylomwi2dy5ticxromzegzgi2jhibot@reqv5ul5ifuc>
 <3802fe42-0c94-8c10-7b6c-6c3adf863ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3802fe42-0c94-8c10-7b6c-6c3adf863ef9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX/cEpI8uqCzp+
 WXUkH+XvX1I6LiV9ZYoGqsRbq60eAd+9fx3FRLIDoPSq1n08D6LoMDhVB0ABc2Hkx7W++XzZ8CT
 I3kp9Ix/P1ADAjB/K23JglwommdDCQw3zHyGWB7REAtPStp1OIJJNmoLcAbd/6iuN+ibrLLb2Rl
 JG5DSsBSTticVQIgXXA+it7Kko0lHhRYh4hcV7C6bIpRhc0MajxOGs0UoKkaGGe+C1fKDIa+FCn
 4EufPgbSkQRAnaRdvNtiKOJ8hCWCA5jw4+Zb30Py14hh0psul3wia29aC0dUMbRYuigQASBXevE
 GeRUr7wiQeBIu064eS7NKiQa//Li7u+Pk/qa+3ihfPtdKfJ5ATi5CuZn6jaj91P2sq93xul9wqI
 J5m7fzTuAJt0PnqDh0/Jp/Er17ynVA==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ee1d33 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aQDpXfm0Yy41Go8ML2QA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MoZ99xPxo0KvaZtLcAfnyj39ktnwXPmR
X-Proofpoint-ORIG-GUID: MoZ99xPxo0KvaZtLcAfnyj39ktnwXPmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Tue, Oct 14, 2025 at 02:43:56PM +0530, Vikash Garodia wrote:
> 
> On 10/9/2025 8:18 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 11:40:25AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
> >>> Simplify adding new platforms by moving common registers definitions
> >>> from VPU 3.x and "common" file to the header with other register
> >>> defines.
> >>>
> >>
> >> Similar to
> >> https://lore.kernel.org/all/20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com/
> >> ?
> > 
> > Yes, but moving more registers. I can rebase on top of that series if it
> > lands first. Or I can just pick that patch into the series, to remove
> > the dependency. What would be yours / Bryan's preference?
> > 
> 
> My vote would be to rebase this one on top of earlier one.

Ack, I will rebase. Seeing that none of the patches in that series are
in R-B state, I will probably pick up just that patch into this series.
I hope it's fine with everybody.

-- 
With best wishes
Dmitry

