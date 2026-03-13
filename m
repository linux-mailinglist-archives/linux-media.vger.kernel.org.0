Return-Path: <linux-media+bounces-55720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ1JB6YvtGkEigAAu9opvQ
	(envelope-from <linux-media+bounces-55720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:39:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D172862C9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7C5E30BD84D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB043AEF50;
	Fri, 13 Mar 2026 15:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJnd9com";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="igja4aV2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAFF3A9D99
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416017; cv=none; b=Z4iuxLRZutGTue7KPEHcfceSPEwDUlmkBsOdDJetgHQJ334yCX6fKZDAjh9h4MfAC4sPEGPmmbUWHK2bIxKF63JU4N47j0FW2tlgj+t+I+b/6VAZDNKxtuaPibWekDEc4uC5b0aQYY4IfaVODpgjk+NT+9Lo3L+qmvJyrGYwIRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416017; c=relaxed/simple;
	bh=6XPyB9wy9r7sok3/mzU2gcwSqfnFfzrVcMAeCwKSMOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWNjgjqcnqQXuivX2HmsJpmVlxyYXKlJGJsZEGTeTmKFtP8KM/+el8zCwAURD5o66YO/3BQ/NZT39tHqDPb5FLxgRbihP13SGqcSwYR7XN+pApfhbJ78ey28+rZPPWIzrLbD/mIBI+AqQt/Zfb838YO1xbsoUS+8pyWlc5ZuoCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJnd9com; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=igja4aV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9TqJF1499093
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DwF0bPWZ6oi8ritDg3vFgvNy
	ZC4OuWcxK8of0tlQr1I=; b=cJnd9com/Oox/7j8KZb491SurS4VnV+nszFw3r52
	yp7EQbMxf1+AcDgw4j/QSXIg+0DlbCWRhEd0WHXAIfRK8GL+YLXLk64L5j7KQ0c4
	OKw4Vl0THq+dLN6vaCwM5qaNFaCufrrMP6/gSlvg6NW07222HIfXH0rDIirVAAaW
	OpS5TFfbvRGwCa4OUjwQpsQld/CmK36rhmt9uJu5eU1tQXdd9tsxaeX2e/GWaaxZ
	eXRDRphZonZ1fUivmZ+GOW+pZ7LC2zi8ojZ/XVAnElsZaJwHJSlLXaYiS0znR15W
	+VXaRcM2nfzR1IEYnqTiaJw5vagaZ1PAsyI/Ji41Nu+YsA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hh6kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:33:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091f12ed3bso168495431cf.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416014; x=1774020814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DwF0bPWZ6oi8ritDg3vFgvNyZC4OuWcxK8of0tlQr1I=;
        b=igja4aV2EB06ZIMvRILXr4owtnACYz5CcwUyoZ80RspD5IPokEyFmOcqQhcs/qaN4b
         7tF+AJ6KXCUh2XR3+h7hJyy8QxNQ0OdrKwgWEEcabVOjhbhxQzv2tbK1A5ncg3jb66ii
         dSjTWGVgjJ9xzHvm5PnTU8c07rLsUXx5TFrfXnfLbRYbnZcLBzSo0IkrIuzR3AONw4gK
         eVeqwkK6JHEjK60w63R9hrCl+/qGN7WbR61OLkDM1HuktfZl5a4YCqaKbC5cOiiCiDNF
         1iOUY9iYN5+MqKfpXkKrzLhxoeqP+VIzJgQsSwXgcGcioA3MoHOony5MZNqSspDtGzX/
         hTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416014; x=1774020814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwF0bPWZ6oi8ritDg3vFgvNyZC4OuWcxK8of0tlQr1I=;
        b=oFM/b1OH3kObCUFIVQwx/T2QdOh5EgLYAkjK/jEaLg9CTzytQE0xm4MNeP5sSvCieb
         TRH1iPD3Wzw7xd9DfxAdMkHoQogA8FqCXbjzY3Tq0tYRuXyedhBc6PIOPg18OTZj/NPS
         P9pOX0MBGDF1AGhc0YYMkNF3npO2Cx6PchS5bDAyELV9DxOaqNma16WevZsEpu1i4rj0
         rDdcHoiky7J8sMkPOw5yHJwFXEvVT5wBUJYllH672lMpZoxkjLvhZHXDbLgRsbNo3Ts0
         A+3SyC9160MMIB9300mSUtOqsIRsCRqHRHg8Qx4j2VyWQFz3gVMglrmfxTb7FInVfr1X
         j95w==
X-Forwarded-Encrypted: i=1; AJvYcCULr1eaR3z4ex7dIDgMaorkT9cGHl0IERchch4mjaE3CKt0fU2bikoYLiRdieJ0Cy9bdBFvbFYvHYD/RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3lYnE7heK+zDHeHmPjm2fdigU9/vTV8RjEahntxZzGb9epEGJ
	DbxF7FieRRmCbdsVLEwl//Hi/BgxpGYKzS4eixFcubN2wBXeGuOqitypi1BnE/O/tkI2dN2O6KI
	CymfaYz3yr6mrj4iAnWgBt5xg7/OBWlwGrwh6cif7ryAZaErjAoSrOSngL9yLh2wk3A==
X-Gm-Gg: ATEYQzyH9I+6nTNm4afCLHzk8l1OvLavHnbqNqEkJRQOL10fRqcNmzc/G9al/T0Dvd3
	rOOpnHSLfWg6FGv/SHRjWkRITK13x/jKtMC3hhAzgC2QYM+zXvFBNDE7rQT/kb1FEOVx7R3cX3I
	yXZw6giuWn0Zv7ln4SYT1zJ6vk1ZuPJJ7VAxBRk6GnJ4p/6OuXN5jHZMb9OBB362ftX2KtdHTUn
	Dbr56nPBWIonIQIsfWTFgdCiMJGoO8D83V/8gFHMP0UhgypkOEXHmMyIt3cRl4NgNDp7Pkf06YU
	Yti8TxJ/CJb48d6MGHcLxPFUOR+Tm+nPokTk4D5gNsQs5+4FXfGG9YwlXdsMwk/RIwBeIPFw4Nz
	G90ALaw8MsbDqbdwyFwixrz/7jPFxFLzId58z9isAKQ8Xwn8At0eqU8FkxhJ8hRhvO+iLc/M40T
	8pej7wSA6Hat32LxGrSR2G3B0WUx32/sKeoo0=
X-Received: by 2002:ac8:5f8c:0:b0:509:1f95:f3c2 with SMTP id d75a77b69052e-50957b890eamr48112771cf.13.1773416013628;
        Fri, 13 Mar 2026 08:33:33 -0700 (PDT)
X-Received: by 2002:ac8:5f8c:0:b0:509:1f95:f3c2 with SMTP id d75a77b69052e-50957b890eamr48111991cf.13.1773416012867;
        Fri, 13 Mar 2026 08:33:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm14335591fa.22.2026.03.13.08.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:33:31 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:33:29 +0200
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
Subject: Re: [PATCH v3 4/7] media: iris: add context bank devices using
 iommu-map
Message-ID: <2l4izvnne7mgzoepn2ckctqxpz4tbi6pgeoobon32cecyf64mz@mhx5bicwp5na>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-4-9c0d1a67af4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-kaanapali-iris-v3-4-9c0d1a67af4b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b42e4e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dvUJO55wfCtd56IAzl0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zYaUpH3CSosQ1d3xsxOwUUoxr59huax_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMyBTYWx0ZWRfX//fblfSAPKk3
 evjPzbfdLLWNrjG9kAy6xktl908qbFTzxRwXnDB6Gzyd4w+GI4DkUXtvg3R+owlbyMpWXR4mLFE
 VFF3HN3lyhhwo2X4u8KWp2M3xrghpVVxT43KIoWcITueouU0uPu1E7BOKSc3piuVkM1gGpBS9dc
 TFgsIjZeQsKITtQk+pOx/nKjp6zOlfBbQ1n/ykM6kRA826jDloTaZ9s0n6ptRzh3p0+Pa5X4KOK
 ivCdeh6qU60v3+voEIq58lyE3yZ15PZ/NnCU02Xo8iVkXl/NuSJ8I/YvdGhx8AH7Mo26h5VPrzX
 POEGucjTNdAiYaoH/L1K4+RLTHCTUxSc7fyKfCs94NEaRBeStlgEn8YNlz0Zk8BzymeFxhOTZc5
 nI7Y4UR6jFRsxWD0mtVq6p6pOVkQ0Ikr19nXt7C+Q4CxYjaoB7gPThpuei2ydipdvjQpH2qGyl6
 bHwjNqL6lPP22gbUKNw==
X-Proofpoint-GUID: zYaUpH3CSosQ1d3xsxOwUUoxr59huax_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55720-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 85D172862C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 06:49:38PM +0530, Vikash Garodia wrote:
> Introduce different context banks(CB) and the associated buffer region.
> Different stream IDs from VPU would be associated to one of these CB.
> Multiple CBs are needed to increase the IOVA for the video usecases like
> higher concurrent sessions.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>  .../platform/qcom/iris/iris_platform_common.h      | 14 +++++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 66 ++++++++++++++++++++--
>  drivers/media/platform/qcom/iris/iris_resources.c  | 46 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
>  5 files changed, 125 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..62364bd6909e9a03d223bac86962dc9094a40243 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -34,6 +34,7 @@ enum domain_type {
>   * struct iris_core - holds core parameters valid for all instances
>   *
>   * @dev: reference to device structure
> + * @cb_devs: array of context bank devices (eg: bitstream, non-pixel, pixel, etc)
>   * @reg_base: IO memory base address
>   * @irq: iris irq
>   * @v4l2_dev: a holder for v4l2 device structure
> @@ -77,6 +78,7 @@ enum domain_type {
>  
>  struct iris_core {
>  	struct device				*dev;
> +	struct device				*cb_devs[IRIS_MAX_REGION];
>  	void __iomem				*reg_base;
>  	int					irq;
>  	struct v4l2_device			v4l2_dev;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 2273243d1a80446233dd82dcd77444aa043ad064..df63a06b8401cd367c69ab8909af227f04bf69bf 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -204,6 +204,18 @@ struct icc_vote_data {
>  	u32 fps;
>  };
>  
> +enum iris_buffer_region {
> +	IRIS_UNKNOWN_REGION,
> +	IRIS_BITSTREAM_REGION,
> +	IRIS_NON_PIXEL_REGION,
> +	IRIS_PIXEL_REGION,
> +	IRIS_SECURE_BITSTREAM_REGION,
> +	IRIS_SECURE_NON_PIXEL_REGION,
> +	IRIS_SECURE_PIXEL_REGION,
> +	IRIS_FIRMWARE_REGION,
> +	IRIS_MAX_REGION,

Why do you need this enum in addition to the DT bindings? Where are the
bindings being used?

> +};
> +
>  struct iris_context_bank {
>  	char *name;
>  	u32 f_id;
> @@ -252,6 +264,8 @@ struct iris_platform_data {
>  	u32 inst_fw_caps_enc_size;
>  	const struct tz_cp_config *tz_cp_config_data;
>  	u32 tz_cp_config_data_size;
> +	const struct iris_context_bank *cb_data;
> +	const u32 cb_data_size;
>  	u32 core_arch;
>  	u32 hw_response_timeout;
>  	struct ubwc_config_data *ubwc_config;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ecb9990af0dd0640196223fbcc2cab..439e6e0fe8adf8287f81d26257ef2a7e9f21e53d 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -123,6 +123,55 @@ static int iris_init_resets(struct iris_core *core)
>  				     core->iris_platform_data->controller_rst_tbl_size);
>  }
>  
> +static void iris_destroy_child_device(struct iris_core *core, const struct iris_context_bank *cb)
> +{
> +	u32 index, region_mask = cb->region_mask;
> +	struct device *dev = NULL;
> +
> +	while (region_mask) {
> +		index = __ffs(region_mask);
> +		dev = core->cb_devs[index];
> +		core->cb_devs[index] = NULL;
> +		region_mask &= ~BIT(index);
> +	}
> +
> +	if (dev)
> +		device_unregister(dev);

Which devices will be unregistered? You are setting dev in a loop, which
means that only the last one will be unregistered (and only if it is not
NULL).

> +}
> +
> +static void iris_deinit_context_bank_devices(struct iris_core *core)
> +{
> +	const struct iris_context_bank *cb;
> +	int i;
> +
> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> +		cb = &core->iris_platform_data->cb_data[i];
> +		iris_destroy_child_device(core, cb);
> +	}
> +}
> +
> +static int iris_init_context_bank_devices(struct iris_core *core)
> +{
> +	const struct iris_context_bank *cb;
> +	int ret, i;
> +
> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> +		cb = &core->iris_platform_data->cb_data[i];
> +
> +		ret = iris_create_child_device_and_map(core, cb);
> +		if (ret)
> +			goto err_deinit_cb;
> +	}
> +
> +	return 0;
> +
> +err_deinit_cb:
> +	while (i-- > 0)
> +		iris_destroy_child_device(core, &core->iris_platform_data->cb_data[i]);
> +
> +	return ret;
> +}
> +
>  static int iris_init_resources(struct iris_core *core)
>  {
>  	int ret;
> @@ -193,6 +242,7 @@ static void iris_remove(struct platform_device *pdev)
>  		return;
>  
>  	iris_core_deinit(core);
> +	iris_deinit_context_bank_devices(core);
>  
>  	video_unregister_device(core->vdev_dec);
>  	video_unregister_device(core->vdev_enc);
> @@ -275,12 +325,18 @@ static int iris_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, core);
>  
> -	dma_mask = core->iris_platform_data->dma_mask;
> -
> -	ret = dma_set_mask_and_coherent(dev, dma_mask);
> +	ret = iris_init_context_bank_devices(core);
>  	if (ret)
>  		goto err_vdev_unreg_enc;
>  
> +	dma_mask = core->iris_platform_data->dma_mask;
> +
> +	if (device_iommu_mapped(core->dev)) {
> +		ret = dma_set_mask_and_coherent(core->dev, dma_mask);
> +		if (ret)
> +			goto err_deinit_cb;
> +	}
> +
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
>  
> @@ -288,10 +344,12 @@ static int iris_probe(struct platform_device *pdev)
>  	pm_runtime_use_autosuspend(core->dev);
>  	ret = devm_pm_runtime_enable(core->dev);
>  	if (ret)
> -		goto err_vdev_unreg_enc;
> +		goto err_deinit_cb;
>  
>  	return 0;
>  
> +err_deinit_cb:
> +	iris_deinit_context_bank_devices(core);
>  err_vdev_unreg_enc:
>  	video_unregister_device(core->vdev_enc);
>  err_vdev_unreg_dec:
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a257b8ae7332242544266cbbd61a9..a2e648f4cdb8c63db89396d49f32bbc06d870ea5 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -6,6 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/devfreq.h>
>  #include <linux/interconnect.h>
> +#include <linux/iris_vpu_bus.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
> @@ -141,3 +142,48 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>  
>  	return 0;
>  }
> +
> +static void iris_device_release(struct device *dev)
> +{
> +	dev_set_drvdata(dev, NULL);

There is no need to clean this pointer.

> +	kfree(dev);
> +}
> +
> +int iris_create_child_device_and_map(struct iris_core *core, const struct iris_context_bank *cb)
> +{
> +	u32 index, region_mask = cb->region_mask;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = kzalloc_obj(*dev);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->release = iris_device_release;
> +	dev->bus = &iris_vpu_bus_type;
> +	dev->parent = core->dev;
> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
> +	dev->dma_mask = &dev->coherent_dma_mask;
> +
> +	dev_set_name(dev, "%s", cb->name);
> +	dev_set_drvdata(dev, (void *)cb);
> +
> +	ret = device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ret;
> +	}
> +
> +	if (!device_iommu_mapped(dev)) {
> +		device_unregister(dev);
> +		return 0;
> +	}
> +
> +	while (region_mask) {
> +		index = __ffs(region_mask);
> +		core->cb_devs[index] = dev;

This needs to have some explanation how region masks work with the
device types.

> +		region_mask &= ~BIT(index);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> index 6bfbd2dc6db095ec05e53c894e048285f82446c6..c573016535b87d4fd140cad967d926cc1de63382 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.h
> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>  int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>  int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
> +int iris_create_child_device_and_map(struct iris_core *core, const struct iris_context_bank *cb);
>  
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

