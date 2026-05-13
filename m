Return-Path: <linux-media+bounces-61449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KehCJmFBGrVKwIAu9opvQ
	(envelope-from <linux-media+bounces-61449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:07:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E7A534B14
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28A8730C24CA
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283073F4110;
	Wed, 13 May 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maIKG54s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/H5B11n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B83F4111
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679740; cv=none; b=Dj8FrMonBqAjv0DLQV+n6pztNtwYBSSXeu6C2F2TiLpjz5Hc4ChOj8RHC+6XOy1Amcy8nGkLULfE2JRmzvtl9YdJUz/qyJLBOsTUKU4lhEzlegx5T4DsM1JTu3aDgUTm5EaA46F9F5gc0OcapvUFArh/mqndMDaqMaGrYK7i3Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679740; c=relaxed/simple;
	bh=zZKNBlC8xilBW7h5Xy5kH5FOhafB6+ZvGZEGuX6Tsjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP2mBwyok8q5Dse8JgtM8PlXx+DTzyfurvs8ExZ7PSyTii0H7GQ+IFwGGjHknVWhgQgxl5SXo0sXWz1HkyQ59AkfTXeL51+/Yvs/9W0ZxJm2mEt7rR7zRWfsalsZPIYTtKr2JChGvUArPPn8HYHqEdWd4dmGRiiERwJUp3YYdtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maIKG54s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/H5B11n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wshh4159821
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wRAyE1rvzIaDWQ+RxvchnyD8
	UR33n1c7hVtXAq/JTAQ=; b=maIKG54sAD9m+ygC9YpZq4eqrJ9UIq8zWmV4FF7e
	YTe9yf6VndLIYCvpjSwSu3NbVUKOCv/IgHa5jzdOl3B9xRmfiPEQ7B+0WogFcfEE
	xxU4VF+MJd8P9Zlpl/tzlLFj5fba38LYdkPlCxsX3aZDpJD3Dq6cVmuh+ADl2wpG
	zKT6cpTrQn2uzYeAYbdwfQIAxXYBfxiM+MRMKhK9gBObXva8Dn1Q4i575hjFCzQg
	9nmUeW5DK06BAbeWQwB6nN5I8LDuOo1J6r5OvF0rH1NgrYnydoErj5bFvPETgStE
	ffIiMxIJ5S3jyetoO5i5E07yx0RMrgmGHKbKerwX78TH6w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s1cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:42:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63209622b03so1950679137.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679737; x=1779284537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wRAyE1rvzIaDWQ+RxvchnyD8UR33n1c7hVtXAq/JTAQ=;
        b=K/H5B11n+bV7pYd8W0xwFQhfbMcCMKjh2d2K+Pp4qNtMgi/fJLj7EQPP1Ar5/ITHPd
         hImSVP1HQPi/RhB0O+RgEgNpJrZaauLw20Nfcp38I9W8pRhQOIAK9e8KqJ5k+e++nK7c
         pdlo9KWHlx/nXcqy9ZchIaerXOQi3RQDqZo81dis8hSQdUo/gfgUZFOztzNezWkV868D
         RNXVWr6fyWzuEtwgFVAY1vO4ke6NdJQ5Hji8ulEu6CQ97RMbui30MtFIaG1mS0Wiffjl
         NZI/RuixxfNJN30o/7UxG+XFKIYK/UgDmQJMxHVtPbw9meIUF6GO2vjd60izZo1h+8Pd
         IwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679737; x=1779284537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRAyE1rvzIaDWQ+RxvchnyD8UR33n1c7hVtXAq/JTAQ=;
        b=RjoWtMwm2sa30ofWEAzTOGII90InYUn+8Tvfgs/05JqPC+C/QZ+YRwHjQ4xxrZRlXq
         ITPb6G9//PBUpzSyrImL0+JIC4XpeBBLy9ApxbbFbbHCrEZoeC4dBx9TfXy6dQpEvetg
         7+v5kE+5M0esY0YX71yBOaUjDp7ma2pRt69QgMdPnbqBXwbxEKcXotS0ZHzUbXwEk2DW
         66OLfRO/ktnP9iCqn/N9sGfGdFm7pSZ9Wg8rpb+TzFG8+GvVrUp4Lt+b61Mn+cQMrTEN
         NhXmxdFLL73+6x0uKn5TNsIoy5LjlKn2RNea+OGSiBImt9V25pDp72QHom3VmaTNGjIe
         ianA==
X-Forwarded-Encrypted: i=1; AFNElJ98isJpDSrP+GL4dTFLX4zJU1lYAhX9jbQ2HrlCa32RWEVx8eRfPRowh9XenrqnGX5Km15luSWMzF3S9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RIOlfT09xCl4nTUEXDgRwSEXLkQYMjubA/vkgORYEf0OTXnI
	6p1ChWwunpn4/Z/ImDCW1b5DfNpXS7Uob7eW5zaO3rBqRAdLRzTNFYk6v8hrx3Y4v2HQA4wGFDD
	XUHqq7DQrufTF2Dh3G6jZUs0ouHUyRAVX0XuaEB+COWpxwHO+O7B30s4cRYK8UIgJ+g==
X-Gm-Gg: Acq92OFrUsv0t5margGq40TQk7MddtcKOCYALyoKx5P+XAhTLnQv12D9gJCojieIvS9
	wzNNB+qxnM/888qqJSdy1epbtNMo2cWBVECmKHM2L4FJmVoS8bXaKTLFfV0DS4qSC4ri/WeFMIX
	pcrfVAyZ/lhQMq1aYLrQp+4OfxSqWq7I54PQYfcUBF93Yge7L+/DQSrPfxVgDjRovxOWclOnAM2
	DmPyGztb2I9bsGdG1kbOtKHMYOeRgZKZIXh6Xo3FCor3CBENlGpiyGg0mI111joqgRuD9aBMwpO
	QcTTMIg1ZRKnf7XX7WvCeTKj3hR5wOl9wpSv9ADsEs4fabBLG/Sh8vmlunYVdZaikTplVMaoh8o
	puxf/s/rNRqJpVEUbGy2LFElxV850G72wE9PZspldjd9mi4zUfs0Ok5Vr8kUb/ODUZugXq2WEdg
	2qLxNRZFnAw7hnKqZwCup/2puDGxQiUvMe0PM=
X-Received: by 2002:a05:6102:5346:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-637a6f3af24mr1123881137.6.1778679737095;
        Wed, 13 May 2026 06:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-637a6f3af24mr1123853137.6.1778679736046;
        Wed, 13 May 2026 06:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956642dsm3976983e87.71.2026.05.13.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:42:14 -0700 (PDT)
Date: Wed, 13 May 2026 16:42:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <zaq7evuw6la6p6zcv5zgv2nuehc6yxt6xxojjdd2rdflxtk73e@wr2w2kbxamv7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
 <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: mF2GhMDuSs48g0fje0sd_TSPGE0mn4zF
X-Proofpoint-GUID: mF2GhMDuSs48g0fje0sd_TSPGE0mn4zF
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a047fba cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4BjjeKLzrOWpEDKIceIA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX037Fb4u6Iw3o
 j0cbF1Ipe1sjOLTdzxto8N0ZIPGglkl6hP3TMp+b0tTLfkbPkWTtqzRKgJEMirkWLkxkh4/7jwb
 ka/NqjekLExRePRrJTcsXXIt5gmaymBoaSi5WoE9F1elBwCKxcpWzPMtvNV3sf+ZroZRs7Qy6Se
 6howF/i9fj2EU/iORBEdpq30HQDE96awF9KsMotg5Cy/Z+tsWfQdg3PFafj6TeNAOjqKfBSN1F1
 g0dJ58sEok9/14xvfbHz74y5LzCMI6UVqhUngyXEuV9w1z5pSsUEKOonYsymt8NxW3Lns+0OrJc
 SZnUb42gL0bI3wRmm/wxIUDA2R6726FqZM2LTuEgFk68DCNLv7+cUatpeNVP8+0aCv+4HlpR1xV
 RfWseeB0UJC+zxKalfoSoHZdKcUmHDnn/CrOWv8ct66hIz9JMut4rhbHNCK8eM91Vsid5Tfl2qB
 dgvGbJzK+2XmiYIKtXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130141
X-Rspamd-Queue-Id: F2E7A534B14
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-61449-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 01:31:04PM +0530, Mukesh Ojha wrote:
> On Fri, May 08, 2026 at 11:20:06PM +0300, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> > > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > 
> > > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > > or QHEE), which typically handles IOMMU configuration. This includes
> > > mapping memory regions and device memory resources for remote processors
> > > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> > 
> > No the calls to those functions are not intercepted. Doesn't hypervisor
> > simply implement the SCM calls?
> 
> All the SMC calls are intercepted whenever Gunyah or QHEE hypervisor is present
> and in most of the case the preparational work for the TZ like in case of
> qcom_scm_pas_auth_and_reset() it does create/register SHMbridge over PIL memory
> so that the TZ can access the memory and then calls same SMC call to TZ for
> authentication and once done it comes back does mapping the PIL region
> and call bring up sequence of the co-processor.

I see, thanks for the explanation.

> 
>     SMC  SHM setup    SMC (auth)        map memory/resource and trigger reset sequence
> HLOS ==> Gunyah(QHEE)   ==> TZ    ==>    Gunyah(QHEE)        === ==>      IRIS 
> 
> 
> > 
> > > later removed during teardown. Additionally, SHM bridge setup is required
> > > to enable memory protection for both remoteproc metadata and its memory
> > > regions.
> > > 
> > > When the hypervisor is absent, the operating system must perform these
> > > configurations instead.
> > > 
> > > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > > is now in place. Extend the Iris driver to enable this functionality on
> > > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> > 
> > I fail to identify, which changes correspond to this description. If
> > it's about the PAS context creation, could you please be more specific?
> 
> I think, commit text is trying to tell the Infra to support any Secure PIL when IOMMU is
> managed by Linux at EL2 and the dependency related to SHM set up in Linux are done as
> part of [1] are in upstream.

Ok... I'd say, this part of the commit message might need some
polishing, but I can't give an exact advice here.

> 
> [1]
> https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> 
> > 
> > > 
> > > Additionally, the Iris driver must map the firmware and its required
> > > resources to the firmware SID, which is now specified via iommu-map in
> > > the device tree.
> > 
> > Why? You miss the most important part here.
> 
> Sorry, I did not get.. are you looking for explaination here, why via iommu-map in
> commit text ?

Yes. Why are you using iommu-map instead of listing it in the main
iommus entry?

> 
> > 
> > > 
> > > Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > ---
> > >  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
> > >  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
> > >  2 files changed, 66 insertions(+), 10 deletions(-)
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> -Mukesh Ojha

-- 
With best wishes
Dmitry

