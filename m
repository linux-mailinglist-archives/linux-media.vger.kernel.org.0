Return-Path: <linux-media+bounces-44139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E20BCB021
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 00:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F52648016C
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 22:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EF2283FCE;
	Thu,  9 Oct 2025 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLjK+PTc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2911A9FAE;
	Thu,  9 Oct 2025 22:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047422; cv=none; b=Q761gSsK52mREt67bUm0lQkhHsSKiy21c3wS3Kw4CB4PGvIYt4wYQcivw24Yw9S1qZ7rB8zL5IK+Rg9Q0yp4cECin9p3z+FMwQsGWNBeY/NMidenGUq1AqL5iqmuJJR5SLgXmBIutFxwxbFV7jAo1+RKl2xU59Zk0s5GdD1rl8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047422; c=relaxed/simple;
	bh=y4UL6GRsCxQz/H0uGl4KUjPdCZu7wASRZNP78GKHHHs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Nf36gEvIL8dLTAPFhllOLiWidwmO7+M5EsLry4UXzbBktHYXCuJVH7lMamunG1hkMS8ZScNYjmOeWAMMj8KsG9VwZaqeckV0WAGzJulL5Xh85s3bIg18RP678j6e8vZKpQ1RSPKxn2fcKxfSlgBQA+bKPuQF1Ov0SXAo0hqAdMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLjK+PTc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DC8C4CEE7;
	Thu,  9 Oct 2025 22:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760047422;
	bh=y4UL6GRsCxQz/H0uGl4KUjPdCZu7wASRZNP78GKHHHs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XLjK+PTcVv3hQtnJotI2Z6/bsrbX+V1IAeSYRncgSwFnW4/wRjZ0JNOqnyWAjo9Mw
	 LmUZJvjm87KT4BKjT/Kakb47eAM0zSUwJyjZ1dB7/jk9MYtDRd1jIgf5VeG4CMvSAK
	 BsXm9S6KEWd2R8ykMXVxO9CH0a/UlwDmlYqgGevH4vykCr10cFuFGFgdcBL9QsrSq/
	 ZRwx0w1Z+4TnuGahz3kDdn+qjoOhNoOQxb70QHWxILiNtQdaJEmBkScX5VQxQVXRO1
	 jGPyoOeb4wg3fEFrS6tjXoRRtcZmRM+aOj3PrfZnBbt2yiIO7ZTegrU0ldvY/lSbVw
	 q/xv88I6bSj+A==
Date: Thu, 09 Oct 2025 17:03:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 linux-media@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
Message-Id: <176004726732.3398669.5458198816928209107.robh@kernel.org>
Subject: Re: [PATCH 00/16] media: platform: rga: Add RGA3 support


On Tue, 07 Oct 2025 10:31:53 +0200, Sven Püschel wrote:
> This series adds support for the Raster Graphic Acceleration 3 (RGA3)
> peripheral, which is included in the RK3588 SoC. Unlike the RGA2 it
> can use the existing rockchip-iommu-v2 driver to handle iommu mappings.
> Also the RK3588 contains two independent RGA3 cores.
> 
> Only scaling and format conversions between common 8bit RGB/YUV formats
> are implemented. Also the color space conversion is fixed to BT601F.
> This already allows a practical usage of the RGA3.
> 
> This was tested on a Radxa Rock 5T. With the increased clock speeds in
> the devicetree around 160 fps were measured when scaling and converting
> from RGBA 480x360 to NV12 3840x2160. Without the clock speed scaling a
> default clock division factor of 2 is used and only around 80 fps are
> reached with one core. The v4l2-compliance tests only complain about
> the already failing colorspace propagation:
> 
>   v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>   ...
>   		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() != col
>   	test VIDIOC_S_FMT: FAIL
>   ...
>   Total for rockchip-rga device /dev/video0: 47, Succeeded: 46, Failed: 1, Warnings: 0
> 
>   v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>   ...
>   		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() != col
>   	test VIDIOC_S_FMT: FAIL
>   ...
>   Total for rockchip-rga device /dev/video1: 47, Succeeded: 46, Failed: 1, Warnings: 0
> 
>   v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>   ...
>   		fail: v4l2-test-formats.cpp(923): fmt_cap.g_colorspace() != col
>   	test VIDIOC_S_FMT: FAIL
>   ...
>   Total for rockchip-rga device /dev/video2: 47, Succeeded: 46, Failed: 1, Warnings: 0
> 
> Each RGA core is a separate /dev/video device. To distinguish the RGA2
> core from the RGA3 cores the Card type is set accordingly. Combining all
> cores into a single device and scheduling tasks to the best core might
> be a future improvement, if it is desired by upstream to handle the
> scheduling and selection in kernel space.
> 
> Patch 1-2 are general cleanups
> Patch 3-12 prepare the rga driver for the RGA3
> Patch 13 documments the RGA3 compatible value
> Patch 14 adds the RGA3 cores to the rk3588 dtsi
> Patch 15 increases the RGA3 core clock speeds
> Patch 16 adds RGA3 support to the rga driver
> 
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> ---
> Sven Püschel (16):
>       media: rockchip: rga: use clk_bulk api
>       media: rockchip: rga: use stride for offset calculation
>       media: rockchip: rga: align stride to 16 bytes
>       media: rockchip: rga: move hw specific parts to a dedicated struct
>       media: rockchip: rga: use card type to specify rga type
>       media: rockchip: rga: change offset to dma_addresses
>       media: rockchip: rga: support external iommus
>       media: rockchip: rga: remove size from rga_frame
>       media: rockchip: rga: remove stride from rga_frame
>       media: rockchip: rga: move rga_fmt to rga-hw.h
>       media: rockchip: rga: add iommu restore function
>       media: rockchip: rga: handle error interrupt
>       media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
>       arm64: dts: rockchip: add rga3 dt nodes
>       arm64: dts: rockchip: increase rga3 clock speed
>       media: rockchip: rga: add rga3 support
> 
>  .../devicetree/bindings/media/rockchip-rga.yaml    |   1 +
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  50 +++
>  drivers/media/platform/rockchip/rga/Makefile       |   2 +-
>  drivers/media/platform/rockchip/rga/rga-buf.c      |  78 ++--
>  drivers/media/platform/rockchip/rga/rga-hw.c       | 356 ++++++++++++---
>  drivers/media/platform/rockchip/rga/rga-hw.h       |  15 +-
>  drivers/media/platform/rockchip/rga/rga.c          | 404 ++++++-----------
>  drivers/media/platform/rockchip/rga/rga.h          |  74 ++--
>  drivers/media/platform/rockchip/rga/rga3-hw.c      | 490 +++++++++++++++++++++
>  drivers/media/platform/rockchip/rga/rga3-hw.h      | 186 ++++++++
>  10 files changed, 1246 insertions(+), 410 deletions(-)
> ---
> base-commit: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
> change-id: 20251001-spu-rga3-8a00e018b120
> 
> Best regards,
> --
> Sven Püschel <s.pueschel@pengutronix.de>
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
 Base: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de:

arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb60f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:2255.3-26: Warning (interrupts_property): /iommu@fdb70f00:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: rga@fdb60000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: rga@fdb70000 (rockchip,rk3588-rga3): 'interrupt-names', 'iommus' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-rga.yaml#






