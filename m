Return-Path: <linux-media+bounces-47175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CEC61633
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 14:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95A764EC0D1
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 13:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120FD30C359;
	Sun, 16 Nov 2025 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/glotEj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B2F30BB96
	for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301024; cv=none; b=I/P/7BUEK49tPvzBzDhWGBSfEIpY3iFiuCkrmwNAK6ZyllcQSxqv0JLiz2EosTLjKlhFgqjP/fFoaMiDjqblTH3ozkyNEeF7nQAulA3S2CcquDXU6NROqkKf+b8FMqYxlr9ZMMOqRUEa2rjurXcVV5FOef+h9J3QCAaBhsXK83c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301024; c=relaxed/simple;
	bh=RlTyvxs1yrvLYjKojxHrIARPSdWhVmA5jTi63VVZgOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alPMG3BgHFtIBLIariPZhfTHutdVmTXvw59irtsytbOzNoy3sfgpOyYGJDnUoKaL2cpT2CnW+Dcft7DfiQGb/Uan06QAeYJ1pumuXp9LNAxSzWP8EDNgkJFg6wZwTBv54RL9CcuFJozXVzVG5mFMDHFKHYM22d2jOdBNXrWSIBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/glotEj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so11100175e9.1
        for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763301008; x=1763905808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odgJy6yl020iwKbpUCj5gu6FzgWbompfCM9BL9IqCy4=;
        b=W/glotEj6aDDv1KQCM5iRh8RqctPN0mqm1pn3zS5Q0b0cXThJ7uf72J2FQgGwBRT99
         EwpinvhuOlsrDPaoarqNyMmQTA1BdP0av9vKYWvxK1ODd9WMzm2iZrRYJib96pu1HWqJ
         XiifH4oOMYMAYg/wDx8grwn09lRbO2kvmydeuWvYjvGaxr6t5nXjXRC19v/cZvr8hoTY
         fvHCgxf0tLe0FcjAhvCSDQIm00shjo43mjnPen1KZD2XI5XOLVly0VZ62pFZ++2zfaND
         8NvAvUcv4HVNoPhy7CK1yBsiaAduGm0ktXY2Vy5KRnTGTcNrVUsPy1a39bDL1IrrGojE
         HgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301008; x=1763905808;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odgJy6yl020iwKbpUCj5gu6FzgWbompfCM9BL9IqCy4=;
        b=LTdYn1MFJhLsz8+qtIDFx49S7fsA+SE61R2q0t592EbI96J11MRxxegDZAQBgVGPXJ
         0q/urnMI9hvrajy8UvdaVtcqmvzYxfCIDS9MHh2kxBX8L5ob0SP0KLMoEYhzXXlMvfop
         tXE6Wr9cOnuAs4Jrk3HppfXUghrJJ+/uNAyhTuWqsFvDqPHhISMqNemvEhHyPQc3mH02
         waaeUzg14MKEg3w8D7JGTuhJSnc1KfQkjy5iiU+/wHfxpR/2wPYQGkClCuJJMHbbyRDD
         ky/y10RplEz9LbjMsB2tShEbvwPs3aCRcOZKMcQbEFJxaUNwJeTIxgQEKHx+Ii4i5MPa
         2ToQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcXeRT8g6r9CgJigh3gmCDoIrq5ivc0/hgzACsotoW+hao92Nt/Dr6Be01UFUuTE3/I1tUwmzCfdvz+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqXHqMWLHiSpcushDJA4rHwPHmmd4bmVQX8/iS1G8rlMy31CqS
	7GY1OCF8KP+OQ4OWsO2G+uoGJCC1YyM5riUAqAWA37Zc+bU1DIH3UrxPmyAxSBqceQk=
X-Gm-Gg: ASbGnctrqTv4M1JADxwM/httMAME5lXWiZeHzOVMSKg3dijvN7zFR00iOSepOVCgLV4
	P6miYnRuHdoHKH+/bJ0mV/VLF7GDGAPnDHVSoNIHKnuxXRnbIyIZd/ZoH106e2hhHla8uvxiwBw
	MRuCkpH1pyAcZHOIT0KUA3uBvEiq2wKSH4F4cTQQ/IyMBHhUDbev/ESmwjVX4MiTZqAKLil/fml
	QreLyc2FSUG2CvRdgk3cloRYmjPP/2dYZSB+r4wSJ6J4TxU5Hd56wFVQRqeH9ae1tPi9Uw4K0Em
	29MFSRBHbYWzKJDllr6pvndjWP6OGoseRPC54xdXPnuF5e63zKS5mAOuC6q8S2g7julH5hfqMrV
	4S1AwA42WkKiyZ9SrETaUbbJnFQcvRvOLfqyS37VxJouShuPfeIYIVxFQF3mOwHek5rozTuOem0
	HzX8wlwX96e6ZCK0Mze9Nsd8jTR07Wbo+TwD3zb3deRw==
X-Google-Smtp-Source: AGHT+IEtm6ruXUrxC9f3JxoUs0+F8/y/vqnEZmu7ay3NGVRxmidkgNijWSn5gAh1VrJ7AVj4Ior4FQ==
X-Received: by 2002:a05:600c:3542:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4778fe7d0ecmr84759325e9.26.1763301008144;
        Sun, 16 Nov 2025 05:50:08 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb30eacsm93966665e9.2.2025.11.16.05.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 05:50:06 -0800 (PST)
Message-ID: <df803cca-3133-41c8-8d74-e9ac88a4dbef@linaro.org>
Date: Sun, 16 Nov 2025 13:50:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> Add the compatible string "qcom,kaanapali-camss" to support the Camera
> Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
> 
> The Kaanapali platform provides:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSIPHY
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,kaanapali-camss.yaml       | 639 +++++++++++++++++++++
>   1 file changed, 639 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 000000000000..673a3e8b68a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> @@ -0,0 +1,639 @@
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
> +  This binding describes the camera subsystem hardware found on Kaanapali
> +  Qualcomm SoCs. It includes submodules such as CSIPHY (CSI Physical layer)
> +  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
> +
> +  The subsystem also integrates a set of real-time image processing engines
> +  and their associated configuration modules, as well as non-real-time engines.
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
> +      - description: Registers for ICP 1
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
> +      - const: icp1
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
> +      - const: cam_top_ahb
> +      - const: cam_top_fast_ahb
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
> +      - const: gcc_hf_axi
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
> +      - const: gcc_sf_axi
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
> +
> +  power-domains:
> +    items:
> +      - description:
> +          VFE0 GDSC - Global Distributed Switch Controller for VFE0.
> +      - description:
> +          VFE1 GDSC - Global Distributed Switch Controller for VFE1.
> +      - description:
> +          VFE2 GDSC - Global Distributed Switch Controller for VFE2.
> +      - description:
> +          Titan GDSC - Global Distributed Switch Controller for the entire camss.
> +      - description:
> +          IPE GDSC - Global Distributed Switch Controller for IPE.
> +      - description:
> +          OFE GDSC - Block Global Distributed Switch Controller for OFE.
> +
> +  power-domain-names:
> +    items:
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: top
> +      - const: ipe
> +      - const: ofe
> +
> +  vdd-csiphy0-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY0 core block.
> +
> +  vdd-csiphy0-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
> +
> +  vdd-csiphy1-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY1 core block.
> +
> +  vdd-csiphy1-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY1 pll block.
> +
> +  vdd-csiphy2-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY2 core block.
> +
> +  vdd-csiphy2-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY2 pll block.
> +
> +  vdd-csiphy3-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY3 core block.
> +
> +  vdd-csiphy3-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY3 pll block.
> +
> +  vdd-csiphy4-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY4 core block.
> +
> +  vdd-csiphy4-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY4 pll block.
> +
> +  vdd-csiphy5-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY5 core block.
> +
> +  vdd-csiphy5-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY5 pll block.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +patternProperties:
> +  "^port@[0-5]$":
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      Input ports for receiving CSI data on CSIPHY 0-5.
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +        required:
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@9253000 {
> +            compatible = "qcom,kaanapali-camss";
> +
> +            reg = <0x0 0x09253000 0x0 0x5e80>,
> +                  <0x0 0x09263000 0x0 0x5e80>,
> +                  <0x0 0x09273000 0x0 0x5e80>,
> +                  <0x0 0x092d3000 0x0 0x3880>,
> +                  <0x0 0x092e7000 0x0 0x3880>,
> +                  <0x0 0x09523000 0x0 0x2000>,
> +                  <0x0 0x09525000 0x0 0x2000>,
> +                  <0x0 0x09527000 0x0 0x2000>,
> +                  <0x0 0x09529000 0x0 0x2000>,
> +                  <0x0 0x0952b000 0x0 0x2000>,
> +                  <0x0 0x0952d000 0x0 0x2000>,
> +                  <0x0 0x09151000 0x0 0x20000>,
> +                  <0x0 0x09171000 0x0 0x20000>,
> +                  <0x0 0x09191000 0x0 0x20000>,
> +                  <0x0 0x092dc000 0x0 0x1300>,
> +                  <0x0 0x092f0000 0x0 0x1300>,
> +                  <0x0 0x0900e000 0x0 0x1000>,
> +                  <0x0 0x0902e000 0x0 0x1000>,
> +                  <0x0 0x090d7000 0x0 0x20000>,
> +                  <0x0 0x0904e000 0x0 0x1000>,
> +                  <0x0 0x0904d000 0x0 0x1000>,
> +                  <0x0 0x09057000 0x0 0x40000>,
> +                  <0x0 0x09147000 0x0 0x580>,
> +                  <0x0 0x09148000 0x0 0x580>,
> +                  <0x0 0x09149000 0x0 0x580>,
> +                  <0x0 0x0914a000 0x0 0x580>,
> +                  <0x0 0x0914b000 0x0 0x580>,
> +                  <0x0 0x093fd000 0x0 0x400>,
> +                  <0x0 0x093fe000 0x0 0x400>,
> +                  <0x0 0x093ff000 0x0 0x400>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "csiphy4",
> +                        "csiphy5",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1",
> +                        "icp0",
> +                        "icp1",
> +                        "ipe",
> +                        "jpeg_dma",
> +                        "jpeg_enc",
> +                        "ofe",
> +                        "rt_cdm0",
> +                        "rt_cdm1",
> +                        "rt_cdm2",
> +                        "rt_cdm3",
> +                        "rt_cdm4",
> +                        "tpg0",
> +                        "tpg1",
> +                        "tpg2";
> +
> +            clocks = <&camcc_cam_cc_camnoc_nrt_axi_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_axi_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_vfe_0_main_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_vfe_1_main_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_vfe_2_main_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_vfe_lite_clk>,
> +                     <&camcc_cam_cc_cam_top_ahb_clk>,
> +                     <&camcc_cam_cc_cam_top_fast_ahb_clk>,
> +                     <&camcc_cam_cc_csid_clk>,
> +                     <&camcc_cam_cc_csid_csiphy_rx_clk>,
> +                     <&camcc_cam_cc_csiphy0_clk>,
> +                     <&camcc_cam_cc_csi0phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy1_clk>,
> +                     <&camcc_cam_cc_csi1phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy2_clk>,
> +                     <&camcc_cam_cc_csi2phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy3_clk>,
> +                     <&camcc_cam_cc_csi3phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy4_clk>,
> +                     <&camcc_cam_cc_csi4phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy5_clk>,
> +                     <&camcc_cam_cc_csi5phytimer_clk>,
> +                     <&gcc_gcc_camera_hf_axi_clk>,
> +                     <&camcc_cam_cc_vfe_0_main_clk>,
> +                     <&camcc_cam_cc_vfe_0_main_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_1_main_clk>,
> +                     <&camcc_cam_cc_vfe_1_main_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_2_main_clk>,
> +                     <&camcc_cam_cc_vfe_2_main_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_lite_clk>,
> +                     <&camcc_cam_cc_vfe_lite_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_lite_cphy_rx_clk>,
> +                     <&camcc_cam_cc_vfe_lite_csid_clk>,
> +                     <&camcc_cam_cc_qdss_debug_xo_clk>,
> +                     <&camcc_cam_cc_camnoc_nrt_ipe_nps_clk>,
> +                     <&camcc_cam_cc_camnoc_nrt_ofe_main_clk>,
> +                     <&gcc_gcc_camera_sf_axi_clk>,
> +                     <&camcc_cam_cc_icp_0_clk>,
> +                     <&camcc_cam_cc_icp_0_ahb_clk>,
> +                     <&camcc_cam_cc_icp_1_clk>,
> +                     <&camcc_cam_cc_icp_1_ahb_clk>,
> +                     <&camcc_cam_cc_ipe_nps_clk>,
> +                     <&camcc_cam_cc_ipe_nps_ahb_clk>,
> +                     <&camcc_cam_cc_ipe_nps_fast_ahb_clk>,
> +                     <&camcc_cam_cc_ipe_pps_clk>,
> +                     <&camcc_cam_cc_ipe_pps_fast_ahb_clk>,
> +                     <&camcc_cam_cc_jpeg_clk>,
> +                     <&camcc_cam_cc_ofe_ahb_clk>,
> +                     <&camcc_cam_cc_ofe_anchor_clk>,
> +                     <&camcc_cam_cc_ofe_anchor_fast_ahb_clk>,
> +                     <&camcc_cam_cc_ofe_hdr_clk>,
> +                     <&camcc_cam_cc_ofe_hdr_fast_ahb_clk>,
> +                     <&camcc_cam_cc_ofe_main_clk>,
> +                     <&camcc_cam_cc_ofe_main_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_0_bayer_clk>,
> +                     <&camcc_cam_cc_vfe_0_bayer_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_1_bayer_clk>,
> +                     <&camcc_cam_cc_vfe_1_bayer_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_2_bayer_clk>,
> +                     <&camcc_cam_cc_vfe_2_bayer_fast_ahb_clk>;
> +            clock-names = "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "camnoc_rt_vfe0",
> +                          "camnoc_rt_vfe1",
> +                          "camnoc_rt_vfe2",
> +                          "camnoc_rt_vfe_lite",
> +                          "cam_top_ahb",
> +                          "cam_top_fast_ahb",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "csiphy5",
> +                          "csiphy5_timer",
> +                          "gcc_hf_axi",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid",
> +                          "qdss_debug_xo",
> +                          "camnoc_ipe_nps",
> +                          "camnoc_ofe",
> +                          "gcc_sf_axi",
> +                          "icp0",
> +                          "icp0_ahb",
> +                          "icp1",
> +                          "icp1_ahb",
> +                          "ipe_nps",
> +                          "ipe_nps_ahb",
> +                          "ipe_nps_fast_ahb",
> +                          "ipe_pps",
> +                          "ipe_pps_fast_ahb",
> +                          "jpeg",
> +                          "ofe_ahb",
> +                          "ofe_anchor",
> +                          "ofe_anchor_fast_ahb",
> +                          "ofe_hdr",
> +                          "ofe_hdr_fast_ahb",
> +                          "ofe_main",
> +                          "ofe_main_fast_ahb",
> +                          "vfe0_bayer",
> +                          "vfe0_bayer_fast_ahb",
> +                          "vfe1_bayer",
> +                          "vfe1_bayer_fast_ahb",
> +                          "vfe2_bayer",
> +                          "vfe2_bayer_fast_ahb";
> +
> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 702 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "csiphy5",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1",
> +                              "camnoc_nrt",
> +                              "camnoc_rt",
> +                              "icp0",
> +                              "icp1",
> +                              "jpeg_dma",
> +                              "jpeg_enc",
> +                              "rt_cdm0",
> +                              "rt_cdm1",
> +                              "rt_cdm2",
> +                              "rt_cdm3",
> +                              "rt_cdm4",
> +                              "tpg0",
> +                              "tpg1",
> +                              "tpg2";
> +
> +            interconnects = <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc_slave_camera_cfg QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc_master_camnoc_hf QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc_master_camnoc_sf_icp QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc_master_camnoc_sf QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_icp_mnoc",
> +                                 "sf_mnoc";
> +
> +            iommus = <&apps_smmu 0x1c00 0x00>,
> +                     <&apps_smmu 0x18c0 0x00>,
> +                     <&apps_smmu 0x1980 0x00>,
> +                     <&apps_smmu 0x1840 0x00>,
> +                     <&apps_smmu 0x1800 0x00>,
> +                     <&apps_smmu 0x18a0 0x00>,
> +                     <&apps_smmu 0x1880 0x00>,
> +                     <&apps_smmu 0x1820 0x00>,
> +                     <&apps_smmu 0x1860 0x00>;
> +
> +            power-domains = <&camcc_cam_cc_vfe_0_gdsc>,
> +                            <&camcc_cam_cc_vfe_1_gdsc>,
> +                            <&camcc_cam_cc_vfe_2_gdsc>,
> +                            <&camcc_cam_cc_titan_top_gdsc>,
> +                            <&camcc_cam_cc_ipe_gdsc>,
> +                            <&camcc_cam_cc_ofe_gdsc>;
> +            power-domain-names = "vfe0",
> +                                 "vfe1",
> +                                 "vfe2",
> +                                 "top",
> +                                 "ipe",
> +                                 "ofe";
> +
> +            vdd-csiphy0-0p8-supply = <&vreg_0p8_supply>;
> +            vdd-csiphy0-1p2-supply = <&vreg_1p2_supply>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy_ep0: endpoint {
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

Thanks for following up on this.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

