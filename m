Return-Path: <linux-media+bounces-48440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 905E6CAE1F1
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 20:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E70C3084A8B
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 19:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7102E2FBE0D;
	Mon,  8 Dec 2025 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ohcw4tNx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Awgm8hIF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DBD1EE7C6
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 19:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765223621; cv=none; b=Orm6ytvieKgpD4A78NIaov32cLnVeXs5/7TpC295czxMb1vwQ5634z+JFsCtfCzwMjkmlmmaNvz3rC1CqqsYZj+D8uV2/REjwF8ZzHksk5N09KeS6DNsEKlWpjGacp9LM2MtP7fySAd8837S0i+BKSE5470FKhHICdRbnOhgcDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765223621; c=relaxed/simple;
	bh=J3jGhj+CeAqgwbLCGmC6h1yKUzBHKojJH0Ulj0eDm4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUUUbJ2tSXuyb/mFxGxKY1g8oE+115JvznKW4AYqVkAPx1ABYOVgz+pwTtZhqVEI2bJPAyfCVajf/B0NGTGblQ5ctYjzZt80v7PymLc89Ef30FeP7nVYhinrhPOCSoJoM9Gx+apBjSlmVu9SEJWTu5Llq2XvTaO1r74qgURj6nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ohcw4tNx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Awgm8hIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8HLVcU4183935
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 19:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IMoJPuRSJAIglcvEDqdvim7H
	W12Ii9HmYVg97fspS0o=; b=Ohcw4tNx/x1LCUXxXwYt33NLIjCf/vH+TaPoK3Pg
	Bp+uJrXSYfMkADqG6xPHCHkMUlBXO3iEg/rzDEyJUCen7FrPkoInj5nQpmos+whx
	wwP3ET9iPz6ion0FEcfDfWYJSMF3hWSS7qM/lfTiGhi2sKuaSxuoD8CpSZU5GC6J
	NJ/jNmSKLgzkjlFVjqh4VzPBRxnV0UOKHA9q9rJM85jWHob7RWiBZTTioBUNJvUM
	EzwyFiCBJ5erQQbkVileJ/Xu/0ZqtgODqgPg++dhn+8O+pAI7pmfrDqRLIzdQfr+
	YlG7UauO4H+FOmOaJOVdIt1T7uAY6QuBkDa4I9CUYRIuYQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awume9xsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 19:53:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55b2b3ef606so7269506e0c.1
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765223617; x=1765828417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IMoJPuRSJAIglcvEDqdvim7HW12Ii9HmYVg97fspS0o=;
        b=Awgm8hIFusCjLVP5H0aDKlW3+5VXpuosu5FWNxJVMzbRSNzzxCpgAsViuaKZeidIHD
         2BKSi9gt1kO7zs/MhR81tLuEAD/umxi+xuUvpKV+w9b26h2ACMKc8uR5VCz7yzQOqvIr
         B+qE7FvMv2X/4dUyeLb2fXchq4jkHmINqawK28tGREUIRfKRnoC/swvHFrMPHTkR0F9+
         dnDx1LpEeT7mCj/+vfG2DZJb1bdcYKh+HEvrR3d3eBiYcJBS1nX1N/rT9lrMCkmG++Jh
         +Sm3BE7X+lDyffthBZaF4W6YVvYmDWkQoRle7npukzb520SZGOULsBMXAJ8VQnRUw7e6
         OVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765223617; x=1765828417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMoJPuRSJAIglcvEDqdvim7HW12Ii9HmYVg97fspS0o=;
        b=Ynhw9h9eU7JmQQ7ZSkS8c/0484M+sjqABCZSlLVxzkwf0iNMzO35cmODsGvRz5ADou
         Xk+8l/uDzld83jF2Tm3Az8yFRGbKgvLs9oVOCend3Z1ZrJgD9Gq0U3tX/KG9PPpUzb1S
         O0utz1Uvlg5Ed0PS2paJvcVGkJhaup3IlgkV/ON4hKW66cDjibAaBbc2s3M8+Kw1ItP0
         HN7K6UjpZQZ2o8iTFC/0MUQrlE/4AqoEUMuwr+/mK3BhZWEKNG/XQjrNGYajv36T/lSo
         iwy3TDu4vuFlaXZe3k6EHCEaqbQ62Ad1QfpP2R15RKjquc3bylQhcLV6LlytJdy/g4C5
         5liA==
X-Forwarded-Encrypted: i=1; AJvYcCU2OAIh65CptkAVlmKnMrhy+IxrpBiERsnC4v8J6s0hMw234CC+T03aTNe9aHuQNaUYasvoEtXbisaWhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytsOwgyydRrhZO6FWX/G9jUj1jnfD2IQgS/IcZyGdWKwh4Ot1M
	K+o+1bNz9d3EIqRRRkvpvGtGU331EmM5tpkRVZhHTeRRW/HPRIy/gJFfqX6SZHQ8td1o6cjXzUD
	lQCLIyxRS1WIP20cuUANNbg4+MTAZm977PtREEO2XwEtrluPQIRzM/RcHn7Z7L8k+Vg==
X-Gm-Gg: ASbGncvc3O7ProwWJTOzezH9J9zctCBR9mnIPRM0dMM5purK4OztZybvAU4sHAk6x7J
	B4PS9dcAAo/v4JkRm13TvJ3vx4M/RxSo6r94Fu/iB2xkuyDCLskRAMLuK2f+v090FMpY/sxDsj6
	CuhqCSdOtZNKeSxJokqFzpiKCXrrb5eXObiaHP0nQGSDf8I+YWiocuUE6tBMuUbLn6sUSv328dz
	yr80QkER0RiMKR8iMRGnjmp6LY1DHB3PXGIiAChF10GHDdGaw/O1UVwfyZI8H6hwIF7qkyKzRsO
	FgjBPaekiI1pW3Q1XivBxi1CJbkHbgon2sF6xn9WDxHO4s96VwtX6sn3vZVEYmesDNjQ4IDDPsZ
	e/1uJTTGMXRxjPfMibyHpHjMy4Z7zzxLynXhoEvEkcdRFD+aErkd5D5SDa01PnaZP6kFqSv855D
	zcbCLvr2La77K7N5jnGovo4t4=
X-Received: by 2002:a05:6122:408e:b0:54a:a2a3:b16b with SMTP id 71dfb90a1353d-55fc26c49a0mr216525e0c.3.1765223616700;
        Mon, 08 Dec 2025 11:53:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQf0dRANa7315VoHii9uRqmwgs9Qvr1ewyX2o+LQRRodOU3oZR3J/58BN9mvyfJhG34NUMwA==
X-Received: by 2002:a05:6122:408e:b0:54a:a2a3:b16b with SMTP id 71dfb90a1353d-55fc26c49a0mr216511e0c.3.1765223616195;
        Mon, 08 Dec 2025 11:53:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fe6bf8asm39681921fa.5.2025.12.08.11.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 11:53:35 -0800 (PST)
Date: Mon, 8 Dec 2025 21:53:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Message-ID: <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE2OCBTYWx0ZWRfXwKEqdu1KmiHZ
 K6bDIWXB7PpGVFJFB82VpM6pSQfq3ezsw8DCbrSoi5wlcsWdzaEu4l7+rvVsN5VEu/BOOYio4Dp
 WtCAEaDxqeNAAlnqHwY/EMyA0y5EBzctWktNiJ6cS1c4M/4t8NmKz3q3vYdnG9/AZe8hYsO2Xrw
 s+qcFpF64IapveHkIXFBiF/p2zdTIGk/PA3y72tyiBux4XkTo2hX/iKYAaudxCdw8JVXnbIDyxa
 +IvwaYsjpHrH/UL7cUhWgGePkYDmr8zkZ3m4ruH+Xq3ydgmKHeo53JNmfEUF7cF+AmQidPsek5w
 2jdG5eJxQB76+WqVAiPcSbylHUUuLGajLru1YMnn6kIjX3ehQsSHARGjqu/eseYzk+gahxdom0B
 l+m6DkvzvfDf7zyF7uwhC+aW0rR/ew==
X-Proofpoint-GUID: bWJpKxNgBhT7xBK0p6EfcgXb5Vt2QUoh
X-Proofpoint-ORIG-GUID: bWJpKxNgBhT7xBK0p6EfcgXb5Vt2QUoh
X-Authority-Analysis: v=2.4 cv=SvadKfO0 c=1 sm=1 tr=0 ts=69372cc1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tTaC26Jt8vzVEXVZ0kYA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080168

On Mon, Dec 08, 2025 at 04:39:47AM -0800, Hangxiang Ma wrote:
> Add bindings for qcom,kaanapali-camss to support the Camera Subsystem
> (CAMSS) on the Qualcomm Kaanapali platform.
> 
> The Kaanapali platform provides:
> 
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSIPHY
> - 2 x ICP
> - 1 x IPE
> - 2 x JPEG DMA & Downscaler
> - 2 x JPEG Encoder
> - 1 x OFE
> - 5 x RT CDM
> - 3 x TPG

Please describe the acronyms.

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-camss.yaml       | 646 +++++++++++++++++++++
>  1 file changed, 646 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 000000000000..3b54620e14c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> @@ -0,0 +1,646 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +
> +description:
> +  Kaanapali camera subsystem includes submodules such as CSIPHY (CSI Physical layer)
> +  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
> +
> +  The subsystem also integrates a set of real-time image processing engines and their
> +  associated configuration modules, as well as non-real-time engines.
> +
> +  Additionally, it encompasses a test pattern generator (TPG) submodule.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-camss
> +
> +  reg:
> +    items:
> +      - description: Registers for CSID 0
> +      - description: Registers for CSID 1
> +      - description: Registers for CSID 2
> +      - description: Registers for CSID Lite 0
> +      - description: Registers for CSID Lite 1
> +      - description: Registers for CSIPHY 0
> +      - description: Registers for CSIPHY 1
> +      - description: Registers for CSIPHY 2
> +      - description: Registers for CSIPHY 3
> +      - description: Registers for CSIPHY 4
> +      - description: Registers for CSIPHY 5
> +      - description: Registers for VFE (Video Front End) 0
> +      - description: Registers for VFE 1
> +      - description: Registers for VFE 2
> +      - description: Registers for VFE Lite 0
> +      - description: Registers for VFE Lite 1
> +      - description: Registers for ICP (Imaging Control Processor) 0
> +      - description: Registers for ICP 0 SYS
> +      - description: Registers for ICP 1
> +      - description: Registers for ICP 1 SYS
> +      - description: Registers for IPE (Image Processing Engine)
> +      - description: Registers for JPEG DMA & Downscaler
> +      - description: Registers for JPEG Encoder
> +      - description: Registers for OFE (Offline Front End)
> +      - description: Registers for RT CDM (Camera Data Mover) 0
> +      - description: Registers for RT CDM 1
> +      - description: Registers for RT CDM 2
> +      - description: Registers for RT CDM 3
> +      - description: Registers for RT CDM 4
> +      - description: Registers for TPG 0
> +      - description: Registers for TPG 1
> +      - description: Registers for TPG 2
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: icp0
> +      - const: icp0_sys
> +      - const: icp1
> +      - const: icp1_sys
> +      - const: ipe
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: ofe
> +      - const: rt_cdm0
> +      - const: rt_cdm1
> +      - const: rt_cdm2
> +      - const: rt_cdm3
> +      - const: rt_cdm4
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +
> +  clocks:
> +    maxItems: 60
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: camnoc_rt_vfe0
> +      - const: camnoc_rt_vfe1
> +      - const: camnoc_rt_vfe2
> +      - const: camnoc_rt_vfe_lite
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy5
> +      - const: csiphy5_timer
> +      - const: gcc_axi_hf

This clock (and gcc_axi_sf below) still have the gcc_ prefix and GCC name. Why?
It was pointed out in the previous review: clock names should be
describing their purpose, not their source.

> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +      - const: qdss_debug_xo
> +      - const: camnoc_ipe_nps
> +      - const: camnoc_ofe
> +      - const: gcc_axi_sf
> +      - const: icp0
> +      - const: icp0_ahb
> +      - const: icp1
> +      - const: icp1_ahb
> +      - const: ipe_nps
> +      - const: ipe_nps_ahb
> +      - const: ipe_nps_fast_ahb
> +      - const: ipe_pps
> +      - const: ipe_pps_fast_ahb
> +      - const: jpeg
> +      - const: ofe_ahb
> +      - const: ofe_anchor
> +      - const: ofe_anchor_fast_ahb
> +      - const: ofe_hdr
> +      - const: ofe_hdr_fast_ahb
> +      - const: ofe_main
> +      - const: ofe_main_fast_ahb
> +      - const: vfe0_bayer
> +      - const: vfe0_bayer_fast_ahb
> +      - const: vfe1_bayer
> +      - const: vfe1_bayer_fast_ahb
> +      - const: vfe2_bayer
> +      - const: vfe2_bayer_fast_ahb
> +
> +  interrupts:
> +    maxItems: 30
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: camnoc_nrt
> +      - const: camnoc_rt
> +      - const: icp0
> +      - const: icp1
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: rt_cdm0
> +      - const: rt_cdm1
> +      - const: rt_cdm2
> +      - const: rt_cdm3
> +      - const: rt_cdm4
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_icp_mnoc
> +      - const: sf_mnoc

You know... Failure to look around is a sin. What are the names of
interconnects used by other devices? What do they actually describe?

This is an absolute NAK.

> +
> +  iommus:
> +    items:
> +      - description: VFE non-protected stream
> +      - description: ICP0 shared stream
> +      - description: ICP1 shared stream
> +      - description: IPE CDM non-protected stream
> +      - description: IPE non-protected stream
> +      - description: JPEG non-protected stream
> +      - description: OFE CDM non-protected stream
> +      - description: OFE non-protected stream
> +      - description: VFE / VFE Lite CDM non-protected stream

This will map all IOMMUs to the same domain. Are you sure that this is
what we want? Or do we wait for iommu-maps to be fixed?

-- 
With best wishes
Dmitry

