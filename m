Return-Path: <linux-media+bounces-59170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K05Cdxo5mnBvwEAu9opvQ
	(envelope-from <linux-media+bounces-59170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:56:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D14324DD
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 729153008C34
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BC53A875B;
	Mon, 20 Apr 2026 17:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQw0VTh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZlNzrssz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C297D3A6EE9
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707794; cv=none; b=JxqMfXh6Ljn5vKR7oP40zzi3SgCbMYxHBd3epgVf7xrWnV0G4MjCLHjqN2DxiFh+n2xczTc5BCeL4Gei9Vy5ZxBSdvdn/u7uynpHA0gtQaSJTrwc3fXK3KDCnJM75j4hTZcF7nrP9JkfWjLkvuBY8Gp1eXaAUpCQJ3l22OyUdrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707794; c=relaxed/simple;
	bh=XXXUz3CS56m7m4/m9kSl9rGSBa3muR6RPy0opFLSn2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M22Tn3XoiBdqo3Nvmtt7xj/GCHA5DTQksTk3Wu7MLw5z73VT8tiXH6E8QmfZcliCiUM6txHvuNGPIX4TnL96awNHo8FGxm6eyXxBZnJGfqdHAyrR0FFXwsbIqpsMrod8/yc9g1fV42wED2wzclcnPPH4MgQWIWpH1izxvXqmJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQw0VTh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZlNzrssz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KD4gRx3455442
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 17:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vU+va+DrVJGvGnK1Re3NUtvK
	u7bOBZBRLYYb8Lhqnvw=; b=cQw0VTh+8n9dnGSqzrqkP9dt2DoeByY5ET9gux20
	mKtVyRXG1V7WjUaQ2JyYmY3b4RSPStjsJAtgvf1DNPBBcAMgoLHU+yvD1lhNWj3v
	w/G732V7uGsyeNuUIxMwmsmgbx1zU7DvM2sKMBvx+6CeWbyInBJvHCwgdlpoCN/n
	JzA4yL/BMoS4DGkHvEA44EzB29iph09mH0YLO69QqxuZvNLk6005zu/ZBUb6+rJT
	Ww4sV7L3Y9VKIm2Ev0R8nu+qu83ijnHN8BXZZ7L2poVNKm7H2FYmO/HRFKd3JSAN
	VDXSoviDP5Yxq6Ftz1te6AhLBio+aT7FoxuIydcnuB5UFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjth28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 17:56:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso116042611cf.0
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 10:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707790; x=1777312590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vU+va+DrVJGvGnK1Re3NUtvKu7bOBZBRLYYb8Lhqnvw=;
        b=ZlNzrssznOxuLUgfSXCtKKqY/sQKT5GqIw3w78m2jnx2kZ/OCGRc/m0tZ7/VzOE98B
         eCRyyARc/Mq/WRPt5bEdFBQ74t2LYML5trjuChF5YxqkNiQkhTlLk+1GKDnDtRZ1grWq
         8X13Pl0SbFedgackU+bTRaHrbrc3z4iJqVd95wLwEVqiAjLleTkKL7Q52RJ5YlOVw6IL
         mLZBXO/9dgjcuHNRwrUTWmxi7DTYbb/OBCRdoFR+7LNAUnJVLhGL6h1czZiJsZ5K5Sk5
         XNNG5gARHyRPiTh8oNvyD/HJyqjxbW2eFQqbNl7+WyC2z/AC8GiVyvh6qe2qb3dcJ+tR
         hMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707790; x=1777312590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU+va+DrVJGvGnK1Re3NUtvKu7bOBZBRLYYb8Lhqnvw=;
        b=MZV3b0Sa/qvwso6pF9lxBLCcGwkBpQbYOmsLCdzzDBpEsrCyT7pu9Mvv75OqtSEMKX
         EFNIHwZVYWVJKl5/26uJGmcPLEr4DYoSvAp3AMEXV5le2LyftE01122/MS/OuuEFyUwu
         O0+bfHuwsFZzCtfCRhH/yNmDIXJYpd3o/bkP6moN1fQc5S3f4/GW0fZghVS+7fjx7SLN
         ztCUkVYd+T3yU4/FSOlCDccs0ElMeUe9DFlDeUN57bgc+Noay2va1j6v92GO/BZGhLsQ
         wIv2noSJVnncf+fNCAO/soecwkGaYk6gF/yPgeTjg11CL64rvIBQOLKTtJFNVsknn3b/
         1uZg==
X-Forwarded-Encrypted: i=1; AFNElJ8KtMCurtc3Y85pzb9dRVk57YkLK1wEwGXU5ZXWhf49zsAr9CshATdF1UX5/HGABOTtPXgK5l+jye3bNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxawjomYf7q3ZaiAZhS7oekevkm5FxAlHbd/POFAT0Ybbwz0ciJ
	PDR7lelJjJfDIGYVLZCL4WHU9YN8iI3vBLUmh+2J353DMiMPqJ5j6JKgSJUyr8i/Vag5aMP+ceX
	n9vKiiAOIr3X1XQrM74aXXKPdLJzr2I5cgwpYss1BiPFtYy26io+lJVTzIQ1yOq0oYA==
X-Gm-Gg: AeBDietHqG5ELiIOOV0AzBvgot2l2BKu9ajLDGeg73VWb9kgB3wKrjnEXoUyyFmFya9
	MjclI6WVGAvG6486HXEfM+fJ/3n6RNchNyhtNyKWTuO/5wYRowiCCm7Cch0w6U9UGzGem1XjmQ6
	EEmoqM4qfl9CHmuRClxqvEaGedftKq+K1ZfZKeBG7kmmfRjn9yx1TJDYL7qP8TgtKF9mNaOQ47o
	pkEx9lU9dg88ZkkxuY3Ld68u72xxkUl8yvfWWIwM5IWLCvQlW7cNI0Zd0rmvLm0pPVcL77J3rjH
	V6SQmLhY6e7Ua1WjpuNgohzPj/RoWnc2pD+waewA5mRePdkb7u3UhjWxmfut3O8OaXShIJqr7c8
	JJMSAZP2tNlYoshfCNozYVOzpz+PGCUtDvzPOuvv6rzD1JT1keoKx3Dy8k0hblhCqq5Bbs5O2DT
	fbuttEfgwD84UHh31oxDrX72cZTh+ONabbRO0lbXAjZB665Q==
X-Received: by 2002:a05:622a:1dcb:b0:50d:9b2e:7ee3 with SMTP id d75a77b69052e-50e36c18fe5mr221246981cf.38.1776707789940;
        Mon, 20 Apr 2026 10:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcb:b0:50d:9b2e:7ee3 with SMTP id d75a77b69052e-50e36c18fe5mr221246181cf.38.1776707789354;
        Mon, 20 Apr 2026 10:56:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a5241f6583sm775615e87.39.2026.04.20.10.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:56:28 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:56:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
Message-ID: <blkye2p4ojm6y2674pq5pmpxhufrqw3tdyqf7yugfc5jxi4hyu@hyehk75fnefc>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
 <eqxeib5ci42ox4o7l45yjwgsjwjyhekojiigpxj6s5npjw5cwq@ggbtohqh3pip>
 <5dee6da0-9170-d9e0-5ff7-f8436331c6a9@oss.qualcomm.com>
 <26b71f52-3355-d4e9-f640-007123e3aba2@oss.qualcomm.com>
 <7bnl34zyexz4z54fmz6ymax7izfey6nyp7lenhvfp3hkfmhdia@lssovgsnas72>
 <1f73fad2-1d53-dd35-2668-750eaf3fe00e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f73fad2-1d53-dd35-2668-750eaf3fe00e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ky10YBnWGAZ6nLyCvKIY8Puw-VH3zKwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3NCBTYWx0ZWRfXy5qUaIPH82C5
 rOd26vCNFBjfakXtNFXRogDuYnjMrHeIQWSXaOa19Tzz/+q+V7toB/nnn6ZI0iAL9VPj2G4YzBY
 rntKZ53A7iiNowBYByl/pd6RroAG4633A9upfO7ScbaZHzXAAYWVnC07+KUiXGmfs7SfgZ9Ba3b
 UUp0xAvP+pukW7DaqSYoErhqKyiHIGLb07EeWdy0gI+J3fi12y+9cP1BsHHINjcd9P4s77RWuJR
 shOBEAKZGmjegVlfMMm/7D6OMkjs5Ngoo3p9gSCEfi3DyYJWANeYwJbpyX8aZYmCQcGNCe07Xrg
 myXUA4L/nAnXbFFK/2gZon8DZ4l4TScNueVPAKAUXlbdc8Koi7MNgAkYYpXp5fS17r/r7RRzIUF
 pD9ohlkMR/O9Sb4588rE+9L0lupfZ4KNNdJuVJOZKyYDQ94avANaT4+WCjOFYjn2VhR+tM4cGVu
 /bEm14AcHEDQUna1EJg==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e668ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wO3C73Ume8EFaJWdbmMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ky10YBnWGAZ6nLyCvKIY8Puw-VH3zKwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200174
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59170-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA3D14324DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 07:32:23PM +0530, Vishnu Reddy wrote:
> 
> On 4/17/2026 11:49 PM, Dmitry Baryshkov wrote:
> > On Fri, Apr 17, 2026 at 08:29:21PM +0530, Vishnu Reddy wrote:
> >> apologies for re-sending (earlier responses was rejected due to HTML format)
> > Ugh.
> >
> >> On 4/17/2026 8:22 PM, Vishnu Reddy wrote:
> >>> On 4/14/2026 8:44 PM, Dmitry Baryshkov wrote:
> >>>> On Tue, Apr 14, 2026 at 10:29:58AM +0530, Vishnu Reddy wrote:
> >>>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> >>>>>
> >>>>> Add a dedicated iris VPU bus type and register it into the iommu_buses
> >>>>> list. Iris devices require their own bus so that each device can run its
> >>>>> own dma_configure() logic.
> >>>> This really tells nothing, unless one has full context about the Iris
> >>>> needs. Start by describing the issue (that the device needs to have
> >>>> multiple devices talking to describe IOMMUs / VAs for several hardware
> >>>> functions), then continue by describing what is needed from the IOMMU
> >>>> subsys.
> >>> This series handles firmware device which do not require multiple
> >>> devices part.
> >>> given this device need for specific IOMMU configuration, I'll update the
> >>> description
> >>> accordingly.
> >>>
> >>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> >>>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> >>>>> ---
> >>>>>   drivers/iommu/iommu.c                           |  4 ++++
> >>>>>   drivers/media/platform/qcom/iris/Makefile       |  4 ++++
> >>>>>   drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
> >>>>>   include/linux/iris_vpu_bus.h                    | 13 ++++++++++
> >>>> How are you supposed to merge this? Through IOMMU tree? Through venus
> >>>> tree? Can we add one single bus to the IOMMU code and use it for Iris,
> >>>> Venus, FastRPC, host1x and all other device drivers which require
> >>>> per-device DMA configuration?
> >>> Separating out the bus definition and the Iris driver handling would
> >>> provide a
> >>> cleaner merge path.
> > Then why wasn't it done from the ground up?
> >
> >>>> Your colleagues from the FastRPC team posted a very similar code few
> >>>> weeks ago and got exactly the same feedback. Is there a reason why your
> >>>> teams don't sync on the IOMMU parts at all?
> >>> I would admit that I missed to review that, thank you for bringing that
> >>> discussion.
> >>> FastRPC patches generalizes the handling for host1x, FastRPC and the
> >>> same can be
> >>> extended for Iris. I have left few comments there.
> >>>
> >>>>>   4 files changed, 53 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> >>>>> index 61c12ba78206..d8ed6ef70ecd 100644
> >>>>> --- a/drivers/iommu/iommu.c
> >>>>> +++ b/drivers/iommu/iommu.c
> >>>>> @@ -13,6 +13,7 @@
> >>>>>   #include <linux/bug.h>
> >>>>>   #include <linux/types.h>
> >>>>>   #include <linux/init.h>
> >>>>> +#include <linux/iris_vpu_bus.h>
> >>>>>   #include <linux/export.h>
> >>>>>   #include <linux/slab.h>
> >>>>>   #include <linux/errno.h>
> >>>>> @@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
> >>>>>   #ifdef CONFIG_CDX_BUS
> >>>>>   	&cdx_bus_type,
> >>>>>   #endif
> >>>>> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> >>>>> +	&iris_vpu_bus_type,
> >>>>> +#endif
> >>>>>   };
> >>>>>   /*
> >>>>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> >>>>> index 2abbd3aeb4af..6f4052b98491 100644
> >>>>> --- a/drivers/media/platform/qcom/iris/Makefile
> >>>>> +++ b/drivers/media/platform/qcom/iris/Makefile
> >>>>> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
> >>>>>   endif
> >>>>>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> >>>>> +
> >>>>> +ifdef CONFIG_VIDEO_QCOM_IRIS
> >>>>> +obj-y += iris_vpu_bus.o
> >>>>> +endif
> >>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> >>>>> new file mode 100644
> >>>>> index 000000000000..b51bb4b82b0e
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> >>>>> @@ -0,0 +1,32 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>>> +/*
> >>>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> >>>>> + */
> >>>>> +
> >>>>> +#include <linux/device.h>
> >>>>> +#include <linux/of_device.h>
> >>>>> +
> >>>>> +#include "iris_platform_common.h"
> >>>>> +
> >>>>> +static int iris_vpu_bus_dma_configure(struct device *dev)
> >>>>> +{
> >>>>> +	const u32 *f_id = dev_get_drvdata(dev);
> >>>>> +
> >>>>> +	if (!f_id)
> >>>>> +		return -ENODEV;
> >>>>> +
> >>>>> +	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);
> >>>> I think it was discussed that this is not enough. Some of devices need
> >>>> multiple function IDs.
> >>> In this glymur series we are following the legacy way of handling IOMMUs
> >>> and does not
> >>> require multi map.
> > Why can't we land the version that has multiple entries? It's as if the
> > teams are totally not in sync. The corresponding version is in works, it
> > has been implemented, etc.
> The main idea is to introduce firmware stream ID with iommu-map, while keeping the
> other stream IDs described in legacy iommus way.
> or, are you suggesting that, going forward, we should have VPU stream IDs described
> _only_ with iommu-map for any new dts/bindings?

I thought it was the plan, to keep only one (or zero?) IOMMU stream in
iommus and move the rest to iommu-map.

> 
> Thanks,
> Vishnu Reddy.
> 

-- 
With best wishes
Dmitry

