Return-Path: <linux-media+bounces-61393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGA8AXBWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:46:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D553191E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3006E30557B6
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139FE3EFD24;
	Wed, 13 May 2026 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7suu8JB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwdnWGOx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D2F379C2F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669135; cv=none; b=tkwBj4ulb6oQ4cu7Gqas8Z1nOzH8YWX5O3ptm0ioW1e4UuinZdrMM3SklxkdD0SYQfe9ruKoi3XXDUj3BvdT+Vk+TQ/ny0vHAGIW0nuMr9dHQ47sHoSOoddkT+utAm6fdQfy+sToK3VK8VQqZcopDtapcqqxFoGV7hBhxXC5CFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669135; c=relaxed/simple;
	bh=oJ2fqk1W/16s9nzcDQBXojhk/XMkE0ss/He9zlma3kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwX+7tpHe0t02Q2JX9Xxl9nHUWBbNoAnlhP9EbQjDoPx8PGaAYuv4ZJM3bLYZuGoV/KQZb+0cAG2TfrXYU/jOeAqyJYb1MqRGRBv5LWYzcmUDWFdGHICLhf850z6SWbH9XDqoCTDxfXsYgy0VPf9hMMgCNXm4X+4owe5M0VHZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7suu8JB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwdnWGOx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8xgOI4161718
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vENCCUHbcJ7o6OBuExz9lMOn
	FO5tArtUpU8fistw/ck=; b=Y7suu8JBR7AtIXRgSJaj4wd5KgDq76p/XN/VddF/
	fM4gHi1tSxjLrwBmDWg4+O9P7AIS5buRo3HCPogxKZT5jHrPTw4rhV0EfHXOugDz
	TBG8/udvCC+wHQQvMbt2Ab1VDKscp0b7h2mM8tr2yyCogUx2XTUmrqSp9nZUyKad
	UWh9u0ZGFvXzhjdptLEi7a+fEUrfVLt3gJtb4BEilAEpdRDlgnKwhDxjJRmX+SPc
	c4JkDEV5X8awUVkxUYMC4Ne5dOqTJpTjOSgaGY1Aevq/o/eiiWIna3n/5F42A2bw
	gs2TDXYNhl9iljpSxb2UTdJ+htK7+pqlKnTMWmTSERN07g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rcxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:45:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so59775491cf.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669133; x=1779273933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vENCCUHbcJ7o6OBuExz9lMOnFO5tArtUpU8fistw/ck=;
        b=VwdnWGOxKY8sVKcIgapx2MddvYYnUvARQr8mYTAmEmltlJnEb+sVNsADnTyLFyS8Ht
         i39ERPEDcsRDOZRCJQWL+RP9Bv4fUfaz1ZZwJjcLYawXuOMIvuFe4JzgL2h81jCytu2p
         ppQzTexMYSV4F5+tXflK/IUoWn5+TMY+xLT6M1guUGLBQVohH9fqZKBjYzV+3WRNmpCp
         K8/o/C4l4FIQ4+FeqCrU3qUvujnvPhQJCaorH2AiOlEm65OFV3Gfbn+HNH/8EDdOzsaz
         CD+qnKI/VI06N/80fmcilJplGHgiqCGg9Z88NoH5zecez55sUqzDPfoIhbgiqPxlh5KE
         Zypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669133; x=1779273933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vENCCUHbcJ7o6OBuExz9lMOnFO5tArtUpU8fistw/ck=;
        b=dPk7mtDym+VBLyOrUZvu7KMuVkpve21vz2QDBIpx8JUEj66cOOOAMvwnJ+VuG83oVV
         rL/6PPL+rtuTM0t5IYfU8nJwOsiRdkeQYURaTl75Z/I5ebF2Kik3l2OZ/YHSDur0/Msa
         TdLe3Go7CxcZzCjdzsYfbpXuc+lrXnPdydjezz6EJ2QbeobxHFTYxI9lAGFSslAnC1cA
         CjrVGrufMGkoUHZt9i2kxw5Hv58SoU1rRQUU/BAxQpVSzY8uOrkoHT1bR2S58dSDUQqu
         wckxkW9LT4SZRnyCUgkZ01Fo1FJaLtphYEUlrEhlX5XkVsA+0Wto6UsqTxeCrm4+v+aJ
         2uog==
X-Forwarded-Encrypted: i=1; AFNElJ+qPlO9HCGrg7mpUCXz+VupWt6qhOVHWo/BlSmCXX6VNXA9bIeIztjxzy3S0VUIRwaoGfavc16J3K74fA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9rsGo0skaHFx3ZeMaPGV1ufuTo4qMz+ME22isxTvX+L+vokT8
	YCCSC3Ddr59lAr6PEeFVVGP0MTPnKA9syWAznkY3hR5DB6aTbus6caCh+7ZoDIXSjl1Z7x1pDqt
	n5vC1ib9VyIU3/4jPRrs9JRmIETDGNc+YMWFn4esUonCz2EpNSKrbdFRFextx6pCTEA==
X-Gm-Gg: Acq92OFTASB/5h6z0UmdBBO3TU7XfHpzoTpCoTCVs4IWaoaidsMyMunOXhedV6isTnA
	O54lXveVG4eCl0JqiGDXNhAr7WONCGi9g8LkKgmmbkKPuMeq4I6fj58oAfpBq2xN1c7gwmTpZBT
	zEt2T8txmvE7R+DtbQ2euf0YJfs8AkpJ1JRYVBGlvYZkijrV6vVRIwzJZmXEV3t7A7EAun45eXx
	laztnIr+3Tvj2cnlqR7G8cf73MuKWf4+oJp2Xdd/3Fvy6YoOnn8mIIWMV414afNGAgGSnHkIC0T
	1h49cCBCBX7v9MCZ4M0igs8P2NQh6klg04c1pAemMj+VjVLpd9m9/4W9bTtOh3H79SR4dVHq1Ha
	kATpPMwolaFnHAvVHfG5Fmen7Mo1qEbzMPrQo5XqNsa7vMjUUPmoK7O+6TN/fZa0gDti110BwDj
	CXQX8xQjP4/WgNnFqdo47HZFU+CwRYhOF7pDs=
X-Received: by 2002:ac8:594c:0:b0:514:d48c:f69f with SMTP id d75a77b69052e-5162f5eae22mr34218161cf.51.1778669132580;
        Wed, 13 May 2026 03:45:32 -0700 (PDT)
X-Received: by 2002:ac8:594c:0:b0:514:d48c:f69f with SMTP id d75a77b69052e-5162f5eae22mr34217831cf.51.1778669132178;
        Wed, 13 May 2026 03:45:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b225sm3922286e87.83.2026.05.13.03.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:45:31 -0700 (PDT)
Date: Wed, 13 May 2026 13:45:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
Message-ID: <yg7jatjy4ghl6m7mbldpdrqiv6vp7inyskaepsb7y2hsb3fadv@6m74ofi4jz36>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
X-Proofpoint-ORIG-GUID: 6ZFNoM8A7QOX5Khf3smksEXjfowWIW0D
X-Proofpoint-GUID: 6ZFNoM8A7QOX5Khf3smksEXjfowWIW0D
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04564d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=Nvab_HKmlmOO6rdt0l0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMiBTYWx0ZWRfX5nsaAEET+jL1
 pxgB/+xI1N5znVnnedTiAkLJ+xLPL37o04XfNdLDnaXaZHA+jIDhaJ+QZQRVbsz6o9Hc3NM3zZH
 nrG6kadALZ5Z7JuOJ+4J44nkJEDbsRf257tGJbIB+1MQCjiHy4TyscQXrlLUW5pcRDq3Sb+UmD5
 Ks6wYDD3bqFB0fWb7xJot0DobyuJiaMeZ7fqNuAq8VijMVUxs1TuugbBkyqRHO+sdEEpC/7lN/q
 SKCjGQzCHesVElPVZ/7AdBX2Ric1zs38iFp/U/0ddDiLcNTgxpCvfYIlDsUyfk+cjax6TrsbEZn
 vYQ4tvg+Zc2s9/WwQoh7cQjaSAhcUhZLIJRfa1HRTMzzNaLntuTszu6dc5xK2zaNiJSwGmoSyuA
 F+l/4MPC8ozeCxPj8N7//AdRfgJjOdawa2yD/2aKJ+k/nr8yki1ajvcwHA6STgvLh8T4C/5OAxm
 m9eFZdrUWQqpmIHsV9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130112
X-Rspamd-Queue-Id: 800D553191E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61393-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:31AM +0200, Neil Armstrong wrote:
> Add the necessary bits into the gen2 platforms tables and handlers
> to allow decoding streams into 10bit pixel formats.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
>  drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
>  4 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 0541e02d7507..b6d815c01f1d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  	pixmp_ip->width = width;
>  	pixmp_ip->height = height;
>  
> +	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
> +		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
> +	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
> +		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;

Do we support decoding of 10-bit videos to NV12 buffers?

> +
>  	switch (pixmp_op->pixelformat) {
>  	case V4L2_PIX_FMT_P010:
>  		pixmp_op->width = ALIGN(width, 128);

-- 
With best wishes
Dmitry

