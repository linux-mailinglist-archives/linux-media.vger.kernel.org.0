Return-Path: <linux-media+bounces-30384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E6A90EA5
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 00:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BBF03BBD72
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 22:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B19023C388;
	Wed, 16 Apr 2025 22:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsPJL/4x"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A202236F6
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744842799; cv=none; b=CX35gD3qEl95MisCXEPeF3zgg3/YZPxjw/WMXkTVxOnhQt+ZntKdCDLQaA+Fu7MLCTIKgfzheflZoUZVwuBFvUHFWCJ6wzFZfU8zg/Mr6aDpYFbSH1Swob98xTnhM8Kqgk1ggusxG69RfB+qmd5arGhP60bW5uQZh0Gf3j11Hd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744842799; c=relaxed/simple;
	bh=WqH48F8YcdolMh0zLLnCiqwJuthifJNiCaxV2+++7Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGHWpcCESnmB9+1oi9JtFgzXEoudnEChGWEWNh/nVFRHtWtG2Y8ndTggV9sfX0PXnvnBj7j0oiX9A34ktgYm/kEUFFMDsAPNwfKtN8uu1xMCAIG7oDEGAe4VZlFgKhEol1Hhfy+d4T5D/LRagzY2eT0rmbnUozXF2njLsFqxPMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsPJL/4x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLksKa003450
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqAGRugCVeuCMNmiDbvkSP9E
	lATQzmpVN/G9d2BTZ8o=; b=DsPJL/4xTqZv2G8MTZFPRDMCMP1kQNrGq++h4rDA
	WNwFL9xeyiP/in5USr+KfqjTosL6pMRInJI33nBJhBibUDx75zar1OXhFfkddEIV
	IWLgTG7+MwElKcVqggeIG4abv0tVtS70qEIbkv9kCONXg+1s83utNsambL96p2nG
	WhO/dXXB6QqezE50GOueSN/iLU3C32tIs0x7LeNgNeHYKqtH70sDbY48d6A5uybs
	Ry2Cvk73psO7vD8l4WznY2MXVaCIUv1u/sZuryyz3cFCLjCN0t2T2+e3CBTYvUc8
	XShUyi6buVm8gg9H1VNr2CY72As91IlDoEEvjz2lsKeZVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rva79u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:33:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c548e16909so9871485a.2
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744842794; x=1745447594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqAGRugCVeuCMNmiDbvkSP9ElATQzmpVN/G9d2BTZ8o=;
        b=f8nJ1a2ovPv8RYqmysp0y83xy0zIVUzdUYmeT/LnV7muAeeu4+VTvv1zRrA1KInIhU
         Mp6zvP6xvBKlJDKCxGgiwDF2tpWPdDhQB6yqERIKSyLUTKNL0pQsrFAYSGmZxlEBf7Hy
         1N0xdyXkFz8oLpO8TKvH7nnM32P8rmH7kiMHraA/QaT4+EkAQkiKlQYHVmNAWDBBZkbF
         5BfZBR1p3e853zAqhvCpRVMpTeW7aFNdzbL0xsi2y8+e+qnZOCVgqwDs6fz2tXTuMb2H
         q1mJKo0xM/KaguDR6L9Jz0cFEQFQKg9k/VzAfRWltuPjETnqqkcAch5BvQqnFcBwFnt3
         PjIg==
X-Forwarded-Encrypted: i=1; AJvYcCVNQfar72ruttXpb3pjNfbPl0x4CblTMD5DfsDSSnNuW+MhgdgotgNRSI1qhBj2bIGB3lzmHkgyRrhrCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1R3CBE8Pk0uXOLUE9PYw4Gaa/6i0Xv1BzPWiKoS9Ux+5xBMJu
	godI2fm7x/fDQ3WA1EoxOam0k7u/gwaPRJmZ+thhQs1q4sI8IOG6cWrId8S24LVzk5Aue1jGT2Z
	UghhjUlfA5x0BWIGaIXZg9dPYwSr5JjQUPfXDl20yhDNtL9Cc2Hf71QlsPhLogA==
X-Gm-Gg: ASbGncv4JBrVu+stzJEM23yk2SCuXjegBzhfGLYKoEjX3io4C0XmRI5fPYqAEQAQx6L
	DO0gzkHXGZ1GlPIyneMWX9G0X1NGUQpo5kQC4Cg7o9I3Dkn1kAhyJxu9vgS5Ef38GpKuluLaK5K
	EJZc38o0/4FvG3nt41CcWwTf8yW/FGppXSul6ZYhuvzECp8o6+HUmQ1+NbLxriahyhwCfNbd+sy
	PjwcxPxXGOiYWwPUQMteDaBqKGCZ259bRHLdrWgseWZ+V8jigWmzdvtf1cqz4MuX1h0TBgtG+VV
	ovFlp59kCrxi1NS/jFoIxRAWyOX7jt2cdCK+iyfXpCS4rr8VNACabCF8WVY7Ir5BJy4IbXXOAUA
	=
X-Received: by 2002:a05:620a:4153:b0:7c5:460d:45de with SMTP id af79cd13be357-7c918fcf8d2mr510613185a.8.1744842793712;
        Wed, 16 Apr 2025 15:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeiMAJfn9WbdbUz3M6lgFaz235RBZLLYHrTwSETB2UTdTqQMJK7O8E8xGkhg7KD5d5ucZCPQ==
X-Received: by 2002:a05:620a:4153:b0:7c5:460d:45de with SMTP id af79cd13be357-7c918fcf8d2mr510609185a.8.1744842793335;
        Wed, 16 Apr 2025 15:33:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm25367541fa.62.2025.04.16.15.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 15:33:12 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:33:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
Message-ID: <qwl4vy4ioui5ebqp2u2uyrvlpqvb3uxun5wkvf4attsjcp7hrx@socnkyyg3akj>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dB6dMm08uKA93agabWQ7ip9L2mj_u9Ck
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6800302b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=C1iuyIOyw383eEmvdYgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dB6dMm08uKA93agabWQ7ip9L2mj_u9Ck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=995
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160180

On Wed, Apr 16, 2025 at 02:09:03PM +0200, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile    |   1 +
>  .../media/platform/qcom/camss/camss-vfe-340.c | 281 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>  3 files changed, 283 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c
> 
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,

No need to use inline here, it is a callback that will be called by the
pointer.

> +					enum vfe_line_id line_id)
> +{
> +	vfe->reg_update &= ~BIT(__regupdate_iface(line_id));
> +}
> +
> +const struct vfe_hw_ops vfe_ops_340 = {
> +	.global_reset = vfe_global_reset,
> +	.hw_version = vfe_hw_version,
> +	.isr = vfe_isr,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.subdev_init = vfe_subdev_init,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = vfe_halt,
> +	.vfe_wm_start = vfe_wm_start,
> +	.vfe_wm_stop = vfe_wm_stop,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update,
> +	.reg_update = vfe_reg_update,
> +	.reg_update_clear = vfe_reg_update_clear,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index a23f666be753..9b138849caca 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -242,6 +242,7 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
>  extern const struct vfe_hw_ops vfe_ops_4_7;
>  extern const struct vfe_hw_ops vfe_ops_4_8;
>  extern const struct vfe_hw_ops vfe_ops_170;
> +extern const struct vfe_hw_ops vfe_ops_340;
>  extern const struct vfe_hw_ops vfe_ops_480;
>  extern const struct vfe_hw_ops vfe_ops_680;
>  extern const struct vfe_hw_ops vfe_ops_780;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

