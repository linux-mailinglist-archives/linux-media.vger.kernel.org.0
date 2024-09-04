Return-Path: <linux-media+bounces-17598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D596BEB3
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 15:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E28F282706
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7C41DC07E;
	Wed,  4 Sep 2024 13:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6v+SAhg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233181DC063;
	Wed,  4 Sep 2024 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725457008; cv=none; b=tiOOWcJ5Rjal6lhuwvrSWYf2sH9yhEKWcwVIMQ/KkMwDSPAoQUyJ4SBaMxxXT4NVx3EGegzjjS9po6yYJ1GyJdzmS9Q3gzyyPaM1t7b55khRjWFq6gDHXYkbPQho/WHBwW1nRdEgM3CjYk9NXjHuqf1Bo6tO883jX2dMCYZFGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725457008; c=relaxed/simple;
	bh=qjvJ5qt+qG+v8zQHBH0fy06OHFR7KWMqsLIE2+fh8Zk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=MMacCKeZKK94XvAAbT3fQmuKW54Ldab0du5+GhquLmebWzzdE9CiAMIABHa3F62lhahwMBvUhq0dDDt5MBVQTl9ZkT5MLjKL/+phz92OTUmZS5KNM8tye5Y2k+d9fefylweP36bvGeLo+UXHYn9989JIZKZaZUByHMyjz2SYfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6v+SAhg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32ACDC4CEC3;
	Wed,  4 Sep 2024 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725457007;
	bh=qjvJ5qt+qG+v8zQHBH0fy06OHFR7KWMqsLIE2+fh8Zk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=l6v+SAhgFmSTidGa/NZMfa+E2fxijpwefZgT2IDlGcYuRzNjWIyd6iH20DjofLFRV
	 YGDq2n/BishEtIrwor3UsfA5mqR13B2kXN2j0gkxinVYdvd05lvQ+p1O+Q03QRt3Rg
	 i/wKIOCYDE1aDUU+Gs6KCt6A7X/Fl4u/NEtu/CWXFMD5HXYG1qOMIvsx7GjUIjDxbp
	 LmOT3P9ENaCBKh+444/Jls9mof2UOOSIsw0XZskX6gyRbthfueOa7GTuHNA8i58HHX
	 mw8LDvsH44u2NlGjPZ/FhkhzdwGwsQdmIQ5vks0W7WUoPkHmaxhKLlZSap+5Km4yP/
	 k3MOGW5bY7xrw==
Date: Wed, 04 Sep 2024 08:36:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: devicetree@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
 linux-media@vger.kernel.org, stable@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, cros-qcom-dts-watchers@chromium.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Todor Tomov <todor.too@gmail.com>, 
 Hariram Purushothaman <hariramp@quicinc.com>, 
 Kapatrala Syed <akapatra@quicinc.com>, 
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>, 
 Hariram Purushothaman <quic_hariramp@quicinc.com>, 
 Will Deacon <will@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
Message-Id: <172545686193.2410595.1216751512618101525.robh@kernel.org>
Subject: Re: [PATCH 00/10] (no cover subject)


On Wed, 04 Sep 2024 16:40:06 +0530, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to
> bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> 
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> The changes are verified on SC7280 qcs6490-rb3gen2-vision board,
> the base dts for qcs6490-rb3gen2 is:
> https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.com/
> 
> V1 for this series: https://lore.kernel.org/linux-arm-msm/20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com/
> 
> Changes in V2:
> 1)  Improved indentation/formatting.
> 2)  Removed _src clocks and misleading code comments.
> 3)  Added name fields for power domains and csid register offset in DTSI.
> 4)  Dropped minItems field from YAML file.
> 5)  Listed changes in alphabetical order.
> 6)  Updated description and commit text to reflect changes
> 7)  Changed the compatible string from imx412 to imx577.
> 8)  Added board-specific enablement changes in the newly created vision
>      board DTSI file.
> 9)  Fixed bug encountered during testing.
> 10) Moved logically independent changes to a new/seprate patch.
> 11) Removed cci0 as no sensor is on this port and MCLK2, which was a
>     copy-paste error from the RB5 board reference.
> 12) Added power rails, referencing the RB5 board.
> 13) Discarded Patch 5/6 completely (not required).
> 14) Removed unused enums.
> 
> To: Robert Foss <rfoss@kernel.org>
> To: Todor Tomov <todor.too@gmail.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Kapatrala Syed <akapatra@quicinc.com>
> To: Hariram Purushothaman <hariramp@quicinc.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> To: cros-qcom-dts-watchers@chromium.org
> To: Catalin Marinas <catalin.marinas@arm.com>
> To: Will Deacon <will@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> Test-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
> Suresh Vankadara (1):
>       media: qcom: camss: Add support for camss driver on SC7280
> 
> Vikram Sharma (9):
>       media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
>       media: dt-bindings: media: qcs6490-rb3gen2-vision-mezzanine: Add dt bindings
>       media: qcom: camss: Fix potential crash if domain attach fails
>       media: qcom: camss: Sort CAMSS version enums and compatible strings
>       media: qcom: camss: Add camss_link_entities_v2
>       arm64: dts: qcom: sc7280: Add support for camss
>       arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Enable IMX577 sensor
>       arm64: dts: qcom: sc7280: Add default and suspend states for GPIO
>       arm64: defconfig: Enable camcc driver for SC7280
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  .../bindings/media/qcom,sc7280-camss.yaml          | 441 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dts  |  61 +++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 208 ++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/media/platform/qcom/camss/camss-csid.c     |   1 -
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  13 +-
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |   5 +
>  drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe.c      |   8 +-
>  drivers/media/platform/qcom/camss/camss.c          | 400 ++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss.h          |   1 +
>  13 files changed, 1131 insertions(+), 11 deletions(-)
> ---
> base-commit: fdadd93817f124fd0ea6ef251d4a1068b7feceba
> change-id: 20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-15c195fb3f12
> 
> Best regards,
> --
> Vikram Sharma <quic_vikramsa@quicinc.com>
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


New warnings running 'make CHECK_DTBS=y qcom/qcs6490-rb3gen2-vision-mezzanine.dtb' for 20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c08000: interrupt-names:0: 'msi' was expected
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: usb@8cf8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: video-codec@aa00000: iommus: [[66, 8576, 32]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-venus.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('cam2-default', 'cam2-suspend' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-pinctrl.yaml#






