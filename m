Return-Path: <linux-media+bounces-62952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM0SDRIfGGocdggAu9opvQ
	(envelope-from <linux-media+bounces-62952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 12:55:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A88005F0F19
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 12:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DAB030BAB8C
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EB53D3CF9;
	Thu, 28 May 2026 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCREy35B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHwbXVdt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7436F3A4F30
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965657; cv=none; b=QOdMnl7RsKbiy8ruWNZJgwnBa/baLXyJU6OSvwKcq/p6M75C+754a/KnNtnsvzMNEIsA+PsarwR/WgFkGdJqNRnJCdAvLvJMHcuDnDxDu75h6RbOt9CUIpnFm43n+P+Aw3psCziHmCsoAvklMxHYk1wS0mpf/1tO8dxLd+9g7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965657; c=relaxed/simple;
	bh=9/6mXFAAhO2tRIOZlhxhLb+vSG/NojXk9g/I4t0WrRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN+Zbx7+ZvCAcmL2LvpFezhldh50z4o7DaOEDx3xHyVw+hkAWbPUUQ6tHYE6gGGKisJcSa3bp5y15G087KFF6yGF3D7N6rQfgVJWv9Tk3Vy9QJvn7ExOvCOu7Ymd6zMpm004r0CAcXB+3sfhdgND5LB5wB0k20sbsvrS4fKe3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCREy35B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHwbXVdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vmV61698013
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 10:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7H5I96ycPpsQxz6/8ab0XAK
	628/IR++y87MWPDak78=; b=SCREy35Bj80/2+OiHhJIHsKys92exUs1Iy8E5gvu
	9ybzNZR87KvN0D+n+POE5LHbtddZwSDcNC9jxlRu/YZxGVx4xRZAXIAhlBY0ZkTR
	VebdrD810dHjJFaKXDF5YVN2tiDw5ZARcxWScqiqXLucKvxs2/w2rj+M9kpkuXGq
	xAGGN7hc8fDFw7dhhrCYMbG9tGpWJQAKVfpum3JUao93PigFNUF9vVPAuinAxw7L
	1JpzffroblRJpqg9kt7R36IBhDpJ37Qw/+kpI2iwISiWVljkXR/foaGZIUB9HK+F
	29LMut6d4aJFFYO3EJk7i9yFH0IN6/k8xpHGPQpinfhxJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajf9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 10:54:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so153118151cf.3
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779965655; x=1780570455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7H5I96ycPpsQxz6/8ab0XAK628/IR++y87MWPDak78=;
        b=WHwbXVdtZshuJkYT5lFl6x9djA0OSnb7m8XvMqE8RlN5fCa4XNiU7P5lanO6kS1k+3
         ZQjwokenYHc9RpRA4gq+YF6fq2NyR+bVJx1O+LePvmyk+7jASh3no64sPf09DgkIuMuX
         Gyq25NLX+AV5Um9Ot3QBs6a0eo7ctMLvQfUDfUToWa4N3kELfnqIPV/IhsbM3MWgytqF
         ICnGNE4CSNAPdl93W4KDJBqIkfJ1HjvTp+vAPYuPnSLj/7nW2H8uEltCdoyCSzjHx5M7
         g1lx5MUE8e6/Lml0ZUhfCzlDh2uH2AwjdrKm007r/aXcyBnpQPGEgl17IPDUt75saXL3
         UvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965655; x=1780570455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7H5I96ycPpsQxz6/8ab0XAK628/IR++y87MWPDak78=;
        b=BmmwvoNQ65eqPh9HUSxyDFf6Xm/VeRdpFzz6+ka6T61D79dnYVpY8vRiThmjTdViBO
         AIJh0dktFkQqokUovHUelMSPhi6P8nzZSj+DC0tewIMy534juFRsq+gK2d9Awx7VAe0I
         6m4pJAEGJeQjIFJmd7/Ne8thvf7gYv74+1OVA35ON9Isy7fsjIpoX2P/vS2SaZ/f9tLt
         +1d5XWj024/ahYv7LuvIRzL62qM5b6FYQY/o/VSocAXoCbuceKa2mVT6eSI5W4KNo5Is
         LWrzfowkl4s+GZYYWUolcaG2vATMhA1l07JGJv30RYULvsw3WXmBPoz+jXgIPt7DL1s7
         0JIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5oRbrxNhBl3l0guztQmpsIogWFHuddGcUlAbx/mBUp7TMg0kLy6MFfI129WLiiOxnGLBBXQsCvFKU/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd10L6uPxWJpbHCi7Wc0dBXzBGrfExgdoPSAm/4LjYUieFn2Si
	K5JLdwkQxnZPvB8EZpiow9iCyBvUpek+IZ2jaAWEqF21+4EpORoGupBraXhNmUoeCcFZhFxM0II
	l7qualr/6IPZQiMphzmIbWEOmHAQT6q/n+bFxflJmjOUO3AUK7nUgRW72ySYRE3j5DQ==
X-Gm-Gg: Acq92OGHB5TlCh8Mp9NCJOnsSzbnF3IDQH3I/VjwF8eA9M0Xoxs5AoewPDus+P4PQRp
	6277thT0RIxP8bVPx/b74ABELY2stAKtJB696eD/uGSl5nQwHwwwkwHC13o/wujhEnvZhj2fQfl
	ENOA2HTifCWlQHbvcOAQdJnvKBmxzRZ7avlqtJxpjy4G0BgMaM77h64uYfosIObLOZHwawf7A8P
	tPuDoWD0ZxsC7TYFAwFBC8wIhcUhlKX4VvM62uMyu1vamLN35DkpeiQxuBv1mE+fzGB5QLWEkyg
	KDKm+aNTWXxfZzNKd+BQ5epUcfis+1FOSRvIdO4hQIrnXHI8xLb6lbUZ08x2HzNNlN151lLMQ02
	LMzTS8wwte+pVLRNtr7ju271qjMzmHBHcl1z5Fc0J8SVo+7nUz4HV83TSJNrq16ZAUgyyu4sASO
	dV5KCI5Orqjw9Ya5chyIqruQFRUziFqw6ld8emZ4sVdf3MwQ==
X-Received: by 2002:ac8:5d51:0:b0:516:e031:9343 with SMTP id d75a77b69052e-516e0319e2fmr321609971cf.11.1779965654787;
        Thu, 28 May 2026 03:54:14 -0700 (PDT)
X-Received: by 2002:ac8:5d51:0:b0:516:e031:9343 with SMTP id d75a77b69052e-516e0319e2fmr321609681cf.11.1779965654303;
        Thu, 28 May 2026 03:54:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4623be9asm1834795e87.0.2026.05.28.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:54:13 -0700 (PDT)
Date: Thu, 28 May 2026 13:54:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/14] media: iris: Add support for glymur platform
Message-ID: <kunwuij4ntmh2hwxdrfwlpiza7kbcwtdlty2cai3xlxybkn2er@7wmo5irzum44>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sQSvUYkPNBTCdLAANkC4IOsgjlmX_lJp
X-Proofpoint-GUID: sQSvUYkPNBTCdLAANkC4IOsgjlmX_lJp
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a181ed7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=0MEm6Huftf8yFbl4pBYA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDExMCBTYWx0ZWRfX03Q3UJ3cOdwz
 VYuwWgNQ0Y3nNqEkGQqRiYJXlJyYo7+LGdxpqmHHV04GdNYQ0jT/AZg0GSZcKfplF477gC9lxKB
 yxRSchCvzjX8eRBM2nwEMji8zHsTwd7dTBXrxcrXs9zEQoymXYjfLRhOPIQqFpx5YwYogkWTsit
 cUn263jBuuaSoclLWWpbvDww4pWr1FMcGMYl7W8dxaoQ5EETYic1MBwEp2bPoJUjX8u65Hh9iQA
 VRWzVGXXQc3pSUdwD3EHuIIJTKVpzi+6aOssXXVPKFf+pXK/Pb820ITOuZznJHZrZpu9ujGNfzh
 7GMB+n+13G88u+5rNBDeswJ6PDsqosdDZxHPATeG/sQUwtNPFMODNl8u00FzqTSWbLmshHQROhU
 wNFTrrYDTfSaIm6LRtJOt41UPjXH7J3JCkNphf7xEtNHy/hVhcdE1SugfBlk1x+6mGgzwAf9IaS
 6aHUZJUrGoVcfRSHkkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280110
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62952-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A88005F0F19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 04:51:15PM +0530, Vishnu Reddy wrote:
> Glymur is a new generation video codec that supports dual hardware cores
> along with additional power domains and clocks.
> 
> This series adds platform specific support in the iris driver to handle
> the extra cores, power domains, and clock requirements introduced by
> glymur. Add support for firmware loading through context bank firmware
> device.
> 
> Dependencies and merge strategy:
> 
> Patch[1-2]: IOMMU maintainer need to apply and provide an immutable tag
> which can merged into media tree.

[...]

> Vikash Garodia (2):
>       media: iris: Add iris vpu bus support
>       iommu: Add iris-vpu-bus to iommu_buses
> 

Robin, Will, do we stand a chance of getting these two patches in 7.2?
Or should we use some other approach?

-- 
With best wishes
Dmitry

