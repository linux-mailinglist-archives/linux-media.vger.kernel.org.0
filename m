Return-Path: <linux-media+bounces-50378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FEBD10183
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 23:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE71C306327F
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AB62D6E44;
	Sun, 11 Jan 2026 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfhwuijR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwQ8FH2b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6639123D2A3
	for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 22:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768171404; cv=none; b=haF8f9Y96swfi2JqdLMwUb84UaKlKk+k2eTAbSPh19vQKwbFicw2TpoBVUqcc6BPA9SDYgRVm8djWciJ7Xjz4r7DpGpHGMxOCZlwG7tpkpkXT0nInvDprQzRPDsBgIAGZOq+fi5JqB241zpD3c2DnloMZEPoFfMJw51lueu0DXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768171404; c=relaxed/simple;
	bh=1HpYROarVFg9MsHjtZFtlcOhuGaRKSkmhm94t91U9Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8IhDabvSbJQMgMHUgmsN+EWWd0S7/cOG2AnhYeHvu0/9jknppray3OmRdUoMnM8hb9VsO/xQsZTMjdo6uVVcD9UdY/eL6YyN45D/AEFc+B6Xn1NTgBEhWhFUhygdFVcjZjCyid2UJIQQgcCvRKjOrlFOBOHqXIr3hgmFu6Xwjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfhwuijR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwQ8FH2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BLjG6K3923462
	for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 22:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Faru6CUzvpC9D3oH/nq2pvSx
	ZQHDpHYFbWCOcDMAIcw=; b=NfhwuijRI/XJ10J2lfnowsT0HnkzmKrQr4/eLW3K
	UEGbDBUdOrbBaIke78lJcRxR8Vab02tAYfESSoyuynOQfcq3f51SEu7VoVh9lADD
	BLkv+zAfGWrkWW1WDjsAIhVQKe3mLBIbnk9nzMRExQwsltfQB+bHYROLb1QW081b
	751Datk9nEAPJyaDnO9/iZJxsjdzRp4cum5E4CfY1vtNAWMnXK5f0nWFGhMZdCIs
	zlPuLkfRMNrdksvZntSj4Vky3TrwNr0IINQUjqD13elBSZJzI0OwG4W2fqElyuKj
	/tjuG/bSZ2LO4ugmGTKGE9I1sny4KIpHRMclT9B290YgGg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhajtpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 22:43:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a366fa140so171690186d6.1
        for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 14:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768171402; x=1768776202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Faru6CUzvpC9D3oH/nq2pvSxZQHDpHYFbWCOcDMAIcw=;
        b=SwQ8FH2b3gqFaCatfqm6SdFWL3V1Cpid4MoDKn/RHgRNDsLFuVwfC/cfhGXVtIIZ6n
         K8Ney8mQKdiImN3HtL6KJxLZU87riqiTkpgomkj3UbfH3lqioRS7rO0xflTMl+ratowf
         6kjZoDgaN24C8oJCatF9X60f35KSCXyP+7X8XpgAheiblrMWoHBtTBENsTSEWHmwGUgG
         8uq5DfY3UqbPmkG+mLXQ/B9AmvdrxmY2L5q7qfDXz/Ue0Rgd1zwvg2JKB0teGhDzna1T
         pzloglXYp4rtYf9TgppviJqTSLQUzfIUBb4FveuFer6A4Pu72/vNsd29QGnSNqw6cHV7
         82Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768171402; x=1768776202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Faru6CUzvpC9D3oH/nq2pvSxZQHDpHYFbWCOcDMAIcw=;
        b=vP6WBLT18V2CIt3OI3sLxsXbn3f06rKYfGM3ocxlq6VYPfs9pJwEsy3puWxnwD6SC3
         /fiLGF6sU9XvMg3OBy/7ztJZQwpGEd8+1wJA6y/f+GH6sUpqyDsoHpKVGPUvl090oAfb
         lb6dgEVs+bzbeP6CVH2+chMwknjYrjEz2xFYviPckYp3jxr6jr+TrG56n83sYcQwhD6l
         sWTgZ4JDdS0dhyeRzbElORG3tmrXHrYuNz+00Wxe5lZFP21B4DjY+o8E2eehyGQcNwqP
         8rNbWnAXGl57DxWnpDs/u4znXATqBiB18RbX2/p44+lCH6EC1d8pg9Ee8yTj7k0MIZkl
         asqw==
X-Forwarded-Encrypted: i=1; AJvYcCUpD7Ft8HEvmskrmspLvdlmnjKvdeYW0bJB6zP9MKUF86pgX2/RwPoOrD2YVJSBHtz66kEcDv0X8oi5Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLpq5MsZSn5OZ/kUt709AoK9MLqG1FoK3Y1Qy6hR4Iy4ggJnR4
	cPPz9wCI+FGpNupD7Rqicss10O51TSQkmLBwdE3+2pTh4BwswXh6JGO00h5izJUSpYWFrYnMrLo
	9HWBhilUnnjmatf4eP2yYIMOynj0bS1FoQEFcgmPlNmWgOJXBzn2h0tjSGRohHK8bag==
X-Gm-Gg: AY/fxX7DQhOIhxkteNf5EqRLN41aHczjxkhuarXjhYLl+b1NMFonXhzqBhnpq1tyDGA
	/VNq1ALNKSbAWw8+vm5XQwkyEZFsOXs3L+Esz8J3vxYwLIURxu1TxPwrMWuvZ8mhexHWmjdYGn8
	Ot4Natf8Ed6wuaM+TMarA+zA5rkQWUwKwdvabg7Y++O/vW/FQ1rHou1iWo6c77o+IcjaYk806tU
	I2n9oAYRNZErJxPvI+1WLVjv8YUodwosn61iC/Eh6hu+h2sHtKP0zyPGSg/Wszz+QaQ4P9o2ptu
	G5DcAzelEL0TqP458WUIj8k4w6gFyJ+ip4lNqkVTnTVy+MjI2T6DPnCsy/FUOJEQVHnSex6YM8r
	pJW2ApR1aTVeGZLvFDA20+gkastWFrdjhbIVd88Mjk+5lPJl3SK/T0PfJDzq/sxqnIls8ff2kge
	Qp7kyvzmlAhWXQh1Yr+TCpW/E=
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id 6a1803df08f44-890842aafeemr249835636d6.56.1768171401754;
        Sun, 11 Jan 2026 14:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEthh+n2T4dXkL7d0hv0bhD94TCKrGq5BGhzi1YhOggBEE5NkjcgeCy5QYeiQcAKszgoKM5pA==
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id 6a1803df08f44-890842aafeemr249835456d6.56.1768171401291;
        Sun, 11 Jan 2026 14:43:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b79e11154sm2643050e87.94.2026.01.11.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 14:43:19 -0800 (PST)
Date: Mon, 12 Jan 2026 00:43:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 04/11] media: iris: don't specify min_acc_length in the
 source code
Message-ID: <4cvcpvobzlcyaqzy7ewhgc3u5gqawt7pa25dz6jkhuwintbkxp@ffun7t4bot6a>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <i1eMEm9fSpXb30tw6zP_FKeXfJr4sD7bS88njLCMUniDy_QNsOiVn5w41aA0zXnLaVRNFLaLrHgr73Yo2XV5lQ==@protonmail.internalid>
 <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
 <d8f6969f-a58c-4a02-a59d-f608e1a95ba7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8f6969f-a58c-4a02-a59d-f608e1a95ba7@kernel.org>
X-Proofpoint-ORIG-GUID: TflO9FUQbavfe0PDIJTuaNSK7drs_EBF
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=6964278a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kMIBw9bMVBG50rZdcTUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TflO9FUQbavfe0PDIJTuaNSK7drs_EBF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDIwOCBTYWx0ZWRfX9iaFWE5YV69P
 3l7sMLLHB/vNi/kGJ6EED8pc0CJHgOstp+jx0k6TaaXX5uRse6DoKxZxujmilhcv891SkbqHWPW
 V6RzeGEcRUA/zllNMM53++ex76FxxWFWGNfroWfCxPgXyreTAmmYMxu6DSkhXoGCfLiwQn8MFfN
 5RjL6qN0lZ8u5ulXc78C1QMYqO6Cgig2Kvnb8OIv0LG4goYcYP/GOJMCL9vQuzQUhFZi4Kftjyi
 8t9ClqUXhK9h+fC3DFWcz/toH95mkXjfSz511lfSb8NVCuZMMEIZ5dubp5IS42v7Phbl5Q39sYv
 Q6wgfVPVVIYtf6PL5wYr1rq3JH8D5KdQ29xeBCQ0AYssIYQwdruSZVKiJDS1nE5Gw+lP6DgPYUD
 bFJ+7crUgyanjCQ2B2OJwLQv5bhqar4aA3/c/ZngrCdIzSHciePN3s05XQMD1FexUHx9aV9M4sr
 X13X0c8qaKS68/YYgCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_08,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110208

On Sun, Jan 11, 2026 at 09:06:52PM +0000, Bryan O'Donoghue wrote:
> On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> > The min_acc length can be calculated from the platform UBWC
> > configuration. Use the freshly introduced helper and calculate min_acc
> > length based on the platform UBWC configuration instead of specifying it
> > directly in the source.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
> >   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
> >   drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
> >   3 files changed, 4 insertions(+), 3 deletions(-)
> > 

> > @@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
> >   				    &payload,
> >   				    sizeof(u32));
> > 
> > -	payload = core->iris_platform_data->ubwc_config->mal_length;
> > +	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
> >   	iris_hfi_gen2_create_packet(hdr,
> >   				    HFI_PROP_UBWC_MAL_LENGTH,
> >   				    HFI_HOST_FLAGS_NONE,
> 
> This code is fine but, I still suggest changing the 64b postfix in
> qcom_ubwc_min_acc_length_64b and just having the function return the size
> for the platform as _that_ is the more sustainable way.

See how MAL is handled in the DRM patches. If the UBWC spec is extended
to allow 16 or 128 bytes, the drm/msm driver will need to be changed
anyway to cope with that: driver uses flags to pass the value instead of
passing the value as is.

> 
> Up to you.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

-- 
With best wishes
Dmitry

