Return-Path: <linux-media+bounces-32304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A698AB37C2
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 14:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82336862E09
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 12:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B131295522;
	Mon, 12 May 2025 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpbNPEA5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9917E2951D8;
	Mon, 12 May 2025 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054174; cv=none; b=lFLjqZrY0sQk7QI/HfV1qmoRhApG0lrSJw6kxLYiz1FdqX5iS4ptLW80/H9NE+Qwj6JJyg9xNyd81XJ80im15z3z+vWfVhnK4is5lQiUNKajEOHd8GO9dKKnBVEdFKLVyO+ou+Wv8sLUf4e2WFzMZBAbFLu7swkHBZ2k5KxTXKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054174; c=relaxed/simple;
	bh=4sCnrLt5+b/Nr3tQwYV/v/pzsN34z6tW/1DRdvCDkkA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Cxyfsgw3Z2C4tW+VWjAkFLa5okXLMeIqnAuUjrvLes/E189rkALSRPIHO0d3L4CVW5u2+LaN7fr3hON8RIIYYI+G1OKSTLw26q9VEFMRPlMpI8VMfxCofUI3VGqOGgjqbQA8yDSAUUCTUcTZcYrdCeofTueAiCpU9G6SPeHRhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpbNPEA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBA6C4CEEF;
	Mon, 12 May 2025 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054174;
	bh=4sCnrLt5+b/Nr3tQwYV/v/pzsN34z6tW/1DRdvCDkkA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SpbNPEA5z2pRB9FzsA6AnqW+zN1ldKwwTpP1A7QSf77pwNFLFkdRLIJLeRXYFNa29
	 lNBVHW6g4Nw3RXEtLg41fUKZgxCD3lCXQlNGeRA4joxIhxtMDEo5jQu8c53P52Q4B8
	 QWIHV/bg2JS7mI+PbHNrELnmcsV+9ddogQ3IbL1xhDjcRliNubkvTTNde2rR6aZhha
	 fc3ZLcpvyxc3ldWXcMos1NNdgBml3Kj/OHj+Qw+emSAFv/+sRGu3uxtQmOUy7g0oBd
	 6flbpqUUip/84Hnz2wF8kb4c467bWnODW1+T+O8//ZA6Mx3e2QH0aAd8zZLp6BX2qT
	 iFdd88Oqrb+iw==
Date: Mon, 12 May 2025 07:49:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, Nicholas Roth <nicholas@rothemail.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Ondrej Jirman <megi@xff.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Dragan Simic <dsimic@manjaro.org>, Conor Dooley <conor+dt@kernel.org>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
Message-Id: <174705404383.2941320.1978376350297662131.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] Describe the cameras in the PinePhone Pro dts


On Fri, 09 May 2025 23:51:36 +0200, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
> Changes in v3:
> - Fixed new DTB warnings reported by Rob Herring's bot
> - Link to v2: https://lore.kernel.org/r/20250302-camera-v2-0-312b44b4a89c@bootlin.com
> 
> Changes in v2:
> - Rebase on mainline
> - Change patch subject to arm64: dts: rockchip
> - Rename new regulators to fit preferred form for fixed regulators
> - Link to v1: https://lore.kernel.org/r/20250228-camera-v1-0-c51869f94e97@bootlin.com
> 
> ---
> Olivier Benjamin (4):
>       dt-bindings: media: ov8858: inherit video-interface-devices properties
>       dt-bindings: media: imx258: inherit video-interface-devices properties
>       arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
>       arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro
> 
>  .../devicetree/bindings/media/i2c/ovti,ov8858.yaml |   4 +-
>  .../devicetree/bindings/media/i2c/sony,imx258.yaml |   4 +-
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 139 +++++++++++++++++++++
>  3 files changed, 145 insertions(+), 2 deletions(-)
> ---
> --
> Olivier Benjamin <olivier.benjamin@bootlin.com>
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
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-102-g2332d042e9b2 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250509-camera-v3-0-dab2772d229a@bootlin.com:

arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@1a (sony,imx258): Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#






