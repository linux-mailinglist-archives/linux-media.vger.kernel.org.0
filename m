Return-Path: <linux-media+bounces-67296-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TW+HEyPsUGrz8QIAu9opvQ
	(envelope-from <linux-media+bounces-67296-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:57:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AD473AF87
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="I42/IKe3";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TTWin0qi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67296-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67296-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26108308CBA7
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D502442B30D;
	Fri, 10 Jul 2026 12:53:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B18427A0F
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:52:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687980; cv=none; b=GCIXJdlTcPMNAMNo+PGKoP0qkcSgfxz+mR182LBsKVxXKV50Y4BHNiGWAiiH3Hb5ihMF6/MvLN2/zVdVYDbSRAFn+jB8bMDcKiCex2IFkKKYLSkeL22DKns9l7pR+uKqTa8VucWoY5DMvtHuqxBOkekJWJqKFqB4CqipSHx+PUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687980; c=relaxed/simple;
	bh=dff3dPz6fj6WTu2ipiERxBpDc6obBjfF4qBxHiQ0VQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZzInCdN/EKsxOy4ppSFFlpWbThqkEPSx/kpnmRDCOyqGySv/Y44BXXngTqYRRiR4gncUl22Fn1u+sazkIC9u09dgIDqsAUQC0cQkXirEAgp6ptv79pdFxwCvRKlKhUNzw377VRVjgM/D/UvNKXGWVdbACEO/1hhaTCtoAGGDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I42/IKe3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTWin0qi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmb9f665435
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NpAfu+gzDtNcSOBz6LH2pQ8p
	/Lp4trDqfrlm8ofYnek=; b=I42/IKe3Ri7lwyhxcP0dFl8qFQsMZfU3/utC6aPK
	eAN/xFQ+dwmBwLOZ5GbU16gbOUoqyNZ7IThEm0FjgpqXriMwwI7ZFq7vXpa4ilaA
	xY8MVwJQOL5iO0WrgnrdPvdQaWoZ96CY/8eCNX3+rfoedBsriIvzOge9GyiTb5EI
	CIiyZmZRYWdXoWOBlX+TOun4Zo5KDZISDpmx2Qj7xxrW/RhXDhdQAn8UH1RqYKIZ
	u252r/L4QbuqCzBLdhNEYCtieER6FgfyLuF9wfU33O7KPXLW92K37Rk2RvODGnBC
	aM1AQ7GI3JhgPMR5Zb3FeYff6jIO4IIqRRUvcaGtkzu0LA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3mgnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:52:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-739a588fadcso221626137.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687977; x=1784292777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpAfu+gzDtNcSOBz6LH2pQ8p/Lp4trDqfrlm8ofYnek=;
        b=TTWin0qiqB0AWM2LBof4QfsNT9HPUntmWzB76f5Mk+m3VdgFABrfHqE7FzF74zz8q9
         ihefGc2h+uPVMwCk5rsYPMf9nCLhvmMrQfPDGgmnFabTeipPfIvfFnMh4pz608qAKrHE
         hZfo0SdELBRXPNSiGaPH0yZxOpx+b2uQkq6GeMjax7PvoZkW0ETW1DC+V2KSpL3haLSQ
         /b0/76mS3wQg9NqF/Jz1XP9L+0+sw9hk5qGvYAUMZdgidcFhTgHZWXjBwY5GdnAP468D
         Nb1mC0JBSjlToONE2jTTZx9GVWYH4cY5HhiLsS+icsW9sJ7P8av2UcmnVy7MYv0lWqgw
         /BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687977; x=1784292777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpAfu+gzDtNcSOBz6LH2pQ8p/Lp4trDqfrlm8ofYnek=;
        b=ZmBP/7TExjsBJkvsfaqJRu62xDOTFbqtBjcma+LULGwJ7xihpowI9xhGRRwO8AgX/8
         CxCnsT4R5nMPUV6iJZCOZ0KW/hBXcZgWvAIY6JATaqKPQpoe28Yv7Fw6Ewzz3Zyp4bQk
         6NH5u4RNzZWHPlAdm36R/LRS1dJD7LCOg4bJGUbbEz7j8nKEjq10oNrhqzhNLnqQ6Gwu
         DMxtliQmWCM0/PUyab5pxbw2Id7sc/GKmujnmtNn+40m8PjPUOgZTvubYm4k6NX2Qish
         //Zko9G6ewbFa2QVSWWWKK7XgzXR6qlLYM9Cy3R1sCVNqOVrSJtW8u4E8Gh3VbeKc9ay
         xi+w==
X-Forwarded-Encrypted: i=1; AHgh+RpjdBYNRZ7cED3F9uVmwQHP9HeqOvlOdsXeMnKtXAxLmHO0cw/d0td46fwKrUDWTOgCpr1qTJtCfaa7gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLOqzfxtL6ks/GLPJxRzRTfVGU8ktuGXoOO8Q2tqrnwG/wjqKX
	K7g7uuiD1PSfKcuHJZT53hVg4rqVbCChwmrv+mBuBk8bv6pT9Qx43REYhQhlliaYXt5pDjQwlnC
	zgpsE3rImw1cGVYKItwxPorgIOaVLynX5a6ViM/YFKiBT77CLQ1XvoU5ViNPQvhPJiQ==
X-Gm-Gg: AfdE7cmfiSlsWMfs3B9FsYk9zLrLqSjR2BmvGHbS74xGtezfMIHiq5vOhwUdOACEWZR
	vmwkhBjBk4T7EXqqoewTpCPC/rckQLuz+16n9JOsekKNfIWl315LNitcdYC/GWzu/3Ioahm6jib
	CvAEBC/EiOngGFL6b+quK3IDzqT1ZEK8WR0/vlY3BQOx41myCcyR4pSvh4TwFDqoIN1bQmmJ3wg
	U8PwxXkL9WUytXhN2ZhCn4uqjignxO9XwdztiD1oC3oinlxiTWcz1JYKIXb8vEL1Q1fpSBtGUAP
	Ihk77D5CmEVC4/H8XMRan956lmxOl1Ypsuf5yN9J48RUSLrVMIghtYQR2FDRdJc5Fgh2kpS89or
	zUNqHSuq0maIrOHMGan+Q2qi9h12hKycT7l5vU86hPs7zKGGU/amWk21SUC5y6gkBh/80MJM7y7
	z4PQ7WHXGZPMWF4fJdqpLrw/0H
X-Received: by 2002:a05:6102:914:b0:740:2664:801b with SMTP id ada2fe7eead31-744e00462c3mr6355731137.11.1783687976793;
        Fri, 10 Jul 2026 05:52:56 -0700 (PDT)
X-Received: by 2002:a05:6102:914:b0:740:2664:801b with SMTP id ada2fe7eead31-744e00462c3mr6355697137.11.1783687976325;
        Fri, 10 Jul 2026 05:52:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm589398e87.62.2026.07.10.05.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:52:55 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:52:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <olngpgjkxejkpnxtbwazut32umi6w6zc5gsqybpmnzm6kliywf@5eclmxcnoybc>
References: <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
 <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX1r7xx3gm/Wb/
 uvBp3+zNyMb0Jy1pBtdifLgLaSBNEu34H5vFtm+QVE2aLx2sNIcmWARdC/cVQSycvpZ0R3+lCT7
 8XfgeU4F5G79cGMbCqKEHFU09x+SlhqOVfy4ZkrWcYq6REUecmC3qINk7oJzE9xSp8D03K6ua/L
 XETFMxcyzRBm7IxlnRYNOKYYPQBx2tOKdTvn8KOzJENxNBj/3Jiy+zpANQDrlV/+CtDpTa6s+wG
 G2LM+kCMRvRWC3+y3HV33y/+JqsTDS+d4HxLBd1PQodsNAABgqgd+kzIiAJaZ6mPF+sN8TvX08U
 w9pQzBK/J8+Q4La6QKCPDSGyqQ2oJaRpLaitH5BE5XVDb+HkM1GBXwyHlbqp5zOsvAHEoC0w1Nr
 65jN3Mr2/sLHhwmMz4LrO2aNl2/PGoIm57l1v62DXNvPyHPaLNirKQk5EJ8EbwLGvG6KDxUuVOr
 5xLHgD95gQ6lw0oDbaw==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50eb29 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=0W1SmJJ0diwaTAMQS2cA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfXxUVhRl/92Y8b
 RpEkKBWZKM4fEvJWK2l9PtO0fEQYZi8ytV+6r6s3IbuzqWmpleIzOAZ4KjrJ6/si9puG8Xxyflj
 v4ZfUQBGSXklF0HLpoeIEBf2kya2nTY=
X-Proofpoint-GUID: 4U6lE-Gwc9Fl_mCC3KCueOHvXOLlvvv7
X-Proofpoint-ORIG-GUID: 4U6lE-Gwc9Fl_mCC3KCueOHvXOLlvvv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67296-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,5eclmxcnoybc:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9AD473AF87

On Fri, Jul 10, 2026 at 02:33:53PM +0200, Konrad Dybcio wrote:
> On 7/10/26 2:28 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 08:16:21PM +0200, Konrad Dybcio wrote:
> >> On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
> >>>> On 08/07/2026 13:19, Konrad Dybcio wrote:
> >>>>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> >>>>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
> >>>>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> >>>>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
> >>>>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> >>>>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> 
> [...]
> 
> >>> Which way of representing device nodes makes it easier to migrate
> >>> existing platform to the CSI PHY driver, while keeping compatibility
> >>> with old DTs (yeah, ABI, old DTs must continue to work)?
> >>
> >> Quite frankly, I don't consider the existing (meganode) description
> >> any valid, and would vote to rip it the second a replacement is
> >> available. But once, not N times.
> > 
> > Rip without providing backwards compatibility?
> 
> Because the existing bindings make ensuring the required performance
> state of power domains impossible, yes

Then, should it just be 'write new set of bindings and drivers for the
platform XYZ', then completely migrate existing platforms one by one.

-- 
With best wishes
Dmitry

