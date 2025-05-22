Return-Path: <linux-media+bounces-33208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A0AC14E6
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FBAFA2151F
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C622BE7B7;
	Thu, 22 May 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yl7DB/jz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAB6266B76
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747942706; cv=none; b=ZfP+xcujrQY5Ha6mh9PL33aN5iFvznxpqoo9Ov2jGPfLzR1UWM4V1J+H2yW1kfnaJB/RWZtpD8JOmqSskLYdDY5uJT3RCSktCMu706b0h7ymHDRqb9ymlGiWrzTM2yEBy4/BN6iuv/p+BNY1IdqK8ut/G59/p+q76spEyYQYBK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747942706; c=relaxed/simple;
	bh=q7mqLfjENNgNP706ckkvIptpsi1F/7KGa9dgbFNqNAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vta3V/8TqZLSlLKwZG/T+GRx7frskwjThzFpZYf+78MEPnV9/m3Zd+QDiAMf1OPHZCBlIHmLSudEa6f1PF0grDQ17qdU82OqI+EYp8zcNyFRgbhjfByG6n0Bn1eSGxM8cDjMykUG5fVGERvsb6nKdBvXxX3cGFpbM7H52aIquus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yl7DB/jz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGFA1G016644
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSVLbWs9WEhXD8F0quIy3d6Y384Oh4iaFb1o02G72Cc=; b=Yl7DB/jz0EzwSBp1
	LqD9BO8Gf8Oe41PkxdLkvnWz71ywYoNrRJByZVuwQCZpbI0SCe+QXfnte0oFdzCy
	LQ6Rv71FcJuZwHVsdCkcBCOwnM6JXUUWn2sInzckyHhlm7Cx5LB4ZiXhwBkDX+Bx
	30dEFEjYktbBvPTDDAQSD/RJLmgR6LMgb0pT5SbEj5H41jadXGLJPl7FwAxwSPKj
	dnV1tAoYU/R3iL9/bSzpLBQ9DuzkzgnzOT6ihjsklgxWs/xv6Vd12vygPyRu35Rn
	0kVz7H2QAUGTs/NQJ3e3G3Ra52P1czVLB5TI4WO1tBqWaGdchtxoT3NxYGMWl/o9
	6JF+9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yhuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:38:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso205804385a.0
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747942702; x=1748547502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSVLbWs9WEhXD8F0quIy3d6Y384Oh4iaFb1o02G72Cc=;
        b=fLEyGly8ugDuPtH97dKZlquI0/DPCqnC0xckzi3VxZgCtlgrnshnkE5MPK5f7nec3k
         CJj9QD72Xwno7NrpyrIQHtBmcku1DYU2TauiJOIcoEh+ytoG9AyK+fitlnCd5LyPjGy0
         he39PFzDpECq45Wk7cO4xJ4Im0619b0mMG8Uj6if5yyztnaqCcY8URgRdyQuJ/M9lUpI
         Iq8YIJVMEl0jMSw6SpnpYHGp3kVT3kWOkwAsaplFWpKFTInjperklKIL7KfgMPq/3PiX
         DVJPqTY1wDUGLf7+3X4dUwFUiG00ngAiKjTDSySyZuhX/TQSpmFzoiNRRSZhNKZPzI0t
         O60w==
X-Forwarded-Encrypted: i=1; AJvYcCUdgIzgjBZuyMshwIjhR/29BjK8O9ih6VS3CYLdvR9I3qEIlZIcLXdZb8ZPmxjIddGWdJKQXNbw6pTjbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu4Xyk56eZK/RAXPzVOB0Wzcg0JSS/9p08TXzqf7H59q6HLFz5
	PuiuFnNQqSjVVIWY+n5BhEqL1+jOTScPAkNg41hP10jV2ZyOvaCtcpSZ0u5GHS1clNn6m5Vrsd6
	NMN6yfoWoBYljVYKsAgWjQGYS1znymldC/15aY5yQKydTpF49bZxlB5TpxzIs6xSI8Q==
X-Gm-Gg: ASbGncsL/lO+ASk/hwMOVfXH1yuLMAiRaG0vmR0W2vrXuLqyJnTQ1Otct3dZdumTLx2
	1dRyYoOlvvDWo/pNyoXw/zRfaLrC4KRr4HOIP65DH3zKr9eZYxzoTVKuUth+IdfyJFx0LaseGH/
	+82j/7rQLpDfjNcdOVJHG7B7JBM6bKpsDta8prAeiwu0QCh84Olwk6DP8G5NYkLVkXz+7RXzhLY
	ehAp4he1JM0myjEhCaqlfGUoXM4XETd6+MnzwkGsUcE6EOFjDBZx9EuU4hkgQ4UKRaaBB8omaAq
	BNrUHkJ0/hocda2P5km7q7smgu43PzSgSwKtTaq6wPMVt+JFX1s8yZVqHDMICcm0Mw==
X-Received: by 2002:a05:620a:8812:b0:7ca:d396:1460 with SMTP id af79cd13be357-7cd467aa279mr1659322585a.14.1747942702222;
        Thu, 22 May 2025 12:38:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1KQbgFQvKgKzZOxfQl4P+o0nz/PMO7DCB/IkhNmAwt/2Mx+vUW+hul4ymo+fK/nT3VCXeEQ==
X-Received: by 2002:a05:620a:8812:b0:7ca:d396:1460 with SMTP id af79cd13be357-7cd467aa279mr1659320485a.14.1747942701886;
        Thu, 22 May 2025 12:38:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278290sm1112380366b.78.2025.05.22.12.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 12:38:21 -0700 (PDT)
Message-ID: <be9a5e0a-1314-44ba-a8d0-f1071138c86b@oss.qualcomm.com>
Date: Thu, 22 May 2025 21:38:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Fix SM8250 IFE0/1 max clock rate
To: Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
 <hverkuil@xs4all.nl>, Jonathan Marek <jonathan@marek.ca>,
        Julian Grahsl <jgrahsl@snap.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>
References: <20250522-topic-8250_camss_ifeclkfix-v1-1-349350d31238@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-topic-8250_camss_ifeclkfix-v1-1-349350d31238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f7d2e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=MmXTpdYTAAAA:8
 a=TH8GZ54sAHZQbr7yu8oA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=7hoCnnChfAR1N-e-f1W3:22
X-Proofpoint-ORIG-GUID: 1e2N-ix9jtlWGfJkQzo4LpM3cDOoPUPQ
X-Proofpoint-GUID: 1e2N-ix9jtlWGfJkQzo4LpM3cDOoPUPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5NyBTYWx0ZWRfX7A8tJJL2HOUH
 eRssVJog9Pfjn1eGE/KscOVE1XP+Ah/rhaDPuiZ0gFqIB1R6u/pZgCp0HAxhet1HZI4gKwXYM8W
 N1zWH6dDOAXN1brGPSRqjpqtEGkeNdEqe6jYMK4Xk4m0pU4+voRgHppavCrRwUM2JpZRChURx7S
 kHB8Xhozp/RGjAxOdHBLGE6dbMbSWIpZK2KUy67jePdsxR4AtV7poPka6JkkvwiDyXmWwPdwsdy
 bWOnN+BEFzNHUI7l9ukSaFOzJ1T0Qmryi83QJShAI/evvV5efeJTTxXNKb581p8m0zBN/HUwy4f
 DY6Ca2I/xVrMiLPDulp1ckSipqNsReGLqO7HNGSdQI8i4/NBhqpyt9GmLHAsgKDdr7cujhcA2JG
 AkSEwNotTZHeylVfUW29VHa5zfEi6kro/mZy85aYx1v5h8B9/GespEKPPXkObK4SgcCdPQf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220197

On 5/22/25 9:37 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 720 MHz was used on the prototype revision (v1), use the 680 MHz that
> our clock driver expects.
> 
> Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Jordan Crouse <jordan@cosmicpenguin.net>

I meant to Cc him (re: irc discussion on #linux-msm).. oops!

Konrad

