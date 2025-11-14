Return-Path: <linux-media+bounces-47128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA7C5DFEB
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 16:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0BF504F694D
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184C6341AA0;
	Fri, 14 Nov 2025 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBwwaeql"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6033BBC8;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133620; cv=none; b=OvlO5wlYiZcFT89+UMJ5OoHqP90Cxw8KDfeVEPj6ETcMh9yyaREOQBo5wFBm27/BGEBGBDgc8NhEOdrYaKR5K3+OcEDNFHuz9uiZyXP5Gpkb2w/02zzfCelr1YuZsuQyLatL/4nLAoDmx4v3YQLgdv3YN5x3P4YcT/MxChcg1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133620; c=relaxed/simple;
	bh=j7OEjxnWbnxgYr5nv9qmH2uUsnefB/Xdl9fyqK8S4q0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Or3SbNOV8mcHvY6jqpQ6s8bcLit94qFtqtlRn7U95ieOffy3qdK4VqYXFlybZ9Sez0rmNH7Yp4Gd+Uh8gvreunwi2WhbtxjAUeq0+DKWxpmIR9IJnDYzfDa3vgKv8v6Wg3fbFx1cLddO1M1g7jUSFconH+xg8fTW5vC9NGwbKZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBwwaeql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA466C19421;
	Fri, 14 Nov 2025 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133619;
	bh=j7OEjxnWbnxgYr5nv9qmH2uUsnefB/Xdl9fyqK8S4q0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tBwwaeqlbZEdeLgXxCqJJOWYZan6csk8pjlT8FE8bF5UdsohiOBMd7/m4s5Uf7dg4
	 qgwNHyqpvVY6nXBFcG2kitXQ+TAHC6fMLFL0rNbnOmjWUgyiOmF3cazu2zBnPo2MPG
	 J4/0oGlgzLvPfDHsld2wL3kVS0ExkgVYKO/udwIoiFuYhEB3vxJktqJ8z6/P56Wira
	 XaM6/3GZ48TySr/HT/TfyoXNkvmWqN9kkJqC5A2+ljlA4ZmLNMvnisVCHTs7IMBIIj
	 fZOo69nTc4SjgWJBudu5iu0cz8xAsh3iCs2cMO4kn2yByQww0o3sG5Cq3mMoldhHNC
	 xZwxcqvXlXKHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E9ECE7B13;
	Fri, 14 Nov 2025 15:20:19 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v15 00/14] media: rockchip: add a driver for the rockchip
 camera interface
Date: Fri, 14 Nov 2025 16:20:11 +0100
Message-Id: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKtIF2kC/33SzW7bMAwH8FcpfJ4KUl+Wdup7DD2QErUYS+PAD
 twNRd59Uouty6D4SAn6/SmQb8MqyyTr8PXhbVhkm9ZpPtUC3ZeHIR3o9F3UlOvBoEFb0BrU8sM
 4H9Q2JTorjmxKjNoVa4f6hGkVxQud0qE9epFDntSGpt2dFynTz/esb8+1PkzrZV5+vUdv2E4/Q
 zavgrrM5ynd5m2oQGkfgLCQt8BPr/OxfLT9eJLL0OBN/8VQ43gf0xVjzDaEkhJk08XMH8yBBn8
 fMxXzMWPBKC5Z6GL2HwzjfcxWTCJ4D0BiuI+5T8zsdeYqVmqe087YYlIX87cDuBV8FbIurrAIO
 odPaT4eieeFHtP88gGMe8BYgdEFLDl6MoZ6QNgDQgVijomTZadt7gFxD4gVoCRYZ5MsBd0DEPY
 EhDZhnQONrCGy7RK4S7T1pQJCmZwV1/0G6l2iLW3ymSWJZ46hS5hdoq1qJvSWbcRQpEvYXaItK
 JvAPhOUFOB/4nq9/gZMyAvdXAQAAA==
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763133617; l=11371;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=j7OEjxnWbnxgYr5nv9qmH2uUsnefB/Xdl9fyqK8S4q0=;
 b=o72Um10xmh5ToSKuJGaIF7Iz3BjIVm7/HzVoUEq2jtZyCprx3JuSB1HorwSFeXrjP0hVhACZY
 yGAfX6cZ8hUAPKgUhjD+5Jarwbz9iGczkk4TqBYuB5T+9Db8ZIn6oN+
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,

This series introduces support for the Rockchip Camera Interface (CIF),
which is featured in many Rockchip SoCs in different variations.
The series has now been around for a while and has received many comments
and reviews. Thus, it should be ready for mainline by now.

The last issue we discussed (see thread to v14, link below) was the
necessary integration of a mux subdevice, as the MIPI CSI-2 data can
be passed to the ISP and/or to the VICAP on RK3568. In order to avoid
any uAPI breakage, the MIPI CSI-2 receiver support has been removed in v15
(following an off-list discussion with Sakari).

Therefore, the v15 of the series adds a media controller centric V4L2
device driver for the Rockchip CIF with
 - support for the PX30 VIP (not tested, though, due to the lack of HW)
 - support for the RK3568 VICAP, including
    - capturing frames from the DVP
    - capturing frames from the MIPI CSI-2 receiver
 - abstraction for the ping-pong scheme to allow for future extensions
 - abstraction for the INTERFACE and CROP parts to allow for future
   extensions
 - initial support for different virtual channels (not tested, though,
   due to the lack of HW)

Apart from that, there are no changes compared to v14.

Looking forward to your comments!

To: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
To: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Collabora Kernel Team <kernel@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
To: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Changes in v15:
- dropped everything related to MIPI CSI-2 receiver
- Link to v14: https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

Changes in v14:
- rkcsi: fixed invalid format handling in _set_fmt() (v4l2-compliance)
- rkcif-interface: fixed crop, reset crop at source when sink format
  is changed (v4l2-compliance)
- rebased onto media-committers/next
- Link to v13: https://lore.kernel.org/r/20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com

Changes in v13:
- fixed interrupt names in CSI-2 reciever bindings example (Rob's bot)
- revised Radxa Camera 8M device tree overlay
- Link to v12: https://lore.kernel.org/r/20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com

Changes in v12:
- added Radxa Camera 8M device tree overlay
- rebased onto v6.18-rc1
- fixed IOMMU pagefaults caused by wrong VLW (Mehdi)
- fixed indentation of register defines in -regs.h (Sakari)
- renamed CSI-2 receiver interrupts (Rob)
- added MEDIA_BUS_TYPE_* as comments in DT bindings (Bryan)
- added newline in rkcif-dev.c (Bryan)
- Link to v11: https://lore.kernel.org/r/20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com

Changes in v11:
- rkcif: split large driver patch (6/13 of v10) into smaller
  patches (6-11/17 of v11) (Bryan)
- rkcsi: replaced devm_reset_control_array_get_exclusive with 
  devm_reset_control_get_exclusive (Philipp)
- Link to v10: https://lore.kernel.org/r/20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com

Changes in v10:
- rkcsi: fixed error handling in rkcsi_start (Bryan)
- rkcsi: fixed interrupt references in device tree and bindings
  (Rob's bot)
- added missing call to rkcif_mipi_stop_streaming from rkcif_mipi_isr
  (Mehdi)
- renamed remaining instances "cif_" -> "rkcif_" in functions
- Link to v9: https://lore.kernel.org/r/20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com

Changes in v9:
- added compatible for RK3588 MIPI CSI-2 receiver, thus dropped
  Krzysztof's R-b
- added interrupts to rkcsi DT binding and RK356x DT
- added variant specific callback to rkcif-capture-mipi that puts
  together the CTRL0 register content (which varies between RK3568
  and RK3588)
- fixed v4l2_fill_pixfmt_mp() return value handling (Mehdi)
- Link to v8: https://lore.kernel.org/r/20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com

Changes in v8:
- rebased onto v6.16-rc1
- fixed RKCIF_MIPI_MAX value in rkcif-common.h
- fixed rkcsi Kconfig (kernel test robot)
- sorted rkcsi DT bindings document properly, completed example
  (Krzysztof)
- squashed the defconfig patches (Krzysztof), dropped Bryan's R-b
- Link to v7: https://lore.kernel.org/r/20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com

Changes in v7:
- moved MIPI CSI-2 receiver driver into separate directory (Laurent)
- rkcsi: fixed return values (Bryan)
- rkcsi: fixed v4l2_get_link_freq to use pad instead of control
  handler (Sakari)
- rkcsi: added data-lanes property (Mehdi)
- rkcif: fixed formatting (Bryan)
- fixed "int" -> "unsigned int" in all for loops (Sakari)
- rkcif-stream: fixed minimum number of required buffers (Mehdi)
- rkcif-stream: used guards for the spinlock (Markus and Mehdi)
- rkcif-stream: made driver less noisy with dev_dbg (Mehdi)
- rkcif-stream: fixed issues detected by v4l2-compliance (Mehdi)
- rkcif-dvp-capture: fixed return value propagation in _register()
  (Mehdi)
- removed stray "phy-names" from required properties (Rob's bot)
- Link to v6: https://lore.kernel.org/r/20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com

Changes in v6:
- rebased onto v6.15-rc1
- renamed "MIPI CSI HOST" -> "MIPI CSI RECEIVER" (Laurent)
- s/@wolfvision.net/@collabora.com where appropriate
- renamed DVP delay property and moved it to the endpoint (Sakari)
- implemented DT review comments (Krzysztof and Sakari)
- implemented driver review comments (Sakari)
- fixed issues raised by media-ci (yet again)
- added documentation including a RK3568 topology (new patch 1)
  (Sakari)
- added patch that enables rkcif in the defconfig (new patch 9)
- Link to v5: https://lore.kernel.org/r/20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net

Changes in v5:
- fixed issues raised by media-ci
- fixed dt bindings (comments by Rob and Sakari)
- fixed probe on systems with no DVP in DT (comment by Alexander)
- fixed error path in register offset calculation
- split off MIPI CSI host driver into separate module (comment
  by Mehdi)
- added MODULE_DEVICE_TABLE() for both drivers (comment by Mehdi)
- Link to v4: https://lore.kernel.org/r/20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net

Changes in v4:
- added support for the MIPI CSI-2 receiver (new patches 4, 6, 7, 10)
- fixed asserts on stream stop
- fixed register address lookup
- fixed link validiation callback
- fixed issues raised by Rob's bot, kernel test robot, and media-ci
- Link to v3: https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net

Changes in v3:
- renamed the driver "cif" -> "rkcif"
- rebased onto v6.14-rc1
- abstracted the generic INTERFACE+CROP part
- addressed comments by Rob and Sakari
- added V4L2 MPLANE formats to DVP
- added patch that enables the RK3568 VICAP DVP on PF5 IO Expander
- fixed formatting issues raised by media-ci bot
- Link to v2: https://lore.kernel.org/r/20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net

Changes in v2:
- merged with Mehdi's v13
- refactored the complete driver towards a media controller centric driver
- abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
- switched to MPLANE API
- added support for notifications
- Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net

---
Mehdi Djait (2):
      media: dt-bindings: add rockchip px30 vip
      arm64: dts: rockchip: add the vip node to px30

Michael Riesch (12):
      Documentation: admin-guide: media: add rockchip camera interface
      media: dt-bindings: video-interfaces: add defines for sampling modes
      media: dt-bindings: add rockchip rk3568 vicap
      media: rockchip: add driver for the rockchip camera interface
      media: rockchip: rkcif: add abstraction for interface and crop blocks
      media: rockchip: rkcif: add abstraction for dma blocks
      media: rockchip: rkcif: add support for px30 vip dvp capture
      media: rockchip: rkcif: add support for rk3568 vicap dvp capture
      media: rockchip: rkcif: add support for rk3568 vicap mipi capture
      arm64: defconfig: enable rockchip camera interface
      arm64: dts: rockchip: add vicap node to rk356x
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

 .../admin-guide/media/rkcif-rk3568-vicap.dot       |   8 +
 Documentation/admin-guide/media/rkcif.rst          |  79 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 .../bindings/media/rockchip,px30-vip.yaml          | 124 +++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 172 ++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  44 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
 drivers/media/platform/rockchip/rkcif/Makefile     |   8 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 865 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  25 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 777 ++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  23 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 250 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 303 ++++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 442 +++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  31 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 153 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 638 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  32 +
 include/dt-bindings/media/video-interfaces.h       |   4 +
 26 files changed, 4042 insertions(+)
---
base-commit: d363bdfa0ec6b19a4f40b572cec70430d5b13ad6
change-id: 20240220-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



