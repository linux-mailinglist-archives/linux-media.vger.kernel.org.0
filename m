Return-Path: <linux-media+bounces-44419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D7BD9868
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 15:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29F2519A1E8A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198E8314B76;
	Tue, 14 Oct 2025 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6egntmR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8981E5B60;
	Tue, 14 Oct 2025 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446966; cv=none; b=Fq4VG1itrCBZcZMrRONNNaBAU520tcZARWJ/5CMkdkT3O3lk+5zLiB6sXP5lbjx5IhCXY0+XYgUyo3xc2iPt9N7nxVu/daWXaHSMAqi29N4+jbeph1TIkkxKtCmx2muY3mCJwejeNIAoHlYzdPtMje5qOINJVb6+tWVT8RBR/a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446966; c=relaxed/simple;
	bh=cUiMgQHo5DRosN34vFJaO9nzFj79sa2IHI2T1P3ebH8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UAvZx1rum4mlhPt3azwA2l28F4gfs4K/NjDzZ+d0evt82TEx+g3uf5ipcFGtmnTnl5VTXig/zD+g1J0/QEYtMepXss4rguYzmMCOcXcbyv9fRZ2G/iL7lLcpKsoiP4pDGjCUiAetHeC85TJdHogwFH4ZjlRUE/DlXcNkLXQUfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6egntmR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC62BC4CEE7;
	Tue, 14 Oct 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446965;
	bh=cUiMgQHo5DRosN34vFJaO9nzFj79sa2IHI2T1P3ebH8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=g6egntmRie8bsou+s7+7DUdnWyZQ+/hdbrP+Ie/4lzSdUVe1os3j50g3SodIStu2/
	 4lrtFwuhIpRsHqFIpUGAxZdEIoDBtc6MBmSElq/wtcMtS12U/wpjguneyE7wTxR5uv
	 VQT/BmnQxAVYPf3a3/BYEqka5LDBFODjUHL8XEkIpHdYarYgm+Ja/Y42vKnzd4Z6Vm
	 swmsm3uubAiFdxF1vEDyduRV4LJkjmufrhJd7VSTXKkhLrdEMHriR8MRaHualCJAey
	 mK+9oTPz4dtYnLgf6F02pQ6bc4eY+j9sR7tyd1bC2ABMgslByUDbNQe7fkB1KfdiVM
	 EuBg/zFlyRajQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94326CCD18D;
	Tue, 14 Oct 2025 13:02:45 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v12 00/18] media: rockchip: add a driver for the rockchip
 camera interface
Date: Tue, 14 Oct 2025 15:01:46 +0200
Message-Id: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALtJ7mgC/33S207DMAwG4FeZek0m2zk04Yr3QFw4JxaxrVM7F
 RDau5NugjHR9TKO/P2OnK9mSH1JQ/O4+mr6NJahdPt6QHpYNWHD+9ckSqyFhoAUEIHo36Q2Vow
 l8EF452V2jnRWqqktnockfM/7sJmadmkTixhRTneHPuXycc56fqnnTRmOXf95jh5xql5DRiOsO
 HaHEm7zRhQgyFhgzGwU+Kf3bpsvY6/36dhM8Ei/GBK29zGqmMeorM0hQJSzmPzBNBCY+5ismHE
 RM7qkg4JZTP3B0N3HVMWSA2MAOEk/j+krJpcm0xXLNU+TlirLMIuZ2wXcCqYKkbLOPiXUGp9Ct
 92y73peh253AdoloK1Aqy3m6AxLyXOAXQJsBVx0wQflNak4B7glwFWAQ8K6m6DY0hyAsCQgTBu
 maLn1BM6rWQIXien7cobEkbVK+t8zTqfTN0my5VyTAwAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760446963; l=11890;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=cUiMgQHo5DRosN34vFJaO9nzFj79sa2IHI2T1P3ebH8=;
 b=kGfacag1iCBFWKlYXYtGv11NOT1Ne5zMlbVa3WXcY0ja2CQCrzAJu66rsnHRQPfjiEHHvaa4r
 K7X3LvjVacqBPu2WfqEa6T5g09q+Eazmb2uW50YzzwRtUIyCzEwBexq
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,

This series introduces support for the Rockchip Camera Interface (CIF),
which is featured in many Rockchip SoCs in different variations.
For example, the PX30 Video Input Processor (VIP) is able to receive
video data via the Digital Video Port (DVP, a parallel data interface)
and transfer it into system memory using a double-buffering mechanism
called ping-pong mode.
The RK3568 Video Capture (VICAP) unit, on the other hand, features a
DVP and a MIPI CSI-2 receiver that can receive video data independently
(both using the ping-pong scheme).
The different variants may have additional features, such as scaling
and/or cropping.
Finally, the RK3588 VICAP unit constitutes an essential piece of the
camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
units, and a data path multiplexer (to scaler units, to ISP, ...).

The v12 of the series adds a media controller centric V4L2 device driver
for the Rockchip CIF with
 - support for the PX30 VIP (not tested, though, due to the lack of HW)
 - support for the RK3568 VICAP, including
    - capturing frames from the DVP
    - capturing frames from the MIPI CSI-2 receiver
 - abstraction for the ping-pong scheme to allow for future extensions
 - abstraction for the INTERFACE and CROP parts to allow for future
   extensions
 - initial support for different virtual channels (not tested, though,
   due to the lack of HW)
and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.

The RK3568 DVP has been tested by Gerald on a WolfVision PF5 hardware,
the RK3568 MIPI CSI-2 have been tested by me on a Radxa ROCK 3A + Radxa
Camera 8M.

The driver can be readily extended to provide support for the RK3588
VICAP variant. In order to keep things simple, however, this extension
shall be submitted separately.

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

Michael Riesch (16):
      Documentation: admin-guide: media: add rockchip camera interface
      media: dt-bindings: video-interfaces: add defines for sampling modes
      media: dt-bindings: add rockchip rk3568 vicap
      media: dt-bindings: add rockchip rk3568 mipi csi-2 receiver
      media: rockchip: add driver for the rockchip mipi csi-2 receiver
      media: rockchip: add driver for the rockchip camera interface
      media: rockchip: rkcif: add abstraction for interface and crop blocks
      media: rockchip: rkcif: add abstraction for dma blocks
      media: rockchip: rkcif: add support for px30 vip dvp capture
      media: rockchip: rkcif: add support for rk3568 vicap dvp capture
      media: rockchip: rkcif: add support for rk3568 vicap mipi capture
      arm64: defconfig: enable rockchip camera interface and mipi csi-2 receiver
      arm64: dts: rockchip: add vicap node to rk356x
      arm64: dts: rockchip: add mipi csi-2 receiver node to rk356x
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander
      arm64: dts: rockchip: add overlay for radxa camera 8m

 .../admin-guide/media/rkcif-rk3568-vicap.dot       |  21 +
 Documentation/admin-guide/media/rkcif.rst          |  83 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 .../bindings/media/rockchip,px30-vip.yaml          | 124 +++
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 ++++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 172 ++++
 MAINTAINERS                                        |  17 +
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 .../dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso   |  90 +++
 .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  78 ++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/media/platform/rockchip/Kconfig            |   2 +
 drivers/media/platform/rockchip/Makefile           |   2 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
 drivers/media/platform/rockchip/rkcif/Makefile     |   8 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 865 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  25 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 777 ++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  23 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 250 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 303 ++++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 426 ++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  31 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 153 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 638 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  32 +
 drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
 drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
 drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 742 ++++++++++++++++++
 include/dt-bindings/media/video-interfaces.h       |   4 +
 32 files changed, 5089 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20240220-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



