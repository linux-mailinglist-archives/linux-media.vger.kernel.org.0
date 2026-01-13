Return-Path: <linux-media+bounces-50612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E6D1B5AA
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6A38303D69B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5857D32E6B8;
	Tue, 13 Jan 2026 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s++d/Z+b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD05731DDA4;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338580; cv=none; b=eXUi8KsMHvwWEXO5cKhVGra5ZkLvnNLejjgQHeHbYMIQVQzc6vSZwcHyNYfvF4jgyCpS7wttVX6ZT6vXCC7+ZwMAv0FEc9Y5YmpF5nAW5lXUD/b0QZEIQIL6C2lRZE5tHSs5LPnqf62LJaJHm/5L8VvpZ1eZkodgFqQQybDkUL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338580; c=relaxed/simple;
	bh=WCnY/lj3fzjvIsFQZM824I87yHl/GftCvl+s4jhP2qM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dLBEBKA4tkvVZLOgdK2E2FIkVDEweOABryXW3UagpjRo6gDLIn4WQ+udmvUn0P8cuTYCtm7+MDUPgx7wAfVxcE9K2Ay/CQVXvJG5D8i0r6ugIIsWwD0a7KLj1m3KYtZ5RE48Bv9Al1Zw+YZP+Ippv2V2gsZ+EN1kOXf/kaAhaDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s++d/Z+b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44C15C116C6;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768338580;
	bh=WCnY/lj3fzjvIsFQZM824I87yHl/GftCvl+s4jhP2qM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s++d/Z+bEk6fzJBnFcofzRHEws4wiB54gfrZfdYmDcMCQBJWHfV02dWrj7OWH4/Cs
	 RwPVFNMKeMjbAmXHBEmwkK3REplE4496kItVQJZdYAi5+XudabybpH/vV2APUdf8/B
	 hQBfHRNEIxI7QlnOglhrgBCfpv+IkuGZQ3SBKRlWUq2+itWr5hMaRsKauKdfhRzlev
	 F33nhlU3jfAVtFcQoFYnRcX3tiX7yWb7H3Zd69BK+6IBWHhsGRvpLXD7oxdqs0g1im
	 0nzURsN8Uhpy7UHqlZnM8TLgL0vkEtr/5F942w92c74yhVtYosEkLW3NZqip8DhYCp
	 xz1OCh0+QUDUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CC8D30CC4;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v3 0/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Date: Tue, 13 Jan 2026 22:09:26 +0100
Message-Id: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIa0ZmkC/42NQQ7CIBBFr9KwFgMUtXXlPYwLmE7txArNoETT9
 O6iSze6fD/5780iIRMmsa9mwZgpUQwF6lUlYHDhjJK6wsIos9FaW8kRLjDQJK80kWQEpIwslXe
 9sRZaaFCUs3cJpWcXYCj3cB/HMk6MPT0+teOp8EDpFvn5iWf9Xn92spZKdrpWzRYbrbruAHEcn
 Y/s1hCv4q3N5j+VKSr0rbd1vdv1YL9Vy7K8AAsmfIQgAQAA
To: Michael Riesch <michael.riesch@collabora.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768338578; l=2431;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=WCnY/lj3fzjvIsFQZM824I87yHl/GftCvl+s4jhP2qM=;
 b=9GXyZism98d3SmCPnycvQNmO2IPoOV7DU3RAw4adv0rP7MXMuxrgKEZXkw9elfePxd0vs7B0O
 4aMZme0FfhPBWnS6X+iRvRXmOkxlwt1Nn8ZIgxKMQau8ApvCRsNbLk5
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

Habidere,

This series adds support for the Rockchip MIPI CSI-2 Receiver that is
integrated into recent Rockchip SoCs, such as the RK3568 and the RK3588.

These changes have been discussed and reviewed thoroughly in roughly 10
iterations of the rkcif patch series (see [0] and predecessors). Thus,
they should be ready for inclusion in mainline.

However, as has been discussed in [0], it would be beneficial to add
support for the split mode (a feature of the Rockchip CSI-2 DPHY)
before integrating the MIPI CSI-2 Receiver into the respective SoC
device tree includes. We can readily add the DT binding and the driver
as I am positive they will not need to be changed when this feature is
introduced, but there are no patches in the series that introduce the
DT nodes.

This constitutes a small step towards mainline video capture and camera
support on the Rockchip RK3588.

Looking forward to your comments!

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[0] https://lore.kernel.org/r/20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com

---
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
      media: rockchip: add driver for the rockchip mipi csi-2 receiver
      arm64: defconfig: enable rockchip mipi csi-2 receiver

 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 ++++
 MAINTAINERS                                        |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
 drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
 drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 742 +++++++++++++++++++++
 8 files changed, 917 insertions(+)
---
base-commit: 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c
change-id: 20251114-rockchip-mipi-receiver-0baf244c9c8e

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



