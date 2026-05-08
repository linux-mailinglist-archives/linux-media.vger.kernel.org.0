Return-Path: <linux-media+bounces-60972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOvsL7xF/mlFogAAu9opvQ
	(envelope-from <linux-media+bounces-60972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 22:21:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F154FB6EA
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 22:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B911E30566F6
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 20:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47FF3E51DF;
	Fri,  8 May 2026 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAe7u21T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9x2Pb9b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A86382F08
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271613; cv=none; b=kve8IoXKTb3NcunZntjUSVljVqBGDiAeykRH6IqD1ezmrRjIw1I2Y1cKUF5hNeMerLeG5+pgLrsADeaGzoCYEdLADVaDo2zyHare1tZcc8T2bLb9L1KDIqfEv5ak7GzPW2glG8Mb8QPQ8n5Pw7aKnT5/t2h+FNfwZ8U1/HNAiFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271613; c=relaxed/simple;
	bh=2ttoDRFvuARsXM73aSa/iyFGnllYGs0qVza3Mt5VlKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/jSUcezypbS3SnGBUX7om4qvNkDsKYr2ZSahWW5uM4tat7W7xjWCt6McsR8HFyxLeHhkip+S+HHcREfaw5afcodL7XE5Gm7HUBfdgQA5J9vZem6jmP4QJzkKbXvkvWCyS9b4G9e6FC1+6sIFVjN20mFHEXn2S7WWh1srAXzCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAe7u21T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9x2Pb9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GWPD52335649
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 20:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eo2cOr8LDHMQe3YBBwdT+ufW
	1HrZes1kP3AFsqymXKw=; b=VAe7u21Tk5sv2zpIwGJ6bUhWuVUFeT0XndTet4P+
	9Eep8twjpYbsFCH2JKEciZfmJcwDe1taNnOnwCqsWZJWgC3YlrQVZ408StwSuWgX
	AIkvLpZqWnCbTQfcH0AopSeFsBa+Eynnf0ZYCyZOes2qNHLDCBpmBJyyPCM0b3cA
	mry54d3Pe7BJoKVK+wsJwgb+RAG/dsROP/9thN9+2YLzHjeAGsyDYSoxtOVzPsgb
	ZevysEOhlcZZ9fCCwcdi8+/mlvExcXn5rW+U9HaSK9T5o7bendZqUueIzI0+rIXC
	OtjHNY5JTaWS/jBSuaFXWvG3ZnCu0RgND2tvlu2E1vaEiQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1keh8r9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 20:20:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d5e66646aso3806892241.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 13:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778271610; x=1778876410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eo2cOr8LDHMQe3YBBwdT+ufW1HrZes1kP3AFsqymXKw=;
        b=B9x2Pb9be+0RerTSX5QeZiPfQj2OZNhIjiqVa7eCf49qUlnFwH3tGM2SkGlbQRXr0M
         bBu4e+RNcVwdvmM3ZjNwHKVJp7tqAE8ZKOlldW36yDCji/kyjfQsfT07JWFCINkezSrw
         EsSuM48bjRlqGg5irFg386HoXw0mGQPhkcK4vgTitoxaHdnrvaEbvkljLRF0jTzrmO9u
         erEyve+L3dVqy+AObn0kZuAmyXrZ5NhmeIru0C6JWH8h8qIgw30l7oSW00sGpzvd3+YK
         dsNw7ACoUDt2r+b580qiv+eeKDXU1mkpCAiv1Lki2QvWsKpbWavg1QlpNE5a42UThJ5G
         2SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271610; x=1778876410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eo2cOr8LDHMQe3YBBwdT+ufW1HrZes1kP3AFsqymXKw=;
        b=EalFAGzCyM4MwnATwnhkRhpI8rtNYwOdFz4wtkebk/INz1G9TBmCEs/GhBeMifKhVO
         35bdEMbOWOz/12WzeIhmEF7VQ6bU+grt393wn5JbpL5o0ZvQm4FvjqHYMIG2p4fYBSfg
         Em5lAiIJv0/WA200xeimvHwcGrIyiFVQ87xcF7cdSKi5UpqTnjoiv4BCNimQyvbFNZHK
         xwyY2Yre2TCbzrGiWnbfmLpQKilIkCtQeUyZSjhlEr2PACRSwmtATq3JIO2UTI1RO8FE
         t2q7xNJTyc71KZ6yRW1dolGIrD0acBxMkHGOr+sCT+U5k4ajuhK6sADwEE5vXnIfGChu
         9TSA==
X-Forwarded-Encrypted: i=1; AFNElJ8qjtFzvoREFGVhuAzGLBsMH5MFv4h+FoJw0df+KnU1Kw5RRw3x5RXhZSIQoGrO6qKbiAPmBlbQCZytpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvkr+JNdXHztTegHP34q7K89y5w8oJ7QtEvZ/fWE/n/YH4d3jX
	olh1bOe3OByc4DLeItmmFc11WFSpkiTM5k6RSjqwErz/rWBZUibBaA40SUjxq93zOOWuaNV5ajh
	6WBJHbK/OORTS0KlD+s1xoYNNvhp4MuY08HLb+3Jhrt/J0hTw/u1wQknBlLIiE7f7NA==
X-Gm-Gg: Acq92OENlHHmq4e9z83yh8M1F/aJKUUZTbROnzjo4+YSeC//2LqK3yl/FZM/40l1zUY
	RuM5C2egWQEs1Wg3LLHzpzQLXH+a5NX7HrIkIe8XJ1fWl904E4yWryk6/LdLlWFlI5DOBAYnB+U
	MeJSer6WBJGB97fn3QhFeCzYZB097rQyS1c2PI65oazse0mKxzmF2QWlLWQEisjtwkxhqScsfj1
	iMaBl2jem4YAqbNWLaZHMk4JK33ZjHFHNprTvsUIjBiSrvTAw26iGi767EqhAv54oRPm67MBmuI
	ith3Lkfsr+CK2Qb5ivX4vm1SivSCLy5dllCI8be1b/XJqfrQRqudD3CaiW1BLU8f0ikUt/R4PY3
	BCMsX6UXNqnGt2f/iBsl6ppOS8fBOjdhRCnLFepq0bGIOKkIFNTfejJPdp2NtSgWjTpm5BBlM+3
	9nrvlnwV49d4veA7JESBiKYMW8WwwbpjZ1CCU=
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr2402767137.29.1778271610170;
        Fri, 08 May 2026 13:20:10 -0700 (PDT)
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr2402741137.29.1778271609727;
        Fri, 08 May 2026 13:20:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm797786e87.45.2026.05.08.13.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:20:08 -0700 (PDT)
Date: Fri, 8 May 2026 23:20:06 +0300
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
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CJIamxrD c=1 sm=1 tr=0 ts=69fe457b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BowHXwPdtatiOUMbaTwA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: jRViUMaFT5muudMuhcOrvHu0sX9tl5NI
X-Proofpoint-ORIG-GUID: jRViUMaFT5muudMuhcOrvHu0sX9tl5NI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwMCBTYWx0ZWRfX7NYc1fZzgJk4
 c3+EvNArYVgLdZ1enfNOiAtIe1u5Xt1XgoFk93D6KUn2p9qLqtKs66wOj62XRtWXd2OzZaZr7es
 8QB+XLp6N3nGJjHJcxGjT/0Ls6n55QmSuNpdNYuS16mJSIXocka+6ZNIeBR9T4Atp0g91qH5ehx
 /dh83rb6ZRUros7LpFd76Gotpeq0s/KOeWZEAI5xkF+cs2mjhKUg/dX3FQnqOTkOiMxUD6tCBNU
 aMjPlg36ConlcxpCLdTlWoBRYVAakDak3fnc25ubqT7UzUtBpBjjmKoSkPDePdN6JkG7knduI2a
 uBjSBQaOb5FtddqPj+AN62cVBTJd9K9c/yz1omJKA82mPwvQuXX9xzXxVlQ+tQqKkrWVawOAj7G
 dwTGCeHwsjgjr2fd7tHPnHa0sbJbCx3dPTleQU2M+m72qz8l1GzsgpK+ann8E4GrBXjjblVUnvx
 FKd/RnGt4+ZwFe5vUvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080200
X-Rspamd-Queue-Id: 13F154FB6EA
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
	TAGGED_FROM(0.00)[bounces-60972-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are

No the calls to those functions are not intercepted. Doesn't hypervisor
simply implement the SCM calls?

> later removed during teardown. Additionally, SHM bridge setup is required
> to enable memory protection for both remoteproc metadata and its memory
> regions.
> 
> When the hypervisor is absent, the operating system must perform these
> configurations instead.
> 
> Support for handling IOMMU and SHM setup in the absence of a hypervisor
> is now in place. Extend the Iris driver to enable this functionality on
> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).

I fail to identify, which changes correspond to this description. If
it's about the PAS context creation, could you please be more specific?

> 
> Additionally, the Iris driver must map the firmware and its required
> resources to the firmware SID, which is now specified via iommu-map in
> the device tree.

Why? You miss the most important part here.

> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
>  2 files changed, 66 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry

