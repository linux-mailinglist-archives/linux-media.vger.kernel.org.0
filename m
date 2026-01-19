Return-Path: <linux-media+bounces-51040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15111D3A597
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21CE93112AD0
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780C33563F4;
	Mon, 19 Jan 2026 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9pIo1dz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82E230AAD6;
	Mon, 19 Jan 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819417; cv=none; b=k+RHMBTOfPEKrikTq6MbFCP6yS27nvL9JCYTEjy4wotWDquvv1i7208jkKMPt0PoP1hRxvjTfcAqGg27lq2S9Yn9diDQkbPP8stWGp6M5PTKJRbCl1vU03V9qL6scs78iGiXSZRD0HcvCsoZxHVA3mRDuooDuX4DG3Go8ENxGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819417; c=relaxed/simple;
	bh=fzNshCl/IElhoDVxXDq8bpq8eyZl50ZRx9miKtubih4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pWEGj7OVKRmTm0HP6uEytM+qU8LfS4F+09OrM55yEnsyX4Xi4dL21sCweD0iNdvUUmfHbpYaLH/V4cjo+4oTKP9sBaUczRt046RJ5Jw+KRn7X+mLrkTjdXeK1zvmsEIlZ6bduu0GNH06/xW0LRdGbgbwIIH2NrfHlZm5ycwe5/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9pIo1dz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78E03C116C6;
	Mon, 19 Jan 2026 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768819417;
	bh=fzNshCl/IElhoDVxXDq8bpq8eyZl50ZRx9miKtubih4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=W9pIo1dzAwZFNOdM9EhAAjrK4RyemitZbif9hwlUTRC0T1K0bM24d8JU+afwf2po2
	 qF5ik+e7ON7NK+undHW/yF9fQD2Wm073zKH21G30jCToDtI5PXJWZLlrpih/CJ4GbR
	 GWTGvZqY6iIuJMB5e2MNWZtU2Qg853daJ3iZdd6LBA6MT0nOjZFFMdxgqxMZIlYUbp
	 X3DoiTCH6uGP5kAduG8e872SWvsnXBjiXNsgF9SbW11CidgG2CucUEMQrzrQ3NOmIH
	 iXBY1s7IMF6qny2wtCjaLU65zSc7lyxd3/PtXbh1ZR2eZMiiPURxKVjQtW+npqJ1wZ
	 4INZp8zgxNxvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6388FCA5FF6;
	Mon, 19 Jan 2026 10:43:37 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v7 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Mon, 19 Jan 2026 11:43:34 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v7-0-42ff419f9b51@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYKbmkC/43QTU7EMAwF4KuMsiYo/2lnxT0QC8d1aESnqVKoQ
 KO5O57ZUokunyV/z/JVrNQKreJ8uopGW1lLnTnEp5PAEeZ3kmXgLIwyXmvtZKv4gWNZ5KUsRTZ
 CKhs1qRJk4xz22JHg5QQrydRgxpHX569p4uHSKJfvR9vrG+exrJ+1/TzKN32f/tuzaankoK3qA
 nVaDcML1mmCVBs8Y72IO7uZY5RhilKfnLUxZnR7lD1GWaY0X2QBYra936PcMcoxBfzGkAkH5c0
 e5Y9RninnAbSOWfcK9qhwjApMpYgUKHTJ5j/U7Xb7BfRwe49MAgAA
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768819415; l=3473;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=fzNshCl/IElhoDVxXDq8bpq8eyZl50ZRx9miKtubih4=;
 b=/h4J5W6AhmYcf3MKRvPQx8UtpfEDalNhD5tZ3xREcJw0YXNXhX6sH9F9TmbDbhgTNZv/ADYk0
 XRJuG3ZgLxZCyXBIac6H8VeV0YRq8go6pTjEfns2VXEmZfg/yojwsgd
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,

This series adds support for the Rockchip MIPI CSI-2 Receiver that is
integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.

According to Rockchip, this core is NOT the Synopsys MIPI CSI-2 Host, but
it features a compatible register layout (thanks Chaoyi for the
clarification).

As pointed out by Frank, we should thus rename the driver and place it
under drivers/media/platform/synopsys to facilitate re-use of this code
for similar IP cores.

As has been discussed in [0], it would be beneficial to add support 
for the split mode (a feature of the Rockchip CSI-2 DPHY) before
integrating the MIPI CSI-2 Receiver into the respective SoC device tree
includes. However, we can readily add the DT binding and the driver
as I am positive they will not need to be changed significantly when this
feature is introduced.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

---
Changes in v7:
- fixed several cosmetic issues (Frank)
- Link to v6: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com

Changes in v6:
- renamed driver to dw-mipi-csi2rx (Sakari)
- fixed return value of v4l2_get_link_freq (this time, really) (Sakari)
- Link to v5: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com

Changes in v5:
- fixed indentation in struct platform_driver ... (Sakari)
- fixed return value in case v4l2_get_link_freq returns 0 (Sakari)
- switched from pm_runtime_put_sync() to pm_runtime_put() (Sakari)
- Link to v4: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com

Changes in v4:
- moved driver to drivers/media/platform/synopsys and renamed it (Frank)
- addresse review comments by Sakari
- Link to v3: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com

Changes in v3:
- rebased onto v6.19/recent media-committers/next
- Link to v2: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com

Changes in v2:
- dropped one R-b by Bryan, as there were two of them on the same patch
  (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com

---
Michael Riesch (3):
      media: dt-bindings: add rockchip mipi csi-2 receiver
      media: synopsys: add driver for the designware mipi csi-2 receiver
      arm64: defconfig: enable designware mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 ++++
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/synopsys/Kconfig            |   1 +
 drivers/media/platform/synopsys/Makefile           |   1 +
 .../media/platform/synopsys/dw-mipi-csi2/Kconfig   |  17 +
 .../media/platform/synopsys/dw-mipi-csi2/Makefile  |   2 +
 .../synopsys/dw-mipi-csi2/dw-mipi-csi2rx.c         | 724 +++++++++++++++++++++
 8 files changed, 894 insertions(+)
---
base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



