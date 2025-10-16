Return-Path: <linux-media+bounces-44742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E7BE3CA5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 15:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF42B58843D
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C5E33CE98;
	Thu, 16 Oct 2025 13:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4W2Hmky"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E73B32C33B
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622437; cv=none; b=dv9TNwBwpZMBJ+wrpUyNFlwX54PFj/pw/dObi7unShjm48a5ChfRMHZLQoMo77fOgcdkuP9wfFqiRgAmZESP5z31ab9R4/y4Zv4VtG/DQuCKMz6wh/lbFzJIm2vg6DtjpOiHM8mtYkX0f3oDDWJKtCUTQtwyZtf1A6CretgIfWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622437; c=relaxed/simple;
	bh=yVzYk7iAXOmZR4zNr2Idxx6CcOc8TpqsoVAJ4tELSJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ctss4jDbDBV2Q9516/9L9xYTqYxsKcfvfdsOXcNteqozLoBqmZa3Q7ZMwlSyA1m6q601foAELn3cYTOHz9bM+8R/1VjNrOPrCszx46bdbs7LT7NNcj/RcvXHImEZUzB2qUxY4FGfVXOItlAPwr7r/asRvuZxMV/lkEyniQty6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4W2Hmky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7o7XM009987
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zoz0VeVMOnao2Q3x5RK8NlkU
	vHUVM0E1Vb62tgX5qWM=; b=K4W2Hmky91H6D1TnGKbxhU7H02poQyBkNxSVCgpv
	sYgMZgZNLQq2xVTRw04gubXtKab4DE7cicImLqWgMPM7eh5p5HqhaF3VMUxKalP+
	ejeHMyvtJSDm8lXL8odER13AyjjlWZeWHyQ27l/Ek1skZLzijDJHJKtsH0bDdj+O
	monB5/VFeuVTjOQqQ8Roi2F0Qmi56n9YrqFU/6dXk+MeEeS/3MagIhn6x01QZ1Ys
	b+SE13AweIZeBtRMp/aQgdLXxY4BA5aKVMHlxH5Ghjee0qg2vYbwP6zceCj02CVE
	bOOlmxK10SdA0Aj5npH8xjZkfQYgPpWoD4S/1mG5T+sxFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c8bbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:47:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88e133107adso292851785a.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 06:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622433; x=1761227233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zoz0VeVMOnao2Q3x5RK8NlkUvHUVM0E1Vb62tgX5qWM=;
        b=bmQt9a+9yWtvlrShj/aqeApNGyM8qUeIlf3AUnnRGVJgtxjcEhuykXEe80s01R/irL
         T+1WEUbK4m5KvXf3G2uC5kxFMPthMwOHKKkciVSfuFMw5vbPoU6/YE/zzMo7Z7jZvd1Y
         bIidWYsfXdg69oxwqdYfUQIq/tgwoT0GzDSoCcG4CEiWcpJ3nCVsaaP+hCmuviJlNFUt
         6GdDXZZMtBAGeJRabZIoGWyJPuCqHZ6nub+U1eT8XCttRQx7mqy3pl3PNt+HVTNHvHg3
         NKdEolFKTy8wnQTZSyQzohmINgMohgG3XYdEwtMQsa+OZZOX03+uYSHfVz9isJBXPhSf
         MmtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDd03Z5J1bI1mV9GG6h+H45kF/5eagtpLKZdRKDvLJglGLfEcrrPOPgNYpy2GKTL2sv3P2fAVRkYNsPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXCzCss1PX8ENPS7shXiFth9IHAAgY1K7xM/+UvkBzCg/ZIQKC
	Y0JcwyEatsvZakOMKFl/7Lv3B6cfzxyTG85p7ex9xHYJ6vagrz4lTjUkfYD+xg64SPD7TjfXW4d
	lQDDw5Z96WSajq1LPXq5Rc1EytvHBqEpaLCPIwly8+ur4dUa/GC+WC9bDTY/GwpCnWw==
X-Gm-Gg: ASbGncuRmxb02nEjrA7WU0tGLGfmWesw/s0eea9LaJGxGXH+MocyS83LFFi0AsfliqP
	uDIYfr8jw0ZtmBCzxnDB5Fm+RRQRed5BncisbRQRVPy1E7rijXzBnicu+5RXGEsmvPE61NkMx82
	+bMrymddwiZ7NvfJh8ritl6LolmAgMqSgGaOkj7wGi0K8YMzdsqrGxs45E5r921OvdTjkxwlnFJ
	LEmyrJIntJbpfjmofcOTQYyPNEU3uiSVjO0/xh6KNhi0ANv7R3mHdH8ZbRFqCTpLZYMlz7Mg2J6
	DrDGHPnKCYArJuLjrQqfiNynsFdLhkaDWaHmBVT2RqlNc+anCAKgzmySJU7lZ/nQaf79cfYs3iX
	MW8iZMvWsufAkGu4YuRdNSlAsSWRqCe4jUwPL6hxPAh2vpmtBiiqCbjxxmgn4KHey2wO950cb4u
	IcTpU/+dTrs6M=
X-Received: by 2002:a05:622a:1895:b0:4e8:8b6e:7827 with SMTP id d75a77b69052e-4e89d3a480emr2310641cf.66.1760622433280;
        Thu, 16 Oct 2025 06:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcyJKmhQOG7iLkOgrsKwRaHI3ZRlEBKHgfzUT0aELnO1brTLqronfq7nvUhIamhy1jgjHbNA==
X-Received: by 2002:a05:622a:1895:b0:4e8:8b6e:7827 with SMTP id d75a77b69052e-4e89d3a480emr2310211cf.66.1760622432779;
        Thu, 16 Oct 2025 06:47:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4dd6sm7088908e87.17.2025.10.16.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 06:47:11 -0700 (PDT)
Date: Thu, 16 Oct 2025 16:47:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
Message-ID: <gbwjh4tqaoxq2ng7moytv5vtalxpajdid5capjfqzare6dmphz@cmnv4p2q4eov>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
X-Proofpoint-GUID: Mx7rJGEd1Oh5EaCrgdDWAsgruliKc628
X-Proofpoint-ORIG-GUID: Mx7rJGEd1Oh5EaCrgdDWAsgruliKc628
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f0f762 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KXxo3aNfgb-G34jaDLkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXyKK7t6mVBuMm
 4hvly4j49VtOwLIcwiML1h+3qrVrSQ4f2//C2cbga5kDzt2lmJoeP5IoKcJOo+Gjpi1sorcVjw6
 IiJBJSwKB3ARHG+uDbZauV402JFMs+FjA/4FrHn9fgjX8W0YTHeHMNhiKvrdZ5Wq6f2RTr8zD2O
 pJ6LBLKLBRV6levU9SgM+NyzwRE9FHa5cH+RPfu3T5reRPeUmpq9cSf2t+Zh2qevPyajbmmLKND
 HN85X3zzMeCyMJqwQ/tNrIfhQaGbXvw79eEJ98kX7+lhEG6+r8Xk1d0p6r5hHfyJLQURCBxGFN9
 FPHQ+1KVJiOULtX1gqTIdkhyGz8D4H8oXursjlOL9/54dMGPm8gj16MJW4HjL/HHf8ypuU1Io39
 uk1tEjmvc7xX7AeMF793+3QvQfvvMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On Thu, Sep 25, 2025 at 04:44:43AM +0530, Vikash Garodia wrote:
> Some of vpu4 register defines are common with vpu3x. Move those into the
> common register defines header. This is done to reuse the defines for
> vpu4 in subsequent patch which enables the power sequence for vpu4.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 36 ----------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 --------------
>  .../platform/qcom/iris/iris_vpu_register_defines.h | 29 +++++++++++++++++
>  3 files changed, 29 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 339776a0b4672e246848c3a6a260eb83c7da6a60..0ac6373c33b7ced75ac94ac86a1a8fc303f28b5d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -11,48 +11,12 @@
>  #include "iris_vpu_common.h"
>  #include "iris_vpu_register_defines.h"
>  
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
> -#define AON_MVP_NOC_RESET			0x0001F000
> -
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> -#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> -#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
> -#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>  #define CORE_CLK_RUN				0x0
>  /* VPU v3.5 */
>  #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
>  
> -#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> -#define CTL_AXI_CLK_HALT			BIT(0)
> -#define CTL_CLK_HALT				BIT(1)
> -
> -#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> -#define RESET_HIGH				BIT(0)
> -
> -#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> -#define CORE_BRIDGE_SW_RESET			BIT(0)
> -#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> -
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
> -#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>  #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>  
> -#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> -
> -#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> -
>  #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
>  #define SW_RESET				BIT(0)
>  #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bbd999a41236dca5cf5700e452a6fed69f4fc922..a7b1fb8173e02d22e6f2af4ea170738c6408f65b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -11,9 +11,6 @@
>  #include "iris_vpu_common.h"
>  #include "iris_vpu_register_defines.h"
>  
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
> -
>  #define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
>  
>  #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
> @@ -38,10 +35,6 @@
>  #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
>  #define HOST2XTENSA_INTR_ENABLE			BIT(0)
>  
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
>  #define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
>  #define CPU_IC_SOFTINT_H2A_SHFT			0x0
>  
> @@ -53,23 +46,7 @@
>  #define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
>  #define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
>  
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -
>  #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
> -#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> -#define CTL_AXI_CLK_HALT			BIT(0)
> -#define CTL_CLK_HALT				BIT(1)
> -
> -#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> -#define RESET_HIGH				BIT(0)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
>  
>  static void iris_vpu_interrupt_init(struct iris_core *core)
>  {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..6474f561c8dc29d1975bb44792595d86f16b6cff 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -9,9 +9,38 @@
>  #define VCODEC_BASE_OFFS			0x00000000
>  #define CPU_BASE_OFFS				0x000A0000
>  #define WRAPPER_BASE_OFFS			0x000B0000
> +#define AON_BASE_OFFS				0x000E0000
> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> +#define AON_MVP_NOC_RESET			0x0001F000
>  
>  #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
>  
>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)

Registers here got totally unsorted (they were in the original source
file). Seeing this makes me sad.

> +
> +#define CORE_BRIDGE_SW_RESET			BIT(0)
> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> +#define MSK_CORE_POWER_ON			BIT(1)
> +#define CTL_AXI_CLK_HALT			BIT(0)
> +#define CTL_CLK_HALT				BIT(1)
> +#define REQ_POWER_DOWN_PREP			BIT(0)
> +#define RESET_HIGH				BIT(0)
> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> +#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */

Ugh. This mixed all the bits, loosing connection between the register
and the corresponding bits. I'm going to pick up this patch into the
sc7280 series and I will improve it there, keeping the link between
registers and bit fields.

>  
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

