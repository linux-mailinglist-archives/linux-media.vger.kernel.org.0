Return-Path: <linux-media+bounces-50809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BAAD27A84
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 19:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2922230B191F
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 18:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1D02D663D;
	Thu, 15 Jan 2026 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLXb5/tc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFE92D3733;
	Thu, 15 Jan 2026 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768501577; cv=none; b=V6WjaVBg6gsMWIZ7CoC02PNULXY9BZgRVmwYz+DStb30yMYCUoUghhb8IMnAoB+kwel/I5bmTrKgPrMZoCf60TxON+O9zq3Zfu3eQRkL4irCwLHXxjGu+VwPw6pesGKC/mCR9jYJ9S27DFyrBVqr8+1kqZQHznHJXwNCdw3ux/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768501577; c=relaxed/simple;
	bh=TMv/2GMeJt7lNR4P7wDPkUHC6oexE2lmn2DPQBekD/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L7Hs9qtQ0f/8DVOntoMIt68UWYEP0k+8DcxNdCQfT/WDCzK9EtBnvhUaRVTa94jfNPRe3r1SDEZsTLR4zaYKEWtDyl1u9u8Wxg2luoviisPyuSvDcmIKt7xKEjmjOy1wrVgtfK1RLYNonI/qg7l6yzJDqKpuXut1AB9oJEaMpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLXb5/tc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF741C116D0;
	Thu, 15 Jan 2026 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768501576;
	bh=TMv/2GMeJt7lNR4P7wDPkUHC6oexE2lmn2DPQBekD/o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rLXb5/tcQilVNU6so/oL38Xg9sfM/z6vztpPineB35xipUc53EDFlGYR5I+O+wyx1
	 M1k0/nP+aDppwLAu6UsjgRtnSegz4+zqRmZjFFcDhQqrMMEHYm4NeuYF2SS7yat7VL
	 lWj4vhL92XL+XdAu0PqDIIJqoSLKtKSTky7eiOWDaFcrmXUOYAJHcfSi3VYnWBdsYD
	 4LOUOIMGgQTF5xpxGP745cObWqzIF3sVzG02CCoV7HwhpcUT6avDLqge055960m3Rj
	 CiaqIhhoDhoVtzLdv5QIDN9M67lQtF/hhBzLj2c4H9YGdUlwbf3MToRgNWeGPGG+RU
	 tpcpU5awg4Y2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC137D46604;
	Thu, 15 Jan 2026 18:26:16 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v4 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Thu, 15 Jan 2026 19:26:06 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD4xaWkC/43OTW7CMBAF4Ksgr+vKf5CEVe+BurAnEzJqiKNxs
 YpQ7s7AskKC5XvSfG+uqiATFrXfXBVjpUJ5lhA+NgrGOB9RUy9ZOeO21tqgOcMPjLToEy2kGQG
 pImuT4uBCgA5aVHKcYkGdOM4wyvl8niYpF8aB/h5rh2/JI5XfzJfHeLX39uVOtdro3nrT7rC1p
 u+/IE9TTJnjJ+STurPVvUc5oTB1KXjfNAOEZ5R/j/JCWfnIx9gMvtv+p9Z1vQF9hzI1awEAAA=
 =
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
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768501575; l=2749;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=TMv/2GMeJt7lNR4P7wDPkUHC6oexE2lmn2DPQBekD/o=;
 b=wmch28e0Zrxj/on33s1llwpel66Pa1hYRFRrdet1fz0xaiL1YM4wVrkV7w3GZKt9oDvXKj07L
 T6ucjWHAyFDBz2VJbtSpCGMbYTusQp8JPXL2264+4aAogz+OIZq9FE5
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
 .../platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c  | 735 +++++++++++++++++++++
 8 files changed, 905 insertions(+)
---
base-commit: dc6c52205bdaddf1dc259497a958402b35c01fe2
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



