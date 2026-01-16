Return-Path: <linux-media+bounces-50895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F635D31885
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F03E3048637
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4EA253958;
	Fri, 16 Jan 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfZ8UOrc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91613219301;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568678; cv=none; b=nWLjv8HnS+VgWKTMIAaEJeDYfYvXbx32HmMHKQ3aultN8xKcCQt3oY8nljc73UDYGzgEfXOSTE+bc7CdjKEiwUFO7blQprGVWWFRpNc42XIojf8tQ6hoUrmrA7xLn2rb++AijoWFkutixFXCY/PkJiCB17j0EYw1zMXqxaty2vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568678; c=relaxed/simple;
	bh=s2u8m8fuVkjMI3E13P6pDYyB9Q5oNtLOKw3ocBqevlc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U2/KKRI1378G6WULAlgLetY7GschpKoyMjXso+HOtk1nh7uA8tUaYa6KeCOPJlfdUW2SNcZr5G9EygIiGHkUNH0F8+oeio8VGbscL0dcncbLjelXHSv8aDv8Y3gbiSR7ozJoRduJne6nLURRnfzP/SVcft5v9F8U8mZdffsU2Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfZ8UOrc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F50DC19421;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568678;
	bh=s2u8m8fuVkjMI3E13P6pDYyB9Q5oNtLOKw3ocBqevlc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NfZ8UOrcoQMjryn6xeXIyXn8rksoIiGG0wzJtWtI2orPUvskYsDaOsbNsI24L3hhr
	 Qhkqh+To59sU4DJy+V4dW3OU+J6Ho1amAcFd1YBSJ77v8IAZId/ZYAbH1+zXF9r5pE
	 uYG+O2xaYkBMeYMlcZvLsNV5tCWiPPHhx2dIUPUaiY5c5mhbQqZz7QlCc2l9Fda6rm
	 0MNLLSxcabSZuwwwBb5L5p/2tWdQZtQRL3kEAiJBhncXjnsoz69A9jeF2in6++TkmL
	 LRSYg7G/2kGVAafcbuMZGF43mkOvNF//VDe1CNrPUzwwHweMFWnlDrSm7ehz3+RLng
	 Jx+oCncl1WUZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43603D4A5E8;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v5 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Fri, 16 Jan 2026 14:02:45 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPU2amkC/43Qz2rDMAwG8FcpPs/D/9IkPe09yg62LC9iaRzs1
 WyUvPvUHkdhOX4C/T6hm6hYCKs4HW6iYKNKeeHQvRwETH75QEmRszDKdFprJ0uGT5holRdaSRY
 EpIZFquCTcQ5GGFDwcvAVZSh+gYnXl+s883AtmOj70XZ+5zxR/crl51He9H36b0/TUsmorRqOO
 GgV4xvkefYhF/8K+SLubDP7KMMUhjE4a/s+gXtG2X2UZUrzRdb7Ptmxe0a5fZRjyvMbjwkhqs7
 8pbZt+wXdkrLstgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768568676; l=3068;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=s2u8m8fuVkjMI3E13P6pDYyB9Q5oNtLOKw3ocBqevlc=;
 b=Qob6j5XB8O1JAgrJjNnzezkslqHY1BeUYjMVSnGwA+hcJVIGV9nGSj5c09h0yHdjgC1xGDKyw
 L+cmpk6ubMjBPRg9/aKoUqjNsvOMcWSWufl0mhImhm2EM+SvEfjD+rg
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
 .../platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c  | 735 +++++++++++++++++++++
 8 files changed, 905 insertions(+)
---
base-commit: dc6c52205bdaddf1dc259497a958402b35c01fe2
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



