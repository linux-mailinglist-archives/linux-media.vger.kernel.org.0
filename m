Return-Path: <linux-media+bounces-37150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4337AFD5AB
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 19:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35D224A7CDC
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849952E763A;
	Tue,  8 Jul 2025 17:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/1V9Yvy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CE2E11A5;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751996967; cv=none; b=clCItwxGSBLuhp1RfLnpsv4XQWOU+ur7fT1+53oXYNXDXPNN7eS+jJDsDmecwbGisGLytmYQE0lYm8cVJH+lV5URxoco1f9iPnZMLkhqV+uVDVElK9flDMfLxGurQK0defDB/62SDj+MrZYvCzIAnEtyyZZid0QBoL0Vd7OtPwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751996967; c=relaxed/simple;
	bh=vyzr1Cp3VW/MJrLr8Vd9Cd8+qdk5yXeJaAIf72BHAvA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SlfwxOP8K19qeb+E8qp3/QiIVnbBoY92qn0SZNTOZ3BZq3s9UdIcOYYp4guqh/bskDiC1rTOTECYT6hys3FnCiUWGyfk+Bfr/waT0zQST31Rrha57BzhAqo6jOuz0eyDI+jQb76jrnjFOkXiSMVME+gVNI/q/NKWP8v+A3E2YGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/1V9Yvy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52F70C4CEED;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996967;
	bh=vyzr1Cp3VW/MJrLr8Vd9Cd8+qdk5yXeJaAIf72BHAvA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=f/1V9YvyC2EW+L6Mxc4M0MhXUJTqttVoenXw/ArXE3Kvo9+N7vEslLPkiq7XFTDBx
	 UWbULbPDC2z3qG0H3fLf7RrA5c1XU8s5JXA9X5AVAGyC3WI2mdktw0C7+PXLxoT2wr
	 6EyynAep1E0W0j3v7n/R9jdW02zVjfqYDsN1r7YrUMhjCSF8/V+rc9qxjVo+P9Unk0
	 8QmiB80uE5culX+3OKtXs5WcEApJVrLKeXfexl6UlR/HWD7WHoXckfaiwCwmwsGBEt
	 Ls9mkN9SHyCzwHaRwKPt8pS1YTIKkFkTd2iQFWSVR5oU8bOAAqPW8p2pZlK42CIo3m
	 8kayPyDrYoLcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D19FC8303C;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH v3 0/4] media: imx8qxp: add parallel camera support
Date: Tue, 08 Jul 2025 13:48:41 -0400
Message-Id: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpZbWgC/13MSw7CIBSF4a00jMUA11bqyH0YYyrc2jtoi2AIp
 unepY2Jj+E5yf9NLKAnDOxQTMxjpEDjkAdsCma6ZrghJ5s3U0KVolIVpz7pe3IXZ5qeW11KBRp
 2YIDlxHlsKa3c6Zx3R+Ex+ueqR7m8bwjELxQlFxyNsaBtXSshj0NyWzP2bGGi+qR7AX+pyqnU+
 oq6bEXVfqXzPL8A8gzFXuEAAAA=
X-Change-ID: 20250626-imx8qxp_pcam-d851238343c3
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751996966; l=2236;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vyzr1Cp3VW/MJrLr8Vd9Cd8+qdk5yXeJaAIf72BHAvA=;
 b=pLkoCOPxcG5H2BqKndFzFcZrU81lbL29lhmoCGOa3QjiD2Tf8/6ldvTR9I4iEwUT7ta5zz1ZQ
 ecsvl/wP0NWAkHAFqjn2k/TZRc4T3nFIINrcvgp3Okk/Elz+pyPwJk0
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

Add parallel camera support for i.MX8 chips.

The below patch to add new format support to test ov5640 sensor
   media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes

The bindings and driver for parallel CSI
   dt-bindings: media: add i.MX parallel csi support
   media: nxp: add V4L2 subdev driver for parallel CSI

DTS part need depend on previous MIPI CSI patches.
  https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/

  arm64: dts: imx8: add parellel csi nodes
  arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- replace CSI with CPI.
- detail change see each patch's change logs
- Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com

Changes in v2:
- remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
  because pcif controller convert 2x8 to 1x16 to match isi's input
- rename comaptible string to fsl,imx8qxp-pcif
- See each patches's change log for detail
- Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com

---
Alice Yuan (2):
      dt-bindings: media: add i.MX parallel CPI support
      media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

Frank Li (2):
      arm64: dts: imx8: add camera parallel interface (CPI) node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  82 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 drivers/media/platform/nxp/Kconfig                 |  11 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c      | 920 +++++++++++++++++++++
 9 files changed, 1185 insertions(+)
---
base-commit: 93355cfe8aec9e47fc93fbc940f1bbeedd62e249
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
--
Frank Li <Frank.Li@nxp.com>



