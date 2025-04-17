Return-Path: <linux-media+bounces-30458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCDA91EAF
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 15:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BB1017C904
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355BB24EA9A;
	Thu, 17 Apr 2025 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpHK1+eD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF52139DC;
	Thu, 17 Apr 2025 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897864; cv=none; b=MZc+wzg+cZPpZEe51GXoYmOMr4GG7qau4Juh0bvZktALWGbA6bV7AclnidU0UWnXKdjCzzIBQgWBfAYPgEJAxjCRhnN7jySaSiLyQi8cJHF4meMqVIyXRga7nT9hOog0dy9JWD0iJYvJ5FlT8qGIAiXO4c57U885Jt3OK6X1bxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897864; c=relaxed/simple;
	bh=lYK4pj/r9Xudb2nVt3/iLvT2yys4OYhshyiKWFUrNmY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=LEY6qaETg64jAeNmMRhmVWKvvIeZVXph5Y3+fk8jXEHRYX09aa3yP7JjmZUXkPEhL5Elo5ltiYdJj8g/+igGaOs+8OKaT9J1mjYmxDH4bG+LmUnnZROIe+A9xQpfBJ1S8iqP0ARyBmbJh66hqyJbBlRZCjQuxPhcgDvl7DJvqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpHK1+eD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10095C4CEEA;
	Thu, 17 Apr 2025 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744897864;
	bh=lYK4pj/r9Xudb2nVt3/iLvT2yys4OYhshyiKWFUrNmY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FpHK1+eDGri/Q06V1lMnLWhOP49mBDukV/gF+Rs/IkycbV9ny4rbWaMtBCsUEg7Jm
	 T/ex9G3w+Vd5RhzeBwAnfgZfexSq12/jqvIXdIjLl+Ds0+sJAb5TAyL1qFERazvvgO
	 v4p9qVZWXpCR/NBnBllQi5FPpIKDS3SyFZ3WLWVQPrPONZ/XGFLqdGmCNydptKUiL8
	 38/kLvLlq9aB6S930EWPMCRDk98NMd6JTKNicPyfBpGexX4wb0mmRGTLk69JLJzKU4
	 tKUCU1HNrVR83FJrdsrFHoeXtNy42A1InIzwkNp0MxKA9G2IcKk5NMG23PfxKFoWuG
	 /2uRR5HG/XdQA==
Date: Thu, 17 Apr 2025 08:51:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
Message-Id: <174489760555.1657266.9336071214730240829.robh@kernel.org>
Subject: Re: [PATCH v7 0/6] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon


On Thu, 17 Apr 2025 12:27:01 +0100, Bryan O'Donoghue wrote:
> Changes in v7:
> - camss compat string is in media-comitters for 6.16 so it should
>   be possible to merge the core DTSI stuff in this series now.
> - Adds RB as indicated in previous cycle.
> - Changes <0 0xvalue 0 0xvalue> to <0x0 0xvalue 0x0 0xvalue> per
>   current comments on linux-arm-msm.
> - Includes CRD dtsi for the ov08x40.
> - Link to v6: https://lore.kernel.org/r/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org
> - Link to media-comitters: https://gitlab.freedesktop.org/linux-media/media-committers
> 
> Changes in v6:
> - Removes 'A phandle to an OPP node describing' per Krzysztof's comment
>   on patch #1
> - Drops Fixes: from patch #1 - Krzysztof
> - The ordering of opp description MXC and MMXC is kept as it matches the
>   power-domain ordering - Krzysztof/bod
> - Link to v5: https://lore.kernel.org/r/20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org
> 
> v5:
> - Picks up a Fixes: that is a valid precursor for this series - Vlad
> - Applies RB from Vlad
> - Drops "cam" prefix in interconnect names - Krzysztof/Vlad
> - Amends sorting of regs, clocks consistent with recent 8550 - Depeng/Vlad
> - Link to v4: https://lore.kernel.org/r/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org
> 
> v4:
> - Applies RB from Konrad
> - Adds the second CCI I2C bus to CCI commit log description.
>   I previously considered leaving out the always on pins but, decided
>   to include them in the end and forgot to align the commit log.
> - Alphabetises the camcc.h included in the dtsi. - Vlad
> - Link to v3: https://lore.kernel.org/r/20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org
> 
> v3:
> - Fixes ordering of headers in dtsi - Vlad
> - Changes camcc to always on - Vlad
> - Applies RB as indicated - Krzysztof, Konrad
> - Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org
> 
> v2:
> 
> I've gone through each comment and implemented each suggestion since IMO
> they were all good/correct comments.
> 
> Detail:
> 
> - Moves x1e80100 camcc to its own yaml - Krzysztof
> - csid_wrapper comes first because it is the most relevant
>   register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
> - Fixes missing commit log - Krz
> - Updates to latest format established @ sc7280 - bod
> - Includes CSID lite which I forgot to add @ v1 - Konrad, bod
> - Replaces static ICC parameters with defines - Konrad
> - Drops newlines between x and x-name - Konrad
> - Drops redundant iommu extents - Konrad
> - Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
>   Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
> - Interrupt EDGE_RISING - Vladimir
> - Implements suggested regulator names pending refactor to PHY API - Vladimir
> - Drop slow_ahb_src clock - Vladimir
> 
> Link to v1:
> https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org
> 
> Working tree:
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3
> 
> v1:
> 
> This series adds dt-bindings and dtsi for CAMSS on x1e80100.
> 
> The primary difference between x1e80100 and other platforms is a new VFE
> and CSID pair at version 680.
> 
> Some minor driver churn will be required to support outside of the new VFE
> and CSID blocks but nothing too major.
> 
> The CAMCC in this silicon requires two, not one power-domain requiring
> either this fix I've proposed here or something similar:
> 
> https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t
> 
> That doesn't gate adoption of the binding description though.
> 
> A working tree in progress can be found here:
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Bryan O'Donoghue (6):
>       arm64: dts: qcom: x1e80100: Add CAMCC block definition
>       arm64: dts: qcom: x1e80100: Add CCI definitions
>       arm64: dts: qcom: x1e80100: Add CAMSS block definition
>       arm64: dts: qcom: x1e80100-crd: Define RGB camera clock and reset pinout
>       arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
>       arm64: dts: qcom: x1e80100-crd: Define RGB sensor for cci1_i2c1
> 
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi   | 106 ++++++++++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 352 +++++++++++++++++++++++++++++++++
>  2 files changed, 458 insertions(+)
> ---
> base-commit: 0316f040a04804ff1f45e51ccd42b45552c54a60
> change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a
> 
> Best regards,
> --
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 0316f040a04804ff1f45e51ccd42b45552c54a60

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/isp@acb6000: failed to match any schema with compatible: ['qcom,x1e80100-camss']






