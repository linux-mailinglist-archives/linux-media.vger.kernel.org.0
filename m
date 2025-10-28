Return-Path: <linux-media+bounces-45763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D13C13A88
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1520B50827A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C932D948D;
	Tue, 28 Oct 2025 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsShvLtR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50512241691;
	Tue, 28 Oct 2025 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761641647; cv=none; b=Dva2UTAjyeUqr6U2C2q3DdKwG3mAO1AUUuCiGVDlv8dYeU9SlHSijEqQHRUVCeyd78nZLQ3JgAN8PLiU42IL+vt/mPkzVyycIITHw1FmEveDAaF8JWM2swXk2Gj89MOWhMmOodf6E/19HA6sAJfjGZ4dx0H9G1nF9D7ZJYpDHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761641647; c=relaxed/simple;
	bh=cA/3o2EI/6QkidbrM/XmmQ42U508vmgC5KPiMSjGlFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQzqE89q7rLYcHXdGmJK3pmqYwcZe53xIGvHc6S+ijPiT7w9a+WInP7lJXI+R5NCPozemEjiZFd/EsgcxySSJRHY//10u6Y/iXQo9Wk0VEHDuZxUn8WEqTNht+qp3/QUrTCn/Qqr22b9iZ0DYNEdNAYq4HVJr+tKW2VB/yEfxSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsShvLtR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2CEC4CEE7;
	Tue, 28 Oct 2025 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761641645;
	bh=cA/3o2EI/6QkidbrM/XmmQ42U508vmgC5KPiMSjGlFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsShvLtR5H3Q3M8NKFxD1R3OjkQBCmpjiW9NeIMPSNgtU2B+x8MPmOT9QucAh80DE
	 OyvwqJ+IX8eGHCJe/qRkzWiz3A56cyeWNAHMVKkSvecAIaOgWL9Txg7IoXrg2CHyXC
	 j/oJdp6svdVFUGn33vwuGNzPECGY85yGOGakYbAIY72XRFzFofrkX0fs6xl1ARqbsV
	 fJnLVxNGXClYQ1Pk2kKb0+7QeX8sPX3BG0Qb1tPZHLnSmRJSLXHczDXgFrX2fkGUDV
	 VvyrsVNdrNNtGQ3d3OBZ6rAai7bB2KJ+A6IzFWiJ54QmJK5czngfVDpQicDwWJmSMI
	 CJT3plTdgTMjw==
Date: Tue, 28 Oct 2025 09:54:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
Message-ID: <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>

On Fri, Oct 24, 2025 at 02:23:59PM +0200, Luca Weiss wrote:
 +
> +  clock-names:
> +    items:
> +      - const: cam_ahb_clk
> +      - const: cam_axi
> +      - const: soc_ahb
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: slow_ahb_src
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe2_axi
> +      - const: vfe2
> +      - const: vfe2_cphy_rx
> +      - const: vfe2_csid
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 12
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_0_mnoc
> +      - const: cam_sf_0_mnoc
> +      - const: cam_sf_icp_mnoc

Please share the list with the previous generation of this device. Which
one was used here as "previous"? For example x1e has quite different
names - nothing with "cam". No "cam" in qcs8300, either.


> +
> +  iommus:
> +    maxItems: 4

I was told iommus might differ. Are you sure all of them represent the
same (e.g. not specific iommus for specific purposes)?

> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top

Uh, not your fault, but who came with this list in previous generations?
Instead of simple and obvious "top+ifeX" which allows growing/shrinking,
someone put "top" at the end which means this cannot follow same order
as X1E for example... Heh, it follows at least sm8550.


> +
> +  vdda-0.9-supply:

There are no dots in property names. Are you sure these are called
VDDA_0.9 in the device datasheet (not schematics)? Please look at other
bindings how this is being named, depending whether this is PHY or PLL
supply (or only PHY).


> +    description:
> +      Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1.25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to a PHY.

Best regards,
Krzysztof


