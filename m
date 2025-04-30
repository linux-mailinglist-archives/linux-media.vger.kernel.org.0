Return-Path: <linux-media+bounces-31402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1A4AA4712
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 483F51BC0FF6
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1836723770D;
	Wed, 30 Apr 2025 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0ALInuV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34533221F03;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005265; cv=none; b=AZSxFsJ0cTZAat7YDp1iYSmJj5oFcsFkhno9rjjHlUR0R9YDtvZAfvjmrWRlw+WiKP/xonMwdUQpJWWbAT6rJ5K8DA3uWyznxrX7fwJr4AvlaznhEBGLGbM8+GUYEwWh2HcHmCsYvL386hrE+JICn5u78iKPh2qkhz9FgglMOqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005265; c=relaxed/simple;
	bh=glpH88pfvH7StBOd9nEA4l/NrucuG2u08NFOjlIyols=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TXewrhSxVSktVyv3BMwXWRQ1HP6ofJoX7gGyznLyxpyMbhfDJrngWGu/B3E8KwfQivjKTGZR4do2qkSeNvYyuiDpMc5GyWDvVgjGzMEenv/ZK7ysHcOnqdDyvfUcSUv0fCr9VHwaxgiyqsMui1wurk1EozXbeTMFRIR4LrT+IsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0ALInuV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A63B9C4CEE9;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746005264;
	bh=glpH88pfvH7StBOd9nEA4l/NrucuG2u08NFOjlIyols=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=T0ALInuVXID6BOiXeVU6ecThxdMK9xGfYhIl/pDlKbPl027xA0ZZwyf/T3cCXEbfl
	 GXaUDcp00SOOsBXBB92II+lbYqpCBRyhzJoR6Gbb26Hajdaaqw8cEjd6vqFJDQeezM
	 nBlP3tNID9Fd8pPxjeWVDXcSSC6FW8R78ne/1gAfNLuW3Aa3D9eAFjZk3E0tF3dnmK
	 GP+QrsIKG7NRLHXhNqtrmbLTmAleVCGj9wJwMt+AMpzu5MfzE426jqnmrbo5QCaa2A
	 as5okmiavTl+3b8q+5ZuSXd4Gbha4WUFt6RJUHfJEbjfsynSJP5qtrinGN7rX8mZcD
	 WnnLJASiwu7Qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DB3C369D9;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v6 00/13] media: rockchip: add a driver for the rockchip
 camera interface
Date: Wed, 30 Apr 2025 11:15:49 +0200
Message-Id: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEXqEWgC/33OTU7EMAwF4KuMsibIcX5oWHEPNIskdWgEtFVah
 UGj3p10EAyIluWz5e/5zCbKiSZ2fzizTCVNaehrMDcHFjrXPxFPbc0MARUgAs/PUpuGlxTcyL3
 1MlqLOirF6ol3E3GfXR+69eiVujbxIuS6GzPFdLpUPR5r7tI0D/n90lzEOr2WFMMbPg9jCr/7i
 uDA0TTgRHRGgX94G17i59e3Pc1shQt+YwLF3T6GFfOiVU0TQ4BWbmLyC9OAYPYxWTFjWxGFJR0
 UbGLqBybsPqYqRhaMAXAk/Tamr5j87zNdsVj7NGqpogx/sGVZPgCjDpKBCAIAAA==
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004564; l=8722;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=glpH88pfvH7StBOd9nEA4l/NrucuG2u08NFOjlIyols=;
 b=VqraQhLXJuQ7bwjc6OBrqVlq/Sn4+Etf5XcMdVjvIJy4FBVgN6nr3wPBt4W3WqzxbcU2abklV
 2x3ymr+pNt8Dke9efZkBFkmfsKh8oatCg45t2seUZQz9vvDRalWltnA
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

The v6 of the series adds a media controller centric V4L2 driver for
the Rockchip CIF with
 - support for the PX30 VIP (not tested, though, due to the lack of HW)
 - support for the RK3568 VICAP DVP
 - support for the RK3568 VICAP MIPI CSI-2 receiver
 - abstraction for the ping-pong scheme to allow for future extensions
 - abstraction for the INTERFACE and CROP parts to allow for future
   extensions
 - initial support for different virtual channels (not tested, though,
   due to the lack of HW)

The patches are functional and have been tested successfully on a
custom RK3568 board including the ITE Tech. IT6801 HDMI receiver and
the Sony IMX415 image sensor as subdevices attached to the DVP and the
MIPI CSI-2 receiver, respectively.
The IT6801 driver still needs some loving care but shall be submitted
as well at some point.

However, several features are not yet addressed, such as
 - support for the RK3588 variant (-> next item on my TODO)
 - support for the scaling unit in the PX30 (-> cannot do due to the
   lack of HW)
 - support for the interface to the Rockchip ISP in the RK3568
   (apparently, data receive via VICAP DVP and the VICAP MIPI CSI-2
   receiver can be processed by the RK3568 ISP)
 - support for the MUX/SCALE/TOISP block in the RK3588 VICAP (which
   provides the base for image processing on the RK3588)

Looking forward to your comments!

To: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
      media: dt-bindings: add rockchip rk3568 mipi csi receiver
      media: rockchip: add a driver for the rockchip camera interface
      media: rockchip: rkcif: add driver for mipi csi-2 receiver
      media: rockchip: rkcif: add support for mipi csi-2 capture
      arm64: defconfig: enable rockchip camera interface
      arm64: dts: rockchip: add vicap node to rk356x
      arm64: dts: rockchip: add mipi csi receiver node to rk356x
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

 .../admin-guide/media/rkcif-rk3568-vicap.dot       |  21 +
 Documentation/admin-guide/media/rkcif.rst          |  83 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
 .../bindings/media/rockchip,px30-vip.yaml          | 122 +++
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 113 +++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 ++++
 MAINTAINERS                                        |  11 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  75 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  15 +
 drivers/media/platform/rockchip/rkcif/Makefile     |  10 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 858 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 722 +++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  22 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 236 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 300 +++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 426 ++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
 .../rockchip/rkcif/rkcif-mipi-csi-receiver.c       | 731 ++++++++++++++++++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 154 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 622 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
 include/dt-bindings/media/video-interfaces.h       |   4 +
 28 files changed, 4816 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20240220-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



