Return-Path: <linux-media+bounces-60973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ATNBBNG/mlFogAAu9opvQ
	(envelope-from <linux-media+bounces-60973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 22:22:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9434FB753
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 22:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1D2B3040684
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 20:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAAE3EC2F7;
	Fri,  8 May 2026 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5p0s194";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yz6oCRsw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B716D3D903C
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271749; cv=none; b=JY+M4NZGJI3J2h9gN+wlazYe2bcvwZ7oAUtkGIxoiwcDPSg4a8fUMYQCTIYxbj/tpMOTq7kPT0NKY0ndyDr47QOe5laDNa+aeQ8RkpiQxdWixa3oe150Kj7Czgv1wbdstUZDtV2M/a3p5x8AN+Rla06SquOtd2ZmdR51tYWyhQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271749; c=relaxed/simple;
	bh=+FeoASb8ovnMoSwAHzqvf/4UpoY37EViOCEWLfpnb74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUpigv5c3KaksgmGmImcjIoQ2AspBgcmnkfAhj3ufE00BF2+zSMp420Bjglgcv9EcJgqUCbRzNcNpsqvfkp5y8oEAVAaVf+LAnjDOKIJ3pnM5SELOhCbWkT4U8Rp1tfNfI/UEq3jpgEZccgiQfmooKhYKpvgVoEJ0VfUCmfIoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5p0s194; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yz6oCRsw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G364u725045
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 20:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VvGwdKoiuQ+OZDlMszXSVliH
	FXLgaU6CLyX9TMT17Ho=; b=B5p0s194aR8s0/a2ojrmD6M8cEfqeXH6atcP/8jk
	PI7SOP3XLgIJruTqRBntcvcm1q351weYMhw28ITDtVockz1ks+zO2bzMEdOdIGNq
	UDGERjRzkkJE5BW+w3807tfBNCF3LW4x/FdPu/W245IFQLgd8mHzstqkaQn4IEMg
	jIRyzpS72pIrfjjWSn+EWG3nc35zJUJkDtw95ScOVKMCkWV7nMjZspWmbAxgjA2/
	YylzbBv2B8qZUyruZcbwZeM5NxJbLU22XDuixULG5+VIZ4WTpnLzcLobzleAifFa
	GkoRZDIcViRH7JJTvew3PopGFUp6q9wDtY3Ke3swubKK6g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0ugv38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 20:22:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ce6d50ea7so1517406241.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778271746; x=1778876546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvGwdKoiuQ+OZDlMszXSVliHFXLgaU6CLyX9TMT17Ho=;
        b=Yz6oCRsw+G+fr2Uo/C4HxfGxifsPewj8ASO4ZTXDa+sFnqq2ZD2EKV/IgTDtF2vc5p
         wWQSQHU+9Dn4+zi+fQLMMLk4xOjmbszN4Sx1C80iXprY58+QQRvYKZ9GnWa5BwIkmPCh
         2Sk40b/rQur2kHKn/LkD4JbaRLR3lzaozsV78WCkUwCG0TvBSi35YhsJ8cNG6+On9Ls/
         2L80zafucUbedA1RVVjew0LE0AW3U4w/rjVOYgXzjeH97vpN3qb6rP/929tSkuCrpWOx
         mj1GMyttheYXxRM1nyCXLtLhXt3IvsRaJihUEfDYpBVCaylHV86ZqKTul4x0QnTCsYdf
         b5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271746; x=1778876546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvGwdKoiuQ+OZDlMszXSVliHFXLgaU6CLyX9TMT17Ho=;
        b=LJj3p3dK2Ox69moAN58vtlqN1zOFBZOH4BXysOlAIvbA6ixAMsctzP6vJyeaDSb0Ky
         ss4P1QMFcYqUhyU1Qx/nM6JJ/6GsDgSgCQ+UetIpPNxsixa8eTu7gYqc++0huZJLM2EP
         3PGVC4ySW/MMHdbmCXlPbaC+yxovv8Z+ilWI1/XEv0MVUuFTzJMmnq7kR2hFoFaQAmpF
         klxx+1ltNd5CVqUTpSHndLU+CwCmeH2ldY+JykMvQfEnVVQmx6E7Jk7hOT7SM54oLDLS
         qC9dq6c4QLdpXIjd+K1IGWzvNz5nY79Q/ngyFydHIu3UctLzTEzDskvWKq4zEfCB3djv
         aOFA==
X-Forwarded-Encrypted: i=1; AFNElJ/AEcU0dD0SSq3EfB4u9ZQKNENMF/DPT7fluKP8dJ5dM/UMZnOHJiBUCh3R8weC2kq0xblpd+HFXLNxHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHoNzBaEjntfz05R8ly4SotAPH9TLPgxiD8Yc3NXW6lZz4KfcJ
	wK+p2byNGMgyyhIQCDXTzp84WJhwmEJ0Z0I8wmapGTse6VZ8vxdKAO71SFw41KkG6wi7QWPcJQq
	OimQUnGQqJHYv3Otu/PvEopM7ydygOzUzcvQgN+yixa8LSkgHzhlRKNQ+L4scdaF/kA==
X-Gm-Gg: Acq92OGnEinFqcJYcEUmR6JYAljM7bbtnIX5gIvIBsZdtLRiERAb6AeiGJWmcS3sLyz
	g7+tI0dbpEsbGm84g/9DyVdL7OmhiT/UJCf+PniylF17oE4Dke5ChY2I9DY1mg12brjw2RBoz8f
	BFQ1cE5Aw6NlrJFaRpwmQuIR7pN/fxkkzMw3HKXH81RiXqvjZyqT9gpCibCi9X6O+ALBjymzXRY
	Y7elCUyFyyJyzDaKh0niY+bh0DnUAko/RenBwLbyLNjLvGTdiTS1NH+Ni0eLWFsD6lmRxpUWPvt
	EkkJm20TA0xf45llma8oFCJxtpQHK9fgLEjA+t/Qb8/351aNxshXNLj6njmP+OaRW5uUK2qy7Wk
	Iaid95cTHy13W6BmLYTf9EYoFVOXGlEv3FXronrBdmCnepjq4scEkB1V7fL3QrbXCw4seBE5Uxw
	13NjKNoIE+lfk6zT1Q5IWWh4GzNW5bNdE0jBE=
X-Received: by 2002:a05:6102:4a83:b0:610:5b9:dde6 with SMTP id ada2fe7eead31-6313e95940emr2510647137.6.1778271745774;
        Fri, 08 May 2026 13:22:25 -0700 (PDT)
X-Received: by 2002:a05:6102:4a83:b0:610:5b9:dde6 with SMTP id ada2fe7eead31-6313e95940emr2510629137.6.1778271745340;
        Fri, 08 May 2026 13:22:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8b3e75c31sm263763e87.18.2026.05.08.13.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:22:23 -0700 (PDT)
Date: Fri, 8 May 2026 23:22:21 +0300
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
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe4602 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=z21jRD9xLDxBhwdHImoA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: lMUgJHyAMR2Q32CVa5EP49gxJAB-Grhz
X-Proofpoint-GUID: lMUgJHyAMR2Q32CVa5EP49gxJAB-Grhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwMSBTYWx0ZWRfX+UiTtOlUOVGW
 olk1Fe+4Hal2k97U5xvPLdTNaJKVPZRmHVMzqwqcFQP7EuN9Lpu3EHowUYqbuOyy1qGzf6HmGLb
 3BGn6s4qVE2UK1yoxYiTQKu259W+Uzngy9/p8t1QhtW8cUFDGDsKUhmILw+9UMy/PVEYDPzTJ4k
 icTZNczay8/mFvrq7SLpSobdmEIhKmPB1NJohm0IPTzrZJoINDldpkcUKPBP5+xd1jDBWppn21T
 NHRuQScR0CJVeFLqV2x2PxAEdXJcttDunDlBQ0kwwOxs1E2Mn5rcfFYEOS63UngcEIslgxD8xz+
 oFDYATDi7yUF9TdStBnvjQreQvsG4e0D6Sg5lot5eUjEhB/Q9YEup8Sf40ZA1Hz1YbQo5y+S128
 +AItU1RiPhHeJk6sC/DIggVrnqKe9sIQ6s2SzgQ16+8DimcU+R4vvSvnK8sYcUTMz/Nv7ykL4CI
 ddYzBkOPT2j8/cpFoDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080201
X-Rspamd-Queue-Id: 0A9434FB753
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-60973-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> The current clock and power domain enum names are too generic. Rename
> them with a vcodec prefix to make the names more meaningful and to easily
> accommodate vcodec1 enums for the secondary core for glymur platform.
> 
> No functional changes intended.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
>  8 files changed, 67 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 55ff6137d9a9..30e9d4d288c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
>  
>  enum platform_clk_type {
> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> +	IRIS_AXI_VCODEC_CLK,
>  	IRIS_CTRL_CLK,
>  	IRIS_AHB_CLK,
> -	IRIS_HW_CLK,
> -	IRIS_HW_AHB_CLK,
> -	IRIS_AXI1_CLK,
> +	IRIS_VCODEC_CLK,
> +	IRIS_VCODEC_AHB_CLK,
> +	IRIS_AXI_CTRL_CLK,

Why AXI_CTRL is better than AXI1?

>  	IRIS_CTRL_FREERUN_CLK,
> -	IRIS_HW_FREERUN_CLK,
> +	IRIS_VCODEC_FREERUN_CLK,

Can we at least group them too?

>  	IRIS_BSE_HW_CLK,

Is BSE a core or a codec clock?

>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
> @@ -206,7 +206,7 @@ struct icc_vote_data {
>  
>  enum platform_pm_domain_type {
>  	IRIS_CTRL_POWER_DOMAIN,
> -	IRIS_HW_POWER_DOMAIN,
> +	IRIS_VCODEC_POWER_DOMAIN,
>  	IRIS_VPP0_HW_POWER_DOMAIN,
>  	IRIS_VPP1_HW_POWER_DOMAIN,
>  	IRIS_APV_HW_POWER_DOMAIN,

-- 
With best wishes
Dmitry

