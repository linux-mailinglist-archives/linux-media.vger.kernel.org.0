Return-Path: <linux-media+bounces-19271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9979995293
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 16:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889D31F26123
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D131E049E;
	Tue,  8 Oct 2024 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZBEHlQs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573171E00A6;
	Tue,  8 Oct 2024 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399404; cv=none; b=mtatXvkMLI++PkMFtIU88WLJmqyFlPLUwZG8hSclT090CDOsuRLyDB3jAXtenkAA81xTJRoy/Ha0WxdXq2eb2DHAP2BM2dixENtzGMacKeu3ecrVOdTj1nsbRps4iGc2ClXmDJTlDgHH/ZySqXaP+L7vl0Sjyg5WkJiZbwiK8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399404; c=relaxed/simple;
	bh=zfXMLHZZ4S156l8d/BbkONRVgFIUqnsGeh1jRe6xziE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=R4bppGEiZ2DWYTN4AhQRE58KODkPqUnT928OIRtG1+TWo01gNafvq3ynujHGi/CYg64GFHdo4O0SyzhSmY3HaMvCLn5rK28KHx6bswf5WYoCX79VpzclmleWp2QFMBJzgYHoNUw7CGptktonpRk1WhzU6JM5hfI81zQW/0YW6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZBEHlQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F54C4CECD;
	Tue,  8 Oct 2024 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728399403;
	bh=zfXMLHZZ4S156l8d/BbkONRVgFIUqnsGeh1jRe6xziE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=PZBEHlQsW4A017AUdoosNcNDTEVEVKg7sFv9ZPvJqtObOuKcRbsJTqEUndR26Go9l
	 cGaKRikGLQoTaWBVGf3UZ6oaKfNTs0EQvZXGukSR8i+k5aWc4Wvtz9hnkjV8JiDZ/z
	 zU3lP0MsqAchXGYcBSzpp0ct9DykYHRBhfcliYzpi/tYNBYtHI8Xm56nwP9/DV2QCw
	 gPQaw60gJwZLJoftVTQ1skIPucFxAPawQIC+eSjtHswiQ1YXB/75VbjhaoWbIGsKyw
	 D4VNHdg0oiyZliBwLB250Y0tCxESDEQDGqLZ7rGJcVIAffZIu6nh5dTorUZams0v6d
	 V6lw8CpmHMyRQ==
Date: Tue, 08 Oct 2024 09:56:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-media@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
Message-Id: <172839929145.1375728.3090731448199694318.robh@kernel.org>
Subject: Re: [PATCH 00/15] media: stm32: introduction of CSI / DCMIPP for
 STM32MP25


On Tue, 08 Oct 2024 13:18:02 +0200, Alain Volmat wrote:
> This series introduces the camera pipeline support for the
> STM32MP25 SOC.  The STM32MP25 has 3 pipelines, fed from a
> single camera input which can be either parallel or csi.
> 
> This series adds the basic support for the 1st pipe (dump)
> which, in term of features is same as the one featured on
> the STM32MP13 SOC.  It focuses on introduction of the
> CSI input stage for the DCMIPP, and the CSI specific new
> control code for the DCMIPP.
> One of the subdev of the DCMIPP, dcmipp_parallel is now
> renamed as dcmipp_input since it allows to not only control
> the parallel but also the csi interface.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Alain Volmat (15):
>       media: stm32: dcmipp: correct dma_set_mask_and_coherent mask value
>       dt-bindings: media: addition of stm32 csi driver description
>       media: stm32: csi: addition of the STM32 CSI driver
>       media: stm32: dcmipp: use v4l2_subdev_is_streaming
>       media: stm32: dcmipp: replace s_stream with enable/disable_streams
>       media: stm32: dcmipp: rename dcmipp_parallel into dcmipp_input
>       media: stm32: dcmipp: add support for csi input into dcmipp-input
>       media: stm32: dcmipp: add bayer 10~14 bits formats
>       media: stm32: dcmipp: add 1X16 RGB / YUV formats support
>       media: stm32: dcmipp: avoid duplicated format on enum in bytecap
>       media: stm32: dcmipp: fill media ctl hw_revision field
>       dt-bindings: media: addition of stm32mp25 compatible of DCMIPP
>       media: stm32: dcmipp: add core support for the stm32mp25
>       arm64: dts: st: add csi & dcmipp node in stm32mp25
>       arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1
> 
>  .../devicetree/bindings/media/st,stm32-csi.yaml    |  129 +++
>  .../devicetree/bindings/media/st,stm32-dcmipp.yaml |   53 +-
>  MAINTAINERS                                        |    8 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |   23 +
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   87 ++
>  drivers/media/platform/st/stm32/Kconfig            |   14 +
>  drivers/media/platform/st/stm32/Makefile           |    1 +
>  drivers/media/platform/st/stm32/stm32-csi.c        | 1150 ++++++++++++++++++++
>  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |    2 +-
>  .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  128 ++-
>  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  119 +-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |    4 +-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  116 +-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  |  540 +++++++++
>  .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        |  440 --------
>  15 files changed, 2238 insertions(+), 576 deletions(-)
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241007-csi_dcmipp_mp25-7779601f57da
> 
> Best regards,
> --
> Alain Volmat <alain.volmat@foss.st.com>
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


New warnings running 'make CHECK_DTBS=y st/stm32mp257f-ev1.dtb' for 20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: imx335@1a: 'powerdown-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx335.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: csi@48020000: ports:port@0:endpoint:data-lanes:0: 0 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/media/st,stm32-csi.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: csi@48020000: ports:port@0:endpoint:data-lanes:1: 1 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/media/st,stm32-csi.yaml#






