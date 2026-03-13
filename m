Return-Path: <linux-media+bounces-55770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKlYC/lktGngnAAAu9opvQ
	(envelope-from <linux-media+bounces-55770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:26:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 965DC28948E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC814305D6FB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D027F3DE424;
	Fri, 13 Mar 2026 19:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2MEXNLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OC4Yw/wM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF143B5820
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773429991; cv=none; b=aJUuVqyIOfVQQQB+REYAEPFMWNpEtEKy2ScQISygDGO4cJjJjr7W6WbXBHDH+hP94/3Dp7zMNaGTyfG/2dIkc+NsE+JoSyOZ2+o1XPjAJGlb461HMi0ojlbZsy/xeT93E/FfF6A956dwzwm+LglM94nd4GVDqJ41p8Tj6wYn51c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773429991; c=relaxed/simple;
	bh=8qklSwhkzcL2i0FUcmPEuAOaEBNcOlNKtMbVnRnlnh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kn3kdqXYRcrb1OEzBU8dEqm+8aIWfE118binfu4kIqHNWn7vrbFNnx1FjELWt7iSJAVmBfcUJD72dUzB/GwvS+98x9RY2DvFKHe488yXngEFNnnrD3gysWBC5w6NcflZlAqDnYC1EcJm6T34gicVhnHCWMIz+WQcNmqEFEqEHw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2MEXNLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OC4Yw/wM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DD8ohZ793568
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gu4i8EY5jRW+kuyiSAZMPIOl
	Ib5K+fyqNexYKEDD+ZM=; b=L2MEXNLpL8yi4Fm0iGveqBBoZ/ddtzANVo4reVIZ
	N055goNW9gTp6ccKvM3PchEEs9Pp4Qo52iFrP2k0zCX3dEhmaNmF/A+HUqtZZF3x
	7cfxcrkD3JO5Q+X1hHVJ6BgsWkgEgKrEHaOX3AixdOcZTev2pDCTsBulXHtphaTW
	8RDmRuhhE0fv4MgBw9qXNb0GnVdAK7ECf3yV4X4P0/BoLGQ86hixHa0EXWn4WDTb
	p9YYgJM5ijne0+gkHGtoZXnCJwEpZSqR+bZHuLaVLqrmm58PM3NUVAT66qb2P8Q8
	mhFnTVdH37UuIrPEu3tgSFMgHrhL4/av1lOaYW1jmJ8o+g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt2kth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:26:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94eb3712aa7so21318949241.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773429988; x=1774034788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu4i8EY5jRW+kuyiSAZMPIOlIb5K+fyqNexYKEDD+ZM=;
        b=OC4Yw/wMWL5qGg8iks0Gtl8hlsdDSTwMycf1AYB2VsPbxtFPWBg6XG3N9zX4DO7H3v
         kS/pvk+yUPS9BsjNu9WnhcSsgeKBxlHdPkGaeNmR78SOEWCqSBto+njxKjcthbmMh5vn
         tPxxp24Q53mGz6/I9XJCTocHz2cB+KKgoRS1S4b2PYegSq+hOrGJS99r+AbYLg0L7ime
         cFuvwSXEPpIHnNdd1uu4YljJXznpzPPHZiDsvorii+SGMEXDT1usc3WJAALC9fMK1zaN
         eZ9O/XbBsKyzgQXAh9hiZZQQ6DklqPxanb+/zn61Ssw52HVIMmomTayzRnE7gna35x+H
         GRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773429988; x=1774034788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gu4i8EY5jRW+kuyiSAZMPIOlIb5K+fyqNexYKEDD+ZM=;
        b=kc92ecaz7TnjOWfOVS4HGAQfXzoyTiPDnMVbPES+Ytr9LFXROI1PvjWsC9cCo/NMsF
         u8q0vWjiP/1dylflGiDX7QljxDdqgoYbhFnW5QmZkW+cxOEJQ2LG2KpW3D9T+WNRb5bL
         TVOMVQKIzIjQo55EPA1tGb6mCCL5Bf6cD3nl+IboH6P5i3O7DvJbV8KfT325ZjlBh8Zv
         KRPHHHDUQW9/R0KK4NfZemrfvLdTpJoIFfC4vNIr7sEIzh2v+7JhxREc5yKBQgNmwtsh
         bNKKz9qLbO0f3ivwW01pVYWEZwfjxg8LzHoUDD6f5MFWq1nNM31pmSHvDqDiHddrIP6f
         9Rhw==
X-Forwarded-Encrypted: i=1; AJvYcCXrNGrSrR1eejLKr+p9ilmoLGhmECpwMVZ2W7wKOchLs/IyDPZpZtnysFsJAkuFUKLLhp97PX/6zENw1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdx5Z/bbBQzgEiYC9dS4yvC30cVsypjmqe8sgPaC3HSg/scMYU
	2yIq6ZHoI0AXUiNGuOmoo/UV4Q+QBijvCv+yj4PuHPfg8JVLDTUvIdv5MP79OIAt9nJoeg6KbuN
	rK2VcK7QYHtwoUHKZDkTmYqhjoWQav/sdIPzDEw1WNyueNs+19OMgM5WDPxGzV+0kNA==
X-Gm-Gg: ATEYQzz+IMBWKnsO/29GhyllAfBmuLd8c5BsXrn965Pius7+pq1RMl2B1Zkegt9gWdN
	2obAtD7V3sXACcQHnp5dw7FYopsv0zAuOeit6FV7yaO0PtY8efpy00wviRjosAuwJxqXYrnFoNE
	8kATX8Q0z2s/IXwGiNnMH0kgoqg8FKT2zY5hZncVfnLj1ZzJ1WxenQ6snSdvI4a77Jf7RxdMfWL
	rx2WmxPZ0FsX7j5zOZKK+TvsWg7qw/Bn1nvF9KsuBbNFFJGmTPjqRbCzGQWEQakdITiOlabhev1
	AtbU6ORG/u3lE72EHefchiBWx//SMMTFgfs1Kgnxs3XCUeqNG0scwmFCWAdyFCthtPLmf7qg63U
	G0yuPBiZfEGPW8radrIMtUX27EWu3xf5h//3AAZsJwcQhcGoAmrdNEufzVHlijkoFNC1FEY+d7T
	mHxeBha0H6MnZJgAiYzjx6zrokblMqBMjkEEg=
X-Received: by 2002:a05:6102:442c:b0:5ff:b684:f7c5 with SMTP id ada2fe7eead31-6020e209c34mr2211711137.8.1773429988024;
        Fri, 13 Mar 2026 12:26:28 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:5ff:b684:f7c5 with SMTP id ada2fe7eead31-6020e209c34mr2211704137.8.1773429987480;
        Fri, 13 Mar 2026 12:26:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm15780241fa.9.2026.03.13.12.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:26:26 -0700 (PDT)
Date: Fri, 13 Mar 2026 21:26:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 4/7] media: iris: add context bank devices using
 iommu-map
Message-ID: <yohjrtv6tkqy7ezcfeheoddsap2r2rmvp52fbpiyxvei3t7g3q@c6xdashllwom>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-4-850043ac3933@oss.qualcomm.com>
 <rzi7qmzsofocwcqxhsqz3f3tl4ahqnwn34of6qcc54odpben5d@7okuqabxgdqh>
 <e12da06d-cad5-4967-af07-64c7c6e540f4@oss.qualcomm.com>
 <vi5v5bczg2wx2adfpr6ppqcad76oecitoyc7zd2i4lahla4buw@mqnppboxcyrs>
 <6553cfcb-9399-4d17-a529-b07b421ed7e8@oss.qualcomm.com>
 <mqyg7cebyahkrngvnxcrenkdd3dybpnkecago4lqonfwqzize7@yawbtcsli3vi>
 <1d2b55d9-42e3-4459-971b-e276a87fb843@oss.qualcomm.com>
 <7wvdcjajf7ro3c4y7jq6tmbxfg7kfvdpmyfzqm4vgjw5wly4zu@jcjqudf7vrgd>
 <9d5aab4c-86be-46cb-8c2c-154f87e3eeba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d5aab4c-86be-46cb-8c2c-154f87e3eeba@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b464e5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=keo7-XgEt2IHayEatcwA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 3v3eH7iUT1aOkb_Z_H8m5L1g9YEP8lgg
X-Proofpoint-ORIG-GUID: 3v3eH7iUT1aOkb_Z_H8m5L1g9YEP8lgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NCBTYWx0ZWRfXwSq1yhhAybtc
 SdQiiGIQoN7y/0Jjx+fJvYQOleHhV67FSisQGgThro9bEpPPgbsDeqrxDp2VokAE2RAB7SHnVis
 jRL+sJqbEsh/5ZWaUls0z8RscVsoH4DFlDxz3KjU5BOM+UYyx5d9s6tOGo0pUcwFGaNgLwwLOxx
 O0B2OgalO5ZHRr8vaBpbiUPcgWVTsP7gLhYjNah4TUum70FSbLFAco2SOcKl9iaEequJucyKX7K
 3LjPj7ESibFFgrACfBAGClosZ6U/9qUxtdbQjwfsG5nTbbHbye0Za8oebaL9AWM3+kRFplnAj1O
 suK2BIvx/eErBFBUxY8EWJmvsjXfp1BTYVYzg6UNggR6LZx3dcreKNBkX6eNMKzePxK6oPWsE1D
 Il9JVowc2srNx7ygv4nfNA5juj302tgr8u2OEuXVAq5Z11KQGlLnI+6iEgoBxKMP9VANK3cyF9x
 /leoNrmYIeC5/6WIluQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130154
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55770-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 965DC28948E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 06, 2026 at 03:04:04AM +0530, Vikash Garodia wrote:
> 
> On 3/6/2026 12:02 AM, Dmitry Baryshkov wrote:
> > On Thu, Mar 05, 2026 at 10:56:40PM +0530, Vikash Garodia wrote:
> > > 
> > > On 3/5/2026 7:51 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Mar 05, 2026 at 06:19:52PM +0530, Vikash Garodia wrote:
> > > > > 
> > > > > On 3/4/2026 3:55 AM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Mar 04, 2026 at 12:16:50AM +0530, Vikash Garodia wrote:
> > > > > > > 
> > > > > > > On 2/28/2026 1:50 AM, Dmitry Baryshkov wrote:
> > > > > > > > On Fri, Feb 27, 2026 at 07:41:20PM +0530, Vikash Garodia wrote:
> > > > > > > > > Introduce different context banks(CB) and the associated buffer region.
> > > > > > > > > Different stream IDs from VPU would be associated to one of these CB.
> > > > > > > > > Multiple CBs are needed to increase the IOVA for the video usecases like
> > > > > > > > > higher concurrent sessions.
> > > > > > > > > 
> > > > > > > > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > > > > > ---
> > > > > > > > >      .../platform/qcom/iris/iris_platform_common.h      | 18 +++++++
> > > > > > > > >      drivers/media/platform/qcom/iris/iris_probe.c      | 60 ++++++++++++++++++++--
> > > > > > > > >      drivers/media/platform/qcom/iris/iris_resources.c  | 36 +++++++++++++
> > > > > > > > >      drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
> > > > > > > > >      4 files changed, 111 insertions(+), 4 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > > > > > index 5a489917580eb10022fdcb52f7321a915e8b239d..03c50d6e54853fca34d7d32f65d09eb80945fcdd 100644
> > > > > > > > > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > > > > > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > > > > > @@ -204,6 +204,22 @@ struct icc_vote_data {
> > > > > > > > >      	u32 fps;
> > > > > > > > >      };
> > > > > > > > > +enum iris_buffer_region {
> > > > > > > > > +	IRIS_BITSTREAM_REGION		= BIT(0),
> > > > > > > > > +	IRIS_NON_PIXEL_REGION		= BIT(1),
> > > > > > > > > +	IRIS_PIXEL_REGION		= BIT(2),
> > > > > > > > > +	IRIS_SECURE_BITSTREAM_REGION	= BIT(3),
> > > > > > > > > +	IRIS_SECURE_NON_PIXEL_REGION	= BIT(4),
> > > > > > > > > +	IRIS_SECURE_PIXEL_REGION	= BIT(5),
> > > > > > > > 
> > > > > > > > Can a context bank belong to multiple regions at the same time?
> > > > > > > 
> > > > > > > yes, they would.
> > > > > > 
> > > > > > How? Each set of CBs is defined by a separate function in the DT. How
> > > > > > can CB belong to multiple regions? Could you please provide an example?
> > > > > 
> > > > > SM8550 would have same stream id for VPU hardwares (tensilica and vcodec)
> > > > > accessing bitstream and non pixel regions. Thereby non_pixel and bitstream
> > > > > regions would map to one CB.
> > > > 
> > > > In my opinion it means only one thing: you will have two CBs (one for
> > > > non_pixel and one for bitstream) having the same SIDs. An alternative
> > > > would be to define fallback rules (if CB foo doesn't exist, use CB bar).
> > > > 
> > > > > While kaanapali would have different stream id for tensilica accessing non
> > > > > pixel region and vcodec accessing bitstream region, thereby having different
> > > > > CB.
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct iris_context_bank {
> > > > > > > > > +	struct device *dev;
> > > > > > > > 
> > > > > > > > Separate data and the actual device. Define a wrapper around struct
> > > > > > > > device for the actual runtime usage.
> > > > > > > 
> > > > > > > we still have to store the list of dynamically created device. Name can be
> > > > > > > used to fetch the device from the list, i think the existing approach is
> > > > > > > simpler ?
> > > > > > 
> > > > > > You don't need a list. You have an array of the size, which is known and
> > > > > > fixed. You have at most 9 functions, which means less than 9 devices.
> > > > > > 
> > > > > 
> > > > > as mentioned above, its not the same for all platforms to have one to one
> > > > > mapping between CBs and buffer region. Thereby indexing based on array would
> > > > > be an issue here
> > > > > It would end up something like this, considering [dev region] array,
> > > > > 
> > > > > SM8550
> > > > > non_pixel_device  non_pixel_region
> > > > > non_pixel_device  bitstream_region
> > > > > pixel_device      pixel_region
> > > > > 
> > > > > kaanapali
> > > > > non_pixel_device  non_pixel_region
> > > > > bitstream_device  bitstream_region
> > > > > pixel_device      pixel_region
> > > > 
> > > > I'm sorry, I'm not sure I follow here. Could you please explain? Maybe
> > > > by explititly mapping DT function values to iris_buffer_region values?
> > > > 
> > > 
> > > Kaanapali
> > > IRIS_BITSTREAM IRIS_BITSTREAM_REGION
> > > IRIS_NON_PIXEL IRIS_NON_PIXEL_REGION	
> > > IRIS_PIXEL     IRIS_PIXEL_REGION
> > > 
> > > SM8550
> > > IRIS_NON_PIXEL IRIS_NON_PIXEL_REGION | IRIS_BITSTREAM_REGION
> > > IRIS_PIXEL     IRIS_PIXEL_REGION
> > 
> > So, why not:
> > 
> > Kaanapali:
> > 
> > iris_cb_dev_bs = iris_cb_dev_alloc(IRIS_BITSTREAM];
> > iris_cb_dev_np = iris_cb_dev_alloc(IRIS_NON_PIXEL];
> > iris_cb_dev_px = iris_cb_dev_alloc(IRIS_PIXEL];
> > 
> > core->cb_devs = {
> > 	[IRIS_BITSTREAM_REGION] = iris_cb_dev_bs,
> > 	[IRIS_NON_PIXEL_REGION] = iris_cb_dev_np,
> > 	[IRIS_PIXEL_REGION] = iris_cb_dev_px;
> > };
> > 
> > SM8550:
> > 
> > iris_cb_dev_np = iris_cb_dev_alloc(IRIS_NON_PIXEL];
> > iris_cb_dev_px = iris_cb_dev_alloc(IRIS_PIXEL];
> > 
> > core->cb_devs = {
> > 	[IRIS_BITSTREAM_REGION] = iris_cb_dev_np,
> > 	[IRIS_NON_PIXEL_REGION] = iris_cb_dev_np,
> > 	[IRIS_PIXEL_REGION] = iris_cb_dev_px;
> > };
> > 
> > 
> > Yes, it would require coding of those functions, however afterwards you
> > can access necessary CB device simply by doing core->cb_devs[region].
> > 
> > I think current code is overcomplicated for the sake of having the
> > platform flexibility expressed as data.
> > 
> > > 
> > > > > 
> > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > > > > +	const char *name;
> > > > > > > > > +	const u32 f_id;
> > > > > > > > > +	const enum iris_buffer_region region;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > >      enum platform_pm_domain_type {
> > > > > > > > >      	IRIS_CTRL_POWER_DOMAIN,
> > > > > > > > >      	IRIS_HW_POWER_DOMAIN,
> > > > > > > > > @@ -246,6 +262,8 @@ struct iris_platform_data {
> > > > > > > > >      	u32 inst_fw_caps_enc_size;
> > > > > > > > >      	const struct tz_cp_config *tz_cp_config_data;
> > > > > > > > >      	u32 tz_cp_config_data_size;
> > > > > > > > > +	struct iris_context_bank *cb_data;
> > > > > > > > > +	u32 cb_data_size;
> > > > > > > > 
> > > > > > > > Do they differ from platform to platform?
> > > > > > > Yes
> > > > > > > 
> > > > > > > > Mark them as const, it should be data only.
> > > > > > > 
> > > > > > > cb_data_size can be marked as const
> > > > > > 
> > > > > > Why is cb_data non-const?
> > > > > 
> > > > > dev is being updated once created dynamically.
> > > > 
> > > > That's a bad idea. Please make the platform description constant.
> > > > 
> > > 
> > > I can give it a try to move CBs in core struct out of platform data and have
> > > a buffer region based lookup array to fetch the device.
> > 
> > It might be easier to express that as a callback, filling core->cb_devs
> > with struct device pointers, as I wrote above.
> 
> IIUC, introduce an ops like below and fill ore->cb_devs[] in SOC specific
> data i.e sm8550_data ?
> 
> struct iris_platform_ops {
>     int (*populate_cb_devs)(struct iris_core *core);
> };
> struct iris_platform_data {
>     const struct iris_platform_ops *ops;
>     /* ... other pdata fields ... */
> };
> 
> At present lemans shares the platform data of sm8550, with the above ops
> approach, that commonality leverage would be lost ?
> 
> Please correct if your proposal is different than what i interpreted.

Yes, it was just about the callback. You've coded it again as a loop of
bitmasks. My opinion would be to just have platform-specific easy
callbacks without extra generalization.

> 
> > 
> > > 
> > > Regards,
> > > Vikash
> > 
> 

-- 
With best wishes
Dmitry

