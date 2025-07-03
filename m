Return-Path: <linux-media+bounces-36703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C3AF8007
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AACE11CA1A24
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 18:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE91B2F2C70;
	Thu,  3 Jul 2025 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UN1ALmzw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F05B25A2C0;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567593; cv=none; b=W+CKt5xEnZSAMMHuptLEhMytTrxG//+DQluBySzB+jxkfw8RLWoEMYnbsgC/b069G9A0IV8DWLooZ6qEXChmlOBlDp+sTMeBCyLjQ/ePdusKVgr69qeZrRSfurTasYTfgdMY8Di2fbKzdtQ5eDaK1qx6BnhKDw/EuXZeIOPB7lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567593; c=relaxed/simple;
	bh=GncYf9X2oA31TYye7DaUgi5Js+6gPq6VIcXaYOMi3r4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B1Nz+kQA5sa2xMEhXj+zZvHWSB/w4WLAqVIlve9anK8SpcSyUli3uHzgH2kbSaDkWGFpBqFAbpi/0Shqy1iRw3VrZ2rN0DwhoFxxlaAgvFvCfYmEyJc0PESAQJjfifCYPYzJGYzjEH8DgsvjR/Tby3iVIo1cChqbxYX2U5vNLCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UN1ALmzw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95AC2C4CEE3;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567592;
	bh=GncYf9X2oA31TYye7DaUgi5Js+6gPq6VIcXaYOMi3r4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UN1ALmzwZ6bsOhZ9sEsVrEJIN/1ItpN6otlmAD/U6NXSxvQ4jlsM6oMR8MyxF/3eb
	 EZZKwktdxyxbU7eZzqjYHMeuL0BHfAs7dCbQBcSz1kMy7O2rwjH8hI6cgSpyrOBMZd
	 zivpykfNtBPczC71dUotDtrE+1VFASdAQgpBzB9I2I/emuhYQ5wNMJGN+x3ay7zkQO
	 iJ7yCuqQOjrl5hctz3klm3HwYoMZEvmoN39gfsOyeyKFPYPA7OMQ8UyPOUPTDxTwpy
	 Frp3sdKuMEoX6H6SemNKT6K98xqkcZw9akMVgnm9HYSuEQWk6ZwjdtMCNizXAAz9XT
	 7O8a8RVJjJosQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E6DC83030;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH v2 0/4] media: imx8qxp: add parallel camera support
Date: Thu, 03 Jul 2025 14:33:05 -0400
Message-Id: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHMZmgC/1XMSwrCMBSF4a2UOzaShy2pI/chRcpNtHeQNCYSI
 iV7NxYnDv8D59sg2Ug2wbnbINpMiVbfQh46wGX2D8vItAbJZc8HOTByRT9LuAWcHTO6F1JpdVK
 ooF1CtHcqO3edWi+UXmt873oW3/UHKf4PZcE4s4hGaTOOkouLL+GIq4Op1voBiKkSVKYAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751567591; l=2021;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GncYf9X2oA31TYye7DaUgi5Js+6gPq6VIcXaYOMi3r4=;
 b=d8M8uU0lP7VvBvBdTdRf18XypZa/rv3UYjM9qkcsk0J/9tqRXx5HW9r63W5fCReeAhwYq/IO5
 DOCsPxh/PvKCNSAfqe07sTFdPwEEaZXYxDCVwdXWu4qk0kh0pwPszx9
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
Changes in v2:
- remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
  because pcif controller convert 2x8 to 1x16 to match isi's input
- rename comaptible string to fsl,imx8qxp-pcif
- See each patches's change log for detail
- Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com

---
Alice Yuan (2):
      dt-bindings: media: add i.MX parallel csi support
      media: nxp: add V4L2 subdev driver for parallel CSI

Frank Li (2):
      arm64: dts: imx8: add parallel CSI node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 109 +++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 .../dts/freescale/imx8qxp-mek-ov5640-parallel.dtso |  82 ++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 drivers/media/platform/nxp/Kconfig                 |  11 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-csi.c      | 944 +++++++++++++++++++++
 9 files changed, 1192 insertions(+)
---
base-commit: 93355cfe8aec9e47fc93fbc940f1bbeedd62e249
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>



