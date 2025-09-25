Return-Path: <linux-media+bounces-43213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89142BA12A7
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE420327A98
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8539D31C56F;
	Thu, 25 Sep 2025 19:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmTLo1jG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8E231B83A
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828344; cv=none; b=s2ecXzpecI3KJqzeQN+qyww4H8gVfQU4z4SAxghaW/BeLshi21uHdwIKpsx95ROgMfL/D7hcxku6ZONWXh/ofWoYSzhjK9/3x00ZUFwS4VOBUp0uPPFZfsKWpl4gQz4Nu1NPxAMO7tXBJOqiLWpAuA/T8w54177wireKgQNp83Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828344; c=relaxed/simple;
	bh=XIG3eu2+rNsasnB8FNq+DrxQGKPAF7sUS4vH09SySNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmCqu5grjTpO6qyzpBJpQcjwLxex4HR/cQFzln4WEPOyvN3K3tw98N588ObZw4MsqQI63UQGsvZ3SFVa/aZ55sPIpn4xKjWVwjWlXkmzPrE1V2rWGcFF3OD5p8bvMOSGcTK1FNta8Qcfhva+3N29utNKTUFQYB96bVRDFJ47mfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmTLo1jG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQEKR004902
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4/iLgC7UNveAdS/BcadCv9NN
	LD1orJ51Na0pAU9YTYg=; b=JmTLo1jGcJaqho+kI5fHIZYSehjWSHtVILxX4tu+
	2UFO7Egj0kaT0sl6oXot0b9IS+jsuwBtHwnqMxD08JyK9yWU396mJDUw/Mg411TU
	zmjeetN3OOedfc1K4No9aGlFTAQyO5HhfHVzliSlLJVfKrLXkQYEyXXMey4Cp/Au
	sDefmsCYbB9W6EFIGC/02P/7iUqR7UczxoJjNsw2BXSw1q6eaxOrX/bT0+3rayZI
	5Rs2zdxCMmPMtLpFKqFYmARaf5X0It2PFnsrXmZ4ZNb1l6M3fFxcYbE7vwIMCkWk
	I3koYMoOESI9UjmcCN72pkfzCnSJGCHFtpDD3dMwScQJDA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u04jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:25:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d435215956so30380011cf.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 12:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828340; x=1759433140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/iLgC7UNveAdS/BcadCv9NNLD1orJ51Na0pAU9YTYg=;
        b=eTTfsUvDZTc9Mi8SPdTrrXn7sR3Tf2OXSxh5/oYPqa20J+Cop+0NoXAjdRqJ4Tkait
         tqVUFbq7BlhOsNgo9+d7OZKwwWU0vwrFZfUuRB626epwNx6vxpBuOlT5jinhO0yYH+Bi
         1RMBIbcZpsafqSOg/b2oAInFHdcTxpf5ZB91Ol/oH9hhcGIIX8Wc+Vh2QVCMXVJTrdhb
         tUwMxwt2QubnuXt7k/mplwfz6CuMzH7zxo08RlxytQTnIH/wBXTPqEtwAlthy2w7VLnS
         4TXCXzdHLpOhglX2h5+Y2weYowLcxD7fpgQ0XX1tk61fsxNjWpwLDOCkhazPtMhcf3aK
         TZxA==
X-Forwarded-Encrypted: i=1; AJvYcCX6q3Hj5eJFgmIBv+2WihXWf5Kye254TPMD02PORwmtS6zHj0W86aAKZkgYc9twEPYwEFkEWO3YAGdCsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/Rvl2wiGfKB97OBNuT2+x84xr2lFjS3J//zEtL9bx27V4wvY
	6Hkx1Z+letMirjN0Q2YUgROQoGk/tzmaYlOJ23YpSsrhRLWl8AynrA6EohhQICds7fAjEgCu6+k
	IG/+5MJG8YlaqC+8pBgXEGn7LflaWkFCGMcDYL9g0MQKEJw9yJ/psUGe0BENzrodKGg==
X-Gm-Gg: ASbGnctPZcfqTtFGxBbfBqBT63B4KaxFwAAbvlK3tqGVT0T9TT5hDWb7kCPA9lL9sJ/
	TtRk+Rd5el53dox5lF/Dr7Qlp0WemD4wLZX/XAIihXqCE5ggvfuqp+a7baLJVOSmRcIuFKEbjdk
	SP6KvOm9sB72hQT8bVWTHr1l96ZZlb+CUfmOFDym/TrjxBWYZOg/9itFXV+Lc/vhC7SAiAkaPpd
	/M35Ynm7uw/91mpCxPlAf6DZ0WnucRbhq0YzKpaO6RnT6/rtCsf++1r9S93o51dX+60NnC4mFPe
	MNTNTBxXHsZoCVkEGFuzSyQDHO5CFPgN+NANpByMdyl7UftqwEZ9VpxvQ1fbdvEOwvU5ikKARNS
	PdLzR1kjRZ/cPmfXMXAyArJUDUKPsmxh0AXQnCigKnnJBfDpuQ2wZ
X-Received: by 2002:a05:622a:446:b0:4d8:466a:3dd9 with SMTP id d75a77b69052e-4da4782a225mr57420961cf.6.1758828339765;
        Thu, 25 Sep 2025 12:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETMBfLsb47LeBEoG596JqNJaC6E5+MTXtq2C/BqG/sF4RGipK1HtONFv5qSJkUlX2Srw+9GQ==
X-Received: by 2002:a05:622a:446:b0:4d8:466a:3dd9 with SMTP id d75a77b69052e-4da4782a225mr57420501cf.6.1758828339170;
        Thu, 25 Sep 2025 12:25:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665641asm1020042e87.72.2025.09.25.12.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:25:38 -0700 (PDT)
Date: Thu, 25 Sep 2025 22:25:36 +0300
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
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
X-Proofpoint-GUID: VUWB5JcojVJP6qZXoptVHoSrUCU3iCqA
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d59734 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8
 a=wXtiP2_cyDRN-whGmjUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX9qLu8uqfxc6n
 MsPhpRTmMbu9XZzxxLXJCaSE3CY9HGtBqRqHdtU2O0GaAmjvn8/R9ZHV7V/8z9cKRcDq/TBRdvU
 XRMj3xzIOybkP1AC62Tsj9Q3VvMLUWrAutZ2vUOOPceOC/y2P0nks3oeGYkR10pYYo3F7Y/wsVE
 AS3g9scSDGf16a1y8H8BO44PI44joApDTTNtwpJ4CR+vEmtffJ1oVl3rqxb1se37UP68AlwBmCw
 cuCHC/Vea7K/2oo/NXE5XGHReEBcYrt+ly2BU96qBglz0TktuM3h1hfUb80meTI+T2P9kO/4MtV
 BX2hZPxyAyHmSXULo0ZntScbFA5UhZXxOkVwiD0LLb7af9jKedHUbr0ycmKFxzW3E63JsKKs+E4
 TV+p+XpB4kwoscSoAeYjyyNgFfAO8Q==
X-Proofpoint-ORIG-GUID: VUWB5JcojVJP6qZXoptVHoSrUCU3iCqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> There are variants of this hardware, where only a single VPP pipe would
> be functional (VPP0), and APV may not be present. In such case, the
> hardware can be enabled without those 2 related power doamins, and
> corresponding clocks. This explains the min entries for power domains
> and clocks.
> Iommus include all the different stream-ids which can be possibly
> generated by vpu4 video hardware in both secure and non secure
> execution mode.
> 
> This patch depends on following patches
> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
>  1 file changed, 236 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
> @@ -0,0 +1,236 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm kaanapali iris video encode and decode accelerators
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> +
> +description:
> +  The iris video processing unit is a video encode and decode accelerator
> +  present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-iris
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 5
> +    maxItems: 7

You are sending bindings for a single device on a single platform. How
comes that it has min != max?

> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: vpp0
> +      - const: vpp1
> +      - const: apv
> +      - const: mxc
> +      - const: mmcx
> +
> +  clocks:
> +    minItems: 8
> +    maxItems: 10

And here.

> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: iface1
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +      - const: vcodec_bse
> +      - const: vcodec_vpp0
> +      - const: vcodec_vpp1
> +      - const: vcodec_apv
> +

-- 
With best wishes
Dmitry

