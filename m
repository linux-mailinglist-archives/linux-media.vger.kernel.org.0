Return-Path: <linux-media+bounces-45777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 325C8C13E81
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01A75582976
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EB62DBF78;
	Tue, 28 Oct 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phI66WdZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA852202F70;
	Tue, 28 Oct 2025 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644774; cv=none; b=NiughJJSdY6sS9Eypw3E+08GDLwAG39O04MCRl9u+JP+1n5gKPDRpbVFkuWpWyqd+zXMgtapfFT8hg0qJ872dvpF4RkbL02Guxad0CUQikh/p6WCQ+XytMCFqI7MTyOXMHQ6hELjaSMCdK+VrPBNRnevgAcDtplM9nWvmZC32WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644774; c=relaxed/simple;
	bh=TPmM1Y4zQtbayFtP8s6u10qh5iWQIpuL6YvMmRFZZ7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrT8s/z0hDN01V+Vk2h2MXgW9RzSs/GYG5UdqKrnHcnVMiGRmScFl2mt8G8FnF6lADksYOUKvf6MfiESufcsf3E8FNh7p02gAj1quvyOiHLglXgSVMCcaYAFdJ+BgtsdaSV3CYc0MFinBxct5xX0R2OSFicaWx/iFQYBvn/2K7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phI66WdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72389C4CEE7;
	Tue, 28 Oct 2025 09:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761644774;
	bh=TPmM1Y4zQtbayFtP8s6u10qh5iWQIpuL6YvMmRFZZ7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=phI66WdZ4CPFa2yvxLXL9qBY+Lrqfcj5bjrEUrCMFJND1FCkaQGztz4DAcYhHLu1+
	 Qfk5GZ+m9nZUdd16iCSyXynmTeVj9XKJlnfPAMzvMGM+mxcohT0wiGdHShw+1/ZIN1
	 w2270guFY5mMtDD9vqOh5D94fMeHF7uUiKIDy5014wSr3DnS10GjRFMlf/je/SbkWG
	 yhsA576cMFpajL4TSHTA/PDuhtiOxnRHECgS3u5iuUPtGx58VPeLfK4pNV4/VfEIAA
	 bpk3dXs9iLUuUId9axY3fHhMn6KbaZWzwpPPKBPfstFlz2MDoAX2M2XjtMu+6y77KI
	 m8+OyMfA1rk5w==
Message-ID: <0bf4ab2e-9846-4f8b-ad72-e9db6fb7d08e@kernel.org>
Date: Tue, 28 Oct 2025 10:46:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
 <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
 <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2025 10:24, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Tue Oct 28, 2025 at 9:54 AM CET, Krzysztof Kozlowski wrote:
>> On Fri, Oct 24, 2025 at 02:23:59PM +0200, Luca Weiss wrote:
>>  +
>>> +  clock-names:
>>> +    items:
>>> +      - const: cam_ahb_clk
>>> +      - const: cam_axi
>>> +      - const: soc_ahb
>>> +      - const: camnoc_axi
>>> +      - const: core_ahb
>>> +      - const: cpas_ahb
>>> +      - const: csiphy0
>>> +      - const: csiphy0_timer
>>> +      - const: csiphy1
>>> +      - const: csiphy1_timer
>>> +      - const: csiphy2
>>> +      - const: csiphy2_timer
>>> +      - const: csiphy3
>>> +      - const: csiphy3_timer
>>> +      - const: slow_ahb_src
>>> +      - const: vfe0_axi
>>> +      - const: vfe0
>>> +      - const: vfe0_cphy_rx
>>> +      - const: vfe0_csid
>>> +      - const: vfe1_axi
>>> +      - const: vfe1
>>> +      - const: vfe1_cphy_rx
>>> +      - const: vfe1_csid
>>> +      - const: vfe2_axi
>>> +      - const: vfe2
>>> +      - const: vfe2_cphy_rx
>>> +      - const: vfe2_csid
>>> +      - const: vfe_lite
>>> +      - const: vfe_lite_cphy_rx
>>> +      - const: vfe_lite_csid
>>> +
>>> +  interrupts:
>>> +    maxItems: 12
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csid_lite
>>> +      - const: csiphy0
>>> +      - const: csiphy1
>>> +      - const: csiphy2
>>> +      - const: csiphy3
>>> +      - const: vfe0
>>> +      - const: vfe1
>>> +      - const: vfe2
>>> +      - const: vfe_lite
>>> +
>>> +  interconnects:
>>> +    maxItems: 4
>>> +
>>> +  interconnect-names:
>>> +    items:
>>> +      - const: cam_ahb
>>> +      - const: cam_hf_0_mnoc
>>> +      - const: cam_sf_0_mnoc
>>> +      - const: cam_sf_icp_mnoc
>>
>> Please share the list with the previous generation of this device. Which
>> one was used here as "previous"? For example x1e has quite different
>> names - nothing with "cam". No "cam" in qcs8300, either.
> 
> sm8250 is the big sibling for sm6350, so it's matching the names from

Ah, ok, good to know.

> there upstream. These exact names are also used downstream for
> "qcom,msm-bus,name".
> 
> I don't think there's anything preventing removing the cam_ prefix though.

Let's use the X1E names here.

> 
>>
>>
>>> +
>>> +  iommus:
>>> +    maxItems: 4
>>
>> I was told iommus might differ. Are you sure all of them represent the
>> same (e.g. not specific iommus for specific purposes)?
> 
> I don't really know.
> 
> These 4 iommus are labelled 'msm_cam_smmu_ife' downstream. There's still
> more iommus for more hardware blocks: jpeg, icp, cpas_cdm and lrme.

OK, that's fine then.

> 
> Maybe someone from Qualcomm/Linaro can explain this further if
> necessary?
> 
>>
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: ife0
>>> +      - const: ife1
>>> +      - const: ife2
>>> +      - const: top
>>
>> Uh, not your fault, but who came with this list in previous generations?
>> Instead of simple and obvious "top+ifeX" which allows growing/shrinking,
>> someone put "top" at the end which means this cannot follow same order
>> as X1E for example... Heh, it follows at least sm8550.
> 
> Shall we put top as first power-domain? I don't think it's an issue to
> change the order.

Well, it matches sm8550, so I am just grumpy complaining. It's fine.

> 
>>
>>
>>> +
>>> +  vdda-0.9-supply:
>>
>> There are no dots in property names. Are you sure these are called
>> VDDA_0.9 in the device datasheet (not schematics)? Please look at other
>> bindings how this is being named, depending whether this is PHY or PLL
>> supply (or only PHY).
> 
> The following power supplies are mentioned:
> 
> * VDD_CAMSS_PLL_0P9 - Camera SS PLL 0.9 V circuits
>     (not referenced in downstream kernel, connected to vreg_s5a in
>     schematics)

So that's vdda-pll-supply

> * VDD_A_CSI_x_0P9 - MIPI CSIx 0.9 V circuits
>     With pad names VDD_A_CSI_0_0P9 to VDD_A_CSI_3_0P9

vdd-csiphy-0p9-supply

> * VDD_A_CSI_x_1P25 - MIPI CSIx 1.25 V circuits
>     With pad names VDD_A_CSI_0_1P25 to VDD_A_CSI_3_1P25

vdd-csiphy-1p25-supply


Best regards,
Krzysztof

