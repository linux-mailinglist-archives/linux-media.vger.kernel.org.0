Return-Path: <linux-media+bounces-36630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC79AF6520
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 00:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17E54A5A84
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 22:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ADD247298;
	Wed,  2 Jul 2025 22:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nw8QAjP4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB524467C
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495171; cv=none; b=RCN5y7KvpbYnsm6R8dMCiKd3TwphBPyDHAeV0grmvJGiQ5mmQkqmYpgkhiUU77bvKerBe2oCejXr9Gy8oCB83otEGXeGcYHuHdYNsmDW3HnJohzry4ni8Sa/iyToP4lP5C1dmzNm0ZpQFfX2KFKh83/1OuoxUdu9qpTz3DI79Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495171; c=relaxed/simple;
	bh=YXkp32VHnnjpgTsSIj8HLJsEQ/FUBPYm/UP4Naxfbcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuBC+fl2BeVbaEJotPrNSBGGG/cT/rqv0fVqPoY7LImw2+n5sBSrjBQbcemezUmhsbrQd1/huP9vUbdMb+999Tf1/WE5vTJKKjpeRALkURI0U79Hh28YpiTF+sy436a66Lw312y2RUZrVotI+Wx3X1QfzHX+j+7+sn5221yEAhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nw8QAjP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562CxtFS025165
	for <linux-media@vger.kernel.org>; Wed, 2 Jul 2025 22:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MK0+Ls5pDqiJ6P4kbBMFpl+U
	Brrw5KjzX55rd6Zmy1s=; b=nw8QAjP4mmLdP1skCs/UEe9pDiknMqcZUfuxL4dM
	de9u0UZbs2ymcanqTweZQ6iQ1OX67tr84CYBAAIdc73NorCpsT+yRLyWuj7PfmWe
	3uB2oINDIVVTSZLHZtl2gATvTCf/FkiIN5FD/Bult7xtq5FVf1rfqp8sHTN8ut7t
	pZlYwIv1cxHMd2RIw9R1EBvYxeCQ1zKGMl1ODMlesVJ2dK8hou8N6x6FU3M4khuN
	VDLsEE7N8yI23Cim8QbuQRwOX/lOKonFTt58fbZbajeF9B/Cw9k+aYnA+XbnTTYH
	+CUixRKMDPxeGyU5tpNG2qy4dfcS8zp4z8pxsy1S4rsZeQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64ubjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 22:26:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d44a260e45so61478685a.1
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 15:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495168; x=1752099968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK0+Ls5pDqiJ6P4kbBMFpl+UBrrw5KjzX55rd6Zmy1s=;
        b=hUgLPHXcYsWaFdEY6OOkGbDSY3yeG0p9/ql5q14ESKr9scPi0fTu2G7MUpbOVifFpN
         tDecohY4lKV8chsAmI2YOXLJYIkOJQeaRZqRkH2cIdjsF8RlLT/GtWpdrURtgLhRDagQ
         IXUFz5B+GaH/bEXSr6/NtZ9FjyHlt0D0mr3E2n7KbY8IhCbBKTbeDviOE52HvqAGD0TO
         xP/jjeQsuL+jHncOtsluc1tdoTT1tXG3xBflg+5899mqGVHDa3lSlLWgXq4RZgCtnDpK
         IeGQk/fP3IXwk5q/8XLHU4s8u4AW66zchCIpR+49jb43a3tcwDpB2c55xXyTgIm8mSUv
         8yKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWOt/xnmUaOQfXUNN6r1aoRF4ak25FMqr/R5QTOoJHB7yuxzP0g11YzbwQS0QXC3VDuk8hyA9YuXP2hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRCZvVkvHHbMFVgorOF6Wbv7w+A95vXvGyE9sUVUoiuwj/2UP3
	yhWITf9F1hX+iB1O/dbp5+oRUwcY8OjC69wCtXUSbNPB3hg26ceGBEpT8KsnAcGz2oMvXlMLFJ0
	IlaEvWpjD8ngW3GKhoqR7bRgP3Te1Eb0BdAMdSyRIa8MM0zUw2v3FneFA2dw+YwgdVQ==
X-Gm-Gg: ASbGncvM9REeQPqicYyomX/dBaKkpgd7Jhrv12wEl25cPLJET3Qi7gQeqUhlFD/YJYh
	jrBM+FJ++xjQ4U8oXyNNwbYA3k9xtoP+FnB/7UnyGtyQDuucOpUJTSybwaSbn+IxSvIt0Gl714F
	o6V/CNf+6voX+E97Z3TGcvX/u3GQqHlyCqaZOLDSqZZz0OUFtXWH7HyUIqLU9tVR2J8fiNtjvZG
	Dz9Hi3iVCTtPys1/Uhdnqky9fPiSoDdtqKB875ki8Zq4WfcKH5PIOCWYWqVB2eY3cbLP5bNzNeO
	KThVZbYTTmcAkbj54FMT7c4Yz0J9+mFVEO+oamLoqSwE9A0gwCHgdbOzEcrC972AQAZo0R7Ky3V
	4VowvpwxRaB08L9wRunILoS8GIc70SYQX1Q4=
X-Received: by 2002:a05:620a:2546:b0:7d4:3b37:7bf0 with SMTP id af79cd13be357-7d5d1482a5dmr197262985a.8.1751495168418;
        Wed, 02 Jul 2025 15:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2X5tx2tZqNp1T+kumsXTFd+kd61L9urkmpDGTTHsoabTZ4LaAF8wZPfA8E/m43TRPQFGOUw==
X-Received: by 2002:a05:620a:2546:b0:7d4:3b37:7bf0 with SMTP id af79cd13be357-7d5d1482a5dmr197258385a.8.1751495168000;
        Wed, 02 Jul 2025 15:26:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73f6sm2262230e87.138.2025.07.02.15.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:26:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:26:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6865b201 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=1XE270qXan2-a6Ey660A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NiBTYWx0ZWRfXw0WoXGFRDvSO
 3shLKXgjy8KaQMTTSt1O5moJl22s+zotnDJgTYL/2nwFC+7jLi20grpXj72wwAtQTLgqXfXY0VD
 e6zafBJ42mMMavly54R7tTn3pLizbxcAds7D//MTsBxhczNVj+93LVCvBcWTwUY+81XiKG4NRs5
 PEvbLI/+nCbV+Soe40MflTqQUSrXuj80oxaUAPxmSkfZn6bmU85O3ACYSdGnnBoBaRJnU6hpO6Q
 e2zAMmgp60g5Plrw89R6EXv8GZNjsyuPs3AEZO5nPT3q1/HudnyLf86sYvWtNvPpvQqzSpgLxz0
 7xzCwgPHy0vuqjuTC5YrbRSk1WGWRsYVZuYi0Jw9eFhJGCti52DXI+/5HjiooY8CczSSkpoxoh1
 8Lp9mCiKB3ugyVoboItqIGQ20h5A2dYwarlaHqi5jwmWcpT9z/bdq5WWEafMbZS1Jdnwb6d7
X-Proofpoint-GUID: Qxd47ymxbOo5y7qhgzC-6ZIwVycCEQn4
X-Proofpoint-ORIG-GUID: Qxd47ymxbOo5y7qhgzC-6ZIwVycCEQn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=696
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020186

On Wed, Jul 02, 2025 at 01:06:17PM +0100, Bryan O'Donoghue wrote:
> On 02/07/2025 13:01, Vikash Garodia wrote:
> > > Anyway, in other messages I explained what is missing. You are changing
> > > existing hardware and you clearly must explain how existing hardware is
> > > affected, how can we reproduce it, how users are affected.
> > Exactly all of these i have explained in the commit message. The limitation with
> > existing hardware binding usage and how my new approach mitigates that limition.
> > 
> > Coming to usecase, i made a generic comment saying usecases which needs higher
> > IOVA, i can add the explicit detail about usecase like 8k or higher
> > concurrencies like 32 or higher concurrent sessions.
> 
> Why not make this change for a new SoC, instead of an existing ?

Because we definitely want to improve support for older SoCs too.

> 
> That way you don't have to make the argument for retrospective ABI changes.
> 
> ---
> bod

-- 
With best wishes
Dmitry

