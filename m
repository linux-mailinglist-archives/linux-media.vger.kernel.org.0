Return-Path: <linux-media+bounces-51693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJlSDWnYeGmftgEAu9opvQ
	(envelope-from <linux-media+bounces-51693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:23:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1DB969A5
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B99A93263D86
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0045E36164A;
	Tue, 27 Jan 2026 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKpDgcHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKmHQtl1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB434B676
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526553; cv=none; b=aw7I7TYwtdEAOvQ7K5MzEd9EC0l2MFhUqaHfFQ8KC12ufT8mkZN/zOLmgD+CEpfx6g6pyuBMZ2LbYQlTi5pQaeaFfPhhMz9di3nRtVAsoAC3WxxW19BXna6XCkwdn5McRLG+xBTcSV9b5FF75vldwTvOoxxklDnqABEn81AKKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526553; c=relaxed/simple;
	bh=oz92nNe/0jQO/YoUvvjkb1eXuR88e+7C5+ksv9MjMGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JR+oxcUXTHMriGltN769UOopPvC2Y0UqGXZgB136M5z7ZbsW2OV7IoRwKLTkZUZTU7CwnExuNIvW0xQfyIVGM5H2wc8uqDoT5LzjBf8yjUB5UJrm+aOzKmyocwbMdiNmniI6U6ibcWVdzRpOdHZ8FxLB62lLoup6mgakKYLCvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKpDgcHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKmHQtl1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9pM4f1269418
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 15:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27wgVHbQ9lzPrRPmK3tFXLzr
	eFllIGFd+b8eFXO3QbI=; b=iKpDgcHIzfAAIohNIXVpVuF7Xbu3dTHnjf5l5tQJ
	6oECx4fEBkbq5fZFTlzY7Myq3GFCp3bTBqZ4YBthzca5TDZ/5DcrKDS1HcVtgZXv
	98HzOpqRWJN6phict5+G6CG2Z+LPoRhLFZGu36AUspGJbr5BWoVw7qsgdhvRWqUa
	JRLkm5FkqTp8zGKj/Q4yw5Q3bwctk9yszcpka+XylflmQSy6vNeaGwckkElHbwph
	C9nj169bgsa+js7trEIoHWuDTD0xTU3td0d22x7KGTIu8Kp2RS278oCjcBcF3Imv
	KAtr0RaAKMEdlpDzZtuGBlZ5mqOcwO1WmdBPtElta7V4Zg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyat4t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 15:09:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f5409de680so6877910137.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 07:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769526550; x=1770131350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27wgVHbQ9lzPrRPmK3tFXLzreFllIGFd+b8eFXO3QbI=;
        b=jKmHQtl1a/BvCGRGWf3Kf2cy3KegOgp+Tr722bBpHeTzNkLvvSqlBt4tsFeuq59Q1P
         EhXw4gom9UNMNkpqhrVjEbzTWKBabzLKfMoSFtFunecvvM/uhYvlgKng3Oy8EboJWjWG
         Dx61FSShZPTAN86ixdv+QOKGklxlSgqK9wTn3zmfeKu/VIWScDCMrUnzdlYAtyi5mwwQ
         UaPrBk0QqeHHTu66Iey1SdUYYG9I8qIehEArhI3ez+zMRU/1B6+88ZHa3xZ1s1X642IW
         vhy+Z4rQ6Cfecg/nktl7CNL7r8e4UfCxXsin4JGQAoxYnCTFjK7+JpfpbLKb/kJO2yHX
         qN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526550; x=1770131350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27wgVHbQ9lzPrRPmK3tFXLzreFllIGFd+b8eFXO3QbI=;
        b=WQ25TyjncooneWAGoJkaJ2WsLTK5A937xv7XAEHt5NItLqua0BXH3sm5zQsPRrxFI/
         YmTmUi+R9GbySpRPImv+RQ/49seMxgOBUEXjvPO444MCvlTNqzS2tFDahpp7U0zs/XvY
         KtH8Wei5x4SakNIP/S6pCMh1lRm7zAnYndpxAPGSkUq6ki8G/OIuve20tr475wrvqrkG
         KlS29gfnjWxKhbJttwrC2iuzJOdwa5PawWJxPDMGOKkAgHK1TBwrZBdJnINWdBzqtIpO
         WquIElKEFiMyrZtWPi6+uiQVmoO3RpCf2TkOvs2Q2YmQ9gABbMNG40xyebixBCj0a91T
         FP0w==
X-Forwarded-Encrypted: i=1; AJvYcCUH6+OgA7SqC4IJ06kM29RB7rROj10Phzr2mS5wV1LHDhQt4baEgVSpSqvx+rSUtFtjwCbh0f9FhVJing==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz84DtYFO0JDC1TLeumw18x5mcIFxSCMkiogqTz3XDqaX7i66Db
	L4f0EhhYd911tepOBJ6ZnzB8BXAbmUX4cwz8pf2oc4hdsQZgn0aR8F+Yt9RB/eCLaVDfN3KVRtU
	SB/Vp6ItL07/5ujlrf1k2zmKVtEFP8SlvHCDyl2olyt2BIKAUPzQfu2eVQAKclV9hvw==
X-Gm-Gg: AZuq6aKRZZ0FY7T7Ku2pJME7Xa3NuDceqZS6AT4qZEsT7sD7XKcSbWLtcP6X1sXjbrn
	mQdgYJwkiu3QdOY2rlO2BUCWk45Y6/4vCrVrvZMWchptZgP8krKiISrxNkndBqlsLPHNcL9fWVN
	NijWkPlBqxKCCVYS+2DcDORsOeAxb89TEPo2S7/jpGmgVRu8ccULkAC/S6YZghIOvdQ/2Zef+jC
	Bi64EX8yTLwthj+jg3IzZcwXss218ALU+9qmJLZci8kCHE9OSoD0HJGxQgpWqsyQg+GkkceTPRo
	q8S9QandPqkJeja7V1DLtbhwkbXrr4Z1bMLH3ACDaVLX6GSDh4Gy3FGM8nbjs7SQyM0wMRfHboW
	eGubnQGXHBq04P9CDa6A/vTqQHAROaaTEmxdOjBk4ubY64FeFDpnud09EFCu1e1Y2X2+hhSbp67
	z2k4EeryeM10JTndth442HUNQ=
X-Received: by 2002:a05:6102:390a:b0:5ee:a2a8:2e73 with SMTP id ada2fe7eead31-5f72378e4b4mr772171137.26.1769526548894;
        Tue, 27 Jan 2026 07:09:08 -0800 (PST)
X-Received: by 2002:a05:6102:390a:b0:5ee:a2a8:2e73 with SMTP id ada2fe7eead31-5f72378e4b4mr772143137.26.1769526547175;
        Tue, 27 Jan 2026 07:09:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1daf40sm33193441fa.46.2026.01.27.07.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:09:06 -0800 (PST)
Date: Tue, 27 Jan 2026 17:09:04 +0200
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
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
X-Proofpoint-GUID: C4nuN1H-Kn7hmJbyFXFCO3NAM2PxtPmi
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978d516 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Gjm7CCj-TAD5GDm5kmYA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: C4nuN1H-Kn7hmJbyFXFCO3NAM2PxtPmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyNCBTYWx0ZWRfX1vgGbk9JViM2
 BbzxErPO8KpeCmRo8wdbZBd1/FOd6D44ze1CZlz43RxCUcoszuMKIYYRDo4xWEDj7gr/ywDLTch
 W0jffpQ+EN0RMF0JQfoAc219dOxmapJX3u/GxAK57Y+mDtKOhZdrVjfSsF5+6W8+8usX23vo0Gg
 IfbgndCGKe2urB6zNmr/tODfIJ1CdvRO5Eh2Y55VTvi9c/kyrCP0ywfnagu4z/vYs9cLXi4Lxjg
 tugeAMUtwCs0STRFf98y8OsZGfWWTvsGo+UA9Y3TXsscdPDGgbqc5dsWAFuCP2aGMAedyRMSRuL
 nMSUEqn/kBhOBJz/KtIHZ+Q2InDCtvj/jT0wu3R/P/wuKtROTKiNZs5pmvacxQN7BbnK/rHDcjt
 RLqhpiNowNzR1An5OdbfucsHvzjmjzgL++19I75vpfoAINC4Zrtg0xicvWPfEp1gMg9ln/E+1Np
 AcVd4piNb13sEcZDnqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51693-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB1DB969A5
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> iommu-map include all the different stream-ids which can be possibly
> generated by vpu4 hardware.

It's not how it can be defined.

> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
>  1 file changed, 234 insertions(+)
> 
> +
> +  iommu-map: true

This is totally underspecifified.

> +
> +  memory-region:
> +    maxItems: 1
> +

> +
> +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
> +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
> +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
> +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
> +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
> +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
> +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
> +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
> +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;

#define the functions in the ABI, provide them in the bindings.

> +

-- 
With best wishes
Dmitry

