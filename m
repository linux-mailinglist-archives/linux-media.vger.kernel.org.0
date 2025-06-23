Return-Path: <linux-media+bounces-35564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C19AAE33A2
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 04:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1C8C7A4109
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 02:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1701A23AD;
	Mon, 23 Jun 2025 02:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ofkfbivh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B722A6FC5;
	Mon, 23 Jun 2025 02:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750646347; cv=none; b=Rlalr5+70+FRN07DK76bx6kkYdHC320v6cdiK27q1YLWdh+dfAPrqR/BaLUaz6JDUBfB6Lz6ljcV29gyXmd/D0lA4R0lmC8UBKH7CmyYRaqsHfHPTmKlImiUoD0FF/9pb6CGoeRPSjJA3fJ1dkdRnR8aoUwxK3gRmD/hEYdOSt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750646347; c=relaxed/simple;
	bh=YCayrwo135YdZ2z/8KoYinYmiFtJy2EgEmgdNyZ53WA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HnZ94Yjb7jthWsyZgdJrbkg74llo8uVieOt2qh/CNw1ZeMXyF6EHnw4+W9neiqbdQix4XGg0+2ErddF7RwjB+3+AiHOTTgIzecthls98otEB8c/+s3GsDMxWkLL1d6WZtdiHAMmRTmYo4QWoX8n0Qchxe2gnnTVIGXQ3E20k+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ofkfbivh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240BFC4CEE3;
	Mon, 23 Jun 2025 02:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750646347;
	bh=YCayrwo135YdZ2z/8KoYinYmiFtJy2EgEmgdNyZ53WA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ofkfbivhd0aIs33OlHXysHU4+9ECZEXF2i6Uhu1YRes7IXbvYRyPCvyAeoDvO6ycj
	 /4xqyTo0MR8yH2IMyd3cfVsPl6wjlb7ajftOgob97vDxnsf8dyohgrMgUgMrSX3/OJ
	 xPV7na6UJP5qdYJbyfDY22xw3qmWW0fW3UPMbYJl6gaW4Sdzg5QgFYswP1ygbbeURH
	 m9Zd7iDx7m/UonOmutpu319vf6t5KpTCHpgFv0lAW9b9Bs13AooHxplFdpalylAuqV
	 4+q5KBK0LSw0JZo1VBcVO0bMuiWIyePWZydMpwmq/kcELoFmweTcsiKfaWkYmMOBiy
	 wa92KpSRXDr0g==
Date: Sun, 22 Jun 2025 21:39:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@bootlin.com>, linux-rockchip@lists.infradead.org, 
 Rob Herring <robh+dt@kernel.org>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
References: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
Message-Id: <175064594415.880224.430742647337694886.robh@kernel.org>
Subject: Re: [PATCH v9 00/13] media: rockchip: add a driver for the
 rockchip camera interface


On Wed, 18 Jun 2025 17:37:55 +0200, Michael Riesch wrote:
> Habidere,
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> For example, the PX30 Video Input Processor (VIP) is able to receive
> video data via the Digital Video Port (DVP, a parallel data interface)
> and transfer it into system memory using a double-buffering mechanism
> called ping-pong mode.
> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
> DVP and a MIPI CSI-2 receiver that can receive video data independently
> (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...).
> 
> The v9 of the series adds a media controller centric V4L2 device driver
> for the Rockchip CIF with
>  - support for the PX30 VIP (not tested, though, due to the lack of HW)
>  - support for the RK3568 VICAP, including
>     - capturing frames from the DVP
>     - capturing frames from the MIPI CSI-2 receiver
>  - abstraction for the ping-pong scheme to allow for future extensions
>  - abstraction for the INTERFACE and CROP parts to allow for future
>    extensions
>  - initial support for different virtual channels (not tested, though,
>    due to the lack of HW)
> and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.
> 
> The patches are functional and have been tested successfully on a
> custom RK3568 board including the ITE Tech. IT6801 HDMI receiver and
> the Sony IMX415 image sensor as subdevices attached to the DVP and the
> MIPI CSI-2 receiver, respectively.
> The IT6801 driver still needs some loving care but shall be submitted
> as well at some point.
> 
> However, several features are not yet addressed, such as
>  - support for the RK3588 variant (-> first success achieved, patches
>    need some cleanup and shall be submitted separately)
>  - support for the MUX/SCALE/TOISP block in the RK3588 VICAP (which
>    provides the base for image processing on the RK3588)
>  - support for the scaling unit in the PX30 (-> cannot do due to the
>    lack of HW)
>  - support for the interface to the Rockchip ISP in the RK3568
>    (-> cannot do, latest information from Rockchip points out there
>    IS NO HW CONNECTION BETWEEN VICAP AND ISP ON RK3568)
> 
> Looking forward to your comments!
> 
> To: Mehdi Djait <mehdi.djait@linux.intel.com>
> To: Maxime Chevallier <maxime.chevallier@bootlin.com>
> To: Théo Lebrun <theo.lebrun@bootlin.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Gerald Loacker <gerald.loacker@wolfvision.net>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Markus Elfring <Markus.Elfring@web.de>
> To: Sakari Ailus <sakari.ailus@iki.fi>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> To: Kever Yang <kever.yang@rock-chips.com>
> To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> To: Sebastian Reichel <sebastian.reichel@collabora.com>
> To: Collabora Kernel Team <kernel@collabora.com>
> To: Paul Kocialkowski <paulk@sys-base.io>
> To: Alexander Shiyan <eagle.alexander923@gmail.com>
> To: Val Packett <val@packett.cool>
> To: Rob Herring <robh@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> 
> Changes in v9:
> - added compatible for RK3588 MIPI CSI-2 receiver, thus dropped
>   Krzysztof's R-b
> - added interrupts to rkcsi DT binding and RK356x DT
> - added variant specific callback to rkcif-capture-mipi that puts
>   together the CTRL0 register content (which varies between RK3568
>   and RK3588)
> - fixed v4l2_fill_pixfmt_mp() return value handling (Mehdi)
> - Link to v8: https://lore.kernel.org/r/20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com
> 
> Changes in v8:
> - rebased onto v6.16-rc1
> - fixed RKCIF_MIPI_MAX value in rkcif-common.h
> - fixed rkcsi Kconfig (kernel test robot)
> - sorted rkcsi DT bindings document properly, completed example
>   (Krzysztof)
> - squashed the defconfig patches (Krzysztof), dropped Bryan's R-b
> - Link to v7: https://lore.kernel.org/r/20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com
> 
> Changes in v7:
> - moved MIPI CSI-2 receiver driver into separate directory (Laurent)
> - rkcsi: fixed return values (Bryan)
> - rkcsi: fixed v4l2_get_link_freq to use pad instead of control
>   handler (Sakari)
> - rkcsi: added data-lanes property (Mehdi)
> - rkcif: fixed formatting (Bryan)
> - fixed "int" -> "unsigned int" in all for loops (Sakari)
> - rkcif-stream: fixed minimum number of required buffers (Mehdi)
> - rkcif-stream: used guards for the spinlock (Markus and Mehdi)
> - rkcif-stream: made driver less noisy with dev_dbg (Mehdi)
> - rkcif-stream: fixed issues detected by v4l2-compliance (Mehdi)
> - rkcif-dvp-capture: fixed return value propagation in _register()
>   (Mehdi)
> - removed stray "phy-names" from required properties (Rob's bot)
> - Link to v6: https://lore.kernel.org/r/20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com
> 
> Changes in v6:
> - rebased onto v6.15-rc1
> - renamed "MIPI CSI HOST" -> "MIPI CSI RECEIVER" (Laurent)
> - s/@wolfvision.net/@collabora.com where appropriate
> - renamed DVP delay property and moved it to the endpoint (Sakari)
> - implemented DT review comments (Krzysztof and Sakari)
> - implemented driver review comments (Sakari)
> - fixed issues raised by media-ci (yet again)
> - added documentation including a RK3568 topology (new patch 1)
>   (Sakari)
> - added patch that enables rkcif in the defconfig (new patch 9)
> - Link to v5: https://lore.kernel.org/r/20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net
> 
> Changes in v5:
> - fixed issues raised by media-ci
> - fixed dt bindings (comments by Rob and Sakari)
> - fixed probe on systems with no DVP in DT (comment by Alexander)
> - fixed error path in register offset calculation
> - split off MIPI CSI host driver into separate module (comment
>   by Mehdi)
> - added MODULE_DEVICE_TABLE() for both drivers (comment by Mehdi)
> - Link to v4: https://lore.kernel.org/r/20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net
> 
> Changes in v4:
> - added support for the MIPI CSI-2 receiver (new patches 4, 6, 7, 10)
> - fixed asserts on stream stop
> - fixed register address lookup
> - fixed link validiation callback
> - fixed issues raised by Rob's bot, kernel test robot, and media-ci
> - Link to v3: https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net
> 
> Changes in v3:
> - renamed the driver "cif" -> "rkcif"
> - rebased onto v6.14-rc1
> - abstracted the generic INTERFACE+CROP part
> - addressed comments by Rob and Sakari
> - added V4L2 MPLANE formats to DVP
> - added patch that enables the RK3568 VICAP DVP on PF5 IO Expander
> - fixed formatting issues raised by media-ci bot
> - Link to v2: https://lore.kernel.org/r/20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net
> 
> Changes in v2:
> - merged with Mehdi's v13
> - refactored the complete driver towards a media controller centric driver
> - abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
> - switched to MPLANE API
> - added support for notifications
> - Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net
> 
> ---
> Mehdi Djait (2):
>       media: dt-bindings: add rockchip px30 vip
>       arm64: dts: rockchip: add the vip node to px30
> 
> Michael Riesch (11):
>       Documentation: admin-guide: media: add rockchip camera interface
>       media: dt-bindings: video-interfaces: add defines for sampling modes
>       media: dt-bindings: add rockchip rk3568 vicap
>       media: dt-bindings: add rockchip rk3568 mipi csi-2 receiver
>       media: rockchip: add a driver for the rockchip camera interface
>       media: rockchip: add driver for mipi csi-2 receiver
>       media: rockchip: rkcif: add support for mipi csi-2 capture
>       arm64: defconfig: enable rockchip camera interface and mipi csi-2 receiver
>       arm64: dts: rockchip: add vicap node to rk356x
>       arm64: dts: rockchip: add mipi csi-2 receiver node to rk356x
>       arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander
> 
>  .../admin-guide/media/rkcif-rk3568-vicap.dot       |  21 +
>  Documentation/admin-guide/media/rkcif.rst          |  83 ++
>  Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
>  .../bindings/media/rockchip,px30-vip.yaml          | 122 +++
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 ++++
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 ++++
>  MAINTAINERS                                        |  17 +
>  arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
>  .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  78 ++
>  arch/arm64/configs/defconfig                       |   2 +
>  drivers/media/platform/rockchip/Kconfig            |   2 +
>  drivers/media/platform/rockchip/Makefile           |   2 +
>  drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
>  drivers/media/platform/rockchip/rkcif/Makefile     |   7 +
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 864 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 770 ++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  22 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   | 249 ++++++
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 302 +++++++
>  .../platform/rockchip/rkcif/rkcif-interface.c      | 425 ++++++++++
>  .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
>  drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 154 ++++
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 637 +++++++++++++++
>  .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
>  drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
>  drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
>  drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 735 ++++++++++++++++++
>  include/dt-bindings/media/video-interfaces.h       |   4 +
>  30 files changed, 4965 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20240220-rk3568-vicap-b9b3f9925f44
> 
> Best regards,
> --
> Michael Riesch <michael.riesch@collabora.com>
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
 Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com:

arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.2.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:282.3-26: Warning (interrupts_property): /csi@fdfb0000:#interrupt-cells: size is (32), expected multiple of 12
arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: csi@fdfb0000 (rockchip,rk3568-mipi-csi): interrupts: [[0, 8, 4], [0, 0, 9], [4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#






