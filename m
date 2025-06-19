Return-Path: <linux-media+bounces-35440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EEAE0EC7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 131E64A185B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662E425DB0A;
	Thu, 19 Jun 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDz8+r9I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A9021A443
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366492; cv=none; b=gvsR0EvUstwerDTlc9D31nODRk5EL45gcwt++MGov2FlYk8mpDIXWhtOuFcGfOpGHqdQ0DJq6CmiDiQM7GdlBrNnpy78+5cRh3cbRc3GZlGknXyaCLH3atWI4Okqu/OYhqmpwZfjaRW3CpzZosg5n9y3yT5Y4kOAZJp5RVX9H6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366492; c=relaxed/simple;
	bh=V76wWtfNssZuJeL7jIN/TzprmpMDK9ODtvOoXZpS9a0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zy3poJAciwctUrrqKNsKGAwcmPtKW+Cblgwp7yYKsFDeYH1EKJ66ao50SbM6Rev2SUiCoZQASVCC0bfu8Ovs9z71Zllj5tkcOIlWDUvRHbWb4vHDksG0oW63om2jN6/ma+F+/Rz8uY7u0tHL8cRvWMb57gsXMxY3kK3THTjGWbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDz8+r9I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEkX2Y003269
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2jzLK9E63pyYq1kVv2ZUpQ6X
	CYSuynTHjbdFSuxz/xI=; b=aDz8+r9IhTgz4pHFJAzbfqs0AYT/p+vDaiel3i1A
	XHoZGdNokpPD5IzCx5+M5A39VRqlxvAQizXbBPqBWu+1IlEUh88FekbGFQozXCxr
	ouQikmEFPuc+lMhevA+HYUgcGpUuoBO9cn9UMu2FCzNq7BYsOljF3fAHr/R5jTyd
	18o8bhN+2Zka5Cr9wIhLFlVcXqZ1sC5iaPw+MMgaHhH86NgG8eaofrzCyMrb5T9s
	L8GKQDxtQ47Bo0eRcL9dAN04pr0sC0UnuWAJM95oUePDS914yW0+EQ77nEzs6CeI
	ej1Hq6Ivik+MAc7NwMNvqch+nc67b0mPSXj41IuifUbQDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag23d5bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 20:54:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so153849485a.3
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750366489; x=1750971289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jzLK9E63pyYq1kVv2ZUpQ6XCYSuynTHjbdFSuxz/xI=;
        b=m397zIPHt3GammZNFgpPUv6PTokxoBEFoUBSwb7hjvS4lWYgTlaXxMAqFByTcRhSCT
         csB03KQsO+u7ouoP7+2VfWc8Az4Ay0dK/vBHnldTcHzhHYcg9cBaITCrDoffbz+X+xY7
         JP8pAyrueSMH7fyW4PZNN+u5J//FddlrbC4yiD+sswxHsAKmBE41L6KEDXGrrWloL5z8
         EQZIjf3Zg499bnGmRKdmwYZg/VL2+cHel72lPwBVZHoMMvt3fEDPFTrFUsGJl0Nure8v
         qGF+gKhzjIkHk6fZ+TljNszeXZkEZg4iMxyGBZyp6Xq6zvQuW3C2u4b5SDbEKZfwvdEI
         7b2g==
X-Forwarded-Encrypted: i=1; AJvYcCVWJVjoST80wzS4d/ovX1Bz0XxJIlhV1Mff7ODsmOSV5PXRJSMDgNOal8zhgp6yl+QHjgYyoZzzy+M7aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUaQFW+J87riIqom1BD5kahuWFezFMOJMRx+NjEwxctcJzuGC4
	Q0BGh8Uxm2RWcgVRUx3F/iA2oBMUobDwPUVS7UoEC+RUKeSaMQIS8ft/2BnTdy+1tYPYpsnF3sD
	/KfI7M2EEf8CqU3SmPPTyRYRQyHudhNKH+yZQflYKDfZHSjrdogy6FdtzLVDJdjJECg==
X-Gm-Gg: ASbGncufeWgiK3frEs8+KghTQBl8UYFRTt1adJqluSRVjHwR/11G/uS4JtDwtT/uKNr
	Wf5qAPEDd+s+PasXRBOIkM45biSavAsdpJJ8/WaTkuLGILm948ZEeEAXphCKRM/nKNJjdnMCIpf
	L0EaiXO4Y1Sa7Dxsh8iSYCVLmUXiThW1O1Rehns3XLi+OwGF0YRFqt2C036LhGpPkirih2A5FBo
	z1aK0awz0g1M0nu0tK+2wOyvIaLhf4e7E10VdR4QkkuUlYTfP78ZBwXKxSt/5a/M58tjdG3bqY1
	ULJUhxGP+RYB8gbMuG7fnqABJnXsU4KFXXdQz4LUIfFX0iuIVvawif1row==
X-Received: by 2002:a05:620a:44d4:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7d3f98c9736mr78862685a.17.1750366489474;
        Thu, 19 Jun 2025 13:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkpeI51MxI0xEdFKrJEvaOGoAVyfUsMbYCSR52G26n+A57buXYC0rJ8WA024sdRvFNlTca8g==
X-Received: by 2002:a05:620a:44d4:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7d3f98c9736mr78860185a.17.1750366489005;
        Thu, 19 Jun 2025 13:54:49 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb5a8sm5065545e9.7.2025.06.19.13.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:54:48 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 19 Jun 2025 22:54:47 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, stanimir.k.varbanov@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/7] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aFR5F7zEmMzYDxWR@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <672b5db1-e045-4625-bad6-83224c27c07f@linaro.org>
 <aFQg6x+FxXDY4P5m@trex>
 <66edbe65-a137-4661-b0c8-8a6813635c44@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66edbe65-a137-4661-b0c8-8a6813635c44@linaro.org>
X-Proofpoint-ORIG-GUID: XIE0DeTBd1w6Q-ByxoLF99CB0Niii_uT
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6854791a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=nbKgHqp8-yig3D_XBBYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE3MSBTYWx0ZWRfX2zPlDOhr1GMC
 0uxdeKAAUiIgIWhPpy04lhUSnSYZTFcy/8wnSmYZC4wnjUebwL0wp5EuBX/NFWMyOrweJqVtyCs
 tjvFpcCQHkJ7ilpzyF9zgno5fh2Zn7ksff9iTXc+aiByjTa23UxGGzGWZyXyz2HH6MTrFfpyVuY
 CQFiw77veSWI3OSN3mjtJDAXmf+g0RC+ju6Qn5DehBJdu1J5g0XBRgFYgNhVIw+TkmxKFGtf51z
 K9Jx7SXbqfgIEmHSh8CxudDn+F0rjJ5z04MQDSB6HprVROz0QjO+X1VHVXo0BulgyjbC2TY6tJw
 VEQZE2GxRFtUDld+nmz79Lpe/7AFWCJ/60JIevhcp0nNUzYbMC62/EeANAisdEhhno/Jx6NqLTZ
 36zCjkQohIVvn9+ybAmcYbxiP/ocqTYpktznVqVH41e79WPSDFio4mT9cJ4yiTBsx38o2T62
X-Proofpoint-GUID: XIE0DeTBd1w6Q-ByxoLF99CB0Niii_uT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190171

On 19/06/25 20:43:46, Bryan O'Donoghue wrote:
> On 19/06/2025 15:38, Jorge Ramirez wrote:
> > > WARNING: Argument '_1' is not used in function-like macro
> > > #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> > > +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> > > 
> > > WARNING: Argument '_2' is not used in function-like macro
> > > #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> > > +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> > > 
> > > WARNING: Argument '_3' is not used in function-like macro
> > > #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> > > +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> > > 
> > > WARNING: Argument '_4' is not used in function-like macro
> > > #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> > > +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> > 
> > about the warnings there is nothing that can be done - those parameters
> > as per the comments are necessarily ignored - that is the way the macro
> > is supposed to work.
> > 
> > can we not live with them? otherwise I cant do it in a nice way.
> 
> For preference I'd like to avoid adding warnings.
> 
> Let's just stick with your first version instead.

ok - but I think this made the code more readable

> 
> ---
> bod

