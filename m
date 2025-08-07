Return-Path: <linux-media+bounces-39017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6DB1D5A5
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8A1A18C6FBC
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A3B22A4E1;
	Thu,  7 Aug 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdrQb/x8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39A2185BD
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561830; cv=none; b=Pzz0QgVUQLoe8tWwAlj5kPUy3+K4IVbLckvXVNu7LcdfDkixHes7iMdz6Zu83xVdKBlgsxqfkFqeh0n1utXlyLHCqeQ9FB2nAB6zkwFvGSxTQAMPOuNG6e2RVxcHyKsBWQpy5viALne4Ub3a9M4FbCaJFzmiglrcl2X1glPPuVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561830; c=relaxed/simple;
	bh=hQqQrB9x5CTf2+b2miREUHPTZdmUilKcUNXrLQs7I/A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AATUbXuep8btzb9mWSMetwII3RLfXuJzDN17gJcLCV25RW+/eizr8SOdarpun21xQn+9CSJYQiT30uGd3vuZbZiylOL9C+wB/pN8SdzSUNfH+aEauMmf5GnazLqCjTSk2yJ8f9Ce9bZVwmYXO2mRAEz02Jqyee3Kg0FC/7l/JyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdrQb/x8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DE5U018565
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 10:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LSMAw16rqz9HkkSbuIAhf3q5
	6NKWpVJbEjxeVNYRh0w=; b=EdrQb/x8xQH956TsVerEzZsaOrg+ke6vrRoRE8XI
	SUZDkhNRRCezKN4sYiKnkBPNA7wG+ocvMa0ewCJA1ZkaUdDkMSfsh9D9L/zbGpvk
	+GX1f4hcPsRfA7hzhNvEaRN6vDh/j2kLB+Noe3sem1xRen7QwqtAkU85zYiIw9Iy
	kx/iEge4nHjXFS0QzHhR+Dfwgmia4gURjzNYdFoxeE5Q6PSWkFHI5mZdp4/5Fq1+
	Xz6PeiijbH7qS3fQYMz1r+YSSZlkw08PNI+rGofdBmNtC1Hi2wwVrEEXSOQvInDs
	ZkFep19tiGaQbm6ApQNP+WZ167uIMjLDSMJQHTI/v6u2Mw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586bjba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 10:17:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af18aa7af8so21840191cf.3
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 03:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754561827; x=1755166627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSMAw16rqz9HkkSbuIAhf3q56NKWpVJbEjxeVNYRh0w=;
        b=Sg5h7yanj7JPXkahPBF49FSmF7JPJV6IsYx9/rArcT5b5R5UsBPD4+EQrewUX0MgKY
         RooNmGChJ20Gg0GLjM4LYoNFZkfxEi/FcWv+CTuOr2t0tw3NDBEZFudElc9yGT9gMMOQ
         YBfhsYeDHM628PMHWyf6iDW3lSfZDnPEVj0PlsK5u0ealswOs9FahIFCHWPdOXREp6B6
         UGykDrrYvP0rKnPy6xurBAHw+CyJMLHqQCIBD77qJ5vNn6Q+itf3pbQaqERhCGceu3hN
         0nAPKweKoOgalyTaWrLJ5i6pD1qz75Bq1UHHyHiC3wPafmhtK8L8HSguhSnda7Vgr0lG
         3cPg==
X-Forwarded-Encrypted: i=1; AJvYcCXfe6+jk2nPTpUd2En7w3SYtMtUM2KV8OPpw03V+ivz9R+UHNi+4yYa61wHsSDLPoVZfpCgDFoGCAhy+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBft5KjgqEiKYdY6LXjVUVu3CaT9SZG0oIVIyzlZsTde/apChY
	xkesB+WiTqdhc+M+DFDgrOQJ1KA9b/G8znP9bU8/Ti8OjvmpFd0RrlMKiJIZlXGvue6Wwk2D86r
	cUcZacQVdvkW9Wg5V4MVAn358712RwQ+lJ2jMI8YFynxVLb78oTxcFo9rZ2LHYg3QUg==
X-Gm-Gg: ASbGnctMxLpx9SRmcNEsAXgkttoejvOU/HlvIXPXJ3YNfXdgqtlVx8Hy1ULFMTt6juK
	ZR13BeBjPtCPyFgCOQKqN4zJEmDCysTE9lUMQhXYcfH7GneXRog7CRbXqTvm1wBaldmD4L+TCBL
	7TCmtJgUB9jCgd3SzP4r+U6D93iPvIX3IUKPqinP4+zFZtuG3IKcFbofNHlUKuNALzCIrcgIt6+
	XcdjK7qMg3W5CG+0zWTJXXiLUOYjsqTN/QMTge2GTEyeT8uQdk+gcYLmNq8jZF0I/U0ZzQkSZoJ
	TJ/fZyiGH+5a9bbTV+JWvk7U7DDL3Shz90Yw+z5IyBZ8XJ8LqAIqkkVqqTav9CAHIPCK/w==
X-Received: by 2002:ac8:7c44:0:b0:4ab:b0a0:5b58 with SMTP id d75a77b69052e-4b0915b2ea7mr88011181cf.46.1754561826692;
        Thu, 07 Aug 2025 03:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFog7XVeNO1DWuYUw+8uakXHI7VfO0Cam05IxQrT4njSSBu3k4GA9z89rCO/DGT0Q6+Lpq0A==
X-Received: by 2002:ac8:7c44:0:b0:4ab:b0a0:5b58 with SMTP id d75a77b69052e-4b0915b2ea7mr88010821cf.46.1754561826232;
        Thu, 07 Aug 2025 03:17:06 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453ab0sm26613983f8f.44.2025.08.07.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 03:17:05 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 7 Aug 2025 12:17:04 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJR9IJYz47EfNamO@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <ce9cf017-5447-457c-9579-700782f9f0c2@linaro.org>
 <aJRMUzF0GN2LFIZd@trex>
 <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
X-Proofpoint-GUID: MvnB4EBax5ZaGKASnfDjKeDR9qD71s47
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=68947d23 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=7TY_VEaP9L5SwCdglBoA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: MvnB4EBax5ZaGKASnfDjKeDR9qD71s47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX5cuhuJ9GB/L/
 tcnWNDuYqRUtBlrh/Snbp7P9HqX+iBqQ8eNt+nFSzguPpYjzfDNhZtQmCjWrN1+WwOS8Sh//4+6
 U8HeHsD9tAd9SX4UuR34PuAUrWeWjlX17Qr6evFYjTaASWhYeXwteMLhGFfxu7xIV1+L9jflJ4s
 DVZmuHC9/e24Nf2BtXVHAmQSU4n0szUSSK5Dq8bt6mPnKm1btNcKsmXCXOYdO5Ns2ZK8rXAykfR
 HD+Gvw1QagLM6yefQlxeNMvjJzcUZtYQoPuENARQbNLQqHrY6QTPpm2wg50dudKoXpz3U2fxzku
 +zXyIK69jVjTDDKFNZSUXQYZIAZEbVccwkYY0nSEfXnKUhxRDR4AiV0DTbIJydWEWo37EDtVAQi
 jfCtYppe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064

On 07/08/25 11:11:31, Bryan O'Donoghue wrote:
> On 07/08/2025 07:48, Jorge Ramirez wrote:
> > > There's not alot of value to the user in that configuration.
> > I dont know the user base but when I originally did the code (v7) I was
> > thinking about security conscious users (signed firmwares) who might not
> > be able to switch to the new fw release so easily (unnaccessible key
> > management and updates).
> 
> Since the driver for the LITE hasn't been upstreamed the # of users must be
> ... zero

sure but that is just one dimension of the problem isnt it? the other
dimension is the number of users with a signed firmware that could _now_
enable the driver and have a working decoder.

that could be zero or plenty (I have no clue) 

> 
> ---
> bod

