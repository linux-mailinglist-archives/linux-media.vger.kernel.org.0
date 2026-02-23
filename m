Return-Path: <linux-media+bounces-53248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPFlBXzYnGkFLwQAu9opvQ
	(envelope-from <linux-media+bounces-53248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:45:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A32CA17E881
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8B60303C81C
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA42337BE8C;
	Mon, 23 Feb 2026 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxwZI8N7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxQnXu90"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CFA340280
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886705; cv=none; b=OJwT1AbE2xDumgCFB0iocWYMMMf2V09U7fuuJ+PhVplKhnLyamDlBaizqUAMH84JWpeNhBZIJw5oIXFyZpRRx3BDhFJ6YLNNludXD6tDrtvdv2UwQNcXWBipXkUMgH9j1qQNhbeJa4iTIOCusrprm7kWtKpaVxGd4SdMXT++IRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886705; c=relaxed/simple;
	bh=TdtJJEcR36eOIcMiT4ZO5zoHynLWdppAn7a7AhllwY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEm3jVUJ85DG/aJE2/f+JZ+gQ6PdV6nO/aTTa/m20C/WrIRi1XAF3uEG5K/vzJ9goZDZfLQAdyjrTN5spaVoD6dTMA94Nx5KweVtwq9ltFMVg5cMQJPFXSPQjx0AaKKEsWqm72BolE6OEyWjmiPXTssslxXuBl9ddQsyxkeYHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RxwZI8N7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxQnXu90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIWYvB322188
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4uwG+VSOUPiQWFQC4n/buq2e
	c1Jxta6TBA66E35NxDU=; b=RxwZI8N7h8IyqIggGJxquVH3UCDbV1q5LiSJ+ilt
	DdciWWZZ87rygoZLFTX7IFnxwhjw3a2NekubPTReBbZdvT5/4SSjyEZb+WDNYh8A
	WQ8gdZL650EWkFAtysqxYKeuW8qApHFcT2N74xuR4TKihkr/XGpCrAqdNYDAxs/1
	NT49p75lSokhEFFtzG1AVZFQmoeq3548hEiK7Iw7IhrArm4kDLXTLXWIURFHHJWi
	f4G+rooV2wwz+HpS0+nJec8gygbF88Xa8UpYvzXt/UceJ+BeoiwcqyxKG4b6W0ho
	FxvSAPylmmsj5J5FZAGJVokXdrAbR8YEUY10TUTO78Pghg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y24ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 22:45:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70fadd9a3so2898270985a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 14:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771886702; x=1772491502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uwG+VSOUPiQWFQC4n/buq2ec1Jxta6TBA66E35NxDU=;
        b=cxQnXu90khqV6o7CfC5ArtwQXDBIUXDWqn/RA602FSGZTWUZ7XLyAl/lfd+EDxOcOc
         wjlYeh9oJbLep+53q4xCUjAu7aAww4fnKN4TUeEz8Tswtii4Mf58YRWzQ0w95gt9Jmou
         5TqLJMOCBXRbc/x5unXFHDeSrM2JI7yiUu530qpBSrlfG3agkdldC4XFrAPfPg4I+Qqy
         wRja8gWx8gPJtyybVmiP+IPa1FuqUs2yri+Vlea7OwcdX1u8kNam1qj40uibbFN6/xI+
         DtqwhwUFahpJ4dNonHdFsQDGZUsCeLCVkM32KVgDbNA/Hm4IUx3fdalJT9PFP/AKteBk
         qnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886702; x=1772491502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uwG+VSOUPiQWFQC4n/buq2ec1Jxta6TBA66E35NxDU=;
        b=Aap4D78DMlCCINl7h825dGufKUult4v18WJsTUgIkKGGjVDpv3zOGFcPUMh22PRmdw
         Y0k6HcqdX2txKFl4rhzfoeUxce5Zpto/V+rk3fSZzTVqzCY1hNEf7w8VT5HsEIAbSxmK
         +urm/Kxu8hgsNAm9uNXrQ9OD5oSAt8RbWrbLkXgrglxMyjSX5OBq6uBFCnvg3k2A8Fy2
         Bb8FCFlDoftZNuaR9Oi31ueZpURJkNmo+OyHoS58KVPoufpYmV79Mlk5LHvCOKQYOj+I
         UMXuO/j4y9cmPXpYr/N52jFq28+fvHDPkyqODm+FcWxt5frci1LNC/F0mWsimAi7XI37
         Nw9w==
X-Forwarded-Encrypted: i=1; AJvYcCXEMzGPNjSeQEeywVirUO84/rHmwo0QW7uHp5t29qtK4btZt1xWHgC2Sh9yx3e4LakhExDbgjsa2i8EtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEnv8hJkUMwPmf4Dq8VXjJjJiE/Qe2qoOnuIWTKvplUvWlBTFz
	LzIRLdaGq6vXfRJthCYh9GZR5i/mRl1OOjasvZo1iYcbBniaUMZVf/rrm/RZc5sfirBBGOfLz1l
	R4+ziDvem55WEfk2P2Fp++zMgsrBUjCeyJMxlmM68Jiqbf8hwBieAUZK+2iJpv91teA==
X-Gm-Gg: AZuq6aImqsNDGGgB1sT6Dz3gchQCVdGxU5R9UdcOemkCI2nOUjG5CfEiLNKfx4smWd0
	MxjW7i8ZZ2+/xx/ZKHWa9BeeZC3tSq5STMKnBQGykCUE452Qrk7Pfm/VaiFeCfrTNmMDhvPkxBJ
	dNHKteKr+MO+iYavElDBl0GpIn+fyS6u4vPqprHP+gLpUYO9fqEweBMxcay4OphvX/Mt3os1z2j
	FsBkp+mSXa34a/7kcVOh8bStUOdszJKTbn9Mk8qxdH496fGt8mNtiRnewdwpQoMGFT/MCC/vuUL
	FM0190J6BiWupPtni8IaqmfEuRK/1GKgF+Su+vFaKIsLT1n+KA/qIUZbexAC01TrSsv7zOZgOZe
	Yv69VSwRI+Tx6coXwoT5Z46fWnQ+3q6af4IVHh3tnxptWQ8NN/tyjp5OqlJT66blOj3YwdC8Wx3
	oBXFCphTwGA4xVcjZD2LZAZH53hIkAok9FUTo=
X-Received: by 2002:a05:620a:4727:b0:8ca:2bab:a0f9 with SMTP id af79cd13be357-8cb8c9dfd2bmr1406786785a.1.1771886702343;
        Mon, 23 Feb 2026 14:45:02 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8ca:2bab:a0f9 with SMTP id af79cd13be357-8cb8c9dfd2bmr1406783685a.1.1771886701837;
        Mon, 23 Feb 2026 14:45:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3e9a2sm1832057e87.55.2026.02.23.14.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:45:01 -0800 (PST)
Date: Tue, 24 Feb 2026 00:44:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
Message-ID: <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX2Bn2DD2T6tKD
 G67izcr1hp5ZeHAqC4LxtYFZ9oaeHOb4Aw+vvKfFYGveX1SjUjtCJfe95VjZ7hExCeGd4T/Zb23
 5banXc1y7VGRpQvzpSswpYUpt0Ee/nJIfgu+EgBZb1gk7j9atdu5BEXaOYjwYH2FpXeiOb+sIAT
 xP6P2iTtg6z4GFze/CIwKzteVz/98wwZK/DBBNDe2i3b5U6DAx0GFDo6XdKxyLLKcrGF7EKGczG
 z77NH7x3snLMD8tHn6FknsGQdmMBspXE+hjHbWOCoxlQ6MXEpKQ0CMLk82rgrg0zI0E8UXS2ROU
 hj+5ITeQu22334aPvcrOs7Upm613SIjC7h+Aaw8tTMK+0AjIcQKp9AKLLE1qlILgJzKag+x9Vt2
 x4t8QPdJeay0FjnaUWTJTVWE2wgQnlAIuEMmtnqYnWKWY1rKaK3iDImhYjydHhkCbNZLNwPEmbB
 EIp2dXcmUg9oX2bmz+g==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699cd86e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=m81VUDHjpZwfiQc3ckkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gRUbrtVUBofHG9qfUkUicdukHLw4PeSD
X-Proofpoint-ORIG-GUID: gRUbrtVUBofHG9qfUkUicdukHLw4PeSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230197
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53248-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A32CA17E881
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
> DSP accelerator (QDA) driver to represent DSP CB devices that require
> IOMMU configuration. This separates the CB bus from the QDA driver and
> allows QDA to remain a loadable module while the bus is always built-in.

Why? What is the actual problem that you are trying to solve?

> 
> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is

Don't describe the patch contents. Please.

> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
> updated to descend into the QDA directory for both built-in and module
> builds so that the CB bus is compiled into vmlinux while the driver
> remains modular.
> 
> The CB bus is registered at postcore_initcall() time and is exposed to
> the IOMMU core through iommu_buses[] in the same way as the Tegra
> host1x context-bus. This enables later patches to create CB devices on
> this bus and obtain IOMMU domains for them.

Note, there is nothing QDA-specific in this patch. Please explain, why
the bus is QDA-specific? Can we generalize it?

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/Makefile              |  1 +
>  drivers/accel/qda/Kconfig           |  5 +++++
>  drivers/accel/qda/Makefile          |  2 ++
>  drivers/accel/qda/qda_compute_bus.c | 23 +++++++++++++++++++++++
>  drivers/iommu/iommu.c               |  4 ++++
>  include/linux/qda_compute_bus.h     | 22 ++++++++++++++++++++++
>  6 files changed, 57 insertions(+)
> 
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 58c08dd5f389..9ed843cd293f 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
>  obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
> index 484d21ff1b55..ef1fa384efbe 100644
> --- a/drivers/accel/qda/Kconfig
> +++ b/drivers/accel/qda/Kconfig
> @@ -3,11 +3,16 @@
>  # Qualcomm DSP accelerator driver
>  #
>  
> +
> +config DRM_ACCEL_QDA_COMPUTE_BUS
> +	bool
> +
>  config DRM_ACCEL_QDA
>  	tristate "Qualcomm DSP accelerator"
>  	depends on DRM_ACCEL
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on RPMSG
> +	select DRM_ACCEL_QDA_COMPUTE_BUS
>  	help
>  	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>  	  This driver provides a standardized interface for offloading computational
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index e7f23182589b..242684ef1af7 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_drv.o \
>  	qda_rpmsg.o \
> +
> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
> new file mode 100644
> index 000000000000..1d9c39948fb5
> --- /dev/null
> +++ b/drivers/accel/qda/qda_compute_bus.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/device.h>
> +#include <linux/init.h>
> +
> +struct bus_type qda_cb_bus_type = {
> +	.name = "qda-compute-cb",
> +};
> +EXPORT_SYMBOL_GPL(qda_cb_bus_type);
> +
> +static int __init qda_cb_bus_init(void)
> +{
> +	int err;
> +
> +	err = bus_register(&qda_cb_bus_type);
> +	if (err < 0) {
> +		pr_err("qda-compute-cb bus registration failed: %d\n", err);
> +		return err;
> +	}
> +	return 0;
> +}
> +
> +postcore_initcall(qda_cb_bus_init);
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 4926a43118e6..5dee912686ee 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -33,6 +33,7 @@
>  #include <trace/events/iommu.h>
>  #include <linux/sched/mm.h>
>  #include <linux/msi.h>
> +#include <linux/qda_compute_bus.h>
>  #include <uapi/linux/iommufd.h>
>  
>  #include "dma-iommu.h"
> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
>  #ifdef CONFIG_CDX_BUS
>  	&cdx_bus_type,
>  #endif
> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
> +	&qda_cb_bus_type,
> +#endif
>  };
>  
>  /*
> diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
> new file mode 100644
> index 000000000000..807122d84e3f
> --- /dev/null
> +++ b/include/linux/qda_compute_bus.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_COMPUTE_BUS_H__
> +#define __QDA_COMPUTE_BUS_H__
> +
> +#include <linux/device.h>
> +
> +/*
> + * Custom bus type for QDA compute context bank (CB) devices
> + *
> + * This bus type is used for manually created CB devices that represent
> + * IOMMU context banks. The custom bus allows proper IOMMU configuration
> + * and device management for these virtual devices.
> + */
> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
> +extern struct bus_type qda_cb_bus_type;
> +#endif
> +
> +#endif /* __QDA_COMPUTE_BUS_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

