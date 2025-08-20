Return-Path: <linux-media+bounces-40481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1DB2E3ED
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 19:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4FB8602175
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A8B335BDE;
	Wed, 20 Aug 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEGzZc3o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987D0334364
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710461; cv=none; b=k58QL2hTi63tcVZgTLjUewQkHKKTvvTTiDCMqo159wczIYBOocUm4nsMHCzIZ3o4LkXvJ3RFARpOpwlub+RLCtKp6TA1E7tiWhIJTJ7b6whm5rKXlsdf3KMCvmAj4KlFgWnnw7KkErZ4WhaYA90U1DVn3J8siRYZV0XfbvYJm+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710461; c=relaxed/simple;
	bh=NRHD/SaoUKlWxG5x9K1o/sFuQugTQx5lbwzhpuZgFko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3qcj9QhHrea11uFwCTkZ36cCEOaDmUoTZ4KTIlVaTRKvcFH1bI94t4nmBFupMBDxTCj+0x1HAu0GQ8cyKU9vkSXg+OCcDL36cCwU/7IdEwbrxTNXpywtjXsE9XCjSoai8ayffwt/Il4j7guTOVjF1Muy0fMCwHqo6NP1NEF0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEGzZc3o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KGmJIZ005346
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 17:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7BAeafa+hTBdTcNeLE5VaCsh
	Bcl5DTEABVk9scTlNkQ=; b=DEGzZc3oiQjwyaP8JugAHAU8Ok9rmeh7iSPUi1f7
	uuQWrBVeFjS6fMME7mCxyvZxXl9BZvUiMulfji/6sBAaqmRCH/WPVFlZjR4u45T3
	1HOlBP1xIvyhwNjpDb+tIunimtAnJcvOPehbcH1QjRMrJ6fmyMB8BwWAFgVMLUBb
	RoucNp7vLI/PFQheFxIAY8W1R0U0RhH9Dd195fsfs98IkBPmPcLn1zlw/nG2K07J
	Meyo3uijjpvOu8qQnm9Ho2nkL3R87ZY4xu6YH/1+iKadh3VJUWLS4pG3/5qgqpmN
	2NgMtvv0md46q0SOMgBTSmkQ8iTd86cBcMvujYfH773l1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5292ga4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 17:20:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a92827a70so3706236d6.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 10:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710457; x=1756315257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BAeafa+hTBdTcNeLE5VaCshBcl5DTEABVk9scTlNkQ=;
        b=GMuS+4JYQ9qp7rnu0+4HMg0YkhPDndu0fK52i+Wgn5EqNpxfbOISnzUXlzSsgeKdnH
         43ZZYt7d87F65SXieTnuedINU/xOJn8qpwk+8pJMYMeflZLmB8ohRW7bDgTGpSjZHx03
         qpRKV4kcrBEctL82obYIIKMSYKzG4bHjTLltmGOWZ/YhYbO3em4EYIP43JL6V2VI/5WR
         tCgQuTRvARLViJ56tU+Y2CnnnoheME6f9IfBfvbIWRZ0pXeQFkH5JVwsZQhW1ODoEnW0
         vCq0OCqpPFxLp0kaINze0G4+KVlofirgYVbE7IMBVY4t8i5cxhOdSoq4chSU+cBbLtNm
         yS2g==
X-Forwarded-Encrypted: i=1; AJvYcCXqYGgkGh2PVTc30ZLwruliojk6lWiJyx/BppQR3zqX7JWhjpm23DZSQrahJhVpM5ouy9yrxAlM2vzO5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCrXJr0h2Y7IMI0CfLburnHSy2BVRxaaSv9xpWNlJAPslr9tdE
	eDMVx0oLok3BH+D4ULFwAnTL1U9tho7ljAdkcG0gziQ4uLhCnJvYVOkPSf3In2S3jLehY9CZ2Dp
	MNPycMdiAWWZMLf4t2R00EuLLqFP6Mt60IRS0rCOpYhP1bt+H4KX0EKsbFvl4b8MZrg==
X-Gm-Gg: ASbGncuMwvf38z43QQjUdk68CoSHTP0v0HptQktSVa1VkDm8tpa+M4fOPuYKnuE1XBx
	p2I5fnwehYWnsxBZvvTnUsBS9RdUvnSmYrw797V1TQMhlSEitYNdD0GFACDAD1v1xCLW5FPhHr2
	EZ0csAwFl4DNpy1t7eanCSJrUKUJnOzenz14NWjVpOTok3be5APLGYEkNQDYrA04Epem9LaKFTy
	IZD3bV+B7/T1wM1e1KKn1PoLo48mwZH/SFvAWGNqlR0gtLGLUwyil3uUgcTkEIq0bRhgiTxalGq
	x5uVL0IKBRJFAtZXPfBA1NSICd50gSkN9tWjhkj3V2+kt2RpMQp65o44QirLpj5/fhsAbQGHAw/
	FmsPxV75zy2vXZOzcnZEGoNCBxhwM+vHBds+CffKDBVI+cLJyONp8
X-Received: by 2002:ad4:5bea:0:b0:70d:47a1:cae1 with SMTP id 6a1803df08f44-70d76fe9438mr40332716d6.23.1755710457143;
        Wed, 20 Aug 2025 10:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3n6czrojJ1Kz94y4cHToXW3HPALrWfZWenYGCqB7SJfzmkaV8Sa3oCpRIK2udtGSo003JlA==
X-Received: by 2002:ad4:5bea:0:b0:70d:47a1:cae1 with SMTP id 6a1803df08f44-70d76fe9438mr40332396d6.23.1755710456562;
        Wed, 20 Aug 2025 10:20:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369bd7sm2676457e87.68.2025.08.20.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:20:55 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:20:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: firmware: Use correct reset sequence for
 IRIS2
Message-ID: <ddc557rrzuz54r5hlnblsopl2t4ca3wle3eaanbwa5yavgwtcp@mamxnhma5tw6>
References: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a603fa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Zxh-gqEWaZ_blzi-cf4A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: i5jneeEYWSjiFr9pL7mR1XOHhJiPcLvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwGXKnPvyLm9S
 j3IyMzIlmnoxWasf5BI4VSq1D2GWV8D0hBY/5by0EvaX9NgvZMfEKY/Gkza8BEwszA3edRsQJCo
 nMQ9TsfQbTbrv1u6noNPRK5l4lFtzs3LA1l0Klff8stgRI8++tjnF7A7CUUK9xCKgxJYUn+XwNP
 NCKE2HIxogJ1g+mb9xReCMmEbfwfNic9cmnG8e309ARgw+8EXFOrJL1b7xiiZ6eEP5s9oAET6Ws
 J0En6Z//NcGDp4JQ62Y/2CaxKsH0qxStvHRdDqSqT1vWM7WdP5TiZst0yw0mDpl7xm4/iroHNew
 hVv82+KVKUEwuR8Af7zzFaavcd6wC4y/PGyEkLRIlKAJFcz2+yHiatJBZ2fWw/eee3eiE56ccry
 GLrpfEh/k7tEOrinJD9Cu56XJDiCwQ==
X-Proofpoint-GUID: i5jneeEYWSjiFr9pL7mR1XOHhJiPcLvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:16:39PM +0200, Stephan Gerhold wrote:
> When starting venus with the "no_tz" code path, IRIS2 needs the same
> boot/reset sequence as IRIS2_1. This is because most of the registers were
> moved to the "wrapper_tz_base", which is already defined for both IRIS2 and
> IRIS2_1 inside core.c. Add IRIS2 to the checks inside firmware.c as well to
> make sure that it uses the correct reset sequence.
> 
> Both IRIS and IRIS2_1 are HFI v6 variants, so the correct sequence was used
> before commit c38610f8981e ("media: venus: firmware: Sanitize
> per-VPU-version").
> 
> Fixes: c38610f8981e ("media: venus: firmware: Sanitize per-VPU-version")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

