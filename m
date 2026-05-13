Return-Path: <linux-media+bounces-61499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DOlBqbIBGodOgIAu9opvQ
	(envelope-from <linux-media+bounces-61499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:53:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEEE539566
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDF71308F756
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6273ACF18;
	Wed, 13 May 2026 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inykS8rH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrK5pSuR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C703AD53B
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698248; cv=none; b=ZJGvXavJDpFzMcZtW1Y7QoxarGbWbSJtNe0et7ZxM/XVQxQvRdIz/7sVtKeghLXsZOFP7EA6H8F4G7ylkm2TlFvEqgGogd3JkNw0FoHlZ6ZWvVfp57ZXQSgm/9J//qEYYYDlxkLM/eUlvt3xkcmI06zutnlTS3p+F5FMg9Cb+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698248; c=relaxed/simple;
	bh=I808MSsv3TsrTfE4GDi6+vkUaADCG33gzqyZltDW4Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MI3+albTGRNWWQkTtws6GnjNtn/IppSV9zaKm02O0t1w2Zi2RqEe+lqLtE/BXAOJ4BNjpyDIBI+NVV+SkAELT1hKpYSXk3iVLIE0hHJXuQY8RnqI6S+IrivgSybrlziyMHsu6v+t1V8zAcLSLn+r0kuH8OtQX3aMmiZeypN8LHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inykS8rH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrK5pSuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAuPb2524334
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8xFsDrX7Tw6YJWd1nHe/Je0N
	EIVx9iWNy5GjIc989O0=; b=inykS8rHNicLzrStaCfQZ24K9XJu01ELnGdmEwFi
	JLeWep6/3cfCF3O8sxUaqTr3nASnMJVnMYN6LtNAvrGF1VS54dXt5XfFdUqg6I5m
	klmQX7exFf/IrBjvBFY8O/+uDX2+emn8XzcFPeHNeIhBNbku/WEY/D9bMRsmh2YO
	QXFAOnJTUn1AW7jDeMJUnwS43n61T/VDyz+SB53xaFW0Hwimbyp0SWO9nYhuG5K4
	JdqrnKn+g4Bh0xmNqMSWPXvHNnJFWYIK/DlasbSjOHkEh0Ow9eg6SfaVu/Ww22Hv
	eFCcvnQ0B4rvNwUa7/qvVktuOQcWU3qgAQwshdNevuM2KQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjgpkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:50:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6313c9d983fso3032266137.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698245; x=1779303045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xFsDrX7Tw6YJWd1nHe/Je0NEIVx9iWNy5GjIc989O0=;
        b=FrK5pSuR9gaP1sTL1YnefzRKCorh4Mw0/ByqzwLSIRiaTIksjTnRuHT0nBstbZzO3q
         Hv5UfKXeSK99LI6lzOOcc4DbrxPN2x3ugXP9aze2FyVu9pUH+KeWNnp8iwNOnEBrLNAN
         wUZpSFM3IAoliahlu9YSADl7APlYMOkYSDLeY3MVCBnD01XnVLjriMMw0OContydlCH4
         WMhpe+vFBGRbRB54vQZCxnXlaJArlGp+SYYpIiimJq/V7m0LZJTKiIhssg7O3uw8gto8
         LfX2i2QcTMHo0iNUf+jhF5XPs1Oat7l/pNF1lnA1oWPMW567ex7HE8kz99FRe/QFDrqf
         079A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698245; x=1779303045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xFsDrX7Tw6YJWd1nHe/Je0NEIVx9iWNy5GjIc989O0=;
        b=Hqb1lM8zhXaeb9r76hErYuSTscPmfXB4qUi15x+QateqR+05y6xAx/wMoHZV+ocjZu
         6Sq0TFdTk4+zSrQtrjNpSk5PRPY4UvWSSIQNRxk3jAuU9z7mxRAgAy6KEqYsPCUnSRVG
         EEbt9sK38TIdZ/jYIi0wIwXoSKVqITzS3jCXQ+DeRhjh0CUkvVUnuXtR/bB+08T1ABAz
         Ye8Zj9SVOsl6iVa+dkQzj46kiC9AnCFU9s/kYKrCaFcit1NxgLGoQ8Dmd/bhsTdwxar2
         qHwW/AlcqSsBK1UG3R6koo7h5pPirK6gnDTAjKEB7PNj4igsk7FREnogERSbSBenkAg+
         tveA==
X-Forwarded-Encrypted: i=1; AFNElJ9UoqzrCipbFeXH2+myjOs0oAkdzRBYTovxSsi3e8Gs5Ls3XAKrIglXSbzDqw8lBp34xogmbacpvUPf6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1ILbRNF4qPTsxFALyCeQJJ/c/Um8xQLR/KQeDv+cxFVjLFNE
	d8xZgmn2jQ3yxRqABpBxGj5dMnLFDzYmG9e503tCq74tybgTRiZR7AxKyyXg6vVC4t094kR6UXq
	8AbRaYkZUBO0lmpjg815USU0ePUrhqKz9BWABTey8+Qlasz0C90QELUcryrLrnhA/Ng==
X-Gm-Gg: Acq92OHQFCh92vP1hIlRR06lOTEvUmP556OLuQ+Z67o+yjF2cAp6q7Dm8grxcrD7m2w
	2R/78g94PL+t5DOysB5s19ygi4puRIUr+a5rRu4T8c7ePvXxwAgp8R7EGdXO9bqTUdUgytPvZlb
	yQT9FQYiRKrSFO4Od12rpSRD9tz/2DTYXTnEfLW/vPI7QVoHjx5hes+1PeSt1rFNkfKulZiS40U
	oUgCoG4PD0FM+ukJN3a9uiuesWKgoFLaAytjb2HVFAp/pbXrxuIhnXtsNBwny/gyvxH0X+uJRT/
	UK4RKnSFY/QRa2orlFc5MNy2e7mB7PHFoFOzd1YxhYes3s47+N0EbYe8iC5zBCQtszAZQ+vgSyx
	nbGtRD7BFW7bfPEXNpwlbPsOnMzat93ZfdpuiCiQmsPDh4dTn+D/qIX7Gqhp8iGp8EKzWfv+qW3
	+T2Y71lFjYrJDJECk2acxB1G99BFEpYHEXyoQ=
X-Received: by 2002:a05:6102:80a9:b0:634:92c:bdce with SMTP id ada2fe7eead31-63771e9ed03mr2636546137.12.1778698244835;
        Wed, 13 May 2026 11:50:44 -0700 (PDT)
X-Received: by 2002:a05:6102:80a9:b0:634:92c:bdce with SMTP id ada2fe7eead31-63771e9ed03mr2636391137.12.1778698239614;
        Wed, 13 May 2026 11:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bdd67998sm3106042e87.15.2026.05.13.11.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:50:38 -0700 (PDT)
Date: Wed, 13 May 2026 21:50:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
Message-ID: <c2owdb2hkrbzs55472votyif3bvdo52vfssvownowrlvjwvl3o@3mapgtlrv3fq>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
 <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
 <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
 <ad875fcf-531a-49af-b58e-575185c12d77@oss.qualcomm.com>
 <j5uphbr37xxv5fnmt63g2y2ulykeyovxq2ovw5dxikswrppcqh@vrwmxccsrbjw>
 <b328450e-1bd5-4e3b-83cb-36ab647da657@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b328450e-1bd5-4e3b-83cb-36ab647da657@oss.qualcomm.com>
X-Proofpoint-GUID: WX3_KJENsuaczDPZGGeapHOVzXv_Huvr
X-Proofpoint-ORIG-GUID: WX3_KJENsuaczDPZGGeapHOVzXv_Huvr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfXymlil5ZIl2r5
 gONiXvI3gFlO8mGz9okxelNox1GHA+YjoaMYkbkrpXIsDrKYTvYxK7tiNLt+rPlIOFLa4cORzpH
 1DcYkDgvcTaTMoS6BIMHpSzMjyn5D6Y/EPJQxxRFKJXlMl5QKsZOde35DAGCACrvlolgD8Pow4u
 JLsDZxM5OAYHJ1GZUZ7fcXugXJhfhrkXDi/qsRSxYAeEhvJctP0z2ets1mzS+tmNDt0IeExn/AT
 uGOJRInGmDdlUoezZk8GZIM+daEjjGGe+oDiTXK98ixwtaP5kRDTWZ6w1f5X6Mmd/UZsTPe3cBD
 gSm5DeZT5UsNLKdg3SvBENNL4LPCsDOgG7z32fAedI/uptMMvpmYj0zWAGTXJdMy0SDMuH40tf9
 cwMbhBR7Y88jygHCQucS56Czfz5I0EtCUcVw9HoDh0Bz734huXmrTSqsu7mVR7PJd4Us1wl5upG
 AZORrnsx0QdA8c9KwAg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04c805 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=IRGgeGkn1t_UDbAtBiEA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186
X-Rspamd-Queue-Id: 7CEEE539566
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61499-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:31:55PM +0530, Vikash Garodia wrote:
> 
> On 5/13/2026 9:33 PM, Dmitry Baryshkov wrote:
> > On Wed, May 13, 2026 at 08:00:39PM +0530, Vikash Garodia wrote:
> > > 
> > > 
> > > On 5/13/2026 7:47 PM, Dmitry Baryshkov wrote:
> > > > On Mon, May 11, 2026 at 09:45:01PM +0530, Vishnu Reddy wrote:
> > > > > 
> > > > > On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
> > > > > > On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
> > > > > > > On glymur platform, the iris core shares most properties with the
> > > > > > > iris core on the SM8550 platform. The major difference is that glymur
> > > > > > > integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> > > > > > > one. Add glymur specific platform data, reusing SM8550 definitions
> > > > > > > wherever applicable.
> > > > > > This leave me in confusion. Having two cores, each with its own set of
> > > > > > clocks and pm domains, I'd have expected that each core scales
> > > > > > independently. I.e. if the load is pushed to the core0, it requires
> > > > > > core0 clocks to go higher (while core1 clocks can stay at the low freq).
> > > > > > Or, at least, the clocks would be set to the frequency corresponding to
> > > > > > the max of the workloads (if for some reason the cores should stay in
> > > > > > sync).
> > > > > > 
> > > > > > However, I don't see it in the code. All clocks and all power domains
> > > > > > seem do be scaled using the common workload. If my assumptions were not
> > > > > > correct, please explain it in the commit message.
> > > > > 
> > > > > The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
> > > > > defined in the DT node, where the clock frequency and power rail level are
> > > > > tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
> > > > > independently scaling one clock high while keeping the other low is not
> > > > > straightforward within this OPP framework.
> > > > > 
> > > > > Do you have any suggestion on how best to handle per core independent clock
> > > > > scaling within these constraints?
> > > > 
> > > > This would require more plumbing and driver changes, but:
> > > > 
> > > > 	iris: video-codec@foo {
> > > > 		compatible = "qcom,glymur-iris",
> > > > 		clocks = <only-core-clocks>;
> > > > 		resets = <only-core-resets>;
> > > > 
> > > > 		/* or core@0 */
> > > > 		codec@0 {
> > > > 			clocks, resets, power-domains;
> > > > 			operating-points-v2 = <&iris_opp_table>
> > > > 		};
> > > > 
> > > > 		/* or core@1 */
> > > > 		codec@1 {
> > > > 			clocks, resets, power-domains;
> > > > 			operating-points-v2 = <&iris_opp_table>
> > > > 		};
> > > > 
> > > > 		iris_opp_table: opp-table {
> > > > 			compatible = "operating-points-v2"
> > > > 		};
> > > > 	};
> > > > 
> > > 
> > > clock source "video_cc_mvs0_clk_src" is common for both the cores. It would
> > > not matter if core0 is scaled for a specific workload and core1 is scaled
> > > for different (let say lower), as the common PLL would always generate the
> > > higher of them.
> > > 
> > > Infact, going with the approach of exclusive scaling would be an issue here.
> > > The later core scaling command would bring down/up the corner for other
> > > core, and could lead to under/over-voting.
> > 
> > Are the dividers between mvs0_clk_src and the branch clocks really R/O
> > in the hardware? Can they be scaled to account for the different
> > workloads?
> 
> dividers div ratio is pre-fixed in nature, does not vary with workload.
> Again, you need to look at the source clock, rather than the ones at
> different core. Even if they are scaled differently, either in software or
> hardware (assume for now, hw does), the source would always pick the higher
> of the scaled frequency corner.
> 
> > The commit message should capture the details of the
> > interaction between cores:
> > - Can either of them be turned off, while retaining the other one
> >    running?
> > - Can either of them run at a different frequency than the other one?
> > - etc.
> 
> Lets capture these details in the patch which enables the power sequence for
> the dual core.

Agree, thank you.

> 
> > 
> > > > > 
> > > > > > > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >    drivers/media/platform/qcom/iris/Makefile          |  1 +
> > > > > > >    .../platform/qcom/iris/iris_platform_common.h      |  5 ++
> > > > > > >    .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
> > > > > > >    .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
> > > > > > >    .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
> > > > > > >    drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
> > > > > > >    6 files changed, 223 insertions(+)
> > > > > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

