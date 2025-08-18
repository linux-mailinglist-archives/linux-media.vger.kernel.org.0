Return-Path: <linux-media+bounces-40197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE3B2B4EA
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 01:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9135518A00D8
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 23:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAF827EFFA;
	Mon, 18 Aug 2025 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKgXO+ky"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7841E379B;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560387; cv=none; b=p5Y9a4cZDjJG3dBnRzgB9DJZVihqVUH1MhdvMZ+20GuQ2NA+PvjIaxWYw7J1zGTLTZmYK9gwMWTya/ogJfHPy4/Q/NXn/5c3QuJ69mDbmW1hzH20aQL08E6kkTPHxal3OQLwFGEty4TzblMfwXh6Fuv6TzpDKIiCuumNN9dpq14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560387; c=relaxed/simple;
	bh=Po1Yhu52yR31ZqUXQ70Ab0JWVV9vtPfcBxzndIg8cfQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T1BNut2o3zmpeLhMoK08m64/7d1htUNUqz/WGgytbqAIcDbJpI/+EZRLFroUrgD42Uf0bDhIeuwQiCi78YZCFNAahL6NNX608k0kbXgLD5gwyvNk65P5+Q2YJJuHVb3OeWIWwI4bEAeDC61QcbwtsC0i7bAPc2tzCg80wbZ6HgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKgXO+ky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A968C4CEEB;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755560387;
	bh=Po1Yhu52yR31ZqUXQ70Ab0JWVV9vtPfcBxzndIg8cfQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OKgXO+kyC/95f6cSczLRCuw+gKs24abKYuDMMLnn4cew+HnLnoPc+ssvQvJ/TJlTj
	 9MZVJBai4IeUhRbYZl+sAwQNnoPI4FvhVAhj2NFp391diPZSrz1aYuzjZQkAF0bon1
	 0SlaCnzQT1g/0AXezI7aWvaqTgMpGeZK6ljE16rmiV92jf7bWKseCrrp1CCJd1u1FM
	 UoGSqAIuWVd9GlUs4lDKNTgd8XM2Wq3RqxkbnBr76RESDtmKAsDTXbkJ1+kE5ycre2
	 J1IDtGcQZBLkDwLAcXxVKczvHH3tE0zYWOch76fqwulryqdtEH/3NFfLmVXKLiZ1VG
	 lQnrVA/6ZVU+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77E5CA0EEB;
	Mon, 18 Aug 2025 23:39:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v10 00/13] media: rockchip: add a driver for the rockchip
 camera interface
Date: Tue, 19 Aug 2025 01:25:52 +0200
Message-Id: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIC2o2gC/33RS07DMBAG4KtUXuPK41dsVr0HYuEnsWjjyKkMq
 OrdcVpBKUqznBnN9480JzSFksKEnjcnVEJNU8pDK4A8bZDrzfAWcPKtgSihnFBKcHlnQipckzM
 jttqyqDUVkXPUVqyZArbFDK6flw6h9wlXYPNsLCGmz0vWy2ur+zQdc/m6RFeYu7eQKrHCxzwmd
 59XARNMpSIGopGc2N1H3sfr2dshHNEMV/qLAYXuMUYbZsFzpaJzxLNFjP1gglAiH2OsYVJ7iKC
 DcJwsYvwPBvoxxhsWNJGSEBOYXcbEDWNrl4mGxZYnqGA8MreIyfsH3AuyCZ5GEW0IIATsXN7vj
 c3FbF0+XIFuDega0AkF0WtpGDNLgFoDVAO01846bgXlfgnQa4BugHEB2m8cN4r+B87n8zefXdR
 mDQMAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755559554; l=10893;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=Po1Yhu52yR31ZqUXQ70Ab0JWVV9vtPfcBxzndIg8cfQ=;
 b=ZBiZAMoya15HUHwvP0l2Eoz5AnBC32p7xAGT+on+pWtw79p5wfIKmgapbAM+xsSpiHeIW0QCJ
 lgWHR6/FmsGDQ+Pjx3GPQZaOijg9+/FuFlRJPX20FDbiGv8YmS7kBvv
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

The v10 of the series adds a media controller centric V4L2 device driver
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

However, several features are not yet addressed, such as
 - support for the RK3588 variant (-> first success achieved, patches
   need some cleanup and shall be submitted separately)
 - support for the MUX/SCALE/TOISP block in the RK3588 VICAP (which
   provides the base for image processing on the RK3588)
 - support for the scaling unit in the PX30 (-> cannot do due to the
   lack of HW)
 - support for the interface to the Rockchip ISP in the RK3568
   (-> cannot do, latest information from Rockchip points out there
   IS NO HW CONNECTION BETWEEN VICAP AND ISP ON RK3568)

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

Michael Riesch (11):
      Documentation: admin-guide: media: add rockchip camera interface
      media: dt-bindings: video-interfaces: add defines for sampling modes
      media: dt-bindings: add rockchip rk3568 vicap
      media: dt-bindings: add rockchip rk3568 mipi csi-2 receiver
      media: rockchip: add a driver for the rockchip camera interface
      media: rockchip: add driver for mipi csi-2 receiver
      media: rockchip: rkcif: add support for mipi csi-2 capture
      arm64: defconfig: enable rockchip camera interface and mipi csi-2 receiver
      arm64: dts: rockchip: add vicap node to rk356x
      arm64: dts: rockchip: add mipi csi-2 receiver node to rk356x
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

 .../admin-guide/media/rkcif-rk3568-vicap.dot       |  21 +
 Documentation/admin-guide/media/rkcif.rst          |  83 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 .../bindings/media/rockchip,px30-vip.yaml          | 122 +++
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 ++++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 ++++
 MAINTAINERS                                        |  17 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  78 ++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/media/platform/rockchip/Kconfig            |   2 +
 drivers/media/platform/rockchip/Makefile           |   2 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
 drivers/media/platform/rockchip/rkcif/Makefile     |   7 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 864 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 777 ++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  22 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 249 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 302 +++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 425 ++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 154 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 637 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
 drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
 drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
 drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 741 ++++++++++++++++++
 include/dt-bindings/media/video-interfaces.h       |   4 +
 30 files changed, 4978 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20240220-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



